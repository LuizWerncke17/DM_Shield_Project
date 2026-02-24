const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();

// Permitir JSON
app.use(express.json());

// Permitir requisições do Angular
app.use(cors());

// 🔌 conexão com banco
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '', 
    database: 'lista_telefonica'
});

// Testar conexão
db.connect((err) => {
    if (err) {
        console.error('Erro ao conectar:', err);
    } else {
        console.log('Conectado ao MySQL!');
    }
});

app.get('/contatos', (req, res) => {
    db.query('SELECT * FROM contatos', (err, results) => {
        if (err) {
            res.status(500).json(err);
        } else {
            res.json(results);
        }
    });
});

app.get('/operadoras', (req, res) => {
    db.query('SELECT * FROM operadoras', (err, results) => {
        if (err) {
            res.status(500).json(err);
        } else {
            res.json(results);
        }
    });
});

app.post('/contatos', (req, res) => {
    const { nome, telefone, operadora_id } = req.body;

    const sql = `
        INSERT INTO contatos (nome, telefone, operadora_id, data_criacao)
        VALUES (?, ?, ?, NOW())
    `;

    db.query(sql, [nome, telefone, operadora_id], (err, result) => {
        if (err) {
            res.status(500).json(err);
        } else {
            res.json({ mensagem: 'Contato inserido!' });
        }
    });
});

app.listen(3000, () => {
    console.log('Servidor rodando em http://localhost:3000');
});