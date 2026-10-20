import api from '../components/api/api';
import { createContext, useCallback, useContext, useState } from 'react';

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [utilisateur, setUtilisateur] = useState(null);

  function connecter(infosUtilisateur, jeton) {
    api.defaults.headers.common.Authorization = `Bearer ${jeton}`;
    setUtilisateur(infosUtilisateur);
  }

  const deconnecter = useCallback(() => {
    api.post('/client/deconnexion').catch(() => {});
    delete api.defaults.headers.common.Authorization;
    setUtilisateur(null);
  }, []);

  const actualiserUtilisateur = useCallback((informations) => {
    setUtilisateur(ancien => ancien ? { ...ancien, ...informations } : null);
  }, []);

  return (
    <AuthContext.Provider
      value={{
        utilisateur,
        connecter,
        deconnecter,
        actualiserUtilisateur,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const contexte = useContext(AuthContext);

  if (!contexte) {
    throw new Error(
      'useAuth doit être utilisé dans AuthProvider'
    );
  }

  return contexte;
}