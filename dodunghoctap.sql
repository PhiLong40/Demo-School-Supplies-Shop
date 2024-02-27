-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 26, 2024 lúc 03:34 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dodunghoctap`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Bút'),
(2, 'Thước'),
(3, 'Cục tẩy'),
(4, 'Hộp bút');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`id`, `name`, `email`, `phone`, `password`, `role`) VALUES
(1, 'Huỳnh Tấn Phi Long', 'test@gmail.com', '0849026799', '202cb962ac59075b964b07152d234b70', 'admin'),
(2, 'Banh', 'htplong2002@gmail.com', '0914424250', '222', ''),
(4, 'testttt', 'hehehe@gmail.com', '0849026788', '202cb962ac59075b964b07152d234b70', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `quantity`, `status`, `id_category`) VALUES
(50, 'Bút viết Baby bear cheese happy face - Mix', 'but-Baby-bear.jpeg', 30000, 10, 1, 1),
(51, 'Bút viết Gấu trúc Pandabiz activities má hồng', 'but-gau-truc-Pandabiz.jpeg', 20000, 12, 1, 1),
(52, 'Bút viết White ghost HLW', 'but-White-ghost.jpeg', 20000, 5, 1, 1),
(53, 'Bút viết Animal ghost heart HLW', 'but-Animal-ghost.jpeg', 19000, 16, 1, 1),
(54, 'Bút viết set6 Lucky tulip flower', 'but-Lucky.jpeg', 50000, 8, 1, 1),
(60, 'Bút chì kim Sweet bunny má hồng', 'but-chi-Sweet-bunny.jpeg', 15000, 4, 1, 1),
(61, 'Bút chì kim Cute dog bakery', 'but-chi-Cute-dog.jpeg', 17400, 21, 1, 1),
(62, 'Bút chì kim Fast food retro party', 'but-chi-fast-food.jpeg', 21000, 16, 1, 1),
(63, 'Bút chì kim Baby bear sweet life', 'but-chi-Baby-bear.jpeg', 14200, 13, 1, 1),
(64, 'Bút chì khúc Peppa Pig colorful clothes', 'but-chi-Peppa-pig.jpeg', 24100, 15, 1, 1),
(79, 'Thước pig', 'Thuoc3.jpeg', 123, 2, 1, 2),
(80, 'Thước capybara', 'Thuoc2.jpeg', 16200, 7, 1, 2),
(81, 'Cục tẩy a', 'cuctay1.jpeg', 14300, 8, 1, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`id_category`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
