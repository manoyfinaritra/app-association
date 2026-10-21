import { randomBytes } from 'node:crypto';
import { chargerProfil, modifierProfil } from './profilMembre.js';

// Les sessions restent en mémoire : un redémarrage demande une reconnexion.
const sessions = new Map();
const dureeSession = 8 * 60 * 60 * 1000;

export function creerSession(idUtilisateur) {
  const jeton = randomBytes(32).toString('hex');
  sessions.set(jeton, { idUtilisateur, expiration: Date.now() + dureeSession });
  return jeton;
}

const nettoyageSessions = setInterval(() => {
  for (const [jeton, session] of sessions) {
    if (session.expiration <= Date.now()) sessions.delete(jeton);
  }
}, 60 * 1000);
nettoyageSessions.unref();

// Les noms de tables et de colonnes viennent des modèles du projet PHP AEM.
const listes = {
  formations: {
    sql: `SELECT aem_id_formation AS id, aem_theme AS titre,
      aem_description AS description, aem_date AS date, aem_lieu AS lieu,
      aem_prix_par_personne AS prix, aem_intervenant_nom AS intervenant
      FROM aem_formation`,
    recherche: ['aem_theme', 'aem_lieu', 'aem_intervenant_nom'],
    date: 'aem_date',
    ordre: 'aem_date DESC, aem_id_formation DESC',
  },
  evenements: {
    sql: `SELECT aem_id_event AS id, aem_event_theme AS titre,
      aem_event_description AS description, aem_event_date AS date,
      aem_event_lieu AS lieu FROM aem_event`,
    recherche: ['aem_event_theme', 'aem_event_lieu'],
    date: 'aem_event_date',
    ordre: 'aem_event_date DESC, aem_id_event DESC',
  },
  documents: {
    sql: `SELECT aem_id_document AS id, aem_document_name AS titre,
      aem_document_path AS chemin, aem_date_publication AS date
      FROM aem_document`,
    recherche: ['aem_document_name'],
    ordre: 'aem_date_publication DESC, aem_id_document DESC',
  },
  cotisations: {
    sql: `SELECT aem_id_contribution AS id, aem_month AS mois,
      aem_year AS annee, aem_value AS montant, aem_valid AS valide,
      aem_date AS date FROM aem_contribution`,
    recherche: [],
    ordre: 'aem_year DESC, aem_month DESC, aem_id_contribution DESC',
  },
  publications: {
    sql: `SELECT p.aem_id_publication AS id, p.aem_description AS description,
      p.aem_date_pub AS date, p.aem_validation AS valide, u.aem_name AS nom, u.aem_first_name AS prenom
      FROM aem_publication p
      LEFT JOIN aem_user u ON u.aem_id_user = p.aem_id_user`,
    recherche: [],
    ordre: 'p.aem_date_pub DESC, p.aem_id_publication DESC',
  },
};

listes['mes-publications'] = listes.publications;

function adresseDocument(chemin) {
  // Le site PHP continue d'héberger les fichiers ; Node fournit les données.
  const site = process.env.AEM_SITE_URL;
  if (!site || !chemin) return null;
  try {
    const base = new URL(site.endsWith('/') ? site : site + '/');
    const relatif = String(chemin).replace(/^\/+/, '');
    if (!['http:', 'https:'].includes(base.protocol)) return null;
    const url = new URL(relatif, base);
    if (url.origin !== base.origin || !url.pathname.startsWith(base.pathname)) return null;
    return url.href;
  } catch {
    return null;
  }
}

export async function traiterEspaceClient(req, res, db, repondre) {
  const url = new URL(req.url, 'http://localhost');
  const jeton = req.headers.authorization?.replace(/^Bearer /, '');
  const session = sessions.get(jeton);

  if (!session || session.expiration <= Date.now()) {
    sessions.delete(jeton);
    repondre(res, 401, 'Votre session a expiré. Veuillez vous reconnecter.');
    return;
  }

  if (url.pathname === '/client/deconnexion' && req.method === 'POST') {
    sessions.delete(jeton);
    repondre(res, 200, 'Déconnexion réussie.');
    return;
  }

  if (url.pathname === '/client/profil') {
    if (!['GET', 'POST'].includes(req.method)) {
      res.setHeader('Allow', 'GET, POST, OPTIONS');
      repondre(res, 405, 'Utilisez GET ou POST.');
      return;
    }
    if (req.method === 'POST') {
      const erreur = await modifierProfil(req, db, session.idUtilisateur);
      if (erreur) {
        repondre(res, 400, erreur);
        return;
      }
    }
    const profil = await chargerProfil(db, session.idUtilisateur, adresseDocument);
    if (!profil) {
      repondre(res, 404, 'Ce compte n’existe plus.');
      return;
    }
    repondre(res, 200, req.method === 'POST' ? 'Profil mis à jour.' : 'Profil chargé.', profil);
    return;
  }

  const nomListe = url.pathname.slice('/client/'.length);
  const liste = listes[nomListe];
  if (!Object.hasOwn(listes, nomListe)) {
    repondre(res, 404, 'Cette adresse n’existe pas.');
    return;
  }
  if (req.method !== 'GET') {
    res.setHeader('Allow', 'GET, OPTIONS');
    repondre(res, 405, 'Utilisez la méthode GET.');
    return;
  }

  const page = Number(url.searchParams.get('page') || 1);
  if (!Number.isSafeInteger(page) || page < 1 || page > 100000) {
    repondre(res, 400, 'Numéro de page invalide.');
    return;
  }

  const conditions = [];
  const valeurs = [];
  if (nomListe === 'cotisations') {
    conditions.push('aem_id_user = ?');
    valeurs.push(session.idUtilisateur);
  }
  if (nomListe === 'publications') conditions.push('p.aem_validation = 1');
  if (nomListe === 'mes-publications') {
    conditions.push('p.aem_id_user = ?');
    valeurs.push(session.idUtilisateur);
  }

  const recherche = (url.searchParams.get('q') || '').trim().slice(0, 100);
  if (recherche && liste.recherche.length) {
    conditions.push('(' + liste.recherche.map(colonne => `${colonne} LIKE ?`).join(' OR ') + ')');
    valeurs.push(...liste.recherche.map(() => `%${recherche}%`));
  }
  const aVenir = url.searchParams.get('periode') === 'avenir' && liste.date;
  if (aVenir) {
    conditions.push(`${liste.date} >= ?`);
    const aujourdHui = new Intl.DateTimeFormat('en-CA', {
      timeZone: 'Indian/Antananarivo', year: 'numeric', month: '2-digit', day: '2-digit',
    }).format(new Date());
    valeurs.push(aujourdHui);
  }

  const filtre = conditions.length ? ' WHERE ' + conditions.join(' AND ') : '';
  const taillePage = 20;
  // Une ligne supplémentaire permet de savoir s'il reste une page.
  const ordre = aVenir ? `${liste.date} ASC, id ASC` : liste.ordre;
  const sql = `${liste.sql}${filtre} ORDER BY ${ordre}
    LIMIT ${taillePage + 1} OFFSET ${(page - 1) * taillePage}`;
  const [lignes] = await db.execute(sql, valeurs);
  const donnees = lignes.slice(0, taillePage).map(ligne => {
    if (nomListe !== 'documents') return ligne;
    const { chemin, ...document } = ligne;
    return { ...document, url: adresseDocument(chemin) };
  });
  repondre(res, 200, 'Données chargées.', {
    donnees, page, suite: lignes.length > taillePage,
  });
}
