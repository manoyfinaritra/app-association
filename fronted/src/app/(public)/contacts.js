
import React, { useState } from 'react';
import {
  View,
  Text,
  TextInput,
  ScrollView,
  Pressable,
  StyleSheet,
  Alert,
  Linking,
   KeyboardAvoidingView,
  Keyboard,
  Platform,
} from 'react-native';

import { Ionicons } from '@expo/vector-icons';
import { useLanguage } from '../../context/LanguageContext';

export default function Contact() {
  const { t } = useLanguage();

  const [nom, setNom] = useState('');
  const [email, setEmail] = useState('');
  const [sujet, setSujet] = useState('');
  const [message, setMessage] = useState('');

  const telephone = '+261 34 70 840 46';
  const telephoneWhatsApp = '261347084046';
  const emailAssociation =
    'association-entraide-madagascar@gmail.com';

  
  const ouvrirLien = async (url) => {
    try {
      await Linking.openURL(url);
    } catch (error) {
      Alert.alert(
        'Impossible d’ouvrir le lien',
        'Vérifiez que l’application nécessaire est installée.'
      );
    }
  };

  
  const ouvrirEmail = () => {
    ouvrirLien(`mailto:${emailAssociation}`);
  };

  const appelerAssociation = () => {
    ouvrirLien(`tel:${telephone.replace(/\s/g, '')}`);
  };

  
  const ouvrirWhatsApp = () => {
    ouvrirLien(`https://wa.me/${telephoneWhatsApp}`);
  };

  
  const ouvrirFacebook = () => {
    ouvrirLien('https://www.facebook.com/');
  };

  const envoyerMessage = () => {
     Keyboard.dismiss();
    if (!nom.trim() || !email.trim() || !message.trim()) {
      Alert.alert(t('missingFields'), t('fillRequired'));
      return;
    }

    const emailValide = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailValide.test(email.trim())) {
      Alert.alert(
        'E-mail invalide',
        'Veuillez saisir une adresse e-mail valide.'
      );
      return;
    }

    const sujetFinal = sujet.trim() || 'Message depuis le site AEM';

    const corpsMessage =
      `Nom : ${nom.trim()}\n` +
      `E-mail : ${email.trim()}\n\n` +
      `Message :\n${message.trim()}`;

    const url =
      `mailto:${emailAssociation}` +
      `?subject=${encodeURIComponent(sujetFinal)}` +
      `&body=${encodeURIComponent(corpsMessage)}`;

    ouvrirLien(url);
  };

  return (
    <KeyboardAvoidingView
     style={{ flex: 1 }}
    behavior={Platform.OS === 'ios' ? 'padding' : undefined}>  
      <ScrollView
      style={styles.fond}
      contentContainerStyle={styles.contenu}
      showsVerticalScrollIndicator={false}
      keyboardShouldPersistTaps="handled"
    >
     
      <View style={styles.entete}>
        <View style={styles.iconeEntete}>
          <Ionicons
            name="mail-outline"
            size={32}
            color="#079DA6"
          />
        </View>

        <Text style={styles.titre}>{t('contact')}</Text>

        <Text style={styles.sousTitre}>
          {t('question')}
          {'\n'}
          {t('contactTeam')}
        </Text>
      </View>

      
      <View style={styles.carte}>
        <Text style={styles.titreSection}>
          {t('coordinates')}
        </Text>

        {/* E-mail */}
        <Pressable
          style={styles.ligneContact}
          onPress={ouvrirEmail}
        >
          <View style={styles.iconeContact}>
            <Ionicons
              name="mail"
              size={22}
              color="#079DA6"
            />
          </View>

          <View style={styles.information}>
            <Text style={styles.label}>E-mail</Text>
            <Text style={styles.valeur}>
              {emailAssociation}
            </Text>
          </View>

          <Ionicons
            name="open-outline"
            size={18}
            color="#64748B"
          />
        </Pressable>

        
        <Pressable
          style={styles.ligneContact}
          onPress={appelerAssociation}
        >
          <View style={styles.iconeContact}>
            <Ionicons
              name="call"
              size={22}
              color="#079DA6"
            />
          </View>

          <View style={styles.information}>
            <Text style={styles.label}>Téléphone</Text>
            <Text style={styles.valeur}>{telephone}</Text>
          </View>

          <Ionicons
            name="open-outline"
            size={18}
            color="#64748B"
          />
        </Pressable>

        {/* WhatsApp */}
        <Pressable
          style={styles.ligneContact}
          onPress={ouvrirWhatsApp}
        >
          <View
            style={[
              styles.iconeContact,
              styles.iconeWhatsApp,
            ]}
          >
            <Ionicons
              name="logo-whatsapp"
              size={22}
              color="#25D366"
            />
          </View>

          <View style={styles.information}>
            <Text style={styles.label}>WhatsApp</Text>
            <Text style={styles.valeur}>{telephone}</Text>
          </View>

          <Ionicons
            name="open-outline"
            size={18}
            color="#64748B"
          />
        </Pressable>

        {/* Facebook */}
        <Pressable
          style={[styles.ligneContact, styles.derniereLigne]}
          onPress={ouvrirFacebook}
        >
          <View
            style={[
              styles.iconeContact,
              styles.iconeFacebook,
            ]}
          >
            <Ionicons
              name="logo-facebook"
              size={22}
              color="#1877F2"
            />
          </View>

          <View style={styles.information}>
            <Text style={styles.label}>Facebook</Text>
            <Text style={styles.valeur}>AEM</Text>
          </View>

          <Ionicons
            name="open-outline"
            size={18}
            color="#64748B"
          />
        </Pressable>
      </View>

      {/* Formulaire de contact */}
      <View style={styles.carte}>
        <Text style={styles.titreSection}>
          {t('sendMessage')}
        </Text>

        <Text style={styles.labelChamp}>
          {t('fullName')} *
        </Text>

        <TextInput
          style={styles.champ}
          placeholder={t('placeholderName')}
          placeholderTextColor="#8994A5"
          value={nom}
          onChangeText={setNom}
          autoCapitalize="words"
          returnKeyType="next"
        />

        <Text style={styles.labelChamp}>
          {t('email')} *
        </Text>

        <TextInput
          style={styles.champ}
          placeholder={t('placeholderEmail')}
          placeholderTextColor="#8994A5"
          value={email}
          onChangeText={setEmail}
          keyboardType="email-address"
          autoCapitalize="none"
          autoCorrect={false}
          returnKeyType="next"
          
        />

        <Text style={styles.labelChamp}>
          {t('subject')}
        </Text>

        <TextInput
          style={styles.champ}
          placeholder={t('placeholderSubject')}
          placeholderTextColor="#8994A5"
          value={sujet}
          onChangeText={setSujet}
          returnKeyType="next"
        />

        <Text style={styles.labelChamp}>
          {t('yourMessage')} *
        </Text>

        <TextInput
          style={[styles.champ, styles.champMessage]}
          placeholder={t('placeholderMessage')}
          placeholderTextColor="#8994A5"
          value={message}
          onChangeText={setMessage}
          multiline
          textAlignVertical="top"
        />

        <Pressable
          style={({ pressed }) => [
            styles.bouton,
            pressed && styles.boutonPresse,
          ]}
          onPress={envoyerMessage}
        >
          <Text style={styles.texteBouton}>
            {t('send')}
          </Text>

          <Ionicons
            name="send"
            size={19}
            color="#FFFFFF"
          />
        </Pressable>

        <Text style={styles.noteFormulaire}>
          Votre application de messagerie s'ouvrira avec
          le message prérempli. Vous devrez confirmer
          l'envoi depuis cette application.
        </Text>
      </View>

      {/* Pied de page */}
      <View style={styles.piedPage}>
        <Ionicons
          name="people"
          size={24}
          color="#079DA6"
        />

        <Text style={styles.textePiedPage}>
          {t('association')}
        </Text>

        <Text style={styles.slogan}>
          {t('slogan')}
        </Text>
      </View>
    </ScrollView>
    </KeyboardAvoidingView>
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

  derniereLigne: {
    marginBottom: 0,
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

  iconeWhatsApp: {
    backgroundColor: '#E8F9EF',
  },

  iconeFacebook: {
    backgroundColor: '#EAF2FF',
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
    lineHeight: 19,
    flexShrink: 1,
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

  boutonPresse: {
    opacity: 0.8,
  },

  texteBouton: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },

  noteFormulaire: {
    fontSize: 12,
    color: '#64748B',
    lineHeight: 18,
    marginTop: 12,
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
    textAlign: 'center',
  },
});