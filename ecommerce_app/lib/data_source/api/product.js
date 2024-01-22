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
//PUT để sửa sản phẩm
router.put('/:id', (req, res) => {
    const { id } = req.params;
    const { image, name, quantity, price, des, idDiscount, status, idCate, idBrand } = req.body;
  
    const query = 'UPDATE product SET image=?, name=?, quantity=?, price=?, des=?, idDiscount=?, status=?, idCate=?, idBrand=? WHERE id=?';
  
    connection.query(query, [image, name, quantity, price, des, idDiscount, status, idCate, idBrand, id], (err, results) => {
      if (err) {
        console.error('Error executing MySQL query:', err);
        res.status(500).send('Internal Server Error');
      } else {
        if (results.affectedRows > 0) {
          res.json({
            id: id,
            image: image,
            name: name,
            quantity: quantity,
            price: price,
            des: des,
            idDiscount: idDiscount,
            status: status,
            idCate: idCate,
            idBrand: idBrand
          });
        } else {
          res.status(404).send('Product not found');
        }
      }
    });
  });
//PUT cập nhật lại để xóa sản phẩm 
router.put('/id:id', (req, res) => {
    const { id } = req.params;
    const { image, name, quantity, price, des, idDiscount, idCate, idBrand } = req.body;

    const query = 'UPDATE product SET status=0 WHERE id=?';
  
    connection.query(query, [id], (err, results) => {
      if (err) {
        console.error('Error executing MySQL query:', err);
        res.status(500).send('Internal Server Error');
      } else {
        if (results.affectedRows > 0) {
          res.json({
            image: image,
            name: name,
            quantity: quantity,
            price: price,
            des: des,
            idDiscount: idDiscount,
            idCate: idCate,
            idBrand: idBrand
          });
        } else {
          res.status(404).send('Product not found');
        }
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



router.get('/byIdLst:idList', (req, res) => {
  const idList = req.params.idList.split(',').map(id => parseInt(id));

  var query = 'SELECT * FROM `product` WHERE status != 0 AND id IN (?)';
  connection.query(query, [idList], (error, results) => {
      if (error) {
          return res.status(500).json({ error: 'Internal Server Error' });
      } else {
          return res.json(results);
      }
  });
});

router.get('/byIdCate:idCate/:idBrand/:limit', (req, res) => {
  //const idList = req.params.idList.split(',').map(id => parseInt(id));

  var query = 'SELECT * FROM `product` WHERE status != 0 AND idCate=? and idBrand=? order by idDiscount desc limit ?';
  connection.query(query, [parseInt(req.params.idCate), parseInt(req.params.idBrand),parseInt(req.params.limit)], (error, results) => {
      if (error) {
          return res.status(500).json({ error: 'Internal Server Error' });
      } else {
          return res.json(results);
      }
  });
});

//lấy sản phẩm trong một hóa đơn
router.get('/InfoProduct:id',(req,res)=>
{
    var query='SELECT * FROM product,order_details WHERE product.id=order_details.idProduct AND order_details.idOrder= ?';
    connection.query(query,[req.params.id],(error,results)=>{
        if (error) {
            return res.status(500).json({ error: 'Internal Server Error' });
        } else {
            return res.json(results);
        }
    });
})
// lấy 1 sản phẩm theo hóa đơn
router.get('/OneProduct:id',(req,res)=>
{
    var query='SELECT * FROM product,order_details WHERE product.id=order_details.idProduct AND order_details.idOrder= ? limit 1';
    connection.query(query,[req.params.id],(error,results)=>{
        if (error) {
            return res.status(500).json({ error: 'Internal Server Error' });
        } else {
            return res.json(results);
        }
    });
})



module.exports = router;
