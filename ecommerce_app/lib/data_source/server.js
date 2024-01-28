const express = require('express');
const ngrok = require('ngrok');
const cors = require('cors');
const http = require('http');
const socketIo = require('socket.io');
const db = require('./api/db');

const categoryRoutes = require('./api/category');
const userRoutes = require('./api/user');
const brandRoutes = require('./api/brand');
const productRoutes = require('./api/product');
const orderRoutes = require('./api/order');
const conversationRoutes = require('./api/conversation');
const messageRoutes = require('./api/message');
const promotionRoutes = require('./api/promotion');
const notificationRoutes = require('./api/notification')
const order_detailsRoutes=require('./api/orderDetail');


const cartRoutes = require('./api/cart');
const cart_detailsRoutes =  require('./api/cartDetail');




const PORT = process.env.PORT || 3000;

const app = express();
const server = http.createServer(app);
const io = socketIo(server, {
  cors: {
    origin: '*',
  },
});

app.use(cors({ origin: '*' }));
app.use(express.json());



//khai báo sử dụng category.js
app.use('/user', userRoutes)
app.use('/brand', brandRoutes)
app.use('/product', productRoutes)
app.use('/order', orderRoutes);
app.use('/order_details', order_detailsRoutes);
app.use('/category', categoryRoutes);
app.use('/conversation', conversationRoutes);
app.use('/messages', messageRoutes);
app.use('/promotion', promotionRoutes);
app.use('/notification', notificationRoutes);
app.use('/cart', cartRoutes);
app.use('/cart_detail', cart_detailsRoutes);


const connectedUsers = {};
io.on('connection', (socket) => {
  console.log('Một người dùng đã kết nối');
  socket.on('userConnected', (data) => {
    console.log(data);
    var userId = data.userId;
    connectedUsers[userId] = socket.id;
    socket.join(userId);
    console.log(`Đã đặt userId=${userId}, socketId=${socket.id}`);
  });

  socket.on('clientMessage', (data) => {
    const query = 'INSERT INTO `messages`(`senderID`, `content`, `timestamp`, `conversationID`, `status`) VALUES (?,?,?,?,1)';
    db.query(query, [data.senderID, data.content, data.timestamp, data
      .conversationID], (err) => {
        if (err) console.log(err.message);
      });


    socket.to(connectedUsers[data.to]).emit('servertMessage',{mess: data.content, from:data.senderID});
    //socket.broadcast.emit('chat_message', data);
  });

  socket.on('disconnect', () => {
    const userId = Object.keys(connectedUsers).find(key => connectedUsers[key] === socket.id);
    if (userId) {
      delete connectedUsers[userId];
      console.log(`Người dùng đã ngắt kết nối, xoá thông tin userId=${userId}`);
    }
  });
});

db.connect((err) => {
  if (err) {
    console.error('Lỗi kết nối đến cơ sở dữ liệu:', err.message);
    return;
  }
  console.log('Đã kết nối đến cơ sở dữ liệu MySQL');
});

server.listen(PORT, async () => {
  console.log(`Server is running on port ${PORT}`);
  const url = await ngrok.connect(PORT);
  console.log(`Ngrok URL: ${url}`);
});
