import { create } from 'axios';
import Constants from 'expo-constants';

// En développement, le backend utilise la même machine que le serveur Expo.
// Pour un téléphone ou une version publiée, définir EXPO_PUBLIC_API_URL.
const hoteExpo = Constants.expoConfig?.hostUri;
const adresse = new URL(`http://${hoteExpo || 'localhost'}`);
adresse.port = '3000';

const api = create({
  baseURL: process.env.EXPO_PUBLIC_API_URL || adresse.origin,
  timeout: 10000,
});

export default api;
