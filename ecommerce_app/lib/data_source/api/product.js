const express = require('express');
const router = express.Router();
const connection = require('./db');

// POST để thêm mới category
router.post('/', (req, res) => {
    const { image, name, quantity, price, des, idDiscount, status, idCate, idBrand } = req.body;

    const query = 'INSERT INTO product (image, name, quantity, price, des, idDiscount, status, idCate, idBrand) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)';
    const values = [image, name, quantity, price, des, idDiscount, status, idCate, idBrand];
    connection.query(query,values, (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Internal server error' });
        }
        else {
            return res.json(results);
        }
    });
});

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
