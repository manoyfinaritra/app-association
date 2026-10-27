
import { Ionicons } from '@expo/vector-icons';
import { router } from 'expo-router';
import React from 'react';
 
import { Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';

import { useLanguage } from '../../context/LanguageContext';

export default function Accueil() {
  const { t } = useLanguage();

  return (
    <ScrollView
      style={styles.fond}
      contentContainerStyle={styles.contenu}
      showsVerticalScrollIndicator={false}
    >
      {/* Présentation */}
      <Text style={styles.titre}>{t('homeTitle')}</Text>

      <Text style={styles.description}>
        {t('homeDescription')}
      </Text>

      {/* Bouton principal */}
      <Pressable
        style={styles.boutonPrincipal}
        onPress={() => router.navigate('/inscription')}
      >
        <Text style={styles.textePrincipal}>
          {t('becomeMember')}
        </Text>
        <Ionicons name="arrow-forward" size={21} color="#FFFFFF" />
      </Pressable>

      {/* Bouton secondaire */}
      <Pressable
        style={styles.boutonSecondaire}
        onPress={() => router.navigate('/avantages')}
      >
        <Text style={styles.texteSecondaire}>
          {t('discover')}
        </Text>
      </Pressable>

      {/* Avantages */}
      <View style={styles.grille}>
        <Carte icone="book-outline" titre={t('trainings')} />
        <Carte icone="calendar-outline" titre={t('events')} />
        <Carte icone="wallet-outline" titre={t('contributions')} />
        <Carte icone="people-outline" titre={t('community')} />
      </View>

      {/* Présentation de l'association */}
      <View style={styles.encadre}>
        <View style={styles.badge}>
          <Ionicons name="people" size={19} color="#079DA6" />
          <Text style={styles.texteBadge}>
            {t('together')}
          </Text>
        </View>

        <Text style={styles.descriptionEncadre}>
          {t('homeDescription')}
        </Text>
      </View>
    </ScrollView>
  );
}

function Carte({ icone, titre }) {
  return (
    <View style={styles.carte}>
      <Ionicons name={icone} size={27} color="#079DA6" />
      <Text style={styles.texteBadge}>{titre}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  fond: {
    flex: 1,
    backgroundColor: '#F4F9FA',
  },

  contenu: {
    paddingHorizontal: 20,
    paddingTop: 25,
    paddingBottom: 120,
  },

  titre: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#073B5C',
    marginBottom: 15,
    lineHeight: 36,
  },

  description: {
    fontSize: 15,
    color: '#526078',
    lineHeight: 24,
    marginBottom: 20,
  },

  boutonPrincipal: {
    backgroundColor: '#079DA6',
    borderRadius: 12,
    paddingVertical: 15,
    paddingHorizontal: 18,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 10,
    marginBottom: 12,
  },

  textePrincipal: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },

  boutonSecondaire: {
    borderWidth: 1.5,
    borderColor: '#079DA6',
    borderRadius: 12,
    paddingVertical: 14,
    paddingHorizontal: 18,
    alignItems: 'center',
  },

  texteSecondaire: {
    color: '#079DA6',
    fontSize: 15,
    fontWeight: 'bold',
  },

  grille: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'space-between',
    gap: 12,
    marginTop: 25,
  },

  carte: {
    width: '48%',
    minHeight: 110,
    backgroundColor: '#FFFFFF',
    borderRadius: 14,
    padding: 15,
    alignItems: 'center',
    justifyContent: 'center',
    gap: 10,
    elevation: 2,
    shadowColor: '#000000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08,
    shadowRadius: 4,
  },

  texteBadge: {
    color: '#183568',
    fontSize: 13,
    fontWeight: '600',
    textAlign: 'center',
  },

  encadre: {
    backgroundColor: '#E5F7F7',
    borderRadius: 14,
    padding: 17,
    marginTop: 25,
  },

  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    marginBottom: 12,
  },

  descriptionEncadre: {
    color: '#526078',
    fontSize: 14,
    lineHeight: 22,
  },
});