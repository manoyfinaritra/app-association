# Espace membre mobile

Le fichier `AEM.zip` contient le site PHP CodeIgniter. Les écrans mobiles reprennent ses données et ses usages de consultation. Ils utilisent le serveur Node existant et la même base MySQL ; ils ne nécessitent pas de migrer les tables.

## Où lire le code

- `fronted/src/app/(client)/` : les routes et la navigation.
- `fronted/src/components/Ecran*.js` : le contenu des listes.
- `ListeClient.jsx` : l'affichage commun, les erreurs et l'actualisation.
- `fronted/src/hooks/useListeClient.js` : les appels au serveur et les pages de 20 résultats.
- `backend_nodejs/espaceClient.js` : les requêtes SQL de l'espace membre.

Chaque écran reste explicite : un nom de ressource, ses filtres et les informations affichées dans une carte. Les noms de variables et les commentaires sont en français.

## Correspondance avec le site PHP

| Écran mobile | Référence PHP | Données |
| --- | --- | --- |
| Accueil | `UserController::accueil`, `PublicationModel` | Publications validées, auteur, date et trois prochains événements |
| Formations | `formation.php`, `FormationModel` | Thème, date, lieu, description, intervenant, prix par personne |
| Événements | `event.php`, `EventModel` | Thème, date, lieu et description |
| Documents | `documents.php`, `DocumentModel` | Nom, date et ouverture du fichier |
| Cotisations | `contribution.php`, `ContributionModel` | Versements du membre connecté et validation |
| Profil | `profile.php`, réponse de connexion Node | Coordonnées et informations personnelles disponibles |

Les cotisations sont accessibles depuis l'accueil et le profil pour conserver cinq onglets. Les listes proposent l'actualisation en tirant vers le bas et un bouton pour charger la page suivante. Les formations et événements ont un filtre « À venir » ; les documents ont une recherche par nom.

## Configuration et lancement

1. Conserver les identifiants MySQL et la clé PHP existants dans `backend_nodejs/.env`.
2. Ajouter `AEM_SITE_URL` dans ce fichier : l'adresse du site PHP qui héberge réellement les fichiers, par exemple `https://www.association-entraide-madagascar.mg/`. Sans cette valeur, les listes fonctionnent mais les documents ne peuvent pas être ouverts. Les fichiers ne sont pas copiés depuis le ZIP.
3. Si Node et Expo ne sont pas sur la même machine, définir `EXPO_PUBLIC_API_URL` dans `fronted/.env.local`. Les fichiers `.env.example` montrent les valeurs attendues.
4. Démarrer Node avec `cd backend_nodejs` puis `npm start`.
5. Démarrer Expo avec `cd fronted` puis `npx expo start` et se reconnecter.

La connexion fournit un jeton valable huit heures, conservé uniquement en mémoire. Le serveur le vérifie sur toutes les routes `/client/`. Après un redémarrage de Node ou de l'application, une reconnexion est nécessaire. La déconnexion révoque le jeton. Les cotisations sont filtrées par l'identifiant de la session serveur, jamais par un identifiant envoyé par l'écran.

## Périmètre

Cette adaptation couvre la consultation de l'espace membre et la modification de ses coordonnées. La création, la modification et la suppression administratives du site PHP ne sont pas exposées dans les onglets. Les pièces jointes des publications, les commentaires, les mentions « j'aime », les inscriptions aux formations et les paiements ne sont pas implémentés dans cette version mobile.

Les cotisations montrent les versements enregistrés, sans calculer les mois impayés. Une absence de versement ne vaut pas une absence de dette.

## Vérifications

Dans `fronted` : `npm run lint` et `npm run typecheck`. Le typecheck inclut maintenant aussi les fichiers `.jsx`.

À la racine : `node --test backend_nodejs/espaceClient.test.js`. Les huit tests vérifient les sessions, l'accès aux cotisations, les paramètres SQL, la pagination et les liens de documents. Ils utilisent une base simulée ; les essais sur appareil et la disponibilité des fichiers PHP doivent être vérifiés avec les serveurs démarrés.

Les cinq requêtes de listes ont également été exécutées en lecture seule sur la base locale. Le bundle web Expo a été exporté dans `/tmp/aem-web-export`. Aucune vérification sur téléphone n’a été effectuée.

## Profil inspiré d’un réseau social

Le profil affiche une bannière AEM (aucun champ de couverture n’existe en base), la photo du membre avec ses initiales en secours, son nom, sa fonction, sa date d’adhésion, son pays, sa région et sa ville. Les sections « Publications » et « À propos » présentent ses publications (avec leur statut), ses coordonnées et les informations de naissance disponibles.

`GET /client/profil` charge les données actuelles depuis XAMPP. Les statistiques comptent ses publications, ses inscriptions validées aux formations, ses présences et la somme des cotisations validées. Les noms des champs ont été vérifiés dans les tables locales. Les pièces d’identité et mots de passe ne sont pas renvoyés.

`POST /client/profil` permet de modifier le nom, le prénom, le téléphone, l’email, la ville et la région. L’identifiant est toujours celui de la session, et les fonctions ou droits ne sont pas modifiables par ce formulaire. Aucun changement de schéma n’est nécessaire. Les tests de modification utilisent une base simulée et n’ont pas modifié de membre réel.

`node backend_nodejs/profilMembre.test.js` couvre les données du profil, les validations du formulaire et l’accès aux publications personnelles. Les fichiers `profilMembre.js`, `useProfil.js`, `FormulaireProfil.jsx` et `stylesProfil.js` séparent les requêtes SQL, le chargement, le formulaire et la présentation.
