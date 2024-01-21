const express = require('express');
const router = express.Router();
const connection = require('./db');
const e = require('express');

//lấy toàn bộ dữ liệu bảng cart
router.get('/', (req, res) => {
    connection.query('SELECT * FROM `cart` WHERE 1', (error, results) => {
      if (error) {
       return res.status(500).json({ error: 'Internal Server Error' });
      } else {
          return res.json(results);
      }
    });
  });


//Lấy dữ liệu bảng order theo id
router.get('/:id',(req,res) => {
  var query = 'SELECT * FROM `cart` WHERE id=?';
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