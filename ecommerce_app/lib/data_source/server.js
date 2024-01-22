const express = require('express');
//const ngrok = require('ngrok');
const cors = require('cors');
//const ngrok = require('ngrok');


const categoryRoutes = require('./api/category');
const userRoutes = require('./api/user');
const brandRoutes = require('./api/brand');
const productRoutes = require('./api/product');
const orderRoutes=require('./api/order');
const order_detailsRoutes=require('./api/orderDetail');

const conversationRoutes=require('./api/conversation');
const messageRoutes=require('./api/message');
const promotionRoutes=require('./api/promotion');

const cartRoutes = require('./api/cart');
const cart_detailsRoutes =  require('./api/cartDetail');




const PORT = process.env.PORT || 3000;

const app = express();

app.use(cors({ origin: '*' }));
app.use(express.json());

//khai báo sử dụng category.js
app.use('/user', userRoutes)
app.use('/brand', brandRoutes)
app.use('/product', productRoutes)
app.use('/order',orderRoutes);
app.use('/order_details',order_detailsRoutes);
app.use('/category',categoryRoutes);
app.use('/conversation',conversationRoutes);
app.use('/message',messageRoutes);
app.use('/promotion',promotionRoutes);
app.use('/cart', cartRoutes);
app.use('/cart_details', cart_detailsRoutes);



app.listen(PORT, async () => {
  console.log(`Server is running on port ${PORT}`);
  //const url = await ngrok.connect(PORT);
 // console.log(`Ngrok URL: ${url}`);
});

// // Kết nối ngrok và log URL public
// (async () => {
  
// })();

// Đóng kết nối ngrok khi server đóng
// process.on('SIGTERM', () => {
//   server.close(() => {
//     ngrok.disconnect();
//     process.exit(0);
//   });
// });