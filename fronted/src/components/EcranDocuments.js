import { useState } from 'react';
import { Linking, Pressable, Text, TextInput, View } from 'react-native';
import EcranOnglet from './EcranOnglet';
import ListeClient from './ListeClient';
import styles from './stylesClient';
import useListeClient from '../hooks/useListeClient';
import { afficherDate } from '../utils/format';

export default function EcranDocuments() {
  const [recherche, setRecherche] = useState('');
  const [message, setMessage] = useState('');
  const liste = useListeClient('documents', recherche);

  async function ouvrirDocument(document) {
    setMessage('');
    if (!document.url) {
      setMessage('Ce document n’est pas accessible pour le moment. Contactez le bureau.');
      return;
    }
    try {
      await Linking.openURL(document.url);
    } catch {
      setMessage('Impossible d’ouvrir ce document. Réessayez plus tard.');
    }
  }

  return (
    <EcranOnglet titre="Documents" description="Retrouvez les documents partagés par l’association.">
      <ListeClient liste={liste} messageVide="Aucun document ne correspond à votre recherche."
        entete={<View>
          <TextInput style={styles.recherche} accessibilityLabel="Rechercher un document"
            placeholder="Nom du document…" value={recherche} onChangeText={setRecherche} />
          {!!message && <Text accessibilityRole="alert" style={styles.texte}>{message}</Text>}
        </View>}
        renderItem={({ item }) => (
          <View style={styles.carte}>
            <Text style={styles.titre}>{item.titre}</Text>
            <Text style={styles.texte}>Publié le {afficherDate(item.date)}</Text>
            <Pressable accessibilityRole="button" accessibilityLabel={`Ouvrir ${item.titre}`} onPress={() => ouvrirDocument(item)}>
              <Text style={styles.lien}>Ouvrir le document</Text>
            </Pressable>
          </View>
        )}
      />
    </EcranOnglet>
  );
}
