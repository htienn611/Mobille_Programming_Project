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

        connection.query(addNotiQuery, [ phoneNumber,content], (err,results) => {
            if (err) {
                console.error('Error executing MySQL query:', err);
                res.status(500).send('Internal Server Error');
            } 
            return res.json(results);
        });
    
});
router.get('/:phoneNumber', (req, res) => {
    const selectQuery = 'SELECT content FROM Notification where phoneNumber=?';
    const phoneNumber = req.params.phoneNumber;
  
    connection.query(selectQuery, [phoneNumber], (err, results) => {
      if (err) {
        console.error('Error fetching notifications:', err);
        res.status(500).send('Internal Server Error');
      } else {
        if (results.length === 0) {
          res.status(404).send('Notification not found');
        } else {
          // Map the results to an array of notification objects
          const notifications = results.map(notification => ({
            content: notification.content,
          }));
  
          res.status(200).json(notifications);
        }
      }
    });
  });
  
module.exports = router;
