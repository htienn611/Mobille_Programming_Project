const express = require('express');
const router = express.Router();
const connection = require('./db');


router.get('/', (req, res) => {
    connection.query('SELECT * FROM `cart_details` WHERE 1', (error, results) => {
      if (error) {
       return res.status(500).json({ error: 'Internal Server Error' });
      } else {
          return res.json(results);
      }
    });
  });


router.get('/id:id',(req,res) => {
  var query = 'SELECT * FROM `cart_details` WHERE idOCart=?';
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
