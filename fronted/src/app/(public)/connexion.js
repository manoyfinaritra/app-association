import React, { useState } from 'react';
import { isAxiosError } from 'axios';
import api from '../../components/api/api';
import {useAuth} from '../../context/AuthContext';
import {
  View,
  Text,
  TextInput,
  ScrollView,
  Pressable,
  StyleSheet,
  Alert,
  ActivityIndicator,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { router } from 'expo-router';

export default function Connexion() {
  const [telephone, setTelephone] = useState('');
  const [motDePasse, setMotDePasse] = useState('');
  const [masquerMotDePasse, setMasquerMotDePasse] = useState(true);
  const [seSouvenir, setSeSouvenir] = useState(false);
  const [chargement, setChargement] = useState(false);
  const [message, setMessage] = useState('');
  const { connecter } = useAuth();

  const envoyerConnexion = async () => {
    setMessage('');

    if (!telephone.trim() || !motDePasse) {
      Alert.alert(
        'Champs manquants',
        'Veuillez remplir tous les champs avant de continuer.'
      );
      return;
    }

    const telephoneValide = /^\+?[0-9]{7,15}$/.test(telephone.trim());
    if (!telephoneValide) {
      Alert.alert(
        'Numéro invalide',
        'Veuillez saisir un numéro de téléphone de 7 à 15 chiffres.'
      );
      return;
    }

    setChargement(true);

    try {
      const data = {
        telephone: telephone.trim(),
        motDePasse,
      };

      const response = await api.post('/connexion', data);
      if (response.status === 200) {
        connecter(response.data.utilisateur);
        router.replace('/(client)/dashboard');
        setTelephone('');
        setMotDePasse('');
        setSeSouvenir(false);
      }
    } catch (erreur) {
      if (isAxiosError(erreur) && erreur.response) {
        const messageServeur = erreur.response.data?.message;
        setMessage(typeof messageServeur === 'string'
          ? messageServeur
          : 'Une erreur est survenue sur le serveur.');
      } else {
        setMessage('Impossible de joindre le serveur. Vérifiez votre connexion et l’adresse du backend.');
      }
    } finally {
      setChargement(false);
    }
  };

  return (
    <ScrollView
      style={styles.fond}
      contentContainerStyle={styles.contenu}
      showsVerticalScrollIndicator={false}
      keyboardShouldPersistTaps="handled"
    >
      <View style={styles.entete}>
        <View style={styles.iconeEntete}>
          <Ionicons
            name="log-in-outline"
            size={32}
            color="#079DA6"
          />
        </View>

        <Text style={styles.titre}>
          Se connecter
        </Text>

        <Text style={styles.sousTitre}>
          Association d&apos;Entraide Madagascar
          {'\n'}
          Content de vous revoir !
        </Text>
      </View>

      <View style={styles.introduction}>
        <Ionicons
          name="key-outline"
          size={24}
          color="#079DA6"
        />

        <Text style={styles.texteIntroduction}>
          Connectez-vous à votre espace personnel pour accéder à vos services et suivre vos demandes.
        </Text>
      </View>

      <View style={styles.carte}>
        <Text style={styles.titreSection}>
          Identifiants
        </Text>
        {message && (
          <Text style={styles.message}>
            {message}
          </Text>
        )}

        <Text style={styles.label}>
          Numéro de téléphone
        </Text>
        <TextInput
          style={styles.champ}
          placeholder="0341234567"
          placeholderTextColor="#8994A5"
          value={telephone}
          onChangeText={setTelephone}
          keyboardType="phone-pad"
          inputMode="tel"
          autoCapitalize="none"
          autoCorrect={false}
        />

        <Text style={styles.label}>
          Mot de passe
        </Text>
        <View style={styles.conteneurMotDePasse}>
          <TextInput

            style={styles.champMotDePasse}
            placeholder="Votre mot de passe"
            placeholderTextColor="#8994A5"
            value={motDePasse}
            onChangeText={setMotDePasse}
            secureTextEntry={masquerMotDePasse}
            autoCapitalize="none"
          />
          <Pressable
            onPress={() => setMasquerMotDePasse(!masquerMotDePasse)}
            style={styles.iconeOeil}
          >
            <Ionicons
              name={masquerMotDePasse ? 'eye-off-outline' : 'eye-outline'}
              size={22}
              color="#8994A5"
            />
          </Pressable>
        </View>

        <View style={styles.ligneOption}>
          <Pressable
            style={styles.ligneConsentement}
            onPress={() => setSeSouvenir(!seSouvenir)}
          >
            <Ionicons
              name={seSouvenir ? 'checkbox' : 'square-outline'}
              size={22}
              color={seSouvenir ? '#079DA6' : '#8994A5'}
            />
            <Text style={styles.texteConsentement}>Se souvenir de moi</Text>
          </Pressable>

          <Pressable onPress={() => Alert.alert('Information', 'Fonctionnalité de réinitialisation bientôt disponible.')}>
            <Text style={styles.texteOublie}>Mot de passe oublié ?</Text>
          </Pressable>
        </View>

        <Pressable
          style={[styles.bouton, chargement && styles.boutonDesactive]}
          onPress={envoyerConnexion}
          disabled={chargement}
        >
          {chargement ? (
            <ActivityIndicator color="#FFFFFF" />
          ) : (
            <>
              <Text style={styles.texteBouton}>
                Se connecter
              </Text>
              <Ionicons
                name="arrow-forward"
                size={21}
                color="#FFFFFF"
              />
            </>
          )}
        </Pressable>

        <View style={styles.ligneInscription}>
          <Text style={styles.texteQuestion}>Vous n&apos;avez pas de compte ?</Text>
          <Pressable onPress={() => router.push('/Inscription')}>
            <Text style={styles.texteLienInscription}> S&apos;inscrire</Text>
          </Pressable>
        </View>
      </View>

      <Pressable
        style={styles.boutonRetour}
        onPress={() => router.navigate('/')}
      >
        <Ionicons
          name="arrow-back"
          size={19}
          color="#079DA6"
        />
        <Text style={styles.texteRetour}>
          Retour à l&apos;accueil
        </Text>
      </Pressable>

      <View style={styles.piedPage}>
        <Ionicons
          name="people"
          size={23}
          color="#079DA6"
        />
        <Text style={styles.nomAssociation}>
          Association d&apos;Entraide Madagascar
        </Text>
        <Text style={styles.slogan}>
          Ensemble, avançons !
        </Text>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  fond: {
    flex: 1,
    backgroundColor: '#F4F9FA',
  },
  contenu: {
    paddingBottom: 30,
  },
  entete: {
    backgroundColor: '#073B5C',
    paddingHorizontal: 22,
    paddingTop: 35,
    paddingBottom: 35,
    borderBottomLeftRadius: 25,
    borderBottomRightRadius: 25,
    alignItems: 'center',
  },
  iconeEntete: {
    width: 65,
    height: 65,
    borderRadius: 33,
    backgroundColor: '#E5F7F7',
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 15,
  },
  titre: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#FFFFFF',
    textAlign: 'center',
    marginBottom: 10,
  },
  sousTitre: {
    fontSize: 14,
    color: '#E5F6F6',
    textAlign: 'center',
    lineHeight: 22,
  },
  introduction: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#E5F7F7',
    marginHorizontal: 18,
    marginTop: 20,
    padding: 15,
    borderRadius: 12,
    gap: 12,
  },
  texteIntroduction: {
    flex: 1,
    color: '#183568',
    fontSize: 14,
    lineHeight: 21,
  },
  carte: {
    backgroundColor: '#FFFFFF',
    marginHorizontal: 18,
    marginTop: 20,
    padding: 20,
    borderRadius: 16,
    elevation: 3,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08,
    shadowRadius: 5,
  },
  titreSection: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#183568',
    marginBottom: 20,
  },
  label: {
    fontSize: 14,
    fontWeight: '600',
    color: '#183568',
    marginBottom: 8,
    marginTop: 8,
  },
  champ: {
    backgroundColor: '#F7FAFC',
    borderWidth: 1,
    borderColor: '#DCE5ED',
    borderRadius: 10,
    paddingHorizontal: 14,
    paddingVertical: 13,
    fontSize: 14,
    color: '#183568',
    marginBottom: 12,
  },
  conteneurMotDePasse: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#F7FAFC',
    borderWidth: 1,
    borderColor: '#DCE5ED',
    borderRadius: 10,
    marginBottom: 12,
  },
  champMotDePasse: {
    flex: 1,
    paddingHorizontal: 14,
    paddingVertical: 13,
    fontSize: 14,
    color: '#183568',
  },
  iconeOeil: {
    paddingHorizontal: 12,
  },
  ligneOption: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: 4,
    marginBottom: 20,
  },
  ligneConsentement: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  texteConsentement: {
    fontSize: 13,
    color: '#526078',
  },
  texteOublie: {
    fontSize: 13,
    color: '#079DA6',
    fontWeight: '600',
  },
  bouton: {
    backgroundColor: '#079DA6',
    borderRadius: 12,
    padding: 16,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 10,
    marginTop: 5,
  },
  boutonDesactive: {
    opacity: 0.7,
  },
  texteBouton: {
    color: '#FFFFFF',
    fontSize: 15,
    fontWeight: 'bold',
  },
  ligneInscription: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    marginTop: 20,
  },
  texteQuestion: {
    fontSize: 13,
    color: '#526078',
  },
  texteLienInscription: {
    fontSize: 13,
    color: '#079DA6',
    fontWeight: 'bold',
  },
  boutonRetour: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
    marginTop: 24,
    padding: 12,
  },
  texteRetour: {
    color: '#079DA6',
    fontSize: 14,
    fontWeight: '600',
  },
  piedPage: {
    alignItems: 'center',
    marginTop: 15,
    paddingHorizontal: 20,
  },
  nomAssociation: {
    color: '#183568',
    fontSize: 14,
    fontWeight: 'bold',
    textAlign: 'center',
    marginTop: 8,
  },
  slogan: {
    color: '#079DA6',
    fontSize: 13,
    marginTop: 5,
  },
  message: {
    color: '#FF0000',
    fontSize: 14,
    marginBottom: 10,
    textAlign: 'center',
    backgroundColor: '#FFE5E5',
    padding: 10,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#FF0000',

  },
});
