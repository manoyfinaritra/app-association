import { Link } from 'expo-router';
import { Pressable, Text, View } from 'react-native';
import { useAuth } from '../../context/AuthContext';
import EcranOnglet from '../../components/EcranOnglet';
import ListeClient from '../../components/ListeClient';
import styles from '../../components/stylesClient';
import useListeClient from '../../hooks/useListeClient';
import { afficherDate } from '../../utils/format';

export default function Dashboard() {
  const { utilisateur } = useAuth();
  const liste = useListeClient('publications');
  const evenements = useListeClient('evenements', '', 'avenir');
  return (
    <EcranOnglet titre={`Bonjour ${utilisateur?.prenom || utilisateur?.nom || ''} !`}
      description="Bienvenue dans votre espace membre AEM.">
      <ListeClient liste={liste} messageVide="Aucune actualité publiée pour le moment."
        entete={
          <View style={styles.carte}>
            <Text style={styles.titre}>Votre association</Text>
            <Link href="/(client)/evenement" style={styles.lien}>Consulter les événements</Link>
            <Link href="/(client)/formation" style={styles.lien}>Découvrir les formations</Link>
            <Link href="/(client)/cotisation" style={styles.lien}>Voir mes cotisations</Link>
            <Text style={styles.titre}>Prochains événements</Text>
            {evenements.chargement && <Text style={styles.texte}>Chargement des rendez-vous…</Text>}
            {!!evenements.erreur && (
              <Pressable accessibilityRole="button" onPress={() => evenements.charger()}>
                <Text style={styles.lien}>Réessayer de charger les événements</Text>
              </Pressable>
            )}
            {!evenements.chargement && !evenements.erreur && evenements.donnees.length === 0 && (
              <Text style={styles.texte}>Aucun rendez-vous à venir.</Text>
            )}
            {evenements.donnees.slice(0, 3).map(evenement => (
              <View key={evenement.id}>
                <Text style={styles.texte}>{evenement.titre}</Text>
                <Text style={styles.etiquette}>{afficherDate(evenement.date)} · {evenement.lieu || 'Lieu à préciser'}</Text>
              </View>
            ))}
            <Text style={styles.titre}>Actualités</Text>
          </View>
        }
        renderItem={({ item }) => (
          <View style={styles.carte}>
            <Text style={styles.titre}>{[item.prenom, item.nom].filter(Boolean).join(' ') || 'AEM'}</Text>
            <Text style={styles.etiquette}>{afficherDate(item.date)}</Text>
            <Text style={styles.texte}>{item.description || 'Publication sans texte.'}</Text>
          </View>
        )}
      />
    </EcranOnglet>
  );
}
