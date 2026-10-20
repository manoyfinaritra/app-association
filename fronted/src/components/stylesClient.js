import { StyleSheet } from 'react-native';

// Quelques styles partagés pour garder les écrans courts et cohérents.
export default StyleSheet.create({
  carte: { backgroundColor: '#fff', borderRadius: 12, borderWidth: 1, borderColor: '#e2e8f0', padding: 16, marginBottom: 12, gap: 8 },
  titre: { fontSize: 18, fontWeight: '600', color: '#073B5C' },
  texte: { fontSize: 15, color: '#526078', lineHeight: 23 },
  etiquette: { fontSize: 13, color: '#64748b' },
  recherche: { backgroundColor: '#fff', borderWidth: 1, borderColor: '#cbd5e1', borderRadius: 10, padding: 14, fontSize: 16, marginBottom: 12 },
  filtres: { flexDirection: 'row', flexWrap: 'wrap', gap: 8, marginBottom: 16 },
  filtre: { borderWidth: 1, borderColor: '#0D5C5F', borderRadius: 20, paddingHorizontal: 16, paddingVertical: 10 },
  filtreActif: { backgroundColor: '#d7f3e9' },
  lien: { color: '#0D5C5F', fontSize: 15, fontWeight: '600', paddingVertical: 10 },
  bouton: { backgroundColor: '#0D5C5F', borderRadius: 10, padding: 14, alignItems: 'center' },
  texteBouton: { color: '#fff', fontWeight: '600', fontSize: 15 },
});
