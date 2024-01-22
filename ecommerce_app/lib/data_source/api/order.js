const express = require('express');
const router = express.Router();
const connection = require('./db');
const e = require('express');

//lấy toàn bộ dữ liệu bảng order
router.get('/', (req, res) => {
    connection.query('SELECT * FROM `order`', (error, results) => {
      if (error) {
       return res.status(500).json({ error: 'Internal Server Error' });
      } else {
          return res.json(results);
      }
    });
  });

//Lấy dữ liệu bảng order theo id 
router.get('/id:id',(req,res) => {
  var query = 'SELECT * FROM `order` WHERE id=?';
  connection.query(query,[req.params.id],(error,results)=>
  {
    if(error)
    {
      return res.status(500).json({error: 'Internal Server Error'})
    }
    else {
      return res.json(results);
  }
  }
  );
});  

// cập nhật trạng thái đơn hàng khi hủy
router.put('/id/:id', (req, res) => {
  const { id } = req.params;
  const { paymentMethods, phoneNumber, date, transportFee, address } = req.body;

  const query = 'UPDATE `order` SET status=3 WHERE id=?';

  connection.query(query, [id], (err, results) => {
    if (err) {
      console.error('Error executing MySQL query:', err);
      res.status(500).send('Internal Server Error');
    } else {
      if (results.affectedRows > 0) {
        res.json({
          paymentMethods: paymentMethods,
          phoneNumber: phoneNumber,
          date: date,
          transportFee: transportFee,
          address: address,
        });
      } else {
        res.status(404).send('Order not found');
      }
    }
  });
});


module.exports = router;
