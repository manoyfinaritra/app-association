import React, { useState } from 'react';
import { 
  View, 
  Text, 
  StyleSheet, 
  TextInput, 
  TouchableOpacity, 
  Image 
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Calendar } from 'react-native-calendars'; // Bibliothèque pour le calendrier
import { useLanguage } from '../context/LanguageContext';
import { useAuth } from '../context/AuthContext';

export default function EcranEvenements() {
  const { utilisateur } = useAuth();
  const [recherche, setRecherche] = useState('');
  const [vueActive, setVueActive] = useState('Mois'); // 'Mois' ou 'Liste'

  // Thème personnalisé pour correspondre à la capture
  const calendarTheme = {
    backgroundColor: '#ffffff',
    calendarBackground: '#ffffff',
    textSectionTitleColor: '#b6c1cd',
    selectedDayBackgroundColor: '#0D5C5F',
    selectedDayTextColor: '#ffffff',
    todayTextColor: '#0D5C5F',
    dayTextColor: '#2d4150',
    textDisabledColor: '#d9e1e8',
    arrowColor: '#0D5C5F',
    monthTextColor: '#333',
    textMonthFontWeight: 'bold',
    textDayFontSize: 14,
    textMonthFontSize: 16,
  };

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
        <Text style={styles.filAriane}>Accueil &gt; Événements</Text>
        
        <View style={styles.headerRow}>
          <View>
            <Text style={styles.titrePage}>Événements</Text>
            <Text style={styles.sousTitrePage}>Calendrier des événements de l'association.</Text>
          </View>
          <View style={styles.badgeCompteur}>
            <Text style={styles.texteBadge}>2 événements</Text>
          </View>
        </View>

        {/* Barre de recherche et Filtres */}
        <View style={styles.filtresContainer}>
          <TextInput
            style={styles.inputRecherche}
            placeholder="Thème, lieu, description..."
            placeholderTextColor="#999"
            value={recherche}
            onChangeText={setRecherche}
          />
          <TouchableOpacity style={styles.filtreDropdown}>
            <Text style={styles.texteFiltre}>Tous les lieux ▼</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.filtreDropdown}>
            <Text style={styles.texteFiltre}>Tous les statuts ▼</Text>
          </TouchableOpacity>
        </View>

        {/* Légende des statuts */}
        <View style={styles.legendeContainer}>
          <View style={styles.legendeItem}><View style={[styles.point, {backgroundColor: '#0D5C5F'}]} /><Text>À venir</Text></View>
          <View style={styles.legendeItem}><View style={[styles.point, {backgroundColor: '#F59E0B'}]} /><Text>Aujourd'hui</Text></View>
          <View style={styles.legendeItem}><View style={[styles.point, {backgroundColor: '#9CA3AF'}]} /><Text>Passé</Text></View>
        </View>

        {/* Conteneur du Calendrier */}
        <View style={styles.calendrierContainer}>
          <View style={styles.calendrierHeader}>
            <View style={styles.navButtons}>
              <TouchableOpacity style={styles.btnNav}><Text style={styles.btnNavText}>{'<'}</Text></TouchableOpacity>
              <TouchableOpacity style={styles.btnNav}><Text style={styles.btnNavText}>{'>'}</Text></TouchableOpacity>
              <TouchableOpacity style={styles.btnAujourdhui}><Text style={styles.btnAujourdhuiText}>Aujourd'hui</Text></TouchableOpacity>
            </View>
            
            {/* Switch Mois / Liste */}
            <View style={styles.switchVue}>
              <TouchableOpacity 
                style={[styles.switchBtn, vueActive === 'Mois' && styles.switchBtnActive]}
                onPress={() => setVueActive('Mois')}
              >
                <Text style={[styles.switchText, vueActive === 'Mois' && styles.switchTextActive]}>Mois</Text>
              </TouchableOpacity>
              <TouchableOpacity 
                style={[styles.switchBtn, vueActive === 'Liste' && styles.switchBtnActive]}
                onPress={() => setVueActive('Liste')}
              >
                <Text style={[styles.switchText, vueActive === 'Liste' && styles.switchTextActive]}>Liste</Text>
              </TouchableOpacity>
            </View>
          </View>

          {vueActive === 'Mois' ? (
            <Calendar
              theme={calendarTheme}
              style={styles.calendar}
              onDayPress={(day) => console.log('selected day', day)}
            />
          ) : (
            <Text style={{textAlign: 'center', padding: 20, color: '#888'}}>Vue liste à implémenter</Text>
          )}
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
  filtresContainer: { flexDirection: 'row', flexWrap: 'wrap', gap: 10, marginBottom: 15 },
  inputRecherche: { flex: 1, minWidth: 150, backgroundColor: '#ffffff', borderWidth: 1, borderColor: '#ddd', borderRadius: 8, paddingHorizontal: 15, paddingVertical: 10 },
  filtreDropdown: { backgroundColor: '#ffffff', borderWidth: 1, borderColor: '#ddd', borderRadius: 8, paddingHorizontal: 12, paddingVertical: 10 },
  texteFiltre: { fontSize: 12, color: '#555' },
  legendeContainer: { flexDirection: 'row', gap: 15, marginBottom: 15 },
  legendeItem: { flexDirection: 'row', alignItems: 'center', gap: 5 },
  point: { width: 8, height: 8, borderRadius: 4 },
  calendrierContainer: { flex: 1, backgroundColor: '#ffffff', borderRadius: 12, padding: 15, shadowColor: '#000', shadowOpacity: 0.05, shadowRadius: 4, elevation: 2 },
  calendrierHeader: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', marginBottom: 15 },
  navButtons: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  btnNav: { padding: 8, backgroundColor: '#F3F4F6', borderRadius: 6 },
  btnNavText: { color: '#0D5C5F', fontWeight: 'bold' },
  btnAujourdhui: { paddingHorizontal: 12, paddingVertical: 8, backgroundColor: '#F3F4F6', borderRadius: 6 },
  btnAujourdhuiText: { color: '#333', fontSize: 12, fontWeight: '600' },
  switchVue: { flexDirection: 'row', backgroundColor: '#F3F4F6', borderRadius: 6, padding: 2 },
  switchBtn: { paddingHorizontal: 15, paddingVertical: 6, borderRadius: 4 },
  switchBtnActive: { backgroundColor: '#073B5C' },
  switchText: { fontSize: 12, color: '#666' },
  switchTextActive: { color: '#fff', fontWeight: 'bold' },
  calendar: { borderRadius: 8 },
});