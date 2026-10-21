import { useCallback, useEffect, useRef, useState } from 'react';
import { isAxiosError } from 'axios';
import api from '../components/api/api';
import { useAuth } from '../context/AuthContext';

// Chargement commun aux listes : recherche, actualisation et pages suivantes.
export default function useListeClient(ressource, recherche = '', periode = '') {
  const { deconnecter } = useAuth();
  const [donnees, setDonnees] = useState([]);
  const [chargement, setChargement] = useState(true);
  const [erreur, setErreur] = useState('');
  const [suite, setSuite] = useState(false);
  const page = useRef(0);
  const requete = useRef(null);

  const charger = useCallback(async (ajouter = false) => {
    requete.current?.abort();
    const controleur = new AbortController();
    requete.current = controleur;
    setChargement(true);
    setErreur('');
    const prochainePage = ajouter ? page.current + 1 : 1;
    try {
      const reponse = await api.get(`/client/${ressource}`, {
        params: { q: recherche, periode, page: prochainePage },
        signal: controleur.signal,
      });
      if (controleur.signal.aborted) return;
      setDonnees(anciennes => ajouter
        ? [...anciennes, ...reponse.data.donnees]
        : reponse.data.donnees);
      page.current = prochainePage;
      setSuite(reponse.data.suite);
    } catch (e) {
      if (controleur.signal.aborted) return;
      if (isAxiosError(e) && e.response?.status === 401) {
        deconnecter();
        return;
      }
      setErreur('Impossible de charger la liste. Vérifiez votre connexion puis réessayez.');
    } finally {
      if (!controleur.signal.aborted) setChargement(false);
    }
  }, [ressource, recherche, periode, deconnecter]);

  useEffect(() => {
    // Éviter une requête à chaque lettre saisie.
    const attente = setTimeout(() => {
      setDonnees([]);
      setSuite(false);
      page.current = 0;
      charger();
    }, 300);
    return () => {
      clearTimeout(attente);
      requete.current?.abort();
    };
  }, [charger]);

  return { donnees, chargement, erreur, suite, charger };
}
