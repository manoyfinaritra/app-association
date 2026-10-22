import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet, Linking, Alert, ScrollView, Platform } from 'react-native';
import { Ionicons } from '@expo/vector-icons';

export default function Guide() {

  const ouvrirGuideYoutube = async () => {
    const url = 'https://www.youtube.com/@niryinfo9800';
    try {
      const supported = await Linking.canOpenURL(url);
      if (supported) {
        await Linking.openURL(url);
      } else {
        Alert.alert("Erreur", "Impossible d'ouvrir ce lien sur votre appareil.");
      }
    } catch (error) {
      Alert.alert("Erreur", "Une erreur est survenue lors de l'ouverture du lien.");
    }
  };

 

  return (
    <ScrollView style={styles.container} contentContainerStyle={styles.content}>
      {/* En-tête de bienvenue */}
      <View style={styles.header}>
        <Text style={styles.title}>Mon espace client</Text>
        
        {/* Ici, nous imbriquons le texte pour colorer "AEM" en vert */}
        <Text style={styles.subtitle}>
          Bienvenue dans votre tableau de bord <Text style={styles.aemText}>AEM</Text>.
        </Text>
      </View>

      {/* Carte Guide YouTube */}
      <TouchableOpacity 
        style={styles.guideCard} 
        onPress={ouvrirGuideYoutube}
        activeOpacity={0.8}
      >
        <View style={styles.iconContainer}>
          <Ionicons name="logo-youtube" size={32} color="#FF0000" />
        </View>
        
        <View style={styles.textContainer}>
          <Text style={styles.guideTitle}>Guide Vidéo</Text>
          <Text style={styles.guideDescription}>
            Découvrez comment utiliser l'application et les actualités de l'association sur notre chaîne YouTube.
          </Text>
        </View>

        <Ionicons name="chevron-forward" size={24} color="#8994A5" style={styles.arrowIcon} />
      </TouchableOpacity>

    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F4F9FA',
  },
  content: {
    padding: 20,
    paddingTop: Platform.OS === 'ios' ? 10 : 20,
  },
  header: {
    marginBottom: 25,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#073B5C',
    marginBottom: 8,
  },
  subtitle: {
    fontSize: 15,
    color: '#526078',
    lineHeight: 22,
  },
  
  // Le style pour le mot AEM en vert
  aemText: {
    color: '#10B981', // Vert émeraude
    fontWeight: 'bold', // Optionnel : pour le mettre un peu plus en valeur
  },

  // Styles de la carte Guide
  guideCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    padding: 20,
    flexDirection: 'row',
    alignItems: 'center',
    borderWidth: 1,
    borderColor: '#DCE5ED',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.05,
    shadowRadius: 8,
    elevation: 3,
  },
  iconContainer: {
    width: 55,
    height: 55,
    borderRadius: 12,
    backgroundColor: '#FFEBEE',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 15,
  },
  textContainer: {
    flex: 1,
    paddingRight: 10,
  },
  guideTitle: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#183568',
    marginBottom: 4,
  },
  guideDescription: {
    fontSize: 13,
    color: '#64748B',
    lineHeight: 18,
  },
  arrowIcon: {
    marginLeft: 'auto',
  },
});