import { StyleSheet, Text, View } from 'react-native';

// L'en-tête AEM et la barre d'onglets sont déjà affichés par le layout.
export default function EcranOnglet({ titre, description, children }) {
  return (
    <View style={styles.page}>
      <View style={styles.entete}>
        <Text accessibilityRole="header" style={styles.titre}>{titre}</Text>
        <Text style={styles.description}>{description}</Text>
      </View>
      {children}
    </View>
  );
}

const styles = StyleSheet.create({
  page: { flex: 1, backgroundColor: '#F4F9FA' },
  entete: { padding: 20, paddingBottom: 12 },
  titre: { fontSize: 24, fontWeight: '700', color: '#073B5C' },
  description: { marginTop: 6, fontSize: 14, color: '#526078' },
});
