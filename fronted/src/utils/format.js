export function afficherDate(valeur) {
  if (!valeur) return 'Date non précisée';
  const date = new Date(valeur);
  if (Number.isNaN(date.getTime())) return 'Date non précisée';
  return date.toLocaleDateString('fr-FR', {
    day: 'numeric', month: 'long', year: 'numeric', timeZone: 'Indian/Antananarivo',
  });
}

export function afficherMontant(valeur) {
  if (valeur === null || valeur === undefined || valeur === '') return 'Montant non précisé';
  return Number(valeur).toLocaleString('fr-FR') + ' Ar';
}
