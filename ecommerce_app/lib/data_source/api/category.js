const express = require('express');
const router = express.Router();
const connection = require('./db');

// PUT để cập nhật category
router.put('/:id', (req, res) => {
});

// DELETE để xóa category
router.delete('/:id', (req, res) => {
});

// POST để thêm mới category
router.post('/', (req, res) => {
});

router.get('/', (req, res) => {
  connection.query('SELECT * FROM category', (error, results) => {
    if (error) {
     return res.status(500).json({ error: 'Internal Server Error' });
    } else {
        return res.json(results);
    }
  });
});


module.exports = router;
