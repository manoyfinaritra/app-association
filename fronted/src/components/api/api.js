import axios from 'axios';
import Constants from 'expo-constants';

// ohatra : "192.168.1.100:8081"
const adresseExpo = Constants.expoConfig?.hostUri;

if (!adresseExpo) {
  throw new Error("Impossible de récupérer l'adresse du serveur Expo.");
}


const adresseBackend = new URL(`http://${adresseExpo}`);
adresseBackend.port = '3000';

const api = axios.create({
  baseURL: adresseBackend.origin,
  timeout: 10000,
});

export default api;