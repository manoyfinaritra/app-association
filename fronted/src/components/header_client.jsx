import { Image, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function HeaderClient() {
  return (
    <SafeAreaView edges={['top', 'left', 'right']} style={styles.fond}>
      <View style={styles.entete}>
        <Image source={require('../../assets/logo.png')} style={styles.logo} />
        <Text style={styles.titre}>AEM · Espace membre</Text>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  fond: { backgroundColor: '#fff' },
  entete: { flexDirection: 'row', alignItems: 'center', gap: 12, paddingHorizontal: 20, paddingVertical: 12, borderBottomWidth: 1, borderBottomColor: '#e2e8f0' },
  logo: { width: 40, height: 40, resizeMode: 'contain' },
  titre: { flex: 1, fontSize: 18, fontWeight: '700', color: '#078330' },
});
