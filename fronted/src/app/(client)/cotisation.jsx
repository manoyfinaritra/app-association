// app/client/cotisations.jsx
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

// Données fictives (noms génériques comme demandé)
const COTISATIONS_DATA = [
  { id: 1, nom: 'Membre 001', montant: '5 000 Ar', periode: 'Décembre 2026', date: '10 septembre 2026', statut: 'En attente' },
  { id: 2, nom: 'Membre 002', montant: '5 000 Ar', periode: 'Décembre 2026', date: '6 août 2026', statut: 'En attente' },
  { id: 3, nom: 'Membre 003', montant: '5 000 Ar', periode: 'Décembre 2026', date: '1 juillet 2026', statut: 'Confirmée' },
  { id: 4, nom: 'Membre 004', montant: '2 000 Ar', periode: 'Décembre 2026', date: '17 mars 2026', statut: 'Confirmée' },
  { id: 5, nom: 'Membre 005', montant: '10 000 Ar', periode: 'Novembre 2026', date: '5 mars 2026', statut: 'Confirmée' },
];

export default function CotisationsScreen() {
  const navigation = useNavigation();

  return (
    <View style={styles.container}>
      {/* Header */}
      <View style={styles.header}>
        <TouchableOpacity onPress={() => navigation.openDrawer()}>
          <Ionicons name="menu" size={28} color="#073B5C" />
        </TouchableOpacity>
        <Text style={styles.headerTitle}>Cotisations</Text>
        <View style={{ width: 28 }} />
      </View>

      <ScrollView contentContainerStyle={styles.content} showsVerticalScrollIndicator={false}>
        
        {/* Titre */}
        <View style={styles.titleSection}>
          <View>
            <Text style={styles.title}>Cotisations</Text>
            <Text style={styles.subtitle}>Suivi des cotisations des membres de l'association.</Text>
          </View>
          <View style={styles.badge}>
            <Text style={styles.badgeText}>495 cotisations</Text>
          </View>
        </View>

        {/* Cartes de Statistiques (Revenus, Dépenses, Solde) */}
        <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.statsScroll} contentContainerStyle={styles.statsContainer}>
          
          <View style={[styles.statCard, { borderLeftColor: '#10B981' }]}>
            <Text style={styles.statLabel}>TOTAL DES REVENUS</Text>
            <Text style={styles.statValue}>3 080 300 Ar</Text>
            <View style={styles.statTrend}>
              <Ionicons name="caret-up" size={12} color="#10B981" />
              <Text style={[styles.statTrendText, { color: '#10B981' }]}>2.79% ce mois</Text>
            </View>
          </View>

          <View style={[styles.statCard, { borderLeftColor: '#EF4444' }]}>
            <Text style={styles.statLabel}>TOTAL DES DÉPENSES</Text>
            <Text style={styles.statValue}>720 000 Ar</Text>
            <View style={styles.statTrend}>
              <Ionicons name="caret-down" size={12} color="#EF4444" />
              <Text style={[styles.statTrendText, { color: '#EF4444' }]}>0% ce mois</Text>
            </View>
          </View>

          <View style={[styles.statCard, { borderLeftColor: '#073B5C' }]}>
            <Text style={styles.statLabel}>SOLDE NET</Text>
            <Text style={styles.statValue}>2 360 300 Ar</Text>
            <View style={styles.statTrend}>
              <Ionicons name="caret-up" size={12} color="#10B981" />
              <Text style={[styles.statTrendText, { color: '#10B981' }]}>3.64% ce mois</Text>
            </View>
          </View>
        </ScrollView>

        {/* Filtres */}
        <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.filtersScroll} contentContainerStyle={styles.filtersContainer}>
          <View style={styles.searchContainer}>
            <Ionicons name="search" size={20} color="#8994A5" style={styles.searchIcon} />
            <TextInput style={styles.searchInput} placeholder="Nom du membre..." placeholderTextColor="#8994A5" />
          </View>
          <TouchableOpacity style={styles.filterDropdown}><Text style={styles.filterText}>Tous les mois</Text><Ionicons name="chevron-down" size={16} color="#526078" /></TouchableOpacity>
          <TouchableOpacity style={styles.filterDropdown}><Text style={styles.filterText}>Toutes les années</Text><Ionicons name="chevron-down" size={16} color="#526078" /></TouchableOpacity>
          <TouchableOpacity style={styles.filterDropdown}><Text style={styles.filterText}>Tous les statuts</Text><Ionicons name="chevron-down" size={16} color="#526078" /></TouchableOpacity>
          <TouchableOpacity style={styles.filterDropdown}><Text style={styles.filterText}>Plus récentes</Text><Ionicons name="chevron-down" size={16} color="#526078" /></TouchableOpacity>
          <TouchableOpacity style={styles.filterButton}><Text style={styles.filterButtonText}>Filtrer</Text></TouchableOpacity>
        </ScrollView>

        {/* Liste des cotisations */}
        <View style={styles.listHeader}>
          <Text style={styles.listTitle}>Liste des cotisations</Text>
          <Text style={styles.listCount}>495 entrées</Text>
        </View>

        <View style={styles.tableContainer}>
          {/* En-tête du tableau (visible sur grand écran, mais on l'adapte ici en mode carte) */}
          <View style={styles.tableHeader}>
            <Text style={[styles.tableHeaderText, { flex: 2 }]}>Membre</Text>
            <Text style={[styles.tableHeaderText, { flex: 1, textAlign: 'right' }]}>Montant</Text>
            <Text style={[styles.tableHeaderText, { flex: 1, textAlign: 'right' }]}>Statut</Text>
          </View>

          {COTISATIONS_DATA.map((item) => (
            <View key={item.id} style={styles.tableRow}>
              <View style={styles.rowLeft}>
                <View style={styles.avatarPlaceholder}>
                  <Ionicons name="person" size={18} color="#fff" />
                </View>
                <View style={styles.rowInfo}>
                  <Text style={styles.memberName}>{item.nom}</Text>
                  <Text style={styles.memberDetails}>{item.date} • {item.periode}</Text>
                </View>
              </View>
              
              <View style={styles.rowRight}>
                <Text style={styles.montantText}>{item.montant}</Text>
                <View style={[
                  styles.statusBadge, 
                  item.statut === 'En attente' ? styles.statusAttente : styles.statusConfirmee
                ]}>
                  <Text style={[
                    styles.statusText,
                    item.statut === 'En attente' ? styles.statusTextAttente : styles.statusTextConfirmee
                  ]}>
                    {item.statut}
                  </Text>
                </View>
              </View>
            </View>
          ))}
        </View>

      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#F4F9FA' },
  header: {
    flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between',
    paddingHorizontal: 20, paddingTop: Platform.OS === 'ios' ? 50 : 20, paddingBottom: 15,
    backgroundColor: '#fff', elevation: 2,
  },
  headerTitle: { fontSize: 18, fontWeight: 'bold', color: '#073B5C' },
  content: { padding: 15, paddingBottom: 40 },

  titleSection: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 20 },
  title: { fontSize: 24, fontWeight: 'bold', color: '#073B5C', marginBottom: 5 },
  subtitle: { fontSize: 13, color: '#526078' },
  badge: { backgroundColor: '#E5F7F7', paddingHorizontal: 12, paddingVertical: 6, borderRadius: 15 },
  badgeText: { fontSize: 12, color: '#079DA6', fontWeight: '600' },

  // Statistiques
  statsScroll: { marginBottom: 20 },
  statsContainer: { gap: 10, paddingRight: 15 },
  statCard: { backgroundColor: '#fff', borderRadius: 10, padding: 15, width: 200, borderLeftWidth: 4, elevation: 2 },
  statLabel: { fontSize: 10, color: '#8994A5', fontWeight: 'bold', marginBottom: 8 },
  statValue: { fontSize: 20, fontWeight: 'bold', color: '#183568', marginBottom: 8 },
  statTrend: { flexDirection: 'row', alignItems: 'center', gap: 4 },
  statTrendText: { fontSize: 11, fontWeight: '600' },

  // Filtres
  filtersScroll: { marginBottom: 20, maxHeight: 45 },
  filtersContainer: { gap: 8, alignItems: 'center' },
  searchContainer: { flexDirection: 'row', alignItems: 'center', backgroundColor: '#fff', borderRadius: 8, paddingHorizontal: 12, borderWidth: 1, borderColor: '#DCE5ED', height: 40, width: 180 },
  searchIcon: { marginRight: 8 },
  searchInput: { flex: 1, fontSize: 13, color: '#183568' },
  filterDropdown: { flexDirection: 'row', alignItems: 'center', backgroundColor: '#fff', paddingHorizontal: 12, borderRadius: 8, borderWidth: 1, borderColor: '#DCE5ED', height: 40, gap: 6 },
  filterText: { fontSize: 12, color: '#526078' },
  filterButton: { backgroundColor: '#0F766E', paddingHorizontal: 16, borderRadius: 8, height: 40, justifyContent: 'center' },
  filterButtonText: { color: '#fff', fontSize: 13, fontWeight: 'bold' },

  listHeader: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', marginBottom: 10 },
  listTitle: { fontSize: 16, fontWeight: 'bold', color: '#183568' },
  listCount: { fontSize: 12, color: '#8994A5' },

  // Tableau
  tableContainer: { backgroundColor: '#fff', borderRadius: 10, borderWidth: 1, borderColor: '#DCE5ED', overflow: 'hidden' },
  tableHeader: { flexDirection: 'row', backgroundColor: '#F8FAFC', padding: 12, borderBottomWidth: 1, borderBottomColor: '#DCE5ED' },
  tableHeaderText: { fontSize: 12, fontWeight: 'bold', color: '#526078' },
  
  tableRow: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', padding: 15, borderBottomWidth: 1, borderBottomColor: '#F1F5F9' },
  rowLeft: { flex: 1, flexDirection: 'row', alignItems: 'center', gap: 10 },
  avatarPlaceholder: { width: 35, height: 35, borderRadius: 18, backgroundColor: '#073B5C', justifyContent: 'center', alignItems: 'center' },
  rowInfo: { flex: 1 },
  memberName: { fontSize: 14, fontWeight: 'bold', color: '#183568', marginBottom: 2 },
  memberDetails: { fontSize: 11, color: '#8994A5' },
  
  rowRight: { alignItems: 'flex-end', gap: 4 },
  montantText: { fontSize: 14, fontWeight: 'bold', color: '#10B981' },
  statusBadge: { paddingHorizontal: 8, paddingVertical: 3, borderRadius: 10 },
  statusAttente: { backgroundColor: '#FEF3C7' },
  statusConfirmee: { backgroundColor: '#D1FAE5' },
  statusText: { fontSize: 10, fontWeight: 'bold' },
  statusTextAttente: { color: '#D97706' },
  statusTextConfirmee: { color: '#059669' },
});