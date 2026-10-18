
import React, { useState } from 'react';
import {
  View,
  Text,
  TextInput,
  ScrollView,
  Pressable,
  StyleSheet,
  Alert,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { router } from 'expo-router';
import api from './api/api';
export default function Inscription() {
  const [nom, setNom] = useState('');
  const [prenom, setPrenom] = useState('');
  const [email, setEmail] = useState('');
  const [telephone, setTelephone] = useState('');
  const [profil, setProfil] = useState('');
  const [adresse, setAdresse] = useState('');
  const [motivation, setMotivation] = useState('');
  const [accepte, setAccepte] = useState(false);

  const envoyerInscription = async () => {
    if (
      !nom.trim() ||
      !prenom.trim() ||
      !email.trim() ||
      !telephone.trim() ||
      !profil
    ) {
      Alert.alert(
        'Informations manquantes',
        'Veuillez remplir tous les champs obligatoires.'
      );
      return;
    }

    const emailValide = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.trim());

    if (!emailValide) {
      Alert.alert(
        'Email invalide',
        'Veuillez saisir une adresse email valide.'
      );
      return;
    }

    if (!accepte) {
      Alert.alert(
        'Confirmation nécessaire',
        "Veuillez confirmer votre accord avant de continuer."
      );
      return;
    }


    try {
      const data = {
        nom: nom.trim(),
        prenom: prenom.trim(),
        email: email.trim(),
        telephone: telephone.trim(),
        profil: profil.trim(),
        adresse: adresse.trim(),
        motivation: motivation.trim(),
      };

      const response = await api.post('/inscriptions', data);
      if(response.status === 200 || response.status === 201) {
        Alert.alert(
        'Formulaire validé',
        "Votre formulaire est prêt. Pour enregistrer réellement votre demande d'inscription, une base de données ou un service serveur doit être configuré.")
      }

      
      // );
    } catch (error) {
      console.error('Erreur lors de l\'envoi de la demande d\'inscription :', error);
      Alert.alert(
        'Erreur',
        'Une erreur s\'est produite lors de l\'envoi de votre demande. Veuillez réessayer.'
      );
    }
  };

  const choisirProfil = (valeur) => {
    setProfil(valeur);
  };

  return (
    <ScrollView
      style={styles.fond}
      contentContainerStyle={styles.contenu}
      showsVerticalScrollIndicator={false}
      keyboardShouldPersistTaps="handled"
    >
      {/* En-tête */}
      <View style={styles.entete}>
        <View style={styles.iconeEntete}>
          <Ionicons
            name="person-add-outline"
            size={32}
            color="#079DA6"
          />
        </View>

        <Text style={styles.titre}>
          Devenir membre
        </Text>

        <Text style={styles.sousTitre}>
          Rejoignez l'Association d'Entraide Madagascar
          {'\n'}
          Ensemble, avançons !
        </Text>
      </View>

      {/* Introduction */}
      <View style={styles.introduction}>
        <Ionicons
          name="people-outline"
          size={24}
          color="#079DA6"
        />

        <Text style={styles.texteIntroduction}>
          Remplissez ce formulaire pour soumettre votre demande
          d'adhésion à notre communauté solidaire.
        </Text>
      </View>

      {/* Formulaire */}
      <View style={styles.carte}>
        <Text style={styles.titreSection}>
          Informations personnelles
        </Text>

        <Text style={styles.label}>
          Nom *
        </Text>
        <TextInput
          style={styles.champ}
          placeholder="Votre nom"
          placeholderTextColor="#8994A5"
          value={nom}
          onChangeText={setNom}
          autoCapitalize="words"
        />

        <Text style={styles.label}>
          Prénom *
        </Text>
        <TextInput
          style={styles.champ}
          placeholder="Votre prénom"
          placeholderTextColor="#8994A5"
          value={prenom}
          onChangeText={setPrenom}
          autoCapitalize="words"
        />

        <Text style={styles.label}>
          Adresse email *
        </Text>
        <TextInput
          style={styles.champ}
          placeholder="exemple@email.com"
          placeholderTextColor="#8994A5"
          value={email}
          onChangeText={setEmail}
          keyboardType="email-address"
          autoCapitalize="none"
          autoCorrect={false}
        />

        <Text style={styles.label}>
          Numéro de téléphone *
        </Text>
        <TextInput
          style={styles.champ}
          placeholder="Ex. : 034 00 000 00"
          placeholderTextColor="#8994A5"
          value={telephone}
          onChangeText={setTelephone}
          keyboardType="phone-pad"
        />

        {/* Choix du profil */}
        <Text style={styles.label}>
          Votre profil *
        </Text>

        <View style={styles.profils}>
          {[
            'Étudiant',
            'Professionnel',
            'Particulier',
          ].map((item) => (
            <Pressable
              key={item}
              style={[
                styles.optionProfil,
                profil === item && styles.optionSelectionnee,
              ]}
              onPress={() => choisirProfil(item)}
            >
              <Ionicons
                name={
                  profil === item
                    ? 'radio-button-on'
                    : 'radio-button-off'
                }
                size={19}
                color={profil === item ? '#079DA6' : '#8994A5'}
              />

              <Text
                style={[
                  styles.texteProfil,
                  profil === item && styles.texteProfilSelectionne,
                ]}
              >
                {item}
              </Text>
            </Pressable>
          ))}
        </View>

        <Text style={styles.label}>
          Adresse ou ville
        </Text>
        <TextInput
          style={styles.champ}
          placeholder="Votre ville ou votre adresse"
          placeholderTextColor="#8994A5"
          value={adresse}
          onChangeText={setAdresse}
        />

        <Text style={styles.label}>
          Pourquoi souhaitez-vous nous rejoindre ?
        </Text>
        <TextInput
          style={[styles.champ, styles.champMultiligne]}
          placeholder="Parlez-nous de vos motivations..."
          placeholderTextColor="#8994A5"
          value={motivation}
          onChangeText={setMotivation}
          multiline
          textAlignVertical="top"
        />

        {/* Consentement */}
        <Pressable
          style={styles.ligneConsentement}
          onPress={() => setAccepte(!accepte)}
        >
          <Ionicons
            name={
              accepte
                ? 'checkbox'
                : 'square-outline'
            }
            size={24}
            color={accepte ? '#079DA6' : '#8994A5'}
          />

          <Text style={styles.texteConsentement}>
            Je confirme l'exactitude des informations fournies
            et j'accepte que mes données soient utilisées pour
            traiter ma demande d'adhésion. *
          </Text>
        </Pressable>

        {/* Bouton d'inscription */}
        <Pressable
          style={styles.bouton}
          onPress={envoyerInscription}
        >
          <Text style={styles.texteBouton}>
            Soumettre ma demande
          </Text>

          <Ionicons
            name="arrow-forward"
            size={21}
            color="#FFFFFF"
          />
        </Pressable>

        <Text style={styles.note}>
          * Les champs marqués d'un astérisque sont obligatoires.
        </Text>
      </View>

      {/* Retour à l'accueil */}
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
          Retour à l'accueil
        </Text>
      </Pressable>

      <View style={styles.piedPage}>
        <Ionicons
          name="people"
          size={23}
          color="#079DA6"
        />
        <Text style={styles.nomAssociation}>
          Association d'Entraide Madagascar
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
  profils: {
    gap: 10,
    marginBottom: 12,
  },
  optionProfil: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
    padding: 13,
    borderWidth: 1,
    borderColor: '#DCE5ED',
    borderRadius: 10,
    backgroundColor: '#F7FAFC',
  },
  optionSelectionnee: {
    borderColor: '#079DA6',
    backgroundColor: '#E5F7F7',
  },
  texteProfil: {
    fontSize: 14,
    color: '#526078',
  },
  texteProfilSelectionne: {
    color: '#079DA6',
    fontWeight: 'bold',
  },
  champMultiligne: {
    height: 110,
    paddingTop: 14,
  },
  ligneConsentement: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: 10,
    marginTop: 8,
    marginBottom: 20,
  },
  texteConsentement: {
    flex: 1,
    fontSize: 12,
    lineHeight: 19,
    color: '#526078',
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
  texteBouton: {
    color: '#FFFFFF',
    fontSize: 15,
    fontWeight: 'bold',
  },
  note: {
    fontSize: 11,
    color: '#8994A5',
    marginTop: 15,
    lineHeight: 17,
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
});
