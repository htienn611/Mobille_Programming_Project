const express = require('express');
const router = express.Router();
const connection = require('./db');

router.get('/', (req, res) => {
  connection.query('SELECT * FROM messages where status !=0', (error, results) => {
    if (error) {
     return res.status(500).json({ error: 'Internal Server Error' });
    } else {
        return res.json(results);
    }
  });
});

router.get('/conversationID:id', (req, res) => {
  const convId = req.params.id;

  if (!convId) {
    return res.status(400).json({ error: 'mess ID is required' });
  }
  const query = 'SELECT * FROM messages WHERE conversationID = ? and status!=0 order by timestamp';
  connection.query(query, [convId], (error, results) => {
    if (error) {
      return res.status(500).json({ error: 'Internal Server Error' });
    } else {
        return res.json(results);
      }
  });
});

router.post('/insert', (req, res) => {
  const { senderID, content, timestamp, conversationID} = req.body;
  const query = 'INSERT INTO `messages`(`senderID`, `content`, `timestamp`, `conversationID`, `status`) VALUES (?,?,?,?,1)';
  connection.query(query, [senderID, content, timestamp, conversationID], (err) => {
      if  (err) throw err;
      res.json({ success: true, message: 'Data inserted successfully' });
  });
});


module.exports = router;
