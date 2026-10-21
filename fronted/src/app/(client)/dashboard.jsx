import React, {
  useCallback,
  useEffect,
  useRef,
  useState,
} from 'react';

import {
  View,
  Text,
  Pressable,
  StyleSheet,
  ScrollView,
  ActivityIndicator,
  RefreshControl,
} from 'react-native';

import { Ionicons } from '@expo/vector-icons';
import api from '../../components/api/api';

function formaterDate(valeur) {
  if (!valeur) return '';

  const date = new Date(valeur);

  if (Number.isNaN(date.getTime())) return '';

  return date.toLocaleDateString('fr-FR', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
    timeZone: 'Indian/Antananarivo',
  });
}

function CartePublication({
  publication,
  onLike,
  enCours,
  desactive,
}) {
  const [developpee, setDeveloppee] = useState(false);

  const nom = String(publication.nom ?? '').trim();
  const prenom = String(publication.prenom ?? '').trim();

  const auteur =
    [prenom, nom].filter(Boolean).join(' ') || 'Association AEM';

  const initiales =
    [prenom, nom]
      .filter(Boolean)
      .map((texte) => texte.charAt(0))
      .join('')
      .toUpperCase() || 'A';

  const description = String(publication.description ?? '');

  const texteLong =
    description.length > 280 ||
    description.split('\n').length > 6;

  const texteAffiche =
    developpee || !texteLong
      ? description
      : description
          .split('\n')
          .slice(0, 6)
          .join('\n')
          .slice(0, 280)
          .trimEnd() + '…';

  const aime = publication.deja_aime === true;
  const nombreLikes = Number(publication.nombre_likes) || 0;

  return (
    <View style={styles.carte}>
      <View style={styles.enteteCarte}>
        <View style={styles.avatar}>
          <Text style={styles.initiales}>{initiales}</Text>
        </View>

        <View style={styles.identite}>
          <Text style={styles.auteur}>{auteur}</Text>

          <View style={styles.ligneDate}>
            <Ionicons
              name="time-outline"
              size={13}
              color="#8492A6"
            />

            <Text style={styles.date}>
              {formaterDate(publication.date)}
            </Text>
          </View>
        </View>

        <Ionicons
          name="chatbubble-ellipses-outline"
          size={22}
          color="#079DA6"
        />
      </View>

      <Text style={styles.description} selectable>
        {texteAffiche}
      </Text>

      {texteLong && (
        <Pressable
          accessibilityRole="button"
          accessibilityState={{ expanded: developpee }}
          onPress={() => setDeveloppee((valeur) => !valeur)}
          style={styles.boutonVoirPlus}
        >
          <Text style={styles.texteVoirPlus}>
            {developpee ? 'Voir moins' : 'Lire la suite'}
          </Text>

          <Ionicons
            name={developpee ? 'chevron-up' : 'chevron-down'}
            size={16}
            color="#079DA6"
          />
        </Pressable>
      )}

      <View style={styles.piedCarte}>
        <Pressable
          accessibilityRole="button"
          accessibilityLabel={
            aime ? 'Retirer mon like' : 'Aimer cette publication'
          }
          accessibilityState={{
            selected: aime,
            disabled: desactive,
            busy: enCours,
          }}
          disabled={desactive}
          onPress={() => onLike(publication)}
          style={[
            styles.boutonLike,
            aime && styles.boutonLikeActif,
            desactive && styles.boutonDesactive,
          ]}
        >
          {enCours ? (
            <ActivityIndicator size="small" color="#079DA6" />
          ) : (
            <Ionicons
              name={aime ? 'heart' : 'heart-outline'}
              size={21}
              color={aime ? '#E54870' : '#64748B'}
            />
          )}

          <Text
            style={[
              styles.texteLike,
              aime && styles.texteLikeActif,
            ]}
          >
            {aime ? 'Aimé' : "J’aime"}
          </Text>
        </Pressable>

        <Text style={styles.nombreLikes}>
          {nombreLikes} {nombreLikes > 1 ? 'likes' : 'like'}
        </Text>
      </View>
    </View>
  );
}

export default function Dashboard() {
  const [publications, setPublications] = useState([]);
  const [chargement, setChargement] = useState(true);
  const [actualisation, setActualisation] = useState(false);
  const [likeEnCours, setLikeEnCours] = useState(null);
  const [erreur, setErreur] = useState('');

  // Empêcher les doubles clics et les requêtes qui se chevauchent.
  const requeteEnCours = useRef(false);

  const chargerPublications = useCallback(async (rafraichir = false) => {
    if (requeteEnCours.current) return;

    requeteEnCours.current = true;
    setErreur('');

    if (rafraichir) {
      setActualisation(true);
    } else {
      setChargement(true);
    }

    try {
      const response = await api.get('/client/publication');
      const donnees = response.data?.donnees;

      if (!Array.isArray(donnees)) {
        throw new Error('Réponse du serveur invalide.');
      }

      setPublications(donnees);
    } catch (error) {
      const messageServeur = error.response?.data?.message;

      setErreur(
        typeof messageServeur === 'string'
          ? messageServeur
          : 'Impossible de charger les publications.'
      );
    } finally {
      requeteEnCours.current = false;
      setChargement(false);
      setActualisation(false);
    }
  }, []);

  useEffect(() => {
    chargerPublications();
  }, [chargerPublications]);

  async function modifierLike(publication) {
    if (requeteEnCours.current) return;

    requeteEnCours.current = true;
    setLikeEnCours(publication.id);
    setErreur('');

    // Envoyer l’action désirée au serveur.
    const action = publication.deja_aime ? 'unlike' : 'like';

    try {
      const response = await api.post(
        `/client/publication/${publication.id}/${action}`
      );

      const resultat = response.data;

      if (
        resultat?.success !== true ||
        typeof resultat.deja_aime !== 'boolean' ||
        !Number.isFinite(Number(resultat.nombre_likes))
      ) {
        throw new Error('Réponse du serveur invalide.');
      }

      // Mettre à jour uniquement la publication concernée.
      setPublications((anciennesPublications) =>
        anciennesPublications.map((element) =>
          element.id === publication.id
            ? {
                ...element,
                deja_aime: resultat.deja_aime,
                nombre_likes: Number(resultat.nombre_likes),
              }
            : element
        )
      );
    } catch (error) {
      const messageServeur = error.response?.data?.message;

      setErreur(
        typeof messageServeur === 'string'
          ? messageServeur
          : 'Impossible de modifier le like. Actualisez pour vérifier son état.'
      );
    } finally {
      requeteEnCours.current = false;
      setLikeEnCours(null);
    }
  }

  const occupe =
    chargement || actualisation || likeEnCours !== null;

  return (
    <ScrollView
      style={styles.fond}
      contentContainerStyle={styles.contenu}
      showsVerticalScrollIndicator={false}
      refreshControl={
        <RefreshControl
          refreshing={actualisation}
          onRefresh={() => chargerPublications(true)}
          tintColor="#079DA6"
          colors={['#079DA6']}
        />
      }
    >
      <View style={styles.banniere}>
        <View style={styles.badge}>
          <Ionicons
            name="people-outline"
            size={17}
            color="#BDEEEF"
          />

          <Text style={styles.texteBadge}>
            NOTRE COMMUNAUTÉ
          </Text>
        </View>

        <Text style={styles.titreBienvenue}>
          Bienvenue dans votre espace AEM
        </Text>

        <Text style={styles.descriptionBienvenue}>
          Retrouvez les nouvelles, les annonces et les messages
          de l’association.
        </Text>

        <View style={styles.devise}>
          <Ionicons
            name="heart-outline"
            size={18}
            color="#BDEEEF"
          />

          <Text style={styles.texteDevise}>
            Ensemble, avançons plus loin.
          </Text>
        </View>
      </View>

      <View style={styles.enteteSection}>
        <View style={styles.iconeSection}>
          <Ionicons
            name="newspaper-outline"
            size={23}
            color="#079DA6"
          />
        </View>

        <View style={styles.identite}>
          <Text style={styles.titreSection}>
            Actualités AEM
          </Text>

          <Text style={styles.sousTitreSection}>
            Les 20 dernières publications de votre communauté
          </Text>
        </View>
      </View>

      {erreur !== '' && (
        <View style={styles.carteErreur}>
          <Ionicons
            name="alert-circle-outline"
            size={28}
            color="#DC2626"
          />

          <Text style={styles.texteErreur}>{erreur}</Text>

          <Pressable
            accessibilityRole="button"
            disabled={occupe}
            onPress={() => chargerPublications()}
            style={styles.boutonReessayer}
          >
            <Ionicons
              name="refresh-outline"
              size={17}
              color="#FFFFFF"
            />

            <Text style={styles.texteReessayer}>
              Actualiser
            </Text>
          </Pressable>
        </View>
      )}

      {chargement && (
        <View style={styles.zoneChargement}>
          <ActivityIndicator size="large" color="#079DA6" />

          <Text style={styles.texteChargement}>
            Chargement des publications…
          </Text>
        </View>
      )}

      {!chargement && !erreur && publications.length === 0 && (
        <View style={styles.carteVide}>
          <Ionicons
            name="chatbubbles-outline"
            size={44}
            color="#079DA6"
          />

          <Text style={styles.titreVide}>
            Aucune publication pour le moment
          </Text>

          <Text style={styles.descriptionVide}>
            Les nouvelles de l’association apparaîtront ici.
            Tirez vers le bas pour actualiser.
          </Text>
        </View>
      )}

      {publications.map((publication) => (
        <CartePublication
          key={publication.id}
          publication={publication}
          onLike={modifierLike}
          enCours={likeEnCours === publication.id}
          desactive={occupe}
        />
      ))}

      <View style={styles.piedPage}>
        <Ionicons name="heart" size={15} color="#079DA6" />

        <Text style={styles.textePiedPage}>
          Association d’Entraide Madagascar
        </Text>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  fond: {
    flex: 1,
    backgroundColor: '#F4F9FA',
  },
  contenu: {
    flexGrow: 1,
    padding: 18,
    paddingBottom: 30,
  },
  banniere: {
    backgroundColor: '#073B5C',
    borderRadius: 22,
    padding: 22,
    marginBottom: 26,
  },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 7,
    marginBottom: 16,
  },
  texteBadge: {
    flexShrink: 1,
    fontSize: 10,
    fontWeight: '700',
    letterSpacing: 1,
    color: '#BDEEEF',
  },
  titreBienvenue: {
    fontSize: 25,
    fontWeight: 'bold',
    color: '#FFFFFF',
    lineHeight: 33,
    marginBottom: 12,
  },
  descriptionBienvenue: {
    fontSize: 14,
    lineHeight: 22,
    color: '#D6E8F0',
  },
  devise: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    borderTopWidth: 1,
    borderTopColor: '#28566F',
    paddingTop: 16,
    marginTop: 20,
  },
  texteDevise: {
    flex: 1,
    fontSize: 13,
    color: '#BDEEEF',
  },
  enteteSection: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    marginBottom: 18,
  },
  iconeSection: {
    width: 46,
    height: 46,
    borderRadius: 14,
    backgroundColor: '#E5F7F7',
    justifyContent: 'center',
    alignItems: 'center',
  },
  titreSection: {
    fontSize: 21,
    fontWeight: 'bold',
    color: '#183568',
  },
  sousTitreSection: {
    fontSize: 12,
    lineHeight: 18,
    color: '#64748B',
    marginTop: 4,
  },
  carte: {
    backgroundColor: '#FFFFFF',
    borderRadius: 18,
    padding: 18,
    marginBottom: 16,
    borderWidth: 1,
    borderColor: '#E6EDF2',
    shadowColor: '#073B5C',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.05,
    shadowRadius: 8,
    elevation: 2,
  },
  enteteCarte: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 11,
    marginBottom: 18,
  },
  avatar: {
    width: 44,
    height: 44,
    borderRadius: 22,
    backgroundColor: '#E5F7F7',
    alignItems: 'center',
    justifyContent: 'center',
  },
  initiales: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#079DA6',
  },
  identite: {
    flex: 1,
  },
  auteur: {
    fontSize: 14,
    lineHeight: 20,
    fontWeight: '700',
    color: '#183568',
  },
  ligneDate: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 5,
    marginTop: 5,
  },
  date: {
    flexShrink: 1,
    fontSize: 11,
    color: '#8492A6',
  },
  description: {
    fontSize: 14,
    lineHeight: 24,
    color: '#334155',
  },
  boutonVoirPlus: {
    flexDirection: 'row',
    alignItems: 'center',
    alignSelf: 'flex-start',
    gap: 6,
    paddingVertical: 12,
    marginTop: 4,
  },
  texteVoirPlus: {
    fontSize: 13,
    fontWeight: '700',
    color: '#079DA6',
  },
  piedCarte: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    gap: 12,
    marginTop: 16,
    paddingTop: 13,
    borderTopWidth: 1,
    borderTopColor: '#EDF2F7',
  },
  boutonLike: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    minHeight: 44,
    paddingHorizontal: 14,
    borderRadius: 12,
    backgroundColor: '#F1F5F9',
  },
  boutonLikeActif: {
    backgroundColor: '#FFF0F4',
  },
  boutonDesactive: {
    opacity: 0.6,
  },
  texteLike: {
    fontSize: 13,
    fontWeight: '600',
    color: '#64748B',
  },
  texteLikeActif: {
    color: '#C93560',
  },
  nombreLikes: {
    fontSize: 13,
    color: '#64748B',
  },
  zoneChargement: {
    alignItems: 'center',
    paddingVertical: 35,
  },
  texteChargement: {
    fontSize: 13,
    color: '#64748B',
    marginTop: 12,
  },
  carteErreur: {
    backgroundColor: '#FFF1F2',
    borderWidth: 1,
    borderColor: '#FECDD3',
    borderRadius: 16,
    padding: 20,
    alignItems: 'center',
    marginBottom: 16,
  },
  texteErreur: {
    color: '#B91C1C',
    fontSize: 14,
    lineHeight: 21,
    textAlign: 'center',
    marginTop: 10,
  },
  boutonReessayer: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    backgroundColor: '#DC2626',
    borderRadius: 10,
    paddingHorizontal: 18,
    paddingVertical: 12,
    marginTop: 16,
  },
  texteReessayer: {
    color: '#FFFFFF',
    fontSize: 13,
    fontWeight: '600',
  },
  carteVide: {
    backgroundColor: '#FFFFFF',
    borderRadius: 18,
    padding: 28,
    alignItems: 'center',
    borderWidth: 1,
    borderColor: '#E6EDF2',
  },
  titreVide: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#183568',
    textAlign: 'center',
    marginTop: 14,
  },
  descriptionVide: {
    fontSize: 13,
    lineHeight: 21,
    color: '#64748B',
    textAlign: 'center',
    marginTop: 8,
  },
  piedPage: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 7,
    marginTop: 12,
  },
  textePiedPage: {
    flexShrink: 1,
    fontSize: 12,
    color: '#64748B',
    textAlign: 'center',
  },
});