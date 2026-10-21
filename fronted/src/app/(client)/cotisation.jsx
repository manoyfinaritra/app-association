import React, { useEffect, useRef, useState } from 'react';
import {
  View,
  Text,
  ScrollView,
  Pressable,
  StyleSheet,
  ActivityIndicator,
  RefreshControl,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';

import api from '../../components/api/api';

const MOIS = [
  'Janvier',
  'Février',
  'Mars',
  'Avril',
  'Mai',
  'Juin',
  'Juillet',
  'Août',
  'Septembre',
  'Octobre',
  'Novembre',
  'Décembre',
];

const FILTRES = [
  { valeur: 'toutes', titre: 'Toutes' },
  { valeur: 'validees', titre: 'Validées' },
  { valeur: 'attente', titre: 'En attente' },
];

function formaterMontant(valeur) {
  const montant = Number(valeur);

  if (!Number.isFinite(montant)) return 'Non renseigné';

  return `${montant.toLocaleString('fr-FR', {
    maximumFractionDigits: 2,
  })} Ar`;
}

function formaterDate(valeur) {
  if (!valeur) return 'Non renseignée';

  // Les dates SQL sans heure sont affichées directement.
  if (/^\d{4}-\d{2}-\d{2}$/.test(String(valeur))) {
    const [annee, mois, jour] = String(valeur).split('-');
    return `${jour}/${mois}/${annee}`;
  }

  const date = new Date(valeur);

  if (Number.isNaN(date.getTime())) return 'Non renseignée';

  return date.toLocaleDateString('fr-FR', {
    day: '2-digit',
    month: '2-digit',
    year: 'numeric',
    timeZone: 'Indian/Antananarivo',
  });
}

function statutCotisation(valeur) {
  if (Number(valeur) === 1) return 'validees';
  if (valeur !== null && valeur !== undefined && Number(valeur) === 0) {
    return 'attente';
  }

  return 'inconnu';
}

function CarteCotisation({ cotisation }) {
  const statut = statutCotisation(cotisation.valide);
  const validee = statut === 'validees';

  const libelleStatut =
    validee
      ? 'Validée'
      : statut === 'attente'
        ? 'En attente'
        : 'Statut inconnu';

  const mois = MOIS[Number(cotisation.mois) - 1] || 'Mois inconnu';

  return (
    <View style={styles.carte}>
      <View style={styles.enteteCarte}>
        <View style={styles.iconeCotisation}>
          <Ionicons
            name="wallet-outline"
            size={24}
            color="#079DA6"
          />
        </View>

        <View style={styles.informations}>
          <Text style={styles.periode}>
            {mois} {cotisation.annee}
          </Text>

          <Text style={styles.reference}>
            Cotisation n° {cotisation.id}
          </Text>
        </View>
      </View>

      <Text style={styles.montant}>
        {formaterMontant(cotisation.montant)}
      </Text>

      <View style={styles.ligneDate}>
        <Ionicons
          name="calendar-outline"
          size={16}
          color="#64748B"
        />

        <Text style={styles.date}>
          Enregistrée le {formaterDate(cotisation.date)}
        </Text>
      </View>

      <View style={styles.piedCarte}>
        <Text style={styles.labelStatut}>Validation</Text>

        <View
          style={[
            styles.badge,
            validee ? styles.badgeValide : styles.badgeAttente,
          ]}
        >
          <Ionicons
            name={validee ? 'checkmark-circle-outline' : 'time-outline'}
            size={15}
            color={validee ? '#047857' : '#92400E'}
          />

          <Text
            style={[
              styles.texteBadge,
              validee ? styles.texteValide : styles.texteAttente,
            ]}
          >
            {libelleStatut}
          </Text>
        </View>
      </View>
    </View>
  );
}

export default function CotisationScreen() {
  const [cotisations, setCotisations] = useState([]);
  const [filtre, setFiltre] = useState('toutes');

  const [chargement, setChargement] = useState(true);
  const [actualisation, setActualisation] = useState(false);
  const [chargementSuite, setChargementSuite] = useState(false);

  const [page, setPage] = useState(1);
  const [suite, setSuite] = useState(false);
  const [erreur, setErreur] = useState('');
  const [pageEnErreur, setPageEnErreur] = useState(1);

  const requeteEnCours = useRef(false);

  async function chargerCotisations(numeroPage = 1, rafraichir = false) {
    if (requeteEnCours.current) return;

    requeteEnCours.current = true;
    setErreur('');

    if (rafraichir) {
      setActualisation(true);
    } else if (numeroPage === 1) {
      setChargement(true);
    } else {
      setChargementSuite(true);
    }

    try {
      const response = await api.get('/client/cotisations', {
        params: {
          page: numeroPage,
        },
      });

      const donnees = response.data?.donnees;

      if (!Array.isArray(donnees)) {
        setPageEnErreur(numeroPage);
        setErreur('Le serveur a renvoyé des données inattendues.');
        return;
      }

      if (numeroPage === 1) {
        setCotisations(donnees);
      } else {
        // Éviter les doublons entre deux pages.
        setCotisations((listeActuelle) => {
          const idsExistants = new Set(
            listeActuelle.map((element) => String(element.id))
          );

          const nouvelles = donnees.filter(
            (element) => !idsExistants.has(String(element.id))
          );

          return [...listeActuelle, ...nouvelles];
        });
      }

      setPage(numeroPage);
      setSuite(response.data.suite === true);
    } catch (error) {
      const messageServeur = error.response?.data?.message;

      setPageEnErreur(numeroPage);
      setErreur(
        typeof messageServeur === 'string'
          ? messageServeur
          : 'Impossible de charger vos cotisations.'
      );
    } finally {
      requeteEnCours.current = false;
      setChargement(false);
      setActualisation(false);
      setChargementSuite(false);
    }
  }

  useEffect(() => {
    chargerCotisations();
  }, []);

  const cotisationsFiltrees = cotisations.filter((cotisation) => {
    return (
      filtre === 'toutes' ||
      statutCotisation(cotisation.valide) === filtre
    );
  });

  const totalValide = cotisations
    .filter((cotisation) => statutCotisation(cotisation.valide) === 'validees')
    .reduce(
      (total, cotisation) => total + (Number(cotisation.montant) || 0),
      0
    );

  const totalEnAttente = cotisations
    .filter((cotisation) => statutCotisation(cotisation.valide) === 'attente')
    .reduce(
      (total, cotisation) => total + (Number(cotisation.montant) || 0),
      0
    );

  const occupe = chargement || actualisation || chargementSuite;

  return (
    <ScrollView
      style={styles.container}
      contentContainerStyle={styles.contenu}
      showsVerticalScrollIndicator={false}
      refreshControl={
        <RefreshControl
          refreshing={actualisation}
          onRefresh={() => chargerCotisations(1, true)}
          tintColor="#079DA6"
          colors={['#079DA6']}
        />
      }
    >
      {/* Le header est déjà affiché par le layout client. */}
      <View style={styles.iconeEntete}>
        <Ionicons
          name="wallet-outline"
          size={30}
          color="#079DA6"
        />
      </View>

      <Text style={styles.titre}>Mes cotisations</Text>

      <Text style={styles.sousTitre}>
        Consultez vos montants enregistrés et leur validation.
      </Text>

      {/* Chargement initial */}
      {chargement && (
        <View style={styles.zoneMessage}>
          <ActivityIndicator size="large" color="#079DA6" />
          <Text style={styles.texteMessage}>
            Chargement des cotisations…
          </Text>
        </View>
      )}

      {/* Erreur, y compris lors du chargement d’une autre page */}
      {erreur !== '' && (
        <View style={styles.carteErreur}>
          <Ionicons
            name="alert-circle-outline"
            size={28}
            color="#DC2626"
          />

          <Text style={styles.texteErreur}>{erreur}</Text>

          <Pressable
            disabled={occupe}
            onPress={() => chargerCotisations(pageEnErreur)}
            style={styles.bouton}
          >
            <Text style={styles.texteBouton}>Réessayer</Text>
          </Pressable>
        </View>
      )}

      {!chargement && (
        <>
          {/* Totaux calculés sur la liste chargée */}
          {(cotisations.length > 0 || !erreur) && (
            <>
              <View style={styles.statistiques}>
                <View style={styles.carteStatistique}>
                  <Ionicons
                    name="checkmark-circle-outline"
                    size={24}
                    color="#047857"
                  />

                  <Text style={styles.labelStatistique}>
                    Montant validé
                  </Text>

                  <Text style={styles.totalValide}>
                    {formaterMontant(totalValide)}
                  </Text>
                </View>

                <View style={styles.carteStatistique}>
                  <Ionicons
                    name="time-outline"
                    size={24}
                    color="#B45309"
                  />

                  <Text style={styles.labelStatistique}>
                    En attente de validation
                  </Text>

                  <Text style={styles.totalAttente}>
                    {formaterMontant(totalEnAttente)}
                  </Text>
                </View>
              </View>

              <Text style={styles.noteTotaux}>
                Totaux des {cotisations.length} cotisations chargées.
                Le montant en attente n’est pas un calcul de vos impayés.
              </Text>
            </>
          )}

          {/* Filtres */}
          <View style={styles.filtres}>
            {FILTRES.map((element) => (
              <Pressable
                key={element.valeur}
                onPress={() => setFiltre(element.valeur)}
                accessibilityRole="button"
                accessibilityState={{
                  selected: filtre === element.valeur,
                }}
                style={[
                  styles.boutonFiltre,
                  filtre === element.valeur && styles.filtreActif,
                ]}
              >
                <Text
                  style={[
                    styles.texteFiltre,
                    filtre === element.valeur && styles.texteFiltreActif,
                  ]}
                >
                  {element.titre}
                </Text>
              </Pressable>
            ))}
          </View>

          <Text style={styles.titreListe}>Historique</Text>

          {cotisationsFiltrees.map((cotisation) => (
            <CarteCotisation
              key={cotisation.id}
              cotisation={cotisation}
            />
          ))}

          {!erreur && cotisationsFiltrees.length === 0 && (
            <View style={styles.zoneMessage}>
              <Ionicons
                name="receipt-outline"
                size={44}
                color="#8994A5"
              />

              <Text style={styles.texteMessage}>
                {cotisations.length === 0
                  ? 'Aucune cotisation enregistrée pour votre compte.'
                  : 'Aucune cotisation chargée ne correspond à ce filtre.'}
              </Text>
            </View>
          )}

          {/* Pagination de ta route existante */}
          {suite && !erreur && (
            <Pressable
              onPress={() => chargerCotisations(page + 1)}
              disabled={occupe}
              style={[
                styles.bouton,
                occupe && styles.boutonDesactive,
              ]}
            >
              {chargementSuite ? (
                <ActivityIndicator color="#FFFFFF" />
              ) : (
                <>
                  <Ionicons
                    name="add-circle-outline"
                    size={20}
                    color="#FFFFFF"
                  />
                  <Text style={styles.texteBouton}>
                    Charger la suite
                  </Text>
                </>
              )}
            </Pressable>
          )}

          {suite && (
            <Text style={styles.noteTotaux}>
              D’autres cotisations restent à charger.
              Les filtres portent sur les lignes déjà affichées.
            </Text>
          )}
        </>
      )}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F4F9FA',
  },
  contenu: {
    padding: 20,
    paddingBottom: 30,
  },
  iconeEntete: {
    width: 58,
    height: 58,
    borderRadius: 16,
    backgroundColor: '#E5F7F7',
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 14,
  },
  titre: {
    fontSize: 25,
    fontWeight: 'bold',
    color: '#073B5C',
    marginBottom: 7,
  },
  sousTitre: {
    fontSize: 14,
    lineHeight: 21,
    color: '#526078',
    marginBottom: 22,
  },
  statistiques: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 12,
  },
  carteStatistique: {
    flexGrow: 1,
    flexBasis: '45%',
    minWidth: 130,
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    borderWidth: 1,
    borderColor: '#E6EDF2',
    padding: 16,
  },
  labelStatistique: {
    fontSize: 12,
    lineHeight: 18,
    color: '#64748B',
    marginTop: 10,
    marginBottom: 8,
  },
  totalValide: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#047857',
  },
  totalAttente: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#B45309',
  },
  noteTotaux: {
    fontSize: 12,
    lineHeight: 19,
    color: '#64748B',
    marginTop: 12,
    marginBottom: 18,
  },
  filtres: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
    marginBottom: 22,
  },
  boutonFiltre: {
    backgroundColor: '#FFFFFF',
    borderWidth: 1,
    borderColor: '#DCE5ED',
    borderRadius: 20,
    paddingHorizontal: 14,
    paddingVertical: 10,
  },
  filtreActif: {
    backgroundColor: '#079DA6',
    borderColor: '#079DA6',
  },
  texteFiltre: {
    fontSize: 12,
    fontWeight: '600',
    color: '#526078',
  },
  texteFiltreActif: {
    color: '#FFFFFF',
  },
  titreListe: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#183568',
    marginBottom: 14,
  },
  carte: {
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    padding: 18,
    marginBottom: 14,
    borderWidth: 1,
    borderColor: '#E6EDF2',
  },
  enteteCarte: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    marginBottom: 16,
  },
  iconeCotisation: {
    width: 46,
    height: 46,
    borderRadius: 13,
    backgroundColor: '#E5F7F7',
    justifyContent: 'center',
    alignItems: 'center',
  },
  informations: {
    flex: 1,
  },
  periode: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#183568',
  },
  reference: {
    fontSize: 12,
    color: '#8994A5',
    marginTop: 5,
  },
  montant: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#073B5C',
    marginBottom: 12,
  },
  ligneDate: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 7,
  },
  date: {
    flex: 1,
    fontSize: 12,
    lineHeight: 19,
    color: '#64748B',
  },
  piedCarte: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    alignItems: 'center',
    justifyContent: 'space-between',
    gap: 10,
    borderTopWidth: 1,
    borderTopColor: '#EDF2F7',
    paddingTop: 14,
    marginTop: 16,
  },
  labelStatut: {
    fontSize: 12,
    color: '#64748B',
  },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 5,
    paddingHorizontal: 10,
    paddingVertical: 6,
    borderRadius: 12,
  },
  badgeValide: {
    backgroundColor: '#D1FAE5',
  },
  badgeAttente: {
    backgroundColor: '#FEF3C7',
  },
  texteBadge: {
    fontSize: 12,
    fontWeight: '600',
  },
  texteValide: {
    color: '#047857',
  },
  texteAttente: {
    color: '#92400E',
  },
  zoneMessage: {
    alignItems: 'center',
    paddingVertical: 35,
    paddingHorizontal: 15,
  },
  texteMessage: {
    fontSize: 14,
    lineHeight: 22,
    color: '#64748B',
    textAlign: 'center',
    marginTop: 14,
  },
  carteErreur: {
    alignItems: 'center',
    backgroundColor: '#FFF1F2',
    borderRadius: 16,
    padding: 20,
    marginBottom: 18,
  },
  texteErreur: {
    fontSize: 14,
    lineHeight: 21,
    color: '#DC2626',
    textAlign: 'center',
    marginTop: 10,
  },
  bouton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    backgroundColor: '#079DA6',
    borderRadius: 12,
    padding: 14,
    marginTop: 10,
  },
  boutonDesactive: {
    opacity: 0.6,
  },
  texteBouton: {
    fontSize: 14,
    fontWeight: '600',
    color: '#FFFFFF',
  },
});