import React from 'react';
import {
  View,
  Text,
  ScrollView,
  StyleSheet,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';

const avantages = [
  {
    icone: 'school-outline',
    titre: 'Formations',
    description: 'Developpez vos competences et decouvrez de nouvelles opportunites.',
  },
  {
    icone: 'people-outline',
    titre: 'Communaute',
    description: 'Rencontrez les membres et partagez vos experiences.',
  },
  {
    icone: 'calendar-outline',
    titre: 'Evenements',
    description: "Participez aux activites et aux rencontres de l'association.",
  },
  {
    icone: 'heart-outline',
    titre: 'Entraide et solidarite',
    description: 'Ensemble, soutenons les initiatives et aidons notre communaute.',
  },
];

export default function Avantages() {
  return (
    <ScrollView style={styles.container}>
      <View style={styles.entete}>
        <Text style={styles.titre}>Nos avantages</Text>
        <Text style={styles.sousTitre}>Ensemble, avançons plus loin avec AEM !</Text>
      </View>

      {avantages.map((avantage, index) => (
        <View key={index} style={styles.carte}>
          <View style={styles.conteneurIcone}>
            <Ionicons name={avantage.icone} size={32} color="#079DA6" />
          </View>

          <Text style={styles.titreCarte}>
            {avantage.titre}
          </Text>
          <Text style={styles.description}>
            {avantage.description}
          </Text>
        </View>
      ))}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F4F9FA',
  },
  entete: {
    backgroundColor: '#073B5C',
    padding: 28,
    paddingTop: 35,
    paddingBottom: 35,
    borderBottomLeftRadius: 25,
    borderBottomRightRadius: 25,
  },
  titre: {
    fontSize: 27,
    fontWeight: 'bold',
    color: '#FFFFFF',
    marginBottom: 8,
  },
  sousTitre: {
    fontSize: 14,
    color: '#E5F6F6',
  },
  carte: {
    backgroundColor: '#FFFFFF',
    marginHorizontal: 18,
    marginTop: 18,
    padding: 20,
    borderRadius: 16,
    elevation: 3,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
  },
  conteneurIcone: {
    backgroundColor: '#E5F6F6',
    padding: 15,
    borderRadius: 50,
    marginBottom: 12,
    alignSelf: 'flex-start',
  },
  titreCarte: {
    fontSize: 19,
    fontWeight: 'bold',
    color: '#073B5C',
    marginBottom: 8,
  },
  description: {
    fontSize: 14,
    color: '#555555',
    lineHeight: 22,
  },
});
import EcranOnglet from '../components/EcranOnglet';

export default function Avantages() {
  return <EcranOnglet titre="Mes avantages" />;
}
