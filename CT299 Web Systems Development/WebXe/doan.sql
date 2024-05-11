-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 18, 2024 lúc 11:38 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hopdongmuaxe`
--

CREATE TABLE `hopdongmuaxe` (
  `maHD` int(11) NOT NULL,
  `tenHD` varchar(250) NOT NULL,
  `maxe` int(11) NOT NULL,
  `manv` int(11) NOT NULL,
  `makhach` int(11) NOT NULL,
  `ngaylap` date NOT NULL,
  `tongtien` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `makhach` int(11) NOT NULL,
  `hotenkhach` varchar(250) NOT NULL,
  `SDT` int(11) NOT NULL,
  `diachi` varchar(250) NOT NULL,
  `gioitinh` varchar(3) NOT NULL,
  `KH_username` varchar(50) NOT NULL,
  `KH_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`makhach`, `hotenkhach`, `SDT`, `diachi`, `gioitinh`, `KH_username`, `KH_password`) VALUES
(1, 'Hoang Gia', 123, 'an giang', '1', 'nhg', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaixe`
--

CREATE TABLE `loaixe` (
  `maloai` varchar(250) NOT NULL,
  `tenloai` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `loaixe`
--

INSERT INTO `loaixe` (`maloai`, `tenloai`) VALUES
('SD', 'SEDAN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `manv` int(11) NOT NULL,
  `hotennv` varchar(250) NOT NULL,
  `SDT` int(11) NOT NULL,
  `diachi` varchar(250) NOT NULL,
  `gioitinh` varchar(3) NOT NULL,
  `nv_username` varchar(50) NOT NULL,
  `nv_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`manv`, `hotennv`, `SDT`, `diachi`, `gioitinh`, `nv_username`, `nv_password`) VALUES
(1, 'Hoang Gia', 123, 'an giang', '1', 'nhg', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `xe`
--

CREATE TABLE `xe` (
  `maxe` int(11) NOT NULL,
  `tenxe` varchar(250) NOT NULL,
  `hangxe` varchar(50) NOT NULL,
  `namsx` int(11) NOT NULL,
  `so_km_da_di` int(11) NOT NULL,
  `so_cho_ngoi` int(11) NOT NULL,
  `giaxe` float NOT NULL,
  `maloai` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `xe`
--

INSERT INTO `xe` (`maxe`, `tenxe`, `hangxe`, `namsx`, `so_km_da_di`, `so_cho_ngoi`, `giaxe`, `maloai`) VALUES
(1, 'Camry', 'Toyota', 2022, 1255, 4, 0, 'SD');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `hopdongmuaxe`
--
ALTER TABLE `hopdongmuaxe`
  ADD PRIMARY KEY (`maHD`),
  ADD KEY `FK_HD_xe` (`maxe`),
  ADD KEY `FK_HD_nhanvien` (`manv`),
  ADD KEY `FK_HD_khachhang` (`makhach`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`makhach`);

--
-- Chỉ mục cho bảng `loaixe`
--
ALTER TABLE `loaixe`
  ADD PRIMARY KEY (`maloai`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`manv`);

--
-- Chỉ mục cho bảng `xe`
--
ALTER TABLE `xe`
  ADD PRIMARY KEY (`maxe`),
  ADD KEY `FK_loaixe_xe` (`maloai`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `hopdongmuaxe`
--
ALTER TABLE `hopdongmuaxe`
  MODIFY `maHD` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `makhach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `manv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `xe`
--
ALTER TABLE `xe`
  MODIFY `maxe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `hopdongmuaxe`
--
ALTER TABLE `hopdongmuaxe`
  ADD CONSTRAINT `FK_HD_khachhang` FOREIGN KEY (`makhach`) REFERENCES `khachhang` (`makhach`),
  ADD CONSTRAINT `FK_HD_nhanvien` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`),
  ADD CONSTRAINT `FK_HD_xe` FOREIGN KEY (`maxe`) REFERENCES `xe` (`maxe`);

--
-- Các ràng buộc cho bảng `xe`
--
ALTER TABLE `xe`
  ADD CONSTRAINT `FK_loaixe_xe` FOREIGN KEY (`maloai`) REFERENCES `loaixe` (`maloai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
