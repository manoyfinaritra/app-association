import { useState } from 'react';
import { router } from 'expo-router';
import Ionicons from '@expo/vector-icons/Ionicons';
import { ActivityIndicator, Image, Pressable, Text, View } from 'react-native';
import { useAuth } from '../../context/AuthContext';
import useProfil from '../../hooks/useProfil';
import useListeClient from '../../hooks/useListeClient';
import ListeClient from '../../components/ListeClient';
import FormulaireProfil from '../../components/FormulaireProfil';
import styles from '../../components/stylesProfil';
import { afficherDate, afficherMontant } from '../../utils/format';

function Information({ icone, titre, valeur }) {
  if (!valeur) return null;
  return (
    <View style={styles.ligne}>
      <Ionicons name={icone} size={21} color="#667587" />
      <View style={{ flex: 1 }}>
        <Text style={styles.libelle}>{titre}</Text>
        <Text style={styles.valeur}>{valeur}</Text>
      </View>
    </View>
  );
}

function Statistique({ valeur, titre }) {
  return <View style={styles.statistique}>
    <Text style={styles.chiffre}>{valeur ?? '—'}</Text>
    <Text style={styles.legende}>{titre}</Text>
  </View>;
}

function PhotoProfil({ photo, initiales }) {
  const [photoEnErreur, setPhotoEnErreur] = useState(false);
  return <View style={styles.avatar}>
    {photo && !photoEnErreur
      ? <Image source={{ uri: photo }} accessibilityLabel="Votre photo de profil" style={styles.photo} onError={() => setPhotoEnErreur(true)} />
      : <Text style={styles.initiales}>{initiales}</Text>}
  </View>;
}

export default function Profil() {
  const { utilisateur, deconnecter } = useAuth();
  const profil = useProfil();
  const publications = useListeClient('mes-publications');
  const [onglet, setOnglet] = useState('publications');
  const [edition, setEdition] = useState(false);
  const [confirmation, setConfirmation] = useState(false);
  const [message, setMessage] = useState('');
  if (!utilisateur) return null;

  const stats = profil.statistiques;
  const nom = [utilisateur.prenom, utilisateur.nom].filter(Boolean).join(' ');
  const initiales = [utilisateur.prenom, utilisateur.nom].map(texte => texte?.[0] || '').join('').toUpperCase();
  const lieu = [utilisateur.ville, utilisateur.region, utilisateur.pays].filter(Boolean).join(', ');
  const adhesionValidee = stats && Number(stats.adhesion_validee) === 1;

  async function actualiser(ajouter = false) {
    if (ajouter) return publications.charger(true);
    await Promise.all([profil.charger(), publications.charger()]);
  }

  const entete = <>
    <View style={styles.couverture}>
      <View style={styles.cercle} /><View style={styles.cercleClair} />
      <Text style={styles.marque}>AEM</Text>
      <Text style={styles.devise}>Ensemble, on va plus loin.</Text>
    </View>
    <View style={styles.presentation}>
      <PhotoProfil key={utilisateur.photo || 'sans-photo'} photo={utilisateur.photo} initiales={initiales || 'A'} />
      <Text accessibilityRole="header" style={styles.nom}>{nom || 'Mon profil'}</Text>
      <Text style={styles.sousTitre}>{utilisateur.fonction || 'Membre AEM'} · N° {utilisateur.id}</Text>
      {utilisateur.date_adhesion && <Text style={styles.sousTitre}>Membre depuis le {afficherDate(utilisateur.date_adhesion)}</Text>}
      {!!stats && <View style={styles.badge}>
        <Ionicons name={adhesionValidee ? 'checkmark-circle' : 'time-outline'} size={16} color="#176848" />
        <Text style={styles.texteBadge}>{adhesionValidee ? 'Adhésion validée' : 'Adhésion en attente'}</Text>
      </View>}
      <View style={styles.actions}>
        <Pressable accessibilityRole="button" disabled={profil.chargement || !stats}
          accessibilityState={{ disabled: profil.chargement || !stats }}
          style={[styles.bouton, (profil.chargement || !stats) && { opacity: 0.5 }]}
          onPress={() => { setEdition(!edition); setMessage(''); }}>
          <Ionicons name="create-outline" size={18} color="#fff" />
          <Text style={styles.texteBouton}>{edition ? 'Fermer le formulaire' : 'Modifier mes infos'}</Text>
        </Pressable>
        <Pressable accessibilityRole="button" style={[styles.bouton, styles.secondaire]} onPress={() => router.push('/(client)/cotisation')}>
          <Ionicons name="wallet-outline" size={18} color="#24364a" />
          <Text style={[styles.texteBouton, styles.texteSecondaire]}>Mes cotisations</Text>
        </Pressable>
      </View>
      <View style={styles.statistiques}>
        <Statistique valeur={stats?.publications} titre="Publications" />
        <Statistique valeur={stats?.formations} titre="Formations" />
        <Statistique valeur={stats?.presences} titre="Présences" />
      </View>
      {!!profil.erreur && <Pressable accessibilityRole="button" onPress={() => profil.charger()}><Text style={styles.erreur}>{profil.erreur} Toucher pour réessayer.</Text></Pressable>}
      {profil.chargement && <ActivityIndicator color="#1877f2" accessibilityLabel="Actualisation du profil" />}
      <View style={styles.onglets}>
        {['publications', 'informations'].map(valeur => (
          <Pressable key={valeur} accessibilityRole="tab" accessibilityState={{ selected: onglet === valeur }}
            style={[styles.onglet, onglet === valeur && styles.ongletActif]} onPress={() => setOnglet(valeur)}>
            <Text style={[styles.texteOnglet, onglet === valeur && styles.texteOngletActif]}>{valeur === 'publications' ? 'Publications' : 'À propos'}</Text>
          </Pressable>
        ))}
      </View>
    </View>
    {!!message && <Text accessibilityRole="alert" style={styles.succes}>{message}</Text>}
    {edition && <FormulaireProfil onFermer={() => setEdition(false)} onEnregistre={() => { setEdition(false); setMessage('Vos informations ont été mises à jour.'); }} />}
    <View style={styles.carte}>
      <Text style={styles.titre}>Intro</Text>
      <Information icone="location-outline" titre="Habite à" valeur={lieu} />
      <Information icone="briefcase-outline" titre="Fonction" valeur={utilisateur.fonction} />
      <Information icone="heart-outline" titre="Cotisations validées" valeur={stats ? afficherMontant(stats.cotisations) : null} />
      {!lieu && !utilisateur.fonction && !stats && <Text style={styles.valeur}>Complétez vos informations pour présenter votre profil.</Text>}
    </View>
    {onglet === 'informations' && <View style={styles.carte}>
      <Text style={styles.titre}>Informations personnelles</Text>
      <Information icone="call-outline" titre="Téléphone" valeur={utilisateur.telephone} />
      <Information icone="mail-outline" titre="Email" valeur={utilisateur.email} />
      <Information icone="gift-outline" titre="Date de naissance" valeur={utilisateur.date_de_naissance ? afficherDate(utilisateur.date_de_naissance) : null} />
      <Information icone="navigate-outline" titre="Lieu de naissance" valeur={utilisateur.lieu_de_naissance} />
      <Information icone="person-outline" titre="Sexe" valeur={utilisateur.sexe === 'M' ? 'Masculin' : utilisateur.sexe === 'F' ? 'Féminin' : null} />
      <Text style={styles.libelle}>Ces informations sont visibles dans votre espace personnel.</Text>
    </View>}
    <View style={styles.carte}>
      {confirmation ? <>
        <Text style={styles.valeur}>Voulez-vous vous déconnecter ?</Text>
        <Pressable accessibilityRole="button" onPress={deconnecter}><Text style={styles.deconnexion}>Confirmer la déconnexion</Text></Pressable>
        <Pressable accessibilityRole="button" onPress={() => setConfirmation(false)}><Text style={styles.lien}>Annuler</Text></Pressable>
      </> : <Pressable accessibilityRole="button" onPress={() => setConfirmation(true)}><Text style={styles.deconnexion}>Se déconnecter</Text></Pressable>}
    </View>
    {onglet === 'publications' && <Text style={[styles.titre, { marginBottom: 16 }]}>Mes publications</Text>}
  </>;

  return <View style={styles.page}>
    <ListeClient entete={entete}
      liste={{ ...publications, charger: actualiser,
        donnees: onglet === 'publications' ? publications.donnees : [],
        suite: onglet === 'publications' && publications.suite,
        erreur: onglet === 'publications' ? publications.erreur : '',
        chargement: onglet === 'publications' ? publications.chargement : profil.chargement }}
      messageVide={onglet === 'publications' ? 'Vous n’avez pas encore publié d’actualité.' : ''}
      renderItem={({ item }) => <View style={styles.carte}>
        <Text style={styles.titre}>{nom}</Text>
        <Text style={styles.libelle}>{afficherDate(item.date)} · {Number(item.valide) === 1 ? 'Publiée' : 'En attente de validation'}</Text>
        <Text style={styles.valeur}>{item.description || 'Publication sans texte.'}</Text>
      </View>}
    />
  </View>;
}
