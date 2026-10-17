import { StyleSheet, Text, View,TouchableOpacity, Touchable } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

// Le logo et la mise en page sont communs à tous les onglets.
export default function EcranOnglet(props) {
  return (
    <SafeAreaView edges={['top', 'left', 'right']} style={styles.page}>
      <View style={styles.entete}>
        <View>
          <Text style={styles.logo} accessibilityLabel="AEM">AEM</Text>
          <Text style={styles.sousTitre}>Association-d'Étudiants-Madagascar</Text>
        </View>

        <TouchableOpacity style={styles.boutonConnexion}>
          <Text style={styles.texteBoutonConnexion}>Se connecter</Text>
        </TouchableOpacity>
      </View>

      <View style={styles.contenu}>
        <Text accessibilityRole="header" style={styles.titre}>
          {props.titre}
        </Text>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  page: {
    flex: 1,
    backgroundColor: '#ffffff',
  },
  entete: {
    paddingHorizontal: 20,
    paddingVertical: 16,
    alignItems: 'flex-start',
    borderBottomWidth: 1,
    borderBottomColor: '#e2e8f0',
    backgroundColor: '#ffffff',
    justifyContent: 'space-between',
    flexDirection: 'row',
  },
  logo: {
    fontSize: 28,
    fontWeight: '800',
    letterSpacing: 2,
    color: '#2563eb',
  },
  contenu: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    backgroundColor: '#ffffff',
  },
  titre: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#1e293b',
    textAlign: 'center',
  },
  sousTitre: {
    fontSize: 10,
    color: '#64748b',
    textAlign: 'center',

  },
  boutonConnexion: {
    backgroundColor: '#2563eb',
    paddingVertical: 8,
    paddingHorizontal: 16,
    borderRadius: 4,
  },
  texteBoutonConnexion: {
    color: '#ffffff',
    fontSize: 16,
    fontWeight: 'bold',
  },
});

