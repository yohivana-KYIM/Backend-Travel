-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 29, 2023 at 11:47 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hh`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint UNSIGNED NOT NULL,
  `type_id` bigint UNSIGNED NOT NULL,
  `driving_license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `type_id`, `driving_license`, `created_at`, `updated_at`) VALUES
(1, 1, 'OAIuMprME2', '2023-12-18 19:12:17', '2023-12-18 19:12:17'),
(2, 1, 'AZ2RbCBLwo', '2023-12-18 19:12:20', '2023-12-18 19:12:20');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` bigint UNSIGNED NOT NULL,
  `matricule` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'actif',
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `matricule`, `photo`, `status`, `brand`, `model`, `seat`, `created_at`, `updated_at`) VALUES
(1, 'wwwwwwwwwww', 'eeeeeeee', 'actif', 'eeeeeeeeee', 'eeeeeeeee', 'eeeee', '2023-12-19 14:07:25', '2023-12-19 14:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_08_145108_create_types_table', 1),
(6, '2023_12_08_145206_create_students_table', 1),
(7, '2023_12_08_145218_create_agents_table', 1),
(8, '2023_12_08_150840_create_buses_table', 1),
(9, '2023_12_08_150854_create_routes_table', 1),
(10, '2023_12_08_150917_create_trajets_table', 1),
(11, '2023_12_08_154005_create_tickets_table', 1),
(12, '2023_12_08_154019_create_payments_table', 1);

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '9d1f9ced7a919dc49f826e06079d91be6812462bba1a41be0beffceed106ab03', '[\"*\"]', NULL, NULL, '2023-12-18 19:14:06', '2023-12-18 19:14:06'),
(2, 'App\\Models\\User', 1, 'auth_token', '0633ba51404e2bb74182e898441fdde816cdbae2f503a32e1565c70acff99a0d', '[\"*\"]', NULL, NULL, '2023-12-18 19:20:35', '2023-12-18 19:20:35'),
(3, 'App\\Models\\User', 1, 'auth_token', '9488230621ce89732bb1c4edcc7a7b9c0d007dec2c2150bd28f6403296c86b8f', '[\"*\"]', NULL, NULL, '2023-12-19 00:54:14', '2023-12-19 00:54:14'),
(4, 'App\\Models\\User', 1, 'auth_token', '68cc519e002eea6f7efb1bfc8de3396a7f69c68ccad56045f07136e9f5d196c9', '[\"*\"]', NULL, NULL, '2023-12-19 00:54:18', '2023-12-19 00:54:18'),
(5, 'App\\Models\\User', 1, 'auth_token', '4a4fc12fdf90587eeab6619953637455f2c56e6015d6ba04a9559e15ca5fc027', '[\"*\"]', NULL, NULL, '2023-12-19 00:54:23', '2023-12-19 00:54:23'),
(6, 'App\\Models\\User', 1, 'auth_token', 'dd28a630de12562cf4731836942c3a4d3a7583dd7d168f113f2e5de9c1a3193d', '[\"*\"]', NULL, NULL, '2023-12-19 00:54:25', '2023-12-19 00:54:25'),
(7, 'App\\Models\\User', 1, 'auth_token', '4c60022d2922839650e4b0a798f360c5374a7021776358dd1f81be822f859969', '[\"*\"]', '2023-12-19 00:55:55', NULL, '2023-12-19 00:54:27', '2023-12-19 00:55:55'),
(8, 'App\\Models\\User', 1, 'auth_token', 'c48f13a6d224f0cf72a7e34ed82a2cd58e8dc15b3fd0f3b165866ce68eea0e6b', '[\"*\"]', '2023-12-19 00:57:08', NULL, '2023-12-19 00:57:01', '2023-12-19 00:57:08'),
(9, 'App\\Models\\User', 1, 'auth_token', '3b6a9c5a73e1755999c7f50b78468223fb8d1d5473706d6e9336e7028ff36ce1', '[\"*\"]', '2023-12-19 01:00:43', NULL, '2023-12-19 01:00:34', '2023-12-19 01:00:43'),
(10, 'App\\Models\\User', 1, 'auth_token', '39aaf862d6191d635e379629cd9e39cdacecab385bf7721d981208c18ab6c45d', '[\"*\"]', '2023-12-19 01:01:25', NULL, '2023-12-19 01:01:21', '2023-12-19 01:01:25'),
(11, 'App\\Models\\User', 1, 'auth_token', '3252a7b4237d9388c2c76e6afe69935d81ce858e784a0e61fe905d680b3ae232', '[\"*\"]', NULL, NULL, '2023-12-19 01:03:07', '2023-12-19 01:03:07'),
(12, 'App\\Models\\User', 1, 'auth_token', '2086827f9e70ac5eb5e1bdeab770f32eb3f03668ac654df7705bd0aacc572db8', '[\"*\"]', NULL, NULL, '2023-12-19 01:03:09', '2023-12-19 01:03:09'),
(13, 'App\\Models\\User', 1, 'auth_token', '4df6ed7b47dd10e4c5b3f3b700e840a6b15f18653169af77efc5a7919f80daea', '[\"*\"]', NULL, NULL, '2023-12-19 01:03:12', '2023-12-19 01:03:12'),
(14, 'App\\Models\\User', 1, 'auth_token', 'e3610c610cc9325cdbac4a0acfdac3e1b59dd0b235e08aac4bca9e5e6313f92b', '[\"*\"]', '2023-12-19 01:05:17', NULL, '2023-12-19 01:03:14', '2023-12-19 01:05:17'),
(15, 'App\\Models\\User', 1, 'auth_token', '30850c9cadabfd8c124d067dea381a0daecedf1c94456b3ef48441f1a2ab3186', '[\"*\"]', NULL, NULL, '2023-12-19 01:05:43', '2023-12-19 01:05:43'),
(16, 'App\\Models\\User', 1, 'auth_token', 'dc2158e3bdc428f6448f317ac9c64b81d5e5d1ae98e0613b859ffc40699fc447', '[\"*\"]', '2023-12-19 01:06:34', NULL, '2023-12-19 01:05:46', '2023-12-19 01:06:34'),
(17, 'App\\Models\\User', 1, 'auth_token', 'afedff453793071dc921b06b60ad86ed09b37a5aa3bb5005a38ce3d76c604c88', '[\"*\"]', '2023-12-19 11:26:24', NULL, '2023-12-19 11:24:26', '2023-12-19 11:26:24'),
(18, 'App\\Models\\User', 1, 'auth_token', '42c389d508789233031c6448a257f3371efacb9ed2b282e50a1a04f498790e7c', '[\"*\"]', '2023-12-19 11:27:56', NULL, '2023-12-19 11:26:56', '2023-12-19 11:27:56'),
(19, 'App\\Models\\User', 1, 'auth_token', 'c1a1897826b80df2e73fa151242def3d19dd9b8a88b4c3e2dafe006d6d847549', '[\"*\"]', '2023-12-19 11:30:34', NULL, '2023-12-19 11:28:20', '2023-12-19 11:30:34'),
(20, 'App\\Models\\User', 1, 'auth_token', 'be6c6db5e411b460e5f74f7b24964dc1c67d8cc04f5bba188f38b991b56c51a9', '[\"*\"]', '2023-12-19 11:30:58', NULL, '2023-12-19 11:30:54', '2023-12-19 11:30:58'),
(21, 'App\\Models\\User', 1, 'auth_token', '4d7d827e8b95111f8b5e84ca0f99aaead793c809e317c855e9f213695878fcd8', '[\"*\"]', '2023-12-19 11:55:46', NULL, '2023-12-19 11:31:19', '2023-12-19 11:55:46'),
(22, 'App\\Models\\User', 1, 'auth_token', '1d944b3d19a8f82078e4f2efa309d356736c63dd5349d9dd8718678ced6a6068', '[\"*\"]', '2023-12-19 12:00:37', NULL, '2023-12-19 11:59:59', '2023-12-19 12:00:37'),
(23, 'App\\Models\\User', 1, 'auth_token', 'f111222176b8c1ea86d8d39cf12396d08694e527176138027c7802f1c90a91de', '[\"*\"]', '2023-12-19 12:04:47', NULL, '2023-12-19 12:03:53', '2023-12-19 12:04:47'),
(24, 'App\\Models\\User', 1, 'auth_token', '73d2a1e136b5569db66339b91b01387807ee83755f61a7000d61a47facca222a', '[\"*\"]', NULL, NULL, '2023-12-19 12:13:22', '2023-12-19 12:13:22'),
(25, 'App\\Models\\User', 1, 'auth_token', 'a0efe5d3a5151c72b8cba9442ee11d955624aee8d7ed3ae102a395cdc77e25b3', '[\"*\"]', NULL, NULL, '2023-12-19 12:16:19', '2023-12-19 12:16:19'),
(26, 'App\\Models\\User', 1, 'auth_token', 'c08d6877911ab036fdfa798bff34874d4543ea9f85ce8faa50e51c4e6c35a862', '[\"*\"]', NULL, NULL, '2023-12-19 12:21:09', '2023-12-19 12:21:09'),
(27, 'App\\Models\\User', 1, 'auth_token', '971a704df8ede676fe101c872ff6aed2b696917c398602029c510abf6f25ae02', '[\"*\"]', '2023-12-19 12:41:34', NULL, '2023-12-19 12:33:41', '2023-12-19 12:41:34'),
(28, 'App\\Models\\User', 1, 'auth_token', '0709d8d3de8ecfb361b3f5df8b7f68a7e016f5a9e827619b3717ffec066c4131', '[\"*\"]', '2023-12-19 12:55:23', NULL, '2023-12-19 12:42:53', '2023-12-19 12:55:23'),
(29, 'App\\Models\\User', 1, 'auth_token', '8a9c4cb162d14bc50d21d684b1000c132a7817d54c935b93b85bd3704e54720b', '[\"*\"]', '2023-12-19 13:04:29', NULL, '2023-12-19 12:57:42', '2023-12-19 13:04:29'),
(30, 'App\\Models\\User', 1, 'auth_token', '20176b0bb1c96edae29a68edc9d51e894a4908a5bec7cf49e3201802c03600cb', '[\"*\"]', '2023-12-19 13:08:12', NULL, '2023-12-19 13:05:08', '2023-12-19 13:08:12'),
(31, 'App\\Models\\User', 1, 'auth_token', '8af763db83e4b8c19c16b6fd58aabd33e9265e7c0a378044bf4ef0b195574053', '[\"*\"]', '2023-12-19 13:29:26', NULL, '2023-12-19 13:27:46', '2023-12-19 13:29:26'),
(32, 'App\\Models\\User', 1, 'auth_token', '898eadd2e13697aecf0e7a7934a33e3b28aee8a86ebd9c7207a1ff1f7e0bf3f0', '[\"*\"]', '2023-12-19 13:30:36', NULL, '2023-12-19 13:29:46', '2023-12-19 13:30:36'),
(33, 'App\\Models\\User', 1, 'auth_token', '4fd04438a54012b419e1afb4d687195fa96a9b8f165239f620010baf026561a6', '[\"*\"]', NULL, NULL, '2023-12-19 13:31:07', '2023-12-19 13:31:07'),
(34, 'App\\Models\\User', 1, 'auth_token', '0a8b5a367e993bd6a32f900907f00fcc3a0acd75622982d1e7b42d9f3591201a', '[\"*\"]', '2023-12-19 13:32:25', NULL, '2023-12-19 13:31:08', '2023-12-19 13:32:25'),
(35, 'App\\Models\\User', 1, 'auth_token', '312413006980871aa016fe4250af8e0adcdbc6c7c0b639ddd1e2e6bfd0d0e2cb', '[\"*\"]', '2023-12-19 13:33:25', NULL, '2023-12-19 13:32:47', '2023-12-19 13:33:25'),
(36, 'App\\Models\\User', 1, 'auth_token', '1284267147c7c4cfc50dc0e61e8e8278a311d84fcd19ed7ccce353bf8b0f4215', '[\"*\"]', '2023-12-19 13:34:15', NULL, '2023-12-19 13:34:05', '2023-12-19 13:34:15'),
(37, 'App\\Models\\User', 1, 'auth_token', '13cb096b46c1061a55338af09114b925b40d2bef7cb381fd46e3bc6c0fb5a05e', '[\"*\"]', '2023-12-19 13:35:46', NULL, '2023-12-19 13:34:53', '2023-12-19 13:35:46'),
(38, 'App\\Models\\User', 1, 'auth_token', '3cbfd1e78d1cb6dff34ec0b4f714cd832614680bc580bc5c7dba904c017dd3df', '[\"*\"]', NULL, NULL, '2023-12-19 13:41:17', '2023-12-19 13:41:17'),
(39, 'App\\Models\\User', 1, 'auth_token', '0d9961ee87a9bd28ffa1a98376f6306ce3d1bf261e574226dfebf8c449dcf835', '[\"*\"]', '2023-12-19 13:41:56', NULL, '2023-12-19 13:41:22', '2023-12-19 13:41:56'),
(40, 'App\\Models\\User', 1, 'auth_token', 'f9deb19d1a5242210b675d20255287e1e612f04e7a0747a0f0566dac85aa7fea', '[\"*\"]', '2023-12-19 13:44:14', NULL, '2023-12-19 13:43:59', '2023-12-19 13:44:14'),
(41, 'App\\Models\\User', 1, 'auth_token', '9b9b2ac62ec48a9870c1a8d1e760f34a1979841cecdca03ca511ba4128e3d7f9', '[\"*\"]', '2023-12-19 13:47:18', NULL, '2023-12-19 13:44:58', '2023-12-19 13:47:18'),
(42, 'App\\Models\\User', 1, 'auth_token', '82a9504330131c75f9e7a0461ecda4e4122eec9c7f33eb30fb11d5441405c645', '[\"*\"]', '2023-12-19 13:48:43', NULL, '2023-12-19 13:48:39', '2023-12-19 13:48:43'),
(43, 'App\\Models\\User', 1, 'auth_token', 'a3d9b3cec016eacd97c7ae67b829bb35c9a4b33e3b20239c896415fd3724586a', '[\"*\"]', '2023-12-19 14:00:24', NULL, '2023-12-19 13:49:13', '2023-12-19 14:00:24'),
(44, 'App\\Models\\User', 1, 'auth_token', '2227572829e3aecc1c8ae64cf2ed72b4513295478028621e8100c0ad93b0faaa', '[\"*\"]', '2023-12-19 14:19:53', NULL, '2023-12-19 14:18:54', '2023-12-19 14:19:53'),
(45, 'App\\Models\\User', 1, 'auth_token', 'ac1de9c1fd0b4937c1e7fb74f78931f2ac3247b52fa13a5ef26350e3882fe08b', '[\"*\"]', '2023-12-19 14:22:30', NULL, '2023-12-19 14:20:47', '2023-12-19 14:22:30'),
(46, 'App\\Models\\User', 1, 'auth_token', '9f8b7be484bbbd5ff28eda31d0143ab212decedbe99426107a0488fc68640d95', '[\"*\"]', '2023-12-19 15:09:17', NULL, '2023-12-19 15:09:00', '2023-12-19 15:09:17'),
(47, 'App\\Models\\User', 1, 'auth_token', 'eca2febf779c88beff4f7415759ea3a14cfcbbb3ccf0ecda081d0e88448c43fd', '[\"*\"]', '2023-12-19 16:27:05', NULL, '2023-12-19 16:26:51', '2023-12-19 16:27:05'),
(48, 'App\\Models\\User', 1, 'auth_token', '3b28334285a8bf840abc38680f13555ae731aaf21a399ec92ada431b87b797d8', '[\"*\"]', '2023-12-19 16:35:19', NULL, '2023-12-19 16:35:05', '2023-12-19 16:35:19'),
(49, 'App\\Models\\User', 1, 'auth_token', '0d3e85b5437f5f8743f63b22aa303d596c62f2fa09811d57ff1c3a8816b4efe9', '[\"*\"]', '2023-12-19 16:35:39', NULL, '2023-12-19 16:35:35', '2023-12-19 16:35:39'),
(50, 'App\\Models\\User', 1, 'auth_token', '8a52db85b6cf44931555463b3bffd057ec86c905fbcd37d605913ec3d93ef646', '[\"*\"]', NULL, NULL, '2023-12-19 16:36:01', '2023-12-19 16:36:01'),
(51, 'App\\Models\\User', 1, 'auth_token', '0af6d8b7c2b8a1f47b303a9be0d15f5e857e54455b748e3eba282dedf28f88ab', '[\"*\"]', '2023-12-19 16:47:41', NULL, '2023-12-19 16:40:49', '2023-12-19 16:47:41'),
(52, 'App\\Models\\User', 1, 'auth_token', 'f738d59ac66cfed8dd25e88df0502db53678e8e19f534d913c9ec6b415361ee8', '[\"*\"]', '2023-12-19 16:48:03', NULL, '2023-12-19 16:47:55', '2023-12-19 16:48:03'),
(53, 'App\\Models\\User', 1, 'auth_token', '4a4a9a39822c08641069258b58a12694674a96010eb7e3862bf135ef85da09d9', '[\"*\"]', '2023-12-19 20:47:37', NULL, '2023-12-19 20:47:35', '2023-12-19 20:47:37'),
(54, 'App\\Models\\User', 1, 'auth_token', '8158340700e11f6492efdd60b4e2cfb1de2f77deb44282867011f8bf3a0b6a90', '[\"*\"]', '2023-12-19 20:47:57', NULL, '2023-12-19 20:47:56', '2023-12-19 20:47:57'),
(55, 'App\\Models\\User', 1, 'auth_token', '36f1995e0c30f2711f7812bc9d75fa939d9a574ea42eb9cd6bc01facb703ef5d', '[\"*\"]', NULL, NULL, '2023-12-19 21:13:30', '2023-12-19 21:13:30'),
(56, 'App\\Models\\User', 1, 'auth_token', 'e6150a7ba32bbe7442d544e047e1750573d8b1a6aec1a75ef7a75139a0c461b1', '[\"*\"]', '2023-12-19 21:29:59', NULL, '2023-12-19 21:29:50', '2023-12-19 21:29:59'),
(57, 'App\\Models\\User', 1, 'auth_token', '4f45d7fb47057ef9a1786f7503ec0ea407e8c25c589be1b1fcaa091972ab7467', '[\"*\"]', NULL, NULL, '2023-12-19 21:35:42', '2023-12-19 21:35:42'),
(58, 'App\\Models\\User', 1, 'auth_token', '055661523ace58ea54ed0d17297079ff3d5e1d247a024386bb286571d1b17030', '[\"*\"]', '2023-12-19 21:37:47', NULL, '2023-12-19 21:36:43', '2023-12-19 21:37:47'),
(59, 'App\\Models\\User', 1, 'auth_token', 'b13c47c7d68c7ad4bcaa6e1cb2a274abb6943a9eb836b125ebfd1d6df62ca15c', '[\"*\"]', '2023-12-19 21:38:18', NULL, '2023-12-19 21:38:11', '2023-12-19 21:38:18'),
(60, 'App\\Models\\User', 1, 'auth_token', 'f59e9da772cbc9dd17efc8e72bce34a9cec42d0d5918334f8653fafc0bf9a77d', '[\"*\"]', '2023-12-19 21:48:54', NULL, '2023-12-19 21:41:55', '2023-12-19 21:48:54'),
(61, 'App\\Models\\User', 1, 'auth_token', '8a2034b0c07847cf5bbe489f6452aee960954a509a311dfa73c9755864ef0ee0', '[\"*\"]', NULL, NULL, '2023-12-19 22:18:23', '2023-12-19 22:18:23'),
(62, 'App\\Models\\User', 1, 'auth_token', '0e85683599f5f6b00b0041f95591e81a8c940bd9b516981d28bad4cf3273c35d', '[\"*\"]', '2023-12-19 22:22:05', NULL, '2023-12-19 22:19:48', '2023-12-19 22:22:05'),
(63, 'App\\Models\\User', 1, 'auth_token', '1baf25b18917a74861e1dcfb31954ddb6f92ab641fefae9de37ac50dfe2f6d2b', '[\"*\"]', '2023-12-19 22:26:34', NULL, '2023-12-19 22:26:30', '2023-12-19 22:26:34'),
(64, 'App\\Models\\User', 1, 'auth_token', '5f24e696e8a96d9444e845e9bbe1ef7a0b26d69069c6ec4e27dc9855d61ec668', '[\"*\"]', '2023-12-19 22:32:40', NULL, '2023-12-19 22:27:23', '2023-12-19 22:32:40'),
(65, 'App\\Models\\User', 1, 'auth_token', '8e7931a03a60a695d9fff1081ee6694e1d6d5a13a5ab5db18f46fed6f59f8ffd', '[\"*\"]', '2023-12-19 22:35:32', NULL, '2023-12-19 22:33:34', '2023-12-19 22:35:32'),
(66, 'App\\Models\\User', 1, 'auth_token', 'ea58582c46b4765c115f2e44d9cdb052b018a749173befa17e7b908dca139b14', '[\"*\"]', NULL, NULL, '2023-12-19 22:35:58', '2023-12-19 22:35:58'),
(67, 'App\\Models\\User', 1, 'auth_token', 'b3e372c2cede4d86f3b8b6beb8e942abfefeb3a94432516fa8a1028c60178874', '[\"*\"]', '2023-12-19 22:45:09', NULL, '2023-12-19 22:45:03', '2023-12-19 22:45:09'),
(68, 'App\\Models\\User', 1, 'auth_token', '96c1d21189dd1d2628a737391f90c6a96110950afd12e026812e38a6d6583592', '[\"*\"]', NULL, NULL, '2023-12-19 22:45:38', '2023-12-19 22:45:38'),
(69, 'App\\Models\\User', 1, 'auth_token', 'a63fcd8ba7625ff064055a952b6db11c74c5d50e5d91c4c070dfa85ec9ed6b1c', '[\"*\"]', NULL, NULL, '2023-12-19 22:45:58', '2023-12-19 22:45:58'),
(70, 'App\\Models\\User', 1, 'auth_token', '3ff69714eaa0212ab8f5f0fad98c5fd1c7a6288f24ab06445f5071c5899137fe', '[\"*\"]', '2023-12-19 22:50:59', NULL, '2023-12-19 22:46:00', '2023-12-19 22:50:59'),
(71, 'App\\Models\\User', 1, 'auth_token', '7305cf8c0ffc745636c2d8de4a2fff259ecb898a1fe334768a172c94d070aa60', '[\"*\"]', '2023-12-19 23:00:26', NULL, '2023-12-19 22:52:11', '2023-12-19 23:00:26'),
(72, 'App\\Models\\User', 1, 'auth_token', '9d75f50d858036d9db5b3bd1851f03b9fda751abe07c8b095e1d2af9e18ae5bd', '[\"*\"]', NULL, NULL, '2023-12-19 23:03:48', '2023-12-19 23:03:48'),
(73, 'App\\Models\\User', 1, 'auth_token', '6e04ed5355f7f00d071cf66b5db171ee0066cf88298b40f54f5b60e600c0edcf', '[\"*\"]', '2023-12-19 23:12:35', NULL, '2023-12-19 23:03:51', '2023-12-19 23:12:35'),
(74, 'App\\Models\\User', 1, 'auth_token', 'ebbbde27a90779708026639786be5853d6e17d056e1b85db27604fbcd98fbd69', '[\"*\"]', '2023-12-19 23:24:25', NULL, '2023-12-19 23:13:40', '2023-12-19 23:24:25'),
(75, 'App\\Models\\User', 1, 'auth_token', 'ecb86ccdbef09662342887dacad6600e41548c6877dd1d9b785cfa5af07ae104', '[\"*\"]', NULL, NULL, '2023-12-19 23:28:05', '2023-12-19 23:28:05'),
(76, 'App\\Models\\User', 1, 'auth_token', '0c75d679269c74b53fc7f4d1fe616ae70b70ec0ea88b63ef2e1eaeb04a48a23a', '[\"*\"]', NULL, NULL, '2023-12-19 23:29:59', '2023-12-19 23:29:59'),
(77, 'App\\Models\\User', 1, 'auth_token', '261fc5c9858e1ecb6e52d3d047fda3e7c3d005d67d57a603dfe9310a0697b3b7', '[\"*\"]', '2023-12-19 23:57:37', NULL, '2023-12-19 23:32:58', '2023-12-19 23:57:37'),
(78, 'App\\Models\\User', 1, 'auth_token', '84b1c30e8642537e63614b2650d1ecc8c935ae111107cb002d93c36d780912ed', '[\"*\"]', '2023-12-20 00:32:21', NULL, '2023-12-20 00:18:30', '2023-12-20 00:32:21'),
(79, 'App\\Models\\User', 1, 'auth_token', 'ec1a6a6b21162e715ad77b70aedcdd0386f8bd22e6df8c7c0b25a2832ffcd026', '[\"*\"]', '2023-12-20 00:33:26', NULL, '2023-12-20 00:33:20', '2023-12-20 00:33:26'),
(80, 'App\\Models\\User', 1, 'auth_token', '1552d6c9c549c5ab06187e904767d79ce95e9244860ff2726babc9f967854e66', '[\"*\"]', '2023-12-20 01:09:27', NULL, '2023-12-20 01:05:07', '2023-12-20 01:09:27'),
(81, 'App\\Models\\User', 1, 'auth_token', 'dbf4dd089477e68015d8b01bc9092f57a43e64fe83d60cd20e5752f66f3b90a6', '[\"*\"]', '2023-12-20 05:36:28', NULL, '2023-12-20 01:09:50', '2023-12-20 05:36:28'),
(82, 'App\\Models\\User', 1, 'auth_token', 'b7917903160536e173956df2a351166d574d2f1c90ddb096aa3f36acb607da98', '[\"*\"]', '2023-12-20 05:39:43', NULL, '2023-12-20 05:37:51', '2023-12-20 05:39:43'),
(83, 'App\\Models\\User', 1, 'auth_token', '1f38266e8a782d9a04d27a3e8b831e817222260e80e2e0a0bbc068e26bc1652e', '[\"*\"]', '2023-12-20 06:24:06', NULL, '2023-12-20 06:19:24', '2023-12-20 06:24:06'),
(84, 'App\\Models\\User', 1, 'auth_token', '335667863cf31ff833af5f860c604762016a26d530522d4f41df85fc4e1a6694', '[\"*\"]', '2023-12-20 06:35:09', NULL, '2023-12-20 06:27:11', '2023-12-20 06:35:09'),
(85, 'App\\Models\\User', 1, 'auth_token', 'd5f20ded5fa2fe4ca11caf895376512bbbce9cf76d56bec162f112e2c5b87773', '[\"*\"]', '2023-12-20 06:43:01', NULL, '2023-12-20 06:36:26', '2023-12-20 06:43:01'),
(86, 'App\\Models\\User', 1, 'auth_token', 'af7051e8d7a270ba831c20fc8bc6ae67c816bdf59b6f333e3c5190d50ed514dc', '[\"*\"]', '2023-12-20 08:13:55', NULL, '2023-12-20 08:12:34', '2023-12-20 08:13:55'),
(87, 'App\\Models\\User', 1, 'auth_token', 'c3664d00d38e672750be5d7d8fad4572839259e55876eaaceb7984b06519f229', '[\"*\"]', NULL, NULL, '2023-12-20 14:17:20', '2023-12-20 14:17:20'),
(88, 'App\\Models\\User', 1, 'auth_token', 'a92fdb2680edd5299a1dfab250c25db85f4a1409e43d29ba9300c29556fb3fec', '[\"*\"]', '2023-12-20 14:17:31', NULL, '2023-12-20 14:17:22', '2023-12-20 14:17:31'),
(89, 'App\\Models\\User', 1, 'auth_token', '472e15402ad1100e68acbb0a46bfdd53fae8484d66f2f09a8d55a28df80b7b8b', '[\"*\"]', '2023-12-20 14:35:42', NULL, '2023-12-20 14:26:37', '2023-12-20 14:35:42'),
(90, 'App\\Models\\User', 1, 'auth_token', '23ad46b09a3c293c04b9422de8f6c616fa30769edebf08fd867d9413eddeb2f4', '[\"*\"]', '2023-12-20 15:00:25', NULL, '2023-12-20 14:45:28', '2023-12-20 15:00:25'),
(91, 'App\\Models\\User', 1, 'auth_token', '538c5f4116e7c4abb716f1590ec0967f51aa49924f36af1f3ec6d01118016942', '[\"*\"]', '2023-12-20 17:49:39', NULL, '2023-12-20 17:37:37', '2023-12-20 17:49:39'),
(92, 'App\\Models\\User', 1, 'auth_token', 'e5b3048a041d4046ebc3a93443b4abf77f7a26a2f713bf992fd3a9ab6b72ae91', '[\"*\"]', '2023-12-20 18:16:57', NULL, '2023-12-20 17:49:56', '2023-12-20 18:16:57'),
(93, 'App\\Models\\User', 1, 'auth_token', '520f0fef1bc31ea4124a4f0952f9a30d8dda59006881b39df4f20a1e3c3b8bde', '[\"*\"]', '2023-12-26 07:39:44', NULL, '2023-12-26 07:27:23', '2023-12-26 07:39:44'),
(94, 'App\\Models\\User', 1, 'auth_token', 'f3a9beacc5cffb8c6d80970c130281278781aa199c4091dcae9ec87d7ae31191', '[\"*\"]', '2023-12-26 08:02:09', NULL, '2023-12-26 08:02:02', '2023-12-26 08:02:09'),
(95, 'App\\Models\\User', 1, 'auth_token', '57be40a1494fe44809563cfc5846f3d16e98e538d44697632fb94e28392b189c', '[\"*\"]', '2023-12-26 08:19:25', NULL, '2023-12-26 08:04:48', '2023-12-26 08:19:25'),
(96, 'App\\Models\\User', 1, 'auth_token', 'd7fe71789b2628ec43c6d5da3437ab77b9284caa90bc5b13e81155fc7d7b5a9d', '[\"*\"]', '2023-12-26 08:20:34', NULL, '2023-12-26 08:20:17', '2023-12-26 08:20:34'),
(97, 'App\\Models\\User', 1, 'auth_token', '871f5d32f2d94193a5c4adb3ba208c0be5d489ad4268f8bf4e26c33c7dc00305', '[\"*\"]', NULL, NULL, '2023-12-26 08:27:57', '2023-12-26 08:27:57'),
(98, 'App\\Models\\User', 1, 'auth_token', '43970fbc73d5ccefbcff4801edaf60e870f8bd5121af541dfb0f7cd5cc4250d1', '[\"*\"]', NULL, NULL, '2023-12-26 08:28:09', '2023-12-26 08:28:09'),
(99, 'App\\Models\\User', 1, 'auth_token', '9f9d445097c19b99209a00a9de8c6577206308973dc52677fa1f12d019798ad0', '[\"*\"]', NULL, NULL, '2023-12-26 08:31:10', '2023-12-26 08:31:10'),
(100, 'App\\Models\\User', 1, 'auth_token', '9c02530572fa9bba58924d6622fbad4393c0a8f16da525617f7faf1b7f19b922', '[\"*\"]', NULL, NULL, '2023-12-26 08:31:18', '2023-12-26 08:31:18'),
(101, 'App\\Models\\User', 1, 'auth_token', '2906e4014c9296258343e5034720b35c85a1ef5a59bb8a4bcac910466549e48e', '[\"*\"]', '2023-12-26 09:18:59', NULL, '2023-12-26 08:40:25', '2023-12-26 09:18:59'),
(102, 'App\\Models\\User', 1, 'auth_token', '083f98b2ab49752f2c420e9835f0e2e314b0e227c1bf9977852d7bf126b7844a', '[\"*\"]', '2023-12-26 09:21:16', NULL, '2023-12-26 09:19:29', '2023-12-26 09:21:16'),
(103, 'App\\Models\\User', 1, 'auth_token', 'ce8f4c7bfd15db9c5e9ba56396db0611f87d7d648f4077331bc5d3dcfc680cd0', '[\"*\"]', '2023-12-26 09:25:30', NULL, '2023-12-26 09:21:37', '2023-12-26 09:25:30'),
(110, 'App\\Models\\User', 1, 'auth_token', '79a54b6794dca143b7e558fdad66b31b0b5cd80d2ebfe3f6e976a37fee3d5a0e', '[\"*\"]', '2023-12-26 19:02:04', NULL, '2023-12-26 17:05:09', '2023-12-26 19:02:04'),
(113, 'App\\Models\\User', 1, 'auth_token', 'ce92ddc0c39c91c981785769ad791087960c9b50613a88f40fa3378ffc813f51', '[\"*\"]', '2023-12-27 08:38:21', NULL, '2023-12-27 08:36:38', '2023-12-27 08:38:21'),
(114, 'App\\Models\\User', 1, 'auth_token', '67ed062b12582b51aa171052c6a4b174aa5caff1f82b4d576f491cf99e49a284', '[\"*\"]', '2023-12-29 09:05:21', NULL, '2023-12-29 08:53:15', '2023-12-29 09:05:21');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `name`, `from`, `to`, `cost`, `created_at`, `updated_at`) VALUES
(10, 'ccccccccccc', 'ggfff', 'ffff', 200.00, '2023-12-26 18:34:48', '2023-12-26 18:34:48'),
(12, 'ctyic', 'jjkk', 'dd', 200.00, '2023-12-26 18:51:52', '2023-12-26 18:51:52');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `matricule` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `matricule`, `created_at`, `updated_at`) VALUES
(1, 'KBKPZgA48t', '2023-12-18 19:12:23', '2023-12-18 19:12:23'),
(2, '21Ge8V0M37', '2023-12-18 19:12:25', '2023-12-18 19:12:25'),
(3, 'pC6I1gpPc6', '2023-12-18 19:12:26', '2023-12-18 19:12:26'),
(4, 'Gi2dGjqH6T', '2023-12-18 19:12:31', '2023-12-18 19:12:31'),
(5, 'CzBDd8t7Ss', '2023-12-18 19:12:35', '2023-12-18 19:12:35'),
(6, '455ggvv', '2023-12-19 09:46:25', '2023-12-19 09:46:25'),
(7, '455ggvevi', '2023-12-19 09:48:07', '2023-12-19 09:48:07'),
(8, '455ggvevio', '2023-12-19 09:48:48', '2023-12-19 09:48:48'),
(9, 'dddve4', '2023-12-19 10:25:59', '2023-12-19 10:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trajet_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trajets`
--

CREATE TABLE `trajets` (
  `id` bigint UNSIGNED NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` timestamp NOT NULL,
  `end` timestamp NOT NULL,
  `status` int NOT NULL,
  `route_id` bigint UNSIGNED NOT NULL,
  `bus_id` bigint UNSIGNED NOT NULL,
  `agent_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-12-18 19:12:17', '2023-12-18 19:12:17'),
(5, 'chauffeur', '2023-12-27 08:38:21', '2023-12-27 08:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `userable_id` bigint UNSIGNED NOT NULL,
  `userable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `phone`, `address`, `email`, `email_verified_at`, `password`, `image`, `active`, `userable_id`, `userable_type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dariana', 'Cassin', 'Mr.', '+1.986.380.0142', '82222 Rutherford Coves Apt. 589\nConnfurt, HI 61990-4331', 'novella.cartwright@example.net', '2023-12-18 19:12:17', '$2y$12$cmPJ.D3jjRAax2luxA.gk.ATilu5Kkn/lH5MwfPU6nO4daEwlePqW', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\a5354d14dd5f91b12139a0bacc0ff53a.png', 1, 1, 'App\\Models\\Agent', 'C2STc6deWi', '2023-12-18 19:12:20', '2023-12-18 19:12:20'),
(2, 'Loma', 'Wisoky', 'Prof.', '1-661-768-5613', '4420 Maryjane Crest\nWest Malvinaburgh, WA 14294', 'schumm.nola@example.net', '2023-12-18 19:12:20', '$2y$12$lK5LECkh/aPIyPuXJgyt2eM9Y.c9v7048VUlwE0K2mc4gL8QB1DAa', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\dc76bc0190d4512ab974b9883d27e334.png', 0, 2, 'App\\Models\\Agent', '5NR1kct7pd', '2023-12-18 19:12:23', '2023-12-18 19:12:23'),
(3, 'Abigayle', 'Cremin', 'Prof.', '785-609-0472', '4334 Janae Station Suite 672\nSouth Leolamouth, VT 60691-6552', 'xborer@example.net', '2023-12-18 19:12:23', '$2y$12$P4iuKr5sPl78pdUH0NVEqeL0KCxRVgvjrePwSOfy60Qj35wLKJqGO', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\cc859fa3971b07beb3fcc82df3754956.png', 0, 1, 'App\\Models\\Student', 'QD97JDKORF', '2023-12-18 19:12:25', '2023-12-18 19:12:25'),
(4, 'Jude', 'Moore', 'Ms.', '+1 (815) 313-9311', '7105 Ron Crossing\nLake Eleazar, DE 03386-7844', 'lborer@example.org', '2023-12-18 19:12:25', '$2y$12$N6yq5ypZUAsTPbi4CN37tObxenCFlrn2B8M3gqOxNLZK26WRpCRzW', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\b744303d6c44ea6715d7519cefb56d76.png', 0, 2, 'App\\Models\\Student', 'iNGOFw1cV8', '2023-12-18 19:12:26', '2023-12-18 19:12:26'),
(5, 'Kylee', 'Herman', 'Mr.', '+1-858-490-2304', '646 Sanford Summit Apt. 554\nNew Josiahport, GA 64466-3547', 'ckozey@example.net', '2023-12-18 19:12:27', '$2y$12$g7v/Pb7u2XTK53g5zLtgVeXrmPw1wtL5aeW6Si.pdkgryVpbbd0vy', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\d5b79fc0b08710a552004d13de827cac.png', 0, 3, 'App\\Models\\Student', 'zwrnT5mJd2', '2023-12-18 19:12:31', '2023-12-18 19:12:31'),
(6, 'Maida', 'Ledner', 'Mr.', '937.509.1428', '96946 Parker Row Apt. 367\nNorth Harmonyshire, HI 42044-9600', 'oconnell.glenna@example.com', '2023-12-18 19:12:31', '$2y$12$Pgcf0pi0m/hh03/7nyyYjenF7eslKT2jHOVF.x96FIu2/c0vnI5TW', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\d49495f038595951e0f39941f73ddc8a.png', 0, 4, 'App\\Models\\Student', 'HA4d2TRqXW', '2023-12-18 19:12:35', '2023-12-18 19:12:35'),
(7, 'Faustino', 'Kilback', 'Dr.', '+12529822055', '7056 Labadie Spring Suite 953\nClintshire, DE 93206-1221', 'rprosacco@example.com', '2023-12-18 19:12:35', '$2y$12$RTPFBGpW0./eFEinpz0kU.A53.TDjj2ORxykCNndkp45gS.4ghF.C', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\d7d4f1d39977dbf7ee0dfbfd7eeb6ded.png', 1, 5, 'App\\Models\\Student', 'Uz1aTTrR4h', '2023-12-18 19:12:37', '2023-12-18 19:12:37'),
(8, 'dddddddd', 'dddddddddd', NULL, '45677788888', NULL, 'yohivanag794@gmail.com', NULL, '$2y$12$kLXk4CuexR9q6LUeA.EAEOreAXSnnhG4JfjhqWUKfX2UBZxnEvkoW', NULL, 1, 6, 'App\\Models\\Student', NULL, '2023-12-19 09:46:35', '2023-12-19 09:46:35'),
(9, 'dddddddd', 'dddddddddd', NULL, '77788888999', NULL, 'yohivanag79g4@gmail.com', NULL, '$2y$12$E01vKkGIKNbCyiwbnu0QR.gNoW3qAlay.PsCHpb58U/31viMNVgHq', NULL, 1, 7, 'App\\Models\\Student', NULL, '2023-12-19 09:48:07', '2023-12-19 09:48:07'),
(10, 'dddddddd', 'dddddddddd', NULL, '77798888999', NULL, 'yohiva79g4@gmail.com', NULL, '$2y$12$bWPQNLzmx5BcM3gVd/2ZpufmHMJFQvWGlpClwm9nMEoNCS22tS3fG', NULL, 1, 8, 'App\\Models\\Student', NULL, '2023-12-19 09:48:48', '2023-12-19 09:48:48'),
(11, 'ffff', 'fggg', NULL, '5678909875', NULL, 'g.may@example.org', NULL, '$2y$12$Zvj1XwmECsON6BjbAg04E.VvvMzN5.FeOW1Kpd2Mx8SvWVoOHLXHm', NULL, 1, 9, 'App\\Models\\Student', NULL, '2023-12-19 10:26:00', '2023-12-19 10:26:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agents_type_id_foreign` (`type_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buses_matricule_unique` (`matricule`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD UNIQUE KEY `password_reset_tokens_email_unique` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_ticket_id_foreign` (`ticket_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_trajet_id_foreign` (`trajet_id`),
  ADD KEY `tickets_student_id_foreign` (`student_id`);

--
-- Indexes for table `trajets`
--
ALTER TABLE `trajets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trajets_route_id_foreign` (`route_id`),
  ADD KEY `trajets_bus_id_foreign` (`bus_id`),
  ADD KEY `trajets_agent_id_foreign` (`agent_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trajets`
--
ALTER TABLE `trajets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agents`
--
ALTER TABLE `agents`
  ADD CONSTRAINT `agents_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_trajet_id_foreign` FOREIGN KEY (`trajet_id`) REFERENCES `trajets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trajets`
--
ALTER TABLE `trajets`
  ADD CONSTRAINT `trajets_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trajets_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trajets_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
