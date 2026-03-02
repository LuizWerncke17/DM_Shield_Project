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
    db.query(`
      CREATE TABLE IF NOT EXISTS sessoes (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255) DEFAULT NULL,
        descricao TEXT DEFAULT NULL,
        dados LONGTEXT DEFAULT NULL
      )
    `, (tableErr) => {
      if (tableErr) {
        console.log("Erro ao garantir tabela sessoes:", tableErr);
      }
    });
  }
});

app.get("/", (req, res) => {
  res.send("API funcionando!");
});



//-----------------------------------------------------INIMIGOS------------------------------------------------------

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

app.get('/inimigos/:id', (req, res) => {
  const { id } = req.params;

  db.query('SELECT * FROM inimigos WHERE id = ?', [id], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    if (results.length === 0) {
      return res.status(404).send({ message: 'Inimigo nao encontrado.' });
    }

    const inimigo = results[0];
    inimigo.dados = JSON.parse(inimigo.dados);
    res.send(inimigo);
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

app.put('/inimigos/:id', (req, res) => {
  const { id } = req.params;
  const { nome, tipo, vida, ca, dados } = req.body;

  const sql = 'UPDATE inimigos SET nome = ?, tipo = ?, vida = ?, ca = ?, dados = ? WHERE id = ?';

  db.query(sql, [nome, tipo, vida, ca, JSON.stringify(dados), id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Inimigo nao encontrado.' });
    }

    res.send({ message: 'Inimigo atualizado!' });
  });
});

app.delete('/inimigos/:id', (req, res) => {
  const { id } = req.params;

  db.query('DELETE FROM inimigos WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Inimigo nao encontrado.' });
    }

    res.send({ message: 'Inimigo removido!' });
  });
});



//-----------------------------------------------------NPCs------------------------------------------------------

app.get('/npcs', (req, res) => {
  db.query('SELECT * FROM npcs', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    // converter JSON string em objeto
    const npcs = results.map(npc => ({
      ...npc,
      dados: JSON.parse(npc.dados)
    }));

    res.send(npcs);
  });
});

app.get('/npcs/:id', (req, res) => {
  const { id } = req.params;

  db.query('SELECT * FROM npcs WHERE id = ?', [id], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    if (results.length === 0) {
      return res.status(404).send({ message: 'NPC nao encontrado.' });
    }

    const npc = results[0];
    npc.dados = JSON.parse(npc.dados);
    res.send(npc);
  });
});

app.post('/npcs', (req, res) => {
  const { nome, raca, vida, ca, dados } = req.body;

  const sql = 'INSERT INTO npcs (nome, raca, vida, ca, dados) VALUES (?, ?, ?, ?, ?)';

  db.query(sql, [nome, raca, vida, ca, JSON.stringify(dados)], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    res.send({ message: 'NPC criado!' });
  });
});

app.put('/npcs/:id', (req, res) => {
  const { id } = req.params;
  const { nome, raca, vida, ca, dados } = req.body;

  const sql = 'UPDATE npcs SET nome = ?, raca = ?, vida = ?, ca = ?, dados = ? WHERE id = ?';

  db.query(sql, [nome, raca, vida, ca, JSON.stringify(dados), id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'NPC nao encontrado.' });
    }

    res.send({ message: 'NPC atualizado!' });
  });
});

app.delete('/npcs/:id', (req, res) => {
  const { id } = req.params;

  db.query('DELETE FROM npcs WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'NPC nao encontrado.' });
    }

    res.send({ message: 'NPC removido!' });
  });
});

//-----------------------------------------------------Anotações------------------------------------------------------

app.get('/anotacoes', (req, res) => {
  db.query('SELECT * FROM anotacoes', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.send(results);
  });
});

app.get('/anotacoes/:id', (req, res) => {
  const { id } = req.params;

  db.query('SELECT * FROM anotacoes WHERE id = ?', [id], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    if (results.length === 0) {
      return res.status(404).send({ message: 'anotacao nao encontrado.' });
    }

    const anotacao = results[0];
    res.send(anotacao);
  });
});

app.post('/anotacoes', (req, res) => {
  const { titulo, tipo, informacoes } = req.body;

  const sql = 'INSERT INTO anotacoes (titulo, tipo, informacoes) VALUES (?, ?, ?)';

  db.query(sql, [titulo, tipo, informacoes], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    res.send({ message: 'Anotação criada!' });
  });
});

app.put('/anotacoes/:id', (req, res) => {
  const { id } = req.params;
  const { titulo, tipo, informacoes } = req.body;

  const sql = 'UPDATE anotacoes SET titulo = ?, tipo = ?, informacoes = ? WHERE id = ?';

  db.query(sql, [titulo, tipo, informacoes, id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Anotação nao encontrada.' });
    }

    res.send({ message: 'Anotação atualizada!' });
  });
});

app.delete('/anotacoes/:id', (req, res) => {
  const { id } = req.params;

  db.query('DELETE FROM anotacoes WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Anotação nao encontrada.' });
    }

    res.send({ message: 'Anotação removida!' });
  });
});

//-----------------------------------------------------ITENS------------------------------------------------------

app.get('/itens', (req, res) => {
  db.query('SELECT * FROM itens', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.send(results);
  });
});

app.get('/itens/:id', (req, res) => {
  const { id } = req.params;

  db.query('SELECT * FROM itens WHERE id = ?', [id], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    if (results.length === 0) {
      return res.status(404).send({ message: 'Item nao encontrado.' });
    }

    res.send(results[0]);
  });
});

app.post('/itens', (req, res) => {
  const { nome, tipo, descricao, valor, raridade, efeito } = req.body;

  const sql = `
    INSERT INTO itens (nome, tipo, descricao, valor, raridade, efeito)
    VALUES (?, ?, ?, ?, ?, ?)
  `;

  db.query(sql, [nome, tipo, descricao, valor, raridade, efeito], (err) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    res.send({ message: 'Item criado!' });
  });
});

app.put('/itens/:id', (req, res) => {
  const { id } = req.params;
  const { nome, tipo, descricao, valor, raridade, efeito } = req.body;

  const sql = `
    UPDATE itens 
    SET nome = ?, tipo = ?, descricao = ?, valor = ?, raridade = ?, efeito = ?
    WHERE id = ?
  `;

  db.query(sql, [nome, tipo, descricao, valor, raridade, efeito, id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Item nao encontrado.' });
    }

    res.send({ message: 'Item atualizado!' });
  });
});

app.delete('/itens/:id', (req, res) => {
  const { id } = req.params;

  db.query('DELETE FROM itens WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Item nao encontrado.' });
    }

    res.send({ message: 'Item removido!' });
  });
});

//-----------------------------------------------------CONSUMIVEIS------------------------------------------------------

app.get('/consumiveis', (req, res) => {
  db.query('SELECT * FROM consumiveis', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.send(results);
  });
});

app.get('/consumiveis/:id', (req, res) => {
  const { id } = req.params;

  db.query('SELECT * FROM consumiveis WHERE id = ?', [id], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    if (results.length === 0) {
      return res.status(404).send({ message: 'Consumivel nao encontrado.' });
    }

    res.send(results[0]);
  });
});

app.post('/consumiveis', (req, res) => {
  const { nome, tipo, descricao, efeito, duracao, valor } = req.body;

  const sql = `
    INSERT INTO consumiveis (nome, tipo, descricao, efeito, duracao, valor)
    VALUES (?, ?, ?, ?, ?, ?)
  `;

  db.query(sql, [nome, tipo, descricao, efeito, duracao, valor], (err) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    res.send({ message: 'Consumivel criado!' });
  });
});

app.put('/consumiveis/:id', (req, res) => {
  const { id } = req.params;
  const { nome, tipo, descricao, efeito, duracao, valor } = req.body;

  const sql = `
    UPDATE consumiveis
    SET nome = ?, tipo = ?, descricao = ?, efeito = ?, duracao = ?, valor = ?
    WHERE id = ?
  `;

  db.query(sql, [nome, tipo, descricao, efeito, duracao, valor, id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Consumivel nao encontrado.' });
    }

    res.send({ message: 'Consumivel atualizado!' });
  });
});

app.delete('/consumiveis/:id', (req, res) => {
  const { id } = req.params;

  db.query('DELETE FROM consumiveis WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Consumivel nao encontrado.' });
    }

    res.send({ message: 'Consumivel removido!' });
  });
});

//-----------------------------------------------------LOCAIS------------------------------------------------------

app.get('/locais', (req, res) => {
  db.query('SELECT * FROM locais', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    const locais = results.map(local => ({
      ...local,
      dados: local.dados ? JSON.parse(local.dados) : {}
    }));

    res.send(locais);
  });
});

app.get('/locais/:id', (req, res) => {
  const { id } = req.params;

  db.query('SELECT * FROM locais WHERE id = ?', [id], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    if (results.length === 0) {
      return res.status(404).send({ message: 'Local nao encontrado.' });
    }

    const local = results[0];
    local.dados = local.dados ? JSON.parse(local.dados) : {};
    res.send(local);
  });
});

app.post('/locais', (req, res) => {
  const { nome, tipo, descricao, dados } = req.body;

  const sql = 'INSERT INTO locais (nome, tipo, descricao, dados) VALUES (?, ?, ?, ?)';

  db.query(sql, [nome, tipo, descricao, JSON.stringify(dados || {})], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    res.send({ message: 'Local criado!', id: result.insertId });
  });
});

app.put('/locais/:id', (req, res) => {
  const { id } = req.params;
  const { nome, tipo, descricao, dados } = req.body;

  const sql = 'UPDATE locais SET nome = ?, tipo = ?, descricao = ?, dados = ? WHERE id = ?';

  db.query(sql, [nome, tipo, descricao, JSON.stringify(dados || {}), id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Local nao encontrado.' });
    }

    res.send({ message: 'Local atualizado!', id: Number(id) });
  });
});

app.delete('/locais/:id', (req, res) => {
  const { id } = req.params;

  db.query('DELETE FROM locais WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Local nao encontrado.' });
    }

    res.send({ message: 'Local removido!' });
  });
});

//-----------------------------------------------------SESSOES------------------------------------------------------

app.get('/sessoes', (req, res) => {
  db.query('SELECT * FROM sessoes', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    const sessoes = results.map(sessao => ({
      ...sessao,
      dados: sessao.dados ? JSON.parse(sessao.dados) : { locais: [] }
    }));

    res.send(sessoes);
  });
});

app.get('/sessoes/:id', (req, res) => {
  const { id } = req.params;

  db.query('SELECT * FROM sessoes WHERE id = ?', [id], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    if (results.length === 0) {
      return res.status(404).send({ message: 'Sessao nao encontrada.' });
    }

    const sessao = results[0];
    sessao.dados = sessao.dados ? JSON.parse(sessao.dados) : { locais: [] };
    res.send(sessao);
  });
});

app.post('/sessoes', (req, res) => {
  const { nome, descricao, dados } = req.body;
  const sql = 'INSERT INTO sessoes (nome, descricao, dados) VALUES (?, ?, ?)';

  db.query(sql, [nome, descricao, JSON.stringify(dados || { locais: [] })], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    res.send({ message: 'Sessao criada!', id: result.insertId });
  });
});

app.put('/sessoes/:id', (req, res) => {
  const { id } = req.params;
  const { nome, descricao, dados } = req.body;
  const sql = 'UPDATE sessoes SET nome = ?, descricao = ?, dados = ? WHERE id = ?';

  db.query(sql, [nome, descricao, JSON.stringify(dados || { locais: [] }), id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Sessao nao encontrada.' });
    }

    res.send({ message: 'Sessao atualizada!', id: Number(id) });
  });
});

app.delete('/sessoes/:id', (req, res) => {
  const { id } = req.params;

  db.query('DELETE FROM sessoes WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Sessao nao encontrada.' });
    }

    res.send({ message: 'Sessao removida!' });
  });
});


app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});
