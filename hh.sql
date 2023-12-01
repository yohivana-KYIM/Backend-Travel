-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2023 at 02:33 AM
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
  `role_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(2, 1, '2023-11-30 22:51:25', '2023-11-30 22:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` bigint UNSIGNED NOT NULL,
  `capacitemaximale` int NOT NULL DEFAULT '200',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` enum('active','inactif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactif',
  `modelebus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trajet_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `chauffeur_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chauffeurs`
--

CREATE TABLE `chauffeurs` (
  `id` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_permis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, '2023_10_31_174938_create_trajets_table', 1),
(6, '2023_10_31_174939_create_buses_table', 1),
(7, '2023_10_31_175041_create_payements_table', 1),
(8, '2023_10_31_175157_create_tickets_table', 1),
(9, '2023_10_31_175514_create_sieges_table', 1),
(10, '2023_11_18_213859_create_roles_table', 1),
(11, '2023_11_18_214421_create_students_table', 1),
(12, '2023_11_18_214449_create_agents_table', 1),
(13, '2023_11_27_134938_create_chauffeurs_table', 1),
(14, '2023_11_27_142346_add_chauffeur_id_to_buses_table', 1),
(15, '2023_11_27_150147_add_unique_to_numero_permis_in_chauffeurs_table', 1),
(16, '2023_11_28_094914_add_deleted_at_to_buses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('yohivana794@gmail.com', '$2y$12$Cy44rMdVMt/r0y6qXtb1lOZg8RBCgXfXI6pI65wTkXggwePmmPScS', '2023-12-01 01:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `payements`
--

CREATE TABLE `payements` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datepayement` datetime NOT NULL,
  `type_de_payement` enum('orange_money','mtn_money') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'orange_money',
  `user_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
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
(1, 'App\\Models\\User', 7, 'auth_token', 'ef7945d6a4db4effd8ebe4ff7e54f7b69a76b33e6a3132bd10153eb681038180', '[\"*\"]', NULL, NULL, '2023-11-30 22:53:11', '2023-11-30 22:53:11'),
(2, 'App\\Models\\User', 2, 'auth_token', '6dce1391409a56384894e1a6eef6b6b5750c84fc9c67309fd8714d171ea2a29d', '[\"*\"]', NULL, NULL, '2023-11-30 22:55:03', '2023-11-30 22:55:03'),
(3, 'App\\Models\\User', 8, 'auth_token', 'f2070674dd3e7ba929a97a08a5d914db22b5d28bfbb69cc4562d59c734279988', '[\"*\"]', NULL, NULL, '2023-12-01 01:28:48', '2023-12-01 01:28:48');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2023-11-30 22:50:49', '2023-11-30 22:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `sieges`
--

CREATE TABLE `sieges` (
  `id` bigint UNSIGNED NOT NULL,
  `numero` int NOT NULL,
  `statut` enum('libre','occupé') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'libre',
  `buse_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
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
(1, '0809574810219', '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(2, '4347222527219', '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(3, '2223875129005', '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(4, '2324462732759', '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(5, '5979528555468', '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(6, '123456788', '2023-11-30 23:16:01', '2023-11-30 23:16:01');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `montant` int NOT NULL,
  `date` datetime NOT NULL,
  `disponibilite` enum('disponible','vendu') COLLATE utf8mb4_unicode_ci NOT NULL,
  `trajet_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trajets`
--

CREATE TABLE `trajets` (
  `id` bigint UNSIGNED NOT NULL,
  `lieuxdepart` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieuxArrivee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarification` decimal(10,2) NOT NULL DEFAULT '200.00',
  `dateheureDepart` datetime NOT NULL,
  `dateheureArrivee` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `userable_id` int NOT NULL,
  `userable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `phone_number`, `image`, `active`, `userable_id`, `userable_type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ivy', 'Lang', 'schulist.herminio@example.org', '2023-11-30 22:50:49', '$2y$12$rdNN03UC9iCdk/7o0200kOM.qttUBFRLgVj2w1Te6T92DAPF0RHre', '1-463-933-2964', NULL, 1, 1, 'App\\Models\\Agent', 'bmhn2DpIcc', '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(2, 'Jennifer', 'Moen', 'tschulist@example.com', '2023-11-30 22:50:49', '$2y$12$rdNN03UC9iCdk/7o0200kOM.qttUBFRLgVj2w1Te6T92DAPF0RHre', '+1.760.551.9814', NULL, 1, 1, 'App\\Models\\Student', 'MABxhD50DB', '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(3, 'Rodrigo', 'Rolfson', 'irma35@example.org', '2023-11-30 22:50:49', '$2y$12$rdNN03UC9iCdk/7o0200kOM.qttUBFRLgVj2w1Te6T92DAPF0RHre', '1-475-672-9747', NULL, 1, 2, 'App\\Models\\Student', 'kuqIvv8HS8', '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(4, 'Nettie', 'Mohr', 'harvey.lavina@example.com', '2023-11-30 22:50:49', '$2y$12$rdNN03UC9iCdk/7o0200kOM.qttUBFRLgVj2w1Te6T92DAPF0RHre', '1-283-634-9587', NULL, 1, 3, 'App\\Models\\Student', 'QfwiYI1ps0', '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(5, 'Zoey', 'O\'Keefe', 'steuber.collin@example.net', '2023-11-30 22:50:49', '$2y$12$rdNN03UC9iCdk/7o0200kOM.qttUBFRLgVj2w1Te6T92DAPF0RHre', '313-982-9244', NULL, 1, 4, 'App\\Models\\Student', 'dc4D0s1rki', '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(6, 'Ron', 'Jast', 'ivah58@example.org', '2023-11-30 22:50:49', '$2y$12$rdNN03UC9iCdk/7o0200kOM.qttUBFRLgVj2w1Te6T92DAPF0RHre', '(216) 578-1874', NULL, 1, 5, 'App\\Models\\Student', 'FW0GzF8EG7', '2023-11-30 22:50:49', '2023-11-30 22:50:49'),
(7, 'abdou', 'rerer', 'yohivana794@gmail.com', NULL, '$2y$12$6ZGV9ha3cYDkqN8INbKtdu/hSGWgQSmCfS187Az.jIgFeUlbDmJoO', '675411455', NULL, 1, 2, 'App\\Models\\Agent', NULL, '2023-11-30 22:51:25', '2023-11-30 22:51:25'),
(8, 'lore', 'rerer', 'yohivana237@gmail.com', NULL, '$2y$12$XaEfehfV1yiSut0MVhv9T.x4j7xLXJJ1VGIiGF3CHbHU9qOk2x7Ry', '675411455', NULL, 1, 6, 'App\\Models\\Student', NULL, '2023-11-30 23:16:02', '2023-12-01 01:27:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agents_role_id_foreign` (`role_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buses_trajet_id_foreign` (`trajet_id`),
  ADD KEY `buses_chauffeur_id_foreign` (`chauffeur_id`);

--
-- Indexes for table `chauffeurs`
--
ALTER TABLE `chauffeurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chauffeurs_numero_permis_unique` (`numero_permis`);

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
-- Indexes for table `payements`
--
ALTER TABLE `payements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payements_code_unique` (`code`),
  ADD KEY `payements_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sieges`
--
ALTER TABLE `sieges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sieges_numero_unique` (`numero`),
  ADD KEY `sieges_buse_id_foreign` (`buse_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_matricule_unique` (`matricule`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_trajet_id_foreign` (`trajet_id`);

--
-- Indexes for table `trajets`
--
ALTER TABLE `trajets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chauffeurs`
--
ALTER TABLE `chauffeurs`
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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `payements`
--
ALTER TABLE `payements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sieges`
--
ALTER TABLE `sieges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agents`
--
ALTER TABLE `agents`
  ADD CONSTRAINT `agents_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_chauffeur_id_foreign` FOREIGN KEY (`chauffeur_id`) REFERENCES `chauffeurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buses_trajet_id_foreign` FOREIGN KEY (`trajet_id`) REFERENCES `trajets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payements`
--
ALTER TABLE `payements`
  ADD CONSTRAINT `payements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sieges`
--
ALTER TABLE `sieges`
  ADD CONSTRAINT `sieges_buse_id_foreign` FOREIGN KEY (`buse_id`) REFERENCES `buses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_trajet_id_foreign` FOREIGN KEY (`trajet_id`) REFERENCES `trajets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
