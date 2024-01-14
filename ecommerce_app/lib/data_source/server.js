const express = require('express');
const cors=require('cors');
const mysql = require('mysql2');
const app = express();

 app.use(cors({ origin: '*' }));
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

//lấy toàn bộ bảng product
app.get('/product',(req,res)=>{
connection.query('SELECT * FROM product WHERE status=1',(error,results)=>{
  if(error){
    return res.status(500).json({error:'Internal server error'});
  }
  else{
    return res.json(results);
  }
});
});

// lấy cả bảng brand
app.get('/brand',(req,res)=>{
  connection.query('SELECT * FROM brand WHERE status=1',(error,results)=>{
    if(error){
      return res.status(500).json({error:'Internal server error'});
    }
    else{
      return res.json(results);
    }
  });
  });

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
