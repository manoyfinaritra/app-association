import bcrypt from 'bcryptjs';

const motDePasse = 'manoyman!';

const hash = await bcrypt.hash(motDePasse, 12);

console.log(hash);