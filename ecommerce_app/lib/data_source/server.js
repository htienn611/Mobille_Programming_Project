const express = require('express');
const mysql = require('mysql2');
const app = express();

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'tech_computer',
});

//lấy toàn bộ bảng category
app.get('/category', (req, res) => {
  connection.query('SELECT * FROM category', (error, results) => {
    if (error) {
     return res.status(500).json({ error: 'Internal Server Error' });
    } else {
        return res.json(results);
    }
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
