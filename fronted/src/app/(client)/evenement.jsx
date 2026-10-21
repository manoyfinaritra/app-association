// app/client/evenement.jsx
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

// Génération des jours pour le calendrier d'Octobre 2026 (qui commence un jeudi)
// 1er Oct 2026 = Jeudi. Le mois a 31 jours.
const JOURS_SEMAINE = ['lun.', 'mar.', 'mer.', 'jeu.', 'ven.', 'sam.', 'dim.'];
const CALENDRIER_OCTOBRE_2026 = [
  // Semaine 1 (du 28 sept au 4 oct)
  { jour: 28, mois: 'prev' }, { jour: 29, mois: 'prev' }, { jour: 30, mois: 'prev' }, 
  { jour: 1, mois: 'current' }, { jour: 2, mois: 'current' }, { jour: 3, mois: 'current' }, { jour: 4, mois: 'current' },
  // Semaine 2
  { jour: 5, mois: 'current' }, { jour: 6, mois: 'current' }, { jour: 7, mois: 'current' }, 
  { jour: 8, mois: 'current' }, { jour: 9, mois: 'current' }, { jour: 10, mois: 'current' }, { jour: 11, mois: 'current' },
  // Semaine 3
  { jour: 12, mois: 'current' }, { jour: 13, mois: 'current' }, { jour: 14, mois: 'current' }, 
  { jour: 15, mois: 'current' }, { jour: 16, mois: 'current' }, { jour: 17, mois: 'current' }, { jour: 18, mois: 'current' },
  // Semaine 4
  { jour: 19, mois: 'current' }, { jour: 20, mois: 'current' }, { jour: 21, mois: 'current', aujourdhui: true }, 
  { jour: 22, mois: 'current' }, { jour: 23, mois: 'current' }, { jour: 24, mois: 'current' }, { jour: 25, mois: 'current' },
  // Semaine 5
  { jour: 26, mois: 'current' }, { jour: 27, mois: 'current' }, { jour: 28, mois: 'current' }, 
  { jour: 29, mois: 'current' }, { jour: 30, mois: 'current' }, { jour: 31, mois: 'current' }, { jour: 1, mois: 'next' },
  // Semaine 6
  { jour: 2, mois: 'next' }, { jour: 3, mois: 'next' }, { jour: 4, mois: 'next' }, 
  { jour: 5, mois: 'next' }, { jour: 6, mois: 'next' }, { jour: 7, mois: 'next' }, { jour: 8, mois: 'next' },
];

export default function EvenementScreen() {
  const navigation = useNavigation();
  const [vue, setVue] = useState('mois'); // 'mois' ou 'liste'

  return (
    <View style={styles.container}>
      {/* Header personnalisé */}
      <View style={styles.header}>
        <TouchableOpacity onPress={() => navigation.openDrawer()}>
          <Ionicons name="menu" size={28} color="#073B5C" />
        </TouchableOpacity>
        <Text style={styles.headerTitle}>Événements</Text>
        <View style={{ width: 28 }} />
      </View>

      <ScrollView contentContainerStyle={styles.content} showsVerticalScrollIndicator={false}>
        
        {/* Titre et Badge */}
        <View style={styles.titleSection}>
          <View>
            <Text style={styles.title}>Événements</Text>
            <Text style={styles.subtitle}>Calendrier des événements de l'association.</Text>
          </View>
          <View style={styles.badge}>
            <Text style={styles.badgeText}>2 événements</Text>
          </View>
        </View>

        {/* Barre de recherche et Filtres (scrollables horizontalement) */}
        <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.filtersScroll} contentContainerStyle={styles.filtersContainer}>
          <View style={styles.searchContainer}>
            <Ionicons name="search" size={20} color="#8994A5" style={styles.searchIcon} />
            <TextInput
              style={styles.searchInput}
              placeholder="Thème, lieu, description..."
              placeholderTextColor="#8994A5"
            />
          </View>
          <TouchableOpacity style={styles.filterDropdown}>
            <Text style={styles.filterText}>Tous les lieux</Text>
            <Ionicons name="chevron-down" size={16} color="#526078" />
          </TouchableOpacity>
          <TouchableOpacity style={styles.filterDropdown}>
            <Text style={styles.filterText}>Tous les status</Text>
            <Ionicons name="chevron-down" size={16} color="#526078" />
          </TouchableOpacity>
          <TouchableOpacity style={styles.filterButtonClose}>
             <Ionicons name="close" size={16} color="#526078" />
          </TouchableOpacity>
          <View style={styles.legendContainer}>
            <View style={[styles.dot, { backgroundColor: '#079DA6' }]} />
            <Text style={styles.legendText}>À venir</Text>
            <View style={[styles.dot, { backgroundColor: '#F59E0B' }]} />
            <Text style={styles.legendText}>Aujourd'hui</Text>
            <View style={[styles.dot, { backgroundColor: '#8994A5' }]} />
            <Text style={styles.legendText}>Passé</Text>
          </View>
        </ScrollView>

        {/* En-tête du Calendrier (Navigation et Vue Mois/Liste) */}
        <View style={styles.calendarHeader}>
          <View style={styles.calendarNav}>
            <TouchableOpacity style={styles.navButton}>
              <Ionicons name="chevron-back" size={20} color="#fff" />
            </TouchableOpacity>
            <TouchableOpacity style={styles.navButton}>
              <Ionicons name="chevron-forward" size={20} color="#fff" />
            </TouchableOpacity>
            <TouchableOpacity style={styles.todayButton}>
              <Text style={styles.todayButtonText}>Aujourd'hui</Text>
            </TouchableOpacity>
          </View>

          <Text style={styles.monthTitle}>octobre 2026</Text>

          <View style={styles.viewToggle}>
            <TouchableOpacity 
              style={[styles.toggleButton, vue === 'mois' && styles.toggleActive]} 
              onPress={() => setVue('mois')}
            >
              <Text style={[styles.toggleText, vue === 'mois' && styles.toggleTextActive]}>Mois</Text>
            </TouchableOpacity>
            <TouchableOpacity 
              style={[styles.toggleButton, vue === 'liste' && styles.toggleActive]} 
              onPress={() => setVue('liste')}
            >
              <Text style={[styles.toggleText, vue === 'liste' && styles.toggleTextActive]}>Liste</Text>
            </TouchableOpacity>
          </View>
        </View>

        {/* Le Calendrier (Vue Mois) */}
        {vue === 'mois' && (
          <View style={styles.calendarContainer}>
            {/* Jours de la semaine */}
            <View style={styles.weekDaysRow}>
              {JOURS_SEMAINE.map((jour, index) => (
                <View key={index} style={styles.weekDayCell}>
                  <Text style={styles.weekDayText}>{jour}</Text>
                </View>
              ))}
            </View>

            {/* Grille des jours */}
            <View style={styles.daysGrid}>
              {CALENDRIER_OCTOBRE_2026.map((item, index) => (
                <View 
                  key={index} 
                  style={[
                    styles.dayCell, 
                    item.mois !== 'current' && styles.dayCellOutside,
                    item.aujourdhui && styles.dayCellToday
                  ]}
                >
                  <Text style={[
                    styles.dayText,
                    item.mois !== 'current' && styles.dayTextOutside,
                    item.aujourdhui && styles.dayTextToday
                  ]}>
                    {item.jour}
                  </Text>
                </View>
              ))}
            </View>
          </View>
        )}

        {/* Message si vue Liste sélectionnée (vide pour l'instant) */}
        {vue === 'liste' && (
           <View style={styles.emptyList}>
             <Ionicons name="calendar-outline" size={50} color="#DCE5ED" />
             <Text style={styles.emptyText}>Aucun événement à afficher sous forme de liste.</Text>
           </View>
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
  content: { padding: 15 },
  
  titleSection: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 15,
  },
  title: { fontSize: 24, fontWeight: 'bold', color: '#073B5C', marginBottom: 5 },
  subtitle: { fontSize: 13, color: '#526078' },
  badge: { backgroundColor: '#E5F7F7', paddingHorizontal: 12, paddingVertical: 6, borderRadius: 15 },
  badgeText: { fontSize: 12, color: '#079DA6', fontWeight: '600' },

  // Filtres
  filtersScroll: { marginBottom: 15, maxHeight: 50 },
  filtersContainer: { gap: 10, alignItems: 'center' },
  searchContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#fff',
    borderRadius: 8,
    paddingHorizontal: 12,
    borderWidth: 1,
    borderColor: '#DCE5ED',
    height: 40,
    width: 200,
  },
  searchIcon: { marginRight: 8 },
  searchInput: { flex: 1, fontSize: 13, color: '#183568' },
  filterDropdown: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#fff',
    paddingHorizontal: 12,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#DCE5ED',
    height: 40,
    gap: 8,
  },
  filterText: { fontSize: 13, color: '#526078' },
  filterButtonClose: {
    backgroundColor: '#fff',
    paddingHorizontal: 10,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#DCE5ED',
    height: 40,
    justifyContent: 'center',
  },
  legendContainer: { flexDirection: 'row', alignItems: 'center', gap: 5, marginLeft: 10 },
  dot: { width: 8, height: 8, borderRadius: 4 },
  legendText: { fontSize: 11, color: '#526078', marginRight: 8 },

  // En-tête du calendrier
  calendarHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 15,
    flexWrap: 'wrap',
    gap: 10,
  },
  calendarNav: { flexDirection: 'row', alignItems: 'center', gap: 5 },
  navButton: { backgroundColor: '#0F766E', padding: 8, borderRadius: 6 },
  todayButton: { backgroundColor: '#0F766E', paddingHorizontal: 12, paddingVertical: 8, borderRadius: 6 },
  todayButtonText: { color: '#fff', fontSize: 12, fontWeight: 'bold' },
  monthTitle: { fontSize: 18, fontWeight: 'bold', color: '#073B5C', textTransform: 'capitalize' },
  viewToggle: { flexDirection: 'row', backgroundColor: '#0F766E', borderRadius: 6, overflow: 'hidden' },
  toggleButton: { paddingHorizontal: 15, paddingVertical: 8 },
  toggleActive: { backgroundColor: '#073B5C' },
  toggleText: { color: '#fff', fontSize: 12, fontWeight: 'bold' },
  toggleTextActive: { color: '#fff' },

  // Grille du calendrier
  calendarContainer: {
    backgroundColor: '#fff',
    borderRadius: 12,
    borderWidth: 1,
    borderColor: '#DCE5ED',
    overflow: 'hidden',
    marginBottom: 20,
  },
  weekDaysRow: {
    flexDirection: 'row',
    backgroundColor: '#F8FAFC',
    borderBottomWidth: 1,
    borderBottomColor: '#DCE5ED',
  },
  weekDayCell: { flex: 1, paddingVertical: 10, alignItems: 'center' },
  weekDayText: { fontSize: 12, color: '#526078', fontWeight: '600' },
  daysGrid: { flexDirection: 'row', flexWrap: 'wrap' },
  dayCell: {
    width: `${100 / 7}%`, // 7 colonnes parfaites
    aspectRatio: 1, // Cases carrées
    alignItems: 'center',
    justifyContent: 'center',
    borderWidth: 0.5,
    borderColor: '#F1F5F9',
  },
  dayCellOutside: { backgroundColor: '#F8FAFC' },
  dayCellToday: { backgroundColor: '#E5F7F7' }, // Surlignage pour aujourd'hui
  dayText: { fontSize: 14, color: '#183568' },
  dayTextOutside: { color: '#CBD5E1' },
  dayTextToday: { fontWeight: 'bold', color: '#079DA6' },

  // État vide pour la liste
  emptyList: { backgroundColor: '#fff', padding: 40, borderRadius: 12, alignItems: 'center', borderWidth: 1, borderColor: '#DCE5ED' },
  emptyText: { marginTop: 15, fontSize: 14, color: '#8994A5', textAlign: 'center' },
});