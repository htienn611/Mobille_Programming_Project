const express = require('express');
const cors = require('cors');
const categoryRoutes = require('./api/category');
const PORT = process.env.PORT || 3000;

const app = express();
app.use(cors({ origin: '*' }));
app.use(express.json());

//khai báo sử dụng category.js
app.use('/category', categoryRoutes)



app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
