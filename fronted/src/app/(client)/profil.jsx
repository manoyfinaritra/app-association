import { View, Text, Pressable, StyleSheet,Alert } from 'react-native';
import { useAuth } from '../../context/AuthContext.jsx';


export default function Profil() {
function confirmDeconnexion() {
  Alert.alert(
    'Déconnexion',
    'Voulez-vous vraiment vous déconnecter ?',
    [
      {
        text: 'Annuler',
        style: 'cancel',
      },
      {
        text: 'Se déconnecter',
        style: 'destructive',
        onPress: () => deconnecter(),
      },
    ]
  );
}
  const { utilisateur,deconnecter } = useAuth();

  return (
    <View style={styles.container}>
      <Text style={styles.titre}>Mon profil</Text>

      <Text style={styles.telephone}>
        Email : {utilisateur?.email || 'Non renseigné'}
      </Text>

      <Pressable
        style={styles.bouton}
        onPress={confirmDeconnexion}
      >
        <Text style={styles.texteBouton}>Se déconnecter</Text>
      </Pressable>
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
  telephone: {
    fontSize: 16,
    color: '#526078',
    marginBottom: 25,
  },
  bouton: {
    backgroundColor: '#DC2626',
    padding: 16,
    borderRadius: 12,
    alignItems: 'center',
  },
  texteBouton: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
});