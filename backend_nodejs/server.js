import { HOST, PORT } from './helper.js';
import http from 'http';
import mysql from 'mysql2';

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'aem_database',
});
connection.connect((err) => {
    if (err) {
        console.error('Erreur de connexion à la base de données :', err);
        return;
    }
    console.log('Connecté à la base de données MySQL');
});

const originesAutorisees = [
    'http://localhost:8081',
    'http://127.0.0.1:8081',
    'http://192.168.1.100:8081',
];

const server = http.createServer((req, res) => {
    function repondre(statut, message) {
        res.writeHead(statut, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ message }));
    }

    const origine = req.headers.origin;
    res.setHeader('Vary', 'Origin');

    if (origine && !originesAutorisees.includes(origine)) {
        repondre(403, 'Cette origine n’est pas autorisée.');
        return;
    }

    if (origine) {
        res.setHeader('Access-Control-Allow-Origin', origine);
        res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
        res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    }

    if (req.method === 'OPTIONS') {
        res.writeHead(204);
        res.end();
        return;
    }

    if (req.url !== '/connexion') {
        repondre(404, 'Cette adresse n’existe pas.');
        return;
    }

    if (req.method !== 'POST') {
        res.setHeader('Allow', 'POST, OPTIONS');
        repondre(405, 'Utilisez la méthode POST.');
        return;
    }

    let body = '';
    let taille = 0;
    req.setEncoding('utf8');
    req.on('data', chunk => {
        if (res.writableEnded) return;
        taille += Buffer.byteLength(chunk);

        if (taille > 10000) {
            repondre(413, 'Les données envoyées sont trop volumineuses.');
            return;
        }
        body += chunk;
    });

    req.on('end', () => {
        if (res.writableEnded) return;
        let data;
        try {
            data = JSON.parse(body);
        } catch {
            repondre(400, 'Les données JSON sont invalides.');
            return;
        }

        const email = typeof data?.email === 'string' ? data.email.trim() : '';
        const password = data?.motDePasse;
        const emailValide = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
        if (!emailValide || typeof password !== 'string' || password.length === 0) {
            repondre(400, 'Veuillez saisir un email valide et un mot de passe.');
            return;
        }

        const sql = 'SELECT aem_id_user FROM aem_user WHERE aem_user_email = ? AND aem_user_password = ? LIMIT 1';
        connection.query(sql, [email, password], (err, results) => {
            if (err) {
                console.error('Erreur SQL :', err.code);
                repondre(500, 'Erreur interne du serveur.');
                return;
            }

            if (results.length > 0) {
                repondre(200, 'Connexion réussie !');
            } else {
                repondre(401, 'Email ou mot de passe incorrect.');
            }
        });
    });

    req.on('error', (err) => {
        console.error('Erreur de réception :', err.message);
        if (!res.writableEnded && !res.destroyed) {
            repondre(400, 'Impossible de lire la demande.');
        }
    });

});

server.listen(PORT, HOST, () => {
    console.log(`Server running at http://${HOST}:${PORT}/`);
});
server.on('error', (err) => {
    console.error('Impossible de démarrer le serveur :', err.message);
    connection.end();
    process.exitCode = 1;
});
