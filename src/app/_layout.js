import Ionicons from '@expo/vector-icons/Ionicons';
import { Tabs } from 'expo-router';
import { StyleSheet } from 'react-native';

export default function Navigation() {
  return (
    <Tabs
      screenOptions={{
        headerShown: false,
        tabBarActiveTintColor: '#2563eb',
        tabBarInactiveTintColor: '#64748b',
        tabBarHideOnKeyboard: true,
        tabBarActiveBackgroundColor: '#eff6ff',
        tabBarLabelPosition: 'below-icon',
        tabBarStyle: styles.barre,
        tabBarItemStyle: styles.onglet,
        tabBarLabelStyle: styles.libelle,
      }}
    >
      {/* Onglet accueil */}
      <Tabs.Screen
        name="index"
        options={{
          title: 'Accueil',
          tabBarAccessibilityLabel: 'Accueil',
          tabBarIcon: function (options) {
            const nomIcone = options.focused ? 'home' : 'home-outline';

            return (
              <Ionicons
                name={nomIcone}
                color={options.color}
                size={options.size}
              />
            );
          },
        }}
      />

      {/* Onglet avantages */}
      <Tabs.Screen
        name="avantages"
        options={{
          title: 'Avantages',
          tabBarAccessibilityLabel: 'Avantages',
          tabBarIcon: function (options) {
            const nomIcone = options.focused ? 'gift' : 'gift-outline';

            return (
              <Ionicons
                name={nomIcone}
                color={options.color}
                size={options.size}
              />
            );
          },
        }}
      />

      {/* Onglet contacts */}
      <Tabs.Screen
        name="contacts"
        options={{
          title: 'Contacts',
          tabBarAccessibilityLabel: 'Contacts',
          tabBarIcon: function (options) {
            const nomIcone = options.focused ? 'people' : 'people-outline';

            return (
              <Ionicons
                name={nomIcone}
                color={options.color}
                size={options.size}
              />
            );
          },
        }}
      />

      {/* Onglet inscription */}
      <Tabs.Screen
        name="inscription"
        options={{
          title: 'Inscription',
          tabBarAccessibilityLabel: 'Inscription',
          tabBarIcon: function (options) {
            const nomIcone = options.focused ? 'person-add' : 'person-add-outline';

            return (
              <Ionicons
                name={nomIcone}
                color={options.color}
                size={options.size}
              />
            );
          },
        }}
      />
    </Tabs>
  );
}

const styles = StyleSheet.create({
  barre: {
    backgroundColor: '#ffffff',
    borderTopColor: '#e2e8f0',
    paddingTop: 0,
  },
  onglet: {
    borderRadius: 12,
    marginHorizontal: 2,
  },
  libelle: {
    fontSize: 11,
    fontWeight: '600',
    marginBottom: 3,
  },
});
