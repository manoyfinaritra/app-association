import { Tabs, Redirect } from 'expo-router';
import Ionicons from '@expo/vector-icons/Ionicons';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import Header from '../../components/header';
import { useAuth } from '../../context/AuthContext.jsx';

export default function ClientLayout() {
  const insets = useSafeAreaInsets();

  const { utilisateur } = useAuth();

  if (!utilisateur) {
    return <Redirect href="/(public)/connexion" />;
  }
  return (
    <Tabs
      initialRouteName="dashboard"
      screenOptions={{
        headerShown: true,
        header: () => <Header />,

        tabBarActiveTintColor: '#0c9e79',
        tabBarInactiveTintColor: '#64748b',
        tabBarHideOnKeyboard: true,

        tabBarStyle: {
          height: 65 + insets.bottom,
          paddingTop: 5,
          paddingBottom: 5 + insets.bottom,
          borderRadius : 15,
          marginHorizontal : 5,
          marginBottom : 10,
          backgroundColor : '#fff',
         

        },
      }}
    >
      <Tabs.Screen
        name="dashboard"
        options={{
          title: 'Accueil',
          tabBarIcon: ({ color, size }) => (
            <Ionicons
              name="grid-outline"
              color={color}
              size={size}
            />
          ),
        }}
      />


      <Tabs.Screen
        name="document"
        options={{
          title: 'Documents',
          tabBarIcon: ({ color, size }) => (
            <Ionicons
              name="folder-outline"
              color={color}
              size={size}
            />
          ),
        }}
      />
      <Tabs.Screen
        name="formation"
        options={{
          title: 'Formation',
          tabBarIcon: ({ color, size }) => (
            <Ionicons
              name="book-outline"
              color={color}
              size={size}
            />
          ),
        }}
      />
      <Tabs.Screen
        name="evenement"
        options={{
          title: 'Événements',
          tabBarIcon: ({ color, size }) => (
            <Ionicons
              name="calendar-outline"
              color={color}
              size={size}
            />
          ),
        }}
      />

      <Tabs.Screen
        name="profil"
        options={{
          title: 'Profil',
          tabBarIcon: ({ color, size }) => (
            <Ionicons
              name="person-outline"
              color={color}
              size={size}
            />
          ),
        }}
      />
    </Tabs>
  );
}