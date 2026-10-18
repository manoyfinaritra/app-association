import { Ionicons } from '@expo/vector-icons';
import { router } from 'expo-router';
import React from 'react';
 
import { Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';

export default function Accueil() {
  return (
    <ScrollView
      style={styles.fond}
      contentContainerStyle={styles.contenu}
      showsVerticalScrollIndicator={false}
    >
     

      {/* Présentation */}
      <Text style={styles.titre}>
        L'entraide, Simplement, où que vous soyez !
      </Text>

      <Text style={styles.description}>
        Que vous soyez étudiant, professionnel ou particulier, l'Association
        d'Entraide Madagascar vous accompagne : formations, événements,
        cotisations transparentes et une communauté qui avance ensemble.
      </Text>

      {/* Boutons */}
      <Pressable
        style={styles.boutonPrincipal}
        onPress={() => router.navigate('/inscription')}
      >
        <Text style={styles.textePrincipal}>Devenir membre</Text>
        <Ionicons name="arrow-forward" size={21} color="#fff" />
      </Pressable>

      <Pressable
        style={styles.boutonSecondaire}
        onPress={() => router.navigate('/avantages')}
      >
        <Text style={styles.texteSecondaire}>Découvrir l'association</Text>
      </Pressable>

      {/* Avantages */}
      <View style={styles.grille}>
        <Carte icone="book-outline" titre="Formations" />
        <Carte icone="calendar-outline" titre="Événements" />
        <Carte icone="wallet-outline" titre="Cotisations suivies" />
        <Carte icone="people-outline" titre="Communauté" />
      </View>

      {/* Présentation de l'association */}
      <View style={styles.encadre}>
        <View style={styles.badge}>
          <Ionicons name="people" size={19} color="#079DA6" />
          <Text style={styles.texteBadge}>Ensemble, avançons !</Text>
        </View>

        <Text style={styles.descriptionEncadre}>
          Une communauté solidaire pour apprendre, partager et construire un
          avenir meilleur.
        </Text>
      </View>
    </ScrollView>
  );
}
// Composant Carte réutilisable 
function Carte({icone,titre}) {
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
    backgroundColor: '#FFFFFF',
  },
  contenu: {
    padding: 20,
    paddingTop: 28,
    paddingBottom: 30,
  },
  logo: {
    flexDirection: 'culumn',
    alignItems: 'start',
    marginBottom: 35,
    justifyContent :" start",
    borderBottomWidth : 1,
    paddingVertical : 5
  },
  iconeLogo: {
    width: 52,
    height: 52,
    borderRadius: 26,
    backgroundColor: '#E5F7F7',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10,
  },
  nomLogo: {
    fontSize: 10,
    fontWeight: 'bold',
    color: '#079DA6',
    flexShrink: 1,
  },
  sousLogo: {
    fontSize: 10,
    color: '#1E3A5F',
  },
  titre: {
    fontSize: 29,
    fontWeight: 'bold',
    color: '#183568',
    textAlign: 'center',
    lineHeight: 36,
    marginBottom: 20,
  },
  description: {
    fontSize: 16,
    lineHeight: 26,
    color: '#526078',
    textAlign: 'center',
    marginBottom: 25,
  },
  boutonPrincipal: {
    backgroundColor: '#079DA6',
    borderRadius: 12,
    padding: 17,
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
    padding: 16,
    alignItems: 'center',
    marginBottom: 30,
  },
  texteSecondaire: {
    color: '#079DA6',
    fontSize: 16,
    fontWeight: '600',
  },
  grille: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'space-between',
    gap: 12,
  },
  carte: {
    width: '48%',
    flexGrow: 1,
    flexBasis: '44%',
    minHeight: 105,
    backgroundColor: '#EFFAFA',
    borderRadius: 16,
    padding: 15,
    justifyContent: 'center',
    gap: 10,
  },
  encadre: {
    marginTop: 25,
    padding: 20,
    backgroundColor: '#F3F7FC',
    borderRadius: 18,
  },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    alignSelf: 'flex-start',
    backgroundColor: '#FFFFFF',
    padding: 10,
    borderRadius: 20,
    marginBottom: 12,
  },
  texteBadge: {
    color: '#183568',
    fontWeight: '600',
  },
  titreEncadre: {
    color: '#183568',
    fontSize: 21,
    fontWeight: 'bold',
    marginTop: 18,
    marginBottom: 8,
  },
  descriptionEncadre: {
    fontSize: 15,
    lineHeight: 23,
    color: '#526078',
  },
});
