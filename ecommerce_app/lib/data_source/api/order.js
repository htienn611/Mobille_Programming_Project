const express = require('express');
const router = express.Router();
const connection = require('./db');


router.get('/', (req, res) => {
    connection.query('SELECT * FROM `order` WHERE 1', (error, results) => {
      if (error) {
       return res.status(500).json({ error: 'Internal Server Error' });
      } else {
          return res.json(results);
      }
    });
  });
  

module.exports = router;
