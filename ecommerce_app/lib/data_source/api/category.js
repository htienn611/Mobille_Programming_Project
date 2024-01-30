   const express = require('express');
const router = express.Router();
const connection = require('./db');

// PUT để cập nhật category


router.get('/', (req, res) => {
  connection.query('SELECT * FROM category', (error, results) => {
    if (error) {
     return res.status(500).json({ error: 'Internal Server Error' });
    } else {
        return res.json(results);
    }
  });
});

router.get('/:id', (req, res) => {
  const categoryId = req.params.id;
  if (!categoryId) {
    return res.status(400).json({ error: 'Category ID is required' });
  }

  const query = 'SELECT * FROM category WHERE id = ?';
  connection.query(query, [categoryId], (error, results) => {
    if (error) {
      return res.status(500).json({ error: 'Internal Server Error' });
    } else {
        return res.json(results);
    }
  });
});


module.exports = router;
