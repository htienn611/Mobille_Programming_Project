const express = require('express');
const crypto = require('crypto-js');
const router = express.Router();
const connection = require('./db');


router.post('/', async (req, res) => {

    const { content, phoneNumber } = req.body;
    
        const addNotiQuery = `
    INSERT INTO Notification ( PhoneNumber, content)
    VALUES ( ?,?)
  `;

        connection.query(addNotiQuery, [ phoneNumber,content], (err) => {
            if (err) {
                console.error('Error executing MySQL query:', err);
                res.status(500).send('Internal Server Error');
            } 
        });
    
});

module.exports=router;