-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2023 at 09:58 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

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

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('08e6ad21dfbe0348dc87fcd9564797fc4dd9823231f9928457fe0779412288199e8b471886dbe580', 1, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 01:23:02', '2023-09-26 01:23:02', '2024-09-26 06:53:02'),
('243651d49b1467147b91fe6803cc97e553007482008e728dc5c2a4a717b3b0522efd9a5756cc2bbe', 1, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 01:25:00', '2023-09-26 01:25:00', '2024-09-26 06:55:00'),
('8a43c99b01f21406aed10a44ecf183cee14b4c33a2384980943d2cb94155446c3564283388669c00', 1, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 01:27:46', '2023-09-26 01:27:46', '2024-09-26 06:57:46'),
('5f33b87bee312d0235907a110aea4ac732fbcb013ba622c3bbd40e4cf563df89f02d4958d4938ac5', 2, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 01:29:47', '2023-09-26 01:29:47', '2024-09-26 06:59:47'),
('52967a48e618882f7ebf61043fe07e2f679dca9fabfde404e8f2881fb2772c9d11b3dc0d1271d81c', 3, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 01:30:25', '2023-09-26 01:30:25', '2024-09-26 07:00:25'),
('79e4d40d5466e54e8191e50d17673c38b963dacd32606f1d101b5240f0baf05b93a9d4fb1790b35c', 23, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 01:37:03', '2023-09-26 01:37:03', '2024-09-26 07:07:03'),
('0322c7c901571d6e015c336c513f1d8d8b0417d1fb3969d29dd90c792e29c8f7adb89add9d6f913b', 24, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 01:39:19', '2023-09-26 01:39:19', '2024-09-26 07:09:19'),
('2e414728b607fae8e45e40e9f919faca7702c30a2e7d2981c207e592e3906d174d7e6ba3214a7e6f', 25, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 01:39:38', '2023-09-26 01:39:38', '2024-09-26 07:09:38'),
('a9e1059dcb5d872eebeb2f50cc880ec28ed59b8c1a9fd8345b7078ba98d160007ceca313a913e060', 22, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 01:43:59', '2023-09-26 01:43:59', '2024-09-26 07:13:59'),
('81e04c92c7d8eff1803bca28b5bf6e769b2e0072425e13ac65cc7a7aa78420f7fbd18ed37573fd9d', 29, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 01:49:46', '2023-09-26 01:49:46', '2024-09-26 07:19:46'),
('1c1a4715e2301ee79f5a42304f6832fd55b74f51d0e2240069a94a92852859b901021b0878750feb', 1, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 01:50:12', '2023-09-26 01:50:12', '2024-09-26 07:20:12'),
('47f77975c38f4aed7e1da12b7f89099bdb931f2491de8d1a05439e8fef9becf6f27cc06eafe42ee4', 1, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 02:14:56', '2023-09-26 02:14:56', '2024-09-26 07:44:56'),
('3732a681c231e0bb5f8a9a51a5924b3dc7fb661611a4a124b4ac2c16e8a75ff7a731d683ec7d4707', 1, 1, 'Laravel Personal Access Client', '[]', 0, '2023-09-26 02:15:44', '2023-09-26 02:15:44', '2024-09-26 07:45:44');

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
(1, NULL, 'Laravel Personal Access Client', 'c4ofVsuctJuiz5SziFCNFPHHBIXsaKdGm56i2B8h', NULL, 'http://localhost', 1, 0, 0, '2023-09-26 01:17:42', '2023-09-26 01:17:42'),
(2, NULL, 'Laravel Password Grant Client', 'XVvVu0qRGF4ZJ6YuPLtlywSqhluhOlDzVVfDwxkF', 'users', 'http://localhost', 0, 1, 0, '2023-09-26 01:17:42', '2023-09-26 01:17:42');

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
(1, 1, '2023-09-26 01:17:42', '2023-09-26 01:17:42');

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
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `active` int(11) NOT NULL,
  `text_color` text NOT NULL,
  `bg_color` text NOT NULL,
  `symbol` text NOT NULL,
  `emotion_text` text NOT NULL,
  `emotion_bg_color` text NOT NULL,
  `ratings` text NOT NULL,
  `total_rating` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `text`, `active`, `text_color`, `bg_color`, `symbol`, `emotion_text`, `emotion_bg_color`, `ratings`, `total_rating`, `created_at`, `updated_at`) VALUES
(49, 'hiiii', 1, '#FFFFFF', '#000000', '💌', 'Holding Secret', '#FF8F8F', '3.5', '1', '2023-09-23 09:41:53', NULL),
(50, 'hiiii', 1, '#FFFFFF', '#000000', '💌', 'Holding Secret', '#FF8F8F', '3.5', '1', '2023-09-23 09:41:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_data`
--

CREATE TABLE `post_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `post_data` text DEFAULT NULL,
  `user_viewed` text DEFAULT NULL,
  `users_commented` text DEFAULT NULL,
  `users_rated` text DEFAULT NULL,
  `users_shared` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_data`
--

INSERT INTO `post_data` (`id`, `post_id`, `post_data`, `user_viewed`, `users_commented`, `users_rated`, `users_shared`, `created_at`, `updated_at`) VALUES
(1, 49, 'a:1:{i:0;a:2:{s:6:\"status\";s:7:\"success\";s:19:\"following_user_post\";a:2:{i:0;a:20:{s:7:\"post_id\";i:49;s:7:\"user_id\";s:1:\"1\";s:4:\"text\";s:5:\"hiiii\";s:11:\"uploaded_on\";s:19:\"2023-09-23 15:11:53\";s:6:\"active\";i:1;s:10:\"text_color\";s:7:\"#FFFFFF\";s:8:\"bg_color\";s:7:\"#000000\";s:6:\"symbol\";s:4:\"💌\";s:12:\"emotion_text\";s:14:\"Holding Secret\";s:16:\"emotion_bg_color\";s:7:\"#FF8F8F\";s:7:\"ratings\";s:3:\"3.5\";s:12:\"total_rating\";s:1:\"1\";s:18:\"loggedin_user_data\";a:1:{i:0;a:6:{s:2:\"id\";i:1;s:4:\"name\";s:4:\"test\";s:11:\"profile_pic\";s:72:\"https://lh3.googleusercontent.com/a/AGNmyxYlaopMnqUhip1KXNE8_Xtg5OATLLtP\";s:8:\"language\";N;s:5:\"about\";s:32:\"سافٹ وئیر انجینئر\";s:14:\"business_about\";s:20:\"Software development\";}}s:11:\"user_viewed\";a:1:{i:0;a:8:{s:2:\"id\";i:22;s:4:\"name\";s:8:\"John Dey\";s:11:\"profile_pic\";s:8:\"John Dey\";s:8:\"language\";a:2:{i:0;a:3:{s:4:\"code\";s:3:\"ENG\";s:8:\"language\";s:7:\"English\";s:11:\"language_id\";i:1;}i:1;a:3:{s:4:\"code\";s:2:\"AR\";s:8:\"language\";s:6:\"Arabic\";s:11:\"language_id\";i:2;}}s:5:\"about\";s:8:\"About us\";s:14:\"business_about\";N;s:6:\"rating\";i:5;s:9:\"no_rating\";i:2;}}s:11:\"users_rated\";a:1:{i:0;a:8:{s:2:\"id\";i:22;s:4:\"name\";s:8:\"John Dey\";s:11:\"profile_pic\";s:8:\"John Dey\";s:8:\"language\";a:2:{i:0;a:3:{s:4:\"code\";s:3:\"ENG\";s:8:\"language\";s:7:\"English\";s:11:\"language_id\";i:1;}i:1;a:3:{s:4:\"code\";s:2:\"AR\";s:8:\"language\";s:6:\"Arabic\";s:11:\"language_id\";i:2;}}s:5:\"about\";s:8:\"About us\";s:14:\"business_about\";N;s:6:\"rating\";i:5;s:9:\"no_rating\";i:2;}}s:12:\"users_shared\";a:1:{i:0;a:8:{s:2:\"id\";i:22;s:4:\"name\";s:8:\"John Dey\";s:11:\"profile_pic\";s:8:\"John Dey\";s:8:\"language\";a:2:{i:0;a:3:{s:4:\"code\";s:3:\"ENG\";s:8:\"language\";s:7:\"English\";s:11:\"language_id\";i:1;}i:1;a:3:{s:4:\"code\";s:2:\"AR\";s:8:\"language\";s:6:\"Arabic\";s:11:\"language_id\";i:2;}}s:5:\"about\";s:8:\"About us\";s:14:\"business_about\";N;s:6:\"rating\";i:5;s:9:\"no_rating\";i:2;}}s:14:\"users_comments\";a:2:{i:0;a:8:{s:2:\"id\";i:1;s:4:\"name\";s:4:\"test\";s:11:\"profile_pic\";s:4:\"test\";s:8:\"language\";N;s:5:\"about\";s:32:\"سافٹ وئیر انجینئر\";s:14:\"business_about\";s:20:\"Software development\";s:6:\"rating\";N;s:9:\"no_rating\";N;}i:1;a:8:{s:2:\"id\";i:22;s:4:\"name\";s:8:\"John Dey\";s:11:\"profile_pic\";s:8:\"John Dey\";s:8:\"language\";a:2:{i:0;a:3:{s:4:\"code\";s:3:\"ENG\";s:8:\"language\";s:7:\"English\";s:11:\"language_id\";i:1;}i:1;a:3:{s:4:\"code\";s:2:\"AR\";s:8:\"language\";s:6:\"Arabic\";s:11:\"language_id\";i:2;}}s:5:\"about\";s:8:\"About us\";s:14:\"business_about\";N;s:6:\"rating\";i:5;s:9:\"no_rating\";i:2;}}s:14:\"total_comments\";i:2;s:11:\"total_views\";i:1;s:12:\"total_shared\";i:1;}i:1;a:20:{s:7:\"post_id\";i:50;s:7:\"user_id\";s:1:\"1\";s:4:\"text\";s:5:\"hiiii\";s:11:\"uploaded_on\";s:19:\"2023-09-23 15:11:53\";s:6:\"active\";i:1;s:10:\"text_color\";s:7:\"#FFFFFF\";s:8:\"bg_color\";s:7:\"#000000\";s:6:\"symbol\";s:4:\"💌\";s:12:\"emotion_text\";s:14:\"Holding Secret\";s:16:\"emotion_bg_color\";s:7:\"#FF8F8F\";s:7:\"ratings\";s:3:\"3.5\";s:12:\"total_rating\";s:1:\"1\";s:18:\"loggedin_user_data\";a:1:{i:0;a:6:{s:2:\"id\";i:1;s:4:\"name\";s:4:\"test\";s:11:\"profile_pic\";s:72:\"https://lh3.googleusercontent.com/a/AGNmyxYlaopMnqUhip1KXNE8_Xtg5OATLLtP\";s:8:\"language\";N;s:5:\"about\";s:32:\"سافٹ وئیر انجینئر\";s:14:\"business_about\";s:20:\"Software development\";}}s:11:\"user_viewed\";N;s:11:\"users_rated\";a:1:{i:0;a:8:{s:2:\"id\";i:22;s:4:\"name\";s:8:\"John Dey\";s:11:\"profile_pic\";s:8:\"John Dey\";s:8:\"language\";a:2:{i:0;a:3:{s:4:\"code\";s:3:\"ENG\";s:8:\"language\";s:7:\"English\";s:11:\"language_id\";i:1;}i:1;a:3:{s:4:\"code\";s:2:\"AR\";s:8:\"language\";s:6:\"Arabic\";s:11:\"language_id\";i:2;}}s:5:\"about\";s:8:\"About us\";s:14:\"business_about\";N;s:6:\"rating\";i:5;s:9:\"no_rating\";i:2;}}s:12:\"users_shared\";N;s:14:\"users_comments\";N;s:14:\"total_comments\";i:0;s:11:\"total_views\";i:0;s:12:\"total_shared\";i:0;}}}}', '22', '1,22', '22', '22', '2023-09-26 01:53:19', '2023-09-26 07:54:09'),
(2, 50, 'a:1:{i:0;a:2:{s:6:\"status\";s:7:\"success\";s:19:\"following_user_post\";a:2:{i:0;a:20:{s:7:\"post_id\";i:49;s:7:\"user_id\";s:1:\"1\";s:4:\"text\";s:5:\"hiiii\";s:11:\"uploaded_on\";s:19:\"2023-09-23 15:11:53\";s:6:\"active\";i:1;s:10:\"text_color\";s:7:\"#FFFFFF\";s:8:\"bg_color\";s:7:\"#000000\";s:6:\"symbol\";s:4:\"💌\";s:12:\"emotion_text\";s:14:\"Holding Secret\";s:16:\"emotion_bg_color\";s:7:\"#FF8F8F\";s:7:\"ratings\";s:3:\"3.5\";s:12:\"total_rating\";s:1:\"1\";s:18:\"loggedin_user_data\";a:1:{i:0;a:6:{s:2:\"id\";i:1;s:4:\"name\";s:4:\"test\";s:11:\"profile_pic\";s:72:\"https://lh3.googleusercontent.com/a/AGNmyxYlaopMnqUhip1KXNE8_Xtg5OATLLtP\";s:8:\"language\";N;s:5:\"about\";s:32:\"سافٹ وئیر انجینئر\";s:14:\"business_about\";s:20:\"Software development\";}}s:11:\"user_viewed\";a:1:{i:0;a:8:{s:2:\"id\";i:22;s:4:\"name\";s:8:\"John Dey\";s:11:\"profile_pic\";s:8:\"John Dey\";s:8:\"language\";a:2:{i:0;a:3:{s:4:\"code\";s:3:\"ENG\";s:8:\"language\";s:7:\"English\";s:11:\"language_id\";i:1;}i:1;a:3:{s:4:\"code\";s:2:\"AR\";s:8:\"language\";s:6:\"Arabic\";s:11:\"language_id\";i:2;}}s:5:\"about\";s:8:\"About us\";s:14:\"business_about\";N;s:6:\"rating\";i:5;s:9:\"no_rating\";i:2;}}s:11:\"users_rated\";a:1:{i:0;a:8:{s:2:\"id\";i:22;s:4:\"name\";s:8:\"John Dey\";s:11:\"profile_pic\";s:8:\"John Dey\";s:8:\"language\";a:2:{i:0;a:3:{s:4:\"code\";s:3:\"ENG\";s:8:\"language\";s:7:\"English\";s:11:\"language_id\";i:1;}i:1;a:3:{s:4:\"code\";s:2:\"AR\";s:8:\"language\";s:6:\"Arabic\";s:11:\"language_id\";i:2;}}s:5:\"about\";s:8:\"About us\";s:14:\"business_about\";N;s:6:\"rating\";i:5;s:9:\"no_rating\";i:2;}}s:12:\"users_shared\";a:1:{i:0;a:8:{s:2:\"id\";i:22;s:4:\"name\";s:8:\"John Dey\";s:11:\"profile_pic\";s:8:\"John Dey\";s:8:\"language\";a:2:{i:0;a:3:{s:4:\"code\";s:3:\"ENG\";s:8:\"language\";s:7:\"English\";s:11:\"language_id\";i:1;}i:1;a:3:{s:4:\"code\";s:2:\"AR\";s:8:\"language\";s:6:\"Arabic\";s:11:\"language_id\";i:2;}}s:5:\"about\";s:8:\"About us\";s:14:\"business_about\";N;s:6:\"rating\";i:5;s:9:\"no_rating\";i:2;}}s:14:\"users_comments\";a:2:{i:0;a:8:{s:2:\"id\";i:1;s:4:\"name\";s:4:\"test\";s:11:\"profile_pic\";s:4:\"test\";s:8:\"language\";N;s:5:\"about\";s:32:\"سافٹ وئیر انجینئر\";s:14:\"business_about\";s:20:\"Software development\";s:6:\"rating\";N;s:9:\"no_rating\";N;}i:1;a:8:{s:2:\"id\";i:22;s:4:\"name\";s:8:\"John Dey\";s:11:\"profile_pic\";s:8:\"John Dey\";s:8:\"language\";a:2:{i:0;a:3:{s:4:\"code\";s:3:\"ENG\";s:8:\"language\";s:7:\"English\";s:11:\"language_id\";i:1;}i:1;a:3:{s:4:\"code\";s:2:\"AR\";s:8:\"language\";s:6:\"Arabic\";s:11:\"language_id\";i:2;}}s:5:\"about\";s:8:\"About us\";s:14:\"business_about\";N;s:6:\"rating\";i:5;s:9:\"no_rating\";i:2;}}s:14:\"total_comments\";i:2;s:11:\"total_views\";i:1;s:12:\"total_shared\";i:1;}i:1;a:20:{s:7:\"post_id\";i:50;s:7:\"user_id\";s:1:\"1\";s:4:\"text\";s:5:\"hiiii\";s:11:\"uploaded_on\";s:19:\"2023-09-23 15:11:53\";s:6:\"active\";i:1;s:10:\"text_color\";s:7:\"#FFFFFF\";s:8:\"bg_color\";s:7:\"#000000\";s:6:\"symbol\";s:4:\"💌\";s:12:\"emotion_text\";s:14:\"Holding Secret\";s:16:\"emotion_bg_color\";s:7:\"#FF8F8F\";s:7:\"ratings\";s:3:\"3.5\";s:12:\"total_rating\";s:1:\"1\";s:18:\"loggedin_user_data\";a:1:{i:0;a:6:{s:2:\"id\";i:1;s:4:\"name\";s:4:\"test\";s:11:\"profile_pic\";s:72:\"https://lh3.googleusercontent.com/a/AGNmyxYlaopMnqUhip1KXNE8_Xtg5OATLLtP\";s:8:\"language\";N;s:5:\"about\";s:32:\"سافٹ وئیر انجینئر\";s:14:\"business_about\";s:20:\"Software development\";}}s:11:\"user_viewed\";N;s:11:\"users_rated\";a:1:{i:0;a:8:{s:2:\"id\";i:22;s:4:\"name\";s:8:\"John Dey\";s:11:\"profile_pic\";s:8:\"John Dey\";s:8:\"language\";a:2:{i:0;a:3:{s:4:\"code\";s:3:\"ENG\";s:8:\"language\";s:7:\"English\";s:11:\"language_id\";i:1;}i:1;a:3:{s:4:\"code\";s:2:\"AR\";s:8:\"language\";s:6:\"Arabic\";s:11:\"language_id\";i:2;}}s:5:\"about\";s:8:\"About us\";s:14:\"business_about\";N;s:6:\"rating\";i:5;s:9:\"no_rating\";i:2;}}s:12:\"users_shared\";N;s:14:\"users_comments\";N;s:14:\"total_comments\";i:0;s:11:\"total_views\";i:0;s:12:\"total_shared\";i:0;}}}}', NULL, NULL, '22', NULL, '2023-09-26 02:06:38', '2023-09-26 07:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `language` text DEFAULT NULL,
  `profile_pic` text NOT NULL,
  `about` text CHARACTER SET utf8 COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `business_about` text DEFAULT NULL,
  `remember_token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `language`, `profile_pic`, `about`, `business_about`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@mail.com', '$2y$10$IhQ7fNnJMlLJwdXl.dsO4uS13HDtnvbvxHSSo3W8qoWOGwpf3icca', NULL, 'https://lh3.googleusercontent.com/a/AGNmyxYlaopMnqUhip1KXNE8_Xtg5OATLLtP', 'سافٹ وئیر انجینئر', 'Software development', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzczMmE2ODFjMjMxZTBiYjVmOGE5YTUxYTU5MjRiM2RjN2ZiNjYxNjExYTRhMTI0YjRhYzJjMTZlOGE3NWZmN2E3MzFkNjgzZWM3ZDQ3MDciLCJpYXQiOjE2OTU3MTQzNDQuNDM1MTc3LCJuYmYiOjE2OTU3MTQzNDQuNDM1MTgsImV4cCI6MTcyNzMzNjc0NC40Mjk3NjIsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.QwyCPnkfEjgpD6UZN3DqgA86ITXnUZq3r863h3laCW33cyd29nZozYIPWuXR1Xo5mr6LgnVK01D1IoLiBdUyNUthSGAGrXQxNMAPTGzzLOJkJfZxeRkym3dUHJRB3I_Uj3UPuKI-5zfqHW-gjvfqFEvxu0iU7Gq_gSo0BHdoXqT1ez2N5WbNbstdfTCyHRj_DWNn2ndzb34HFNm9QDMonX5l8EhbijOC_IBG3snDHcbBozJaECvw8QdLPG7Inh_FdsEp1iOWAYr07Ppd268BnvhIC2Lq9noG5RGY8kSEU4J8THAjCYcFnTw5aoNaqrr7NwYhh89mrgjQ_aVejXK0WTg3viFXSu-7TDyYt2ffftT0pfZoBqOHtGh6Yap5tM2aMqZ1343oxgH7REZJWU3jwakQ7cHnnrvaHft15vYjp_YJQQ68A7IxJVjvNlRYPFtGPwphwdXV9qg4XaDvGmfPRQ6GCbPqBe5cl6URmX2vRZ77nqfl-3p-wIpTurrmItb_BZw98AdivnqFbvBzVXLFTjwFmV3R1AhACEYnom3s4IQqcQDPPNmQDdiBXx5HULynEanriX1HQM2UOSwdGtdtkPrM0Mn5rjftqMg40pf38aSlb-FH_2m-hQ8JW1TNhz8o1FmBteTmsaC9gp0iqF91UWrzWvKbVMIQp2QI6PJlego', '2023-09-26 01:27:46', '2023-09-26 07:45:44'),
(22, 'John Dey', 'john@mail.com', '$2y$10$xRi9Y9fdMGcQn/952OuTpuRr6w.Vf8WECDH7xU6ecAeiIdCklAFkm', '[{\"code\": \"ENG\",\"language\": \"English\",\"language_id\": 1},{\"code\": \"AR\",\"language\": \"Arabic\",\"language_id\": 2}]', 'profile/64bf991385ecc.jpeg', 'About us', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODFlMDRjOTJjN2Q4ZWZmMTgwM2JjYTI4YjViZjZlNzY5YjJlMDA3MjQyNWUxM2FjNjVjYzdhN2FhNzg0MjBmN2ZiZDE4ZWQzNzU3M2ZkOWQiLCJpYXQiOjE2OTU3MTI3ODYuMzUwOTQyLCJuYmYiOjE2OTU3MTI3ODYuMzUwOTQ1LCJleHAiOjE3MjczMzUxODYuMzQxOTgsInN1YiI6IjI5Iiwic2NvcGVzIjpbXX0.nW6qcQ5MKYvu-dnSQInRY__XYLg-_puiURX7KdnCg6WQPEsn08o7kmBah59W22DeuK8joK_QVjVPfzT5Wc-Bc_BpffaYU-g01v2dA6HryQg1ycF-uolEQYSRBDaWGhG_oGcMmfWnzyI7PW2a45cw4nUBCdmUgYVHtEScz8DVWEJmDLn4krrcc0Xm4Y9sGkdC3IGc3HBwymYNaLG7BCAW4KpTGCTmi1fO1_eQOtkVDv0cPsXVssXHMVBlTAKwe7jwwo4eXOyTNM3tDAm5o969FuFsKL4pEbYoCrOeXRNUVNluhSumNWxvppZfG50ROv_CKwAl7FVBuuJZPe-d21jpWVeds3_Kp7z20CpQXYEhB-Yvt5bAzHcLdHwpE_OsJZWNG8kj9PTfl4reIIUjE4pOcNKs9HU0qE2KNkSajZcP_fMKjdnj36N54TDccya1JY0stZrWzDoDUH1JCidJ0Amond_ntbu9OeRTOPh5mvftOPU24FVYUAA_-h6jxo-2BtCZYQtEnw8BD_MfFLMaqLx8elb9skLZWtdE2C_M1hHS-01TzEgG0e49dEZau-d8-MWAsp-7N6gco-G93KSBvyAqKQdUNaC72d5F-nLDduITmwE_RsZDEx7MHbD5YeK-wqvo-qfh3QejsdYzwTPgQACAJYg1lxGE_Q4DNCeO5BHC134', '2023-09-26 01:49:46', '2023-09-26 07:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `users_comments`
--

CREATE TABLE `users_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comments` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_comments`
--

INSERT INTO `users_comments` (`id`, `comments`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'This is Comment', 49, 22, NULL, NULL),
(2, 'This is test comment', 49, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_ratings`
--

CREATE TABLE `users_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `no_rating` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_ratings`
--

INSERT INTO `users_ratings` (`id`, `rating`, `no_rating`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, 2, 49, 22, NULL, NULL),
(2, 5, 2, 50, 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_shared`
--

CREATE TABLE `users_shared` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `language` text NOT NULL,
  `about` text NOT NULL,
  `business_about` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_shared`
--

INSERT INTO `users_shared` (`id`, `post_id`, `user_id`, `language`, `about`, `business_about`, `created_at`, `updated_at`) VALUES
(1, 49, 22, '[{\"code\": \"ENG\",\"language\": \"English\",\"language_id\": 1},{\"code\": \"AR\",\"language\": \"Arabic\",\"language_id\": 2}]', 'About us', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_viewed`
--

CREATE TABLE `users_viewed` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_viewed`
--

INSERT INTO `users_viewed` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 49, 22, '2023-09-26 07:13:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_language_data`
--

CREATE TABLE `user_language_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_language_data`
--

INSERT INTO `user_language_data` (`id`, `user_id`, `language`, `created_at`, `updated_at`) VALUES
(1, 22, 'English,Arabic', '2023-09-26 02:06:38', '2023-09-26 02:06:38'),
(2, 1, '', '2023-09-26 02:06:38', '2023-09-26 07:37:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_data`
--
ALTER TABLE `post_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_comments`
--
ALTER TABLE `users_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_ratings`
--
ALTER TABLE `users_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_shared`
--
ALTER TABLE `users_shared`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_viewed`
--
ALTER TABLE `users_viewed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_language_data`
--
ALTER TABLE `user_language_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `post_data`
--
ALTER TABLE `post_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users_comments`
--
ALTER TABLE `users_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_ratings`
--
ALTER TABLE `users_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_shared`
--
ALTER TABLE `users_shared`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_viewed`
--
ALTER TABLE `users_viewed`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_language_data`
--
ALTER TABLE `user_language_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
