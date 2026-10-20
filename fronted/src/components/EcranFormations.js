import { useState } from 'react';
import { Text, View } from 'react-native';
import EcranOnglet from './EcranOnglet';
import ListeClient from './ListeClient';
import FiltresActivites from './FiltresActivites';
import styles from './stylesClient';
import useListeClient from '../hooks/useListeClient';
import { afficherDate, afficherMontant } from '../utils/format';

export default function EcranFormations() {
  const [recherche, setRecherche] = useState('');
  const [periode, setPeriode] = useState('');
  const liste = useListeClient('formations', recherche, periode);

  return (
    <EcranOnglet titre="Formations" description="Découvrez les formations proposées par l’association.">
      <ListeClient liste={liste} messageVide="Aucune formation ne correspond à votre recherche."
        entete={<FiltresActivites {...{ recherche, setRecherche, periode, setPeriode }} />}
        renderItem={({ item }) => (
          <View style={styles.carte}>
            <Text style={styles.titre}>{item.titre}</Text>
            <Text style={styles.texte}>{afficherDate(item.date)}</Text>
            <Text style={styles.texte}>Lieu : {item.lieu || 'À préciser'}</Text>
            {!!item.intervenant && <Text style={styles.texte}>Intervenant : {item.intervenant}</Text>}
            <Text style={styles.texte}>Prix par personne : {afficherMontant(item.prix)}</Text>
            {!!item.description && <Text style={styles.texte}>{item.description}</Text>}
          </View>
        )}
      />
    </EcranOnglet>
  );
}
