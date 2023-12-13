-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 10, 2023 lúc 02:25 PM
-- Phiên bản máy phục vụ: 8.0.31
-- Phiên bản PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ebooks`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

DROP TABLE IF EXISTS `danhgia`;
CREATE TABLE IF NOT EXISTS `danhgia` (
  `id_danhgia` int NOT NULL AUTO_INCREMENT,
  `id_sach` int DEFAULT NULL,
  `id_nguoidung` int DEFAULT NULL,
  `diem_danhgia` int DEFAULT NULL,
  `binh_luan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_danhgia`),
  KEY `id_sach` (`id_sach`),
  KEY `id_nguoidung` (`id_nguoidung`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgia`
--

INSERT INTO `danhgia` (`id_danhgia`, `id_sach`, `id_nguoidung`, `diem_danhgia`, `binh_luan`) VALUES
(4, 1, 4, 5, 'Sách hay quá!'),
(5, 1, 5, 4, 'Thích đọc nó'),
(6, 2, 6, 3, 'Không tệ, nhưng có thể tốt hơn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsudocsach`
--

DROP TABLE IF EXISTS `lichsudocsach`;
CREATE TABLE IF NOT EXISTS `lichsudocsach` (
  `id_lichsudoc` int NOT NULL AUTO_INCREMENT,
  `id_nguoidung` int DEFAULT NULL,
  `id_sach` int DEFAULT NULL,
  `ngay_bat_dau` datetime DEFAULT NULL,
  `ngay_ket_thuc` datetime DEFAULT NULL,
  PRIMARY KEY (`id_lichsudoc`),
  KEY `id_nguoidung` (`id_nguoidung`),
  KEY `id_sach` (`id_sach`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lichsudocsach`
--

INSERT INTO `lichsudocsach` (`id_lichsudoc`, `id_nguoidung`, `id_sach`, `ngay_bat_dau`, `ngay_ket_thuc`) VALUES
(1, 4, 1, '2023-01-01 10:00:00', '2023-01-01 12:00:00'),
(2, 5, 2, '2023-02-15 14:00:00', '2023-02-15 16:00:00'),
(3, 6, 3, '2023-03-20 18:00:00', '2023-03-20 20:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
CREATE TABLE IF NOT EXISTS `nguoidung` (
  `id_nguoidung` int NOT NULL AUTO_INCREMENT,
  `ten_dangnhap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mat_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` bit(1) NOT NULL,
  PRIMARY KEY (`id_nguoidung`),
  UNIQUE KEY `ten_dangnhap` (`ten_dangnhap`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`id_nguoidung`, `ten_dangnhap`, `email`, `mat_khau`, `admin`) VALUES
(1, 'admin', 'admin@example.com', 'admin123', b'1'),
(4, 'nguoidung1', 'nguoidung1@example.com', 'matkhau1', b'0'),
(5, 'nguoidung2', 'nguoidung2@example.com', 'matkhau2', b'0'),
(6, 'nguoidung3', 'nguoidung3@example.com', 'matkhau3', b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhaxuatban`
--

DROP TABLE IF EXISTS `nhaxuatban`;
CREATE TABLE IF NOT EXISTS `nhaxuatban` (
  `id_nhaxuatban` int NOT NULL AUTO_INCREMENT,
  `ten_nhaxuatban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_nhaxuatban`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhaxuatban`
--

INSERT INTO `nhaxuatban` (`id_nhaxuatban`, `ten_nhaxuatban`) VALUES
(1, 'Kim Đồng'),
(2, 'trẻ'),
(3, 'giáo dục');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

DROP TABLE IF EXISTS `sach`;
CREATE TABLE IF NOT EXISTS `sach` (
  `id_sach` int NOT NULL AUTO_INCREMENT,
  `tieu_de` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_xuat_ban` date DEFAULT NULL,
  `id_theloai` int DEFAULT NULL,
  `mo_ta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hinh_bia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_sach`),
  KEY `id_theloai` (`id_theloai`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`id_sach`, `tieu_de`, `ngay_xuat_ban`, `id_theloai`, `mo_ta`, `hinh_bia`) VALUES
(1, 'Tôi thấy hoa vàng trên cỏ xanh', '0000-00-00', 1, 'kể về tuổi thơ nghèo khó của hai anh em Thiều và Tường cùng cô bạn thân hàng xóm', 'hinh1.png'),
(2, 'đấu phá thương khung', '0000-00-00', 2, 'kể về Tiêu Viêm, một thiếu niên có thiên phú tu luyện và từng được xem là thiên tài của gia tộc cho đến khi mẹ Tiêu Viêm qua đời, để lại di vật là một hắc sắc giới chỉ, từ đây Tiêu Viêm mất hết thiên phú tu luyện', 'sach2.jpg'),
(3, 'Giáo dục học', '0000-00-00', 3, 'sách dành cho giáp dục', 'sach3.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tacgia`
--

DROP TABLE IF EXISTS `tacgia`;
CREATE TABLE IF NOT EXISTS `tacgia` (
  `id_tacgia` int NOT NULL AUTO_INCREMENT,
  `ten_tacgia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_sinh` date DEFAULT NULL,
  PRIMARY KEY (`id_tacgia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tacgia`
--

INSERT INTO `tacgia` (`id_tacgia`, `ten_tacgia`, `ngay_sinh`) VALUES
(1, 'Nguyễn Nhật Ánh', '1990-01-15'),
(2, 'Thiên Tàm Thổ', '1985-05-20'),
(3, 'T.A Ilina', '1978-12-10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

DROP TABLE IF EXISTS `theloai`;
CREATE TABLE IF NOT EXISTS `theloai` (
  `id_theloai` int NOT NULL AUTO_INCREMENT,
  `ten_theloai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_theloai`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`id_theloai`, `ten_theloai`) VALUES
(1, 'Khoa Học Viễn Tưởng'),
(2, 'tiểu thuyết'),
(3, 'Lãng Mạn'),
(4, 'Huyền Huyễn');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `danhgia_ibfk_1` FOREIGN KEY (`id_sach`) REFERENCES `sach` (`id_sach`),
  ADD CONSTRAINT `danhgia_ibfk_2` FOREIGN KEY (`id_nguoidung`) REFERENCES `nguoidung` (`id_nguoidung`);

--
-- Các ràng buộc cho bảng `lichsudocsach`
--
ALTER TABLE `lichsudocsach`
  ADD CONSTRAINT `lichsudocsach_ibfk_1` FOREIGN KEY (`id_nguoidung`) REFERENCES `nguoidung` (`id_nguoidung`),
  ADD CONSTRAINT `lichsudocsach_ibfk_2` FOREIGN KEY (`id_sach`) REFERENCES `sach` (`id_sach`);

--
-- Các ràng buộc cho bảng `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`id_theloai`) REFERENCES `theloai` (`id_theloai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
