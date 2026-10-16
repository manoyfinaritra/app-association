import { useState } from 'react';
import { View, Text, Pressable, StyleSheet } from 'react-native';
import {
  SafeAreaProvider,
  SafeAreaView,
} from 'react-native-safe-area-context';

const onglets = ['Accueil', 'Rapports', 'Profil'];

export default function App() {
  const [page, setPage] = useState('Accueil');

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        {/* Contenu de l’onglet sélectionné */}
        <View style={styles.contenu}>
          {page === 'Accueil' && (
            <Text style={styles.titre}>Bienvenue Manoy !</Text>
          )}

          {page === 'Rapports' && (
            <Text style={styles.titre}>Mes rapports</Text>
          )}

          {page === 'Profil' && (
            <Text style={styles.titre}>Mon profil</Text>
          )}
        </View>

        {/* Barre de navigation en bas */}
        <View style={styles.barre}>
          {onglets.map((onglet) => {
            const actif = page === onglet;

            return (
              <Pressable
                key={onglet}
                onPress={() => setPage(onglet)}
                accessibilityRole="tab"
                accessibilityState={{ selected: actif }}
                style={[
                  styles.bouton,
                  actif && styles.boutonActif,
                ]}
              >
                <Text
                  style={[
                    styles.texte,
                    actif && styles.texteActif,
                  ]}
                >
                  {onglet}
                </Text>
              </Pressable>
            );
          })}
        </View>
      </SafeAreaView>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#ffffff',
  },

  contenu: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },

  titre: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#1e293b',
  },

  barre: {
    flexDirection: 'row',
    borderTopWidth: 1,
    borderTopColor: '#e2e8f0',
    padding: 8,
    backgroundColor: '#ffffff',
  },

  bouton: {
    flex: 1,
    paddingVertical: 16,
    alignItems: 'center',
    borderRadius: 12,
  },

  boutonActif: {
    backgroundColor: '#dbeafe',
  },

  texte: {
    color: '#64748b',
    fontWeight: '600',
  },

  texteActif: {
    color: '#2563eb',
  },
});