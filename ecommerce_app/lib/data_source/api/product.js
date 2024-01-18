const express = require('express');
const router = express.Router();
const connection = require('./db');

// POST để thêm mới product
router.post('/', (req, res) => {
    const {image,name,quantity,price,des,idDiscount,status,idCate,idBrand}=req.body;
    const query = 'INSERT INTO product (image, name, quantity, price, des, idDiscount, status, idCate, idBrand) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)';
  const results=  connection.query(query,[image, name, quantity, price, des, idDiscount, status, idCate, idBrand],(err)=>{
    if(err){
        console.error('Error executing MySQL query:', err);
        res.status(500).send('Internal Server Error');
    }
    else{
        res.json({
            image:image,
            name:name,
            quantity: quantity,
            price:price,
            des:des,
            idDiscount: idDiscount,
            status:status,
            idCate:idCate,
            idBrand:idBrand
        })
    }
  });
    if(results.affectedRows>0){
        return true;
    }
    else{
        return false;
    }

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
