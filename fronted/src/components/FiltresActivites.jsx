import { Pressable, Text, TextInput, View } from 'react-native';
import styles from './stylesClient';

export default function FiltresActivites({ recherche, setRecherche, periode, setPeriode }) {
  return (
    <View>
      <TextInput
        style={styles.recherche}
        accessibilityLabel="Rechercher par thème, lieu ou intervenant"
        placeholder="Rechercher un thème, un lieu…"
        value={recherche}
        onChangeText={setRecherche}
      />
      <View style={styles.filtres}>
        {['', 'avenir'].map(valeur => (
          <Pressable key={valeur} accessibilityRole="button" accessibilityState={{ selected: periode === valeur }}
            style={[styles.filtre, periode === valeur && styles.filtreActif]} onPress={() => setPeriode(valeur)}>
            <Text>{valeur ? 'À venir' : 'Tout afficher'}</Text>
          </Pressable>
        ))}
      </View>
    </View>
  );
}
