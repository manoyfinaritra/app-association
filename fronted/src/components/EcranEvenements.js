import { useState } from 'react';
import { Text, View } from 'react-native';
import EcranOnglet from './EcranOnglet';
import ListeClient from './ListeClient';
import FiltresActivites from './FiltresActivites';
import styles from './stylesClient';
import useListeClient from '../hooks/useListeClient';
import { afficherDate } from '../utils/format';

export default function EcranEvenements() {
  const [recherche, setRecherche] = useState('');
  const [periode, setPeriode] = useState('');
  const liste = useListeClient('evenements', recherche, periode);

  return (
    <EcranOnglet titre="Événements" description="Les rendez-vous de la vie associative.">
      <ListeClient liste={liste} messageVide="Aucun événement ne correspond à votre recherche."
        entete={<FiltresActivites {...{ recherche, setRecherche, periode, setPeriode }} />}
        renderItem={({ item }) => (
          <View style={styles.carte}>
            <Text style={styles.titre}>{item.titre}</Text>
            <Text style={styles.texte}>{afficherDate(item.date)}</Text>
            <Text style={styles.texte}>Lieu : {item.lieu || 'À préciser'}</Text>
            {!!item.description && <Text style={styles.texte}>{item.description}</Text>}
          </View>
        )}
      />
    </EcranOnglet>
  );
}
