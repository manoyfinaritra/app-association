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

function formaterDate(valeur) {
  if (!valeur) return 'Date non renseignée';

  const date = new Date(valeur);

  if (Number.isNaN(date.getTime())) {
    return 'Date non renseignée';
  }

  return date.toLocaleDateString('fr-FR', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
    timeZone: 'Indian/Antananarivo',
  });
}

function formaterPrix(valeur) {
  if (valeur === null || valeur === undefined || valeur === '') {
    return 'Prix non renseigné';
  }

  const montant = Number(valeur);

  if (!Number.isFinite(montant)) {
    return 'Prix non renseigné';
  }

  if (montant === 0) return 'Gratuit';

  return `${montant.toLocaleString('fr-FR')} Ar / personne`;
}

export default function FormationScreen() {
  const [recherche, setRecherche] = useState('');
  const [formations, setFormations] = useState([]);
  const [chargement, setChargement] = useState(true);
  const [erreur, setErreur] = useState('');
  const [suite, setSuite] = useState(false);

  async function chargerFormations() {
    setChargement(true);
    setErreur('');

    try {
      
      const response = await api.get('/client/formations');
      const donnees = response.data?.donnees;

      if (!Array.isArray(donnees)) {
        setErreur('Le serveur a renvoyé des données inattendues.');
        return;
      }

      setFormations(donnees);
      setSuite(response.data.suite === true);
    } catch (error) {
      const messageServeur = error.response?.data?.message;

      setErreur(
        typeof messageServeur === 'string'
          ? messageServeur
          : 'Impossible de charger les formations.'
      );
    } finally {
      setChargement(false);
    }
  }

  useEffect(() => {
    chargerFormations();
  }, []);

  
  const formationsFiltrees = formations.filter((formation) => {
    const texte = [
      formation.titre,
      formation.lieu,
      formation.intervenant,
    ]
      .filter(Boolean)
      .join(' ')
      .toLowerCase();

    return texte.includes(recherche.trim().toLowerCase());
  });

  return (
    <ScrollView
      style={styles.container}
      contentContainerStyle={styles.contenu}
      showsVerticalScrollIndicator={false}
      keyboardShouldPersistTaps="handled"
      keyboardDismissMode="on-drag"
    >
     
      <View style={styles.entete}>
        <View style={styles.iconeEntete}>
          <Ionicons
            name="school-outline"
            size={30}
            color="#079DA6"
          />
        </View>

        <Text style={styles.titre}>Formations</Text>

        <Text style={styles.sousTitre}>
          Découvrez les formations proposées par l’association.
        </Text>
      </View>

      {/* Recherche */}
      <View style={styles.barreRecherche}>
        <Ionicons
          name="search-outline"
          size={21}
          color="#8994A5"
        />

        <TextInput
          style={styles.champRecherche}
          placeholder="Thème, lieu, intervenant..."
          placeholderTextColor="#8994A5"
          value={recherche}
          onChangeText={setRecherche}
          autoCorrect={false}
          returnKeyType="search"
          accessibilityLabel="Rechercher une formation"
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

      {/* Chargement */}
      {chargement ? (
        <View style={styles.zoneMessage}>
          <ActivityIndicator size="large" color="#079DA6" />
          <Text style={styles.texteMessage}>
            Chargement des formations…
          </Text>
        </View>
      ) : erreur ? (
        <View style={styles.zoneMessage}>
          <Ionicons
            name="alert-circle-outline"
            size={35}
            color="#DC2626"
          />

          <Text style={styles.texteErreur}>{erreur}</Text>

          <Pressable
            style={styles.bouton}
            onPress={chargerFormations}
          >
            <Text style={styles.texteBouton}>Réessayer</Text>
          </Pressable>
        </View>
      ) : (
        <>
          <View style={styles.ligneListe}>
            <Text style={styles.titreListe}>
              Liste des formations
            </Text>

            <View style={styles.badge}>
              <Text style={styles.texteBadge}>
                {formationsFiltrees.length} résultat
                {formationsFiltrees.length > 1 ? 's' : ''}
              </Text>
            </View>
          </View>

          {formationsFiltrees.length === 0 ? (
            <View style={styles.zoneMessage}>
              <Ionicons
                name="school-outline"
                size={45}
                color="#8994A5"
              />

              <Text style={styles.texteMessage}>
                {recherche.trim()
                  ? 'Aucune formation ne correspond à votre recherche.'
                  : 'Aucune formation disponible pour le moment.'}
              </Text>
            </View>
          ) : (
            formationsFiltrees.map((formation) => (
              <View key={formation.id} style={styles.carte}>
                <Text style={styles.titreFormation}>
                  {formation.titre}
                </Text>

                <View style={styles.detail}>
                  <Ionicons
                    name="calendar-outline"
                    size={18}
                    color="#079DA6"
                  />
                  <Text style={styles.texteDetail}>
                    {formaterDate(formation.date)}
                  </Text>
                </View>

                <View style={styles.detail}>
                  <Ionicons
                    name="location-outline"
                    size={18}
                    color="#079DA6"
                  />
                  <Text style={styles.texteDetail}>
                    {formation.lieu || 'Lieu non renseigné'}
                  </Text>
                </View>

                <View style={styles.detail}>
                  <Ionicons
                    name="person-outline"
                    size={18}
                    color="#079DA6"
                  />
                  <Text style={styles.texteDetail}>
                    {formation.intervenant ||
                      'Intervenant non renseigné'}
                  </Text>
                </View>

                {Boolean(formation.description) && (
                  <Text style={styles.description}>
                    {formation.description}
                  </Text>
                )}

                <View style={styles.lignePrix}>
                  <Ionicons
                    name="wallet-outline"
                    size={20}
                    color="#079DA6"
                  />
                  <Text style={styles.prix}>
                    {formaterPrix(formation.prix)}
                  </Text>
                </View>
              </View>
            ))
          )}

          {suite && (
            <Text style={styles.textePagination}>
              Seules les 20 premières formations sont chargées.
              La recherche porte sur cette liste.
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
  entete: {
    marginBottom: 22,
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
    marginBottom: 22,
  },
  champRecherche: {
    flex: 1,
    paddingVertical: 14,
    fontSize: 14,
    color: '#183568',
  },
  ligneListe: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    gap: 10,
    marginBottom: 14,
  },
  titreListe: {
    flex: 1,
    fontSize: 16,
    fontWeight: 'bold',
    color: '#183568',
  },
  badge: {
    backgroundColor: '#E5F7F7',
    paddingHorizontal: 10,
    paddingVertical: 6,
    borderRadius: 12,
  },
  texteBadge: {
    fontSize: 12,
    color: '#079DA6',
    fontWeight: '600',
  },
  carte: {
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    padding: 18,
    marginBottom: 16,
    borderWidth: 1,
    borderColor: '#E6EDF2',
  },
  titreFormation: {
    fontSize: 18,
    lineHeight: 25,
    fontWeight: 'bold',
    color: '#183568',
    marginBottom: 16,
  },
  detail: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: 9,
    marginBottom: 10,
  },
  texteDetail: {
    flex: 1,
    fontSize: 13,
    lineHeight: 20,
    color: '#526078',
  },
  description: {
    fontSize: 14,
    lineHeight: 23,
    color: '#526078',
    marginTop: 8,
    marginBottom: 16,
  },
  lignePrix: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 9,
    paddingTop: 14,
    marginTop: 6,
    borderTopWidth: 1,
    borderTopColor: '#EDF2F7',
  },
  prix: {
    flex: 1,
    fontSize: 14,
    fontWeight: 'bold',
    color: '#079DA6',
  },
  zoneMessage: {
    alignItems: 'center',
    paddingVertical: 35,
    paddingHorizontal: 18,
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
  bouton: {
    backgroundColor: '#079DA6',
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 10,
    marginTop: 16,
  },
  texteBouton: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '600',
  },
  textePagination: {
    color: '#64748B',
    fontSize: 12,
    lineHeight: 19,
    textAlign: 'center',
    marginTop: 8,
  },
});