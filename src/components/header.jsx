import { Text, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function Header() {
  return (
    <SafeAreaView edges={['top', 'left', 'right']} style={styles.entete}>
      <Text style={styles.titre}>AEM</Text>
      <Text style={styles.sousTitre}>Ensemble, avançons !</Text>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  entete: {
    backgroundColor: '#f4f8f8',
    paddingHorizontal: 20,
    paddingVertical: 15,
    borderBottomWidth: 5,
    borderBottomColor: '#e0e0e0',

  },
  titre: {
    color: '#0f0f0f',
    fontSize: 22,
    fontWeight: 'bold',
  },
  sousTitre: {
    color: '#252525',
    fontSize: 14,
    marginTop: 5,
  },
});