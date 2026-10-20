import test from 'node:test';
import assert from 'node:assert/strict';
import { chargerProfil, modifierProfil } from './profilMembre.js';
import { creerSession, traiterEspaceClient } from './espaceClient.js';

function demande(donnees) {
  return { setEncoding() {}, async *[Symbol.asyncIterator]() { yield JSON.stringify(donnees); } };
}
const formulaire = { nom: 'Martin', prenom: 'Jo', telephone: '0341234567', email: 'jo@example.com', ville: 'Tana', region: 'Analamanga' };

test('le profil charge uniquement le membre de la session et les champs utiles', async () => {
  const appels = [];
  const db = { execute: async (sql, valeurs) => {
    appels.push({ sql, valeurs });
    return appels.length === 1
      ? [[{ id: 42, photo: 'assets/images/photo.jpg' }]]
      : [[{ publications: 3, formations: 1, presences: 2, cotisations: 2000 }]];
  } };
  const profil = await chargerProfil(db, 42, chemin => 'https://aem.example/' + chemin);
  assert.deepEqual(appels[0].valeurs, [42]);
  assert.deepEqual(appels[1].valeurs, [42, 42, 42, 42, 42]);
  assert.equal(appels[0].sql.includes('aem_user_password'), false);
  assert.equal(appels[0].sql.includes('aem_identity_photo'), false);
  assert.equal(profil.utilisateur.photo, 'https://aem.example/assets/images/photo.jpg');
  assert.equal(profil.statistiques.publications, 3);
});

test('un compte supprimé ne produit pas de faux profil', async () => {
  assert.equal(await chargerProfil({ execute: async () => [[]] }, 42, x => x), null);
});

test('la modification ignore les identifiants et fonctions envoyés par le client', async () => {
  const appels = [];
  const db = { execute: async (sql, valeurs) => { appels.push({ sql, valeurs }); return [[]]; } };
  const erreur = await modifierProfil(demande({ ...formulaire, id: 99, fonction: 'admin' }), db, 42);
  assert.equal(erreur, null);
  const miseAJour = appels[1];
  assert.equal(miseAJour.valeurs.at(-1), 42);
  assert.equal(miseAJour.sql.includes('aem_id_function'), false);
  assert.match(miseAJour.sql, /WHERE aem_id_user = \?/);
});

test('un téléphone déjà utilisé bloque la modification, y compris au format international', async () => {
  let nombreAppels = 0;
  const db = { execute: async (_sql, valeurs) => {
    nombreAppels++;
    assert.ok(valeurs.includes('+261341234567'));
    return [[{ aem_id_user: 99 }]];
  } };
  assert.match(await modifierProfil(demande(formulaire), db, 42), /déjà utilisé/);
  assert.equal(nombreAppels, 1);
});

test('un email incorrect et un formulaire incomplet ne déclenchent aucune écriture', async () => {
  const db = { execute: async () => { assert.fail('Aucune requête attendue'); } };
  assert.match(await modifierProfil(demande({ ...formulaire, email: 'incorrect' }), db, 42), /email/);
  assert.match(await modifierProfil(demande({}), db, 42), /champs/);
});

test('les publications personnelles sont filtrées par la session', async () => {
  const jeton = creerSession(42);
  let parametres;
  const db = { execute: async (_sql, valeurs) => { parametres = valeurs; return [[]]; } };
  await traiterEspaceClient({ url: '/client/mes-publications?id=99', method: 'GET', headers: { authorization: 'Bearer ' + jeton } }, {}, db, () => {});
  assert.deepEqual(parametres, [42]);
});
