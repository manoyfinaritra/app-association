
export function variantesTelephone(telephone) {
  const numero = telephone.replace(/\s+/g, '');

  const international = numero.match(/^\+2610?(\d{8,9})$/);

  const numeroLocal = international
    ? '0' + international[1]
    : numero;

  const variantes = new Set([telephone, numero, numeroLocal]);
  const local = numeroLocal.match(/^0(\d{8,9})$/);

  if (local) {
    variantes.add('+261' + local[1]);
    variantes.add('+261 ' + local[1]);
  }

  return [...variantes];
}
