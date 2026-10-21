import React, { createContext, useContext, useState } from 'react';

const LanguageContext = createContext(null);

const translations = {
  fr: {
    // Navigation / Titres
    homeTab: 'Accueil',
    advantagesTab: 'Avantages',
    contactTab: 'Contacts',
    registrationTab: 'Inscription',

    // Accueil
    homeTitle: "L'entraide, simplement, où que vous soyez !",
    homeDescription:
      "Que vous soyez étudiant, professionnel ou particulier, l'Association d'Entraide Madagascar vous accompagne : formations, événements, cotisations transparentes et une communauté qui avance ensemble.",
    becomeMember: 'Devenir membre',
    discover: "Découvrir l'association",
    trainings: 'Formations',
    events: 'Événements',
    contributions: 'Cotisations suivies',
    community: 'Communauté',
    together: 'Ensemble, avançons !',

    // Avantages
    advantages: 'Nos avantages',
    advantagesSubtitle: 'Ensemble, avançons plus loin avec AEM !',
    solidarity: 'Entraide et solidarité',

    // Contact
    contact: 'Contactez-nous',
    question: 'Une question ou une suggestion ?',
    contactTeam: "L'équipe AEM est là pour vous écouter.",
    coordinates: 'Nos coordonnées',
    email: 'Adresse email',
    phone: 'Téléphone',
    address: 'Adresse',
    sendMessage: 'Envoyez-nous un message',
    fullName: 'Nom complet',
    subject: 'Sujet',
    yourMessage: 'Votre message',
    send: 'Envoyer le message',
    missingFields: 'Champs obligatoires',
    fillRequired: 'Veuillez remplir votre nom, votre email et votre message.',
    messagePrepared: 'Message préparé',
    messageNotSent: "Merci de contacter l'Association d'Entraide Madagascar !\n\nPour envoyer réellement votre message, un service d'envoi doit être configuré.",
    placeholderName: 'Votre nom complet',
    placeholderEmail: 'exemple@email.com',
    placeholderSubject: 'Objet de votre message',
    placeholderMessage: 'Écrivez votre message ici...',
    valEmail: 'À compléter avec votre adresse email',
    valPhone: 'À compléter avec votre numéro',
    valAddress: 'Madagascar',

    // Général
    association: "Association d'Entraide Madagascar",
    slogan: 'Ensemble, avançons !',
  },

  en: {
    // Navigation / Titles
    homeTab: 'Home',
    advantagesTab: 'Benefits',
    contactTab: 'Contact',
    registrationTab: 'Register',

    // Home
    homeTitle: 'Helping each other, wherever you are!',
    homeDescription:
      'Whether you are a student, a professional or an individual, the Madagascar Mutual Aid Association supports you through training, events, transparent contributions and a community moving forward together.',
    becomeMember: 'Become a member',
    discover: 'Discover the association',
    trainings: 'Training',
    events: 'Events',
    contributions: 'Contribution tracking',
    community: 'Community',
    together: 'Together, let’s move forward!',

    // Advantages
    advantages: 'Our benefits',
    advantagesSubtitle: 'Let’s go further together with AEM!',
    solidarity: 'Mutual aid and solidarity',

    // Contact
    contact: 'Contact us',
    question: 'Do you have a question or suggestion?',
    contactTeam: 'The AEM team is here to listen.',
    coordinates: 'Our contact details',
    email: 'Email address',
    phone: 'Phone',
    address: 'Address',
    sendMessage: 'Send us a message',
    fullName: 'Full name',
    subject: 'Subject',
    yourMessage: 'Your message',
    send: 'Send message',
    missingFields: 'Required fields',
    fillRequired: 'Please fill in your name, email, and message.',
    messagePrepared: 'Message prepared',
    messageNotSent: 'Thank you for contacting the Madagascar Mutual Aid Association!\n\nA messaging service must be configured to actually send your message.',
    placeholderName: 'Your full name',
    placeholderEmail: 'example@email.com',
    placeholderSubject: 'Message subject',
    placeholderMessage: 'Write your message here...',
    valEmail: 'To be completed with your email',
    valPhone: 'To be completed with your number',
    valAddress: 'Madagascar',

    // General
    association: 'Madagascar Mutual Aid Association',
    slogan: 'Together, let’s move forward!',
  },
};

export function LanguageProvider({ children }) {
  const [language, setLanguage] = useState('fr');

  const t = (key) => translations[language][key] ?? key;

  return (
    <LanguageContext.Provider value={{ language, setLanguage, t }}>
      {children}
    </LanguageContext.Provider>
  );
}

export function useLanguage() {
  const context = useContext(LanguageContext);
  if (!context) {
    throw new Error('useLanguage must be used inside LanguageProvider');
  }
  return context;
}