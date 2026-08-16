-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 16, 2026 at 06:49 AM
-- Server version: 8.4.3
-- PHP Version: 8.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_madura`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entitas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`id`, `user_id`, `aksi`, `entitas`, `detail`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, 'DELETE', 'AuditLog', 'Hapus semua log audit', '127.0.0.1', '2026-05-19 14:27:04', '2026-05-19 14:27:04'),
(2, 1, 'LOGOUT', 'System', 'Kasir Administrator menutup sesi dengan verifikasi password', '127.0.0.1', '2026-05-19 14:27:08', '2026-05-19 14:27:08'),
(3, 2, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-19 14:27:16', '2026-05-19 14:27:16'),
(4, 2, 'LOGOUT', 'System', 'Kasir Kasir 1 menutup sesi dengan verifikasi password', '127.0.0.1', '2026-05-19 14:27:23', '2026-05-19 14:27:23'),
(5, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-19 14:27:29', '2026-05-19 14:27:29'),
(6, 2, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-22 13:17:08', '2026-05-22 13:17:08'),
(7, 2, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-22 13:19:14', '2026-05-22 13:19:14'),
(8, 2, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-22 13:22:45', '2026-05-22 13:22:45'),
(9, 2, 'LOGOUT', 'System', 'Kasir Kasir 1 menutup sesi dengan verifikasi password', '127.0.0.1', '2026-05-22 13:35:17', '2026-05-22 13:35:17'),
(10, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-22 13:35:36', '2026-05-22 13:35:36'),
(11, 1, 'CREATE', 'Kategori', 'Tambah kategori: tes', '127.0.0.1', '2026-05-22 13:58:17', '2026-05-22 13:58:17'),
(12, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-22 14:05:43', '2026-05-22 14:05:43'),
(13, 1, 'CREATE', 'Kategori', 'Tambah kategori: haha', '127.0.0.1', '2026-05-22 14:23:44', '2026-05-22 14:23:44'),
(14, 1, 'DELETE', 'Produk', 'Nonaktifkan produk: Beras 5kg', '127.0.0.1', '2026-05-22 14:30:15', '2026-05-22 14:30:15'),
(15, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Sembakoss', '127.0.0.1', '2026-05-22 14:35:11', '2026-05-22 14:35:11'),
(16, 1, 'DELETE', 'Kategori', 'Hapus kategori: Sembakoss', '127.0.0.1', '2026-05-22 14:35:18', '2026-05-22 14:35:18'),
(17, 1, 'DELETE', 'Kategori', 'Hapus kategori: Kebutuhan Rumah Tangga', '127.0.0.1', '2026-05-22 14:35:25', '2026-05-22 14:35:25'),
(18, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minuman', '127.0.0.1', '2026-05-22 14:35:34', '2026-05-22 14:35:34'),
(19, 1, 'DELETE', 'Produk', 'Nonaktifkan produk: Mie Kuah', '127.0.0.1', '2026-05-22 14:35:43', '2026-05-22 14:35:43'),
(20, 1, 'UPDATE', 'Produk', 'Edit produk: Yakult', '127.0.0.1', '2026-05-22 14:58:56', '2026-05-22 14:58:56'),
(21, 1, 'UPDATE', 'Produk', 'Edit produk: Yakultss', '127.0.0.1', '2026-05-22 14:59:11', '2026-05-22 14:59:11'),
(22, 1, 'DELETE', 'Produk', 'Nonaktifkan produk: Snack Chitato', '127.0.0.1', '2026-05-22 14:59:52', '2026-05-22 14:59:52'),
(23, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Rokoks', '127.0.0.1', '2026-05-22 15:00:11', '2026-05-22 15:00:11'),
(24, 1, 'DELETE', 'Kategori', 'Hapus kategori: Rokoks', '127.0.0.1', '2026-05-22 15:00:15', '2026-05-22 15:00:15'),
(25, 1, 'DELETE', 'Produk', 'Nonaktifkan produk: Yakultss', '127.0.0.1', '2026-05-22 15:07:29', '2026-05-22 15:07:29'),
(26, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumanss', '127.0.0.1', '2026-05-22 15:14:51', '2026-05-22 15:14:51'),
(27, 1, 'CREATE', 'Kategori', 'Tambah kategori: hai', '127.0.0.1', '2026-05-22 15:15:16', '2026-05-22 15:15:16'),
(28, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minuman', '127.0.0.1', '2026-05-22 15:17:28', '2026-05-22 15:17:28'),
(29, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumanss', '127.0.0.1', '2026-05-22 15:21:44', '2026-05-22 15:21:44'),
(30, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minuman', '127.0.0.1', '2026-05-22 15:22:01', '2026-05-22 15:22:01'),
(31, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumans', '127.0.0.1', '2026-05-22 15:23:01', '2026-05-22 15:23:01'),
(32, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumanss', '127.0.0.1', '2026-05-22 15:23:05', '2026-05-22 15:23:05'),
(33, 1, 'CREATE', 'Kategori', 'Tambah kategori: ga', '127.0.0.1', '2026-05-22 15:23:14', '2026-05-22 15:23:14'),
(34, 1, 'CREATE', 'Kategori', 'Tambah kategori: ge', '127.0.0.1', '2026-05-22 15:23:19', '2026-05-22 15:23:19'),
(35, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minuman', '127.0.0.1', '2026-05-22 15:24:28', '2026-05-22 15:24:28'),
(36, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumanss', '127.0.0.1', '2026-05-22 15:24:50', '2026-05-22 15:24:50'),
(37, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumansss', '127.0.0.1', '2026-05-22 15:25:47', '2026-05-22 15:25:47'),
(38, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumansss', '127.0.0.1', '2026-05-22 15:27:24', '2026-05-22 15:27:24'),
(39, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawars', '127.0.0.1', '2026-05-22 15:27:34', '2026-05-22 15:27:34'),
(40, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawarss', '127.0.0.1', '2026-05-22 15:37:37', '2026-05-22 15:37:37'),
(41, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawar', '127.0.0.1', '2026-05-22 15:43:10', '2026-05-22 15:43:10'),
(42, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawar', '127.0.0.1', '2026-05-22 15:44:19', '2026-05-22 15:44:19'),
(43, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawar', '127.0.0.1', '2026-05-22 15:44:27', '2026-05-22 15:44:27'),
(44, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawarss', '127.0.0.1', '2026-05-22 15:44:38', '2026-05-22 15:44:38'),
(45, 1, 'CREATE', 'Produk', 'Tambah produk: tes (s)', '127.0.0.1', '2026-05-22 15:46:08', '2026-05-22 15:46:08'),
(46, 1, 'UPDATE', 'Produk', 'Edit produk: tesss', '127.0.0.1', '2026-05-22 15:46:16', '2026-05-22 15:46:16'),
(47, 1, 'DELETE', 'Produk', 'Nonaktifkan produk: tesss', '127.0.0.1', '2026-05-22 15:46:36', '2026-05-22 15:46:36'),
(48, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawar', '127.0.0.1', '2026-05-22 15:47:55', '2026-05-22 15:47:55'),
(49, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawarss', '127.0.0.1', '2026-05-22 15:48:04', '2026-05-22 15:48:04'),
(50, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawarer', '127.0.0.1', '2026-05-22 15:48:43', '2026-05-22 15:48:43'),
(51, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawaras', '127.0.0.1', '2026-05-22 15:51:23', '2026-05-22 15:51:23'),
(52, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawar55', '127.0.0.1', '2026-05-22 15:51:30', '2026-05-22 15:51:30'),
(53, 1, 'CREATE', 'Produk', 'Tambah produk: asa (ds)', '127.0.0.1', '2026-05-22 15:51:45', '2026-05-22 15:51:45'),
(54, 1, 'DELETE', 'Produk', 'Nonaktifkan produk: asa', '127.0.0.1', '2026-05-22 15:51:51', '2026-05-22 15:51:51'),
(55, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawar', '127.0.0.1', '2026-05-22 15:54:26', '2026-05-22 15:54:26'),
(56, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minuman', '127.0.0.1', '2026-05-22 15:54:36', '2026-05-22 15:54:36'),
(57, 2, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-29 14:15:01', '2026-05-29 14:15:01'),
(58, 2, 'LOGOUT', 'System', 'Kasir Kasir 1 menutup sesi dengan verifikasi password', '127.0.0.1', '2026-05-29 14:15:49', '2026-05-29 14:15:49'),
(59, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-29 14:16:01', '2026-05-29 14:16:01'),
(60, 1, 'LOGOUT', 'System', 'Kasir Administrator menutup sesi dengan verifikasi password', '127.0.0.1', '2026-05-29 15:11:39', '2026-05-29 15:11:39'),
(61, 2, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-29 15:11:46', '2026-05-29 15:11:46'),
(62, 2, 'LOGOUT', 'System', 'Kasir Kasir 1 menutup sesi dengan verifikasi password', '127.0.0.1', '2026-05-29 15:11:57', '2026-05-29 15:11:57'),
(63, 2, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-29 16:05:05', '2026-05-29 16:05:05'),
(64, 2, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-29 16:31:31', '2026-05-29 16:31:31'),
(65, 2, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-29 17:04:18', '2026-05-29 17:04:18'),
(66, 2, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-29 17:08:14', '2026-05-29 17:08:14'),
(67, 2, 'LOGOUT', 'System', 'Kasir Kasir 1 menutup sesi dengan verifikasi password', '127.0.0.1', '2026-05-29 17:08:35', '2026-05-29 17:08:35'),
(68, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-29 17:08:43', '2026-05-29 17:08:43'),
(69, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-29 17:12:20', '2026-05-29 17:12:20'),
(70, 2, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-30 06:44:41', '2026-05-30 06:44:41'),
(71, 2, 'LOGOUT', 'System', 'Kasir Kasir 1 menutup sesi dengan verifikasi password', '127.0.0.1', '2026-05-30 06:44:49', '2026-05-30 06:44:49'),
(72, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-30 06:44:56', '2026-05-30 06:44:56'),
(73, 1, 'CREATE', 'Kategori', 'Tambah kategori: Kebutuhan Rumah Tangga', '127.0.0.1', '2026-05-30 06:49:02', '2026-05-30 06:49:02'),
(74, 1, 'DELETE', 'Kategori', 'Hapus kategori: ge', '127.0.0.1', '2026-05-30 06:53:14', '2026-05-30 06:53:14'),
(75, 1, 'DELETE', 'Kategori', 'Hapus kategori: ga', '127.0.0.1', '2026-05-30 06:53:16', '2026-05-30 06:53:16'),
(76, 1, 'DELETE', 'Kategori', 'Hapus kategori: hai', '127.0.0.1', '2026-05-30 06:53:22', '2026-05-30 06:53:22'),
(77, 1, 'DELETE', 'Kategori', 'Hapus kategori: haha', '127.0.0.1', '2026-05-30 06:53:24', '2026-05-30 06:53:24'),
(78, 1, 'DELETE', 'Kategori', 'Hapus kategori: tes', '127.0.0.1', '2026-05-30 06:53:26', '2026-05-30 06:53:26'),
(79, 1, 'DELETE', 'Kategori', 'Hapus kategori: Kebutuhan Rumah Tangga', '127.0.0.1', '2026-05-30 06:55:29', '2026-05-30 06:55:29'),
(80, 1, 'CREATE', 'Kategori', 'Tambah kategori: Kebutuhan Rumah Tangga', '127.0.0.1', '2026-05-30 06:57:56', '2026-05-30 06:57:56'),
(81, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Perawatan', '127.0.0.1', '2026-05-30 06:58:43', '2026-05-30 06:58:43'),
(82, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Kebutuhan Rumah Tangga', '127.0.0.1', '2026-05-30 06:58:55', '2026-05-30 06:58:55'),
(83, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minuman', '127.0.0.1', '2026-05-30 06:59:01', '2026-05-30 06:59:01'),
(84, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumans', '127.0.0.1', '2026-05-30 06:59:04', '2026-05-30 06:59:04'),
(85, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-30 07:01:31', '2026-05-30 07:01:31'),
(86, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Kebutuhan Rumah Tanggas', '127.0.0.1', '2026-05-30 07:01:48', '2026-05-30 07:01:48'),
(87, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawars', '127.0.0.1', '2026-05-30 07:02:27', '2026-05-30 07:02:27'),
(88, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumans', '127.0.0.1', '2026-05-30 07:02:36', '2026-05-30 07:02:36'),
(89, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-30 07:08:06', '2026-05-30 07:08:06'),
(90, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumanss', '127.0.0.1', '2026-05-30 07:08:12', '2026-05-30 07:08:12'),
(91, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Kebutuhan Rumah Tanggaha', '127.0.0.1', '2026-05-30 07:08:23', '2026-05-30 07:08:23'),
(92, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumanhaha', '127.0.0.1', '2026-05-30 07:09:55', '2026-05-30 07:09:55'),
(93, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumanss', '127.0.0.1', '2026-05-30 07:11:47', '2026-05-30 07:11:47'),
(94, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumanaa', '127.0.0.1', '2026-05-30 07:11:53', '2026-05-30 07:11:53'),
(95, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumans', '127.0.0.1', '2026-05-30 07:12:13', '2026-05-30 07:12:13'),
(96, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumana', '127.0.0.1', '2026-05-30 07:12:22', '2026-05-30 07:12:22'),
(97, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumans', '127.0.0.1', '2026-05-30 07:19:45', '2026-05-30 07:19:45'),
(98, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumana', '127.0.0.1', '2026-05-30 07:21:27', '2026-05-30 07:21:27'),
(99, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minuman', '127.0.0.1', '2026-05-30 07:25:43', '2026-05-30 07:25:43'),
(100, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumanpo', '127.0.0.1', '2026-05-30 07:25:56', '2026-05-30 07:25:56'),
(101, 1, 'UPDATE', 'Produk', 'Edit produk: Roti Tawarss', '127.0.0.1', '2026-05-30 07:26:55', '2026-05-30 07:26:55'),
(102, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minuman', '127.0.0.1', '2026-05-30 07:27:27', '2026-05-30 07:27:27'),
(103, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumanahh', '127.0.0.1', '2026-05-30 07:27:32', '2026-05-30 07:27:32'),
(104, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minumanhe', '127.0.0.1', '2026-05-30 07:27:40', '2026-05-30 07:27:40'),
(105, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minuman', '127.0.0.1', '2026-05-30 07:27:42', '2026-05-30 07:27:42'),
(106, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Makanan & Minuman', '127.0.0.1', '2026-05-30 07:27:48', '2026-05-30 07:27:48'),
(107, 1, 'DELETE', 'Kategori', 'Hapus kategori: Kebutuhan Rumah Tanggaha', '127.0.0.1', '2026-05-30 07:27:53', '2026-05-30 07:27:53'),
(108, 1, 'CREATE', 'Kategori', 'Tambah kategori: Kebutuhan Rumah Tangga', '127.0.0.1', '2026-05-30 07:30:41', '2026-05-30 07:30:41'),
(109, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Kebutuhan Rumah Tangga Primer', '127.0.0.1', '2026-05-30 07:31:15', '2026-05-30 07:31:15'),
(110, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Kebutuhan Rumah Tangga', '127.0.0.1', '2026-05-30 07:31:33', '2026-05-30 07:31:33'),
(111, 1, 'DELETE', 'Kategori', 'Hapus kategori: Kebutuhan Rumah Tangga', '127.0.0.1', '2026-05-30 07:31:56', '2026-05-30 07:31:56'),
(112, 1, 'CREATE', 'Produk', 'Tambah produk: Indomie Rendang (IDM1)', '127.0.0.1', '2026-05-30 07:33:42', '2026-05-30 07:33:42'),
(113, 1, 'DELETE', 'Produk', 'Nonaktifkan produk: Indomie Rendang', '127.0.0.1', '2026-05-30 07:34:36', '2026-05-30 07:34:36'),
(114, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-05-30 14:44:45', '2026-05-30 14:44:45'),
(115, 1, 'CREATE', 'Kategori', 'Tambah kategori: Kebutuhan Rumah Tangga', '127.0.0.1', '2026-05-30 14:46:26', '2026-05-30 14:46:26'),
(116, 1, 'UPDATE', 'Kategori', 'Edit kategori produk menjadi: Kebutuhan Rumah Tangga', '127.0.0.1', '2026-05-30 14:46:40', '2026-05-30 14:46:40'),
(117, 1, 'CREATE', 'Produk', 'Tambah produk: Indomie Rendang (IDMR)', '127.0.0.1', '2026-05-30 14:47:27', '2026-05-30 14:47:27'),
(118, 1, 'DELETE', 'Produk', 'Nonaktifkan produk: Indomie Rendang', '127.0.0.1', '2026-05-30 14:47:53', '2026-05-30 14:47:53'),
(119, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-06-01 02:36:39', '2026-06-01 02:36:39'),
(120, 1, 'CREATE', 'Transaksi', 'Transaksi NOTA-20260601-0001 - Total Rp 12.000', '127.0.0.1', '2026-06-01 02:38:15', '2026-06-01 02:38:15'),
(121, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-06-10 12:11:28', '2026-06-10 12:11:28'),
(122, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-06-10 19:00:35', '2026-06-10 19:00:35'),
(123, 1, 'LOGIN', 'System', 'User login ke sistem', '127.0.0.1', '2026-08-15 16:34:36', '2026-08-15 16:34:36'),
(124, 1, 'LOGIN', 'System', 'User login ke sistem', '172.18.0.1', '2026-08-15 18:45:46', '2026-08-15 18:45:46');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warna` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#3b82f6',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `warna`, `icon`, `deskripsi`, `created_at`, `updated_at`) VALUES
(3, 'Makanan & Minuman', '#29b2c7', 'bi bi-bag-fill', 'gha', '2026-05-19 12:26:24', '2026-05-30 07:27:48'),
(5, 'Perawatan', '#a19168', 'bi bi-cup-straw', NULL, '2026-05-19 12:26:24', '2026-05-30 06:58:43'),
(14, 'Kebutuhan Rumah Tangga', '#3478e5', 'bi bi-house-fill', NULL, '2026-05-30 14:46:26', '2026-05-30 14:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_01_01_000001_create_users_table', 1),
(2, '2024_01_01_000002_create_produk_table', 1),
(3, '2024_01_01_000003_create_transaksi_table', 1),
(4, '2024_01_01_000004_create_hutang_table', 1),
(5, '2026_05_18_140240_add_qris_to_toko_settings', 1),
(6, '2026_05_29_230934_create_cache_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `saldo_hutang` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori_id` bigint UNSIGNED DEFAULT NULL,
  `harga_awal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `harga_jual` decimal(15,2) NOT NULL DEFAULT '0.00',
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kode`, `nama`, `merk`, `kategori_id`, `harga_awal`, `harga_jual`, `foto`, `deskripsi`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'YKT150tes', 'Yakultss', 'Yakult', 3, 10000.00, 15000.00, NULL, NULL, 0, '2026-05-19 12:26:24', '2026-05-22 15:07:29'),
(2, 'MKR200', 'Mie Kuah', 'Indomie', 3, 2800.00, 4000.00, NULL, NULL, 0, '2026-05-19 12:26:24', '2026-05-22 14:35:43'),
(3, 'RST100', 'Roti Tawarss', 'Sari Roti', 3, 8000.00, 12000.00, NULL, NULL, 1, '2026-05-19 12:26:24', '2026-05-30 07:26:55'),
(4, 'SNK500', 'Snack Chitato', 'Chitato', 3, 7000.00, 10000.00, NULL, NULL, 0, '2026-05-19 12:26:24', '2026-05-22 14:59:52'),
(5, 'BRS250', 'Beras 5kg', 'Rose Brand', NULL, 58000.00, 68000.00, NULL, NULL, 0, '2026-05-19 12:26:24', '2026-05-22 14:30:15'),
(6, 'KPI300', 'Kecap Bango', 'Bango', NULL, 8000.00, 12000.00, NULL, NULL, 1, '2026-05-19 12:26:24', '2026-05-19 12:26:24'),
(7, 's', 'tesss', 's', 3, 11.00, 111.00, NULL, '1', 0, '2026-05-22 15:46:08', '2026-05-22 15:46:36'),
(8, 'ds', 'asa', 'asasd', 3, 55.00, 5.00, NULL, '5', 0, '2026-05-22 15:51:45', '2026-05-22 15:51:51'),
(9, 'IDM1', 'Indomie Rendang', 'Indofood', 3, 3000.00, 3600.00, '1780126422_ttd.png', 'Indomi Rendang', 0, '2026-05-30 07:33:42', '2026-05-30 07:34:36'),
(10, 'IDMR', 'Indomie Rendang', 'Indofood', 14, 3000.00, 3600.00, '1780152447_ttd.png', 'Indomie Rendang', 0, '2026-05-30 14:47:27', '2026-05-30 14:47:53');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0IA09E0svJsJy2dJp0d7Xhi070UOjQp6aDXGucV9', NULL, '172.17.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRG9ReFcyYmE1bU8ycWw5RE9QMlRna0Zqa1BCVFo3UnVYaFdyVzBTcyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNjoiaHR0cDovL2xvY2FsaG9zdCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjE2OiJodHRwOi8vbG9jYWxob3N0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786823043),
('1kXPwZYvcwmhDVNb9q8IofDiwRpjQVzQnjY8C6T7', NULL, '172.17.0.1', 'curl/8.21.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT25PTHVhMXpGMU84ZVg4d0ZtSEV3Q3plMjFuQ0ZjUTNFWDJITURvTCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovL2xvY2FsaG9zdDo4MDgwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1786823163),
('BfqMXdqdLja3jUhK7RwTyMc0d8Op7BKtC1n4PtHh', NULL, '172.17.0.1', 'curl/8.21.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWFlUk1ZZHRrT3ViajNKYVRrUnFsUUxqeHMxdk1VQ1FWZ1JxRXBKViI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNjoiaHR0cDovL2xvY2FsaG9zdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1786822472),
('qBvO0On4xzESCs6pexQgPUJEImymHddoCFsDWRc2', 1, '172.17.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSkExS2h6WWF4ZFVsd1R0QjJ2T29EVG5kRUFnZTBSdzE3YnhwWGlGYyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vbG9jYWxob3N0OjgwODAva2FzaXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1786823173),
('WZKp6KLu7Pe0joC7FxoIj3Hs6iIgM3zNwKSFfvsZ', NULL, '172.17.0.1', 'curl/8.21.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTJZNDNkNlJ0bDlOOGc4aks5b29YVHU2TUlOWWs0alNiNjZsMXYxUyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNjoiaHR0cDovL2xvY2FsaG9zdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1786822303);

-- --------------------------------------------------------

--
-- Table structure for table `toko_settings`
--

CREATE TABLE `toko_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_toko` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Madura Store',
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qris_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `toko_settings`
--

INSERT INTO `toko_settings` (`id`, `nama_toko`, `alamat`, `logo`, `qris_image`, `created_at`, `updated_at`) VALUES
(1, 'Madura\'s Store', 'Jl. Contoh No. 1, Jakarta', '1779199006_testtinggg.png', 'qris_1779198908.png', '2026-05-19 12:26:24', '2026-05-19 13:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` bigint UNSIGNED NOT NULL,
  `no_nota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nama_pembeli` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pelanggan_id` bigint UNSIGNED DEFAULT NULL,
  `metode_bayar` enum('cash','hutang','gopay','dana','qris','bca','seabank','mandiri') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` enum('lunas','hutang') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lunas',
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `no_nota`, `user_id`, `nama_pembeli`, `pelanggan_id`, `metode_bayar`, `total`, `status`, `is_draft`, `catatan`, `created_at`, `updated_at`) VALUES
(1, 'NOTA-20260601-0001', 1, NULL, NULL, 'qris', 12000.00, 'lunas', 0, NULL, '2026-06-01 02:38:15', '2026-06-01 02:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_item`
--

CREATE TABLE `transaksi_item` (
  `id` bigint UNSIGNED NOT NULL,
  `transaksi_id` bigint UNSIGNED NOT NULL,
  `produk_id` bigint UNSIGNED NOT NULL,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `harga` decimal(15,2) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi_item`
--

INSERT INTO `transaksi_item` (`id`, `transaksi_id`, `produk_id`, `kode_barang`, `nama_produk`, `qty`, `harga`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'RST100', 'Roti Tawarss', 1, 12000.00, 12000.00, '2026-06-01 02:38:15', '2026-06-01 02:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `id_staff` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','kasir','gudang','supervisor') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kasir',
  `status` enum('on_air','libur') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on_air',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_staff`, `name`, `username`, `password`, `role`, `status`, `email`, `telepon`, `alamat`, `foto`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ADM_1', 'Administrator', 'admin', '$2y$12$HlKnVlnQ9RerqGyYVEFJb.EbqaoglkOlWixm7LhkIHAGtBXlOqFWO', 'admin', 'on_air', 'admin@madurastore.id', '089689993392', NULL, '1779198904_WhatsApp Image 2026-05-07 at 11.20.02.jpeg', NULL, '2026-05-19 12:26:24', '2026-05-29 14:31:03'),
(2, 'KSR_1', 'Kasir 1', 'kasir', '$2y$12$0xsQ3KYB3JF8HqvT0/ykMuDI3BGN4VCqHyrJYxPXlz4VdvgnoJHUy', 'kasir', 'on_air', NULL, NULL, NULL, NULL, NULL, '2026-05-19 12:26:24', '2026-05-19 12:26:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_log_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `produk_kode_unique` (`kode`),
  ADD KEY `produk_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `toko_settings`
--
ALTER TABLE `toko_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaksi_no_nota_unique` (`no_nota`),
  ADD KEY `transaksi_user_id_foreign` (`user_id`),
  ADD KEY `transaksi_pelanggan_id_foreign` (`pelanggan_id`);

--
-- Indexes for table `transaksi_item`
--
ALTER TABLE `transaksi_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_item_transaksi_id_foreign` (`transaksi_id`),
  ADD KEY `transaksi_item_produk_id_foreign` (`produk_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id_staff_unique` (`id_staff`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `toko_settings`
--
ALTER TABLE `toko_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksi_item`
--
ALTER TABLE `transaksi_item`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `audit_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_pelanggan_id_foreign` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transaksi_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaksi_item`
--
ALTER TABLE `transaksi_item`
  ADD CONSTRAINT `transaksi_item_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `transaksi_item_transaksi_id_foreign` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
