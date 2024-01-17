const express = require('express');
const router = express.Router();
const connection = require('./db');


router.get('/', (req, res) => {
    connection.query('SELECT * FROM product WHERE status=1', (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Internal server error' });
        }
        else {
            return res.json(results);
        }
    });
});

//lấy sản phẩm theo mã sản phẩm
router.get('/:id', (req, res) => {
    var query = 'SELECT * FROM `product` WHERE status!=0 AND id=?';
    connection.query(query, [req.params.id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Internal Server Error' })
        }
        else {
            return res.json(results);
        }
    }
    );
});

module.exports = router;
