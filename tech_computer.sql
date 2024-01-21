-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 21, 2024 lúc 05:22 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tech_computer`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `address`
--

INSERT INTO `address` (`id`, `phoneNumber`, `content`, `status`) VALUES
(1, '0384864757', 'Ấp 3 xã Nhơn Đức huyện Nhà Bè Tp Hồ Chí Minh', 1),
(2, '0914105327', '165/12 ấp 1 xã Nhơn Đức huyện Nhà Bè Tp Hồ Chí Minh', 1),
(3, '0975738135', '64/32/12/56 P.2, Q.4 Tp Hồ Chí Minh', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id`, `name`, `status`) VALUES
(5, 'Del', 1),
(6, 'Lenovo', 1),
(7, 'Apple', 1),
(8, 'Asus', 1),
(9, 'Intel', 1),
(10, 'Western Digital', 1),
(11, 'MSI', 1),
(12, 'Nvidia', 1),
(13, 'Logitech', 1),
(14, 'Deepcool', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `phoneNumber` varchar(15) NOT NULL,
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`phoneNumber`, `id`, `status`) VALUES
('0384864757', 1, 1),
('0914105327', 2, 1),
('0975738135', 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_details`
--

CREATE TABLE `cart_details` (
  `idCart` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_details`
--

INSERT INTO `cart_details` (`idCart`, `idProduct`, `quantity`) VALUES
(1, 1, 2),
(1, 7, 1),
(1, 8, 2),
(2, 9, 3),
(2, 14, 2),
(3, 14, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `nameCate` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `nameCate`, `status`) VALUES
(1, 'Laptop', 1),
(2, 'Máy Bàn', 1),
(3, 'Ram', 1),
(4, 'CPU', 1),
(5, 'GPU', 1),
(6, 'Màn Hình', 1),
(7, 'Case', 1),
(8, 'Nguồn', 1),
(9, 'Ổ Cứng', 1),
(10, 'Bàn Phím', 1),
(11, 'Chuột', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `idUs1` varchar(15) NOT NULL,
  `idUs2` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `conversations`
--

INSERT INTO `conversations` (`id`, `idUs1`, `idUs2`, `status`) VALUES
(1, '0384864757', '0914105327', 1),
(2, '0975738135', '0384864757', 1),
(3, '0914105327', '0975738135', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `senderID` varchar(15) NOT NULL,
  `content` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `conversationID` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `senderID`, `content`, `timestamp`, `conversationID`, `status`) VALUES
(1, '0384864757', 'Xin chào. Sản phẩm này đợt giảm giá tiếp theo là khi nào thế.', '2024-01-21 14:41:49', 1, 1),
(2, '0914105327', 'Tôi sẽ không nói là nó nằm vào dịp tết đâu.', '2024-01-21 14:41:49', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `content` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `notification`
--

INSERT INTO `notification` (`id`, `phoneNumber`, `content`, `timestamp`, `status`) VALUES
(1, '0384864757', 'Sản phẩm mới vừa được cập nhật.', '2024-01-21 15:42:17', 1),
(2, '0914105327', 'Sản phẩm bạn thêm vào giỏ sắp hết hàng nhanh chóng mua nào!!', '2024-01-21 15:42:17', 1),
(3, '0975738135', 'Ring ring có đợt giảm giá cho tất cả các sản phẩm của Del', '2024-01-21 15:42:17', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `paymentMethods` int(11) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `date` date NOT NULL,
  `transportFee` int(11) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `Status`, `paymentMethods`, `phoneNumber`, `date`, `transportFee`, `address`) VALUES
(1, 1, 1, '0384864757', '2024-01-08', 10, ''),
(2, 1, 1, '0384864757', '2024-01-08', 10, ''),
(3, 1, 1, '0914105327', '2024-01-20', 45000, '34/12/11 Đường Khánh Hội Q.4 Tp Hồ Chí Minh'),
(4, 1, 1, '0975738135', '2024-01-21', 23000, '43/211 ấp 2 xã Đông Thạnh huyện Hóc Môn Tp Hồ Chí Minh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `quantityProduct` int(11) NOT NULL,
  `idOrder` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`quantityProduct`, `idOrder`, `idProduct`) VALUES
(2, 1, 1),
(1, 1, 7),
(2, 1, 7),
(3, 1, 8),
(4, 2, 7),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `name`, `status`) VALUES
(1, 'Thanh toán tiền mặt', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `image` longtext DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `des` text DEFAULT NULL,
  `idDiscount` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `idCate` int(11) DEFAULT NULL,
  `idBrand` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `image`, `name`, `quantity`, `price`, `des`, `idDiscount`, `status`, `idCate`, `idBrand`) VALUES
(1, 'abc', 'ASUS AIO A3402WBAK', 10, 14060000, 'Máy tính để bàn ASUS AIO A3402WBAK i3 1215U (WA549W) được hoàn thiện với nhiều tính năng hữu ích, phần cứng vượt trội cùng khung màn hình vừa đủ 23.8 inch hiển thị thoải mái đa nội dung. Sản phẩm chính là minh chứng tuyệt vời cho lối làm việc tương lai, vừa tích hợp nhỏ gọn và tiện lợi, vừa hỗ trợ giải quyết mọi tác vụ nhanh chóng.', 1, 1, 2, 8),
(7, 'abc', 'Laptop Dell Inspiron 15 351', 22, 22000000, 'Laptop Dell Inspiron 15 3511 PDP3H đang được người tiêu dùng hết mực săn đón nhờ thiết kế bên ngoài mỏng nhẹ cùng cấu hình mượt tới từ chipset Intel hiện đại. Bên cạnh đó laptop Dell Inspiron còn sở hữu khả năng lưu trữ ổn định thông qua thông số bộ nhớ lên tới 256GB bộ nhớ trong và 8GB RAM, đem tới trải nghiệm đa nhiệm mượt mà cùng không gian ghi nhớ tuyệt vời.Truy xuất dữ liệu nhanh với thông số bộ nhớ ổn định Laptop Dell Inspiron 15 3511 PDP3H sở hữu tốc độ truy xuất ấn tượng nhờ được tích hợp kho lưu trữ SSD 256GB. Qua đó, các thao tác tìm kiếm tập tin của bạn trên laptop Dell này sẽ trở nên vô cùng nhanh chóng, giảm thời gian chờ đợi và nâng cao hiệu suất sử dụng.', 1, 1, 1, 5),
(8, 'acc', 'Laptop Lenovo Inspiron 22', 33, 30000000, 'Laptop Lenovo Inspiron 22 2000 PDP3H đang được người tiêu dùng hết mực săn đón nhờ thiết kế bên ngoài mỏng nhẹ cùng cấu hình mượt tới từ chipset Intel hiện đại. Bên cạnh đó laptop Dell Inspiron còn sở hữu khả năng lưu trữ ổn định thông qua thông số bộ nhớ lên tới 256GB bộ nhớ trong và 8GB RAM, đem tới trải nghiệm đa nhiệm mượt mà cùng không gian ghi nhớ tuyệt vời.\r\nTruy xuất dữ liệu nhanh với thông số bộ nhớ ổn định\r\nLaptop Lenovo Inspiron 22 2000 PDP3H sở hữu tốc độ truy xuất ấn tượng nhờ được tích hợp kho lưu trữ SSD 256GB. Qua đó, các thao tác tìm kiếm tập tin của bạn trên laptop Dell này sẽ trở nên vô cùng nhanh chóng, giảm thời gian chờ đợi và nâng cao hiệu suất sử dụng.', 1, 1, 1, 6),
(9, 'image', 'Chuột Lightsync Logitech', 32, 430000, 'Dù có mức giá rất bình dân nhưng chuột Logitech G102 Lightsync RGB lại được trang bị led  RGB 16,8 triệu màu .Chọn một màu hay trộn 3 màu, hiệu ứng có sẵn hay tạo hiệu ứng của riêng bạn . Sự lựa chọn là của bạn ! Bạn còn có thể đồng bộ chuột với thiết bị LIGHTSYNC của Logitech G khác giúp góc máy trở nên đồng bộ và độc đáo hơn.', 1, 1, 11, 13),
(10, 'image', 'Chuột Asus TUF', 20, 200000, 'Asus TUF Gaming M3 được biết đến là dòng chuột máy tính sở hữu hiệu năng ấn tượng, khả năng tương thích cao, nút bấm được bố trí thông minh thuận tiện cho mọi nhu cầu sử dụng. Đặc biệt, ở thế hệ Gen II hãng còn tích hợp thêm nhiều công nghệ hiện đại. Hứa hẹn sẽ là một trong những dòng chuột gaming rất đáng trải nghiệm', 1, 1, 11, 8),
(11, 'image', 'Chuột Logitech G502 Hero', 20, 950000, 'Ngoài hiệu suất cốt lõi và các tính năng cá nhân, nhiều chi tiết được thiết kế và chế tạo với sự tận tâm. Logitech G502 Hero là một trong những dòng chuột gaming giá rẻ so với các sản phẩm ở cùng phân khúc với dây bện với nút buộc dây có khóa nhám, phần cầm nắm bên có viền cao su, cửa từ vào khoang để khối nặng và nhiều hơn nữa.', 1, 1, 11, 13),
(12, 'image', 'Asus S500SD', 23, 11890000, 'Bạn đang tìm kiếm một chiếc PC mạnh mẽ, đáp ứng nhu cầu làm việc và giải trí hàng ngày? Tham khảo ngay PC Asus S500SD i5 12400 (512400050W) với ngoại hình tối giản cùng những thông số cấu hình ấn tượng.\r\n• PC Asus được trang bị bộ vi xử lý Intel Core i5 12400 với tốc độ xung nhịp lên đến 4.40 GHz, cho phép xử lý các tác vụ đa nhiệm và xử lý dữ liệu phức tạp một cách mạnh mẽ và nhanh chóng, từ các ứng dụng văn phòng cho đến thiết kế, chơi game.', 1, 1, 2, 8),
(13, 'image', 'Inter Core i5 14400F', 34, 5790000, 'I5 tuy lâu đời nhưng vẫn còn rất nhiều tiện ích cũng như nhiều người ưa chuộng ', 1, 1, 4, 9),
(14, 'image', 'Inter Core i9 14900', 34, 10010000, 'I9 mới được ra mắt với nhiều khả năng thích nghi cùng tiện dụng', 1, 1, 4, 9),
(16, 'image', 'Chuột không dây E56', 100, 200000, 'Chuột không dây tiện dụng cho các học sinh sinh viên nhân viên văn phòng ', 1, 1, 2, 6),
(20, 'image', 'Sản phẩm thử nghiệm 2', 52, 52000, 'Đây là sản phảm thử nghiệm ', 1, 0, 2, 7),
(21, 'image', 'Ram DD4 ', 12, 500000, 'Đây là Ram DD4 mới nhất trên thị trường thích howpk nhiều cấu hình máy', 1, 1, 3, 8),
(22, 'image', 'San pham moi', 21, 12000, 'day kaf san pham moi', 1, 0, 2, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `quantityForEach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `promotion`
--

INSERT INTO `promotion` (`id`, `title`, `description`, `startDate`, `endDate`, `status`, `quantityForEach`) VALUES
(1, 'Cuối năm', 'Giảm giá cuối năm 2023 chào đón năm mới, giảm 50 phần trăm trên mỗi sản phẩm', '2024-01-16 20:37:26', '2024-02-29 20:37:26', 1, 100),
(2, 'Đầu năm 2024', 'Giảm giá đầu năm 2024 chào đón 1 năm mới thuận lợi và bình an.', '2024-02-08 22:13:16', '2024-02-29 22:13:16', 1, 100),
(3, 'Quốc tế Phụ nữ', 'Mùng 8 tháng 3 là ngày Quốc tế Phụ nữ hay Ngày Liên Hiệp Quốc vì Nữ quyền và Hòa bình Quốc tế. Vào ngày 20 tháng 10 năm 1930, Hội Phụ nữ phản đế Việt Nam (nay đổi tên là Hội Phụ nữ Việt Nam) chính thức được thành lập.', '2024-03-04 22:15:28', '2024-03-09 22:15:28', 1, 100),
(4, '30/4 và 1/5', 'Ngày 30 tháng 4 là ngày lễ toàn dân mang ý nghĩa lịch sử trọng đại, chứng minh cho sức mạnh đoàn kết, truyền thống dựng nước và giữ nước. Đây là ngày Quốc tế Lao động, người lao động tại Việt Nam và nhiều đất nước trên thế giới sẽ được nghỉ và hưởng nguyê', '2024-04-28 22:18:16', '2024-05-02 22:18:16', 1, 100),
(5, 'Quốc tế thiếu nhi', 'Ngày 1- 6 là ngày Quốc tế Thiếu nhi, ngày Tết dành riêng cho trẻ em. Trong ngày này, các em không chỉ được nhận những lời chúc mừng đầy yêu thương của ông bà,...', '2024-05-26 22:21:18', '2024-06-02 22:21:18', 1, 100);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `phoneNumber` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` tinyint(1) DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `biography` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`phoneNumber`, `name`, `sex`, `birthday`, `biography`, `password`, `admin`, `status`) VALUES
('0384864757', 'Nguyễn Tấn Tài ', NULL, NULL, NULL, 'a320480f534776bddb5cdb54b1e93d210a3c7d199e80a23c1b2178497b184c76', 0, 1),
('0914105327', 'Trần Thị Kim Ngân a', 0, NULL, 'gwhwhg', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1),
('0975738135', 'Nguyễn Văn Linh ', NULL, NULL, NULL, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phoneNumber` (`phoneNumber`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phoneNumber` (`phoneNumber`);

--
-- Chỉ mục cho bảng `cart_details`
--
ALTER TABLE `cart_details`
  ADD KEY `idCart` (`idCart`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUs1` (`idUs1`),
  ADD KEY `idUs2` (`idUs2`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversationID` (`conversationID`),
  ADD KEY `senderID` (`senderID`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phoneNumber` (`phoneNumber`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phoneNumber` (`phoneNumber`),
  ADD KEY `paymentMethods` (`paymentMethods`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `idOrder` (`idOrder`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idBrand` (`idBrand`),
  ADD KEY `idCate` (`idCate`),
  ADD KEY `idDiscount` (`idDiscount`);

--
-- Chỉ mục cho bảng `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`phoneNumber`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`phoneNumber`) REFERENCES `user` (`phoneNumber`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`phoneNumber`) REFERENCES `user` (`phoneNumber`);

--
-- Các ràng buộc cho bảng `cart_details`
--
ALTER TABLE `cart_details`
  ADD CONSTRAINT `cart_details_ibfk_1` FOREIGN KEY (`idCart`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `cart_details_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`idUs1`) REFERENCES `user` (`phoneNumber`),
  ADD CONSTRAINT `conversations_ibfk_2` FOREIGN KEY (`idUs2`) REFERENCES `user` (`phoneNumber`);

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversationID`) REFERENCES `conversations` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`senderID`) REFERENCES `user` (`phoneNumber`);

--
-- Các ràng buộc cho bảng `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`phoneNumber`) REFERENCES `user` (`phoneNumber`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`phoneNumber`) REFERENCES `user` (`phoneNumber`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`paymentMethods`) REFERENCES `payments` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idBrand`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`idCate`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`idDiscount`) REFERENCES `promotion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
