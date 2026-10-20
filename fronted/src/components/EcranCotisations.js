import { Text, View } from 'react-native';
import EcranOnglet from './EcranOnglet';
import ListeClient from './ListeClient';
import styles from './stylesClient';
import useListeClient from '../hooks/useListeClient';
import { afficherDate, afficherMontant } from '../utils/format';

const mois = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
  'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'];

export default function EcranCotisations() {
  const liste = useListeClient('cotisations');
  return (
    <EcranOnglet titre="Mes cotisations" description="Consultez les versements enregistrés à votre nom.">
      <ListeClient liste={liste} messageVide="Aucun versement enregistré pour le moment."
        renderItem={({ item }) => (
          <View style={styles.carte}>
            <Text style={styles.titre}>{mois[Number(item.mois) - 1]} {item.annee}</Text>
            <Text style={styles.texte}>{afficherMontant(item.montant)}</Text>
            <Text style={styles.texte}>{Number(item.valide) === 1 ? 'Validée' : 'En attente de validation'}</Text>
            <Text style={styles.etiquette}>Enregistrée le {afficherDate(item.date)}</Text>
          </View>
        )}
      />
    </EcranOnglet>
  );
}
