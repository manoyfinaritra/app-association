
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

export default function Contact() {
  const [nom, setNom] = useState('');
  const [email, setEmail] = useState('');
  const [sujet, setSujet] = useState('');
  const [message, setMessage] = useState('');

  const envoyerMessage = () => {
    if (!nom.trim() || !email.trim() || !message.trim()) {
      Alert.alert(
        'Champs obligatoires',
        'Veuillez remplir votre nom, votre email et votre message.'
      );
      return;
    }

    Alert.alert(
      'Message préparé',
      "Merci de contacter l'Association d'Entraide Madagascar !\n\nPour envoyer réellement votre message, un service d'envoi doit être configuré."
    );
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
            name="mail-outline"
            size={32}
            color="#079DA6"
          />
        </View>

        <Text style={styles.titre}>Contactez-nous</Text>

        <Text style={styles.sousTitre}>
          Une question ou une suggestion ?
          {'\n'}
          L'équipe AEM est là pour vous écouter.
        </Text>
      </View>

      {/* Coordonnées */}
      <View style={styles.carte}>
        <Text style={styles.titreSection}>
          Nos coordonnées
        </Text>

        <View style={styles.ligneContact}>
          <View style={styles.iconeContact}>
            <Ionicons
              name="mail"
              size={22}
              color="#079DA6"
            />
          </View>
          <View style={styles.information}>
            <Text style={styles.label}>Email</Text>
            <Text style={styles.valeur}>
              À compléter avec votre adresse email
            </Text>
          </View>
        </View>

        <View style={styles.ligneContact}>
          <View style={styles.iconeContact}>
            <Ionicons
              name="call"
              size={22}
              color="#079DA6"
            />
          </View>
          <View style={styles.information}>
            <Text style={styles.label}>Téléphone</Text>
            <Text style={styles.valeur}>
              À compléter avec votre numéro
            </Text>
          </View>
        </View>

        <View style={styles.ligneContact}>
          <View style={styles.iconeContact}>
            <Ionicons
              name="location"
              size={22}
              color="#079DA6"
            />
          </View>
          <View style={styles.information}>
            <Text style={styles.label}>Adresse</Text>
            <Text style={styles.valeur}>
              Madagascar
            </Text>
          </View>
        </View>
      </View>

      {/* Formulaire */}
      <View style={styles.carte}>
        <Text style={styles.titreSection}>
          Envoyez-nous un message
        </Text>

        <Text style={styles.labelChamp}>
          Nom complet *
        </Text>
        <TextInput
          style={styles.champ}
          placeholder="Votre nom complet"
          placeholderTextColor="#8994A5"
          value={nom}
          onChangeText={setNom}
          autoCapitalize="words"
        />

        <Text style={styles.labelChamp}>
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
        />

        <Text style={styles.labelChamp}>
          Sujet
        </Text>
        <TextInput
          style={styles.champ}
          placeholder="Objet de votre message"
          placeholderTextColor="#8994A5"
          value={sujet}
          onChangeText={setSujet}
        />

        <Text style={styles.labelChamp}>
          Votre message *
        </Text>
        <TextInput
          style={[styles.champ, styles.champMessage]}
          placeholder="Écrivez votre message ici..."
          placeholderTextColor="#8994A5"
          value={message}
          onChangeText={setMessage}
          multiline
          textAlignVertical="top"
        />

        <Pressable
          style={styles.bouton}
          onPress={envoyerMessage}
        >
          <Text style={styles.texteBouton}>
            Envoyer le message
          </Text>
          <Ionicons
            name="send"
            size={19}
            color="#FFFFFF"
          />
        </Pressable>
      </View>

      {/* Pied de page */}
      <View style={styles.piedPage}>
        <Ionicons
          name="people"
          size={24}
          color="#079DA6"
        />
        <Text style={styles.textePiedPage}>
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
    paddingHorizontal: 24,
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
    fontSize: 15,
    color: '#E5F6F6',
    textAlign: 'center',
    lineHeight: 23,
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
  ligneContact: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 18,
  },
  iconeContact: {
    width: 45,
    height: 45,
    borderRadius: 23,
    backgroundColor: '#E5F7F7',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  information: {
    flex: 1,
  },
  label: {
    fontSize: 14,
    fontWeight: 'bold',
    color: '#183568',
    marginBottom: 4,
  },
  valeur: {
    fontSize: 13,
    color: '#526078',
  },
  labelChamp: {
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
  champMessage: {
    height: 120,
    paddingTop: 14,
  },
  bouton: {
    backgroundColor: '#079DA6',
    borderRadius: 12,
    padding: 16,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 10,
    marginTop: 8,
  },
  texteBouton: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  piedPage: {
    alignItems: 'center',
    marginTop: 28,
    paddingHorizontal: 20,
  },
  textePiedPage: {
    color: '#183568',
    fontSize: 15,
    fontWeight: 'bold',
    marginTop: 8,
    textAlign: 'center',
  },
  slogan: {
    color: '#079DA6',
    fontSize: 13,
    marginTop: 5,
  },
});
import EcranOnglet from '../components/EcranOnglet';

export default function Contacts() {
  return <EcranOnglet titre="Mes contacts" />;
}
