import { useState } from 'react';
import { isAxiosError } from 'axios';
import { ActivityIndicator, Pressable, Text, TextInput, View } from 'react-native';
import api from './api/api';
import { useAuth } from '../context/AuthContext';
import styles from './stylesProfil';

const champs = [
  { nom: 'nom', titre: 'Nom', limite: 50 },
  { nom: 'prenom', titre: 'Prénom', limite: 50 },
  { nom: 'telephone', titre: 'Téléphone', limite: 16 },
  { nom: 'email', titre: 'Email', limite: 100 },
  { nom: 'ville', titre: 'Ville', limite: 100 },
  { nom: 'region', titre: 'Région', limite: 100 },
];

export default function FormulaireProfil({ onFermer, onEnregistre }) {
  const { utilisateur, actualiserUtilisateur, deconnecter } = useAuth();
  const [valeurs, setValeurs] = useState(() => Object.fromEntries(
    champs.map(champ => [champ.nom, utilisateur[champ.nom] || ''])
  ));
  const [chargement, setChargement] = useState(false);
  const [erreur, setErreur] = useState('');

  async function enregistrer() {
    setChargement(true);
    setErreur('');
    try {
      const { data } = await api.post('/client/profil', valeurs);
      actualiserUtilisateur(data.utilisateur);
      onEnregistre();
    } catch (e) {
      if (isAxiosError(e) && e.response?.status === 401) {
        deconnecter();
        return;
      }
      const message = isAxiosError(e) ? e.response?.data?.message : null;
      setErreur(typeof message === 'string' ? message : 'Impossible d’enregistrer. Vérifiez votre connexion.');
    } finally {
      setChargement(false);
    }
  }

  return (
    <View style={styles.carte}>
      <Text style={styles.titre}>Modifier mes informations</Text>
      {champs.map(champ => (
        <View key={champ.nom}>
          <Text style={styles.libelle}>{champ.titre}</Text>
          <TextInput accessibilityLabel={champ.titre} style={styles.champ}
            value={valeurs[champ.nom]} editable={!chargement} maxLength={champ.limite}
            keyboardType={champ.nom === 'email' ? 'email-address' : champ.nom === 'telephone' ? 'phone-pad' : 'default'}
            autoCapitalize={champ.nom === 'email' ? 'none' : 'words'}
            onChangeText={texte => setValeurs(ancien => ({ ...ancien, [champ.nom]: texte }))} />
        </View>
      ))}
      {!!erreur && <Text accessibilityRole="alert" style={styles.erreur}>{erreur}</Text>}
      <Pressable accessibilityRole="button" accessibilityState={{ disabled: chargement }} disabled={chargement} style={styles.bouton} onPress={enregistrer}>
        {chargement ? <ActivityIndicator color="#fff" /> : <Text style={styles.texteBouton}>Enregistrer les modifications</Text>}
      </Pressable>
      <Pressable accessibilityRole="button" disabled={chargement} onPress={onFermer}>
        <Text style={styles.lien}>Annuler</Text>
      </Pressable>
    </View>
  );
}
