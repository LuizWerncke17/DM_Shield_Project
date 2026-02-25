const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "dmshield"
});

db.connect(err => {
  if (err) {
    console.log("Erro ao conectar:", err);
  } else {
    console.log("Conectado ao MySQL!");
  }
});

app.get("/", (req, res) => {
  res.send("API funcionando!");
});





app.get('/inimigos', (req, res) => {
  db.query('SELECT * FROM inimigos', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    // converter JSON string em objeto
    const inimigos = results.map(inimigo => ({
      ...inimigo,
      dados: JSON.parse(inimigo.dados)
    }));

    res.send(inimigos);
  });
});







app.post('/inimigos', (req, res) => {
  const { nome, tipo, vida, ca, dados } = req.body;

  const sql = 'INSERT INTO inimigos (nome, tipo, vida, ca, dados) VALUES (?, ?, ?, ?, ?)';

  db.query(sql, [nome, tipo, vida, ca, JSON.stringify(dados)], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    res.send({ message: 'Inimigo criado!' });
  });
});


app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});