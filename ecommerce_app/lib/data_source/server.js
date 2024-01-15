const express = require('express');
const cors = require('cors');
const categoryRoutes = require('./api/category');
const brandRoutes = require('./api/brand');
const productRoutes = require('./api/product');
const orderRoutes=require('./api/order');
const order_detailsRoutes=require('./api/orderDetail');

const PORT = process.env.PORT || 3000;

const app = express();

app.use(cors({ origin: '*' }));
app.use(express.json());

//khai báo sử dụng category.js
app.use('/category', categoryRoutes)

app.use('/brand', brandRoutes)
app.use('/product', productRoutes)
app.use('/order',orderRoutes);
app.use('/order_details',order_detailsRoutes);




app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
