//lấy toàn bộ bảng product
const express = require('express');
const router = express.Router();
const connection = require('./db');


// lấy cả bảng brand
router.get('/', (req, res) => {
    connection.query('SELECT * FROM brand ', (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Internal server error' });
        }
        else {
            return res.json(results);
        }
    });
});

module.exports = router;
