import { View, Text, StyleSheet } from 'react-native';
import { useAuth } from '../../context/AuthContext.jsx';

export default function Dashboard() {
  const { utilisateur } = useAuth();

  return (
    <View style={styles.container}>
      <Text style={styles.titre}>
        Bienvenue dans votre espace client !
      </Text>

      {utilisateur ? (
        <>
          <Text style={styles.texte}>
            Identifiant : {utilisateur.id}
          </Text>

          <Text style={styles.texte}>
            Téléphone : {utilisateur.telephone}
          </Text>

          <Text style={styles.texte}>
            Email : {utilisateur.email}
          </Text>

          <Text style={styles.texte}>
            Nom : {utilisateur.nom}
          </Text>

          <Text style={styles.texte}>
            Prénom : {utilisateur.prenom}
          </Text>
        </>
      ) : (
        <Text style={styles.texte}>
          Aucun utilisateur connecté.
        </Text>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    backgroundColor: '#F4F9FA',
  },
  titre: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#073B5C',
    marginBottom: 20,
  },
  texte: {
    fontSize: 16,
    color: '#526078',
    marginBottom: 12,
  },
});