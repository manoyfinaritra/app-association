

export async function traiterPublications(
  req,
  res,
  db,
  repondre,
  session,
  url
) {
  const routeListe = url.pathname === '/client/publication';

  const routeLike = url.pathname.match(
    /^\/client\/publication\/(\d+)\/(like|unlike)$/
  );

  // Cette requête concerne une autre fonctionnalité.
  if (!routeListe && !routeLike) {
    return false;
  }

  const idUtilisateur = session.idUtilisateur;

  // Charger les publications et leurs likes

  if (routeListe) {
    if (req.method !== 'GET') {
      res.setHeader('Allow', 'GET');
      repondre(res, 405, 'Utilisez la méthode GET.');
      return true;
    }

    const sql = `
      SELECT
        p.aem_id_publication AS id,
        p.aem_description AS description,
        p.aem_date_pub AS date,
        p.aem_validation AS valide,
        u.aem_name AS nom,
        u.aem_first_name AS prenom,

        (
          SELECT COUNT(DISTINCT l.aem_id_user)
          FROM aem_likes l
          WHERE l.aem_id_publication = p.aem_id_publication
        ) AS nombre_likes,

        EXISTS (
          SELECT 1
          FROM aem_likes l
          WHERE l.aem_id_publication = p.aem_id_publication
            AND l.aem_id_user = ?
        ) AS deja_aime

      FROM aem_publication p

      LEFT JOIN aem_user u
        ON u.aem_id_user = p.aem_id_user

      WHERE p.aem_validation = 1

      ORDER BY p.aem_date_pub DESC, p.aem_id_publication DESC

      LIMIT 20
    `;

    const [publications] = await db.execute(sql, [idUtilisateur]);

    const donnees = publications.map((publication) => ({
      ...publication,
      nombre_likes: Number(publication.nombre_likes),
      deja_aime: Number(publication.deja_aime) === 1,
    }));

    repondre(res, 200, 'Publications chargées.', { donnees });

    return true;
  }

  // Ajouter ou retirer un like

  if (req.method !== 'POST') {
    res.setHeader('Allow', 'POST');
    repondre(res, 405, 'Utilisez la méthode POST.');
    return true;
  }

  const idPublication = Number(routeLike[1]);
  const aimer = routeLike[2] === 'like';

  if (!Number.isSafeInteger(idPublication) || idPublication < 1) {
    repondre(res, 400, 'Identifiant de publication invalide.');
    return true;
  }

  // Une transaction doit utiliser une seule connexion.
  const connexion = await db.getConnection();

  try {
    await connexion.beginTransaction();

    // Verrouiller la publication pendant cette opération.
    const [publications] = await connexion.execute(
      `
        SELECT aem_id_publication
        FROM aem_publication
        WHERE aem_id_publication = ?
          AND aem_validation = 1
        FOR UPDATE
      `,
      [idPublication]
    );

    if (publications.length === 0) {
      await connexion.rollback();

      repondre(res, 404, 'Cette publication est indisponible.');
      return true;
    }

    if (aimer) {
      // Vérifier si ce membre a déjà aimé cette publication.
      const [likes] = await connexion.execute(
        `
          SELECT aem_id_like
          FROM aem_likes
          WHERE aem_id_publication = ?
            AND aem_id_user = ?
          LIMIT 1
        `,
        [idPublication, idUtilisateur]
      );

      if (likes.length === 0) {
        await connexion.execute(
          `
            INSERT INTO aem_likes (
              aem_id_publication,
              aem_id_user
            )
            VALUES (?, ?)
          `,
          [idPublication, idUtilisateur]
        );
      }
    } else {
      // Retirer tous les éventuels doublons de ce membre.
      await connexion.execute(
        `
          DELETE FROM aem_likes
          WHERE aem_id_publication = ?
            AND aem_id_user = ?
        `,
        [idPublication, idUtilisateur]
      );
    }

    const [resultats] = await connexion.execute(
      `
        SELECT COUNT(DISTINCT aem_id_user) AS nombre_likes
        FROM aem_likes
        WHERE aem_id_publication = ?
      `,
      [idPublication]
    );

    await connexion.commit();

    repondre(
      res,
      200,
      aimer ? 'Like ajouté.' : 'Like retiré.',
      {
        id: idPublication,
        nombre_likes: Number(resultats[0].nombre_likes),
        deja_aime: aimer,
      }
    );

    return true;
  } catch (erreur) {
    await connexion.rollback();
    throw erreur;
  } finally {
    connexion.release();
  }
}