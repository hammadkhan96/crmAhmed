-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2021 at 02:04 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hammad`
--

-- --------------------------------------------------------

--
-- Table structure for table `absences`
--

CREATE TABLE `absences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `medical_certificate` tinyint(1) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `absences`
--

INSERT INTO `absences` (`id`, `external_id`, `reason`, `comment`, `start_at`, `end_at`, `medical_certificate`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'd3a535a1-022a-49dd-b91e-1a89c18e1bc9', 'voluptates', NULL, '2021-10-19 12:25:32', '2021-10-22 12:25:32', NULL, 52, '2021-10-19 12:25:32', '2021-10-19 12:25:32'),
(2, '874776fe-3454-4c6d-b144-8e541be83277', 'voluptatibus', NULL, '2021-10-19 12:25:32', '2021-10-22 12:25:32', NULL, 53, '2021-10-19 12:25:32', '2021-10-19 12:25:32'),
(3, '2252da88-cf5d-4e48-a72e-eedea8d978ec', 'aut', NULL, '2021-10-19 12:25:32', '2021-10-22 12:25:32', NULL, 54, '2021-10-19 12:25:32', '2021-10-19 12:25:32'),
(4, '83a98f68-49c8-4a83-9469-354094b1b494', 'est', NULL, '2021-10-17 12:25:32', '2021-10-20 12:25:32', NULL, 52, '2021-10-19 12:25:32', '2021-10-19 12:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `log_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `properties` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `color` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_hours`
--

CREATE TABLE `business_hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `open_time` time DEFAULT NULL,
  `close_time` time DEFAULT NULL,
  `settings_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `business_hours`
--

INSERT INTO `business_hours` (`id`, `day`, `open_time`, `close_time`, `settings_id`, `created_at`, `updated_at`) VALUES
(1, 'monday', '09:00:00', '18:00:00', 1, '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(2, 'tuesday', '09:00:00', '18:00:00', 1, '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(3, 'wednesday', '09:00:00', '18:00:00', 1, '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(4, 'thursday', '09:00:00', '18:00:00', 1, '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(5, 'friday', '09:00:00', '18:00:00', 1, '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(6, 'saturday', '09:00:00', '18:00:00', 1, '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(7, 'sunday', '09:00:00', '18:00:00', 1, '2021-10-19 12:25:23', '2021-10-19 12:25:23');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_number` bigint(20) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `industry_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purpose` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `external_id`, `address`, `city`, `company_name`, `client_number`, `user_id`, `industry_id`, `deleted_at`, `created_at`, `updated_at`, `purpose`, `date`, `time`, `category`, `status_id`) VALUES
(1, 'c56dcce2-177b-33a9-a02b-781718f6acac', 'Suite 515', 'Boyerborough', 'Feeney, Schoen and Ziemann', NULL, 2, 16, NULL, '2021-10-19 12:25:29', '2021-10-19 12:25:29', NULL, NULL, NULL, NULL, 1),
(2, '4e67c3e8-878b-37c6-aba3-2846c3ed7200', 'Suite 933', 'Angusside', 'Rosenbaum-Turcotte', NULL, 3, 20, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(3, '43d8ddb8-c766-34f6-b64e-96912dd16610', 'Apt. 444', 'North Vanessaberg', 'Williamson Inc', NULL, 4, 20, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(4, 'bd74f270-0fbe-30a1-8858-93e847fb90c3', 'Apt. 509', 'West Estelle', 'Treutel PLC', NULL, 5, 23, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(5, '0a13c2fe-b73d-3d75-9042-223c8b0cfe14', 'Suite 533', 'Mohrmouth', 'Yundt PLC', NULL, 6, 23, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(6, 'd3dee2a0-4c2e-38f0-befc-16d190919418', 'Apt. 198', 'Lake Janice', 'Hane and Sons', NULL, 7, 6, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(7, 'bdbe95eb-94ce-3405-ab63-7ff9219b01da', 'Suite 810', 'East Julia', 'Hartmann, Howell and Weissnat', NULL, 8, 21, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(8, '79f1b0ce-7eb7-3cae-bad9-4e938775b00d', 'Apt. 389', 'Chelseyport', 'Cassin Group', NULL, 9, 7, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(9, 'f49a21db-d36e-3cda-8c5f-ee33d9f33715', 'Suite 691', 'West Jimmie', 'Rutherford-Ferry', NULL, 10, 3, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(10, 'c94a1c4f-722e-3ef5-bda3-e36428e43832', 'Suite 285', 'East Orlando', 'Conn, Champlin and Monahan', NULL, 11, 9, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(11, '18f65f69-f5c1-3a43-87c7-39557d4e9a8e', 'Apt. 419', 'North Kenya', 'Ledner, Bogan and Paucek', NULL, 12, 17, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(12, '532351f0-968f-3386-96d5-7fe1262ab628', 'Apt. 042', 'Jacquesview', 'Luettgen-Bogan', NULL, 13, 11, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(13, '7f706ecb-7d0d-368a-97ed-486e1c88f3e1', 'Suite 915', 'Kristofferland', 'Breitenberg, Hill and Maggio', NULL, 14, 21, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(14, '550cb205-ee6d-3411-a3bf-bc2818ec107f', 'Suite 244', 'East Crawford', 'Keeling-Fritsch', NULL, 15, 14, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(15, '627f0577-132d-3587-a1c8-4a6c9760c5e0', 'Apt. 757', 'Lake Nakia', 'Johns-Bode', NULL, 16, 18, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(16, '7f279c0f-22ad-3f11-a0e9-618258962fb5', 'Suite 534', 'Elianside', 'Schaefer, Gleason and Hermann', NULL, 17, 11, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(17, '7a059cf0-ee1b-3624-bd2d-7e03556ac60c', 'Apt. 139', 'North Angelica', 'Graham Inc', NULL, 18, 12, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(18, '6a27b8c9-2bb8-36d2-b861-96eb828bf47c', 'Suite 219', 'Hermistonport', 'Thompson LLC', NULL, 19, 10, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(19, '0efd2f8c-6ce3-3f36-9dd4-da2467aba187', 'Apt. 774', 'Port Luis', 'Kiehn-Muller', NULL, 20, 11, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(20, 'a302dc40-1fb4-3433-8957-5a27247d74ad', 'Apt. 556', 'Aufderharton', 'Douglas-Olson', NULL, 21, 4, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(21, '6ffc0cf3-ebe8-3419-a94a-8e1358171ca5', 'Suite 016', 'Torphyburgh', 'Klein, Abbott and Treutel', NULL, 22, 16, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(22, '33372ec0-2025-3dc1-a149-62eb65c6a7a0', 'Suite 455', 'South Kennithborough', 'Paucek, Hermann and Goldner', NULL, 23, 8, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(23, 'f35015a7-5801-3922-9fb5-a815c3bc7f8c', 'Suite 111', 'Hansview', 'Schiller-Weissnat', NULL, 24, 8, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(24, '62749be4-8a72-3d18-9c09-d7c973b1eb51', 'Suite 042', 'Shanonland', 'Moore-Lehner', NULL, 25, 19, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(25, '93342b80-5688-39db-982e-c4fe190f1399', 'Suite 760', 'New Zachariah', 'Mosciski, Lehner and Krajcik', NULL, 26, 17, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(26, 'c4234bb3-df1b-37d3-8cf6-02f8b8763f8a', 'Apt. 294', 'West Nick', 'Feest, Dooley and Kovacek', NULL, 27, 6, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(27, 'b4ad9887-af2f-3006-8e64-52fe37fdb770', 'Apt. 041', 'South Lera', 'King-Daugherty', NULL, 28, 8, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(28, 'faaf60b2-cf2e-3a69-8568-cdcd92f91501', 'Suite 554', 'Skilesborough', 'Howell, Mitchell and Murray', NULL, 29, 23, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(29, 'dcf6fe0d-256e-3425-a861-08b61d864569', 'Apt. 370', 'Olsonmouth', 'Wintheiser, Erdman and Schoen', NULL, 30, 12, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(30, '332c8af0-5882-34c3-bd3b-e7f8ae819244', 'Apt. 651', 'Walkershire', 'Breitenberg-Bashirian', NULL, 31, 23, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(31, '25789e6a-09f9-31fc-af6d-47a15bd7c171', 'Apt. 742', 'New Sean', 'Grimes, Stokes and Bechtelar', NULL, 32, 13, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(32, '37dedd6b-b384-33cc-a92a-4e33cbcbdad3', 'Suite 430', 'Port Kris', 'Thiel Ltd', NULL, 33, 2, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(33, '8a56ed3e-d5bf-341c-9ba4-2f571841127f', 'Suite 352', 'South Joel', 'Bayer, Roberts and Wilkinson', NULL, 34, 21, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(34, 'b41b959d-5831-30f9-9d59-fd5e2dda3ffc', 'Suite 101', 'Conroymouth', 'Corkery Inc', NULL, 35, 15, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(35, '7954fb36-5c99-3c3c-bf61-5dba5c6eb15d', 'Suite 875', 'Jordytown', 'Franecki, Hane and Christiansen', NULL, 36, 7, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(36, '8e70652c-66ca-3324-8f09-2013a5055c4c', 'Suite 963', 'Goodwinhaven', 'Ebert LLC', NULL, 37, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(37, '577b2f72-e405-3c5d-96d4-0b8b52cd92b4', 'Suite 936', 'South Garrisonfort', 'Wiegand and Sons', NULL, 38, 18, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(38, 'ee14d408-8624-3c05-9aa5-f17e4eadad3a', 'Suite 186', 'South Dusty', 'Cruickshank, Nikolaus and Gerhold', NULL, 39, 13, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(39, '15782d04-0f09-3c5d-9881-b489546ef3f4', 'Suite 290', 'Maximeview', 'Flatley and Sons', NULL, 40, 13, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(40, 'b92ff326-8918-3369-8067-7a012186d89f', 'Apt. 400', 'Lake Zenamouth', 'Paucek and Sons', NULL, 41, 11, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(41, '9d8afffe-d614-3b45-86ab-f144c57f1055', 'Suite 015', 'Markusport', 'Trantow, Durgan and Dickinson', NULL, 42, 14, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(42, 'b9c5942e-2d44-3ce7-a0ed-558fb4f07f8a', 'Suite 388', 'New Cristian', 'Stoltenberg, Kuhn and Welch', NULL, 43, 3, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(43, '516e2ea8-e7d2-303a-accc-ed6ace63c67e', 'Suite 742', 'New Camren', 'Ruecker-Predovic', NULL, 44, 11, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(44, '06ccb311-86c4-3d3c-ab21-6fcf2daabbb0', 'Suite 989', 'Ortizton', 'Grant-Dibbert', NULL, 45, 20, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(45, '9aa7421e-eb48-3e3f-aaad-d10e4616bc32', 'Apt. 108', 'Pricefort', 'Feil Ltd', NULL, 46, 23, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(46, 'f6705b39-8812-3cc8-9348-51842ada5455', 'Apt. 522', 'Erikaland', 'Turcotte Inc', NULL, 47, 8, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(47, '7c6d428a-2fa0-3461-9771-c21283c96eef', 'Apt. 310', 'New Diegoside', 'Abbott, Mayert and Pfannerstill', NULL, 48, 6, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(48, '0aca8671-1755-3c37-b7aa-4f5d3bdd5799', 'Suite 413', 'East Edwinashire', 'O\'Hara Inc', NULL, 49, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(49, 'a7b406c3-f993-336d-8c1a-4c24048abc76', 'Suite 096', 'Hayleyhaven', 'Nolan PLC', NULL, 50, 3, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(50, 'eb6209ec-46ca-39b3-804c-b1bc69bd3395', 'Suite 079', 'New Jamel', 'Price, Mills and West', NULL, 51, 9, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30', NULL, NULL, NULL, NULL, 1),
(51, '33f9792c-930f-3c06-b88b-707409674087', 'Suite 318', 'Cartwrightfort', 'Kilback, Bailey and Wolff', NULL, 57, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(52, '1ac165f8-581b-3228-8d6d-e82f5c14c3c1', 'Suite 252', 'West Lavonne', 'Harber and Sons', NULL, 58, 11, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(53, '5f2e7644-c96f-39d1-9c58-1672bd5546e5', 'Suite 144', 'Stokeschester', 'Kuhn-Mayer', NULL, 59, 9, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(54, 'e25ac07b-a44e-346e-a9cd-e3ea887eb455', 'Suite 395', 'New Eva', 'Skiles, Parker and Steuber', NULL, 60, 12, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(55, 'a4073f7b-5c06-37b7-bd24-4a96b26c630f', 'Apt. 530', 'Port Tillman', 'Runolfsdottir, Schuppe and Purdy', NULL, 61, 16, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(56, '1e61cc17-b4d0-3609-97f6-ff63e2161e4b', 'Suite 615', 'South Cruz', 'Johns, Zulauf and Hand', NULL, 62, 5, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(57, 'dc945622-0b88-3271-9a9a-a1e003c876ff', 'Suite 778', 'Benjaminshire', 'Jenkins-Becker', NULL, 63, 13, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(58, '99267d05-e441-348b-bcb4-76e31e84b4bd', 'Suite 321', 'West Bernardshire', 'Trantow LLC', NULL, 64, 16, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(59, 'de2160b8-79c6-3a5f-bff4-c40a420d75aa', 'Suite 491', 'Ivystad', 'Romaguera, Ward and Shanahan', NULL, 65, 16, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(60, '2215f2d8-b026-329d-8030-f35686b21b27', 'Apt. 700', 'South Lilla', 'Funk LLC', NULL, 66, 7, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(61, '3dd6f2d4-39b0-3b22-b8bf-8a32da3f15eb', 'Apt. 811', 'West Tom', 'Gleason-Adams', NULL, 67, 16, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(62, '78250ea4-2025-396e-99fa-e6445bf43369', 'Apt. 281', 'Verdiemouth', 'Senger, Hills and Considine', NULL, 68, 14, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(63, '9f56e1c8-0792-30db-90e7-7a78fbc3c553', 'Suite 009', 'Strosinland', 'Robel-Renner', NULL, 69, 4, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(64, '9bd2b672-ff62-3e31-b724-30e2cc191196', 'Apt. 788', 'North Elnoramouth', 'Shields-Lemke', NULL, 70, 10, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(65, '32f10c80-0dc9-36ec-a7b8-e3be3a9f4bde', 'Apt. 271', 'Orvilleview', 'Kassulke and Sons', NULL, 71, 5, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(66, '1a0c7e37-3b91-30ba-8433-edb0ec62e55b', 'Apt. 268', 'North Justenhaven', 'Considine-Jakubowski', NULL, 72, 22, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(67, '45415662-785a-3f49-a57d-909c130c265a', 'Apt. 991', 'West Merl', 'Veum, Metz and Kassulke', NULL, 73, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(68, 'f4f1c0bc-e6b3-35e3-85b3-dd755fd9c689', 'Apt. 594', 'Quinnborough', 'Gottlieb, Lakin and Runolfsson', NULL, 74, 19, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(69, 'edb977ea-62b5-3aeb-a977-63cb1337a009', 'Apt. 374', 'Port Pearline', 'Bradtke PLC', NULL, 75, 19, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(70, '1ba04979-5e5f-3f75-85dc-69cde11d27a2', 'Apt. 893', 'Browntown', 'Watsica Ltd', NULL, 76, 8, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(71, '1d83d5f8-277d-32d6-a891-110701deddf4', 'Suite 184', 'West Santinastad', 'Runolfsson, Quitzon and Dicki', NULL, 77, 17, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(72, 'e498201d-65b3-3f88-8560-3cdfba707dda', 'Apt. 374', 'Ondrickachester', 'Satterfield-Schroeder', NULL, 78, 18, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(73, 'b986f01b-119e-316a-b10f-0328e4edc24d', 'Apt. 005', 'Hayesfort', 'Walker Group', NULL, 79, 24, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(74, '463be785-a697-3346-a3ea-b3a0fec28c9a', 'Suite 906', 'Leschberg', 'Reilly, Runolfsdottir and Kuhn', NULL, 80, 23, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(75, 'deff7f1f-9254-3ebe-9daf-add25c605b4b', 'Apt. 862', 'Parisianborough', 'Keeling, Morar and Jacobson', NULL, 81, 3, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(76, 'bf27afc9-d17a-3a12-8b83-0a2966facc26', 'Suite 998', 'Sanfordmouth', 'Lakin, Bogan and Schuster', NULL, 82, 13, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(77, 'b1ae09a9-6c59-31c1-94a9-3b2bb8ad9016', 'Apt. 734', 'Lake Morgan', 'Wisozk, Bauch and Dibbert', NULL, 83, 22, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(78, '14761030-be02-3852-a567-bf688b0caf8a', 'Apt. 594', 'New Bettye', 'Raynor, Emmerich and Leannon', NULL, 84, 22, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(79, '9bb5fd03-6c95-38e8-813a-4273e5b42467', 'Suite 895', 'Blicktown', 'Hauck, Medhurst and Grant', NULL, 85, 19, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(80, '0d72d704-789b-3848-b7d1-ca9369ada50d', 'Apt. 112', 'Brooklyntown', 'Blanda and Sons', NULL, 86, 19, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(81, 'eac8e82d-f4bd-32dc-856f-467e714336f5', 'Apt. 196', 'Lake Karelle', 'Ruecker-Kuhn', NULL, 87, 2, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(82, '05bc0f1f-50ce-37af-abb6-bcbe4cb6618d', 'Apt. 002', 'Lake Macey', 'Yost-Orn', NULL, 88, 4, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(83, 'd987a230-e869-3a8e-92de-29b3139ff5ec', 'Apt. 359', 'Turnerstad', 'Feest-Powlowski', NULL, 89, 18, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(84, 'fd1eb7e7-7f78-3646-af96-e3d11692e992', 'Suite 220', 'Coramouth', 'Simonis-Zemlak', NULL, 90, 2, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(85, '5baf4290-99e5-3742-bb01-c18f24e2ad97', 'Apt. 917', 'South Alvah', 'Heathcote Ltd', NULL, 91, 18, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(86, '4794f64e-dce8-3647-b611-f59b6c24c7da', 'Suite 269', 'South Maryjane', 'Bechtelar-Hamill', NULL, 92, 3, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(87, '88fe8b01-1b87-3a15-9a0d-3d51cee98210', 'Suite 531', 'New Annette', 'Greenfelder-Blick', NULL, 93, 25, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(88, '6eb86aeb-983d-38b6-b59b-dabae2996809', 'Apt. 986', 'Johnnietown', 'Erdman, Greenfelder and Kuhlman', NULL, 94, 20, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(89, 'b695a4bc-6fec-3e27-b9b0-152c5973fdab', 'Apt. 032', 'Morarshire', 'Schimmel Group', NULL, 95, 22, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(90, '36d18277-25cb-3124-a0f5-406a39f36ab8', 'Suite 284', 'Gleasonville', 'Wilderman-Volkman', NULL, 96, 11, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(91, '957a75c9-6fb7-3b26-9b7f-0ac0787b6efe', 'Apt. 469', 'Alveraville', 'Torp-Pfeffer', NULL, 97, 20, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(92, '7964eafc-8148-35ed-9812-3aab89e8e1c6', 'Apt. 262', 'Port Rossie', 'Ankunding, Runte and Morissette', NULL, 98, 16, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(93, 'a978c14f-edc8-38e6-b2b9-958b41eaeb38', 'Apt. 442', 'West Emmabury', 'Cronin-Koepp', NULL, 99, 15, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(94, '8f714166-4467-34b5-8659-e6782ad09239', 'Apt. 489', 'Boyleland', 'King Ltd', NULL, 100, 15, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(95, '3499b5f6-13c8-311f-b7a2-7f0ad4939b24', 'Apt. 165', 'Assuntatown', 'Rowe and Sons', NULL, 101, 10, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(96, 'da979f50-beb3-3613-90bd-efbee3ca13df', 'Apt. 519', 'West Yolanda', 'Emard, Feil and Christiansen', NULL, 102, 12, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(97, '4c78a884-2d4c-398b-a587-7b4fd00424ab', 'Apt. 779', 'Lafayetteton', 'Raynor-Anderson', NULL, 103, 12, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(98, '2c3ae119-16fb-3ca4-8613-93d4e9c58e7c', 'Apt. 176', 'East Roselynfurt', 'Kuphal Ltd', NULL, 104, 23, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(99, '49c20235-16cd-3c16-ba9c-3269ec4bee41', 'Suite 227', 'New Lutherstad', 'Schaden PLC', NULL, 105, 5, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(100, '897feaa4-afb8-3bbd-90c0-d4582f90f074', 'Apt. 636', 'Lake May', 'Ortiz-Wunsch', NULL, 106, 22, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', NULL, NULL, NULL, NULL, 1),
(101, '1bdbdfbe-4a9c-3c57-8438-61e385156fa9', 'Apt. 722', 'East Dan', 'Walsh Inc', NULL, 109, 15, NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', NULL, NULL, NULL, NULL, 1),
(102, '08d314be-9eea-3ad8-a3ad-7743794feada', 'Suite 559', 'Port Alva', 'McClure and Sons', NULL, 112, 21, NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', NULL, NULL, NULL, NULL, 1),
(103, '21cda488-af26-3aee-8a9f-084664c2c394', 'Apt. 843', 'West Crystelmouth', 'Hayes-Harber', NULL, 115, 7, NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', NULL, NULL, NULL, NULL, 1),
(104, '737294ef-ed47-38d7-a0a9-8f02219ac494', 'Suite 189', 'Mosciskifurt', 'Langworth-Romaguera', NULL, 118, 12, NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', NULL, NULL, NULL, NULL, 1),
(105, '03dc6a6a-7088-3f2b-a3b4-2e2ed367b400', 'Apt. 758', 'Austinborough', 'Jacobson Group', NULL, 121, 7, NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', NULL, NULL, NULL, NULL, 1),
(106, 'a8f1aa45-bd3e-31fb-a698-8d4fc913f285', 'Apt. 907', 'West Myrnafurt', 'Schumm-Conroy', NULL, 124, 19, NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', NULL, NULL, NULL, NULL, 1),
(107, 'c0ff800e-7083-3427-bf24-8a12edbdd22e', 'Suite 476', 'Jayceland', 'Gleason-Medhurst', NULL, 127, 14, NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', NULL, NULL, NULL, NULL, 1),
(108, 'ce1e75eb-5aa1-356e-a751-5e417bbde21a', 'Apt. 727', 'Quitzontown', 'Ruecker LLC', NULL, 130, 19, NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', NULL, NULL, NULL, NULL, 1),
(109, '559929eb-1bbe-3ccc-903b-72737adae140', 'Suite 799', 'Mozellchester', 'Heidenreich-Wunsch', NULL, 133, 17, NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', NULL, NULL, NULL, NULL, 1),
(110, 'aeedb4bc-b56c-36fb-bd43-ed5894cfe57c', 'Suite 264', 'Robinton', 'Blanda and Sons', NULL, 136, 10, NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', NULL, NULL, NULL, NULL, 1),
(111, '21c8a269-d9be-326b-a8d9-6aaef8fd8603', 'Apt. 657', 'West Erwinton', 'Ratke-Armstrong', NULL, 139, 10, NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', NULL, NULL, NULL, NULL, 1),
(112, '32ba80ea-1b09-3a8d-b159-9fbb20f74ffe', 'Suite 341', 'West Ofelia', 'Lowe-Towne', NULL, 142, 14, NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', NULL, NULL, NULL, NULL, 1),
(113, '4e88ef5b-d67b-3c27-ad5d-95b6010f029a', 'Apt. 749', 'Port Cleoburgh', 'Dietrich LLC', NULL, 145, 20, NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', NULL, NULL, NULL, NULL, 1),
(114, '15cdf7df-da48-39d5-829e-0ed908e3b20c', 'Apt. 333', 'Mertzbury', 'Green PLC', NULL, 148, 5, NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', NULL, NULL, NULL, NULL, 1),
(115, '93a8f7b9-678a-3770-bb41-6256112f4463', 'Suite 668', 'Hodkiewiczville', 'Tillman-Parisian', NULL, 151, 5, NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', NULL, NULL, NULL, NULL, 1),
(116, '3ba2781b-450b-33b9-ba97-bc9236a1d7ec', 'Apt. 468', 'Hadleyview', 'Bogisich-Collins', NULL, 154, 24, NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', NULL, NULL, NULL, NULL, 1),
(117, '625a1adf-bb66-3168-9192-7febb1233409', 'Suite 106', 'Meaghanburgh', 'Wuckert-King', NULL, 157, 18, NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', NULL, NULL, NULL, NULL, 1),
(118, 'e07f7348-dc7c-3b43-b142-97a02c801a86', 'Suite 794', 'North Justice', 'Macejkovic, Kovacek and Murazik', NULL, 160, 7, NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', NULL, NULL, NULL, NULL, 1),
(119, '1b9755bc-7c77-32ce-b6f3-2d44475f5b48', 'Apt. 702', 'Williamsonmouth', 'Kemmer-Greenholt', NULL, 163, 1, NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', NULL, NULL, NULL, NULL, 1),
(120, '8ad86c5b-cfbe-32bd-b398-6208ec48cc39', 'Suite 065', 'Lake Alaina', 'Prohaska Inc', NULL, 166, 1, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_visits`
--

CREATE TABLE `client_visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` time NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `external_id`, `description`, `source_type`, `source_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'c1d42376-9a55-44ea-a07e-1feb6eee121b', 'Odio quis laborum et cupiditate maxime. Modi sequi fugiat omnis atque ullam. Aliquid debitis voluptates cupiditate quam. Quae possimus libero dolorem eum accusamus. Quaerat aut atque quis cum aspernatur. Voluptas suscipit perferendis cumque eos aliquam ipsa. Et praesentium molestias quae natus magni aspernatur.', 'App\\Models\\Task', 1, 48, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(2, '22464cac-58c2-4fa2-b91e-ded58272c90d', 'Sed quaerat saepe sit aut. Inventore vel temporibus tempora sed est et. Iure rerum enim magnam vel. Fugiat quia fugiat qui dolor iure laborum. Voluptas possimus est esse a et in pariatur. Et quos consequatur aspernatur delectus.', 'App\\Models\\Task', 1, 48, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(3, 'e255be12-3f26-4cd4-b1bf-5455070e7ad1', 'Temporibus enim quis temporibus sint animi aut. Omnis et distinctio consequatur. Deleniti labore eius dolorem et sint sit et. Et quo consequatur praesentium at cupiditate. Aliquid illum eaque non explicabo minima fugit sed. Excepturi aperiam et non voluptas quisquam ipsam. Ipsum debitis occaecati porro consequatur iure. Sequi voluptatem architecto animi occaecati id placeat. Dolorum incidunt temporibus suscipit perferendis.', 'App\\Models\\Task', 1, 48, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(4, '4fd6ac14-da88-454d-906b-d114faf7d189', 'Architecto et eos rerum excepturi amet quae voluptas. Repellat laborum eum animi molestiae fuga.', 'App\\Models\\Task', 2, 78, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(5, '334c1b7a-65ca-43c3-b582-7594f8825264', 'Consequatur excepturi earum quidem et dolores unde qui. Dolore in suscipit totam eos nesciunt nemo cum. Soluta non exercitationem ut ea fugiat est aut.', 'App\\Models\\Task', 2, 78, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(6, '71de2f7b-5dc3-4bf1-a103-208da8311f2d', 'Excepturi unde optio et aut eum est fugiat. Voluptas est rem minima exercitationem. Fugiat maxime eos et tempore pariatur ut dignissimos. Inventore qui soluta debitis quo qui reiciendis. Consequuntur consequuntur vero veritatis dolorem explicabo nostrum. Rerum aut nam adipisci exercitationem. Ea quisquam dolor est libero ratione architecto itaque iusto.', 'App\\Models\\Task', 2, 78, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(7, '6a0faef2-b0c1-4929-bfda-3274c9cd1b4b', 'Sit facere adipisci illo ut perferendis doloremque ea. Explicabo eligendi unde possimus placeat nihil harum et. Suscipit iusto illum quidem officia autem sed eveniet. Sunt consequuntur natus qui alias reiciendis delectus voluptas. Est beatae praesentium id aut voluptatem.', 'App\\Models\\Task', 3, 50, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(8, 'ad4280d4-0dba-40cf-9a1d-8f4b6041934e', 'Laudantium sit necessitatibus vel eligendi eum id. Eos sed magnam animi consequatur. Quia velit alias consequatur dolorem sed mollitia id illo. Vero sed blanditiis et possimus reiciendis autem est. Odit aut error vel nisi voluptas sequi fuga sunt. Delectus quis consectetur vel vel vitae. Corrupti quibusdam nesciunt nihil illo.', 'App\\Models\\Task', 3, 50, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(9, '5bac5d34-653d-43d7-bdaf-b074731822aa', 'Quia vel molestiae sint est saepe ex alias. Quidem pariatur quo voluptas similique officiis. Architecto quidem atque libero. Eos mollitia officiis dolores nihil. Temporibus consequatur pariatur recusandae ipsam. Voluptate culpa ut odio ullam ullam ex ut. Iusto ipsa delectus dolorem.', 'App\\Models\\Task', 3, 50, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(10, '4d399ade-bb81-4c52-ac73-41c9480620cd', 'Voluptatem at nisi velit aut soluta. Quaerat temporibus animi atque repudiandae magnam aspernatur. Quisquam eius numquam ipsum numquam sapiente commodi ipsam. Iusto enim et cupiditate quia aspernatur. Magnam amet et totam. Hic ad ea fugit voluptatem rerum et. Vel recusandae dolorem velit nemo beatae ut placeat. Et tempore ex eos praesentium quo ducimus et. Illum corporis pariatur dignissimos quis eum. Eos molestias hic hic inventore voluptas. Ipsam ipsam ut odio tenetur numquam repellat. Molestias inventore tempora facere reiciendis explicabo amet odio non.', 'App\\Models\\Task', 4, 27, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(11, '70cb8a10-81e9-4a45-be5e-e3e832e13a76', 'Asperiores hic labore velit necessitatibus nemo. Aut dolor quia natus. Ducimus aut a dicta quo repellendus. Et corporis nihil reiciendis. Esse veritatis dicta ipsum non officiis. Voluptas veritatis quam sequi id sed dolorem repudiandae. Nesciunt soluta quos vel amet repudiandae earum.', 'App\\Models\\Task', 4, 27, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(12, 'def5b835-9e1e-4b40-bed4-41ec71a7ff7d', 'Quis quia est et ut. Libero quo sed qui in ut et aut. Dolorum suscipit odio sit voluptates dolorem quas.', 'App\\Models\\Task', 4, 27, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(13, '9fe5cd6d-d234-4843-9944-2c5221165527', 'Qui omnis labore modi aliquam. Est tempore aut omnis et consectetur consequatur. Occaecati alias qui dolor. Aut eum est dolor voluptatem et vel et. Pariatur et sunt laboriosam quo cupiditate. Blanditiis consequatur quis inventore necessitatibus voluptates ipsum veritatis. Esse dolor eos at non fuga doloribus placeat. Pariatur minus voluptas molestiae. Est sit voluptas sit sit nesciunt. Deleniti est velit ad est nemo enim eaque. Et dolorem aut sed quis error laboriosam rerum labore.', 'App\\Models\\Task', 5, 57, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(14, '766667ae-110d-4957-b58f-ec05f0092775', 'Repellendus voluptatum in hic possimus mollitia. Iste aut qui non ipsa voluptate. Dolores minus consectetur aliquid sint aliquid. Aperiam delectus voluptatum ut vel ipsa aut. Odio tempora quia eos rem eveniet. Ex asperiores repudiandae sit et. Deleniti asperiores qui itaque ea. Voluptas sed repellendus minus qui. Rerum id tempora enim laudantium veniam numquam pariatur commodi. Ipsam hic quam quasi aut ea explicabo dolorem. Similique impedit ea pariatur aut corporis dolores.', 'App\\Models\\Task', 5, 57, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(15, '2cb46de5-c404-43ec-b419-5cad6aa6dcc5', 'Doloribus quisquam possimus necessitatibus cum voluptas aut. Officiis omnis eveniet delectus voluptates. Inventore iste cumque nisi et rerum.', 'App\\Models\\Task', 5, 57, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(16, '8a24c30c-bb9c-4259-9f46-5d88ed6941c6', 'Quaerat eum vitae nesciunt ipsam sequi velit dolores. Veniam illo id voluptas. Eos ut nihil accusantium. Magnam dolores adipisci voluptates placeat. Nihil distinctio ea ipsa rerum vel cumque voluptas magnam.', 'App\\Models\\Task', 6, 76, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(17, '957fedfc-6296-4d2f-901d-2603229e6ae6', 'Facere molestiae ea quo et enim consectetur aut. Pariatur sint occaecati consectetur non quos reiciendis. Omnis expedita rerum aut velit beatae ad cum minima. Molestiae iusto voluptates corporis blanditiis perferendis. Laudantium architecto occaecati rerum ratione et hic quia.', 'App\\Models\\Task', 6, 76, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(18, '5fb33ba8-e1b7-435e-9f58-ade6e5d43a94', 'Fugit maiores repudiandae veniam. Placeat est dolores exercitationem adipisci. Vel non et illo necessitatibus molestiae. Nemo quod quia vel.', 'App\\Models\\Task', 6, 76, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(19, '380cf6c8-5d2d-426f-b23c-6c8fdf18b08d', 'Unde architecto ut pariatur error. Consectetur sint sit enim occaecati saepe vero aut aut. Ea expedita est culpa odio suscipit.', 'App\\Models\\Task', 7, 35, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(20, 'c8d8a713-6a11-47ea-9b40-898434508004', 'Omnis deleniti molestiae consequatur inventore ab labore non. Voluptas dolores officia illo quisquam doloremque. In qui ut sint eaque est aperiam distinctio.', 'App\\Models\\Task', 7, 35, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(21, 'e47c752f-c321-4787-b7d3-9df3276ddcf4', 'Ut dolorem harum ut vero quia dolor. Est est fuga et voluptatem facere quia. Pariatur similique fugiat ratione aut. Qui temporibus aut iure debitis delectus molestiae et. Temporibus dolor qui modi. Aut animi odio dolorum quibusdam id quo sequi. Corrupti fugit aut consequatur et placeat voluptas quod facere. Natus dolor alias quia rerum eos. Vitae qui provident praesentium ut id maxime.', 'App\\Models\\Task', 7, 35, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(22, 'abc05530-c179-48fa-b14a-662b928018f6', 'Qui beatae aut perspiciatis fuga voluptatem. Quae odit blanditiis eum ratione. Ab rerum ab sapiente facere dolores.', 'App\\Models\\Task', 7, 45, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(23, '8476e2ee-59d4-4c4a-8b09-3e67c190aed4', 'Tenetur aut cumque saepe necessitatibus quis sit. Quo enim blanditiis numquam. Iure sunt est et quia enim similique. Commodi optio quia temporibus omnis tempore illo. Quisquam non nulla et labore facilis ratione necessitatibus. Distinctio non aut excepturi nihil et. Fugit voluptatem illum voluptatem vero. Accusamus voluptatem facere consequuntur voluptatem. Dicta pariatur impedit dolorem vero qui provident assumenda. Ut quia quaerat delectus.', 'App\\Models\\Task', 7, 45, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(24, 'a3e0c451-d420-420d-9044-1a1311562235', 'Minus eum dignissimos nihil neque nisi totam. Provident fuga doloribus mollitia sapiente dolorum. Ab natus nihil nemo non perferendis est.', 'App\\Models\\Task', 7, 45, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(25, '207cc755-dffe-4f88-abe6-aac5c69edf7a', 'Qui et qui laudantium dicta voluptatibus. Sint vel nam beatae illo debitis. Necessitatibus quia enim quis quia omnis laudantium vero.', 'App\\Models\\Task', 8, 95, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(26, '523567c0-0aec-4bd4-87b6-c66ebd600f1e', 'Officiis nulla quia ex nisi. Ab autem nam alias eius accusamus dicta deleniti. Voluptatem maiores qui voluptatem nesciunt ipsa ab et. Accusantium pariatur quos nihil molestias ut ducimus ab. Culpa sit et sint iure. Enim sed iste est voluptate doloribus in provident.', 'App\\Models\\Task', 8, 95, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(27, '03af0ac1-7253-44ed-8054-a407a5d28080', 'Ut ab distinctio dolorem consequatur quisquam totam quis sequi. Odit quas voluptatem quasi sint et assumenda. Sit tenetur et quidem quos. Et officiis aut impedit ratione deleniti reprehenderit.', 'App\\Models\\Task', 8, 95, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(28, 'bbcbc9e4-32af-44df-a5c7-ac2dce50e4f6', 'Veritatis excepturi neque et labore minima nam. Est qui enim minima qui soluta. Est eum porro deleniti magni quas molestiae reiciendis a. Sunt beatae eos optio aut aspernatur. Rerum modi qui nulla voluptatem. Rerum voluptate tenetur architecto et earum voluptate ipsum nihil. Et non similique animi voluptatem beatae qui nisi. Necessitatibus est repudiandae ullam quaerat dolor. Dignissimos ipsum deleniti minus dolorem.', 'App\\Models\\Task', 9, 91, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(29, '9aadb340-6983-46d6-8909-6b152261ec1c', 'Ut doloribus omnis quo quo amet cumque neque. Dolorum eum sit id qui quod magnam ut. Dolore dignissimos corporis suscipit ducimus accusantium unde laudantium. Omnis quis quia necessitatibus recusandae esse fugit. Recusandae sed dolor eius eligendi occaecati dicta. Autem omnis et accusantium et esse laboriosam. Eaque voluptatem ipsum deleniti neque eos consequatur. Voluptatem et consequatur eligendi et. Ut quas nemo soluta accusantium non nobis et. Recusandae et ipsum voluptatibus placeat sed maxime. Quo et laudantium dolorem voluptate at alias. Culpa assumenda ipsa facilis beatae debitis voluptatem numquam.', 'App\\Models\\Task', 9, 91, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(30, '8315609d-1628-4fbf-ad3a-502ab14e6ba5', 'Accusantium tempore dignissimos aliquam id est dolorem. Suscipit quis quae repellendus voluptate omnis sunt. Maxime est rerum voluptas velit aut fugit temporibus ea. Quod aut quos dolorum officiis numquam ut culpa. Nihil necessitatibus rem et. Nam vitae amet eligendi culpa minima perferendis id voluptate. Perspiciatis recusandae et voluptates necessitatibus qui. Autem commodi aliquam illo sint officiis. Sunt quisquam facilis nobis. Iure porro magnam in consectetur repellat nihil ea alias. Id esse in enim ut. Deserunt nam eum praesentium sed fugiat impedit necessitatibus. Repellat rerum sed facere enim.', 'App\\Models\\Task', 9, 91, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(31, '6c2ad595-8307-4123-836b-1964ac755048', 'Tenetur architecto aut nobis aut. Dolorem maiores quam quibusdam at aspernatur. Voluptate sed quia qui et accusamus. Veniam aperiam asperiores id quod rem delectus nisi. Iste ut animi velit minima fugit provident. Reiciendis dignissimos temporibus assumenda suscipit dolor quae neque. Esse eligendi magni ut doloremque voluptatum. Voluptatum quo non nostrum voluptatem aut iure suscipit. Velit consequatur expedita omnis ipsum magni molestiae modi. Vero fuga labore recusandae deleniti perferendis aspernatur. Reiciendis atque occaecati aspernatur.', 'App\\Models\\Task', 10, 26, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(32, '4a352236-57d3-41f6-965b-95c67fc1f940', 'Praesentium aliquam molestiae sunt et voluptatem. Earum officiis vitae deleniti vel.', 'App\\Models\\Task', 10, 26, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(33, '9e83c515-a353-428f-8a0d-e8f5ed5d9560', 'Voluptate dolorum ab et sed nam voluptatem officiis. Dolorum voluptas qui reprehenderit soluta sapiente.', 'App\\Models\\Task', 10, 26, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(34, 'd18a781a-a9f4-425b-9821-e374f5f2ae32', 'Non pariatur atque ipsum repellat velit. Odit corrupti provident cupiditate voluptatem nisi.', 'App\\Models\\Task', 11, 72, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(35, '0cfd044c-f2e0-4cc7-8d25-ee09f4cc0132', 'Facilis iusto fugit cupiditate. Veniam velit similique explicabo debitis ipsam ut voluptatibus sed. In suscipit dolorum qui qui. Nobis omnis fugit sunt voluptatum. Architecto et at voluptatibus aut officia officiis. Error et reiciendis ut nam porro. Animi temporibus magni provident et blanditiis. Quae magnam itaque ut sit quisquam vero ut. Molestiae quam eaque sed ratione. Similique voluptas qui et aut voluptas.', 'App\\Models\\Task', 11, 72, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(36, '141b8daf-cab5-4708-bfea-37b6bf74c649', 'Dolores perspiciatis ullam sit ea. Dolorum repellendus illum quam cupiditate. Aliquid minus amet pariatur amet voluptas ipsum quas. Quo consequatur fuga omnis quo eaque et et eos. Est praesentium animi eligendi ex dolorem et aut. Debitis earum adipisci totam. Ea ut tempore reprehenderit vero accusamus ut.', 'App\\Models\\Task', 11, 72, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(37, '0730cd86-669f-4ba9-ada1-3c732e6c9106', 'Et nam iure nam qui rerum. Non praesentium quis saepe. Qui ea iste consectetur itaque.', 'App\\Models\\Task', 12, 98, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(38, '4523750b-d3e9-4f37-badc-93a1dab3be15', 'Et voluptatum dicta sit reprehenderit et. Est explicabo rerum veritatis nihil. Ea enim distinctio inventore reprehenderit deserunt non iure ducimus. Omnis rem soluta eos sed explicabo deleniti. Facere asperiores qui itaque aut vero. Pariatur ex eos ratione ut possimus. Praesentium qui aliquid aut molestias repellat excepturi. Commodi tempore qui quod sequi quis quia recusandae.', 'App\\Models\\Task', 12, 98, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(39, 'fb4fe55f-8bf6-4308-a113-4acf1b328581', 'A aut quia omnis qui ducimus debitis ex. Dolor hic tempore expedita. Aut corrupti quasi distinctio molestias assumenda et vitae incidunt. Fugit voluptatibus et necessitatibus aut dolore. Beatae in blanditiis hic quod iure. Quidem reprehenderit nihil rem. Et nulla voluptatem amet et. Dolorem et debitis laborum ut. Sint totam architecto vel ut architecto. Voluptatem adipisci esse et facilis ipsum fuga amet.', 'App\\Models\\Task', 12, 98, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(40, 'c1445563-1132-43bf-a0d7-ce021effd98b', 'Ex voluptas aut doloremque aut perspiciatis. Voluptatem consectetur fugiat eum voluptas eaque. Nesciunt perferendis autem consequatur unde voluptatem laboriosam. Ipsam fugiat rerum natus sunt. Tempore hic distinctio ut doloremque unde minima quo. Omnis enim quis rerum iste. Accusantium ipsam amet suscipit eaque ullam. Et modi adipisci illo accusantium assumenda alias velit.', 'App\\Models\\Task', 13, 41, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(41, '22ed8c97-73e7-45f6-b101-69f2b1c90500', 'Ipsum enim sequi ut suscipit repellat neque qui. Quia animi ut mollitia a ratione voluptatem. Non cumque id illum eligendi voluptates aliquid enim. Harum ut inventore repudiandae aut facilis. Voluptatem et placeat quis quasi et. Facilis omnis aperiam ea. Deserunt libero quod dignissimos culpa voluptatem repellendus.', 'App\\Models\\Task', 13, 41, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(42, '1824822e-b814-445e-aee6-407e62b96ea8', 'Ullam facilis quia ab eos. Sit facilis aut adipisci asperiores ad. A quisquam et quaerat iste. Pariatur est qui fugit et dolor accusamus quia. Quia dolor et enim accusamus. Nihil sequi id ratione. Quibusdam aperiam corrupti similique et. Aliquid officiis ipsum maiores fugit. Et illo dolorem culpa quo. Officiis doloremque qui similique modi. Inventore quis sed aut dicta est culpa. Consequatur reiciendis voluptatem consequuntur voluptatibus occaecati.', 'App\\Models\\Task', 13, 41, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(43, 'd0a35428-afdf-4cab-b8cc-7a006e089223', 'Laborum voluptatibus ducimus quis recusandae ad. Exercitationem sit alias expedita quo.', 'App\\Models\\Task', 14, 11, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(44, 'cce6bca4-16fd-4c1b-808e-902828dcfad0', 'Voluptatem et animi dignissimos ipsum officiis aliquam. Reiciendis voluptatum porro iure quia accusamus eveniet enim. Ut quaerat dolorum et neque. Quo cupiditate dolores et earum velit dicta officiis. Vitae eos provident molestias distinctio saepe. Neque velit non fuga dolorum sequi. Similique corporis ea et sed fugit aspernatur nihil quibusdam. Hic sed iste harum voluptatem. Assumenda odio eos ea debitis.', 'App\\Models\\Task', 14, 11, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(45, '49f1c9d0-6e62-45cc-84dd-34a613c5e780', 'Eligendi id et consequatur autem. Est magnam nam atque quasi ex sapiente nihil aspernatur. Fugit est aut ut alias sed veritatis velit. Aut architecto architecto et voluptas. Quibusdam dolor aperiam quam deleniti omnis ut nihil. Nobis commodi reiciendis sint ullam perferendis. Nam dolores mollitia accusamus et. Exercitationem architecto voluptas non labore.', 'App\\Models\\Task', 14, 11, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(46, '22236710-4177-4415-b967-f184cd68b4a6', 'Repellat aut ea totam vero. Reprehenderit aspernatur sequi omnis repellendus amet. Nesciunt ad autem aspernatur distinctio accusantium explicabo dignissimos vel. Ut est quo voluptatem dignissimos omnis.', 'App\\Models\\Task', 15, 65, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(47, '1fe5cb63-c9f6-421c-8050-60120ed3217a', 'Aliquid nihil aut laudantium voluptatum illo itaque cumque. Cumque non tempore sunt est voluptate sapiente.', 'App\\Models\\Task', 15, 65, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(48, '9481baaf-fd16-419a-b6ce-a262932d5537', 'Eveniet non eos quis delectus voluptatibus consequatur omnis. Repellat et nulla quo molestias dolorem. Libero totam commodi aut commodi commodi fuga natus. In alias eaque excepturi dolore optio tempore voluptatem. Aut exercitationem quis recusandae praesentium facilis. Quod molestias omnis illum ullam. Non vero cupiditate atque reprehenderit nesciunt quasi doloremque. Optio illo quibusdam nam molestiae labore ullam culpa velit. Odio dolores eligendi commodi necessitatibus nostrum cupiditate.', 'App\\Models\\Task', 15, 65, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(49, '43723c78-c5c6-47d7-ba9c-20c60a32deb9', 'Nihil nihil esse quisquam odit. Consequatur deleniti alias eius. Ullam amet ab quaerat. Quia qui facilis unde facere. Ut inventore aperiam suscipit voluptatem. Excepturi facere voluptas voluptate quisquam fugiat. Omnis quidem reprehenderit tenetur. Fuga porro ea eveniet voluptas est pariatur assumenda.', 'App\\Models\\Task', 15, 67, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(50, '1ebdfde8-b880-4524-a5e5-c7baaa46883c', 'Qui animi aut deleniti consequatur dignissimos temporibus velit voluptas. Facere provident velit eum officiis et est error. Ullam et sit minus quasi corporis. Est vero totam sit deleniti incidunt reprehenderit quas. Illo tempore dolores laborum recusandae. Error suscipit autem rerum quod eos omnis doloremque. Autem tempore aliquid incidunt alias.', 'App\\Models\\Task', 15, 67, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(51, '4de26dbb-f956-4c0c-ad28-11c36f429372', 'Sunt suscipit repellat ut ab accusamus. Voluptatem et labore qui ipsa. Ab libero quia nam consequatur qui vero esse. Sit autem vel voluptatem placeat. Nobis dolorem ipsum atque veniam incidunt placeat rerum assumenda. Minima pariatur voluptatem ea. Consequuntur sit cumque ut omnis eum sunt cum. Dolores nam ipsa ut et id distinctio modi reiciendis. Est molestias illo occaecati sint.', 'App\\Models\\Task', 15, 67, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(52, '68cfe7ab-f36d-4cb4-a8e5-34a55764538d', 'Corrupti qui eligendi qui est consectetur ut voluptatibus deserunt. Laboriosam tenetur qui velit optio hic dolore ut. Est voluptatem provident et quasi reprehenderit in provident. Et quaerat velit laudantium.', 'App\\Models\\Task', 16, 97, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(53, '17908af1-6834-46bd-9ba9-5e28c27522bd', 'Est dolore nobis nihil qui iure rem cum. Sed molestiae velit ad pariatur ab perferendis consequatur. Officiis sit quaerat et atque nesciunt. Quia quia ratione nobis saepe. Sit dicta qui dolorum. Eveniet voluptas repudiandae similique molestias ab quam est. Asperiores voluptas nostrum nesciunt omnis. Voluptatem enim nulla sed magnam praesentium et sint. Ut odio ullam eligendi voluptatibus id voluptate harum nostrum.', 'App\\Models\\Task', 16, 97, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(54, 'f2336139-d6b6-4b60-a504-ed72c4d83c46', 'Aliquam a eius molestiae nostrum. Incidunt dolorum aut excepturi quasi tempore eligendi perspiciatis. Quia nihil nisi consequatur et ab omnis. Autem dolores veritatis et et sed nostrum aspernatur non. Sit perferendis aut tempora cumque. Similique aut consequuntur debitis harum ullam voluptatibus omnis. Praesentium repellat quis sed aut. Quibusdam ipsa quasi nostrum placeat. Doloribus architecto nemo minima necessitatibus eos. Autem incidunt quidem impedit ducimus. Nostrum qui vel asperiores neque.', 'App\\Models\\Task', 16, 97, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(55, '38ef80b4-fc0c-4b01-b8aa-883583b2c07b', 'Illo dolorem blanditiis in aliquid. Qui debitis et sint pariatur dignissimos aliquid voluptas. Dolorem et eum dolor et at alias.', 'App\\Models\\Task', 17, 55, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(56, '061ded43-a7da-4ab7-bee0-e40f0a371ed7', 'Quas laborum ut molestiae ullam et. Delectus voluptate quibusdam voluptas ipsam et ducimus molestiae. Nihil iure earum sed in. Ratione accusantium culpa quis similique laboriosam iusto. Consequatur itaque laudantium officiis eum harum iure quia. Sit et quod perspiciatis in sed optio.', 'App\\Models\\Task', 17, 55, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(57, '627d3b36-1bc4-4490-844b-85ad0f11e9a8', 'Sed rem ducimus autem natus id delectus. Laborum facilis incidunt error et natus. Alias nihil reiciendis odit corporis labore nulla. Laboriosam aut voluptatem autem error excepturi exercitationem. Fugiat reprehenderit eligendi fuga et culpa. Sunt expedita nesciunt quod voluptas aut qui illo. Dolores saepe explicabo a harum. Velit et adipisci et est sed accusamus. Nihil est vero hic vero qui modi. Quia quo voluptatem quasi autem et ut. Maiores praesentium non molestiae impedit ex. Odit expedita voluptas consectetur distinctio. Vero magni officia explicabo.', 'App\\Models\\Task', 17, 55, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(58, '289682ee-2260-4519-a68e-559343efcdce', 'Consequuntur architecto minima vel. Eos ut blanditiis officiis eos. Ut iusto ut eum fugit ea ut cumque consequatur. Ratione recusandae quia quis quia hic iste et. Maiores itaque laboriosam minima quia ipsum repellendus impedit. Magni et maxime aut sapiente culpa praesentium et rerum. Fugit consequuntur esse sequi enim in est harum.', 'App\\Models\\Task', 18, 24, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(59, 'ad654c8e-16c2-4335-a5ce-611cd3489705', 'Nihil et officiis culpa esse aut. Optio repellendus nam pariatur. Aperiam velit ea neque a.', 'App\\Models\\Task', 18, 24, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(60, '42db0ac6-eb72-45be-8290-976842e00891', 'Nemo error facilis pariatur unde nemo. Enim autem debitis quo quo temporibus sint nihil. Sed ipsum ut impedit. Vero vel voluptas et est molestiae alias cupiditate. Omnis officiis dolor eos impedit qui vitae. Ullam asperiores officiis delectus aut. Perferendis minima ipsa odit est atque eligendi voluptatem. Libero accusantium maiores vel necessitatibus et amet est. Ipsum non voluptatem voluptates. Impedit nihil itaque est vel qui praesentium. Et labore odit molestiae quaerat illum ducimus. Qui asperiores et excepturi exercitationem quasi excepturi.', 'App\\Models\\Task', 18, 24, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(61, '9626dc01-f6bf-4258-bc55-cd51c3c5b78b', 'Aut eum ipsum minima fuga quia a architecto. Est voluptatem dolores voluptates inventore quaerat quae. Autem temporibus qui eaque autem aliquam et. Iusto nam ad eligendi possimus sit. Aspernatur occaecati repudiandae quae quo sint eos reprehenderit dolores.', 'App\\Models\\Task', 19, 48, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(62, 'c606867c-bd9e-4c3c-8608-780977bcdfbc', 'Et beatae et itaque exercitationem dignissimos itaque ipsum. Dicta iusto dolor quam perspiciatis rerum animi asperiores. Quia delectus praesentium aliquam unde et.', 'App\\Models\\Task', 19, 48, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(63, '9bc0d677-30dd-46ef-ad1c-1f1148b8eab5', 'Inventore illo blanditiis soluta. Deserunt aut perferendis qui ipsam quas. Voluptates ut reprehenderit enim nobis aut sed. Atque iusto aut qui qui reprehenderit. Sunt repellat sint velit sunt velit ullam omnis dolorem. Ut molestias rem aut repellat laborum labore et. Iste libero molestias ratione eveniet aut.', 'App\\Models\\Task', 19, 48, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(64, 'ba71cd73-3373-41f3-9b5c-120da1f13940', 'Officia id dolor quisquam nihil. Veritatis neque maxime iure provident mollitia et. A voluptas non excepturi iste voluptas rerum quo. Cumque aut rerum enim voluptatibus tempora velit culpa.', 'App\\Models\\Task', 20, 49, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(65, '4161e205-4de2-4086-a991-c60e4510c792', 'Adipisci quisquam aperiam nostrum eaque quod. Sunt accusantium nobis nisi et vel modi voluptatem. Aut cumque ea voluptas et ipsum magnam dolor qui. Labore facilis iusto et aliquam. Reprehenderit delectus exercitationem velit culpa incidunt in aut. Et tempora eos eligendi recusandae molestiae dolore est. Ut culpa asperiores corrupti consequuntur temporibus. Illo ipsa sed perspiciatis distinctio soluta et. Dolor unde ea sed. Est qui aliquid voluptatem molestiae. Qui iure eligendi ad quasi ipsam. Explicabo eos autem aut iste fugiat. Labore eius velit perferendis officia dolorem quidem suscipit magni.', 'App\\Models\\Task', 20, 49, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(66, '6d11db35-3b62-4304-b1b9-a1efe249004e', 'Et ut et perferendis quam porro non voluptatem sint. Voluptates necessitatibus velit ullam doloremque enim debitis. Quis fuga similique necessitatibus. Veritatis voluptatum nisi ullam saepe. At doloremque ea nisi esse. Placeat et fuga est excepturi excepturi quis cum quam. Et aut esse qui alias. Aliquam eius asperiores praesentium quam velit officia et maiores. In ut blanditiis non nihil necessitatibus qui tenetur. Repellendus rerum dolores sit consequatur aut aut. Aut eum voluptates repellat eum. Quia facere deserunt aut animi iste laboriosam. Eum accusantium quas blanditiis officiis voluptatibus. Nihil vitae natus quaerat et quam commodi sequi.', 'App\\Models\\Task', 20, 49, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(67, '53ecddbb-7f05-47eb-8d64-61ff5cca2a0c', 'Laboriosam voluptatem minima excepturi et atque. Voluptas labore quia harum saepe error laborum iure delectus. Beatae tempore quasi et quas corrupti. Suscipit aut facilis quia dolor nihil debitis nihil.', 'App\\Models\\Task', 21, 59, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(68, '1d6f72e7-d1da-4701-89d0-dbc088c788bc', 'Est quam aperiam quo repudiandae labore. Sit cumque odit quae quas deserunt. Aliquid sed corrupti et sapiente voluptate. Deleniti libero commodi pariatur eos et alias iure. Quas sint rerum repellendus earum cumque accusantium ullam hic.', 'App\\Models\\Task', 21, 59, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(69, '8efe11d8-bf45-4e05-a5b9-51e39e81f839', 'Expedita eos aliquam quasi magnam. Qui perspiciatis quaerat omnis repellat et sed. Culpa facilis nobis magnam voluptas. Cum voluptas quia tempore. Repellat assumenda voluptatem cumque doloribus eveniet. Sint unde consequatur ut doloremque voluptate. Sit ut modi animi blanditiis numquam vel.', 'App\\Models\\Task', 21, 59, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(70, 'ad298ed9-4aec-4c0f-aaf3-6ed9464ced03', 'Nulla voluptatem ipsam aliquid qui perferendis. Dolorem illum asperiores sint labore.', 'App\\Models\\Task', 22, 2, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(71, 'f802293e-9ffc-4f7e-b2bd-1d57255a123d', 'Nam quia in odit quasi ducimus. Eaque accusantium sed doloribus minima vel. Quis et voluptatem molestias accusamus aut voluptate nam dolores. Explicabo repellat reprehenderit minima exercitationem ipsam doloremque dolores voluptatem. In qui velit quia. Qui temporibus eligendi accusamus fugiat vel. Debitis ullam rerum ut nostrum mollitia unde. Dicta qui unde esse. Illo autem est aliquid hic praesentium. Veritatis quis placeat quia repellat numquam aliquam aut reiciendis.', 'App\\Models\\Task', 22, 2, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(72, '29eccf6c-3121-4835-aaf3-e6524a8781b8', 'Ut et et cum. Optio vel modi quasi. Mollitia hic natus dignissimos et omnis. Occaecati esse dolores sint repellendus consequuntur et dolor. Aut fugit quod dolores tenetur expedita nostrum. Aut temporibus ut ut facere.', 'App\\Models\\Task', 22, 2, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(73, '2e93f02f-b05c-4f86-a8b3-a43ee3fa46fd', 'Cum vel atque dolor voluptatum. Omnis omnis iste et et repellendus. Dolore quasi accusamus dolor est culpa. Iste eos dolor iusto eveniet sed. Non quis adipisci quis et quia qui.', 'App\\Models\\Task', 23, 50, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(74, '13076d81-6a1c-4dc9-b7b4-5ef213058e50', 'Assumenda quo id qui et. Repudiandae quaerat ut perferendis. Inventore reprehenderit assumenda natus omnis nostrum. Soluta blanditiis eveniet eaque quo. Quibusdam distinctio rerum saepe consequuntur magni inventore dolores. Alias eaque delectus qui aut perferendis.', 'App\\Models\\Task', 23, 50, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(75, 'de8e66dd-3731-4953-b2da-7234eddded85', 'Error odio et consectetur dolorum. Laudantium praesentium inventore quo doloremque. Veritatis sint ex sit sint adipisci ea. Et laudantium repudiandae nesciunt nihil minima.', 'App\\Models\\Task', 23, 50, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(76, '32d20ccf-e98b-4eb8-a95c-5527513550f3', 'Qui aliquid quia occaecati autem. A accusamus commodi est eum debitis. Est qui tempore quibusdam optio aut. Nemo qui officia reprehenderit et non. Sunt fugiat est mollitia eum fugit nihil. Fugiat vel debitis illum vitae occaecati. Est praesentium excepturi culpa possimus vero laborum accusamus. Accusamus consequatur placeat eum molestiae enim voluptas. Et est pariatur iusto optio eveniet. Molestias tenetur doloremque voluptas ut velit. Quasi vel aliquam repellat amet non. Recusandae ut eius ut at nostrum porro. Sed quod laboriosam maxime corporis at. Commodi amet cumque numquam molestiae sit iusto.', 'App\\Models\\Task', 24, 14, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(77, '1ff67800-bd45-4359-b068-e68ee76a6214', 'Enim qui quia quia porro qui. Et architecto voluptatem voluptate ea. Dolores sit eius ut dolorem. Facilis repudiandae aut sint natus sed alias. Non quia quo voluptatem nobis enim. Distinctio voluptate qui architecto voluptatem. Debitis ut vel ullam natus. Quas possimus autem quasi quas nisi accusamus sunt. Culpa voluptatem provident temporibus amet voluptatum laborum maxime. Perspiciatis ut tempora odio id porro et.', 'App\\Models\\Task', 24, 14, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(78, 'aa05001f-8938-4870-b251-2fbdb1e943ea', 'Et fugiat pariatur dolorem earum accusamus aperiam. Porro tempora dolorem a corporis quos omnis iste. Et voluptas nihil reprehenderit. Praesentium quidem dolorem eum veniam nisi dolorem temporibus temporibus. Rerum et hic quis architecto itaque et voluptate.', 'App\\Models\\Task', 24, 14, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(79, '6347bede-0a07-4ff2-8c43-f1a337063091', 'Architecto eligendi recusandae adipisci aliquam. Tenetur vel et ut expedita reprehenderit fugit qui. Dicta similique tempore ipsam et voluptas.', 'App\\Models\\Task', 25, 47, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(80, '1943ba79-10f0-4f45-bd27-99581c339434', 'Occaecati et voluptatum necessitatibus sint. Esse consequatur voluptatem cumque et nemo ab. Illo similique est illum et. Qui assumenda culpa enim delectus aut dicta odio. Quos et magni eaque officiis ut et odio.', 'App\\Models\\Task', 25, 47, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(81, '666fcba6-ae34-4eaf-b1cc-f64ca8cf6544', 'Est a veniam voluptas et possimus sit quo est. Qui consequatur doloribus ea et tempora quia. Quasi aut ratione ab id distinctio cupiditate. Ipsa aut et aut. Veniam recusandae quisquam blanditiis sint.', 'App\\Models\\Task', 25, 47, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(82, 'c0befed9-19f8-4633-8044-1065c1c4ef12', 'Blanditiis minima non placeat consequatur. Ea excepturi magni accusamus sit quaerat nam ipsam. Totam ipsa omnis necessitatibus tenetur. Inventore laboriosam sit culpa.', 'App\\Models\\Task', 26, 65, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(83, 'b53baa27-4601-4218-b930-43ba869c02ba', 'Repudiandae quibusdam illum sit eligendi. Corrupti tempora pariatur qui eum. Quasi asperiores voluptatem vero ratione. Sit veritatis quia consequatur enim modi. Dolorem voluptatem nihil alias saepe eveniet eos minus. Vero iure tempore voluptas ad enim nemo nesciunt. Provident maxime eum quae est.', 'App\\Models\\Task', 26, 65, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(84, '3b2e2a70-f599-4ecb-bfa6-2c1db3119ab7', 'Vero nobis necessitatibus quasi commodi nam consectetur quae. Laudantium qui provident nobis accusantium accusamus voluptatem recusandae. Culpa aliquam aut porro doloribus nostrum aperiam autem. Recusandae enim quod numquam aspernatur consequatur.', 'App\\Models\\Task', 26, 65, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(85, '19307d3f-38e7-4f78-b5ea-7be80a6fb337', 'Omnis dolorem totam temporibus veritatis voluptatem. Asperiores molestiae optio et maxime autem dolorum itaque. Placeat similique in ut et. Possimus consectetur illum pariatur aut. Ipsam et eum quisquam est fugit. Quas doloribus esse ratione exercitationem aut rem aut eius. Dolorem dolorum tempore est tempore. Totam necessitatibus minus eaque error. Atque praesentium et accusantium omnis facilis est quia illo. Delectus ullam sunt dolorum provident quidem perferendis.', 'App\\Models\\Task', 27, 57, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(86, 'd18cdf9f-60be-450e-abde-aa3c3df256e0', 'Voluptatem voluptas est ut quasi architecto ad ea. Deleniti dolor reprehenderit quae distinctio molestiae aut. In consequatur accusamus in. Commodi non aliquid mollitia doloremque doloribus ut. Quia porro dolor sed sint mollitia. Vel libero in quia non. Inventore ducimus et laborum. Occaecati repudiandae ea rerum laboriosam nam illo excepturi tempora. Ipsam in quod aliquam laudantium. Voluptatibus in nostrum quo perspiciatis.', 'App\\Models\\Task', 27, 57, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(87, 'fcc7536b-1e10-42e1-9fb0-2aedeb7e2a09', 'Aperiam delectus quia aut eligendi. Sed dolore quae fugiat perspiciatis minus laborum facilis a. Est iusto dolor accusamus ex est architecto et. Id maxime eligendi quidem laudantium enim amet sunt. Voluptatem neque temporibus rerum nulla repudiandae sunt natus aspernatur.', 'App\\Models\\Task', 27, 57, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(88, '9f40fc8b-b946-47bc-a779-a7561c9d62b4', 'Ipsa et voluptas natus iure inventore et magni. Et cum itaque eos reprehenderit. Provident aut repellat dolorem quibusdam accusantium quidem quisquam. Assumenda occaecati blanditiis nam. Aliquam excepturi sunt non temporibus nam fuga. Dolor possimus veritatis ut fuga aliquid totam consequuntur consectetur. Hic animi et ducimus iste qui tempore quisquam.', 'App\\Models\\Task', 28, 83, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(89, '25382e95-c316-477f-b1da-e3f1b152b3a0', 'At unde et at quasi enim. Quo quaerat qui quo qui quod omnis repellat et. Dolor ut harum veniam nihil veniam aut. Veritatis ut enim perspiciatis et voluptate distinctio deleniti. Voluptas vel consequatur sed aut et.', 'App\\Models\\Task', 28, 83, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(90, '383b4ecf-0d3c-4778-957b-ebba2733dd25', 'Voluptas et aut doloremque. Iusto et sint reiciendis eveniet optio dolores officia doloremque. Dolor recusandae inventore blanditiis tempora porro. Voluptatem est voluptatem qui et iusto vel ad et.', 'App\\Models\\Task', 28, 83, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(91, '82418635-394a-4877-b0f0-9b5c111988e3', 'Ut ea aliquid incidunt nam error aut id. Delectus deserunt quia omnis. Atque ab aperiam voluptatem id.', 'App\\Models\\Task', 29, 59, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(92, '3fd08b1c-7603-4043-b4b5-02e7fa4968ff', 'Rerum id aut perferendis. Nostrum quibusdam veritatis aliquid quos. Odit ab rem aliquam voluptatem est et aut amet. Itaque totam ex ut rerum eos culpa blanditiis. Cupiditate iure veniam earum quod labore molestiae.', 'App\\Models\\Task', 29, 59, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(93, 'd9d49027-10bd-4eb9-aa8a-642f35018917', 'Eum non et repudiandae ducimus earum. Dolor provident quia magni esse enim et facilis. Illum blanditiis ab rerum nulla necessitatibus dolorem velit. Ea quia cupiditate id est id necessitatibus dolorem. Voluptatibus fuga sed fuga quae. Velit esse quasi quasi esse nostrum eligendi numquam. Animi aspernatur dolor sit et blanditiis qui doloremque. Incidunt distinctio quidem minima consectetur beatae sed sequi. Amet repudiandae ullam id. Aliquam recusandae aut doloremque non. Voluptatem at voluptatem nisi maxime. Ut fuga esse commodi eos doloremque eos tenetur nobis.', 'App\\Models\\Task', 29, 59, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(94, 'b553aac5-edba-477e-a514-39320b158dc5', 'Fuga id dignissimos delectus explicabo. Nihil porro voluptatum dolores temporibus itaque perferendis distinctio.', 'App\\Models\\Task', 30, 66, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(95, '55a94113-bb38-4856-8649-4be5145745d4', 'Distinctio rerum cupiditate facere dolore minima quo. Laboriosam et ipsum omnis voluptates. Id ex culpa maiores qui asperiores quia. Molestiae veritatis suscipit officiis rerum dolorem non fugiat voluptatem. Rerum consequuntur culpa deserunt illum accusamus commodi molestias veniam. Maxime veniam debitis qui rerum minima. Voluptatem iure ducimus porro qui consectetur. Ex eaque ad assumenda.', 'App\\Models\\Task', 30, 66, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(96, '820ba229-053b-4ce7-bd98-10ec44a447c7', 'Quas itaque rerum saepe sit rem. Voluptas neque et doloribus laboriosam et.', 'App\\Models\\Task', 30, 66, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(97, 'c050e353-b441-41bc-aec5-cb02e4f8ae9e', 'Sapiente qui sed quos esse. Recusandae fugit est illum et porro earum ullam. Mollitia rerum excepturi dolor id et accusantium illo. Fuga at magni omnis labore consequatur eos. Debitis et itaque dolorem ad quis aperiam. Et sunt dolorem incidunt atque aliquam. Sit et eum dignissimos voluptatem. Enim tempora nesciunt laudantium nostrum beatae.', 'App\\Models\\Task', 30, 65, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(98, '5483b5a8-6239-41ad-82fa-0d27ccccfd32', 'Facilis nisi veritatis voluptate tenetur. Vero atque perferendis non voluptate ut eum. Eum rerum quam ut commodi. Et deleniti sint dolores sapiente dolor consectetur. Ut vel sed quasi laudantium. Sequi earum laborum dolores blanditiis laboriosam. Dolores temporibus quo occaecati sint excepturi quo enim.', 'App\\Models\\Task', 30, 65, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(99, 'bc3487cb-1f72-4f80-9aa0-7589142564ef', 'Quas dolores sequi assumenda totam repudiandae vel eligendi ex. Voluptas beatae ad neque a saepe. Voluptatibus sit quasi qui debitis qui maiores.', 'App\\Models\\Task', 30, 65, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(100, '9805c752-8c9e-400d-a08f-15f402618ac5', 'Rerum ad perspiciatis maxime illum repellat. Voluptate nisi voluptatem quae deserunt ullam. Similique aspernatur quas rerum dolores et voluptatibus quam. Id natus atque nemo fugiat aspernatur accusantium et tempore. Sed qui magni modi tenetur deleniti sed. Ab similique iure ea tempore non.', 'App\\Models\\Task', 31, 26, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(101, '3d3a8d28-2027-440c-9ea9-88af68f9f27f', 'In quisquam soluta facere sed facilis ullam cum ipsa. Et et iusto soluta hic aliquam eaque ipsam amet. Voluptate tempore fugit officiis soluta. Nobis quod iste et tenetur odio in accusantium.', 'App\\Models\\Task', 31, 26, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(102, '9ae41bff-6544-490c-858f-08670603da14', 'Quos et consequatur nisi et. Ex sint sed optio sapiente minima est rerum. Officiis culpa et omnis quis ad. Asperiores impedit reprehenderit repellat et. Consectetur dolorum nisi at fugiat error. Voluptas atque quaerat itaque et. Eum officia rerum consequatur sint accusantium deleniti deserunt. Labore ut numquam distinctio facilis dolor enim fugiat a. Quidem sit voluptatem atque non vero qui. Aut sit enim aliquid et et totam non rerum. Sit commodi repudiandae laborum rerum labore ut id.', 'App\\Models\\Task', 31, 26, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(103, '02436987-25a4-4c1b-9ab8-95faad927487', 'Modi assumenda blanditiis eligendi quibusdam. Vitae ratione non itaque est dolor doloribus et. Illum eius voluptatibus nobis pariatur praesentium. Rerum ipsa commodi quia dolor. Voluptatem veniam aut consectetur ut. Ipsam eos cupiditate cupiditate est. Dolore et quasi aut odio facere nemo. Cumque eos omnis ut quia. Velit rerum in est blanditiis atque.', 'App\\Models\\Task', 32, 52, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(104, 'e004bb21-421f-481b-ab04-2782963b35f5', 'Quaerat exercitationem saepe impedit quod et sed et. Illo deleniti repellat tenetur deserunt ad ut repudiandae. Quos ut dolores dolor. Voluptate eum corporis eum quia voluptatem architecto nisi natus. Est sed in quis recusandae consequatur qui voluptatem. Quia velit non tenetur.', 'App\\Models\\Task', 32, 52, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(105, 'e07fa2cf-c42d-4a56-996c-e1862c83a3c4', 'Quaerat ut dolorum architecto harum aliquid aliquam esse. Eos repellat ipsam totam similique. Repellendus ipsum rem perspiciatis fuga maxime omnis similique possimus. Corrupti magnam vitae minima. Consequatur id quibusdam cum libero. Quia aut voluptatibus sed amet dolores doloremque inventore.', 'App\\Models\\Task', 32, 52, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(106, '9ef61986-10a4-4989-b126-cc5081176fc9', 'Aliquam tempore a consequuntur labore aut vitae. Quasi quis molestiae commodi labore consequatur quia. Vel aspernatur autem architecto labore incidunt qui autem. Molestias non qui minima qui recusandae ut doloremque amet. Labore sint ut aut dolore. Cumque cupiditate cumque vero facilis vitae error eligendi. Facere non eius eum eum voluptatem aut. Eius voluptatibus tempora assumenda aliquid sint iste neque.', 'App\\Models\\Task', 33, 14, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(107, '575d14dd-69cf-4e0c-828e-2ca681742e8c', 'Similique aut expedita enim minus veritatis placeat vero. Ipsa deleniti quia nesciunt est modi. Necessitatibus eum est aperiam id aut rerum exercitationem. Dolores quasi quia ab a. Vitae qui exercitationem doloribus minima nesciunt.', 'App\\Models\\Task', 33, 14, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(108, '0dcee0c5-4b2a-4755-929a-dc726405aa98', 'Aut quia harum exercitationem accusamus eius architecto deserunt. Corrupti perferendis consequatur aperiam vel. Consectetur et tempora voluptatum ea enim soluta. Doloribus alias velit porro optio. Cumque consequuntur itaque consequuntur quae ratione. Provident ullam est voluptatem ipsum. Vel impedit itaque autem sit et.', 'App\\Models\\Task', 33, 14, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(109, 'ccf4c66e-ca21-442d-b378-7c74a263e8ab', 'Enim vel excepturi ducimus sed. Tempore velit laborum adipisci aspernatur amet ducimus maiores. Veritatis laborum ut ipsa officiis sit commodi. Repudiandae assumenda non neque. Fugit ratione officiis asperiores exercitationem voluptas animi laudantium. Hic velit ea nam accusamus sit totam doloribus. Atque autem in facere voluptatum. Voluptas hic aut laudantium et id. Vel ex alias maxime. Ut animi quibusdam quas quas. Maxime id dolore ad voluptas aliquam.', 'App\\Models\\Task', 34, 2, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(110, 'a509ed91-90e2-400a-9d68-0564bf967f05', 'Non ut accusamus eum. Amet consectetur itaque et est. Libero omnis qui doloremque sint libero quia rerum. Quo et similique voluptatem placeat itaque quia voluptas voluptatem. Aspernatur in aperiam qui est et at.', 'App\\Models\\Task', 34, 2, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(111, '61dc77ca-3467-4770-9b91-72b6922c281f', 'Aut cum et rem laudantium et eaque. Modi eligendi doloribus laboriosam. Ad voluptatem consequuntur et id consectetur cumque. Eos blanditiis accusantium voluptatibus nulla qui. Similique ut nesciunt consequatur. Harum vero provident dolores dolor. Ullam rerum quia aut est neque nihil doloribus. Facere non quis quisquam aperiam ut. In a hic officiis facere quia aut at. Incidunt unde fugiat necessitatibus sint. Vero veniam qui doloremque voluptatem. Quaerat et beatae quos illum sed labore ut dolores.', 'App\\Models\\Task', 34, 2, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(112, 'a2893c99-639f-4c2d-94a1-6fff4d1800ac', 'Est eius quia necessitatibus quasi. Eos sequi illo odio vitae qui. Eum enim libero rem magnam voluptate modi. Sit sunt fuga deserunt. Distinctio vitae dignissimos non dolorum qui neque enim dicta. Maiores consequatur nulla architecto iure aspernatur animi.', 'App\\Models\\Task', 34, 61, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(113, '90358868-20c5-4a39-9af9-a877f5aa3875', 'Beatae nostrum consequatur inventore nostrum nobis. Eaque quasi temporibus asperiores et dolorem. Aperiam quia doloribus sit nihil repudiandae esse fuga non. Autem ipsum nobis dolor veritatis facilis. Dolorum et esse rem sit vitae deserunt dolorem consequuntur. Alias nihil nostrum ut exercitationem autem.', 'App\\Models\\Task', 34, 61, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(114, '58df910b-cab1-4c3b-bbb3-9363d9e86bae', 'Officiis pariatur distinctio dolores ut molestias. Repellat ea quam enim quis occaecati velit. Natus pariatur culpa nesciunt et vero. Incidunt quia soluta natus. Non soluta itaque nesciunt maxime quia. Provident illo et soluta tenetur sed molestias ea. Debitis distinctio fugiat deleniti eaque dolorum voluptatem. Fugit et laudantium mollitia sit deserunt. Soluta magni quos dolor placeat. Laudantium voluptate voluptatem voluptatem.', 'App\\Models\\Task', 34, 61, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(115, 'db43ca86-7b99-46ac-bc37-3de41f7ace5c', 'Est ducimus est molestiae sequi. Ut repellat aspernatur autem qui consequatur accusamus qui. Qui aut assumenda non quia qui provident at. Et delectus debitis voluptatum laudantium. Voluptatem perferendis molestiae iste veritatis sunt neque. Veniam cum ea natus qui in officiis dolores est. Amet repellendus earum velit ea aut quo. Et ad ut odit omnis. Aut ratione quas sit ut sunt quo quia.', 'App\\Models\\Task', 35, 55, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38');
INSERT INTO `comments` (`id`, `external_id`, `description`, `source_type`, `source_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(116, '3c0fba5a-3b5a-43cb-b9a4-5c88d55d9656', 'Odit sapiente nemo quia velit libero hic qui placeat. Magni id velit consequuntur voluptas debitis. Est architecto qui quas ex quidem culpa. Et vel rerum fugiat voluptatem. Ratione ipsam esse ducimus. Eum voluptatum asperiores mollitia quia iste dolorum. Ipsa adipisci voluptatem consequatur omnis odit unde. Consequatur suscipit aut sint qui quos quaerat ab. Velit repudiandae ullam et accusamus nesciunt et et nihil. Architecto voluptas perspiciatis sapiente eos a reiciendis. Maxime veniam illo aperiam aliquid sit ut. Aut maxime laudantium corrupti corporis. Eum recusandae alias sunt consequatur ea quibusdam repudiandae.', 'App\\Models\\Task', 35, 55, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(117, '95fcf7df-7060-49ef-aa18-5d2970a0d8dd', 'Corrupti enim vel quia harum. Dolor deleniti neque et possimus velit expedita facilis. Impedit recusandae omnis aliquam nihil deleniti ut sapiente. Quae odit enim possimus est. Consequatur ut rerum blanditiis eos non. Aspernatur laboriosam iure voluptatibus facere repellat. Aperiam quia id saepe fugiat dolor. Doloremque sint aut veniam. Dolorem velit voluptatem similique inventore nemo. Labore nisi excepturi asperiores in natus. Quam dolorem et quisquam aliquid.', 'App\\Models\\Task', 35, 55, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(118, 'd3f4f337-55f2-40a0-90bb-1ccba096f03b', 'Voluptatem ullam doloribus quibusdam quia expedita. Non est voluptatem modi quia ut eos ut. Ducimus voluptas quia aliquam fugit eligendi inventore. Sunt facilis nam amet sed animi doloribus labore ad. Distinctio aspernatur odio totam qui nemo neque. Dolor quaerat molestiae recusandae aliquam aut nemo sed eos. Repellendus est blanditiis ex quisquam.', 'App\\Models\\Task', 36, 85, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(119, '2e235a9a-2f3e-4f04-ac74-7b61e2072f6c', 'Aut temporibus libero nam autem minus eligendi nobis. Laboriosam illum nobis voluptatem aperiam quia et quam. Quas qui facilis est qui. Libero nisi explicabo corporis nostrum nam eaque quia. A optio ducimus eveniet voluptatem recusandae impedit porro quibusdam. Modi eos temporibus odit debitis unde molestias tempore aut. Necessitatibus sequi quas voluptas ut iusto et delectus. Ut saepe libero consequatur. Autem rem occaecati rerum nostrum. Voluptatum nulla sit aliquam nostrum sint laboriosam adipisci. Accusantium quibusdam quia et voluptatem eaque et dolore. Quod quam voluptate inventore quod quia. Architecto aut quis ad quis omnis sit.', 'App\\Models\\Task', 36, 85, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(120, 'c0710d13-f8c2-48f1-9402-86596e68270a', 'Debitis dolorem quo deserunt itaque perferendis. Quam et eaque ad maxime vero. Temporibus voluptatum voluptas omnis fuga. Pariatur et atque ad fugiat.', 'App\\Models\\Task', 36, 85, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(121, '099e0208-c910-4cbe-9a82-70c216745c17', 'Suscipit sunt quia amet. Voluptatem quidem ex commodi veniam possimus rerum. Libero tenetur quas neque quasi a nisi assumenda vitae. Beatae voluptatibus ab atque dolores. Nostrum eum aut sed similique architecto exercitationem. Sequi officiis omnis aut pariatur culpa nam rerum. Beatae qui et at eaque necessitatibus. Dolorem exercitationem et dolorem autem. Recusandae voluptas ut necessitatibus voluptates rem. Ea aliquam soluta itaque minus quia. Veniam sit quia nulla assumenda et ipsam. Delectus sunt vitae debitis dignissimos. Qui qui vitae illo.', 'App\\Models\\Task', 36, 61, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(122, '3cee9755-f719-457e-b184-0ab1e3611871', 'Omnis saepe natus rem iusto sapiente voluptatem perferendis. Qui tenetur enim voluptate enim deserunt quo voluptates ad. Repellat provident minima iure odio placeat at quo. Molestiae aut et consequatur non. Consequatur natus et consequatur dignissimos sunt sunt laborum.', 'App\\Models\\Task', 36, 61, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(123, 'cae08752-f7f9-427c-8587-ad6e50ef5076', 'Ducimus rerum vel qui sunt. Nisi quae at totam. Repellendus molestiae consequatur reprehenderit qui consectetur. Deserunt perspiciatis voluptate consequuntur itaque et. Magni velit at qui voluptatem quidem quas voluptatum deserunt. Est doloremque omnis voluptatem nam officiis nulla.', 'App\\Models\\Task', 36, 61, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(124, '6ac7050d-6468-48e3-bd98-a7b9c708adc4', 'Rerum ipsum doloribus delectus odio rerum. Officiis qui voluptate quae placeat. Sunt ad est et quo amet autem sequi. Voluptatem saepe provident officiis consequatur impedit. Delectus voluptas fuga veniam repellat aspernatur. Dolorum quod culpa provident iste. Modi ducimus magnam perferendis. Amet quos dolorum ex officia est. Dolorem voluptatem voluptatibus dicta nesciunt et. Sunt ut similique eum inventore ex et. Ut asperiores id commodi beatae similique pariatur ea.', 'App\\Models\\Task', 37, 8, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(125, '6cc5101d-5a85-45aa-927e-beaa1e36eb4a', 'At odio enim consequuntur voluptates rerum qui alias. Facilis et cumque rem consequuntur veniam facere omnis. Ea rerum dolore aut tenetur.', 'App\\Models\\Task', 37, 8, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(126, 'f3dd4e32-0f04-47d0-8d7b-88ba840886d5', 'Odio ducimus fugiat optio corporis eos. Aut saepe quos est. Qui est quidem velit nostrum. Aliquam neque corporis odio ratione neque facilis sed quia. Quia inventore explicabo veritatis eum et et. Recusandae recusandae mollitia aliquam saepe modi. Soluta mollitia reiciendis voluptas veniam saepe in possimus. Libero assumenda vitae voluptate amet.', 'App\\Models\\Task', 37, 8, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(127, '9d1d8960-cf13-469d-9ec9-8aa8954ade2a', 'Molestiae atque quae mollitia aperiam quia. Cumque eos amet aut voluptatem aut cupiditate sit. Qui odio iusto qui dolorum. Ipsam dolores consequatur nostrum necessitatibus. Sit blanditiis dolores accusantium recusandae et aut qui ut. Incidunt ab aut voluptatem ipsa soluta. Quidem corrupti eos ad est. Voluptas enim asperiores accusamus qui. Nemo labore ut minima rerum nihil veritatis.', 'App\\Models\\Task', 38, 21, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(128, 'f88a12dc-f454-445d-a25e-195264c43a9a', 'Dolore et quibusdam debitis. Nihil eum nobis libero ullam occaecati facere. Enim eos itaque nam culpa aperiam expedita illo non. Corporis et consequuntur qui ut natus. Molestias earum maxime sint ut quam. Qui et ratione excepturi doloremque natus impedit et est.', 'App\\Models\\Task', 38, 21, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(129, '7c6ad155-43ba-4ed6-abdd-6c1037097149', 'Tempora tempora perspiciatis recusandae quia nihil totam. Sit molestiae cumque sunt eveniet officia quasi rem. Accusamus velit repellat animi est earum. Porro rerum eum est molestias error cupiditate. Quae et soluta incidunt velit consequatur. Eum reprehenderit ab enim cum.', 'App\\Models\\Task', 38, 21, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(130, 'db4f2500-4ed0-40a7-b983-c78a3bad1d99', 'Pariatur dicta saepe et. Voluptas autem est quam voluptatem est est nostrum rerum. Nobis non ipsum necessitatibus officia aliquam numquam. Quos et debitis sed nulla aut tempora ut. Non eos nostrum enim nobis facilis. Atque adipisci omnis dolores non odio eos.', 'App\\Models\\Task', 38, 50, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(131, '20d2e6a0-f876-4542-89ad-07ed1546cee2', 'Sequi ipsa modi ut et aspernatur porro maiores. Est unde sed hic et vel a. Fugiat blanditiis assumenda alias ut magnam expedita in praesentium. Sed deserunt dolor a consequatur saepe velit expedita nulla. Et quo totam voluptatem accusamus expedita. Alias aut voluptatem amet recusandae quo. Voluptatem blanditiis a magni dolorem voluptas soluta. Odio adipisci nisi qui repudiandae reprehenderit quia eos. Est laboriosam architecto exercitationem possimus sunt. Expedita consequatur tempore et voluptatem quaerat. Et sint accusantium magnam ut quasi. Autem nostrum id non eveniet ex quo ut. Assumenda quod libero error placeat itaque.', 'App\\Models\\Task', 38, 50, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(132, '304d58fd-8ca9-4df5-8ad0-760230e5dc44', 'Quas consectetur similique molestiae cum. Fugiat ex maxime labore. Nisi assumenda dolorum voluptatibus ut officiis. Sit asperiores labore vitae pariatur id. Fugit similique minima repudiandae ea. Inventore molestiae eum amet et reiciendis voluptas. Animi libero distinctio exercitationem hic. Velit quos saepe officiis delectus.', 'App\\Models\\Task', 38, 50, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(133, '12b7d39c-0883-489c-9d6e-76539421237d', 'Dolorem cupiditate laboriosam optio accusamus sunt quis ut aut. Cumque quas et at est asperiores ipsam voluptatem. Earum magnam officia minus accusantium. Molestias earum rerum vitae corrupti nihil aliquid non quaerat. Neque repellendus dolores minus voluptate dolor.', 'App\\Models\\Task', 39, 28, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(134, '788c7ef8-b154-42e0-aa0e-667eef4f425f', 'Sed blanditiis facere quidem corporis et. Pariatur sequi quia dolorem enim. Omnis perferendis doloribus veniam officiis et et sint. Et neque ut excepturi ipsum. Sit ad accusantium laboriosam eum necessitatibus quisquam. Vel excepturi sunt ipsam dolorem voluptatibus error. Tempore soluta vitae minus eos placeat. Laboriosam magni minima modi ullam quos quidem. Qui illum ducimus possimus placeat eos est.', 'App\\Models\\Task', 39, 28, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(135, '70939248-5953-4490-b47b-9e8f7497370a', 'Est non molestiae nisi animi. Vero quod aspernatur est nihil sed incidunt ipsam. Repudiandae cumque dolorem dolorem quia facere. Quibusdam consequatur non optio non qui ea repudiandae. Totam et vel cupiditate veritatis. Est magnam laudantium aliquid autem.', 'App\\Models\\Task', 39, 28, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(136, 'f4e7db97-d88b-41dd-8acf-57f4bb0c7fab', 'Qui nostrum est deleniti ut consectetur. Ea et et non saepe atque minus. Recusandae ea quia et. Laboriosam nam voluptatum aut laudantium qui ut non fugit. Id delectus doloribus pariatur explicabo. Quia deserunt earum asperiores dolores cum facilis. Ea ad aut sunt eum quia similique animi qui. Saepe cum et vitae deserunt. Eveniet nihil quasi qui exercitationem consequatur quis. Qui molestiae quaerat consequuntur ipsa sunt eos.', 'App\\Models\\Task', 40, 66, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(137, '826177a0-d523-4149-91b6-6a8a408f33d6', 'Ullam perspiciatis omnis unde odio omnis omnis. Suscipit enim ut consequatur exercitationem eos asperiores. Harum cumque et sequi iste aut odio totam architecto.', 'App\\Models\\Task', 40, 66, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(138, 'f42bbd35-d312-4480-9ba2-8d05f6ca5151', 'Quod aperiam doloremque cumque molestiae impedit est. Et reprehenderit ut et illum similique quibusdam.', 'App\\Models\\Task', 40, 66, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(139, '3af90fd1-9dff-4a52-b755-242bf91cc509', 'Autem minima dolores dolor et est omnis eligendi. Provident ut at beatae odio qui qui aut. Delectus dicta et quia cum. Et cum dolor provident sapiente eum nisi est aut. Error sit quis labore dicta ut non quae. Autem et porro quia aspernatur totam consectetur quidem laborum. Ad qui qui optio nihil sunt voluptas aliquid. Commodi asperiores id maxime ipsa ratione. Dolorem omnis est perferendis.', 'App\\Models\\Task', 41, 21, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(140, '5af84ace-0b89-4214-85c6-4819d1ead186', 'Nisi fuga ut aut cupiditate odit omnis autem. Magni sed quibusdam distinctio provident. Ad error dolores et. Culpa sit minus voluptatem unde. Dolor ipsam et a et. Consequatur atque quibusdam sapiente nostrum asperiores unde ut expedita. Dolorum laudantium tempore blanditiis aut. Ea eveniet dolores aut consequatur.', 'App\\Models\\Task', 41, 21, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(141, 'ea24ecf1-7600-449f-9073-d42e0f32d8a4', 'Autem alias inventore autem iste dolores ut. Aspernatur amet officiis sapiente tempore. Est non qui ea ullam consequatur eveniet deleniti. Eos quam mollitia quisquam qui aut.', 'App\\Models\\Task', 41, 21, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(142, '09e516d3-88b1-47b4-9119-4d1e0fd3ae8d', 'Doloribus aliquam hic possimus ea et reprehenderit. Voluptate minus voluptas ipsa maxime dignissimos rerum perspiciatis. Omnis vitae placeat maxime recusandae voluptatum nemo.', 'App\\Models\\Task', 42, 70, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(143, '8dfe4a3f-b667-44f0-a4dc-a7c4d900c220', 'Voluptates laborum qui repellat reprehenderit asperiores est quas molestias. Corporis ab exercitationem corrupti alias eos dolores. Tempora aspernatur corporis distinctio id. Quis eum quasi quia id occaecati. Aut vero itaque aspernatur accusantium. Sapiente necessitatibus veniam illo libero. Labore et laborum laudantium iste ea sunt.', 'App\\Models\\Task', 42, 70, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(144, 'b795d38e-8b46-4155-bdc6-eccfda3665f0', 'Laboriosam temporibus officia mollitia. Repellendus quia corrupti repudiandae et quam. Consequatur et consequuntur et aliquid provident. Quae tempore libero pariatur dolores id voluptas. Placeat consectetur necessitatibus ea vel pariatur nihil quae. Fuga totam facilis consequatur quibusdam omnis sed repellendus.', 'App\\Models\\Task', 42, 70, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(145, 'b18e988a-63fd-4d11-8131-862309b06171', 'Aliquam voluptas reprehenderit provident aut. Occaecati vitae nulla sint. Quo quo alias molestias rerum quas placeat eaque fugit. Est earum nihil non eum et doloremque veniam. Quos vel corrupti voluptate iusto et quisquam impedit.', 'App\\Models\\Task', 43, 48, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(146, 'a8cbd2c6-5956-4f36-b843-71c3c91e5b04', 'Aspernatur odit tenetur molestias illo occaecati fugiat ad quaerat. Error veniam quod nam et corrupti. Iusto et delectus at placeat quia illo. Aut quo nulla porro alias. Quisquam eum necessitatibus cupiditate voluptatibus illo. Dicta aliquam officiis ut et pariatur corporis omnis. Omnis deleniti sapiente corrupti suscipit illo ducimus et.', 'App\\Models\\Task', 43, 48, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(147, '6cfccbc5-464b-4e45-bebd-3d73e4814c99', 'Ipsum deleniti dicta qui esse sit neque aliquam. Provident hic voluptatibus aliquid consequatur saepe. Non tempora laborum ea veritatis sed quia. Fuga error eveniet odit deleniti rerum qui voluptatem perspiciatis. Perferendis eius ut recusandae debitis temporibus laudantium. Alias cum architecto officia ab dolorem et voluptates. Aliquid ipsum dolorem veniam in in. Consequatur natus quas culpa animi. Vel rerum eos dicta voluptatibus tempora quam.', 'App\\Models\\Task', 43, 48, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(148, '01a51ac7-fbf3-4c9d-b777-bf0e92faf6fc', 'Nisi ab mollitia laboriosam cum aperiam nisi molestiae. Velit qui in quae dolore voluptatum nihil sit. Et est voluptatum aperiam impedit aliquam. Rerum voluptates est fuga. Et minus quae et officia. Alias consequatur et delectus repellendus voluptatibus qui rem. Aspernatur ut est et officia sequi voluptates porro sit. Ea et aliquid fugiat cumque. Nam et quia odit dolorum aut facilis et eos.', 'App\\Models\\Task', 44, 88, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(149, '7a29e76f-d3d8-4771-ab96-ce45024211a8', 'Laudantium sunt quis voluptate veritatis fugit. Non molestiae laboriosam nemo fugiat laborum quis. Temporibus voluptatum est at commodi harum. Rerum accusamus ut velit.', 'App\\Models\\Task', 44, 88, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(150, 'ed6d6985-2f6a-499b-a6e0-cf930c92979b', 'Tempore esse reiciendis voluptas alias qui. Aut sit sunt in consectetur. Cupiditate aliquid deleniti temporibus excepturi voluptatem ut est unde.', 'App\\Models\\Task', 44, 88, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(151, 'be512e35-11d4-49c0-ae11-a8639b9fc9c7', 'Voluptas facilis saepe expedita in veritatis alias. Et itaque quasi eum eos est natus. Et accusantium nihil dolores.', 'App\\Models\\Task', 45, 52, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(152, 'c8d15f24-0536-4bcc-81ac-8284203254d3', 'Veniam sunt incidunt corporis. Aperiam eius suscipit eum eligendi molestiae sint. Deserunt impedit hic sed. Dolores tempore aut eveniet sed sint quia voluptatibus adipisci.', 'App\\Models\\Task', 45, 52, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(153, '303ad115-a098-43e6-9423-eec3e090a6ac', 'Sint libero quis molestias necessitatibus neque quas suscipit. Velit in voluptatum ea doloremque est praesentium. Accusantium est est hic minus. Ducimus ut aut reprehenderit. Quae illo officia sed eum. Nulla et nesciunt velit consequatur autem. Illo expedita eum nam est. Et ex omnis quaerat sunt ea perspiciatis tenetur quibusdam.', 'App\\Models\\Task', 45, 52, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(154, '050f32cf-519d-43fd-b042-033fe18659be', 'Illo est dolore iure ut voluptas vel itaque rerum. Est quis voluptate nihil molestias. Ut harum repudiandae voluptas consequatur omnis expedita. Qui qui velit natus. Quia est nemo quaerat occaecati necessitatibus voluptates expedita dolorum.', 'App\\Models\\Task', 45, 62, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(155, '7cf3cfcb-22f8-489d-bdf1-16f4c3531990', 'Et repudiandae qui accusamus id et quis quia. Assumenda perspiciatis est impedit quia. Et fugiat ex ex alias similique. Eaque harum voluptate tempora laborum.', 'App\\Models\\Task', 45, 62, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(156, 'd8fd1db7-2ed8-462e-b528-07120e8a8613', 'Et eaque eaque et. Earum quidem perspiciatis ut est error. Debitis tempore quod ea quibusdam dolorum. Debitis perferendis sapiente officiis voluptatem soluta ratione. Sit rerum minima culpa et et. Perspiciatis asperiores vel sunt fugit impedit officia ut atque. Nulla voluptatem nobis exercitationem aut eum illum est sunt.', 'App\\Models\\Task', 45, 62, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(157, '33427b3b-d1ba-4732-be17-cfb96804fd1e', 'Qui sed doloribus quo voluptatem sint aliquid laudantium. Velit est necessitatibus earum rerum itaque excepturi nesciunt. Recusandae quam dolore qui et. In alias ipsam quia qui. Minima eum eligendi ut.', 'App\\Models\\Task', 46, 97, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(158, '89e4ef58-1c59-477c-bc55-1b5a2aba5021', 'Laborum deleniti cumque voluptatem quisquam et. Atque et minus soluta porro. Aperiam voluptas voluptates eligendi. Enim vitae nulla dignissimos et repudiandae quos. Rem ullam quo molestias. Eum nostrum velit iusto repellendus. Quia alias ut perspiciatis consequuntur. Eos voluptatem voluptas repudiandae sunt culpa aut ducimus.', 'App\\Models\\Task', 46, 97, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(159, 'fdc5d07b-9cf9-4d88-996a-38dfab2ca523', 'Consequatur numquam iusto reprehenderit natus aut. Cumque ex voluptatem tempore aut. Aut magni cumque nihil illum aut ut ut.', 'App\\Models\\Task', 46, 97, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(160, '9aaaf8dc-f7cf-471a-9563-aa61783fc636', 'Omnis voluptatem error ullam libero est minima explicabo. Assumenda praesentium nulla id beatae enim ipsum porro. Laudantium sit id excepturi molestiae ea non. Nulla voluptas nam qui expedita. Corporis ea minima nostrum consequatur.', 'App\\Models\\Task', 47, 11, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(161, '5931eab4-2b35-47fc-9c7b-c89d757372ab', 'Sunt quae eligendi ad. Rem velit sed consequuntur consequatur. Reprehenderit placeat fugiat amet voluptatum hic sunt. Quam asperiores possimus ut et necessitatibus non. Dolores debitis nam quia.', 'App\\Models\\Task', 47, 11, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(162, '2a5e385f-df6d-4f7a-aa17-1fe70fca3e85', 'Quam dolor aliquid eaque libero enim. Consequatur est quo praesentium. Vel qui nam aut est.', 'App\\Models\\Task', 47, 11, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(163, '3221b517-c8eb-43d9-b986-e6e52072e286', 'Aut corporis molestias exercitationem maxime rem. Maxime repellendus ipsam minima sint harum maiores. Sint reiciendis saepe quia omnis.', 'App\\Models\\Task', 48, 86, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(164, '8f238ab6-e4d6-445f-b466-ddbb1c9a8dd2', 'Voluptatem error facere pariatur soluta. Saepe est beatae fugiat quia repellat non et deleniti. Voluptas neque ipsa est earum facere. Et maxime natus sit hic quasi eum ut.', 'App\\Models\\Task', 48, 86, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(165, '596891bf-f4ba-439e-9d36-59454d71aaa1', 'Dolorem porro aliquid soluta beatae id. Inventore optio ad molestiae quam. Expedita itaque qui molestiae quia sed est. Velit et doloribus sed nostrum. Eos et non est quis placeat id. Et molestiae laboriosam quo quia.', 'App\\Models\\Task', 48, 86, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(166, '4ca2d656-84bb-4b7b-9c80-08bab60afac0', 'Sunt repudiandae culpa sunt recusandae quidem a. Quis magni quia ipsum dicta ut dolor. Placeat id rerum dolor tempore quaerat et.', 'App\\Models\\Task', 49, 25, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(167, '9058675a-fd86-4fd5-8763-e9d9d137b6ac', 'Voluptates eveniet ut molestiae quidem et. Doloremque dolorem ducimus sit est.', 'App\\Models\\Task', 49, 25, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(168, 'f14f718c-8db6-437e-a8c5-ec01fd2e1a5a', 'Odit ducimus est quasi qui omnis sunt. Expedita dolor aut nisi aliquam nisi eveniet vel. Tempora reprehenderit et id sit libero ab temporibus. Placeat voluptatem praesentium aut dicta. Enim veritatis sed aut aut iste magnam non. Odit et esse sed qui culpa esse esse. Est veniam rerum at minima minima. Similique et dignissimos optio sit. Velit quisquam dolor ut. Quo illum et et et quibusdam nisi facere excepturi. Ratione optio iste porro eligendi eum quidem.', 'App\\Models\\Task', 49, 25, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(169, '234829ad-fc70-4c1f-be46-40632fec7882', 'Dolorem aut voluptas quas error odio voluptas ad. Porro earum repudiandae neque in dolorem occaecati qui. Repellendus deserunt aspernatur inventore voluptatem quos. Itaque expedita rerum soluta consequatur ullam perferendis. Vero sed ut dolore est amet sunt eveniet. Totam assumenda magni doloribus dolorem sit veritatis. Non saepe fugiat delectus praesentium.', 'App\\Models\\Task', 49, 89, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(170, 'f0be98d6-912e-4b56-9447-feab15e40e23', 'Dolor qui tempora sed laborum ea ipsam. Nobis nihil dignissimos aliquid mollitia repudiandae ut aut commodi. Ea deleniti ipsa dolorem occaecati reiciendis illo. Ut quis nihil consequuntur quia. Et et possimus voluptatem et sint. Voluptatem facere aut omnis accusamus. Rerum assumenda ad possimus ut voluptatibus numquam. Doloribus accusamus cupiditate facere quod ipsum laudantium. Sit veniam et unde nemo sint. Fuga necessitatibus autem doloremque nesciunt consectetur quo eum.', 'App\\Models\\Task', 49, 89, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(171, '55bf04c0-e458-4d15-8bc7-2cd75f0ef049', 'Ex excepturi velit enim dolor hic hic ut deserunt. Ipsa qui autem est modi expedita sed. Deserunt eos blanditiis id maiores. Earum consectetur earum non eaque. Doloribus consequuntur saepe aperiam repellendus quis. Dolorem aut qui id.', 'App\\Models\\Task', 49, 89, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(172, '0137a538-89ee-4097-9094-c83ac669b15c', 'Quibusdam velit mollitia dolorum est neque sit. Earum excepturi et repellat ducimus iusto dolore rem. Eos id unde aut odit. Assumenda nisi voluptas nostrum rem aut. Dolorum sunt nulla qui qui aut. Voluptatem dolore molestias at voluptatibus.', 'App\\Models\\Task', 50, 97, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(173, 'ed9e13d3-1967-4098-8561-46c5bce1b951', 'Odit explicabo est quos itaque reiciendis illo. Quas enim est magni consectetur. Sint consequuntur aut at hic non.', 'App\\Models\\Task', 50, 97, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(174, '7a73973d-4477-4e41-953c-6b9fa1b0d4a9', 'Iure rerum doloribus similique est quia labore. Atque ab voluptate repellendus cupiditate quia eveniet. Ullam ut quo modi sed. Rerum quo dolores labore dolore est.', 'App\\Models\\Task', 50, 97, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(175, '33948e33-ce56-4440-8d0b-34168b6c8f52', 'Ut qui ut in incidunt molestias rerum. Eius repellat accusantium facilis voluptatibus. Aut quis atque voluptas natus sint est expedita. Quaerat doloremque in nisi corporis unde. Facilis facilis sequi doloribus dignissimos tempora et.', 'App\\Models\\Lead', 1, 132, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(176, 'e905067d-8fbe-41b6-a857-fc854f9f11a2', 'Perspiciatis blanditiis ut unde nesciunt dolores est. Saepe consequatur et officia delectus dolorum explicabo eaque. Praesentium aut veritatis exercitationem magni. Quia odio totam eveniet non aut. Eveniet doloremque quos ducimus perferendis molestias vel quos. Veniam quia non id mollitia iste. Quas repellat architecto quia commodi vitae quo qui.', 'App\\Models\\Lead', 1, 132, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(177, '645280a9-a9f7-47f1-b482-28421ddc6d5a', 'Dolores deleniti modi molestiae iusto corrupti repellendus. Eligendi tempora ut delectus dolor necessitatibus iusto. Deleniti sit perferendis voluptas distinctio doloribus ad. Qui temporibus neque et nesciunt fuga similique. Ut quos repellendus id architecto explicabo. Voluptas dolor corrupti ducimus cumque. Sit sed totam voluptas vel laudantium. Qui corrupti ipsam itaque recusandae qui. In optio architecto aut. Ut asperiores omnis reiciendis aut fugit tenetur itaque. Incidunt laudantium illum velit est placeat. Animi dolore harum amet nihil reprehenderit porro doloremque.', 'App\\Models\\Lead', 1, 132, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(178, '2aa8b2f1-4c14-40d9-9213-cd740d6a3a4b', 'Suscipit dolores nemo voluptas veniam totam. Dignissimos explicabo quos sunt.', 'App\\Models\\Lead', 1, 69, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(179, '0081719d-e5aa-4190-97b4-2949e1c41388', 'Quasi perferendis at necessitatibus repellat voluptate. Illum aliquam eligendi ducimus sint in dolore. Voluptatem excepturi nemo exercitationem aut recusandae. Non qui doloremque vel et dolores molestiae soluta officia.', 'App\\Models\\Lead', 1, 69, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(180, 'b56c503b-7de3-4054-b9a9-dd42e4683619', 'Dolores mollitia maxime aliquam sunt in dolorem nulla. Eveniet ipsam eius et ducimus culpa nihil. Eligendi sed non consequatur eum et et magni. Vero ut ducimus ducimus aut. Ratione suscipit quam eveniet commodi cumque. Dicta a iure omnis eveniet alias ea quae fuga. Rerum quam soluta eum similique. Aut aut quod rerum cum occaecati. Sit accusantium vel sint et. Temporibus optio dolore quis quaerat sunt soluta sed. Et beatae quae consequatur voluptatum fuga.', 'App\\Models\\Lead', 2, 138, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(181, '5494e5e2-8170-42fc-84ad-37ad329e7e92', 'Hic natus laborum fugiat quas rerum voluptatem. Odit sit ratione itaque quam doloribus. Voluptatem qui aut aspernatur dolor aut.', 'App\\Models\\Lead', 2, 138, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(182, 'ad14a4ad-f581-47cf-885e-bd4327732964', 'Cum quasi et est aut officiis repellendus perspiciatis. Expedita dolorum ipsa eius sed reiciendis ducimus.', 'App\\Models\\Lead', 3, 32, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(183, '89357398-34bf-4299-858f-727bc07c8fef', 'Nesciunt asperiores rerum eveniet est dolores qui. Non molestias neque omnis et iusto qui et. Error aut voluptatibus consequatur eveniet nostrum commodi qui. Eum est tempore ducimus vero ipsa amet enim. Impedit maxime quia voluptatibus quasi aspernatur aut qui. Provident amet ad quas ducimus quo debitis. Velit placeat accusantium quasi architecto nemo dolor. Quos voluptas aut architecto iste eveniet et nobis. Hic provident quia velit perspiciatis sed voluptatum.', 'App\\Models\\Lead', 3, 32, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(184, 'fd4709ce-d4f9-477a-b025-e5249feded79', 'Et ea laboriosam vel quas ut alias qui. Non in maiores quis in. Libero fuga ut ullam eveniet et quisquam. Molestiae sunt eveniet doloremque. Provident voluptas perferendis rem autem rerum sint dicta totam. Aut et natus dolorum totam dolorum. Eos qui natus qui aut velit assumenda.', 'App\\Models\\Lead', 4, 165, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(185, '7555e670-248b-462d-91cc-20f8654b9ad1', 'Officia blanditiis animi et aliquid. Qui et dolor incidunt omnis. Deserunt animi quaerat quaerat. Qui nobis ea ut mollitia itaque repellendus. Quidem sed maxime et corrupti impedit et voluptatem. Magni nulla architecto ea quas laboriosam magnam autem. Ab est sint incidunt vero est. Nemo veritatis laboriosam cupiditate pariatur corrupti qui facilis. Est eum nemo optio impedit est consequatur dolores consequatur.', 'App\\Models\\Lead', 4, 165, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(186, 'ac04f56d-9bfa-40bd-befa-08bc4991aacf', 'Alias voluptates hic vero. Aut qui est velit iste eum.', 'App\\Models\\Lead', 5, 77, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(187, '692b492f-8687-4b2d-b61a-cb3a7d285af8', 'Non ut hic vel totam id explicabo dolorem. Distinctio et fugit doloremque in culpa reprehenderit architecto.', 'App\\Models\\Lead', 5, 77, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(188, '0d0aedd8-f872-4c57-bd18-e60c428a4e6b', 'Autem optio veniam quasi. Hic laboriosam veritatis deserunt officia sed dolorum aperiam officiis. Sunt qui recusandae optio et et alias quo dolores. Eum et maiores voluptatem ratione. Dolorem consequuntur explicabo quo voluptatem similique. Aut reiciendis dicta aut. Rerum odio deleniti vitae excepturi. Nostrum sint ut omnis beatae nam qui nemo aspernatur. Voluptate magni quas inventore consequatur. Consequatur in iste modi nisi officia odio est. Nesciunt est ut dignissimos eos.', 'App\\Models\\Lead', 5, 77, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(189, '9150af68-5497-4829-80fc-7c6b79752239', 'Non non deleniti iure deleniti delectus repudiandae. Illum enim totam dolor minus tempore est magnam. Consectetur ea quo magni cumque ratione. Qui consequuntur ad molestiae qui omnis. Cum voluptatem corrupti earum voluptatibus blanditiis nihil. Dolores natus quo distinctio perspiciatis dignissimos exercitationem. Commodi iusto beatae rerum aut et. Ad odio qui est nobis.', 'App\\Models\\Lead', 5, 151, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(190, 'ec7a071c-1a08-4c94-b44a-d9f4b16fa245', 'Ut fugiat cupiditate enim blanditiis officia. Libero molestias debitis sit. Nam ex saepe qui quas reiciendis non.', 'App\\Models\\Lead', 5, 151, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(191, 'd9628747-8efe-4ee6-aee6-c9e275d11f80', 'Dolor vel non maxime voluptatum. In odit at iusto quas eos et sint nisi. Quia ut id voluptas deleniti praesentium. Perferendis beatae asperiores delectus fuga autem. Est nam dolorem aspernatur quo nemo eligendi. Voluptatum porro est excepturi et quasi aut. Dolor aperiam voluptatem aut qui. Optio voluptatibus suscipit est harum.', 'App\\Models\\Lead', 6, 59, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(192, '1fe867f4-9ec0-41c1-8a7b-f589c9e1128f', 'Molestiae porro laboriosam ad rem. Et et voluptatem nam labore. Iste alias aspernatur temporibus maxime ipsam fugit ullam. Amet ullam eos est corrupti reiciendis ea explicabo. Facilis aut quia iste officiis ut perspiciatis qui. Voluptatem iure rem et iure numquam omnis debitis omnis. Corporis rem aspernatur est inventore quia.', 'App\\Models\\Lead', 6, 59, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(193, '640ec7e6-93fe-4d54-995b-d1dc4c6f88ee', 'Quis velit quaerat quia. Fugiat dolor ut commodi consequuntur et. Et rem eum autem in. Corrupti necessitatibus odit optio perferendis aliquid modi nobis. Totam tempore tempora voluptas voluptatem voluptate. Et voluptatem nam nesciunt officia nostrum. Quam iusto ut rerum aliquid mollitia. Sed rerum corrupti et et. Eligendi alias ex magnam optio eveniet similique et. Veniam ex quibusdam quis sed. Minus fugit quaerat nesciunt eveniet minus quo consequuntur autem. Nam corrupti nam consequuntur perferendis. Modi sit quibusdam atque enim nostrum dignissimos atque aut. Fugit ducimus consequuntur voluptatem facilis eaque.', 'App\\Models\\Lead', 7, 161, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(194, 'acd13cc2-b586-4444-9e44-fcd2282abed5', 'Deleniti recusandae occaecati magni necessitatibus aut consequatur quaerat. Laudantium iure ex consequuntur voluptatibus. Sed autem molestias provident ea. Quia qui aut debitis ipsa. Iusto deleniti dolores maiores quam numquam. Cupiditate ducimus voluptas quidem.', 'App\\Models\\Lead', 7, 161, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(195, 'd060ee35-b901-448f-9baa-50e07301f1bd', 'Est perspiciatis accusantium assumenda blanditiis architecto dolores. Assumenda et officiis iste ut ad quia quod vel. Iure ratione voluptatibus aperiam eveniet id earum saepe tempora.', 'App\\Models\\Lead', 8, 158, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(196, '9046c493-5428-4eac-8855-81ce2068188c', 'Et ut assumenda et non repellendus exercitationem temporibus aspernatur. Ratione rerum cum perferendis quidem. Quia magnam sunt hic eligendi est nihil delectus. Nobis molestiae voluptas non. Velit fugit omnis et. Voluptatem iusto et iste voluptate.', 'App\\Models\\Lead', 8, 158, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(197, 'd43db965-199c-4425-8f3e-7fc9f399d135', 'Quis voluptatem excepturi quas non id dignissimos. Quo doloremque sed id in iusto et aliquid. Aut temporibus perferendis id repellendus voluptas maxime deserunt.', 'App\\Models\\Lead', 9, 57, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(198, '98a5794d-d7ff-429d-85da-f2baeb00733b', 'Eveniet sunt autem hic aut magni eveniet enim voluptatem. Illum est omnis commodi nisi quod nobis numquam ea. Incidunt quia sint totam non. Deserunt nesciunt quas ipsa.', 'App\\Models\\Lead', 9, 57, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(199, 'f066013b-242d-4c67-8a2b-f15d93d9c7fe', 'Consequatur dolor voluptatem dicta omnis quos. Corporis numquam commodi consectetur enim fuga. Molestiae delectus labore repudiandae. Rerum recusandae vitae eaque perspiciatis sit perferendis. Voluptas voluptatem sed sint eos nostrum ipsam minus. Laborum nihil doloremque ea quidem. Voluptatem omnis rerum et quidem commodi. Hic temporibus laborum enim quas.', 'App\\Models\\Lead', 10, 73, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(200, '3e7bedc9-ff0e-45c5-a7c6-66d5e6dbca26', 'Maxime distinctio voluptatem qui eum voluptatum deserunt et quo. Molestiae consequatur molestiae ex et omnis harum pariatur. Soluta est nam corporis ut veritatis ut. Corrupti hic quod est voluptatem. Consequuntur vel aliquid asperiores.', 'App\\Models\\Lead', 10, 73, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(201, '84c8fa32-7c30-43f3-9918-453351896ed8', 'Sint maxime et placeat maxime quis odit ipsam cum. Iusto omnis magni ipsam assumenda velit voluptatem. Qui dolorem magnam id nihil alias accusantium molestias. Sapiente facere consectetur est. Necessitatibus aspernatur rerum debitis aut quis voluptas. Error blanditiis et dicta aspernatur et dignissimos illum. Voluptas velit aliquid et ea rem animi.', 'App\\Models\\Lead', 11, 61, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(202, 'cdc27841-bf37-46f2-821b-0d0d3aa74b2a', 'Dolore ut eaque et est. Et facere ut ratione sit nam aliquam voluptas quo. Dolorum soluta qui et quo nesciunt provident. Dolor numquam sit voluptates exercitationem et repellat odio voluptas.', 'App\\Models\\Lead', 11, 61, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(203, 'fa857cfb-7462-4bfb-9514-ef4d76ad09ea', 'Et tempora facere sed ab mollitia. Et eum qui voluptatem nam. Laudantium velit cum consequatur dolorum repellendus. Sit error quia architecto dignissimos dolorem laborum. Doloremque corporis et qui ipsa. Mollitia architecto molestiae qui non temporibus non nemo.', 'App\\Models\\Lead', 12, 21, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(204, '964f96ea-c26b-4c7e-9c93-c5a13f518d0a', 'Ipsa saepe quo sit et sint soluta sed. Qui suscipit ipsum quas et minima. Et quae quibusdam possimus dolor aut eaque pariatur sunt. Voluptatem esse quo similique est inventore. Totam iusto at ab quis eius nihil sapiente. Commodi velit suscipit et nobis ea similique. Asperiores iste exercitationem assumenda tempora. Molestiae natus earum voluptas quisquam.', 'App\\Models\\Lead', 12, 21, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(205, 'e8553333-91d6-4e62-aa87-706f7365182d', 'Similique minus id enim neque voluptas. Harum et est et illo.', 'App\\Models\\Lead', 13, 29, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(206, '259301fc-8c1f-4492-819a-62e0e5302764', 'Qui quo exercitationem in facilis et impedit quis dicta. Tempore repellat suscipit dolor. Dolorem distinctio et deserunt non modi et iusto. Delectus sunt consectetur nisi suscipit provident.', 'App\\Models\\Lead', 13, 29, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(207, '0f71ea7a-e203-463a-ab86-792941458330', 'Placeat est ad quia fugiat. Corporis debitis ea perferendis id. Assumenda vel assumenda aut libero. Quas dolores doloremque est eum quasi nam. Rem architecto aspernatur animi soluta eveniet occaecati enim veritatis. Corrupti nobis quas non quas quas sed nisi. Soluta officiis fugiat laborum et. Saepe autem explicabo dignissimos. A corporis ea perferendis et esse nostrum qui. Quod sint inventore est est perspiciatis minus. Iure quas nisi dolorem soluta. Velit quis voluptatem placeat et possimus. Veniam nihil aut et enim ipsam repellendus repellendus. Blanditiis commodi vel soluta quod.', 'App\\Models\\Lead', 14, 141, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(208, '50d20065-4e77-4242-a178-22333023b23b', 'Repellat harum rerum veritatis nam. Est et totam neque quos ratione vitae. Aliquam non autem enim praesentium. Sunt assumenda cupiditate et eos. Accusamus qui corrupti accusamus ut non sint. Ipsa ea rerum hic ab deserunt quidem et. Minus aut voluptatem fuga vero rerum.', 'App\\Models\\Lead', 14, 141, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(209, 'e9cfee5d-7bc5-474d-ba87-842daa3781d6', 'Corporis labore officia a praesentium similique laborum sequi. Aspernatur accusantium ut consequatur omnis. Eligendi vero iste tempora ipsam. Maxime accusantium non ex doloribus rerum magnam laboriosam. Ducimus facilis unde et. Exercitationem iure sint ut neque quia voluptas. Et dolores qui velit quo a velit maiores.', 'App\\Models\\Lead', 15, 90, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(210, 'eef7bee7-2e6b-4312-a57c-e5784f31508f', 'Dicta autem nobis rerum inventore at et. Qui perferendis fugit unde et tenetur id. Asperiores fugit debitis at rerum unde in. Libero aliquid qui nisi possimus. Est ea molestias quo aut rerum aliquid minima. Voluptatum et voluptatibus repellat sit. Nisi dolores exercitationem voluptas qui consequatur. Qui recusandae eos sit maxime et.', 'App\\Models\\Lead', 15, 90, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(211, 'c5cd0008-cf5e-4f7a-bfb3-567a8e751735', 'Ab molestiae molestiae repellendus quia et. Voluptas eligendi est qui animi. Tenetur quas neque quia nobis aut quibusdam similique quasi.', 'App\\Models\\Lead', 16, 110, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(212, '5575993b-53cb-4b4e-8674-d9b1f9711440', 'Possimus nemo quidem sit odio. Et aut possimus voluptate. Impedit qui voluptas aut nesciunt autem quis.', 'App\\Models\\Lead', 16, 110, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(213, 'e1e8b56f-9ebf-439e-ae11-35bc63015633', 'Quas ipsam quam velit eius. Nemo fugiat accusamus illo consequuntur aliquam. Sit deleniti ullam eum id adipisci. Ipsam et dolor ducimus ipsam reprehenderit facere. Et minus error nobis doloribus et natus facere. Facilis error ipsum repellat cumque nam blanditiis quis sunt. Voluptatem eum enim officiis architecto cum. Quasi distinctio alias quo occaecati amet iure. Enim ipsa dolorem debitis quo ut.', 'App\\Models\\Lead', 17, 120, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(214, '76a8046a-ce16-4818-b1e0-b8bf3ce546e7', 'Ipsum dolorem facilis et quasi neque eos debitis rem. Fugit itaque pariatur et ut aut. Quibusdam culpa labore et eum atque.', 'App\\Models\\Lead', 17, 120, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(215, '4c394745-ef72-4c36-983e-09c0fb3ff914', 'Repellendus aut repellat illo illo. Qui a earum earum quasi quae consequatur.', 'App\\Models\\Lead', 17, 120, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(216, '538f3090-d16b-4c8e-a463-2cd23b77f7fe', 'Rerum eius eveniet libero doloremque. Pariatur quo in consectetur dolores harum. Provident dolore ducimus alias fugiat. Qui ut ea asperiores nostrum dolor. Quae praesentium laborum quia molestiae id et. Consectetur praesentium blanditiis unde reiciendis est nihil. Assumenda amet impedit excepturi asperiores tenetur.', 'App\\Models\\Lead', 17, 45, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(217, 'b11c9072-0654-4788-9278-81ea594dde10', 'Labore aut labore non. Harum quae in et cumque velit deserunt ut. Sit atque aspernatur recusandae recusandae culpa ducimus. Aut accusantium quae ut quaerat harum voluptatem. Natus fugiat dolore fuga et itaque non ut.', 'App\\Models\\Lead', 17, 45, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(218, '6c97be77-cd1c-4074-acbb-e022b0e4448d', 'Sint quibusdam sed eum repellendus. Qui quo corporis officia sit. Error consequatur culpa ex quam quo. Eos rerum mollitia pariatur. Dolorum nihil illo nulla quia et quam eum. Voluptatem aut eos eos porro. Exercitationem aliquid est dicta.', 'App\\Models\\Lead', 18, 155, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(219, '447d07b1-5115-498c-8ab5-42ed49903428', 'Aspernatur optio iusto et quaerat. Accusamus sequi nulla voluptas quos ut qui. Qui ut praesentium voluptatem fugit esse corporis. Nemo dolorem autem aut voluptas. Voluptatem minima aut aliquam sit omnis et. Nulla nulla totam velit.', 'App\\Models\\Lead', 18, 155, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(220, 'b0fca7d4-711a-4b94-81d1-8f46296d91c4', 'Officia provident ut neque. Consequatur laudantium cupiditate occaecati nisi facere.', 'App\\Models\\Lead', 18, 155, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(221, '4afb75c9-7db9-4dd5-aef5-950c8c9e6e49', 'Enim ipsum quia blanditiis sint. Voluptatibus quaerat minus ipsam et impedit dolorem placeat. Velit iste odit eveniet nemo dolorem quidem itaque ut. Repellat deleniti et quisquam commodi et perspiciatis. Nulla adipisci quis porro et dolores laboriosam molestias. Est et ut labore ea accusamus culpa enim.', 'App\\Models\\Lead', 18, 93, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(222, 'e6579b45-cdf9-439c-8b9e-3bf8ddfeb619', 'Dolores nisi fugiat et id earum sapiente. Atque aut eius impedit quam.', 'App\\Models\\Lead', 18, 93, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(223, '76bfd460-e8e8-4103-b738-6756eb5560bd', 'Sapiente odit et ullam. Facilis est quis qui necessitatibus ipsa. Dolor eligendi officia quisquam dicta. Perferendis provident delectus ab molestiae modi. Mollitia accusantium perferendis rerum neque. Voluptatibus odio eligendi optio velit pariatur molestiae porro. Et pariatur sequi voluptatem sit delectus nostrum quis.', 'App\\Models\\Lead', 19, 105, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(224, '9ca0d7a0-6e41-4f44-a0c2-29e48ee3bf64', 'Atque tenetur laboriosam voluptatum aperiam eius distinctio voluptatem. Earum odit nam aspernatur enim architecto. Qui et ipsa fuga. Ut quia error similique excepturi et id corrupti. Ea id ratione magni distinctio. Sit et dolores saepe illum. Aut facere quos qui quia consequatur.', 'App\\Models\\Lead', 19, 105, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(225, 'bbae09eb-b261-4594-8fef-5a0418f3c304', 'Ipsam reprehenderit error rem. Velit odio aliquid ipsam recusandae hic magni. Id nesciunt sed aut distinctio aliquid quia cupiditate.', 'App\\Models\\Lead', 20, 18, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44'),
(226, '284cd50f-eeb7-449f-857e-c8bf61bb3878', 'Velit atque esse eligendi nesciunt. Incidunt et hic aut non officia. Tempore accusantium et et rem. Quod eaque et nihil quidem molestiae ipsa occaecati. Sint qui pariatur omnis maiores. Dolores qui deleniti quisquam accusamus commodi quae voluptas. Assumenda reprehenderit necessitatibus quis.', 'App\\Models\\Lead', 20, 18, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `primary_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `external_id`, `name`, `email`, `primary_number`, `secondary_number`, `client_id`, `is_primary`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '7ab84ffc-28db-304e-b0f1-c2a1cd2199c0', 'Hans Boyle MD', 'padberg.micaela@pacocha.net', '58038951', '81333343', 1, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(2, '362691ba-65bc-37cb-abf3-53a2ffb2f130', 'Miguel Marquardt PhD', 'candice.ullrich@ebert.com', '30968513', '96367260', 2, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(3, '1f6551f3-e9ac-3165-ba05-d9263d4bc139', 'Mrs. Elta Buckridge', 'jailyn45@dicki.net', '15624160', '51914467', 3, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(4, 'cd5dc31e-0d19-3297-b5b2-9c970126695a', 'Carmine Jones', 'wmckenzie@homenick.com', '82490951', '3249227', 4, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(5, '929688ef-8998-3f96-b359-2e5278d364e6', 'Marilie Hoppe', 'carlotta12@yahoo.com', '37112750', '14754452', 5, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(6, '0f12d4bf-3eb3-3377-87e5-97256158b00e', 'Rhoda Jones V', 'ova.mann@yahoo.com', '8613836', '45105834', 6, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(7, '175ac952-a39e-3314-b278-616fa13e6b32', 'Graciela Schuster', 'dickens.carey@conn.com', '30346297', '52766290', 7, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(8, '34b85de9-c91d-3d0a-b871-00ab9b8cde72', 'Wellington Mosciski PhD', 'anita06@yahoo.com', '12448993', '4028150', 8, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(9, '5e78eea2-f146-32ee-b214-c0487e0608cf', 'Carissa Padberg', 'pacocha.gisselle@hotmail.com', '49862738', '58212068', 9, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(10, '9c2fba61-2d51-3408-a5ac-2bc2a1be5452', 'Mrs. April O\'Conner', 'alegros@krajcik.com', '93183676', '30014096', 10, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(11, 'f9d8e3ca-cae6-3d2a-b56d-1ab383175db7', 'Myles Murray', 'maverick.dietrich@yahoo.com', '49925642', '87086551', 11, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(12, '64cf9c03-2bb9-34a8-a92e-67b517978382', 'Mrs. Erna Crona I', 'estel79@breitenberg.com', '64909859', '64418859', 12, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(13, 'bb83a17a-2c08-3047-b975-e96e712277a0', 'Alexandro West', 'schinner.beth@gmail.com', '4710884', '93549346', 13, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(14, '3f06ba42-6442-3ebe-9fa1-4be6c30f8400', 'Miss Ophelia Lockman', 'kaya79@yahoo.com', '11103533', '57305536', 14, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(15, '4aad66fb-ec79-3162-ac70-0ea988b5a5cb', 'Alexie Halvorson PhD', 'haley.chyna@hotmail.com', '41730714', '88954396', 15, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(16, 'e89f93aa-851b-3e0e-9881-67436059098e', 'Lynn Daugherty I', 'rosenbaum.alek@yahoo.com', '32586176', '7548809', 16, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(17, 'b31ad51d-cffe-3eac-8ee9-97db48575c22', 'Mr. Jarrod Bosco', 'laney02@yahoo.com', '99701524', '88021593', 17, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(18, '0a4e6711-1321-3215-a54e-39d7ad56a1bf', 'Deborah Collins', 'eusebio.koelpin@yahoo.com', '43787814', '58673363', 18, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(19, 'b2734def-2f2a-34cd-bd74-5a39c84ee074', 'Rolando Kuhlman Jr.', 'ernser.libby@hotmail.com', '17117844', '42408435', 19, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(20, '4f01227a-4b18-32ca-9585-67cf89df19e1', 'Dr. Tom Nikolaus IV', 'veum.cristal@yahoo.com', '60931921', '23343494', 20, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(21, 'a616b4c7-c8b3-3670-8ab4-897a5b7ddcc5', 'Cameron Bradtke', 'chomenick@shanahan.biz', '55650015', '81227550', 21, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(22, 'cb5c0675-9b8f-342b-b132-5aff39a78be6', 'Daisha Dickens', 'mariane.sauer@hotmail.com', '5032392', '43584272', 22, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(23, '36b19cbf-b99c-3a7e-895c-a716c6de58da', 'Ms. Darby Beer', 'guadalupe.crona@torphy.com', '34696722', '92789671', 23, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(24, '7b72e38a-b29d-3b2f-9fdd-48346dc22cde', 'Shana Dare', 'annabel63@jenkins.info', '4451075', '3953860', 24, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(25, '0a4c2e45-d45e-3108-a97f-2c353790279b', 'Dr. Lloyd Hintz PhD', 'schneider.adela@kuvalis.org', '82911596', '38549002', 25, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(26, '929e4642-0f35-31d9-b797-32abda46a381', 'Mrs. Name Collins Jr.', 'hermiston.jude@wilderman.com', '85902218', '86630126', 26, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(27, '02e4cfdb-0296-39b6-b126-ce5e8642c7cb', 'Manuel Kozey I', 'bechtelar.dee@hotmail.com', '63467213', '92957026', 27, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(28, 'e8e35b31-7bd3-3a37-8847-87f975fb7334', 'Mr. Nicola Halvorson V', 'golda48@heller.com', '49722317', '77086850', 28, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(29, 'db95a00d-b311-352f-8bb4-a178aa29f1cc', 'Marcellus Toy', 'keebler.lizzie@torp.com', '16874836', '42761240', 29, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(30, 'a2882d2c-0c96-31df-adb4-4d31ea23a225', 'Jordyn Cronin DVM', 'reinger.willie@yahoo.com', '80809032', '47750104', 30, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(31, 'ab8f90f8-f177-3e67-9848-2bc47b5a016e', 'Magnolia Davis', 'pjones@upton.info', '10963593', '30968767', 31, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(32, 'e93cdca7-ed9e-345f-9b50-a8c6e259cb91', 'Kelton Torp I', 'lmills@crona.info', '64673303', '5113070', 32, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(33, '8ec327d9-aecb-3b6b-a95b-69b602849cd0', 'Tiana Jast', 'senger.adeline@funk.com', '17619341', '65833354', 33, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(34, '0343756a-6b1f-33df-8c4c-c87f06a299bc', 'Ephraim Parisian', 'josefa88@gmail.com', '22180896', '27974435', 34, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(35, '8cfcf4d7-0b32-3e9c-b08a-83cbc9870505', 'Dahlia Erdman', 'sheila66@hotmail.com', '25030633', '84087796', 35, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(36, '8ea353aa-e5a2-3cd9-af9c-39caa3d0f883', 'Jonathon Wintheiser', 'estell.ryan@gmail.com', '95171620', '65514924', 36, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(37, '66021ab5-c4ec-3d40-9de7-59c77d368717', 'Rowena Gerlach', 'blick.paolo@gmail.com', '92301876', '85890386', 37, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(38, 'cbe1a164-1002-3f0f-a0b9-e5aee0cb0658', 'Dr. Alia Stiedemann V', 'mante.viviane@torp.com', '93066137', '51726831', 38, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(39, '65b7c35e-c2d5-31b6-9555-a798fdeabe66', 'Felton Moen', 'millie11@hotmail.com', '46692712', '11537007', 39, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(40, '66b90a69-5b3d-3490-bd4d-46e9e66e613a', 'Jesus Auer', 'juanita.anderson@yahoo.com', '9094992', '69923912', 40, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(41, '0bcc4034-cc4b-385a-b405-2ae54ce86cdf', 'Alyson Rowe', 'gilbert.robel@hotmail.com', '95415596', '88780097', 41, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(42, '14ccc996-e144-30cf-98f5-0de1740bf33c', 'Emil Paucek', 'bogan.johathan@altenwerth.com', '45336023', '48947930', 42, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(43, '67f5b17b-09d6-3f10-81fb-7f888cdb4a20', 'Robyn Kovacek DDS', 'arianna87@gmail.com', '10211163', '16566353', 43, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(44, '6d930d6d-0093-3db6-9c74-c5fe19e5df6a', 'Abigail O\'Connell', 'layne06@toy.net', '23138004', '84750100', 44, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(45, '241598c3-495f-324d-b74a-092d4a9d2fcd', 'Daniela Grant', 'sasha.ryan@gmail.com', '74101938', '46893194', 45, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(46, '1c9ba3cb-9b07-3c27-98b1-5b67c9c76484', 'Jennie Heidenreich', 'ocrooks@gmail.com', '72888693', '91836490', 46, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(47, 'ce7c5869-0628-3035-a875-d8a02d8b05e8', 'Lambert Wyman', 'prosacco.edgardo@yahoo.com', '73112010', '16915148', 47, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(48, '7d9c5e68-c67f-37cf-8bbd-1ac65992cf7a', 'Ruthe Gerlach DDS', 'margaretta.skiles@koch.com', '78822571', '11700437', 48, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(49, 'f50d9ce8-ed22-39dc-8ace-238db7c59d9d', 'Dewayne Romaguera', 'otho.medhurst@wisoky.com', '20403997', '74843861', 49, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(50, 'd2d0b645-bdc3-35a9-8ebc-c5b05f861494', 'Tobin Hermann', 'garland.rempel@ortiz.net', '36449124', '45830038', 50, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(51, 'b9604525-2384-34c5-b4ff-c077dfd72234', 'Lexi Ankunding', 'jessy.ruecker@yahoo.com', '79025251', '295696', 1, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(52, '8d458b25-d38e-3d4d-a1f4-00c05586c656', 'Miss Kasey Fritsch III', 'wilderman.cassidy@satterfield.info', '87786354', '75430953', 2, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(53, 'e96eabd2-1b45-38c5-86b2-dbcaa16baf45', 'Patsy Gottlieb', 'ressie54@yahoo.com', '69194352', '7630863', 3, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(54, '29e11b00-672c-3094-a689-e1e6391aea12', 'Mr. Marcel Anderson II', 'westley14@lind.com', '24832682', '65672086', 4, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(55, '1b4a1fda-8e5c-38f5-bdf4-73f15fc19bf3', 'Ms. Kathryn Hyatt', 'isteuber@hotmail.com', '38439465', '24762506', 5, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(56, 'e0ec3323-a61d-3a78-8279-d4321900bf8c', 'Miss Reina Turner', 'kuhic.wade@hotmail.com', '86859409', '89937652', 6, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(57, '8d7ba4f1-8375-32f0-baeb-56dd6337c7dd', 'Miss Sabrina Renner', 'pete.schulist@hotmail.com', '68897644', '7685478', 7, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(58, 'dff8ada3-2cde-3168-a999-50fc849a1c1e', 'Kurt Jerde', 'beryl10@gmail.com', '35529398', '17584272', 8, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(59, 'ba10e3ad-5e4c-37d6-be4a-eb9b62f48528', 'Gustave Cremin', 'colten.gottlieb@little.info', '29236148', '40438927', 9, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(60, '77470385-3a5b-3e06-84c8-5de7b428da60', 'Helga Collins', 'jdurgan@oberbrunner.com', '29113516', '11340106', 10, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(61, '68465173-689e-3d4b-83c9-848a5f41964b', 'Tierra Herman', 'tyrel.jaskolski@hilpert.com', '71379849', '36478087', 11, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(62, '250545a5-a147-3efd-a8ae-a4f4dc0bd3d8', 'Mr. Anibal Rath II', 'thane@yahoo.com', '90517627', '79808460', 12, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(63, 'fe1249f0-a35a-30c8-aa1a-c6ddab440be6', 'Mervin Langworth', 'kbruen@yahoo.com', '11761249', '98072962', 13, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(64, 'a5981d86-5690-3298-b2c7-2316400cfc91', 'Priscilla Bartoletti', 'bernhard.elmira@leffler.biz', '19228385', '41214542', 14, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(65, '7d72a5e7-5a77-3fb7-9a44-3d208d55ea99', 'Ellie O\'Connell', 'ike72@gmail.com', '96921315', '56504030', 15, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(66, '78ad4fc3-83bf-33e7-809e-9a87afa5e2b7', 'Dr. Aric Denesik', 'jgusikowski@hotmail.com', '83056296', '6870480', 16, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(67, '16f7712d-2385-32a7-bd05-f094f8a0e2e6', 'Daisy D\'Amore', 'tglover@gmail.com', '70884672', '28519295', 17, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(68, '35dc6682-1bf8-3157-8f28-2d205cea12eb', 'Mrs. Genevieve Jenkins', 'hhansen@blick.info', '75972099', '17161956', 18, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(69, '0228ca71-2931-3c7b-8a72-ddfefe1dd25f', 'Cleve Balistreri', 'noe.welch@gmail.com', '59190982', '1444030', 19, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(70, '65e8ce35-6efd-3490-928d-182254460cce', 'Yazmin Keebler', 'chloe.zboncak@yahoo.com', '6124689', '42408682', 20, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(71, '3f4c9e6a-1ce2-3a1c-a9a2-c6ed371a1df9', 'Rebeca Keeling III', 'marlene92@gmail.com', '57365390', '16672862', 21, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(72, '00861632-14a0-3771-8ce7-d9d2fdaf0366', 'Emmitt Jakubowski III', 'wvolkman@gmail.com', '74500714', '69258098', 22, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(73, '33ece36f-18c3-373d-bfd9-0fbe13d2685e', 'Kelli Breitenberg V', 'fredrick38@schowalter.com', '27781907', '8068567', 23, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(74, 'f467be91-1f40-37f5-b416-258dbf994130', 'Jerrod Cormier', 'percival.prosacco@little.com', '26857136', '45414959', 24, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(75, 'd3582d30-41f1-383d-96f0-7f150f7e62f2', 'Dr. Quincy King', 'itromp@nienow.net', '49631906', '48883342', 25, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(76, '5c47e087-9c41-380b-a51b-0b98f669df7e', 'Dr. Christophe Connelly', 'jena.kessler@hotmail.com', '70157095', '86947365', 26, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(77, '98f99484-fd9f-3c29-9a9b-6b438bb41b23', 'Brandon Marquardt', 'oernser@herman.com', '6621397', '56057499', 27, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(78, '00ed3ba7-3cc2-3bd8-8692-40c635793da6', 'Nadia Kovacek', 'dkuhlman@gmail.com', '50999123', '76537572', 28, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(79, '6c45e3bd-3606-306f-8dd4-606a1b078f05', 'Prof. Ernie Jakubowski II', 'kelly40@collins.com', '26878213', '96219108', 29, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(80, '4df49c6b-d742-3176-ac23-edcc1e43adda', 'Dr. Riley Rohan V', 'maud.volkman@maggio.info', '98643580', '27549680', 30, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(81, '27c6f608-a6cf-3430-8242-336db46388b9', 'Yadira Schmeler', 'osborne.huels@west.biz', '21463492', '25680314', 31, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(82, 'd369b9a2-c00a-3020-b771-7b30b5485196', 'Andy Littel', 'nabshire@yahoo.com', '69276813', '82002039', 32, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(83, 'fcf0360d-6c95-3c60-b9a8-440bd79d6c83', 'Collin McClure', 'sterling60@gmail.com', '41825612', '19080119', 33, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(84, 'a044e7b1-8f07-39a9-baa6-57362b1bf668', 'Saul Bernier', 'tmosciski@yahoo.com', '27836821', '64877803', 34, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(85, '707dd110-6afb-3157-acd7-b21c299244e8', 'Amparo Bartoletti', 'pheller@yahoo.com', '87182440', '11035873', 35, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(86, '83aa4282-6f84-3d5d-b5f4-1fa8a4b38ca3', 'Ms. Emilie Will DVM', 'foster48@hotmail.com', '52187156', '53072590', 36, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(87, '0f647ef4-bc9a-3463-9472-c51373955d6d', 'Emilia Klocko', 'eino.rogahn@predovic.com', '7093158', '66014487', 37, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(88, 'c75bb3c4-5fc6-3a47-ac71-e9a3017666a8', 'Prof. Rose Roberts', 'adriel69@yahoo.com', '34409676', '32035507', 38, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(89, '2130a5a5-513d-3aed-97d7-8a72ac110412', 'Gretchen Nikolaus', 'dejah.greenfelder@gmail.com', '37951989', '58736425', 39, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(90, 'a2d4c5e3-b423-3467-8b46-c38d8e899db8', 'Jaleel Harris', 'ella02@gmail.com', '1257151', '60915979', 40, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(91, '6c9d026b-c98e-3283-9f90-6149d9a3573a', 'Brian Weber', 'helen18@wyman.com', '39711932', '69539020', 41, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(92, 'c97910bc-498c-3e9b-a3b7-52c0d28ade42', 'Coralie Ward', 'eusebio.reichel@wolff.info', '83986656', '91927293', 42, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(93, '7ec8129b-c079-32f9-bae1-dd9ee9f14729', 'Emilie Thompson', 'daniel.bennett@hotmail.com', '38424804', '61505525', 43, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(94, '3bafadcc-85a8-3d14-86d3-fdf0b1149d5c', 'Ned Heidenreich', 'ucasper@feil.biz', '79789962', '74481047', 44, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(95, '94cb6b22-46bf-3b9f-9038-350e6e8d04e0', 'Francis Casper', 'miguel.waelchi@gmail.com', '23314842', '22611532', 45, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(96, 'ccefd194-b37b-302c-b747-c84bd16f8679', 'Missouri Bernier Sr.', 'hpacocha@yahoo.com', '25910029', '95800272', 46, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(97, 'fea26d9b-cc7a-3a89-b535-197448c0b7cc', 'Chauncey Hegmann', 'kane.corkery@koch.com', '44330467', '21754261', 47, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(98, '0fde0405-1366-38a5-b0a0-99dea1a22c02', 'Dr. Frances Schimmel', 'sven.gaylord@yahoo.com', '28074257', '92235618', 48, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(99, 'd54c7747-d4a6-3e77-b818-1430516b13d2', 'Erik Raynor', 'pfay@gusikowski.com', '50497152', '8838769', 49, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(100, '1546cac1-3645-35ba-bd39-a6f3fe4629da', 'Chris Hill', 'qpollich@yahoo.com', '20859165', '83946130', 50, 1, NULL, '2021-10-19 12:25:30', '2021-10-19 12:25:30'),
(101, 'a43a863b-7ae9-3192-a3ca-55770b52df7b', 'Mr. Julius Beatty PhD', 'dewitt.vandervort@gmail.com', '83369105', '19061503', 51, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(102, 'b365d6fe-d318-321e-b255-24d65155bb0a', 'Rosina Russel', 'kessler.sedrick@yahoo.com', '85061291', '34417347', 52, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(103, 'fcfc17e5-5076-357e-9249-ed2cd56acdf0', 'Mr. Dangelo Swaniawski', 'kurt.heidenreich@yahoo.com', '31974004', '23566880', 53, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(104, 'a82a288c-029e-3dfd-86a2-584c32bb2c94', 'Dr. Amelia Cummings Sr.', 'hanna62@oreilly.biz', '39202879', '99408068', 54, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(105, '7140daf9-f41b-396c-bf6a-58da5076e552', 'Sophie Ledner', 'asia78@reinger.info', '44922171', '84664675', 55, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(106, '3f142c07-fa97-3666-8741-678645922795', 'Leann Rath II', 'lee.parker@kovacek.org', '32314924', '2859438', 56, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(107, 'f6834963-8191-3619-8b39-7934f650cfb9', 'Myrtis Moen', 'hessel.fleta@brekke.net', '70050376', '10561367', 57, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(108, '3dc48993-fa17-3213-8156-54d480a47508', 'Miss Eulah Roberts V', 'alta03@yahoo.com', '64189233', '83361317', 58, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(109, 'fc2bc981-399c-31d3-a124-4c5e0a5865af', 'Ms. Anya Herman IV', 'herta.terry@hotmail.com', '21877703', '22478070', 59, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(110, 'c70e2419-af18-308c-a516-40a8f9a00ca5', 'Arlene Klocko', 'vratke@pollich.com', '96488865', '30238704', 60, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(111, 'bd8e2504-3ca3-3505-a49a-36bfd7d7218b', 'Jeramie Kuhlman', 'sigurd.stokes@yahoo.com', '40146937', '49303953', 61, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(112, 'd7af3e57-8dc7-3e55-8726-82c59c26550e', 'Mrs. Susana Rohan II', 'schoen.mathew@gmail.com', '92188915', '31708932', 62, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(113, '6037ebd7-51d2-3073-9cca-cc96bb648fb0', 'Verner Cummerata', 'orie28@olson.net', '47524269', '63704105', 63, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(114, '20f512ba-5958-3288-9ab4-dbd3c39040b0', 'Mrs. Mollie Considine', 'mohr.lue@becker.net', '18141097', '35676013', 64, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(115, 'c3fb7870-b7ef-3059-abf3-75d7e6f4fde0', 'Luis Hilpert', 'mariana22@yahoo.com', '39044438', '16284719', 65, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(116, 'c5dd77b8-d2af-3a2a-9230-099d5bcd7875', 'Ashley Hudson', 'ucassin@gmail.com', '69465393', '43086832', 66, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(117, '82231db7-d9a3-36c6-91c1-0f473fbc39d9', 'Chyna Schinner', 'rath.emmanuel@hotmail.com', '86450777', '54423073', 67, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(118, '29c3be44-1d24-3deb-983b-d279efe760b8', 'Leatha Satterfield', 'linnea68@yahoo.com', '26159020', '12309858', 68, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(119, '46f0b148-6838-3064-8ee7-46a127bf3d4e', 'Miss Lila Reichel', 'virginie13@gmail.com', '73922203', '76645670', 69, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(120, '3be79df4-5a77-3b4b-ba47-18fda5f0ea46', 'Aimee Jones', 'goyette.kylie@gmail.com', '22890606', '67493092', 70, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(121, '71042ef1-9d83-30ea-9e0f-4c49bf900973', 'Miss Augusta Ondricka V', 'bednar.owen@yahoo.com', '22857792', '99873348', 71, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(122, '9a019f78-0523-394b-8ea6-3fe6222d0648', 'Krystel Koss I', 'uosinski@flatley.com', '1177313', '47975932', 72, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(123, '1524a9fd-c9e8-3436-a37b-355227d21c52', 'Kamryn Jacobi', 'ibogisich@yahoo.com', '6923198', '55639029', 73, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(124, '8befff38-cb2b-34c5-af0a-962399979571', 'Felipa Bernhard IV', 'hudson.caroline@tillman.biz', '98679593', '30931532', 74, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(125, 'd05d069d-ed2f-344b-a577-697479546dbd', 'Daphne Jerde', 'gleason.lilliana@gmail.com', '9282131', '66740512', 75, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(126, '1bb0fe55-b7cc-3d08-a5b0-3d66177c0d0d', 'Selina Kunze', 'donny.berge@friesen.biz', '49761773', '73961703', 76, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(127, 'f2a52a5c-cd0d-30b2-be35-6cb8038e32d5', 'Beverly Skiles', 'marilou.oberbrunner@hotmail.com', '53953455', '94549137', 77, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(128, '6fa63bb1-4e88-3377-8628-330d6cfe00e1', 'Dr. Jaron Corwin', 'abbey75@yahoo.com', '79735667', '50075682', 78, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(129, '71b2a6c2-603f-3d19-90e4-8dbe2655505c', 'Richard Konopelski', 'demarco76@yahoo.com', '30233425', '46004056', 79, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(130, '14dfb152-5508-30b1-9c77-3f6fef38d954', 'Dr. Annie Ortiz III', 'clare57@jacobi.org', '44869188', '47493793', 80, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(131, 'd54042b5-d07d-37fb-a61b-c322b9cf73cd', 'Mr. Charles Kulas DVM', 'pkulas@kuhn.info', '26155114', '95432979', 81, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(132, 'ff08ac4a-29f8-3cb4-8299-c278ebb862b7', 'Raquel Kuvalis', 'tlittel@yahoo.com', '18073341', '89366392', 82, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(133, '3d80aacd-e400-337a-be9d-2fb2f30f76e3', 'Layla Balistreri Jr.', 'cierra12@hotmail.com', '70626665', '2059647', 83, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(134, 'ff6f2044-a623-39e8-8fae-433b5ff22025', 'Josefa Stokes', 'bernhard.madison@lebsack.com', '5429337', '60097421', 84, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(135, '26eca0e6-d8fc-3df1-9c7c-4ae82d9027a6', 'Gus Pagac IV', 'wadams@kihn.com', '90050454', '73979538', 85, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(136, '68be07d8-859c-320f-b943-76a6312700b3', 'Ms. Katharina Grady', 'gage05@gmail.com', '83567309', '10691769', 86, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(137, 'e4862d4e-030b-30dd-a252-3a53d5465d5a', 'Marcos Spencer', 'cassie.hirthe@fisher.com', '81027992', '65957505', 87, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(138, '50c1b2f5-5570-35be-8a06-ab43ce879d36', 'Dr. Ezra Graham', 'pmurray@damore.com', '79512369', '2739336', 88, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(139, '0d5ffd1f-5573-364b-b98c-07a1302f0bb6', 'Orlando Schoen', 'boyer.anya@hotmail.com', '26372401', '63150679', 89, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(140, '45deb24b-6ead-3dae-b4d8-1659bc4a6059', 'Mr. Clark Thiel II', 'salvatore.hammes@koelpin.com', '26847499', '83436787', 90, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(141, '41c6676b-b165-3762-8fae-ed16eb601716', 'Dr. Rylee Berge', 'roslyn.bergstrom@borer.com', '46955471', '42075932', 91, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(142, '3a035468-a58a-3fe5-bf40-7eb0e6121f61', 'Mateo Schuppe', 'ervin.johns@farrell.com', '45612932', '35562141', 92, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(143, 'b782febb-28d6-31e8-9288-7afc5c555d91', 'Ali Schoen', 'kailey35@bergnaum.com', '58781563', '11901927', 93, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(144, 'c19d460f-a70f-3dfd-a1ef-cdf3060c728c', 'Josiane Schinner', 'everett.schumm@hotmail.com', '41372521', '67982545', 94, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(145, '987dede7-2de5-3ea4-b27b-03e4fc276be9', 'Frank Pfannerstill', 'evelyn.parisian@oconnell.com', '85921224', '46130950', 95, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(146, '614f4c7e-b065-3260-b326-f6889585fc0e', 'Prof. Clay Koelpin', 'juwan.fritsch@farrell.com', '67674184', '63894233', 96, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(147, 'fc4c790b-29dd-30e7-aab3-d33b08421831', 'Zena Wilderman', 'demard@hotmail.com', '79257952', '75707635', 97, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(148, '1c4898b5-c2d0-3155-a2b2-e786c9e32999', 'Merle Leffler', 'sankunding@hotmail.com', '35832387', '29011596', 98, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(149, '25333b38-0b98-3aa8-ae00-0f5a2775e1e9', 'Chelsey Ratke', 'kris.hayes@mueller.org', '80983271', '51823792', 99, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(150, '20009002-0bb8-3bb2-acc0-8b9f5457d581', 'Mrs. Lenore Mayert', 'lakin.maybell@yahoo.com', '59670639', '21689060', 100, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(151, 'b76798d5-01af-311a-b4cc-b40f05d226b4', 'Prof. Dewitt Abbott IV', 'bridgette.cremin@ortiz.com', '81252781', '80373530', 51, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(152, 'f15a45ed-2d93-3d66-a8b0-e1e0220ee4ba', 'Mr. Gustave Herman I', 'blaise.hermann@carroll.com', '12311240', '94591216', 52, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(153, 'c1e64fff-b4cd-38e7-b304-e91d72eecde0', 'Dr. Candido Nolan IV', 'lindsay.okuneva@yahoo.com', '83531055', '31127148', 53, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(154, '42bf0db2-01c3-3b65-b73e-70a9b342ec23', 'Zaria West', 'helmer03@gmail.com', '69217673', '8650282', 54, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(155, '35ecc24e-8662-319e-913c-24baa6c043d3', 'Meda Borer', 'katheryn.rempel@hotmail.com', '64109279', '77647582', 55, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(156, '8c4c9e4b-b246-311c-8d36-36c9e44cb271', 'Mr. Quinton Lindgren II', 'jean.hessel@gmail.com', '69792541', '45821108', 56, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(157, '9ba4313d-c818-3951-bdfe-1e7176cc474f', 'Isom Wisozk', 'britney31@yahoo.com', '88573916', '44499330', 57, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(158, '067c141e-f308-3f52-a040-0831ef2308e7', 'Ludie Murphy', 'west.frederique@hotmail.com', '93784088', '30176638', 58, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(159, 'e317570c-64a1-3c3f-8a8d-d9e94f410395', 'Esther Goodwin', 'gorczany.elbert@leannon.biz', '37772821', '95206850', 59, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(160, 'dc741358-9868-335b-9810-5c37f0b2e52c', 'Dr. Blaise Adams DDS', 'koch.vida@gmail.com', '31550979', '28107373', 60, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(161, '9cbc1ebf-3fef-3ff7-9e16-396aaedaaea0', 'Madelyn Kozey', 'paul98@cummings.biz', '541007', '66033812', 61, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(162, '39caaf8d-52c9-374c-84f7-c4d730c1e872', 'Roderick Barrows V', 'mitchel71@mitchell.com', '80782720', '15204682', 62, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(163, '26da26c2-9da8-3e5c-9a05-055ea851b3f6', 'Osbaldo Larson IV', 'kfunk@gmail.com', '55160053', '21381076', 63, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(164, 'a8ca53bb-bb20-32d2-9c08-fd7bd23dd185', 'Dr. Florine Walter III', 'douglas.hailie@schroeder.com', '28878176', '10169422', 64, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(165, '6f059858-e180-3f22-a504-2eaf68ba0a48', 'Frederique Kovacek', 'runte.sandrine@yahoo.com', '30552058', '96399263', 65, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(166, 'a54c59e6-4797-3967-8298-cca5acb84b7e', 'Ewell Beier', 'darien47@gmail.com', '69518388', '17458195', 66, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(167, '5ce22572-c715-3b30-b83a-668839d0154d', 'Kameron Waelchi I', 'vgreenfelder@gerhold.com', '61339850', '64907950', 67, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(168, '7184e450-25ba-393f-96f9-df8c714b20ac', 'Dr. Elza Larson', 'kshlerin.deshawn@hotmail.com', '8814807', '36091848', 68, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(169, 'e1224d98-9a44-304f-9c42-7a004fb30b33', 'Prof. Malachi Beahan', 'ratke.karolann@gmail.com', '20683173', '44531786', 69, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(170, 'b5e0a015-4930-3a83-80a6-7413267405ec', 'Elinore Gorczany', 'leffler.brandyn@gulgowski.info', '85809685', '53662610', 70, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(171, 'c617bde8-1907-32e2-b2c6-054bf335721b', 'Zaria Hamill I', 'adonis.hoeger@murazik.org', '67317118', '52879420', 71, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(172, '98456859-bd7e-30e3-9fa9-121c92e4fc43', 'Nakia Tromp', 'harvey.kirstin@gmail.com', '59369367', '81089378', 72, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(173, 'fb5652e7-7500-3306-9994-3d53c4eecafa', 'Kelly McKenzie', 'lyda.kuhic@hotmail.com', '15121683', '6524543', 73, 1, NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36'),
(174, 'aa0fef64-d210-3859-ae68-f74c31f998fd', 'Geovany Renner Jr.', 'goodwin.gertrude@haag.org', '2400567', '24490890', 74, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(175, 'c112953d-259f-3fd2-a273-0aad7dcab2e2', 'Wiley Koepp', 'brady77@yahoo.com', '9420665', '59581645', 75, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(176, 'e410e347-b474-31bd-bdac-74220433f9b4', 'Prof. Palma Armstrong PhD', 'peyton.heidenreich@gmail.com', '18636557', '77061089', 76, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(177, '4bde2a6f-8fec-39df-b7ac-5f1f164368b9', 'Tremayne Brekke', 'wreichel@kutch.biz', '45468004', '40458122', 77, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(178, 'f185a6e4-4022-3d4c-935b-f05021661be2', 'Tate Johnson', 'oconner.emiliano@harris.biz', '77929735', '71083695', 78, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(179, '173abe70-30ee-3cf6-ae22-3225200a531b', 'Otilia Reichel', 'dwilderman@swaniawski.com', '33784175', '45163924', 79, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(180, 'a125a555-e5ea-3540-9bca-8f12ed6c582e', 'Lawrence Steuber', 'osvaldo.king@homenick.com', '29131897', '17084550', 80, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(181, '5a95d627-6a00-3764-9de6-2c8473f6e86d', 'Prof. Marlon Okuneva DDS', 'noemy28@zulauf.org', '62826200', '38697777', 81, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(182, 'dc4385a7-b098-35ac-a99c-39898a628dba', 'Delpha Lesch', 'balistreri.marina@fay.com', '1084718', '84430684', 82, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(183, 'a2e4c245-9332-3e60-898e-32046b7c84a1', 'Makayla Prosacco', 'dkutch@hotmail.com', '88105771', '81846235', 83, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(184, '7bac9bd3-1924-3221-9f4f-5c77b83e78b8', 'Javier Mertz', 'daryl.block@roob.com', '1358012', '41632006', 84, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(185, '9ff77f5e-48d0-31fd-b913-69957bd758b2', 'Darrion Rosenbaum', 'streich.dimitri@damore.com', '82790766', '20000753', 85, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(186, '39594fcb-bf73-3db2-8f4f-518229d70340', 'Ms. Drew Nienow', 'dallin.goodwin@wilderman.com', '29532785', '17515737', 86, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(187, '5ff5d584-4ccd-3aef-a7f2-994b4fb03713', 'Danial Lemke', 'nshanahan@hotmail.com', '62255014', '92945292', 87, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(188, 'f3423462-1f64-3b78-b89f-a5ed0b7a2611', 'Mrs. Leila Schumm Sr.', 'johathan56@kirlin.com', '1542729', '47519428', 88, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(189, '8ffaa9e9-7cff-3f0f-a345-f74cddd1cfe2', 'Ava Swaniawski DDS', 'nolan.maximo@hotmail.com', '12571780', '8465642', 89, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(190, '60a96980-5e42-396e-ac7e-0a7db12bd9be', 'Mr. George Runte', 'bashirian.stefanie@wiegand.com', '49677234', '72307181', 90, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(191, 'ec67a69a-7fa6-38d8-8ce6-fd859a769805', 'Ethel Kunze', 'demond36@gmail.com', '41349560', '68615832', 91, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(192, '2ab1ef59-8801-34c9-bc66-9fca280d3e6b', 'Jeffry Krajcik', 'welch.osborne@bartell.com', '1757324', '34896748', 92, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(193, '99437f6d-d48c-3537-9e4f-7d713efd3578', 'Eleanore Reynolds', 'hamill.leora@orn.com', '19702498', '95725683', 93, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(194, '81b7353c-679a-3415-b966-65dd0968147c', 'Grayson Marks', 'macy08@adams.org', '50335543', '14714817', 94, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(195, '4011b0e4-d5b6-3a5c-97b6-1be0f0450b8b', 'Tom Jenkins', 'waelchi.keon@kulas.com', '19715387', '1852301', 95, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(196, '2ec2d13c-5a90-3836-9e82-711f25a22f1d', 'Margaretta Wilkinson', 'dario85@brekke.info', '52684860', '48967337', 96, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(197, 'd1f2144e-3187-3ced-898a-fa6dc8a533bf', 'Shaina Sauer', 'nmosciski@hartmann.com', '89268008', '62709677', 97, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(198, 'f0207189-af83-34fb-b999-38f72a1f291d', 'Jermaine Walter', 'lizzie.okuneva@schultz.biz', '62639114', '38885615', 98, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(199, 'f79dc94e-9c98-3e3c-b605-72df6a613151', 'Sophie Walker', 'kenny.klocko@ankunding.org', '55303647', '56121279', 99, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(200, '99d6f5f1-6c6a-3eff-a0d2-4a73b3cf2d6c', 'Marge Roob DVM', 'trevion42@deckow.biz', '41216391', '84875386', 100, 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(201, 'af029081-d3f3-35ea-a6d4-0147251106b5', 'Miss Elenora Wisoky II', 'cwilderman@hotmail.com', '30901912', '55588885', 101, 1, NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39'),
(202, 'd20f7f5a-590b-33e9-b69d-d969b3ea9cbd', 'Joseph Heaney', 'aaron.lowe@gmail.com', '66757951', '94623870', 102, 1, NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39'),
(203, 'd5bc9ded-4796-323a-9647-ca43b286cdf0', 'Janiya Wisoky', 'zgorczany@farrell.com', '94210958', '89107364', 103, 1, NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39'),
(204, '1caa35cd-6fe5-3637-bf77-a557b6f9d303', 'Prof. Conrad Balistreri V', 'sofia09@huel.com', '28542960', '85736028', 104, 1, NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39'),
(205, '143ec07b-d961-3cb6-9f38-779c1fedd3bc', 'Marlee Schuster DVM', 'zruecker@feest.com', '92960776', '84322545', 105, 1, NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40'),
(206, '88d93b2f-6b7b-3191-bc6c-634ca58457e1', 'Fiona Jaskolski II', 'carter.vicenta@klocko.com', '15693138', '35427690', 106, 1, NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40'),
(207, '104ebc2e-b247-3308-86a6-1c9b9b9b030b', 'Audrey Beatty II', 'runte.katlyn@predovic.biz', '63672302', '92858119', 107, 1, NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40'),
(208, '85d44072-1f73-31c3-be11-c422870a7874', 'Gloria Schmitt Jr.', 'gmurray@murphy.org', '52294319', '56605428', 108, 1, NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40'),
(209, 'c4d9982d-2357-374e-914b-b5ee7984d31f', 'Dr. Amelie Cruickshank', 'meredith.pollich@sawayn.com', '52107815', '38088312', 109, 1, NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41'),
(210, '5cdeeb13-be1e-316b-95c5-4de17fdffdc2', 'Muriel O\'Keefe', 'hfarrell@hills.com', '30530021', '69792001', 110, 1, NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41'),
(211, '3a4c02f6-f5d4-3473-a462-a35ac656d5bc', 'Prof. Waino Carroll MD', 'corkery.lizzie@gleason.com', '24875102', '97067343', 111, 1, NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41'),
(212, '879f5082-f519-314d-bb33-ebbfe3dfe567', 'Dr. Hermina Harber', 'edmond.homenick@yahoo.com', '22447242', '89724571', 112, 1, NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41'),
(213, '56700c59-c850-3c76-af34-cf7c84bf9b1a', 'Peggie Morar IV', 'titus59@yahoo.com', '5243028', '49930073', 113, 1, NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42'),
(214, '3449d53f-e08f-35d2-83b9-7ca1c4bec249', 'Mitchell Mraz II', 'uwalsh@thiel.net', '94703388', '25968250', 114, 1, NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42'),
(215, '0b32e8a1-a2db-3c23-979a-bcad1be07a9f', 'Hilma Pfannerstill', 'ulices.champlin@hotmail.com', '81799045', '44700178', 115, 1, NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42'),
(216, 'febd3358-afae-3226-afeb-626386e4c475', 'Dr. Leopold Howe I', 'ekovacek@trantow.com', '50955720', '4202818', 116, 1, NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42'),
(217, 'd30ef07a-6857-3038-bfc1-2cc3e60a5f90', 'Verla Weissnat V', 'tremaine.ebert@yahoo.com', '93997577', '55351652', 117, 1, NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43'),
(218, 'daecb258-d720-343b-9753-4984b6e6eed7', 'Cloyd Heaney', 'ychristiansen@gmail.com', '13609424', '48616514', 118, 1, NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43'),
(219, '3980264e-c1ca-3d72-ab89-607ebaed22df', 'Prof. Alisha Hartmann Sr.', 'weissnat.verona@muller.com', '12168324', '55458625', 119, 1, NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43'),
(220, '2444f3b0-fa31-3ae5-bd10-ffc118644a4f', 'Karolann Yundt', 'faustino05@nader.com', '83360786', '43063344', 120, 1, NULL, '2021-10-19 12:25:44', '2021-10-19 12:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `external_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, '9636b1c9-7301-403f-bf7e-f32b07f82ada', 'Management', NULL, '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(2, '137d5b06-2790-4955-aaa2-05840c219eb5', 'Nerds', NULL, '2021-10-19 12:25:31', '2021-10-19 12:25:31'),
(3, '0a017f30-c008-45fb-a186-ff8363b6e990', 'Genius', NULL, '2021-10-19 12:25:31', '2021-10-19 12:25:31');

-- --------------------------------------------------------

--
-- Table structure for table `department_user`
--

CREATE TABLE `department_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department_user`
--

INSERT INTO `department_user` (`id`, `department_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(13, 1, 13, NULL, NULL),
(14, 1, 14, NULL, NULL),
(15, 1, 15, NULL, NULL),
(16, 1, 16, NULL, NULL),
(17, 1, 17, NULL, NULL),
(18, 1, 18, NULL, NULL),
(19, 1, 19, NULL, NULL),
(20, 1, 20, NULL, NULL),
(21, 1, 21, NULL, NULL),
(22, 1, 22, NULL, NULL),
(23, 1, 23, NULL, NULL),
(24, 1, 24, NULL, NULL),
(25, 1, 25, NULL, NULL),
(26, 1, 26, NULL, NULL),
(27, 1, 27, NULL, NULL),
(28, 1, 28, NULL, NULL),
(29, 1, 29, NULL, NULL),
(30, 1, 30, NULL, NULL),
(31, 1, 31, NULL, NULL),
(32, 1, 32, NULL, NULL),
(33, 1, 33, NULL, NULL),
(34, 1, 34, NULL, NULL),
(35, 1, 35, NULL, NULL),
(36, 1, 36, NULL, NULL),
(37, 1, 37, NULL, NULL),
(38, 1, 38, NULL, NULL),
(39, 1, 39, NULL, NULL),
(40, 1, 40, NULL, NULL),
(41, 1, 41, NULL, NULL),
(42, 1, 42, NULL, NULL),
(43, 1, 43, NULL, NULL),
(44, 1, 44, NULL, NULL),
(45, 1, 45, NULL, NULL),
(46, 1, 46, NULL, NULL),
(47, 1, 47, NULL, NULL),
(48, 1, 48, NULL, NULL),
(49, 1, 49, NULL, NULL),
(50, 1, 50, NULL, NULL),
(51, 1, 51, NULL, NULL),
(52, 1, 52, NULL, NULL),
(53, 1, 53, NULL, NULL),
(54, 1, 54, NULL, NULL),
(55, 1, 55, NULL, NULL),
(56, 1, 56, NULL, NULL),
(57, 1, 57, NULL, NULL),
(58, 1, 58, NULL, NULL),
(59, 1, 59, NULL, NULL),
(60, 1, 60, NULL, NULL),
(61, 1, 61, NULL, NULL),
(62, 1, 62, NULL, NULL),
(63, 1, 63, NULL, NULL),
(64, 1, 64, NULL, NULL),
(65, 1, 65, NULL, NULL),
(66, 1, 66, NULL, NULL),
(67, 1, 67, NULL, NULL),
(68, 1, 68, NULL, NULL),
(69, 1, 69, NULL, NULL),
(70, 1, 70, NULL, NULL),
(71, 1, 71, NULL, NULL),
(72, 1, 72, NULL, NULL),
(73, 1, 73, NULL, NULL),
(74, 1, 74, NULL, NULL),
(75, 1, 75, NULL, NULL),
(76, 1, 76, NULL, NULL),
(77, 1, 77, NULL, NULL),
(78, 1, 78, NULL, NULL),
(79, 1, 79, NULL, NULL),
(80, 1, 80, NULL, NULL),
(81, 1, 81, NULL, NULL),
(82, 1, 82, NULL, NULL),
(83, 1, 83, NULL, NULL),
(84, 1, 84, NULL, NULL),
(85, 1, 85, NULL, NULL),
(86, 1, 86, NULL, NULL),
(87, 1, 87, NULL, NULL),
(88, 1, 88, NULL, NULL),
(89, 1, 89, NULL, NULL),
(90, 1, 90, NULL, NULL),
(91, 1, 91, NULL, NULL),
(92, 1, 92, NULL, NULL),
(93, 1, 93, NULL, NULL),
(94, 1, 94, NULL, NULL),
(95, 1, 95, NULL, NULL),
(96, 1, 96, NULL, NULL),
(97, 1, 97, NULL, NULL),
(98, 1, 98, NULL, NULL),
(99, 1, 99, NULL, NULL),
(100, 1, 100, NULL, NULL),
(101, 1, 101, NULL, NULL),
(102, 1, 102, NULL, NULL),
(103, 1, 103, NULL, NULL),
(104, 1, 104, NULL, NULL),
(105, 1, 105, NULL, NULL),
(106, 1, 106, NULL, NULL),
(107, 1, 107, NULL, NULL),
(108, 1, 108, NULL, NULL),
(109, 1, 109, NULL, NULL),
(110, 1, 110, NULL, NULL),
(111, 1, 111, NULL, NULL),
(112, 1, 112, NULL, NULL),
(113, 1, 113, NULL, NULL),
(114, 1, 114, NULL, NULL),
(115, 1, 115, NULL, NULL),
(116, 1, 116, NULL, NULL),
(117, 1, 117, NULL, NULL),
(118, 1, 118, NULL, NULL),
(119, 1, 119, NULL, NULL),
(120, 1, 120, NULL, NULL),
(121, 1, 121, NULL, NULL),
(122, 1, 122, NULL, NULL),
(123, 1, 123, NULL, NULL),
(124, 1, 124, NULL, NULL),
(125, 1, 125, NULL, NULL),
(126, 1, 126, NULL, NULL),
(127, 1, 127, NULL, NULL),
(128, 1, 128, NULL, NULL),
(129, 1, 129, NULL, NULL),
(130, 1, 130, NULL, NULL),
(131, 1, 131, NULL, NULL),
(132, 1, 132, NULL, NULL),
(133, 1, 133, NULL, NULL),
(134, 1, 134, NULL, NULL),
(135, 1, 135, NULL, NULL),
(136, 1, 136, NULL, NULL),
(137, 1, 137, NULL, NULL),
(138, 1, 138, NULL, NULL),
(139, 1, 139, NULL, NULL),
(140, 1, 140, NULL, NULL),
(141, 1, 141, NULL, NULL),
(142, 1, 142, NULL, NULL),
(143, 1, 143, NULL, NULL),
(144, 1, 144, NULL, NULL),
(145, 1, 145, NULL, NULL),
(146, 1, 146, NULL, NULL),
(147, 1, 147, NULL, NULL),
(148, 1, 148, NULL, NULL),
(149, 1, 149, NULL, NULL),
(150, 1, 150, NULL, NULL),
(151, 1, 151, NULL, NULL),
(152, 1, 152, NULL, NULL),
(153, 1, 153, NULL, NULL),
(154, 1, 154, NULL, NULL),
(155, 1, 155, NULL, NULL),
(156, 1, 156, NULL, NULL),
(157, 1, 157, NULL, NULL),
(158, 1, 158, NULL, NULL),
(159, 1, 159, NULL, NULL),
(160, 1, 160, NULL, NULL),
(161, 1, 161, NULL, NULL),
(162, 1, 162, NULL, NULL),
(163, 1, 163, NULL, NULL),
(164, 1, 164, NULL, NULL),
(165, 1, 165, NULL, NULL),
(166, 1, 166, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `integration_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `integration_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `industries`
--

CREATE TABLE `industries` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `industries`
--

INSERT INTO `industries` (`id`, `external_id`, `name`) VALUES
(1, '9ecca473-6630-4003-9193-81a7b01c0760', 'Accommodations'),
(2, '7ee724d2-7e76-440c-9cff-47bd3ba586c0', 'Accounting'),
(3, 'affd9669-e1f9-45f9-8e9e-0faadb01666d', 'Auto'),
(4, 'ae7007e2-5c33-42cb-9b89-fd4513097371', 'Beauty & Cosmetics'),
(5, '326bf0a5-1962-4492-a56e-fde714e36fee', 'Carpenter'),
(6, 'a3aa9838-ad92-4938-b787-386b6c6ca5fe', 'Communications'),
(7, '1ded2ebf-e1c3-4832-a45b-ee0720e4c6f6', 'Computer & IT'),
(8, 'f29215a2-bd02-4247-b62b-8b891fb202fe', 'Construction'),
(9, '9dcee99f-622d-4b4f-b13d-2267db8bb90c', 'Consulting'),
(10, '4d52742a-c2d9-41db-8f8e-14bd6781227c', 'Education'),
(11, '89e1d2cf-e29b-40c7-9216-02b22488a40f', 'Electronics'),
(12, '2f89bbf8-0a04-489d-bdec-663f4d2b7c19', 'Entertainment'),
(13, 'e0363787-2063-4bab-9c2c-83e84d8b3c28', 'Food & Beverages'),
(14, 'b2804bc0-c516-460a-a8e3-98ba0610b3ed', 'Legal Services'),
(15, '9938cf5e-fb63-4d50-ae53-948e3bc7ef37', 'Marketing'),
(16, '848b38fd-380b-43c1-bec7-62b78ce7ec54', 'Real Estate'),
(17, '2147dfcd-a3f9-46d5-81d6-1100fe433e1a', 'Retail'),
(18, '16fe2de2-266c-486e-a2fa-ff447f5e7610', 'Sports'),
(19, 'd81ca14d-f0eb-4527-bfb9-17d98606d3ec', 'Technology'),
(20, 'f3c514ff-b362-481b-9a93-945362d62411', 'Tourism'),
(21, '14a79cd4-fb12-4d15-8abf-a715041afacf', 'Transportation'),
(22, 'e832e6b8-c386-45aa-ad8c-7dc0943515b4', 'Travel'),
(23, '761e3e66-d63d-4a62-8343-3b4a6fd95eef', 'Utilities'),
(24, '71244178-a650-45aa-8358-c9ca2e45cab3', 'Web Services'),
(25, '80a9b3b8-b675-4b37-bf12-2240d1602699', 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `integrations`
--

CREATE TABLE `integrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_secret` int(11) DEFAULT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_number` bigint(20) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `due_at` datetime DEFAULT NULL,
  `integration_invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `integration_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `offer_id` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `external_id`, `status`, `invoice_number`, `sent_at`, `due_at`, `integration_invoice_id`, `integration_type`, `source_type`, `source_id`, `client_id`, `offer_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '569d3222-f2a2-397d-bae0-031448335860', 'draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(2, '5befa0a0-ac0b-3cf5-8617-14d0177a4bb6', 'draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37'),
(3, '74bda653-8d4a-3cfc-b108-7cb1d2153961', 'draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(4, '190c594a-0742-34ca-a347-ec5c47fd2090', 'draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(5, '420a964e-6194-31c1-bb9c-1b35fdad0134', 'draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(6, '6b324694-4727-39a2-a3d2-31ac6eca244e', 'draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(7, 'fae2c735-d06d-3e17-8777-786e0a5a333a', 'draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38'),
(8, '60437387-aef7-3501-9f2a-f6d730377903', 'draft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_lines`
--

CREATE TABLE `invoice_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `offer_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_lines`
--

INSERT INTO `invoice_lines` (`id`, `external_id`, `title`, `comment`, `price`, `invoice_id`, `offer_id`, `type`, `quantity`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '4547617a-a197-3709-ae0b-150497b7d0f9', 'nulla', '', 1279, 1, NULL, 'package', 5, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37', NULL),
(2, 'e7d5c104-6bd2-3226-8ced-f8a6de1c034f', 'quo', '', 2547, 1, NULL, 'session', 2, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37', NULL),
(3, '36a813b4-032d-3359-8041-27fa0c25b4b7', 'voluptatem', '', 2981, 1, NULL, 'package', 0, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37', NULL),
(4, 'd83c5ae9-2c8a-3a23-bb2f-92ef52e174fa', 'eum', '', 1669, 1, NULL, 'kg', 0, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37', NULL),
(5, '67c80f08-4043-3474-ac50-d87390ed9e11', 'impedit', '', 2271, 2, NULL, 'hours', 6, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37', NULL),
(6, 'abe6684d-ef9c-3f5b-ad36-fdf245b818f0', 'et', '', 782, 2, NULL, 'hours', 1, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37', NULL),
(7, '3465cb2d-e8a9-3a99-9756-ead5b76572d6', 'vel', '', 4125, 2, NULL, 'days', 6, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37', NULL),
(8, '147c4be6-bc83-3a1c-a2a5-2b8bb3a95832', 'voluptatem', '', 4543, 2, NULL, 'pieces', 3, NULL, '2021-10-19 12:25:37', '2021-10-19 12:25:37', NULL),
(9, '289b74e8-b348-3d48-bf99-0eb8b981fc5b', 'vero', '', 6809, 3, NULL, 'days', 6, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(10, 'cdbf0503-29b9-387e-b3b9-60e1c8482cda', 'eius', '', 8822, 3, NULL, 'session', 3, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(11, '2854b73c-4b70-3ca8-833b-794b3181e729', 'provident', '', 2518, 3, NULL, 'days', 2, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(12, '4be3e69c-eb29-3327-9806-4dc8381823db', 'consequatur', '', 835, 3, NULL, 'pieces', 6, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(13, '29750d44-96a8-3bc0-9bc2-8ae6c3c4fc3a', 'quam', '', 4871, 4, NULL, 'hours', 2, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(14, 'd65b1465-343f-359a-b981-e538d6855193', 'magnam', '', 3671, 4, NULL, 'days', 1, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(15, '051f90a1-44c0-34a6-b7b2-4d5e3a4b6707', 'voluptatibus', '', 218, 4, NULL, 'package', 5, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(16, 'ce6264e9-ad85-327f-a15d-78e0801f9bab', 'nisi', '', 9825, 4, NULL, 'pieces', 9, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(17, '95dc8d87-e271-36a9-b42e-11406678b7e4', 'sunt', '', 3866, 5, NULL, 'hours', 8, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(18, '3cb0cab5-7cfd-37d2-a617-b8452e8edd61', 'numquam', '', 4692, 5, NULL, 'hours', 3, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(19, 'f9006366-41a2-35d5-adea-ed35c5321bd4', 'voluptate', '', 947, 5, NULL, 'kg', 4, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(20, 'df949ac1-6899-3610-8f6b-3089fb8e5d57', 'eos', '', 1030, 5, NULL, 'package', 7, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(21, '8007e472-2de3-30d5-b515-01237416ed11', 'dolorum', '', 3023, 6, NULL, 'package', 8, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(22, 'bebade21-2951-3201-960c-91143a16171a', 'voluptas', '', 7338, 6, NULL, 'package', 6, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(23, 'c63ceba7-5499-3f2e-ac0a-5f5c71cb1e6f', 'aut', '', 9441, 6, NULL, 'days', 3, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(24, 'a829d402-c80b-37ce-a824-b0a03a4aa8d5', 'aliquam', '', 1177, 6, NULL, 'session', 8, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(25, 'b03ab0e5-8814-3ae2-978d-3352ef7cc5ce', 'molestiae', '', 2094, 7, NULL, 'package', 5, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(26, '4ab4a04d-f1be-304f-bc9f-d5c2da798176', 'beatae', '', 7506, 7, NULL, 'pieces', 5, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(27, '2689e68a-7cd6-3316-8fe5-395b3af7dfd9', 'occaecati', '', 6260, 7, NULL, 'days', 9, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(28, 'c74eca72-6490-3afe-848d-447108713a01', 'iste', '', 9909, 7, NULL, 'hours', 7, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(29, 'a128c81b-1f83-3e40-a632-c535a051eb22', 'sint', '', 6289, 8, NULL, 'pieces', 0, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(30, '5ceb9441-d1be-33a1-b71b-c342790fd7a3', 'illo', '', 7145, 8, NULL, 'hours', 0, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(31, 'd0f4e628-e8c8-3bad-889b-7a0a2dd07841', 'beatae', '', 4953, 8, NULL, 'kg', 2, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL),
(32, 'd1ba50b9-bf93-3306-b17a-393f060afb55', 'molestiae', '', 5870, 8, NULL, 'days', 8, NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `user_assigned_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `user_created_id` int(10) UNSIGNED NOT NULL,
  `qualified` tinyint(1) NOT NULL DEFAULT 0,
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deadline` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `external_id`, `title`, `description`, `status_id`, `user_assigned_id`, `client_id`, `user_created_id`, `qualified`, `result`, `deadline`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '42b07813-7c53-3042-85e6-c44cf60188b7', 'Aperiam voluptas placeat dolor non nihil maxime beatae veniam.', 'Consequatur voluptas nobis ut. Sit rerum repellat laboriosam fugit. Sed facilis repellat corporis reiciendis alias voluptas.', 5, 108, 101, 107, 0, NULL, '2021-09-14 09:22:54', NULL, '2021-02-22 00:37:17', '2021-08-05 11:29:59'),
(2, 'f4c0727b-ed74-3736-8e9f-ca782dd6245e', 'Dolorem ut suscipit illum cumque delectus aut minima non.', 'Cumque labore sed id. Sequi ullam accusamus error. Officia quos nostrum qui sed sapiente dolores est.', 7, 111, 102, 110, 0, NULL, '2021-05-23 03:58:18', NULL, '2020-12-12 06:31:42', '2021-06-19 01:15:30'),
(3, 'b525f2a6-1ac5-3898-8a60-04e4b828f77f', 'Et doloremque veritatis velit est ipsam.', 'Cumque nemo minus vel tempora placeat. Nulla nostrum id optio. Omnis tempore earum est suscipit. Sint est quis vero distinctio perspiciatis magni odit.', 5, 114, 103, 113, 0, NULL, '2021-03-13 05:06:18', NULL, '2021-07-08 03:23:18', '2021-08-15 12:00:13'),
(4, 'd6b67441-846d-34df-af14-3e2841d5bf1a', 'Sint rerum exercitationem est omnis accusantium.', 'Nemo officiis dolores commodi eum commodi sunt. Excepturi maiores cupiditate doloribus quisquam. Quam delectus cumque commodi repudiandae ad et quisquam. Sed enim voluptas assumenda labore iure consequatur aut.', 6, 117, 104, 116, 0, NULL, '2020-10-24 02:09:06', NULL, '2021-02-22 19:52:45', '2021-05-04 12:19:22'),
(5, '078b9b35-d4d8-338b-a640-977685f7416c', 'Deserunt tempora cum sint quasi sequi quia cupiditate animi.', 'Hic perferendis non ea distinctio vero incidunt numquam voluptas. Numquam repudiandae earum numquam ipsam. Numquam ex voluptas omnis eligendi inventore perferendis dolorum.', 7, 120, 105, 119, 0, NULL, '2020-11-10 10:58:57', NULL, '2021-04-24 16:08:43', '2021-04-02 11:44:37'),
(6, '6869bfca-5580-34cf-ae61-60b06c5a4aa6', 'Tempore aperiam fuga provident unde.', 'Quia saepe tempora aliquam ut et atque dolor consequatur. Quis qui minima accusamus exercitationem vitae inventore. Inventore consequatur sint quae qui eaque. Repellat commodi neque in. Voluptate nisi sequi aut exercitationem deleniti vel.', 6, 123, 106, 122, 0, NULL, '2021-07-31 06:58:15', NULL, '2021-06-18 07:42:17', '2021-09-07 00:53:20'),
(7, '32a6494d-6453-3305-bc1c-2a7532e14c38', 'Qui recusandae asperiores ipsam reprehenderit rem.', 'Odit earum tenetur libero eligendi ex culpa non. Qui sapiente cumque sint sunt tempore ut itaque sed. Labore doloribus repellat nemo maiores.', 5, 126, 107, 125, 0, NULL, '2021-07-02 01:08:53', NULL, '2021-01-21 15:37:52', '2020-12-25 04:32:42'),
(8, '7ed86293-d0dd-331a-a01f-cdee3f9c407d', 'Beatae fugiat quo delectus aliquam.', 'Illo porro est hic sit est. Est culpa repellendus voluptatem vero reiciendis quis. Illum neque corporis eaque blanditiis nemo incidunt.', 6, 129, 108, 128, 0, NULL, '2021-01-04 03:53:37', NULL, '2021-06-10 08:02:50', '2021-04-18 18:13:52'),
(9, '45c6e5bb-5a60-37a7-ba5e-d53481372f95', 'Eius aut ut eos dolor et id veniam.', 'Nihil quaerat totam nemo aut optio repellat. Quis nam debitis qui est.', 7, 132, 109, 131, 0, NULL, '2021-10-12 06:26:54', NULL, '2020-11-03 22:20:43', '2020-10-29 06:43:42'),
(10, 'd67a6310-d5ec-3ff6-96c3-ab9b72c5b8b4', 'Aut possimus veritatis aut ut earum et.', 'Asperiores fuga et architecto est odit ut at. Et aperiam nihil nostrum optio nesciunt dolorem aut. Beatae ullam asperiores est quos autem.', 5, 135, 110, 134, 0, NULL, '2020-11-25 17:20:48', NULL, '2021-04-26 17:24:46', '2021-06-17 14:26:12'),
(11, '3dc4fca8-64ba-3098-8def-a250dc1e4c2a', 'Atque eveniet inventore beatae.', 'Ut qui veniam aut itaque adipisci beatae. Autem ipsa cupiditate commodi dolores enim cupiditate. Rerum accusantium pariatur expedita quia. Ut totam sit et omnis itaque accusantium. Rerum rerum iusto assumenda unde ullam dolorum.', 6, 138, 111, 137, 0, NULL, '2021-08-02 03:34:28', NULL, '2021-10-09 19:49:19', '2021-05-27 22:24:00'),
(12, 'be2d7952-923e-3c9b-aa74-f7e96e918693', 'Voluptate saepe deserunt quas eaque.', 'Facilis quas veritatis perferendis. Dolore occaecati consectetur quo temporibus tempore repudiandae. Qui dicta vitae et illo et odit. Et nostrum voluptas dolore nam et est laboriosam aut.', 6, 141, 112, 140, 0, NULL, '2020-12-21 09:27:49', NULL, '2021-07-29 16:11:14', '2021-08-02 17:54:19'),
(13, '1a56ba9a-15cc-3ddd-bb22-9f3fdc6ef42d', 'Non ut voluptatum est omnis ut omnis vitae reiciendis.', 'Est iste praesentium amet. Molestiae cupiditate dignissimos aliquid veniam dolores. Quisquam eum voluptas atque at maiores. Vitae quis rem ea quisquam.', 5, 144, 113, 143, 0, NULL, '2021-09-17 09:01:46', NULL, '2021-02-10 16:52:25', '2021-09-23 07:03:17'),
(14, '9aadd689-37d8-319d-bbd1-5919701fcfe2', 'Sint mollitia sequi impedit voluptatem dignissimos perspiciatis qui.', 'Explicabo earum eaque illo. Voluptatem nostrum sunt veniam tempora necessitatibus nisi est vitae. Aut eos aliquid alias explicabo dignissimos.', 7, 147, 114, 146, 0, NULL, '2021-08-30 04:42:15', NULL, '2021-05-17 09:10:20', '2021-09-21 13:56:39'),
(15, 'bd436d9e-b5f0-3117-ab3c-9dc0ee6fad9c', 'Ab et aliquid recusandae sunt debitis.', 'Consequatur accusamus doloremque unde cum. Vel beatae doloremque aspernatur. Necessitatibus sint inventore repellendus doloribus. Quis recusandae ut numquam laudantium veritatis.', 6, 150, 115, 149, 0, NULL, '2021-03-07 14:13:28', NULL, '2021-08-04 06:34:35', '2021-02-05 18:06:45'),
(16, '76883f16-5cd7-33b5-8b50-5928113a2ece', 'Sapiente id reprehenderit eum et.', 'Quos consequuntur dolor iste iusto in aut dicta. Iusto expedita totam et numquam aut beatae. Blanditiis ut molestiae quae quod inventore in.', 7, 153, 116, 152, 0, NULL, '2021-03-08 01:33:11', NULL, '2021-03-27 05:00:27', '2021-03-11 17:32:43'),
(17, '66e7de0b-617e-34a4-9427-6c0719e12763', 'Nobis deleniti tenetur enim alias eaque laboriosam eos adipisci.', 'Reprehenderit sed voluptatum rerum consectetur nulla modi. Aut ratione velit delectus aut voluptatem perspiciatis. Repellendus saepe quaerat dolor voluptatem.', 5, 156, 117, 155, 0, NULL, '2020-10-22 22:11:25', NULL, '2020-11-16 04:29:07', '2021-06-06 11:56:33'),
(18, '6eb14d21-8f97-3305-b80c-f9e9d33bbca2', 'Adipisci vel corrupti expedita quo.', 'Consequatur fugit iure accusamus. Modi rem aut doloribus saepe. Perferendis nemo voluptatem iure illo. Totam deserunt rerum qui et doloribus excepturi recusandae.', 8, 159, 118, 158, 0, NULL, '2021-01-02 16:09:45', NULL, '2020-11-06 15:33:25', '2021-05-08 12:03:09'),
(19, '10c4dc64-fed9-3504-9e68-41626fae3193', 'Quia voluptatum iusto vitae dignissimos repudiandae qui laudantium.', 'Maiores sed adipisci et aperiam. Non ipsum ratione optio laborum voluptas perspiciatis iure. Et nihil ea aut ipsa soluta hic. Vel consequatur optio quis non accusamus.', 5, 162, 119, 161, 0, NULL, '2020-12-30 21:23:04', NULL, '2021-06-20 16:38:50', '2021-06-25 20:50:24'),
(20, 'b0f1760e-87e3-3e88-aaeb-051b61bdb8e2', 'Iste aspernatur vel omnis rem modi quod quisquam.', 'Non et nobis corporis a. Molestias iusto id placeat officia. Vero aut atque accusantium. Earum est officiis eos aut.', 5, 165, 120, 164, 0, NULL, '2021-06-16 00:59:53', NULL, '2020-11-30 22:00:11', '2021-01-26 21:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `mails`
--

CREATE TABLE `mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `send_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_06_04_124835_create_industries_table', 1),
(4, '2015_10_15_143830_create_status_table', 1),
(5, '2015_12_28_163028_create_clients_table', 1),
(6, '2015_12_29_154026_create_invocies_table', 1),
(7, '2015_12_29_204031_projects_table', 1),
(8, '2015_12_29_204031_tasks_table', 1),
(9, '2016_01_10_204413_create_comments_table', 1),
(10, '2016_01_18_113656_create_leads_table', 1),
(11, '2016_01_23_144854_settings', 1),
(12, '2016_01_26_003903_documents', 1),
(13, '2016_01_31_211926_invoice_lines_table', 1),
(14, '2016_03_21_171847_create_department_table', 1),
(15, '2016_03_21_172416_create_department_user_table', 1),
(16, '2016_04_06_230504_integrations', 1),
(17, '2016_05_21_205532_create_activities_table', 1),
(18, '2016_08_26_205017_entrust_setup_tables', 1),
(19, '2016_11_04_200855_create_notifications_table', 1),
(20, '2017_10_28_131549_create_contacts_table', 1),
(21, '2019_05_03_000001_create_customer_columns', 1),
(22, '2019_05_03_000002_create_subscriptions_table', 1),
(23, '2019_11_29_092917_add_vat_and_currency', 1),
(24, '2019_11_29_111929_add_invoice_number_to_invoice', 1),
(25, '2019_12_09_201950_create_mails_table', 1),
(26, '2019_12_19_200049_add_billing_integration_id_to_invoices', 1),
(27, '2020_01_06_203615_create_payments_table', 1),
(28, '2020_01_10_120239_create_credit_notes_table', 1),
(29, '2020_01_10_121248_create_credit_lines_table', 1),
(30, '2020_01_28_195156_add_language_options', 1),
(31, '2020_02_20_192015_alter_leads_table_support_qualified', 1),
(32, '2020_03_30_163030_create_appointments_table', 1),
(33, '2020_04_06_075838_create_business_hours_table', 1),
(34, '2020_04_08_070242_create_absences_table', 1),
(35, '2020_05_09_113503_add_cascading_for_tables', 1),
(36, '2020_09_29_173256_add_soft_delete_to_tables', 1),
(37, '2021_01_09_102659_add_cascading_for_appointments', 1),
(38, '2021_02_10_153102_create_offers_table', 1),
(39, '2021_02_11_161257_alter_invoices_table_add_source', 1),
(40, '2021_02_11_162602_create_products_table', 1),
(41, '2021_03_02_132033_alter_comments_table_add_long_text', 1),
(42, '2021_04_15_073908_remove_qualified_from_leads', 1),
(43, '2021_09_03_173836_update_clients_table', 1),
(44, '2021_09_06_115814_create_client_visits_table', 1),
(45, '2021_09_08_155304_update_migration_for_users_table', 1),
(46, '2021_09_09_164832_create_user_documents_table', 1),
(47, '2021_09_19_221713_create_sample_data_table', 1),
(48, '2021_09_20_152953_update_projects_table', 1),
(49, '2021_10_03_115934_update_activities_table', 1),
(50, '2021_10_04_151655_update_products_table', 1),
(51, '2021_10_12_191625_create_stock_ins_table', 1),
(52, '2021_10_19_222152_create_stock_outs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `integration_payment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `integration_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grouping` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `external_id`, `name`, `display_name`, `description`, `grouping`, `created_at`, `updated_at`) VALUES
(1, '', 'payment-create', 'Add payment', 'Be able to add a new payment on a invoice', 'payment', '2021-10-19 12:25:19', '2021-10-19 12:25:19'),
(2, '', 'payment-delete', 'Delete payment', 'Be able to delete a payment', 'payment', '2021-10-19 12:25:19', '2021-10-19 12:25:19'),
(3, '', 'calendar-view', 'View calendar', 'Be able to view the calendar for appointments', 'appointment', '2021-10-19 12:25:20', '2021-10-19 12:25:20'),
(4, '', 'appointment-create', 'Add appointment', 'Be able to create a new appointment for a user', 'appointment', '2021-10-19 12:25:20', '2021-10-19 12:25:20'),
(5, '', 'appointment-edit', 'Edit appointment', 'Be able to edit appointment such as times and title', 'appointment', '2021-10-19 12:25:20', '2021-10-19 12:25:20'),
(6, '', 'appointment-delete', 'Delete appointment', 'Be able to delete an appointment', 'appointment', '2021-10-19 12:25:20', '2021-10-19 12:25:20'),
(7, '', 'absence-manage', 'Manage absences', 'Be able to manage absences for all users', 'hr', '2021-10-19 12:25:20', '2021-10-19 12:25:20'),
(8, '', 'absence-view', 'View absences', 'Be able to view absences for all users and see who is absent today on the dashboard', 'hr', '2021-10-19 12:25:20', '2021-10-19 12:25:20'),
(9, '', 'offer-create', 'Add offer', 'Be able to create an offer', 'offer', '2021-10-19 12:25:21', '2021-10-19 12:25:21'),
(10, '', 'offer-edit', 'Edit offer', 'Be able to edit an offer', 'offer', '2021-10-19 12:25:21', '2021-10-19 12:25:21'),
(11, '', 'offer-delete', 'Delete offer', 'Be able to delete an offer', 'offer', '2021-10-19 12:25:21', '2021-10-19 12:25:21'),
(12, '', 'product-create', 'Add product', 'Be able to create an product', 'product', '2021-10-19 12:25:22', '2021-10-19 12:25:22'),
(13, '', 'product-edit', 'Edit product', 'Be able to edit an product', 'product', '2021-10-19 12:25:22', '2021-10-19 12:25:22'),
(14, '', 'product-delete', 'Delete product', 'Be able to delete an product', 'product', '2021-10-19 12:25:22', '2021-10-19 12:25:22'),
(15, '', 'stockIn-create', 'Add stock-In', 'Be able to create stock-In', 'stockIn', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(16, '', 'stockIn-edit', 'Edit stock-In', 'Be able to edit Stock-In', 'stockIn', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(17, '', 'stockIn-delete', 'Delete Stock-In', 'Be able to delete Stock-In', 'stockIn', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(18, '', 'user-create', 'Create user', 'Be able to create a new user', 'user', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(19, '', 'user-update', 'Update user', 'Be able to update a user\'s information', 'user', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(20, '', 'user-delete', 'Delete user', 'Be able to delete a user', 'user', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(21, '', 'client-create', 'Create client', 'Permission to create client', 'client', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(22, '', 'client-update', 'Update client', 'Permission to update client', 'client', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(23, '', 'client-delete', 'Delete client', 'Permission to delete client', 'client', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(24, '', 'document-delete', 'Delete document', 'Permission to delete a document associated with a client', 'document', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(25, '', 'document-upload', 'Upload document', 'Be able to upload a document associated with a client', 'document', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(26, '', 'task-create', 'Create task', 'Permission to create task', 'task', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(27, '', 'task-update-status', 'Update task status', 'Permission to update task status', 'task', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(28, '', 'task-update-deadline', 'Change task deadline', 'Permission to update a tasks deadline', 'task', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(29, '', 'can-assign-new-user-to-task', 'Change assigned user', 'Permission to change the assigned user on a task', 'task', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(30, '', 'task-update-linked-project', 'Changed linked project', 'Be able to change the project which is linked to a task', 'task', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(31, '', 'task-upload-files', 'Upload files to task', 'Allowed to upload files for a task', 'task', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(32, '', 'modify-invoice-lines', 'Modify invoice lines on a invoice / task', 'Permission to create and update invoice lines on task, and invoices', 'invoice', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(33, '', 'invoice-see', 'See invoices and it\'s invoice lines', 'Permission to see invoices on customer, and it\'s associated task', 'invoice', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(34, '', 'invoice-send', 'Send invoices to clients', 'Be able to set an invoice as send to an customer (Or Send it if billing integration is active)', 'invoice', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(35, '', 'invoice-pay', 'Set an invoice as paid', 'Be able to set an invoice as paid or not paid', 'invoice', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(36, '', 'lead-create', 'Create lead', 'Permission to create lead', 'lead', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(37, '', 'lead-update-status', 'Update lead status', 'Permission to update lead status', 'lead', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(38, '', 'lead-update-deadline', 'Change lead deadline', 'Permission to update a lead deadline', 'lead', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(39, '', 'can-assign-new-user-to-lead', 'Change assigned user', 'Permission to change the assigned user on a lead', 'lead', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(40, '', 'project-create', 'Create project', 'Permission to create project', 'project', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(41, '', 'project-update-status', 'Update project status', 'Permission to update project status', 'project', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(42, '', 'project-update-deadline', 'Change project deadline', 'Permission to update a projects deadline', 'project', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(43, '', 'can-assign-new-user-to-project', 'Change assigned user', 'Permission to change the assigned user on a project', 'project', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(44, '', 'project-upload-files', 'Upload files to project', 'Allowed to upload files for a project', 'project', '2021-10-19 12:25:24', '2021-10-19 12:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `archived` tinyint(1) NOT NULL,
  `integration_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `integration_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joint_width` int(11) DEFAULT NULL,
  `visible_surface` int(11) DEFAULT NULL,
  `profile_height` int(11) DEFAULT NULL,
  `total_width` int(11) DEFAULT NULL,
  `surface` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `movement_capacity` int(11) DEFAULT NULL,
  `load_capacity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `external_id`, `description`, `number`, `default_type`, `archived`, `integration_type`, `integration_id`, `price`, `deleted_at`, `created_at`, `updated_at`, `joint_width`, `visible_surface`, `profile_height`, `total_width`, `surface`, `movement_capacity`, `load_capacity`) VALUES
(2, 'zzzzzz', 'aecceb3e-5cd0-4b8f-852f-ace528b1c933', 'ddfgdf gdfg df', '34', 'meters', 0, NULL, NULL, 500, NULL, '2021-10-20 19:00:24', '2021-10-20 19:00:24', 34, 45, 34, 34, '34', 34, '45');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `user_assigned_id` int(10) UNSIGNED NOT NULL,
  `user_created_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `deadline` date NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `qoutation_status` int(11) DEFAULT NULL,
  `invoice_status` int(11) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qoutation_date` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qoutation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `external_id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, '26731082-afbc-4885-82d3-9cdf574f3208', 'owner', 'Owner', 'Owner', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(2, 'acc7dcc2-9ba0-4943-9d3e-59ec7753d8a4', 'administrator', 'Administrator', 'System Administrator', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(3, 'c4075ddc-e7f5-497e-8ded-85107e577b08', 'manager', 'Manager', 'System Manager', '2021-10-19 12:25:24', '2021-10-19 12:25:24'),
(4, '764619ff-1d20-45fd-af9f-6a5b7e3796f7', 'employee', 'Employee', 'Employee', '2021-10-19 12:25:24', '2021-10-19 12:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sample_data`
--

CREATE TABLE `sample_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_person` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `status_id` int(11) NOT NULL,
  `sample` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_number` int(11) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `vat` smallint(6) NOT NULL DEFAULT 725,
  `max_users` int(11) NOT NULL,
  `language` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EN',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `client_number`, `invoice_number`, `country`, `company`, `currency`, `vat`, `max_users`, `language`, `created_at`, `updated_at`) VALUES
(1, 10000, 10000, 'en', 'Media', 'USD', 725, 10, 'EN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `external_id`, `title`, `source_type`, `color`, `created_at`, `updated_at`) VALUES
(1, '2a6837e7-1e93-4170-bd6d-f4dbf4de1ddc', 'Open', 'App\\Models\\Task', '#2FA599', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(2, '056570c1-5932-477c-94d9-7576ada2cf5d', 'In-progress', 'App\\Models\\Task', '#2FA55E', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(3, 'c603eb42-aa5e-41ea-bc63-3382faa06bf4', 'Pending', 'App\\Models\\Task', '#EFAC57', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(4, '8c989ca8-c284-42a7-9764-d1c61d579cfa', 'Waiting client', 'App\\Models\\Task', '#60C0DC', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(5, '2336c89e-ae09-4aaf-a363-7e48c9d9d064', 'Blocked', 'App\\Models\\Task', '#E6733E', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(6, '117388f2-e037-4e5a-a519-f32bc510d174', 'Closed', 'App\\Models\\Task', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(7, 'a69837de-8660-4ab1-bf3f-8700495c4726', 'Open', 'App\\Models\\Lead', '#2FA599', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(8, 'ccdf88ed-cbc5-4b20-9ecc-9e95d5d94a41', 'Pending', 'App\\Models\\Lead', '#EFAC57', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(9, '61dab4ba-bcef-4f68-8762-850d4b3c321a', 'Waiting client', 'App\\Models\\Lead', '#60C0DC', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(10, '77913df4-b5b6-41d7-9a5b-9389ddb04515', 'Closed', 'App\\Models\\Lead', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(11, '251789c7-c90d-4b6e-aae0-f2d442639fe9', 'Open', 'App\\Models\\Project', '#2FA599', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(12, '41b6266e-6688-4f28-8e6f-8e0994dca95a', 'In-progress', 'App\\Models\\Project', '#3CA3BA', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(13, 'a7d213f6-f637-4a23-aaec-1a83f77bcc73', 'Blocked', 'App\\Models\\Project', '#60C0DC', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(14, 'cf6ab13c-efd4-487d-b0ba-812766080fc6', 'Cancelled', 'App\\Models\\Project', '#821414', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(15, 'fa77d190-8db6-499a-9d71-d45c067c601e', 'Completed', 'App\\Models\\Project', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(16, '13264ac6-b345-402a-a7ef-330990ffa4fc', 'Approved', 'Invoice', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(17, 'c798ce6f-f132-429b-a3cd-c72ac6f2c968', 'Not Approved', 'Invoice', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(18, 'b3d8d172-63a7-44ee-9f8c-a7187bffda82', 'Hold', 'Invoice', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(19, '197c55ae-fdc7-4165-add1-0fb04282f482', 'All', 'Invoice', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(20, 'ab60d47d-0ffc-4848-bae4-c28c5b48c404', 'All', 'User', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(21, '6264a0e1-1d31-47db-a05a-f4e69e9001a3', 'Active', 'User', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(22, '3acbd6df-beeb-4824-9d26-60c701af2936', 'In-active', 'User', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(23, 'c52b5842-c78a-4986-91e3-41a174ca845f', 'Received', 'SampleData', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(24, '4ecfa530-071d-4c94-8920-6f46e2d1d379', 'Not Received', 'SampleData', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23'),
(25, '2e936bc8-9ed8-4197-8129-edc0db2c3766', 'All', 'SampleData', '#D75453', '2021-10-19 12:25:23', '2021-10-19 12:25:23');

-- --------------------------------------------------------

--
-- Table structure for table `stock_ins`
--

CREATE TABLE `stock_ins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `received_date` date DEFAULT NULL,
  `received_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `received_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stock_ins`
--

INSERT INTO `stock_ins` (`id`, `product_id`, `external_id`, `description`, `quantity`, `price`, `received_date`, `received_from`, `received_by`, `created_at`, `updated_at`) VALUES
(1, '0', 'asdjashdjkaksjdhjka', 'gggggggggggggg', 0, 0, '0000-00-00', 'sdfgsdfgsdfgsdfgsdfgsdfg', 1, '2021-10-19 14:12:24', '2021-10-19 14:12:24'),
(2, 'd45e5b4f-396b-44da-a109-f923cf63fa35', '658d07ac-6716-497e-8cd3-a642e7691adf', 'zzzzzzzzzz', 34, 343, NULL, 'asdasd', 1, '2021-10-19 14:58:24', '2021-10-19 14:58:24'),
(3, 'd45e5b4f-396b-44da-a109-f923cf63fa35', 'b953027d-afc5-4938-8391-6e2b22d9861b', 'vvvvvvvvvvv', 34, 343, NULL, 'asdasd', 1, '2021-10-19 15:02:10', '2021-10-19 15:02:10'),
(4, 'd45e5b4f-396b-44da-a109-f923cf63fa35', '1c8b53f0-8339-4146-b74b-c38896c5f48f', 'asdasd', 23, 23, NULL, 'terterte', 1, '2021-10-19 15:26:10', '2021-10-19 15:26:10'),
(5, 'aecceb3e-5cd0-4b8f-852f-ace528b1c933', 'ec80710b-7b1e-46e9-981b-a4b82209f966', 'asfdafd', 23, 23, NULL, 'terterte', 1, '2021-10-21 12:42:09', '2021-10-21 12:42:09'),
(6, 'aecceb3e-5cd0-4b8f-852f-ace528b1c933', '0737b1ad-25ca-444a-a9ac-1d44594a8b75', 'asfdafd', 23, 23, NULL, 'terterte', 1, '2021-10-21 12:45:29', '2021-10-21 12:45:29'),
(7, 'aecceb3e-5cd0-4b8f-852f-ace528b1c933', '1c16fa18-daff-45a4-a3cb-0c2cd792b230', 'asdasdasds', 34, 500, NULL, 'asdasd', 1, '2021-10-21 12:46:01', '2021-10-21 12:46:01'),
(8, 'aecceb3e-5cd0-4b8f-852f-ace528b1c933', 'b83b6468-4d84-446d-baef-7a804ad52ed9', 'sdsdsd', 34, 34, NULL, '34', 1, '2021-10-21 12:48:25', '2021-10-21 12:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `stock_outs`
--

CREATE TABLE `stock_outs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `received_date` date DEFAULT NULL,
  `stockout_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_plan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `user_assigned_id` int(10) UNSIGNED NOT NULL,
  `user_created_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `deadline` date NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `external_id`, `title`, `description`, `status_id`, `user_assigned_id`, `user_created_id`, `client_id`, `project_id`, `deadline`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '29ad2f76-b65c-389a-8ae3-689f0f35ea9f', 'Voluptatem illum voluptatem quaerat est.', 'Eos doloremque non tempora omnis ratione doloribus reiciendis. Placeat ullam in dignissimos et eos voluptas. Saepe ab blanditiis qui. Qui qui non non.', 2, 24, 5, 65, NULL, '2021-08-21', NULL, '2021-02-23 00:11:26', '2020-10-27 18:47:56'),
(2, 'bece6f7b-4b17-32b4-a088-5a5c5291cb13', 'Adipisci et eum exercitationem fugit atque reprehenderit.', 'Consequatur consequuntur et adipisci harum. Qui et consequatur omnis possimus sed eligendi sint. Incidunt deleniti ipsam optio ut ab rerum. Adipisci sit eos veritatis eos tenetur tempore beatae. Quis nobis numquam et consectetur corrupti officiis perferendis.', 4, 24, 5, 65, NULL, '2021-04-04', NULL, '2021-10-02 04:58:11', '2021-03-05 19:39:06'),
(3, '196a7a05-4745-3f60-8016-70e961dca11e', 'Dolor quis omnis magni harum.', 'Voluptas unde aspernatur quia voluptas enim. Earum nobis maiores debitis similique iure. Corrupti consequuntur eos laudantium.', 1, 24, 5, 65, NULL, '2020-11-04', NULL, '2021-04-23 07:16:52', '2021-07-28 18:50:37'),
(4, 'ff251a27-006a-372e-96f8-4d1aaa75d44b', 'Corrupti omnis consequatur sunt quis corrupti cum omnis.', 'Sunt aut doloribus natus dolores. Ipsum dolorem voluptatibus in. Laudantium nesciunt eum ipsa provident porro nulla dolor recusandae.', 4, 24, 5, 65, NULL, '2021-03-25', NULL, '2021-05-20 08:40:06', '2021-04-22 17:28:38'),
(5, '113f2dfb-c860-31ab-8714-d3fc6bee4518', 'Quod numquam nam libero repudiandae.', 'Consequatur et error nam quis et. Non earum hic occaecati aut doloremque enim et.', 1, 24, 5, 65, NULL, '2021-07-14', NULL, '2021-08-24 00:02:24', '2020-12-20 01:21:17'),
(6, '936bddb9-60a1-3cf2-8bd4-a6f0f56daa9a', 'Facilis hic voluptatem sit sed reiciendis.', 'Enim rerum molestiae sit. Doloribus suscipit ut maxime cumque sit eos. Nesciunt tenetur fugiat est veniam et accusantium vel.', 3, 24, 5, 65, NULL, '2021-08-09', NULL, '2021-01-06 16:11:42', '2020-12-06 12:00:08'),
(7, '0a4f0d3c-d649-3d32-9adf-8080cc5f203f', 'Quia est quisquam fuga suscipit.', 'Placeat odit sit itaque quis facilis a nostrum. Delectus veritatis doloribus assumenda placeat. Ea tempore ut corporis ut. Vel ex cum quia tempora.', 1, 24, 5, 65, NULL, '2021-01-31', NULL, '2021-08-31 04:26:35', '2021-03-12 15:01:35'),
(8, '62f44b26-6e86-3c55-8cc7-d63f7e4121ec', 'Quaerat incidunt assumenda minus itaque.', 'Repellendus commodi nihil natus qui occaecati quae temporibus. Dolores eius fugit corrupti a id veniam dolores. Magnam corrupti consectetur esse.', 4, 24, 5, 65, NULL, '2021-08-17', NULL, '2021-09-11 01:37:07', '2020-11-24 15:42:20'),
(9, '12e18ca7-dfd5-3820-a275-e692be2917df', 'Mollitia aliquid vel velit explicabo ullam deserunt iure.', 'Cupiditate quidem ullam ad ea saepe quos. Molestiae libero tempora et. Id aliquid iusto atque.', 1, 24, 5, 65, NULL, '2020-12-25', NULL, '2021-01-19 23:59:52', '2020-10-31 11:53:43'),
(10, '6f71931a-80f6-33cf-aa66-2f9b1242463e', 'Sunt non quas cum qui commodi eos.', 'Nam aut aut iure odit praesentium iste. Possimus odit quis possimus earum blanditiis. Et repellat totam quas expedita numquam ipsa perferendis. Quod eum rerum dolor laborum est id.', 1, 24, 5, 65, NULL, '2021-09-13', NULL, '2021-02-19 18:13:46', '2021-01-27 20:15:48'),
(11, '695fa904-896c-3b7b-aa39-2e96eea332ca', 'Voluptatem alias commodi exercitationem tempore itaque dignissimos exercitationem.', 'Blanditiis assumenda voluptates expedita quia natus quia consequatur et. Voluptatem sed consequatur ut iusto incidunt. Rem quasi assumenda aut qui sit at. Est unde ipsa non totam itaque ut.', 1, 24, 5, 65, NULL, '2021-07-23', NULL, '2021-06-11 01:57:58', '2020-11-15 23:13:58'),
(12, '93236609-87a4-39fc-80b7-c945d542827e', 'Commodi labore distinctio maxime unde quia.', 'Quae ea numquam nulla aliquid sit doloremque sit. Asperiores nulla pariatur quas soluta alias dignissimos quam. Officiis explicabo deleniti et animi in. Aliquam omnis exercitationem illum aut maiores quibusdam tempora atque.', 4, 24, 5, 65, NULL, '2021-05-19', NULL, '2020-12-07 05:06:23', '2021-08-07 18:20:12'),
(13, '5c47ab7f-32b9-39b7-bc29-c27093b41a23', 'Numquam rerum modi nisi fuga.', 'Pariatur accusamus delectus nobis voluptatem necessitatibus sint. Tenetur est neque qui reiciendis magnam. Occaecati repellendus veniam repellat impedit similique amet tempora vel. Rerum mollitia voluptatem sapiente sint et. Et sit molestiae ullam sit ea harum maxime.', 4, 24, 5, 65, NULL, '2021-08-04', NULL, '2021-09-18 21:12:26', '2021-06-17 05:11:03'),
(14, '9a896d0b-4bb7-3e13-b815-f953d1559dec', 'Excepturi facilis quaerat sed accusamus.', 'Sint qui mollitia nobis ut ex numquam. Sit dolorem nemo ut repellat eveniet nihil molestiae voluptatem. Explicabo voluptatum porro iure quia. Quidem excepturi sapiente dolor harum nesciunt esse rerum aspernatur.', 2, 24, 5, 65, NULL, '2020-11-21', NULL, '2021-08-15 14:03:57', '2021-03-07 07:20:11'),
(15, '9d007200-2fbf-3055-8bb7-4d204b068ecf', 'Iure consectetur corrupti error.', 'Sint quisquam non iure est autem. Voluptas tempora qui repellendus a. Voluptate iure quam quia fugit consectetur aliquid.', 2, 24, 5, 65, NULL, '2021-06-20', NULL, '2021-08-02 04:01:26', '2021-05-07 11:14:53'),
(16, 'b7d535da-8877-3483-a803-78758b5f3d55', 'Laudantium repellat et rerum magni excepturi.', 'Quas explicabo sit tenetur mollitia vel quo. Facere ea ut ut itaque eum est rem rerum. Incidunt neque et quae corrupti in. Labore nulla eum est beatae aut nesciunt ipsam iusto.', 4, 24, 5, 65, NULL, '2020-10-25', NULL, '2020-12-06 18:14:38', '2021-08-27 22:59:10'),
(17, '730b405c-17f3-33ef-8a38-e2935c55cb3e', 'Ratione eos voluptas expedita ut voluptatem eligendi accusamus aut.', 'Molestiae deserunt eum amet. Tenetur qui tenetur rerum quasi iusto doloribus ipsam. Temporibus voluptatem accusantium eos eum sit doloremque porro. Quibusdam facere cumque pariatur velit natus voluptatem enim.', 1, 24, 5, 65, NULL, '2021-04-17', NULL, '2020-12-03 22:48:18', '2021-08-23 09:48:40'),
(18, '114811cc-4d32-397d-b517-41fe197e6740', 'Qui eius corporis quis impedit quia.', 'Debitis non ad eligendi est non dolorem voluptatem. Et aperiam aperiam possimus quaerat. Numquam porro quia quo odio magnam qui fuga. Suscipit aut magnam minima possimus et hic labore.', 1, 24, 5, 65, NULL, '2021-09-01', NULL, '2021-04-01 04:48:06', '2020-12-23 11:28:27'),
(19, 'dfa3ada9-bbdb-32c7-981e-4a0d3366b8be', 'Iste ut numquam molestiae reiciendis quibusdam.', 'Dolorum accusantium asperiores aut ut ipsum. Consequatur sint amet repellendus numquam provident animi cum. Sint consequuntur qui perspiciatis voluptas. Aut possimus repellat accusantium voluptatum quia vitae eos. Consectetur sed temporibus ut eum iusto explicabo.', 2, 24, 5, 65, NULL, '2021-06-09', NULL, '2021-03-08 16:12:39', '2020-12-14 17:33:42'),
(20, '344215d2-abac-3630-9b39-32ce772dec43', 'Pariatur non culpa et et et ut.', 'Voluptatem voluptatem omnis ea doloremque aut. Quia maxime quia possimus laudantium doloremque vitae dolorem. Aspernatur vero sed laboriosam quos quas atque velit. Quasi culpa sapiente quod neque repellat temporibus nemo.', 1, 24, 5, 65, NULL, '2021-05-22', NULL, '2021-04-09 14:57:37', '2021-04-30 16:05:30'),
(21, 'ac4164df-0e82-3fbc-bcc3-fdd8f7542ad7', 'Dignissimos sunt expedita sit harum id vitae rerum.', 'Laudantium harum tenetur deleniti rerum. Et aut voluptas voluptatum quod non culpa. Ut aut id et debitis qui.', 2, 24, 5, 65, NULL, '2021-08-19', NULL, '2021-04-03 12:25:54', '2021-01-23 13:57:53'),
(22, 'a11fd17e-91d7-3af7-ac99-0d0542ae78c8', 'Consequatur consequuntur veritatis ut rerum corporis.', 'Consequatur quia eos ad et. Tempore debitis qui mollitia reiciendis. Veritatis est eum eos. Adipisci corporis libero quas impedit ea quos nobis tempore. Officia consectetur nostrum rem cum eius.', 1, 24, 5, 65, NULL, '2021-09-23', NULL, '2021-06-11 17:59:50', '2021-07-04 05:21:49'),
(23, 'c3ea78a5-83ea-38b9-a829-bf2395a267a5', 'Magni ducimus ipsa soluta omnis.', 'Ipsam quod voluptatem autem placeat quae qui doloremque cumque. Ducimus commodi numquam possimus amet.', 1, 24, 5, 65, NULL, '2020-12-05', NULL, '2021-01-14 11:40:03', '2021-02-08 20:54:13'),
(24, '15794876-c288-3593-a2b3-71172de182fc', 'Est eos voluptatem veritatis impedit laborum.', 'Aut ipsa architecto et quibusdam sapiente soluta at. Dolorem ut dolor magni harum.', 4, 24, 5, 65, NULL, '2021-03-21', NULL, '2020-11-12 02:45:03', '2021-06-28 18:34:37'),
(25, 'f615ed21-7f2d-36b3-bd76-9721c0345eeb', 'Vel quae saepe eos et.', 'Necessitatibus aspernatur ratione dolorem velit enim ea fugit. Error omnis tempora blanditiis. Quos fugiat error id id voluptatem repellendus fugit. Mollitia expedita dolores officiis non laudantium sunt fuga.', 2, 24, 5, 65, NULL, '2020-12-30', NULL, '2021-07-18 01:03:55', '2021-09-01 20:34:31'),
(26, '59627eed-660f-3325-8f90-a4c958a7957a', 'Et recusandae sint dolore nisi officia autem voluptas sit.', 'Beatae a voluptatem voluptas aut dolores ratione. Voluptates dolorem vel delectus ut id. Qui fuga ipsa sit minima incidunt distinctio. Ut enim voluptatibus est ut qui.', 2, 24, 5, 65, NULL, '2021-10-03', NULL, '2021-02-11 06:21:44', '2021-08-20 05:59:54'),
(27, '7532b028-a0ad-34fb-b396-2302f169b8bf', 'Autem omnis a non quis quae id debitis esse.', 'Delectus eius magni dolorem aperiam debitis mollitia et. Quia est deserunt exercitationem dolorum tempora. Molestias repellat molestiae aliquam. In voluptas neque eum sit.', 4, 24, 5, 65, NULL, '2021-01-22', NULL, '2021-09-23 08:31:26', '2021-06-08 01:52:00'),
(28, '77bc94f1-df0a-3b1c-bd35-81ceda3a0e96', 'Ratione eligendi velit aspernatur quam ut culpa itaque non.', 'Quae amet non officia ex. Non eaque aliquam labore vel quos maxime. Commodi perferendis ea suscipit nisi natus tempore.', 1, 24, 5, 65, NULL, '2021-08-14', NULL, '2021-02-23 08:51:59', '2021-03-21 07:25:20'),
(29, 'd0344b39-ff5a-3f06-af95-a0b911ace968', 'Qui quo enim illo facere quibusdam qui.', 'Ratione similique adipisci ut maxime qui. Sequi eos est dignissimos sequi provident. Molestiae consequuntur cupiditate porro quis. Ut eum maxime veniam sequi tenetur assumenda similique.', 4, 24, 5, 65, NULL, '2020-12-15', NULL, '2021-08-20 06:23:30', '2021-03-05 14:03:29'),
(30, '51b59d87-6594-35dd-9e6f-557939c29dd9', 'Aspernatur et sed natus molestias reiciendis.', 'Ratione magni debitis blanditiis omnis doloribus. Optio ut nihil optio officia eum assumenda aspernatur.', 4, 24, 5, 65, NULL, '2021-01-10', NULL, '2021-03-27 15:52:11', '2021-03-07 16:58:54'),
(31, 'a2d4a053-e42b-38f4-8c6b-447b7261255c', 'Veniam aut facilis incidunt esse tempora.', 'Aut sit et omnis quas aspernatur repudiandae. Temporibus dicta mollitia sit quos. Est dolorem velit itaque sunt quod.', 3, 24, 5, 65, NULL, '2021-09-10', NULL, '2021-05-24 17:08:50', '2021-02-07 17:36:24'),
(32, 'b3067768-3ec3-3700-90eb-be3e589c70dd', 'Totam dolor sed nisi doloribus eius.', 'Quae omnis iusto magni amet error dolores ipsum sit. Perferendis expedita amet ipsa illum aspernatur amet. Non eos iusto voluptas facere assumenda id corporis. Et ut vitae illum cupiditate qui dolore voluptas.', 1, 24, 5, 65, NULL, '2021-04-20', NULL, '2021-03-01 11:52:24', '2021-02-12 10:32:18'),
(33, '3d0336a0-ce63-3507-a0de-830f3b690523', 'Nobis quibusdam fugiat voluptates dolor temporibus.', 'Quibusdam in aspernatur omnis. Quis in sit dolor neque consequuntur. Dolor dicta rerum non omnis.', 2, 24, 5, 65, NULL, '2021-01-28', NULL, '2021-02-28 03:52:03', '2021-10-16 16:16:01'),
(34, '0ad29ed1-1358-31c4-990c-ecfe707cbdee', 'Nam sit at quia nostrum.', 'Delectus at ea eaque et ut voluptas. Ullam cum tenetur qui rem id ex aspernatur dolores. Fuga maxime deleniti natus exercitationem debitis assumenda.', 3, 24, 5, 65, NULL, '2020-11-09', NULL, '2021-02-27 17:45:40', '2021-05-28 09:22:25'),
(35, '75e136f4-a7f5-3b3e-a163-98c865919dde', 'Dignissimos et maxime ratione quia voluptas molestiae numquam.', 'Fugiat ea id est doloremque adipisci qui a autem. Sapiente voluptas quibusdam itaque repudiandae error nemo repellat. Sed alias est perferendis corporis est omnis ipsam sint.', 1, 24, 5, 65, NULL, '2020-11-01', NULL, '2020-12-09 09:33:51', '2021-09-27 16:04:07'),
(36, '811f1bcb-0437-3433-9fb5-feb640c9056b', 'Ea saepe unde optio quas nisi enim sed.', 'Minus ad nihil minus esse. Omnis aut id aspernatur magnam a eaque. Id dolorum impedit dolores quia. Alias officia eaque hic accusantium aut.', 3, 24, 5, 65, NULL, '2021-08-12', NULL, '2020-11-27 07:36:33', '2021-01-03 01:34:04'),
(37, 'b9ef3485-561c-3f06-aebd-a08992ee2f5a', 'Ex ipsam rerum nisi suscipit corporis suscipit.', 'Reprehenderit maxime consectetur error ipsa et cum. Doloribus non aut sed totam est quidem.', 2, 24, 5, 65, NULL, '2021-04-22', NULL, '2021-05-25 15:12:01', '2021-10-05 10:22:59'),
(38, '98344499-af03-3050-b977-fbcf0031cb6b', 'Est expedita aut quis exercitationem sit deserunt eius.', 'Minima exercitationem officia quod voluptatem magnam. Sunt dolores doloribus alias sed perspiciatis similique labore vel. Repudiandae consequuntur nostrum cupiditate impedit.', 4, 24, 5, 65, NULL, '2021-10-05', NULL, '2021-02-03 02:58:13', '2021-02-01 02:17:21'),
(39, '032b3de7-ce1e-34e9-8b44-d77a07fcf4e3', 'Reiciendis esse sed ducimus consequatur expedita.', 'Perferendis sit velit rerum eum sed minus voluptatibus. Et sed eius architecto dolorem dicta eos. Voluptatem omnis voluptas voluptas molestiae.', 1, 24, 5, 65, NULL, '2021-06-20', NULL, '2021-10-07 19:50:31', '2020-10-25 03:23:55'),
(40, '37c7531d-d469-32ef-8e53-4d6220089bfc', 'Quis optio at consequatur qui qui autem.', 'Nisi voluptates ut explicabo illo adipisci voluptatem ad. Dolore et qui sapiente sunt quam. Exercitationem ducimus rerum sapiente enim.', 4, 24, 5, 65, NULL, '2021-03-26', NULL, '2021-07-15 11:58:42', '2021-07-14 04:59:22'),
(41, '0948d211-b47e-3993-961e-f27ba2eed39d', 'Voluptatibus tempore repudiandae dolores.', 'Natus veniam veniam tempora suscipit laborum. Ab debitis consequuntur cupiditate dolorem. Soluta suscipit ratione maxime amet rem. Accusantium modi aut tempore consequuntur.', 3, 24, 5, 65, NULL, '2021-05-04', NULL, '2020-10-25 17:36:28', '2020-11-10 04:49:20'),
(42, 'ac6bfbe7-7f33-379f-b272-c2915aabb00f', 'Ipsum id error beatae blanditiis sed ullam molestias aliquam.', 'Ad nesciunt itaque libero minus ex est dolorem. Sed commodi odit voluptatem sequi. Voluptas voluptatem rerum facere quis officia. Sequi dolore occaecati ut est reprehenderit.', 3, 24, 5, 65, NULL, '2021-01-08', NULL, '2021-01-03 05:01:54', '2021-04-06 04:06:33'),
(43, '8fe12f5b-0ea3-3375-9670-50e9b73ad11b', 'Dolorum aut aut quae tempora reiciendis molestiae.', 'Iusto velit ducimus consequatur fugit laborum repudiandae. Non autem dolores est et illum amet est. Sit ratione ab ab est. Labore provident voluptatem autem nemo.', 3, 24, 5, 65, NULL, '2021-06-14', NULL, '2021-09-03 11:27:07', '2021-08-09 22:11:16'),
(44, '86eb7d10-357a-3659-902a-f0fbfcb413e8', 'Voluptatum enim minima eum quod sunt odit incidunt.', 'Est dolor provident nobis cumque corrupti corrupti. Qui veniam amet delectus similique. Quo molestiae ut sed qui veniam. Dolor qui facilis tempore consequatur ducimus vero fugit voluptas. Omnis nulla ut quo aliquam veritatis.', 2, 24, 5, 65, NULL, '2021-08-19', NULL, '2021-07-23 00:56:09', '2021-08-11 17:32:24'),
(45, '6d2df19f-1fb6-3b6f-8597-eca91f70806f', 'Et rerum quod ratione quia vitae doloribus unde.', 'Sunt rem quod atque odio nemo laboriosam. Dolorem ducimus soluta et aut quis et. Iste officia consequatur ea voluptates. Aut voluptas cum iure animi blanditiis voluptate ducimus.', 2, 24, 5, 65, NULL, '2021-07-28', NULL, '2021-04-08 13:27:24', '2020-10-22 21:07:11'),
(46, '7a894681-9a73-3431-829e-08ef81b52504', 'Ut voluptatum quibusdam atque ducimus libero provident aspernatur.', 'Culpa rerum modi qui esse omnis fuga exercitationem. Quidem sit autem veritatis facilis nesciunt perferendis beatae. Nobis velit enim soluta veniam tempora eum minima.', 1, 24, 5, 65, NULL, '2021-04-17', NULL, '2021-01-24 20:26:16', '2021-07-03 19:25:39'),
(47, '653f2c46-a8f3-38a8-88ab-cfaa65bad443', 'Est dicta sed doloribus optio optio.', 'Nulla est nostrum numquam. Sequi perspiciatis ratione aut architecto. Ipsam aperiam natus et placeat enim inventore. Sint minus ut at quis aut vel quam.', 3, 24, 5, 65, NULL, '2021-10-18', NULL, '2021-09-09 05:58:41', '2021-09-13 04:29:00'),
(48, '1d4acd32-4d38-3cc8-8621-214115196f50', 'Ad aut dolor tenetur provident molestiae est.', 'Illo qui atque consectetur. Modi quia eos cumque earum voluptatibus cumque et.', 4, 24, 5, 65, NULL, '2021-05-16', NULL, '2021-05-27 06:16:29', '2021-01-24 04:55:27'),
(49, 'b01a691e-593e-3e9e-b642-721fadbd0ef1', 'Nam alias temporibus iusto tenetur quisquam reiciendis asperiores.', 'Sunt et fugit molestiae consequuntur quasi qui. Omnis iusto saepe ut totam assumenda velit. Tenetur nesciunt ut sit quia vitae et. Dolorem natus ratione illo aut eius omnis autem eos.', 3, 24, 5, 65, NULL, '2020-11-12', NULL, '2020-12-21 07:14:32', '2021-10-08 03:17:44'),
(50, '5908ccbf-bf7d-3bfb-a753-803e5b648c35', 'Earum non ut vitae aut.', 'Commodi voluptas modi numquam consectetur praesentium quidem ipsa quia. Maiores quas sit officiis quibusdam et itaque iure. Velit pariatur exercitationem beatae. Culpa quod vitae et praesentium.', 4, 24, 5, 65, NULL, '2021-08-11', NULL, '2021-10-08 12:25:12', '2021-09-01 05:36:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primary_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EN',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `external_id`, `name`, `email`, `password`, `address`, `primary_number`, `secondary_number`, `image_path`, `remember_token`, `language`, `deleted_at`, `created_at`, `updated_at`, `branch`, `employee_number`, `status_id`) VALUES
(1, 'c566ec6b-bb8e-44e1-aa6e-804d44799a54', 'Admin', 'admin@admin.com', '$2y$10$LLau09HgECX6eestaoiyI.VZV8sRwv4in3ooc1MIF0eLPgAeSt2ai', '', NULL, NULL, '', NULL, 'EN', NULL, '2016-06-04 08:42:19', '2016-06-04 08:42:19', 'Branch', '1234', '1'),
(2, 'c26c9436-c41b-394f-913f-ed5c0a41f7c2', 'Dr. Kris Casper Sr.', 'emmanuel69@gmail.com', '$2y$10$bChPHVgscuprlC2SCuFig.tZ/20CvWavgK19VC5d/3lS05LKOIvG6', 'Suite 932', '7335294', '23622896', NULL, NULL, 'en', NULL, '2021-10-19 12:25:25', '2021-10-19 12:25:25', '', '', ''),
(3, 'fb5eb2ca-513a-3ffa-ad1c-b69a7e3f08da', 'Veda Pacocha DVM', 'gokuneva@feest.net', '$2y$10$DCMQD5FBhhgij0nA1LmpW.HDSuiu.2bnaFWqTds8SqZA9t3u0h1yu', 'Apt. 349', '92875702', '98142096', NULL, NULL, 'en', NULL, '2021-10-19 12:25:25', '2021-10-19 12:25:25', '', '', ''),
(4, 'eb7eda10-02a9-3eda-b309-1ffae6c8fa5e', 'Austen Lebsack', 'lockman.morton@yahoo.com', '$2y$10$Io9uBEV0BfFKbu5ycMADeOEJPflbjGNJkvAx2u/5Tji9IdXPBIgp.', 'Apt. 331', '33019878', '74751076', NULL, NULL, 'en', NULL, '2021-10-19 12:25:25', '2021-10-19 12:25:25', '', '', ''),
(5, '4d39be90-55ab-37f2-996b-fd5c145cbb25', 'Oren Boehm', 'ramon.batz@mitchell.org', '$2y$10$Xz0.f4cT/UAe60g4Q9/C/u.t19qydoFKYJQpAej.Am4BOwus/Q5zi', 'Suite 520', '10369959', '57287538', NULL, NULL, 'en', NULL, '2021-10-19 12:25:25', '2021-10-19 12:25:25', '', '', ''),
(6, '24ad510a-5bfb-307f-8273-408484b3411d', 'Miss Kenyatta Dare', 'janelle49@hotmail.com', '$2y$10$Qn7aa592goi4oRtbfBmzQOcIDp06G0kx9uRffRv/n9ZbWiafl/Y/G', 'Suite 243', '24753338', '4127630', NULL, NULL, 'en', NULL, '2021-10-19 12:25:25', '2021-10-19 12:25:25', '', '', ''),
(7, '251515c8-e35b-3654-ab64-8159f9d7ed78', 'Connor McKenzie', 'katelin63@yahoo.com', '$2y$10$qehkjr4XzXtoJSSTa.rpt.HMALZJ/0pf.H6tvh9guSwtDqQnchTAa', 'Suite 437', '3512543', '86396890', NULL, NULL, 'en', NULL, '2021-10-19 12:25:25', '2021-10-19 12:25:25', '', '', ''),
(8, 'cd12c530-d78e-32d2-b9af-740361d73943', 'Miss Ethelyn Ullrich', 'streich.bertha@hotmail.com', '$2y$10$TsWMREGvvbzg.jJdDHn5oOyXYyERCwmEM785EO2kqCO0ARiCXEvgq', 'Suite 669', '74246993', '58397314', NULL, NULL, 'en', NULL, '2021-10-19 12:25:25', '2021-10-19 12:25:25', '', '', ''),
(9, '22ea9ccf-cdfa-33fb-81d6-19a64960b84a', 'Nia Mueller', 'egraham@gmail.com', '$2y$10$N8jeR6KJUT7FKdX0ox57quswVL59yivfwip4p3CupyEVbrR9ezaHK', 'Apt. 539', '58072730', '97908054', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(10, '858a338d-5f2b-3f10-9875-d46c3ce57beb', 'Sidney Bartoletti', 'rosario09@fadel.com', '$2y$10$1SZCvEWzCHgTXl/ks4Z1Ve.VLuQtzQ.zTwrVAu8NfJir4P7SYb/p6', 'Suite 911', '72178697', '74251660', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(11, '8c7a44e9-ea46-3225-8508-701f3981d27e', 'Imelda Huel DVM', 'kassulke.eusebio@ebert.net', '$2y$10$4PBBi5w7AY37tFiL.5fkueXHWDeIEY5rYpH9RjS9V6Gamz5YXn/.C', 'Suite 262', '65628311', '9559635', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(12, '1e453fbf-7f24-3e16-bead-47e68e4486b3', 'Lee Okuneva', 'candice.funk@casper.info', '$2y$10$8R5pEZeBaU5QvBjpx8z.bOX7D9oQlFbZRBK/Y6WeZS2hJQPW/yKSy', 'Apt. 544', '44391268', '30526394', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(13, 'a5fe9ab1-5a00-3d3c-9e3d-f9dc39dd6bc9', 'Alysson Rau', 'zsanford@rowe.com', '$2y$10$rmscNrot/033FduWJ2EVUu00Nz0dy7ynvl93dBqNQ7Il4WCqUTaNW', 'Apt. 648', '93715472', '69858359', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(14, '3856cbf8-b46e-3d0a-855a-5cbd4793477b', 'Armani Schinner V', 'rocky.veum@yahoo.com', '$2y$10$vJq6teDQv.JFmgjeHmUXlOQtoDG9nb3fWAZnOVvcW6FXQtBeCwROO', 'Suite 198', '44267832', '22233645', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(15, '520d11b3-0721-3d27-b725-a393e127f865', 'Gene Zieme II', 'river70@kris.com', '$2y$10$S62ZKQEmNOmRzdTBhlix4unGtPOoH7ipNMH168n8DT5gPz.N4BApa', 'Apt. 288', '15986795', '11201483', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(16, '53f67c2d-2d98-378f-ba60-949fd192db18', 'Mr. Roscoe Marquardt', 'dylan.halvorson@gmail.com', '$2y$10$dm7fFRuZBuxfgm/rLEdjgeTfzzoqZaphA9sPm4Q.rRUcqW89LYKfi', 'Apt. 354', '70912198', '72510588', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(17, 'a9d5768d-1fd4-380c-ba48-7f771723606f', 'Euna Lesch', 'ben.dibbert@gmail.com', '$2y$10$kh390vizTpOWgXLDRrPFXeU3L8tnWV5xOspVUU6o6599ZrUoVw9My', 'Suite 583', '47276728', '24906308', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(18, '09a9f7bf-093f-3104-9106-d37755285fd5', 'Nickolas Wehner', 'glarson@hotmail.com', '$2y$10$ywBiT.A/zoFEguYH95DwE.njLxEQLru88XtcjkDQ24GT3qHTX3xC2', 'Apt. 530', '5207428', '37281771', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(19, '3effff3f-e44b-354f-b656-6024920824ad', 'Gail Schumm', 'lisette22@stokes.org', '$2y$10$jDRRsRq2gg7wcvaIxzp62.AMwBSgwYlHNCe.2M1fsEqQAYog80DD2', 'Apt. 964', '82318211', '77362236', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(20, 'de653a54-7ca6-37c8-b150-cb64fe39ed7e', 'Diana Schimmel', 'trisha.ryan@ankunding.com', '$2y$10$.SVYG.ROX1kLGOsM9zYX1.SBHK1XUdXCCa/9gurmfS47dMqDfqTZa', 'Suite 480', '63304687', '92794904', NULL, NULL, 'en', NULL, '2021-10-19 12:25:26', '2021-10-19 12:25:26', '', '', ''),
(21, 'db4353df-132f-3636-9945-f0b5c28b84c8', 'Coy Strosin', 'walker.josie@yahoo.com', '$2y$10$P2YEfgWW.LjeJIuQmxtk3OAg5wWO/O0CrF7zavh2DB8PpgUM80K4u', 'Apt. 914', '57381829', '3772139', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(22, '792e033d-cbe3-38a5-816b-66776946253e', 'Michel Beahan', 'savion.steuber@blanda.biz', '$2y$10$vF8NRKCMqfD64u/lnyYj6u3mlBby2vh.uXbWxHnbMzkG4BrNacwWW', 'Suite 571', '86727961', '64171222', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(23, '45af5da9-f050-387d-8e2d-d2bf5c8caabf', 'Prof. Vickie Dickens', 'wrodriguez@dibbert.org', '$2y$10$KaBc57cYs1LAGs7nm3vQ3ujYuBjb5MvghqbrVbmIKUC7LE.uxJXSq', 'Suite 117', '33539063', '27587701', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(24, '7a4d3f92-afa4-3353-8fef-3019ad26692a', 'Joseph Shields', 'marcelle.tremblay@kuhlman.biz', '$2y$10$EhOhyIbdKjENaL2qvQbVy.wmf7fFpTQKXc.RenJ099lSLD5FabKYG', 'Suite 426', '62557329', '29001619', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(25, '6c8d90f7-9e3f-3e0f-a32f-14a9a8cfce44', 'Helga Raynor', 'johanna.crooks@champlin.com', '$2y$10$Ts3bhOE6rLRFjCSb47zl..hpYaOkhH1GQMLQ5URATkYz4//rx8hlS', 'Suite 823', '80665874', '77070808', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(26, '3c5d58c5-352f-3bfe-b489-88434f52829d', 'Miss Maia Reinger PhD', 'ykunde@hotmail.com', '$2y$10$IS596wD2EiqdLEArZXMCvOR2Z5qDx8rRNXazHwio4zoOqfM.JPMA6', 'Apt. 174', '45798638', '18297664', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(27, '2fb4b46e-b9d9-3299-b278-6f3a2815ef8d', 'Kirstin Schneider', 'lehner.imani@hotmail.com', '$2y$10$6UDLdBHrOionSu/uLDbZXe3TaSY/omaXtP9hrfjjCSD5TQmoKMpGm', 'Apt. 739', '80588077', '9463222', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(28, '4bc8ef5e-6f4d-39ff-8e76-348789a29896', 'Mr. Duncan Macejkovic', 'lucio39@hotmail.com', '$2y$10$.o.osLwV0dOkM2Ze4nahHucc15BmvBEOKgTDN0jEh9EYRs308OPsW', 'Suite 235', '20583032', '34573184', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(29, '179d523f-50ca-3fd4-a61f-1ea98a3b0b58', 'Amalia Stroman I', 'bryon.fritsch@hotmail.com', '$2y$10$NKLcdWGlNqeaqDaOWoxRh.S1oz2mWhSjHSolYs45Kt8lEHDMBy9hK', 'Apt. 540', '28217748', '83571639', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(30, 'bb9e50f2-818d-3253-ae8d-e6eb84c5fe2a', 'Miss Jennie DuBuque', 'glarson@ziemann.biz', '$2y$10$Eg4NisJosK4iOcuoqu43COYMmt/jTs79GTJKuWcJBRKqU0nr/g8Y2', 'Apt. 484', '80675073', '94202695', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(31, '3ee3480c-1fea-3965-8029-968a4437e32c', 'Delpha Nienow', 'rippin.conrad@hotmail.com', '$2y$10$XRDabi9SSmuOeJ3B2WBFIO9fufyIkXdRpNnwwVR9Gd/DdkfcLSZ7a', 'Suite 745', '40806034', '73966659', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(32, 'e5a5f89c-9925-3e24-b629-f0acd5c6282f', 'Mr. Oren Altenwerth MD', 'ernestina09@mueller.com', '$2y$10$FrpXUXHPGKwje1fzsrA6hOzwJcYd8dzLrNY9YmB9muFdDfc3.43Xq', 'Apt. 977', '37539392', '7863993', NULL, NULL, 'en', NULL, '2021-10-19 12:25:27', '2021-10-19 12:25:27', '', '', ''),
(33, '5e7dedd5-ab66-3517-90f4-d88b05e5c53d', 'Loraine Lebsack', 'okuneva.maureen@herman.info', '$2y$10$ve.yqKQWll/r1NF.FeiEfuVyAzloNnnudX9KDAAdJR6ancfdK5o5.', 'Apt. 793', '90369446', '79288635', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(34, '2eed2fe8-c4a2-3738-88a6-9a8fc8cc1ab6', 'Sonia Bayer', 'janie.beahan@roberts.com', '$2y$10$fYYRcGQgRy5qhJeoV5W39efnh7W1DsZ/stbYnXpL.a/vjV.L78uxG', 'Apt. 113', '44392699', '14211052', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(35, '8b409984-a7c2-3d79-a9fa-0636eeb75ef4', 'Bonita Kreiger PhD', 'tanner02@gerhold.com', '$2y$10$gMjJGWhvvHgHLwI6gRgnJO9ZzkHoB3E4cHcO9ASqq.6TgQj4maMo2', 'Suite 882', '46104499', '52766481', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(36, 'a55db226-c16a-3647-b30b-4aa51506445a', 'Susie McKenzie', 'dulce.trantow@williamson.biz', '$2y$10$ZpS91Jl6esI.3/gcmOb5OeBa9SS21rfQYOSEdO/9nvyqFDP6LJ7/y', 'Suite 505', '49667877', '63340851', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(37, 'df01805d-649a-3cb5-94fd-7df96785cbb1', 'Prof. Bret Mueller I', 'ischumm@yahoo.com', '$2y$10$4YtKaz6TLrEia13K8vKHYeb3NVfvj8h8KruUs8VJ98FHtMeySUyfS', 'Apt. 209', '48615291', '62342768', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(38, '5474661a-6d08-3dbd-9d49-e02a0dd214df', 'Christ Pouros DDS', 'willa74@hotmail.com', '$2y$10$ZKHzzqJSacVmDmcsm9MoXeFtF.Wd0yrjaJyWYYW.oe4SNXFCpUSlS', 'Apt. 119', '66377029', '99285719', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(39, '27448fc3-7b21-322a-844b-1a68804b9e16', 'Prof. Gavin Wuckert V', 'leonel16@bergstrom.info', '$2y$10$JJ2e6tLmycVisx881/lQYeuRbnu.VnCROkOp/OiDMnAugnbyDWeea', 'Apt. 790', '18940161', '97343818', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(40, '7815ade7-f8f0-313a-8c7e-ddb90da3be67', 'Cristian Erdman', 'rex97@stehr.com', '$2y$10$u8IyisrUh5/GUCy1gjZfPOSMIstojvod0FyNPSnDnMsYeFj4we.5W', 'Suite 064', '90012125', '82441922', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(41, '45fcf507-1869-3aba-a530-2dfac4909435', 'Sheila Schinner', 'effertz.minerva@bernhard.com', '$2y$10$D5wWp54aLcGNgIcZOQu5m.qRObXsGQKcLlOkwyTfPWbyTK1SHK5Lm', 'Apt. 993', '16973447', '66487107', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(42, '5bdf3447-7942-331e-87da-16b0281c4d56', 'Mr. Cleo Hegmann', 'keaton53@marvin.com', '$2y$10$n.TmZXjd8JyAcpVZiyooauCVXtMpVRdl1g2O47PyuVApYiF8xLqQK', 'Apt. 042', '67277179', '79058977', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(43, '8f27662a-4701-355e-bade-2a76f30a7b1c', 'Willard Harvey', 'ottis.cummings@kuhn.com', '$2y$10$/Cq5wN8GxftruI58K9vuru9GRxH8xoZIjKidz/sqwEqaws0S8dPdm', 'Apt. 824', '29907571', '58543579', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(44, 'dd8601c9-cab4-362f-9d3e-4b9e5be5f47a', 'Myrtie Kreiger', 'stehr.shemar@hotmail.com', '$2y$10$PLTs1Ob2g02Jo8Z91eXMaOY5ziujrCbXUsxCNL5q8jT2obRizZHDi', 'Apt. 557', '86473036', '28581013', NULL, NULL, 'en', NULL, '2021-10-19 12:25:28', '2021-10-19 12:25:28', '', '', ''),
(45, '22f004cb-d788-322a-8353-21fd93fd50fb', 'Effie McClure', 'afton00@yahoo.com', '$2y$10$1zBEAsnP8GIoOJGc1x/x8OUKucMgzfHfuvUyjEjrrL4EkNO.HxBdK', 'Suite 306', '5717176', '51911528', NULL, NULL, 'en', NULL, '2021-10-19 12:25:29', '2021-10-19 12:25:29', '', '', ''),
(46, '4edf5a47-0c32-3feb-bfe6-a04201830869', 'Charles Heaney PhD', 'konopelski.bonita@hotmail.com', '$2y$10$yXOo3rI6/nykilp.NmLJJ.iIVkoPptSJ9LGH7lK0aR5fk7FZDXHaa', 'Apt. 247', '26458553', '28730122', NULL, NULL, 'en', NULL, '2021-10-19 12:25:29', '2021-10-19 12:25:29', '', '', ''),
(47, '7a3db7af-288e-3d27-bdf9-2014464e8492', 'Arno Ortiz', 'jacky.mante@gmail.com', '$2y$10$OlTHH028PN8UHCmBEXdNM.fO/MgLwf2z.AySwwmWh1Zgvy64vWMIm', 'Apt. 856', '40101083', '90218834', NULL, NULL, 'en', NULL, '2021-10-19 12:25:29', '2021-10-19 12:25:29', '', '', ''),
(48, 'a3910314-c995-39d0-aea9-e89a5d5ebdb5', 'Erwin Heathcote', 'wjohnson@aufderhar.com', '$2y$10$z4aFyscG8ZPV9UIzhFrWmOE.KiCjy6umNS8MeL82ngHZSPvDJ24q2', 'Apt. 765', '35703871', '56588755', NULL, NULL, 'en', NULL, '2021-10-19 12:25:29', '2021-10-19 12:25:29', '', '', ''),
(49, '78993fb3-4c30-3beb-8cae-f6083c552cd6', 'Elody Hilpert', 'gorczany.yvonne@yahoo.com', '$2y$10$7seb2rt9dJSSEpbcETQlneMtyVosJwTlprHI47iymiY10FYSdzm9G', 'Apt. 243', '25344762', '43216473', NULL, NULL, 'en', NULL, '2021-10-19 12:25:29', '2021-10-19 12:25:29', '', '', ''),
(50, '1074fe72-898b-3e43-91be-51c61d173909', 'Sage Schuppe', 'shannon08@yahoo.com', '$2y$10$uTVFm5i5p4WwxV9ink5NZ.wpInZ9d5hH0F6uz1.ap6JO2FWJz8tsS', 'Suite 548', '53380759', '96102826', NULL, NULL, 'en', NULL, '2021-10-19 12:25:29', '2021-10-19 12:25:29', '', '', ''),
(51, 'd8f42573-1293-37af-95ee-160b6da63e67', 'Charles Collier', 'kory72@hotmail.com', '$2y$10$MM.t9SmaiJgnp4H92WHI5uqJG0ynu0nDX9JrC2Uz1cyQTP2oUvIk2', 'Suite 075', '26590773', '81312057', NULL, NULL, 'en', NULL, '2021-10-19 12:25:29', '2021-10-19 12:25:29', '', '', ''),
(52, '03d43397-09ab-3456-8a3d-59690cd40309', 'Denis Moore', 'werner.hickle@donnelly.com', '$2y$10$K4J8r7GfmztqZyuPIDdWlOL7qAfMP1LZRSrjwLDneXPZBYPkJQo1K', 'Apt. 310', '80123844', '67027588', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(53, '8e85b2fa-80f9-3f9d-9b15-e4b1bdf9cae8', 'Clint Romaguera', 'elmore56@yahoo.com', '$2y$10$8LrkfFvR1D6uWpp9/8bol.XzGLt5HYKPOSztApb4sKTpLLqXQU68O', 'Suite 849', '23372250', '71729737', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(54, 'fc7532b6-8c0d-3acc-b62b-87e0491227a9', 'Brad Trantow', 'paige12@glover.info', '$2y$10$.SRj67ITkFXMjUVIfEC.Zu1UE3U0tzPGcZObU2q.7QzCfsThH6UNC', 'Apt. 941', '21294674', '59304526', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(55, '2ee1f2d5-899f-321e-bee8-1c7eec130e9b', 'Candida Wehner', 'jonathan.johns@kautzer.com', '$2y$10$ULeeKUBggrOekQECigMdZu15uP.OX29vogp9a3vHI4V4Neoj2p.Im', 'Suite 412', '91196613', '53391780', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(56, '5bc84855-f56e-3d29-b7c6-54a143944247', 'Omer Ebert', 'alessandra32@purdy.com', '$2y$10$mPsMfN3PxLR67/JnOxBVPuB4krwWyfWFy1/MkhK8HaS8apLeFJBGy', 'Apt. 654', '21836408', '76837841', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(57, '88e030f2-03ca-3bc2-9973-3d8271942689', 'Leonel Windler IV', 'osinski.cleora@hotmail.com', '$2y$10$3cbdg9XlxYogNKzB2F9KDuSOWWOCpZiaiDRH9v17X90/G5KE/K0Da', 'Suite 576', '36277279', '24008735', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(58, '68f254c2-7a9d-39f9-9be0-1932cd48a794', 'Cecilia Wilkinson', 'gabriella50@gmail.com', '$2y$10$TKZz4HMb6gZx4NuPqwnIAeuHX6l3XpGj9F0yU.Vlf0hyZz9xtw.lu', 'Apt. 254', '54474768', '79329594', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(59, '29c5f346-6e09-38a1-8176-3210f7aa336b', 'Luigi Bogan', 'charlene.huels@hotmail.com', '$2y$10$73.3bqEzgCbiETZNzXdnsu1.jhkivYSPeR82sJjOw/knUlRmz2rzK', 'Suite 429', '83827001', '7345111', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(60, '88f65198-603c-3d84-b7d5-6c557ee2f505', 'Mrs. Ines Rath PhD', 'terry.jesse@hotmail.com', '$2y$10$Rdt.ZmbDoDSMnXqBoIQUD.swPmMAsbhRG38qqL4f1gDHtGz/YXGM2', 'Suite 614', '90454396', '28268119', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(61, 'e1e0a9b7-c3c2-3efe-8fdb-40d00d202fb4', 'Nick O\'Hara', 'ybradtke@hansen.com', '$2y$10$S6gEdr3hYWdMS4Iwwd8TauNgTFdzsw6RGDQU7xB41nCPAsVvXFJhi', 'Suite 205', '12560286', '54974841', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(62, 'df57a0ca-a0b3-30e4-9486-317aadfd9da9', 'Dr. Cristian Crona', 'layla.morar@lockman.org', '$2y$10$ne1fI.PsJpE8Uek9PCkm7e.duoiGDIe6cBrxmjdCfG3kv7a.odVAK', 'Apt. 747', '51558841', '2569332', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(63, 'cee3c480-1a82-3826-94c6-bda76c43b619', 'Mr. Gideon Jast II', 'heller.steve@hotmail.com', '$2y$10$GtkTqTa8x6WWBw7sy33qS.h5L3xhxaSYeNOuHofBYpm6z7GFNYMLi', 'Suite 409', '26460294', '22334725', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(64, 'd77b02a8-0df5-34c6-81df-5f36ca94415f', 'Otha Corwin', 'mroob@hilpert.net', '$2y$10$XwwJq48yacWqj9Xx0Yls8OCHdYkHfxGZddoO7jmOLfUdWnRGk5sP2', 'Suite 686', '4553109', '25667761', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(65, '8e6b923c-54d9-34af-b063-cbd7cb46d810', 'Prof. Micheal Keeling Jr.', 'twila35@mayert.com', '$2y$10$g.k47ioni9cPCGijQdCbeuuEOMll6Zc2U9nAhPoSjMqF7COcVqbOy', 'Suite 368', '84827160', '54902775', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(66, 'e42f1a52-c7dc-3b7f-b66c-636815cfb7e8', 'Mr. Lavon Weber III', 'emmanuelle.kreiger@hansen.com', '$2y$10$B6dlfOHf2rm0MNzZQfjJRONcCkqX4zoZooQn3odqRCjcgZ/zQuwse', 'Suite 938', '40630193', '29182714', NULL, NULL, 'en', NULL, '2021-10-19 12:25:32', '2021-10-19 12:25:32', '', '', ''),
(67, '18ea6241-0a44-3133-ad18-e8474d6da0a2', 'Nolan Parisian', 'harris.salvador@bartell.com', '$2y$10$9SLmM2ZVePmpNiE1hnid7.tdPYBaGl1w1z5/ZY1B8ouKKCIBi5LaW', 'Apt. 449', '65117247', '20278542', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(68, '78d012e4-12aa-3a01-8ae7-9854764fda3f', 'Robert Konopelski', 'armani54@gmail.com', '$2y$10$8k3uVvHVZKDvSEMOmdIqaegeby2byVbtsYWSZFi.B0MXeVe1T7Iwi', 'Suite 994', '68091288', '69533417', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(69, '20736b5e-29e7-36cf-a426-c65700e51494', 'Ms. Lillie Stiedemann', 'florian.harris@turcotte.info', '$2y$10$T2zj0tw5Msnxyr9AUUu6fOJqxKo/6U5MZUsf4P7YcDop9HML1z9dC', 'Suite 251', '74451366', '9715914', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(70, '32d03628-5a75-321e-9d63-52eca52bba77', 'Dr. Marietta Hartmann III', 'felix89@hotmail.com', '$2y$10$PgMUskY9HOJcbV4xUik6POn5lpOVwvSTytI/H9CQH2MR1rCX/O7Ha', 'Apt. 112', '38064881', '91087914', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(71, 'a961b45a-3a17-3702-b8f7-c5351ed28a20', 'Earnest Torphy', 'flavio31@ondricka.org', '$2y$10$GHEyFakyaeQ7K0N424sROOs/f9HELyCOUaiIgolDQYkq/tp5vtD5K', 'Suite 792', '50811340', '71019367', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(72, 'e11d06a9-ed01-34eb-b20c-41790a33e914', 'Giovanna Purdy', 'luis82@schuppe.com', '$2y$10$vUezXu7J6A.Taf8hPcGAuuueiT1RNzJmgdwhomyhBX4psK6sOUIYC', 'Apt. 523', '72747378', '36463631', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(73, '8e39997a-faee-3635-b2f4-3a2d91213854', 'Lon McKenzie', 'qlueilwitz@yahoo.com', '$2y$10$uZQnXdO6Mg9Pm/4tj0TGkuVeUPGLxLGgCeu6prAM2VyvPl6kcrZYq', 'Suite 425', '56793115', '98800323', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(74, '4d2605f4-4caa-3f79-91f3-aa2bdda3e103', 'Trudie Gutkowski', 'barrett.altenwerth@hotmail.com', '$2y$10$kSIDFLQ9esXo925.aF8jOeDU6aXTh2D6crMaD6VB8GEC9MnrULdZO', 'Suite 456', '66478532', '42972457', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(75, '8c955cb1-babe-34f1-8baf-9817d2794020', 'Judy Daniel', 'aking@hotmail.com', '$2y$10$je3ojhF.Mhvo.Dal4aJ0yesZ4fw7djuy3PoVyHuwTCR9m4mZIyjEO', 'Apt. 645', '73557665', '41306106', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(76, 'db7bf5aa-964f-3563-94d9-8c01a639211d', 'Dr. Cyrus Bartell I', 'maymie54@bradtke.com', '$2y$10$8oDJvs0boDtHm9TJI6JyAOone.QlO0ULs3OI5iLIAS/JrENNAQGBW', 'Suite 193', '18468720', '21295576', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(77, 'db3b7efb-2187-3b5b-8290-faabdcb81a6b', 'Miss Nadia Swift', 'brannon.kilback@yahoo.com', '$2y$10$yfgavXeL99mHZDmhQ85dS.AgKpxr3BstyoD/noHae7Yx8Wwd5t93S', 'Apt. 080', '17020331', '89404152', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(78, '0bcdcb54-5df2-3f1b-a335-9132527298d5', 'Mariela Keebler', 'watsica.delpha@doyle.info', '$2y$10$RSKYJp6NGZLKlmqEhgUSyOQT6Beku4jkbh0epqGhGCj83fFTZ1r86', 'Suite 658', '61122074', '65834016', NULL, NULL, 'en', NULL, '2021-10-19 12:25:33', '2021-10-19 12:25:33', '', '', ''),
(79, 'bede8ed8-aa5c-34ff-81d4-2056ea87e12e', 'Nathen Bernier', 'moshe51@hane.com', '$2y$10$0pwa0IQU91OCrofMRE2iy.mQg9M/uaql8ur0YqOGrmKfV8LioAE6S', 'Suite 442', '97576715', '777574', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(80, '7dc829a7-e591-3d55-884a-7d06f583bc68', 'Yazmin Strosin DVM', 'bfay@gmail.com', '$2y$10$VFI5O1KaufwdQRQ4PgBBfuvo5.9M.9uIsTNcKhM/nityhVw8m8WEO', 'Suite 368', '63365088', '27707788', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(81, '838aa389-b3cb-3a07-8585-4f424dd43cd8', 'Hertha Streich', 'ayundt@ullrich.com', '$2y$10$dGmQyFKRLRu3QyZtk1TeF.D41p7r7xl4k405glf6nyw/C/Iw53lEm', 'Apt. 302', '52379746', '65151465', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(82, '0c4edf2c-b8c5-3c3a-9da9-0739a92f4199', 'Dianna Rohan', 'sfritsch@mcdermott.com', '$2y$10$ZSkqp/APuOefj052X5nUB.cLfjgp4qIcyfCxBOxftAV.GSOCTXAf.', 'Apt. 883', '63846778', '49076574', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(83, '35ce84e4-aa73-37ac-a1d7-cb37eb5a4be3', 'Kaleb Gleason', 'thiel.marques@ebert.com', '$2y$10$af5DpXTNbSOKLmlufzGLf.n7Y9SyxQ7R91Ki1O/Zcoh0.8IbEXInC', 'Suite 550', '6751440', '40225208', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(84, 'a2ba6c19-f376-37d9-91bc-04a9c918c49f', 'Wiley Lindgren', 'devon52@simonis.biz', '$2y$10$GwDNOUJZgpQ7fRcnkgWr6eiWAEw5Etlsit.803WXIB2esaRqqC8lS', 'Suite 303', '51120968', '85812444', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(85, 'c3544a77-1763-382c-a084-14a9cef29deb', 'Brayan Hill', 'uhomenick@hickle.com', '$2y$10$dDekyMFTfwSPIGYvZO7uKOjLc2KuLofBBuudS9swKIuup4cq4Wg/u', 'Suite 208', '95122908', '77168944', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(86, '0d7579e4-9d8b-333b-9ca1-152b59016aae', 'Elmore Willms', 'dmorissette@robel.org', '$2y$10$6wIu1RcLlm.fLUSHSgaCyuHBa.FkYTB4goMaNr/saSPfFsSWNg1kC', 'Apt. 434', '25730014', '29185276', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(87, '16f951c6-9c59-3a91-8109-22f73f3e660d', 'Prof. Aidan Hand DVM', 'deven.nader@sawayn.net', '$2y$10$9G03L18dmqdmNdmrIwQmLu2OT4FQFTP7XFGqoa0O5GOZbuaTv4Qme', 'Suite 586', '48481320', '60911736', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(88, '9cb51b75-4cf2-300b-8686-8fa876a45f02', 'Althea Kozey', 'margaretta11@kilback.org', '$2y$10$e0WRNkM/VLZ0uV8QyMVux.Wey1fX0mWAATyMpvvHS6e2hBcfpztBu', 'Suite 593', '86719751', '39483005', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(89, '96a551bc-f823-3743-b788-e312f40af278', 'Prof. Laurie Schultz', 'ujohnson@jones.biz', '$2y$10$YPir2c9ZTFszmeULmJvy4OXrhBVaCsjnE7nAh3Js9vzGDL236o/ce', 'Suite 054', '44604363', '54687683', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(90, 'fd34db86-a448-38f2-ae91-6115a3f07f63', 'Dee Hettinger DDS', 'hreichert@dubuque.net', '$2y$10$kKIHbg8yb5NRZekpkqxhBOwYAtZw1CQSnT8fjc3SZeoU3H/Ypbe4.', 'Apt. 334', '6616815', '97356469', NULL, NULL, 'en', NULL, '2021-10-19 12:25:34', '2021-10-19 12:25:34', '', '', ''),
(91, '99ae7b12-d519-30e9-96c1-17dec05e0bd7', 'Prof. Abdul Skiles', 'gulgowski.jovan@altenwerth.net', '$2y$10$ieirAca2KA6beNBiUwrXX.B3uHEI6r8TXVyHbU/1SfctPv0rW5.O6', 'Apt. 621', '97996292', '97228601', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(92, 'b59a0e40-acda-3eb3-8b48-7aa2c4ba0bba', 'Lilly Upton', 'gay81@bernhard.com', '$2y$10$B4.VLSpsIGUBEeQn/mpUE.tTSbou4mWT5w6z5tZS9Y.kN50TEl2/C', 'Suite 926', '47961234', '81937178', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(93, 'd654a742-4e57-3edb-a573-5eff4e381a84', 'Savion Huel', 'lmcdermott@gmail.com', '$2y$10$ZkKy1haHsjuCpRaN8HSR9e.9Mmn89wwm5JYcLND1nSEDQodBkCp5K', 'Suite 136', '24834068', '7927042', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(94, '09d79b30-a23b-3242-a240-fa9c10a27d41', 'Michele Quitzon', 'maxie01@sanford.com', '$2y$10$p/ywwPdY1RZgimuBTALDfOoHpJlUxsQefqE1xnEhqvmtKrLvxpY8O', 'Suite 432', '51234996', '82936911', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(95, 'e5612ef9-8e70-3894-b6c8-93a57560f5be', 'Velma Wiegand', 'blake.block@feest.biz', '$2y$10$B0e0uskxuEAqpqiRNTwyG.WjODjs2EStQuxw5UZAqg4cCugRGJqwO', 'Suite 725', '54466947', '17841290', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(96, '0a9ebdbd-8e38-3b6d-b952-bad9da8770c4', 'Dr. Olen Simonis II', 'mueller.vinnie@renner.biz', '$2y$10$Rhs5q0arR5Ky2ys/HNJgnexnxP9LzfuipY./ONKEKUChHyrJg02.W', 'Apt. 508', '26109058', '90513502', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(97, 'd1c3ef1b-4f53-3e5f-998c-948e21520789', 'Gayle Hegmann', 'greg80@gmail.com', '$2y$10$1df6myeWwD6oQl8qGDO0ceVxXU7tZCTfthYSe/jtfQHINp08CzIPu', 'Apt. 873', '45546143', '250268', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(98, 'e5d6d6c4-0b7f-3e8d-a51f-0c894cdf1019', 'Demond Champlin MD', 'pfannerstill.citlalli@yahoo.com', '$2y$10$4jStw5rzj5Uzx5IEtPoKJ.WCcV343d2QA4S8K34a0FwL/7JTP0JQK', 'Suite 506', '53077685', '85825043', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(99, 'efdff630-fb25-3441-b4a9-408a23885eb5', 'Dr. Easton Hirthe', 'jess23@batz.info', '$2y$10$oYrBiJkLgIrmLG6u77DuB.5L0comALeMsSw1smSu3fKZjZ75lFcUq', 'Suite 149', '53095506', '18437976', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(100, '28220909-acca-3ecd-93dc-b61b03195bff', 'Ernestina Aufderhar', 'gonzalo.carter@yahoo.com', '$2y$10$ghYB8YtXcUtI29.34KFD1eZ9rPhU3eB/ZORVxPE3HcUmBKVXDXyau', 'Apt. 598', '34232491', '90282793', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(101, 'c93b7e13-7283-32b2-b827-feb2d59d4320', 'Marlin O\'Keefe', 'mose.ankunding@fahey.com', '$2y$10$sLEfDvWnPhl.MwZdClqUp.5z3Zkm0ly/BMh7JTmNwBpsANu6IQ84e', 'Apt. 680', '44712354', '15763945', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(102, '622baef3-b07f-3bd2-94c9-8765fbd0235c', 'Casper Flatley', 'jones.dawson@wisozk.info', '$2y$10$xS9nmVXpWBfjp7IESNKGXuJW0QFNbAYyLdhDzKT.EDmRYNjHOJWmK', 'Apt. 019', '15257847', '90554739', NULL, NULL, 'en', NULL, '2021-10-19 12:25:35', '2021-10-19 12:25:35', '', '', ''),
(103, '11fb60b4-8a84-3007-a118-0c1962a66742', 'Prof. Junior Keebler I', 'xeffertz@hotmail.com', '$2y$10$ZuXBDTuINa7w6oMQrhPxxuhDgUNS1kYZuXTzBuqjbvD3xigZ9MkN2', 'Apt. 685', '87094572', '19195110', NULL, NULL, 'en', NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', '', '', ''),
(104, 'dbf2b79d-3b27-33ea-a55c-1b2bfa74fe4f', 'Prof. Kayleigh Gaylord', 'gutmann.efrain@hotmail.com', '$2y$10$00fFJxyi1oS9iSTDMgWKTuaC8Zq9rmo0FzSX3R/.F8Nd/QCa2EkgS', 'Apt. 618', '53897119', '57493023', NULL, NULL, 'en', NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', '', '', ''),
(105, '1980cad7-f0ae-3af3-820b-cc94b6e77fc3', 'Keely McLaughlin', 'predovic.anjali@yahoo.com', '$2y$10$8RhMtnEJe1weTXDvifWoLeLOqEtW2qtEtg78y9IcKgk8z7jl9h.c2', 'Apt. 631', '7590512', '50183120', NULL, NULL, 'en', NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', '', '', ''),
(106, '69eea803-fc77-3133-9c79-8477a94ffa55', 'Jennyfer Gulgowski', 'kledner@yahoo.com', '$2y$10$7X5bXMdDOBptXuZFwaMbcuiFWUVmNDV8oQv8VFmEkYZuWszTDF0nW', 'Suite 669', '34336302', '95210324', NULL, NULL, 'en', NULL, '2021-10-19 12:25:36', '2021-10-19 12:25:36', '', '', ''),
(107, '8e0f32a0-1072-361e-a4d8-dff131c067fb', 'Lucie Will III', 'theresa81@sanford.com', '$2y$10$BTov9NgBebx2/Smed9VjT.3NodeW7RDe/3u/szK.S3vkjOygxbsSC', 'Apt. 720', '70212994', '95012519', NULL, NULL, 'en', NULL, '2021-10-19 12:25:38', '2021-10-19 12:25:38', '', '', ''),
(108, '042d82aa-13df-396c-a197-c09b9bf3340a', 'Keyshawn Wuckert II', 'auer.chanelle@kemmer.org', '$2y$10$225PI.8Suru/4OELBLANMO.CDzRKns4fMln/BBJ2WRn2LehxnSAD2', 'Apt. 975', '2067956', '13657845', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(109, '9ecbc6d9-ccea-3f95-9b98-1aa71cfcd9c7', 'Miss Pansy Flatley DDS', 'skye.wiegand@langosh.info', '$2y$10$QnReb1cqNsMH6kT.mi4G0OnX7wh.2aMdRJXu9by9uhzFOTKLS02RS', 'Apt. 375', '25819811', '74485743', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(110, '8fda8d76-17a7-3e04-ba75-576a115f7888', 'Ariel Dibbert', 'enid.bernhard@oconnell.com', '$2y$10$RYYygOmUE4w/nEB6oPvOkuw5H5ydtT3WATqciVgMEuDsOoOhl9Uqi', 'Apt. 925', '12350451', '41027866', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(111, 'e0a0501b-17c2-3259-a58d-857e9d89b15b', 'Aniya Barton V', 'quitzon.triston@champlin.com', '$2y$10$69LzllioPI62wmKrjAu9degBvghP01Xf9ShWLsBZXfxZI/GHTNXKW', 'Apt. 083', '61172891', '39187552', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(112, '77eb476b-f608-34f7-9fb6-d88363f18626', 'Zoe Yost', 'ona43@rodriguez.org', '$2y$10$/ki7L5ntNEAehHB8hGLbMemJSpXnlPpDygH.wFeqjfxVojwk67M1W', 'Suite 889', '80450068', '5907348', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(113, '4e63dd9a-6218-30dd-b108-16c91c05a9bc', 'Flavio Marks', 'nona71@marquardt.com', '$2y$10$3R7lal8sV1xK089nTZLW6Ozh3Jqcvz7UL8qN88icJtzQsdI3J7Y.2', 'Suite 252', '97653378', '72499517', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(114, '893da1e2-45d9-3cea-88e4-daac564b3ec2', 'Weston Rolfson', 'eschamberger@bailey.info', '$2y$10$tF/5MaEWjK/HJJ5Cw1zmf.R3VQ/v6NpwcS3cFenJE3UhTJixfSgsa', 'Suite 753', '56437498', '63052428', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(115, 'da085d65-8b0b-3384-88cb-385d044995b2', 'Elian Johns', 'amelie.weimann@botsford.com', '$2y$10$okL8pFlPyIUEQhpoy.cRd..PCuIAiZOAoxgxsXd8MgjTBKjrinowO', 'Apt. 359', '38829426', '14261848', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(116, 'd40b7ca8-8798-3587-aa73-efb8f283219b', 'Yasmin Cormier', 'qfeil@cole.com', '$2y$10$IDWEFp0E5SzjkhmIqmH/hu.RzGR7qeU3DfWzVGNfgSzb1/uEEiBAW', 'Suite 020', '94009693', '45630985', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(117, '942dc447-86e1-3850-ab11-793081bedc73', 'Dr. Leila Bashirian', 'mohr.malinda@nikolaus.org', '$2y$10$JLGJAq2fq774jUwPyvk9jOTi4.Tk9mxEWTKnF/Rrv6.z0jlugCREW', 'Suite 298', '26532309', '70132468', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(118, '221f6779-124a-3f07-9ffc-f87e2ed5434e', 'Betty Lakin', 'torp.kristin@breitenberg.com', '$2y$10$JgepYav/6NucykTJPd6oz.v47oGWP0NvCMkpFfK8sJNdtyeFj/IQi', 'Suite 497', '6694654', '30503211', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(119, 'f8b5c812-29f2-3670-b13b-6d9f81b24068', 'Dr. Rowland Pouros', 'ureichel@nienow.com', '$2y$10$zClU6s.RYPO15LNmYpAP9uXiX8/8hnb90q6hHpHgT7tKYbwGBef0W', 'Suite 820', '37974506', '48495760', NULL, NULL, 'en', NULL, '2021-10-19 12:25:39', '2021-10-19 12:25:39', '', '', ''),
(120, '39086d0d-b9f4-36b7-b2d2-749fdb030c10', 'Wilfrid Herzog', 'schaden.pascale@walker.info', '$2y$10$074vDJNjle68J/Quk5Hks.6GCwQVFIakas3xWREzgCjkWuhIZN90W', 'Apt. 007', '48115401', '33867850', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(121, '7e991fcd-018d-333f-a8bf-392e45a1a30e', 'Chad Herzog', 'glover.lori@gmail.com', '$2y$10$txZHKGHZ9rfw8JTkizLBfOoefTXI6Qk4rsn9GNsXlDQWIBSN6fuP.', 'Apt. 230', '55295941', '21506105', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(122, '7cde906b-59b8-3958-9550-89473db9d524', 'Prof. Burnice Grant', 'adam36@gmail.com', '$2y$10$UodXW.X8vHMkS2CHT4/p5OapVnGS.K6RIsx863EXyKBB60FVu/el6', 'Apt. 244', '67351537', '14959577', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(123, '1098d3df-9b8f-3ff0-8b52-ff6247ab7140', 'Sincere Hintz V', 'schimmel.jasen@gmail.com', '$2y$10$fCAuNBGYWplfoR9VuV6pzOaQ1rEHUp/ilukLH91lFBfeFy/iB/8em', 'Suite 026', '20249794', '29050602', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(124, '92bb35f9-9d56-3791-8629-eb68bc718dec', 'Rigoberto Feest', 'dana46@hotmail.com', '$2y$10$5beDSZ/044zXfIgAAz357ebw7w3JmkAFoRqt4qV7vxZ1ntFKslIoe', 'Suite 842', '92600159', '44798112', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(125, '0ee2c713-36fb-3ca7-bd76-f4120b944027', 'Allan Hudson', 'amurphy@konopelski.net', '$2y$10$fvSTruLA3qaEAgwbJWOkA.SrLAumAIpkeDfhLvhnLQsGjQr5j8aoW', 'Suite 813', '91999030', '6777206', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(126, 'bdf362b8-e7e6-35ee-93e8-aeaf90174616', 'Evan Steuber DVM', 'wilkinson.madisyn@hotmail.com', '$2y$10$XL9rKmOwUnH9XenOigYH2uFEyOs3mciBJJv3qB5TuKbYgtwpopDOS', 'Apt. 681', '94267260', '26794859', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(127, 'a8a92d23-2453-34df-8146-b46d02f0906d', 'Enola Beer', 'cummings.brielle@gaylord.com', '$2y$10$wI1TFJHp6Es2K9hPJ7chn.h6HjC9YC5c3kCfNXP8rijGheEI0FHmm', 'Suite 563', '52064497', '56146817', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(128, '48dba3b7-73e0-32df-bbf8-adf7340e2718', 'Dan Price', 'tyra.rice@gmail.com', '$2y$10$Ijpaxkwl6nnWegpB1nBMMuzSOHtsobu1seFUsd/T57zb0N6E0zOue', 'Apt. 883', '602326', '91489454', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(129, '77f25479-74dd-306a-8574-be13cc750990', 'Elian Fisher', 'heichmann@green.com', '$2y$10$pJpTVe9aPVxl9N9XNquIAOXMCtj2n5FVDjTKh6iOMxtFFqJx6100S', 'Suite 150', '98345037', '18910896', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(130, 'cfe6dd3a-b37b-3d9e-88a2-831c243f3262', 'Jairo Gutkowski', 'mlehner@yahoo.com', '$2y$10$tXYV21gESuAaTDNJMqCXg./p2HKVPXIsi3ytxdFjrT.El6CjuWhHW', 'Apt. 982', '3667565', '49624713', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(131, '8c1f4a17-be9e-36b7-a3b7-7e2e460f21f9', 'Kameron Rath', 'hskiles@hotmail.com', '$2y$10$OJSaYJv/E.JWDf/GbCRN4.7YcUW.XD.Vmw1CVc74wUSjfLD4cRQ4W', 'Suite 384', '39060992', '59431387', NULL, NULL, 'en', NULL, '2021-10-19 12:25:40', '2021-10-19 12:25:40', '', '', ''),
(132, '19ce1be0-33d0-36d8-8a19-37a45a79b245', 'Mr. Emmett Streich', 'cstamm@yahoo.com', '$2y$10$4pyDvanUkWPlgiD7/2.5o.pwois0cMZWmKw0gG.4WACdQYizjBXLa', 'Suite 684', '92341002', '23473004', NULL, NULL, 'en', NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', '', '', ''),
(133, '9438fa65-9dde-3e24-ace0-b05e66b2e129', 'Elsa McCullough Jr.', 'destinee71@ondricka.com', '$2y$10$reEkG0vczZnM6VCM/TkefOb.LSVcs3jVuN0VqR.Wnm7oFk3YcI8py', 'Suite 745', '52811264', '9684515', NULL, NULL, 'en', NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', '', '', ''),
(134, '585bc0db-aa78-33c3-8e45-f45d3f59ee75', 'Luigi Gleason', 'marcella.rowe@ullrich.com', '$2y$10$wBoEfi0lrKDk9/nFLkIaU.p3y3qh3jMypfsTlUMXemmCaBiH/RsZe', 'Suite 855', '97663257', '19080657', NULL, NULL, 'en', NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', '', '', ''),
(135, '0ac2e311-e70c-38f7-94b8-46942ff04391', 'Ettie Bayer Jr.', 'rosella.lesch@gmail.com', '$2y$10$RFZUnPykbtbpIImKF.pTD.X.7oA84gNO3codyrCHQmWyjRrhR.Lzm', 'Suite 314', '18411789', '23443013', NULL, NULL, 'en', NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', '', '', ''),
(136, '20002cec-a92a-37d6-9ae5-bc40064ccbd2', 'Gerhard Cremin DVM', 'kohler.wyatt@hand.com', '$2y$10$TCK.qoTHD46KZ7kQf4ulhOOrcZ9WjPCJTCNaFYi2ieGAB6G7/SdMm', 'Suite 539', '34576003', '21544548', NULL, NULL, 'en', NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', '', '', ''),
(137, '211c4688-715f-3960-84bf-5371b83629f4', 'Ms. Izabella Deckow', 'isai00@yahoo.com', '$2y$10$8PAuwHOjUdcUXLzL5nI.QO.bo9zOY0jj6bvqZgwdsoIxISjNi0ale', 'Apt. 578', '87645900', '25100501', NULL, NULL, 'en', NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', '', '', ''),
(138, 'c340e467-1310-31ae-9418-bf5c5b00ad99', 'Keon Gaylord', 'breanna50@hotmail.com', '$2y$10$swb2xT1TzhCaU1dsNn9VBucjSI6F7IsX3cLJp84tK0/wUNHu/F6Ku', 'Apt. 562', '7439840', '1760462', NULL, NULL, 'en', NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', '', '', ''),
(139, '7f19da49-1696-35bf-a861-5ce6cba8f6f0', 'Alicia Kuhic', 'meghan.torp@yahoo.com', '$2y$10$CJE5Fxi8ul/voy/H5lkXruG9bBxj5C3E11TiCxsaqjQPUzguMasyu', 'Suite 305', '87364037', '86996064', NULL, NULL, 'en', NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', '', '', ''),
(140, 'fe6e8565-3f0d-344d-8cea-ca2d93879528', 'Brandyn Funk', 'clementina32@hotmail.com', '$2y$10$7NsqGxcIsJphQoyl0onxIOnCLQlfvLnj0Rp3wIu0pm1WPNIAl7P8q', 'Suite 959', '4207755', '97116285', NULL, NULL, 'en', NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', '', '', ''),
(141, 'bab6ab76-2daa-342c-9c32-0d6be31855b1', 'Haylee Fadel MD', 'beatty.jodie@gmail.com', '$2y$10$Iu9tYAjh92tcBHAUpv7/ee.JRHsndVKYYgg0aVanIV55I38loBc2m', 'Suite 023', '35171942', '58487797', NULL, NULL, 'en', NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', '', '', ''),
(142, 'e53533c0-00a0-3ed7-88be-efd35bf7a319', 'Alexie Mitchell Jr.', 'gmcdermott@hotmail.com', '$2y$10$00fYGDyo0zM/RtUX2zH4AuKRGjMZUKWjZVsAFMYn8L303diL9uO.K', 'Suite 386', '90820996', '4187662', NULL, NULL, 'en', NULL, '2021-10-19 12:25:41', '2021-10-19 12:25:41', '', '', ''),
(143, 'c948be34-1883-35bc-9208-59d4e7444bf5', 'Iliana Kihn', 'minerva.grant@stracke.net', '$2y$10$oAojJy7y9xlLHSRrMHLa/uhlQDzDTXFSuLlHZSYXN0zgH2JMdHBEi', 'Suite 307', '63940922', '96296753', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(144, '664fcd6c-b5be-36df-b7e9-937042e9c616', 'Tyree Kuphal DDS', 'deshaun.schaden@graham.com', '$2y$10$pkxd5I9XgbS9G9WsoCVGz.DteF5qyGqjE8.i8b0ANIqdR7OaQqcdS', 'Suite 068', '12685096', '38931493', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(145, 'b4c168c4-b534-3e57-bad1-67916af0eb00', 'Prof. Dakota Crooks', 'lwolff@murray.biz', '$2y$10$gaSEzBN4mpYZf.CghJfJ6O5.D44g3Qe9BZTtDgN9.8V189L8bYe3K', 'Suite 132', '67801726', '8188734', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(146, '386547e1-024c-3aee-896c-b712b2c5eadb', 'Michelle Littel', 'reagan.konopelski@hotmail.com', '$2y$10$mah5mi5FwqmnAy2adReugO8ekeCFWtqy5mgNC87Spt9JkCbExulDi', 'Suite 150', '82894902', '94817784', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(147, 'bd39a18d-5340-3487-9849-aa85a7f8d50d', 'Vincenza Murazik', 'oreilly@gmail.com', '$2y$10$1Of8wy3G8CrhpjsttggsxeOaRy7V9MPZLTEQr56QzrC7fL7yzUmPm', 'Suite 715', '80130434', '19195297', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(148, '1449fb1c-b46c-34cf-b0f1-404fa93b9e15', 'Prof. Vidal Rippin', 'gertrude63@gmail.com', '$2y$10$k3JoweQviuV5rX/sKfc3bOMLpDtZOotEq0zbaUK0oWQMVYarkZZVu', 'Suite 492', '18121576', '84124481', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(149, '9d43cdde-d808-3cbc-95ea-d066223f6cc5', 'Miss Myah Kirlin I', 'anastasia.von@rowe.info', '$2y$10$YuirE46TxV9Xx/yz3pmkX.oDt8H2rRr4WS7c6zjMouf1mq4ykAA3.', 'Suite 716', '85573354', '71761250', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(150, '7b242978-8b68-3e73-aeeb-23100e1503c1', 'Tomasa Blick MD', 'fahey.myriam@barrows.com', '$2y$10$ZmEclHLBt/X8ni0t/vSFBu/QWrPVc4P3qScX/lEPUieDIAHiwelwm', 'Suite 811', '46531840', '98896787', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(151, '9993e051-8ba4-398d-b93f-ee8ddb7024a8', 'Tamia Krajcik', 'ocie.rogahn@daniel.com', '$2y$10$qGe0Itai1.Aa1PDlqbOYkOZi8/vXwx6eo5vnpszPzmrTlX3xSj6p6', 'Apt. 827', '84641042', '63691524', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(152, '897a8cfd-7e5b-3a3c-9f1a-f28a90bb31e4', 'Virgie Schuster', 'uhackett@yahoo.com', '$2y$10$jROE6OudDeGIPFypikAp1u8bf4ZSePKq0.2fKhVs0MH5cM.5LHDKe', 'Suite 231', '32938835', '63109401', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(153, 'ca233803-93c0-378e-ad3b-6ee1054b71b1', 'Dr. Darion Thompson', 'lacey91@yahoo.com', '$2y$10$scKOkeNqLx8.GsGB7suGguAuoNw/ppgIt3Xr0qs2YiTuMt6b7iCCC', 'Suite 489', '24600425', '23924259', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(154, 'e4786deb-a418-3825-9e96-cffcee4387e2', 'Leland Boyle DVM', 'william.durgan@hotmail.com', '$2y$10$x29iiVXyX.QnC9ezFBZ1DeChaqD69rJHIRXwouaXkvcRyewy9BV5i', 'Suite 225', '42325496', '95282812', NULL, NULL, 'en', NULL, '2021-10-19 12:25:42', '2021-10-19 12:25:42', '', '', ''),
(155, 'c60cae61-dcf5-3877-a3a8-bc671a20f2ed', 'Mr. Kyle Bechtelar IV', 'medhurst.merl@thiel.info', '$2y$10$PtCzFGZTtAQSJuv7PzDGE.1cuoP8aYZVMbpKcjK58JqW6LxUJhBK.', 'Suite 740', '45158593', '64913919', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', ''),
(156, '0ff60507-558c-3bb5-a126-4da80562dc8b', 'Cielo Eichmann', 'oberbrunner.sister@yahoo.com', '$2y$10$ScShQr8if0AENO3CQBFVHuKmPvtbuCmq8G6tQJLEqLj.pKXcGc3O2', 'Apt. 783', '69177474', '60365740', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', ''),
(157, 'a74961f6-dc64-35bb-af82-4e8a315c6dad', 'Miss Gertrude Wintheiser PhD', 'vmclaughlin@ankunding.org', '$2y$10$b55piF5p7nsTVNtLiWUJ0unLubt17SrYlYgHYlLk4ZL64sOX4G9Ge', 'Apt. 437', '75990689', '59444995', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', ''),
(158, '80ae3b9d-43df-370e-bd3c-807c8c1408ac', 'Prof. Eleonore Kerluke I', 'ruecker.sebastian@hotmail.com', '$2y$10$T6fWWVEXp8oqE60XBnSGieeswfsbH1eUeXik9qPX6tJzM79DRQ1Cu', 'Suite 198', '97748423', '3888559', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', ''),
(159, '2fb33de5-a07a-3be9-825c-7bd499415274', 'Verona Gutkowski', 'melba.steuber@goldner.net', '$2y$10$XloSdB6T7SKnfkrREa7Sbe.IF9kPacK.SpibzXQPJWOC.nPBtJCqm', 'Suite 090', '63487596', '784199', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', ''),
(160, '5aaf2409-db02-3025-8d58-e9ab8a81fe21', 'Elias Halvorson', 'agnes.lynch@gmail.com', '$2y$10$a.feHM4zHqCTCYwmQJWVf./0bPxOr6w.c73U9GfF3v5UH1oxdytpu', 'Apt. 215', '91080288', '76300376', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', ''),
(161, 'a48c65a9-a4b6-3ed4-87c1-b32bfe9b9e62', 'Peyton Brown', 'sim.beier@kulas.com', '$2y$10$Acpdjq2A5lAfBFpspNCtserdXBHfTmEuEHkgVNMYy17RTVtFFDamG', 'Suite 652', '50782357', '67051833', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', ''),
(162, '27e1bc1b-084f-3f8a-8384-3dd00d869861', 'Morgan Leffler IV', 'yprosacco@hotmail.com', '$2y$10$mJHpr6Gvn9r4VttEaJPTqOsn4LU.p3BT8XXhDuDOFPlFpeQB/CeBi', 'Apt. 319', '62003926', '63447512', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', ''),
(163, 'c1e2a1ef-ab99-3ba7-b11d-616bef19875b', 'Noemie Schaden', 'zschinner@hintz.biz', '$2y$10$E2ogYq5oXLbHr/.6JbYeMeYJ11qm5kiSq32EaQWnbhNGSKL.7rJ.y', 'Suite 353', '39303289', '20469707', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', ''),
(164, '939b5dd3-3c8f-363f-9cff-1a42ed1ced39', 'Aiyana Hammes', 'justus36@yahoo.com', '$2y$10$OuLe6RzVNa5EsSMO.gU6rO1ZRlf0w9uwLJBgNT3v4OH0oNyVyG.Qi', 'Apt. 046', '95315616', '47423922', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', ''),
(165, 'c5a10b82-aa42-3739-8691-a8d61af92a17', 'Carley Gleichner', 'padberg.jaylan@runolfsdottir.com', '$2y$10$xrJgoRq8UNp05OK/XgO4we3NXBgunx6eT3AsBdoDm0SQlzQ9xLqUC', 'Suite 841', '28713204', '44168348', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', ''),
(166, '62e53555-9ea7-3344-b29d-b86fed6aec73', 'Ludwig Berge', 'tyrel.krajcik@hotmail.com', '$2y$10$taAJrntnmQMYyp7qLhSBBeWB45f8gcUvsSsUVE9Vo4CSVfq2iinyS', 'Suite 273', '96750854', '45805933', NULL, NULL, 'en', NULL, '2021-10-19 12:25:43', '2021-10-19 12:25:43', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_documents`
--

CREATE TABLE `user_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absences_user_id_foreign` (`user_id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_source_type_source_id_index` (`source_type`,`source_id`),
  ADD KEY `appointments_user_id_foreign` (`user_id`),
  ADD KEY `appointments_client_id_foreign` (`client_id`);

--
-- Indexes for table `business_hours`
--
ALTER TABLE `business_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_hours_settings_id_foreign` (`settings_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_user_id_foreign` (`user_id`),
  ADD KEY `clients_industry_id_foreign` (`industry_id`),
  ADD KEY `clients_status_id_index` (`status_id`);

--
-- Indexes for table `client_visits`
--
ALTER TABLE `client_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_source_type_source_id_index` (`source_type`,`source_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_client_id_foreign` (`client_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department_user`
--
ALTER TABLE `department_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_user_department_id_foreign` (`department_id`),
  ADD KEY `department_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_source_type_source_id_index` (`source_type`,`source_id`);

--
-- Indexes for table `industries`
--
ALTER TABLE `industries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `integrations`
--
ALTER TABLE `integrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_client_id_foreign` (`client_id`),
  ADD KEY `invoices_source_type_source_id_index` (`source_type`,`source_id`),
  ADD KEY `invoices_offer_id_foreign` (`offer_id`);

--
-- Indexes for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_lines_offer_id_foreign` (`offer_id`),
  ADD KEY `invoice_lines_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_status_id_foreign` (`status_id`),
  ADD KEY `leads_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `leads_client_id_foreign` (`client_id`),
  ADD KEY `leads_user_created_id_foreign` (`user_created_id`),
  ADD KEY `leads_qualified_index` (`qualified`);

--
-- Indexes for table `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mails_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offers_source_type_source_id_index` (`source_type`,`source_id`),
  ADD KEY `offers_client_id_foreign` (`client_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_integration_type_integration_id_index` (`integration_type`,`integration_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_status_id_foreign` (`status_id`),
  ADD KEY `projects_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `projects_user_created_id_foreign` (`user_created_id`),
  ADD KEY `projects_client_id_foreign` (`client_id`),
  ADD KEY `projects_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sample_data`
--
ALTER TABLE `sample_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_ins`
--
ALTER TABLE `stock_ins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_outs`
--
ALTER TABLE `stock_outs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_status_id_foreign` (`status_id`),
  ADD KEY `tasks_user_assigned_id_foreign` (`user_assigned_id`),
  ADD KEY `tasks_user_created_id_foreign` (`user_created_id`),
  ADD KEY `tasks_client_id_foreign` (`client_id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_documents`
--
ALTER TABLE `user_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_documents_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absences`
--
ALTER TABLE `absences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_hours`
--
ALTER TABLE `business_hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `client_visits`
--
ALTER TABLE `client_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department_user`
--
ALTER TABLE `department_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `industries`
--
ALTER TABLE `industries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `integrations`
--
ALTER TABLE `integrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `mails`
--
ALTER TABLE `mails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sample_data`
--
ALTER TABLE `sample_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `stock_ins`
--
ALTER TABLE `stock_ins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stock_outs`
--
ALTER TABLE `stock_outs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `user_documents`
--
ALTER TABLE `user_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `business_hours`
--
ALTER TABLE `business_hours`
  ADD CONSTRAINT `business_hours_settings_id_foreign` FOREIGN KEY (`settings_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_industry_id_foreign` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`id`),
  ADD CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `department_user`
--
ALTER TABLE `department_user`
  ADD CONSTRAINT `department_user_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `department_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD CONSTRAINT `invoice_lines_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_lines_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leads_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `leads_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `leads_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `mails`
--
ALTER TABLE `mails`
  ADD CONSTRAINT `mails_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `projects_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `projects_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `projects_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `tasks_user_assigned_id_foreign` FOREIGN KEY (`user_assigned_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_user_created_id_foreign` FOREIGN KEY (`user_created_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
