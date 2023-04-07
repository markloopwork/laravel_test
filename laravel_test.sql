-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2023 at 03:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_test`
--

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(15, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(16, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(17, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(18, '2016_06_01_000004_create_oauth_clients_table', 2),
(19, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(12, NULL, 'Laravel Personal Access Client', '$2y$10$aoxhn9Dc5qXEFUBbrxOn1eEJeOTXzjzsjFRUVvJg89QNGCwf07l3C', NULL, 'http://localhost', 1, 0, 0, '2023-04-07 07:17:14', '2023-04-07 07:17:14'),
(13, NULL, 'Laravel Password Grant Client', '$2y$10$NgbceOXDR.YZEgVjrp2QquMjxTIlS1ksx.JN1ZrXB7o0TArPEhbqS', 'users', 'http://localhost', 0, 1, 0, '2023-04-07 07:17:14', '2023-04-07 07:17:14'),
(15, NULL, 'Laravel Personal Access Client', '$2y$10$QfqTPj00j6vUpFdg5ccVpePQ5KC3ZwJmLE6quyadfUR7QMPuRAVgu', NULL, 'http://localhost', 1, 0, 0, '2023-04-07 07:27:48', '2023-04-07 07:27:48'),
(16, NULL, 'Laravel Password Grant Client', '$2y$10$YyMgD.VMHzLmiZH7GjjBaunIgBJPsC..pEyrYUAYEMXCyROa9Puem', 'users', 'http://localhost', 0, 1, 0, '2023-04-07 07:27:48', '2023-04-07 07:27:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(6, 12, '2023-04-07 07:17:14', '2023-04-07 07:17:14'),
(7, 15, '2023-04-07 07:27:48', '2023-04-07 07:27:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `mobile_number` bigint(20) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL COMMENT '1 = admin | 2 = User',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `email_verified_at`, `password`, `company_name`, `mobile_number`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '25d55ad283aa400af464c76d713c07ad', 'test1', 1234567890, 1, NULL, '2023-04-07 02:56:48', '2023-04-07 02:56:48'),
(4, 'test user', 'testuser@gmail.com', NULL, '25d55ad283aa400af464c76d713c07ad', 'test company', 1234567891, 2, NULL, '2023-04-07 03:57:04', '2023-04-07 04:35:36'),
(5, 'testuser2', 'test@gmail.com', NULL, '25d55ad283aa400af464c76d713c07ad', 'test', 1234567892, 2, NULL, '2023-04-07 04:31:55', '2023-04-07 04:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `action_name` varchar(255) DEFAULT NULL,
  `action_value` text DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`id`, `user_id`, `action_name`, `action_value`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 4, 'User Create', '{\"_token\":\"Ky6eXGpUC0OMcNF5AZBNH3JDEhX4BNeFrIssJLW8\",\"full_name\":\"test user\",\"company_name\":\"test company\",\"mobile_number\":\"1234567891\",\"email\":\"testuser@gmail.com\",\"password\":\"12345678\",\"password_confirmation\":\"12345678\"}', '::1', '2023-04-07 03:57:04', '2023-04-07 03:57:04'),
(2, 4, 'User Updated', '{\"old_data\":{\"id\":4,\"full_name\":\"test user\",\"email\":\"testuser@gmail.com\",\"email_verified_at\":null,\"company_name\":\"test company\",\"mobile_number\":1234567891,\"role_id\":2,\"created_at\":\"2023-04-07T09:27:04.000000Z\",\"updated_at\":\"2023-04-07T09:27:04.000000Z\"},\"new_data\":{\"_token\":\"YqudzlbQ4uXzg8yCemPwfDvdMPzyGQ31CtTNe23c\",\"id\":\"4\",\"full_name\":\"test user\",\"company_name\":\"test company\",\"mobile_number\":\"1234567891\",\"email\":\"testuser@gmail.com\",\"password\":\"12345679\",\"password_confirmation\":\"12345679\"}}', '::1', '2023-04-07 04:22:45', '2023-04-07 04:22:45'),
(3, 4, 'User Updated', '{\"old_data\":{\"id\":4,\"full_name\":\"test user\",\"email\":\"testuser@gmail.com\",\"email_verified_at\":null,\"company_name\":\"test company\",\"mobile_number\":1234567891,\"role_id\":2,\"created_at\":\"2023-04-07T09:27:04.000000Z\",\"updated_at\":\"2023-04-07T09:52:45.000000Z\"},\"new_data\":{\"_token\":\"YqudzlbQ4uXzg8yCemPwfDvdMPzyGQ31CtTNe23c\",\"id\":\"4\",\"full_name\":\"test user\",\"company_name\":\"test company\",\"mobile_number\":\"1234567891\",\"email\":\"testuser@gmail.com\",\"password\":\"123456789\",\"password_confirmation\":\"123456789\"}}', '::1', '2023-04-07 04:30:36', '2023-04-07 04:30:36'),
(4, 5, 'User Create', '{\"_token\":\"QSdqNG9aKOM7CquyzUGix3QE8bBDEtHJQPQ83utL\",\"full_name\":\"testuser2\",\"company_name\":\"test\",\"mobile_number\":\"1234567892\",\"email\":\"test@gmail.com\",\"password\":\"12345678\",\"password_confirmation\":\"12345678\"}', '::1', '2023-04-07 04:31:55', '2023-04-07 04:31:55'),
(5, 5, 'User Updated', '{\"old_data\":{\"id\":5,\"full_name\":\"testuser2\",\"email\":\"test@gmail.com\",\"email_verified_at\":null,\"company_name\":\"test\",\"mobile_number\":1234567892,\"role_id\":2,\"created_at\":\"2023-04-07T10:01:55.000000Z\",\"updated_at\":\"2023-04-07T10:01:55.000000Z\"},\"new_data\":{\"_token\":\"YqudzlbQ4uXzg8yCemPwfDvdMPzyGQ31CtTNe23c\",\"id\":\"5\",\"full_name\":\"testuser2\",\"company_name\":\"test\",\"mobile_number\":\"1234567892\",\"email\":\"test@gmail.com\",\"password\":\"12345678\",\"password_confirmation\":\"12345678\"}}', '::1', '2023-04-07 04:34:01', '2023-04-07 04:34:01'),
(6, 5, 'User Updated', '{\"old_data\":{\"id\":5,\"full_name\":\"testuser2\",\"email\":\"test@gmail.com\",\"email_verified_at\":null,\"company_name\":\"test\",\"mobile_number\":1234567892,\"role_id\":2,\"created_at\":\"2023-04-07T10:01:55.000000Z\",\"updated_at\":\"2023-04-07T10:01:55.000000Z\"},\"new_data\":{\"_token\":\"YqudzlbQ4uXzg8yCemPwfDvdMPzyGQ31CtTNe23c\",\"id\":\"5\",\"full_name\":\"testuser2\",\"company_name\":\"test\",\"mobile_number\":\"1234567892\",\"email\":\"test@gmail.com\",\"password\":\"12345678\",\"password_confirmation\":\"12345678\"}}', '::1', '2023-04-07 04:34:25', '2023-04-07 04:34:25'),
(7, 4, 'User Updated', '{\"old_data\":{\"id\":4,\"full_name\":\"test user\",\"email\":\"testuser@gmail.com\",\"email_verified_at\":null,\"company_name\":\"test company\",\"mobile_number\":1234567891,\"role_id\":2,\"created_at\":\"2023-04-07T09:27:04.000000Z\",\"updated_at\":\"2023-04-07T10:00:36.000000Z\"},\"new_data\":{\"_token\":\"YqudzlbQ4uXzg8yCemPwfDvdMPzyGQ31CtTNe23c\",\"id\":\"4\",\"full_name\":\"test user\",\"company_name\":\"test company\",\"mobile_number\":\"1234567891\",\"email\":\"testuser@gmail.com\",\"password\":\"12345678\",\"password_confirmation\":\"12345678\"}}', '::1', '2023-04-07 04:35:36', '2023-04-07 04:35:36');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
