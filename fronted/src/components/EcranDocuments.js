import React, { useState } from 'react';
import { 
  View, 
  Text, 
  StyleSheet, 
  TextInput, 
  TouchableOpacity, 
  FlatList, 
  Image 
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useLanguage } from '../context/LanguageContext';
//import { useAuth } from '../context/AuthContext'; 

// Données mockées pour l'exemple
const DOCUMENTS_MOCK = [
  {
    id: '1',
    type: 'PDF',
    nom: "PARTAGE D'EXPERIENCE HORS-SOL AEM1.pdf",
    date: '27 juillet 2026',
  }
];

export default function EcranDocuments() {
  const { language, t } = useLanguage();
  //const { utilisateur } = useAuth();
  const [recherche, setRecherche] = useState('');

  const documentsFiltres = DOCUMENTS_MOCK.filter(doc => 
    doc.nom.toLowerCase().includes(recherche.toLowerCase())
  );

  return (
    <SafeAreaView edges={['top', 'left', 'right']} style={styles.page}>
      {/* En-tête avec logo et profil */}
      <View style={styles.entete}>
        <View style={styles.logoContainer}>
          <Image source={require('../../assets/logo.png')} style={styles.logo} />
          <Text style={styles.logoTexte}>AEM</Text>
        </View>
        <View style={styles.userInfo}>
          <Text style={styles.userTexte}>Bonjour, {utilisateur?.nom || 'Josoa'} 👋</Text>
        </View>
      </View>

      {/* Contenu principal */}
      <View style={styles.contenu}>
        {/* Fil d'Ariane et Titre */}
        <Text style={styles.filAriane}>Accueil &gt; Documents</Text>
        <Text style={styles.titrePage}>Documents</Text>
        <Text style={styles.sousTitrePage}>Ressources et fichiers publiés par l'association.</Text>

        {/* Barre de recherche et Filtres */}
        <View style={styles.barreRechercheContainer}>
          <TextInput
            style={styles.inputRecherche}
            placeholder="Nom du fichier..."
            placeholderTextColor="#999"
            value={recherche}
            onChangeText={setRecherche}
          />
          <TouchableOpacity style={styles.boutonFiltre}>
            <Text style={styles.texteBoutonFiltre}>Filtrer</Text>
          </TouchableOpacity>
        </View>

        {/* Liste des documents */}
        <View style={styles.listeContainer}>
          <View style={styles.enteteListe}>
            <Text style={styles.titreListe}>Liste des documents</Text>
            <Text style={styles.compteur}>{documentsFiltres.length} document(s)</Text>
          </View>

          <FlatList
            data={documentsFiltres}
            keyExtractor={(item) => item.id}
            renderItem={({ item }) => (
              <View style={styles.carteDocument}>
                <View style={styles.docInfo}>
                  <View style={styles.iconePdf}>
                    <Text style={styles.texteIconePdf}>PDF</Text>
                  </View>
                  <View style={styles.docDetails}>
                    <Text style={styles.nomFichier}>{item.nom}</Text>
                    <Text style={styles.dateFichier}>{item.date}</Text>
                  </View>
                </View>
                <TouchableOpacity style={styles.boutonTelecharger}>
                  <Text style={styles.texteTelecharger}>Télécharger</Text>
                </TouchableOpacity>
              </View>
            )}
            ListEmptyComponent={
              <Text style={styles.aucunDocument}>Aucun document trouvé.</Text>
            }
          />
        </View>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  page: {
    flex: 1,
    backgroundColor: '#F4F9FA', 
  },
  entete: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 20,
    paddingVertical: 15,
    backgroundColor: '#ffffff',
    borderBottomWidth: 1,
    borderBottomColor: '#e2e8f0',
  },
  logoContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  logo: {
    width: 32,
    height: 32,
    resizeMode: 'contain',
  },
  logoTexte: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#078330', // Vert AEM
  },
  userInfo: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  userTexte: {
    fontSize: 14,
    color: '#555',
  },
  contenu: {
    flex: 1,
    padding: 20,
  },
  filAriane: {
    fontSize: 12,
    color: '#888',
    marginBottom: 5,
  },
  titrePage: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#073B5C', // Bleu foncé
    marginBottom: 5,
  },
  sousTitrePage: {
    fontSize: 14,
    color: '#666',
    marginBottom: 20,
  },
  barreRechercheContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 20,
    gap: 10,
  },
  inputRecherche: {
    flex: 1,
    backgroundColor: '#ffffff',
    borderWidth: 1,
    borderColor: '#ddd',
    borderRadius: 8,
    paddingHorizontal: 15,
    paddingVertical: 10,
    fontSize: 14,
  },
  boutonFiltre: {
    backgroundColor: '#0D5C5F', // Vert foncé/Teal
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 8,
  },
  texteBoutonFiltre: {
    color: '#ffffff',
    fontWeight: 'bold',
    fontSize: 14,
  },
  listeContainer: {
    flex: 1,
    backgroundColor: '#ffffff',
    borderRadius: 12,
    padding: 15,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 2,
  },
  enteteListe: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 15,
    borderBottomWidth: 1,
    borderBottomColor: '#eee',
    paddingBottom: 10,
  },
  titreListe: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#333',
  },
  compteur: {
    fontSize: 12,
    color: '#888',
  },
  carteDocument: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingVertical: 15,
    borderBottomWidth: 1,
    borderBottomColor: '#f0f0f0',
  },
  docInfo: {
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
  },
  iconePdf: {
    backgroundColor: '#FFE5E5',
    padding: 8,
    borderRadius: 6,
    marginRight: 15,
  },
  texteIconePdf: {
    color: '#D32F2F',
    fontWeight: 'bold',
    fontSize: 12,
  },
  docDetails: {
    flex: 1,
  },
  nomFichier: {
    fontSize: 14,
    fontWeight: '600',
    color: '#333',
    marginBottom: 4,
  },
  dateFichier: {
    fontSize: 12,
    color: '#888',
  },
  boutonTelecharger: {
    backgroundColor: '#0D5C5F',
    paddingHorizontal: 15,
    paddingVertical: 8,
    borderRadius: 6,
  },
  texteTelecharger: {
    color: '#ffffff',
    fontSize: 12,
    fontWeight: 'bold',
  },
  aucunDocument: {
    textAlign: 'center',
    color: '#888',
    marginTop: 20,
  },
});