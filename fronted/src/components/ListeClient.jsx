import { ActivityIndicator, FlatList, Pressable, StyleSheet, Text, View } from 'react-native';

export default function ListeClient({ liste, renderItem, entete = null, messageVide }) {
  const { donnees, chargement, erreur, suite, charger } = liste;
  return (
    <FlatList
      data={donnees}
      keyExtractor={item => String(item.id)}
      renderItem={renderItem}
      contentContainerStyle={styles.contenu}
      ListHeaderComponent={entete}
      keyboardShouldPersistTaps="handled"
      refreshing={chargement && donnees.length === 0}
      onRefresh={() => charger()}
      ListEmptyComponent={!chargement && !erreur && messageVide ? <Text style={styles.message}>{messageVide}</Text> : null}
      ListFooterComponent={
        <View style={styles.pied}>
          {chargement && <ActivityIndicator color="#0c9e79" accessibilityLabel="Chargement" />}
          {!!erreur && <Text accessibilityRole="alert" style={styles.erreur}>{erreur}</Text>}
          {!chargement && (!!erreur || suite) && (
            <Pressable accessibilityRole="button" style={styles.bouton} onPress={() => charger(donnees.length > 0 && suite)}>
              <Text style={styles.texteBouton}>{erreur ? 'Réessayer' : 'Afficher la suite'}</Text>
            </Pressable>
          )}
        </View>
      }
    />
  );
}

const styles = StyleSheet.create({
  contenu: { padding: 20, paddingTop: 4, flexGrow: 1 },
  pied: { paddingVertical: 20, gap: 12 },
  message: { textAlign: 'center', color: '#526078', paddingVertical: 40 },
  erreur: { color: '#b91c1c', textAlign: 'center' },
  bouton: { backgroundColor: '#0D5C5F', borderRadius: 10, padding: 14, alignItems: 'center' },
  texteBouton: { color: '#fff', fontWeight: '600' },
});
