import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  Platform,
  TouchableOpacity,
  Linking,
  Alert,
  ActivityIndicator,
} from 'react-native';
import { WebView } from 'react-native-webview';
import { Ionicons } from '@expo/vector-icons';

export default function Guide() {
  const videoUrl = 'https://www.youtube.com/@niryinfo9800';

  async function ouvrirLienYoutube() {
    try {
      await Linking.openURL(videoUrl);
    } catch {
      Alert.alert(
        'Erreur',
        "Impossible d’ouvrir YouTube sur votre appareil."
      );
    }
  }

  function autoriserNavigation(request) {
    if (request.url === 'about:blank') return true;

    try {
      const url = new URL(request.url);

      const domaineAutorise =
        url.hostname === 'youtube.com' ||
        url.hostname.endsWith('.youtube.com') ||
        url.hostname === 'youtube-nocookie.com' ||
        url.hostname.endsWith('.youtube-nocookie.com');

      return url.protocol === 'https:' && domaineAutorise;
    } catch {
      return false;
    }
  }

  return (
    <ScrollView
      style={styles.container}
      contentContainerStyle={styles.content}
      showsVerticalScrollIndicator={false}
    >
      <View style={styles.header}>
        <Text style={styles.title}>Mon espace client</Text>

        <Text style={styles.subtitle}>
          Bienvenue dans votre tableau de bord{' '}
          <Text style={styles.aemText}>AEM</Text>.
        </Text>
      </View>

      <View style={styles.videoCard}>
        <View style={styles.webViewContainer}>
          <WebView
            style={styles.webView}
            source={{ uri: videoUrl }}
            javaScriptEnabled
            domStorageEnabled
            allowsInlineMediaPlayback
            mediaPlaybackRequiresUserAction={false}
            userAgent="Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36"
            onShouldStartLoadWithRequest={autoriserNavigation}

            // Afficher le chargement à l'ouverture de la page.
            startInLoadingState
            renderLoading={() => (
              <View style={styles.chargement}>
                <ActivityIndicator
                  size="large"
                  color="#10B981"
                />

                <Text style={styles.texteChargement}>
                  Chargement de la chaîne YouTube…
                </Text>
              </View>
            )}

            // Afficher un message si la page ne peut pas se charger.
            renderError={() => (
              <View style={styles.chargement}>
                <Ionicons
                  name="cloud-offline-outline"
                  size={42}
                  color="#64748B"
                />

                <Text style={styles.texteErreur}>
                  Impossible de charger la chaîne.
                </Text>

                <Text style={styles.texteChargement}>
                  Vérifiez votre connexion ou utilisez le bouton
                  « Voir sur YouTube » ci-dessous.
                </Text>
              </View>
            )}
          />
        </View>

        <Text style={styles.guideDescription}>
          Découvrez les vidéos de l’association sur notre chaîne
          YouTube.
        </Text>

        <TouchableOpacity
          style={styles.linkButton}
          onPress={ouvrirLienYoutube}
          activeOpacity={0.7}
          accessibilityRole="button"
          accessibilityLabel="Ouvrir la chaîne sur YouTube"
        >
          <Ionicons
            name="open-outline"
            size={18}
            color="#10B981"
          />

          <Text style={styles.linkButtonText}>
            Voir sur YouTube
          </Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F4F9FA',
  },

  content: {
    padding: 20,
    paddingTop: Platform.OS === 'ios' ? 10 : 20,
    paddingBottom: 30,
  },

  header: {
    marginBottom: 25,
  },

  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#073B5C',
    marginBottom: 8,
  },

  subtitle: {
    fontSize: 15,
    color: '#526078',
    lineHeight: 22,
  },

  aemText: {
    color: '#10B981',
    fontWeight: 'bold',
  },

  videoCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    padding: 15,
    borderWidth: 1,
    borderColor: '#DCE5ED',
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 4,
    },
    shadowOpacity: 0.05,
    shadowRadius: 8,
    elevation: 3,
    marginBottom: 20,
  },

  webViewContainer: {
    width: '100%',
    height: 400,
    borderRadius: 12,
    overflow: 'hidden',
    backgroundColor: '#FFFFFF',
    marginBottom: 10,
  },

  webView: {
    flex: 1,
    backgroundColor: '#FFFFFF',
  },

  chargement: {
    ...StyleSheet.absoluteFillObject,
    backgroundColor: '#FFFFFF',
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },

  texteChargement: {
    marginTop: 12,
    fontSize: 14,
    lineHeight: 21,
    color: '#64748B',
    textAlign: 'center',
  },

  texteErreur: {
    marginTop: 12,
    fontSize: 15,
    fontWeight: '600',
    color: '#DC2626',
    textAlign: 'center',
  },

  guideDescription: {
    fontSize: 13,
    color: '#64748B',
    lineHeight: 18,
    textAlign: 'center',
    marginTop: 5,
    marginBottom: 15,
  },

  linkButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    paddingVertical: 12,
    borderTopWidth: 1,
    borderTopColor: '#F0F4F8',
    marginTop: 5,
  },

  linkButtonText: {
    color: '#10B981',
    fontSize: 14,
    fontWeight: '600',
  },
});