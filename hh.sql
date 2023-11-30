-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 30, 2023 at 11:25 AM
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
(1, 1, '2023-11-30 09:21:36', '2023-11-30 09:21:36');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
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
(16, '2023_11_28_094914_add_deleted_at_to_buses_table', 1),
(17, '2023_11_29_102057_add_deleted_at_to_chauffeurs_table', 1),
(18, '2023_11_29_102331_add_deleted_at_to_trajets_table', 1);

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
(1, 'App\\Models\\User', 5, 'auth_token', 'ddf295ef22b3222fcc0f6a65faefc88b28e01a829ed45185882c64961e9eab08', '[\"*\"]', NULL, NULL, '2023-11-30 09:34:27', '2023-11-30 09:34:27'),
(2, 'App\\Models\\User', 1, 'auth_token', '3a5b60d3987f41cedeb8d33b4c4020e3f51939a337ef76ac8a85f307751de3ea', '[\"*\"]', NULL, NULL, '2023-11-30 09:35:07', '2023-11-30 09:35:07');

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
(1, 'Admin', '2023-11-30 09:21:36', '2023-11-30 09:21:36');

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
(1, '5598481879796', '2023-11-30 09:21:36', '2023-11-30 09:21:36'),
(2, '5595743193393', '2023-11-30 09:21:37', '2023-11-30 09:21:37'),
(3, '4216347586107', '2023-11-30 09:21:37', '2023-11-30 09:21:37'),
(4, '1609657736547', '2023-11-30 09:21:37', '2023-11-30 09:21:37'),
(5, '0452191663937', '2023-11-30 09:21:37', '2023-11-30 09:21:37'),
(6, '123456788', '2023-11-30 09:22:04', '2023-11-30 09:22:04'),
(8, '12345678', '2023-11-30 09:26:40', '2023-11-30 09:26:40'),
(10, '12345679', '2023-11-30 09:27:21', '2023-11-30 09:27:21'),
(11, '123456796666', '2023-11-30 09:49:45', '2023-11-30 09:49:45'),
(13, '1234567880', '2023-11-30 09:58:15', '2023-11-30 09:58:15'),
(14, '123456899', '2023-11-30 10:00:14', '2023-11-30 10:00:14');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
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
(1, 'Brandy', 'Denesik', 'gay.kiehn@example.net', '2023-11-30 09:21:36', '$2y$12$DdDcWInTfsUumGrLg0Lqpepe7WneM7S0P/rRxgh9uyWi95n2Sxd0O', '1-432-960-9699', NULL, 1, 1, 'App\\Models\\Agent', 'JtS22HNlV3', '2023-11-30 09:21:36', '2023-11-30 09:21:36'),
(2, 'Joanny', 'Parisian', 'pamela.bauch@example.com', '2023-11-30 09:21:37', '$2y$12$DdDcWInTfsUumGrLg0Lqpepe7WneM7S0P/rRxgh9uyWi95n2Sxd0O', '(765) 328-8455', NULL, 1, 1, 'App\\Models\\Student', 'ro47TrQYu9', '2023-11-30 09:21:37', '2023-11-30 09:21:37'),
(3, 'Colton', 'Nicolas', 'okuneva.ronaldo@example.net', '2023-11-30 09:21:37', '$2y$12$DdDcWInTfsUumGrLg0Lqpepe7WneM7S0P/rRxgh9uyWi95n2Sxd0O', '+1-641-453-4384', NULL, 1, 2, 'App\\Models\\Student', '0vg9PqHUzD', '2023-11-30 09:21:37', '2023-11-30 09:21:37'),
(4, 'Jules', 'Schimmel', 'jarrell28@example.com', '2023-11-30 09:21:37', '$2y$12$DdDcWInTfsUumGrLg0Lqpepe7WneM7S0P/rRxgh9uyWi95n2Sxd0O', '(870) 304-2462', NULL, 1, 3, 'App\\Models\\Student', 'VZdkTYlhsB', '2023-11-30 09:21:37', '2023-11-30 09:21:37'),
(5, 'Adell', 'Kuhn', 'lulu38@example.com', '2023-11-30 09:21:37', '$2y$12$DdDcWInTfsUumGrLg0Lqpepe7WneM7S0P/rRxgh9uyWi95n2Sxd0O', '520-764-7146', NULL, 1, 4, 'App\\Models\\Student', 'QdGJqUr1TI', '2023-11-30 09:21:37', '2023-11-30 09:21:37'),
(6, 'Dayna', 'Cole', 'bsimonis@example.com', '2023-11-30 09:21:37', '$2y$12$DdDcWInTfsUumGrLg0Lqpepe7WneM7S0P/rRxgh9uyWi95n2Sxd0O', '458.918.3520', NULL, 1, 5, 'App\\Models\\Student', 'Mlh1qmfH15', '2023-11-30 09:21:37', '2023-11-30 09:21:37'),
(9, 'abdou', 'rerer', 'yohivana794@gmail.com', NULL, '$2y$12$mp6QaI4LKz9a7TR9XNqwpeYwAQHDfeNUyy2YXq0FsH/Wqa62629G2', '675411455', NULL, 1, 14, 'App\\Models\\Student', NULL, '2023-11-30 10:00:15', '2023-11-30 10:00:15');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `payements`
--
ALTER TABLE `payements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
