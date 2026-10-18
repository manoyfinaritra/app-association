import { Text, StyleSheet, View,Image } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function Header() {
  return (
    <SafeAreaView edges={['top', 'left', 'right']} style={styles.entete}>
      <View style={styles.logoContainer}>
        <Image
          source={require('../../assets/logo.png')}
          style={styles.logo}
        />
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
  logo : {
    width : "100%",
    resizeMode : 'contain',
    borderRadius : 100,
  },
  logoContainer :{
    flexDirection : 'row',
    alignItems : 'center',
    width : 50,
    height : 50,
    gap : 6
   }
});