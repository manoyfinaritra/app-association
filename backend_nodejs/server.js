import 'dotenv/config';
import http from 'node:http';
import {
  createHash,
  createCipheriv,
  timingSafeEqual,
} from 'node:crypto';

import mysql from 'mysql2/promise';
import bcrypt from 'bcryptjs';

// --------------------------------------------------
// 1. Configuration du serveur
// --------------------------------------------------

const HOST = process.env.HOST || '0.0.0.0';
const PORT = Number(process.env.PORT || 3000);
const clePHP = process.env.LEGACY_PASSWORD_KEY;

if (!clePHP) {
  throw new Error('Ajoute LEGACY_PASSWORD_KEY dans ton fichier .env.');
}

// Un pool gère les connexions à MySQL.
// Avec mysql2/promise, nous pouvons utiliser await.
const db = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'aem_database',
  waitForConnections: true,
  connectionLimit: 5,
});

const originesAutorisees = [
  'http://localhost:8081',
  'http://127.0.0.1:8081',
  'http://192.168.1.100:8081',
];

// --------------------------------------------------
// 2. Envoyer une réponse JSON à React Native
// --------------------------------------------------

function repondre(res, statut, message, informations = {}) {
  if (res.writableEnded || res.destroyed) {
    return;
  }

  res.writeHead(statut, {
    'Content-Type': 'application/json; charset=utf-8',
  });

  res.end(JSON.stringify({
    ...informations,
    success: statut >= 200 && statut < 300,
    message,
  }));
}

// --------------------------------------------------
// 3. Retrouver les formats possibles du téléphone
// --------------------------------------------------

function variantesTelephone(telephone) {
  const numero = telephone.replace(/\s+/g, '');

  // Exemple :
  // +261341234567 devient 0341234567.
  const international = numero.match(/^\+2610?(\d{8,9})$/);

  const numeroLocal = international
    ? '0' + international[1]
    : numero;

  const variantes = new Set([telephone, numero, numeroLocal]);
  const local = numeroLocal.match(/^0(\d{8,9})$/);

  if (local) {
    variantes.add('+261' + local[1]);
    variantes.add('+261 ' + local[1]);
  }

  return [...variantes];
}

// --------------------------------------------------
// 4. Reproduire le chiffrement des anciens comptes PHP
// --------------------------------------------------

// Cette fonction sert seulement à rester compatible
// avec le site existant. Elle ne modifie pas la base.
function chiffrerCommePHP(motDePasse) {
  const cle = createHash('sha256')
    .update(clePHP, 'utf8')
    .digest();

  const iv = Buffer.from(
    createHash('sha256')
      .update(clePHP, 'utf8')
      .digest('hex')
      .slice(0, 16),
    'utf8'
  );

  const chiffreur = createCipheriv('aes-256-cbc', cle, iv);

  const resultat = Buffer.concat([
    chiffreur.update(motDePasse, 'utf8'),
    chiffreur.final(),
  ]);

  // Le code PHP utilise deux encodages Base64.
  const premierBase64 = resultat.toString('base64');

  return Buffer.from(premierBase64, 'utf8').toString('base64');
}

// --------------------------------------------------
// 5. Vérifier le mot de passe
// --------------------------------------------------

async function verifierMotDePasse(motDePasse, valeurEnBase) {
  if (typeof valeurEnBase !== 'string' || !valeurEnBase) {
    return false;
  }

  const utiliseBcrypt = /^\$2[aby]\$/.test(valeurEnBase);

  if (utiliseBcrypt) {
    // bcrypt ne prend en charge que 72 octets maximum.
    if (Buffer.byteLength(motDePasse, 'utf8') > 72) {
      return false;
    }

    return bcrypt.compare(motDePasse, valeurEnBase);
  }

  // Sinon, on essaie le format AES utilisé par le site.
  const motDePasseChiffre = chiffrerCommePHP(motDePasse);

  const attendu = Buffer.from(motDePasseChiffre, 'utf8');
  const stocke = Buffer.from(valeurEnBase, 'utf8');

  if (attendu.length !== stocke.length) {
    return false;
  }

  return timingSafeEqual(attendu, stocke);
}

// --------------------------------------------------
// 6. Traiter une demande de connexion
// --------------------------------------------------

async function connecterUtilisateur(data, res) {
  const telephone = typeof data?.telephone === 'string'
    ? data.telephone.trim()
    : '';

  const motDePasse = data?.motDePasse;

  const telephoneValide = /^\+?[0-9]{7,15}$/.test(
    telephone.replace(/\s+/g, '')
  );

  if (
    !telephoneValide ||
    typeof motDePasse !== 'string' ||
    motDePasse.length === 0
  ) {
    repondre(
      res,
      400,
      'Veuillez saisir un téléphone valide et un mot de passe.'
    );
    return;
  }

  // On recherche le compte avec les différents formats du numéro.
  const numeros = variantesTelephone(telephone);
  const placeholders = numeros.map(() => '?').join(', ');

  const sqlUtilisateur = `
    SELECT
      aem_id_user,
      aem_phone_number,
      aem_user_email,
      aem_name,
      aem_first_name,
      aem_user_password,
      aem_password_is_temporary
    FROM aem_user
    WHERE aem_phone_number IN (${placeholders})
    LIMIT 2
  `;

  const [utilisateurs] = await db.execute(sqlUtilisateur, numeros);

  // Il doit y avoir exactement un compte correspondant.
  if (utilisateurs.length !== 1) {
    repondre(
      res,
      401,
      'Numéro de téléphone ou mot de passe incorrect.'
    );
    return;
  }

  const utilisateur = utilisateurs[0];

  const motDePasseValide = await verifierMotDePasse(
    motDePasse,
    utilisateur.aem_user_password
  );

  if (!motDePasseValide) {
    repondre(
      res,
      401,
      'Numéro de téléphone ou mot de passe incorrect.'
    );
    return;
  }

  // Comme dans le site PHP, on vérifie le dernier paiement.
  const sqlPaiement = `
    SELECT aem_validation
    FROM aem_payment
    WHERE aem_id_user = ?
    ORDER BY aem_id_payment DESC
    LIMIT 1
  `;

  const [paiements] = await db.execute(
    sqlPaiement,
    [utilisateur.aem_id_user]
  );

  const adhesionValidee =
    paiements.length > 0 &&
    Number(paiements[0].aem_validation) === 1;

  if (!adhesionValidee) {
    repondre(
      res,
      403,
      'Votre compte est en attente de validation par le bureau.'
    );
    return;
  }

  // Tout est correct : on renvoie seulement les informations utiles.
  repondre(res, 200, 'Connexion réussie !', {
    requires_password_change:
      Number(utilisateur.aem_password_is_temporary) === 1,

    utilisateur: {
      id: utilisateur.aem_id_user,
      telephone: utilisateur.aem_phone_number,
      email: utilisateur.aem_user_email,
      nom: utilisateur.aem_name,
      prenom: utilisateur.aem_first_name,
    },
  });
}

// --------------------------------------------------
// 7. Recevoir les requêtes HTTP
// --------------------------------------------------

const server = http.createServer((req, res) => {
  const origine = req.headers.origin;

  res.setHeader('Vary', 'Origin');

  // Ces règles concernent notamment Expo dans un navigateur.
  if (origine && !originesAutorisees.includes(origine)) {
    repondre(res, 403, 'Cette origine n’est pas autorisée.');
    return;
  }

  if (origine) {
    res.setHeader('Access-Control-Allow-Origin', origine);
    res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  }

  if (req.method === 'OPTIONS') {
    res.writeHead(204);
    res.end();
    return;
  }

  if (req.url !== '/connexion') {
    repondre(res, 404, 'Cette adresse n’existe pas.');
    return;
  }

  if (req.method !== 'POST') {
    res.setHeader('Allow', 'POST, OPTIONS');
    repondre(res, 405, 'Utilisez la méthode POST.');
    return;
  }

  // Les données peuvent arriver en plusieurs morceaux.
  let body = '';
  let taille = 0;

  req.setEncoding('utf8');

  req.on('data', (morceau) => {
    if (res.writableEnded || res.destroyed) {
      return;
    }

    taille += Buffer.byteLength(morceau, 'utf8');

    if (taille > 10000) {
      repondre(res, 413, 'Les données envoyées sont trop volumineuses.');
      return;
    }

    body += morceau;
  });

  req.on('end', async () => {
    if (res.writableEnded || res.destroyed) {
      return;
    }

    let data;

    try {
      data = JSON.parse(body);
    } catch {
      repondre(res, 400, 'Les données JSON sont invalides.');
      return;
    }

    try {
      await connecterUtilisateur(data, res);
    } catch (erreur) {
      console.error('Erreur de connexion :', erreur.code || erreur.name);
      repondre(res, 500, 'Erreur interne du serveur.');
    }
  });

  req.on('error', () => {
    repondre(res, 400, 'Impossible de lire la demande.');
  });
});

// --------------------------------------------------
// 8. Démarrer le serveur
// --------------------------------------------------

server.on('error', (erreur) => {
  console.error('Impossible de démarrer le serveur :', erreur.message);
  db.end().catch(() => {});
});

async function demarrer() {
  try {
    await db.query('SELECT 1');
    console.log('Connexion MySQL réussie.');

    server.listen(PORT, HOST, () => {
      console.log(`Serveur démarré sur http://${HOST}:${PORT}`);
    });
  } catch (erreur) {
    console.error('Connexion MySQL impossible :', erreur.code);
    await db.end();
  
  }
}

demarrer();