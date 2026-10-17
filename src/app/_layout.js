
import Ionicons from '@expo/vector-icons/Ionicons';
import { Tabs } from 'expo-router';
import { StyleSheet } from 'react-native';

export default function Navigation() {
  return (
    <Tabs
      screenOptions={{
        headerShown: false,

        tabBarActiveTintColor: '#079DA6',
        tabBarInactiveTintColor: '#64748b',
        tabBarHideOnKeyboard: true,
        tabBarActiveBackgroundColor: '#effafa',
        tabBarLabelPosition: 'below-icon',

        tabBarStyle: styles.barre,
        tabBarItemStyle: styles.onglet,
        tabBarLabelStyle: styles.libelle,
      }}
    >
      {/* Accueil */}
      <Tabs.Screen
        name="index"
        options={{
          title: 'Accueil',
          tabBarAccessibilityLabel: 'Accueil',
          tabBarIcon: ({ focused, color, size }) => (
            <Ionicons
              name={focused ? 'home' : 'home-outline'}
              color={color}
              size={size}
            />
          ),
        }}
      />

      {/* Avantages */}
      <Tabs.Screen
        name="avantages"
        options={{
          title: 'Avantages',
          tabBarAccessibilityLabel: 'Avantages',
          tabBarIcon: ({ focused, color, size }) => (
            <Ionicons
              name={focused ? 'gift' : 'gift-outline'}
              color={color}
              size={size}
            />
          ),
        }}
      />

      {/* Contacts */}
      <Tabs.Screen
        name="contacts"
        options={{
          title: 'Contacts',
          tabBarAccessibilityLabel: 'Contacts',
          tabBarIcon: ({ focused, color, size }) => (
            <Ionicons
              name={focused ? 'people' : 'people-outline'}
              color={color}
              size={size}
            />
          ),
        }}
      />

      {/* Inscription */}
      <Tabs.Screen
        name="inscription"
        options={{
          title: 'Inscription',
          tabBarAccessibilityLabel: 'Inscription',
          tabBarIcon: ({ focused, color, size }) => (
            <Ionicons
              name={
                focused
                  ? 'person-add'
                  : 'person-add-outline'
              }
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
    height: 65,
    paddingTop: 5,
    paddingBottom: 5,
    elevation: 8,
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