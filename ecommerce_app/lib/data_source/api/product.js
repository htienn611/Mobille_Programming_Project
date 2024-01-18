const express = require('express');
const router = express.Router();
const connection = require('./db');

// POST để thêm mới product
router.post('/', (req, res) => {

    const query = 'INSERT INTO product (image, name, quantity, price, des, idDiscount, status, idCate, idBrand) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)';
    connection.query(query,[req.params.image,req.params.name,req.params.quantity,req.params.price,req.params.des,req.params.idDiscount,req.params.image,req.params.status
    ,req.params.idCate,req.params.idBrand], (error, results) => {
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
router.get('/id:id', (req, res) => {
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
router.get('/bestSelling:top', (req, res) => {
    var query = 'SELECT * FROM `product` WHERE status != 0 AND id IN (SELECT idProduct FROM `order_details` GROUP BY idProduct ORDER BY SUM(quantityProduct) DESC) LIMIT ?';
    connection.query(query, [parseInt(req.params.top)], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Internal Server Error' });
        } else {
            return res.json(results);
        }
    });
});



module.exports = router;
