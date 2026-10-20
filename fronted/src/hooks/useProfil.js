import { useCallback, useState } from 'react';
import { useFocusEffect } from 'expo-router';
import { isAxiosError } from 'axios';
import api from '../components/api/api';
import { useAuth } from '../context/AuthContext';

export default function useProfil() {
  const { actualiserUtilisateur, deconnecter } = useAuth();
  const [statistiques, setStatistiques] = useState(null);
  const [erreur, setErreur] = useState('');
  const [chargement, setChargement] = useState(true);

  const charger = useCallback(async (signal) => {
    setChargement(true);
    setErreur('');
    try {
      const { data } = await api.get('/client/profil', { signal });
      if (signal?.aborted) return;
      actualiserUtilisateur(data.utilisateur);
      setStatistiques(data.statistiques);
    } catch (e) {
      if (signal?.aborted) return;
      if (isAxiosError(e) && e.response?.status === 401) deconnecter();
      else setErreur('Impossible d’actualiser votre profil. Réessayez.');
    } finally {
      if (!signal?.aborted) setChargement(false);
    }
  }, [actualiserUtilisateur, deconnecter]);

  useFocusEffect(useCallback(() => {
    const controleur = new AbortController();
    charger(controleur.signal);
    return () => controleur.abort();
  }, [charger]));

  return { statistiques, erreur, chargement, charger };
}
