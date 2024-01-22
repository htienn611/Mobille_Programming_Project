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
const order_detailsRoutes = require('./api/orderDetail');
const conversationRoutes = require('./api/conversation');
const messageRoutes = require('./api/message');
const promotionRoutes = require('./api/promotion');
const notificationRoutes=require('./api/notification')



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

app.use((req, res, next) => {
  req.db = db;
  next();
});

//khai báo sử dụng category.js
app.use('/user', userRoutes)
app.use('/brand', brandRoutes)
app.use('/product', productRoutes)
app.use('/order', orderRoutes);
app.use('/order_details', order_detailsRoutes);
app.use('/category', categoryRoutes);
app.use('/conversation', conversationRoutes);
app.use('/message', messageRoutes);
app.use('/promotion', promotionRoutes);
app.use('/notification',notificationRoutes);

io.on('connection', (socket) => {
  console.log('Một người dùng đã kết nối');

  socket.on('chat message', async (msg) => {
    // try {
    //   // Sử dụng đối tượng kết nối từ middleware (đã thêm vào từ app.use((req, res, next) => ...))
    //   const result = await req.db.promise().execute('INSERT INTO messages (content) VALUES (?)', [msg]);
    //   console.log('Tin nhắn đã được lưu vào cơ sở dữ liệu:', result);
    // } catch (error) {
    //   console.error('Lỗi khi lưu tin nhắn vào cơ sở dữ liệu:', error.message);
    // }
    console.log(msg);
    // Gửi tin nhắn mới tới tất cả các client khác (không bao gồm người gửi)
    socket.broadcast.emit('chat message', msg);
  });

  socket.on('disconnect', () => {
    console.log('Người dùng đã ngắt kết nối');
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
