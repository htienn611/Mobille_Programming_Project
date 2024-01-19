const express = require('express');
const router = express.Router();
const connection = require('./db');

router.put('/:id', (req, res) => {
});

router.delete('/:id', (req, res) => {
});

router.post('/', (req, res) => {
});

router.get('/', (req, res) => {
  connection.query('SELECT * FROM promotion where status !=0', (error, results) => {
    if (error) {
     return res.status(500).json({ error: 'Internal Server Error' });
    } else {
        return res.json(results);
    }
  });
});

router.get('/id:id', (req, res) => {
  const promId = req.params.id;

  if (!promId) {
    return res.status(400).json({ error: 'prom ID is required' });
  }

  const query = 'SELECT * FROM promotion WHERE id = ? and status!=0';
  connection.query(query, [messId], (error, results) => {
    if (error) {
      return res.status(500).json({ error: 'Internal Server Error' });
    } else {
        return res.json(results);
      }
  });
});


module.exports = router;
