import { Text, StyleSheet, View, Image, Pressable } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useLanguage } from '../context/LanguageContext';

export default function Header() {
  const { language, setLanguage, t } = useLanguage();

  return (
    <SafeAreaView edges={['top', 'left', 'right']} style={styles.entete}>
      <View style={styles.topRow}>
        <View style={styles.logoContainer}>
          <Image source={require('../../assets/logo.png')} style={styles.logo} />
          <Text style={styles.titre}>AEM</Text>
        </View>

        <View style={styles.langSwitch}>
          <Pressable 
            style={[styles.langBtn, language === 'fr' && styles.langActive]} 
            onPress={() => setLanguage('fr')}
          >
            <Text style={[styles.langText, language === 'fr' && styles.langTextActive]}>FR</Text>
          </Pressable>
          <Pressable 
            style={[styles.langBtn, language === 'en' && styles.langActive]} 
            onPress={() => setLanguage('en')}
          >
            <Text style={[styles.langText, language === 'en' && styles.langTextActive]}>EN</Text>
          </Pressable>
        </View>
      </View>

      <Text style={styles.sousTitre}>{t('association')}</Text>
     <View style={{ flexDirection: 'row', alignItems: 'center', gap: 10 }}>
       <View style={styles.logoContainer}>
        <Image
          source={require('../../assets/logo.png')}
          style={styles.logo} 
        />
      </View>   
       <Text style={styles.titre}>AEM</Text>  
     </View>
      <Text style={styles.sousTitre}>Associations d'Entraide Madagascar</Text>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  entete: {
    backgroundColor: '#f4f8f8',
    paddingHorizontal: 20,
    paddingVertical: 15,
    borderBottomWidth: 5,
    borderBottomColor: '#e0e0e0',
  },
  topRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  titre: {
    color: '#078330',
    fontSize: 22,
    fontWeight: 'bold',
  },
  sousTitre: {
    color: '#7e7c7c',
    fontSize: 10,
    marginTop: 5,
  },
  logo: {
    width: '100%',
    resizeMode: 'contain',
    borderRadius: 100,
  },
  logoContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    width: 50,
    height: 50,
    gap: 6,
  },
  langSwitch: {
    flexDirection: 'row',
    backgroundColor: '#e0e0e0',
    borderRadius: 8,
    padding: 2,
    gap: 2,
  },
  langBtn: {
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 6,
  },
  langActive: {
    backgroundColor: '#079DA6',
  },
  langText: {
    fontSize: 12,
    fontWeight: 'bold',
    color: '#555',
  },
  langTextActive: {
    color: '#FFF',
  },
  logoContainer :{
    flexDirection : 'row',
   
    alignItems : 'center',
    width : 50,
    height : 50,
    gap : 6,

   }
});