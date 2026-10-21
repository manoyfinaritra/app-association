import test from 'node:test';
import assert from 'node:assert/strict';
import { creerSession, traiterEspaceClient } from './espaceClient.js';

async function demander(url, jeton, lignes = [], method = 'GET') {
  let resultat;
  let requeteSQL;
  const req = { url, method, headers: jeton ? { authorization: `Bearer ${jeton}` } : {} };
  const db = { execute: async (sql, valeurs) => {
    requeteSQL = { sql, valeurs };
    return [lignes];
  } };
  await traiterEspaceClient(req, { setHeader() {} }, db, (_res, statut, message, donnees) => {
    resultat = { statut, message, ...donnees };
  });
  return { resultat, requeteSQL };
}

test('les listes sont refusées sans session', async () => {
  const { resultat, requeteSQL } = await demander('/client/documents');
  assert.equal(resultat.statut, 401);
  assert.equal(requeteSQL, undefined);
});

test('les cotisations restent limitées au membre connecté', async () => {
  const jeton = creerSession(42);
  const { resultat, requeteSQL } = await demander('/client/cotisations?idUtilisateur=99', jeton);
  assert.equal(resultat.statut, 200);
  assert.match(requeteSQL.sql, /WHERE aem_id_user = \?/);
  assert.deepEqual(requeteSQL.valeurs, [42]);
});

test('la recherche utilise des paramètres SQL et les pages sont bornées', async () => {
  const jeton = creerSession(42);
  const recherche = "' OR 1=1 --";
  const { requeteSQL } = await demander('/client/formations?q=' + encodeURIComponent(recherche), jeton);
  assert.equal(requeteSQL.sql.includes(recherche), false);
  assert.equal(requeteSQL.valeurs[0], `%${recherche}%`);
  const { resultat } = await demander('/client/formations?page=-1', jeton);
  assert.equal(resultat.statut, 400);
});

test('une page contient vingt lignes et indique la suite', async () => {
  const lignes = Array.from({ length: 21 }, (_, id) => ({ id }));
  const { resultat, requeteSQL } = await demander('/client/evenements?page=2', creerSession(42), lignes);
  assert.equal(resultat.donnees.length, 20);
  assert.equal(resultat.suite, true);
  assert.match(requeteSQL.sql, /OFFSET 20/);
});

test('la déconnexion invalide le jeton', async () => {
  const jeton = creerSession(42);
  await demander('/client/deconnexion', jeton, [], 'POST');
  const { resultat } = await demander('/client/documents', jeton);
  assert.equal(resultat.statut, 401);
});

test('les documents restent sur le site AEM configuré', async () => {
  const ancienneAdresse = process.env.AEM_SITE_URL;
  process.env.AEM_SITE_URL = 'https://aem.example/site/';
  try {
    const lignes = [
      { id: 1, chemin: 'assets/documents/guide.pdf' },
      { id: 2, chemin: 'https://autre.example/document.pdf' },
      { id: 3, chemin: '../prive.pdf' },
    ];
    const { resultat } = await demander('/client/documents', creerSession(42), lignes);
    assert.equal(resultat.donnees[0].url, 'https://aem.example/site/assets/documents/guide.pdf');
    assert.equal(resultat.donnees[1].url, null);
    assert.equal(resultat.donnees[2].url, null);
    assert.equal('chemin' in resultat.donnees[0], false);
  } finally {
    if (ancienneAdresse === undefined) delete process.env.AEM_SITE_URL;
    else process.env.AEM_SITE_URL = ancienneAdresse;
  }
});

test('les routes inconnues et les écritures sont refusées', async () => {
  const jeton = creerSession(42);
  assert.equal((await demander('/client/__proto__', jeton)).resultat.statut, 404);
  assert.equal((await demander('/client/formations', jeton, [], 'POST')).resultat.statut, 405);
});

test('les activités à venir commencent par la date la plus proche', async () => {
  const { requeteSQL } = await demander('/client/evenements?periode=avenir', creerSession(42));
  assert.match(requeteSQL.sql, /aem_event_date >= \?/);
  assert.match(requeteSQL.sql, /ORDER BY aem_event_date ASC, id ASC/);
  assert.match(requeteSQL.valeurs[0], /^\d{4}-\d{2}-\d{2}$/);
});
