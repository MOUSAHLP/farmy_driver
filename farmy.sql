-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 11:25 AM
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
-- Database: `farmy`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `achievement` longtext NOT NULL,
  `points` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `segments` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `achievements`
--

INSERT INTO `achievements` (`id`, `achievement`, `points`, `description`, `segments`) VALUES
(1, 'انشاء حساب', 100, 'عند انشائك لحساب ستحصل على 100 نقطة', 1),
(2, 'مشاركة رابط تطبيق مع الأصدقاء', 50, 'عند تحقيق الشروط ستحصل على 50 نقطة', 1),
(3, 'تقييم عملية الشراء ', 5, 'عند تقييم كل طلب ستحصل على 5 نقاط\r\n', 0),
(4, 'اضافة تاريخ ميلادك الى ملفك الشخصي ', 10, 'أضف تاريخ ميلادك في `حسابي` و ستحصل على 10 نقاط\r\n', 1),
(5, 'اتمام عملية الشراء', 1, 'عند اتمام عملية الشراء ستحصل على نقطة مقابل كل 1000 ليرة\r\n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `achievement_users`
--

CREATE TABLE `achievement_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `achievement_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `achievement_users`
--

INSERT INTO `achievement_users` (`id`, `achievement_id`, `user_id`) VALUES
(1, 2, 20);

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `is_default`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'Jaramana', 1, 33.3, 33.3, '2023-12-07 16:08:10', '2023-12-18 07:49:40'),
(2, 'Rukn Al Den', 0, 33.53894066554306, 36.29911617071872, '2023-12-17 12:28:33', '2023-12-17 12:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(7, 'عدد القطع', 0, '2023-12-28 08:57:56', '2023-12-28 08:57:56'),
(8, 'الوزن', 0, '2023-12-28 08:59:37', '2023-12-28 08:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `created_at`, `updated_at`) VALUES
(46, 7, '1', '2024-03-14 14:35:23', '2024-03-14 14:35:23'),
(47, 7, '2', '2024-03-14 14:35:23', '2024-03-14 14:35:23'),
(48, 7, '15', '2024-03-14 14:35:23', '2024-03-14 14:35:23'),
(49, 8, '200g', '2024-03-14 14:35:39', '2024-03-14 14:35:39'),
(50, 8, '500g', '2024-03-14 14:35:39', '2024-03-14 14:35:39'),
(51, 8, '400g', '2024-03-14 14:35:39', '2024-03-14 14:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('section1','section2') NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `start_time` date NOT NULL DEFAULT '2023-12-08',
  `end_time` date NOT NULL DEFAULT '2024-12-08',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `type`, `link`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(10, 'section1', 'https://googel.com/', '2024-03-03', '2024-03-31', '2024-03-14 15:02:14', '2024-03-14 15:02:14'),
(11, 'section1', 'https://googel.com/', '2024-03-03', '2024-03-31', '2024-03-14 15:02:27', '2024-03-14 15:02:27'),
(12, 'section1', 'https://googel.com/', '2024-03-03', '2024-03-31', '2024-03-14 15:02:40', '2024-03-14 15:02:40'),
(13, 'section2', 'https://googel.com/', '2024-03-03', '2024-03-31', '2024-03-14 15:02:54', '2024-03-14 15:02:54');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'خضار', 1, '2023-12-07 16:22:22', '2023-12-07 16:22:22'),
(11, 'الفواكه', 1, '2024-03-14 14:50:58', '2024-03-14 14:50:58'),
(12, 'بذور و مكسرات', 1, '2024-03-14 14:51:20', '2024-03-14 14:51:20'),
(13, 'منتجات الألبان', 1, '2024-03-14 14:51:52', '2024-03-14 14:51:52'),
(14, 'الحليب و البيض', 1, '2024-03-14 14:52:16', '2024-03-14 14:52:16'),
(15, 'المخبوزات', 1, '2024-03-14 14:52:38', '2024-03-14 14:52:38'),
(16, 'أسماك', 1, '2024-03-14 14:53:22', '2024-03-14 14:53:22'),
(17, 'دجاج', 1, '2024-03-14 14:53:48', '2024-03-14 14:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 'Jaramana', 1, '2023-12-07 16:07:05', '2023-12-07 16:07:05'),
(2, 'مزة', 1, '2023-12-18 07:50:52', '2023-12-18 07:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'test', '2023-12-07 16:01:01', '2024-01-16 09:59:27'),
(6, 'amount', '2024-01-02 16:43:46', '2024-01-02 16:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `email`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'email@gmail.com', 'test', '2024-03-24 15:43:24', '2024-03-24 15:43:24'),
(2, 'email@gmail.com', 'test', '2024-03-25 09:44:54', '2024-03-25 09:44:54'),
(3, 'email@gmail.com', 'test', '2024-03-26 09:35:02', '2024-03-26 09:35:02'),
(4, 'email@gmail.com', 'test', '2024-03-26 09:42:17', '2024-03-26 09:42:17'),
(5, 'email@gmail.com', 'test', '2024-03-26 10:46:51', '2024-03-26 10:46:51'),
(6, 'email@gmail.com', 'test', '2024-03-26 10:59:29', '2024-03-26 10:59:29'),
(7, 'email@gmail.com', 'test', '2024-03-26 11:08:12', '2024-03-26 11:08:12'),
(8, 'email@gmail.com', 'notes', '2024-03-26 11:08:24', '2024-03-26 11:08:24'),
(9, 'email@gmail.com', 'rrr', '2024-03-26 11:13:28', '2024-03-26 11:13:28'),
(10, 'emeeeail@gmail.com', 'test', '2024-03-26 11:13:42', '2024-03-26 11:13:42'),
(11, 'ahamd@gmail.com', 'rrr', '2024-03-26 11:14:04', '2024-03-26 11:14:04'),
(12, 'ahamd@gmail.com', 'rrr', '2024-03-26 11:18:14', '2024-03-26 11:18:14'),
(13, 'ahamd@gwmail.com', 'rrr', '2024-03-26 11:18:18', '2024-03-26 11:18:18'),
(14, 'ahamd@gwmail.cwom', 'rrr', '2024-03-26 11:18:26', '2024-03-26 11:18:26'),
(15, 'ahamd@gmail', 'ddddddddddd', '2024-03-26 11:18:57', '2024-03-26 11:18:57'),
(16, 'email@gmail', 'test', '2024-03-26 11:19:48', '2024-03-26 11:19:48'),
(17, 'a@gmail.com', 'eeee', '2024-03-26 11:29:29', '2024-03-26 11:29:29'),
(18, 'e@gamail.com', 'fff', '2024-03-26 11:30:40', '2024-03-26 11:30:40'),
(19, 'ahamd@gmail.com', 'ddddddddddddd', '2024-04-03 09:12:16', '2024-04-03 09:12:16'),
(20, 'ahamd@gmail.com', 'ddddddddddddd', '2024-04-03 09:12:16', '2024-04-03 09:12:16'),
(21, 'ahamd@gmail.com', 'ddddddddddddd', '2024-04-03 09:12:17', '2024-04-03 09:12:17'),
(22, 'a@gamil.com', 'wwww', '2024-04-03 09:40:21', '2024-04-03 09:40:21'),
(23, 'ahad@gmail.com', '22222', '2024-04-03 09:44:04', '2024-04-03 09:44:04'),
(24, 'ahad@gmail.com', '22222', '2024-04-03 09:44:21', '2024-04-03 09:44:21'),
(25, 'ahad@gmail.com', '22222', '2024-04-03 09:44:32', '2024-04-03 09:44:32'),
(26, 'a@gamil.com3', 'eeeee', '2024-04-03 09:45:22', '2024-04-03 09:45:22'),
(27, 'ahmad@gamil.com', 'aa33', '2024-04-03 09:47:16', '2024-04-03 09:47:16'),
(28, 'a@gmail.com', 'wwwwwwwwww', '2024-04-03 09:48:44', '2024-04-03 09:48:44'),
(29, 'g@gmail.com', 'Hi Majed #_#', '2024-04-03 09:52:30', '2024-04-03 09:52:30'),
(30, 'a@gmail.com', 'wsw2', '2024-04-03 09:53:36', '2024-04-03 09:53:36'),
(31, 'r@gmail.com', '3333333333', '2024-04-03 09:54:29', '2024-04-03 09:54:29'),
(32, 'w@gamil.com', 'fffff', '2024-04-03 09:56:51', '2024-04-03 09:56:51'),
(33, 'e@gmail.com', 'gggggg', '2024-04-03 10:00:05', '2024-04-03 10:00:05'),
(34, 'ggg@gmail.com', 'g g ub', '2024-04-04 09:09:20', '2024-04-04 09:09:20'),
(35, 'ggg@gmail.cok', 'yvyvcyt', '2024-04-04 09:11:01', '2024-04-04 09:11:01'),
(36, 'ggg@gmail.cok', 'yvyvcyt', '2024-04-04 09:11:53', '2024-04-04 09:11:53');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_type_id` bigint(20) UNSIGNED NOT NULL,
  `value` bigint(20) NOT NULL,
  `price` int(11) DEFAULT 0,
  `description` longtext NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_type_id`, `value`, `price`, `description`, `created_at`) VALUES
(3, 1, 3500, 100, 'احصل على خصم بقيمة 3500 ل.س', '2024-02-10 16:37:11'),
(4, 1, 7000, 200, 'احصل على خصم بقيمة 7000 ل.س', '2024-02-22 10:54:25'),
(5, 1, 10500, 300, 'احصل على خصم بقيمة 10500 ل.س', '2024-02-27 10:26:30'),
(6, 1, 17500, 500, 'احصل على خصم بقيمة 17500 ل.س', '2024-02-17 17:32:18'),
(7, 1, 35000, 1000, 'احصل على خصم بقيمة 35000 ل.س', '2024-02-10 18:28:39'),
(24, 2, 10, 1000, 'احصل على خصم بقيمة 10% من سعر المنتجات', '2024-04-02 14:05:28'),
(26, 3, 10, 300, 'احصل على خصم بقيمة 10% من سعر التوصيل', '2024-04-02 14:05:28');

-- --------------------------------------------------------

--
-- Table structure for table `coupons_types`
--

CREATE TABLE `coupons_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons_types`
--

INSERT INTO `coupons_types` (`id`, `name`, `image`, `type`) VALUES
(1, 'كاش باك', 'ff1_1711023123.svg', 1),
(2, 'حسم على قيمة المشتريات', 'Group_6_1711016608.svg', 2),
(3, 'حسم توصيل', 'DELEVERING-01_1711023203.svg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `coupons_users`
--

CREATE TABLE `coupons_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_resource` int(11) NOT NULL,
  `used_at` datetime DEFAULT NULL,
  `expire_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons_users`
--

INSERT INTO `coupons_users` (`id`, `user_id`, `coupon_id`, `coupon_code`, `coupon_resource`, `used_at`, `expire_at`) VALUES
(1, 20, 5, 'dfrtgh2D', 0, NULL, '2024-03-12 19:48:20'),
(2, 20, 7, 'OIH8Jd4s', 0, NULL, '2024-04-20 08:13:02'),
(3, 20, 7, '', 0, '2024-03-18 13:39:21', '2024-03-04 16:16:42'),
(5, 2, 7, '', 0, '2024-03-12 08:09:53', '2024-02-21 00:49:54'),
(6, 10, 2, '', 0, '2024-03-09 18:09:03', '2024-03-05 16:23:47'),
(7, 3, 9, '', 0, NULL, '2024-02-17 07:06:12'),
(8, 3, 10, '', 0, NULL, '2024-03-25 17:41:41'),
(9, 7, 5, '', 0, NULL, '2024-03-07 23:14:22'),
(10, 1, 5, '', 0, NULL, '2024-03-21 00:20:23'),
(11, 3, 3, '', 0, '2024-03-01 13:11:41', '2024-03-13 06:51:12'),
(12, 10, 9, '', 0, NULL, '2024-03-12 14:30:08'),
(13, 5, 4, '', 0, '2024-04-02 19:46:05', '2024-02-28 00:17:09'),
(14, 6, 2, '', 0, '2024-03-16 17:42:09', '2024-02-23 21:38:18'),
(15, 1, 10, '', 0, NULL, '2024-02-06 02:43:33'),
(16, 9, 8, '', 0, NULL, '2024-02-29 00:57:26'),
(17, 3, 4, '', 0, '2024-03-21 10:15:42', '2024-03-06 17:39:41'),
(18, 5, 10, '', 0, '2024-04-01 01:10:35', '2024-03-01 21:41:12'),
(19, 8, 4, '', 0, '2024-03-17 12:56:27', '2024-02-22 05:58:00'),
(20, 2, 7, '', 0, NULL, '2024-03-03 19:40:06'),
(21, 8, 6, '', 0, NULL, '2024-02-10 07:51:11'),
(22, 10, 4, '', 0, '2024-03-21 00:44:01', '2024-03-04 10:58:05'),
(23, 7, 8, '', 0, NULL, '2024-02-13 20:02:34'),
(24, 6, 10, '', 0, '2024-02-10 01:01:55', '2024-03-09 16:39:05'),
(25, 3, 4, '', 0, NULL, '2024-03-09 23:50:20'),
(26, 2, 4, '', 1, NULL, '2024-03-03 21:47:26'),
(27, 4, 9, '', 0, '2024-03-10 08:36:29', '2024-03-28 03:08:42'),
(28, 8, 7, '', 0, NULL, '2024-02-14 15:59:27'),
(29, 7, 5, '', 0, '2024-03-29 08:15:39', '2024-03-15 03:50:56'),
(30, 5, 6, '', 0, '2024-04-03 00:09:06', '2024-03-03 22:29:23'),
(31, 20, 2, 'vscKmWbu', 0, '2024-03-27 09:03:48', '2024-06-25 09:03:48'),
(32, 20, 2, 'wL6gh23B', 0, '2024-03-27 12:42:15', '2024-06-25 12:42:15'),
(33, 20, 2, 'U2l2HhlD', 0, '2024-03-31 09:56:24', '2024-06-29 09:56:24'),
(34, 20, 2, '69yHNzJN', 0, '2024-03-31 12:43:36', '2024-06-29 12:43:36'),
(35, 20, 2, 'K5aANIXC', 0, '2024-03-31 12:43:46', '2024-06-29 12:43:46'),
(36, 20, 2, 'WmpnoXxn', 0, '2024-04-01 09:02:23', '2024-06-30 09:02:23'),
(37, 20, 3, 'QdqxzKyn', 0, '2024-04-01 12:33:47', '2024-06-30 12:33:47'),
(38, 20, 5, 'yD51bVHb', 0, '2024-04-15 10:41:32', '2024-07-14 10:41:32'),
(39, 20, 4, 'QZGDwvdv', 1, NULL, '2024-07-27 08:44:17'),
(40, 20, 4, 'V3rCCuuX', 1, NULL, '2024-07-27 08:45:20'),
(41, 20, 4, '2RztMbxt', 1, NULL, '2024-07-27 08:46:13'),
(42, 20, 4, 'z33XmqP7', 1, NULL, '2024-07-27 08:49:35'),
(43, 20, 4, 'LSBc9SWd', 1, NULL, '2024-07-27 08:54:03'),
(44, 20, 4, 'U7ExEtI1', 1, NULL, '2024-07-27 09:16:28'),
(45, 20, 4, 'qfSvffg1', 2, NULL, '2024-07-27 09:18:03'),
(46, 20, 4, 'HM7v5ZKx', 2, NULL, '2024-07-27 09:19:03'),
(47, 20, 4, 'PBUz7Ajg', 2, NULL, '2024-07-27 09:20:54'),
(48, 20, 4, 'xeaiYcbq', 1, NULL, '2024-07-27 09:21:43'),
(49, 9, 3, 'RHqZsMlE', 3, NULL, '2024-07-27 09:55:24'),
(50, 20, 3, 'x0UyltIy', 3, NULL, '2024-07-27 09:55:24'),
(51, 20, 3, 'c9NWQre5', 3, NULL, '2024-07-27 09:55:24'),
(52, 20, 3, 'oI1kCpQo', 3, NULL, '2024-07-27 09:55:24'),
(53, 20, 3, 'icV402u8', 3, NULL, '2024-07-27 09:55:24'),
(54, 20, 3, 'YcvTauvl', 2, NULL, '2024-07-27 14:09:22'),
(55, 9, 3, 'cy1BOals', 3, NULL, '2024-07-27 14:13:40'),
(56, 20, 3, 'My3RLRlt', 3, NULL, '2024-07-27 14:13:40'),
(57, 20, 3, 'kUGW9qOT', 3, NULL, '2024-07-27 14:13:40'),
(58, 20, 3, 'RLvpzzmo', 3, NULL, '2024-07-27 14:13:40'),
(59, 20, 3, 'eS7ZzH6K', 3, NULL, '2024-07-27 14:13:40'),
(60, 20, 3, 'jSs7I3ah', 2, NULL, '2024-07-31 10:51:55'),
(61, 20, 3, '21MZtffP', 2, NULL, '2024-07-31 11:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_prices`
--

CREATE TABLE `coupon_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_prices`
--

INSERT INTO `coupon_prices` (`id`, `coupon_id`, `coupon_price`) VALUES
(1, 1, 100),
(2, 2, 20),
(3, 5, 219),
(4, 7, 587),
(5, 3, 894),
(6, 10, 112),
(7, 7, 385),
(8, 3, 447),
(9, 8, 21),
(10, 9, 274),
(11, 10, 112),
(12, 11, 123),
(13, 12, 33),
(14, 13, 21),
(15, 14, 121),
(16, 15, 123),
(17, 16, 555),
(18, 17, 33),
(19, 18, 54),
(20, 19, 22),
(21, 20, 43),
(22, 21, 21),
(23, 22, 55),
(24, 23, 321),
(25, 24, 21),
(26, 25, 111);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_attributes`
--

CREATE TABLE `delivery_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_attributes`
--

INSERT INTO `delivery_attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'عدم رن الجرس', '2023-12-08 11:53:27', '2024-01-01 15:26:10'),
(2, 'الاتصال بي عند الوصول', '2024-01-02 06:54:20', '2024-01-02 06:54:20'),
(3, 'التواصل عند عدم توفر منتج ما', '2024-01-02 08:20:20', '2024-01-02 08:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_methods`
--

CREATE TABLE `delivery_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `is_schedule` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_methods`
--

INSERT INTO `delivery_methods` (`id`, `name`, `time`, `price`, `is_schedule`, `created_at`, `updated_at`) VALUES
(1, 'طلب عادي', 30, 1500, 0, NULL, NULL),
(2, 'طلب مستعجل', 15, 3000, 0, NULL, NULL),
(3, 'طلب مجدول', 0, 1500, 1, '2024-01-02 08:20:07', '2024-01-02 08:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_time_infos`
--

CREATE TABLE `delivery_time_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `before_message` varchar(255) DEFAULT NULL,
  `after_message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_time_infos`
--

INSERT INTO `delivery_time_infos` (`id`, `start_time`, `end_time`, `before_message`, `after_message`, `created_at`, `updated_at`) VALUES
(1, '10:00:00', '22:00:00', 'opening in this time', 'close in this time ', NULL, '2024-03-21 09:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` bigint(20) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `online_status` tinyint(1) NOT NULL DEFAULT 1,
  `fcm_token` text DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `first_name`, `last_name`, `email`, `password`, `address`, `birthday`, `phone`, `latitude`, `longitude`, `status`, `online_status`, `fcm_token`, `city_id`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'issa', 'al_halabi', 'issa@gmail.com', '$2y$12$Iv8OwccwQGAYQxze4E9Lh.erkVGf20eDmmH8iB6p76J7k0RxmJ/cG', NULL, '2024-01-17', 946649532, NULL, NULL, 0, 1, 'eWoQydnVRXihRlnUiEwyfR:APA91bFnSe8Qulas-eyogWC0yKR5tDWD6BMDY7m49tuk26TJFPgBpAa9uZWmE3xfgdQq48ksNQalxpxbSVChititUJuEM9N-AJGXlwTi1SkVyecPne5tEa_hnAcINtM_bw9XlPzQlvdJ', NULL, NULL, NULL, '2024-03-28 09:03:33', '2024-04-29 12:49:13'),
(2, 'qmiar yyy', 'qmar', 'qma1ra@gmail.com', '$2y$12$R8nsWK44LHmHhZ.Mwsv0DO32T2JkIA3oRXL3qb56YmHa5yRHtYcM.', NULL, '2024-01-17', 987654320, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-03-31 10:05:33', '2024-04-17 08:18:12'),
(3, 'qmar', 'qmar', 'qmara@gmail.com', '$2y$12$mgb8Ge0x1pVOlATmWMsBwuoJHokYr6MEmtz4O8Diz3Fi6cmRhs0sS', NULL, NULL, 987654321, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-04-03 09:30:11', '2024-04-03 09:30:11'),
(5, 'issa', 'halabi', 'issa1@gmail.com', 'qwer1234', NULL, NULL, 123123123, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, '2024-04-29 09:25:15', '2024-04-29 09:25:15'),
(6, 'issa', 'halabi', 'issa2@gmail.com', 'qwer1234', NULL, NULL, 123123123, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, '2024-04-29 09:28:14', '2024-04-29 09:28:14'),
(10, 'issa', 'halabi', 'issa3@gmail.com', 'qwer1234', NULL, NULL, 123123123, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, '2024-04-29 09:31:06', '2024-04-29 09:31:06');

-- --------------------------------------------------------

--
-- Table structure for table `driver_types`
--

CREATE TABLE `driver_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_types`
--

INSERT INTO `driver_types` (`id`, `driver_id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 80, NULL, NULL),
(2, 2, 2, 15, NULL, NULL),
(3, 10, 1, 1000, '2024-04-29 09:31:06', '2024-04-29 09:31:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorits`
--

CREATE TABLE `favorits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorits`
--

INSERT INTO `favorits` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2024-01-08 07:08:41', NULL),
(57, 30, 37, '2024-03-04 08:54:34', '2024-03-04 08:54:34'),
(59, 30, 22, '2024-03-04 12:10:37', '2024-03-04 12:10:37'),
(60, 30, 22, '2024-03-04 12:26:13', '2024-03-04 12:26:13'),
(77, 20, 43, '2024-03-14 10:36:56', '2024-03-14 10:36:56'),
(86, 30, 40, '2024-03-14 14:44:12', '2024-03-14 14:44:12'),
(95, 47, 40, '2024-04-02 16:02:47', '2024-04-02 16:02:47'),
(97, 20, 49, '2024-04-16 11:43:03', '2024-04-16 11:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gifts`
--

INSERT INTO `gifts` (`id`, `name`, `description`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'test1', 'test', 0, '2023-12-08 11:41:07', '2023-12-08 11:41:36'),
(3, 'Was K', 'xzc', 6, '2024-01-19 15:56:17', '2024-01-19 15:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `home_page_dynamics`
--

CREATE TABLE `home_page_dynamics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('category','section','slider') NOT NULL,
  `order` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_page_dynamics`
--

INSERT INTO `home_page_dynamics` (`id`, `type`, `order`, `title_ar`, `title_en`, `created_at`, `updated_at`) VALUES
(1, 'section', '9', 'الحسومات', 'discount', '2024-03-13 11:18:15', '2024-04-21 14:14:59'),
(2, 'slider', '8', 'اعلانات', 'banners', '2024-03-13 11:18:53', '2024-04-21 14:14:59'),
(6, 'category', '2', 'xالأقسام', 'asc', '2024-03-14 14:58:29', '2024-04-21 14:19:02');

-- --------------------------------------------------------

--
-- Table structure for table `home_page_dynamic_contents`
--

CREATE TABLE `home_page_dynamic_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `home_page_dynamic_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `banner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_page_dynamic_contents`
--

INSERT INTO `home_page_dynamic_contents` (`id`, `home_page_dynamic_id`, `product_id`, `category_id`, `banner_id`, `created_at`, `updated_at`) VALUES
(38, 2, NULL, NULL, 10, '2024-03-14 15:15:24', '2024-03-14 15:15:24'),
(39, 2, NULL, NULL, 11, '2024-03-14 15:15:24', '2024-03-14 15:15:24'),
(40, 2, NULL, NULL, 12, '2024-03-14 15:15:24', '2024-03-14 15:15:24'),
(41, 2, NULL, NULL, 13, '2024-03-14 15:15:24', '2024-03-14 15:15:24'),
(42, 1, 46, NULL, NULL, '2024-03-14 15:18:41', '2024-03-14 15:18:41'),
(43, 1, 47, NULL, NULL, '2024-03-14 15:18:41', '2024-03-14 15:18:41'),
(44, 1, 48, NULL, NULL, '2024-03-14 15:18:41', '2024-03-14 15:18:41'),
(45, 1, 49, NULL, NULL, '2024-03-14 15:18:41', '2024-03-14 15:18:41'),
(113, 6, NULL, 1, NULL, '2024-04-21 14:19:02', '2024-04-21 14:19:02'),
(114, 6, NULL, 11, NULL, '2024-04-21 14:19:02', '2024-04-21 14:19:02');

-- --------------------------------------------------------

--
-- Table structure for table `join_our_teams`
--

CREATE TABLE `join_our_teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `join_our_teams`
--

INSERT INTO `join_our_teams` (`id`, `name`, `phone`, `job`, `created_at`, `updated_at`) VALUES
(1, 'name', '946649532', 'IT', '2024-03-26 12:47:04', '2024-03-26 12:47:04'),
(2, 'name', '946649532', 'IT', '2024-03-26 12:58:55', '2024-03-26 12:58:55'),
(3, 'name', '946649532', 'IT', '2024-03-26 12:59:33', '2024-03-26 12:59:33'),
(4, 'name', '946649532', 'IT', '2024-03-26 13:26:44', '2024-03-26 13:26:44'),
(5, 'name', '946649532', 'IT', '2024-03-26 13:27:08', '2024-03-26 13:27:08'),
(6, 'name', '946649532', 'IT', '2024-03-26 13:30:24', '2024-03-26 13:30:24'),
(7, 'rx', '946649532', 'محاسب', '2024-03-26 13:32:54', '2024-03-26 13:32:54'),
(8, 'dvg', '946644532', 'عامل توصيل', '2024-03-26 13:33:22', '2024-03-26 13:33:22'),
(9, 'rff', '962225868', 'عامل توصيل', '2024-03-26 13:35:04', '2024-03-26 13:35:04'),
(10, 'ىة', '987654321', 'محاسب', '2024-03-26 13:46:21', '2024-03-26 13:46:21'),
(11, 'yy', '987654321', 'خدمة العملاء', '2024-03-26 15:13:05', '2024-03-26 15:13:05'),
(12, 'cgct', '987654321', 'عامل توصيل', '2024-03-26 15:13:56', '2024-03-26 15:13:56'),
(13, 'ghh', '938544087', 'إداري', '2024-04-02 15:35:59', '2024-04-02 15:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(13, 'App\\Models\\SubCategory', 2, '0cd48206-5c61-423d-8154-f7b49a94d950', 'subcategory-images', 'flyglh', 'flyglh.jpg', 'image/jpeg', 'public', 'public', 1196549, '[]', '[]', '[]', '[]', 1, '2023-12-19 05:36:43', '2023-12-19 05:36:43'),
(20, 'App\\Models\\Product', 36, '19b67808-c598-4016-89c4-4f1bd0e6f615', 'product-image', 'لحمة', 'لحمة.jpg', 'image/jpeg', 'public', 'public', 34476, '[]', '[]', '[]', '[]', 1, '2023-12-26 06:37:52', '2023-12-26 06:37:52'),
(27, 'App\\Models\\Product', 40, '4ca13041-64e9-4db9-858b-bc860c612825', 'product-image', 'kosa', 'kosa.jpg', 'image/jpeg', 'public', 'public', 704947, '[]', '[]', '[]', '[]', 1, '2024-01-02 16:49:16', '2024-01-02 16:49:16'),
(49, 'App\\Models\\Product', 46, '41e4aa5d-57b6-427f-a510-c131be75ac21', 'product-image', 'Rectangle 22', 'Rectangle-22.png', 'image/png', 'public', 'public', 249783, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:26:40', '2024-03-14 14:26:40'),
(50, 'App\\Models\\Product', 47, '1057fcdc-8898-4e3b-a650-b848d0605581', 'product-image', 'Rectangle 16', 'Rectangle-16.png', 'image/png', 'public', 'public', 102187, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:30:09', '2024-03-14 14:30:09'),
(51, 'App\\Models\\Product', 48, '7f5208de-310d-47a9-8491-932337529712', 'product-image', 'Rectangle 36', 'Rectangle-36.png', 'image/png', 'public', 'public', 125875, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:33:52', '2024-03-14 14:33:52'),
(52, 'App\\Models\\Product', 49, '172661db-32cd-4bd0-bd56-2248f8d90ea2', 'product-image', 'Rectangle 1dd6', 'Rectangle-1dd6.png', 'image/png', 'public', 'public', 166699, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:37:59', '2024-03-14 14:37:59'),
(53, 'App\\Models\\Category', 1, '0488fba4-2ce6-428b-b50d-831eb0cf664c', 'category-image', 'Ellipse 1', 'Ellipse-1.png', 'image/png', 'public', 'public', 218938, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:50:19', '2024-03-14 14:50:19'),
(54, 'App\\Models\\Category', 11, '1076a5fe-2865-43e2-bb6f-327561ac1197', 'category-image', 'Ellispse 1', 'Ellispse-1.png', 'image/png', 'public', 'public', 203944, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:50:58', '2024-03-14 14:50:58'),
(55, 'App\\Models\\Category', 12, 'd4330440-6448-4985-a571-55678178ac90', 'category-image', 'Ellipsse 1', 'Ellipsse-1.png', 'image/png', 'public', 'public', 262149, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:51:20', '2024-03-14 14:51:20'),
(56, 'App\\Models\\Category', 13, '0ae5f9ea-1d45-4bc1-b208-1c2f3f3ff66f', 'category-image', 'Ellipddse 1', 'Ellipddse-1.png', 'image/png', 'public', 'public', 199267, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:51:52', '2024-03-14 14:51:52'),
(57, 'App\\Models\\Category', 14, '21fd7ffb-2980-4fdf-be4b-db96623f87ea', 'category-image', 'Ellipsedd 1', 'Ellipsedd-1.png', 'image/png', 'public', 'public', 136358, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:52:16', '2024-03-14 14:52:16'),
(58, 'App\\Models\\Category', 15, '03893e4c-06fa-4d48-95a9-33a5f857808f', 'category-image', 'Ellipsddde 1', 'Ellipsddde-1.png', 'image/png', 'public', 'public', 253644, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:52:38', '2024-03-14 14:52:38'),
(59, 'App\\Models\\Category', 16, 'cf674548-8713-4d81-8b87-1e1bfd0cf3b6', 'category-image', 'Ellipdddse 1', 'Ellipdddse-1.png', 'image/png', 'public', 'public', 235624, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:53:22', '2024-03-14 14:53:22'),
(60, 'App\\Models\\Category', 17, 'bdfc0fbf-40df-403d-8c2c-ab167f540b51', 'category-image', 'Ellipseddd 1', 'Ellipseddd-1.png', 'image/png', 'public', 'public', 197527, '[]', '[]', '[]', '[]', 1, '2024-03-14 14:53:48', '2024-03-14 14:53:48'),
(67, 'App\\Models\\Banner', 11, '268d307a-af4b-44a0-be8b-22e4d1779772', 'banner-image', 'Slider1', 'Slider1.png', 'image/png', 'public', 'public', 100014, '[]', '[]', '[]', '[]', 1, '2024-03-14 15:02:27', '2024-03-14 15:02:27'),
(68, 'App\\Models\\Banner', 12, 'd8be8d43-e09b-499d-a22c-0e58f1028d46', 'banner-image', 'Slider1', 'Slider1.png', 'image/png', 'public', 'public', 100014, '[]', '[]', '[]', '[]', 1, '2024-03-14 15:02:40', '2024-03-14 15:02:40'),
(69, 'App\\Models\\Banner', 13, '1dde4ddf-bd23-4fb3-9787-21a4c8acc9ca', 'banner-image', 'Slider1', 'Slider1.png', 'image/png', 'public', 'public', 100014, '[]', '[]', '[]', '[]', 1, '2024-03-14 15:02:54', '2024-03-14 15:02:54'),
(70, 'App\\Models\\Banner', 10, '426d092a-97c6-4081-9f6c-be9840e1d4c7', 'banner-image', 'Slider1', 'Slider1.png', 'image/png', 'public', 'public', 718198, '[]', '[]', '[]', '[]', 1, '2024-03-18 16:05:13', '2024-03-18 16:05:13'),
(71, 'App\\Models\\Product', 50, '861ac6f4-37ac-408b-b2f4-7540da257ab3', 'product-image', '1', '1.webp', 'image/webp', 'public', 'public', 29986, '[]', '[]', '[]', '[]', 1, '2024-03-20 14:25:03', '2024-03-20 14:25:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(113, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(114, '2019_08_19_000000_create_failed_jobs_table', 1),
(115, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(116, '2023_08_02_202739_create_permission_tables', 1),
(117, '2023_11_18_182439_create_commissions_table', 1),
(118, '2023_11_19_083711_create_states_table', 1),
(119, '2023_11_19_083844_create_cities_table', 1),
(120, '2023_11_19_090004_create_users_table', 1),
(121, '2023_11_19_090005_create_areas_table', 1),
(122, '2023_11_19_092639_create_sellers_table', 1),
(123, '2023_11_19_094555_create_categories_table', 1),
(124, '2023_11_19_094728_create_sub_categories_table', 1),
(125, '2023_11_19_100242_create_products_table', 1),
(126, '2023_11_19_103038_create_product_attributes_table', 1),
(127, '2023_11_19_110914_create_product_attribute_values_table', 1),
(128, '2023_11_19_112613_create_user_addresses_table', 1),
(129, '2023_11_19_113246_create_gifts_table', 1),
(130, '2023_11_19_114817_create_delivery_methods_table', 1),
(131, '2023_11_19_114958_create_payment_methods_table', 1),
(132, '2023_11_19_115035_create_delivery_attributes_table', 1),
(133, '2023_11_27_090628_create_media_table', 1),
(134, '2023_11_27_131454_create_attribute_values_table', 1),
(135, '2023_12_01_183211_create_drivers_table', 1),
(136, '2023_12_02_112600_create_orders_table', 1),
(138, '2023_12_02_122229_create_order_delivery_attributes_table', 1),
(139, '2023_12_08_125359_create_o_t_p_s_table', 2),
(140, '2023_12_08_145627_create_banners_table', 3),
(141, '2023_12_08_181117_create_product_related_product_table', 4),
(350, '2024_02_19_085629_create_point_in_syrian_pound_table', 1),
(404, '2014_10_12_000000_create_users_table', 2),
(405, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(406, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(407, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(408, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(409, '2016_06_01_000004_create_oauth_clients_table', 2),
(410, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(411, '2019_08_19_000000_create_failed_jobs_table', 2),
(412, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(413, '2024_02_18_085625_create_achievements_table', 2),
(414, '2024_02_18_085626_create_achievement_users_table', 2),
(415, '2024_02_19_085624_create_points_table', 2),
(416, '2024_02_19_085625_create_coupons_types_table', 2),
(417, '2024_02_19_085626_create_coupons_table', 2),
(418, '2024_02_19_085626_create_coupons_users_table', 2),
(419, '2024_02_19_085627_create_user_ranks_table', 2),
(420, '2024_02_19_085628_create_coupon_prices_table', 2),
(421, '2024_02_19_085629_create_point_in_pound_table', 2),
(422, '2023_11_19_115035_create_delivery_attributes_table', 1),
(423, '2023_11_19_103038_create_attributes_table', 1),
(424, '2023_12_02_121317_create_order_details_table', 1),
(425, '2024_01_03_130633_create_favorits_table', 1),
(426, '2024_01_09_211606_create_delivery_time_infos_table', 1),
(427, '2024_01_10_004755_create_notifications_table', 1),
(428, '2024_03_10_101021_create_settings_table', 1),
(429, '2024_03_11_125647_create_home_page_dynamics_table', 5),
(430, '2024_03_11_134340_create_home_page_dynamic_contents_table', 5),
(431, '2024_03_20_115643_create_purchases_table', 6),
(432, '2024_03_24_104239_create_contact_us_table', 7),
(433, '2024_03_24_111210_create_join_our_teams_table', 7),
(434, '2024_04_04_142803_create_order_driver_acceptances_table', 8),
(435, '2023_12_02_112601_create_orders_rate_attributes_table', 9),
(436, '2024_04_04_142804_create_driver_types_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `created_at`, `updated_at`) VALUES
(1, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:42:56', '2024-01-09 22:42:56'),
(2, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:44:14', '2024-01-09 22:44:14'),
(3, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:46:52', '2024-01-09 22:46:52'),
(4, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:47:17', '2024-01-09 22:47:17'),
(5, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:47:43', '2024-01-09 22:47:43'),
(6, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-09 22:52:14', '2024-01-09 22:52:14'),
(7, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:45:49', '2024-01-11 13:45:49'),
(8, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:50:33', '2024-01-11 13:50:33'),
(9, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:50:45', '2024-01-11 13:50:45'),
(10, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:51:58', '2024-01-11 13:51:58'),
(11, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:52:44', '2024-01-11 13:52:44'),
(12, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 13:57:49', '2024-01-11 13:57:49'),
(13, '3', 'App\\Models\\User', 19, '{\"title\":\"test\",\"body\":\"test\"}', '2024-01-11 14:05:33', '2024-01-11 14:05:33'),
(14, '3', 'App\\Models\\User', 1, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-21 12:55:29', '2024-01-21 12:55:29'),
(15, '3', 'App\\Models\\User', 20, '{\"title\":\"t\",\"body\":\"r\"}', '2024-01-21 12:57:00', '2024-01-21 12:57:00'),
(16, '3', 'App\\Models\\User', 1, '{\"title\":\"ss\",\"body\":\"ss\"}', '2024-03-27 10:13:34', '2024-03-27 10:13:34'),
(17, '3', 'App\\Models\\User', 2, '{\"title\":\"ss\",\"body\":\"ss\"}', '2024-03-27 10:13:34', '2024-03-27 10:13:34'),
(18, '3', 'App\\Models\\User', 20, '{\"title\":\"ss\",\"body\":\"ss\"}', '2024-03-27 10:13:34', '2024-03-27 10:13:34'),
(19, '3', 'App\\Models\\User', 30, '{\"title\":\"ss\",\"body\":\"ss\"}', '2024-03-27 10:13:34', '2024-03-27 10:13:34'),
(20, '3', 'App\\Models\\User', 1, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:20', '2024-04-04 09:21:20'),
(21, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:39', '2024-04-04 09:21:39'),
(22, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:39', '2024-04-04 09:21:39'),
(23, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:39', '2024-04-04 09:21:39'),
(24, '3', 'App\\Models\\User', 19, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:39', '2024-04-04 09:21:39'),
(25, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:54', '2024-04-04 09:21:54'),
(26, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:54', '2024-04-04 09:21:54'),
(27, '3', 'App\\Models\\User', 10, '{\"title\":\"sdsd\",\"body\":\"sd\"}', '2024-04-04 09:21:54', '2024-04-04 09:21:54'),
(28, '3', 'App\\Models\\User', 2, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:22:21', '2024-04-04 09:22:21'),
(29, '3', 'App\\Models\\User', 5, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:22:21', '2024-04-04 09:22:21'),
(30, '3', 'App\\Models\\User', 9, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:22:21', '2024-04-04 09:22:21'),
(31, '3', 'App\\Models\\User', 10, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:22:21', '2024-04-04 09:22:21'),
(32, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:26:12', '2024-04-04 09:26:12'),
(33, '3', 'App\\Models\\User', 2, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:31:01', '2024-04-04 09:31:01'),
(34, '3', 'App\\Models\\User', 20, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:31:01', '2024-04-04 09:31:01'),
(35, '3', 'App\\Models\\User', 2, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:31:43', '2024-04-04 09:31:43'),
(36, '3', 'App\\Models\\User', 20, '{\"title\":\"sd\",\"body\":\"sd\"}', '2024-04-04 09:31:43', '2024-04-04 09:31:43'),
(37, '3', 'App\\Models\\User', 2, '{\"title\":\"df\",\"body\":\"df\"}', '2024-04-04 09:32:22', '2024-04-04 09:32:22'),
(38, '3', 'App\\Models\\User', 20, '{\"title\":\"df\",\"body\":\"df\"}', '2024-04-04 09:32:22', '2024-04-04 09:32:22'),
(39, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:34:18', '2024-04-04 09:34:18'),
(40, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:34:47', '2024-04-04 09:34:47'),
(41, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:34:47', '2024-04-04 09:34:47'),
(42, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:36:33', '2024-04-04 09:36:33'),
(43, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:36:33', '2024-04-04 09:36:33'),
(44, '3', 'App\\Models\\User', 9, '{\"title\":\"ads\",\"body\":\"sdsd\"}', '2024-04-04 09:46:18', '2024-04-04 09:46:18'),
(45, '3', 'App\\Models\\User', 9, '{\"title\":\"ads\",\"body\":\"sdsd\"}', '2024-04-04 09:47:27', '2024-04-04 09:47:27'),
(46, '3', 'App\\Models\\User', 9, '{\"title\":\"ads\",\"body\":\"sdsd\"}', '2024-04-04 09:47:55', '2024-04-04 09:47:55'),
(47, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:48:38', '2024-04-04 09:48:38'),
(48, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 09:49:23', '2024-04-04 09:49:23'),
(49, '3', 'App\\Models\\User', 10, '{\"title\":\"sdsdsd\",\"body\":\"dssd\"}', '2024-04-04 09:49:34', '2024-04-04 09:49:34'),
(50, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:15:07', '2024-04-04 10:15:07'),
(51, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:15:07', '2024-04-04 10:15:07'),
(52, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:15:30', '2024-04-04 10:15:30'),
(53, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:15:30', '2024-04-04 10:15:30'),
(54, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:16:26', '2024-04-04 10:16:26'),
(55, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:16:26', '2024-04-04 10:16:26'),
(56, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:18:24', '2024-04-04 10:18:24'),
(57, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:19:03', '2024-04-04 10:19:03'),
(58, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:21:02', '2024-04-04 10:21:02'),
(59, '3', 'App\\Models\\User', 2, '{\"title\":\"sdds\",\"body\":\"sdsd\"}', '2024-04-04 10:21:41', '2024-04-04 10:21:41'),
(60, '3', 'App\\Models\\User', 2, '{\"title\":\"sddssd\",\"body\":\"sdsdas\"}', '2024-04-04 10:22:25', '2024-04-04 10:22:25'),
(61, '3', 'App\\Models\\User', 5, '{\"title\":\"sddssd\",\"body\":\"sdsdas\"}', '2024-04-04 10:22:25', '2024-04-04 10:22:25'),
(62, '3', 'App\\Models\\User', 5, '{\"title\":\"test\",\"body\":\"dfdf\"}', '2024-04-04 10:23:19', '2024-04-04 10:23:19'),
(63, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:24:04', '2024-04-04 10:24:04'),
(64, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:26:04', '2024-04-04 10:26:04'),
(65, '3', 'App\\Models\\User', 21, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:26:04', '2024-04-04 10:26:04'),
(66, '3', 'App\\Models\\User', 30, '{\"title\":\"sdsad\",\"body\":\"sdad\"}', '2024-04-04 10:26:30', '2024-04-04 10:26:30'),
(67, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsadasa\",\"body\":\"sdadas\"}', '2024-04-04 10:27:52', '2024-04-04 10:27:52'),
(68, '3', 'App\\Models\\User', 30, '{\"title\":\"sdsadasa\",\"body\":\"sdadas\"}', '2024-04-04 10:27:52', '2024-04-04 10:27:52'),
(69, '3', 'App\\Models\\User', 43, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 10:29:49', '2024-04-04 10:29:49'),
(70, '3', 'App\\Models\\User', 2, '{\"title\":\"asas\",\"body\":\"asasas\"}', '2024-04-04 10:33:33', '2024-04-04 10:33:33'),
(71, '3', 'App\\Models\\User', 9, '{\"title\":\"asas\",\"body\":\"asasas\"}', '2024-04-04 10:33:33', '2024-04-04 10:33:33'),
(72, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"asasassd\"}', '2024-04-04 10:33:58', '2024-04-04 10:33:58'),
(73, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sdsdsd\"}', '2024-04-04 10:41:44', '2024-04-04 10:41:44'),
(74, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsdsd\"}', '2024-04-04 10:41:44', '2024-04-04 10:41:44'),
(75, '3', 'App\\Models\\User', 5, '{\"title\":\"asasasas\",\"body\":\"xaasas\"}', '2024-04-04 10:42:19', '2024-04-04 10:42:19'),
(76, '3', 'App\\Models\\User', 2, '{\"title\":\",kok\",\"body\":\"iok\"}', '2024-04-04 10:42:52', '2024-04-04 10:42:52'),
(77, '3', 'App\\Models\\User', 9, '{\"title\":\",kok\",\"body\":\"iok\"}', '2024-04-04 10:42:52', '2024-04-04 10:42:52'),
(78, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsdsd\",\"body\":\"sdsdsd\"}', '2024-04-04 10:59:03', '2024-04-04 10:59:03'),
(79, '3', 'App\\Models\\User', 2, '{\"title\":\"asas\",\"body\":\"asas\"}', '2024-04-04 11:04:01', '2024-04-04 11:04:01'),
(80, '3', 'App\\Models\\User', 5, '{\"title\":\"asas\",\"body\":\"asas\"}', '2024-04-04 11:04:01', '2024-04-04 11:04:01'),
(81, '3', 'App\\Models\\User', 1, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(82, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(83, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(84, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(85, '3', 'App\\Models\\User', 10, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(86, '3', 'App\\Models\\User', 19, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(87, '3', 'App\\Models\\User', 20, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(88, '3', 'App\\Models\\User', 21, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(89, '3', 'App\\Models\\User', 22, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(90, '3', 'App\\Models\\User', 23, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(91, '3', 'App\\Models\\User', 24, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(92, '3', 'App\\Models\\User', 25, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(93, '3', 'App\\Models\\User', 26, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(94, '3', 'App\\Models\\User', 27, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(95, '3', 'App\\Models\\User', 28, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(96, '3', 'App\\Models\\User', 29, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(97, '3', 'App\\Models\\User', 30, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(98, '3', 'App\\Models\\User', 31, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(99, '3', 'App\\Models\\User', 32, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(100, '3', 'App\\Models\\User', 33, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(101, '3', 'App\\Models\\User', 34, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(102, '3', 'App\\Models\\User', 35, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(103, '3', 'App\\Models\\User', 36, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(104, '3', 'App\\Models\\User', 37, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(105, '3', 'App\\Models\\User', 38, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(106, '3', 'App\\Models\\User', 40, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(107, '3', 'App\\Models\\User', 41, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(108, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(109, '3', 'App\\Models\\User', 43, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(110, '3', 'App\\Models\\User', 44, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(111, '3', 'App\\Models\\User', 45, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(112, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(113, '3', 'App\\Models\\User', 47, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:07:52', '2024-04-04 11:07:52'),
(114, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsds\"}', '2024-04-04 11:08:00', '2024-04-04 11:08:00'),
(115, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsdsd\",\"body\":\"sdsds\"}', '2024-04-04 11:08:00', '2024-04-04 11:08:00'),
(116, '3', 'App\\Models\\User', 1, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(117, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(118, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(119, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(120, '3', 'App\\Models\\User', 10, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(121, '3', 'App\\Models\\User', 19, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(122, '3', 'App\\Models\\User', 20, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(123, '3', 'App\\Models\\User', 21, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(124, '3', 'App\\Models\\User', 22, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(125, '3', 'App\\Models\\User', 23, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(126, '3', 'App\\Models\\User', 24, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(127, '3', 'App\\Models\\User', 25, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(128, '3', 'App\\Models\\User', 26, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(129, '3', 'App\\Models\\User', 27, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(130, '3', 'App\\Models\\User', 28, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(131, '3', 'App\\Models\\User', 29, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(132, '3', 'App\\Models\\User', 30, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(133, '3', 'App\\Models\\User', 31, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(134, '3', 'App\\Models\\User', 32, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(135, '3', 'App\\Models\\User', 33, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(136, '3', 'App\\Models\\User', 34, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(137, '3', 'App\\Models\\User', 35, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(138, '3', 'App\\Models\\User', 36, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(139, '3', 'App\\Models\\User', 37, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(140, '3', 'App\\Models\\User', 38, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(141, '3', 'App\\Models\\User', 40, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(142, '3', 'App\\Models\\User', 41, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(143, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(144, '3', 'App\\Models\\User', 43, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(145, '3', 'App\\Models\\User', 44, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(146, '3', 'App\\Models\\User', 45, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(147, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(148, '3', 'App\\Models\\User', 47, '{\"title\":\"sdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:08:12', '2024-04-04 11:08:12'),
(149, '3', 'App\\Models\\User', 1, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(150, '3', 'App\\Models\\User', 2, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(151, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(152, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(153, '3', 'App\\Models\\User', 10, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(154, '3', 'App\\Models\\User', 19, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(155, '3', 'App\\Models\\User', 20, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(156, '3', 'App\\Models\\User', 21, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(157, '3', 'App\\Models\\User', 22, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(158, '3', 'App\\Models\\User', 23, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(159, '3', 'App\\Models\\User', 24, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(160, '3', 'App\\Models\\User', 25, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(161, '3', 'App\\Models\\User', 26, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(162, '3', 'App\\Models\\User', 27, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(163, '3', 'App\\Models\\User', 28, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(164, '3', 'App\\Models\\User', 29, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(165, '3', 'App\\Models\\User', 30, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(166, '3', 'App\\Models\\User', 31, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(167, '3', 'App\\Models\\User', 32, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(168, '3', 'App\\Models\\User', 33, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(169, '3', 'App\\Models\\User', 34, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(170, '3', 'App\\Models\\User', 35, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(171, '3', 'App\\Models\\User', 36, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(172, '3', 'App\\Models\\User', 37, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(173, '3', 'App\\Models\\User', 38, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(174, '3', 'App\\Models\\User', 40, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(175, '3', 'App\\Models\\User', 41, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(176, '3', 'App\\Models\\User', 42, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(177, '3', 'App\\Models\\User', 43, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(178, '3', 'App\\Models\\User', 44, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(179, '3', 'App\\Models\\User', 45, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(180, '3', 'App\\Models\\User', 46, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(181, '3', 'App\\Models\\User', 47, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:12:07', '2024-04-04 11:12:07'),
(182, '3', 'App\\Models\\User', 5, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:18:43', '2024-04-04 11:18:43'),
(183, '3', 'App\\Models\\User', 9, '{\"title\":\"sdsdsd\",\"body\":\"sdsd\"}', '2024-04-04 11:18:43', '2024-04-04 11:18:43'),
(184, '3', 'App\\Models\\User', 1, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(185, '3', 'App\\Models\\User', 2, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(186, '3', 'App\\Models\\User', 5, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(187, '3', 'App\\Models\\User', 9, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(188, '3', 'App\\Models\\User', 10, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(189, '3', 'App\\Models\\User', 19, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(190, '3', 'App\\Models\\User', 20, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(191, '3', 'App\\Models\\User', 21, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(192, '3', 'App\\Models\\User', 22, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(193, '3', 'App\\Models\\User', 23, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(194, '3', 'App\\Models\\User', 24, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(195, '3', 'App\\Models\\User', 25, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(196, '3', 'App\\Models\\User', 26, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(197, '3', 'App\\Models\\User', 27, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(198, '3', 'App\\Models\\User', 28, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(199, '3', 'App\\Models\\User', 29, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(200, '3', 'App\\Models\\User', 30, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(201, '3', 'App\\Models\\User', 31, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(202, '3', 'App\\Models\\User', 32, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(203, '3', 'App\\Models\\User', 33, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(204, '3', 'App\\Models\\User', 34, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(205, '3', 'App\\Models\\User', 35, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(206, '3', 'App\\Models\\User', 36, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(207, '3', 'App\\Models\\User', 37, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(208, '3', 'App\\Models\\User', 38, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(209, '3', 'App\\Models\\User', 40, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(210, '3', 'App\\Models\\User', 41, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(211, '3', 'App\\Models\\User', 42, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(212, '3', 'App\\Models\\User', 43, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(213, '3', 'App\\Models\\User', 44, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(214, '3', 'App\\Models\\User', 45, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(215, '3', 'App\\Models\\User', 46, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(216, '3', 'App\\Models\\User', 47, '{\"title\":\"sfsdf\",\"body\":\"sdfdsfsdf\"}', '2024-04-04 11:19:10', '2024-04-04 11:19:10'),
(217, '3', 'App\\Models\\User', 5, '{\"title\":\"rrev\",\"body\":\"csdcsdcsdc\"}', '2024-04-04 11:37:33', '2024-04-04 11:37:33'),
(218, '3', 'App\\Models\\User', 10, '{\"title\":\"rrev\",\"body\":\"csdcsdcsdc\"}', '2024-04-04 11:37:33', '2024-04-04 11:37:33'),
(219, '3', 'App\\Models\\User', 1, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(220, '3', 'App\\Models\\User', 2, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(221, '3', 'App\\Models\\User', 5, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(222, '3', 'App\\Models\\User', 9, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(223, '3', 'App\\Models\\User', 10, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(224, '3', 'App\\Models\\User', 19, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(225, '3', 'App\\Models\\User', 20, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(226, '3', 'App\\Models\\User', 21, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(227, '3', 'App\\Models\\User', 22, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(228, '3', 'App\\Models\\User', 23, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(229, '3', 'App\\Models\\User', 24, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(230, '3', 'App\\Models\\User', 25, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(231, '3', 'App\\Models\\User', 26, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(232, '3', 'App\\Models\\User', 27, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(233, '3', 'App\\Models\\User', 28, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(234, '3', 'App\\Models\\User', 29, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(235, '3', 'App\\Models\\User', 30, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(236, '3', 'App\\Models\\User', 31, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(237, '3', 'App\\Models\\User', 32, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(238, '3', 'App\\Models\\User', 33, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(239, '3', 'App\\Models\\User', 34, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(240, '3', 'App\\Models\\User', 35, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(241, '3', 'App\\Models\\User', 36, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(242, '3', 'App\\Models\\User', 37, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(243, '3', 'App\\Models\\User', 38, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(244, '3', 'App\\Models\\User', 40, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(245, '3', 'App\\Models\\User', 41, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(246, '3', 'App\\Models\\User', 42, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(247, '3', 'App\\Models\\User', 43, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(248, '3', 'App\\Models\\User', 44, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(249, '3', 'App\\Models\\User', 45, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(250, '3', 'App\\Models\\User', 46, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(251, '3', 'App\\Models\\User', 47, '{\"title\":\"dscsdcdscsdc\",\"body\":\"sdcsdcdsc\"}', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(252, '3', 'App\\Models\\User', 5, '{\"title\":\"scsd\",\"body\":\"sdcsdc\"}', '2024-04-04 11:43:43', '2024-04-04 11:43:43'),
(253, '3', 'App\\Models\\User', 9, '{\"title\":\"scsd\",\"body\":\"sdcsdc\"}', '2024-04-04 11:43:43', '2024-04-04 11:43:43'),
(254, '3', 'App\\Models\\User', 10, '{\"title\":\"scsd\",\"body\":\"sdcsdc\"}', '2024-04-04 11:43:43', '2024-04-04 11:43:43'),
(255, '3', 'App\\Models\\User', 5, '{\"title\":\"csdc\",\"body\":\"sdcs\"}', '2024-04-04 12:17:42', '2024-04-04 12:17:42'),
(256, '3', 'App\\Models\\User', 1, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(257, '3', 'App\\Models\\User', 2, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(258, '3', 'App\\Models\\User', 5, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(259, '3', 'App\\Models\\User', 9, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(260, '3', 'App\\Models\\User', 10, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(261, '3', 'App\\Models\\User', 19, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(262, '3', 'App\\Models\\User', 20, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(263, '3', 'App\\Models\\User', 28, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(264, '3', 'App\\Models\\User', 38, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(265, '3', 'App\\Models\\User', 40, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(266, '3', 'App\\Models\\User', 41, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(267, '3', 'App\\Models\\User', 42, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(268, '3', 'App\\Models\\User', 43, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(269, '3', 'App\\Models\\User', 44, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(270, '3', 'App\\Models\\User', 45, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(271, '3', 'App\\Models\\User', 46, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(272, '3', 'App\\Models\\User', 47, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(273, '3', 'App\\Models\\User', 48, '{\"title\":\"ffff\",\"body\":\"fffff\"}', '2024-04-15 12:46:08', '2024-04-15 12:46:08'),
(274, '2', 'App\\Models\\Driver', 1, '{\"title\":\"your order has been assigned to another driver\",\"body\":\"go to my orders tab to check which order\"}', '2024-04-17 13:30:32', '2024-04-17 13:30:32'),
(275, '1', 'App\\Models\\Driver', 1, '{\"title\":\"your order has been assigned to another driver\",\"body\":\"go to my orders tab to check which order\"}', '2024-04-17 13:30:42', '2024-04-17 13:30:42'),
(276, '3', 'App\\Models\\Driver', 1, '{\"title\":\"your order has been assigned to another driver\",\"body\":\"go to my orders tab to check which order\"}', '2024-04-17 13:33:06', '2024-04-17 13:33:06'),
(277, '3', 'App\\Models\\User', 47, '{\"title\":\"your order has been assigned to another driver\",\"body\":\"go to my orders tab to check which order\"}', '2024-04-18 06:45:21', '2024-04-18 06:45:21'),
(278, '1', 'App\\Models\\User', 47, '{\"title\":\"your order has been canceled\",\"body\":\":object\"}', '2024-04-18 06:55:26', '2024-04-18 06:55:26'),
(279, '1', 'App\\Models\\User', 47, '{\"title\":\"your order has been canceled\",\"body\":\"messages.core.cancelOrderBodyqwe\"}', '2024-04-18 06:56:15', '2024-04-18 06:56:15'),
(280, '1', 'App\\Models\\User', 47, '{\"title\":\"your order has been canceled\",\"body\":\"sdcf\"}', '2024-04-18 07:01:11', '2024-04-18 07:01:11'),
(281, '1', 'App\\Models\\User', 47, '{\"title\":\"your order has been canceled\",\"body\":\"reason :sdcf\"}', '2024-04-18 07:03:37', '2024-04-18 07:03:37'),
(282, '1', 'App\\Models\\User', 47, '{\"title\":\"your order has been canceled\",\"body\":\"\\u0627\\u0644\\u0633\\u0628\\u0628 : \\u0644\\u0623\\u0646\\u0643 \\u0643\\u0644\\u0628\"}', '2024-04-18 07:04:52', '2024-04-18 07:04:52'),
(283, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":260,\"order_status\":2,\"driver_phone\":987654320}', '2024-04-21 09:34:43', '2024-04-21 09:34:43'),
(284, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":258,\"order_status\":2,\"driver_phone\":987654320}', '2024-04-21 09:36:58', '2024-04-21 09:36:58'),
(285, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":257,\"order_status\":2,\"driver_phone\":987654320}', '2024-04-21 09:37:10', '2024-04-21 09:37:10'),
(286, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":253,\"order_status\":2,\"driver_phone\":987654320}', '2024-04-21 09:49:47', '2024-04-21 09:49:47'),
(287, '3', 'App\\Models\\User', 20, '{\"title\":\"Your Order Has Confirmed\",\"body\":\"Your Order Has Confirmed By A Driver\",\"order_id\":252,\"order_status\":2,\"driver_phone\":987654320}', '2024-04-21 09:52:40', '2024-04-21 09:52:40'),
(288, '3', 'App\\Models\\User', 47, '{\"title\":\"\\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0637\\u0644\\u0628\\u0643\",\"body\":\"\\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0637\\u0644\\u0628\\u0643 \\u0645\\u0646 \\u0642\\u0628\\u0644 \\u0633\\u0627\\u0626\\u0642\",\"order_id\":264,\"order_status\":2,\"driver_phone\":946649532}', '2024-04-22 09:32:57', '2024-04-22 09:32:57'),
(289, '3', 'App\\Models\\User', 47, '{\"title\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0637\\u0644\\u0628\\u0643\",\"body\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0627\\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0629\",\"order_id\":264,\"order_status\":4,\"driver_phone\":946649532}', '2024-04-22 13:49:16', '2024-04-22 13:49:16'),
(290, '3', 'App\\Models\\User', 48, '{\"title\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0637\\u0644\\u0628\\u0643\",\"body\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0627\\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0629\",\"order_id\":264,\"order_status\":4,\"driver_phone\":946649532}', '2024-04-22 13:50:38', '2024-04-22 13:50:38'),
(291, '3', 'App\\Models\\User', 48, '{\"title\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0637\\u0644\\u0628\\u0643\",\"body\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0627\\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0629\",\"order_id\":264,\"order_status\":4,\"driver_phone\":946649532}', '2024-04-22 13:58:16', '2024-04-22 13:58:16'),
(292, '3', 'App\\Models\\User', 48, '{\"title\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0637\\u0644\\u0628\\u0643\",\"body\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0627\\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0629\",\"order_id\":264,\"order_status\":4,\"driver_phone\":946649532}', '2024-04-22 14:00:11', '2024-04-22 14:00:11'),
(293, '3', 'App\\Models\\User', 48, '{\"title\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0637\\u0644\\u0628\\u0643\",\"body\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0627\\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0629\",\"order_id\":264,\"order_status\":4,\"driver_phone\":946649532}', '2024-04-22 14:03:27', '2024-04-22 14:03:27'),
(294, '3', 'App\\Models\\User', 48, '{\"title\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0637\\u0644\\u0628\\u0643\",\"body\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0627\\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0629\",\"order_id\":264,\"order_status\":4,\"driver_phone\":946649532}', '2024-04-22 14:10:01', '2024-04-22 14:10:01'),
(295, '3', 'App\\Models\\User', 48, '{\"title\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0637\\u0644\\u0628\\u0643\",\"body\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0627\\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0629\",\"order_id\":264,\"order_status\":4,\"driver_phone\":946649532}', '2024-04-22 14:10:39', '2024-04-22 14:10:39'),
(296, '3', 'App\\Models\\User', 20, '{\"title\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0637\\u0644\\u0628\\u0643\",\"body\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0627\\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0629\",\"order_id\":263,\"order_status\":4,\"driver_phone\":946649532}', '2024-04-23 12:39:47', '2024-04-23 12:39:47'),
(297, '3', 'App\\Models\\User', 20, '{\"title\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0637\\u0644\\u0628\\u0643\",\"body\":\"\\u062a\\u0645 \\u0648\\u0635\\u0648\\u0644 \\u0627\\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0629\",\"order_id\":263,\"order_status\":4,\"driver_phone\":946649532}', '2024-04-23 12:40:26', '2024-04-23 12:40:26'),
(298, '3', 'App\\Models\\User', 20, '{\"title\":\"\\u0637\\u0644\\u0628\\u0643 \\u0642\\u064a\\u062f \\u0627\\u0644\\u062a\\u0648\\u0635\\u064a\\u0644\",\"body\":\"\\u0637\\u0644\\u0628\\u0643 \\u0627\\u0644\\u0627\\u0646 \\u0642\\u064a\\u062f \\u0627\\u0644\\u062a\\u0648\\u0635\\u064a\\u0644\",\"order_id\":221,\"order_status\":3,\"driver_phone\":987654320}', '2024-04-23 13:43:05', '2024-04-23 13:43:05'),
(300, '3', 'App\\Models\\Driver', 2, '{\"title\":\"\\u062a\\u0645 \\u062a\\u0639\\u064a\\u064a\\u0646 \\u0637\\u0644\\u0628 \\u0645\\u0633\\u0646\\u062f \\u0627\\u0644\\u064a\\u0643 \\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u062e\\u0631\",\"body\":\"\\u0627\\u0630\\u0647\\u0628 \\u0644\\u062a\\u0628\\u0648\\u064a\\u0628\\u0629 \\u0637\\u0644\\u0628\\u0627\\u062a\\u064a \\u0644\\u0631\\u0624\\u064a\\u0629 \\u0627\\u064a \\u0637\\u0644\\u0628 \\u062a\\u0645 \\u0633\\u062d\\u0628\\u0647 \\u0645\\u0646\\u0643\"}', '2024-04-29 12:40:51', '2024-04-29 12:40:51'),
(301, '3', 'App\\Models\\Driver', 1, '{\"title\":\"\\u062a\\u0645 \\u062a\\u0639\\u064a\\u064a\\u0646 \\u0637\\u0644\\u0628 \\u0645\\u0633\\u0646\\u062f \\u0627\\u0644\\u064a\\u0643 \\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u062e\\u0631\",\"body\":\"\\u0627\\u0630\\u0647\\u0628 \\u0644\\u062a\\u0628\\u0648\\u064a\\u0628\\u0629 \\u0637\\u0644\\u0628\\u0627\\u062a\\u064a \\u0644\\u0631\\u0624\\u064a\\u0629 \\u0627\\u064a \\u0637\\u0644\\u0628 \\u062a\\u0645 \\u0633\\u062d\\u0628\\u0647 \\u0645\\u0646\\u0643\"}', '2024-04-29 12:45:10', '2024-04-29 12:45:10'),
(302, '3', 'App\\Models\\Driver', 2, '{\"title\":\"\\u062a\\u0645 \\u062a\\u0639\\u064a\\u064a\\u0646 \\u0637\\u0644\\u0628 \\u0645\\u0633\\u0646\\u062f \\u0627\\u0644\\u064a\\u0643 \\u0644\\u0633\\u0627\\u0626\\u0642 \\u0627\\u062e\\u0631\",\"body\":\"\\u0627\\u0630\\u0647\\u0628 \\u0644\\u062a\\u0628\\u0648\\u064a\\u0628\\u0629 \\u0637\\u0644\\u0628\\u0627\\u062a\\u064a \\u0644\\u0631\\u0624\\u064a\\u0629 \\u0627\\u064a \\u0637\\u0644\\u0628 \\u062a\\u0645 \\u0633\\u062d\\u0628\\u0647 \\u0645\\u0646\\u0643\"}', '2024-04-29 12:46:49', '2024-04-29 12:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 1000,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `delivery_method_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL,
  `user_address_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `coupon_discount` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `delivery_fee` double DEFAULT 0,
  `extra_discount` double NOT NULL DEFAULT 0,
  `sub_total` double NOT NULL DEFAULT 0,
  `total` double NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `reason_for_cancel` text DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `changes` text DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `driver_id`, `status`, `delivery_method_id`, `payment_method_id`, `user_address_id`, `city_id`, `start_time`, `end_time`, `latitude`, `longitude`, `payment_status`, `coupon_discount`, `tax`, `delivery_fee`, `extra_discount`, `sub_total`, `total`, `date`, `notes`, `reason_for_cancel`, `rate`, `changes`, `confirmed_at`, `delivered_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(221, 1008, 20, 1, 4, 1, 1, 26, NULL, NULL, NULL, NULL, NULL, 1, 2249, 112.5, 4498, 0, 2472, 4833, '2024-04-01', 'test', NULL, 0, '[1,2]', NULL, '2024-04-23 16:44:48', NULL, '2024-04-01 10:02:23', '2024-04-23 13:58:11'),
(223, 1010, 20, 2, 5, 1, 1, 26, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 4498, 0, 222, 4720, '2024-04-01', 'test', NULL, 0, '[1,2]', NULL, NULL, NULL, '2024-04-01 10:12:23', '2024-04-23 13:38:47'),
(234, 1019, 47, NULL, 5, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1606, 0, 28500, 549866, '2024-04-07', NULL, NULL, NULL, '[1]', NULL, NULL, NULL, '2024-04-07 10:12:41', '2024-04-15 12:19:56'),
(235, 1020, 47, 2, 2, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1606, 0, 28500, 549866, '2024-04-07', NULL, NULL, NULL, '[1,4]', NULL, NULL, NULL, '2024-04-07 10:14:53', '2024-04-08 13:33:27'),
(236, 1021, 47, NULL, 1, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1606, 0, 76500, 1556906, '2024-04-07', NULL, NULL, NULL, '[]', NULL, NULL, NULL, '2024-04-07 10:52:58', '2024-04-07 10:52:58'),
(237, 1022, 47, 2, 2, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1606, 0, 28500, 549866, '2024-04-07', NULL, NULL, NULL, '[]', NULL, NULL, NULL, '2024-04-07 10:56:34', '2024-04-07 11:12:45'),
(239, 1023, 20, NULL, 1, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 222, 222, '2024-04-08', NULL, NULL, NULL, '[1]', NULL, NULL, NULL, '2024-04-08 11:14:11', '2024-04-08 11:14:11'),
(240, 1024, 20, 2, 2, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 14152222, 0, 68500, 15540242, '2024-04-09', NULL, NULL, NULL, '[1]', '2024-04-21 12:29:51', NULL, NULL, '2024-04-09 15:29:55', '2024-04-21 09:28:52'),
(241, 1025, 47, 1, 4, 2, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 3212, 0, 5000, 8212, '2024-04-14', NULL, NULL, NULL, '[2]', NULL, NULL, NULL, '2024-04-14 08:09:19', '2024-04-14 08:09:19'),
(242, 1026, 20, NULL, 1, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 14152222, 0, 2500, 14154722, '2024-04-14', 'ااغ', NULL, NULL, '[1]', NULL, NULL, NULL, '2024-04-14 13:56:50', '2024-04-14 13:56:50'),
(243, 1027, 20, NULL, 1, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 2700, 9906556, 0, 90000, 9999256, '2024-04-14', 'لا', NULL, NULL, '[1]', NULL, NULL, NULL, '2024-04-14 13:59:04', '2024-04-14 13:59:04'),
(244, 1028, 20, NULL, 1, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 2700, 9906556, 0, 90000, 9999256, '2024-04-14', 'لا', NULL, NULL, '[1]', NULL, NULL, NULL, '2024-04-14 14:00:59', '2024-04-14 14:00:59'),
(245, 1029, 20, NULL, 1, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 510, 9906556, 0, 10200, 9917266, '2024-04-15', NULL, NULL, NULL, '[1]', NULL, NULL, NULL, '2024-04-15 07:45:54', '2024-04-15 07:45:54'),
(246, 1030, 47, NULL, 1, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 16, 1606, 0, 3300, 4922, '2024-04-15', NULL, NULL, NULL, '[]', NULL, NULL, NULL, '2024-04-15 08:31:27', '2024-04-15 08:31:27'),
(247, 1031, 20, NULL, 1, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 10500, 0, 9906556, 0, 5000, 9901056, '2024-04-15', NULL, NULL, NULL, '[]', NULL, NULL, NULL, '2024-04-15 11:41:32', '2024-04-15 11:41:32'),
(248, 1032, 47, NULL, 1, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1606, 0, 2500, 4106, '2024-04-15', NULL, NULL, NULL, '[4]', NULL, NULL, NULL, '2024-04-15 14:22:23', '2024-04-15 14:22:23'),
(249, 1033, 47, NULL, 1, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 562, 1606, 0, 19220, 21388, '2024-04-15', NULL, NULL, NULL, '[]', NULL, NULL, NULL, '2024-04-15 14:24:42', '2024-04-15 14:24:42'),
(250, 1034, 47, 2, 5, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1606, 0, 5000, 6606, '2024-04-15', NULL, NULL, NULL, '[]', NULL, NULL, NULL, '2024-04-15 14:25:43', '2024-04-17 14:49:40'),
(251, 1035, 47, NULL, 1, 1, 1, 76, NULL, NULL, NULL, NULL, NULL, 0, 0, 562, 1606, 0, 16720, 18888, '2024-04-15', NULL, NULL, NULL, '[]', NULL, NULL, NULL, '2024-04-15 14:26:32', '2024-04-15 14:26:32'),
(252, 1036, 20, 2, 2, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 16, 9906556, 0, 800, 9907372, '2024-04-16', NULL, NULL, NULL, '[]', '2024-04-21 12:52:39', NULL, NULL, '2024-04-16 09:16:39', '2024-04-21 09:52:40'),
(253, 1037, 20, 2, 2, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906556, 0, 2500, 9909056, '2024-04-16', NULL, NULL, NULL, '[]', '2024-04-21 12:49:46', NULL, NULL, '2024-04-16 09:18:18', '2024-04-21 09:49:47'),
(254, 1038, 20, 2, 2, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906556, 0, 2500, 9909056, '2024-04-16', NULL, NULL, NULL, '[]', NULL, NULL, NULL, '2024-04-16 09:22:06', '2024-04-21 09:41:22'),
(255, 1039, 20, 2, 1, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906556, 0, 2500, 9909056, '2024-04-16', NULL, NULL, NULL, '[]', NULL, NULL, NULL, '2024-04-16 09:22:58', '2024-04-17 13:03:21'),
(256, 1040, 20, 2, 2, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906556, 0, 2500, 9909056, '2024-04-16', NULL, NULL, NULL, '[]', '2024-04-21 12:40:34', NULL, NULL, '2024-04-16 09:30:42', '2024-04-21 09:40:34'),
(257, 1041, 20, 2, 2, 2, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 562, 19813112, 0, 11720, 19825394, '2024-04-16', NULL, NULL, NULL, '[]', NULL, NULL, NULL, '2024-04-16 09:31:30', '2024-04-21 09:37:09'),
(258, 1042, 20, 2, 2, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 546, 9906556, 0, 10920, 9918022, '2024-04-16', NULL, NULL, NULL, '[]', NULL, NULL, NULL, '2024-04-16 09:32:10', '2024-04-21 09:36:58'),
(259, 1043, 20, 2, 2, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906556, 0, 2500, 9909056, '2024-04-16', NULL, NULL, 1, '[]', '2024-04-21 12:36:57', NULL, NULL, '2024-04-16 09:33:25', '2024-04-21 09:35:57'),
(260, 1044, 20, 2, 2, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906556, 0, 2500, 9909056, '2024-04-16', NULL, NULL, 4, '[]', NULL, NULL, NULL, '2024-04-16 09:39:00', '2024-04-21 11:33:16'),
(261, 1045, 20, 2, 2, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9906556, 0, 2500, 9909056, '2024-04-16', NULL, NULL, 4, '[]', NULL, NULL, NULL, '2024-04-16 09:40:11', '2024-04-21 11:35:40'),
(262, 1046, 20, 1, 1, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 0, 0, 225, 14152222, 0, 4722, 14157169, '2024-04-24', NULL, NULL, NULL, '[2]', '2024-04-21 12:30:51', NULL, NULL, '2024-04-16 11:46:24', '2024-04-29 12:46:49'),
(263, 1047, 20, 1, 4, 1, 1, 78, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 9906556, 0, 2500, 9909056, '2024-04-16', NULL, 'sdcf', NULL, '[1]', NULL, '2024-04-23 15:40:25', NULL, '2024-04-16 11:55:39', '2024-04-23 12:40:26'),
(264, 1048, 20, 1, 2, 2, 1, 78, NULL, NULL, NULL, NULL, NULL, 1, 0, 225, 14152222, 0, 4722, 14157169, '2024-04-24', NULL, NULL, 2, '[4]', '2024-04-22 12:32:56', '2024-04-22 17:10:38', NULL, '2024-04-08 14:19:36', '2024-04-24 09:46:08'),
(265, 1049, 20, NULL, 1, 1, 1, 26, NULL, NULL, NULL, NULL, NULL, 0, 0, 112.5, 4498, 0, 2472, 7000, '2024-04-25', 'test', NULL, NULL, '[1,2]', NULL, NULL, NULL, '2024-04-25 10:53:57', '2024-04-25 10:53:57'),
(266, 1050, 20, NULL, 1, 1, 1, 26, NULL, NULL, NULL, NULL, NULL, 0, 0, 225, 4498, 0, 4722, 9400, '2024-04-25', 'test', NULL, NULL, '[1,2]', NULL, NULL, NULL, '2024-04-25 10:54:32', '2024-04-25 10:54:32'),
(267, 1051, 20, NULL, 1, 1, 1, 26, NULL, NULL, NULL, NULL, NULL, 0, 0, 225, 4498, 0, 4722, 9400, '2024-04-25', 'test', NULL, NULL, '[1,2]', NULL, NULL, NULL, '2024-04-25 10:56:26', '2024-04-25 10:56:26'),
(268, 1052, 20, 1, 2, 1, 1, 26, NULL, NULL, NULL, NULL, NULL, 0, 0, 225, 4498, 45, 4722, 9400, '2024-04-25', 'test', NULL, NULL, '[1,2]', NULL, NULL, NULL, '2024-04-25 10:57:27', '2024-04-25 10:57:27');

-- --------------------------------------------------------

--
-- Table structure for table `orders_rate_attributes`
--

CREATE TABLE `orders_rate_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rate_attribute_id` int(11) NOT NULL DEFAULT 0,
  `input` text DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_rate_attributes`
--

INSERT INTO `orders_rate_attributes` (`id`, `rate_attribute_id`, `input`, `order_id`, `created_at`, `updated_at`) VALUES
(4, 5, 'asczxc', 264, '2024-04-21 11:31:31', '2024-04-21 11:31:31'),
(8, 5, 'asczxc', 261, '2024-04-21 11:41:18', '2024-04-21 11:41:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_attributes`
--

CREATE TABLE `order_delivery_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_attribute_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_delivery_attributes`
--

INSERT INTO `order_delivery_attributes` (`id`, `order_id`, `delivery_attribute_id`, `created_at`, `updated_at`) VALUES
(262, 221, 1, NULL, NULL),
(264, 223, 1, NULL, NULL),
(276, 234, 1, NULL, NULL),
(277, 235, 3, NULL, NULL),
(278, 236, 3, NULL, NULL),
(279, 237, 3, NULL, NULL),
(281, 239, 2, NULL, NULL),
(282, 240, 2, NULL, NULL),
(283, 241, 3, NULL, NULL),
(284, 242, 2, NULL, NULL),
(285, 243, 2, NULL, NULL),
(286, 244, 2, NULL, NULL),
(287, 245, 2, NULL, NULL),
(288, 262, 3, NULL, NULL),
(289, 263, 1, NULL, NULL),
(290, 264, 2, NULL, NULL),
(291, 265, 1, NULL, NULL),
(292, 266, 1, NULL, NULL),
(293, 267, 1, NULL, NULL),
(294, 268, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(387, 221, 36, 2, 111.00, 1, NULL, '2024-04-01 10:02:23', '2024-04-23 13:43:44'),
(388, 221, 40, 1, 2500.00, 1, NULL, '2024-04-01 10:02:23', '2024-04-23 13:43:44'),
(390, 223, 36, 2, 111.00, 1, NULL, '2024-04-01 10:12:23', '2024-04-23 13:38:47'),
(391, 223, 40, 1, 2500.00, 0, NULL, '2024-04-01 10:12:23', '2024-04-23 13:38:47'),
(405, 234, 46, 1, 12000.00, 1, NULL, '2024-04-07 10:12:41', '2024-04-07 10:12:41'),
(406, 234, 47, 1, 14000.00, 1, NULL, '2024-04-07 10:12:41', '2024-04-07 10:12:41'),
(407, 234, 40, 1, 2500.00, 1, NULL, '2024-04-07 10:12:41', '2024-04-07 10:12:41'),
(408, 235, 47, 1, 14000.00, 1, NULL, '2024-04-07 10:14:53', '2024-04-07 10:14:53'),
(409, 235, 46, 1, 12000.00, 1, NULL, '2024-04-07 10:14:53', '2024-04-07 10:14:53'),
(410, 235, 40, 1, 2500.00, 1, NULL, '2024-04-07 10:14:53', '2024-04-07 10:14:53'),
(411, 236, 40, 1, 2500.00, 1, NULL, '2024-04-07 10:52:58', '2024-04-07 10:52:58'),
(412, 236, 46, 5, 12000.00, 1, NULL, '2024-04-07 10:52:58', '2024-04-07 10:52:58'),
(413, 236, 47, 1, 14000.00, 1, NULL, '2024-04-07 10:52:58', '2024-04-07 10:52:58'),
(414, 237, 40, 1, 2500.00, 1, NULL, '2024-04-07 10:56:34', '2024-04-07 11:16:18'),
(415, 237, 46, 1, 12000.00, 1, NULL, '2024-04-07 10:56:34', '2024-04-07 11:16:18'),
(416, 237, 47, 1, 14000.00, 1, NULL, '2024-04-07 10:56:34', '2024-04-07 11:16:18'),
(419, 239, 22, 1, 111.00, 1, NULL, '2024-04-08 11:14:11', '2024-04-08 11:14:11'),
(420, 239, 36, 1, 111.00, 1, NULL, '2024-04-08 11:14:11', '2024-04-08 11:14:11'),
(421, 240, 46, 2, 12000.00, 1, NULL, '2024-04-09 15:29:55', '2024-04-09 15:29:55'),
(422, 240, 40, 1, 2500.00, 1, NULL, '2024-04-09 15:29:55', '2024-04-09 15:29:55'),
(423, 240, 47, 3, 14000.00, 1, NULL, '2024-04-09 15:29:55', '2024-04-09 15:29:55'),
(424, 241, 40, 2, 2500.00, 1, NULL, '2024-04-14 08:09:19', '2024-04-14 08:09:19'),
(425, 242, 40, 1, 2500.00, 1, NULL, '2024-04-14 13:56:51', '2024-04-14 13:56:51'),
(426, 243, 49, 4, 25000.00, 1, NULL, '2024-04-14 13:59:05', '2024-04-14 13:59:05'),
(427, 244, 49, 4, 25000.00, 1, NULL, '2024-04-14 14:01:00', '2024-04-14 14:01:00'),
(428, 245, 48, 1, 17000.00, 1, NULL, '2024-04-15 07:45:55', '2024-04-15 07:45:55'),
(429, 246, 40, 1, 2500.00, 1, NULL, '2024-04-15 08:31:28', '2024-04-15 08:31:28'),
(430, 246, 46, 1, 1000.00, 1, NULL, '2024-04-15 08:31:28', '2024-04-15 08:31:28'),
(431, 247, 40, 2, 2500.00, 1, NULL, '2024-04-15 11:41:33', '2024-04-15 11:41:33'),
(432, 248, 40, 1, 2500.00, 1, NULL, '2024-04-15 14:22:24', '2024-04-15 14:22:24'),
(433, 249, 47, 1, 14000.00, 1, NULL, '2024-04-15 14:24:43', '2024-04-15 14:24:43'),
(434, 249, 46, 1, 1000.00, 1, NULL, '2024-04-15 14:24:43', '2024-04-15 14:24:43'),
(435, 249, 40, 3, 2500.00, 1, NULL, '2024-04-15 14:24:43', '2024-04-15 14:24:43'),
(436, 250, 40, 2, 2500.00, 1, NULL, '2024-04-15 14:25:43', '2024-04-15 14:25:43'),
(437, 251, 47, 1, 14000.00, 1, NULL, '2024-04-15 14:26:33', '2024-04-15 14:26:33'),
(438, 251, 46, 1, 1000.00, 1, NULL, '2024-04-15 14:26:33', '2024-04-15 14:26:33'),
(439, 251, 40, 2, 2500.00, 1, NULL, '2024-04-15 14:26:33', '2024-04-15 14:26:33'),
(440, 252, 46, 1, 1000.00, 1, NULL, '2024-04-16 09:16:40', '2024-04-16 09:16:40'),
(441, 253, 40, 1, 2500.00, 1, NULL, '2024-04-16 09:18:19', '2024-04-16 09:18:19'),
(442, 254, 40, 1, 2500.00, 1, NULL, '2024-04-16 09:22:06', '2024-04-16 09:22:06'),
(443, 255, 40, 1, 2500.00, 1, NULL, '2024-04-16 09:22:58', '2024-04-16 09:22:58'),
(444, 256, 40, 1, 2500.00, 1, NULL, '2024-04-16 09:30:43', '2024-04-16 09:30:43'),
(445, 257, 47, 1, 14000.00, 1, NULL, '2024-04-16 09:31:30', '2024-04-16 09:31:30'),
(446, 257, 46, 1, 1000.00, 1, NULL, '2024-04-16 09:31:30', '2024-04-16 09:31:30'),
(447, 258, 47, 1, 14000.00, 1, NULL, '2024-04-16 09:32:10', '2024-04-16 09:32:10'),
(448, 259, 40, 1, 2500.00, 1, NULL, '2024-04-16 09:33:26', '2024-04-16 09:33:26'),
(449, 260, 40, 1, 2500.00, 1, NULL, '2024-04-16 09:39:01', '2024-04-16 09:39:01'),
(450, 261, 40, 1, 2500.00, 1, NULL, '2024-04-16 09:40:12', '2024-04-16 09:40:12'),
(452, 263, 46, 1, 2500.00, 1, NULL, '2024-04-16 11:55:40', '2024-04-16 11:55:40'),
(464, 264, 22, 2, 111.00, 1, NULL, '2024-04-24 08:40:24', '2024-04-24 08:40:24'),
(465, 264, 40, 2, 2500.00, 1, NULL, '2024-04-24 08:40:24', '2024-04-24 08:40:24'),
(466, 262, 22, 2, 111.00, 1, NULL, '2024-04-24 08:41:52', '2024-04-24 08:41:52'),
(467, 262, 40, 2, 2500.00, 0, NULL, '2024-04-24 08:41:52', '2024-04-24 09:45:10'),
(468, 265, 36, 2, 111.00, 1, NULL, '2024-04-25 10:53:57', '2024-04-25 10:53:57'),
(469, 265, 40, 1, 2500.00, 1, NULL, '2024-04-25 10:53:57', '2024-04-25 10:53:57'),
(470, 266, 36, 2, 111.00, 1, NULL, '2024-04-25 10:54:32', '2024-04-25 10:54:32'),
(471, 266, 40, 2, 2500.00, 1, NULL, '2024-04-25 10:54:32', '2024-04-25 10:54:32'),
(472, 267, 36, 2, 111.00, 1, NULL, '2024-04-25 10:56:26', '2024-04-25 10:56:26'),
(473, 267, 40, 2, 2500.00, 1, NULL, '2024-04-25 10:56:26', '2024-04-25 10:56:26'),
(474, 268, 36, 2, 111.00, 1, NULL, '2024-04-25 10:57:27', '2024-04-25 10:57:27'),
(475, 268, 40, 2, 2500.00, 1, NULL, '2024-04-25 10:57:27', '2024-04-25 10:57:27');

-- --------------------------------------------------------

--
-- Table structure for table `order_driver_acceptances`
--

CREATE TABLE `order_driver_acceptances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_driver_acceptances`
--

INSERT INTO `order_driver_acceptances` (`id`, `order_id`, `driver_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 237, 2, 1, '2024-04-07 11:12:45', '2024-04-07 11:12:45'),
(2, 235, 2, 1, '2024-04-08 13:33:27', '2024-04-08 13:33:27'),
(3, 264, 2, 1, '2024-04-17 11:25:25', '2024-04-17 11:25:25'),
(4, 260, 2, 1, '2024-04-21 09:34:43', '2024-04-21 09:34:43'),
(5, 258, 2, 1, '2024-04-21 09:36:58', '2024-04-21 09:36:58'),
(6, 257, 2, 1, '2024-04-21 09:37:10', '2024-04-21 09:37:10'),
(7, 253, 2, 1, '2024-04-21 09:49:47', '2024-04-21 09:49:47'),
(8, 252, 2, 1, '2024-04-21 09:52:40', '2024-04-21 09:52:40'),
(9, 264, 1, 1, '2024-04-22 09:32:57', '2024-04-22 09:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `o_t_p_s`
--

CREATE TABLE `o_t_p_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `o_t_p_s`
--

INSERT INTO `o_t_p_s` (`id`, `code`, `phone`, `created_at`, `updated_at`) VALUES
(1, 673218, 938385477, '2023-12-08 11:12:04', '2023-12-08 11:12:04'),
(3, 270446, 987654321, '2023-12-18 06:14:03', '2023-12-18 06:14:03'),
(4, 158488, 9683824, '2023-12-18 06:15:59', '2023-12-18 06:15:59'),
(6, 841717, 98652471, '2023-12-18 06:32:51', '2023-12-18 06:32:51'),
(7, 525452, 5252, '2023-12-19 07:06:10', '2023-12-19 07:06:10'),
(9, 349692, 123456789, '2024-01-07 10:05:13', '2024-01-07 10:05:13'),
(10, 118590, 84545458, '2024-01-07 10:07:35', '2024-01-07 10:07:35'),
(11, 795059, 5656565, '2024-01-07 10:12:37', '2024-01-07 10:12:41'),
(12, 573048, 858282829, '2024-01-07 10:21:15', '2024-01-07 10:21:15'),
(13, 793766, 29399696, '2024-01-07 10:25:33', '2024-01-07 10:25:45'),
(14, 760816, 285888392, '2024-01-07 10:26:11', '2024-01-07 10:26:16'),
(15, 802247, 39393938, '2024-01-07 10:32:32', '2024-01-07 10:32:32'),
(16, 794517, 929288292, '2024-01-07 10:33:04', '2024-01-07 10:33:10'),
(17, 298345, 29399392, '2024-01-07 10:33:59', '2024-01-07 10:35:02'),
(18, 659939, 283828, '2024-01-07 10:40:26', '2024-01-07 10:40:30'),
(19, 387276, 585858, '2024-01-07 10:41:30', '2024-01-07 11:32:07'),
(20, 876158, 28282, '2024-01-07 10:42:25', '2024-01-07 10:42:29'),
(21, 212965, 2828285, '2024-01-07 10:48:34', '2024-01-07 10:48:37'),
(22, 482793, 595955, '2024-01-07 10:48:52', '2024-01-07 10:48:55'),
(23, 762453, 285958, '2024-01-07 10:49:36', '2024-01-07 10:49:38'),
(24, 378865, 2828258, '2024-01-07 10:50:13', '2024-01-07 10:51:15'),
(25, 972238, 8582882, '2024-01-07 10:56:08', '2024-01-07 10:57:10'),
(26, 958829, 5855885, '2024-01-07 10:59:52', '2024-01-07 11:00:53'),
(27, 354151, 686868, '2024-01-07 11:03:16', '2024-01-07 11:05:24'),
(28, 726000, 28282828, '2024-01-07 11:07:59', '2024-01-07 11:07:59'),
(29, 843375, 5885595, '2024-01-07 11:09:24', '2024-01-07 11:09:28'),
(30, 880167, 8285858, '2024-01-07 11:12:08', '2024-01-07 11:13:16'),
(31, 558829, 8282828, '2024-01-07 11:14:58', '2024-01-07 11:15:02'),
(33, 488846, 8282885, '2024-01-07 11:18:20', '2024-01-07 11:18:20'),
(35, 616856, 8285825, '2024-01-07 11:20:36', '2024-01-07 11:20:36'),
(36, 370407, 5858588, '2024-01-07 11:21:56', '2024-01-07 11:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'cash', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.manage', 'user', '2023-12-18 13:08:44', '2023-12-18 13:08:48'),
(2, 'users.view', 'user', '2022-03-08 08:39:12', '2022-03-08 08:39:12'),
(3, 'users.create', 'user', '2022-03-08 08:39:12', '2022-03-08 08:39:12'),
(4, 'users.edit', 'user', '2022-03-08 08:39:12', '2022-03-08 08:39:12'),
(5, 'users.delete', 'user', '2022-03-08 08:39:12', '2022-03-08 08:39:12'),
(7, 'categories.view', 'user', '2022-03-08 08:42:23', '2022-03-08 08:42:23'),
(8, 'categories.create', 'user', '2022-03-08 08:42:23', '2022-03-08 08:42:23'),
(9, 'categories.edit', 'user', '2022-03-08 08:42:23', '2022-03-08 08:42:23'),
(10, 'categories.delete', 'user', '2022-03-08 08:42:23', '2022-03-08 08:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `points` bigint(20) NOT NULL,
  `used_points` bigint(20) NOT NULL DEFAULT 0,
  `achievement_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `used_at` datetime DEFAULT NULL,
  `expire_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `user_id`, `points`, `used_points`, `achievement_id`, `created_at`, `used_at`, `expire_at`) VALUES
(1, 4, 35, 0, 2, '2024-02-20 01:06:49', NULL, '2024-03-04 01:04:08'),
(2, 8, 67, 0, 8, '2024-02-22 12:37:47', '2024-02-27 02:52:31', '2024-03-22 21:51:10'),
(3, 6, 51, 18, 3, '2024-02-19 09:19:47', NULL, '2024-03-08 20:11:06'),
(4, 20, 100, 0, 8, '2024-02-04 15:07:12', NULL, '2024-04-02 21:35:57'),
(5, 1, 50, 37, 5, '2024-03-02 12:58:27', NULL, '2024-03-08 01:03:54'),
(6, 4, 7, 0, 3, '2024-02-07 14:05:44', '2024-02-18 10:00:31', '2024-03-13 03:11:08'),
(7, 4, 85, 24, 9, '2024-02-25 17:36:04', NULL, '2024-03-08 19:55:31'),
(8, 2, 46, 0, 5, '2024-02-28 13:28:59', '2024-02-29 03:36:02', '2024-03-25 10:21:30'),
(9, 1, 8, 0, 9, '2024-03-02 23:24:33', NULL, '2024-03-05 22:19:16'),
(10, 20, 10, 0, 3, '2024-02-08 19:47:27', NULL, '2024-03-18 08:00:11'),
(11, 1, 20, 10, 2, '2024-02-08 08:00:26', NULL, '2024-03-07 10:17:14'),
(12, 4, 91, 0, 2, '2024-02-09 17:48:17', '2024-02-10 05:52:43', '2024-03-11 05:45:29'),
(13, 9, 95, 0, 7, '2024-02-09 04:04:02', '2024-02-11 06:58:11', '2024-03-10 15:29:21'),
(14, 6, 72, 0, 10, '2024-02-23 22:55:06', NULL, '2024-03-06 09:10:15'),
(15, 3, 66, 53, 3, '2024-02-27 23:24:01', NULL, '2024-03-04 14:15:24'),
(16, 4, 50, 29, 5, '2024-03-01 02:15:38', NULL, '2024-03-03 10:22:43'),
(17, 4, 56, 0, 2, '2024-02-12 14:03:37', NULL, '2024-03-06 01:27:13'),
(18, 5, 6, 2, 6, '2024-02-26 14:31:27', '2024-03-02 16:46:39', '2024-03-15 10:30:15'),
(19, 20, 60, 40, 8, '2024-02-24 03:36:53', NULL, '2024-03-31 21:35:42'),
(20, 20, 50, 0, 1, '2024-02-10 11:38:17', '2024-02-15 08:06:45', '2024-03-29 12:46:27'),
(21, 4, 69, 46, 1, '2024-02-16 11:23:53', '2024-02-27 10:10:30', '2024-03-23 14:19:06'),
(22, 2, 89, 14, 4, '2024-02-14 11:26:21', NULL, '2024-02-14 12:38:57'),
(23, 9, 84, 62, 10, '2024-02-23 21:53:16', '2024-03-02 15:05:12', '2024-03-06 11:48:40'),
(24, 3, 50, 0, 2, '2024-02-07 13:16:16', NULL, '2024-03-06 08:12:47'),
(25, 1, 2, 0, 5, '2024-03-01 14:39:24', '2024-03-03 00:37:04', '2024-03-08 12:58:16'),
(26, 8, 65, 22, 4, '2024-02-15 18:48:23', '2024-02-24 02:22:08', '2024-04-02 20:23:23'),
(27, 8, 77, 59, 3, '2024-02-05 23:36:58', '2024-02-06 18:51:42', '2024-02-27 00:48:45'),
(28, 4, 94, 0, 9, '2024-02-22 02:46:06', NULL, '2024-02-22 05:42:16'),
(29, 7, 64, 0, 3, '2024-02-21 18:06:17', NULL, '2024-03-08 13:16:41'),
(30, 10, 89, 29, 8, '2024-02-28 15:27:35', NULL, '2024-03-07 18:36:42'),
(31, 20, 50, 50, 4, '2024-03-21 11:48:59', '2024-04-01 09:02:23', '2024-06-19 11:48:59'),
(32, 20, 1200, 1200, 5, '2024-04-14 12:56:51', '2024-04-28 08:54:03', '2024-07-13 12:56:51'),
(33, 20, 9999, 500, 5, '2024-04-14 12:59:04', NULL, '2024-07-13 12:59:04'),
(34, 20, 9999, 0, 5, '2024-04-14 13:00:59', NULL, '2024-07-13 13:00:59'),
(35, 20, 9917, 0, 5, '2024-04-15 06:45:54', NULL, '2024-07-14 06:45:54'),
(36, 47, 4, 0, 5, '2024-04-15 07:31:28', NULL, '2024-07-14 07:31:28'),
(37, 20, 9901, 0, 5, '2024-04-15 10:41:33', NULL, '2024-07-14 10:41:33'),
(38, 47, 4, 0, 5, '2024-04-15 13:22:24', NULL, '2024-07-14 13:22:24'),
(39, 47, 21, 0, 5, '2024-04-15 13:24:43', NULL, '2024-07-14 13:24:43'),
(40, 47, 6, 0, 5, '2024-04-15 13:25:43', NULL, '2024-07-14 13:25:43'),
(41, 47, 18, 0, 5, '2024-04-15 13:26:33', NULL, '2024-07-14 13:26:33'),
(42, 20, 9907, 0, 5, '2024-04-16 08:16:39', NULL, '2024-07-15 08:16:39'),
(43, 20, 9909, 0, 5, '2024-04-16 08:18:18', NULL, '2024-07-15 08:18:18'),
(44, 20, 9909, 0, 5, '2024-04-16 08:22:06', NULL, '2024-07-15 08:22:06'),
(45, 20, 9909, 0, 5, '2024-04-16 08:22:58', NULL, '2024-07-15 08:22:58'),
(46, 20, 9909, 0, 5, '2024-04-16 08:30:42', NULL, '2024-07-15 08:30:42'),
(47, 20, 19825, 0, 5, '2024-04-16 08:31:30', NULL, '2024-07-15 08:31:30'),
(48, 20, 9918, 0, 5, '2024-04-16 08:32:10', NULL, '2024-07-15 08:32:10'),
(49, 20, 9909, 0, 5, '2024-04-16 08:33:25', NULL, '2024-07-15 08:33:25'),
(50, 20, 9909, 0, 5, '2024-04-16 08:39:00', NULL, '2024-07-15 08:39:00'),
(51, 20, 9909, 0, 5, '2024-04-16 08:40:12', NULL, '2024-07-15 08:40:12'),
(52, 20, 9909, 0, 5, '2024-04-16 10:46:24', NULL, '2024-07-15 10:46:24'),
(53, 20, 9909, 0, 5, '2024-04-16 10:55:39', NULL, '2024-07-15 10:55:39'),
(54, 20, 10044, 0, 5, '2024-04-16 13:19:36', NULL, '2024-07-15 13:19:36'),
(55, 20, 5, 0, 3, '2024-04-17 12:43:17', NULL, '2024-07-16 12:43:17'),
(56, 20, 5, 0, 3, '2024-04-17 12:43:32', NULL, '2024-07-16 12:43:32'),
(57, 20, 5, 0, 3, '2024-04-17 12:43:37', NULL, '2024-07-16 12:43:37'),
(58, 20, 5, 0, 3, '2024-04-17 12:43:43', NULL, '2024-07-16 12:43:43'),
(59, 20, 5, 0, 3, '2024-04-17 12:44:07', NULL, '2024-07-16 12:44:07'),
(60, 20, 5, 0, 3, '2024-04-17 12:44:26', NULL, '2024-07-16 12:44:26'),
(61, 20, 5, 0, 3, '2024-04-17 12:44:37', NULL, '2024-07-16 12:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `point_in_pound`
--

CREATE TABLE `point_in_pound` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `point_in_pound`
--

INSERT INTO `point_in_pound` (`id`, `value`) VALUES
(1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `real_price` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `suggested` int(11) DEFAULT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT 1,
  `product_source` tinyint(1) NOT NULL DEFAULT 0,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `commission_id` bigint(20) UNSIGNED NOT NULL,
  `commission_value` double NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `discount_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `real_price`, `price`, `tax`, `unit`, `slug`, `quantity`, `status`, `suggested`, `availability`, `product_source`, `seller_id`, `subcategory_id`, `commission_id`, `commission_value`, `discount`, `discount_status`, `created_at`, `updated_at`) VALUES
(22, 'لحمة طازجة', 'product', 0, 111, NULL, NULL, NULL, 5, 1, 1, 1, 0, 2, 1, 1, 10, 0, 0, '2023-12-25 06:02:35', '2023-12-25 06:02:35'),
(36, 'لحمة طازجة اصلية', 'product', 0, 111, NULL, NULL, NULL, 0, 1, 1, 1, 0, 2, 1, 1, 10, 0, 0, '2023-12-26 06:37:52', '2024-04-29 11:11:16'),
(40, 'كوسا بلدية', '<ol>\n<li style=\"text-align: right;\">كوسا بلدية من جبل الشيخ&nbsp;<br>مسقية بمية فيجة</li>\n</ol>', 0, 2500, 5, NULL, NULL, 16, 1, NULL, 1, 0, 1, 2, 1, 20, 10, 1, '2024-01-02 16:49:16', '2024-04-29 11:11:16'),
(46, 'فليفلة حمراء', '<p>فليفلة بلدية رقيقة</p>', 0, 1000, 2, NULL, NULL, 15, 1, NULL, 1, 0, 1, 2, 6, 4000, 20, 1, '2024-03-14 14:26:40', '2024-03-14 15:30:04'),
(47, 'فليفلة خضراء', '<p>فليفلة بلدية رقيقة</p>', 0, 14000, 5, NULL, NULL, 16, 1, NULL, 1, 0, 1, 2, 6, 4000, 22, 1, '2024-03-14 14:30:09', '2024-03-14 14:30:09'),
(48, 'فليفلة حمراء حارة', '<p>&nbsp;فليفلة حمراء حارة بلدية رقيقة</p>', 0, 17000, 5, NULL, NULL, 11, 1, NULL, 1, 0, 1, 2, 6, 1700, 40, 1, '2024-03-14 14:33:52', '2024-03-14 14:33:52'),
(49, 'فليفلة مفرومة', '<p>&nbsp;فليفلة بلدية رقيقة مفرومة</p>', 0, 25000, 3, NULL, NULL, 15, 1, NULL, 1, 0, 1, 2, 6, 1999, 10, 1, '2024-03-14 14:37:59', '2024-03-14 14:37:59'),
(50, 'test1', '<p>test</p>', 0, 21, 1, NULL, NULL, 1, 1, NULL, 1, 0, 1, 1, 1, 2, 0, 0, '2024-03-20 14:25:03', '2024-03-20 14:31:28'),
(81, 's', 's', 0, 1000, 1, 'غرام', NULL, 10, 1, NULL, 1, 0, NULL, 1, 1, 1, 0, 0, '2024-04-25 11:40:47', '2024-04-25 11:40:47'),
(82, 's', 's', 900, 1000, 1, 'غرام', NULL, 10, 1, NULL, 1, 0, NULL, 1, 1, 1, 0, 0, '2024-04-25 11:47:47', '2024-04-25 11:47:47');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `attribute_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES
(4, 2, 17, '250', NULL, NULL),
(5, 1, 18, '1', NULL, NULL),
(6, 1, 19, '1', NULL, NULL),
(7, 1, 20, '1', NULL, NULL),
(8, 1, 21, '1', NULL, NULL),
(9, 1, 22, '1', NULL, NULL),
(10, 1, 23, '1', NULL, NULL),
(11, 1, 24, '1', NULL, NULL),
(12, 1, 25, '1', NULL, NULL),
(13, 1, 27, '1', NULL, NULL),
(14, 1, 30, '1', NULL, NULL),
(15, 1, 31, '1', NULL, NULL),
(16, 1, 32, '1', NULL, NULL),
(17, 1, 33, '1', NULL, NULL),
(18, 1, 34, '1', NULL, NULL),
(19, 1, 35, '1', NULL, NULL),
(20, 1, 36, '1', NULL, NULL),
(22, 7, 16, '2', NULL, NULL),
(23, 8, 16, '200g', NULL, NULL),
(25, 7, 38, '2', NULL, NULL),
(26, 8, 38, '500g', NULL, NULL),
(28, 7, 39, '2', NULL, NULL),
(29, 8, 39, '500g', NULL, NULL),
(44, 7, 37, '1', NULL, NULL),
(45, 8, 37, '500g', NULL, NULL),
(48, 7, 41, '1', NULL, NULL),
(49, 8, 41, '500g', NULL, NULL),
(50, 7, 42, '1', NULL, NULL),
(51, 7, 43, '1', NULL, NULL),
(53, 7, 44, '1', NULL, NULL),
(54, 8, 44, '200g', NULL, NULL),
(55, 8, 45, '200g', NULL, NULL),
(56, 7, 45, '2', NULL, NULL),
(59, 8, 47, '200g', NULL, NULL),
(60, 7, 47, '2', NULL, NULL),
(61, 8, 48, '200g', NULL, NULL),
(62, 7, 48, '1', NULL, NULL),
(63, 7, 49, '15', NULL, NULL),
(64, 8, 49, '500g', NULL, NULL),
(65, 8, 46, '200g', NULL, NULL),
(67, 7, 51, '1', NULL, NULL),
(68, 7, 52, '1', NULL, NULL),
(69, 7, 53, '1', NULL, NULL),
(70, 7, 54, '1', NULL, NULL),
(71, 7, 55, '2', NULL, NULL),
(72, 7, 50, '1', NULL, NULL),
(75, 8, 56, '200g', NULL, NULL),
(76, 7, 80, '1', NULL, NULL),
(77, 7, 40, '1', NULL, NULL),
(78, 8, 40, '500g', NULL, NULL),
(79, 7, 81, '1', NULL, NULL),
(80, 7, 82, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_related_product`
--

CREATE TABLE `product_related_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `related_product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_related_product`
--

INSERT INTO `product_related_product` (`id`, `product_id`, `related_product_id`, `created_at`, `updated_at`) VALUES
(10, 22, 36, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `points` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `coupon_id`, `points`, `created_at`, `updated_at`) VALUES
(8, 20, 3, 894, '2024-04-01 10:33:47', '2024-04-01 10:33:47'),
(9, 20, 5, 300, '2024-04-15 08:41:32', '2024-04-15 08:41:32'),
(10, 20, 4, 200, '2024-04-28 05:44:17', '2024-04-28 05:44:17'),
(11, 20, 4, 200, '2024-04-28 05:45:20', '2024-04-28 05:45:20'),
(12, 20, 4, 200, '2024-04-28 05:46:13', '2024-04-28 05:46:13'),
(13, 20, 4, 200, '2024-04-28 05:49:35', '2024-04-28 05:49:35'),
(14, 20, 4, 200, '2024-04-28 05:54:03', '2024-04-28 05:54:03'),
(15, 20, 4, 200, '2024-04-28 06:16:28', '2024-04-28 06:16:28'),
(16, 20, 4, 200, '2024-04-28 06:21:43', '2024-04-28 06:21:43');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'User', 'user', '2023-12-07 16:01:01', '2023-12-07 16:01:01'),
(3, 'MeroRole', 'user', '2023-12-24 06:48:33', '2023-12-24 06:48:33'),
(8, 'ne', 'user', '2023-12-24 08:08:47', '2023-12-24 08:08:47'),
(9, 'test', 'user', '2024-02-04 21:58:20', '2024-02-04 21:58:20'),
(10, 'gu', 'user', '2024-02-04 23:40:46', '2024-02-04 23:40:46'),
(12, 'zzz', 'user', '2024-03-20 10:21:03', '2024-03-20 10:21:03'),
(13, 'www', 'user', '2024-03-20 10:22:26', '2024-03-20 10:22:26'),
(14, 'asd', 'user', '2024-03-20 10:23:50', '2024-03-20 10:23:50'),
(15, 'qwe', 'user', '2024-03-20 10:24:28', '2024-03-20 10:24:28'),
(16, 'rrrrrdc', 'user', '2024-03-20 11:41:16', '2024-03-20 12:17:03'),
(17, 'etst', 'user', '2024-03-20 12:09:25', '2024-03-20 12:09:25'),
(18, 'qwwq', 'user', '2024-03-20 12:13:20', '2024-03-20 12:13:20'),
(19, 'sdc', 'user', '2024-03-20 12:14:48', '2024-03-20 12:14:48'),
(20, 'sdcsd', 'user', '2024-03-20 12:15:28', '2024-03-20 12:15:28');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 8),
(1, 9),
(1, 10),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(2, 2),
(2, 3),
(2, 9),
(2, 10),
(2, 12),
(2, 16),
(2, 18),
(3, 2),
(3, 3),
(3, 9),
(3, 10),
(3, 16),
(4, 2),
(4, 3),
(4, 9),
(4, 10),
(4, 20),
(5, 2),
(5, 3),
(5, 9),
(5, 10),
(5, 16),
(5, 19),
(5, 20),
(7, 2),
(7, 3),
(7, 9),
(7, 10),
(8, 2),
(8, 3),
(8, 9),
(8, 10),
(9, 2),
(9, 3),
(9, 9),
(9, 10),
(10, 2),
(10, 3),
(10, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('internal','external') NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `discount_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `name`, `latitude`, `longitude`, `status`, `area_id`, `type`, `discount`, `discount_status`, `created_at`, `updated_at`) VALUES
(1, 'Seller12', 33.49960754456129, 36.282430958591384, 1, 1, 'internal', 35, 0, '2023-12-07 16:08:28', '2024-04-02 12:19:26'),
(9, 's2', NULL, NULL, 1, 1, 'external', 0, 0, '2024-04-02 12:37:36', '2024-04-02 12:37:36'),
(10, 'Foad2', NULL, NULL, 1, 1, 'internal', 2, 0, '2024-04-02 20:57:54', '2024-04-02 20:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `baseUrl` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `show_reward_system` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `baseUrl`, `version`, `phone`, `show_reward_system`) VALUES
(1, 'https://control.farmy.peaklink.site/public', '1', '987654321', 1);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Damascus', '2023-12-07 16:06:40', '2023-12-07 16:06:40');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'بقدونس', 1, 1, '2023-12-07 16:22:37', '2023-12-07 16:22:37'),
(2, 'فليفلة اصفر', 1, 1, '2023-12-18 05:53:58', '2023-12-19 05:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` bigint(20) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 2,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `fcm_token` text DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `birthday`, `email`, `password`, `address`, `phone`, `role_id`, `latitude`, `longitude`, `status`, `fcm_token`, `city_id`, `remember_token`, `delete_reason`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', '2024-01-16', 'admin@admin.com', '$2y$10$g8g9v11V1pil1ewyc88WM.p25/ggQ4.gTWZfqqCN3Wd.Sekz8KC4S', 'address', 938385476, 3, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, '2023-12-17 07:19:53', '2024-01-21 13:12:09'),
(2, 'wassim', 'karam', '2024-01-16', 'wassim1@gmail.com', '$2y$10$G5s.LY9QsxeOBaHe0QP1mexOvNZfBM3C0x8jhCr/D.5BSerw/bXLW', 'address', 938385454, 2, 33.50063069623525, 36.29376238948721, 1, NULL, 1, NULL, NULL, NULL, '2023-12-17 07:19:53', '2024-01-19 15:36:19'),
(5, 'قمر', 'الباكير', '2024-01-16', NULL, '$2y$10$NSHeZMpm9e6Ptb9GcCSvQuPgtrqLZiMRZdZUHq8KIWvRiEtePEXH6', NULL, 987654321, 2, NULL, NULL, 1, 'eyVzdz93RQSSrPt1Y8wZVu:APA91bF8rkoxpi_S6Cws8JSPgJV8nzuUJb9FwfcfEzFEUZ8731ZC3Z5__Qy9zj_YmsEH7b7D-gJTZBNzIvCrjFhtzZz8BM6QbcimP3l2iNek4dFJTNyslqv-v3yvvIHaNEQw4BZuv9YX', NULL, NULL, NULL, NULL, '2023-12-17 12:30:22', '2024-04-16 14:46:17'),
(9, 'qmar', 'albakeer', '2024-01-16', NULL, '$2y$10$gsqGmOKWKu4ihCB.UfcaPO8vAWkSx4F/Rx8EKbJ96rgTxYQex5xyC', NULL, 987654322, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2023-12-18 06:17:50', '2023-12-18 06:31:59'),
(10, 'shawki', 'shawki', '2024-01-16', NULL, '$2y$10$ShLt9Octu5uiXq32hOTz.ugRLjXBIiqUFvR.XdtiEzPmyZ/HGHIOO', NULL, 994297125, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2023-12-19 06:18:34', '2023-12-19 06:18:34'),
(19, 'anwar', 'sh', NULL, 'anwar@anwar.com', '$2y$10$t3LVPKhCJQ6oHMQYDcSl0e/rMQVftDvGUzhswk36Cm39gHeieY6NK', NULL, 936252114, 2, NULL, NULL, 1, 'edYfPsmRSLa9DxpNrfmzhk:APA91bHeRdVpWbhdWIQxVAU-9AK3n6exv6rtHg-T7vRoyOc7jlzOaFDgKZGqxi8AWIXoNt9BQPWDyM-BwFDunedfaB769LGLZsUCLfjfXx-Ppwq_f7N_LM0Ub7w8WNHOn73R9LDb9qJc', NULL, NULL, NULL, NULL, '2024-01-03 07:25:23', '2024-03-06 11:24:34'),
(20, 'Mouhanad', 'Haroun', '2024-01-06', 'tt@gmail.com', '$2y$10$XHCroDrGqfERyxQ8Ih0BYOLmsBxd3mLPwvtY6C84pXXVIQ61Ctax6', NULL, 987654111, 2, NULL, NULL, 1, 'eyVzdz93RQSSrPt1Y8wZVu:APA91bF8rkoxpi_S6Cws8JSPgJV8nzuUJb9FwfcfEzFEUZ8731ZC3Z5__Qy9zj_YmsEH7b7D-gJTZBNzIvCrjFhtzZz8BM6QbcimP3l2iNek4dFJTNyslqv-v3yvvIHaNEQw4BZuv9YX', NULL, NULL, NULL, NULL, '2024-01-06 10:56:48', '2024-04-16 14:42:41'),
(28, 'ghina123', 'sharaf', '2024-01-16', 'ghina@gmail.com', '$2y$10$OYm6GDdh6VUlU7HgMRgtluhOJczom3CHxTmVp/O/l63zn8yec/OyW', NULL, 946156989, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-02-07 10:35:14', '2024-02-21 11:17:52'),
(38, 'mousa', 'halabi', NULL, 'mousa@m.com', '$2y$10$/LSFNQhnkqQK8JisKNG3vuIX/FZ5O6OxCSp6oljHq6XGWwRgmmT7O', NULL, 984350792, 2, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, '2024-03-04 11:01:36', '2024-03-04 11:01:36'),
(39, 'new user2', 'Saati', NULL, 'peaklink@gmail.com', '$2y$10$KZW1NLQ27RKVFPYzFF67V.0tG8iroIwEBa3JlrXirzbEPKwLTGag6', NULL, 935387582, 3, NULL, NULL, 1, NULL, 1, NULL, NULL, '2024-03-04 15:20:12', '2024-03-04 15:16:11', '2024-03-04 15:20:12'),
(40, 'majd', 'saati', NULL, 'peaklink1@gmail.com', '$2y$10$ZVxJjkrDvo8OiIXsSQwrleQJoJkwFxyIddYhr6aL5PgfYBg3Kx2aS', NULL, 936321565, 2, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-03-04 15:33:21', '2024-03-04 15:33:21'),
(41, 'reem', 'alzoubi', NULL, NULL, '$2y$10$m3dBXStsx9dwBbfiONiM1OG/zSmxYh8GPYEanmD9pm1Hf4ibpoGmG', NULL, 936348613, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-03-13 13:06:03', '2024-03-13 13:06:03'),
(42, 'sdcsd', 'tete', NULL, 'peaklinek@gmail.com', '$2y$10$RB8xvyGZcIZRyuGr40yEZu4QoyHHydQK73vSEoLEuDAXBBOiAxSSG', NULL, 225265225, 2, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-03-14 13:08:49', '2024-03-14 13:08:49'),
(43, 'te', 'sdv', NULL, 'Hadia.Azzoz@gmail.com', '$2y$10$eIOudNqKUjYYuAj2FGgVSOJC8UHZXMIItzRAjzCbbi4/xAmjv5akW', NULL, 512561561, 2, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-03-19 12:23:02', '2024-03-19 12:23:02'),
(44, 'Majd', 'Saati', NULL, 'Hdadia.Azzoz@gmail.com', '$2y$10$2P8hJWM.KgF6s7OT90B2oOWGjzpcqKf/M8smrWqecopQAGHr2h3lm', NULL, 5387582, 2, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-03-19 13:07:32', '2024-03-19 13:07:32'),
(45, 'سير', 'Saati', NULL, 'Hadadia.Azzoz@gmail.com', '$2y$10$r/CDV4T22jigDOANcPP1hOEw6JBQPj0wJrWBLZqQV/SIereSFOuUW', NULL, 53875832, 3, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, '2024-03-19 13:13:50', '2024-03-19 13:13:50'),
(46, 'sdc', 'Saati', NULL, 'Hdadcsdia.Azzoz@gmail.com', '$2y$10$/UVVw8Ywhhf2HwPaxtTgWexE7Kb2DWN8f6u/6IPulzO3JCWXz96oW', NULL, 538732582, 3, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, '2024-03-19 13:31:51', '2024-03-19 13:31:51'),
(47, 'issa', 'halabi', '2024-01-02', NULL, '$2y$12$Iv8OwccwQGAYQxze4E9Lh.erkVGf20eDmmH8iB6p76J7k0RxmJ/cG', NULL, 946649532, 2, NULL, NULL, 1, 'qwer1234', NULL, NULL, NULL, NULL, '2024-04-02 16:00:40', '2024-04-18 12:53:34'),
(48, 'issa', 'halabi', '2024-01-02', NULL, '$2y$10$kJfoCfc7T5I8duMcXm5yb.43CjLHHx2JScJuvHk0S/K26gEs3TqK6', NULL, 984350791, 2, NULL, NULL, 1, 'eWoQydnVRXihRlnUiEwyfR:APA91bFnSe8Qulas-eyogWC0yKR5tDWD6BMDY7m49tuk26TJFPgBpAa9uZWmE3xfgdQq48ksNQalxpxbSVChititUJuEM9N-AJGXlwTi1SkVyecPne5tEa_hnAcINtM_bw9XlPzQlvdJ', NULL, NULL, NULL, NULL, '2024-04-02 16:00:40', '2024-04-02 16:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `area` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `building` varchar(255) DEFAULT NULL,
  `building_number` varchar(255) DEFAULT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `is_favourite` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `name`, `address`, `latitude`, `longitude`, `user_id`, `area`, `street`, `building`, `building_number`, `floor`, `is_favourite`, `created_at`, `updated_at`) VALUES
(6, 'سوق', 'سوق', 111, 111, 5, 'المزة', 'شارع', 'بناء', '٥٥', 'عاشر', 0, '2023-12-19 10:04:11', '2023-12-19 10:04:11'),
(7, 'حمص', 'عبع', 111, 111, 5, 'المزة', 'اؤ', 'اؤغب', 'اب', 'تر', 0, '2023-12-19 10:10:25', '2023-12-19 10:10:25'),
(8, 'تتتت', 'تتت', 111, 111, 5, 'المزة', 'للل', 'غب', 'بب', 'للل', 0, '2023-12-19 10:11:55', '2023-12-19 10:11:55'),
(11, 'tsgd', 'dydyd', 31.1, 31.2, 38, 'المزة', 'dhd', 'hxh', 'hxh', 'xhxhx', 0, '2024-01-06 11:25:59', '2024-01-06 11:25:59'),
(26, 'ururr', 'fjt', 33.518142769667094, 36.258938088294535, 19, 'المزة', 'rut', 'eye', 'dhd', 'dhddhdh', 1, '2024-01-14 09:15:30', '2024-01-28 13:34:01'),
(29, 'gfd', 'zdsfc', 111, 111, 19, 'المزة', 'sfsdv', 'fs', 'sfd', 'sfd', 0, '2024-01-15 14:15:42', '2024-01-15 14:15:42'),
(30, 'x\\z', '\\xz', 111, 111, 19, 'المزة', '\\xz', '\\zx', '\\xz', '\\x', 1, '2024-01-15 14:16:54', '2024-01-18 09:27:53'),
(35, 'انور شيخ الارض', 'مزة', 33.49994256119203, 36.270956620574, 19, 'شام', 'شارع العابد', 'بناء الادخار', '٤', '٥', 1, '2024-01-16 15:28:34', '2024-01-16 15:28:34'),
(41, 'رترط', 'زتيتي', 33.48389305581207, 36.337066031992435, 1, 'ااستس', 'طتنس', 'رريري', 'سرريس', 'ررظس', 1, '2024-01-19 20:53:49', '2024-01-19 20:54:43'),
(42, 'jkjk', 'kkkk', 37.430722817906194, -122.08597797900438, 28, 'kkk', 'jkj', 'kj', 'jkjkl', 'jkjk', 1, '2024-02-07 10:40:00', '2024-02-07 10:44:33'),
(75, 'jbuh7', 'hfuh', 33.51593262631768, 36.27721857279539, 28, 'gf CJ oh h', 'vyv', 'bchf', 'uhi', 'hcu', 1, '2024-04-02 12:56:11', '2024-04-02 12:56:19'),
(76, 'hcgy', 'hvh', 33.507866676170416, 36.27649202942848, 47, 'khj', 'gch', 'bvh', 'bvh', '2', 1, '2024-04-02 16:04:27', '2024-04-02 16:04:32'),
(78, 'دمر الجزيرة العاشرة - بناء 25 - الطابق 12', 'دمشق', 33.507866676170416, 36.27649202942848, 20, 'مشروع دمر', 'دمر الجزيرة العاشرة', '25', '3', '12', 1, '2024-04-03 11:59:31', '2024-04-03 11:59:35'),
(79, 'دمر الجزيرة العاشرة - بناء 25 - الطابق 12', 'مشروع دمر', 38.907255856648874, -77.03679297119379, 20, 'دمشق', 'دمر الجزيرة العاشرة', '22', '8', '4', 0, '2024-04-03 12:03:06', '2024-04-03 12:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `user_ranks`
--

CREATE TABLE `user_ranks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit` bigint(20) NOT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_ranks`
--

INSERT INTO `user_ranks` (`id`, `name`, `limit`, `features`, `description`, `color`) VALUES
(1, 'Bronze', 0, '{\"coupon_per_month\":0,\"discount_on_deliver\":0,\"priority\":3}', 'تحصل على هذه الرتبة عند تسجيلك بالتطبيق ', '#915B40'),
(2, 'Silver', 150, '{\"coupon_per_month\":1,\"discount_on_deliver\":0,\"priority\":4}', 'تحصل على هذه الرتبة عند وصولك ل 150 نقطة', '#646464'),
(3, 'Gold', 300, '{\"coupon_per_month\":1,\"discount_on_deliver\":5,\"priority\":4}', 'تحصل على هذه الرتبة عند وصولك ل 300 نقطة', '#EAA441'),
(4, 'Platinium', 500, '{\"coupon_per_month\":2,\"discount_on_deliver\":10,\"priority\":3}', 'تحصل على هذه الرتبة عند وصولك ل 500 نقطة', '#A2D5F6'),
(5, 'Vip', 800, '{\"coupon_per_month\":3,\"discount_on_deliver\":20,\"priority\":2}', 'تحصل على هذه الرتبة عند وصولك ل 800 نقطة', '#A2D5F6'),
(6, 'Vip plus', 1500, '{\"coupon_per_month\":4,\"discount_on_deliver\":30,\"priority\":1}', 'تحصل على هذه الرتبة عند وصولك ل 1500 نقطة', '#0A62C2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `achievement_users`
--
ALTER TABLE `achievement_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievement_users_achievement_id_foreign` (`achievement_id`),
  ADD KEY `achievement_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_name_index` (`name`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_name_index` (`name`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_coupon_type_id_foreign` (`coupon_type_id`);

--
-- Indexes for table `coupons_types`
--
ALTER TABLE `coupons_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons_users`
--
ALTER TABLE `coupons_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_users_user_id_foreign` (`user_id`),
  ADD KEY `coupons_users_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `coupon_prices`
--
ALTER TABLE `coupon_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_prices_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `delivery_attributes`
--
ALTER TABLE `delivery_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_methods`
--
ALTER TABLE `delivery_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_time_infos`
--
ALTER TABLE `delivery_time_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drivers_email_unique` (`email`),
  ADD KEY `drivers_city_id_foreign` (`city_id`),
  ADD KEY `drivers_email_index` (`email`),
  ADD KEY `drivers_phone_index` (`phone`);

--
-- Indexes for table `driver_types`
--
ALTER TABLE `driver_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_types_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorits`
--
ALTER TABLE `favorits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gifts_name_index` (`name`);

--
-- Indexes for table `home_page_dynamics`
--
ALTER TABLE `home_page_dynamics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_page_dynamic_contents`
--
ALTER TABLE `home_page_dynamic_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_page_dynamic_contents_home_page_dynamic_id_foreign` (`home_page_dynamic_id`),
  ADD KEY `home_page_dynamic_contents_product_id_foreign` (`product_id`),
  ADD KEY `home_page_dynamic_contents_category_id_foreign` (`category_id`),
  ADD KEY `home_page_dynamic_contents_banner_id_foreign` (`banner_id`);

--
-- Indexes for table `join_our_teams`
--
ALTER TABLE `join_our_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_delivery_method_id_foreign` (`delivery_method_id`),
  ADD KEY `orders_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `orders_user_address_id_foreign` (`user_address_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `orders_rate_attributes`
--
ALTER TABLE `orders_rate_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_rate_attributes_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_delivery_attributes`
--
ALTER TABLE `order_delivery_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_delivery_attributes_order_id_foreign` (`order_id`),
  ADD KEY `order_delivery_attributes_delivery_attribute_id_foreign` (`delivery_attribute_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `order_driver_acceptances`
--
ALTER TABLE `order_driver_acceptances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_driver_acceptances_order_id_foreign` (`order_id`),
  ADD KEY `order_driver_acceptances_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `o_t_p_s`
--
ALTER TABLE `o_t_p_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `point_in_pound`
--
ALTER TABLE `point_in_pound`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_slug_index` (`slug`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_related_product`
--
ALTER TABLE `product_related_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_related_product_product_id_foreign` (`product_id`),
  ADD KEY `product_related_product_related_product_id_foreign` (`related_product_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_user_id_foreign` (`user_id`),
  ADD KEY `purchases_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sellers_area_id_foreign` (`area_id`),
  ADD KEY `sellers_name_index` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`),
  ADD KEY `sub_categories_name_index` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_city_id_foreign` (`city_id`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_phone_index` (`phone`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_ranks`
--
ALTER TABLE `user_ranks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `achievement_users`
--
ALTER TABLE `achievement_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `coupons_types`
--
ALTER TABLE `coupons_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupons_users`
--
ALTER TABLE `coupons_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `coupon_prices`
--
ALTER TABLE `coupon_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `delivery_attributes`
--
ALTER TABLE `delivery_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery_methods`
--
ALTER TABLE `delivery_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `delivery_time_infos`
--
ALTER TABLE `delivery_time_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `driver_types`
--
ALTER TABLE `driver_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorits`
--
ALTER TABLE `favorits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `home_page_dynamics`
--
ALTER TABLE `home_page_dynamics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `home_page_dynamic_contents`
--
ALTER TABLE `home_page_dynamic_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `join_our_teams`
--
ALTER TABLE `join_our_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `orders_rate_attributes`
--
ALTER TABLE `orders_rate_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_delivery_attributes`
--
ALTER TABLE `order_delivery_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT for table `order_driver_acceptances`
--
ALTER TABLE `order_driver_acceptances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `o_t_p_s`
--
ALTER TABLE `o_t_p_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `point_in_pound`
--
ALTER TABLE `point_in_pound`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `product_related_product`
--
ALTER TABLE `product_related_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `user_ranks`
--
ALTER TABLE `user_ranks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_types`
--
ALTER TABLE `driver_types`
  ADD CONSTRAINT `driver_types_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `home_page_dynamic_contents`
--
ALTER TABLE `home_page_dynamic_contents`
  ADD CONSTRAINT `home_page_dynamic_contents_banner_id_foreign` FOREIGN KEY (`banner_id`) REFERENCES `banners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `home_page_dynamic_contents_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `home_page_dynamic_contents_home_page_dynamic_id_foreign` FOREIGN KEY (`home_page_dynamic_id`) REFERENCES `home_page_dynamics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `home_page_dynamic_contents_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_delivery_method_id_foreign` FOREIGN KEY (`delivery_method_id`) REFERENCES `delivery_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_address_id_foreign` FOREIGN KEY (`user_address_id`) REFERENCES `user_addresses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders_rate_attributes`
--
ALTER TABLE `orders_rate_attributes`
  ADD CONSTRAINT `orders_rate_attributes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_delivery_attributes`
--
ALTER TABLE `order_delivery_attributes`
  ADD CONSTRAINT `order_delivery_attributes_delivery_attribute_id_foreign` FOREIGN KEY (`delivery_attribute_id`) REFERENCES `delivery_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_delivery_attributes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_driver_acceptances`
--
ALTER TABLE `order_driver_acceptances`
  ADD CONSTRAINT `order_driver_acceptances_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_driver_acceptances_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_related_product`
--
ALTER TABLE `product_related_product`
  ADD CONSTRAINT `product_related_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_related_product_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
