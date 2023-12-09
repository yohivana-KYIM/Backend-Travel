-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 09, 2023 at 12:07 AM
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
(1, 1, 'BzFXPc6tiW', '2023-12-08 22:32:25', '2023-12-08 22:32:25'),
(2, 1, 'LCjMhA7y6S', '2023-12-08 22:32:31', '2023-12-08 22:32:31'),
(3, 2, 'jkkkkkkkkkkkkkk', '2023-12-08 23:56:10', '2023-12-08 23:56:10');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` bigint UNSIGNED NOT NULL,
  `matricule` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'App\\Models\\User', 10, 'auth_token', '6d6ca5024f70a3c2d76e292bf2a04a4e83d4196ba8ef7b96576aac33ad270e70', '[\"*\"]', NULL, NULL, '2023-12-08 22:41:22', '2023-12-08 22:41:22'),
(2, 'App\\Models\\User', 10, 'auth_token', 'cfa528d211e12bfd76f0bef8c18955ceb51620ea1d3422328a78ae9bc64f4c7e', '[\"*\"]', NULL, NULL, '2023-12-08 22:41:33', '2023-12-08 22:41:33'),
(3, 'App\\Models\\User', 10, 'auth_token', 'e448ccb4716bdbc7dc03c2096ddca9927bb06c0ea2a35e827b883001450e6212', '[\"*\"]', NULL, NULL, '2023-12-08 22:41:37', '2023-12-08 22:41:37'),
(4, 'App\\Models\\User', 2, 'auth_token', '3fcce0b97af67cdb180a803e400904148489971020356707891cd134e7e5711a', '[\"*\"]', '2023-12-08 23:00:59', NULL, '2023-12-08 22:44:01', '2023-12-08 23:00:59');

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
(1, 'tGRpA6Ni0r', '2023-12-08 22:32:36', '2023-12-08 22:32:36'),
(2, 'ihzLbKkvgg', '2023-12-08 22:32:40', '2023-12-08 22:32:40'),
(3, 'zAWS37AVYq', '2023-12-08 22:32:42', '2023-12-08 22:32:42'),
(4, 'm837O9HBFY', '2023-12-08 22:32:44', '2023-12-08 22:32:44'),
(5, 'mJTV85P5bi', '2023-12-08 22:32:46', '2023-12-08 22:32:46'),
(6, '123456788', '2023-12-08 22:33:47', '2023-12-08 22:33:47'),
(7, '123499999', '2023-12-08 22:35:13', '2023-12-08 22:35:13'),
(8, '1234lopl', '2023-12-08 22:39:32', '2023-12-08 22:39:32');

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
(1, 'admin', '2023-12-08 22:32:25', '2023-12-08 22:32:25'),
(2, 'chauffeur', '2023-12-08 23:50:09', '2023-12-08 23:50:09'),
(3, 'uuuuuuuuuu', '2023-12-06 23:57:17', '2023-12-08 23:57:17'),
(4, 'hjjjjlllllllll', '2023-12-09 00:00:16', '2023-12-10 00:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'Orville', 'Rowe', 'Prof.', '(620) 744-9918', '638 Lynch Groves\nLake Janiyaton, MD 07117', 'goldner.katelin@example.com', '2023-12-08 22:32:25', '$2y$12$O07y2/YXOR3RftwJAayQV.2CAoGe/nOGdF2My2ayi/viomu5uzvoS', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\c2df4a863af23b7261bfa4a81dbfc14a.png', 0, 1, 'App\\Models\\Agent', 'OhnoQ6Kxb4', '2023-12-08 22:32:31', '2023-12-08 22:32:31'),
(2, 'Christopher', 'Brekke', 'Prof.', '+1 (445) 639-2973', '948 Bahringer Inlet\nSouth Jarretstad, RI 16275-2562', 'rlesch@example.net', '2023-12-08 22:32:31', '$2y$12$Qei1ZXZ25pikshEaml4icuETwcGXjlC6hjowBNCSfzWt3imaXm5fC', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\999ca4e72800a8a5856c6b44a2ce674a.png', 1, 2, 'App\\Models\\Agent', 'XRuFGyirzk', '2023-12-08 22:32:36', '2023-12-08 22:32:36'),
(3, 'Lisa', 'Bogan', 'Prof.', '(602) 979-4785', '9167 Alvis Row\nEast Aldaburgh, VT 51210', 'adrien46@example.org', '2023-12-08 22:32:36', '$2y$12$ON50vhQMoz/ytUT6iNmWVe0dUUbAah5.jqafOluAwS6/zruyJqJEe', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\df4a45860afe27ebf57581045d1cfbf0.png', 0, 1, 'App\\Models\\Student', '86mKmK9P3f', '2023-12-08 22:32:40', '2023-12-08 22:32:40'),
(4, 'Travis', 'Schiller', 'Mr.', '+1 (820) 474-6959', '3528 Gisselle Crossing\nSouth Isabellefort, AZ 71906-9771', 'gwen88@example.net', '2023-12-08 22:32:40', '$2y$12$X36yfmr8ugtXgXhfkEr2D.KlK.U11aICaWNS.wBUPl6LAK1fwYEmi', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\20e947d2fb14b864c7900d3a63f46d16.png', 1, 2, 'App\\Models\\Student', 'DyLenpWRct', '2023-12-08 22:32:42', '2023-12-08 22:32:42'),
(5, 'Camylle', 'Dibbert', 'Mr.', '+1.520.624.8629', '4239 Alfonzo Walks Suite 994\nSouth Bettietown, HI 39325-3132', 'walsh.matteo@example.org', '2023-12-08 22:32:42', '$2y$12$s9/CIRax3gLa1iyGhahHqupF7tT6iMe/p57LAxd42sFECxEAwYP2m', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\79316755beec253d3b8b51d9b642e28a.png', 1, 3, 'App\\Models\\Student', 'qahHitXuAj', '2023-12-08 22:32:44', '2023-12-08 22:32:44'),
(6, 'Edwardo', 'Sawayn', 'Prof.', '+19593507725', '461 Crist Orchard Suite 281\nWest Simeonstad, NV 71383-0198', 'ondricka.vesta@example.net', '2023-12-08 22:32:44', '$2y$12$WqU0Sgt/oHRaFYYiy5PWJudNrEbQKtW3.d.EpVcQnlFqRgGclfKpy', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\8206599203bd728b2f2621483d6e0d48.png', 0, 4, 'App\\Models\\Student', 'yHgjM31TdQ', '2023-12-08 22:32:46', '2023-12-08 22:32:46'),
(7, 'Van', 'Stamm', 'Mr.', '+1-737-788-1766', '3193 Stroman Radial\nFunkton, MD 79730-5795', 'nat51@example.org', '2023-12-08 22:32:46', '$2y$12$LnzNuu8PYzT0fqbjAuGfF.B8Nbj/S3csjC4VoPbuYdY4HKsWlvAGO', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\a8fedab347d88162bec03e55183089c1.png', 0, 5, 'App\\Models\\Student', 'W5mVzqHUXL', '2023-12-08 22:32:48', '2023-12-08 22:32:48'),
(8, 'hhhhhhhhhhhh', 'rerer', 'feminin', '675411455', 'douala', 'tyyyyoic@gmail.com', NULL, '$2y$12$VBbQ8Nys6aQspLmLvINFluHca4Mt61U.gi55H0ExeM66higj6xOYu', NULL, 1, 6, 'App\\Models\\Student', NULL, '2023-12-08 22:33:47', '2023-12-08 22:33:47'),
(9, 'loic', 'rerer', 'feminin', '675411458', 'douala', 'ln@gmail.com', NULL, '$2y$12$dVaVQQFWYnI2525k3i0ev.ZP5m9yLd1ibzZAxzvw88Cff6/sqAsg2', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\phpD0A4.tmp', 1, 7, 'App\\Models\\Student', NULL, '2023-12-08 22:35:14', '2023-12-08 22:35:14'),
(10, 'loic', 'rerer', 'feminin', '675411450', 'douala', 'yohivana794@gmail.com', NULL, '$2y$12$UqfxeIFfGv8DEd1nf48GX.NICnDLUe53T6PWbtH6QdooBTr/OrWFa', 'C:\\Users\\YVANA\\AppData\\Local\\Temp\\phpC5E4.tmp', 1, 8, 'App\\Models\\Student', NULL, '2023-12-08 22:39:33', '2023-12-08 22:39:33');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
