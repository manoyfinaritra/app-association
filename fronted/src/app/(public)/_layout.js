import Ionicons from '@expo/vector-icons/Ionicons';
import { Tabs } from 'expo-router';
import { StyleSheet } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import Header from '../../components/header';
import { useLanguage } from '../../context/LanguageContext';

export default function PublicLayout() {
  const { t } = useLanguage();
  const insets = useSafeAreaInsets();

  return (
    <Tabs
      screenOptions={{
        headerShown: true,
        header: () => <Header />,

        tabBarActiveTintColor: '#079DA6',
        tabBarInactiveTintColor: '#64748b',
        tabBarHideOnKeyboard: true,
        tabBarActiveBackgroundColor: '#effafa',
        tabBarLabelPosition: 'below-icon',


        tabBarStyle: [
          styles.barre,
          {
            height: 65 + insets.bottom,
            paddingBottom: 5 + insets.bottom,
          },
        ],

        tabBarItemStyle: styles.onglet,
        tabBarLabelStyle: styles.libelle,
      }}
    >
      <Tabs.Screen
        name="index"
        options={{
          title: t('homeTab'),
          tabBarLabel: t('homeTab'),
          tabBarIcon: ({ focused, color, size }) => (
            <Ionicons
              name={focused ? 'home' : 'home-outline'}
              color={color}
              size={size}
            />
          ),
        }}
      />

      <Tabs.Screen
        name="avantages"
        options={{
          title: t('advantagesTab'),
          tabBarLabel: t('advantagesTab'),
          tabBarIcon: ({ focused, color, size }) => (
            <Ionicons
              name={focused ? 'gift' : 'gift-outline'}
              color={color}
              size={size}
            />
          ),
        }}
      />

      <Tabs.Screen
        name="contacts"
        options={{
          title: t('contactTab'),
          tabBarLabel: t('contactTab'),
          tabBarIcon: ({ focused, color, size }) => (
            <Ionicons
              name={focused ? 'people' : 'people-outline'}
              color={color}
              size={size}
            />
          ),
        }}
      />

      <Tabs.Screen
        name="connexion"
        options={{
          title: t('connexion'),
          tabBarLabel: t('connexion'),
          tabBarIcon: ({ focused, color, size }) => (
            <Ionicons
              name={focused ? 'person' : 'person-outline'}
              color={color}
              size={size}
            />
          ),
        }}
      />
    </Tabs>
  );
}

const styles = StyleSheet.create({
  barre: {
    backgroundColor: '#ffffff',
    borderTopColor: '#e2e8f0',
    borderTopWidth: 1,
    paddingTop: 5,
    elevation: 8,

    borderRadius: 15,
    marginHorizontal: 10,
    marginBottom: 10,

  },

  onglet: {
    borderRadius: 12,
    marginHorizontal: 2,
  },

  libelle: {
    fontSize: 11,
    fontWeight: '600',
  },
});