import { createContext, useContext, useState } from 'react';

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [utilisateur, setUtilisateur] = useState(null);

  function connecter(infosUtilisateur) {
    setUtilisateur(infosUtilisateur);
  }

  function deconnecter() {
    setUtilisateur(null);
  }

  return (
    <AuthContext.Provider
      value={{
        utilisateur,
        connecter,
        deconnecter,
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