const express = require('express');
const router = express.Router();
const connection = require('./db');

router.put('/:id', (req, res) => {
});

router.delete('/:id', (req, res) => {
});

router.post('/', (req, res) => {
});

router.get('/', (req, res) => {
    connection.query('SELECT * FROM conversations where status!=0', (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Internal Server Error' });
        } else {
            return res.json(results);
        }
    });
});

router.get('/:idUs1', (req, res) => {
    const idUs1 = req.params.idUs1;

    if (!idUs1) {
        return res.status(400).json({ error: 'us ID is required' });
    }

    const query = 'SELECT * FROM conversations WHERE idUs1 = ? and status!=0';
    connection.query(query, [idUs1], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Internal Server Error' });
        } else {
            return res.json(results);
        }
    });
});


module.exports = router;
