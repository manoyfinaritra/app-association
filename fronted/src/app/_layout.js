import { Stack } from 'expo-router';
import { LanguageProvider } from '../context/LanguageContext';
import { AuthProvider } from '../context/AuthContext.jsx';

export default function RootLayout() {
  return (
    <LanguageProvider>
      <AuthProvider>
        <Stack screenOptions={{ headerShown: false }}>
          <Stack.Screen name="(public)" />
          <Stack.Screen name="(client)" />
        </Stack>
      </AuthProvider>
    </LanguageProvider>
  );
}