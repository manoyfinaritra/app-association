import { create } from 'axios';
import Constants from 'expo-constants';

const hoteExpo = Constants.expoConfig?.hostUri;
const adresse = new URL(`http://${hoteExpo || 'localhost:3000'}`);
adresse.port = '3000';

const api = create({
  baseURL: process.env.EXPO_PUBLIC_API_URL || adresse.origin,
 timeout: 10000,
});
export default api;
