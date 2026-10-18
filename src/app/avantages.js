
import React from 'react';
import { View, Text, ScrollView, StyleSheet } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { useLanguage } from '../context/LanguageContext';

export default function Avantages() {
  const { t } = useLanguage();

  const avantages = [
    {
      icone: 'school-outline',
      titre: t('trainings'),
      description:
        'Développez vos compétences et découvrez de nouvelles opportunités.',
    },
    {
      icone: 'people-outline',
      titre: t('community'),
      description: 'Rencontrez les membres et partagez vos expériences.',
    },
    {
      icone: 'calendar-outline',
      titre: t('events'),
      description:
        "Participez aux activités et aux rencontres de l'association.",
    },
    {
      icone: 'heart-outline',
      titre: t('solidarity'),
      description:
        'Ensemble, soutenons les initiatives et aidons notre communauté.',
    },
  ];

  return (
    <ScrollView
      style={styles.container}
      contentContainerStyle={styles.contenu}
    >
      <View style={styles.entete}>
        <Text style={styles.titre}>{t('advantages')}</Text>
        <Text style={styles.sousTitre}>
          {t('advantagesSubtitle')}
        </Text>
      </View>

      {avantages.map((avantage, index) => (
        <View key={index} style={styles.carte}>
          <View style={styles.conteneurIcone}>
            <Ionicons
              name={avantage.icone}
              size={32}
              color="#079DA6"
            />
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
    backgroundColor: '#F8FAFC',
  },

  contenu: {
    padding: 20,
    paddingBottom: 40,
  },

  entete: {
    marginBottom: 24,
    marginTop: 10,
  },

  titre: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#0F172A',
    marginBottom: 8,
  },

  sousTitre: {
    fontSize: 16,
    color: '#64748B',
    lineHeight: 24,
  },

  carte: {
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    padding: 20,
    marginBottom: 16,
    alignItems: 'flex-start',
    borderWidth: 1,
    borderColor: '#E2E8F0',

    // Ombre
    elevation: 3,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08,
    shadowRadius: 6,
  },

  conteneurIcone: {
    width: 60,
    height: 60,
    borderRadius: 16,
    backgroundColor: '#E6F7F7',
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 16,
  },

  titreCarte: {
    fontSize: 19,
    fontWeight: 'bold',
    color: '#0F172A',
    marginBottom: 8,
  },

  description: {
    fontSize: 15,
    color: '#64748B',
    lineHeight: 23,
  },
});