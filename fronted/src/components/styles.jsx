import {StyleSheet} from "react-native"

export const styles = StyleSheet.create({
    
     barre: {
    backgroundColor: '#ffffff',
    borderTopColor: '#e2e8f0',
    borderTopWidth: 1,
   
    paddingTop: 5,
    
    elevation: 8,
  },

  onglet: {
    borderRadius: 12,
    marginHorizontal: 2,
  },

  libelle: {
    fontSize: 11,
    fontWeight: '600',
  },
  
  container: {
    flex: 1,
    backgroundColor: '#F4F9FA',
  },
  entete: {
    backgroundColor: '#073B5C',
    padding: 28,
    paddingTop: 35,
    paddingBottom: 35,
    borderBottomLeftRadius: 25,
    borderBottomRightRadius: 25,
  },
  titre: {
    fontSize: 27,
    fontWeight: 'bold',
    color: '#FFFFFF',
    marginBottom: 8,
  },
  sousTitre: {
    fontSize: 14,
    color: '#E5F6F6',
  },
  carte: {
    backgroundColor: '#FFFFFF',
    marginHorizontal: 18,
    marginTop: 18,
    padding: 20,
    borderRadius: 16,
    elevation: 3,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
  },
  conteneurIcone: {
    backgroundColor: '#E5F6F6',
    padding: 15,
    borderRadius: 50,
    marginBottom: 12,
    alignSelf: 'flex-start',
  },
  titreCarte: {
    fontSize: 19,
    fontWeight: 'bold',
    color: '#073B5C',
    marginBottom: 8,
  },
  description: {
    fontSize: 14,
    color: '#555555',
    lineHeight: 22,
  },
})