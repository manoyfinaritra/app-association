import { View, Text } from 'react-native';

export default function Formation() {
  return (
    <View style={{ flex: 1, padding: 24 }}>
      <Text style={{ fontSize: 24, fontWeight: 'bold' }}>
        Ma formation
      </Text>

      <Text style={{ marginTop: 12 }}>
        Les informations du membre seront affichées ici.
      </Text>
    </View>
  );
}