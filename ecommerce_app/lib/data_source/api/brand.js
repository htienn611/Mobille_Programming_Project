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
router.get('/byCate:idCate', (req, res) => {

    var query = 'SELECT * from brand WHERE status!=0 and id in (SELECT idBrand FROM `product` WHERE status!=0 and idCate=?)';
    connection.query(query, [req.params.idCate], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Internal Server Error' });
        } else {
            return res.json(results);
        }
    });
});


module.exports = router;
