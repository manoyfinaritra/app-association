// app/client/document.jsx
import React, { useState } from 'react';
import {
  View,
  Text,
  TextInput,
  ScrollView,
  TouchableOpacity,
  StyleSheet,
  Platform,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { useNavigation } from 'expo-router';

export default function DocumentScreen() {
  const navigation = useNavigation();
  const [recherche, setRecherche] = useState('');

  // Données fictives pour l'exemple
  const documents = [
    {
      id: 1,
      nom: 'PARTAGE D\'EXPERIENCE HORS-SOL AEM1.pdf',
      type: 'PDF',
      date: '27 juillet 2026',
      taille: '2.4 MB',
    },
  ];

  return (
    <View style={styles.container}>
      {/* Header personnalisé */}
      <View style={styles.header}>
        <TouchableOpacity onPress={() => navigation.openDrawer()}>
          <Ionicons name="menu" size={28} color="#073B5C" />
        </TouchableOpacity>
        <Text style={styles.headerTitle}>Documents</Text>
        <View style={{ width: 28 }} /> {/* Pour équilibrer */}
      </View>

      <ScrollView contentContainerStyle={styles.content}>
        {/* Titre de la section */}
        <View style={styles.titleSection}>
          <Text style={styles.title}>Documents</Text>
          <View style={styles.badge}>
            <Text style={styles.badgeText}>1 document</Text>
          </View>
        </View>
        <Text style={styles.subtitle}>Ressources et fichiers publiés par l'association.</Text>

        {/* Barre de recherche et filtres */}
        <View style={styles.filtersContainer}>
          <View style={styles.searchContainer}>
            <Ionicons name="search" size={20} color="#8994A5" style={styles.searchIcon} />
            <TextInput
              style={styles.searchInput}
              placeholder="Nom du fichier..."
              value={recherche}
              onChangeText={setRecherche}
            />
          </View>
          <TouchableOpacity style={styles.filterButton}>
            <Ionicons name="funnel-outline" size={20} color="#079DA6" />
          </TouchableOpacity>
        </View>

        {/* Liste des documents */}
        <Text style={styles.listTitle}>Liste des documents</Text>
        
        {documents.map((doc) => (
          <View key={doc.id} style={styles.documentCard}>
            <View style={styles.docHeader}>
              <View style={styles.fileIcon}>
                <Ionicons name="document-text" size={24} color="#D32F2F" />
              </View>
              <View style={styles.docInfo}>
                <Text style={styles.docName} numberOfLines={1}>{doc.nom}</Text>
                <View style={styles.docMeta}>
                  <Text style={styles.docType}>{doc.type}</Text>
                  <Text style={styles.docDate}>{doc.date}</Text>
                </View>
              </View>
            </View>
            <TouchableOpacity style={styles.downloadButton}>
              <Ionicons name="download-outline" size={18} color="#fff" />
              <Text style={styles.downloadText}>Télécharger</Text>
            </TouchableOpacity>
          </View>
        ))}

        {documents.length === 0 && (
          <Text style={styles.emptyText}>Aucun document trouvé.</Text>
        )}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#F4F9FA' },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 20,
    paddingTop: Platform.OS === 'ios' ? 50 : 20,
    paddingBottom: 15,
    backgroundColor: '#fff',
    elevation: 2,
  },
  headerTitle: { fontSize: 18, fontWeight: 'bold', color: '#073B5C' },
  content: { padding: 20 },
  titleSection: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', marginBottom: 5 },
  title: { fontSize: 24, fontWeight: 'bold', color: '#073B5C' },
  badge: { backgroundColor: '#E5F7F7', paddingHorizontal: 10, paddingVertical: 4, borderRadius: 12 },
  badgeText: { fontSize: 12, color: '#079DA6', fontWeight: '600' },
  subtitle: { fontSize: 14, color: '#526078', marginBottom: 20 },
  filtersContainer: { flexDirection: 'row', gap: 10, marginBottom: 20 },
  searchContainer: { flex: 1, flexDirection: 'row', alignItems: 'center', backgroundColor: '#fff', borderRadius: 8, paddingHorizontal: 12, borderWidth: 1, borderColor: '#DCE5ED' },
  searchIcon: { marginRight: 8 },
  searchInput: { flex: 1, paddingVertical: 12, fontSize: 14, color: '#183568' },
  filterButton: { backgroundColor: '#fff', padding: 12, borderRadius: 8, borderWidth: 1, borderColor: '#DCE5ED', justifyContent: 'center', alignItems: 'center' },
  listTitle: { fontSize: 16, fontWeight: 'bold', color: '#183568', marginBottom: 10 },
  documentCard: { backgroundColor: '#fff', borderRadius: 12, padding: 15, marginBottom: 15, elevation: 2, shadowColor: '#000', shadowOffset: { width: 0, height: 2 }, shadowOpacity: 0.05, shadowRadius: 4 },
  docHeader: { flexDirection: 'row', alignItems: 'center', marginBottom: 15 },
  fileIcon: { backgroundColor: '#FFEBEE', padding: 10, borderRadius: 8, marginRight: 12 },
  docInfo: { flex: 1 },
  docName: { fontSize: 14, fontWeight: 'bold', color: '#183568', marginBottom: 4 },
  docMeta: { flexDirection: 'row', alignItems: 'center', gap: 10 },
  docType: { fontSize: 12, color: '#D32F2F', fontWeight: '600' },
  docDate: { fontSize: 12, color: '#8994A5' },
  downloadButton: { flexDirection: 'row', alignItems: 'center', justifyContent: 'center', backgroundColor: '#079DA6', paddingVertical: 10, borderRadius: 8, gap: 8 },
  downloadText: { color: '#fff', fontSize: 14, fontWeight: 'bold' },
  emptyText: { textAlign: 'center', color: '#8994A5', marginTop: 20 },
});