import { variantesTelephone } from './telephone.js';

// On sélectionne les champs utiles du membre connecté, sans mot de passe ni pièce d'identité.
export async function chargerProfil(db, idUtilisateur, adresseFichier) {
  const [membres] = await db.execute(`
    SELECT u.aem_id_user AS id, u.aem_name AS nom, u.aem_first_name AS prenom,
      u.aem_phone_number AS telephone, u.aem_user_email AS email,
      u.aem_profile_picture AS photo, u.aem_date_of_birth AS date_de_naissance,
      u.aem_place_of_birth AS lieu_de_naissance, u.aem_sex AS sexe,
      u.aem_state AS region, u.aem_city AS ville, u.aem_rollement_date AS date_adhesion,
      c.aem_country AS pays, f.aem_function_name AS fonction
    FROM aem_user u
    LEFT JOIN aem_country c ON c.aem_id_country = u.aem_country
    LEFT JOIN aem_function f ON f.aem_id_function = u.aem_id_function
    WHERE u.aem_id_user = ? LIMIT 1`, [idUtilisateur]);
  if (!membres.length) return null;

  const [statistiques] = await db.execute(`SELECT
    (SELECT COUNT(*) FROM aem_publication WHERE aem_id_user = ?) AS publications,
    (SELECT COUNT(*) FROM aem_formation_participant WHERE aem_id_user = ? AND aem_validation = 1) AS formations,
    (SELECT COUNT(*) FROM aem_attendance_list WHERE aem_id_user = ?) AS presences,
    (SELECT COALESCE(SUM(aem_value), 0) FROM aem_contribution WHERE aem_id_user = ? AND aem_valid = 1) AS cotisations,
    (SELECT aem_validation FROM aem_payment WHERE aem_id_user = ? ORDER BY aem_id_payment DESC LIMIT 1) AS adhesion_validee`,
  Array(5).fill(idUtilisateur));

  return {
    utilisateur: { ...membres[0], photo: adresseFichier(membres[0].photo) },
    statistiques: statistiques[0],
  };
}

export async function modifierProfil(req, db, idUtilisateur) {
  req.setEncoding('utf8');
  let corps = '';
  for await (const morceau of req) {
    corps += morceau;
    if (Buffer.byteLength(corps) > 10000) return 'Les informations envoyées sont trop volumineuses.';
  }
  let donnees;
  try { donnees = JSON.parse(corps); } catch { return 'Les informations envoyées sont invalides.'; }
  const champs = ['nom', 'prenom', 'telephone', 'email', 'ville', 'region'];
  if (!donnees || champs.some(champ => typeof donnees[champ] !== 'string')) {
    return 'Veuillez vérifier les champs du formulaire.';
  }
  const [nom, prenom, telephone, email, ville, region] = champs.map(champ => donnees[champ].trim());
  if (!nom || !prenom || nom.length > 50 || prenom.length > 50) return 'Le nom et le prénom sont requis (50 caractères maximum).';
  if (!/^\+?[0-9]{7,15}$/.test(telephone)) return 'Le téléphone doit contenir de 7 à 15 chiffres.';
  if (email && (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || email.length > 100)) return 'L’adresse email est invalide.';
  if (ville.length > 100 || region.length > 100) return 'La ville et la région ne doivent pas dépasser 100 caractères.';

  const numeros = variantesTelephone(telephone).map(numero => numero.replace(/\s+/g, ''));
  const emplacements = numeros.map(() => '?').join(', ');
  const [doublons] = await db.execute(`SELECT aem_id_user FROM aem_user
    WHERE REPLACE(aem_phone_number, ' ', '') IN (${emplacements})
    AND aem_id_user != ? LIMIT 1`, [...numeros, idUtilisateur]);
  if (doublons.length) return 'Ce numéro de téléphone est déjà utilisé par un autre membre.';

  await db.execute(`UPDATE aem_user SET aem_name = ?, aem_first_name = ?,
    aem_phone_number = ?, aem_user_email = ?, aem_city = ?, aem_state = ?
    WHERE aem_id_user = ?`, [nom, prenom, telephone, email || null, ville || null, region || null, idUtilisateur]);
  return null;
}
