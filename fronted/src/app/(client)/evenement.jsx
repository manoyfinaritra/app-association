import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  TextInput,
  ScrollView,
  Pressable,
  StyleSheet,
  ActivityIndicator,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';

import api from '../../components/api/api';

// Convertir une date en YYYY-MM-DD à Madagascar.
function cleDate(valeur) {
  if (!valeur) return '';

  // Une date SQL sans heure est conservée telle quelle.
  if (/^\d{4}-\d{2}-\d{2}$/.test(String(valeur))) {
    return String(valeur);
  }

  const date = new Date(valeur);

  if (Number.isNaN(date.getTime())) return '';

  const parties = new Intl.DateTimeFormat('fr-FR', {
    timeZone: 'Indian/Antananarivo',
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
  }).formatToParts(date);

  const lire = (type) =>
    parties.find((partie) => partie.type === type)?.value;

  return `${lire('year')}-${lire('month')}-${lire('day')}`;
}

function formaterDate(valeur) {
  const cle = cleDate(valeur);

  if (!cle) return 'Date non renseignée';

  const [annee, mois, jour] = cle.split('-');

  return `${jour}/${mois}/${annee}`;
}

// Ce statut est calculé avec la date.
// Il ne correspond pas à une validation en base.
function statutEvenement(date, aujourdHui) {
  const cle = cleDate(date);

  if (!cle) return 'inconnu';
  if (cle === aujourdHui) return 'aujourdhui';
  if (cle > aujourdHui) return 'avenir';

  return 'passe';
}

const statuts = {
  avenir: {
    texte: 'À venir',
    couleur: '#079DA6',
    fond: '#E5F7F7',
  },
  aujourdhui: {
    texte: "Aujourd’hui",
    couleur: '#B45309',
    fond: '#FFF4DE',
  },
  passe: {
    texte: 'Passé',
    couleur: '#64748B',
    fond: '#F1F5F9',
  },
  inconnu: {
    texte: 'Date inconnue',
    couleur: '#64748B',
    fond: '#F1F5F9',
  },
};

const filtres = [
  { valeur: 'tous', titre: 'Tous' },
  { valeur: 'avenir', titre: 'À venir' },
  { valeur: 'aujourdhui', titre: "Aujourd’hui" },
  { valeur: 'passe', titre: 'Passés' },
];

export default function EvenementScreen() {
  const [evenements, setEvenements] = useState([]);
  const [recherche, setRecherche] = useState('');
  const [filtre, setFiltre] = useState('tous');
  const [chargement, setChargement] = useState(true);
  const [erreur, setErreur] = useState('');
  const [suite, setSuite] = useState(false);

  const aujourdHui = cleDate(new Date());

  async function chargerEvenements() {
    setChargement(true);
    setErreur('');

    try {
      // api doit déjà transmettre le jeton de connexion.
      const response = await api.get('/client/evenements');
      const donnees = response.data?.donnees;

      if (!Array.isArray(donnees)) {
        setErreur('Le serveur a renvoyé des données inattendues.');
        return;
      }

      setEvenements(donnees);
      setSuite(response.data.suite === true);
    } catch (error) {
      const messageServeur = error.response?.data?.message;

      setErreur(
        typeof messageServeur === 'string'
          ? messageServeur
          : 'Impossible de charger les événements.'
      );
    } finally {
      setChargement(false);
    }
  }

  useEffect(() => {
    chargerEvenements();
  }, []);

  const evenementsFiltres = evenements.filter((evenement) => {
    const texte = [
      evenement.titre,
      evenement.lieu,
      evenement.description,
    ]
      .filter(Boolean)
      .join(' ')
      .toLowerCase();

    const correspondRecherche = texte.includes(
      recherche.trim().toLowerCase()
    );

    const correspondFiltre =
      filtre === 'tous' ||
      statutEvenement(evenement.date, aujourdHui) === filtre;

    return correspondRecherche && correspondFiltre;
  });

  return (
    <ScrollView
      style={styles.container}
      contentContainerStyle={styles.contenu}
      showsVerticalScrollIndicator={false}
      keyboardShouldPersistTaps="handled"
      keyboardDismissMode="on-drag"
    >
      <View style={styles.iconeEntete}>
        <Ionicons
          name="calendar-outline"
          size={30}
          color="#079DA6"
        />
      </View>

      <Text style={styles.titre}>Événements</Text>

      <Text style={styles.sousTitre}>
        Retrouvez les rencontres et les activités de l’association.
      </Text>

      {/* Recherche */}
      <View style={styles.barreRecherche}>
        <Ionicons
          name="search-outline"
          size={21}
          color="#8994A5"
        />

        <TextInput
          style={styles.champRecherche}
          placeholder="Thème, lieu, description..."
          placeholderTextColor="#8994A5"
          value={recherche}
          onChangeText={setRecherche}
          autoCorrect={false}
          returnKeyType="search"
          accessibilityLabel="Rechercher un événement"
        />

        {recherche !== '' && (
          <Pressable
            onPress={() => setRecherche('')}
            accessibilityRole="button"
            accessibilityLabel="Effacer la recherche"
            hitSlop={10}
          >
            <Ionicons
              name="close-circle"
              size={21}
              color="#8994A5"
            />
          </Pressable>
        )}
      </View>

      {/* Filtres */}
      <View style={styles.filtres}>
        {filtres.map((element) => (
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
                filtre === element.valeur &&
                  styles.texteFiltreActif,
              ]}
            >
              {element.titre}
            </Text>
          </Pressable>
        ))}
      </View>

      {chargement ? (
        <View style={styles.zoneMessage}>
          <ActivityIndicator size="large" color="#079DA6" />
          <Text style={styles.texteMessage}>
            Chargement des événements…
          </Text>
        </View>
      ) : erreur ? (
        <View style={styles.zoneMessage}>
          <Ionicons
            name="alert-circle-outline"
            size={36}
            color="#DC2626"
          />

          <Text style={styles.texteErreur}>{erreur}</Text>

          <Pressable
            onPress={chargerEvenements}
            style={styles.boutonReessayer}
          >
            <Text style={styles.texteReessayer}>
              Réessayer
            </Text>
          </Pressable>
        </View>
      ) : (
        <>
          <Text style={styles.compteur}>
            {evenementsFiltres.length} événement
            {evenementsFiltres.length > 1 ? 's' : ''} affiché
            {evenementsFiltres.length > 1 ? 's' : ''}
          </Text>

          {evenementsFiltres.length === 0 ? (
            <View style={styles.zoneMessage}>
              <Ionicons
                name="calendar-outline"
                size={45}
                color="#8994A5"
              />

              <Text style={styles.texteMessage}>
                {evenements.length === 0
                  ? 'Aucun événement disponible pour le moment.'
                  : 'Aucun événement ne correspond à ces filtres.'}
              </Text>
            </View>
          ) : (
            evenementsFiltres.map((evenement) => {
              const statut =
                statuts[statutEvenement(evenement.date, aujourdHui)];

              return (
                <View key={evenement.id} style={styles.carte}>
                  <View style={styles.enteteCarte}>
                    <Text style={styles.titreEvenement}>
                      {evenement.titre}
                    </Text>

                    <View
                      style={[
                        styles.badge,
                        { backgroundColor: statut.fond },
                      ]}
                    >
                      <Text
                        style={[
                          styles.texteBadge,
                          { color: statut.couleur },
                        ]}
                      >
                        {statut.texte}
                      </Text>
                    </View>
                  </View>

                  <View style={styles.detail}>
                    <Ionicons
                      name="calendar-outline"
                      size={19}
                      color="#079DA6"
                    />
                    <Text style={styles.texteDetail}>
                      {formaterDate(evenement.date)}
                    </Text>
                  </View>

                  <View style={styles.detail}>
                    <Ionicons
                      name="location-outline"
                      size={19}
                      color="#079DA6"
                    />
                    <Text style={styles.texteDetail}>
                      {evenement.lieu || 'Lieu non renseigné'}
                    </Text>
                  </View>

                  {Boolean(evenement.description?.trim()) && (
                    <Text style={styles.description} selectable>
                      {evenement.description}
                    </Text>
                  )}
                </View>
              );
            })
          )}

          {suite && (
            <Text style={styles.note}>
              Seuls les 20 premiers événements sont chargés.
              La recherche et les filtres portent sur cette liste.
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
  barreRecherche: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    paddingHorizontal: 12,
    borderWidth: 1,
    borderColor: '#DCE5ED',
    marginBottom: 14,
  },
  champRecherche: {
    flex: 1,
    paddingVertical: 14,
    fontSize: 14,
    color: '#183568',
  },
  filtres: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
    marginBottom: 22,
  },
  boutonFiltre: {
    paddingHorizontal: 14,
    paddingVertical: 10,
    backgroundColor: '#FFFFFF',
    borderRadius: 20,
    borderWidth: 1,
    borderColor: '#DCE5ED',
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
  compteur: {
    fontSize: 13,
    color: '#64748B',
    marginBottom: 14,
  },
  carte: {
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    padding: 18,
    marginBottom: 16,
    borderWidth: 1,
    borderColor: '#E6EDF2',
  },
  enteteCarte: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: 10,
    marginBottom: 18,
  },
  titreEvenement: {
    flex: 1,
    fontSize: 18,
    lineHeight: 25,
    fontWeight: 'bold',
    color: '#183568',
  },
  badge: {
    paddingHorizontal: 9,
    paddingVertical: 6,
    borderRadius: 9,
  },
  texteBadge: {
    fontSize: 11,
    fontWeight: '600',
  },
  detail: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: 9,
    marginBottom: 10,
  },
  texteDetail: {
    flex: 1,
    fontSize: 14,
    lineHeight: 21,
    color: '#526078',
  },
  description: {
    fontSize: 14,
    lineHeight: 23,
    color: '#334155',
    marginTop: 8,
    paddingTop: 14,
    borderTopWidth: 1,
    borderTopColor: '#EDF2F7',
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
  texteErreur: {
    fontSize: 14,
    lineHeight: 22,
    color: '#DC2626',
    textAlign: 'center',
    marginTop: 12,
  },
  boutonReessayer: {
    backgroundColor: '#079DA6',
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 10,
    marginTop: 16,
  },
  texteReessayer: {
    color: '#FFFFFF',
    fontWeight: '600',
  },
  note: {
    fontSize: 12,
    lineHeight: 19,
    color: '#64748B',
    textAlign: 'center',
  },
});