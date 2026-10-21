import React, { useState,useEffect } from 'react';
import api from '../../components/api/api';
import { Linking } from 'react-native';
import {
  View,
  Text,
  TextInput,
  ScrollView,
  Pressable,
  StyleSheet,
  Alert,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';

// Exemple temporaire : nous connecterons ensuite le backend.
const documents = [
  {
    id: 1,
    nom: "PARTAGE D'EXPERIENCE HORS-SOL AEM1.pdf",
    type: 'PDF',
    date: '27 juillet 2026',
  },
];

export default function DocumentScreen() {
  const [recherche, setRecherche] = useState('');
  const [documents, setDocuments] = useState([]);
  const documentsFiltres = documents.filter((document) =>
    document.nom
      .toLowerCase()
      .includes(recherche.trim().toLowerCase())
  );




useEffect(() => {
  async function chargerDocuments() {
    try {
      const response = await api.get('/client/documents');
      setDocuments(response.data.donnees);
    } catch (erreur) {
      Alert.alert(
        'Documents',
        erreur.response?.data?.message ||
        'Impossible de charger les documents.'
      );
    }
  }

  chargerDocuments();
}, []);

// Remplace par l’adresse réelle du site qui héberge les PDF.
// Exemple : http://192.168.10.154/association/AEM/public/
const URL_SITE_PHP = 'https://association-entraide-madagascar.mg/';

const telecharger = async (id) => {
  try {
    const document = documents.find(
      (element) => String(element.id) === String(id)
    );

    if (!document?.chemin) {
      Alert.alert('Document', 'Le chemin du fichier est introuvable.');
      return;
    }

    if (!URL_SITE_PHP) {
      Alert.alert(
        'Configuration',
        'Renseigne l’adresse du site PHP dans URL_SITE_PHP.'
      );
      return;
    }

    const url =
      URL_SITE_PHP.replace(/\/+$/, '') +
      '/' +
      document.chemin.replace(/^\/+/, '');

    await Linking.openURL(url);
  } catch (error) {
    Alert.alert(
      'Erreur',
      'Impossible d’ouvrir le document. Vérifiez l’adresse du serveur.'
    );
  }
};
  return (
    <ScrollView
      style={styles.container}
      contentContainerStyle={styles.contenu}
      keyboardShouldPersistTaps="handled"
      keyboardDismissMode="on-drag"
      showsVerticalScrollIndicator={false}
    >
      <View style={styles.ligneTitre}>
        <Text style={styles.titre}>Documents</Text>

        <View style={styles.badge}>
          <Text style={styles.texteBadge}>
            {documentsFiltres.length}{' '}
            {documentsFiltres.length > 1 ? 'documents' : 'document'}
          </Text>
        </View>
      </View>

      <Text style={styles.sousTitre}>
        Ressources et fichiers publiés par l’association.
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
          placeholder="Rechercher un document..."
          placeholderTextColor="#8994A5"
          value={recherche}
          onChangeText={setRecherche}
          autoCorrect={false}
          returnKeyType="search"
          accessibilityLabel="Rechercher un document"
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

      {/* Documents */}
      {documentsFiltres.map((document) => (
        <View key={document.id} style={styles.carte}>
          <View style={styles.ligneDocument}>
            <View style={styles.iconeFichier}>
              <Ionicons
                name="document-text-outline"
                size={27}
                color="#D32F2F"
              />
            </View>

            <View style={styles.informations}>
              <Text style={styles.nomDocument}>
                {document.nom}
              </Text>

              <Text style={styles.dateDocument}>  
                {document.date ? String(document.date).slice(0, 10) : ''}
              </Text>
            </View>
          </View>

          <Pressable
            onPress={() => telecharger(document.id)}
            accessibilityRole="button"
            style={({ pressed }) => [
              styles.bouton,
              pressed && styles.boutonAppuye,
            ]}
          >
            <Ionicons
              name="open-outline"
              size={18}
              color="#FFFFFF"
            />

            <Text style={styles.texteBouton}>
             Ouvrir ce fichier
            </Text>
          </Pressable>
        </View>
      ))}

      {/* Recherche sans résultat */}
      {documentsFiltres.length === 0 && (
        <View style={styles.etatVide}>
          <Ionicons
            name="folder-open-outline"
            size={42}
            color="#8994A5"
          />

          <Text style={styles.texteVide}>
            Aucun document trouvé.
          </Text>
        </View>
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
  ligneTitre: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    gap: 12,
    marginBottom: 8,
  },
  titre: {
    flexShrink: 1,
    fontSize: 24,
    fontWeight: 'bold',
    color: '#073B5C',
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
  sousTitre: {
    fontSize: 14,
    lineHeight: 21,
    color: '#526078',
    marginBottom: 20,
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
    marginBottom: 20,
  },
  champRecherche: {
    flex: 1,
    paddingVertical: 14,
    fontSize: 14,
    color: '#183568',
  },
  carte: {
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    padding: 16,
    marginBottom: 15,
    borderWidth: 1,
    borderColor: '#E6EDF2',
  },
  ligneDocument: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: 12,
    marginBottom: 18,
  },
  iconeFichier: {
    backgroundColor: '#FFEBEE',
    padding: 12,
    borderRadius: 12,
  },
  informations: {
    flex: 1,
  },
  nomDocument: {
    fontSize: 14,
    lineHeight: 21,
    fontWeight: 'bold',
    color: '#183568',
    marginBottom: 6,
  },
  dateDocument: {
    fontSize: 12,
    lineHeight: 18,
    color: '#64748B',
  },
  bouton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    backgroundColor: '#079DA6',
    paddingVertical: 13,
    paddingHorizontal: 12,
    borderRadius: 10,
  },
  boutonAppuye: {
    opacity: 0.75,
  },
  texteBouton: {
    flexShrink: 1,
    textAlign: 'center',
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '600',
  },
  etatVide: {
    alignItems: 'center',
    paddingVertical: 35,
  },
  texteVide: {
    textAlign: 'center',
    color: '#64748B',
    fontSize: 14,
    marginTop: 12,
  },
});