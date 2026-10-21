
// app/client/formation.jsx
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

export default function FormationScreen() {
  const navigation = useNavigation();
  const [recherche, setRecherche] = useState('');
  const [formations, setFormations] = useState([]); 
  return (
    <View style={styles.container}>
      {/* Header personnalisé avec bouton menu */}
      <View style={styles.header}>
        <TouchableOpacity onPress={() => navigation.openDrawer()}>
          <Ionicons name="menu" size={28} color="#073B5C" />
        </TouchableOpacity>
        <Text style={styles.headerTitle}>Formations</Text>
        <View style={{ width: 28 }} />
      </View>

      <ScrollView contentContainerStyle={styles.content} showsVerticalScrollIndicator={false}>
        
        {/* En-tête de section */}
        <View style={styles.titleSection}>
          <View>
            <Text style={styles.title}>Formations</Text>
            <Text style={styles.subtitle}>Formations proposées par l'association.</Text>
          </View>
          
          <View style={styles.actionContainer}>
            <View style={styles.badge}>
              <Text style={styles.badgeText}>{formations.length} formations</Text>
            </View>
            <TouchableOpacity style={styles.addButton}>
              <Text style={styles.addButtonText}>Ajouter une formation</Text>
            </TouchableOpacity>
          </View>
        </View>

        {/* Barre de recherche et Filtres */}
        <View style={styles.filtersContainer}>
          <View style={styles.searchContainer}>
            <Ionicons name="search" size={20} color="#8994A5" style={styles.searchIcon} />
            <TextInput
              style={styles.searchInput}
              placeholder="Thème, lieu, intervenant..."
              placeholderTextColor="#8994A5"
              value={recherche}
              onChangeText={setRecherche}
            />
          </View>
          <TouchableOpacity style={styles.filterDropdown}>
            <Text style={styles.filterText}>Tous les statuts</Text>
            <Ionicons name="chevron-down" size={16} color="#526078" />
          </TouchableOpacity>
          <TouchableOpacity style={styles.filterDate}>
            <Ionicons name="calendar-outline" size={18} color="#526078" />
            <Text style={styles.filterText}>jj/mm/aaaa</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.filterDate}>
            <Ionicons name="calendar-outline" size={18} color="#526078" />
            <Text style={styles.filterText}>jj/mm/aaaa</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.filterDropdown}>
            <Text style={styles.filterText}>Plus récentes</Text>
            <Ionicons name="chevron-down" size={16} color="#526078" />
          </TouchableOpacity>
          <TouchableOpacity style={styles.filterButton}>
            <Text style={styles.filterButtonText}>Filtrer</Text>
          </TouchableOpacity>
        </View>

        {/* Titre de la liste */}
        <View style={styles.listHeader}>
          <Text style={styles.listTitle}>Liste des formations</Text>
          <Text style={styles.listCount}>{formations.length} entrées</Text>
        </View>

        {/* Contenu : Liste ou État Vide */}
        <View style={styles.listContainer}>
          {formations.length === 0 ? (
            // État vide (Empty State) correspondant à la capture
            <View style={styles.emptyState}>
              <Ionicons name="school-outline" size={50} color="#DCE5ED" />
              <Text style={styles.emptyText}>
                Aucune formation disponible pour le moment.
              </Text>
            </View>
          ) : (
            // Affichage de la liste si des données existent
            formations.map((item) => (
              <View key={item.id} style={styles.itemCard}>
                <View style={styles.itemHeader}>
                  <Text style={styles.itemTitle}>{item.titre}</Text>
                  <View style={styles.statusBadge}>
                    <Text style={styles.statusText}>{item.statut}</Text>
                  </View>
                </View>
                <View style={styles.itemDetails}>
                  <Ionicons name="person-outline" size={16} color="#526078" />
                  <Text style={styles.itemText}>{item.intervenant}</Text>
                </View>
                <View style={styles.itemDetails}>
                  <Ionicons name="location-outline" size={16} color="#526078" />
                  <Text style={styles.itemText}>{item.lieu}</Text>
                </View>
                <View style={styles.itemDetails}>
                  <Ionicons name="calendar-outline" size={16} color="#526078" />
                  <Text style={styles.itemText}>{item.date}</Text>
                </View>
              </View>
            ))
          )}
        </View>

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
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.05,
    shadowRadius: 3,
  },
  headerTitle: { fontSize: 18, fontWeight: 'bold', color: '#073B5C' },
  content: { padding: 20 },
  
  titleSection: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 20,
    flexWrap: 'wrap',
    gap: 10,
  },
  title: { fontSize: 24, fontWeight: 'bold', color: '#073B5C', marginBottom: 5 },
  subtitle: { fontSize: 14, color: '#526078' },
  actionContainer: { flexDirection: 'row', alignItems: 'center', gap: 10 },
  badge: { backgroundColor: '#E5F7F7', paddingHorizontal: 10, paddingVertical: 6, borderRadius: 12 },
  badgeText: { fontSize: 12, color: '#079DA6', fontWeight: '600' },
  addButton: { backgroundColor: '#0F766E', paddingHorizontal: 15, paddingVertical: 10, borderRadius: 8 },
  addButtonText: { color: '#fff', fontSize: 13, fontWeight: 'bold' },

  filtersContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 10,
    marginBottom: 25,
    alignItems: 'center',
  },
  searchContainer: {
    flex: 1,
    minWidth: '100%', // Prend toute la largeur sur mobile
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#fff',
    borderRadius: 8,
    paddingHorizontal: 12,
    borderWidth: 1,
    borderColor: '#DCE5ED',
  },
  searchIcon: { marginRight: 8 },
  searchInput: { flex: 1, paddingVertical: 12, fontSize: 14, color: '#183568' },
  filterDropdown: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#fff',
    paddingHorizontal: 12,
    paddingVertical: 10,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#DCE5ED',
    gap: 8,
  },
  filterDate: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#fff',
    paddingHorizontal: 12,
    paddingVertical: 10,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#DCE5ED',
    gap: 8,
  },
  filterText: { fontSize: 13, color: '#526078' },
  filterButton: {
    backgroundColor: '#0F766E',
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 8,
    justifyContent: 'center',
  },
  filterButtonText: { color: '#fff', fontSize: 13, fontWeight: 'bold' },

  listHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 10,
  },
  listTitle: { fontSize: 16, fontWeight: 'bold', color: '#183568' },
  listCount: { fontSize: 13, color: '#8994A5' },

  listContainer: {
    backgroundColor: '#fff',
    borderRadius: 12,
    borderWidth: 1,
    borderColor: '#DCE5ED',
    minHeight: 250, // Assure que l'état vide a de la place
    justifyContent: 'center',
  },

  // Styles pour l'état vide (Empty State)
  emptyState: {
    alignItems: 'center',
    justifyContent: 'center',
    padding: 40,
  },
  emptyText: {
    marginTop: 15,
    fontSize: 14,
    color: '#8994A5',
    textAlign: 'center',
  },

  // Styles pour les cartes de formation (si la liste n'est pas vide)
  itemCard: {
    padding: 15,
    borderBottomWidth: 1,
    borderBottomColor: '#DCE5ED',
  },
  itemHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 10,
  },
  itemTitle: { fontSize: 16, fontWeight: 'bold', color: '#183568', flex: 1 },
  statusBadge: {
    backgroundColor: '#E5F7F7',
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 6,
  },
  statusText: { fontSize: 11, color: '#079DA6', fontWeight: 'bold' },
  itemDetails: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 5,
    gap: 8,
  },
  itemText: { fontSize: 13, color: '#526078' },
});