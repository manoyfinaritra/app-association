import { View, Text } from 'react-native';

export default function Dashboard() {
  return (
    <View style={{ flex: 1, padding: 24 }}>
      <Text style={{ fontSize: 24, fontWeight: 'bold' }}>
        Mon espace client
      </Text>

      <Text style={{ marginTop: 12 }}>
        Bienvenue dans votre tableau de bord AEM.
      </Text>
    </View>
  );
}