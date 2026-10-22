import React from 'react';
import { View, Text, StyleSheet, ScrollView, Platform, TouchableOpacity, Linking, Alert } from 'react-native';
import { WebView } from 'react-native-webview';
import { Ionicons } from '@expo/vector-icons';

export default function Guide() {

  // Lien de votre chaîne
  const videoUrl = 'https://www.youtube.com/@niryinfo9800';

  // Fonction pour ouvrir le lien externe (dans l'app YouTube ou le navigateur)
  const ouvrirLienYoutube = async () => {
    try {
      const supported = await Linking.canOpenURL(videoUrl);
      if (supported) {
        await Linking.openURL(videoUrl);
      } else {
        Alert.alert("Erreur", "Impossible d'ouvrir ce lien sur votre appareil.");
      }
    } catch (error) {
      Alert.alert("Erreur", "Une erreur est survenue lors de l'ouverture du lien.");
    }
  };

  return (
    <ScrollView style={styles.container} contentContainerStyle={styles.content}>
      {/* En-tête de bienvenue */}
      <View style={styles.header}>
        <Text style={styles.title}>Mon espace client</Text>
        
        <Text style={styles.subtitle}>
          Bienvenue dans votre tableau de bord <Text style={styles.aemText}>AEM</Text>.
        </Text>
      </View>

      {/* Section Vidéo YouTube */}
      <View style={styles.videoCard}>
        <View style={styles.videoHeader}>
          <View style={styles.iconContainer}>
            <Ionicons name="logo-youtube" size={24} color="#FF0000" />
          </View>
          <Text style={styles.guideTitle}>Guide Vidéo</Text>
        </View>

        {/* Le lecteur vidéo (WebView) */}
        <View style={styles.webViewContainer}>
          <WebView
            style={styles.webView}
            javaScriptEnabled={true}
            domStorageEnabled={true}
            source={{ uri: videoUrl }}
            allowsInlineMediaPlayback={true}
            mediaPlaybackRequiresUserAction={false}
            userAgent="Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36"
            // Bloque les clics vers l'extérieur pour rester sur la chaîne
            onShouldStartLoadWithRequest={(request) => {
              if (
                request.url.includes('@niryinfo9800') || 
                request.url.includes('youtube.com') ||
                request.url.includes('youtube-nocookie.com') ||
                request.url.startsWith('about:blank')
              ) {
                return true;
              }
              return false; 
            }}
          />
        </View>

        <Text style={styles.guideDescription}>
          Découvrez les vidéos de l'association sur notre chaîne YouTube.
        </Text>

        {/* 🔗 LE LIEN EN BAS */}
        <TouchableOpacity 
          style={styles.linkButton} 
          onPress={ouvrirLienYoutube}
          activeOpacity={0.7}
        >
          <Ionicons name="open-outline" size={18} color="#10B981" style={{ marginRight: 8 }} />
          <Text style={styles.linkButtonText}>Voir sur YouTube</Text>
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
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.05,
    shadowRadius: 8,
    elevation: 3,
    marginBottom: 20,
  },
  videoHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
  },
  iconContainer: {
    width: 40,
    height: 40,
    borderRadius: 8,
    backgroundColor: '#FFEBEE',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10,
  },
  guideTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#183568',
  },
  webViewContainer: {
    width: '100%',
    height: 400, 
    borderRadius: 12,
    overflow: 'hidden',
    backgroundColor: '#000',
    marginBottom: 10,
  },
  webView: {
    flex: 1,
  },
  guideDescription: {
    fontSize: 13,
    color: '#64748B',
    lineHeight: 18,
    textAlign: 'center', 
    marginTop: 5,
    marginBottom: 15, 
  },
  
  // 🆕 Styles pour le lien en bas
  linkButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 10,
    borderTopWidth: 1,
    borderTopColor: '#F0F4F8',
    marginTop: 5,
  },
  linkButtonText: {
    color: '#10B981', // Vert AEM
    fontSize: 14,
    fontWeight: '600',
  },
});