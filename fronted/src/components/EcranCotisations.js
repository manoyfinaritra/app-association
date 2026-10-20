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
import { useAuth } from '../context/AuthContext';

// Données mockées
const COTISATIONS_MOCK = [
  { id: '1', nom: 'Jeram Jeram', montant: '5 000 Ar', periode: 'Décembre 2026', date: '10 septembre 2026', statut: 'En attente', sousStatut: 'En attente de clôture' },
  { id: '2', nom: 'Honorine Antonine RAZANAKOLONA', montant: '5 000 Ar', periode: 'Décembre 2026', date: '6 août 2026', statut: 'En attente', sousStatut: 'En attente de clôture' },
  { id: '3', nom: 'Maria Lalatiana RAHARIMAHASOA', montant: '5 000 Ar', periode: 'Décembre 2026', date: '1 juillet 2026', statut: 'Confirmée', sousStatut: '' },
  { id: '4', nom: 'Sitraka Ramarokoto', montant: '2 000 Ar', periode: 'Décembre 2026', date: '17 mars 2026', statut: 'Confirmée', sousStatut: '' },
];

export default function EcranCotisations() {
  const { utilisateur } = useAuth();
  const [recherche, setRecherche] = useState('');

  const cotisationsFiltrees = COTISATIONS_MOCK.filter(c => 
    c.nom.toLowerCase().includes(recherche.toLowerCase())
  );

  return (
    <SafeAreaView edges={['top', 'left', 'right']} style={styles.page}>
      {/* En-tête */}
      <View style={styles.entete}>
        <View style={styles.logoContainer}>
          <Image source={require('../../assets/logo.png')} style={styles.logo} />
          <Text style={styles.logoTexte}>AEM</Text>
        </View>
        <View style={styles.userInfo}>
          <Text style={styles.userTexte}>Bonjour, {utilisateur?.nom || 'Josoa'} 👋</Text>
        </View>
      </View>

      <View style={styles.contenu}>
        <Text style={styles.filAriane}>Accueil &gt; Cotisations</Text>
        
        <View style={styles.headerRow}>
          <View>
            <Text style={styles.titrePage}>Cotisations</Text>
            <Text style={styles.sousTitrePage}>Suivi des cotisations des membres de l'association.</Text>
          </View>
          <View style={styles.badgeCompteur}>
            <Text style={styles.texteBadge}>475 cotisations</Text>
          </View>
        </View>

        {/* Cartes de Statistiques */}
        <View style={styles.statsContainer}>
          <View style={styles.statCard}>
            <Text style={styles.statLabel}>TOTAL DES REVENUS</Text>
            <Text style={styles.statValeur}>3 006 300 <Text style={styles.statDevise}>Ar</Text></Text>
            <Text style={styles.statTrendUp}>▲ 1.33% ce mois</Text>
          </View>
          <View style={styles.statCard}>
            <Text style={styles.statLabel}>TOTAL DES DÉPENSES</Text>
            <Text style={styles.statValeur}>720 000 <Text style={styles.statDevise}>Ar</Text></Text>
            <Text style={styles.statTrendDown}>▼ 0% ce mois</Text>
          </View>
          <View style={styles.statCard}>
            <Text style={styles.statLabel}>SOLDE NET</Text>
            <Text style={styles.statValeur}>2 286 300 <Text style={styles.statDevise}>Ar</Text></Text>
            <Text style={styles.statTrendUp}>▲ 1.75% ce mois</Text>
          </View>
        </View>

        {/* Filtres */}
        <View style={styles.filtresContainer}>
          <TextInput
            style={styles.inputRecherche}
            placeholder="Nom du membre..."
            placeholderTextColor="#999"
            value={recherche}
            onChangeText={setRecherche}
          />
          {/* Sur mobile, on regroupe souvent les filtres dans un bouton pour gagner de la place */}
          <TouchableOpacity style={styles.boutonFiltre}>
            <Text style={styles.texteBoutonFiltre}>Filtrer</Text>
          </TouchableOpacity>
        </View>

        {/* Liste des cotisations */}
        <View style={styles.listeContainer}>
          <View style={styles.enteteListe}>
            <Text style={styles.titreListe}>Liste des cotisations</Text>
            <Text style={styles.compteur}>{cotisationsFiltrees.length} entrées</Text>
          </View>

          <FlatList
            data={cotisationsFiltrees}
            keyExtractor={(item) => item.id}
            renderItem={({ item }) => (
              <View style={styles.carteCotisation}>
                <View style={styles.ligneHaut}>
                  {/* Avatar (remplacé par une initiale pour l'exemple) */}
                  <View style={styles.avatar}>
                    <Text style={styles.avatarText}>{item.nom.charAt(0)}</Text>
                  </View>
                  <View style={styles.infoMembre}>
                    <Text style={styles.nomMembre} numberOfLines={1}>{item.nom}</Text>
                    <Text style={styles.detailTexte}>Période: {item.periode}</Text>
                  </View>
                  <Text style={styles.montant}>{item.montant}</Text>
                </View>
                
                <View style={styles.ligneBas}>
                  <Text style={styles.dateTexte}>Payé le {item.date}</Text>
                  <View style={[styles.badgeStatut, item.statut === 'Confirmée' ? styles.statutConfirme : styles.statutAttente]}>
                    <Text style={[styles.texteStatut, item.statut === 'Confirmée' ? styles.texteStatutConfirme : styles.texteStatutAttente]}>
                      {item.statut}
                    </Text>
                  </View>
                </View>
              </View>
            )}
          />
        </View>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  page: { flex: 1, backgroundColor: '#F4F9FA' },
  entete: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', paddingHorizontal: 20, paddingVertical: 15, backgroundColor: '#ffffff', borderBottomWidth: 1, borderBottomColor: '#e2e8f0' },
  logoContainer: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  logo: { width: 32, height: 32, resizeMode: 'contain' },
  logoTexte: { fontSize: 20, fontWeight: 'bold', color: '#078330' },
  userTexte: { fontSize: 14, color: '#555' },
  contenu: { flex: 1, padding: 20 },
  filAriane: { fontSize: 12, color: '#888', marginBottom: 10 },
  headerRow: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 20 },
  titrePage: { fontSize: 24, fontWeight: 'bold', color: '#073B5C', marginBottom: 5 },
  sousTitrePage: { fontSize: 14, color: '#666' },
  badgeCompteur: { backgroundColor: '#E5E7EB', paddingHorizontal: 12, paddingVertical: 6, borderRadius: 20 },
  texteBadge: { fontSize: 12, color: '#4B5563', fontWeight: '600' },
  
  // Styles pour les stats
  statsContainer: { flexDirection: 'row', flexWrap: 'wrap', gap: 10, marginBottom: 20 },
  statCard: { flex: 1, minWidth: '30%', backgroundColor: '#ffffff', padding: 15, borderRadius: 8, borderLeftWidth: 4, borderLeftColor: '#0D5C5F', shadowColor: '#000', shadowOpacity: 0.03, shadowRadius: 3, elevation: 1 },
  statLabel: { fontSize: 10, color: '#888', fontWeight: 'bold', marginBottom: 5 },
  statValeur: { fontSize: 18, fontWeight: 'bold', color: '#073B5C' },
  statDevise: { fontSize: 12, fontWeight: 'normal', color: '#666' },
  statTrendUp: { fontSize: 10, color: '#059669', marginTop: 5 },
  statTrendDown: { fontSize: 10, color: '#DC2626', marginTop: 5 },

  // Filtres
  filtresContainer: { flexDirection: 'row', gap: 10, marginBottom: 20 },
  inputRecherche: { flex: 1, backgroundColor: '#ffffff', borderWidth: 1, borderColor: '#ddd', borderRadius: 8, paddingHorizontal: 15, paddingVertical: 10 },
  boutonFiltre: { backgroundColor: '#0D5C5F', paddingHorizontal: 20, paddingVertical: 12, borderRadius: 8 },
  texteBoutonFiltre: { color: '#ffffff', fontWeight: 'bold', fontSize: 14 },

  // Liste
  listeContainer: { flex: 1, backgroundColor: '#ffffff', borderRadius: 12, padding: 15, shadowColor: '#000', shadowOpacity: 0.05, shadowRadius: 4, elevation: 2 },
  enteteListe: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', marginBottom: 15, borderBottomWidth: 1, borderBottomColor: '#eee', paddingBottom: 10 },
  titreListe: { fontSize: 16, fontWeight: 'bold', color: '#333' },
  compteur: { fontSize: 12, color: '#888' },

  // Carte Cotisation (Remplace la ligne du tableau)
  carteCotisation: { paddingVertical: 12, borderBottomWidth: 1, borderBottomColor: '#f0f0f0' },
  ligneHaut: { flexDirection: 'row', alignItems: 'center', marginBottom: 8 },
  avatar: { width: 36, height: 36, borderRadius: 18, backgroundColor: '#E5E7EB', justifyContent: 'center', alignItems: 'center', marginRight: 12 },
  avatarText: { fontSize: 16, fontWeight: 'bold', color: '#555' },
  infoMembre: { flex: 1, paddingRight: 10 },
  nomMembre: { fontSize: 14, fontWeight: '600', color: '#333' },
  detailTexte: { fontSize: 12, color: '#888', marginTop: 2 },
  montant: { fontSize: 14, fontWeight: 'bold', color: '#073B5C' },
  ligneBas: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', paddingLeft: 48 },
  dateTexte: { fontSize: 11, color: '#888' },
  
  // Badges de statut
  badgeStatut: { paddingHorizontal: 10, paddingVertical: 4, borderRadius: 12 },
  statutConfirme: { backgroundColor: '#D1FAE5' }, // Vert clair
  statutAttente: { backgroundColor: '#FEF3C7' }, // Jaune clair
  texteStatut: { fontSize: 10, fontWeight: 'bold' },
  texteStatutConfirme: { color: '#065F46' },
  texteStatutAttente: { color: '#92400E' },
});