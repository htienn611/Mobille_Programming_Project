const express = require('express');
const ngrok = require('ngrok');
const cors = require('cors');
const categoryRoutes = require('./api/category');
const userRoutes = require('./api/user');
const brandRoutes = require('./api/brand');
const productRoutes = require('./api/product');
const orderRoutes=require('./api/order');
const order_detailsRoutes=require('./api/orderDetail');

const PORT = process.env.PORT || 3000;

const app = express();

app.use(cors({ origin: '*' }));
app.use(express.json());

//khai báo sử dụng category.js





app.listen(PORT, async () => {
  
  console.log(`Server is running on port ${PORT}`);
  const ngrokUrl= await ngrok.connect(PORT);
  console.log(`Ngrok tunnel at: ${ngrokUrl}`)
  app.use('/category', categoryRoutes)

app.use('/user', userRoutes)
app.use('/brand', brandRoutes)
app.use('/product', productRoutes)
app.use('/order',orderRoutes);
app.use('/order_details',order_detailsRoutes);
});
