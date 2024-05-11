-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 10:39 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b2110009`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietddh`
--

CREATE TABLE `chitietddh` (
  `madon` int(11) NOT NULL,
  `msp` int(11) NOT NULL,
  `soluong` int(11) DEFAULT NULL,
  `dongia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `chitietddh`
--

INSERT INTO `chitietddh` (`madon`, `msp`, `soluong`, `dongia`) VALUES
(1, 3, 5, 20000),
(2, 4, 5, 30000),
(3, 1, 6, 50000),
(4, 5, 7, 20000),
(5, 6, 4, 50000),
(6, 2, 5, 20000),
(7, 1, 5, 20000),
(8, 6, 5, 20000),
(9, 7, 5, 20000),
(10, 7, 5, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `chitiettrangthai`
--

CREATE TABLE `chitiettrangthai` (
  `madon` int(11) NOT NULL,
  `manv` int(11) DEFAULT NULL,
  `matrangthai` int(11) NOT NULL,
  `noidung` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ngaytao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `chitiettrangthai`
--

INSERT INTO `chitiettrangthai` (`madon`, `manv`, `matrangthai`, `noidung`, `ngaytao`) VALUES
(1, 2, 1, 'Nội dung trạng thái 1', '2024-01-18'),
(2, 3, 2, 'Nội dung trạng thái 2', '2024-01-13'),
(3, 1, 2, 'Nội dung trạng thái 2', '2024-01-18'),
(4, 3, 1, 'Nội dung trạng thái 1', '2024-01-13'),
(5, 1, 4, 'Nội dung trạng thái 4', '2024-01-15'),
(6, 6, 3, 'Nội dung trạng thái 3', '2024-01-13'),
(7, 1, 2, 'Nội dung trạng thái 2', '2024-01-16'),
(8, 5, 3, 'Nội dung trạng thái 3', '2024-01-13'),
(9, 6, 5, 'Nội dung trạng thái 5', '2024-01-18'),
(10, 3, 2, 'Nội dung trạng thái 2', '2024-01-18');

-- --------------------------------------------------------

--
-- Table structure for table `dondathang`
--

CREATE TABLE `dondathang` (
  `madon` int(11) NOT NULL,
  `ngaydat` date DEFAULT NULL,
  `makhach` int(11) DEFAULT NULL,
  `manv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `dondathang`
--

INSERT INTO `dondathang` (`madon`, `ngaydat`, `makhach`, `manv`) VALUES
(1, '1995-02-16', 1, 2),
(2, '1998-03-15', 5, 5),
(3, '2003-03-15', 1, 5),
(4, '2023-02-15', 2, 3),
(5, '2023-06-15', 6, 1),
(6, '1999-03-15', 5, 3),
(7, '2023-03-15', 1, 5),
(8, '2023-03-15', 5, 4),
(9, '2023-03-15', 2, 1),
(10, '2023-03-15', 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `makhach` int(11) NOT NULL,
  `hoten` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `diachi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`makhach`, `hoten`, `diachi`, `email`, `password`) VALUES
(1, 'Tran Van A', 'Địa chỉ 1', 'tranvana@gmail.com', 'vana123'),
(2, 'Tran Van B', 'Địa chỉ 2', 'tranvanb@gmail.com', 'vanb123'),
(3, 'Tran Van C', 'Địa chỉ 3', 'tranvanc@gmail.com', 'vanc123'),
(4, 'Tran Van D', 'Bạc Liêu', 'tranvand@gmail.com', 'vand123'),
(5, 'Tran Van E', 'Sóc Trăng', 'tranvane@gmail.com', 'vane123'),
(6, 'Tran Van F', 'Cà Mau', 'tranvanf@gmail.com', 'vanf123'),
(7, 'Tran Van G', 'TP HCM', 'tranvang@gmail.com', 'vang123'),
(8, 'Tran Van H', 'Hậu Giang', 'tranvanh@gmail.com', 'vanh123'),
(9, 'Tran Van Y', 'An Giang', 'tranvany@gmail.com', 'vany123'),
(10, 'Tran Van K', 'Vĩnh Long', 'tranvank@gmail.com', 'vank123');

-- --------------------------------------------------------

--
-- Table structure for table `loaisp`
--

CREATE TABLE `loaisp` (
  `maloai` int(11) NOT NULL,
  `tenloai` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `loaisp`
--

INSERT INTO `loaisp` (`maloai`, `tenloai`) VALUES
(1, 'Loại 1'),
(2, 'Loại 2'),
(3, 'Loại 3'),
(4, 'Loại 4'),
(5, 'Loại 5'),
(6, 'Loại 6'),
(7, 'Loại 7'),
(8, 'Loại 8'),
(9, 'Loại 9'),
(10, 'Loại 10');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `manv` int(11) NOT NULL,
  `hotennv` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`manv`, `hotennv`, `email`, `password`) VALUES
(1, 'Nhan Vien 1', 'nv1@gmail.com', 'nv1one'),
(2, 'Nhan Vien 2', 'nv2@gmail.com', 'nv2one'),
(3, 'Nhan Vien 3', 'nv3@gmail.com', 'nv3one'),
(4, 'Nhan Vien 4', 'nv4@gmail.com', 'nv4one'),
(5, 'Nhan Vien 5', 'nv5@gmail.com', 'nv5one'),
(6, 'Nhan Vien 6', 'nv6@gmail.com', 'nv6one'),
(7, 'Nhan Vien 7', 'nv7@gmail.com', 'nv7one'),
(8, 'Nhan Vien 8', 'nv8@gmail.com', 'nv8one'),
(9, 'Nhan Vien 9', 'nv9@gmail.com', 'nv9one'),
(10, 'Nhan Vien 10', 'nv10@gmail.com', 'nv10one');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `msp` int(11) NOT NULL,
  `tensp` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dongia` int(11) DEFAULT NULL,
  `mota` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_hinh` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `maloai` int(11) DEFAULT NULL,
  `ngaythem` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`msp`, `tensp`, `dongia`, `mota`, `link_hinh`, `maloai`, `ngaythem`) VALUES
(1, 'Sản Phẩm 1', 20000, 'ND mô tả 1', 'linkpic1.png', 1, '2024-01-18'),
(2, 'Sản Phẩm 2', 20000, 'ND mô tả 2', 'linkpic2.png', 2, '2024-01-17'),
(3, 'Sản Phẩm 3', 20000, 'ND mô tả 3', 'linkpic3.png', 1, '2024-01-17'),
(4, 'Sản Phẩm 4', 20000, 'ND mô tả 4', 'linkpic4.png', 3, '2024-01-17'),
(5, 'Sản Phẩm 5', 20000, 'ND mô tả 5', 'linkpic5.png', 1, '2024-01-17'),
(6, 'Sản Phẩm 6', 20000, 'ND mô tả 6', 'linkpic6.png', 5, '2024-01-17'),
(7, 'Sản Phẩm 7', 20000, 'ND mô tả 7', 'linkpic7.png', 6, '2024-01-17'),
(8, 'Sản Phẩm 8', 20000, 'ND mô tả 8', 'linkpic8.png', 7, '2024-01-17'),
(9, 'Sản Phẩm 9', 20000, 'ND mô tả 9', 'linkpic9.png', 4, '2024-01-17'),
(10, 'Sản Phẩm 10', 20000, 'ND mô tả 10', 'linkpic10.png', 5, '2024-01-17');

-- --------------------------------------------------------

--
-- Table structure for table `trangthai`
--

CREATE TABLE `trangthai` (
  `matrangthai` int(11) NOT NULL,
  `tentrangthai` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `trangthai`
--

INSERT INTO `trangthai` (`matrangthai`, `tentrangthai`) VALUES
(1, 'Da dat hang'),
(2, 'Chua xu li'),
(3, 'Da xu li'),
(4, 'Dang giao'),
(5, 'Da cho van chuyen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitietddh`
--
ALTER TABLE `chitietddh`
  ADD PRIMARY KEY (`madon`,`msp`),
  ADD KEY `msp` (`msp`);

--
-- Indexes for table `chitiettrangthai`
--
ALTER TABLE `chitiettrangthai`
  ADD PRIMARY KEY (`madon`,`matrangthai`),
  ADD KEY `manv` (`manv`),
  ADD KEY `matrangthai` (`matrangthai`);

--
-- Indexes for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD PRIMARY KEY (`madon`),
  ADD KEY `makhach` (`makhach`),
  ADD KEY `manv` (`manv`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`makhach`);

--
-- Indexes for table `loaisp`
--
ALTER TABLE `loaisp`
  ADD PRIMARY KEY (`maloai`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`manv`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`msp`),
  ADD KEY `maloai` (`maloai`);

--
-- Indexes for table `trangthai`
--
ALTER TABLE `trangthai`
  ADD PRIMARY KEY (`matrangthai`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietddh`
--
ALTER TABLE `chitietddh`
  ADD CONSTRAINT `chitietddh_ibfk_1` FOREIGN KEY (`madon`) REFERENCES `dondathang` (`madon`),
  ADD CONSTRAINT `chitietddh_ibfk_2` FOREIGN KEY (`msp`) REFERENCES `sanpham` (`msp`);

--
-- Constraints for table `chitiettrangthai`
--
ALTER TABLE `chitiettrangthai`
  ADD CONSTRAINT `chitiettrangthai_ibfk_1` FOREIGN KEY (`madon`) REFERENCES `dondathang` (`madon`),
  ADD CONSTRAINT `chitiettrangthai_ibfk_2` FOREIGN KEY (`madon`) REFERENCES `dondathang` (`madon`),
  ADD CONSTRAINT `chitiettrangthai_ibfk_3` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`),
  ADD CONSTRAINT `chitiettrangthai_ibfk_4` FOREIGN KEY (`matrangthai`) REFERENCES `trangthai` (`matrangthai`);

--
-- Constraints for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD CONSTRAINT `dondathang_ibfk_1` FOREIGN KEY (`makhach`) REFERENCES `khachhang` (`makhach`),
  ADD CONSTRAINT `dondathang_ibfk_2` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`maloai`) REFERENCES `loaisp` (`maloai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
