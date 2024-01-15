const express = require('express');
const router = express.Router();
const connection = require('./db');

//lấy toàn bộ dữ liệu bảng orderDetail
router.get('/', (req, res) => {
    connection.query('SELECT * FROM `order_details` WHERE 1', (error, results) => {
      if (error) {
       return res.status(500).json({ error: 'Internal Server Error' });
      } else {
          return res.json(results);
      }
    });
  });

//Lấy dữ liệu bảng orderDetail theo id của order
router.get('/:id',(req,res) => {
  var query = 'SELECT * FROM `order_details` WHERE idOrder=?';
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


module.exports = router;
