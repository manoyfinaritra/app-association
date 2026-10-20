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

// Liste vide pour correspondre à votre capture d'écran
const FORMATIONS_MOCK = [];

export default function EcranFormations() {
  const { language } = useLanguage();
  const { utilisateur } = useAuth();
  const [recherche, setRecherche] = useState('');

  // Filtrage des formations (vide pour l'instant)
  const formationsFiltrees = FORMATIONS_MOCK.filter(f => 
    f.titre?.toLowerCase().includes(recherche.toLowerCase())
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
        <Text style={styles.filAriane}>Accueil &gt; Formations</Text>
        
        <View style={styles.headerRow}>
          <View>
            <Text style={styles.titrePage}>Formations</Text>
            <Text style={styles.sousTitrePage}>Formations proposées par l'association.</Text>
          </View>
          
          {/* Bouton Ajouter */}
          <View style={styles.actionsHeader}>
            <View style={styles.badgeCompteur}>
              <Text style={styles.texteBadge}>{formationsFiltrees.length} formations</Text>
            </View>
            <TouchableOpacity style={styles.boutonAjouter}>
              <Text style={styles.texteBoutonAjouter}>Ajouter une formation</Text>
            </TouchableOpacity>
          </View>
        </View>

        {/* Barre de recherche et Filtres */}
        <View style={styles.filtresContainer}>
          <TextInput
            style={styles.inputRecherche}
            placeholder="Thème, lieu, intervenant..."
            placeholderTextColor="#999"
            value={recherche}
            onChangeText={setRecherche}
          />
          <TouchableOpacity style={styles.boutonFiltre}>
            <Text style={styles.texteBoutonFiltre}>Filtrer</Text>
          </TouchableOpacity>
        </View>

        {/* Liste des formations */}
        <View style={styles.listeContainer}>
          <View style={styles.enteteListe}>
            <Text style={styles.titreListe}>Liste des formations</Text>
            <Text style={styles.compteur}>{formationsFiltrees.length} entrées</Text>
          </View>

          {/* Rendu conditionnel : Empty State si aucune formation */}
          {formationsFiltrees.length === 0 ? (
            <View style={styles.emptyState}>
              {/* Icône de chapeau de diplômé (Remplacer par une vraie icône type FontAwesome) */}
              <Text style={styles.emptyIcone}>🎓</Text>
              <Text style={styles.emptyTexte}>Aucune formation disponible pour le moment.</Text>
            </View>
          ) : (
            <FlatList
              data={formationsFiltrees}
              keyExtractor={(item) => item.id}
              renderItem={({ item }) => (
                <View style={styles.carteFormation}>
                  {/* Contenu de la carte formation ici */}
                  <Text>{item.titre}</Text>
                </View>
              )}
            />
          )}
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
    color: '#078330',
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
    marginBottom: 10,
  },
  headerRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 20,
    flexWrap: 'wrap',
    gap: 10,
  },
  titrePage: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#073B5C',
    marginBottom: 5,
  },
  sousTitrePage: {
    fontSize: 14,
    color: '#666',
  },
  actionsHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
  },
  badgeCompteur: {
    backgroundColor: '#E5E7EB',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 20,
  },
  texteBadge: {
    fontSize: 12,
    color: '#4B5563',
    fontWeight: '600',
  },
  boutonAjouter: {
    backgroundColor: '#0D5C5F',
    paddingHorizontal: 16,
    paddingVertical: 10,
    borderRadius: 8,
  },
  texteBoutonAjouter: {
    color: '#ffffff',
    fontWeight: 'bold',
    fontSize: 13,
  },
  filtresContainer: {
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
    backgroundColor: '#0D5C5F',
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
  // Styles pour l'état vide (Empty State)
  emptyState: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingVertical: 50,
  },
  emptyIcone: {
    fontSize: 50, // Taille de l'icône chapeau
    marginBottom: 15,
    opacity: 0.5,
  },
  emptyTexte: {
    fontSize: 14,
    color: '#888',
    textAlign: 'center',
  }
});