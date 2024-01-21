-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 21, 2024 lúc 02:56 PM
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
(8, 'Asus', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `phoneNumber` varchar(15) NOT NULL,
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_details`
--

CREATE TABLE `cart_details` (
  `idCart` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `nameCate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `nameCate`) VALUES
(1, 'Laptop'),
(2, 'Máy Bàn'),
(3, 'Ram'),
(4, 'CPU'),
(5, 'GPU'),
(6, 'Màn Hình'),
(7, 'Case'),
(8, 'Nguồn'),
(9, 'Ổ Cứng'),
(10, 'Bàn Phím'),
(11, 'Chuột');

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
(2, 1, 1, '0384864757', '2024-01-08', 10, '');

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
(1, 'abc', 'Laptop abc', 10, 2000, 'abc', 1, 0, 2, 8),
(7, 'abc', 'Laptop Dell Inspiron 15 351', 22, 22000000, 'Laptop Dell Inspiron 15 3511 PDP3H đang được người tiêu dùng hết mực săn đón nhờ thiết kế bên ngoài mỏng nhẹ cùng cấu hình mượt tới từ chipset Intel hiện đại. Bên cạnh đó laptop Dell Inspiron còn sở hữu khả năng lưu trữ ổn định thông qua thông số bộ nhớ lên tới 256GB bộ nhớ trong và 8GB RAM, đem tới trải nghiệm đa nhiệm mượt mà cùng không gian ghi nhớ tuyệt vời.Truy xuất dữ liệu nhanh với thông số bộ nhớ ổn định Laptop Dell Inspiron 15 3511 PDP3H sở hữu tốc độ truy xuất ấn tượng nhờ được tích hợp kho lưu trữ SSD 256GB. Qua đó, các thao tác tìm kiếm tập tin của bạn trên laptop Dell này sẽ trở nên vô cùng nhanh chóng, giảm thời gian chờ đợi và nâng cao hiệu suất sử dụng.', 1, 1, 1, 5),
(8, 'acc', 'Laptop Lenovo Inspiron 22', 33, 30000000, 'Laptop Lenovo Inspiron 22 2000 PDP3H đang được người tiêu dùng hết mực săn đón nhờ thiết kế bên ngoài mỏng nhẹ cùng cấu hình mượt tới từ chipset Intel hiện đại. Bên cạnh đó laptop Dell Inspiron còn sở hữu khả năng lưu trữ ổn định thông qua thông số bộ nhớ lên tới 256GB bộ nhớ trong và 8GB RAM, đem tới trải nghiệm đa nhiệm mượt mà cùng không gian ghi nhớ tuyệt vời.\r\nTruy xuất dữ liệu nhanh với thông số bộ nhớ ổn định\r\nLaptop Lenovo Inspiron 22 2000 PDP3H sở hữu tốc độ truy xuất ấn tượng nhờ được tích hợp kho lưu trữ SSD 256GB. Qua đó, các thao tác tìm kiếm tập tin của bạn trên laptop Dell này sẽ trở nên vô cùng nhanh chóng, giảm thời gian chờ đợi và nâng cao hiệu suất sử dụng.', 1, 1, 1, 6),
(9, 'image', 'Chuot khong day', 32, 430000, 'Day la chuot khong day ', 1, 0, 2, 6),
(10, 'image', 'San pham moi', 20, 200000, 'san ta ', 1, 0, 2, 6),
(11, 'image', 'San pham moi hai', 20, 200000, 'san ta ', 1, 0, 2, 6),
(12, 'image', 'san pham ba', 23, 23232, 'mota', 1, 0, 2, 6),
(13, 'image', 'Inter Core i5', 34, 590000, 'I5 tuy lâu đời nhưng vẫn còn rất nhiều tiện ích cũng như nhiều người ưa chuộng ', 1, 1, 3, 5),
(14, 'image', 'Inter Core i9 ', 34, 10010000, 'I9 mới được ra mắt với nhiều khả năng thích nghi cùng tiện dụng', 1, 1, 4, 6),
(16, 'image', 'Chuột không dây E56', 100, 200000, 'Chuột không dây tiện dụng cho các học sinh sinh viên nhân viên văn phòng ', 1, 1, 2, 6),
(20, 'image', 'Sản phẩm thử nghiệm ', 52, 52000, 'Đây là sản phảm thử nghiệm ', 1, 0, 2, 7),
(21, 'image', 'Ram DD4 ', 12, 500000, 'Đây là Ram DD4 mới nhất trên thị trường thích howpk nhiều cấu hình máy', 1, 1, 3, 8);

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
(1, 'Giảm giá cuối năm', 'Giảm giá cuối năm 2023 chào đón năm mới, giảm 50 phần trăm trên mỗi sản phẩm', '2024-01-16 20:37:26', '2024-02-29 20:37:26', 1, 100);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
