-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 20 oct. 2026 à 08:43
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `aem_database`
--

-- --------------------------------------------------------

--
-- Structure de la table `aem_account`
--

CREATE TABLE `aem_account` (
  `aem_id_account` int(11) NOT NULL,
  `aem_account_name` varchar(100) NOT NULL,
  `aem_account_holder` varchar(100) DEFAULT NULL,
  `aem_account_number` varchar(50) DEFAULT NULL,
  `aem_account_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `aem_account`
--

INSERT INTO `aem_account` (`aem_id_account`, `aem_account_name`, `aem_account_holder`, `aem_account_number`, `aem_account_active`) VALUES
(1, 'MVOLA', 'Tonton Mamy', '+261 34 70 840 46', 1),
(2, 'MVOLA', 'Graciana', '0342837814', 1),
(3, 'PAPI', 'AEM', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `aem_activity`
--

CREATE TABLE `aem_activity` (
  `aem_id_activity` int(10) UNSIGNED NOT NULL,
  `aem_title` varchar(150) NOT NULL,
  `aem_type` varchar(20) NOT NULL DEFAULT 'don',
  `aem_category` varchar(100) DEFAULT NULL,
  `aem_date` date DEFAULT NULL,
  `aem_description` text DEFAULT NULL,
  `aem_beneficiaries` varchar(150) DEFAULT NULL,
  `aem_location` varchar(150) DEFAULT NULL,
  `aem_goal` int(11) DEFAULT NULL,
  `aem_show_progress` tinyint(1) NOT NULL DEFAULT 0,
  `aem_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aem_activity`
--

INSERT INTO `aem_activity` (`aem_id_activity`, `aem_title`, `aem_type`, `aem_category`, `aem_date`, `aem_description`, `aem_beneficiaries`, `aem_location`, `aem_goal`, `aem_show_progress`, `aem_active`, `created_at`) VALUES
(1, 'Soutien à l\'association AES — enfants en situation de handicap', 'don', NULL, NULL, 'L\'AEM soutient l\'association AES, qui accompagne au quotidien des enfants en situation de handicap. Votre don aide à financer matériel, soins et scolarité.', NULL, NULL, NULL, 0, 1, '2026-10-18 11:11:57');

-- --------------------------------------------------------

--
-- Structure de la table `aem_activity_image`
--

CREATE TABLE `aem_activity_image` (
  `aem_id_image` int(10) UNSIGNED NOT NULL,
  `aem_id_activity` int(10) UNSIGNED NOT NULL,
  `aem_path` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aem_activity_image`
--

INSERT INTO `aem_activity_image` (`aem_id_image`, `aem_id_activity`, `aem_path`, `created_at`) VALUES
(1, 1, 'assets/images/activity_6ad4b146465c4.jpeg', '2026-10-18 11:45:10');

-- --------------------------------------------------------

--
-- Structure de la table `aem_admin`
--

CREATE TABLE `aem_admin` (
  `aem_id_admin` int(11) NOT NULL,
  `aem_id_user` int(11) NOT NULL,
  `aem_role` varchar(50) NOT NULL,
  `aem_suspended` tinyint(1) NOT NULL DEFAULT 0,
  `added_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_admin`
--

INSERT INTO `aem_admin` (`aem_id_admin`, `aem_id_user`, `aem_role`, `aem_suspended`, `added_at`) VALUES
(1, 15, 'admin', 0, '2025-11-11 14:37:29'),
(2, 58, 'admin', 0, '2026-02-09 12:03:11'),
(3, 66, 'admin', 0, '2026-06-22 06:19:37'),
(4, 110, 'comptable', 0, '2026-06-23 15:23:23'),
(5, 116, 'comptable', 0, '2026-06-23 17:09:28'),
(6, 163, 'Super Admin', 0, '2026-10-19 11:36:01');

-- --------------------------------------------------------

--
-- Structure de la table `aem_admin_log`
--

CREATE TABLE `aem_admin_log` (
  `id` int(11) NOT NULL,
  `aem_id_user` int(11) NOT NULL,
  `action` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `aem_admin_log`
--

INSERT INTO `aem_admin_log` (`id`, `aem_id_user`, `action`, `description`, `ip`, `created_at`) VALUES
(1, 15, 'Connexion', NULL, '102.17.119.80', '2026-06-21 16:42:29'),
(2, 15, 'Connexion', NULL, '102.17.119.80', '2026-06-21 17:20:08'),
(3, 15, 'Modification membre', 'FARAMALALA Fiononantsoa Adrienne (AEM062)', '102.17.119.80', '2026-06-21 17:24:10'),
(4, 15, 'Connexion', NULL, '102.17.119.80', '2026-06-21 17:33:04'),
(5, 15, 'Connexion', NULL, '197.149.11.126', '2026-06-22 06:18:50'),
(6, 15, 'Ajout administrateur', NULL, '197.149.11.126', '2026-06-22 06:19:37'),
(7, 15, 'Connexion', NULL, '197.149.11.126', '2026-06-22 06:30:04'),
(8, 66, 'Connexion', NULL, '129.222.109.74', '2026-06-22 06:32:34'),
(9, 66, 'Connexion', NULL, '129.222.109.74', '2026-06-22 06:35:48'),
(10, 66, 'Enregistrement présence', NULL, '129.222.109.74', '2026-06-22 06:47:54'),
(11, 66, 'Validation membre', NULL, '129.222.109.74', '2026-06-22 13:55:41'),
(12, 66, 'Validation membre', NULL, '129.222.109.74', '2026-06-22 14:06:31'),
(13, 66, 'Validation membre', NULL, '129.222.109.74', '2026-06-22 14:07:54'),
(14, 66, 'Validation membre', NULL, '129.222.109.74', '2026-06-22 14:08:13'),
(15, 66, 'Validation membre', NULL, '129.222.109.74', '2026-06-22 14:24:04'),
(16, 15, 'Connexion', NULL, '102.18.162.144', '2026-06-23 03:43:19'),
(17, 15, 'Validation membre', 'MAMIHARISON Danito Lartin', '102.18.162.144', '2026-06-23 03:44:42'),
(18, 15, 'Validation membre', 'RAKOTONJANAHARY Nandrianintsoa Onja', '102.18.162.144', '2026-06-23 03:44:58'),
(19, 15, 'Validation membre', 'RANDRIANIRINA Tommy Allan', '102.18.162.144', '2026-06-23 03:45:11'),
(20, 66, 'Validation membre', NULL, '129.222.109.74', '2026-06-23 07:35:07'),
(21, 66, 'Validation membre', NULL, '129.222.109.74', '2026-06-23 07:35:29'),
(22, 66, 'Modification membre', NULL, '129.222.109.74', '2026-06-23 07:36:39'),
(23, 66, 'Modification membre', NULL, '129.222.109.74', '2026-06-23 07:36:46'),
(24, 66, 'Modification membre', NULL, '129.222.109.74', '2026-06-23 07:36:56'),
(25, 66, 'Validation membre', NULL, '129.222.109.74', '2026-06-23 07:37:21'),
(26, 66, 'Validation membre', NULL, '129.222.109.74', '2026-06-23 10:32:09'),
(27, 15, 'Connexion', NULL, '102.17.119.40', '2026-06-23 15:11:24'),
(28, 15, 'Ajout administrateur', NULL, '102.17.119.40', '2026-06-23 15:23:23'),
(29, 15, 'Modification membre', 'FOMAHAZOMARINA Sophoniel (AEM115)', '102.17.119.40', '2026-06-23 15:24:52'),
(30, 15, 'Modification membre', 'RAKOTONJANAHARY Nandrianintsoa Onja (AEM111)', '102.17.119.40', '2026-06-23 15:25:20'),
(31, 15, 'Modification membre', 'ANDRIAMPANANA Tanteliniaina (AEM023)', '102.17.119.143', '2026-06-23 15:55:28'),
(32, 15, 'Modification membre', 'RAZAFIMANDIMBY Josoa (AEM015)', '102.17.119.143', '2026-06-23 16:08:38'),
(33, 15, 'Connexion', NULL, '102.17.119.143', '2026-06-23 16:39:25'),
(34, 15, 'Validation membre', 'Josoa Compte test', '102.17.119.143', '2026-06-23 16:41:40'),
(35, 110, 'Connexion', NULL, '129.222.109.102', '2026-06-23 17:02:08'),
(36, 15, 'Connexion', NULL, '102.17.119.143', '2026-06-23 17:08:10'),
(37, 15, 'Connexion', NULL, '102.17.119.143', '2026-06-23 17:08:10'),
(38, 15, 'Ajout administrateur', NULL, '102.17.119.143', '2026-06-23 17:09:28'),
(39, 116, 'Connexion', NULL, '102.17.119.143', '2026-06-23 17:13:17'),
(40, 110, 'Connexion', NULL, '102.18.162.196', '2026-06-23 17:16:00'),
(41, 116, 'Validation membre', NULL, '102.17.119.143', '2026-06-23 17:20:44'),
(42, 15, 'Validation membre', 'FOMAHAZOMARINA Sophoniel', '102.17.119.143', '2026-06-23 17:22:43'),
(43, 15, 'Validation membre', 'HANITRINIAINA Marie Lollyta', '102.17.119.143', '2026-06-23 17:23:00'),
(44, 15, 'Connexion', NULL, '102.17.120.208', '2026-06-24 16:39:25'),
(45, 15, 'Déconnexion', NULL, '102.17.120.208', '2026-06-24 17:05:56'),
(46, 15, 'Connexion', NULL, '102.17.120.208', '2026-06-24 17:06:23'),
(47, 15, 'Connexion', NULL, '102.18.162.15', '2026-06-24 17:21:58'),
(48, 15, 'Connexion', NULL, '102.17.120.234', '2026-06-27 16:50:26'),
(49, 15, 'Visite boîte à idées', NULL, '102.17.120.234', '2026-06-27 16:50:29'),
(50, 15, 'Connexion', NULL, '102.17.120.84', '2026-06-29 16:16:34'),
(51, 66, 'Connexion', NULL, '129.222.109.133', '2026-07-01 09:06:18'),
(52, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (21 mois × 5000 Ar)', '129.222.109.133', '2026-07-01 09:32:10'),
(53, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-01 09:42:46'),
(54, 15, 'Modification administrateur', NULL, '197.149.11.126', '2026-07-01 09:43:19'),
(55, 15, 'Modification administrateur', NULL, '197.149.11.126', '2026-07-01 09:43:28'),
(56, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-01 09:43:49'),
(57, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-01 09:59:48'),
(58, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-01 09:59:50'),
(59, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-01 09:59:53'),
(60, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-01 10:16:53'),
(61, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-01 10:18:30'),
(62, 15, 'Ajout compte financier', 'Compte « MVOLA » ajouté', '197.149.11.126', '2026-07-01 10:18:52'),
(63, 15, 'Validation membre', 'MAMINIRINA Francia', '197.149.11.126', '2026-07-01 10:19:51'),
(64, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-01 10:31:08'),
(65, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-01 10:31:55'),
(66, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-01 10:31:58'),
(67, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-01 10:38:09'),
(68, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-01 10:38:11'),
(69, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-01 10:38:27'),
(70, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-01 10:40:33'),
(71, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-01 10:44:55'),
(72, 15, 'Validation membre', 'RAVANOSON Tsaraboaka', '197.149.11.126', '2026-07-01 10:45:07'),
(73, 15, 'Connexion', NULL, '102.17.119.134', '2026-07-01 11:00:44'),
(74, 66, 'Connexion', NULL, '129.222.109.133', '2026-07-01 11:04:55'),
(75, 66, 'Connexion', NULL, '129.222.109.133', '2026-07-01 11:05:37'),
(76, 66, 'Modification membre', 'RAHARIMAHASOA Maria Lalatiana (AEM051)', '129.222.109.133', '2026-07-01 11:09:59'),
(77, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-01 11:10:46'),
(78, 66, 'Ajout mouvement financier', NULL, '129.222.109.133', '2026-07-01 11:17:18'),
(79, 66, 'Ajout mouvement financier', NULL, '129.222.109.133', '2026-07-01 11:18:10'),
(80, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-01 11:35:31'),
(81, 66, 'Modification membre', 'Hanitriniaina Sara (AEM066)', '129.222.109.133', '2026-07-01 11:42:10'),
(82, 66, 'Modification membre', 'RANDRIAMIARIAMBOLA anjara (AEM119)', '129.222.109.133', '2026-07-01 12:34:02'),
(83, 66, 'Validation membre', 'RANDRIAMIARIAMBOLA anjara', '129.222.109.133', '2026-07-01 12:34:10'),
(84, 66, 'Visite boîte à idées', NULL, '129.222.109.133', '2026-07-01 12:36:37'),
(85, 66, 'Visite boîte à idées', NULL, '129.222.109.133', '2026-07-01 12:36:56'),
(86, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-01 12:52:48'),
(87, 15, 'Visite boîte à idées', NULL, '41.74.208.67', '2026-07-01 17:15:54'),
(88, 15, 'Connexion', NULL, '41.74.208.67', '2026-07-01 17:20:09'),
(89, 15, 'Validation membre', 'Ramanatsoa Herylala', '41.74.208.67', '2026-07-01 17:22:38'),
(90, 15, 'Validation membre', 'Jeram Jeram', '41.74.208.67', '2026-07-01 17:23:15'),
(91, 15, 'Visite boîte à idées', NULL, '41.74.208.67', '2026-07-01 17:23:21'),
(92, 15, 'Connexion', NULL, '41.74.208.67', '2026-07-01 18:43:52'),
(93, 15, 'Validation membre', 'Yamicole Wendynesyndiana', '41.74.208.67', '2026-07-01 18:44:13'),
(94, 15, 'Validation membre', 'RANDRIAMAHEFA Vonjiniaina Faniry José', '41.74.208.67', '2026-07-01 18:44:28'),
(95, 15, 'Visite boîte à idées', NULL, '41.74.208.67', '2026-07-01 18:44:31'),
(96, 15, 'Visite boîte à idées', NULL, '41.74.208.67', '2026-07-01 19:05:07'),
(97, 15, 'Connexion', NULL, '41.74.208.67', '2026-07-01 19:10:49'),
(98, 15, 'Visite boîte à idées', NULL, '41.74.208.67', '2026-07-01 19:10:57'),
(99, 15, 'Visite boîte à idées', NULL, '41.74.208.67', '2026-07-01 19:11:09'),
(100, 15, 'Visite boîte à idées', NULL, '41.74.208.67', '2026-07-01 19:11:34'),
(101, 15, 'Connexion', NULL, '41.74.208.67', '2026-07-01 19:27:34'),
(102, 15, 'Validation membre', 'RAVELOARINTSOA Mirana Eva', '41.74.208.67', '2026-07-01 19:28:12'),
(103, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-02 05:12:05'),
(104, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-02 05:12:24'),
(105, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-02 06:35:48'),
(106, 15, 'Validation membre', 'RAHARIMILAMANANA Eric Nantenaina', '197.149.11.126', '2026-07-02 06:36:13'),
(107, 15, 'Déconnexion', NULL, '197.149.11.126', '2026-07-02 06:36:18'),
(108, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-02 06:41:50'),
(109, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-02 08:29:45'),
(110, 15, 'Validation membre', 'Marsonfrederic TSANGANASY', '197.149.11.126', '2026-07-02 08:29:57'),
(111, 15, 'Enregistrement cotisation', 'Enregistrement cotisation (2 mois × 5000 Ar)', '197.149.11.126', '2026-07-02 08:31:08'),
(112, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-02 08:38:27'),
(113, 15, 'Validation membre', 'RANDRIAMIANDRA Zolinirina Miharisoa Hasinarivo', '197.149.11.126', '2026-07-02 08:54:21'),
(114, 15, 'Validation membre', 'RATEFINANAHARY Santatriniaina', '197.149.11.126', '2026-07-02 09:34:34'),
(115, 66, 'Connexion', NULL, '129.222.109.236', '2026-07-02 09:53:11'),
(116, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-02 10:00:03'),
(117, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (3 mois × 5000 Ar)', '129.222.109.236', '2026-07-02 11:09:04'),
(118, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (2 mois × 5000 Ar)', '129.222.109.236', '2026-07-02 11:22:12'),
(119, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '129.222.109.236', '2026-07-02 11:28:22'),
(120, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-02 11:38:47'),
(121, 15, 'Modification membre', 'HANITRINIAINA Marie Lollyta (AEM112)', '41.74.210.232', '2026-07-02 17:10:17'),
(122, 15, 'Connexion', NULL, '41.74.210.232', '2026-07-02 17:36:40'),
(123, 15, 'Validation membre', 'RASOLONIAINA Mami Derysson', '41.74.210.232', '2026-07-02 17:36:57'),
(124, 15, 'Connexion', NULL, '41.74.210.232', '2026-07-02 17:58:25'),
(125, 15, 'Connexion', NULL, '41.74.210.232', '2026-07-02 18:00:47'),
(126, 15, 'Enregistrement cotisation', 'Enregistrement cotisation (2 mois × 5000 Ar)', '41.74.210.232', '2026-07-02 18:02:00'),
(127, 15, 'Connexion', NULL, '41.74.210.232', '2026-07-03 04:22:04'),
(128, 15, 'Connexion', NULL, '102.18.160.77', '2026-07-03 09:54:02'),
(129, 15, 'Connexion', NULL, '154.120.181.76', '2026-07-04 07:33:45'),
(130, 15, 'Validation membre', 'RANDRIAMIFIDIARIVONY  Irina Martial', '41.74.208.236', '2026-07-05 15:56:53'),
(131, 15, 'Déconnexion', NULL, '41.74.208.236', '2026-07-05 15:57:33'),
(132, 15, 'Connexion', NULL, '41.74.208.236', '2026-07-05 16:02:06'),
(133, 15, 'Validation membre', 'RASOAMIARAMANANA Andry Lalaina Michel', '197.149.11.126', '2026-07-06 12:06:07'),
(134, 15, 'Validation membre', 'DJAOMAHERY Francis', '197.149.11.126', '2026-07-06 12:06:26'),
(135, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-06 12:13:59'),
(136, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-07-06 12:14:04'),
(137, 15, 'Connexion', NULL, '41.74.208.236', '2026-07-06 15:42:15'),
(138, 15, 'Visite boîte à idées', NULL, '41.74.208.236', '2026-07-06 16:00:26'),
(139, 15, 'Ajout événement', 'Réunion', '41.74.208.236', '2026-07-06 16:33:01'),
(140, 15, 'Validation membre', 'Razafinirina  Patricia Edine', '197.149.11.126', '2026-07-07 05:09:31'),
(141, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-09 08:24:12'),
(142, 15, 'Enregistrement cotisation', 'Enregistrement cotisation (32 mois × 2000 Ar)', '197.149.11.126', '2026-07-09 08:38:32'),
(143, 15, 'Confirmation cotisations', NULL, '197.149.11.126', '2026-07-09 08:40:55'),
(144, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-09 11:09:05'),
(145, 15, 'Validation membre', 'RAMITAMPIHAVANANA Tafita Rolland', '197.149.11.126', '2026-07-09 11:09:19'),
(146, 15, 'Validation membre', 'RANDRIAMAMPIANINA TOLOJANAHARY  Rova Navalona', '197.149.11.126', '2026-07-09 11:24:24'),
(147, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-09 11:32:32'),
(148, 15, 'Enregistrement cotisation', 'Enregistrement cotisation (11 mois × 2000 Ar)', '197.149.11.126', '2026-07-09 11:38:18'),
(149, 15, 'Validation membre', 'Andriambola Tsiory Mashiyyat', '197.149.11.126', '2026-07-10 08:24:18'),
(150, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (3 mois × 5000 Ar)', '129.222.109.112', '2026-07-11 10:11:10'),
(151, 15, 'Connexion', NULL, '197.215.193.67', '2026-07-11 17:00:47'),
(152, 15, 'Validation membre', 'RANDRIANJAFY Sitraka', '197.215.193.67', '2026-07-11 17:01:24'),
(153, 15, 'Visite boîte à idées', NULL, '197.215.193.67', '2026-07-11 17:01:48'),
(154, 15, 'Connexion', NULL, '41.74.209.179', '2026-07-13 03:34:57'),
(155, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-13 13:09:42'),
(156, 66, 'Validation membre', 'Rajaoarisoa Pascal olivier', '129.222.109.206', '2026-07-16 09:08:35'),
(157, 15, 'Validation membre', 'RAVELONATOANDRO Hasinavalona', '197.215.193.89', '2026-07-17 11:49:37'),
(158, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-27 11:56:32'),
(159, 15, 'Validation membre', 'SOARINANDRASANA Tafita', '197.149.11.126', '2026-07-27 11:56:52'),
(160, 15, 'Ajout document', 'PARTAGE D\'EXPERIENCE HORS-SOL AEM1.pdf', '197.149.11.126', '2026-07-27 11:57:17'),
(161, 15, 'Connexion', NULL, '197.149.11.126', '2026-07-28 07:38:02'),
(162, 15, 'Validation membre', 'RAKOTONDRAMPARANY  Tahirinambinina Judicael', '197.149.11.126', '2026-07-28 07:38:20'),
(163, 15, 'Validation membre', 'Rakotondravao  Holiarilanto Evah', '197.149.11.126', '2026-07-30 09:58:58'),
(164, 15, 'Connexion', NULL, '102.18.162.74', '2026-07-31 03:33:52'),
(165, 15, 'Connexion', NULL, '102.17.119.74', '2026-08-02 14:25:27'),
(166, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (4 mois × 5000 Ar)', '129.222.109.198', '2026-08-03 07:21:58'),
(167, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (5 mois × 5000 Ar)', '129.222.109.198', '2026-08-06 06:13:50'),
(168, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (3 mois × 5000 Ar)', '129.222.109.198', '2026-08-06 10:16:51'),
(169, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (4 mois × 5000 Ar)', '129.222.109.198', '2026-08-06 10:17:55'),
(170, 15, 'Connexion', NULL, '197.149.11.126', '2026-08-06 11:06:23'),
(171, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (11 mois × 2000 Ar)', '129.222.109.17', '2026-08-07 06:09:34'),
(172, 66, 'Validation membre', 'ANJARASOA Jean Urbain', '129.222.109.17', '2026-08-07 06:15:16'),
(173, 15, 'Validation membre', 'RAVONIMANANTENA  Fanilonomena Andrea', '41.74.210.212', '2026-08-09 14:19:52'),
(174, 15, 'Validation membre', 'RAKOTONDRAMBOLA Asera', '41.74.210.212', '2026-08-09 14:20:05'),
(175, 15, 'Connexion', NULL, '197.149.11.126', '2026-08-10 07:49:10'),
(176, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '129.222.109.200', '2026-08-10 12:01:59'),
(177, 15, 'Enregistrement cotisation', 'Enregistrement cotisation (4 mois × 5000 Ar)', '154.120.142.89', '2026-08-10 16:24:20'),
(178, 15, 'Validation membre', 'RAZANAPERA  Andriantsitoniaina Finoana Nirina Mampionona', '197.149.11.126', '2026-08-11 09:50:51'),
(179, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-08-11 09:51:42'),
(180, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '153.67.85.213', '2026-08-14 05:31:01'),
(181, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (7 mois × 5000 Ar)', '153.67.85.213', '2026-08-14 05:32:34'),
(182, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '153.67.85.213', '2026-08-14 11:42:55'),
(183, 66, 'Validation membre', 'RABEZANAHARY  Tantely Heritiana', '129.222.109.7', '2026-08-17 09:24:42'),
(184, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '129.222.109.7', '2026-08-17 09:27:51'),
(185, 15, 'Connexion', NULL, '197.149.11.126', '2026-08-17 11:27:26'),
(186, 15, 'Connexion', NULL, '41.74.208.221', '2026-08-22 05:04:28'),
(187, 15, 'Connexion', NULL, '197.149.11.126', '2026-08-25 07:59:01'),
(188, 15, 'Connexion', NULL, '197.149.11.126', '2026-08-25 11:31:35'),
(189, 15, 'Connexion', NULL, '41.74.210.147', '2026-08-29 11:59:58'),
(190, 15, 'Validation membre', 'RAZAFIMAMELONA Harisoa Jacquette', '41.74.210.147', '2026-08-29 12:00:26'),
(191, 15, 'Visite boîte à idées', NULL, '41.74.210.147', '2026-08-29 12:00:38'),
(192, 15, 'Connexion', NULL, '41.74.210.136', '2026-08-30 06:07:27'),
(193, 15, 'Connexion', NULL, '41.74.210.136', '2026-08-30 18:13:52'),
(194, 15, 'Connexion', NULL, '41.74.209.125', '2026-09-02 14:35:37'),
(195, 15, 'Validation membre', 'Andriamihaja sitraka', '41.74.209.125', '2026-09-02 14:36:03'),
(196, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '153.67.85.140', '2026-09-07 11:46:31'),
(197, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (3 mois × 5000 Ar)', '153.67.85.140', '2026-09-07 11:47:27'),
(198, 66, 'Validation membre', 'RANDRIAMAMPIADANA Pierre Célestin', '153.67.85.140', '2026-09-07 11:49:11'),
(199, 66, 'Validation membre', 'RAKOTOARIMANANA  Vololonarivo Michel', '153.67.85.140', '2026-09-07 11:49:22'),
(200, 66, 'Validation membre', 'TSIFEFIKE Arsène', '153.67.85.140', '2026-09-07 11:49:29'),
(201, 66, 'Validation membre', 'Fanekea  Arsène Gustera', '153.67.85.140', '2026-09-07 11:49:36'),
(202, 66, 'Validation membre', 'RATOMBOHARIMELY Manana Emileynico', '153.67.85.140', '2026-09-07 11:49:42'),
(203, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '153.67.85.104', '2026-09-10 07:07:18'),
(204, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '153.67.85.104', '2026-09-10 07:46:32'),
(205, 66, 'Validation membre', 'Rakotoarisoa Finaritra', '153.67.85.104', '2026-09-10 09:01:48'),
(206, 66, 'Validation membre', 'Razakandraina  Olivier', '153.67.85.104', '2026-09-10 09:01:58'),
(207, 66, 'Validation membre', 'RANDRIANIAINA SOLOHANITRA  Zo', '153.67.85.104', '2026-09-10 09:02:22'),
(208, 66, 'Visite boîte à idées', NULL, '153.67.85.104', '2026-09-10 09:08:41'),
(209, 66, 'Visite boîte à idées', NULL, '153.67.85.104', '2026-09-10 09:09:12'),
(210, 66, 'Visite boîte à idées', NULL, '153.67.85.104', '2026-09-10 09:09:37'),
(211, 66, 'Visite boîte à idées', NULL, '153.67.85.104', '2026-09-10 09:09:46'),
(212, 66, 'Visite boîte à idées', NULL, '153.67.85.104', '2026-09-10 09:10:28'),
(213, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (5 mois × 5000 Ar)', '153.67.85.104', '2026-09-10 09:12:47'),
(214, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-09-10 09:58:25'),
(215, 15, 'Visite boîte à idées', NULL, '197.149.11.126', '2026-09-10 09:59:08'),
(216, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (4 mois × 5000 Ar)', '153.67.85.104', '2026-09-10 16:18:14'),
(217, 15, 'Connexion', NULL, '197.149.11.126', '2026-09-16 06:44:19'),
(218, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '129.222.109.42', '2026-09-23 16:03:17'),
(219, 66, 'Validation membre', 'Razafindratsira  José Herman', '153.67.85.251', '2026-09-24 07:16:59'),
(220, 66, 'Validation membre', 'LARISSA  Charlette Sanya', '153.67.85.251', '2026-09-24 07:17:07'),
(221, 15, 'Connexion', NULL, '197.149.11.126', '2026-09-28 05:50:24'),
(222, 15, 'Connexion', NULL, '197.149.11.126', '2026-09-28 16:48:23'),
(223, 15, 'Déconnexion', NULL, '197.149.11.126', '2026-09-28 16:48:29'),
(224, 15, 'Connexion', NULL, '41.74.212.152', '2026-09-29 02:57:45'),
(225, 15, 'Validation membre', 'Rakotondrainibe  Natanaela', '41.74.212.152', '2026-09-29 03:00:09'),
(226, 15, 'Connexion', NULL, '153.67.85.39', '2026-10-01 07:57:16'),
(227, 15, 'Connexion', NULL, '197.149.11.126', '2026-10-01 14:12:24'),
(228, 15, 'Connexion', NULL, '41.74.208.84', '2026-10-02 03:42:08'),
(229, 15, 'Validation membre', 'NAHANTRINIAINA  Anjara Miandry', '197.149.11.126', '2026-10-05 13:51:07'),
(230, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (2 mois × 5000 Ar)', '129.222.109.202', '2026-10-06 11:07:32'),
(231, 15, 'Connexion', NULL, '41.74.211.148', '2026-10-10 07:50:27'),
(232, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '153.67.85.106', '2026-10-10 15:51:54'),
(233, 15, 'Connexion', NULL, '41.74.208.83', '2026-10-15 10:14:20'),
(234, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '129.222.109.33', '2026-10-15 16:18:22'),
(235, 66, 'Enregistrement cotisation', 'Enregistrement cotisation (1 mois × 5000 Ar)', '129.222.109.33', '2026-10-15 16:35:12'),
(236, 15, 'Connexion', NULL, '41.74.208.83', '2026-10-15 17:17:24'),
(237, 15, 'Déconnexion', NULL, '41.74.208.83', '2026-10-15 17:30:58'),
(238, 15, 'Visite boîte à idées', NULL, '102.17.106.171', '2026-10-16 06:05:38'),
(239, 15, 'Visite boîte à idées', NULL, '102.17.106.171', '2026-10-16 06:05:48'),
(240, 15, 'Visite boîte à idées', NULL, '102.17.106.171', '2026-10-16 06:12:55'),
(241, 15, 'Connexion', NULL, '197.149.11.126', '2026-10-17 08:17:11'),
(242, 15, 'Connexion', NULL, '41.74.213.54', '2026-10-18 11:23:33'),
(243, 15, 'Connexion', NULL, '41.74.213.54', '2026-10-18 11:26:05'),
(244, 15, 'Connexion', NULL, '41.74.213.54', '2026-10-18 11:31:51'),
(245, 15, 'Connexion', NULL, '41.74.213.54', '2026-10-18 11:44:49'),
(246, 15, 'Connexion', NULL, '41.74.213.54', '2026-10-18 16:24:50'),
(247, 15, 'Enregistrement cotisation', 'Enregistrement cotisation (4 mois × 2000 Ar)', '41.74.213.54', '2026-10-18 16:41:21'),
(248, 15, 'Connexion', NULL, '41.74.213.54', '2026-10-18 16:45:38'),
(249, 15, 'Enregistrement cotisation', 'Enregistrement cotisation (10 mois × 2000 Ar)', '41.74.213.54', '2026-10-18 16:47:19'),
(250, 15, 'Connexion', NULL, '41.74.213.54', '2026-10-18 17:31:15'),
(251, 15, 'Connexion', NULL, '41.74.213.54', '2026-10-18 17:31:15'),
(252, 15, 'Connexion', NULL, '41.74.213.54', '2026-10-19 03:54:15'),
(253, 15, 'Visite boîte à idées', NULL, '41.74.213.54', '2026-10-19 03:54:21'),
(254, 163, 'Connexion', NULL, '::1', '2026-10-19 11:42:25'),
(255, 163, 'Connexion', NULL, '::1', '2026-10-20 08:13:07');

-- --------------------------------------------------------

--
-- Structure de la table `aem_attendance_list`
--

CREATE TABLE `aem_attendance_list` (
  `id` int(11) NOT NULL,
  `aem_id_user` int(11) NOT NULL,
  `date_arrivee` date NOT NULL DEFAULT curdate(),
  `heure_arrivee` time NOT NULL DEFAULT curtime(),
  `aem_recorded_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_attendance_list`
--

INSERT INTO `aem_attendance_list` (`id`, `aem_id_user`, `date_arrivee`, `heure_arrivee`, `aem_recorded_by`) VALUES
(1, 40, '2026-02-08', '16:41:22', NULL),
(2, 57, '2026-02-08', '16:42:40', NULL),
(4, 58, '2026-02-08', '16:45:26', NULL),
(5, 19, '2026-02-08', '16:45:48', NULL),
(6, 34, '2026-02-08', '16:47:07', NULL),
(7, 20, '2026-02-08', '16:48:18', NULL),
(8, 15, '2026-02-14', '15:53:06', NULL),
(9, 58, '2026-02-14', '15:53:35', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `aem_auth_tokens`
--

CREATE TABLE `aem_auth_tokens` (
  `aem_id_token` int(11) NOT NULL,
  `aem_id_user` int(11) NOT NULL,
  `token` text NOT NULL,
  `refresh_token` text NOT NULL,
  `expires_at` datetime NOT NULL,
  `refresh_expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_revoked` tinyint(1) DEFAULT 0,
  `user_agent` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_auth_tokens`
--

INSERT INTO `aem_auth_tokens` (`aem_id_token`, `aem_id_user`, `token`, `refresh_token`, `expires_at`, `refresh_expires_at`, `created_at`, `is_revoked`, `user_agent`, `ip_address`) VALUES
(6, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTM4NDkwLCJleHAiOjE3NzAxNDIwOTAsInVzZXJfaWQiOjE1LCJqdGkiOiJkMTQwMGJiMjlhNzExNWQxM2M4YjgxMTQ4Nzg3NDY1YyJ9.N9WdwVu9pRNBxhH3XRZh5Mmtyxemnwdl8RARxm_oNlo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTM4NDkwLCJleHAiOjE3NzI3MzA0OTAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRiZDViNjc0M2M1ZGNkNDJlNWU0YWQzMzViMGQ1MDE3In0.j7jcbdWSPqSOcy7EyHZMq00xwj7wQFkCnc_R4HT24Bo', '2026-02-03 18:08:10', '2026-03-05 17:08:10', '2026-02-03 17:08:10', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '41.74.211.71'),
(7, 56, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTc5OTk2LCJleHAiOjE3NzAxODM1OTYsInVzZXJfaWQiOjU2LCJqdGkiOiIwOGFmN2JhYjYwOTY4MTc0NGM2MGZmOWU2Yzc5MDdkMCJ9.DqsH0X9egGqAOqpN9m_uQy7R-B4q_mGYRK4liCzlDxM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTc5OTk2LCJleHAiOjE3NzI3NzE5OTYsInVzZXJfaWQiOjU2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjQ5OTAxOThhYmI0YWExOTA4ZjNiMDRhZjM1OGZlOGJjIn0.DGE_eyoyd_8sZEwzFVuyPmzQ0G2kfFmMx6ZteODED74', '2026-02-04 05:39:56', '2026-03-06 04:39:56', '2026-02-04 04:39:56', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '129.222.109.62'),
(8, 34, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgwMjI4LCJleHAiOjE3NzAxODM4MjgsInVzZXJfaWQiOjM0LCJqdGkiOiJiMmI3MjE1ZTJjOGUxYWJkYmZlZGI5ZGRiMGQyOWU4MiJ9.aQhywESt6eqqt5YLO_gtBvr8qG_6FScZ5ypcOIqZkq0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgwMjI4LCJleHAiOjE3NzI3NzIyMjgsInVzZXJfaWQiOjM0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjczYTE2NmI1ZTQ1YmNhN2ZkYWI1YzA3MzNjOWI0YjYyIn0.Srq1UC38obAcV--EytZdeEjgL-1792nEHUt3OAr5CVc', '2026-02-04 05:43:48', '2026-03-06 04:43:48', '2026-02-04 04:43:48', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '41.77.17.1'),
(9, 22, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgwMjQ0LCJleHAiOjE3NzAxODM4NDQsInVzZXJfaWQiOjIyLCJqdGkiOiJkZTY5MGVjMzZjM2MzMmNjMWI5NWQ5ZWY1Y2QxNWE3OCJ9.P1n2E4vOYaxnPC7YrulPnA43knmHEZRzThZcOEQ6moo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgwMjQ0LCJleHAiOjE3NzI3NzIyNDQsInVzZXJfaWQiOjIyLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjdkZDc4YWMwNGJhMjM5MGExMWVhZTk5MGYwN2VkOWVmIn0.ZNvTN4nUs7GAthv7cc3Bj3VM7AV4LQcJYEZZyWzevww', '2026-02-04 05:44:04', '2026-03-06 04:44:04', '2026-02-04 04:44:04', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '41.77.17.220'),
(10, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgwODYzLCJleHAiOjE3NzAxODQ0NjMsInVzZXJfaWQiOjI0LCJqdGkiOiJjOTlhMWY1MGY5ZTMwYTcyZmQ3NTcyNTFiY2VkNjE3OSJ9.j-OLcdWdK3WNtY_1ltm-eR5PIjKdew9zXqZoQOOcLP0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgwODYzLCJleHAiOjE3NzI3NzI4NjMsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImNiYTIzNzk0YWMyYjVkYzgxMTFlMzMyNmM3YzMxNmFkIn0.GRLNhDGxWm_TAZ_TK9U9OJbIb7b4l_1tEQRXGpMehZY', '2026-02-04 05:54:23', '2026-03-06 04:54:23', '2026-02-04 04:54:23', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.119.110'),
(11, 45, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgxMjc1LCJleHAiOjE3NzAxODQ4NzUsInVzZXJfaWQiOjQ1LCJqdGkiOiIxNDI5ZjllZmExY2I1YTZjOWM3ZGRlZmE3MzUyY2IzZSJ9.0ZJAH7vYPOqzHsah3Henj3LYxM-QfyKJAtOZ51uGkXg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgxMjc1LCJleHAiOjE3NzI3NzMyNzUsInVzZXJfaWQiOjQ1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImIyYWNkYmI4NzhlZjgyMWI1NmUwNzIwN2MzZTAyOGYxIn0.CXUgoigPk2AVqVLLY_8NhqSUmBAefwW5v7WDx1fnTpk', '2026-02-04 06:01:15', '2026-03-06 05:01:15', '2026-02-04 05:01:15', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '41.77.17.6'),
(12, 20, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgxNTM5LCJleHAiOjE3NzAxODUxMzksInVzZXJfaWQiOjIwLCJqdGkiOiI1YzU1NmFkNWJkZmZkNWY4NzU4NTYwYjQ0NjlmZDQ4ZiJ9.eWGWsVxqkkTcM4TAdGur5c1xJgGTrwd1ohWeHZUiMAI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgxNTM5LCJleHAiOjE3NzI3NzM1MzksInVzZXJfaWQiOjIwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImUwNWQzYzdhN2ViM2RkZjM5NWI2MGE2NDlhODVhMjQwIn0.8k_eVw87OcDfvoPOSTQ8YtJGgweFL6ktvxL6M8Z7VKc', '2026-02-04 06:05:39', '2026-03-06 05:05:39', '2026-02-04 05:05:39', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', '102.18.157.189'),
(13, 20, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgxOTg2LCJleHAiOjE3NzAxODU1ODYsInVzZXJfaWQiOjIwLCJqdGkiOiJhODUzNDdhMmQ4ZGI5MjEzYzUwZDY0MDg3MjQyNWFlOCJ9.9wXPr0dKL-jLxIo3cOx9vPDlF-B8IIEg1gy-ykrKAqM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgxOTg2LCJleHAiOjE3NzI3NzM5ODYsInVzZXJfaWQiOjIwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjA4ZjdiNGI4OGY4MThlZjE1Mjg1MDI2OGQwMWI3OTIzIn0.QysToiJFCOoJZKFdTZXm1w2-kq4S-N58JgpkBhZ3wME', '2026-02-04 06:13:06', '2026-03-06 05:13:06', '2026-02-04 05:13:06', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', '102.18.157.189'),
(14, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgyNTMyLCJleHAiOjE3NzAxODYxMzIsInVzZXJfaWQiOjI0LCJqdGkiOiJlN2Y2NDIxYzdjMTQ0NDYzZmVmMDM4MDMyMzE4YzczNiJ9.yhUBihgnnlUd3qkQ6mLvCNJ6VtWqxosQg-lUdVA2j8o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgyNTMyLCJleHAiOjE3NzI3NzQ1MzIsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjkyMGNhZmE1Nzc1OTcxMWNiNWIwZWUzOTE3NGM3OTFkIn0.px5Gcvt4Riz_XbcF9tg_sy2wJRHuEIvQzqbBX2KIn3c', '2026-02-04 06:22:12', '2026-03-06 05:22:12', '2026-02-04 05:22:12', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.119.110'),
(15, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgyNTUzLCJleHAiOjE3NzAxODYxNTMsInVzZXJfaWQiOjI0LCJqdGkiOiJlZjIxNTc1MmQ5MTY1YzAwM2Y3YjQ4NGZlNGVkMWNkYSJ9.MCtottxHRR8l3exsV71AKYJIaXFXtlD2FIx5HKgLyFg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgyNTUzLCJleHAiOjE3NzI3NzQ1NTMsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjBjNTU1ZGY1NGU2OGNmNjQ1ZDVmZWM2NWE4MzhjMGI4In0.ag4nOjBSQZZLfDX8cLhe9cgCEH9l6TP5uuIviTiTJWE', '2026-02-04 06:22:33', '2026-03-06 05:22:33', '2026-02-04 05:22:33', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.119.110'),
(16, 57, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgyODYyLCJleHAiOjE3NzAxODY0NjIsInVzZXJfaWQiOjU3LCJqdGkiOiIyZGE2MTY4MmE0MWYyMjVlZmJiNTY2MTExMGUxMDJhYSJ9.WHaQ9JlTvIa9lAWYSK-Wm8gHx-76chWy5T8PsTaIj1s', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTgyODYyLCJleHAiOjE3NzI3NzQ4NjIsInVzZXJfaWQiOjU3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjAyYjg1MDRjYzNiZGMzM2ZhYmQ5MDhmOWQ4NzIzN2E1In0.fI3Vwy0c7yTo46-bubSxgwZ-t7i6Yr4ejVz6aD0TWzE', '2026-02-04 06:27:42', '2026-03-06 05:27:42', '2026-02-04 05:27:42', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.17.118.74'),
(17, 33, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg1MTExLCJleHAiOjE3NzAxODg3MTEsInVzZXJfaWQiOjMzLCJqdGkiOiIxMzhkYTE4ZWU1YzJhY2E1ZGM1Yzk3ODhiZGEzZThlYyJ9.vj1cUBWuDtbDxyksoUzuGmtgVmJFVWQQn7uOMFU9UlM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg1MTExLCJleHAiOjE3NzI3NzcxMTEsInVzZXJfaWQiOjMzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImMzMGU1ZTY0NTljNzc0YjNkODE3YzJiZTAxYWFmYjA5In0.p2wpQzk5rF27V1895IQsiAziZRg2isNhQOP5Kx-JFEI', '2026-02-04 07:05:11', '2026-03-06 06:05:11', '2026-02-04 06:05:11', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '154.126.43.89'),
(18, 17, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg1MjA5LCJleHAiOjE3NzAxODg4MDksInVzZXJfaWQiOjE3LCJqdGkiOiJjMWQ2MTBhNTVkN2YxNGIwZWJmOWFiZDE2NDdhMjg0YSJ9.2aZjAs-UHA7bbygm2k5LJh11m6to0ol2oBsozCeZDSI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg1MjA5LCJleHAiOjE3NzI3NzcyMDksInVzZXJfaWQiOjE3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjljY2Q4ZjBmNDU0NzBlZDQwNGU1NDYwZGQyMjZhNTcyIn0.xtOIcfqsKdH_9Bmamc1cQkhwdJ7TS4kqA7b0YQXYKSI', '2026-02-04 07:06:49', '2026-03-06 06:06:49', '2026-02-04 06:06:49', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.18.158.121'),
(19, 33, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg1MjgwLCJleHAiOjE3NzAxODg4ODAsInVzZXJfaWQiOjMzLCJqdGkiOiJhMDA3YmE0ODUyNjNhZDAzZGE4ZDFhNWY3YWM3ODkwYiJ9.KxmkLfsIKeDX8Pa4V2GuyzsS8Hm70KFmcZ5HheNj17c', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg1MjgwLCJleHAiOjE3NzI3NzcyODAsInVzZXJfaWQiOjMzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImI4MmVlMDYzNzQzZTcyNGRkZWNlNmZjZTU0YjA2ODA5In0.pBA_HzwcXbuu_OqQ7an_5ZKDnOOF-7wa59XPcvDrdlk', '2026-02-04 07:08:00', '2026-03-06 06:08:00', '2026-02-04 06:08:00', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '154.126.43.89'),
(20, 28, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg2MzUxLCJleHAiOjE3NzAxODk5NTEsInVzZXJfaWQiOjI4LCJqdGkiOiJiYmYxOTQ2MTQ2MzUwNTdmZDVhNDlkMDkzMDg1YzdiMyJ9.xu9fi7i6fUZ6fBln7ksQ74dYynC4JxpWaGBL2B4XyRg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg2MzUxLCJleHAiOjE3NzI3NzgzNTEsInVzZXJfaWQiOjI4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRjMzc5NmQ1ZmQxNTNkOWEzYTBhOWE2MTQxMzhjYjg1In0.0K0FiOaXhedEGkGDvbvsOvhsd_PvG3opv9SdTpZopgk', '2026-02-04 07:25:51', '2026-03-06 06:25:51', '2026-02-04 06:25:51', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', '79.116.154.147'),
(21, 51, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg2NjU1LCJleHAiOjE3NzAxOTAyNTUsInVzZXJfaWQiOjUxLCJqdGkiOiJkYTgzMzQyMTE4OTk4NWFiMTNhNDI4YTljZmYyM2E4ZiJ9.lrcahcIEF1T5ZEhhKxMGjC_3jNuw911WlpmNcM0OzZE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg2NjU1LCJleHAiOjE3NzI3Nzg2NTUsInVzZXJfaWQiOjUxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjZmMWQ4ZjliNDA2ZDhhYzRlM2FhZmNhZmEyM2E4ZmU3In0.RaJ4Yk9NbBu4NCgjbuaLzqb8VktoTvxphoWY7rAmkmc', '2026-02-04 07:30:55', '2026-03-06 06:30:55', '2026-02-04 06:30:55', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '41.77.17.203'),
(22, 34, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg2Nzc0LCJleHAiOjE3NzAxOTAzNzQsInVzZXJfaWQiOjM0LCJqdGkiOiIzZDllOTE2Njg5MDFlYjAyY2ExYzExMDU4NGMxMDc5MyJ9.2iITubsY0j1Xd26cCk2vTfJxrsA-YsHoBgQz4jeed0A', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg2Nzc0LCJleHAiOjE3NzI3Nzg3NzQsInVzZXJfaWQiOjM0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRmM2JkNDczNjIzYTczMmM3ZDMyODA2MmZhNWUwYjJiIn0.sfE-AW5w6r0mtsPyrJ-CUrS0wIBs29y3Dy6DAGORV0E', '2026-02-04 07:32:54', '2026-03-06 06:32:54', '2026-02-04 06:32:54', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '197.148.130.15'),
(23, 34, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg3MjUwLCJleHAiOjE3NzAxOTA4NTAsInVzZXJfaWQiOjM0LCJqdGkiOiJiMWRmN2ViNzBmZjcwNGZlMTJmNTVlM2MwZmRmZGRlNiJ9.BnJlgtpZCYpOEzzaj1BR_RWpsnqxpM8PO4khCEAfnWE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg3MjUwLCJleHAiOjE3NzI3NzkyNTAsInVzZXJfaWQiOjM0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImM5YWFkZjUxODkyNWU0MWNmYjIwYzM1NTFlNjI3YWYxIn0.2xsP6ST5BLgmBdcyDuaifTt1SgsmtJGTq4LRaovRbZ4', '2026-02-04 07:40:50', '2026-03-06 06:40:50', '2026-02-04 06:40:50', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '197.148.130.15'),
(24, 49, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg3OTkwLCJleHAiOjE3NzAxOTE1OTAsInVzZXJfaWQiOjQ5LCJqdGkiOiI2MTIyOTFhM2YwMGE4YmM0MGNkNmUxMjEyMGYwYjBjMCJ9.6NFHZrQoOsTYLorP45qjwq6cXRRiB60HhghVouQ-aSc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg3OTkwLCJleHAiOjE3NzI3Nzk5OTAsInVzZXJfaWQiOjQ5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImVlMjZjODdlNmVlZmVhOGE3NDFjYzhmYzAzMTBiYjRmIn0.182MN69A-Lle0njfogOkr1D4dh9g-oPFe1A1hRzJ2sI', '2026-02-04 07:53:10', '2026-03-06 06:53:10', '2026-02-04 06:53:10', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '102.17.120.169'),
(25, 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg5NzQ0LCJleHAiOjE3NzAxOTMzNDQsInVzZXJfaWQiOjMxLCJqdGkiOiJiM2IyMzM2NGM4ZGZkOTU2NTc2Y2RkNWE3ZDFkMDA5YyJ9.KPdgnEx1TcAUZBKYsYSa31ak2OzcscazK4OB5VevD4E', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg5NzQ0LCJleHAiOjE3NzI3ODE3NDQsInVzZXJfaWQiOjMxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijg5M2MyOWQxNDk0MzNmNDZkNjM3MWQzMTA2YmQ4Mzk1In0.aU75tUQOEJKU-Y_SzhcAf1ONnT8I1G6xIgLxt8yv8kk', '2026-02-04 08:22:24', '2026-03-06 07:22:24', '2026-02-04 07:22:24', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '77.18.32.66'),
(26, 25, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg5ODc5LCJleHAiOjE3NzAxOTM0NzksInVzZXJfaWQiOjI1LCJqdGkiOiIyNzhjM2NiZTRmZjU3YTk5ZjNkYTQwY2ViNGJjN2I4NSJ9.4416G6w7lJPPmmthMm4Ko_E4hPxWCPOdFB8--SNCAQw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTg5ODc5LCJleHAiOjE3NzI3ODE4NzksInVzZXJfaWQiOjI1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijc3ZmQ1NDUwNDVhZTU4YTY2MDdlOWQ5NjkyOTgyNTdkIn0.Ny8KeUbVSoLaWmHjOOrg5Z_1MHrippMymgBPOVUKWOk', '2026-02-04 08:24:39', '2026-03-06 07:24:39', '2026-02-04 07:24:39', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '129.222.109.208'),
(27, 48, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTkwNzA0LCJleHAiOjE3NzAxOTQzMDQsInVzZXJfaWQiOjQ4LCJqdGkiOiJhOTljYmM5N2YyNGFiNjk0ZDBjMDdlYzY1NTdhODFmZiJ9.OZucGLc7uIzMHrSwqnc90KAOFTtXdhplsIRHa6WLOrE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTkwNzA0LCJleHAiOjE3NzI3ODI3MDQsInVzZXJfaWQiOjQ4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjM2YjBlYjY2M2U1NDAwYzY3NWYwODJjNTdmNWEwZDc0In0.73p7f7u3Oiyl_NAfOciK5Dcj6q-i_kQ4mnkdQkbIbqU', '2026-02-04 08:38:24', '2026-03-06 07:38:24', '2026-02-04 07:38:24', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.74.210.76'),
(28, 53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTkzMjUxLCJleHAiOjE3NzAxOTY4NTEsInVzZXJfaWQiOjUzLCJqdGkiOiIyMDE5YWU3MmE3YTA5YjVmNzM5NTM5MTIzN2I5YjFlMiJ9.V6_duJEkIe8EdhRw71vFAQVhEM2UZz_qeuecG6eFkLU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTkzMjUxLCJleHAiOjE3NzI3ODUyNTEsInVzZXJfaWQiOjUzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjliMjRiZWY5NjVlMDFkOTE3ZjJmNmIxN2U4Mzg3NDc3In0.Io05H61lxkpx7Bf8CIX-hxi2hJ03b-aErXmnwEC_xRI', '2026-02-04 09:20:51', '2026-03-06 08:20:51', '2026-02-04 08:20:51', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '41.74.210.37'),
(29, 28, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTkzNzc0LCJleHAiOjE3NzAxOTczNzQsInVzZXJfaWQiOjI4LCJqdGkiOiI4NGYyMTk0MmE1Y2MxYjUzNTI4NjU3MjY2ZjA2MDdkMyJ9.79BSeNS8tFq7Jy03aulyDaUdeHcsFcSzX-HeX9ASsAA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTkzNzc0LCJleHAiOjE3NzI3ODU3NzQsInVzZXJfaWQiOjI4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQyMjI3MDFiZjNiMDIzMmI0ODNjMjM1ZTcyOGVlZDdlIn0.Wn56N_aje_B1WfM9HTX2G2IjLtJmF13OubMIVaACu8I', '2026-02-04 09:29:34', '2026-03-06 08:29:34', '2026-02-04 08:29:34', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '79.116.154.147'),
(30, 37, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTk1NzIyLCJleHAiOjE3NzAxOTkzMjIsInVzZXJfaWQiOjM3LCJqdGkiOiI4Yzc3YWU0MGRkNGU4ZDk0MWQxZmY4MDMwNjEyZjEwNyJ9.jb2mPxf8pCYc64RXYundUwcRV8PPJ2h7Y_veX2vAiZM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTk1NzIyLCJleHAiOjE3NzI3ODc3MjIsInVzZXJfaWQiOjM3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImNmODE1MjdiZWIyZDQzNzZiOTM3ZWU0MWY0N2Y0YmZkIn0.2ETQui3ztNN7riPqLgOHwhqDn2u3h4NVfUvZAOLFcUQ', '2026-02-04 10:02:02', '2026-03-06 09:02:02', '2026-02-04 09:02:02', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.17.206.90'),
(31, 27, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTk2NTA1LCJleHAiOjE3NzAyMDAxMDUsInVzZXJfaWQiOjI3LCJqdGkiOiIwMDJhOWRkNTgxOTNiNTRhMWM0OTQ4NGI2MWVhMzkwZSJ9.AFbo28YFZJHXWujy6h56xcQCZcaa3b2ryPi5-9NvkUo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTk2NTA1LCJleHAiOjE3NzI3ODg1MDUsInVzZXJfaWQiOjI3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImRkZDM1ZjgzZTJkNDBmM2I3NDgxMWY0NWY1Mjc0MDVkIn0.uZeepBpQQ_MaLNwEv0rpzDg7GwxYA72H4vOyVhbinWk', '2026-02-04 10:15:05', '2026-03-06 09:15:05', '2026-02-04 09:15:05', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '196.20.216.1'),
(32, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTk3MjQyLCJleHAiOjE3NzAyMDA4NDIsInVzZXJfaWQiOjE1LCJqdGkiOiJhZjAwYTY3ZTAxNmVkZjU2ODg2ZTIzYmNlZDhiMzkxYyJ9.1N_fS6rI04yJgoW45O9-tOFoAGGXkxNDsaCeBYCcKdU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMTk3MjQyLCJleHAiOjE3NzI3ODkyNDIsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjAyYWUxYWJlYTJjYTUxMmQ5ZjNkN2EyZTQzYTg0MGExIn0.TBrOZu7BFq5M3w1Ikr6wqbWW6_6wUTWhN1HBegSSwCg', '2026-02-04 10:27:22', '2026-03-06 09:27:22', '2026-02-04 09:27:22', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '102.18.161.206'),
(33, 51, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjAxMDUzLCJleHAiOjE3NzAyMDQ2NTMsInVzZXJfaWQiOjUxLCJqdGkiOiJjMTYwMGE4MTJlZDJjNWU4Y2M5YjcwM2ZlNDQxOWU0ZSJ9.f_abAqptLrGUE6_jGyzo1kncop51aLImluSdpHcaToc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjAxMDUzLCJleHAiOjE3NzI3OTMwNTMsInVzZXJfaWQiOjUxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjBkNGQ1ZTcyNzNkNTE3N2YzY2NkMmZmODZlMDVjYjRiIn0.laF37c6E6Vi2IyzqIk9IjfkLtLXztdUBlzmj8WtqQfU', '2026-02-04 11:30:53', '2026-03-06 10:30:53', '2026-02-04 10:30:53', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '41.77.17.170'),
(34, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjA0OTIyLCJleHAiOjE3NzAyMDg1MjIsInVzZXJfaWQiOjMwLCJqdGkiOiJjZDlmYjc5MDA2NDQwOTI4NjdjMzI5YjkzNzBkM2UzOSJ9.ROk_FqQeGJxowBeEda9dW2EOfVy6gExK6glNrIDF-xk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjA0OTIyLCJleHAiOjE3NzI3OTY5MjIsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjkzODVlYTQ1NDNmYWU4NjkxNTQzZDk4MGMzNjE5ZDA2In0.bydIg7FjDKJLbOyurcj0GEaDHc9bglLtYiniTlGK-RI', '2026-02-04 12:35:22', '2026-03-06 11:35:22', '2026-02-04 11:35:22', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.16.69.60'),
(35, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjA1MDA4LCJleHAiOjE3NzAyMDg2MDgsInVzZXJfaWQiOjMwLCJqdGkiOiI4NzE3YTZkMjYwZTNmMWRiODc0ZGRkM2EwMTlhNmU4MCJ9.ng3RsXJcpIBeWYl5zvW4ll-ylfXdOtghRK8qfkGTXtI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjA1MDA4LCJleHAiOjE3NzI3OTcwMDgsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQzNDQ5NTllZDllOWJjNzAyMmQ2ZDk0MjZlNjNiOTRhIn0.lxHfFOjb3EuRQOyxoSMbjGoIQqERT3dDZXqgyOLDJZQ', '2026-02-04 12:36:48', '2026-03-06 11:36:48', '2026-02-04 11:36:48', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.16.69.60'),
(36, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjA1MTcwLCJleHAiOjE3NzAyMDg3NzAsInVzZXJfaWQiOjMwLCJqdGkiOiJmMDcxNWQ2YThlMmJmNjUxNWM1N2UyNmY4N2JjZDY0ZSJ9.K0m4LxjeKNq9FZXmcKGcLS_VheY2jqKs0MvwlieaF10', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjA1MTcwLCJleHAiOjE3NzI3OTcxNzAsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjNiMzdmZmQwNmNhMjIwNDBhMGJjOGQxNWIzYjE3OTlhIn0.CxmiKMo2NEMpA8eBFIrnwX6d65FhIsEs0j4zJfFQIAQ', '2026-02-04 12:39:30', '2026-03-06 11:39:30', '2026-02-04 11:39:30', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.16.69.60'),
(37, 43, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjA5OTE1LCJleHAiOjE3NzAyMTM1MTUsInVzZXJfaWQiOjQzLCJqdGkiOiIzZjI2MTQ0MTc2MTM0M2YxMmQxMzA3ZTAwYzhmZTdjZSJ9.4bOTNB_6n6dOzquPFSbZgvOoIE8aSXPppfAa-gc4Wms', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjA5OTE1LCJleHAiOjE3NzI4MDE5MTUsInVzZXJfaWQiOjQzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImM4ZjdiNmI4M2U1ZjBkMjAwNjljYTc0OWRiMGUyOWZjIn0.mZsxHYbCQ9_NHpXmusaIHimEQ4AWXZuGXbLdtm6GqFY', '2026-02-04 13:58:35', '2026-03-06 12:58:35', '2026-02-04 12:58:35', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '154.126.58.86'),
(38, 33, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjEwMDczLCJleHAiOjE3NzAyMTM2NzMsInVzZXJfaWQiOjMzLCJqdGkiOiIwMjMxYjMxN2JlZWFmYWUxMzEzY2NhZDM1ZmRlYmEzYyJ9.P9DDnXHujoIeoczPYPdWOvh6njQTiCv8YCTG6-lYGyU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjEwMDczLCJleHAiOjE3NzI4MDIwNzMsInVzZXJfaWQiOjMzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijg5YTNlY2M4ZWZiZmE3ZDVkMjFjYzQ2NDRhYjRjN2E1In0.75r0AKgKWFQG4-__aTCQOfqMBLqEElcTG7oWgnM7V4E', '2026-02-04 14:01:13', '2026-03-06 13:01:13', '2026-02-04 13:01:13', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '154.126.43.89'),
(39, 40, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjEzNDk2LCJleHAiOjE3NzAyMTcwOTYsInVzZXJfaWQiOjQwLCJqdGkiOiJhYzBiZDVjMjM2N2MzYThhODM5OGQxMDc0M2NmMDNjMyJ9.z78Zs4h45S4zKfTx0cicEQ7yDuUwJic3HdBDTgMp18M', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjEzNDk2LCJleHAiOjE3NzI4MDU0OTYsInVzZXJfaWQiOjQwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImY1YmRjOGQwNDk5NmIzMjNjMDY2MTEyOGE4YmIzODYxIn0.u7Tkh5avsMM5dCmhdngAXOCN3Aw_4SQVEq7MaHY0qz8', '2026-02-04 14:58:16', '2026-03-06 13:58:16', '2026-02-04 13:58:16', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.16.125.62'),
(40, 27, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjE2MTMzLCJleHAiOjE3NzAyMTk3MzMsInVzZXJfaWQiOjI3LCJqdGkiOiIwZTFlNzgwNjkxZTcwMzUzZDE0ZjZjMThkYTk5NmNhZSJ9.5bcgWDGO_mZJW-7ZiNvcRCb4KQ4OjWbM_36CvIqlF9k', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjE2MTMzLCJleHAiOjE3NzI4MDgxMzMsInVzZXJfaWQiOjI3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImJmNDgwMGI1YzMxZTFiNjU5MzU3NmNiNGIxZTYxNDRkIn0.-ZfABsFBe0hRkT1HdzkjGFNQwIZgXlX_1OZPuT9H_gg', '2026-02-04 15:42:13', '2026-03-06 14:42:13', '2026-02-04 14:42:13', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '196.20.216.1'),
(41, 33, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjMxMDQ0LCJleHAiOjE3NzAyMzQ2NDQsInVzZXJfaWQiOjMzLCJqdGkiOiIzZGFiYjNmZmUyYmM3ZWRlYWU2MTVhMmYxYmNhZDFmNiJ9.zth-gNFYgdImhlvDxaKoGjHau6pxTftridO-hvxd7ko', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjMxMDQ0LCJleHAiOjE3NzI4MjMwNDQsInVzZXJfaWQiOjMzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijk2MzczYTk2YzBjYzQ4ZDJkYWEzYzdmODI2MWEyYTZlIn0.gD0thAMRD8DXco-xcaec_NFN9Dy94GiaMBnZl5xlcVE', '2026-02-04 19:50:44', '2026-03-06 18:50:44', '2026-02-04 18:50:44', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.17.117.46'),
(42, 19, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjMyNTE5LCJleHAiOjE3NzAyMzYxMTksInVzZXJfaWQiOjE5LCJqdGkiOiJjMTdhOWUxOGYyMzcxMzk2NjBmZDlhOTU4ZGU2OTU3YSJ9.7l4h1IWOPBYSPJ4PT-WCXJvrS8APNcXA4ahjfRjee3I', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjMyNTE5LCJleHAiOjE3NzI4MjQ1MTksInVzZXJfaWQiOjE5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQzNjhiYzI0YTc3YzBhZjc4MTc2MWE2MWUyNjUxZWQ3In0.VV1tuYUNpvb4w65gdJKpCdfoER_pKQAU15OftnKht3Y', '2026-02-04 20:15:19', '2026-03-06 19:15:19', '2026-02-04 19:15:19', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.18.54.199'),
(43, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjUyMjYxLCJleHAiOjE3NzAyNTU4NjEsInVzZXJfaWQiOjI5LCJqdGkiOiJmMTJlZTNiZDJkNzZmM2M1Y2RiNjhkYjM5ZTIxNDA4YiJ9.uRquO_2eRzZu_BsQb7UJ0bv18lg6GMpHVhWyjuqYCcM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjUyMjYxLCJleHAiOjE3NzI4NDQyNjEsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImMzNDY2MTUxNWRmYTRhNGEyMmJlMTI4OTRjOWNjMjA0In0.96Lg2nRic8FeDOW4aPPFSWu7Xob0EFoqKehemgNvGyM', '2026-02-05 01:44:21', '2026-03-07 00:44:21', '2026-02-05 00:44:21', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/28.0 Chrome/130.0.0.0 Mobile Safari/537.36', '102.68.203.166'),
(44, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjUyOTQ5LCJleHAiOjE3NzAyNTY1NDksInVzZXJfaWQiOjI5LCJqdGkiOiI3NDIzMWEwNzE2MjAxZTAyYjAzNzEzNGRlMzFhMGUxZiJ9.VOVQ288mfNAXwRJASjXGxowu-KlYdWHYRfllqt0QGQo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjUyOTQ5LCJleHAiOjE3NzI4NDQ5NDksInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImVjM2FmYzk2ZWM2N2U2OTNiOTM2M2MwMzEzMDJiYzA2In0.3uAOXoXY9RZS2-C1y8UD-98xkj-Nm4EEyA5HpQokCao', '2026-02-05 01:55:49', '2026-03-07 00:55:49', '2026-02-05 00:55:49', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/28.0 Chrome/130.0.0.0 Mobile Safari/537.36', '102.68.203.166'),
(45, 55, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY0MjA2LCJleHAiOjE3NzAyNjc4MDYsInVzZXJfaWQiOjU1LCJqdGkiOiJkYmI2NmJkODI3YzJkZmFmYjc5NGQxMjIzZDI0YjU0NyJ9.yqzmhz8-6dm7kB6L0Tc4_hk5T2pPbD390D5b4i9ApyE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY0MjA2LCJleHAiOjE3NzI4NTYyMDYsInVzZXJfaWQiOjU1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjhjNDM0ZTdiM2I1YmNlYmFjNmZiODhkYjM1ZTYxZWNhIn0.wl6EkZdq_xrR1W5njjhgFT_1W7ek4iMYQp-BjwyGF2E', '2026-02-05 05:03:26', '2026-03-07 04:03:26', '2026-02-05 04:03:26', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '102.17.120.168'),
(46, 42, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY0ODU2LCJleHAiOjE3NzAyNjg0NTYsInVzZXJfaWQiOjQyLCJqdGkiOiI2NTA3MTUwN2Y1N2FiM2NlNWM0NDYyMDBiMTE4NzA0NyJ9.1269BvJ19Czz--EHzOVHaD0uLdShtne_EHHSnfO-NKQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY0ODU2LCJleHAiOjE3NzI4NTY4NTYsInVzZXJfaWQiOjQyLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImRlOTY0ZjYxYjcxYzYyN2I4NWIyYWQzYjcxZTYzOTJkIn0.iUnakgO2lLac0S4Yva2SuVwN0f3cLzo0YcMkWmH74BI', '2026-02-05 05:14:16', '2026-03-07 04:14:16', '2026-02-05 04:14:16', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '154.120.142.68'),
(47, 22, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY3NTE2LCJleHAiOjE3NzAyNzExMTYsInVzZXJfaWQiOjIyLCJqdGkiOiJhOGE1ZWI3ZWVhMGUyMzExNTk3MDcwMmZiZTQxYmM0OSJ9.5LJbo68dq--7UYN59tmTZ7e-9bqvTsr-p_ZihPa0YK8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY3NTE2LCJleHAiOjE3NzI4NTk1MTYsInVzZXJfaWQiOjIyLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI2YTkzMDU2NDQ5NjEzOGM0MDAzM2VmNmViYjBmOGE5In0.qM7PqlNP6yY4lEBdUkMfhtC3QvFjDDDe-v_rsfsT4Qs', '2026-02-05 05:58:36', '2026-03-07 04:58:36', '2026-02-05 04:58:36', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '41.77.17.226'),
(48, 16, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY4MjA5LCJleHAiOjE3NzAyNzE4MDksInVzZXJfaWQiOjE2LCJqdGkiOiI5MGM4MGI3YTZlYTQ2ZGFhZDA5NGE0MjFjZTA3ODA0NiJ9.4iR45nRvcOJ9ef82QdjbRx9bqvFKY9VudN__S5PMgMk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY4MjA5LCJleHAiOjE3NzI4NjAyMDksInVzZXJfaWQiOjE2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImI3MmQzNDY4NTA2ZTU0MGI1ZDU4MzU2YjU5NmJjZjNjIn0.Lo6Gk8OZgZeqLXvUIT6vJrYI8mUgfgJAoFxooSC__vo', '2026-02-05 06:10:09', '2026-03-07 05:10:09', '2026-02-05 05:10:09', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '102.16.125.67'),
(49, 44, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY4Njk5LCJleHAiOjE3NzAyNzIyOTksInVzZXJfaWQiOjQ0LCJqdGkiOiJiZjkyMzY4NTMxOGIzZWMzYTFlOTlkMzk0M2I4MmRkZiJ9.z5ty8dZUkqULqo5zlbzrjR2Le07i0RRjkbYr3ShPcEg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY4Njk5LCJleHAiOjE3NzI4NjA2OTksInVzZXJfaWQiOjQ0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRjZWVjMzFlNzdiY2RiYzFkZDRhN2U2YjIwZTM3OTQ1In0.Ew5YgiKgB0sozA2w0lxjNbfQjVuDeL37qr-EC-g0F-U', '2026-02-05 06:18:19', '2026-03-07 05:18:19', '2026-02-05 05:18:19', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', '102.18.160.61'),
(50, 33, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5MjIxLCJleHAiOjE3NzAyNzI4MjEsInVzZXJfaWQiOjMzLCJqdGkiOiIxMjhhZTI2ZGI1ODQwNjc4YmZhYTI4MDkyYTQ5NWU2OCJ9.YKUlhApRfmE9gmlGPrKuXiQECTWshJPL3zvG2R3oj9k', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5MjIxLCJleHAiOjE3NzI4NjEyMjEsInVzZXJfaWQiOjMzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQ3NWI1ZGM4ZDQ3ZmVlOGU0YTM2YTdiODMxMGI3NmJkIn0.hTCFAW7io98E8kAJUElw2R9Dfs9sUMVfRvTQrufNL8k', '2026-02-05 06:27:01', '2026-03-07 05:27:01', '2026-02-05 05:27:01', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '154.126.43.89'),
(51, 33, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5MjIzLCJleHAiOjE3NzAyNzI4MjMsInVzZXJfaWQiOjMzLCJqdGkiOiI5MzhmYmEwMGJiODdiMWNiZDdiMGRjZDc5MzdlMzVlMSJ9.FJp9Uf7V5crgo_qCT-4gLzIAlAlXTXs_x2AoW0XZLQ8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5MjIzLCJleHAiOjE3NzI4NjEyMjMsInVzZXJfaWQiOjMzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImE5MmIxNTkxMmU5ZjljODkxMzUzMmYwMWQ3OWIxODdmIn0.8aocQ3VyzW-VMD_Xfpe14WyHcvhx_1n5jSQ2QstWYZ4', '2026-02-05 06:27:03', '2026-03-07 05:27:03', '2026-02-05 05:27:03', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '154.126.43.89'),
(52, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5NDUxLCJleHAiOjE3NzAyNzMwNTEsInVzZXJfaWQiOjMwLCJqdGkiOiI5ZTFkZWRhNTEwMGVhZTM1NWNmMzE3ZDhlOTdhY2Y5OSJ9.a3yrrZI1QwIwNe93WAsOtQrfXM7cWHQl8bfskVSu2t8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5NDUxLCJleHAiOjE3NzI4NjE0NTEsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjhkMzJhMWRmZjNmNmFmZjFmZTk5ZmYxOTcyZTYyNTEzIn0.-yO-FhvYjFLIJMYMcwAOdY5Y66-V876WY_xALQ6eEhs', '2026-02-05 06:30:51', '2026-03-07 05:30:51', '2026-02-05 05:30:51', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.16.159'),
(53, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5NTQyLCJleHAiOjE3NzAyNzMxNDIsInVzZXJfaWQiOjMwLCJqdGkiOiI4ZGQ1ZmZhNmI1YWE5NzYyNTc1NWM1MTVjODE5MWU2YiJ9.YonitaM97pl1mYllXDrpms5C1XukBF07IFVVmpAItjU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5NTQyLCJleHAiOjE3NzI4NjE1NDIsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImI3N2IxNjMzYWI2NDdmODIyNWVjNGM4MTU2MzUzM2IyIn0.IwNVeEcDGYIf0pzYol0vl6gCgt3PN9vnh9icsm_Z6Yc', '2026-02-05 06:32:22', '2026-03-07 05:32:22', '2026-02-05 05:32:22', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.16.159'),
(54, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5NjEyLCJleHAiOjE3NzAyNzMyMTIsInVzZXJfaWQiOjMwLCJqdGkiOiIyZmQ1YjM4NjllYTFlMzA3M2ZiMWJkNDdiYjRjNWQyNiJ9.K_iE-6sI3JHrrFKAEXMQUTlYwrGItS2BYnwTd8DIKJk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5NjEyLCJleHAiOjE3NzI4NjE2MTIsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQ0ZTk3YzcwNjdjYzQxMDQ2ODllNmRmM2RmZDc5MGZhIn0.yglR36CIXoBhEPZt_5whpAJPszOt1TGzxs7G77BWjy8', '2026-02-05 06:33:32', '2026-03-07 05:33:32', '2026-02-05 05:33:32', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.16.159'),
(55, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5NzAyLCJleHAiOjE3NzAyNzMzMDIsInVzZXJfaWQiOjMwLCJqdGkiOiI0YTExNjBlYzc0ZjQ2MTA0ZmJkZTQwMGI0YWQ0YmVmOSJ9.k1V3Unszji1xA6G2aWXFG8OZhifepoxSwl_f59fxV3I', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5NzAyLCJleHAiOjE3NzI4NjE3MDIsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijc1NDRmZTdmMTcwNzEzYzliZTA3ZGJmNTg5ODU3M2JiIn0.O_KRN0_FRwqpYDyyLR5HbJNn5JlxDDRxyjBKBoJG1-E', '2026-02-05 06:35:02', '2026-03-07 05:35:02', '2026-02-05 05:35:02', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.16.159'),
(56, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5ODM5LCJleHAiOjE3NzAyNzM0MzksInVzZXJfaWQiOjMwLCJqdGkiOiJmY2RjZjM2ZGJjNGQwMmE4YTBlMTllMWZhMTg5MDgxYSJ9.xV_CxaZhOZlhV8U5_KXouIOQKyWa457zNNp_H0mAX-M', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjY5ODM5LCJleHAiOjE3NzI4NjE4MzksInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjUwNTc3YTcxNzkxMTQ3MmI4ZjNhZTJiNDNmMTM5ODg2In0.f2VXWrw41wFzdA-2O_fuVCxCHOFZzYD4xfPppy0eswg', '2026-02-05 06:37:19', '2026-03-07 05:37:19', '2026-02-05 05:37:19', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.16.159'),
(57, 44, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjcwMDg0LCJleHAiOjE3NzAyNzM2ODQsInVzZXJfaWQiOjQ0LCJqdGkiOiI0ODhmYjg0YjE5NzFiYWNjY2M0YWFhMDMzM2NmNWQ1YyJ9.v7Di6J1nFmo4QKu66MZxaq4Yi-7SLquuDyGYDw3WjPI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjcwMDg0LCJleHAiOjE3NzI4NjIwODQsInVzZXJfaWQiOjQ0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI5NWEyMWQwMjg0YjE4OTA5ZDI3Y2NlOGE5ZDVjODliIn0.wunsoRFfsIpos0dtWHfa_hmG6zfIVpVqsvyXRoakTV0', '2026-02-05 06:41:24', '2026-03-07 05:41:24', '2026-02-05 05:41:24', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', '102.18.160.61');
INSERT INTO `aem_auth_tokens` (`aem_id_token`, `aem_id_user`, `token`, `refresh_token`, `expires_at`, `refresh_expires_at`, `created_at`, `is_revoked`, `user_agent`, `ip_address`) VALUES
(58, 50, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjcyMTcxLCJleHAiOjE3NzAyNzU3NzEsInVzZXJfaWQiOjUwLCJqdGkiOiIwYmNkZWJmNjcyZDllYmQwOGMzN2M2M2ZjZjBmZTMxNCJ9.L4pfceaB45AbKuDmkvH0huXKKkJL6Djiu66XrrD3Xow', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjcyMTcxLCJleHAiOjE3NzI4NjQxNzEsInVzZXJfaWQiOjUwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijc1MWYzYTEyZDU3OTJiMzkwOTg5MmU3MDUzZjRhOWZiIn0.LZBCAnxK6imylPOM6rlozwp8Hc0OLXNx0bB-kPBYy_Y', '2026-02-05 07:16:11', '2026-03-07 06:16:11', '2026-02-05 06:16:11', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', '41.77.19.16'),
(59, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjg1MDU4LCJleHAiOjE3NzAyODg2NTgsInVzZXJfaWQiOjI5LCJqdGkiOiJiNWE2NzNhMDA4OTk0OGFjZTM4ZDM0NzhhZWQ0ODQyMyJ9.Gx88yGqrfrOV2k_82UvxM9gB2Qk4e_UTKJIaF8-jUes', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjg1MDU4LCJleHAiOjE3NzI4NzcwNTgsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjkyOGE2NDU3ZDA1YmY5N2MwYjM5OTdmMmJhOTlkMDU3In0.vRyJKnYVVDG9DiYrqyePIakooDne08J0s5buFGHwDG4', '2026-02-05 10:50:58', '2026-03-07 09:50:58', '2026-02-05 09:50:58', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/28.0 Chrome/130.0.0.0 Mobile Safari/537.36', '102.68.202.113'),
(60, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjkxOTcyLCJleHAiOjE3NzAyOTU1NzIsInVzZXJfaWQiOjE1LCJqdGkiOiI0YTYyZmMxZTk2M2FlMWI1M2Y2Y2ZmYTA0NWMwM2QwMSJ9.1xM-f8QzzMp3cU7WSZKB96z8ECxLt84VdNaEusnsSG4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMjkxOTcyLCJleHAiOjE3NzI4ODM5NzIsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjBhYjM2YmQxYjVjMDlmYWNmMDczOTFiODJiNzRlODU2In0.4suvS6H5tvsPFrdxj_HzC4uwG5a4NHXS7TNHuiaF7nw', '2026-02-05 12:46:12', '2026-03-07 11:46:12', '2026-02-05 11:46:12', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '41.74.209.15'),
(61, 47, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMzAyMzE0LCJleHAiOjE3NzAzMDU5MTQsInVzZXJfaWQiOjQ3LCJqdGkiOiI2YjYyYzgyZGQxMmM1MWVkYWI0ODM4NTNiNTRhN2ZkZiJ9.jwWRUpdPv_YspGAsQmA96ECMTcJ0R5U69IQYEEptUwM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMzAyMzE0LCJleHAiOjE3NzI4OTQzMTQsInVzZXJfaWQiOjQ3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjJlY2Y1ZTQ2MDE4MGVmNmQ0YWQ0NWE3MmViYzAzNzRlIn0.4oRztEwapIqeKBSdGXapGF6epwzNdOuWL6yrYUzGoXU', '2026-02-05 15:38:34', '2026-03-07 14:38:34', '2026-02-05 14:38:34', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.17.117.60'),
(62, 28, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMzA3MzYwLCJleHAiOjE3NzAzMTA5NjAsInVzZXJfaWQiOjI4LCJqdGkiOiI4ZGUzNzZlOTA5MDZkYjIyM2E1NTc2ZGE2NWFkMWEyYyJ9.UeoWPUEizxKjukSmzK_Io9cltOpn4aovdCGC1ZAevv4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMzA3MzYwLCJleHAiOjE3NzI4OTkzNjAsInVzZXJfaWQiOjI4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjIyMmU3ZTg0Y2JlNzM2MjI2Yzk0YzAyNjBlODdlNjEzIn0.ttOhpKGfHahVm2DZ3zI6lI2VZHwKpGtb2cfeYh7-v8U', '2026-02-05 17:02:40', '2026-03-07 16:02:40', '2026-02-05 16:02:40', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '79.116.154.147'),
(63, 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMzEzMTg4LCJleHAiOjE3NzAzMTY3ODgsInVzZXJfaWQiOjU0LCJqdGkiOiJmMmYxYjJkOWFkYmRjNDdiOTgwMGI5ZjUxMjJhYzYwNiJ9.pD6ztzUKk7iSb55vEYPDiSjORrveEeNaDpEvB61kINk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMzEzMTg4LCJleHAiOjE3NzI5MDUxODgsInVzZXJfaWQiOjU0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjZkYmVmYTBlNjE1YjkzZmFhYzBjNGIwZDExY2M3YjhlIn0.lUnsocVU95nWjr6q-ejLIu8lDj63pA8O1IUKOMf_QU4', '2026-02-05 18:39:48', '2026-03-07 17:39:48', '2026-02-05 17:39:48', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', '102.68.204.234'),
(64, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMzc2MTI5LCJleHAiOjE3NzAzNzk3MjksInVzZXJfaWQiOjI5LCJqdGkiOiJjODcyZDJhMWMyYTE3MmM5MDIzOThlMGQzZmVlODk0NCJ9.3Hibly37YKcLvLRI1r8jhoj3TVqQASL2GmXHcOVep6g', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwMzc2MTI5LCJleHAiOjE3NzI5NjgxMjksInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjVjMGI3MDBmZjZjNzI2OTgwMGJlNGIwYTNjYzNkNjQ4In0.1suW7WqASaWpC4gZAGDV9lL7_uDPfYzZL_GJBonsANQ', '2026-02-06 12:08:49', '2026-03-08 11:08:49', '2026-02-06 11:08:49', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/28.0 Chrome/130.0.0.0 Mobile Safari/537.36', '102.68.203.19'),
(65, 57, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNDA4MDgyLCJleHAiOjE3NzA0MTE2ODIsInVzZXJfaWQiOjU3LCJqdGkiOiI5ZGU3NGVhZGQxNWIzZGEyMjVjNmM5ZGMzMTYyZDNkYSJ9.J9IMeNk49sbnR10VyOhSIU3h2XSFDP16VnFN9F-Trb4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNDA4MDgyLCJleHAiOjE3NzMwMDAwODIsInVzZXJfaWQiOjU3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRlN2E2MmE2N2RhYmY0NjNjODkyYzg0YTViMTVjYzcxIn0.Jd6uve2GKs_ztveZA4dxc5-rOwzK-s2muTlroywyng8', '2026-02-06 21:01:22', '2026-03-08 20:01:22', '2026-02-06 20:01:22', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.17.118.16'),
(66, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNDU2NjgwLCJleHAiOjE3NzA0NjAyODAsInVzZXJfaWQiOjI0LCJqdGkiOiJhNTU2MThjZWY0ODRmZGM1MTdlMmZlOGM5N2E3ODBiNyJ9.-ndJ41PmKXFTVunqHFhV_zWAA_q6ZrG4lPk-dO_OCIM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNDU2NjgwLCJleHAiOjE3NzMwNDg2ODAsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQzY2U1MDBmNmQ2YmU5MzU2OTk0MjA4ODdmMzk4YWE2In0.9ETgPLJW03E_gHHOruVmc7Lpq3qijm9pbkQAo8uK6-4', '2026-02-07 10:31:20', '2026-03-09 09:31:20', '2026-02-07 09:31:20', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.119.62'),
(67, 55, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNDU5OTY2LCJleHAiOjE3NzA0NjM1NjYsInVzZXJfaWQiOjU1LCJqdGkiOiI3NjBhNzllZTUwZDNmMDg4ZWZlNmVhNDllNDMxZWQ5ZSJ9.vSIIAw_VqV_xj_PjHyRPIkszdw6G8fbgSsZbFdqwBpc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNDU5OTY2LCJleHAiOjE3NzMwNTE5NjYsInVzZXJfaWQiOjU1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQ3OWE0ZjMwYjMzZTJhNDJkNGM1MWI3MWE5MDhhOWNkIn0.jLs_A8WCkW4hUCly-7hPt4cOORwPpCDu77upyRaSE-Y', '2026-02-07 11:26:06', '2026-03-09 10:26:06', '2026-02-07 10:26:06', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '102.18.161.240'),
(68, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNTI1NDI3LCJleHAiOjE3NzA1MjkwMjcsInVzZXJfaWQiOjI0LCJqdGkiOiIxMDcyMmZjM2MzNzk5NjRmOGIzNWQzMTNlMmY3NWM2MyJ9.VZGKdTs8PhdtAGRbXeJCOgNx9de11N2S2qVjBRis7_o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNTI1NDI3LCJleHAiOjE3NzMxMTc0MjcsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjEyMDBmZGQwMmM4YWFiMzQ4ZDg5NjdhOTk0NWMxZGQ4In0.FgTMGAHMYiji89ALlRDhEqJmNYqZRZK2L95c52X6njY', '2026-02-08 05:37:07', '2026-03-10 04:37:07', '2026-02-08 04:37:07', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.18.161.22'),
(69, 20, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNTQxMzkxLCJleHAiOjE3NzA1NDQ5OTEsInVzZXJfaWQiOjIwLCJqdGkiOiI5OWMyN2I2NzI3OTNjZjNkOGY2NTI0NTI0OTczYjgxNiJ9.2T3bIprQpjmP6CgurHpOBtHTdZLEGriwVlodBYxA47o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNTQxMzkxLCJleHAiOjE3NzMxMzMzOTEsInVzZXJfaWQiOjIwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImYwMTk1MTY2MzJkYzAzMTZjZmMyNzMxZWI4MTQ4YWE3In0.z1e8exBYfO7pXVajPqVR9bBOEUxi4SBclKVto7lIT3E', '2026-02-08 10:03:11', '2026-03-10 09:03:11', '2026-02-08 09:03:11', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', '102.18.157.143'),
(70, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjEzMTI2LCJleHAiOjE3NzA2MTY3MjYsInVzZXJfaWQiOjI0LCJqdGkiOiI1NDE4ZDM4ZThiMjVkMGI1YzA0NmE0NTk5NjAzN2VhZSJ9.wxmKvL4730CZ1hGzPLOt_83Qkaw3421PNMwk7Wsesmo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjEzMTI2LCJleHAiOjE3NzMyMDUxMjYsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjgyZWIzMWE3NGVhZmY0YjkzYjM2ODRhODdlNjIwNzA3In0.8tq3DozYnVE7mVxcTkWSSg0qMxorEAAy9EGjVK7sPfg', '2026-02-09 05:58:46', '2026-03-11 04:58:46', '2026-02-09 04:58:46', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.18.161.125'),
(71, 61, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE0MTAzLCJleHAiOjE3NzA2MTc3MDMsInVzZXJfaWQiOjYxLCJqdGkiOiI4NzNiODk4ZGU5ODE1NDU4N2FkOTE4ZTM0MDkxMTY0NCJ9.D_omHgCeSLk6yTVFY2lWZfVKByxCp_-aZH2J8Cj4vI8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE0MTAzLCJleHAiOjE3NzMyMDYxMDMsInVzZXJfaWQiOjYxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRlMzA5YTk3Y2Q1NzkwOTY5ZjBlYzNiMDAyMmJmMmVhIn0.OLyJrU2aEMoUkqPD4QUJLmzkLddwcMg7G5nZAOMPV3A', '2026-02-09 06:15:03', '2026-03-11 05:15:03', '2026-02-09 05:15:03', 0, 'Mozilla/5.0 (Linux; Android 10; MI 8 Lite Build/QKQ1.190910.002) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.118 Mobile Safari/537.36 XiaoMi/MiuiBrowser/14.47.1-gn', '129.222.109.138'),
(72, 51, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE3NzkxLCJleHAiOjE3NzA2MjEzOTEsInVzZXJfaWQiOjUxLCJqdGkiOiJmZmFjN2NmNTdmODc0NTAwMmVmMWM5NDgyYTQ4MDAyYSJ9.DM6i65_KNjJ6WWqszsHNdUQppcRMuGtoyQXxA74QcDs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE3NzkxLCJleHAiOjE3NzMyMDk3OTEsInVzZXJfaWQiOjUxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjhmYTg3MzM3ODZmOGZjODEzNGNkYjU4OWY1NWE2OTIyIn0.-tCh9MuomftM59Mh3kg1GzQVBxoN7fKHIsR9ok0_n9A', '2026-02-09 07:16:31', '2026-03-11 06:16:31', '2026-02-09 06:16:31', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.17.119.149'),
(73, 68, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE4MzU1LCJleHAiOjE3NzA2MjE5NTUsInVzZXJfaWQiOjY4LCJqdGkiOiI0ZmE1M2I4YWZkYjViMGM4ZmZlMjE5OWZmYmM5ZjQyZCJ9.6d_5vwW7ObgcZ6RjQ61Jq1f6kgxCdpexOackx2EOHYY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE4MzU1LCJleHAiOjE3NzMyMTAzNTUsInVzZXJfaWQiOjY4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI1MGE3YWM1NDFkYjE3MTQ1NzNkYzhjNWJmZDBkMWViIn0.7pbEXb7KISOQC7-FU7vLGbMRfaVaybZYj_H1xswAONo', '2026-02-09 07:25:55', '2026-03-11 06:25:55', '2026-02-09 06:25:55', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.17.3'),
(74, 60, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE4NDA4LCJleHAiOjE3NzA2MjIwMDgsInVzZXJfaWQiOjYwLCJqdGkiOiI4Y2NlNTJlNzE1NTk0NmQ4YmZmN2YzNjc1MDY0MTEwZSJ9.-irE5c5MgcdbPUTOEDGi2j7rWot9AFkwY6ndfBD3-s8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE4NDA4LCJleHAiOjE3NzMyMTA0MDgsInVzZXJfaWQiOjYwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQ3ODIwZDY3OWExZTMwOWM0M2ZkMDAyMmIxZDAzOGEwIn0.V_wpruqeKQJiR5ja6BVfuvGkPplpCKWc8Kjv7WQ1GGs', '2026-02-09 07:26:48', '2026-03-11 06:26:48', '2026-02-09 06:26:48', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.17.118.199'),
(75, 22, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE4NjUxLCJleHAiOjE3NzA2MjIyNTEsInVzZXJfaWQiOjIyLCJqdGkiOiJlNDU5ZWFkYWVmYTI3ODBlODZjZjI5ZmRlYzVmYjE1NCJ9.33o0MAZbavjPw9Sz2vmb5uSaXms2Q04c4FibchRLcoo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE4NjUxLCJleHAiOjE3NzMyMTA2NTEsInVzZXJfaWQiOjIyLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjFiMjM2MzBjZjg3OTYxNmMwMzkwZWRlM2M4ZjZlMzUzIn0.JfBhWv1VhD8Z6mi0osqhdihGpSb93P9vq67jzmx8h2s', '2026-02-09 07:30:51', '2026-03-11 06:30:51', '2026-02-09 06:30:51', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '41.77.17.248'),
(76, 65, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE4ODE3LCJleHAiOjE3NzA2MjI0MTcsInVzZXJfaWQiOjY1LCJqdGkiOiI5OTZiMTg3MTYwYjdmMGU1NTRhODQ1MTFiMjAyY2IxNSJ9.9iHySOJ5_aa9zMhweZRFcoluUsA07WwVYwMEy6UYo4k', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE4ODE3LCJleHAiOjE3NzMyMTA4MTcsInVzZXJfaWQiOjY1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI3NDY3ZGVhMjM5MmIyNjc0YWU1NzE2OTBkMGRkZjhlIn0.6N8aEY_QUA1gO7QVYOW31IpClJlC3DOnrtaamaOsiFA', '2026-02-09 07:33:37', '2026-03-11 06:33:37', '2026-02-09 06:33:37', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '154.126.79.157'),
(77, 60, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE5MDE1LCJleHAiOjE3NzA2MjI2MTUsInVzZXJfaWQiOjYwLCJqdGkiOiI2M2ZhNGE3YjNhMTM1YmYyNmFlMjc4NjUxODc3YjE2MiJ9.K6Af5Ld6xd0BolyzTnShSu99du1r5lIJ79GVMVnepz4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE5MDE1LCJleHAiOjE3NzMyMTEwMTUsInVzZXJfaWQiOjYwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImEwMDRlNTBlMGU2YzgyOTRmODNiMTdhOWI5YTk4MzEzIn0.66Lj5t3VYQ3hIROqtPvTkScXxI0AKyiKKSwulPOof0k', '2026-02-09 07:36:55', '2026-03-11 06:36:55', '2026-02-09 06:36:55', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.17.118.199'),
(78, 60, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE5NzM3LCJleHAiOjE3NzA2MjMzMzcsInVzZXJfaWQiOjYwLCJqdGkiOiI5NjM2ZTZmOWZkNDIwZTg2MDRlMjNkMWQ2NDQ1NDU3ZiJ9.kqJ9xv_sWpt1F6a_j9pcCsln9crw89_on60FmbbA_UQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjE5NzM3LCJleHAiOjE3NzMyMTE3MzcsInVzZXJfaWQiOjYwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjcwM2QxMGMwZWE5MjY5ZTlhYThiNzc0OGUwZTNkZWM0In0.hVzD5uI3corksyJt42dtyX6Z3fFuWU-xYEEqlhf5wOY', '2026-02-09 07:48:57', '2026-03-11 06:48:57', '2026-02-09 06:48:57', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.17.118.199'),
(79, 36, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIwMTU1LCJleHAiOjE3NzA2MjM3NTUsInVzZXJfaWQiOjM2LCJqdGkiOiIyMDIyZGFjOTlmZWEyN2NlNjZhYTY3NjhhYzM2YjM5MSJ9.6I0VNTEYOK_3_NNlATp5e2gza_A9WfJDJR_Tv1aZYK0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIwMTU1LCJleHAiOjE3NzMyMTIxNTUsInVzZXJfaWQiOjM2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjJlOTlhN2JjNjdkNzU5MDM1ZDYxMmQyZmZkYzc1NGY2In0.EeblNQa36CozURUQ_-HWCKEkeD2MLczfPH8MDHu0_-k', '2026-02-09 07:55:55', '2026-03-11 06:55:55', '2026-02-09 06:55:55', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.74.208.236'),
(80, 59, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIwNDEyLCJleHAiOjE3NzA2MjQwMTIsInVzZXJfaWQiOjU5LCJqdGkiOiI5NTQ4ZDJhZjFjMTc5NWYxNTU0MmVmNmY5MzE3YjczOSJ9.Kw8C0fR9UYFT3aR7JDGpb5p2Xm8BMcISG4GHp8PMvOk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIwNDEyLCJleHAiOjE3NzMyMTI0MTIsInVzZXJfaWQiOjU5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImM5MGEyZjhjNjVmOTAzZmMyMjFmMmUwNzJjZmE0YjhiIn0.9HixTEJq9vOCX2da9eTpIXR0bgfDQlDXuBdWc25UCVw', '2026-02-09 08:00:12', '2026-03-11 07:00:12', '2026-02-09 07:00:12', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.17.178'),
(81, 23, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIyMDIyLCJleHAiOjE3NzA2MjU2MjIsInVzZXJfaWQiOjIzLCJqdGkiOiI0MmRhMDdjNjIyYzIzNTcxZGU4MTM0NjdmODQ0Mzk4YiJ9.MTaPrTH80nQ5XtgyFIwSLsPrKcEK-pphktRfG1pdIuQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIyMDIyLCJleHAiOjE3NzMyMTQwMjIsInVzZXJfaWQiOjIzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjlkMWNmYzU1OWFlMDIzYjI3YWM2N2U0NWJhZTc3OGVmIn0.t53uboST0exgmmneMup4DqEvRxAym8EpcNJ5ZAJEPk4', '2026-02-09 08:27:02', '2026-03-11 07:27:02', '2026-02-09 07:27:02', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.157.207'),
(82, 23, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIyMDQ0LCJleHAiOjE3NzA2MjU2NDQsInVzZXJfaWQiOjIzLCJqdGkiOiJmNDQ0M2I5NzljMjY1NTA0OTA3NjM2NjQxODcyZTkwZiJ9.xwi1Nm0JBSRvkBPsdhy-qT7PC4ptQ7rLoVMNFwZGoBc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIyMDQ0LCJleHAiOjE3NzMyMTQwNDQsInVzZXJfaWQiOjIzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjIyMTk1NDBiNWMwYTFiNDVmOGQ1NDc4NGY5ODk3YmMyIn0.stAoujj-aWlUcRUN-iGhIaMiJqslTF3bM5M4mkaacB8', '2026-02-09 08:27:24', '2026-03-11 07:27:24', '2026-02-09 07:27:24', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.157.207'),
(83, 23, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIyMjY3LCJleHAiOjE3NzA2MjU4NjcsInVzZXJfaWQiOjIzLCJqdGkiOiI0ZjhiYTc5NmUyYzM0NjhmOWVlNTA2OTJhNTNjYzNhNSJ9.KAUI_Z0L3-BFLJhSHYoNKQATk_aWROmkUS_jca91_aw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIyMjY3LCJleHAiOjE3NzMyMTQyNjcsInVzZXJfaWQiOjIzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijk1ZGY0NmNmNDkzNDZhYjM5YjI4MGFlNWY3ZTZlY2ZjIn0.ANXs-fHX49DxnZovgtRM21_jP-5_iuRRxwcwju0pkjY', '2026-02-09 08:31:07', '2026-03-11 07:31:07', '2026-02-09 07:31:07', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.157.207'),
(84, 32, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIzMTU2LCJleHAiOjE3NzA2MjY3NTYsInVzZXJfaWQiOjMyLCJqdGkiOiIxYzYzM2JkZTlmYjgyMjhmNTA2MjJjZWQxZjhkZmIwYiJ9.21xjvhmjieIWeMF74zIiqmoOCINLrnfLF2VYFrIKYBg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjIzMTU2LCJleHAiOjE3NzMyMTUxNTYsInVzZXJfaWQiOjMyLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjJhZGQ1MmU1YTBiN2EzNGViZTczMDgyMjk1N2JhNmY2In0.6vJGiwyFs8TGep58XWxqNm7n0ea3yYUId2KtChXgUzo', '2026-02-09 08:45:56', '2026-03-11 07:45:56', '2026-02-09 07:45:56', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', '102.18.161.254'),
(85, 34, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjI1NzU4LCJleHAiOjE3NzA2MjkzNTgsInVzZXJfaWQiOjM0LCJqdGkiOiJjZTgzYzkyMGIyMmNjZDY0OTMwNDkxMzE5NWM0ZmViMiJ9.sE-RiXvHbkdFMURI0YczJ1gXg7LwNJIMBLb0qaO3Z5o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjI1NzU4LCJleHAiOjE3NzMyMTc3NTgsInVzZXJfaWQiOjM0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImJhZTdkN2FlNzg3ZTJhNzVlMTU1YTE5MjdiZTFlYzU5In0.gUPA2MD7u7FGteldiYJPY8fIzqwqaHBtOZV71IFM9dA', '2026-02-09 09:29:18', '2026-03-11 08:29:18', '2026-02-09 08:29:18', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '197.148.130.15'),
(86, 60, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjMxOTExLCJleHAiOjE3NzA2MzU1MTEsInVzZXJfaWQiOjYwLCJqdGkiOiJkZjc0OGM0YzcxMTJjNGZhYzA0OTliNzIzMTQxNDQyYiJ9.SJXtNLMgfNQ9N7iWUldadElCNeiz7kYKSo1l9fP_9XM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjMxOTExLCJleHAiOjE3NzMyMjM5MTEsInVzZXJfaWQiOjYwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImIzMmE0YWM3NzFhZTQxODI2NjIyYjliNWM3N2IwOGE4In0.0JDVez6J42nBaCvZ1K4wdpCa5Q-1wO_ugILOJLm1mB4', '2026-02-09 11:11:51', '2026-03-11 10:11:51', '2026-02-09 10:11:51', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.17.118.199'),
(87, 61, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQwNzQxLCJleHAiOjE3NzA2NDQzNDEsInVzZXJfaWQiOjYxLCJqdGkiOiJkZDVjM2IyZGVhZDkzMDY2NGFiOGI5M2VkMWU2NjJjZSJ9.UeY8KWIxXXyzZijhM5ndIWdsm4mCM6dWz4am4Fc2-MI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQwNzQxLCJleHAiOjE3NzMyMzI3NDEsInVzZXJfaWQiOjYxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjZlMGM1MWY2YTlhNWMwNmI5YTY3YjFmOWYzNTgyMGRkIn0.iRJJm6pkwyXxk_rXHL1f4WIWeuKxyVFbdZaYq_HoWwI', '2026-02-09 13:39:01', '2026-03-11 12:39:01', '2026-02-09 12:39:01', 0, 'Mozilla/5.0 (Linux; Android 10; MI 8 Lite Build/QKQ1.190910.002) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.118 Mobile Safari/537.36 XiaoMi/MiuiBrowser/14.47.1-gn', '129.222.109.138'),
(88, 61, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQwNzgzLCJleHAiOjE3NzA2NDQzODMsInVzZXJfaWQiOjYxLCJqdGkiOiI5NTQ2OWJlYzE1MzU2YTMzNTAxMzJjZDc1MDE1NzVkYiJ9.reBKLp08N7eFOsYBHGPPD4tu85W4oeAkOiCWAnJ7zw8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQwNzgzLCJleHAiOjE3NzMyMzI3ODMsInVzZXJfaWQiOjYxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjAwMjAxMzAzOGE5MTNmYzVjNGMyNTNjM2JiMmViMjM1In0.d7JCM-Eyk2Fci1H25FVe-X1XUwosW85DuYeq8WX9uJw', '2026-02-09 13:39:43', '2026-03-11 12:39:43', '2026-02-09 12:39:43', 0, 'Mozilla/5.0 (Linux; Android 10; MI 8 Lite Build/QKQ1.190910.002) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.118 Mobile Safari/537.36 XiaoMi/MiuiBrowser/14.47.1-gn', '129.222.109.138'),
(89, 61, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQwODU1LCJleHAiOjE3NzA2NDQ0NTUsInVzZXJfaWQiOjYxLCJqdGkiOiJhYWU3MjRlYzM1OWFiMGVkNDI2NWQzODk4NGZjNjkzYSJ9.vQ6cTQ0lH63eT8qOYBuqt-CBKNdIjoWRVFvvbjmFumY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQwODU1LCJleHAiOjE3NzMyMzI4NTUsInVzZXJfaWQiOjYxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjNjMjQ0ZGQ2ODFjOTE0NTRjMTZmOWU3NjJjNWU1ZGMyIn0.YlCDh92uqU4s1xLKFEkzsr9IxVkupj58uW-JqgSc-vk', '2026-02-09 13:40:55', '2026-03-11 12:40:55', '2026-02-09 12:40:55', 0, 'Mozilla/5.0 (Linux; Android 10; MI 8 Lite Build/QKQ1.190910.002) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.118 Mobile Safari/537.36 XiaoMi/MiuiBrowser/14.47.1-gn', '129.222.109.138'),
(90, 61, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQxMDU2LCJleHAiOjE3NzA2NDQ2NTYsInVzZXJfaWQiOjYxLCJqdGkiOiJkZmFlODJjMzM5NGFlNDFmMzlmYjZhOTU2MzA5NTc1MSJ9.JTaAPPn_VZjMSvwSRLTR_ogfXV2veHGhKdLWl3Ennh8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQxMDU2LCJleHAiOjE3NzMyMzMwNTYsInVzZXJfaWQiOjYxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjE2Nzk0ZGQ0NjU2YmUyYjRmZjkyODY3YmNmYzY5NzczIn0.Ybm2Q3JRfAf-Y-lUD7W7eCG9lvCE73SURt2C9by7hfc', '2026-02-09 13:44:16', '2026-03-11 12:44:16', '2026-02-09 12:44:16', 0, 'Mozilla/5.0 (Linux; Android 10; MI 8 Lite Build/QKQ1.190910.002) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.118 Mobile Safari/537.36 XiaoMi/MiuiBrowser/14.47.1-gn', '129.222.109.138'),
(91, 61, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQxMjUyLCJleHAiOjE3NzA2NDQ4NTIsInVzZXJfaWQiOjYxLCJqdGkiOiI0MDI0OWIwNTlmNWZkYmZhYzFjMTc5Y2I5ZGVhOWNiYiJ9.cWDC7iwSzf7Nhc9fydajPUGnutw0DH2VP_qI7wOtx5w', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQxMjUyLCJleHAiOjE3NzMyMzMyNTIsInVzZXJfaWQiOjYxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImIzN2I5NTExZDdkOTZlNTZkMjZjZmUxZDU4OGNkZDYyIn0.TkD6vTBCVHUpdm37KIDhrbKFRZHiVvcGSunKI7y9hbU', '2026-02-09 13:47:32', '2026-03-11 12:47:32', '2026-02-09 12:47:32', 1, 'Mozilla/5.0 (Linux; Android 10; MI 8 Lite Build/QKQ1.190910.002) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.118 Mobile Safari/537.36 XiaoMi/MiuiBrowser/14.47.1-gn', '129.222.109.138'),
(92, 61, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQxMjc1LCJleHAiOjE3NzA2NDQ4NzUsInVzZXJfaWQiOjYxLCJqdGkiOiIzMzE0M2JmOWIzOTNiMGRiNjg4MjMwZTNkMjhjMzE5YSJ9.zjTeTEhlulvYVL7JeUI-earDDyvTJXF-o21X8d1ABM0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQxMjc1LCJleHAiOjE3NzMyMzMyNzUsInVzZXJfaWQiOjYxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImJkN2Y4ZTMwYmM5NTcxMTcyZWUwMjAzMmVkZWNjM2JlIn0.3lBvAczqYqzP1GvpBV9nMTEMu1IzABzCbFEsNcY3ZtU', '2026-02-09 13:47:55', '2026-03-11 12:47:55', '2026-02-09 12:47:55', 0, 'Mozilla/5.0 (Linux; Android 10; MI 8 Lite Build/QKQ1.190910.002) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.118 Mobile Safari/537.36 XiaoMi/MiuiBrowser/14.47.1-gn', '129.222.109.138'),
(93, 58, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQxMjc3LCJleHAiOjE3NzA2NDQ4NzcsInVzZXJfaWQiOjU4LCJqdGkiOiI2ZjYwZjkwNTQ2NmNiN2Q2NjM4MWM3NmE4MDZjMjllYiJ9.JFm5eZmznI8klJ5qtwV3tuTr3SeM_l50wKLjzb18enk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQxMjc3LCJleHAiOjE3NzMyMzMyNzcsInVzZXJfaWQiOjU4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImFkMDVkYjFmNGMyOTcwNWI0ZTc5ZGMzMGE4OTBkYThiIn0.1t7HqIr08f-44WDrKnn3OItHDWcuGqSKc7l4VFgz_wA', '2026-02-09 13:47:57', '2026-03-11 12:47:57', '2026-02-09 12:47:57', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '129.222.109.95'),
(94, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQyMDU1LCJleHAiOjE3NzA2NDU2NTUsInVzZXJfaWQiOjE1LCJqdGkiOiJhOTNkNTZhMmQ4ZjVhZDM1MTk4OWU0ZWNhZmMyNjJlZiJ9.wLqOml5l_cyuUbVTXz6ncIypPeTKd3U1XmTRST5RoAY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQyMDU1LCJleHAiOjE3NzMyMzQwNTUsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjE3ZTJlYzc5MTllM2Q0ODA3ZWVlZTcxNjlkNDM2ZDhmIn0.nU6SfdgGNrtmneUxcxu23bvcAC4AlxZXxqCyV1GUqEE', '2026-02-09 14:00:55', '2026-03-11 13:00:55', '2026-02-09 13:00:55', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '41.74.210.193'),
(95, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQzNzQ3LCJleHAiOjE3NzA2NDczNDcsInVzZXJfaWQiOjE1LCJqdGkiOiIyYTgyMTVlZWRmZGM3YTZkMWEwMjU5NjUxNWMxZDljMiJ9.2-ubydK4UrbRhxNk_fYAClAACXdZE_FJMiiY1v7EjNg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQzNzQ3LCJleHAiOjE3NzMyMzU3NDcsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImUxMzBkNzE5ODUxMzA4NmFhZDc2NTMwMzY4NjBmNjM0In0.__fOoeb4FAs9jfWX1zZLb7dVkqueqcIPfDfTBD6xs7I', '2026-02-09 14:29:07', '2026-03-11 13:29:07', '2026-02-09 13:29:07', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '41.74.210.193'),
(96, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ0NDU4LCJleHAiOjE3NzA2NDgwNTgsInVzZXJfaWQiOjE1LCJqdGkiOiI3Mjc4YmZjNGU3NGI1NWVhNjg3OWU1ZTZjNTRkY2VlNCJ9.vQgjktlCGfkBlv38IxGYC7X0yNEeaRY65YrLvz9iIvU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ0NDU4LCJleHAiOjE3NzMyMzY0NTgsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImJhZTJmNmZkMzFhNTYwN2RjYzhkMGYxNzczNDk3N2IyIn0.aNBaXf7ZLAwK9jBP0qetxEWR5958p_2H3lz7k_xDObM', '2026-02-09 14:40:58', '2026-03-11 13:40:58', '2026-02-09 13:40:58', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '41.74.210.193'),
(97, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ0NDcyLCJleHAiOjE3NzA2NDgwNzIsInVzZXJfaWQiOjMwLCJqdGkiOiJhMzdkN2Y4ZmRkYzNmMDM3YWEzM2M2YmU3NWVmN2NkZCJ9.q4WvwtEAjSTMmIOGr7xK6stnOo3fO7cd8aKGv58XSvE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ0NDcyLCJleHAiOjE3NzMyMzY0NzIsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjMwZDI5Y2E3YmU3N2E3ODU3YWNhMzk3MzhmODBiNDI5In0.xCcA4FrGVHyExzsJJPRWopIJqp4QTkpCeYokSVgmci0', '2026-02-09 14:41:12', '2026-03-11 13:41:12', '2026-02-09 13:41:12', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.19.30'),
(98, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ1MDc3LCJleHAiOjE3NzA2NDg2NzcsInVzZXJfaWQiOjMwLCJqdGkiOiJkZDlmOTkwYzhlZjFiY2QyOWJiZjMzNTlhYzY1ZmNhNSJ9.35-E9c-tnKJpD4F5cNuef1lkoiJjRgTqK7w9CY6xiHo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ1MDc3LCJleHAiOjE3NzMyMzcwNzcsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImM5ZmY3NTM4NWNkNzMwY2ZjY2FhNGY4MTBkNGE3ODc3In0.vhQYHi0_HT6XlpyWJ06Xe3MXf0Rr2VpMr6J6ywPD_BA', '2026-02-09 14:51:17', '2026-03-11 13:51:17', '2026-02-09 13:51:17', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.17.245'),
(99, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ1MzUzLCJleHAiOjE3NzA2NDg5NTMsInVzZXJfaWQiOjMwLCJqdGkiOiI5YWExNGE4YjU1MDJlOWI2ZGI5ODQ1NWZhOTdlNWJiMiJ9.gChx3iD4Y9jWl3n3tL-zGohA2OscgPJATCHic37HePE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ1MzUzLCJleHAiOjE3NzMyMzczNTMsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjZmMTMzM2U2Zjg2YTg0ODkzMzVkMmZkMjI3NmE0OGY5In0.rR5tyuP-zNbIeTAUc-8ooSrC0WYv1dAOt_UyKVGAx2M', '2026-02-09 14:55:53', '2026-03-11 13:55:53', '2026-02-09 13:55:53', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.17.245'),
(100, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ1NTIwLCJleHAiOjE3NzA2NDkxMjAsInVzZXJfaWQiOjMwLCJqdGkiOiJlMTk1YzhmN2U1MzhiZGNjMjgzMDVmMmYxNTY2NGNkNiJ9.hwB9hjqi2x7tfyPY-tAhKSvjXXse81w88NO2u-YoHQk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ1NTIwLCJleHAiOjE3NzMyMzc1MjAsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjM1ODUwODUwNGZkMzNiMjRmMmFhM2Y2M2FkNTA5OGMzIn0.F3YlocFu2J86hUZNSZ3WBnHTw763Hsp5RBmKz2A1mq8', '2026-02-09 14:58:40', '2026-03-11 13:58:40', '2026-02-09 13:58:40', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.17.245'),
(101, 66, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ2ODAzLCJleHAiOjE3NzA2NTA0MDMsInVzZXJfaWQiOjY2LCJqdGkiOiJjMjc4OWI1ZGIyN2FlZTkwNDQzOTEzMTgwYTRkMmJmZiJ9.buSjGV3gDmibYgWHeOWPa6FrnOl2vEn1JVFuG_GwzEM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjQ2ODAzLCJleHAiOjE3NzMyMzg4MDMsInVzZXJfaWQiOjY2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjY1MjNiMmVlZWE1OWIzMmM3OTBhYzExYzZmYTk2NWIxIn0.JmVRkIs5PRxppvQwUI2peYsX-tqLWFBvfX1RIQUEAWk', '2026-02-09 15:20:03', '2026-03-11 14:20:03', '2026-02-09 14:20:03', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '129.222.109.90'),
(102, 33, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjY2MzU0LCJleHAiOjE3NzA2Njk5NTQsInVzZXJfaWQiOjMzLCJqdGkiOiIxNGNjM2VlYzk4MGI3OTBkN2RhYjBhMWJlODIxMzkxMiJ9.tcpIaWtnJXsZrkAntA64G4XumAImb-70AIq0bgmxkxw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjY2MzU0LCJleHAiOjE3NzMyNTgzNTQsInVzZXJfaWQiOjMzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjVlZGU3NGE0MmE3MjhjMjM1N2FmYmMzM2VmYmJjMGYzIn0.Kodov5_kOqd_otzH2Rp7W7XPhkQCLPlUa0uYljYKbFg', '2026-02-09 20:45:54', '2026-03-11 19:45:54', '2026-02-09 19:45:54', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.159.107'),
(103, 33, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjY2MzU3LCJleHAiOjE3NzA2Njk5NTcsInVzZXJfaWQiOjMzLCJqdGkiOiJlNmQzMjU5Nzc4MjNjYWNhOTc2NmI4ZDA3MGZlZThiNyJ9.RqeLsDP9-uit8vrt10jG0PwRQYDRCCup9VDI3FBmgWE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNjY2MzU3LCJleHAiOjE3NzMyNTgzNTcsInVzZXJfaWQiOjMzLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjA1MDBmN2FkN2QwNzkwZjRjZTVkZGI4OGU4NjUzOGE5In0.aIAkPBeTTxlNYS5BoNRARyze_RIjIzhW0Uqzm7MxCdU', '2026-02-09 20:45:57', '2026-03-11 19:45:57', '2026-02-09 19:45:57', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.159.107'),
(104, 26, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNzQwNDA2LCJleHAiOjE3NzA3NDQwMDYsInVzZXJfaWQiOjI2LCJqdGkiOiI1MTUyNTYwY2NkZWJlN2U0YTc3MWQyNTljN2Q3NDdhNCJ9.MDuf93EhgVpYlSwFDWFnTsKmLOICtGNM1dXvRI3G9Ps', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwNzQwNDA2LCJleHAiOjE3NzMzMzI0MDYsInVzZXJfaWQiOjI2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImZmOWE1MTk1N2Y0YmU5MmQwMGQ3ZWI0ODdkMWNhOWZiIn0.cLnkRYO4STNV3IpZzpNFylG9CG2D3j4TWAGIvn5Yi0U', '2026-02-10 17:20:06', '2026-03-12 16:20:06', '2026-02-10 16:20:06', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.74.213.178'),
(105, 35, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwODY1ODc4LCJleHAiOjE3NzA4Njk0NzgsInVzZXJfaWQiOjM1LCJqdGkiOiI5NjE2ZGI4M2RlYTJhOGMyM2FhY2QxODFlYjRmZjkyMCJ9.AbhgB8dWT6ya3w7R10auKDqoOLhtjmELxOfNe9fprjk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwODY1ODc4LCJleHAiOjE3NzM0NTc4NzgsInVzZXJfaWQiOjM1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImZiNmE2ZmM5M2FhMDIxZGNmZGQ1ODIyYmJkNDRiNTM0In0.Zn6N6l4fBmqExnp0Sq2qHw-XZGgg3nQV9Dxa-QEuEJY', '2026-02-12 04:11:18', '2026-03-14 03:11:18', '2026-02-12 03:11:18', 0, 'Mozilla/5.0 (Linux; Android 9; LM-Q630) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.116 Mobile Safari/537.36', '102.68.192.20'),
(106, 27, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwODg4OTY0LCJleHAiOjE3NzA4OTI1NjQsInVzZXJfaWQiOjI3LCJqdGkiOiIwZWM3ZmU0NjRlM2M1MWUzYmIzMjdlZmNiZmIzYWUyYyJ9.Pgl_3SlTbr9yaHSsLgFcHxqNN5NP8kPAa3HJK7X_Xtg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwODg4OTY0LCJleHAiOjE3NzM0ODA5NjQsInVzZXJfaWQiOjI3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjE2NzA2YzEyODU4ZTBiMGZhYjU4Mzc4N2E1Yzc1ZGZiIn0.dOiSoKMV-FFBqdH2bPgtp2D-VJhzWzbKfbzAMkKIGCY', '2026-02-12 10:36:04', '2026-03-14 09:36:04', '2026-02-12 09:36:04', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '196.20.185.231'),
(107, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwOTYwNDYyLCJleHAiOjE3NzA5NjQwNjIsInVzZXJfaWQiOjI0LCJqdGkiOiI5ZjI2NzkxZWIwMmI1OTkyNTRiOWRlOWFjNzM0NDBmZSJ9.BrjdGtWCf8lZPcphzfNr_GVD-ePSnDFCTAlHaEtD0g8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwOTYwNDYyLCJleHAiOjE3NzM1NTI0NjIsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjA5ZjA0Y2ZjYmNmODkzYmIyN2VjOWM0ZTZiOTBkY2UwIn0.04oj-KrMBto8CH2vNgLvzQcGYOEe6VXPsAKsYoGbOKU', '2026-02-13 06:27:42', '2026-03-15 05:27:42', '2026-02-13 05:27:42', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.120.14'),
(108, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwOTYwNDkxLCJleHAiOjE3NzA5NjQwOTEsInVzZXJfaWQiOjI0LCJqdGkiOiI0ZTA2NTdkNmE2YzQ3YjEwOTE3NmYwZTM3ZGRkZTVlNSJ9.rdyeartVAiDC5TjByG_IbBfNuX6MidRcgJYro-RUQJc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcwOTYwNDkxLCJleHAiOjE3NzM1NTI0OTEsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjYyYTg1ZWJlOTU2ZmIxZTI4OThiNGIzYTIwYWEyM2RiIn0.riQ-oKTSiB_pZaF1I_kQzwOG9YSRUFI_tBNrv-AuVdI', '2026-02-13 06:28:11', '2026-03-15 05:28:11', '2026-02-13 05:28:11', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.120.14'),
(109, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMDg0NTYxLCJleHAiOjE3NzEwODgxNjEsInVzZXJfaWQiOjE1LCJqdGkiOiIwMTE5OWE4NzI3YmY2ZWI0ZDQ1YWNiNDBiZWNiOTI2YSJ9.PxgXykqTDXh9plgVx-Zf4f10YlfZ5rJWXtwAK4CcF4E', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMDg0NTYxLCJleHAiOjE3NzM2NzY1NjEsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjY2ZWQ4MjQ2YjY5MmRiMDNjYjY4MTJmNmJmZDRiN2U4In0.6xljmR56u6VMTqwgZmy-eNmWRLQZPpBnVCbgYm7YUEA', '2026-02-14 16:56:01', '2026-03-16 15:56:01', '2026-02-14 15:56:01', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '154.120.180.175');
INSERT INTO `aem_auth_tokens` (`aem_id_token`, `aem_id_user`, `token`, `refresh_token`, `expires_at`, `refresh_expires_at`, `created_at`, `is_revoked`, `user_agent`, `ip_address`) VALUES
(110, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0MTEzLCJleHAiOjE3NzExNTc3MTMsInVzZXJfaWQiOjg0LCJqdGkiOiJlMzYwMmEzOGQ4NzZlMDQwNjhkMjE2NWY2NThiOWEyYyJ9.NqAHydXNgF6qDhID2YiSRCjRE80tbyOnyAMmkPk7xWo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0MTEzLCJleHAiOjE3NzM3NDYxMTMsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImRjOGZmNTFkNGMwMzNiNDIwMDQzNjRhYmUxNjYwODM2In0.OFdKue_wfl6V5naIupA531g9yLznRHC0wFUUYIwNImA', '2026-02-15 12:15:13', '2026-03-17 11:15:13', '2026-02-15 11:15:13', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(111, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0Mjg5LCJleHAiOjE3NzExNTc4ODksInVzZXJfaWQiOjg0LCJqdGkiOiJhMTFmOWI0NDY1OWNlYWE2Mzg5OGMwNGQ5YTBhODJiZCJ9.HwvkTLl-SLr9mVvyV-pSMc_nAWo81aYD2EozFdr8_f8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0Mjg5LCJleHAiOjE3NzM3NDYyODksInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRhYTc1ZjgyOThlNDJhOGNiYTI4ZTk1ODAzMmE5YzQ1In0.Ji9HveV4dCYzukiOuf4ubdhCu0PLDMsLaUut4TNNb9o', '2026-02-15 12:18:09', '2026-03-17 11:18:09', '2026-02-15 11:18:09', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(112, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0MzEwLCJleHAiOjE3NzExNTc5MTAsInVzZXJfaWQiOjg0LCJqdGkiOiJkMDgzZGI0OTExYzdmZTMxMDZhNGRiY2E4MjY3YWM1NiJ9.1w8SlFj8vKWr38MveUjrm2Q3G08p_O77OkS6GNj-O6k', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0MzEwLCJleHAiOjE3NzM3NDYzMTAsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImE1ZTk2ZjAwMzQ5NzViYmY4YTYyMjYwNmMzMTViZGQ5In0.svUFG763QmoENeiWWPul3qu63gcYZaDZu7Oe6xEoLEk', '2026-02-15 12:18:30', '2026-03-17 11:18:30', '2026-02-15 11:18:30', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(113, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0MzIxLCJleHAiOjE3NzExNTc5MjEsInVzZXJfaWQiOjg0LCJqdGkiOiJkYTRjYWIxZmJjODQ4MDM3YmVkMTRjZGI1YjRkYzFjNyJ9.Us0CPGh5P9-NMuaGBB2Eifp5Wn6mR3lma7JxVoWP7z8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0MzIxLCJleHAiOjE3NzM3NDYzMjEsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImI2YTM2N2IyODI5MzZhMmY2MGVmNjI1MzE4NDExMWRjIn0.5TqOmKMxNIKXjLPYTrHOflBIEqBmh9wa8FNCp10sEpY', '2026-02-15 12:18:41', '2026-03-17 11:18:41', '2026-02-15 11:18:41', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(114, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NTE5LCJleHAiOjE3NzExNTgxMTksInVzZXJfaWQiOjg0LCJqdGkiOiJmZWQwNzU1YjIzNjZlZmNmY2IxYTE4YjU0ZDRjYzRhNiJ9.MDidMxVm-6VkeIlq9XXPCccFaG3o-GbO1NLES_ve6qA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NTE5LCJleHAiOjE3NzM3NDY1MTksInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImU3YjAwZDZmZWJhZWQzNDMwMDE1NzljMzYyYzAxMDQzIn0.caZl7nzGqXTJzYJDpbDdJnaX0VRfbpR4amSgH7eg4yc', '2026-02-15 12:21:59', '2026-03-17 11:21:59', '2026-02-15 11:21:59', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(115, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NTMwLCJleHAiOjE3NzExNTgxMzAsInVzZXJfaWQiOjg0LCJqdGkiOiJkYmJlYjcxMGZmOTRhY2RiMGIzODdiYWMyZjFkNmJmZCJ9.hit913P5BD5WFnfMYdCF5NLb8tRb7oTlF0RD8yE0QtA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NTMwLCJleHAiOjE3NzM3NDY1MzAsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImJhN2RlZmFlM2I4ZGI3MTZlNzg3MzBiNGJhYzMyOGI1In0.lWGPcwB4bn5Uze4aKU88L5Tf3cd7DTzMy-IGEbrGxK0', '2026-02-15 12:22:10', '2026-03-17 11:22:10', '2026-02-15 11:22:10', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(116, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NjQ2LCJleHAiOjE3NzExNTgyNDYsInVzZXJfaWQiOjg0LCJqdGkiOiJiOTFiOTNjMjA1MDM3NzhiMDI5YWMyYmNiMGU1MDA4NiJ9.pXzYsw2lvo6qxThi1BXnlUre_oru3Bkgj6v7pQF7jZY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NjQ2LCJleHAiOjE3NzM3NDY2NDYsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImVmOTFhYjUyOTI2ZDJjYzUyNmJlZTJiOTI4MTA5ZjY2In0.6QEzp8PEXTxOuqPNNXBAYXIDluCIFH5VT1lJZT5Nk-U', '2026-02-15 12:24:06', '2026-03-17 11:24:06', '2026-02-15 11:24:06', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(117, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NjY3LCJleHAiOjE3NzExNTgyNjcsInVzZXJfaWQiOjg0LCJqdGkiOiIwZjYyYTg5NWVjZGI5NDAyMGJmOTIxYzEzMDY2YjNkZiJ9.OBHmaddeahL779KcfxP6nWo6oAri1Ng7aHpAOV6U7jw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NjY3LCJleHAiOjE3NzM3NDY2NjcsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjE0NjE4M2Q3YWFjODBhMzI0ZGRlM2RhZWYwZmZiMTMzIn0.JSC0obuRF17myNMYP_Z64rGnnvblgAUhz8_HzdmyAhI', '2026-02-15 12:24:27', '2026-03-17 11:24:27', '2026-02-15 11:24:27', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(118, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NzQxLCJleHAiOjE3NzExNTgzNDEsInVzZXJfaWQiOjg0LCJqdGkiOiI3YTUzZjQyZjAwMDQ0YzYzZTdkZTYyOGE2NDQ2ZGFhMyJ9.qKYKB8Pyy0yisbEVJwhOE680Ff1y8FcFyiNyKKJ92Jg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NzQxLCJleHAiOjE3NzM3NDY3NDEsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImEzODcxYzQ3NDVmMmI3NTg2MjgxNGNkOTMzZjJmYzQwIn0.tAmVaLi5-RZmTUewZeMfezhpd102KNq8Kb9RfO1KJoY', '2026-02-15 12:25:41', '2026-03-17 11:25:41', '2026-02-15 11:25:41', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(119, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NzU1LCJleHAiOjE3NzExNTgzNTUsInVzZXJfaWQiOjg0LCJqdGkiOiIxMWQ2YTU0ZTA4NjU2MTZiNTMyODNiYzlmMzBkYzJlYiJ9.ZpCwPKLKjIRWR2GLwyGDxU94wD6xqkYyzavXJVsXcnQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NzU1LCJleHAiOjE3NzM3NDY3NTUsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjU2Nzg2YmUzNWJhNjY4YzIzMTExNTgyOGY5MmIxNjgzIn0.px5R23M_fWWk5eRLvEOoJgsk8_xQ1Zk6aIE4OHY9v5w', '2026-02-15 12:25:55', '2026-03-17 11:25:55', '2026-02-15 11:25:55', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(120, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0Nzc3LCJleHAiOjE3NzExNTgzNzcsInVzZXJfaWQiOjg0LCJqdGkiOiI4ZGRkMDM4YWQ0MGNiNGRiZGVlNmY2ZjM2YmVlYzk2MyJ9.3eIIFMBMaJg6D9-CvQdyFMyyo81MYctDqmfHiY7plxI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0Nzc3LCJleHAiOjE3NzM3NDY3NzcsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijg5YzczN2YyYzcwNjM0ZTBjYTEzNzc1ZjRhMzI5MTVkIn0.q4zCh-9g6_yaMSiiBhp68RBKnriG9ViBwshAWinO7Ww', '2026-02-15 12:26:17', '2026-03-17 11:26:17', '2026-02-15 11:26:17', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(121, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NzkwLCJleHAiOjE3NzExNTgzOTAsInVzZXJfaWQiOjg0LCJqdGkiOiIxMTc4MWY5ZmYyZmNkYjExNzdiMDQxM2FiNDVmMjczMCJ9.izjRYxzvMLigp_3DwxqNmjq-vlqZR4f20mDKF1u0RDM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0NzkwLCJleHAiOjE3NzM3NDY3OTAsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjdhYmM2MzNlYjgzOWE1MmI3YjAxZjc0ZGRiMmVlMDIxIn0.EbEUPqMGmJOZbqtjWUYDrDzfA4B4j8nqOSbP6TKC7iA', '2026-02-15 12:26:30', '2026-03-17 11:26:30', '2026-02-15 11:26:30', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(122, 77, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0ODAwLCJleHAiOjE3NzExNTg0MDAsInVzZXJfaWQiOjc3LCJqdGkiOiJkNTE5MTA5MmNjODNhZjBmZjhjMmM2MDRiZWE5ZTFlYSJ9.mF_5LCTVFQ5bc4B_PnRpVSe0g70yGJ5LZQX1I4nowbs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0ODAwLCJleHAiOjE3NzM3NDY4MDAsInVzZXJfaWQiOjc3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImI1NTdhMmQzNzQ3MWY3ZTY0M2JhZmQyMjlkZjA4MTE5In0.Gq1Wg3HpuYRHaXJgK5Ve1mn_FLXoAFfWW1jCTDbMbKo', '2026-02-15 12:26:40', '2026-03-17 11:26:40', '2026-02-15 11:26:40', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36', '102.17.119.170'),
(123, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0ODg1LCJleHAiOjE3NzExNTg0ODUsInVzZXJfaWQiOjg0LCJqdGkiOiI1ZTkyMmVmN2UzOTAyMDU2NDRmZjI5MzYxNWFhMjMxNSJ9.K22-BWoceeUnVjYRo2w9IG5OaSSVLhP4qx0X3zZWemg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0ODg1LCJleHAiOjE3NzM3NDY4ODUsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQwMDVjN2I3MmU5MDY2MDBjMTg1YTdlNjNjOWY4YjFjIn0.DLhBljNtK8eUL3Gk7e8ZbsGYXu3RxT6jz2f36Cz3E7k', '2026-02-15 12:28:05', '2026-03-17 11:28:05', '2026-02-15 11:28:05', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(124, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0OTc4LCJleHAiOjE3NzExNTg1NzgsInVzZXJfaWQiOjg0LCJqdGkiOiI3Mzk5YWY0MjRmNzM1MjE5NjZhNzkzNThiNTVjMjk4MSJ9.lZZF4Y2CowJx2FD7lviexsAocJO6aasO2H5McRDmVt8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0OTc4LCJleHAiOjE3NzM3NDY5NzgsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImFiMTQ3OTQzODE5ODA3ZWQ0OTYzYzU5MDE0N2RjMjhlIn0.PZ6ql5fZ3kExWpqhEbCf6e6h3mbLTqRxaJdDT0WFjcY', '2026-02-15 12:29:38', '2026-03-17 11:29:38', '2026-02-15 11:29:38', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(125, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0OTc5LCJleHAiOjE3NzExNTg1NzksInVzZXJfaWQiOjg0LCJqdGkiOiJmYWEyYWIyODUwMTE0NmIzM2I0MjAwNzY3MWZhZTJhYyJ9.ZKSVfx6Hpi6GS-5UT-R_U6WmxqzU7gIasIwAGbm24cs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU0OTc5LCJleHAiOjE3NzM3NDY5NzksInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjVlNzhiOWYxMjRiMDZjMmMwZmM3NzNiMjI0MDFmNzVkIn0.BBCZtOltO1CeyTZj8ML9kHD1YZyryIiLZgtwbTH-Oa8', '2026-02-15 12:29:39', '2026-03-17 11:29:39', '2026-02-15 11:29:39', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(126, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1MDExLCJleHAiOjE3NzExNTg2MTEsInVzZXJfaWQiOjg0LCJqdGkiOiJkOTU3ZmU1YTY3NWI4Yzg4M2MyZmU5MDk3YTRhOTY3NCJ9.iPRTYaPcd0lu24EKdjFNr4kXmAD3z45s3Qpy7uB2RdE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1MDExLCJleHAiOjE3NzM3NDcwMTEsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQ0NmEwMjU4NDg5ZGNmODRjMWFlY2FhOTkyZDJmNDA0In0.aoaaNA7xVJgduQFFB1Ts71NghbPEipJIET6qmiVU5Xs', '2026-02-15 12:30:11', '2026-03-17 11:30:11', '2026-02-15 11:30:11', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(127, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1MjM0LCJleHAiOjE3NzExNTg4MzQsInVzZXJfaWQiOjg0LCJqdGkiOiJlZGZmODRmNWM2YjFiMmFhN2QzMzY0ODQxZTEzZjU4OCJ9.S5El8VDXp1HilLINzPL09rWYWohFzp0fC-1EZGgzYu4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1MjM0LCJleHAiOjE3NzM3NDcyMzQsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjEwNmExMzQwOTU3YTZjMWNhNTIwYzBkYmRiYTUyMDY3In0.sNHzIIYgD7LTyVfQIChsbdLKt6PgS3NMH3gNFH24LwI', '2026-02-15 12:33:54', '2026-03-17 11:33:54', '2026-02-15 11:33:54', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(128, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1MjQ4LCJleHAiOjE3NzExNTg4NDgsInVzZXJfaWQiOjg0LCJqdGkiOiI1OGEwN2FhYzcwMzZjMmE2ZWU4MWQzMTJmYjg1YTlmZSJ9._--6kFeoqCFYpdcZvU86aFNB1vHW1gYWqAzUKvVbQrc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1MjQ4LCJleHAiOjE3NzM3NDcyNDgsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjFiZjcwMDhjZDFkNWJmNzhjMDE3YjQzYjI0MTQ3ZjYxIn0.0pAjp34jacS8Z3cmyDOp0hJIlWUechPLnRU4sAtB-js', '2026-02-15 12:34:08', '2026-03-17 11:34:08', '2026-02-15 11:34:08', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(129, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1MzIzLCJleHAiOjE3NzExNTg5MjMsInVzZXJfaWQiOjg0LCJqdGkiOiIxZDYyZjk5ZDIwMTg0NGIwNzljMjA1MTVmZjQyODQ3MyJ9.xoXgmFsc77KQiCcPxjSLUtGMseSQK0x0RkuFlhdJJ4w', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1MzIzLCJleHAiOjE3NzM3NDczMjMsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImNjNzBlZTYxNGUzMjA3NWZhNjVlM2U2YmQ1NTU4YmU5In0.33XP-xYZ1J6ecjLRx_2vXtjEIJlQkCjoy7avKSrV7lA', '2026-02-15 12:35:23', '2026-03-17 11:35:23', '2026-02-15 11:35:23', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(130, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1NDExLCJleHAiOjE3NzExNTkwMTEsInVzZXJfaWQiOjg0LCJqdGkiOiJkMDkwN2NhM2I5Nzc0OWQzZjc4YTIyOGQ2MmI0NzczNCJ9.lgKeC6x28TphyPdXWUvTJO1T2EQZzg-o-uZ8H50MEFM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1NDExLCJleHAiOjE3NzM3NDc0MTEsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijc5NzUyZTFjNTIwMzM1M2NmZDBkYmZhN2QzNjU4M2ExIn0.oOMHcI7NesITb-G-aXtnGc82Wo2F0yr99GUos-6HbqM', '2026-02-15 12:36:51', '2026-03-17 11:36:51', '2026-02-15 11:36:51', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(131, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1NzE1LCJleHAiOjE3NzExNTkzMTUsInVzZXJfaWQiOjg0LCJqdGkiOiIzMjE4Yzg0ZmRiN2JiODg4NmYyMDQ3ODg0NDFkZGI2ZiJ9.2xmpy_gbwAnmUKSsL_zExPUmkcYH65VAv5oZvThwcxY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1NzE1LCJleHAiOjE3NzM3NDc3MTUsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImMyNDUyZjYxYjU1ODA1NDBjMzY2YWQ3ZDEwODE5ZWM2In0.2Uw7v8nUhRYOpijDmzOI9puSfClr8QngF_h35G9q0ZY', '2026-02-15 12:41:55', '2026-03-17 11:41:55', '2026-02-15 11:41:55', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(132, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1NzQ2LCJleHAiOjE3NzExNTkzNDYsInVzZXJfaWQiOjg0LCJqdGkiOiIzNmJmY2EwMDk3YjdiZjVkMzYwNzI0MWFhNjU2NGYzZCJ9.fryCzn8w_HaS8Gm1jXfh5aj0Wm-bWE6ZaM1_4v-FAxE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1NzQ2LCJleHAiOjE3NzM3NDc3NDYsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImI3ZjcxNjdiNWFmZTViMDgxNmRmYjE3ZWY1YTNlNjE4In0.kkRE02R2UW-9c4CYoTxzEmDhqX_l_lrjiL4YF5fT0IA', '2026-02-15 12:42:26', '2026-03-17 11:42:26', '2026-02-15 11:42:26', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(133, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1ODQzLCJleHAiOjE3NzExNTk0NDMsInVzZXJfaWQiOjg0LCJqdGkiOiIzZGY1ZDc4NmRjNjYxZGQxZDRkNzBiNmQxZDUyMjdkMyJ9.ueHoP5gz_IXm5OzGcu9H7JuWO_PM5W8UnIAvgNDeSOY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1ODQzLCJleHAiOjE3NzM3NDc4NDMsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijk4Nzk4ODVlYzJiYzE1ZGJhNDBjOWJhM2U3YjAzOTUyIn0.HIXvGqs--1EOHp07gA6Lya9IuwSlN-V-1PkJKknNs0E', '2026-02-15 12:44:03', '2026-03-17 11:44:03', '2026-02-15 11:44:03', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.158.12'),
(134, 92, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1OTM1LCJleHAiOjE3NzExNTk1MzUsInVzZXJfaWQiOjkyLCJqdGkiOiIwNmZmNWU2MTQ1ZWMxODJjZTQwNmJmY2QzMmNiYWYyOCJ9.qa7S5F5EguMb4I2cl-uBRC2m2rtcjTU0lt4BXwx-EaE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU1OTM1LCJleHAiOjE3NzM3NDc5MzUsInVzZXJfaWQiOjkyLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijk4ZWQ4MGUyZjI2N2U0YTU3ODY5MDY0NTg2NWRkNTAyIn0.sqFRdG4XcgtjnMyBHP2FwGa3DMzEVBTdNxSDtvZ7bEw', '2026-02-15 12:45:35', '2026-03-17 11:45:35', '2026-02-15 11:45:35', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '129.222.109.149'),
(135, 74, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU2Mjc5LCJleHAiOjE3NzExNTk4NzksInVzZXJfaWQiOjc0LCJqdGkiOiIzNmZiNzkwMjc4YWZmMTg1YjYzNmEyY2U0ZDkxMDRhNSJ9.bny2cFDXPAt2LizpvH9tkxVAk-l_IyfEy8HRlYX3SEo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU2Mjc5LCJleHAiOjE3NzM3NDgyNzksInVzZXJfaWQiOjc0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImI1ZDFiNzE3NTA5ZWIxMzgxZDc5MTg5OTk1OTI3NGVkIn0.-whQct_nnORmw79LtjVtT9DkR-wEFEyCdC-rktNYAx8', '2026-02-15 12:51:19', '2026-03-17 11:51:19', '2026-02-15 11:51:19', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.159.144'),
(136, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU2NDk4LCJleHAiOjE3NzExNjAwOTgsInVzZXJfaWQiOjg0LCJqdGkiOiI5NjVmMWFjYjk3NjM2OWVhMjc5ZmVmMTQzNTVkNDdhOSJ9.NiflhRivd-bYd2U9Zl3YVSr8GHDvP27l1aceJ9_sd9I', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU2NDk4LCJleHAiOjE3NzM3NDg0OTgsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImExMjlhNmY1NWY2ZDBlMGU4ZDM0OTk3YmFiNmNkNjgxIn0.G_RQpzyHzQ6x49kGOv_qn24QpF0oEAdfwowqZP1dolQ', '2026-02-15 12:54:58', '2026-03-17 11:54:58', '2026-02-15 11:54:58', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36 OPR/95.0.0.0', '102.18.158.12'),
(137, 73, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU3MTg3LCJleHAiOjE3NzExNjA3ODcsInVzZXJfaWQiOjczLCJqdGkiOiIzYzFjNjJmZTZlYTU0MDNkNTk4ODc0ZTkzYmQ1ZGUzZSJ9.Vbr2utnaGumwbRc05BdOQhCdLNIjxoBTqSnnyesTWBA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU3MTg3LCJleHAiOjE3NzM3NDkxODcsInVzZXJfaWQiOjczLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImRiMjUzMWFlYTU1YzM2ZWExNGFkMDU0NjQwNDgyZjYyIn0.vk_2j3hjR-y_fm5uatW2ati6V4mWwTe9DkO0kmjc414', '2026-02-15 13:06:27', '2026-03-17 12:06:27', '2026-02-15 12:06:27', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '102.18.162.28'),
(138, 86, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU4NDk1LCJleHAiOjE3NzExNjIwOTUsInVzZXJfaWQiOjg2LCJqdGkiOiI1YjQyMTU4ZDM3ZTRjMzI4YWU4NTk2OTQzYWU1ZmZkYiJ9.rwOCHgLR0NQt2_HaozBJpNNSGn-7fjyXk6U0NPcqKvE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTU4NDk1LCJleHAiOjE3NzM3NTA0OTUsInVzZXJfaWQiOjg2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI3YmQwYzJhNjZmOGYwODAwMGNmMmQwM2MzNWQxOTdiIn0.O6-GFYD-yNXcdZwPQ32WBgtFZ5vdjdL8GKDeszpRL1U', '2026-02-15 13:28:15', '2026-03-17 12:28:15', '2026-02-15 12:28:15', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.162.249'),
(139, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTYwMDg5LCJleHAiOjE3NzExNjM2ODksInVzZXJfaWQiOjI0LCJqdGkiOiJhZjcwYWQ3YTY3MTAzZmY2YzJiNTU2MDMwNzFjNmQ1MyJ9.0DJJPPcgsXiKitdTH2m-80wnS1ORDNtbyvJr9WeeztQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTYwMDg5LCJleHAiOjE3NzM3NTIwODksInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjMzOGYyNDhkZTlhM2M0YzVkNjFhNTFmNDRkNTQzNGQxIn0.Nx0oktVwmgdW_hs4h4tgAiVtfUY-CZzSEKxuBQYRniE', '2026-02-15 13:54:49', '2026-03-17 12:54:49', '2026-02-15 12:54:49', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '41.77.17.239'),
(140, 80, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTYxNjQ0LCJleHAiOjE3NzExNjUyNDQsInVzZXJfaWQiOjgwLCJqdGkiOiI5YTIzMzljYjIxYTAzNDY1YTg1ZmFjODMxNmIzNzZiYSJ9.UnRnT3eq3CPsLLFDjKhdTSMuEdqrHHf16yDVjdzisBc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTYxNjQ0LCJleHAiOjE3NzM3NTM2NDQsInVzZXJfaWQiOjgwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijg5MWY0NDExZDc3ZTgyNDRhOWJkMDg0YTcxNDc2MDFhIn0.Wv8UIsGqbf5ntps8l172gDiNJ69cI9FcYXEWQ1qKXt4', '2026-02-15 14:20:44', '2026-03-17 13:20:44', '2026-02-15 13:20:44', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.17.117.35'),
(141, 78, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTYxOTA3LCJleHAiOjE3NzExNjU1MDcsInVzZXJfaWQiOjc4LCJqdGkiOiI3ZDg1ODZhOWIxMTdjOTgxOTI3MzczOWQyMGJiMzgwMiJ9.1py7-vXe6Ig_8UqmEURsA6pe1HoBkTMiN4l_sUJ_Cps', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTYxOTA3LCJleHAiOjE3NzM3NTM5MDcsInVzZXJfaWQiOjc4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjIwNDcxMDk4Nzc5N2YyN2NkM2ViZmYzNzBhMTFjYjIyIn0.3RejRl-eCbn0vHyF7P2qXkhRsQ_SJRTigqi1r3cKshE', '2026-02-15 14:25:07', '2026-03-17 13:25:07', '2026-02-15 13:25:07', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.18.161.22'),
(142, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTY4MjYwLCJleHAiOjE3NzExNzE4NjAsInVzZXJfaWQiOjE1LCJqdGkiOiIxY2YyYjc2MmM4MDY1NDgxYmQxN2M4ZjZiODZkZTI4ZCJ9.mjgOksKPScYQSTd7145UiKAQSEMHGFjrlJrZO6h4qDw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTY4MjYwLCJleHAiOjE3NzM3NjAyNjAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImFlNDBkMzM0NzNmYzVmOTI4NDNjOGI5MTcwMWM0NWVlIn0.T_03SI8SOnICB9JOB6jJ0ZjMWGnjfUQJjYaNqu20UYc', '2026-02-15 16:11:00', '2026-03-17 15:11:00', '2026-02-15 15:11:00', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '102.68.192.201'),
(143, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTcyOTYxLCJleHAiOjE3NzExNzY1NjEsInVzZXJfaWQiOjMwLCJqdGkiOiI1OTg2YmM5NGY2NWVlNTdiMDI0NDI1NTk1YmU2Zjc3NyJ9.1imx5upyeSXbacMLloYQUtqnGQ_z7zD0jV2vorHCx78', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTcyOTYxLCJleHAiOjE3NzM3NjQ5NjEsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImZjN2JlMzczZjRmMTMyNzI5MWE2NThkOTg4ZDZjOWU1In0.R5lweTHVFDbstACNcipfGfIVhXi_v2wMuc-qXPbVJlM', '2026-02-15 17:29:21', '2026-03-17 16:29:21', '2026-02-15 16:29:21', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '41.77.17.243'),
(144, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTc0NTYzLCJleHAiOjE3NzExNzgxNjMsInVzZXJfaWQiOjE1LCJqdGkiOiJhMzI3OTcxNjYyOWM5M2FiOTJjM2EwMTk2MzFhNTVkZSJ9.6U7cbPqBOOvOuU5MStGQYRf08t-UCzZEnCm_7SJdAvo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMTc0NTYzLCJleHAiOjE3NzM3NjY1NjMsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImIwZWY5MDM1ZGFlYWIwNjUwM2IwNmE0MjI0ODk4NTc2In0.Osu-4juf1wHwIRJdzyo92c8NDhqSqaZtQqK_NfsbCfU', '2026-02-15 17:56:03', '2026-03-17 16:56:03', '2026-02-15 16:56:03', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '102.68.192.201'),
(145, 76, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMjIwMjU3LCJleHAiOjE3NzEyMjM4NTcsInVzZXJfaWQiOjc2LCJqdGkiOiI3YWUxNTQzOGU5ODgxZWNjN2I5NjdlY2Y1YzFjOGE0ZCJ9.Cj-DVH_eReZjqGLz3jW9Rtof0I51A8PRtBJGmllIrUI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMjIwMjU3LCJleHAiOjE3NzM4MTIyNTcsInVzZXJfaWQiOjc2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImIzOTJmZDZlNTQ5Zjg4MjMxM2ViMWU4MDA3OWYyMjA5In0.JsC8wwTsCOH6eJz1YkzDyf6yOT9ToVQroF7CdplPUus', '2026-02-16 06:37:37', '2026-03-18 05:37:37', '2026-02-16 05:37:37', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '41.207.42.164'),
(146, 75, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMjIzMjA5LCJleHAiOjE3NzEyMjY4MDksInVzZXJfaWQiOjc1LCJqdGkiOiJjZmZlM2UxNmNlNDFmYTM1MWMzNjcyN2JiZDI5OTc4NiJ9.XkQfHb-03BTTvY64LSMxcJ6pWCho4g4bM9HX7HWUKUY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMjIzMjA5LCJleHAiOjE3NzM4MTUyMDksInVzZXJfaWQiOjc1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjVkZTg4NzNmZTBiYTM2ZjlmMzVhZDhkNDkzMTBiNDA1In0.MdUH4vHtXl-bSLTBWNG6_wPPZ4vO-eE34LcrVIcNwxg', '2026-02-16 07:26:49', '2026-03-18 06:26:49', '2026-02-16 06:26:49', 0, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '102.17.119.127'),
(147, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMjUzODU1LCJleHAiOjE3NzEyNTc0NTUsInVzZXJfaWQiOjE1LCJqdGkiOiJhMTE1MmQxOWM0YzhhM2Y3NDgyZGEwMzhhZDcwNDBmYiJ9.EDTZ6qTdpKFkrnq6dCXvkTmmGWUsFTNYOlCAlyGozB8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMjUzODU1LCJleHAiOjE3NzM4NDU4NTUsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjFiYmM4ODE3YjNkNjE4ZDQyNjgzOTY0Y2M2YTliZjhlIn0.ZyqewH0Nh08cbOTVnr1PrqRurK2kCTgbmsLzUIjPzuI', '2026-02-16 15:57:35', '2026-03-18 14:57:35', '2026-02-16 14:57:35', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '154.120.181.158'),
(148, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMjU2OTg0LCJleHAiOjE3NzEyNjA1ODQsInVzZXJfaWQiOjI0LCJqdGkiOiIzY2VmOWUxYjVhYWVkZWM4ODBjMGIyNjM0YTVlNThjYSJ9.eHYwMAvzLhbHn0yGLGRKGzo7_IsXIWubLNxVX2YW9fs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMjU2OTg0LCJleHAiOjE3NzM4NDg5ODQsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjJlNmU1MTUwMDIwNjE2OTEzODFmOTY0ZmE4ZDkxYzFkIn0.eUGAm7QnbdEhoYyh4Ldjek4DP3yuk3vpEIgpCjToStU', '2026-02-16 16:49:44', '2026-03-18 15:49:44', '2026-02-16 15:49:44', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '41.77.17.163'),
(149, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzE2MzQ0LCJleHAiOjE3NzEzMTk5NDQsInVzZXJfaWQiOjE1LCJqdGkiOiJkOTY4MzRkYTg2NTBiMTU1ZDhlYTJhNDc3NzUwOWYwYSJ9.dKEcnqnxhiiv0WYJf5Rpb5rCv4G-54fV7zwO3AhXL5Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzE2MzQ0LCJleHAiOjE3NzM5MDgzNDQsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI1MDZiZDk3YmZkNjViNzYyODdhM2UyZTdhYzdkNTY4In0.kFfVfJBRacxnNWfyAHqC6ZIQFPcnD5xb7wB9y45t3KU', '2026-02-17 09:19:04', '2026-03-19 08:19:04', '2026-02-17 08:19:04', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '41.74.212.198'),
(150, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzIwNTYwLCJleHAiOjE3NzEzMjQxNjAsInVzZXJfaWQiOjE1LCJqdGkiOiI1Nzg3NTcxMGI5YTk3MGExYWZlZWRiOWFkY2RiYTcwYSJ9.HPUeZeaf5X46sME36gltIp6nXMQxCd30yNCGzqU2w00', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzIwNTYwLCJleHAiOjE3NzM5MTI1NjAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjM5MDY3NTZiZDgwN2Y3MjNiM2VmMzIxMzViZDEzOTQ2In0.PVjxoTz1bi6qnfwAHctQ2vgIFlcPrsH0LZq1VNceGBE', '2026-02-17 10:29:20', '2026-03-19 09:29:20', '2026-02-17 09:29:20', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '41.74.212.198'),
(151, 88, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzIxNDQ2LCJleHAiOjE3NzEzMjUwNDYsInVzZXJfaWQiOjg4LCJqdGkiOiIyYTUxYTEyNzFlNjFiMDkyZDQ3NTgzYmE3N2Q2YTJhOCJ9.t1phcwQEJHrAxw-RWvnU-NuU7pLbdmndxkb8cSGm9So', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzIxNDQ2LCJleHAiOjE3NzM5MTM0NDYsInVzZXJfaWQiOjg4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImUzOTg2NmMyZmU0YzNiNTYwOGEyZmRkMWFhMjM1ZTA3In0._v8vwEmD1LhnbOi4jGqpJB3S20QId-Cij-qD476YQp0', '2026-02-17 10:44:06', '2026-03-19 09:44:06', '2026-02-17 09:44:06', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.18.160.55'),
(152, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzQzNzQwLCJleHAiOjE3NzEzNDczNDAsInVzZXJfaWQiOjE1LCJqdGkiOiIxYmE3ZDQ5ZmMzNjBkYjc1ZGI3MjVjNDM1MzI1N2JmZCJ9.s0WZ0CJHv1LAqT9f3m84v5RB_Ap75DqlEoawqMtos5Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzQzNzQwLCJleHAiOjE3NzM5MzU3NDAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjkxMjc2OGNmNWY3YjliYTNhOWUwZGVmNjBhZjkxYzRjIn0.pDI7m7t8PSIZtLTprGtuVteuIVoXFclKV37BLFt8i6A', '2026-02-17 16:55:40', '2026-03-19 15:55:40', '2026-02-17 15:55:40', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '41.74.209.19'),
(153, 88, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzkyNDg0LCJleHAiOjE3NzEzOTYwODQsInVzZXJfaWQiOjg4LCJqdGkiOiIxM2I4NGMyOTJlY2QzYTNiMzcxNzk2ZDUwMWEzYjE3YSJ9.hDQssbhCs3pWnB3A50wcLvzbBtPNxb7JOibONZw0Wv0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzkyNDg0LCJleHAiOjE3NzM5ODQ0ODQsInVzZXJfaWQiOjg4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImYxZDcyNzdiMDFhZDM4OWIwYzY1Njg4YTdhYzE0ZjI4In0.7I4gIu2Ejn_8b-ljjr9jZFlqlEAqbaGVm7flrvXtwnY', '2026-02-18 06:28:04', '2026-03-20 05:28:04', '2026-02-18 05:28:04', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.17.119.78'),
(154, 88, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzkzMDQ3LCJleHAiOjE3NzEzOTY2NDcsInVzZXJfaWQiOjg4LCJqdGkiOiI1MGQ3MWRlYmQ3YjVjYTZlOTk2NDllMTYzMTcwODc1MSJ9.enco8ybg8e794Ey6SUOWaRjeuR8AdpQL8_pvr8Kaj14', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxMzkzMDQ3LCJleHAiOjE3NzM5ODUwNDcsInVzZXJfaWQiOjg4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijk2YjdiMTI5YzYwMjE1MTIyNGJkZmExYzdiZTcxNjQ1In0.o_CdpRaht0GzHgib0NRWn4zejGFwvtq0y7itBhsgMMg', '2026-02-18 06:37:27', '2026-03-20 05:37:27', '2026-02-18 05:37:27', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.18.162.25'),
(155, 94, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNTEyMzc5LCJleHAiOjE3NzE1MTU5NzksInVzZXJfaWQiOjk0LCJqdGkiOiI0NWYwMDVmNGY3MTYyYTVlYTg1ZWNlZDFmNjkxN2ZlMCJ9.2qi6Ed6M-cDAhGpJ-9YlacBCnxFHUEAbDBVJ9rnO4ZQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNTEyMzc5LCJleHAiOjE3NzQxMDQzNzksInVzZXJfaWQiOjk0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjZhYzRkZDc1NjgxNDViMTJlYzQyNjA2M2MxYmNkYjIwIn0.GUCrk4UfbNKo_obWb_DG6CKdLg9NCym1qHePjbZ3d7s', '2026-02-19 15:46:19', '2026-03-21 14:46:19', '2026-02-19 14:46:19', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', '46.101.199.89'),
(156, 51, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNTY2MzQ3LCJleHAiOjE3NzE1Njk5NDcsInVzZXJfaWQiOjUxLCJqdGkiOiI5ZTcyYmZhYWZjMDc0ZGFhYzU3NzRhMzJmNjIyMDgxNiJ9.9SWdSNrP1fPiQmXhIEAnv9OOqW94dPglW8RFm2hYhBo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNTY2MzQ3LCJleHAiOjE3NzQxNTgzNDcsInVzZXJfaWQiOjUxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjY5MmU4YmQ3NzliMjViMTM5M2VkZTQwMzkyZmQwMmI2In0.xwvreLqGm2j4QnbDLX2VAES8h-W-j286OS_6ld2lDoI', '2026-02-20 06:45:47', '2026-03-22 05:45:47', '2026-02-20 05:45:47', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.17.119.149'),
(157, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjA0MzM4LCJleHAiOjE3NzE2MDc5MzgsInVzZXJfaWQiOjI0LCJqdGkiOiJiMDIyYjFiYWEwMzA5MzI4MmQ5YjUxYWQwYjVmOWE4ZiJ9.QoZk3evbqi-Ib9JP4Z6_Xcgtps29YXIE3Zogpn7xbhg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjA0MzM4LCJleHAiOjE3NzQxOTYzMzgsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjNkMjc3NTEzNzgxNzY0YWNkNWM5MWQ2MjIyZTQyYTQwIn0.mUZFdG7ysgNIeK7_JlCFo5vtY4yESzo3C6YB7hphxqU', '2026-02-20 17:18:58', '2026-03-22 16:18:58', '2026-02-20 16:18:58', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.119.67'),
(158, 35, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjA0NzY3LCJleHAiOjE3NzE2MDgzNjcsInVzZXJfaWQiOjM1LCJqdGkiOiIzMTNiMTlmZDA0YjQwMDM3MWZhNjI4MDkzY2M4YmE5NiJ9.MAxKe-3m-U1KSWrN-I71uqR5KqwML3gkazZ_Usyg0m8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjA0NzY3LCJleHAiOjE3NzQxOTY3NjcsInVzZXJfaWQiOjM1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImM4ZGE0ZjgwMWMzYjY3NzJjYjM4N2M2MjA4ODBmMWU1In0.8E4Kdfyrw-X6qi4NDDzpwOFnOBfmvc2e9XOQO1oSlLo', '2026-02-20 17:26:07', '2026-03-22 16:26:07', '2026-02-20 16:26:07', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.68.228.194'),
(159, 95, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjQ5NTc4LCJleHAiOjE3NzE2NTMxNzgsInVzZXJfaWQiOjk1LCJqdGkiOiJiYTA4NGRmMTdiNzEwOTIwOWQxYzgyNjBmMmU1YjJkYiJ9.TWPgvCI75Ds67wGLdGt08RFdmg_5_JfOFeBVxMIOZZ8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjQ5NTc4LCJleHAiOjE3NzQyNDE1NzgsInVzZXJfaWQiOjk1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRhODU5MTE4MGE3YTY4YTI0NDljNDU4MWJkOWJkZjExIn0.JZ2ISTX7DidOIrcs1ZKnv1Zq_AN_sMMBc3Y0xnaAsxc', '2026-02-21 05:52:58', '2026-03-23 04:52:58', '2026-02-21 04:52:58', 0, 'Mozilla/5.0 (Linux; U; Android 13; SM-M135FU Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/145.0.7632.45 Mobile Safari/537.36 OPR/96.0.2254.79777', '82.145.210.96'),
(160, 35, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjUwMzMwLCJleHAiOjE3NzE2NTM5MzAsInVzZXJfaWQiOjM1LCJqdGkiOiI3YTM2ZDY5YmUzNTRiYWRmZTcxMTAyZjYxN2RjYmUwMyJ9.aJHbB7UzR4Dy8_WmPJFxsGos9jn3hQ6I-y7wDgTslPY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjUwMzMwLCJleHAiOjE3NzQyNDIzMzAsInVzZXJfaWQiOjM1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjNkY2M5Y2RlZWJmNmYyODRiNzI1MTVjYTZiNTZmZjA5In0.wwtnADtwc6k-73Fh8zPAkyaDqVYK3r_AAYvgja7HuPk', '2026-02-21 06:05:30', '2026-03-23 05:05:30', '2026-02-21 05:05:30', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.68.228.194'),
(161, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjU3ODkyLCJleHAiOjE3NzE2NjE0OTIsInVzZXJfaWQiOjg0LCJqdGkiOiIxMGY0MmUwZWU0NDJmYjliYzA0YTNlZWRiZTA0NjIzZCJ9.kkf079-9WPdROShs5DQsYPyvVM-Ngp-Cw9qOhjxGPDY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjU3ODkyLCJleHAiOjE3NzQyNDk4OTIsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImZkYjFmNzFlYjE5ODgxYWNlYzhlMjNiY2E0NTdiMWU3In0.5_QAUAjr7UA1IiNwaySrSphGWzjYU0v1y2c-1NEEPBY', '2026-02-21 08:11:32', '2026-03-23 07:11:32', '2026-02-21 07:11:32', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36 OPR/95.0.0.0', '102.17.119.21');
INSERT INTO `aem_auth_tokens` (`aem_id_token`, `aem_id_user`, `token`, `refresh_token`, `expires_at`, `refresh_expires_at`, `created_at`, `is_revoked`, `user_agent`, `ip_address`) VALUES
(162, 98, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjg5NDM4LCJleHAiOjE3NzE2OTMwMzgsInVzZXJfaWQiOjk4LCJqdGkiOiJkNmE0Y2ZmNmEwYTMzODJkN2RiN2Y5NmQ3YmFkODQ2YyJ9.EHvzfdxv9lOhR-Ujw8RdA_yZe9WpVo1G-m7UZ261L3U', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNjg5NDM4LCJleHAiOjE3NzQyODE0MzgsInVzZXJfaWQiOjk4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjY2NDIxN2RiZDBkYzUzOGI2YTk1Nzc3ODcxMDU0Y2NmIn0.vGLD3eBpbfg8XRH3LEvgyj9N6ATamanjSwxOvX6Mm90', '2026-02-21 16:57:18', '2026-03-23 15:57:18', '2026-02-21 15:57:18', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '102.18.162.109'),
(163, 82, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNzQ5NzY1LCJleHAiOjE3NzE3NTMzNjUsInVzZXJfaWQiOjgyLCJqdGkiOiJlOWI4YTc5OWI1MDQ4MjBhZTU5NGQ5ZTk0ZTA3MjRkYiJ9.zIzxPTVgbwMTIymTQW-PamZrfk9MS0anPFgsafNhENc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNzQ5NzY1LCJleHAiOjE3NzQzNDE3NjUsInVzZXJfaWQiOjgyLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImI0MTFmYWIzNGQ1OWZiMTc2MWU2N2MzYzYxNzU0MzJiIn0.N51GrBI5I6jDM33RygFJhFeKSIOAp-Y-aS85at7Ow7M', '2026-02-22 09:42:45', '2026-03-24 08:42:45', '2026-02-22 08:42:45', 1, 'Mozilla/5.0 (Linux; Android 11; TECNO LE6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.98 Mobile Safari/537.36', '197.158.119.116'),
(164, 96, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNzgwMjU4LCJleHAiOjE3NzE3ODM4NTgsInVzZXJfaWQiOjk2LCJqdGkiOiI4NTcwYWEzNGRmZjNiNDY0NzUwYThlMjdmNzBhYjdhZSJ9.r1u_u5NpkD-k1IDAOZ9YedKo2hQqapyaibkhj-0z4TE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNzgwMjU4LCJleHAiOjE3NzQzNzIyNTgsInVzZXJfaWQiOjk2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQ5OTYxNDE4ODM4MDkwMjQ3MzA3YmVjZTE0YmIxOTY2In0.fU8BKjd3R709Q8Pk_AQ_qRiTrBBrP4CxYRp8_YGIFPo', '2026-02-22 18:10:58', '2026-03-24 17:10:58', '2026-02-22 17:10:58', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '102.18.162.14'),
(165, 96, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNzg1MTk0LCJleHAiOjE3NzE3ODg3OTQsInVzZXJfaWQiOjk2LCJqdGkiOiJlZDM2MzJlYTkyMmU5OGVlOWUwMTc3M2M0ZTQ5YWM2ZCJ9.y4hq3dzNM0rYu1Cr4wqOiHShQLY3y1WM20ulvSskf0k', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxNzg1MTk0LCJleHAiOjE3NzQzNzcxOTQsInVzZXJfaWQiOjk2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjY2MDcwNmM5MzBiNTg4NDNlNWEwMjZkN2U1ZjY0ZmMyIn0.7z_uVRQeKs4B2iY_PznAzf4u7RInrXL3EaTWNg8LugI', '2026-02-22 19:33:14', '2026-03-24 18:33:14', '2026-02-22 18:33:14', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '102.18.162.14'),
(166, 99, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODI5MzE0LCJleHAiOjE3NzE4MzI5MTQsInVzZXJfaWQiOjk5LCJqdGkiOiIyMWY1MDAzMzRmNDUxNzY1ZjE2MzNmODY0Y2ZhODM5ZCJ9._MwBgzPasiwZ778uYyteUWKR2fL-QJeV2lgQWA361sQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODI5MzE0LCJleHAiOjE3NzQ0MjEzMTQsInVzZXJfaWQiOjk5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI0ZmZjZThjOTlmNGEyOWJhYmVmZDJjNTFkNzhhZmI5In0.SpZtPtbSUB0PI1WRj-IZfqobwmmPWdJ_4w66EzlKJ2o', '2026-02-23 07:48:34', '2026-03-25 06:48:34', '2026-02-23 06:48:34', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '154.126.92.186'),
(167, 28, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODM2MTgyLCJleHAiOjE3NzE4Mzk3ODIsInVzZXJfaWQiOjI4LCJqdGkiOiI5OWMzNWY5OTFkNDBkYWUyMDE5NTBkZTBmYjFkY2JjZCJ9.psGE4wL9PFH9huMM868qqumT751SzEc2Um1So7iOwi8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODM2MTgyLCJleHAiOjE3NzQ0MjgxODIsInVzZXJfaWQiOjI4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjQzMjJlZDY5NzRjNTkxZGJkNDg4OTc3NDc5MWI2NWIxIn0.I_zwZ9trOVqSF4p5U4A3jRfdquJ5raDmZOEaL9snezY', '2026-02-23 09:43:02', '2026-03-25 08:43:02', '2026-02-23 08:43:02', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '79.116.105.106'),
(168, 28, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODM2NzM3LCJleHAiOjE3NzE4NDAzMzcsInVzZXJfaWQiOjI4LCJqdGkiOiI2ZDI3ZDQyYmMyMmQ5OTNiOGRjOGQ2OTExMzUwZTdhZCJ9.NX0yiWSe9U90Sm0lm3W4ArFYuAm0JHpENDtz9MHEizg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODM2NzM3LCJleHAiOjE3NzQ0Mjg3MzcsInVzZXJfaWQiOjI4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjE3YTIyYWYxOGIzYTAzZWVjODgxMWU4ZGY3ZjU0NzYyIn0.FU9EPBrTFWpQ1YPBnyJDwOhVufJqgnv7f90FJsxCOuE', '2026-02-23 09:52:17', '2026-03-25 08:52:17', '2026-02-23 08:52:17', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '79.116.105.106'),
(169, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODQ2NDQ3LCJleHAiOjE3NzE4NTAwNDcsInVzZXJfaWQiOjg0LCJqdGkiOiJkYmZmYWI3ODdjYzRjNjExNjA5NmE1OThmYWRkMDJkYyJ9.KZitQygpPTvaFCEPQUJDTuq8jWnNo-f6vRUeguN2ipM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODQ2NDQ3LCJleHAiOjE3NzQ0Mzg0NDcsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQwNmVlNTQ4ZjdlNTQ1ZTUxYTg5MTRkNTNlYmQwNjJmIn0.VflZbA8nLnJQKe7CFnY1Nxys67CyZqmIOseEuHHW-d8', '2026-02-23 12:34:07', '2026-03-25 11:34:07', '2026-02-23 11:34:07', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36 OPR/95.0.0.0', '102.18.161.167'),
(170, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODUzMTc5LCJleHAiOjE3NzE4NTY3NzksInVzZXJfaWQiOjg0LCJqdGkiOiIzOTQ4NjFmZTg3OTdhOWVjZWUwNzhjYTBhMTZmYjA0ZiJ9.x5TJUznuPsjVgXdTEKZOr7t1SrBYzdUaHcvJXJYvpoI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODUzMTc5LCJleHAiOjE3NzQ0NDUxNzksInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjkzYmRlMjhlMGMyMDQ1MWZlMmYzNzZjNTVhODliZGRhIn0.x9_AYkRs6M3G5Cw5zSJ46wS0asFFbsA6UWOGuh8M4jg', '2026-02-23 14:26:19', '2026-03-25 13:26:19', '2026-02-23 13:26:19', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36 OPR/95.0.0.0', '102.18.161.167'),
(171, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODY2NzYwLCJleHAiOjE3NzE4NzAzNjAsInVzZXJfaWQiOjg0LCJqdGkiOiI2YmI2ZTExZjBiNmFmMTk0MTQ4ZWQ5MTE2ZDU3NWYwOCJ9.K9cTh5e54FBDs4cQyR9wa8LNR2dX-fmIky1LTceomuE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODY2NzYwLCJleHAiOjE3NzQ0NTg3NjAsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjBiNjQ2NWZlN2UwNzEyYjBlODIxN2JhMWE3ZTJjOWE5In0.tlpoXB84QKJYlwMrVLS5eja2iuY-2-k-I_V8e6ffpTU', '2026-02-23 18:12:40', '2026-03-25 17:12:40', '2026-02-23 17:12:40', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36 OPR/95.0.0.0', '102.18.161.167'),
(172, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODY2OTcxLCJleHAiOjE3NzE4NzA1NzEsInVzZXJfaWQiOjg0LCJqdGkiOiI0MjJlMjQ2NmY5MDE2ZTlkMjE2ZWRmZThmOTUwOGUyNiJ9.lMBHB5zz-LtqC2rSOlhZVuA-W09yTWzzuhbX5LyWWFs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODY2OTcxLCJleHAiOjE3NzQ0NTg5NzEsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjAyNDViOTA4ZmIyYzZjODAxMjEwNjU4ZGJhYjcxYjBiIn0.q1MYux64dKVO3ilWVyWghaUNzvHUmMmgqMH45SjdsDo', '2026-02-23 18:16:11', '2026-03-25 17:16:11', '2026-02-23 17:16:11', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36 OPR/95.0.0.0', '102.18.161.167'),
(173, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODc0NTg5LCJleHAiOjE3NzE4NzgxODksInVzZXJfaWQiOjI0LCJqdGkiOiIxODVhYjRlZWYzN2IzMDk3N2YzOTg4NTczZjE4NzE4MyJ9.B0n1yGHORs96JvNCGHmrYFT5obXdDjxP32A1n9EQjYw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxODc0NTg5LCJleHAiOjE3NzQ0NjY1ODksInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImY3Mjg1OGNjMTgyZWJiMjZiZjNlOWM2ZGI4MjUwNzQ0In0.LRATZ4Nbmz4CX96uezHrR87Hw5zuRI66h7fy8iTwCJ4', '2026-02-23 20:23:09', '2026-03-25 19:23:09', '2026-02-23 19:23:09', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.18.160.199'),
(174, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxOTIyNzQ2LCJleHAiOjE3NzE5MjYzNDYsInVzZXJfaWQiOjg0LCJqdGkiOiI2YmNiOWMzOThkMDI1M2Q3ZTY0ZWY3YmY3ZjgxYjU4NiJ9.WqvUqLgvUCLRDLPwkT8LX8nJufFBguLwvIGMVpdTdok', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxOTIyNzQ2LCJleHAiOjE3NzQ1MTQ3NDYsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijk1ODY1Mzc4ZDQyMGQzMGM1MDhiMWVlZjk5NGU1MDUzIn0.T5f-CjHuLooysPWkQvEB_dIFO2W9anKc0SC35_pD8hQ', '2026-02-24 09:45:46', '2026-03-26 08:45:46', '2026-02-24 08:45:46', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36 OPR/95.0.0.0', '102.17.120.195'),
(175, 39, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxOTQ4NDQyLCJleHAiOjE3NzE5NTIwNDIsInVzZXJfaWQiOjM5LCJqdGkiOiI5NWU1NDEzMmRjODZhMWNiNGVmMjQ0MWFiNDY5ZDhiYiJ9.mAdaouZiO3jZyNLBXkx_F-LQ8kQxOCV0K1huEKhzgSI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcxOTQ4NDQyLCJleHAiOjE3NzQ1NDA0NDIsInVzZXJfaWQiOjM5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImVkOGZiNTRkZjQwNTRjYTVhYjA0NmNhMGM1ODY2Mjk1In0.xFRHX1tS8zl-DNpLnruxwawohmPFVA-D2rdwkjy7YUE', '2026-02-24 16:54:02', '2026-03-26 15:54:02', '2026-02-24 15:54:02', 0, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0', '129.222.109.248'),
(176, 94, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMDA4OTY2LCJleHAiOjE3NzIwMTI1NjYsInVzZXJfaWQiOjk0LCJqdGkiOiIyZGE3N2Y2YmY1MDk5ZGYwMmU3YTZhMTdkZWVjZWVmNCJ9.rlhTkpGXPzKhdALzSotMxM6-8to0S2HcHDz7GLH58ac', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMDA4OTY2LCJleHAiOjE3NzQ2MDA5NjYsInVzZXJfaWQiOjk0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjQ1MDM1ZGM2OThmMjJkY2Q5Y2U1NTYyZTNjMjA2ODBmIn0.WuvqY5sviN2jebZqVHffsQR8pJ3EuqEMq5ISeJ_2QGc', '2026-02-25 09:42:46', '2026-03-27 08:42:46', '2026-02-25 08:42:46', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '41.74.26.242'),
(177, 94, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMDA5MTQxLCJleHAiOjE3NzIwMTI3NDEsInVzZXJfaWQiOjk0LCJqdGkiOiI1ZmU0NzM4OGU1NDczZTE3YzIwMmJlNmMzNzM1NzA5ZSJ9.X984SNPo5HFtp-GwUeDCud0oOFWt2OC2brwP368_l5g', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMDA5MTQxLCJleHAiOjE3NzQ2MDExNDEsInVzZXJfaWQiOjk0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjM3ZDk0ODliYmYyMzQwMjFmZGVjZTM5NmZiYzY0ODRlIn0.DZ4PGW-yWi_mtPePUHGx8uLAoSUVGnKzAcHKN9GGTUY', '2026-02-25 09:45:41', '2026-03-27 08:45:41', '2026-02-25 08:45:41', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', '46.101.165.154'),
(178, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMDIzODM5LCJleHAiOjE3NzIwMjc0MzksInVzZXJfaWQiOjg0LCJqdGkiOiI3ODliNDFlNGE1NDUyODdhMThkMGJkMzFhZjA1OTgzYSJ9.OAx4u13ALeB0qQiywonM_CaNPJpcbXMURuOx-AOV3n4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMDIzODM5LCJleHAiOjE3NzQ2MTU4MzksInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjcwZmUzZGJiNGVhOGFkZWE2YjEzMWVlYmQzODI3NTQyIn0.z3eV5iPptxEmWgBMW1dIK5PvN8xlnYv01oagfHEJQCk', '2026-02-25 13:50:39', '2026-03-27 12:50:39', '2026-02-25 12:50:39', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36 OPR/95.0.0.0', '102.18.161.108'),
(179, 100, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMDg4Njk5LCJleHAiOjE3NzIwOTIyOTksInVzZXJfaWQiOjEwMCwianRpIjoiMmU2MWQ3MDQ4OWM5ZWIyZjAwZTllZTY5NDFmNjYzNTIifQ.utsAXtzHM7ED7T7nenat830_OhGY42h3iOMVV2yp9Bc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMDg4Njk5LCJleHAiOjE3NzQ2ODA2OTksInVzZXJfaWQiOjEwMCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJiMmU2MDU1MDFjZjExMGJlNjkyNWNkM2E0MGEyMTRhNSJ9.fnXyxIVvAB7eIrKdbqHsccxPp9YHM7G-1DueSdizZUw', '2026-02-26 07:51:39', '2026-03-28 06:51:39', '2026-02-26 06:51:39', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '102.18.158.142'),
(180, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMDk0MDM5LCJleHAiOjE3NzIwOTc2MzksInVzZXJfaWQiOjE1LCJqdGkiOiI5ZGZkM2RlMDNkMjJhMzAxNTY3OGRjNWVhODRhNDk1YSJ9.QG4C870uLworMs1rbUkz-KMaAd3_WavEEDCEknVEg30', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMDk0MDM5LCJleHAiOjE3NzQ2ODYwMzksInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjY0MTZmZjY2MDVmM2VkOGZmZjQxZDA4OGY1Mzg2YzE5In0.RMq2vWiL4eV58koaU-y-GrR2gMGx8w3A1-sVxN4Azho', '2026-02-26 09:20:39', '2026-03-28 08:20:39', '2026-02-26 08:20:39', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', '41.74.209.202'),
(181, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTExMTgyLCJleHAiOjE3NzIxMTQ3ODIsInVzZXJfaWQiOjI0LCJqdGkiOiIxNmNhMjg2ZjhhNjEyMWFjMTE3MzE5YWQ3ODUxNWZhZSJ9.nHwanhW31A7lC6qnSL4P_gkMyaKI7ilOPcGTYfRklgs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTExMTgyLCJleHAiOjE3NzQ3MDMxODIsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjJmMzhmNzljNmY5ZWZkZGE5ZWIzYjU0YWJkZWQ5ZmQ5In0.nqrqaDeVgIs3tJbZu5QGqKr2IlF4IBJ4WGwsXdvDvuY', '2026-02-26 14:06:22', '2026-03-28 13:06:22', '2026-02-26 13:06:22', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.18.161.205'),
(182, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTIxMjk2LCJleHAiOjE3NzIxMjQ4OTYsInVzZXJfaWQiOjI0LCJqdGkiOiJjZjQyZjE1MTQxYzBmZjE1YjA0ZTAxZjY3OWFkZGYyMiJ9._-J2HMy5z9wP06jLR2SWSGnbGYPsyZFDyfjcAqHs7T0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTIxMjk2LCJleHAiOjE3NzQ3MTMyOTYsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjgwYWNhZGU1ODI1YWZhNDYzOGIzMjEyZDFjYWI0MjcwIn0.HNNnO35XgXoE5cXpHd2v8F3iry-QxWZwmbso57hti4w', '2026-02-26 16:54:56', '2026-03-28 15:54:56', '2026-02-26 15:54:56', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.18.162.245'),
(183, 100, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTI0MTE0LCJleHAiOjE3NzIxMjc3MTQsInVzZXJfaWQiOjEwMCwianRpIjoiMzg0NDVhMDYxNDNjMjk3YTQ5OGZhNjliZmY0MGMxZjkifQ.iHQDTuXgDa7Pe5vJnTeGvG0w8rymxg86AQZ5vvTjObM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTI0MTE0LCJleHAiOjE3NzQ3MTYxMTQsInVzZXJfaWQiOjEwMCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI3OGQ3YTVkMWQ2MzhkMmE0ZDVjMmZhM2RlMzNjMGJjNiJ9.xPlVP2Tw-XebDv2FHbuwU9J8A9YDODAgDCzq8b-UdwE', '2026-02-26 17:41:54', '2026-03-28 16:41:54', '2026-02-26 16:41:54', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '102.17.118.167'),
(184, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTY0OTAwLCJleHAiOjE3NzIxNjg1MDAsInVzZXJfaWQiOjI0LCJqdGkiOiI1OTk5NGM3NGE1YjMwZjRjMzZhYmQ0NDFhYmQxZWU5NCJ9.oVmtULzXi1DAxg--VidcWWOfosMtvnY0qttURL5QqCg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTY0OTAwLCJleHAiOjE3NzQ3NTY5MDAsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImE1OWJlMmQyNzNjNzg4NDUxYjkxMjkzYjY0MTk4YjNhIn0.Xtt56raHOgXQMd0jyVUSNiHTHJve1NYE-HbeWVfNiQk', '2026-02-27 05:01:40', '2026-03-29 04:01:40', '2026-02-27 04:01:40', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.119.95'),
(185, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTY1MzE1LCJleHAiOjE3NzIxNjg5MTUsInVzZXJfaWQiOjI0LCJqdGkiOiI3MWI4ZWE0YTYwN2E0ZTdjZDhkOTE1YTRjZGNmNzlhMiJ9.waTuVt-7gp_mvrmNCQTNSinPv7IZatcuf0jO6W2alUs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTY1MzE1LCJleHAiOjE3NzQ3NTczMTUsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImM2MDNhZjM5MjA1MGIwZTljZTJhMzU4NTIxZDIxOGYxIn0.rswbQcERoXujf09eyxPheiM7NdIphA6N4CQHsxJawwM', '2026-02-27 05:08:35', '2026-03-29 04:08:35', '2026-02-27 04:08:35', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.119.95'),
(186, 94, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTk0NDQ5LCJleHAiOjE3NzIxOTgwNDksInVzZXJfaWQiOjk0LCJqdGkiOiIyN2ZmNzU4ZGM2ZTY2OTExYzY3MTk3NGNiNDNjNjY0MyJ9.PvkldnlMAzmTpNnETHmKvXGpBzIbdVSxvSbnTIOgXXw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMTk0NDQ5LCJleHAiOjE3NzQ3ODY0NDksInVzZXJfaWQiOjk0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjQ4OWRmMzQ5ODk1ZmU4NTg4NWZhZmIzNTFhYzJlZDZlIn0.R5oUlM8sYuQnbYDR3j997uto_QQxdUlXEe83TBpkxVw', '2026-02-27 13:14:09', '2026-03-29 12:14:09', '2026-02-27 12:14:09', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:148.0) Gecko/20100101 Firefox/148.0', '143.105.80.244'),
(187, 51, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMzg0MDk4LCJleHAiOjE3NzIzODc2OTgsInVzZXJfaWQiOjUxLCJqdGkiOiJkNTk0M2RhOTc2ZjIxNDE4ZWQwMmQ1NTJmZDJiNGYwMSJ9._UpTRG4W4_Fd4mLJzNUxx4ZXJOlGZxDTi1jvzycYHnk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyMzg0MDk4LCJleHAiOjE3NzQ5NzYwOTgsInVzZXJfaWQiOjUxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImYzMWJmYmFiZWM3M2VkZmY5NzdkZmU2MzNiYWJmZWZmIn0.LnmaSu7h8d5KDJQDel45lU7WbQwZikuhnrhW_t2n7Cc', '2026-03-01 17:54:58', '2026-03-31 16:54:58', '2026-03-01 16:54:58', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.18.157.83'),
(188, 94, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNDM5ODQ4LCJleHAiOjE3NzI0NDM0NDgsInVzZXJfaWQiOjk0LCJqdGkiOiI3ZTNlMGUwM2M2MGRmYTVkOGViMTRiNGYwNTk5YjdmYSJ9.cF7VWqg87fbew5Yfg24BJ2pHmxWhRzuz3WCLQIraA_A', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNDM5ODQ4LCJleHAiOjE3NzUwMzE4NDgsInVzZXJfaWQiOjk0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjkyYzQxOGMxYzkzNmZlOGIzZDRmNTBmZDZkODgxZGYxIn0.cOe56tRPoz9574nDmM034di7jzRkgwTjN-DeaEcY9aU', '2026-03-02 09:24:08', '2026-04-01 08:24:08', '2026-03-02 08:24:08', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:148.0) Gecko/20100101 Firefox/148.0', '41.74.26.242'),
(189, 102, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNDY2OTIxLCJleHAiOjE3NzI0NzA1MjEsInVzZXJfaWQiOjEwMiwianRpIjoiOWFhOWFkNzk2NmJjNzRiZjc2ZTc4YjUxMDlhNmMxNWQifQ.9EiXl_DTzEnngHLHJiMs2gaLaTXcMf2BzD7t6PKDkPg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNDY2OTIxLCJleHAiOjE3NzUwNTg5MjEsInVzZXJfaWQiOjEwMiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI1NGY4MWQwYTZlNzY4MjBjMDc1OTU3MWFmMTg1ZDFmNiJ9.wH9iuik1HX7J2PiWNeX6pPAWentTEImX4ZhpxhT3Upk', '2026-03-02 16:55:21', '2026-04-01 15:55:21', '2026-03-02 15:55:21', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '129.222.109.19'),
(190, 105, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNTE2OTc1LCJleHAiOjE3NzI1MjA1NzUsInVzZXJfaWQiOjEwNSwianRpIjoiMmNkYjAxNDVhMmRmYzRiMTBiZGQzN2U1MjczNTZlMzYifQ.4c2oDJTI8xvewBdxYvsblJ57xVgteMKf8PCz4a5mEr8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNTE2OTc1LCJleHAiOjE3NzUxMDg5NzUsInVzZXJfaWQiOjEwNSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIyODUzYzI4MTM5ZGE4MmYzMDI4YzEwOTc1NmM4ZDJjNCJ9.IjO0-oymiX3vLmsNbEjSO4n9L1pMEoUx50cgxK_RrlI', '2026-03-03 06:49:35', '2026-04-02 05:49:35', '2026-03-03 05:49:35', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '105.235.158.29'),
(191, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNTQyMTA4LCJleHAiOjE3NzI1NDU3MDgsInVzZXJfaWQiOjI0LCJqdGkiOiJlYTliOWNhZmE4MjdlYjUwMWY0MzI5ZTFlN2MwYjFiZSJ9.ulOebwC4hYR31wmxGB1AHMbDiu7hXqJHmYP53fljirw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNTQyMTA4LCJleHAiOjE3NzUxMzQxMDgsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjBhZDA1NGE3M2NmNjQ3YmJhYWU1OTM0NzgxZDFhYWI3In0._5xtulXZkmtibeCls3bbbYpv5ADbD8F_zPjBGowlvig', '2026-03-03 13:48:28', '2026-04-02 12:48:28', '2026-03-03 12:48:28', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '41.77.17.146'),
(192, 104, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNTYwMzY2LCJleHAiOjE3NzI1NjM5NjYsInVzZXJfaWQiOjEwNCwianRpIjoiNzRlNDYwM2NjYTVkM2MwNmI0YjRmNjAyZDEzNzEwOTQifQ.XksPuN7cUO5nUvKWNgW2UBpDamk-hYcx8RrEL6khFsI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNTYwMzY2LCJleHAiOjE3NzUxNTIzNjYsInVzZXJfaWQiOjEwNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJiOWRlODA5YWQ1MjAwZDUwM2RmM2Y2MzJkYjRlMTEzNCJ9.wQdxgIs2UUvb-2vShPvT0yrzqy7bTDUJO9pGj_0v3h4', '2026-03-03 18:52:46', '2026-04-02 17:52:46', '2026-03-03 17:52:46', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '102.17.229.230'),
(193, 67, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNTkyODYzLCJleHAiOjE3NzI1OTY0NjMsInVzZXJfaWQiOjY3LCJqdGkiOiI4YTFlODFkNjJmZGMwZDhmMDJlZjM1MjRhNjA5MDc0YyJ9.nVHGvGqfgnBWKTV6b9kx9wTSCJcHzH2bt9O5GTkpHKo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNTkyODYzLCJleHAiOjE3NzUxODQ4NjMsInVzZXJfaWQiOjY3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRjMThiMmQ1YjY1NzRjNTc0MDQxZjM1NTg1MmUwNTI4In0.1mzlTqql3snHKqDzY9ln22ctKsw42Zzay3SUnLAMu7w', '2026-03-04 03:54:23', '2026-04-03 02:54:23', '2026-03-04 02:54:23', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:148.0) Gecko/20100101 Firefox/148.0', '41.74.212.142'),
(194, 67, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNTk0OTg1LCJleHAiOjE3NzI1OTg1ODUsInVzZXJfaWQiOjY3LCJqdGkiOiJiOTU4NjUyNjk2ZWNmNGM5MDg4MDc4NmU5MTE5YTYzZSJ9.d5WYVSF2IqeGKx-NT0KASnHwz4BAXjvTH0fUSzyhkzs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNTk0OTg1LCJleHAiOjE3NzUxODY5ODUsInVzZXJfaWQiOjY3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjMwZmM2MTlkN2VkN2Q5YWVkNmEwMDJkNmY1MzIyNmM4In0.SVWd4SQzo5uZvCpgOe6_5QhpIBgd5qfCwWMr1IcP0GY', '2026-03-04 04:29:45', '2026-04-03 03:29:45', '2026-03-04 03:29:45', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', '161.216.164.209'),
(195, 105, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjI0MTIwLCJleHAiOjE3NzI2Mjc3MjAsInVzZXJfaWQiOjEwNSwianRpIjoiYmY1ZDQ3NTBiNzRkOGEwMmY1NDc4NzIxMjkwYzhlYTIifQ.jIa0dywUyQTTtluZJv5yx2tjTqENC_Vg5drDt38Nj2s', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjI0MTIwLCJleHAiOjE3NzUyMTYxMjAsInVzZXJfaWQiOjEwNSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI4NGE4NjA2ODg5YjY0ZGZhMWViYzc5ODQ5NDcxY2ZkMiJ9.Bn6vBuMdHGdP0ofjizok4-IWPqLupRRmdhBomJWBii4', '2026-03-04 12:35:20', '2026-04-03 11:35:20', '2026-03-04 11:35:20', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '102.163.30.125'),
(196, 104, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjM3OTkxLCJleHAiOjE3NzI2NDE1OTEsInVzZXJfaWQiOjEwNCwianRpIjoiNjQ4ODFiYmQyNzQ4NDBiNmU2ZTdhMjVhZjhmMmI3YzgifQ.65Z1fX2oDI6lmHrOcX25HRWDOJ41kcGhJktr4ai06RA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjM3OTkxLCJleHAiOjE3NzUyMjk5OTEsInVzZXJfaWQiOjEwNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJmMTNkMDNmY2IzNzVlMmMxNzE3YjM5NWY4YjVmNWM3ZCJ9.rMkE4NKLQOlGBrysj5rBjOBMDBqEtKk5t9IRGZHUl8s', '2026-03-04 16:26:31', '2026-04-03 15:26:31', '2026-03-04 15:26:31', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:148.0) Gecko/20100101 Firefox/148.0', '41.74.212.142'),
(197, 67, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjQwMzMyLCJleHAiOjE3NzI2NDM5MzIsInVzZXJfaWQiOjY3LCJqdGkiOiIwYWM0ZmFmZTk2MmFlNDM3MWNiYTI5MWFjZDk1YWU4ZSJ9.qjhzduB8GiB0pquCmhBn5W-nWzZ5-aMb2Ro5MUyra1Q', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjQwMzMyLCJleHAiOjE3NzUyMzIzMzIsInVzZXJfaWQiOjY3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjcxZmNiYjc4YjdlNWEwN2M3ZjJmYjMwYWFjMWQyMzEzIn0.UJrQhHZmgBMzQDg5Ow9HvWvhBWU9kaiwabkVVBoibow', '2026-03-04 17:05:32', '2026-04-03 16:05:32', '2026-03-04 16:05:32', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', '161.216.164.205'),
(198, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMDA1LCJleHAiOjE3NzI2ODQ2MDUsInVzZXJfaWQiOjE1LCJqdGkiOiIyMDgwYzExNTU1ZmYzNTJhYjNhMDYxY2RjZDhiOTBlZCJ9.YeZM8jVMZTtVSZBt1iQotOeMo2zkqdcC_cFWtVtOxNE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMDA1LCJleHAiOjE3NzUyNzMwMDUsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjNmMmI5ODljY2M5NzE1ZjMxNTI3YzBiMDYxOTJkMjMzIn0.JVr8c38tznEg7k_Uzt-N9_5KoDMj50O18NqtjDX4cp0', '2026-03-05 04:23:25', '2026-04-04 03:23:25', '2026-03-05 03:23:25', 1, 'okhttp/4.9.2', '154.120.181.126'),
(199, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMDA2LCJleHAiOjE3NzI2ODQ2MDYsInVzZXJfaWQiOjE1LCJqdGkiOiI2MmNkY2M1N2U0YmUyYTg1NDc0YzQ3OTlmZDI4MzdjNSJ9.B_xNTeRi-OTQVwRnfYmM6WznQU_HM41E3c6Aezvfnpo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMDA2LCJleHAiOjE3NzUyNzMwMDYsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImVmZDEzM2E3YTRmOWZjYjc4ZmQ2MjMyYjZlMWQ5NzJhIn0.RV0j4f3tvJEKwKbC4ylmq-IJi0FZa-OVXbbOAdraITo', '2026-03-05 04:23:26', '2026-04-04 03:23:26', '2026-03-05 03:23:26', 0, NULL, NULL),
(200, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMDE1LCJleHAiOjE3NzI2ODQ2MTUsInVzZXJfaWQiOjE1LCJqdGkiOiJlM2YzZTMyNmI4YzZhZGIzYzQyZjQxYWU2MGNlZmE3OSJ9.kGmjTIJX3yLR-3kRSmlPCf4XeP9GCWJdBxYq99fhpiw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMDE1LCJleHAiOjE3NzUyNzMwMTUsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQwMTAwNDFjYjg0MWU5OTViMzExODA4MzAyZmJiNGYxIn0.5GO7BDfu38xEw9UiNFKfeIIgiFBPntNppJrhLlmNSWs', '2026-03-05 04:23:35', '2026-04-04 03:23:35', '2026-03-05 03:23:35', 1, 'okhttp/4.9.2', '154.120.181.126'),
(201, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMDE2LCJleHAiOjE3NzI2ODQ2MTYsInVzZXJfaWQiOjE1LCJqdGkiOiJhZmZjMDIwMDRiYjY2ZjI1MmFkMGRmZjY2ZmRlNDlmYSJ9.nssJxAFQ67HGvUtWQ2nvPA35_Qi9tni0HYGXA5cxbMs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMDE2LCJleHAiOjE3NzUyNzMwMTYsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjE1ZGI5MWQ5YjFjYjBhZTc3ZTEwNTIxMTMxYmI4ZWE2In0.ILuWEUxNJpZRhg9h4Rlhrpr3mYqfJ8rEg7Ey7MR_Q6k', '2026-03-05 04:23:36', '2026-04-04 03:23:36', '2026-03-05 03:23:36', 0, NULL, NULL),
(202, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMTk2LCJleHAiOjE3NzI2ODQ3OTYsInVzZXJfaWQiOjE1LCJqdGkiOiIwZmVmNWRlNzEyMjQxYzFlZWU2MTI0MTlhN2QxNzBhZCJ9.ZFpw5zxDgvy9_-PoJuIuvLwSByJ8BLzllYi_PC8KwvY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMTk2LCJleHAiOjE3NzUyNzMxOTYsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjNiMDVhYjM2MjM3MTg0NzAwZWI5MzY2MjNlODU5NTZjIn0.UJcrB02CMOAoSvInTGfAUjVFQy7h908tXMTw3cw1R3c', '2026-03-05 04:26:36', '2026-04-04 03:26:36', '2026-03-05 03:26:36', 1, 'okhttp/4.9.2', '154.120.181.126'),
(203, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMTk3LCJleHAiOjE3NzI2ODQ3OTcsInVzZXJfaWQiOjE1LCJqdGkiOiI1MmZiNGM0MzI4OTZmYjBiZGY2NDYwM2I0N2I2NGUyZCJ9.9nookbXYEefO0oG6KBwgYT_qjpbd7tPG8-sD0f4vHzk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMTk3LCJleHAiOjE3NzUyNzMxOTcsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjVlYmYyMWQ4NzAwZDhmNWQzOTU0YTk2NmUwNTUzZDQzIn0.PJmWIpzvNZ3bUKUYx-lplXT0rZeAdMqE9i4D6D7kHBM', '2026-03-05 04:26:37', '2026-04-04 03:26:37', '2026-03-05 03:26:37', 0, NULL, NULL),
(204, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMjQ0LCJleHAiOjE3NzI2ODQ4NDQsInVzZXJfaWQiOjE1LCJqdGkiOiI5NzQxYzcyM2JkMzI0Y2MzYWZmMzg5YmM1NzY5OTBjZCJ9.DSkEngO7FI_b-j_udoy3M8AqTklRbCMsCpV5FWY2xCU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMjQ0LCJleHAiOjE3NzUyNzMyNDQsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjBkNjMxNDQ3YWQzOWIzYWI5NzVlZDdlMmI0YWQxODU4In0.CCWIa-oo8XQEi9eCPtGNXgLjoqKshP_UqaFKkun4CFo', '2026-03-05 04:27:24', '2026-04-04 03:27:24', '2026-03-05 03:27:24', 1, 'okhttp/4.9.2', '154.120.181.126'),
(205, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMjQ1LCJleHAiOjE3NzI2ODQ4NDUsInVzZXJfaWQiOjE1LCJqdGkiOiIwNWIyOTZhZWQ5NTBkNmFlOTZmNzQyZGJlZjNkMTVkNiJ9.OHFNvkGhU0SDs7-CtT9KSUw6r_ZEUGeCeEi-UX2LM5g', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMjQ1LCJleHAiOjE3NzUyNzMyNDUsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjU3MTZhZWFhYjZlYWYxNjkyYzU3OGY4YjlmNDA2ZWU1In0.Y7hT4SkWWvbbxRGSPfqW3RleFMOy9jZjiFLKw-K2OCs', '2026-03-05 04:27:25', '2026-04-04 03:27:25', '2026-03-05 03:27:25', 0, NULL, NULL),
(206, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMzk0LCJleHAiOjE3NzI2ODQ5OTQsInVzZXJfaWQiOjE1LCJqdGkiOiJiMGNkMmUwMjQ4OTk2YTE1Yzg0MmNlZWE5ODdhOWZlOSJ9.g-XXhqYkYd_2Q2N8d_9d2YLb3A-3iB9WRLzouG9dABw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMzk0LCJleHAiOjE3NzUyNzMzOTQsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQ5YTkwOGMwZTc3NGU1ZDBjODgwMWQ3MDIyMWU4YWM2In0.dXKGWAeYMzkImVxrVgxacVuZTMf7tPeemX8y2MBhmYA', '2026-03-05 04:29:54', '2026-04-04 03:29:54', '2026-03-05 03:29:54', 1, 'okhttp/4.9.2', '154.120.181.126'),
(207, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMzk1LCJleHAiOjE3NzI2ODQ5OTUsInVzZXJfaWQiOjE1LCJqdGkiOiJiMTY0MGQwOGYyMTJkNWVlNTk4NWE1MTY1YjcyOWQ3YSJ9.PLltWO4u65TniKnmK-ipFr-yil-2cOSmqmbSm0m912Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjgxMzk1LCJleHAiOjE3NzUyNzMzOTUsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImYxMjViYjBiMGQwNGY5YWY2NzY4NmJmZDI4Y2Y0ODA0In0.7UdZ25X_Fo-psTaT-XHE3MW2VeH_TxbWuA8L2a7zlHo', '2026-03-05 04:29:55', '2026-04-04 03:29:55', '2026-03-05 03:29:55', 0, NULL, NULL),
(208, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjg5MDkwLCJleHAiOjE3NzI2OTI2OTAsInVzZXJfaWQiOjE1LCJqdGkiOiJkOWJiOGUwY2RkZGJkNzBiYTJmZTc4MmIxNGY5OGRhMCJ9.oy4WBY1GKud8YZhB-SLSzdFXP27TGKEICMCrIg6xq8I', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjg5MDkwLCJleHAiOjE3NzUyODEwOTAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImIwZjNhZjg0YmQ3M2NiNjk2NTcyZDljOWJjOTQ2YzVjIn0.tBGSu2Uk02nzpUv_Z8-Vb6QI_Fv0rdGdwpVzQT69tuU', '2026-03-05 06:38:10', '2026-04-04 05:38:10', '2026-03-05 05:38:10', 0, 'PostmanRuntime/7.51.0', '154.120.181.126'),
(209, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjg5NjEwLCJleHAiOjE3NzI2OTMyMTAsInVzZXJfaWQiOjE1LCJqdGkiOiI5MGUyNDNmNWFjNDMzMDgxNmVlZGNjOTM2NWI4OTU4OCJ9.A_YvBal7CMdZa87Vmwj5DviWUZ7x5kRdcUB8QgW0Hu4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjg5NjEwLCJleHAiOjE3NzUyODE2MTAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImMxY2UzMDYzNzEwY2YyYTZiMTZjYTQ0YTQ0MmUyNDEyIn0.rv0QceRpbVaC6yW8YsNeDJDkfit1jIC5qpN_Q0FIfdw', '2026-03-05 06:46:50', '2026-04-04 05:46:50', '2026-03-05 05:46:50', 0, 'PostmanRuntime/7.51.0', '154.120.181.126'),
(210, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjg5OTUzLCJleHAiOjE3NzI2OTM1NTMsInVzZXJfaWQiOjE1LCJqdGkiOiI1ZTk0ZjkwZDJiYjUzOWFmZjMxYWNmN2FmYjI2NzQzZSJ9.pDu65KgpotPVHlSq_v74TdHKuiRDvBMbjZtInjdloqQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjg5OTUzLCJleHAiOjE3NzUyODE5NTMsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjZjMGNlM2Q3NjY2MzI3Y2RhOTc2MjBiZjM2ZmExZTE0In0.77TVryb4p6ZX-YQWKkhJsOr0xIS2OI3HCl4uKdi1ds4', '2026-03-05 06:52:33', '2026-04-04 05:52:33', '2026-03-05 05:52:33', 0, 'okhttp/4.9.2', '154.120.181.126'),
(211, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjk1OTg4LCJleHAiOjE3NzI2OTk1ODgsInVzZXJfaWQiOjE1LCJqdGkiOiJjODFlMzFjMDJkNjRkNWM5N2Y0ODY1MjIxZmZiYjNhOSJ9.bMU34GKADZnErGqQZZPd7wOO1a2L2OvV72zhE6kL0OA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNjk1OTg4LCJleHAiOjE3NzUyODc5ODgsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjExMTNmNDgwMzY1ZWNkYmI3NGVmYjhiYjJiNjY5NTUwIn0.Xt-UYewr5-h0SMA-AJrSoGlc0XrRSQUfk6JRBtJcWhE', '2026-03-05 08:33:08', '2026-04-04 07:33:08', '2026-03-05 07:33:08', 0, 'okhttp/4.9.2', '154.120.181.126'),
(212, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzAwMTY0LCJleHAiOjE3NzI3MDM3NjQsInVzZXJfaWQiOjE1LCJqdGkiOiI5ZmRkN2YyYTQ2ZTU1Mzc4Yjc3YjQ4ZmI0MThkMzg1ZSJ9.a7YW6y9zPX67RvAq8G2OS78ms5iY8LzIvxTrTkFkk7I', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzAwMTY0LCJleHAiOjE3NzUyOTIxNjQsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjQ0M2QxYTMxNGM1OWY2MzgzODJhMGRiNjIwZjEwNjRiIn0.Jxc860xrRmQOU3sgcPFJbXFtIt-qmOIk-m5ScC4Ykyw', '2026-03-05 09:42:44', '2026-04-04 08:42:44', '2026-03-05 08:42:44', 1, 'okhttp/4.9.2', '154.120.181.126'),
(213, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzc3NjI3LCJleHAiOjE3NzI3ODEyMjcsInVzZXJfaWQiOjI5LCJqdGkiOiJhNzM3ZDY5OWUxOWZjZjM2MTZjNTVkMjhhODczZmY3ZSJ9.0IpCh6wtewQoFFaVQrxJGNZ2yuiVzthOGMjpGpmRCsQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzc3NjI3LCJleHAiOjE3NzUzNjk2MjcsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImMzZWFmN2ZmODQ1NWIxOGY0ODEyMDBhMDMzODdlMzViIn0.Im85FdsgCYDK7GEXY-BkDuPIPta7aJWGs1VY8Xf1Fxg', '2026-03-06 07:13:47', '2026-04-05 06:13:47', '2026-03-06 06:13:47', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', '102.68.203.208'),
(214, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzkxOTgzLCJleHAiOjE3NzI3OTU1ODMsInVzZXJfaWQiOjI0LCJqdGkiOiJkYmE1ZTlkZGMxYjFhZDdkYzg0ZWZlMjYxYzk3ZTJiNyJ9.2DUH5_qZWW_MFYhCXAfaBM3N7gIhb0strH-HEhfqlVQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzkxOTgzLCJleHAiOjE3NzUzODM5ODMsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImU4ODFmZWRkYTMzZDU1OTI0YmFjZmQwZDRhMjJiMDI3In0.TCl2kCoS8clUBVg9x3riL5qtMvpQtQuTaJoADrjmMA8', '2026-03-06 11:13:03', '2026-04-05 10:13:03', '2026-03-06 10:13:03', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.120.98'),
(215, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzk0NzAwLCJleHAiOjE3NzI3OTgzMDAsInVzZXJfaWQiOjE1LCJqdGkiOiI3Mjc1ZjkzYjBiNTM2OWQyYzU2NjMwZmJmZDU0ZGQ0NSJ9.Z_dsWrD9Qala17Mv_7CBw9ZRgfLfg_zC-WN-E_JLyNw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzk0NzAwLCJleHAiOjE3NzUzODY3MDAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImY5ZTg0ZDg4OTdjMmRjMTM5NjhmMTc3MmVjOWNmYjkzIn0.Yn2mZW07HYbmr-yQItm3cDp0FXwwI1RTk-YriR3X3GE', '2026-03-06 11:58:20', '2026-04-05 10:58:20', '2026-03-06 10:58:20', 0, NULL, NULL);
INSERT INTO `aem_auth_tokens` (`aem_id_token`, `aem_id_user`, `token`, `refresh_token`, `expires_at`, `refresh_expires_at`, `created_at`, `is_revoked`, `user_agent`, `ip_address`) VALUES
(216, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzk1NDA1LCJleHAiOjE3NzI3OTkwMDUsInVzZXJfaWQiOjE1LCJqdGkiOiI5ODg5YTQ3NGM4YThjMTNmMWQzYjdjYTI5MmYyNWE0NiJ9.-23VxO3_H5chF63a-nPd8ypGBOh36p3uMuiW3vlVi4s', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzk1NDA1LCJleHAiOjE3NzUzODc0MDUsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImIwZjEzZTc0Yjk4OWE3OGI2MmU5NjJlNWM4ZTdiNjdkIn0.CTJwzcjUTXNkCEp8ZmyrafOii3cUhIy0VW6XrWDwKXs', '2026-03-06 12:10:05', '2026-04-05 11:10:05', '2026-03-06 11:10:05', 1, 'okhttp/4.9.2', '41.74.208.126'),
(217, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzk1NDQ2LCJleHAiOjE3NzI3OTkwNDYsInVzZXJfaWQiOjE1LCJqdGkiOiI1OGNmNGM2OTMyN2Y4M2IyNjBmZjE2NGY4OGQ1OWUyOCJ9.TsXlqX_yF3lE5-VPA1ftCp6OhP5zjLIMNn_szuJVWd8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyNzk1NDQ2LCJleHAiOjE3NzUzODc0NDYsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI0NTdkYWMyMjZiYjIyYjZlNTZhOGE4YjRlNjg0MjZiIn0.vSJzBrVkwKMwhOr4YXsWTT4ry4ZksNSCSjl74Ve6nCc', '2026-03-06 12:10:46', '2026-04-05 11:10:46', '2026-03-06 11:10:46', 0, NULL, NULL),
(218, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyOTAyMTM0LCJleHAiOjE3NzI5MDU3MzQsInVzZXJfaWQiOjE1LCJqdGkiOiI1ZDkwYzE1YzA5MDQzYTQyMTQ3OTQ3N2FiYjU4MWE0ZSJ9.TwHfK-RyVuu-8q7GEKX21znOULXfBl7jj6vWT-bOGtc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyOTAyMTM0LCJleHAiOjE3NzU0OTQxMzQsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjcyZWUxNDgyMjA1NTA5MTZkMzViZTIyYTA3N2NhZjU1In0.UQlS-mKNaH5nAMgwv6C59vC7DlJiHLz5Q40y3bQdfTo', '2026-03-07 17:48:54', '2026-04-06 16:48:54', '2026-03-07 16:48:54', 1, 'okhttp/4.9.2', '41.74.208.63'),
(219, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyOTAyNjE5LCJleHAiOjE3NzI5MDYyMTksInVzZXJfaWQiOjI0LCJqdGkiOiJiYmM3NWMxZjIzYzZlYmU5MDI4NTVlNGQyMWE2N2RhOSJ9.hHX9IVVnhqHib8o3gOacZa_aXIdAZaZiKOAWXN1VQIY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyOTAyNjE5LCJleHAiOjE3NzU0OTQ2MTksInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjZlODA0Mjk5ZjAwNDA1M2VjOTQ5Y2ExODE3YzM3MmMzIn0._6crmel44JUWCyu8dlEcXGhM4SL3G-73baNIZ8AceRk', '2026-03-07 17:56:59', '2026-04-06 16:56:59', '2026-03-07 16:56:59', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.18.162.179'),
(220, 106, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyOTA0NzQzLCJleHAiOjE3NzI5MDgzNDMsInVzZXJfaWQiOjEwNiwianRpIjoiMDVlMjQzMDIyN2UxY2IyZWRmZTBjMTQ2ZmU0ZjE4OWEifQ.MFU7-dhfnK3glVKNzre2lyLEcE2VCBARF5Je7rIBOvg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyOTA0NzQzLCJleHAiOjE3NzU0OTY3NDMsInVzZXJfaWQiOjEwNiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI5NjA4ODRhYzRmZDYyZmYxZTYyOTcwYmU5YTNmYjY0MyJ9.g6CznilOxtpFW3HsI9U8NbCHBgE9GPNBTsyBQEzcmuM', '2026-03-07 18:32:23', '2026-04-06 17:32:23', '2026-03-07 17:32:24', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.17.119.99'),
(221, 50, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyOTQ3NTYzLCJleHAiOjE3NzI5NTExNjMsInVzZXJfaWQiOjUwLCJqdGkiOiJiMzgwMDg5NGVlM2JlYTE2MzFhNTI5ZTM1ZGUyZjdmYiJ9.dZ7D3eUMIosJQq2vakvigiP1D82Fs9VefKLHZp3tuao', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzcyOTQ3NTYzLCJleHAiOjE3NzU1Mzk1NjMsInVzZXJfaWQiOjUwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijk4NzAwN2YzMWY4MDg1ZTBjOTViNTMwMTI1ZjllYTJmIn0.kWQKK2p6XbX-YmP5NpDZw18hq7dkx17laVNkdcwKlmo', '2026-03-08 06:26:03', '2026-04-07 05:26:03', '2026-03-08 05:26:03', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '102.18.157.188'),
(222, 107, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMDM2MDUzLCJleHAiOjE3NzMwMzk2NTMsInVzZXJfaWQiOjEwNywianRpIjoiMThhY2UzOWEzMGM5MDAxNjQ4ODhjOTczOGJlNjhmZWUifQ.6qH1fPe2w6XL_GeJeYZy_qd7WVp5B_xRBpcjKpqyB98', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMDM2MDUzLCJleHAiOjE3NzU2MjgwNTMsInVzZXJfaWQiOjEwNywidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhYjhmYWIxYTc0MjIwMjM5YWY0M2Q4NzYxMGMyNDkyZCJ9.pMU-7o1wCp63yAXO9vNlbddfk-hzBlYkfYv18nGa0t8', '2026-03-09 07:00:53', '2026-04-08 06:00:53', '2026-03-09 06:00:53', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '102.68.193.144'),
(223, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMTIwMzYxLCJleHAiOjE3NzMxMjM5NjEsInVzZXJfaWQiOjE1LCJqdGkiOiJiZGYzNDU5NDYxMjEzNTM4ODNkYWNiYTc4YmMwNWNlMCJ9.mrir8bd36jmL1u_N9lUpNZRcqJdqgCdWfaX90ZN4FYA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMTIwMzYxLCJleHAiOjE3NzU3MTIzNjEsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImRhZjg3M2Q4ZjgyMzYyMTMzYmVhYjk4MTU5ODBlYmNiIn0.uC02esrXdLIeegOgd_s_jKZiBAUDAd6MuolXFQkOtN8', '2026-03-10 06:26:01', '2026-04-09 05:26:01', '2026-03-10 05:26:01', 0, NULL, NULL),
(224, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMTIwMzg3LCJleHAiOjE3NzMxMjM5ODcsInVzZXJfaWQiOjE1LCJqdGkiOiI0NTdhZjU0Mjk0NmQ0MjQ5YWM5NzliMDQzYTU5NWJlZCJ9.dcb0xCO2_7MCBTWfpkaPIqpAao_9MyBODo3x_kp8MJw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMTIwMzg3LCJleHAiOjE3NzU3MTIzODcsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjY2NGY5NWI5MTQxMTY2ZTM2NWRmYmY5NjVmNjE3NmJiIn0.DkCkmReNYBRe-H7iqcVZeNLnJwQpzkBpP2XImfg4jQk', '2026-03-10 06:26:27', '2026-04-09 05:26:27', '2026-03-10 05:26:27', 1, 'okhttp/4.9.2', '41.74.208.66'),
(225, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMTIwNDExLCJleHAiOjE3NzMxMjQwMTEsInVzZXJfaWQiOjE1LCJqdGkiOiIyODhmNDJiODlkZGJlOGI4MjJkY2YxMzU3YjcwM2E4YyJ9.nbQ9GmN8L1wRE2uuDCjtmBA_cBHEWGJUXnJBJ2piBI8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMTIwNDExLCJleHAiOjE3NzU3MTI0MTEsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjM0OGJhYjczNDU0YzEzMzM1ZTcyMDE5ODAzZjM5MzIyIn0.ewkUfYfQBkJm7bIWuyqDrV1-0NfFGFWZaErjdfGhnB8', '2026-03-10 06:26:51', '2026-04-09 05:26:51', '2026-03-10 05:26:51', 0, NULL, NULL),
(226, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMTIyNjc4LCJleHAiOjE3NzMxMjYyNzgsInVzZXJfaWQiOjE1LCJqdGkiOiI5OWM4YTg0ZTc1N2E5ZmQ5OTM4MmE0NjdlMmNhNWMzOSJ9.Y4KzUWwNEc6v0wVig2-llZ7bzei7vQX3wjhaB59n0Gg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMTIyNjc4LCJleHAiOjE3NzU3MTQ2NzgsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjA3MDcyMWE2MTc5MzJlMWI3Mjg1OWM2NGRlZTkwYzNmIn0.MuoyaQNK8s6m1PacQdmidixMNx23k3YIw9Xl5oZe5gM', '2026-03-10 07:04:38', '2026-04-09 06:04:38', '2026-03-10 06:04:38', 0, 'okhttp/4.9.2', '41.74.208.66'),
(227, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMjk5ODY0LCJleHAiOjE3NzMzMDM0NjQsInVzZXJfaWQiOjE1LCJqdGkiOiJhZDY2ODRjMTRjY2FiZTdkN2EyMmNhMTE0NzJlNGIwMyJ9.zpect0G9x_zDTUJMRZUATvKrFiNIHjqudZzASaj5IQs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMjk5ODY0LCJleHAiOjE3NzU4OTE4NjQsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijg0Mjk4NDU1YzU2N2I3MjE4NGQ5ZmM1NjZmOGE0MDVhIn0.8j80lqqtebTv-5wx4-U7olZ3WC9fnykaH_VUkhlLmaE', '2026-03-12 08:17:44', '2026-04-11 07:17:44', '2026-03-12 07:17:44', 0, 'okhttp/4.9.2', '102.18.162.67'),
(228, 99, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMzMzOTAyLCJleHAiOjE3NzMzMzc1MDIsInVzZXJfaWQiOjk5LCJqdGkiOiI5NTczMTQ2NzI5M2I1ZmQ4NjFiMzg5OTJmZjRkMzczMyJ9.C_8qUIZ6DdFq6RIOeyEb3idQ-nlzp-XiGQ6O_xl4Dtw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMzMzOTAyLCJleHAiOjE3NzU5MjU5MDIsInVzZXJfaWQiOjk5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImM2MjVjODRiYjUzNjc0NjA5NjZlZDc1NzZiNTliNDcwIn0.wLlvf43GC2Ey3hkOWiKIV6MAM-4rG7QmXGoYqT4N4rU', '2026-03-12 17:45:02', '2026-04-11 16:45:02', '2026-03-12 16:45:02', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '102.68.232.8'),
(229, 104, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMzMzOTI4LCJleHAiOjE3NzMzMzc1MjgsInVzZXJfaWQiOjEwNCwianRpIjoiMjg2ZGI4YTgxNjg0Y2MzZjY0ZDlmZmVkYmU2YzFkNjAifQ.9dJPbL9xcZEHhQTZOi36B8vGGoHreARzFa22nxg_g-k', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMzMzOTI4LCJleHAiOjE3NzU5MjU5MjgsInVzZXJfaWQiOjEwNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIxOGU5ZDc3ZDFmNTQ1YTRmODU3OTZiNjI5NDhkNjI3OCJ9.yNdGRBEUy3mHd-I9Dr-KQujElawE9NDNlVxVrsO-ph8', '2026-03-12 17:45:28', '2026-04-11 16:45:28', '2026-03-12 16:45:28', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '102.17.229.188'),
(230, 99, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMzMzOTY5LCJleHAiOjE3NzMzMzc1NjksInVzZXJfaWQiOjk5LCJqdGkiOiI5NzMxYWU1ODZlMjJhNGI5MDdiYmJmNzk0OTNiMDEwZCJ9.NfdLK5niXekg4Fvknv8l6aVQdPSELVtdGRr-NpMPxvE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMzMzOTY5LCJleHAiOjE3NzU5MjU5NjksInVzZXJfaWQiOjk5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjhjNzNlMTQ4YWRkOGIxNTFlMmZlNTgwOTZlNmY2NWViIn0.iSEz80tYUDFud0hxZ-83ltPJeGOXK_MHs_5jLSSFXig', '2026-03-12 17:46:09', '2026-04-11 16:46:09', '2026-03-12 16:46:09', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '102.68.232.8'),
(231, 100, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMzYxMzQyLCJleHAiOjE3NzMzNjQ5NDIsInVzZXJfaWQiOjEwMCwianRpIjoiZDBmNDE5NDlmYjQ2OGVjMjgwNmQxYTUxYmEzNTFjOWUifQ.mbsN1G95BYbyJ-EI1a4lgYBy9hY8dQKlUN5lmYhXax8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMzYxMzQyLCJleHAiOjE3NzU5NTMzNDIsInVzZXJfaWQiOjEwMCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhNDQ3OTg3MDY2Y2QzMjlhZTk0ZGYyMWI5OWZmZTlkMiJ9.flkht6J9VIowqKJR-7i8iY86ab2FJopxWH14KF9Dmnk', '2026-03-13 01:22:22', '2026-04-12 00:22:22', '2026-03-13 00:22:22', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '102.18.162.240'),
(232, 28, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMzk0Mzc2LCJleHAiOjE3NzMzOTc5NzYsInVzZXJfaWQiOjI4LCJqdGkiOiI4NjRmNjEyYzM0ZTAyMTJkZjk2MDRkZGE2NzA1YTE4OCJ9.RTBYmXfSAxiGBj8gVpxcBasZyMRh6EFsnZpqrnUlsO4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczMzk0Mzc2LCJleHAiOjE3NzU5ODYzNzYsInVzZXJfaWQiOjI4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImU4NWZkMGNlYTYyZjE0NTRhY2U5NWIyZjlhNmFkZTVhIn0.yVCm-7tpHZKBoS6wZpXpKlolCgwP3VSSlZVbWorRpaI', '2026-03-13 10:32:56', '2026-04-12 09:32:56', '2026-03-13 09:32:56', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '79.116.113.29'),
(233, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNTAxNzA1LCJleHAiOjE3NzM1MDUzMDUsInVzZXJfaWQiOjI0LCJqdGkiOiJjMWU5NGYyMzk4NDhmMDNmNTU3Zjc1MmIzMDVlNmU3YiJ9.5A1gAxNA7ZY9M0ptagUHnOQ8S4nQljffWQS0I09olcg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNTAxNzA1LCJleHAiOjE3NzYwOTM3MDUsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImFjMmVmODRjMjNkMmJjODYwZTY1ODJhODY5ODAwOGUwIn0.kuwF2HIIyFC83477-tnwaH7ZEep19n2htba3JY1Alxw', '2026-03-14 16:21:45', '2026-04-13 15:21:45', '2026-03-14 15:21:45', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.18.157.254'),
(234, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNjkxNDczLCJleHAiOjE3NzM2OTUwNzMsInVzZXJfaWQiOjMwLCJqdGkiOiIxYjUxNTI4YjkzNjM2NWY1MmM5NjQ5N2RkNmYzYTA0YiJ9.6gj5UMcbwrgZudlV56CKEOyjpTqpuaASNM8leC6GTHA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNjkxNDczLCJleHAiOjE3NzYyODM0NzMsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImU1ZTk0MTg4YzI0ODkzMTU5ZmMxMGNmOWM0Y2QxMGYxIn0.otrfgZ75gV_RS2YTtOzOnrpoTQZT-cvIOfV2Wjj-pjg', '2026-03-16 21:04:33', '2026-04-15 20:04:33', '2026-03-16 20:04:33', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36', '41.77.17.145'),
(235, 110, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNzY0NzA5LCJleHAiOjE3NzM3NjgzMDksInVzZXJfaWQiOjExMCwianRpIjoiOWMxNzdkNmNkZmY3N2VhMDRhYWZiZWJmNzY4NTUyYzMifQ.80BVihmOIw-jWyciQo7DMc44v_SrTEiUNao9jKF2thg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNzY0NzA5LCJleHAiOjE3NzYzNTY3MDksInVzZXJfaWQiOjExMCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIzMzcyNDgzYjY2NmIyNzMzNDlmNjVkZDNiOTI0ZjVkNyJ9.ubkouJ-0KGq7FeLnHeN3zrFsuK2AMsXOqT-xhTNOXCU', '2026-03-17 17:25:09', '2026-04-16 16:25:09', '2026-03-17 16:25:09', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '102.18.32.19'),
(236, 109, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNzY1NTc3LCJleHAiOjE3NzM3NjkxNzcsInVzZXJfaWQiOjEwOSwianRpIjoiNTYxN2UwODU5MWI0MjIyYzM0ZTc5OTU3MjBhMTNhMjkifQ.sauMv3fa00NS7-b5rXC6gm6pd3Th3CbUOqM-a5twZCU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNzY1NTc3LCJleHAiOjE3NzYzNTc1NzcsInVzZXJfaWQiOjEwOSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIyNjlkMjM0NWJjZTdmNzg1MzFmY2RjMzRmOGIxOWZhZSJ9.F-omSb9zSuSLL1UTfBd1sqFKg4PpxUUv9RKouGwtKsw', '2026-03-17 17:39:37', '2026-04-16 16:39:37', '2026-03-17 16:39:37', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36', '154.120.142.95'),
(237, 109, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNzY1NzY0LCJleHAiOjE3NzM3NjkzNjQsInVzZXJfaWQiOjEwOSwianRpIjoiY2YxZTU5OTBmNzU3ZGY4OTgwZTNkZDk5YmZiYWQyZGUifQ.rxZ78sKbr1pTHKI4ovsQj1i1tNQemttGWOI6MD3iybM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNzY1NzY0LCJleHAiOjE3NzYzNTc3NjQsInVzZXJfaWQiOjEwOSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhMTFjMjI3ZTFmNzc1OTVhMTU4MDE4NWFhOWEzNjg0YyJ9.AOjdsr3nWkjFAS7b0zxLq9mNHhq0G0skC7nx05RyoHk', '2026-03-17 17:42:44', '2026-04-16 16:42:44', '2026-03-17 16:42:44', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36', '154.120.142.95'),
(238, 109, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNzY2MzYwLCJleHAiOjE3NzM3Njk5NjAsInVzZXJfaWQiOjEwOSwianRpIjoiOGNhODcwM2RjZmM4OTJmZDFkMTE3ZTc0NWMwYzQ5MGMifQ.TiJTp3RYArZEq9cEXWVxSsW7mo-lmKpitOhpHj4SLC0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczNzY2MzYwLCJleHAiOjE3NzYzNTgzNjAsInVzZXJfaWQiOjEwOSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJlNTI0Njk5ZGI5MmVkZDBkOWUyYjM3MDRlNTA5Zjk5YyJ9.pie3vUfkKReqom2ErjjkUAT1uQTvj6XQp1v7cdhq2j8', '2026-03-17 17:52:40', '2026-04-16 16:52:40', '2026-03-17 16:52:40', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36', '154.120.161.140'),
(239, 101, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczODI0NTg3LCJleHAiOjE3NzM4MjgxODcsInVzZXJfaWQiOjEwMSwianRpIjoiMTU3ZjY0YmNhZmE1NDQwZGMyMDk2ZTVkNzZkNzk1ZTYifQ.LjeQWqJNXy959WSzbIv4SUkRVYKj0roJazvyUrR1DpY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczODI0NTg3LCJleHAiOjE3NzY0MTY1ODcsInVzZXJfaWQiOjEwMSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI2YWRlZGRlZmQyOTU3YTc5YzBmNTBiOTA2NDU4MmViYyJ9.Vs9eWAIK7gPIOjcASElhUH5FKDed-ftQHwA2pFAHcOc', '2026-03-18 10:03:07', '2026-04-17 09:03:07', '2026-03-18 09:03:07', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '154.120.163.216'),
(240, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczODg0NjY2LCJleHAiOjE3NzM4ODgyNjYsInVzZXJfaWQiOjI5LCJqdGkiOiI1YzkyMDU3ZTg5ODJlMGJjNjk5Y2MzOTdlN2VkNmNhYiJ9.Y7vXgXUacw5ZoQF3jqcFyblGbvsgAg0y5dF1ZI9OYi8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczODg0NjY2LCJleHAiOjE3NzY0NzY2NjYsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjUzMGVkZjBjNzM4NGFjZjQ1ZTJiMzY4MDgwNmQxMDMwIn0.S7o72pFYToo8600fMNp_VxA7BP8E5pZrkOBpFp5sGpo', '2026-03-19 02:44:26', '2026-04-18 01:44:26', '2026-03-19 01:44:26', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', '102.18.162.13'),
(241, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczOTExMzY1LCJleHAiOjE3NzM5MTQ5NjUsInVzZXJfaWQiOjI0LCJqdGkiOiIyMGEyODk5N2UzYTMxOGVjZmM2ZTgwNzY2ZGEyMDNkMSJ9.8geq-2yF0CvniTCb-bgIVwABjaOpVV1fb7pijraMfVE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczOTExMzY1LCJleHAiOjE3NzY1MDMzNjUsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImI4MjFkOWZlMjM3MTBlYjM3NzM1NWQ5MzIzMzBiYzFlIn0.86Tb6aSJSfdwNO4BR14_Cxf8vcJmgdqIHr2CSIzoZOo', '2026-03-19 10:09:25', '2026-04-18 09:09:25', '2026-03-19 09:09:25', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '41.77.17.165'),
(242, 89, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczOTE1OTQ5LCJleHAiOjE3NzM5MTk1NDksInVzZXJfaWQiOjg5LCJqdGkiOiJlMjk3ZTM3ZDA3ODMyMTRjNjIzZjMyNTc5NzgyM2UxNSJ9.5fkXRPK27XiYLFPz2j7uBYGnhkYIc4ii-D1WPsNvSiY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczOTE1OTQ5LCJleHAiOjE3NzY1MDc5NDksInVzZXJfaWQiOjg5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjAwYjhkMWVkZmM2OTliNzMwMWNkNWMxMjc1YjU1OGRjIn0.bRqXORHsXXlFw78HNRu746XLwEj_elLttmnpXv4xKT0', '2026-03-19 11:25:49', '2026-04-18 10:25:49', '2026-03-19 10:25:49', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '154.120.160.186'),
(243, 51, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczOTE4MjM1LCJleHAiOjE3NzM5MjE4MzUsInVzZXJfaWQiOjUxLCJqdGkiOiIxYzE1OWIwY2Q5ZjZkZjVlZTc4Y2NkMjM0YWU3N2VmYiJ9.auJCQwMR_s8WVmWMSOMwcJv-jj1Z-2GVkgFPBr9Sd_k', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczOTE4MjM1LCJleHAiOjE3NzY1MTAyMzUsInVzZXJfaWQiOjUxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijc1ZTE0NDg0ZjljNmM5YTgzZDg1YzhiZjE5Y2JmMDYxIn0.r2hX9hE3Bma_imBxw0pbNgv9I2Wf9qYBWohJAxdFqmE', '2026-03-19 12:03:55', '2026-04-18 11:03:55', '2026-03-19 11:03:55', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.18.158.198'),
(244, 39, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczOTIxMTQyLCJleHAiOjE3NzM5MjQ3NDIsInVzZXJfaWQiOjM5LCJqdGkiOiIyYzY1NjE0MjgyN2I5Yjk1NmRhMjcyZDgxYTMzMjZjOCJ9.AhOLnNCzbd57HYv0Hq82MgWcgve1AsAe3HEFJq-ayyI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzczOTIxMTQyLCJleHAiOjE3NzY1MTMxNDIsInVzZXJfaWQiOjM5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjMxMzkwZDc3OGY4NTZlNDZiN2U0MWQwMDc1OTY5MjJhIn0.foXbhsjAfW9ZMz86Tbl4b3Su5MteXzvsVVTIcpLFt8A', '2026-03-19 12:52:22', '2026-04-18 11:52:22', '2026-03-19 11:52:22', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', '102.18.157.79'),
(245, 67, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0MzU1OTQwLCJleHAiOjE3NzQzNTk1NDAsInVzZXJfaWQiOjY3LCJqdGkiOiJhMjcxMTk1YzY4YThlNWU0MzEyZTExZWRhYzM3ZGQ5ZCJ9.QVZU24FLgO7IknCc4Mzk_b9G1FjpNc_3p65TAA3qWFY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0MzU1OTQwLCJleHAiOjE3NzY5NDc5NDAsInVzZXJfaWQiOjY3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjZjMGE0NWEyOWM5YmNiODZhMTc5YTYyNzRmZDNiODVjIn0.qWYH9iBUFAK-6PEHOlx35LnGr-HdYIdapllM0cckM-Q', '2026-03-24 13:39:00', '2026-04-23 12:39:00', '2026-03-24 12:39:00', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', '161.216.164.72'),
(246, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0MzYzMDAwLCJleHAiOjE3NzQzNjY2MDAsInVzZXJfaWQiOjE1LCJqdGkiOiI0ZWZlMjAxMTNlZjA5YzMwY2RkNzExODZlNDE4YmFlYiJ9.dOo5jebeFsuV9r5uthTtcw-epk8zkndEX8alGHWknj4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0MzYzMDAwLCJleHAiOjE3NzY5NTUwMDAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjYwYTk3ZmIyMWIzMzQ2YWUwMDMyMWMwYTZlZjMwYjk4In0.vecxcWmDQ_3VAxHbisR9m78jgP3ybHzwuhzgE9O01r4', '2026-03-24 15:36:40', '2026-04-23 14:36:40', '2026-03-24 14:36:40', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:148.0) Gecko/20100101 Firefox/148.0', '154.120.181.159'),
(247, 19, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0MzY3ODI4LCJleHAiOjE3NzQzNzE0MjgsInVzZXJfaWQiOjE5LCJqdGkiOiI0ZWQ3MzBiMjIxNDU4NjUzMjA2ZjAwMjUxNzcwNDc5MyJ9.Us2fFPaqPIsES9Jun5WjflPwhUXrg4glDVa2ipzf_rQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0MzY3ODI4LCJleHAiOjE3NzY5NTk4MjgsInVzZXJfaWQiOjE5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjFlY2UzOTgzZDE3MjRjNjFkZGI2MjkyNTA3MTcxZmI3In0.fPzI0HIJzyv3t9ADYhf4GzBMhwAB_DzuNmHH2P1DKHs', '2026-03-24 16:57:08', '2026-04-23 15:57:08', '2026-03-24 15:57:08', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36', '102.18.59.241'),
(248, 61, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0MzY5NDg5LCJleHAiOjE3NzQzNzMwODksInVzZXJfaWQiOjYxLCJqdGkiOiI1ZjlkYjkyZjVhOWQ5MTZmNzQ2NjBlMjkyOGU1MjU4MSJ9.lsyMrwtC26qcAV5vhAg1Z30hqJUmKm6bcMrwLA0Q918', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0MzY5NDg5LCJleHAiOjE3NzY5NjE0ODksInVzZXJfaWQiOjYxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImIyNzU1NWRhMDgxYTc3NGZhZDEyNjQ0MTVjOTVhNzBkIn0.Xy-xNG5Z_WXJIvblzMg_FSQA-4hZK-uRqLvrci8zkf0', '2026-03-24 17:24:49', '2026-04-23 16:24:49', '2026-03-24 16:24:49', 0, 'Mozilla/5.0 (Linux; Android 10; MI 8 Lite Build/QKQ1.190910.002) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.118 Mobile Safari/537.36 XiaoMi/MiuiBrowser/14.47.1-gn', '129.222.109.58'),
(249, 88, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0NTA1ODI2LCJleHAiOjE3NzQ1MDk0MjYsInVzZXJfaWQiOjg4LCJqdGkiOiI4MGRkMTEwOTE4NTkzNmEyZGJjZTlmOWQ3ODcxY2QxNyJ9.qVYta_MBlbXaBQkt3xqlx9rGJuYdI2g77qQ9LOfq4LA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0NTA1ODI2LCJleHAiOjE3NzcwOTc4MjYsInVzZXJfaWQiOjg4LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjYxZjViYWVlYjgyOWJjZTE1MmY3OGQ3M2MxNDZiZTMzIn0._fzu2iIXOnZ8Cnpdv1QdSLwc5PSSJO_8JSyK3H1QDJo', '2026-03-26 07:17:06', '2026-04-25 06:17:06', '2026-03-26 06:17:06', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.18.157.62'),
(250, 102, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0OTYyOTI1LCJleHAiOjE3NzQ5NjY1MjUsInVzZXJfaWQiOjEwMiwianRpIjoiZWUwMWNmNDA1MDllMDczNWNiNTllMTVhODcyYTUyN2YifQ.bf9GjT9NStIdA5-BQtvacroTAYTmtiNQvCPv-FZ9BXI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc0OTYyOTI1LCJleHAiOjE3Nzc1NTQ5MjUsInVzZXJfaWQiOjEwMiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJkYzVkZjVjMTFjODhkYzg4MjQ3N2Y3OGI4Y2IwNGQ1ZCJ9.4xT7iLvvyry4N9PTH-ZoV2GyTaPYB7WXKwpKBUApqDE', '2026-03-31 14:15:25', '2026-04-30 13:15:25', '2026-03-31 13:15:25', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '129.222.109.56'),
(251, 105, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc1MDMyNjI5LCJleHAiOjE3NzUwMzYyMjksInVzZXJfaWQiOjEwNSwianRpIjoiOGRjNmRmMDAzNzhkOTcwNTgzZTc5NDE3MzAxNWYxYTgifQ.wEApB-s8ZR4fVxElxFhsDUJEh6A54e9Fcg07AaXhATQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc1MDMyNjI5LCJleHAiOjE3Nzc2MjQ2MjksInVzZXJfaWQiOjEwNSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJmZGI0YTEyOWYzNGE5NDBkYjQxNmQ4MzQ3NzE1NTBkMCJ9.yX0bW9g6_D7Dn7QLjYzkJkoqQWsPHxzlK84uY-Fq5t4', '2026-04-01 09:37:09', '2026-05-01 08:37:09', '2026-04-01 08:37:09', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36', '41.74.210.10'),
(252, 35, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc5MTA5OTQyLCJleHAiOjE3NzkxMTM1NDIsInVzZXJfaWQiOjM1LCJqdGkiOiIzYmM5N2U4MTFiNzBhYzAwOTI3MTJhZTFiMjU0ODlmZSJ9.xp5y-RRaJHy67oC0bQ6e35EsAMv1oeCcj9T4wW1PUT4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzc5MTA5OTQyLCJleHAiOjE3ODE3MDE5NDIsInVzZXJfaWQiOjM1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImVlMTQxMjhjY2ZmMGNhYTk2OGEyZTVhOGUxM2RmOWQ5In0.R5KgicPP5xQXHjmTbrrrtgwpaxgAwPrOYS3b3dI5AaI', '2026-05-18 14:12:22', '2026-06-17 13:12:22', '2026-05-18 13:12:22', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36', '102.68.194.111'),
(253, 51, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgwMTI1MDM3LCJleHAiOjE3ODAxMjg2MzcsInVzZXJfaWQiOjUxLCJqdGkiOiI5NTQwMDdmMjZjZDM2NTM3ZGU4MzMyYmVlMzdlMWU3NSJ9.0YUl4ow-aF7RHFL68cYsxqoxpfYvDh-dqcjOEbAKw5c', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgwMTI1MDM3LCJleHAiOjE3ODI3MTcwMzcsInVzZXJfaWQiOjUxLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImY4MGViNzEyN2QwYzgyMTFlMGQ2NTY4NjJmNzQ3Zjc0In0._WKUThnnkcbfzlnDXpAWg8SBzptrTJm4lhqXIb0SD5Y', '2026-05-30 08:10:37', '2026-06-29 07:10:37', '2026-05-30 07:10:37', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '102.17.117.84'),
(254, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgxMDgwMzE2LCJleHAiOjE3ODEwODM5MTYsInVzZXJfaWQiOjI0LCJqdGkiOiI0ZTdjMjM3N2QwZDgxYjUxNGY5YTcwMjU2MWNlNWM2NCJ9.CKrAr8FNg2rpIQcjgF9752XeZxF91qz9-TyBd85pkJA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgxMDgwMzE2LCJleHAiOjE3ODM2NzIzMTYsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijg5NjQ1YjkwZTc2YzIxZmRjMjZkZTFkMDFkNGYzYTVmIn0.5QH2zr44opQNHxIVaXbiZb7-BbDrbwL9Okpdisk5cJg', '2026-06-10 09:31:56', '2026-07-10 08:31:56', '2026-06-10 08:31:56', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.118.172'),
(255, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgxMTUxMTEyLCJleHAiOjE3ODExNTQ3MTIsInVzZXJfaWQiOjI0LCJqdGkiOiI4M2MwZDk5MjA2NjhiOTE1MWIwOTM3YjNhYTk3YTExYiJ9.qT7N0Sh8TLtqv1sPm5rnT3WZazM6ODq-Yz_7VB4F__c', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgxMTUxMTEyLCJleHAiOjE3ODM3NDMxMTIsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImJlMjJjNjIyM2QzZTQyYmI5Y2RmZjlmNzI5YmI3NDA1In0.B2f-cap4yIitnjtg3y2G4bNfQOat2foEe12iEXwSxs0', '2026-06-11 05:11:52', '2026-07-11 04:11:52', '2026-06-11 04:11:52', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.17.118.172'),
(256, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMDU5OTU3LCJleHAiOjE3ODIwNjM1NTcsInVzZXJfaWQiOjE1LCJqdGkiOiJjMTRmZmEzNzQzNzI0ZjEyMjJlODI1ODkwNjcyYzAwOSJ9.ZgFFILW4JkR2SfUiFNmmfvqTTTmL3Nky7k2tXzoYISo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMDU5OTU3LCJleHAiOjE3ODQ2NTE5NTcsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImUyMzFkZDMyYzkyZTEyMDYzZWM5YzlmN2Q0YTY3YmFkIn0.9vSs3o4q8QuUr_7fNf78Z9KvJZtLtNwINHz-MZzF1HM', '2026-06-21 17:39:17', '2026-07-21 16:39:17', '2026-06-21 16:39:17', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '102.17.119.80'),
(257, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMDYwMTM0LCJleHAiOjE3ODIwNjM3MzQsInVzZXJfaWQiOjE1LCJqdGkiOiJlNGNiMmU5ZGVkM2QzNTUyNmMxODhhMDJmZWQxMDAwYiJ9.PAO6mybHuRrW5dPl6SEX4XIdKDtWVGTOthgQLHF9V28', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMDYwMTM0LCJleHAiOjE3ODQ2NTIxMzQsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjZmZjBiZmRkZjc5NTc4MTQ1NGQ0ODQwN2EwMzcxNzNjIn0.cx7M-1DQhAwehAEnkkLbu8XrpPmatKViYbYxAR0PM58', '2026-06-21 17:42:14', '2026-07-21 16:42:14', '2026-06-21 16:42:14', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '102.17.119.80'),
(258, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMDYyMjE0LCJleHAiOjE3ODIwNjU4MTQsInVzZXJfaWQiOjE1LCJqdGkiOiIxZWEzZWQ1YzJhODg3ZjY5ZjhmM2I5NGE4NTljNTNlZSJ9.s9G9LIdxKgi3n6ubFov__3MqdOCbWXRgfxnY_6aD2Kc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMDYyMjE0LCJleHAiOjE3ODQ2NTQyMTQsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjFiODczZmUyZTdhZWM0M2M4OTZjYzM2NTUwMWQ0YTY1In0.HCARYy9463DjFVMrp98biXs2WrQf6esU4gxQnuXwHMg', '2026-06-21 18:16:54', '2026-07-21 17:16:54', '2026-06-21 17:16:54', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '102.17.119.80'),
(259, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMDYzMTM5LCJleHAiOjE3ODIwNjY3MzksInVzZXJfaWQiOjE1LCJqdGkiOiJhOTg5ODkwOTY2NmM5MTQyYjEyYjI5YzFlZDkwNWJkZCJ9.pVgghXC97gzKOvQ12wAThjZIl5oQE-EOuU_UyouVNfM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMDYzMTM5LCJleHAiOjE3ODQ2NTUxMzksInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjU5NWViMzU2MWYwOTJmMDlkNzY0MzZkMWI4NzNkOTQ3In0.qGAZJBmAIpjyY3Z0J8PLSRPW3vRPO36OZ48jdjHbSh8', '2026-06-21 18:32:19', '2026-07-21 17:32:19', '2026-06-21 17:32:19', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '102.17.119.80'),
(260, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMTMzMjQ2LCJleHAiOjE3ODIxMzY4NDYsInVzZXJfaWQiOjI0LCJqdGkiOiI3Yzc5OGNmMGM4NmEzYzA5ZDljZmE5YzE0ZDc5NTI4OCJ9.Y7FRD1EbQCjsK-B4N2CeMqZgT2-DK3sCmcox7CPMv2Q', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMTMzMjQ2LCJleHAiOjE3ODQ3MjUyNDYsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRjZWQ2MWZlZmNhNjRjNGM2MWIwZDQ1N2RiZWQyY2E4In0.oocq62UoQ19n41d6AqaC2Sj0zfBPFGQZ583MfR522Dk', '2026-06-22 14:00:46', '2026-07-22 13:00:46', '2026-06-22 13:00:46', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.18.159.131'),
(261, 114, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMTk2NDI4LCJleHAiOjE3ODIyMDAwMjgsInVzZXJfaWQiOjExNCwianRpIjoiMThhNDllNTZlYzJjNzNiZGZmMGMwOWVkMjc4MTVhOGUifQ.49fDEOWqiUROUFiPiH9gTNdgQGjHnvvNMGBUlUm3yzg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMTk2NDI4LCJleHAiOjE3ODQ3ODg0MjgsInVzZXJfaWQiOjExNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI0ZDdkYWVhMzdkYmFlMjkyN2Q1YzAyMjJhMjFkNWJmZCJ9.bBqNzqAsxKIvuel5qzBTnEfu9A4CUA-KCPSNBZRiTxc', '2026-06-23 07:33:48', '2026-07-23 06:33:48', '2026-06-23 06:33:48', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '41.77.17.204'),
(262, 111, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjA4NTUyLCJleHAiOjE3ODIyMTIxNTIsInVzZXJfaWQiOjExMSwianRpIjoiZDRhOWY0ZDU1N2JiZjZkYjlkN2ViYWE3MjI5NzM3NWUifQ.N0x0Bzwrce5DP4LqUlhdTXI8Xmbuz-jUwFKK_u-RaqU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjA4NTUyLCJleHAiOjE3ODQ4MDA1NTIsInVzZXJfaWQiOjExMSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJiMzM0YjMwMTc1NjQxODFmZjI5NjQ2M2EyMTliZmRhOSJ9.Zwnvtaz78cR6wUh0mnNu0kAAjb04pF8OQDthOEl7v9Q', '2026-06-23 10:55:52', '2026-07-23 09:55:52', '2026-06-23 09:55:52', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '154.120.161.56'),
(263, 113, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjI1NDMyLCJleHAiOjE3ODIyMjkwMzIsInVzZXJfaWQiOjExMywianRpIjoiNjc4YWU1NTg5NTE0Mjc1MjBjMDZhZmJmODhhNjNhZDAifQ.0clcU9fqYGINzc_3sclmDjVUIRyaroHIC7Hs7m7Ahuo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjI1NDMyLCJleHAiOjE3ODQ4MTc0MzIsInVzZXJfaWQiOjExMywidHlwZSI6InJlZnJlc2giLCJqdGkiOiI5OWZkM2Y1YThiMWUzNGU0MjMxMWZlMzA1ZjdhNDRiNiJ9.vORud2pOQ0d9D8cB5TSv2Vyw9fGjw6M1cJEO2nDwILI', '2026-06-23 15:37:12', '2026-07-23 14:37:12', '2026-06-23 14:37:12', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.18.160.211'),
(264, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjMyMTcwLCJleHAiOjE3ODIyMzU3NzAsInVzZXJfaWQiOjE1LCJqdGkiOiI5ODdmZWQ5YWNjNzViNTcxM2QyZjdhZGRmZjE3MDBjZiJ9.bN97kFQA7olSSRy_RkrNcSgQj3H6j_335d5x3aS9QZc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjMyMTcwLCJleHAiOjE3ODQ4MjQxNzAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijc3YmMwZjgzOTI4MmNlMDg1YmQwZjY5Y2U0ZjJmNmI4In0.J3CKQTo3HgUTEUIUfRCa4QWfLDuFyQ2OpaN9S7wKTvY', '2026-06-23 17:29:30', '2026-07-23 16:29:30', '2026-06-23 16:29:30', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '102.17.119.143'),
(265, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjMyMzAyLCJleHAiOjE3ODIyMzU5MDIsInVzZXJfaWQiOjE1LCJqdGkiOiIyMDQ1NjgzZThmYWZjNmUxNzBiYmM5NTRhMThmZTMwZiJ9.l9LcIiHdjedo2htw4FgLiuQlud5AZ4Ox7l_tY9tiQ24', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjMyMzAyLCJleHAiOjE3ODQ4MjQzMDIsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjU4MDk2M2IzODdmNTdjNTAxYWZiMDE5OWU0NTlhOGU4In0.ect2ItZH4gtViaF7Bsibxau1DWmCSQF84Leq0nf6HvU', '2026-06-23 17:31:42', '2026-07-23 16:31:42', '2026-06-23 16:31:42', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '102.17.119.143'),
(266, 116, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjMzMDM5LCJleHAiOjE3ODIyMzY2MzksInVzZXJfaWQiOjExNiwianRpIjoiMGZjOTBiMzdhZTlhNzY1YWZlNGExYTUyOTE3NGVjM2IifQ.b-4z-u56N76Qm3qhPHa2sUxGMU9a55QINiCMSoqwaAA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjMzMDM5LCJleHAiOjE3ODQ4MjUwMzksInVzZXJfaWQiOjExNiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJkMzY4ZGVmMWQ0ODk2N2Y3YmU5NDljNzZjZTI1YjZiMyJ9.E5MmH3vlr10yNB0XuMY0V-gnfwhk7TUaqUhoY7trkNE', '2026-06-23 17:43:59', '2026-07-23 16:43:59', '2026-06-23 16:43:59', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '102.17.119.143'),
(267, 116, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjMzMDgzLCJleHAiOjE3ODIyMzY2ODMsInVzZXJfaWQiOjExNiwianRpIjoiMzQ1MzNjNzBmODlhZjBhM2FiNTRkOTRiNjg1YjRkNDIifQ.wkZGmyPkzWR5LaOsS4qbBdJg42zY1AYyVn1u8H0WwJ4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjMzMDgzLCJleHAiOjE3ODQ4MjUwODMsInVzZXJfaWQiOjExNiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJiYTZiMzk3ZTc2NzEwM2E5OTFiN2VhMDNlZTdjOWIxMSJ9.Sz8pxsUYgp6ARokqJ5menAzEteOdaRzEarF5_Hvc5VU', '2026-06-23 17:44:43', '2026-07-23 16:44:43', '2026-06-23 16:44:43', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '102.17.119.143'),
(268, 27, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjgwNjU2LCJleHAiOjE3ODIyODQyNTYsInVzZXJfaWQiOjI3LCJqdGkiOiJhMzU2ZDkwZjU5OWFiODdmYzA5NjIzYjEzYWUwOWFjMCJ9.i4BfESbpN85IeXxljBTj4d01Yy6bkq-vI9vRaJlJS1o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjgwNjU2LCJleHAiOjE3ODQ4NzI2NTYsInVzZXJfaWQiOjI3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjYyYTM1YzIzODBjOWFkMDZmNWE0YzQ4NzczNWUzNzY3In0.Awm-euK1YyD9W2r3AoBAQk_q7iipiXPm51a0SWKXAUc', '2026-06-24 06:57:36', '2026-07-24 05:57:36', '2026-06-24 05:57:36', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '196.20.217.176');
INSERT INTO `aem_auth_tokens` (`aem_id_token`, `aem_id_user`, `token`, `refresh_token`, `expires_at`, `refresh_expires_at`, `created_at`, `is_revoked`, `user_agent`, `ip_address`) VALUES
(269, 27, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjgwODI5LCJleHAiOjE3ODIyODQ0MjksInVzZXJfaWQiOjI3LCJqdGkiOiI2ZmE2ZjNmMjBkN2JmZWZkNDk2Yzk3NzYzYzc4ZmM3ZSJ9._HmTkdaOjzsbDCwl3June55SBf7dypNSu-jF1AvCfE0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjgwODI5LCJleHAiOjE3ODQ4NzI4MjksInVzZXJfaWQiOjI3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjlkMzQ3ZjI5YWYxZDVkZWNjOTFlZTg2OGExM2FlODRhIn0.d4d3yB45UAS3Qnv6kUZolEw_PWuVxR-6JDQmR_BKV_8', '2026-06-24 07:00:29', '2026-07-24 06:00:29', '2026-06-24 06:00:29', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '196.20.217.176'),
(270, 84, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjg0OTQ2LCJleHAiOjE3ODIyODg1NDYsInVzZXJfaWQiOjg0LCJqdGkiOiJhY2Y4OGViMDBiM2I0Njk1ZjA2M2MyYWRkYmY4MjEzOSJ9.2ltmM-m6ejxXxVQRwmG-3MTmoQ2TVgbb4knRSMjgCPw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyMjg0OTQ2LCJleHAiOjE3ODQ4NzY5NDYsInVzZXJfaWQiOjg0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImY2NWIzYjUyMDQyZTM3MTY3OGExNTQ2MDhmOGYxZjM2In0.oxKIetP2rIx7uii0FJpPi3_BKKxY1hK2ev8o5ZAq2ms', '2026-06-24 08:09:06', '2026-07-24 07:09:06', '2026-06-24 07:09:06', 0, 'Mozilla/5.0 (Linux; U; Android 11; moto g power Build/RPMS31.Q1-54-13.3-8; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/149.0.7827.91 Mobile Safari/537.36 OPR/99.3.2254.1265', '82.145.223.194'),
(271, 65, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyNTc3NzUzLCJleHAiOjE3ODI1ODEzNTMsInVzZXJfaWQiOjY1LCJqdGkiOiI0MDU2ODAyMThiYWIzNmFlYzdhNDc4YjNhOWU1NGE5NiJ9.waWcyeYSLc_V4_1WbrSm3Fz_kDgkrSK9i6FhFFcvy3E', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyNTc3NzUzLCJleHAiOjE3ODUxNjk3NTMsInVzZXJfaWQiOjY1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjUwMTUyNmYxZWNhOWUyNWI1OTI1NTNkMjMxYTlmNjYzIn0.7cwK2w-uSymH_0kkdmLto-tsrYFzqkC3k0mrAmfTaJM', '2026-06-27 17:29:13', '2026-07-27 16:29:13', '2026-06-27 16:29:13', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0', '129.222.109.153'),
(272, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyNTc5MDUwLCJleHAiOjE3ODI1ODI2NTAsInVzZXJfaWQiOjE1LCJqdGkiOiI2MWEwODc1YTJhM2I1NWNkNzY3MjRkYjczMjdiMzM4ZiJ9.qB553e2HExgurDkuo7aF5aJD-K0NqKFaNigt4w5qkSk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyNTc5MDUwLCJleHAiOjE3ODUxNzEwNTAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRmNWZlZDQ5YzQwMDc3MWE5MjI3M2JlNmY0NGFmNzA1In0.paVTa_y3x8ZoRpuDpMPkzJMob5RwJ5ir8olFE_gU9VQ', '2026-06-27 17:50:50', '2026-07-27 16:50:50', '2026-06-27 16:50:50', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '102.17.120.234'),
(273, 16, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyNjQ5MTUyLCJleHAiOjE3ODI2NTI3NTIsInVzZXJfaWQiOjE2LCJqdGkiOiI2MmFjYmUzZDMwZThjMWUxNzcwYTFmMDhiMmEwYTM2OSJ9.PPIM_TuFptKo2pznvmAeGCSR_3VYJ6dsIwgYGuxefMM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyNjQ5MTUyLCJleHAiOjE3ODUyNDExNTIsInVzZXJfaWQiOjE2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjUzZjcwMDRmZjEwN2M3YWVlMDJhMjEyODk3NWZkNTNkIn0.9aWvnWGWfbuukatAbcrgWpmHkx7chWGWNyifcLyp6ys', '2026-06-28 13:19:12', '2026-07-28 12:19:12', '2026-06-28 12:19:12', 0, 'Mozilla/5.0 (Android 15; Mobile; rv:152.0) Gecko/152.0 Firefox/152.0', '102.18.160.155'),
(274, 115, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyNzEzMjI4LCJleHAiOjE3ODI3MTY4MjgsInVzZXJfaWQiOjExNSwianRpIjoiN2RiNzEyZDZhMDU2MDAyMDQxYzhhOTM1ZGYxN2M4NmUifQ.qNWr1Vyu-dRb85PSCeydvt0c5RAyeDTOSTUBldabD6w', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyNzEzMjI4LCJleHAiOjE3ODUzMDUyMjgsInVzZXJfaWQiOjExNSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI1NTQxMzhhMzNhMjU0MzI2ZDI1YWYzNDhkYjI3ZTkyZiJ9.l2GguQ61Wb2ciCqr-cJv8ZqUrdsuDd87Yce8X51qoDw', '2026-06-29 07:07:08', '2026-07-29 06:07:08', '2026-06-29 06:07:08', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0', '102.16.18.134'),
(275, 34, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyNzI5NjYwLCJleHAiOjE3ODI3MzMyNjAsInVzZXJfaWQiOjM0LCJqdGkiOiIzMTcwYTJmZWMzNzVmZjc5YTAzNWQzNzIyNmJkNmMwOCJ9.TRuwDswmud7hHndHTcIueA1D11ILLWsTqi7aSnaSM9E', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyNzI5NjYwLCJleHAiOjE3ODUzMjE2NjAsInVzZXJfaWQiOjM0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjNkMjM1N2Y3NGI5MzUxMTQ4N2M3NmQ1Y2FmMTY4N2ZjIn0.Ydf801Hj3bRuRQ050Gcp4BLdlrM57D5K50VQnh0j2bc', '2026-06-29 11:41:00', '2026-07-29 10:41:00', '2026-06-29 10:41:00', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '154.120.142.108'),
(276, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyODk5NzIzLCJleHAiOjE3ODI5MDMzMjMsInVzZXJfaWQiOjE1LCJqdGkiOiI1NjZkNDAwNjhkN2MzNjQ4YjgxYzBlMjAxNDQzNTEyZSJ9.NNzJ_nojAxlzFXxZFdWaYAm4H8WbmGvtIz4BkpPdA9A', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyODk5NzIzLCJleHAiOjE3ODU0OTE3MjMsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjU3MGYxZjRkN2IyOTI5ZjY1OTllYjliNGMxOTVjNjY2In0.CmyPyIkre0a23d2JYOGyg53RorJJEsxrjmjeF-P0FB8', '2026-07-01 10:55:23', '2026-07-31 09:55:23', '2026-07-01 09:55:23', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(277, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyODk5ODQ4LCJleHAiOjE3ODI5MDM0NDgsInVzZXJfaWQiOjE1LCJqdGkiOiI2NzllZmE5NjcwMzJjMGRmN2I1ZWY4MzgzMTAxYzM2OCJ9.7Q3BkTtQVw5UZhGNq1dRbdj-cwhJlFBDDCUg_-UAFao', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyODk5ODQ4LCJleHAiOjE3ODU0OTE4NDgsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImRkM2M0ZmViNjZiYmEyMWNkZjFlNmQ2MmU5MWRmNWIzIn0.1oj_5K1wIX6raBkfeogL_6dVcvZt2INFLjN4j8sjcnE', '2026-07-01 10:57:28', '2026-07-31 09:57:28', '2026-07-01 09:57:28', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(278, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAwMTEzLCJleHAiOjE3ODI5MDM3MTMsInVzZXJfaWQiOjE1LCJqdGkiOiI5OGE2MWJhYWQxMGZlMGY2ODk3ZjZjZTY0MTM5ZTdmZSJ9.6Lgs8_MtuNPZB_e0WqtOzO8oatyffT5OuagwnAbJOj0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAwMTEzLCJleHAiOjE3ODU0OTIxMTMsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImZkNmJlZGNkYzlhMTNhYWJkOTM2NWYxYmZmZjM5ZTcwIn0.Fh9cXye7N8Gms3h4rj4C2frFVYcoWZHcn2Gb35Jvfe0', '2026-07-01 11:01:53', '2026-07-31 10:01:53', '2026-07-01 10:01:53', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(279, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAxMDk4LCJleHAiOjE3ODI5MDQ2OTgsInVzZXJfaWQiOjE1LCJqdGkiOiI3Y2I3ZTAyZmFkNDU1YTNjNDJiOGI1N2M0ZTU2ZTZlNSJ9.17obPQqe0ytpJpTjESptneHNlgWtB6E3Xc5deTrcOlk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAxMDk4LCJleHAiOjE3ODU0OTMwOTgsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjAwYzFiZjA5ODU5Yzc2YWNhMjY1YTAzNjA4YmI4ODZmIn0.B_StbTGBWZpd_XByDxgi7017nlkgps_AygY74mygNuM', '2026-07-01 11:18:18', '2026-07-31 10:18:18', '2026-07-01 10:18:18', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(280, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAxODc4LCJleHAiOjE3ODI5MDU0NzgsInVzZXJfaWQiOjE1LCJqdGkiOiIzOWNkZTZiOGFkYTFiOTZkY2VhMTFhOWMyMGIxMDQwZiJ9.sCEElhU0SUyES6JvXfWMiXjZ0nLCqKLbMWwHyHUF0bg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAxODc4LCJleHAiOjE3ODU0OTM4NzgsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI4Zjg0OTNkZmU3NzdlMGZlODc3Zjk2YTQyZDAyMjU4In0.VnQ5v8hXOuixK7jyh6_p3l7k20waZUhjfsrKsqFIJ4A', '2026-07-01 11:31:18', '2026-07-31 10:31:18', '2026-07-01 10:31:18', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(281, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAyNjI3LCJleHAiOjE3ODI5MDYyMjcsInVzZXJfaWQiOjE1LCJqdGkiOiI3NDAxNmFiOTFmMTdmNmY0MzI0MDE5ODhjOWY5YjViYyJ9.6SqDB49ZQYSfSpaa9vy4YB3LPH28jJJ4zQ0BiMsrgdo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAyNjI3LCJleHAiOjE3ODU0OTQ2MjcsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImJkNWM1NTQ5NjEwODMyMGVmODkxYjA0NWNhNjEzNmVmIn0.NGgavonrY4RI0HLKvfdbPTYgZ77mpWLjA4tnzYkrhDg', '2026-07-01 11:43:47', '2026-07-31 10:43:47', '2026-07-01 10:43:47', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(282, 118, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAyODMzLCJleHAiOjE3ODI5MDY0MzMsInVzZXJfaWQiOjExOCwianRpIjoiMzE3MDA2Y2NlMWU0M2YwYTE5ZDUyNjg2OTI5NzgwZjYifQ.M2L2CEEkDkv1ohXHUSis6uvFW3A5z3QJ5D7eJGagCqU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAyODMzLCJleHAiOjE3ODU0OTQ4MzMsInVzZXJfaWQiOjExOCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhODcyMzZhNzA1Yjg2OWM3Zjc5MzkxNDcwYzBmNGZlZSJ9.dVnqYBVq6ryq1boX_neEt0JRgZCaOyoO5B070Up841k', '2026-07-01 11:47:13', '2026-07-31 10:47:13', '2026-07-01 10:47:13', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.17.117.94'),
(283, 118, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAzMjAzLCJleHAiOjE3ODI5MDY4MDMsInVzZXJfaWQiOjExOCwianRpIjoiOGUwNWQ4NDBlOGI2ZjdlNTdjNTc2NzczOTk2YmU5M2EifQ.nsyC3zHrxsAUVQOl_Pwv8nqdW1o2HUKkeJ02GnPy-a8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAzMjAzLCJleHAiOjE3ODU0OTUyMDMsInVzZXJfaWQiOjExOCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI1NjUwNTQ1NDE2YjVhODk2NDNiYTRhNDBiMzU4M2E4YyJ9.lsfgUTFNVQBvDLaj8mKJFRJnHj9eflyzGT_YhbbR_O0', '2026-07-01 11:53:23', '2026-07-31 10:53:23', '2026-07-01 10:53:23', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.17.117.94'),
(284, 66, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAzODcxLCJleHAiOjE3ODI5MDc0NzEsInVzZXJfaWQiOjY2LCJqdGkiOiJhNGRkMmM4NDgwNmNlOTVkNTcyNTJiNjlmODlkMzA1MyJ9.QqEIfmLqCtwPGQT5tjGhAfp6Bixw-bUp0i0_CrshvYQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTAzODcxLCJleHAiOjE3ODU0OTU4NzEsInVzZXJfaWQiOjY2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImU5MjUxMWRlZDY1YmQ3Yjg1YmI5NTllZTAyMzliNDU4In0.iyQffwuycZ43I0FfbL0Md-qjsck0BPHnCwuVFlCQFmY', '2026-07-01 12:04:31', '2026-07-31 11:04:31', '2026-07-01 11:04:31', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '129.222.109.133'),
(285, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTA1NjEyLCJleHAiOjE3ODI5MDkyMTIsInVzZXJfaWQiOjE1LCJqdGkiOiIxOTdkMWJkM2ZiM2U3OTdkYzc3NzZhYmMzMmJhYmUxYyJ9.qkLzJS15yiz2Z_4fX_Ig9YAObCi344xbZOnX1NRXBSg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTA1NjEyLCJleHAiOjE3ODU0OTc2MTIsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjAwODQ3ZTFlYjg0YzNkYjhhNGI4NzEyZGE5MTNmZjAwIn0.iLOlUffcgnQRGyxcCF3-3Xdh-TIrh_hcnLAgwzD5V-0', '2026-07-01 12:33:32', '2026-07-31 11:33:32', '2026-07-01 11:33:32', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(286, 119, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTA5NjIzLCJleHAiOjE3ODI5MTMyMjMsInVzZXJfaWQiOjExOSwianRpIjoiMmYyM2JkZTU4MTU2NzE4MzhiNDRjMjhhYmQxODU1MjYifQ.iHQqD5bbvlPWSRYEISyJcGzxfLzbTlXT2QHuX4Xg3_0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTA5NjIzLCJleHAiOjE3ODU1MDE2MjMsInVzZXJfaWQiOjExOSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIzNGNjNjMyNWJmNjFmYTZiMmUxYTEyMWU2ZTI0ZWUyMSJ9.FDKSAVo-S9AW3gD1jsoaxcOYiFrJTq4Hb0i6GCvtlrM', '2026-07-01 13:40:23', '2026-07-31 12:40:23', '2026-07-01 12:40:23', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '153.67.85.99'),
(287, 106, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTIxMjE4LCJleHAiOjE3ODI5MjQ4MTgsInVzZXJfaWQiOjEwNiwianRpIjoiZTNhY2MxOWQ1YzliYTkyOTczZWRmOTZiMTI1NzUzNTMifQ.pPyfUOogUESaIj9AbMPerxY4XENgkUVFu6HqWWvpDlo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTIxMjE4LCJleHAiOjE3ODU1MTMyMTgsInVzZXJfaWQiOjEwNiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI0ZTJlYTM5MTNhZjhlNDhmODU0ODE4MDVhYTdiZDJhNyJ9.G0Pgs_hf97XIfTP0iIIOZShGbR24GQ9mdDI08NXJzg4', '2026-07-01 16:53:38', '2026-07-31 15:53:38', '2026-07-01 15:53:38', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.18.158.46'),
(288, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTI5NjAyLCJleHAiOjE3ODI5MzMyMDIsInVzZXJfaWQiOjE1LCJqdGkiOiIzNGNhNzExMGZjZDk4Nzk5MWJiNjg2Zjg5YzQ4MjE3YyJ9.9Oeu9Hma5XYsPbmZ5oF60DAM6QzQsmveLww8iNFX7Q0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTI5NjAyLCJleHAiOjE3ODU1MjE2MDIsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjZmYWVkMTEyYjRlZjEyMmI4ZDE2OGQ0MTBiMGM2MTBlIn0.aCWEZTTeOYlc4Lp8ohZ6mLIFzi5qiL2d3fwUtSuP9FE', '2026-07-01 19:13:22', '2026-07-31 18:13:22', '2026-07-01 18:13:22', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '41.74.208.67'),
(289, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTMyODQ5LCJleHAiOjE3ODI5MzY0NDksInVzZXJfaWQiOjE1LCJqdGkiOiJjY2ZhMjViZWRkNzU1NzNmYjViMjcwMzAxY2E2MGM4MSJ9.0A7dhkNL7WpJTziL5FhzkhzmJSkKYIW1jAbncauPQnI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTMyODQ5LCJleHAiOjE3ODU1MjQ4NDksInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjAyNGNmNjE3YzVlMWFkZTRkNDFhN2E5MzBmODg2MTgxIn0.S-YhKwMI_Jk15riULmB6CkcjT1t000qvVfv_5CMgvMo', '2026-07-01 20:07:29', '2026-07-31 19:07:29', '2026-07-01 19:07:29', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '41.74.208.67'),
(290, 117, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTY1NTc3LCJleHAiOjE3ODI5NjkxNzcsInVzZXJfaWQiOjExNywianRpIjoiZDAyMTgxZjZkOTUzMzI1MWQxZTZlYmRiNTM0ZjBiZDkifQ.liPZjo245tuvXbOr1jSAQ3SJbXxEpiqS5uKNbtXoiP8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTY1NTc3LCJleHAiOjE3ODU1NTc1NzcsInVzZXJfaWQiOjExNywidHlwZSI6InJlZnJlc2giLCJqdGkiOiJlODIzNGI1NGRhYzRjZTVlMzYzZDJkYzFlMmJhM2ZkZSJ9.R0GiYsAM-QUt6NPltMYp0F3Yef8Rcf4Ny1gLewwtbdY', '2026-07-02 05:12:57', '2026-08-01 04:12:57', '2026-07-02 04:12:57', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.18.38.147'),
(291, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTczNTcwLCJleHAiOjE3ODI5NzcxNzAsInVzZXJfaWQiOjE1LCJqdGkiOiIyNWEzMDVkNGIxMjU2OWNmZGM3Mjg0MjJiZWY5OWMzZiJ9.xUitmF4G4cCSLNy1vfcpkjwykcIM8TQlKDc3w9Xk9eU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTczNTcwLCJleHAiOjE3ODU1NjU1NzAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjcxNmMwOGY4OWM3NzYzMzg1MjlkYTQ1OTY0ZDYxOTMyIn0.ugZEctROltQT2jeX8kX5hELplgDVOREu4EEn_ebx5Q0', '2026-07-02 07:26:10', '2026-08-01 06:26:10', '2026-07-02 06:26:10', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(292, 125, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTc0MzIwLCJleHAiOjE3ODI5Nzc5MjAsInVzZXJfaWQiOjEyNSwianRpIjoiOTJhZmIwY2UzZGZjMjNiMGE5MDgwNzM2NWM2NDVjOWQifQ.9p308dUkKuF_3iXSPx-nZtbGuOjG4bguwZmd6nz8jFA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTc0MzIwLCJleHAiOjE3ODU1NjYzMjAsInVzZXJfaWQiOjEyNSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJmY2QwZTM0NDc4NTE2MDAxOGU5NDAyMmYzMTVjM2M3ZSJ9.gUZglwkAEpTIh37FimN5HnOFPfjqDjf64LyKtx78mng', '2026-07-02 07:38:40', '2026-08-01 06:38:40', '2026-07-02 06:38:40', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.17.117.6'),
(293, 120, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTc2OTIzLCJleHAiOjE3ODI5ODA1MjMsInVzZXJfaWQiOjEyMCwianRpIjoiMmE0MjE1Mjc0ZWUzZTRlNGM1YjQ2NTU3YjgzN2RkYjMifQ.q12p5_c5tY4ePG_mxNy69oFc4iAzkbSsoIrsR0JQlAw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTc2OTIzLCJleHAiOjE3ODU1Njg5MjMsInVzZXJfaWQiOjEyMCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJjZDViNzk2ZjQ5Y2Y2Y2IxNTk5ZWU3YjM0MTYxMDQ1YyJ9.mk2fjzbFknOwY4R8ySQtkOIiCBi-L-dZz3wxz09W-NM', '2026-07-02 08:22:03', '2026-08-01 07:22:03', '2026-07-02 07:22:03', 0, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '102.18.67.40'),
(294, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgwNDY5LCJleHAiOjE3ODI5ODQwNjksInVzZXJfaWQiOjE1LCJqdGkiOiIxZWRjZjQzMzAzYjUzODY2ZWJhMjRlYzMyZTYyYTgwZiJ9.FdxcarslHhiSLmZVPJWcW4_hRzndP4aI5hiAh3NykL8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgwNDY5LCJleHAiOjE3ODU1NzI0NjksInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjIyZWZlNmVhMmZmNGJlY2UyMWU4NjU2YmM1MWMwNGRiIn0.PBBY5fmxOCNLV2DCtLzX8cxErrgjTRKXqYZ_V7NsARU', '2026-07-02 09:21:09', '2026-08-01 08:21:09', '2026-07-02 08:21:09', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(295, 126, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgxMjIyLCJleHAiOjE3ODI5ODQ4MjIsInVzZXJfaWQiOjEyNiwianRpIjoiMzI1NzM1ZDIwMWI0MGQ0NDhlYmY0YjY0NDIwOTlhZjUifQ.8WPJci34DyA3JP7FJZSgs9fvUGoAo2nSW8SJB9NcNv4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgxMjIyLCJleHAiOjE3ODU1NzMyMjIsInVzZXJfaWQiOjEyNiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI5NjM4NWJlYTQyMTg3ZDg1NjgxZjQ1M2Q0NzU5NzgzZSJ9.wxI_KeuGghcXN8yYrgNOL88LsnE-JMNjiTKVeP6MJt0', '2026-07-02 09:33:42', '2026-08-01 08:33:42', '2026-07-02 08:33:42', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36', '41.77.17.209'),
(296, 125, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgxMjc1LCJleHAiOjE3ODI5ODQ4NzUsInVzZXJfaWQiOjEyNSwianRpIjoiNDM2N2I1NDZjZWZmOGZjN2IzNTdmYzgwMjEyN2JjY2EifQ.1TPf_92IgcYsHbLbm9no8wkSHbEzu6_3-gItOdAh1s4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgxMjc1LCJleHAiOjE3ODU1NzMyNzUsInVzZXJfaWQiOjEyNSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI4ZWFiZTdiMDI0ZjE4MTYwZTEzMjIxYTU2ZGQwNmU1YyJ9.-xHqdcutP2Lw8kNHU_tXlegS2K3XP5Kf4eB6M4JTa7c', '2026-07-02 09:34:35', '2026-08-01 08:34:35', '2026-07-02 08:34:35', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '129.222.109.80'),
(297, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgxMzUyLCJleHAiOjE3ODI5ODQ5NTIsInVzZXJfaWQiOjE1LCJqdGkiOiJkMWIzZmZlZmQyNjIxODFmZGVlOTIwY2FkZWY3MzNhMCJ9.rLMKhGn-kwk-U2CLh63D-Q1rkVrXqcGUVj0J_Iq171I', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgxMzUyLCJleHAiOjE3ODU1NzMzNTIsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjRkMDFiYWRiODFjZTRhMWEwMDkwYzFhYzk0OWU2NDRlIn0.xoECNSYLFLQkDaFVF2CyCfPMwMbAYaNHEwQOax-g6Mk', '2026-07-02 09:35:52', '2026-08-01 08:35:52', '2026-07-02 08:35:52', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(298, 121, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgyMDgwLCJleHAiOjE3ODI5ODU2ODAsInVzZXJfaWQiOjEyMSwianRpIjoiNWNkNGUxMzIyMzhhOWM1MTYzYWVmNzE4ZTlmYjJiMjMifQ.nks-IaKzmSIEPGBJ3Z82JxjvBRgFF4KtX8jMc8LjgpE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgyMDgwLCJleHAiOjE3ODU1NzQwODAsInVzZXJfaWQiOjEyMSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhM2QzMWFkZTU2ZmMxYTgwMGU2MTYxODdmODgyOWMzOSJ9.z-QeKVze-7pbV-S0by2xIvW1z3gASspWlWcfULqBM1g', '2026-07-02 09:48:00', '2026-08-01 08:48:00', '2026-07-02 08:48:00', 0, 'Mozilla/5.0 (Linux; Android 13; SM-G981B Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/149.0.7827.159 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/567.1.0.53.87;]', '102.68.233.114'),
(299, 125, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgyMTU1LCJleHAiOjE3ODI5ODU3NTUsInVzZXJfaWQiOjEyNSwianRpIjoiZDY4ZmQ1MmQ4ZjU1NTc1MDUyNDRjMTI2NzYzZDZiNmQifQ.uGL9HS3keUoSZv9OSoV8CJhF6bcpxF-1iCYmxCw7d9A', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgyMTU1LCJleHAiOjE3ODU1NzQxNTUsInVzZXJfaWQiOjEyNSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI1ZmM5OGNjYWFjNWQ2N2MwZDMwN2E2NjRiNTU1ZDZkNiJ9.LRCrnsyLnSfPs-Umdg-CFodOA_Lrj0K9LWE_Quzsyhc', '2026-07-02 09:49:15', '2026-08-01 08:49:15', '2026-07-02 08:49:15', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '129.222.109.80'),
(300, 109, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgyMTg2LCJleHAiOjE3ODI5ODU3ODYsInVzZXJfaWQiOjEwOSwianRpIjoiN2QwYWJjMjdlY2RiMjQ0MTVjZWU3YTdkNjBiYzJiNGIifQ.C2MhVRTmFi9jde5mNyIWOpuyIfFujSBG6Zdy_eQp6vg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTgyMTg2LCJleHAiOjE3ODU1NzQxODYsInVzZXJfaWQiOjEwOSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJkM2IyZGM4NzkxMGE5M2U3MWU0NTc0YTNmNWM5MDIxOSJ9.-znX0gpI3qZiqN7D50kc0yXJ0ZwoUqIJJMsNHPwOTig', '2026-07-02 09:49:46', '2026-08-01 08:49:46', '2026-07-02 08:49:46', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '154.120.142.207'),
(301, 112, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTkzMzk3LCJleHAiOjE3ODI5OTY5OTcsInVzZXJfaWQiOjExMiwianRpIjoiY2I2ODljMzIxOWNjMjMzODhjYzFhNmQwZGU1M2RjNzkifQ.Ps3xSwEbGvjzqb6wtwTN5fPkulvLLwm5gkGPVh44WbQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTkzMzk3LCJleHAiOjE3ODU1ODUzOTcsInVzZXJfaWQiOjExMiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIyMGQ0ZTQzMzMwMGU5NWMxOWVjNzA1ODc4OTYxZTgyNCJ9._SZmdVzuGEbQpkABboAV-ZZWvqAiB0HEIxjkl5Gx0ok', '2026-07-02 12:56:37', '2026-08-01 11:56:37', '2026-07-02 11:56:37', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Mobile Safari/537.36', '102.68.200.123'),
(302, 112, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTk0NDQzLCJleHAiOjE3ODI5OTgwNDMsInVzZXJfaWQiOjExMiwianRpIjoiNTZlZmE4NjVkMGUyMGRjYTEwODYzMmJmYWMxZjVkOTgifQ.ctESjFih0_71xBT9eomfZQ3mjNQhLUqFjmNkkJSDAkU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTk0NDQzLCJleHAiOjE3ODU1ODY0NDMsInVzZXJfaWQiOjExMiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJjMzNjZTgxNjQxNWQ3ZDU0ZDY1MDVhMTdmNGY5ODQ5OSJ9.zznxMDpqGotzwqqHVvq2Kn-65cJp1kK2PUBjgFCkV44', '2026-07-02 13:14:03', '2026-08-01 12:14:03', '2026-07-02 12:14:03', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Mobile Safari/537.36', '102.68.200.123'),
(303, 121, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTk3MDcyLCJleHAiOjE3ODMwMDA2NzIsInVzZXJfaWQiOjEyMSwianRpIjoiZmUxYWIxM2U2OWFhNjc5ZDlkMjdhNGM1ODhmMGU4ZWIifQ.XUaIF67eZU_ko704KhzyAEg4Ndnsm7d1e4xz773K8OE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgyOTk3MDcyLCJleHAiOjE3ODU1ODkwNzIsInVzZXJfaWQiOjEyMSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJiMGUxYmNkZjgxOTVjNTg4OTc0NDY4OGUzNGYzYmM0NCJ9.Jc5CA58PX1J96duEdGbRDBmadVl7yLKVVdetHxeIKZ8', '2026-07-02 13:57:52', '2026-08-01 12:57:52', '2026-07-02 12:57:52', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.68.233.114'),
(304, 112, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDA5NTcyLCJleHAiOjE3ODMwMTMxNzIsInVzZXJfaWQiOjExMiwianRpIjoiNGE4MzRkZDc3MGEwZGJjNDI4ZmIzNGI0YTI3MGY4YzQifQ.y5yoJX-7jarPZVYcroKl-KjfurqL-7M_1wzsH6eD9cg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDA5NTcyLCJleHAiOjE3ODU2MDE1NzIsInVzZXJfaWQiOjExMiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI0YWZkMTEzNWZiZDU5ZTAzZmNkYmIwYjJjY2NmNTI4MyJ9.BJoFOimFmD-72oUCinEWbtVzS9l09yqYtj77Ln2_NLs', '2026-07-02 17:26:12', '2026-08-01 16:26:12', '2026-07-02 16:26:12', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Mobile Safari/537.36', '102.68.200.123'),
(305, 123, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDEzMzQ3LCJleHAiOjE3ODMwMTY5NDcsInVzZXJfaWQiOjEyMywianRpIjoiOWFmNWMyMzhlOGM3NTkwOWMwMTg1Mjg0ODExZTQ4M2MifQ.D5ljRqJ2dfMRmSls8_VsF5UeU46vuugNG3H5aLIdRRI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDEzMzQ3LCJleHAiOjE3ODU2MDUzNDcsInVzZXJfaWQiOjEyMywidHlwZSI6InJlZnJlc2giLCJqdGkiOiJlNTM4YzkwMTMzNzUzNmFmOWU5MjI5NWJkNDk2ODMzZSJ9.DB21zvY0tpYE7FHuJkdWsJxmYPV_Wzp_R-McOfE8Exk', '2026-07-02 18:29:07', '2026-08-01 17:29:07', '2026-07-02 17:29:07', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.17.119.242'),
(306, 123, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDEzNDYyLCJleHAiOjE3ODMwMTcwNjIsInVzZXJfaWQiOjEyMywianRpIjoiNmQ3NTIwZDY4ZGY5NzY3ZTA5OWJiZmI1MzQ2MWUwOGUifQ.bdb61oNM6SC-uCnOQfFbXV_D_0tZOCg3AbCX-yYEgLY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDEzNDYyLCJleHAiOjE3ODU2MDU0NjIsInVzZXJfaWQiOjEyMywidHlwZSI6InJlZnJlc2giLCJqdGkiOiI4ZjJlYTZmMjI4YTA2MzkyODFkNTRkNmIxZGY4NDMyNyJ9.bQSph_FrRHxgkHwmjAnEfY1T0n0EAghtChyoIAqfpiM', '2026-07-02 18:31:02', '2026-08-01 17:31:02', '2026-07-02 17:31:02', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.17.119.242'),
(307, 124, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDE1NzQ4LCJleHAiOjE3ODMwMTkzNDgsInVzZXJfaWQiOjEyNCwianRpIjoiZDUwMTJmNjY2YmM0ZGZlNWU0OWU3NGVhM2MyNWQzMDYifQ.dKrqsoWyASVT36CrjdnFTb_Dxa2E4EKxPtaHEWrTki8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDE1NzQ4LCJleHAiOjE3ODU2MDc3NDgsInVzZXJfaWQiOjEyNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJjMDg0ZTBkYjVhYzQyZGI1MmQ2ZWU2ZGYwMjRiMGE4MyJ9.6bZ-em7v9y_UsOiqMg3qbnsvbwTAyyuHyclDFsnN87Q', '2026-07-02 19:09:08', '2026-08-01 18:09:08', '2026-07-02 18:09:08', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.18.51.219'),
(308, 124, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDE2ODE1LCJleHAiOjE3ODMwMjA0MTUsInVzZXJfaWQiOjEyNCwianRpIjoiNWQ1MGMyOTdlZDQzNDljZWRlYzBhZDFkYTdmOTM4ZGQifQ.l8Zo6UwHa_wv3LrCatIj8cXpJzw-YxM3cqn-9P6Xt0M', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDE2ODE1LCJleHAiOjE3ODU2MDg4MTUsInVzZXJfaWQiOjEyNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJmZWVmMjk2YmNhMGY4ZGQxNWI0YTQ0Mjk3MGRiMTJlMyJ9.2lnmmpQI1Ez6Took_UJX10Q8DFpM4Rsq1_Z82XOTg7A', '2026-07-02 19:26:55', '2026-08-01 18:26:55', '2026-07-02 18:26:55', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.18.51.219'),
(309, 126, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDIxMDIzLCJleHAiOjE3ODMwMjQ2MjMsInVzZXJfaWQiOjEyNiwianRpIjoiZWQ2ZmNlMWUxODgyMTRhM2YwOGYwZDY2ZTE5OWQ1MDIifQ.kDzDO8W7p0occE4OaUNScCK8azTTmvpT1WFstOZ8gqc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDIxMDIzLCJleHAiOjE3ODU2MTMwMjMsInVzZXJfaWQiOjEyNiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI1ZWMyYmU5ZTdkOWRiM2RhYjE5ZmZhYTczY2ZiODNkNiJ9.MV4WwP8JFEcsWCvqfJDJv96BBXtdyLT2KkAuNHzyio0', '2026-07-02 20:37:03', '2026-08-01 19:37:03', '2026-07-02 19:37:03', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36', '41.77.17.255'),
(310, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDUxOTg3LCJleHAiOjE3ODMwNTU1ODcsInVzZXJfaWQiOjI0LCJqdGkiOiI2ODU2ZTU4NGE5N2Y5MmE1ZmNjMjA5NmY0MTZiYzA1MiJ9.ii18roYI-F2Awj1_zW5Wz5Ph0Rjg4p1-kSQQzRj8Zbw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMDUxOTg3LCJleHAiOjE3ODU2NDM5ODcsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQ1N2RkNzk0YWRiMjU3NzFlMjBmZTU4NjZlMjMzMGE0In0.PzA7RaV5zo1aJc1Ljzu1ThANFDzJ1M0wdDE7UDkyu1o', '2026-07-03 05:13:07', '2026-08-02 04:13:07', '2026-07-03 04:13:07', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '41.77.17.214'),
(311, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMTQ2ODc2LCJleHAiOjE3ODMxNTA0NzYsInVzZXJfaWQiOjE1LCJqdGkiOiIxMDQ4NzAwZjI1YzBlODgxNmJmZWRiYzc1YjgyMWU1YyJ9.gYgsuzHvt-Lh03wKsqmVxtPpvHRSZ8zeUPh7qkLtcC8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMTQ2ODc2LCJleHAiOjE3ODU3Mzg4NzYsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjdmYjdhNDM3YTAyMjFiYTA4Yjg5NzU3NGQyOWE5ZmY4In0.PDNZ2Ncpdd5d1aiRgpBZOrKkWvWRMvCJQay0widkBTs', '2026-07-04 07:34:36', '2026-08-03 06:34:36', '2026-07-04 06:34:36', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '102.68.233.205'),
(312, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMTUwMzk2LCJleHAiOjE3ODMxNTM5OTYsInVzZXJfaWQiOjE1LCJqdGkiOiI1ZGFjNWZjZGUwZWVjZDM3NmI3NDFmZmYxMDUwMzJhMiJ9.QpY7XoAgCzcEdOWdAM976NXyMYtZoyOPGXZd8WqxmCY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMTUwMzk2LCJleHAiOjE3ODU3NDIzOTYsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImY3MTVlZWZmN2EzMjg3NDc4OGZiYTIwNWI2ODE2MjVkIn0.EWbiulADsITsrSH80clqSdgbyVAt_Gnf-CgxcW9F0SM', '2026-07-04 08:33:16', '2026-08-03 07:33:16', '2026-07-04 07:33:16', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '154.120.181.76'),
(313, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMTUwNDEzLCJleHAiOjE3ODMxNTQwMTMsInVzZXJfaWQiOjE1LCJqdGkiOiI3M2RiODY5YzBhNjc3YjBkYmI4YmNkYmQzZGMzYzhlYiJ9.8tBEcfJSFIdDnOo9x0rMr2s0KkNrNSO6RrjtCFbQGhQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMTUwNDEzLCJleHAiOjE3ODU3NDI0MTMsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjBmY2Q2NTMzYjc4OTc3MDIxODc4ZTcwZjkwNjAwMjliIn0.GvkyAJPc-78A2Tae-ay9n6a30IIEgm1GnUHevC6M2FQ', '2026-07-04 08:33:33', '2026-08-03 07:33:33', '2026-07-04 07:33:33', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '154.120.181.76'),
(314, 128, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMTgwMjE1LCJleHAiOjE3ODMxODM4MTUsInVzZXJfaWQiOjEyOCwianRpIjoiNmQ1YjdjZDgyNjRiZWQ3MTZlYjEwZDFhZGNhYWM1MjAifQ.b0OClypF407Bufdwc7Mx2kuLX4Pf5gy4xB5uQgdq2Vk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMTgwMjE1LCJleHAiOjE3ODU3NzIyMTUsInVzZXJfaWQiOjEyOCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI1YTUwODg3MmUyMGYzMDM3ZTI0MDdmMGViMmJlY2ExMCJ9.XfNJBimCE7Dw03QgKi_XQ6zNDBStiHVmQbwkjsG50aE', '2026-07-04 16:50:15', '2026-08-03 15:50:15', '2026-07-04 15:50:15', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Mobile Safari/537.36', '102.17.120.6'),
(315, 118, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMjMwMjM4LCJleHAiOjE3ODMyMzM4MzgsInVzZXJfaWQiOjExOCwianRpIjoiMDQzZWFkZDQ0ZWJkYmUwMWQzZjE3ODk5ZjVkMDc2NjcifQ.k3JduKc3fxuYIEM6HDzU4cuAjCuR6SeDkg9-CmhFsUA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMjMwMjM4LCJleHAiOjE3ODU4MjIyMzgsInVzZXJfaWQiOjExOCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhNTdlNGM0NzJmNDk0NmM3YmJmMzE5MGU3ZTMwYjlkNiJ9.dHxm_6iwjbHoa_lHfVchx00j3Fd8F2aVBNb9G1C3P6A', '2026-07-05 06:43:58', '2026-08-04 05:43:58', '2026-07-05 05:43:58', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.18.158.31'),
(316, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMjY3MDI0LCJleHAiOjE3ODMyNzA2MjQsInVzZXJfaWQiOjE1LCJqdGkiOiJhZTIwNGJjNzEwODA5Njc1MTRmZmZmMTQ2MzkyMTE5MiJ9.Dov14nS7PBYMhAqsbOqZq__H1JMJxrl6aKKvdeWMWkY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMjY3MDI0LCJleHAiOjE3ODU4NTkwMjQsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImRjNDlkY2Y3NTllOGIzZDdiZjc2NDkzODgyOWIzYzQ1In0.xcPd3gG2Em1axaAEVBEfQ3K8L42ktFE84SO7Onz2sV4', '2026-07-05 16:57:04', '2026-08-04 15:57:04', '2026-07-05 15:57:04', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '41.74.208.236'),
(317, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMjY3MTQwLCJleHAiOjE3ODMyNzA3NDAsInVzZXJfaWQiOjE1LCJqdGkiOiI3NmVkNjFmNWRlOWQ3ODQ0YzhhODEyMjc2NTZkMjBmNCJ9.iKnG8chotxQD9qjvgR-s8Xj6F961WH-ZQP8gAH9_8Pg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMjY3MTQwLCJleHAiOjE3ODU4NTkxNDAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImY1M2ExZmI1MzQ0ZGFkMTg2MTdkMjA1OGFmNjU4MDU2In0.8DJKXHjdXkKDBGmDrThIIXhjnfmPMw3Qy2tjhHdi0Wk', '2026-07-05 16:59:00', '2026-08-04 15:59:00', '2026-07-05 15:59:00', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '41.74.208.236'),
(318, 120, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMzM3NTkxLCJleHAiOjE3ODMzNDExOTEsInVzZXJfaWQiOjEyMCwianRpIjoiYWRlN2ZmMTg3Nzc1NDc4ZmIzNjg0NjY2MjFkZGE5OGMifQ.sQ-TIFq6WJFdrgEvO8vIc681Y5oLPULTXFKu0KXshR4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMzM3NTkxLCJleHAiOjE3ODU5Mjk1OTEsInVzZXJfaWQiOjEyMCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI4Mzg1ZDg4YmQ4NTgyMTU0MzU5YjJlMzQ2MDMzY2I1ZiJ9.PZ_N9VVOFo0qLBiaUTGOWk8aa9wLy4vAOlr2mL0b6es', '2026-07-06 12:33:11', '2026-08-05 11:33:11', '2026-07-06 11:33:11', 0, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '129.222.109.189'),
(319, 133, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMzM5OTAwLCJleHAiOjE3ODMzNDM1MDAsInVzZXJfaWQiOjEzMywianRpIjoiZTFmNzE0YzExZmI2OWEyNzFkODhlNzYxMTBmNjdkODkifQ.Gjihtv3DvTBCtEb12NzIIvcaNQ2tML_jF3XDweoUmMg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMzM5OTAwLCJleHAiOjE3ODU5MzE5MDAsInVzZXJfaWQiOjEzMywidHlwZSI6InJlZnJlc2giLCJqdGkiOiI4NGIzYzQyOTBmZTEzYzI4ZTk1Njk0M2MwOGYyNjU5ZSJ9.UtI_cZoEhZhxVifsauHt1QAKg9Zx2ZdjxsSasNpiGVI', '2026-07-06 13:11:40', '2026-08-05 12:11:40', '2026-07-06 12:11:40', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '41.190.239.123'),
(320, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMzQxMDM3LCJleHAiOjE3ODMzNDQ2MzcsInVzZXJfaWQiOjE1LCJqdGkiOiI3NDQxYzA0YTQyNzk1NTlmYWQxOTQxMWViMGIzY2Y0NSJ9.rnLix9b9oGA_UtDynibs9cqtezf1nuW2bE-Xvdwyl5s', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMzQxMDM3LCJleHAiOjE3ODU5MzMwMzcsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI0ZjZmMjM3MTQ1NGQ4N2IwNDViZjgxYWI1ZjU4OTc5In0.xqjVlV0CtAX-Px8tB1ZfmxMWfLhPDmFf4IyBFSYXS0g', '2026-07-06 13:30:37', '2026-08-05 12:30:37', '2026-07-06 12:30:37', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(321, 122, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMzQzNzMyLCJleHAiOjE3ODMzNDczMzIsInVzZXJfaWQiOjEyMiwianRpIjoiYWEyZWIwNjU0ZTQ0NzZjNzNiNjY4NzFmN2U4NTljZjAifQ.d7VN83X3CPD5uKYTGOyYU1w3XPU-CiRfHE6kOdNdVy0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMzQzNzMyLCJleHAiOjE3ODU5MzU3MzIsInVzZXJfaWQiOjEyMiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhNjgwM2M2NTMxMGY3MzNiMTMyMzFhNDYxMTRhODVmMiJ9.KPmcZv89j2XUd4FDc92AM3IWRKdGCBDZobcwiGQcAf0', '2026-07-06 14:15:32', '2026-08-05 13:15:32', '2026-07-06 13:15:32', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36', '41.204.115.108');
INSERT INTO `aem_auth_tokens` (`aem_id_token`, `aem_id_user`, `token`, `refresh_token`, `expires_at`, `refresh_expires_at`, `created_at`, `is_revoked`, `user_agent`, `ip_address`) VALUES
(322, 122, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMzQzNzMzLCJleHAiOjE3ODMzNDczMzMsInVzZXJfaWQiOjEyMiwianRpIjoiODhmYjY0ZGYwN2E4MTlhMzVmNjYwNWYzZjBiZTMwMmIifQ.t9JGzbLrTyDsKtAGTiOKEn711-WRiQkK2R05a8AVEMk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzMzQzNzMzLCJleHAiOjE3ODU5MzU3MzMsInVzZXJfaWQiOjEyMiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhNjBkYWUwNTg1Nzc2YjAwYzA4NGNlMWZkYzQ4OTlhNCJ9.629kUu35BwVaFVouovDHlFUs5_kTySNNOjtqG36-mcw', '2026-07-06 14:15:33', '2026-08-05 13:15:33', '2026-07-06 13:15:33', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Mobile Safari/537.36', '41.204.115.108'),
(323, 56, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNDEzMjI2LCJleHAiOjE3ODM0MTY4MjYsInVzZXJfaWQiOjU2LCJqdGkiOiI1ZDhiMjMyMWY5ZGM5MDkxZmFjYTY5MWRkZDgwNWFlNiJ9.Q1jnddX1pwJcO2S5inU2JKyRaxzHpvNj5vR5DrZUAo0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNDEzMjI2LCJleHAiOjE3ODYwMDUyMjYsInVzZXJfaWQiOjU2LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjQxMWM3YzQzM2I5NjZlN2FmNzJiOTkxMzQ3N2Q5MDRhIn0.k9A0PZGI2TToA2E_66E96tRyGbJCNILrfXCOhOwsVRM', '2026-07-07 09:33:46', '2026-08-06 08:33:46', '2026-07-07 08:33:46', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '129.222.109.242'),
(324, 134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNDQ5MDI2LCJleHAiOjE3ODM0NTI2MjYsInVzZXJfaWQiOjEzNCwianRpIjoiYzQ5ODQ3ZjExZjc3ZGExNjg3ZGYxNDFmYjQ4Y2VkMGEifQ.iFHBILpA09lN41RpTyLpEhw8fy9RNM8eE7ZrHp8GulM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNDQ5MDI2LCJleHAiOjE3ODYwNDEwMjYsInVzZXJfaWQiOjEzNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI2YjJkYTM3NGEwYTNmMDMzMGNjNTRlM2NjYzIxOGIxMyJ9.pBC-7QWKxI4-yCgH2HqbP_4h0bAehomt7bYZHVRiWGg', '2026-07-07 19:30:26', '2026-08-06 18:30:26', '2026-07-07 18:30:26', 0, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/147.0.7727.47 Mobile/15E148 Safari/604.1', '37.66.25.250'),
(325, 134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTI3NzI4LCJleHAiOjE3ODM1MzEzMjgsInVzZXJfaWQiOjEzNCwianRpIjoiN2YwMTFjMmM1MDA4MzI2ZjQ4NDEzNTkxZGUxZGM1ZjYifQ.EbTUlUuxZu6YQMrAtJiec6_XFEph0znFnIBX4P2tvD8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTI3NzI4LCJleHAiOjE3ODYxMTk3MjgsInVzZXJfaWQiOjEzNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhYjZlNzBiMjJhYzcxZWY3ODMwZDU2YmY3YWY2NGI2NSJ9.Jg4nu75_PFA1PFYrAMPDoRBph6ELJCijC7JMpoCrxOQ', '2026-07-08 17:22:08', '2026-08-07 16:22:08', '2026-07-08 16:22:08', 0, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/147.0.7727.47 Mobile/15E148 Safari/604.1', '37.66.25.250'),
(326, 134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTI3ODY4LCJleHAiOjE3ODM1MzE0NjgsInVzZXJfaWQiOjEzNCwianRpIjoiZWY2ODJkODdjMmVmMjgyYTU4OWM5NjZkNTc5MThhMWQifQ.pSlYaPy3mlXFP13N6l3TogbszoEviZuk0etQp-glFbs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTI3ODY4LCJleHAiOjE3ODYxMTk4NjgsInVzZXJfaWQiOjEzNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIyNGYzZTRiY2VlNTAxMzY5Y2Q4NTI0M2YxZjFhMjkxNSJ9.-kvrCvbjO1SLpMTbvEOXMXmeZSvY7YXoesmg6uA7ZgQ', '2026-07-08 17:24:28', '2026-08-07 16:24:28', '2026-07-08 16:24:28', 0, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/147.0.7727.47 Mobile/15E148 Safari/604.1', '37.66.25.250'),
(327, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTg2NDYzLCJleHAiOjE3ODM1OTAwNjMsInVzZXJfaWQiOjE1LCJqdGkiOiI5MDE5OGE5NjMxYWI5MDQzNjFlZWJmNTg3ZGI0OTY2YiJ9.Et8VmoIcQ-mwtJvh8T1W8rUK36SPSNl4BxGIjeKs_hs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTg2NDYzLCJleHAiOjE3ODYxNzg0NjMsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjdkYmFkYWM0NGY0NmM4NzkwMWE1NjJjZDc1MzFkNmZjIn0.OTFzFHetqu3RaQeu8Kdbgays0ZjOLjPptAg826QtVqo', '2026-07-09 09:41:03', '2026-08-08 08:41:03', '2026-07-09 08:41:03', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '197.149.11.126'),
(328, 111, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTg2NTE3LCJleHAiOjE3ODM1OTAxMTcsInVzZXJfaWQiOjExMSwianRpIjoiZmVhY2YxNmQ4OWRkNjZmZmJhOGFlZjBkZmU2ZjgxNDEifQ.vOZHA_lB6-J8RAbSychq_y47MQrH4LHT8j_58ZBIDk0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTg2NTE3LCJleHAiOjE3ODYxNzg1MTcsInVzZXJfaWQiOjExMSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJjYmFhZDM2ZDVmMTdhMTdhOThmOTAzMGU4MmY3NmU4MSJ9.gFTjp9-54q35Ypc_3uSjVACd7Yk4pjAPLRpoYUzUC1k', '2026-07-09 09:41:57', '2026-08-08 08:41:57', '2026-07-09 08:41:57', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '154.120.142.65'),
(329, 135, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTk1NDY4LCJleHAiOjE3ODM1OTkwNjgsInVzZXJfaWQiOjEzNSwianRpIjoiNWIyZGFmNmRlNmY2YTc2ZDY3ZDljNjMwMjZjMzk0NDEifQ.dWHGYsH9X7Yy1dA3yExM1nG2Dph9pM47NyAoUhPRyis', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTk1NDY4LCJleHAiOjE3ODYxODc0NjgsInVzZXJfaWQiOjEzNSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIyYWZlMmQ2Mzc0NTg4MDcyN2E4Y2M2ZTZhN2QxY2Q1MSJ9.CbA1FbkpG0J6DxAgHtQWbBv5KyETzAYHkcO-vqnWuoc', '2026-07-09 12:11:08', '2026-08-08 11:11:08', '2026-07-09 11:11:08', 0, 'Mozilla/5.0 (Linux; Android 8.1.0; DRA-L01) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', '102.18.157.195'),
(330, 135, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTk1NjQyLCJleHAiOjE3ODM1OTkyNDIsInVzZXJfaWQiOjEzNSwianRpIjoiZGNiZTllZmRlMzM2ZGQ1ZDFlMmY4MzczZDUzZjZhYTAifQ.vXpYmwefasCizLQw1P9h1uEmj5TjPYAMiELu7fZDJGE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTk1NjQyLCJleHAiOjE3ODYxODc2NDIsInVzZXJfaWQiOjEzNSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI1NWU4NGZmM2U5OGMyNmZjMDQ3YmRhMzU4ODMzNjU0ZiJ9.BC6ipGS5-WRZ0LtdV8GIl0Qh8RH9nK6jZvV2oXx-HTQ', '2026-07-09 12:14:02', '2026-08-08 11:14:02', '2026-07-09 11:14:02', 0, 'Mozilla/5.0 (Linux; Android 8.1.0; DRA-L01) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36', '102.18.157.195'),
(331, 136, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTk4MTczLCJleHAiOjE3ODM2MDE3NzMsInVzZXJfaWQiOjEzNiwianRpIjoiYzk1ZjFlNjJjYmFhMmFkMTE5NGNiNWJmNjc2ODYzMTkifQ._EnuDBzvB6T_Lu0lb61d97ErnDqdjyg1v_RMM_3Z7Oo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNTk4MTczLCJleHAiOjE3ODYxOTAxNzMsInVzZXJfaWQiOjEzNiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIzM2JiMzFlY2ZhZDQwZjczZWJkOTI1YzRkYTZkMGEwNiJ9.3oN0hROSsPraTa88ScAKfAlJPugIQdHpDYe7a2A96a0', '2026-07-09 12:56:13', '2026-08-08 11:56:13', '2026-07-09 11:56:13', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.18.157.177'),
(332, 73, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNjEzNTk4LCJleHAiOjE3ODM2MTcxOTgsInVzZXJfaWQiOjczLCJqdGkiOiJjNTkwMmNiY2JkZDFkY2RjNzFjYzk1ZWM2NjY5ZTE5OCJ9.dQ1NUP5oc2jjfZ3KXhZTT-8TGUGbVYsMOwW1zOKqRPw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNjEzNTk4LCJleHAiOjE3ODYyMDU1OTgsInVzZXJfaWQiOjczLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImJkMTQ2NjZmZDZiZmIyNzkxYTFlY2Y4MzMzMTUzMWI3In0.7AC7_oELc24a-fTVpOSDgwVQJ-5RLLpxrDCQah_KmvA', '2026-07-09 17:13:18', '2026-08-08 16:13:18', '2026-07-09 16:13:18', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '102.18.159.146'),
(333, 134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNjI1ODMyLCJleHAiOjE3ODM2Mjk0MzIsInVzZXJfaWQiOjEzNCwianRpIjoiODUwOTY0Yjc2NzgyYzAyZDA0YjUyYjJjMDNmN2NkNWYifQ.VcFt0ntpYy7uEgHVTPjHs3PYrJnCKVhg53qaKxYOc2I', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNjI1ODMyLCJleHAiOjE3ODYyMTc4MzIsInVzZXJfaWQiOjEzNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJmMTFiY2IxYjM0NmVkZmZhZGYzNThiZDBmZWVjOTNiNyJ9.1bHQHtjFaNT1TorJe-F_TX8T2T1WqfGu7l4VoLk3HSw', '2026-07-09 20:37:12', '2026-08-08 19:37:12', '2026-07-09 19:37:12', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '37.66.25.250'),
(334, 137, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNjcyOTA3LCJleHAiOjE3ODM2NzY1MDcsInVzZXJfaWQiOjEzNywianRpIjoiZTAzYmE3Y2QxYzVlYWVmMDhmMzExMzNmYjYwYmIyMmQifQ.zj0-sdB38DUqaD9URqgYfbkEZ1tpCOO1zvfWFRbpjOs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNjcyOTA3LCJleHAiOjE3ODYyNjQ5MDcsInVzZXJfaWQiOjEzNywidHlwZSI6InJlZnJlc2giLCJqdGkiOiJlYTQyZWU4MzU2YzEyODEyMzE2ZmZmY2MzMGNhY2FiOCJ9.ms6FlVCV5NilPEOo2EGmztz70GJA3e0YdmqX8Me3XF8', '2026-07-10 09:41:47', '2026-08-09 08:41:47', '2026-07-10 08:41:47', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '41.77.17.242'),
(335, 121, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNzUyMTEzLCJleHAiOjE3ODM3NTU3MTMsInVzZXJfaWQiOjEyMSwianRpIjoiZTM3MWFmYjI3Mjc2NmY1MzhmMjczMWRkYTczYWE1YjEifQ.tZnRRY1nfGF3-Pv5oho5V9CwTiztyjGkCGhH_Bth_Po', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNzUyMTEzLCJleHAiOjE3ODYzNDQxMTMsInVzZXJfaWQiOjEyMSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIzMDYxMzZmMjg1MDYxNTc0ODMzODI5M2UyNjNhNzhlYiJ9.42KW6EpJAWzB79LVetdegBsvXMNPoxlTpbP6oKJ2hKU', '2026-07-11 07:41:53', '2026-08-10 06:41:53', '2026-07-11 06:41:53', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '41.74.212.182'),
(336, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNzUyNTc2LCJleHAiOjE3ODM3NTYxNzYsInVzZXJfaWQiOjE1LCJqdGkiOiIyNzc0YzdhOWNkMzg0ZDhkMjg0ZmIwNGVkYmNhZDIwYyJ9.4Jv8f-QwwQICGu-brwGTFf9H_5rWcZQg4SSVI5YOJdQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNzUyNTc2LCJleHAiOjE3ODYzNDQ1NzYsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI0ZDAzOGI3YzNhMWIzZWIxMzIxYmI5NmQ2YTgxNzAyIn0.tKQq249a1-adkQV74JKhQ0ak9LfZanG9LcfPUB34vns', '2026-07-11 07:49:36', '2026-08-10 06:49:36', '2026-07-11 06:49:36', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '41.74.210.10'),
(337, 122, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNzU1NTY3LCJleHAiOjE3ODM3NTkxNjcsInVzZXJfaWQiOjEyMiwianRpIjoiNzk1NjNkZGYzZTUyNDQwMzE2MzU0MGQ0OWEwMWEzYWEifQ.zyMrrHwwtizhaywmobpiqpA7JwabPE3WEme6HNQ0clw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNzU1NTY3LCJleHAiOjE3ODYzNDc1NjcsInVzZXJfaWQiOjEyMiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIyMzEyNDg1YTIzYzE5YTdjOTJhZDAzMTNjOTA3NmFlMiJ9.EYbYt7lbmoCR8as6Gu_CrDF978ttohhtGLSjv0gwVtk', '2026-07-11 08:39:27', '2026-08-10 07:39:27', '2026-07-11 07:39:27', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '197.158.119.107'),
(338, 122, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNzU1NTY4LCJleHAiOjE3ODM3NTkxNjgsInVzZXJfaWQiOjEyMiwianRpIjoiZTY3YTUxMDU5N2U5NTBhYWNiMTMzM2UyMjhjZWFmNDAifQ.WdR9_fYUlFBpwsKu9giYEIOy6tNFw75-6WFr5hAgteU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzgzNzU1NTY4LCJleHAiOjE3ODYzNDc1NjgsInVzZXJfaWQiOjEyMiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIxODFjNmExMDZlMGFlZDljZWJhN2MyZjE4MjUxZTljYSJ9.3tJb9ki13GoNHgi3OY9Y1dM8S-pZludIPpmdHAio8vY', '2026-07-11 08:39:28', '2026-08-10 07:39:28', '2026-07-11 07:39:28', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '197.158.119.107'),
(339, 131, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MTA1NDc2LCJleHAiOjE3ODQxMDkwNzYsInVzZXJfaWQiOjEzMSwianRpIjoiOGYwYTFlNjA5YmMxM2RlNDBlZWQyNGEzYWVkNWQzYWIifQ.9_gJzQbAEn_7Y8_EgPbIRVgSIljHweUjPxeRmuOdBIY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MTA1NDc2LCJleHAiOjE3ODY2OTc0NzYsInVzZXJfaWQiOjEzMSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI1NmZmODMzNWZkMWRmOTRlNzJiMjI3MDYzODUwYmFiNSJ9.338HZQQLvFnqR_Sb-gf89f8qf4gxa3e-_QQc6e_TMak', '2026-07-15 09:51:16', '2026-08-14 08:51:16', '2026-07-15 08:51:16', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Mobile Safari/537.36', '102.18.159.98'),
(340, 138, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MjE4MDQ0LCJleHAiOjE3ODQyMjE2NDQsInVzZXJfaWQiOjEzOCwianRpIjoiZWYwZjE1YjJlNTZlZTEyZjMwNTY2ODg3OWQ3NWM5NDkifQ.SOIeKltHM3-UCE7U2o583MFQzTJ83VvVaaoCWg5fHyQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MjE4MDQ0LCJleHAiOjE3ODY4MTAwNDQsInVzZXJfaWQiOjEzOCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI2YTAwYTIyYzlmNTFiZjgyYWI5YWUxMzFiYzI1OTdiYyJ9.6UGzh0Sl7H7IKemlGGxNqkWb_T-qHIGpPMPEeQd09Vc', '2026-07-16 17:07:24', '2026-08-15 16:07:24', '2026-07-16 16:07:24', 0, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '129.222.109.98'),
(341, 138, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MjE4Mzk1LCJleHAiOjE3ODQyMjE5OTUsInVzZXJfaWQiOjEzOCwianRpIjoiMDM3MDM1YmFlNWUwMWNiMGRkODQ4ZGRiZDg1MzhmZmIifQ.CiSP7yXHgyo_mABIz9v0a0MSlOIFQAqQcMCWc0ZoBr4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MjE4Mzk1LCJleHAiOjE3ODY4MTAzOTUsInVzZXJfaWQiOjEzOCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhMGM3ZWE4OTFiNjgyNDY2NDFjOWQ1Nzc4MzdkMTExNiJ9.JfuKDWyup22-ViMmnZZUU0bgxcvTKFuscgc19gRIN7A', '2026-07-16 17:13:15', '2026-08-15 16:13:15', '2026-07-16 16:13:15', 0, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '129.222.109.98'),
(342, 140, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0Mjk5MTE1LCJleHAiOjE3ODQzMDI3MTUsInVzZXJfaWQiOjE0MCwianRpIjoiMmU1MGE5ZjdhNzRmYjY5NjdjNTQ5YjcyNmFlNWUxNTcifQ.yKfxI9-CBPpQpqdBjsf9Doisq_99T1CkZUmJksDRX1A', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0Mjk5MTE1LCJleHAiOjE3ODY4OTExMTUsInVzZXJfaWQiOjE0MCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJkYzczMGQyYjI5YTNkZTg4ZDdiYWI2YmU4YzU0NTYzYiJ9.IcsXtZyrwb8y7_IEUzqC5nFZKrQBE-DlV_EZC6qzEMs', '2026-07-17 15:38:35', '2026-08-16 14:38:35', '2026-07-17 14:38:35', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Mobile Safari/537.36', '102.17.118.7'),
(343, 134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MzIwMTkxLCJleHAiOjE3ODQzMjM3OTEsInVzZXJfaWQiOjEzNCwianRpIjoiZTRkZjQ0MTc5ZTAzZDQ3YjRhNzZmM2M0NGY4NDMzOWMifQ.gCJ1WzHf69peU4rIhjPE57m0Zh0wT9uqUOEkcZRMAxI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MzIwMTkxLCJleHAiOjE3ODY5MTIxOTEsInVzZXJfaWQiOjEzNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIwZWVmMGRiMDBhMWQzN2QzZTc2NjZlNjY1YmZmODJmZCJ9.35QKwCdLOAv1KwFGXyg7-xtHcKNSH5Ght-m6_vcw40Q', '2026-07-17 21:29:51', '2026-08-16 20:29:51', '2026-07-17 20:29:51', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '37.66.25.250'),
(344, 109, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MzUxNzkxLCJleHAiOjE3ODQzNTUzOTEsInVzZXJfaWQiOjEwOSwianRpIjoiYTllZTgwOWRkNGI2YmM2ZjM0NWEzZWRlMmYwYzY5ODkifQ.jtxRqNpmWxNBPQcghsoV5AMT3b1GCIgdRjk2t3OnG5k', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MzUxNzkxLCJleHAiOjE3ODY5NDM3OTEsInVzZXJfaWQiOjEwOSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJlYTE4MDk1NzgzNTliMGY0Y2JiYTBjNWY4OTg2ZjNlZCJ9.Wr0dQOqLVDZgv-o7pYigG72kMLod9aqVPfBs0MUv6lc', '2026-07-18 06:16:31', '2026-08-17 05:16:31', '2026-07-18 05:16:31', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '154.120.142.181'),
(345, 39, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MzYzMTQ5LCJleHAiOjE3ODQzNjY3NDksInVzZXJfaWQiOjM5LCJqdGkiOiI2ZDBlZWFmODFjNTA5MTJjMmViNzMzMjUxMGMxMDc0MyJ9.kbfa8QNkYi0fhouGD8zYbwPVQTrwgwlNNOav7sdLXvo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MzYzMTQ5LCJleHAiOjE3ODY5NTUxNDksInVzZXJfaWQiOjM5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImExOTMwYTZkNGQ2MTI2NGE1ZDJmMTdiNTM2NGEwZDQzIn0.u5jCsy54nHTuqsPwStJRS0hPTbRDEUqwMBwJswTn8xo', '2026-07-18 09:25:49', '2026-08-17 08:25:49', '2026-07-18 08:25:49', 0, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:149.0) Gecko/20100101 Firefox/149.0', '153.67.85.73'),
(346, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MzkyMDY2LCJleHAiOjE3ODQzOTU2NjYsInVzZXJfaWQiOjI0LCJqdGkiOiI2M2NmYTFhYjQ3MDc5ZTBmYmQ1OWU3MTQ4MjcwNzJlZCJ9.0tFASGP2drIg3sfZPcIU8vBnpm9YQD356PiytOXt04s', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0MzkyMDY2LCJleHAiOjE3ODY5ODQwNjYsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjhkOGIzODc5OTdkMWY2ODM5OTMwYzQ3ZGFhNzA0MTEyIn0.-VH8haJcXaLKmHg8YhtiYJe2QHEs9iSBVHTDg25b3e8', '2026-07-18 17:27:46', '2026-08-17 16:27:46', '2026-07-18 16:27:46', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '41.74.211.38'),
(347, 95, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0NDYyODU3LCJleHAiOjE3ODQ0NjY0NTcsInVzZXJfaWQiOjk1LCJqdGkiOiJhOGU3N2I5ODUyMjFlYjZhZmI4NGQwZmMyMWM2ODg5NSJ9.1VfMKLxbxX_Lkxt9taTNVni7GwdKtpVaNYNBIx-pNw0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0NDYyODU3LCJleHAiOjE3ODcwNTQ4NTcsInVzZXJfaWQiOjk1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjBkYThkOTRmYzBlMTlkZDUzNDJlNzc3NTg3NDc4NmMxIn0.277x9wADAeGcss9hRmJecOIhZ_7Ni08Wbs9EfYhjwro', '2026-07-19 13:07:37', '2026-08-18 12:07:37', '2026-07-19 12:07:37', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '102.18.159.30'),
(348, 95, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0NDYzNTgzLCJleHAiOjE3ODQ0NjcxODMsInVzZXJfaWQiOjk1LCJqdGkiOiI3NTU3YjIwMjY0NzJlNGYwNWNjNTEwYzZlZWQ5YTEzOSJ9.brHEKnrolDG7Qnz7SLIa4Aq5Br44z-0LfFE0cex76aw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0NDYzNTgzLCJleHAiOjE3ODcwNTU1ODMsInVzZXJfaWQiOjk1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjM4MzM3MWJiMDFmMDA4ZGEwZjQxZmExNzc5OTE2NjczIn0.PG7W6wqV8Bnuo2KRQZA_fcrwNKoEYEzZ_Bne6F9VGbM', '2026-07-19 13:19:43', '2026-08-18 12:19:43', '2026-07-19 12:19:43', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '102.18.159.30'),
(349, 134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0ODM5NzM0LCJleHAiOjE3ODQ4NDMzMzQsInVzZXJfaWQiOjEzNCwianRpIjoiY2NlYThlYzM4Y2M3MDM1YmQ5ZWJlNTQ5ZTczZWNiY2UifQ.VfXb_UVb4MedQQmni8koHhv4kbFoirS_XpWCAC-ftJc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg0ODM5NzM0LCJleHAiOjE3ODc0MzE3MzQsInVzZXJfaWQiOjEzNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI4Y2FhNjUzNGI5YTU4NmMwZTZmYWU1ZmNlYzczYTY2MyJ9.0mcRc0gXrVfapaCBEL7KBwjY94UHBKdXGXwnCIl7Xys', '2026-07-23 21:48:54', '2026-08-22 20:48:54', '2026-07-23 20:48:54', 0, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7_8 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/150.0.7871.113 Mobile/15E148 Safari/604.1', '79.95.127.77'),
(350, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1MTUzNDQ1LCJleHAiOjE3ODUxNTcwNDUsInVzZXJfaWQiOjE1LCJqdGkiOiI3ZTk3NzFkZmI0MjgwZWUxMzYxNzQyN2MwYjgzYTkyYyJ9.7G19To6wVL_P4o2_HLo7jj24NY9S5o0Np_lFrR2GSV8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1MTUzNDQ1LCJleHAiOjE3ODc3NDU0NDUsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImI5Nzg0ZjhlOTRiMmQ2OTIyNDQwZjBlYTAyODRhMTJlIn0.toiLTADqw0PpcDVnsohzJJklXCfSVW7eyxYo0cbH4ns', '2026-07-27 12:57:25', '2026-08-26 11:57:25', '2026-07-27 11:57:25', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:153.0) Gecko/20100101 Firefox/153.0', '197.149.11.126'),
(351, 113, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1MjIyMzk2LCJleHAiOjE3ODUyMjU5OTYsInVzZXJfaWQiOjExMywianRpIjoiYjZhZjliZDg0MTM3YjcyYTgyNjk0MTYyZjRiZDdhMzIifQ.Yh58MemzfbhQTj45gOUNB-T6ChIQURta9vRNMDUHZfw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1MjIyMzk2LCJleHAiOjE3ODc4MTQzOTYsInVzZXJfaWQiOjExMywidHlwZSI6InJlZnJlc2giLCJqdGkiOiI0NDFmNjhiNWY0OThmZjNkMDFiYjI5MjYwODk4MDMyNSJ9.frf4UeGdTp6_51wFafyXA5lES20I_9BbWO6sCeU0tTw', '2026-07-28 08:06:36', '2026-08-27 07:06:36', '2026-07-28 07:06:36', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '102.16.66.58'),
(352, 142, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1MjM2OTI2LCJleHAiOjE3ODUyNDA1MjYsInVzZXJfaWQiOjE0MiwianRpIjoiNDNkMjFlZDFjYThhYTMzMjI5M2E0MGJkZTczYzU2NjEifQ.H47TJHRW1TbPQWrU-9-LYbRWYELAlvlZAopQzbM9Z5Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1MjM2OTI2LCJleHAiOjE3ODc4Mjg5MjYsInVzZXJfaWQiOjE0MiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJmMDgzZTQ3NWUyNzI0OTFlNzcwYmQyMzVjMDBiYmFhZSJ9.ef-yoNoZdO9flpFu5b2wgwn1_Oi3TKsKHEK3JghYCRk', '2026-07-28 12:08:46', '2026-08-27 11:08:46', '2026-07-28 11:08:46', 0, 'Mozilla/5.0 (Linux; Android 12; RMX3630 Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.124 Mobile Safari/537.36[FBAN/EMA;FBLC/fr_FR;FBAV/521.0.0.6.104;FBCX/modulariab;]', '102.68.227.175'),
(353, 142, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1MjM3MTE5LCJleHAiOjE3ODUyNDA3MTksInVzZXJfaWQiOjE0MiwianRpIjoiYTEwYTg2ZWEwMjlkNWNiOTlkMjllM2MzZGVhYWY1MjcifQ.DnLiAi0A8hii5-lhV98wP-YeFVao5PT53krMez9wLZ8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1MjM3MTE5LCJleHAiOjE3ODc4MjkxMTksInVzZXJfaWQiOjE0MiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI2OGE4YTk1ZDAwODEzMGY2MmZjM2FlMWU3MDQ3MmZiNSJ9.xS8iJ0MlcPhKsS0xo9QHbXcjVCy7ccAV2GeQPpmsSgo', '2026-07-28 12:11:59', '2026-08-27 11:11:59', '2026-07-28 11:11:59', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '102.68.227.175'),
(354, 129, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1MzI3MTI3LCJleHAiOjE3ODUzMzA3MjcsInVzZXJfaWQiOjEyOSwianRpIjoiNzk2YmJkNjczYzcxMTVlM2JjMmU0MDU0NWMwZDdlZjAifQ.IBMl2_0UJ4yYXXQgQhOL8BaZ5C9XrN7edPFTIb19acE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1MzI3MTI3LCJleHAiOjE3ODc5MTkxMjcsInVzZXJfaWQiOjEyOSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIyMzk3NTBkNTZmY2RlZTBjMGI1OWZkYTU0MTEwY2M5YSJ9.aTsIhjYL8uRGjE7mXRHRn3Yu8b3yas5bSGfYDoajgMQ', '2026-07-29 13:12:07', '2026-08-28 12:12:07', '2026-07-29 12:12:07', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', '102.18.162.5'),
(355, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1NDEwODU4LCJleHAiOjE3ODU0MTQ0NTgsInVzZXJfaWQiOjI0LCJqdGkiOiJjODVlMDRjODI3NDViNTJjZDYzMjE0ODc4YTNmODNhNSJ9.ZWc2r5NtoqF991ncSzGgv-aU3mpW49k8WxNE_5yd2aU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1NDEwODU4LCJleHAiOjE3ODgwMDI4NTgsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjQ3MTBjNjhlNWE1ZDIzY2JlYzlhYjU4YTY4NzAyYjYyIn0.ccMByOpqqpXIk-QWODQZHevniZozF8AyrEbCGGz3epM', '2026-07-30 12:27:38', '2026-08-29 11:27:38', '2026-07-30 11:27:38', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.18.161.212'),
(356, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1NDEwODg1LCJleHAiOjE3ODU0MTQ0ODUsInVzZXJfaWQiOjI0LCJqdGkiOiJhMDJiODI0YjgzMGY2ODM3YzU5NDgyZTYwYWQ3NTM2YiJ9.Fvj7wMMe5878olmFwvf5aNd6vU4_ml4b79STIKW0fko', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1NDEwODg1LCJleHAiOjE3ODgwMDI4ODUsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijg0Yjg3ZTY1OWRlYjA3MGIwZjY4YzhmZTI1NzA1YzgyIn0.XGaXoGf9K-cPqt8WKbDgGzlf5WXu68EyCc45sWBG8cE', '2026-07-30 12:28:05', '2026-08-29 11:28:05', '2026-07-30 11:28:05', 0, 'Mozilla/5.0 (Linux; Android 9; CPH1911 Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.136 Mobile Safari/537.36', '102.18.161.212'),
(357, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1NjgwOTc0LCJleHAiOjE3ODU2ODQ1NzQsInVzZXJfaWQiOjE1LCJqdGkiOiIwMzQ5YzAxNzEyYWVjNDRlOGM1ZDNjMzIyYWE2ZmIyNyJ9.xPUdQzCCZMbeYlMk9NcCeKjIzvPmv7pJpSARqVXzdbE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1NjgwOTc0LCJleHAiOjE3ODgyNzI5NzQsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjA0ZWM3YzUyMmJlNzdiMTBkNTRkZThiYTFmODY5ODIyIn0.f_JwGLo7lZDkTgdVAuo4kDagsiDBq54aTwjHOPbqxC0', '2026-08-02 15:29:34', '2026-09-01 14:29:34', '2026-08-02 14:29:34', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '102.17.119.74'),
(358, 27, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1NzM5MTYxLCJleHAiOjE3ODU3NDI3NjEsInVzZXJfaWQiOjI3LCJqdGkiOiJlZDk0NzA3ZDY5YTZjNDdhMTQwZDhkNmQ1MTliY2I4MSJ9.rDdLWXJLb5p_T0WT-3g_ogwV5svQgoFQsd5QH9xwUhI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1NzM5MTYxLCJleHAiOjE3ODgzMzExNjEsInVzZXJfaWQiOjI3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjkwODNiYmQ5OWQ3N2RmMWNhNzMzZGVjYjBmMTE4ZDczIn0.0L6RbInf-dwNzDYIE8P8ho6BIwPALagTkGZOidCXFzg', '2026-08-03 07:39:21', '2026-09-02 06:39:21', '2026-08-03 06:39:22', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '196.20.185.112'),
(359, 27, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1NzM5MjM0LCJleHAiOjE3ODU3NDI4MzQsInVzZXJfaWQiOjI3LCJqdGkiOiIwOGNkMTBiZDVkZmEyNGU4ZGMyODZmMzYzN2VmZTU0ZCJ9.r6wimOc2_JM004idH2DlHCVqRGzH5E0K93NzE5xR4Es', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1NzM5MjM0LCJleHAiOjE3ODgzMzEyMzQsInVzZXJfaWQiOjI3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImExZDQzZWRmMGU1ZjU4NzA2ZWE3YWEyMDkzNzNiODM0In0.nvOxApp3rWUvvhpTdS6VG0yapqfSvmaD4o-pQ_M_wLo', '2026-08-03 07:40:34', '2026-09-02 06:40:34', '2026-08-03 06:40:34', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '196.20.185.112'),
(360, 141, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1ODI1MTg1LCJleHAiOjE3ODU4Mjg3ODUsInVzZXJfaWQiOjE0MSwianRpIjoiNTlkYWZjYmM0MzFhYjQwODI4YTViMzIxODJmYjgyNGMifQ.cIfUsJNS0_3Gchu9BM5K3GqgrxajNvnTM33vOCbGWzU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1ODI1MTg1LCJleHAiOjE3ODg0MTcxODUsInVzZXJfaWQiOjE0MSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIxNzhkM2I5NTI5NThiNTQyODc2YjQ4NGQ5OTMxNmI0NiJ9.nyFNrW-8ZUmCGYqJctLnJY51W1FUYnRCELCLoa-H-9g', '2026-08-04 07:33:05', '2026-09-03 06:33:05', '2026-08-04 06:33:05', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '102.16.127.242'),
(361, 134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1ODc2NDIyLCJleHAiOjE3ODU4ODAwMjIsInVzZXJfaWQiOjEzNCwianRpIjoiOWI2YTA4NGRkMmU3NjliOTdhN2QxNjI3NzY1YTMxMWMifQ.PxGIWnv9CkEw5p-EZJ-2pL5My0HcoeOsUo1fQxHJyuk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1ODc2NDIyLCJleHAiOjE3ODg0Njg0MjIsInVzZXJfaWQiOjEzNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhNmE3ZTYzOGZkYzQ5NjNlY2RlZjk1NWQ1NDdjZjE3ZSJ9.jxoaigDsNK5MMHnkEVhwfapIQkS2gXmqKD162PCWzm4', '2026-08-04 21:47:02', '2026-09-03 20:47:02', '2026-08-04 20:47:02', 0, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7_8 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/150.0.7871.113 Mobile/15E148 Safari/604.1', '37.66.25.250'),
(362, 134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1ODc3NzE2LCJleHAiOjE3ODU4ODEzMTYsInVzZXJfaWQiOjEzNCwianRpIjoiNzIwN2E0NmU3YTNkYjljY2E2NWFhYTZlMmNkMjM5ZTEifQ.9fxiLrIIvy1sXABc2iBjNWmtpi3vFa3XWp_7dZdGPK4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1ODc3NzE2LCJleHAiOjE3ODg0Njk3MTYsInVzZXJfaWQiOjEzNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI2MjEyNmE1NmE1YjA5ZWU0NWNiZDc1Njk2YzYxMzcxOSJ9.U4pxOCtpUGjrEE_Yqct1m4gzDI9ip16DTtnEUIT1E40', '2026-08-04 22:08:36', '2026-09-03 21:08:36', '2026-08-04 21:08:36', 0, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7_8 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/150.0.7871.113 Mobile/15E148 Safari/604.1', '37.66.25.250'),
(363, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1OTQ2MDMyLCJleHAiOjE3ODU5NDk2MzIsInVzZXJfaWQiOjI5LCJqdGkiOiI4MmM4NGU5NDAzNzU1MDVmZDEwZjA3MWNiYWZiZWIwMCJ9.mUopbQ0YzTo-BHHZhPcfeYLpXt_per71vvO3C8waAH8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg1OTQ2MDMyLCJleHAiOjE3ODg1MzgwMzIsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjMwMjE2NjI4YmEzMDI2YmM5YzM5OWU4NTQyZTExNWVhIn0.RC6qcvwz9QJT7A9NgtFt61thoVky7rcv_O3Ryk_3eQg', '2026-08-05 17:07:12', '2026-09-04 16:07:12', '2026-08-05 16:07:12', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/30.0 Chrome/143.0.0.0 Mobile Safari/537.36', '102.18.161.212'),
(364, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MDE3MTUyLCJleHAiOjE3ODYwMjA3NTIsInVzZXJfaWQiOjI5LCJqdGkiOiJmZTMwMDMzYjc5Njg3M2YwNzQ2MmNlZjQzMGNjZTAwMCJ9.cYOn969qXf3EsWM7GDTHBsABLr62pt-Aq9U-5dRhDA4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MDE3MTUyLCJleHAiOjE3ODg2MDkxNTIsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImIwYjkzZDBkOWFkNDhmY2UxYTI2N2QxOTI3YmU2MTM4In0.TVRMwGEEHONhKqd4a_C_Iy_2ei_1sLFu-HkxQJqA_iI', '2026-08-06 12:52:32', '2026-09-05 11:52:32', '2026-08-06 11:52:32', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/30.0 Chrome/143.0.0.0 Mobile Safari/537.36', '102.18.161.212'),
(365, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MDE3MTkwLCJleHAiOjE3ODYwMjA3OTAsInVzZXJfaWQiOjI5LCJqdGkiOiI5MmMwZDQ2ZDNmY2FhM2IwY2UyNTgxZWE0YTgwMTBmYSJ9.4eZHRlvsXttrjoE3x9QJfyBGO09SW6TOU7SD0b40TGw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MDE3MTkwLCJleHAiOjE3ODg2MDkxOTAsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImMxMWU4ZGJjNzIyN2JlNmFjNWExMzdlYmQ2MjkyODViIn0.-mwTBj8WVvZ21OJZHoKqcOuCg0227m0xIV8S1SGOoGw', '2026-08-06 12:53:10', '2026-09-05 11:53:10', '2026-08-06 11:53:10', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/30.0 Chrome/143.0.0.0 Mobile Safari/537.36', '102.18.161.212'),
(366, 145, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MDg4MTM0LCJleHAiOjE3ODYwOTE3MzQsInVzZXJfaWQiOjE0NSwianRpIjoiZmRiOGZiOTcyZTA4NjJkZGIxNjExYTRmZTYyYzJkMzkifQ.jQ8LmjeOGvZdGyljGgGX_iNM_VhO7Sl_su6Sfd2thnc', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MDg4MTM0LCJleHAiOjE3ODg2ODAxMzQsInVzZXJfaWQiOjE0NSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJjYTQ0MmY3MDNiMDU3MDExNDQyZTQ5ZDk1NTVlNmNmOSJ9.uPBb3HB9QvZptlFO4IH7MTKBPASbceMMgU8srO4h98w', '2026-08-07 08:35:34', '2026-09-06 07:35:34', '2026-08-07 07:35:34', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '41.242.101.6'),
(367, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MTkyMjIzLCJleHAiOjE3ODYxOTU4MjMsInVzZXJfaWQiOjI5LCJqdGkiOiIxYjM2YWI2ZjY5MjJhNWQwMmM0YzJlNTU5YzNmYjI0YyJ9.U3vuSRAPM4tiX1fak7QDMYqnTdh8XCgpw2MnugHVMD8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MTkyMjIzLCJleHAiOjE3ODg3ODQyMjMsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjU4YzYxNDUzMWFjMzBmZTk3NjdlMzIwY2RmZDk4ZmZkIn0.EbwsMw3MKYUHqVzVwpKXzL9XXIzl41BvXan18_3jDEo', '2026-08-08 13:30:23', '2026-09-07 12:30:23', '2026-08-08 12:30:23', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/30.0 Chrome/143.0.0.0 Mobile Safari/537.36', '102.68.203.180'),
(368, 143, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MjUyMjM2LCJleHAiOjE3ODYyNTU4MzYsInVzZXJfaWQiOjE0MywianRpIjoiZTAwYmI5OGQ1M2VjNWZmY2U2YTIwYTk4MDQ2NjY5ZTIifQ.N8EkJT5cKeA-t1qfIQHnx9KoTdmqKUMSLxt1NKe-D20', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MjUyMjM2LCJleHAiOjE3ODg4NDQyMzYsInVzZXJfaWQiOjE0MywidHlwZSI6InJlZnJlc2giLCJqdGkiOiI5NTA2MmRmZjkyMGQzMzFhZWJmMmFiNGNjNDM1ZWEwMCJ9.CEzw_jtsN61OigwLbkB8TzJJEtAjPY10yonlfD_XWVI', '2026-08-09 06:10:36', '2026-09-08 05:10:36', '2026-08-09 05:10:36', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '41.74.209.249'),
(369, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2Mjg1MjExLCJleHAiOjE3ODYyODg4MTEsInVzZXJfaWQiOjE1LCJqdGkiOiJlNTRlNWExYzJkMWJhMjYwYmQ1MTZkMWM2ZDFiNDYxNCJ9.iJ9cN4xHxc_-8QcBTkI7QAa1FcnvMD_FIrw9Mjqtc5U', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2Mjg1MjExLCJleHAiOjE3ODg4NzcyMTEsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjM3OWMwOWY5MDlmNjNiODJjNmVkNGVlN2Y3YTc1OWQ4In0.jPUk8DGf9XMiRPQKJoMYdha6gJVSlzZGKI5KXCfKFZM', '2026-08-09 15:20:11', '2026-09-08 14:20:11', '2026-08-09 14:20:11', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:153.0) Gecko/20100101 Firefox/153.0', '41.74.210.212'),
(370, 146, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2Mjg5OTI3LCJleHAiOjE3ODYyOTM1MjcsInVzZXJfaWQiOjE0NiwianRpIjoiMDAwYjIyMGE0MzhhMTFmOWMyNGUyM2E4ZWI2NmE0MGMifQ.1h6TzQb7ZGw4LBDTEfDm-BMEDHJrGv1FqFME-byzWXQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2Mjg5OTI3LCJleHAiOjE3ODg4ODE5MjcsInVzZXJfaWQiOjE0NiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJkZGQ4NjRhYjMxNTMyMjI2NjVhOWRmYzA3Y2ZmOGEzMCJ9.xEyEQYa7-RCyKomkIiROv4qnjjeckEU0j7p4_THT_Ng', '2026-08-09 16:38:47', '2026-09-08 15:38:47', '2026-08-09 15:38:47', 0, 'Mozilla/5.0 (Linux; Android 10; Redmi Note 8 Build/XiaomiRedmi Note 8;) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/92.0.4515.105 Mobile Safari/537.36', '41.74.210.176'),
(371, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2Mzc5MDAzLCJleHAiOjE3ODYzODI2MDMsInVzZXJfaWQiOjI5LCJqdGkiOiIwM2Y4ZDEwODZhYmZhZDg0NzkxZTRlNWJiYmI1ZTk1NCJ9.f_8CHgd3HgQarMIV_mFGZ-tzEh5CaSvLMDJqnZ2B5Ws', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2Mzc5MDAzLCJleHAiOjE3ODg5NzEwMDMsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImJiODMyMjMzYjExMWFhZDc2MjU1ZTRhN2JhOGVkYjc5In0.u_EROYudLs8eHtcd_qAhTEyazd_JNAmCkZ77GWsRHxQ', '2026-08-10 17:23:23', '2026-09-09 16:23:23', '2026-08-10 16:23:23', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '102.206.30.125'),
(372, 62, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MzgzNDgwLCJleHAiOjE3ODYzODcwODAsInVzZXJfaWQiOjYyLCJqdGkiOiIzNTFiN2EwZTg0YzRhMTkwODZjZjBkMTM5NDU4N2RjZiJ9.nLG5pOPkMfRSFRPsf66kMQT6bB-hP0ACWw-xM5CJgGQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2MzgzNDgwLCJleHAiOjE3ODg5NzU0ODAsInVzZXJfaWQiOjYyLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjI4OTBiNjlhNWIyMTRmZWNkNzYyYmJmMzUwNDAwOGY1In0.yiS0smIrrhPejiKwBVkQ5jofTqtfnXiiTqh20Ebu3TY', '2026-08-10 18:38:00', '2026-09-09 17:38:00', '2026-08-10 17:38:00', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '102.68.207.1'),
(373, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2NDQxOTA5LCJleHAiOjE3ODY0NDU1MDksInVzZXJfaWQiOjE1LCJqdGkiOiI2MjA0MjVkZGQxNWIxNTkyZWYyMmI5YTZmYmZmMDM5MSJ9.Y-LeAFRZULsyAuz8_kWrMejefo1gemdlyhvdjFR_gl0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2NDQxOTA5LCJleHAiOjE3ODkwMzM5MDksInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjFiYzE2NzVhZjQ4ZjUwOTZlZmE3OTk0NmQ0NzhjMDdiIn0.-53UYHh92dwYHrJJ7HM86FPg3lnbaM1vk-PikaxDI_w', '2026-08-11 10:51:49', '2026-09-10 09:51:49', '2026-08-11 09:51:49', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:153.0) Gecko/20100101 Firefox/153.0', '197.149.11.126');
INSERT INTO `aem_auth_tokens` (`aem_id_token`, `aem_id_user`, `token`, `refresh_token`, `expires_at`, `refresh_expires_at`, `created_at`, `is_revoked`, `user_agent`, `ip_address`) VALUES
(374, 138, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2NjgyMTAzLCJleHAiOjE3ODY2ODU3MDMsInVzZXJfaWQiOjEzOCwianRpIjoiMzk4NTg4NDQ3YTU0OTgyMTJmNzA3Y2YzNjRjOTA0M2QifQ.-eZqJdg4Sa97JzTurXY1434MBjpJ5bYIt1936K6Gb3o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2NjgyMTAzLCJleHAiOjE3ODkyNzQxMDMsInVzZXJfaWQiOjEzOCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhZDU0MDk1YzU2ZWM3YmViOGNkOTEwNzRiZTlmOTVlMiJ9.NeMa9MKnquCo5pMUd5TrNoRVe4Q1MKJ6AWIxdfRgg3c', '2026-08-14 05:35:03', '2026-09-13 04:35:03', '2026-08-14 04:35:03', 0, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '153.67.85.41'),
(375, 134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2ODkzODE4LCJleHAiOjE3ODY4OTc0MTgsInVzZXJfaWQiOjEzNCwianRpIjoiNjJiMjUzMjhhZjY2YTVhMGYyNzZiZGM3NGQ5MWE0YzMifQ._u86Ettj_INF4cYB8-l_qGfCzs5f2v87xC5XU8q16w8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2ODkzODE4LCJleHAiOjE3ODk0ODU4MTgsInVzZXJfaWQiOjEzNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI4NDcyYzVmZTk3YWZkMDZiOTUzMzc5ZThhNmJhYjIxYiJ9.OnXN4jFnyRxL3qfJSQNaGScyphlaRxbyZ5AtnE-s0I4', '2026-08-16 16:23:38', '2026-09-15 15:23:38', '2026-08-16 15:23:38', 0, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7_8 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/151.0.7922.112 Mobile/15E148 Safari/604.1', '79.83.33.204'),
(376, 134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2ODk0MDUxLCJleHAiOjE3ODY4OTc2NTEsInVzZXJfaWQiOjEzNCwianRpIjoiMTM0ZWY5ZWExNjY0NmUxNjA4MTMwYWM3MmYzNTY0MTYifQ.aTxJFlJS2jqLYpwua10e-L58h1Ux4Wt9Nf8tAboZhmk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2ODk0MDUxLCJleHAiOjE3ODk0ODYwNTEsInVzZXJfaWQiOjEzNCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI1NDNkYzUyYjMyZDk4ZTljMTNjZDcxZDg4NDg0OWM4ZiJ9.e7WouGbQAA7FpcbdZLES7JRvACMRrQYm_GJl58wJnLQ', '2026-08-16 16:27:31', '2026-09-15 15:27:31', '2026-08-16 15:27:31', 0, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7_8 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/151.0.7922.112 Mobile/15E148 Safari/604.1', '79.83.33.204'),
(377, 148, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2OTU4OTkxLCJleHAiOjE3ODY5NjI1OTEsInVzZXJfaWQiOjE0OCwianRpIjoiOWE0M2ZiZGVkNTQ1MjI5MjM1MDdhOGNkYTZmYzg2YzEifQ.MUfp8UdPq1hgzdo_Z8GH0F2VnioEaCTTNEPz_mhi7AA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2OTU4OTkxLCJleHAiOjE3ODk1NTA5OTEsInVzZXJfaWQiOjE0OCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJjMzI3ZWZiZDE2Yjk3NmY5ZTc5ZWVjYWMwMGIyODUyZiJ9.EjKQJKOaCwQoLe-D0P0AN5wQsTVKv0n4N0n56XI3I8s', '2026-08-17 10:29:51', '2026-09-16 09:29:51', '2026-08-17 09:29:51', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36', '102.17.119.157'),
(378, 148, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2OTU5NDQzLCJleHAiOjE3ODY5NjMwNDMsInVzZXJfaWQiOjE0OCwianRpIjoiYjBiZGRjYWE5ZDEyZDEzZjI2NTY5YjhhZTRhYmJiYjMifQ.g4t27EZl6pWR3howXS5EZ9NGMvx5MnfY3v0R1Vg5RpM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2OTU5NDQzLCJleHAiOjE3ODk1NTE0NDMsInVzZXJfaWQiOjE0OCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIxYTlhMjQzMzViZjRkOGI1NDI1ODEzYzFjNDE2YmE1MCJ9.2mz56X7-GSdK9UQMXCXBpH8cyWGCskpTnNy16C8nT8k', '2026-08-17 10:37:23', '2026-09-16 09:37:23', '2026-08-17 09:37:23', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36', '102.17.119.157'),
(379, 148, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2OTU5ODg4LCJleHAiOjE3ODY5NjM0ODgsInVzZXJfaWQiOjE0OCwianRpIjoiNTUyYmRkOWYzNTkzNTkyMjc0MGY3MzU3NDhkYjY1NTcifQ.YvblWnyN7rP6qx90kS10-SlyDoa3QoIU6BeOoo2IDMw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg2OTU5ODg4LCJleHAiOjE3ODk1NTE4ODgsInVzZXJfaWQiOjE0OCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIxNmEzZDE2NTZmZmI1ZGY5MjdiN2Y2ZWQ4ZTYwOTE3MCJ9.KMT9uhuEfYBjgNhMiVyHxm1gTg0PDUBshk7ZcxRmYH8', '2026-08-17 10:44:48', '2026-09-16 09:44:48', '2026-08-17 09:44:48', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36', '102.17.119.157'),
(380, 148, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg3MDM5ODc5LCJleHAiOjE3ODcwNDM0NzksInVzZXJfaWQiOjE0OCwianRpIjoiZmE0NWM0YTNiODhiZDJmZTI5N2JhNDZiZTU4NTY1MzkifQ.hnYJOZRH8uWetu8xNFUNHDKKlQU3H7t6x0prPum0Saw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg3MDM5ODc5LCJleHAiOjE3ODk2MzE4NzksInVzZXJfaWQiOjE0OCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI2ZmE4OGFiNDQ0ZTZhMmY1MWVhMGFlYjg1NDNiMzM3MCJ9.YSec69kUCaRtEdHefBBe6XanFlf1whVCmiWZULFVM7o', '2026-08-18 08:57:59', '2026-09-17 07:57:59', '2026-08-18 07:57:59', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', '41.188.43.195'),
(381, 133, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg3ODkzNDM4LCJleHAiOjE3ODc4OTcwMzgsInVzZXJfaWQiOjEzMywianRpIjoiYzE3MTU4MzMyNTI4ZjU0OGZlMTY0MTUyMjY0YTRmY2QifQ.dhSlsttKIPqQqU8S-Z8UQgjCi7dPQ9aM3Q8Kw8BtlII', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg3ODkzNDM4LCJleHAiOjE3OTA0ODU0MzgsInVzZXJfaWQiOjEzMywidHlwZSI6InJlZnJlc2giLCJqdGkiOiIxODVhZDA1NTQzY2UyMmEzZWVjMjcyMWM0M2NkNTRjZiJ9._4J2ppbv9IAFkvlSLfsNIlIW4QhfCkNnoDuedJH6Fow', '2026-08-28 06:03:58', '2026-09-27 05:03:58', '2026-08-28 05:03:58', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '41.190.239.123'),
(382, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg3ODk1NDg0LCJleHAiOjE3ODc4OTkwODQsInVzZXJfaWQiOjI0LCJqdGkiOiI5MzdiMTgwZjJmYTgxYWQ2ZWVhNTE0ODJiY2ZiZThiYyJ9.F5DZohHhdNBzozCYG309VRcAyfLy8Z5Ud8roiLZmMdM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg3ODk1NDg0LCJleHAiOjE3OTA0ODc0ODQsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjhjZjI3ZGY4NjA1NDk1ZTY0MWU1OWM3NTM2ZWIxNTYzIn0.FCq51n7i-tXNx4db3KH7wapoV34sfDjOvlLaBiSO7Yc', '2026-08-28 06:38:04', '2026-09-27 05:38:04', '2026-08-28 05:38:04', 0, 'Mozilla/5.0 (Linux; Android 11; CPH2127) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.210 Mobile Safari/537.36', '41.77.20.12'),
(383, 149, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4MDk0NDU5LCJleHAiOjE3ODgwOTgwNTksInVzZXJfaWQiOjE0OSwianRpIjoiZTYzNGRkZWNlZDY4NWZkZWE1MjVlOTA0MWZhYzAxMjQifQ.YE-j_mS37npDQPQv-jm8BlxOK_a_HlDLLAGjC0StjB8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4MDk0NDU5LCJleHAiOjE3OTA2ODY0NTksInVzZXJfaWQiOjE0OSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI2MGEwMjcyNTBmZTQ3ZjhjYWZhNWU1ZWQ5ODExNGZlNCJ9.jxIXWS6WSdlCIt3PstoBSfgu67F7KuQAe8yDE7_jhYw', '2026-08-30 13:54:19', '2026-09-29 12:54:19', '2026-08-30 12:54:19', 0, 'Mozilla/5.0 (Linux; Android 14; itel A669W Build/UP1A.231005.007) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.7871.181 Mobile Safari/537.36', '102.20.29.153'),
(384, 106, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4NTgzMTgyLCJleHAiOjE3ODg1ODY3ODIsInVzZXJfaWQiOjEwNiwianRpIjoiODQzMmI2YzkxZjU5OTFiMDUyNTU0ZWU2ODMzZmU0NzQifQ.yIXG4dnD9OLfyQdAyfken97TUp-Zueq_2ae3ff21qlQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4NTgzMTgyLCJleHAiOjE3OTExNzUxODIsInVzZXJfaWQiOjEwNiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJmYWIxYmFkZDg0YTQ5OWExZmMwYmE4ODQwYTJhN2RkOCJ9.SEfoZQsXfCd4o41yA7f3bIWNJKh0CXyuI-GQpin2Zlg', '2026-09-05 05:39:42', '2026-10-05 04:39:42', '2026-09-05 04:39:42', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36', '102.18.159.170'),
(385, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4NzEzMDg4LCJleHAiOjE3ODg3MTY2ODgsInVzZXJfaWQiOjMwLCJqdGkiOiIyZjJlMzVkN2Y4MjQwZTJmNjUwNmJmOWExNmMwMjczYiJ9.0woxyhwj2Jv2_5KzVuOTeOM54ku-pWBAPxxt_WUEhB8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4NzEzMDg4LCJleHAiOjE3OTEzMDUwODgsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImZlZDU1MmRmNWIzODllNjAwMDAyYTFlZWUyZDBmN2MyIn0.DzO5DGsfYpTEOCWieB5y0-gJjUfdORukOOWiWofK0QY', '2026-09-06 17:44:48', '2026-10-06 16:44:48', '2026-09-06 16:44:48', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '41.77.16.183'),
(386, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4NzEzMTg1LCJleHAiOjE3ODg3MTY3ODUsInVzZXJfaWQiOjMwLCJqdGkiOiJhNjg2MDZiMDI1ODAwYjZiYzYzYjMyZmM3ZjFlNWM4OCJ9._bkQH77j-0dWHiuozjcqhzCRycBbvvXABTWvAlorSVQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4NzEzMTg1LCJleHAiOjE3OTEzMDUxODUsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjBjMzcwNWI5MTVjYzdiZDdmYzYwMmRjOGJjNGM4YjBiIn0.vCNSUBAhSUxvvU6fLvTm64ZNSezXlg_vZGI7h-blb6w', '2026-09-06 17:46:25', '2026-10-06 16:46:25', '2026-09-06 16:46:25', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '41.77.16.183'),
(387, 151, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4NzgyMzQ0LCJleHAiOjE3ODg3ODU5NDQsInVzZXJfaWQiOjE1MSwianRpIjoiMDAwYTQxZGRjMmE0MmI1MjhiZmNkYjBhMTFiNWFhODMifQ.Wt885-g7KVewIZWQtI3FLsAdxzCgYzb-YL1yLUZYHfM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4NzgyMzQ0LCJleHAiOjE3OTEzNzQzNDQsInVzZXJfaWQiOjE1MSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJiOThiZWY4NDE2NjE2Njc4Mzg5YmYwZGE0Y2I4OTE0MyJ9.L8o0hz0khrVZfFgoy4JP5mu_KnWsacZVAjrj2YfNiTk', '2026-09-07 12:59:04', '2026-10-07 11:59:04', '2026-09-07 11:59:04', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36', '129.222.109.6'),
(388, 153, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4Nzg1NzcxLCJleHAiOjE3ODg3ODkzNzEsInVzZXJfaWQiOjE1MywianRpIjoiNTVjMjcwNGU3OWFhYjNlNGM0OTFiYjQ0ZWU0NDExMGMifQ.Mvt5Ne23BA8t3ssu4ZD32HoAYoJXpmYXyJ85m0iJJTg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4Nzg1NzcxLCJleHAiOjE3OTEzNzc3NzEsInVzZXJfaWQiOjE1MywidHlwZSI6InJlZnJlc2giLCJqdGkiOiIwNmRkMzNiYzk4OGM5ZTMxMzE4ZmU3OGNjODAyZjJmNCJ9.kaCzlLQxD9YK2OguH8kITte__gJ_WqlcFehRLqUjNRs', '2026-09-07 13:56:11', '2026-10-07 12:56:11', '2026-09-07 12:56:11', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '197.148.143.167'),
(389, 154, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4ODAxNjk3LCJleHAiOjE3ODg4MDUyOTcsInVzZXJfaWQiOjE1NCwianRpIjoiZGY5YTZmMDY2ZWVmZjhlNGQzZDFmZjY3NWI3N2NkZTAifQ.JfDPj8rukOna2eedrKRNTgDdCfXpggvsXj2rJhhbQtU', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4ODAxNjk3LCJleHAiOjE3OTEzOTM2OTcsInVzZXJfaWQiOjE1NCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI3MzRmMDQwZWJhZjgxYjcyMmM2NjNjMjZiMjAyZTZhZiJ9.Evn6_AtdEpg3hzrpvEa6WPvXMPCYBkov7OzXQbAH-uw', '2026-09-07 18:21:37', '2026-10-07 17:21:37', '2026-09-07 17:21:37', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '154.120.142.252'),
(390, 148, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4ODM3MDg1LCJleHAiOjE3ODg4NDA2ODUsInVzZXJfaWQiOjE0OCwianRpIjoiZGE4ZjEyYTdkMGFjMzgyNjlmMzVkN2ViNWRjODdmY2YifQ.ouowf47mwSuB7nJ9L5BngO0Uxy88CBTwp93_0bdhaOk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg4ODM3MDg1LCJleHAiOjE3OTE0MjkwODUsInVzZXJfaWQiOjE0OCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI5NzJkYTAxMmQ4MTMzYjhjZjQ4OGY1Y2M1ZDU0ODJlYSJ9.Hr0GwFnK4BR79JNaF_-VUaPnPmPb5gtUL6q-xBUHoug', '2026-09-08 04:11:25', '2026-10-08 03:11:25', '2026-09-08 03:11:25', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36', '102.18.158.68'),
(391, 133, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDI0NDg5LCJleHAiOjE3ODkwMjgwODksInVzZXJfaWQiOjEzMywianRpIjoiMDFmNzY5OWI4YzJjNzE2OWMxMjQzNGQzMjZiY2EyYmQifQ._hl8H2I7UH-7IDm_qDkaz9V_UH-KREc1TTMdxs_fBJo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDI0NDg5LCJleHAiOjE3OTE2MTY0ODksInVzZXJfaWQiOjEzMywidHlwZSI6InJlZnJlc2giLCJqdGkiOiJlOGM1ODU1ZDYyMzM1YmMyZGZjM2MxMTU2ZDZhNWVkMyJ9.tqqadN7cZKY58qqAsqwufqEQBDuWwXtcyzBzb_gf99A', '2026-09-10 08:14:49', '2026-10-10 07:14:49', '2026-09-10 07:14:49', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '41.190.239.123'),
(392, 120, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDMxMDY3LCJleHAiOjE3ODkwMzQ2NjcsInVzZXJfaWQiOjEyMCwianRpIjoiMWZlYzVmMjM5MTBjY2Y2MzBkZTg4MDkwNzI5ODY2MjAifQ.QZwOf2f6OXoC0MZIkKZsIV00vrWRX3ApdDte5Fu0J2w', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDMxMDY3LCJleHAiOjE3OTE2MjMwNjcsInVzZXJfaWQiOjEyMCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI4M2UxOGM2NWVjZTI3NGUwMjlhNmU2NzdmMWY5NTI4ZSJ9.Iotj2GdK-fdP4uBlVe8anIlyP9-70_oDWpcFnRiCu4Q', '2026-09-10 10:04:27', '2026-10-10 09:04:27', '2026-09-10 09:04:27', 0, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '153.67.85.157'),
(393, 120, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDMxNDYzLCJleHAiOjE3ODkwMzUwNjMsInVzZXJfaWQiOjEyMCwianRpIjoiZjQyNWE4ZDkyNjU2NDJhMTc3NjU2YjQxMTgxNzlhNWQifQ.hSqs3jsc6TXRzqeDAHabWmg4-1ORE38J7HoIeHLZzD0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDMxNDYzLCJleHAiOjE3OTE2MjM0NjMsInVzZXJfaWQiOjEyMCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI2NDk5OTYyMTVlZWJkZmI5Zjc1YmQ2MWYyZWI0NmQ0NiJ9.MFxpWIj-NQ7NgE5wPfD3JJeXNscaNc1EWwnLn_HsDu0', '2026-09-10 10:11:03', '2026-10-10 09:11:03', '2026-09-10 09:11:03', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '41.74.208.247'),
(394, 120, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDMxNDY0LCJleHAiOjE3ODkwMzUwNjQsInVzZXJfaWQiOjEyMCwianRpIjoiZTE2MzAxZDkwMjIxNTgzZDFiNzk5YzFlNWQxMzA4MWYifQ.-kV20QTCgP0sPZXfF9172v8uNXoF64CcqqMvX3lI4yA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDMxNDY0LCJleHAiOjE3OTE2MjM0NjQsInVzZXJfaWQiOjEyMCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhYTE5ODUyZjg2NTMyNjZhODNmYjhhZWEyZDk2NDEyZCJ9.SZUSeHO2jLmzmQsljfnW9JE32rAYEx_eBop_cuY6EGk', '2026-09-10 10:11:04', '2026-10-10 09:11:04', '2026-09-10 09:11:04', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '41.74.208.247'),
(395, 158, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDMxODAzLCJleHAiOjE3ODkwMzU0MDMsInVzZXJfaWQiOjE1OCwianRpIjoiY2M1N2U1YjlkNWVmY2Y2ZGQzNDZhMTVkZjFiNjkwNDEifQ.GXQPs_VdNGGooa42Sgl0YQ-oKKKZDWJZAMvXqVX2t08', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDMxODAzLCJleHAiOjE3OTE2MjM4MDMsInVzZXJfaWQiOjE1OCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJhNmE3YjlhMWMyOWZmYTlhYzc3ODc0MjY2MDQyMjEzMCJ9.kolB7jcBUXKRt08UQDF09O0OBvwxfgG-xztR3YPBzpg', '2026-09-10 10:16:43', '2026-10-10 09:16:43', '2026-09-10 09:16:43', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '129.222.109.202'),
(396, 156, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDM1MjM5LCJleHAiOjE3ODkwMzg4MzksInVzZXJfaWQiOjE1NiwianRpIjoiM2IwMjRkZGExNjM3MDMyODJiM2VjNmZiZTE4YmM0Y2UifQ.KU93bU-aDoayZeaPgyYhtUnvF_mPVntR_4idFIWHHRs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MDM1MjM5LCJleHAiOjE3OTE2MjcyMzksInVzZXJfaWQiOjE1NiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI3YzdhODExMWU2NjZlMDA2MWQwNTcxODUxZGU3OTE0ZCJ9.PJ9ofY3Ur_hgN85TIFgEWWLJ7mTsWAljiDNnY26hZaM', '2026-09-10 11:13:59', '2026-10-10 10:13:59', '2026-09-10 10:13:59', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '102.68.192.218'),
(397, 64, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MTUzMDc3LCJleHAiOjE3ODkxNTY2NzcsInVzZXJfaWQiOjY0LCJqdGkiOiIyODdiZmUxZjIzODRmNTEzM2Y0MWJjNjhkZWRiNzVlYSJ9.RsuqKWRd0skbPHzEF10axf0oQvaRC_YF6YdTmlQGTHI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5MTUzMDc3LCJleHAiOjE3OTE3NDUwNzcsInVzZXJfaWQiOjY0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjMyNTgwMzZlMjIxZjk2YWM3YzkwZmU4YTA1NjIxNjEyIn0.-qASwKJ6gPfU6SqfvyMlb9vCeGBC1QgkOf4hx-d6Ixs', '2026-09-11 19:57:57', '2026-10-11 18:57:57', '2026-09-11 18:57:57', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '41.77.17.185'),
(398, 154, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5NDAwNDE1LCJleHAiOjE3ODk0MDQwMTUsInVzZXJfaWQiOjE1NCwianRpIjoiZDI1NzgwYTBiMDVmMzE1M2IwMjU4MGU5YzA3ZDE1Y2QifQ.kLBgrLRv1Tx5eFUcfiRk6BXnl1CLKMrnPRvC0pYiCY4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5NDAwNDE1LCJleHAiOjE3OTE5OTI0MTUsInVzZXJfaWQiOjE1NCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI5NmQ4OGEzNWEwZDE0MmI5Y2EwNzM0ZTNhOWRiZTY1MiJ9.Oek2SpOa9SWz4LgraiFVumhF7Out-cPEWEF3tfmygAo', '2026-09-14 16:40:15', '2026-10-14 15:40:15', '2026-09-14 15:40:15', 1, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '154.120.142.35'),
(399, 24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5NTUyMjEzLCJleHAiOjE3ODk1NTU4MTMsInVzZXJfaWQiOjI0LCJqdGkiOiJmOTU1OTJhNTI3YjczNDg5OTUyZjJiYzE5NTEyMWM4YyJ9.JkLH8Hy35doViux-VUszG9Gfk8NZ1pcgqWsM0zCdwJs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5NTUyMjEzLCJleHAiOjE3OTIxNDQyMTMsInVzZXJfaWQiOjI0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImE0Mzg5NzUwNTQ2MzNiOTFiM2RiNmZjNGNkYTE0OTdjIn0.O4nI6XLyD5NjeHG9A3c_izyljZLv7U796O_ScBGTbYU', '2026-09-16 10:50:13', '2026-10-16 09:50:13', '2026-09-16 09:50:13', 0, 'Mozilla/5.0 (Linux; Android 11; CPH2127) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.210 Mobile Safari/537.36', '102.17.120.170'),
(400, 155, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5NjcxODE3LCJleHAiOjE3ODk2NzU0MTcsInVzZXJfaWQiOjE1NSwianRpIjoiOTFkNzY4Y2Q1Y2E3NGFiZDk2MzdhNGNmODBlZTk1ZTUifQ.sTQy6xBmbXHZkAErIdf1bpd7C05jw-n_-1W7zsPHITk', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5NjcxODE3LCJleHAiOjE3OTIyNjM4MTcsInVzZXJfaWQiOjE1NSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI5OWE1YWM4MjhjMTNiZDFhMDkzMTIzOGRkNDg0NzdjNiJ9.SLnwvjHSoZP__1OnZfc-bLpN4zaGTx1JkDFTOyE8BYc', '2026-09-17 20:03:37', '2026-10-17 19:03:37', '2026-09-17 19:03:37', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:156.0) Gecko/20100101 Firefox/156.0', '102.68.197.170'),
(401, 158, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5OTk2NjY3LCJleHAiOjE3OTAwMDAyNjcsInVzZXJfaWQiOjE1OCwianRpIjoiOWViZjZkYzAzZDIyZjQyMjI5ZGE3NjA0ZDRkNmZiMmEifQ.MZSCpnvTnKnZPpOaji1Tw9z0VUtxalOjrkRuMlNzm1g', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzg5OTk2NjY3LCJleHAiOjE3OTI1ODg2NjcsInVzZXJfaWQiOjE1OCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI5MmI3OTYyODUzZWM0MzM4N2VjZDU4MTlkODljOTc2MCJ9.VQG_xKt-gWdFhHWKW5FSn_H5J_qwJQuLQLGhIktlheQ', '2026-09-21 14:17:47', '2026-10-21 13:17:47', '2026-09-21 13:17:47', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Mobile Safari/537.36', '41.74.212.183'),
(402, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwMjMyNjMyLCJleHAiOjE3OTAyMzYyMzIsInVzZXJfaWQiOjI5LCJqdGkiOiIxMjc0YzJjZjFiNmM5YTRlNDNlY2FkMDI2YzJhYzNlMCJ9.sSGqCPUy4z02Axly5xKOSMBs44YoBnujsG_ZNpA8y0Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwMjMyNjMyLCJleHAiOjE3OTI4MjQ2MzIsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjViOWU5ZjYxNGI2Mjc3YjY0YWM2OGU2YjJhOTJiNWY1In0.Hfufd0DyKLcEHR0Ddl5v3cYV7xmXsER2SfVww1Amzvg', '2026-09-24 07:50:32', '2026-10-24 06:50:32', '2026-09-24 06:50:32', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '102.68.202.5'),
(403, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwMjMyNjg4LCJleHAiOjE3OTAyMzYyODgsInVzZXJfaWQiOjI5LCJqdGkiOiJjMDFlODZmN2NkZmM3YzNhMGMwZTI1ZDM1OWUzNjBmOCJ9.7_sbKliUajdkBDtw7spfU8_oVutvsD2SU4hFmXUiC9I', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwMjMyNjg4LCJleHAiOjE3OTI4MjQ2ODgsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjM4ZWI2YmZiY2U0NDkyZThlYjVkYWVlNWMzOGQ0NmFjIn0.YNYjddCTK918No-ul3K2B3a2Ldg3KdIC5I6ZfsrIbU4', '2026-09-24 07:51:28', '2026-10-24 06:51:28', '2026-09-24 06:51:28', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '102.68.202.5'),
(404, 65, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwMjM5ODI1LCJleHAiOjE3OTAyNDM0MjUsInVzZXJfaWQiOjY1LCJqdGkiOiIwY2FjN2I2MjNiZGY1OTM2ZmI3MTAyNmJiZmRlMGY4NSJ9.U8YOOWn0W1j6CYs8ftFyEd_EsAuUewYYez9eMs5089U', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwMjM5ODI1LCJleHAiOjE3OTI4MzE4MjUsInVzZXJfaWQiOjY1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjQ4ODg1YmRjNDdmMzE5YTk1ODAxNDUzMjc1ODBkZDZjIn0.sQSVJbPPRWhzhyIox-CiWk9Q-RhbIH4umTOWaLXtE6M', '2026-09-24 09:50:25', '2026-10-24 08:50:25', '2026-09-24 08:50:25', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '154.126.79.157'),
(405, 159, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwMjQ2NzM4LCJleHAiOjE3OTAyNTAzMzgsInVzZXJfaWQiOjE1OSwianRpIjoiMGFiM2RjMWRiNzA5MDM2OWUyODI4Y2IwMGFkODU3NzIifQ.CPScc1btVDEhmBO2JOcRcCjx07Y2F-3aFANnz7xHzo8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwMjQ2NzM4LCJleHAiOjE3OTI4Mzg3MzgsInVzZXJfaWQiOjE1OSwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI2OThjZGU0YTk3ODNjOTQ3OWQ1NTI0NDZmMjUxY2Y2YyJ9.WQac5-zgCnMBtu4iKynz2ikGoz4KrlwduFVDdI3XByM', '2026-09-24 11:45:38', '2026-10-24 10:45:38', '2026-09-24 10:45:38', 0, 'Mozilla/5.0 (Linux; Android 12; CPH2161 Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/151.0.7922.199 Mobile Safari/537.36[FBAN/EMA;FBLC/fr_FR;FBAV/525.0.0.5.102;FBCX/modulariab;]', '102.68.196.163'),
(406, 160, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwMjQ3NTk5LCJleHAiOjE3OTAyNTExOTksInVzZXJfaWQiOjE2MCwianRpIjoiMTMwNzQ4MmYyNjdmMzAwYWZiYzgwNTkyY2E5NWY1YmUifQ.39YkcTWF7sGYJ5IG1jhPSyLXvcpMDPZo0VvbiNq0YPo', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwMjQ3NTk5LCJleHAiOjE3OTI4Mzk1OTksInVzZXJfaWQiOjE2MCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJjMzE1ODA1OTAzYzI5ZTk0MjA3ODRmOGZhOWFjODJiNCJ9.a_OLTfNiZfsLSmXCcfWx-hH4uiJpNWC7yJk6Ru_GmCY', '2026-09-24 11:59:59', '2026-10-24 10:59:59', '2026-09-24 10:59:59', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '102.18.160.19'),
(407, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwNjE0MTQwLCJleHAiOjE3OTA2MTc3NDAsInVzZXJfaWQiOjE1LCJqdGkiOiIxNzY4NGJmYjU2OTBkNWMxNzNiZGFjMzVjZGVmMmVhOCJ9.5ErEIlsXQ38xKSE46LIZ3ZAbgqxylIF2-BxH4T5aLwI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwNjE0MTQwLCJleHAiOjE3OTMyMDYxNDAsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImE4YjliNjJlYzkzZGUyMDU5YjNmMjg4ODIwNjgxODQ1In0.kjR_Ss6kcBhkS7o8zQWuIwLdY9T1t9yV3r2jY-skL90', '2026-09-28 17:49:00', '2026-10-28 16:49:00', '2026-09-28 16:49:00', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:156.0) Gecko/20100101 Firefox/156.0', '197.149.11.126'),
(408, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwODQxNjIzLCJleHAiOjE3OTA4NDUyMjMsInVzZXJfaWQiOjE1LCJqdGkiOiIxYzAxZmFmNDI5NmU3MjQ3MjU4YjFmYjBlNjMwMDYwMCJ9.K9D_bjZ4ED-hLhgqpNymFfM4uLc2_ZcXQ2XYVypvxV4', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwODQxNjIzLCJleHAiOjE3OTM0MzM2MjMsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImI5MzUyYWQwM2ExYTkyZDhmNTQ0NzZiZDMzYjljNjUxIn0.8MXDh4pGzYhNz6oMbOoiC99RwBTBPfP2rtPhapQmoR4', '2026-10-01 09:00:23', '2026-10-31 08:00:23', '2026-10-01 08:00:23', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:157.0) Gecko/20100101 Firefox/157.0', '153.67.85.39'),
(409, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwODYzODAxLCJleHAiOjE3OTA4Njc0MDEsInVzZXJfaWQiOjE1LCJqdGkiOiI4MDM0YWI1MzY4NmZhZGRhODcwYzA4OWRkNTQ3YTg0ZiJ9.d7eB0Mot8ckQQrjNExt9Lsx0F58BxkXt5XDk8TZNYpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwODYzODAxLCJleHAiOjE3OTM0NTU4MDEsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImZmMzBiNDgzNzZmNWU2ZmJkM2Q3ZDAwYzNiZmI2ZWE1In0._Yl-Te_Ysypwe8-Ckks7NIUgkhS5rcOWPKcOmux8GIY', '2026-10-01 15:10:01', '2026-10-31 14:10:01', '2026-10-01 14:10:01', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:156.0) Gecko/20100101 Firefox/156.0', '197.149.11.126'),
(410, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwODYzOTg1LCJleHAiOjE3OTA4Njc1ODUsInVzZXJfaWQiOjE1LCJqdGkiOiJkYmFkZGZjY2FmZGNkNDYzZGRjYzRjZDRmODJjNWRkNCJ9.CwOqGrBoaYvD14x37FSCe-v8I0HbW04arpFtxN6On60', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkwODYzOTg1LCJleHAiOjE3OTM0NTU5ODUsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImM3NGEzMzRlNWRhODU2Mjc4YmZhMDQxOWYwMTczYTFiIn0.1-7DegVN6-d9wpQH7fK78zPG10masELLSGitjZ3fAOo', '2026-10-01 15:13:05', '2026-10-31 14:13:05', '2026-10-01 14:13:05', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:156.0) Gecko/20100101 Firefox/156.0', '197.149.11.126'),
(411, 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkxMTAxNTMwLCJleHAiOjE3OTExMDUxMzAsInVzZXJfaWQiOjMwLCJqdGkiOiJjMDJlMDZlYTNjYzU0ZDQzYzBlZTA0ZGVkYzI0ZGY2OSJ9.yYcKG7c4A-jalX1C_N57_aYmaF2bvjERtnwanPo1V18', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkxMTAxNTMwLCJleHAiOjE3OTM2OTM1MzAsInVzZXJfaWQiOjMwLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjkwZDVjZDAzODFhNjJiMTY5Mzk4Zjc3ZTFlNDYzNDllIn0.Ss-ToFezNbr9FBlEb8YxUJriyzslhZVQlz3Lhmypf7w', '2026-10-04 09:12:10', '2026-11-03 08:12:10', '2026-10-04 08:12:10', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '102.16.39.201'),
(412, 162, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkxMjk1MTY5LCJleHAiOjE3OTEyOTg3NjksInVzZXJfaWQiOjE2MiwianRpIjoiYzM5MmM3Y2U3ZDAyNDYzZjQ0YzU4OGIwNDEyZWE1YjcifQ.qzGGxSa3Q1XpB-4Ha38bE5iGORUolLsg19sYggWflwQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkxMjk1MTY5LCJleHAiOjE3OTM4ODcxNjksInVzZXJfaWQiOjE2MiwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIxNTIxNzIwNDIyMjViYWM5YzVhYzNlYWE4MGYyZTA1MyJ9.mtBzGIFnGkoyF-vnBBiYS1JJlk1wD1wUHZPMPadpHIE', '2026-10-06 14:59:29', '2026-11-05 13:59:29', '2026-10-06 13:59:29', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36 OPR/102.0.0.0', '129.222.109.164'),
(413, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkxNTE4Mzg3LCJleHAiOjE3OTE1MjE5ODcsInVzZXJfaWQiOjE1LCJqdGkiOiJjNDY0MTRmZjA0YzMzMmUzMWY5YzZhMGI2NjFmZTNjNSJ9.rHuJYVNmNfT8WiX9VUzygNdPiGWdT4Xa57qP73Kp2S8', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkxNTE4Mzg3LCJleHAiOjE3OTQxMTAzODcsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjY4NDkwZDM1MDYyNDNmMDVjNzhiNDM1MmVjNGRjODMyIn0.8vc1u9Dhz0SjUvcpVtMxk30LteNiRkG1LDoDHR80fn4', '2026-10-09 04:59:47', '2026-11-08 03:59:47', '2026-10-09 03:59:47', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:157.0) Gecko/20100101 Firefox/157.0', '41.74.213.161'),
(414, 29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkxNTI1MzQ2LCJleHAiOjE3OTE1Mjg5NDYsInVzZXJfaWQiOjI5LCJqdGkiOiI0ZDAxZjRlMTZhZGI5YTMzNjBjMDUyNjEzYTk1YjgxNyJ9.j7FsF82kvV32A2wiPK7WgfDQu0E1kl2Mt38d0RUrQCs', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkxNTI1MzQ2LCJleHAiOjE3OTQxMTczNDYsInVzZXJfaWQiOjI5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImE3NzU3ODNhNTc2NTUzZjMwZDJkZWI1OTUzMTM1ZjUzIn0.5qq0F0jzimDfRYbUNvxXGOEXLAXYpikEw9kLR-Zw9PI', '2026-10-09 06:55:46', '2026-11-08 05:55:46', '2026-10-09 05:55:46', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '102.68.202.3'),
(415, 67, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMDAzMTQyLCJleHAiOjE3OTIwMDY3NDIsInVzZXJfaWQiOjY3LCJqdGkiOiJlZWY2NzZkY2M5MGRmZTk0MGI0ODkxOWE2MzNjMTdjZSJ9.SH2R8_7kqOUNMYYYPb9oARhAqhPKPOvPKf2TdkMvtsQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMDAzMTQyLCJleHAiOjE3OTQ1OTUxNDIsInVzZXJfaWQiOjY3LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImYzYmRlYWNkODM5NDk2NWU0ZmQwNzAxZjdhNWZjMDM5In0.5R5Uj9vjar3Z-uK7IF1nhj2CR4BETfE72lHucbBJm1Y', '2026-10-14 19:39:02', '2026-11-13 18:39:02', '2026-10-14 18:39:02', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '161.216.164.125'),
(416, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMDgzODMxLCJleHAiOjE3OTIwODc0MzEsInVzZXJfaWQiOjE1LCJqdGkiOiI2MGU4OGE0YTkwY2YyNGE5NDJlNjA1NGIzYzhlMjk3OSJ9.YnbLM90OjYgND-BRqdAY63H2RnCK6JxQeQgDgRSEhZw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMDgzODMxLCJleHAiOjE3OTQ2NzU4MzEsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjNlNWJkOTkzNWIyYWQyNDBjMmIzYWFhYjlhOWNlMTA4In0.Z7eIMGjFTzUS0kRh666VC3x6kM6TfkKANtYhrSbMLa4', '2026-10-15 18:03:51', '2026-11-14 17:03:51', '2026-10-15 17:03:51', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:157.0) Gecko/20100101 Firefox/157.0', '41.74.208.83'),
(417, 99, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMDg1MzA0LCJleHAiOjE3OTIwODg5MDQsInVzZXJfaWQiOjk5LCJqdGkiOiJkZjk4YWUzMDZiMDI0YTAwOTA3ZDUyZjE2ZTE1M2U5ZCJ9.tGls2m7rU5zU61WlvfRSZb9a7MjRElq33OLYOb_g4Jw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMDg1MzA0LCJleHAiOjE3OTQ2NzczMDQsInVzZXJfaWQiOjk5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjlkNjEwOWUxZTM5NDMwYTNlMzVmYWU3ZDBmMWZkM2ZmIn0.vFqIKE_sjb65zWwwgtUFWmPIOKmihoa7xTjolgwVg2k', '2026-10-15 18:28:24', '2026-11-14 17:28:24', '2026-10-15 17:28:24', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '41.74.208.165'),
(418, 99, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMDg1Njg3LCJleHAiOjE3OTIwODkyODcsInVzZXJfaWQiOjk5LCJqdGkiOiI4ZTdhYjM2ZDFhZmQ5NTk1MjA4ZTM2NTM5MzNhOWI1OSJ9.RB9A3XGAkZKZaakCTGzDzG3IV2qKUMzIEOqHeHHFpyM', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMDg1Njg3LCJleHAiOjE3OTQ2Nzc2ODcsInVzZXJfaWQiOjk5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImQwYWJlMjAwMzRjYjM2N2YxOWZjYjZiNWU3NmFlZjliIn0.DDXbgZewWZmWKIx8WkCIf5jSTfPiEb7jzogkhVq8r-Q', '2026-10-15 18:34:47', '2026-11-14 17:34:47', '2026-10-15 17:34:47', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '41.74.208.165'),
(419, 99, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMDg1NzIyLCJleHAiOjE3OTIwODkzMjIsInVzZXJfaWQiOjk5LCJqdGkiOiJiYWU4OTViMGQyNzdhODM2MGU1ZjM1M2Y0MGNiNDMzYSJ9.kbBhsOx21UE_fMs9x1MkUcChXf4jJYXBZxaJlB4mmXE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMDg1NzIyLCJleHAiOjE3OTQ2Nzc3MjIsInVzZXJfaWQiOjk5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjEwMTZkZWI0Y2IwNzNhZjE4NjRkNjdlMTdmNmM4NDE0In0.3pNAqMlPLSYsfKF0ZsKu6PGzqK1I1wfJjJWrRuy1ooo', '2026-10-15 18:35:22', '2026-11-14 17:35:22', '2026-10-15 17:35:22', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '41.74.208.165'),
(420, 160, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMTI3NTUwLCJleHAiOjE3OTIxMzExNTAsInVzZXJfaWQiOjE2MCwianRpIjoiZWU0OGY4NTc1Y2ZmMmNhNGY5ODg0MTA0M2E1ZDZkOGYifQ.-VsWFGQXVOR6ZJ_Nyoj4Mzsg-7mCvh3pvZB5Gg8ukl0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMTI3NTUwLCJleHAiOjE3OTQ3MTk1NTAsInVzZXJfaWQiOjE2MCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJkM2Y4N2NmYjU3YWI2ZWMzODE2ODEwZjk3ODM0MDIzNyJ9.PiiXxlRB-OjE8NjNSRedqIF37yon2M28j2_mtx2-ZDU', '2026-10-16 06:12:30', '2026-11-15 05:12:30', '2026-10-16 05:12:30', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '102.17.120.142'),
(421, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzIyODEyLCJleHAiOjE3OTIzMjY0MTIsInVzZXJfaWQiOjE1LCJqdGkiOiJmZGI3YzM1NTJhOTIzOTYzYjg0N2U4OTU1MmM3ODUyNyJ9.s95ffDAr-cAgvLvKIagMnG3gDWqm8Gsfparn1sZhB_0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzIyODEyLCJleHAiOjE3OTQ5MTQ4MTIsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjAwZWFiNTFkMDg2YWJmMjRhNzAwZWRiZWIyMjExODEyIn0.fJG1QcT6qMRS8rQ-67K8v4747oaRa3A2VLo6BlljVGw', '2026-10-18 12:26:52', '2026-11-17 11:26:52', '2026-10-18 11:26:52', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0', '41.74.213.54'),
(422, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzI0MDMzLCJleHAiOjE3OTIzMjc2MzMsInVzZXJfaWQiOjE1LCJqdGkiOiI4ZDViYWZmZTc3ZjYxMzQzNzI2ZDFjMmY3MTE2ZTJhMiJ9.QJa2BGgiCss8u6oxEb_bojfQxIEduoU_K_mUHX0GPrA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzI0MDMzLCJleHAiOjE3OTQ5MTYwMzMsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjZhMDI0N2FjYzJmY2U2NGE1OTRkMjk0MzUyOGU0OTVhIn0.9Ugf7-QahthN9r2SH6cGp_JPoyEUdEYffOI2-gAZDj0', '2026-10-18 12:47:13', '2026-11-17 11:47:13', '2026-10-18 11:47:13', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0', '41.74.213.54'),
(423, 65, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzI3NzYzLCJleHAiOjE3OTIzMzEzNjMsInVzZXJfaWQiOjY1LCJqdGkiOiIyNmEzMzA3ZTZmNjM1Mzk3ZTdmYzNmNTNkNTJmM2JkOSJ9.qy2CboCJHr8R7d509hf2b6dLPeumeAm_xexwdH10yew', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzI3NzYzLCJleHAiOjE3OTQ5MTk3NjMsInVzZXJfaWQiOjY1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImNlNTZkOThkZjAzYWY0NmNiODQ4OTQyNDUwMmFkYjE2In0.0S9LXPB1j2kRfcKxvT6nd9HxgzTrBggfyA-mRFiL4SQ', '2026-10-18 13:49:23', '2026-11-17 12:49:23', '2026-10-18 12:49:23', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', '129.222.109.120'),
(424, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzM3MzcxLCJleHAiOjE3OTIzNDA5NzEsInVzZXJfaWQiOjE1LCJqdGkiOiIxMmE4MzM0ZGE4MmVmMGI2NWRkZjUyMDIzODIyMGViNiJ9.XvmJIVE-27xbtBX9RDtGryBNT9uPOUdUUgE692PlBbY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzM3MzcxLCJleHAiOjE3OTQ5MjkzNzEsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjE2ODA1YzlhNzAwZDA0MTYxNjAxMDNjNjhjMTc2MjU2In0.EPt7ki7to6sq5KkEwNC2zNkqHjiefcThH77NIfWT2Pk', '2026-10-18 16:29:31', '2026-11-17 15:29:31', '2026-10-18 15:29:31', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '41.74.213.54'),
(425, 59, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzM4NjI1LCJleHAiOjE3OTIzNDIyMjUsInVzZXJfaWQiOjU5LCJqdGkiOiJiN2Y1NWZkOTk2NjIxMjM3MWJmNjRmNDU3ZTdkMTBkMSJ9.7bIxOsj4jE1NLGPFHJEptuDSjlGF4gVlLh901x8FquY', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzM4NjI1LCJleHAiOjE3OTQ5MzA2MjUsInVzZXJfaWQiOjU5LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImY3MzMzNzkwZmFiYTgwMzVlZDMzNmY2MjJlMTRlNGEwIn0.f68YlELD2mE24x2qr1S_EZpbCAa-oB98W636Nylm5C4', '2026-10-18 16:50:25', '2026-11-17 15:50:25', '2026-10-18 15:50:25', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '41.77.17.171');
INSERT INTO `aem_auth_tokens` (`aem_id_token`, `aem_id_user`, `token`, `refresh_token`, `expires_at`, `refresh_expires_at`, `created_at`, `is_revoked`, `user_agent`, `ip_address`) VALUES
(426, 147, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzQ1NDQ5LCJleHAiOjE3OTIzNDkwNDksInVzZXJfaWQiOjE0NywianRpIjoiODE0NWJlZTY0NmRjZWRhNmFlYjA2MWQwOTkzM2QzMDUifQ.2UHptsRWXrW9HVtLo5zr6o4vj_2YX06qr7PXcWXw2ko', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzQ1NDQ5LCJleHAiOjE3OTQ5Mzc0NDksInVzZXJfaWQiOjE0NywidHlwZSI6InJlZnJlc2giLCJqdGkiOiIzOGUwMTY2MWJmODA2MDUyMjY2MjYzYjZjODI0OTZiMSJ9.nxJcN9-BdN6x0IopOQpDomjBld-Zt8oU8xfG-CJOWw4', '2026-10-18 18:44:09', '2026-11-17 17:44:09', '2026-10-18 17:44:09', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '102.18.162.219'),
(427, 148, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzQ2NzUwLCJleHAiOjE3OTIzNTAzNTAsInVzZXJfaWQiOjE0OCwianRpIjoiZTk3OWMxYzE5MzgzN2MyMTc1NzBlNmM3MDQzZGM3OTgifQ.ESXlc--RdBYrr2r_lYs7ebx6jq5EUzHSGKdOOmqDkWw', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzQ2NzUwLCJleHAiOjE3OTQ5Mzg3NTAsInVzZXJfaWQiOjE0OCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiI2NmE0ZjA0N2Y3NDVmMWU1ZTRhMzBjZDc1NjY5N2QwMCJ9.8VCYfFXHUVpahh517XOYq6GOndjtioSUquEWEXYv4qM', '2026-10-18 19:05:50', '2026-11-17 18:05:50', '2026-10-18 18:05:50', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36', '102.17.119.235'),
(428, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzgyMTk0LCJleHAiOjE3OTIzODU3OTQsInVzZXJfaWQiOjE1LCJqdGkiOiIwN2E0YjA5OWJiYjgzNGViZTY1ODZhMGYzYWQ2Zjk3OCJ9.-paP2DUZB01Egwqcc8t8aEOsQdsaWKgqgd7WK1aSN3I', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzgyMTk0LCJleHAiOjE3OTQ5NzQxOTQsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjMwZTdlNGRmNjIxOGYwODY1MWY5NDkxMjZhZGZiZDMxIn0.VWpdgvSkTprcLw4hmCnEfb66Pqust5NiHsPeCyFz7-M', '2026-10-19 04:56:34', '2026-11-18 03:56:34', '2026-10-19 03:56:34', 0, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '41.74.213.54'),
(429, 15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzkxNjQ2LCJleHAiOjE3OTIzOTUyNDYsInVzZXJfaWQiOjE1LCJqdGkiOiIyNzJjOTNmNWNjZjA0MTVhNGZjNGM0ZDI3MWNjMDIyMiJ9.LYH6JEF_OFA0s7spjmdNqagdrtBb2s6NztEvkbrfeXQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzkxNjQ2LCJleHAiOjE3OTQ5ODM2NDYsInVzZXJfaWQiOjE1LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6ImNjYzQyM2IwZGU0MzRkOTRmZjA5ZDE5MGI4NzU4ZDJjIn0.GjHuKHtS2aq02E6ZOlRjca5PgHoB1MBRicM2KCeNivM', '2026-10-19 07:34:06', '2026-11-18 06:34:06', '2026-10-19 06:34:06', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0', '41.74.213.54'),
(430, 34, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzkyMjcwLCJleHAiOjE3OTIzOTU4NzAsInVzZXJfaWQiOjM0LCJqdGkiOiIyZGZlNTIyYTBkMWE5YWM0ZDBkYmY1Nzg5YjNhNGY3MCJ9.611hZ5npZgAMV0AVqxSSwGOzKV2LaqiJbLOqpGhrEOA', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzkyMjcwLCJleHAiOjE3OTQ5ODQyNzAsInVzZXJfaWQiOjM0LCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6IjVhYTQ4OGYwZjg3ODQzZDgwYWU0MDJiYWM2ZjE0YWRjIn0.mRl0xh1MAmOH_8ctQ7W94frU3kHKiFKRmCzLmCnln4Q', '2026-10-19 07:44:30', '2026-11-18 06:44:30', '2026-10-19 06:44:30', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '153.67.85.148'),
(431, 82, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzk0NDQ4LCJleHAiOjE3OTIzOTgwNDgsInVzZXJfaWQiOjgyLCJqdGkiOiI1MDM1ZDRhZjU3MzBjYjZjNDUyYTUzZjRiODcyM2ZlNSJ9.OBxuoweHfri-xPoa0Y1-hjzHAExk_s6dlmfMjJCOKTI', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hc3NvY2lhdGlvbi1lbnRyYWlkZS1tYWRhZ2FzY2FyLm1nLyIsImF1ZCI6Imh0dHBzOi8vd3d3LmFzc29jaWF0aW9uLWVudHJhaWRlLW1hZGFnYXNjYXIubWcvIiwiaWF0IjoxNzkyMzk0NDQ4LCJleHAiOjE3OTQ5ODY0NDgsInVzZXJfaWQiOjgyLCJ0eXBlIjoicmVmcmVzaCIsImp0aSI6Ijk1NmM2YjFlMzRkMTk2MGMzMjNmZjFjYWZiOTEwODg3In0.vm5Yc_rimEIh23NXRk1hoGqPY292lPfnjkNyR4jgrAU', '2026-10-19 08:20:48', '2026-11-18 07:20:48', '2026-10-19 07:20:48', 0, 'Mozilla/5.0 (Linux; Android 11; TECNO LE6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.98 Mobile Safari/537.36', '197.158.119.141'),
(432, 164, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L2Fzc29jaWF0aW9uL3B1YmxpY19odG1sLyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3QvYXNzb2NpYXRpb24vcHVibGljX2h0bWwvIiwiaWF0IjoxNzkyMzk5MDQzLCJleHAiOjE3OTI0MDI2NDMsInVzZXJfaWQiOjE2NCwianRpIjoiYjU3MGNhZDEyMTdmMjZkOWEzYWY4YjY4YzYyY2E5NDcifQ.MnH7uh4EZOrQcNTS0_iU8Wx-0-34P4Cfn_QVk_zp8TE', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L2Fzc29jaWF0aW9uL3B1YmxpY19odG1sLyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3QvYXNzb2NpYXRpb24vcHVibGljX2h0bWwvIiwiaWF0IjoxNzkyMzk5MDQzLCJleHAiOjE3OTQ5OTEwNDMsInVzZXJfaWQiOjE2NCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiIwODVkY2E0YTVhZDAwYzdkZDQ2OGU3NTJmMjA4M2UwNSJ9.4zEswLkHZ-zyycyhNSWbSZCA9VcYioMjr5msnc3mnD0', '2026-10-19 09:37:23', '2026-11-18 08:37:23', '2026-10-19 08:37:23', 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '::1'),
(433, 164, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L2Fzc29jaWF0aW9uL3B1YmxpY19odG1sLyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3QvYXNzb2NpYXRpb24vcHVibGljX2h0bWwvIiwiaWF0IjoxNzkyNDc2NTgzLCJleHAiOjE3OTI0ODAxODMsInVzZXJfaWQiOjE2NCwianRpIjoiYTM0Zjg1MTJjZGNhMzNkYjdkN2RlYWE4ZDYyMzEzMTkifQ.rpOQHn-EXDP9Etb_Xu-uqlOaXNHVeD0nxX0cfYhyw2k', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L2Fzc29jaWF0aW9uL3B1YmxpY19odG1sLyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3QvYXNzb2NpYXRpb24vcHVibGljX2h0bWwvIiwiaWF0IjoxNzkyNDc2NTgzLCJleHAiOjE3OTUwNjg1ODMsInVzZXJfaWQiOjE2NCwidHlwZSI6InJlZnJlc2giLCJqdGkiOiJlYTg0ZDM1MzMwNGNlMjM2NjY1ZGM4MjkzYWM4MTM0NiJ9.p4TUh3mLeVY0YgSPsyhYRu63YqJyBzf8Z26M8sikXaA', '2026-10-20 07:09:43', '2026-11-19 06:09:43', '2026-10-20 06:09:43', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '::1');

-- --------------------------------------------------------

--
-- Structure de la table `aem_comment`
--

CREATE TABLE `aem_comment` (
  `aem_id_comment` int(11) NOT NULL,
  `aem_id_publication` int(11) NOT NULL,
  `aem_id_user` int(11) NOT NULL,
  `aem_comment_text` text NOT NULL,
  `aem_comment_date` datetime NOT NULL DEFAULT current_timestamp(),
  `aem_parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_comment`
--

INSERT INTO `aem_comment` (`aem_id_comment`, `aem_id_publication`, `aem_id_user`, `aem_comment_text`, `aem_comment_date`, `aem_parent_id`) VALUES
(8, 13, 88, 'Bonjour, sao dia tokony atao mis à jour tsara io resaka cotisation io fa misangojy bé mihitsy.', '2026-07-01 10:37:23', NULL),
(9, 15, 51, 'Mankasitraka indrindra aminy fampafantarana', '2026-07-01 11:51:33', NULL),
(10, 13, 66, 'Efa manao azy miandalana.', '2026-07-01 11:53:33', NULL),
(11, 13, 15, '@Hermann Tefaka Davidson Efa miandalana ny fanaovana à jours an\'iny', '2026-07-01 19:08:49', 8),
(12, 13, 30, 'salama tompoko raha sanatria hadino moa izany ny mot de passe an itysite ity dia inona no azo atao?@RAZAFIMANDIMBY Josoa', '2026-07-04 17:07:53', NULL),
(13, 13, 15, '@lovasoa Emmanuel Salama ,afaka ataonao mot de passe oublié', '2026-07-05 15:59:22', 12),
(14, 16, 142, 'Salama, te ahafantatra misy misy kokoa mikasika anilay fifanampiana ara-pitadiavana aho, aiza Kay no ahitana ireo business ireo ato ?', '2026-07-28 11:17:35', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `aem_contribution`
--

CREATE TABLE `aem_contribution` (
  `aem_id_contribution` int(11) NOT NULL,
  `aem_id_user` int(11) NOT NULL,
  `aem_value` decimal(10,2) NOT NULL,
  `aem_contribution_price` int(11) DEFAULT 0,
  `aem_valid` tinyint(1) DEFAULT 0,
  `aem_month` int(11) NOT NULL,
  `aem_year` int(11) NOT NULL,
  `aem_date` date DEFAULT curdate(),
  `aem_recorded_by` int(11) DEFAULT NULL,
  `aem_id_account` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_contribution`
--

INSERT INTO `aem_contribution` (`aem_id_contribution`, `aem_id_user`, `aem_value`, `aem_contribution_price`, `aem_valid`, `aem_month`, `aem_year`, `aem_date`, `aem_recorded_by`, `aem_id_account`) VALUES
(16, 15, 2000.00, 2000, 1, 2, 2026, '2026-02-03', NULL, 1),
(17, 56, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(18, 55, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(19, 54, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(20, 53, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(21, 52, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(22, 51, 2000.00, 2000, 1, 3, 2025, '2026-02-04', NULL, 1),
(23, 50, 2000.00, 2000, 1, 9, 2025, '2026-02-04', NULL, 1),
(24, 49, 2000.00, 2000, 1, 8, 2025, '2026-02-04', NULL, 1),
(25, 48, 2000.00, 2000, 1, 9, 2025, '2026-02-04', NULL, 1),
(26, 47, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(27, 46, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(28, 45, 2000.00, 2000, 1, 12, 2025, '2026-02-04', NULL, 1),
(29, 44, 2000.00, 2000, 1, 1, 2025, '2026-02-04', NULL, 1),
(30, 43, 2000.00, 2000, 1, 9, 2025, '2026-02-04', NULL, 1),
(31, 42, 2000.00, 2000, 1, 2, 2025, '2026-02-04', NULL, 1),
(32, 41, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(33, 40, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(34, 39, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(35, 38, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(36, 37, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(37, 36, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(38, 35, 2000.00, 2000, 1, 1, 2025, '2026-02-04', NULL, 1),
(39, 34, 2000.00, 2000, 1, 9, 2025, '2026-02-04', NULL, 1),
(40, 33, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(41, 32, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(42, 31, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(43, 30, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(44, 29, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(45, 28, 2000.00, 2000, 1, 4, 2025, '2026-02-04', NULL, 1),
(46, 27, 2000.00, 2000, 1, 9, 2025, '2026-02-04', NULL, 1),
(47, 26, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(48, 25, 2000.00, 2000, 1, 1, 2025, '2026-02-04', NULL, 1),
(49, 24, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(50, 23, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(51, 22, 2000.00, 2000, 1, 1, 2025, '2026-02-04', NULL, 1),
(52, 21, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(53, 20, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(54, 19, 2000.00, 2000, 1, 12, 2025, '2026-02-04', NULL, 1),
(55, 18, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(56, 17, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(57, 16, 2000.00, 2000, 1, 1, 2026, '2026-02-04', NULL, 1),
(58, 57, 2000.00, 2000, 1, 12, 2024, '2026-02-04', NULL, 1),
(59, 58, 2000.00, 2000, 1, 2, 2026, '2026-02-08', NULL, 1),
(60, 68, 2000.00, 2000, 1, 2, 2026, '2026-02-09', NULL, 1),
(61, 67, 2000.00, 2000, 1, 2, 2026, '2026-02-09', NULL, 1),
(62, 66, 2000.00, 2000, 1, 12, 2025, '2026-02-09', NULL, 1),
(63, 65, 2000.00, 2000, 1, 2, 2026, '2026-02-09', NULL, 1),
(64, 65, 2000.00, 2000, 1, 3, 2026, '2026-02-09', NULL, 1),
(65, 64, 2000.00, 2000, 1, 1, 2026, '2026-02-09', NULL, 1),
(66, 63, 2000.00, 2000, 1, 1, 2026, '2026-02-09', NULL, 1),
(67, 62, 2000.00, 2000, 1, 1, 2026, '2026-02-09', NULL, 1),
(68, 61, 2000.00, 2000, 1, 1, 2026, '2026-02-09', NULL, 1),
(69, 60, 2000.00, 2000, 1, 1, 2026, '2026-02-09', NULL, 1),
(70, 59, 2000.00, 2000, 1, 3, 2025, '2026-02-09', NULL, 1),
(79, 84, 2000.00, 2000, 1, 2, 2026, '2026-02-15', NULL, 1),
(80, 77, 2000.00, 2000, 1, 2, 2026, '2026-02-15', NULL, 1),
(81, 78, 2000.00, 2000, 1, 2, 2026, '2026-02-15', NULL, 1),
(82, 88, 2000.00, 2000, 1, 4, 2024, '2026-02-15', NULL, 1),
(83, 92, 2000.00, 2000, 1, 12, 2025, '2026-02-15', NULL, 1),
(84, 91, 2000.00, 2000, 1, 1, 2026, '2026-02-15', NULL, 1),
(85, 90, 2000.00, 2000, 1, 2, 2026, '2026-02-15', NULL, 1),
(86, 89, 2000.00, 2000, 1, 1, 2026, '2026-02-15', NULL, 1),
(87, 87, 2000.00, 2000, 1, 2, 2026, '2026-02-15', NULL, 1),
(88, 86, 2000.00, 2000, 1, 10, 2025, '2026-02-15', NULL, 1),
(89, 83, 2000.00, 2000, 1, 2, 2026, '2026-02-15', NULL, 1),
(90, 82, 2000.00, 2000, 1, 12, 2024, '2026-02-15', NULL, 1),
(91, 81, 2000.00, 2000, 1, 2, 2026, '2026-02-15', NULL, 1),
(92, 80, 2000.00, 2000, 1, 2, 2026, '2026-02-15', NULL, 1),
(93, 79, 2000.00, 2000, 1, 12, 2024, '2026-02-15', NULL, 1),
(94, 76, 2000.00, 2000, 1, 2, 2026, '2026-02-15', NULL, 1),
(95, 75, 2000.00, 2000, 1, 12, 2024, '2026-02-15', NULL, 1),
(96, 74, 2000.00, 2000, 1, 2, 2026, '2026-02-15', NULL, 1),
(97, 73, 2000.00, 2000, 1, 12, 2024, '2026-02-15', NULL, 1),
(98, 93, 2000.00, 2000, 1, 2, 2026, '2026-02-16', NULL, 1),
(99, 94, 2000.00, 2000, 1, 12, 2024, '2026-02-19', NULL, 1),
(100, 95, 2000.00, 2000, 1, 1, 2026, '2026-02-21', NULL, 1),
(101, 98, 2000.00, 2000, 1, 2, 2026, '2026-02-21', NULL, 1),
(102, 97, 2000.00, 2000, 1, 2, 2026, '2026-02-21', NULL, 1),
(103, 96, 2000.00, 2000, 1, 2, 2026, '2026-02-21', NULL, 1),
(104, 99, 2000.00, 2000, 1, 2, 2026, '2026-02-22', NULL, 1),
(105, 29, 2000.00, 2000, 1, 2, 2026, '2026-02-23', NULL, 1),
(106, 29, 2000.00, 2000, 1, 3, 2026, '2026-02-23', NULL, 1),
(107, 29, 2000.00, 2000, 1, 4, 2026, '2026-02-23', NULL, 1),
(108, 29, 2000.00, 2000, 1, 5, 2026, '2026-02-23', NULL, 1),
(109, 48, 2000.00, 2000, 1, 10, 2025, '2026-02-23', NULL, 1),
(110, 48, 2000.00, 2000, 1, 11, 2025, '2026-02-23', NULL, 1),
(111, 48, 2000.00, 2000, 1, 12, 2025, '2026-02-23', NULL, 1),
(112, 48, 2000.00, 2000, 1, 1, 2026, '2026-02-23', NULL, 1),
(113, 48, 2000.00, 2000, 1, 2, 2026, '2026-02-23', NULL, 1),
(114, 48, 2000.00, 2000, 1, 3, 2026, '2026-02-23', NULL, 1),
(115, 48, 2000.00, 2000, 1, 4, 2026, '2026-02-23', NULL, 1),
(116, 48, 2000.00, 2000, 1, 5, 2026, '2026-02-23', NULL, 1),
(117, 48, 2000.00, 2000, 1, 6, 2026, '2026-02-23', NULL, 1),
(118, 48, 2000.00, 2000, 1, 7, 2026, '2026-02-23', NULL, 1),
(119, 66, 2000.00, 2000, 1, 1, 2026, '2026-02-23', NULL, 1),
(120, 66, 2000.00, 2000, 1, 2, 2026, '2026-02-23', NULL, 1),
(121, 66, 2000.00, 2000, 1, 3, 2026, '2026-02-23', NULL, 1),
(122, 66, 2000.00, 2000, 1, 4, 2026, '2026-02-23', NULL, 1),
(123, 66, 2000.00, 2000, 1, 5, 2026, '2026-02-23', NULL, 1),
(124, 92, 2000.00, 2000, 1, 1, 2026, '2026-02-23', NULL, 1),
(125, 92, 2000.00, 2000, 1, 2, 2026, '2026-02-23', NULL, 1),
(126, 92, 2000.00, 2000, 1, 3, 2026, '2026-02-23', NULL, 1),
(127, 92, 2000.00, 2000, 1, 4, 2026, '2026-02-23', NULL, 1),
(128, 92, 2000.00, 2000, 1, 5, 2026, '2026-02-23', NULL, 1),
(129, 92, 2000.00, 2000, 1, 6, 2026, '2026-02-23', NULL, 1),
(130, 76, 2000.00, 2000, 1, 3, 2026, '2026-02-23', NULL, 1),
(131, 76, 2000.00, 2000, 1, 4, 2026, '2026-02-23', NULL, 1),
(132, 76, 2000.00, 2000, 1, 5, 2026, '2026-02-23', NULL, 1),
(133, 76, 2000.00, 2000, 1, 6, 2026, '2026-02-23', NULL, 1),
(134, 76, 2000.00, 2000, 1, 7, 2026, '2026-02-23', NULL, 1),
(135, 76, 2000.00, 2000, 1, 8, 2026, '2026-02-23', NULL, 1),
(136, 76, 2000.00, 2000, 1, 9, 2026, '2026-02-23', NULL, 1),
(137, 76, 2000.00, 2000, 1, 10, 2026, '2026-02-23', NULL, 1),
(138, 76, 2000.00, 2000, 1, 11, 2026, '2026-02-23', NULL, 1),
(139, 76, 2000.00, 2000, 1, 12, 2026, '2026-02-23', NULL, 1),
(140, 28, 2000.00, 2000, 1, 5, 2025, '2026-02-23', NULL, 1),
(141, 28, 2000.00, 2000, 1, 6, 2025, '2026-02-23', NULL, 1),
(142, 28, 2000.00, 2000, 1, 7, 2025, '2026-02-23', NULL, 1),
(143, 28, 2000.00, 2000, 1, 8, 2025, '2026-02-23', NULL, 1),
(144, 28, 2000.00, 2000, 1, 9, 2025, '2026-02-23', NULL, 1),
(145, 28, 2000.00, 2000, 1, 10, 2025, '2026-02-23', NULL, 1),
(146, 28, 2000.00, 2000, 1, 11, 2025, '2026-02-23', NULL, 1),
(147, 28, 2000.00, 2000, 1, 12, 2025, '2026-02-23', NULL, 1),
(148, 28, 2000.00, 2000, 1, 1, 2026, '2026-02-23', NULL, 1),
(149, 28, 2000.00, 2000, 1, 2, 2026, '2026-02-23', NULL, 1),
(150, 28, 2000.00, 2000, 1, 3, 2026, '2026-02-23', NULL, 1),
(152, 47, 2000.00, 2000, 1, 2, 2026, '2026-02-23', NULL, 1),
(153, 47, 2000.00, 2000, 1, 3, 2026, '2026-02-23', NULL, 1),
(154, 57, 2000.00, 2000, 1, 1, 2025, '2026-02-23', NULL, 1),
(155, 57, 2000.00, 2000, 1, 2, 2025, '2026-02-23', NULL, 1),
(156, 57, 2000.00, 2000, 1, 3, 2025, '2026-02-23', NULL, 1),
(157, 57, 2000.00, 2000, 1, 4, 2025, '2026-02-23', NULL, 1),
(158, 57, 2000.00, 2000, 1, 5, 2025, '2026-02-23', NULL, 1),
(159, 57, 2000.00, 2000, 1, 6, 2025, '2026-02-23', NULL, 1),
(160, 57, 2000.00, 2000, 1, 7, 2025, '2026-02-23', NULL, 1),
(161, 57, 2000.00, 2000, 1, 8, 2025, '2026-02-23', NULL, 1),
(162, 57, 2000.00, 2000, 1, 9, 2025, '2026-02-23', NULL, 1),
(163, 84, 2000.00, 2000, 1, 3, 2026, '2026-02-23', NULL, 1),
(164, 84, 2000.00, 2000, 1, 4, 2026, '2026-02-23', NULL, 1),
(165, 84, 2000.00, 2000, 1, 5, 2026, '2026-02-23', NULL, 1),
(166, 84, 2000.00, 2000, 1, 6, 2026, '2026-02-23', NULL, 1),
(167, 84, 2000.00, 2000, 1, 7, 2026, '2026-02-23', NULL, 1),
(168, 84, 2000.00, 2000, 1, 8, 2026, '2026-02-23', NULL, 1),
(169, 84, 2000.00, 2000, 1, 9, 2026, '2026-02-23', NULL, 1),
(170, 84, 2000.00, 2000, 1, 10, 2026, '2026-02-23', NULL, 1),
(171, 84, 2000.00, 2000, 1, 11, 2026, '2026-02-23', NULL, 1),
(172, 84, 2000.00, 2000, 1, 12, 2026, '2026-02-23', NULL, 1),
(173, 34, 2000.00, 2000, 1, 10, 2025, '2026-02-23', NULL, 1),
(174, 34, 2000.00, 2000, 1, 11, 2025, '2026-02-23', NULL, 1),
(175, 34, 2000.00, 2000, 1, 12, 2025, '2026-02-23', NULL, 1),
(176, 34, 2000.00, 2000, 1, 1, 2026, '2026-02-23', NULL, 1),
(177, 34, 2000.00, 2000, 1, 2, 2026, '2026-02-23', NULL, 1),
(178, 34, 2000.00, 2000, 1, 3, 2026, '2026-02-23', NULL, 1),
(179, 34, 2000.00, 2000, 1, 4, 2026, '2026-02-23', NULL, 1),
(180, 34, 2000.00, 2000, 1, 5, 2026, '2026-02-23', NULL, 1),
(181, 34, 2000.00, 2000, 1, 6, 2026, '2026-02-23', NULL, 1),
(182, 34, 2000.00, 2000, 1, 7, 2026, '2026-02-23', NULL, 1),
(183, 34, 2000.00, 2000, 1, 8, 2026, '2026-02-23', NULL, 1),
(184, 34, 2000.00, 2000, 1, 9, 2026, '2026-02-23', NULL, 1),
(185, 34, 2000.00, 2000, 1, 10, 2026, '2026-02-23', NULL, 1),
(186, 34, 2000.00, 2000, 1, 11, 2026, '2026-02-23', NULL, 1),
(187, 34, 2000.00, 2000, 1, 12, 2026, '2026-02-23', NULL, 1),
(188, 100, 2000.00, 2000, 1, 2, 2026, '2026-02-26', NULL, 1),
(189, 48, 2000.00, 2000, 1, 8, 2026, '2026-02-26', NULL, 1),
(190, 48, 2000.00, 2000, 1, 9, 2026, '2026-02-26', NULL, 1),
(191, 48, 2000.00, 2000, 1, 10, 2026, '2026-02-26', NULL, 1),
(192, 48, 2000.00, 2000, 1, 11, 2026, '2026-02-26', NULL, 1),
(193, 48, 2000.00, 2000, 1, 12, 2026, '2026-02-26', NULL, 1),
(194, 44, 2000.00, 2000, 1, 2, 2025, '2026-02-26', NULL, 1),
(195, 44, 2000.00, 2000, 1, 3, 2025, '2026-02-26', NULL, 1),
(196, 44, 2000.00, 2000, 1, 4, 2025, '2026-02-26', NULL, 1),
(197, 44, 2000.00, 2000, 1, 5, 2025, '2026-02-26', NULL, 1),
(198, 44, 2000.00, 2000, 1, 6, 2025, '2026-02-26', NULL, 1),
(199, 59, 2000.00, 2000, 1, 4, 2025, '2026-02-26', NULL, 1),
(200, 59, 2000.00, 2000, 1, 5, 2025, '2026-02-26', NULL, 1),
(201, 59, 2000.00, 2000, 1, 6, 2025, '2026-02-26', NULL, 1),
(202, 59, 2000.00, 2000, 1, 7, 2025, '2026-02-26', NULL, 1),
(203, 59, 2000.00, 2000, 1, 8, 2025, '2026-02-26', NULL, 1),
(204, 59, 2000.00, 2000, 1, 9, 2025, '2026-02-26', NULL, 1),
(205, 59, 2000.00, 2000, 1, 10, 2025, '2026-02-26', NULL, 1),
(206, 59, 2000.00, 2000, 1, 11, 2025, '2026-02-26', NULL, 1),
(207, 59, 2000.00, 2000, 1, 12, 2025, '2026-02-26', NULL, 1),
(208, 59, 2000.00, 2000, 1, 1, 2026, '2026-02-26', NULL, 1),
(209, 59, 2000.00, 2000, 1, 2, 2026, '2026-02-26', NULL, 1),
(210, 59, 2000.00, 2000, 1, 3, 2026, '2026-02-26', NULL, 1),
(211, 59, 2000.00, 2000, 1, 4, 2026, '2026-02-26', NULL, 1),
(212, 59, 2000.00, 2000, 1, 5, 2026, '2026-02-26', NULL, 1),
(213, 59, 2000.00, 2000, 1, 6, 2026, '2026-02-26', NULL, 1),
(214, 59, 2000.00, 2000, 1, 7, 2026, '2026-02-26', NULL, 1),
(215, 59, 2000.00, 2000, 1, 8, 2026, '2026-02-26', NULL, 1),
(216, 59, 2000.00, 2000, 1, 9, 2026, '2026-02-26', NULL, 1),
(217, 59, 2000.00, 2000, 1, 10, 2026, '2026-02-26', NULL, 1),
(218, 59, 2000.00, 2000, 1, 11, 2026, '2026-02-26', NULL, 1),
(219, 59, 2000.00, 2000, 1, 12, 2026, '2026-02-26', NULL, 1),
(220, 24, 2000.00, 2000, 1, 2, 2026, '2026-02-26', NULL, 1),
(221, 24, 2000.00, 2000, 1, 3, 2026, '2026-02-26', NULL, 1),
(222, 24, 2000.00, 2000, 1, 4, 2026, '2026-02-26', NULL, 1),
(223, 24, 2000.00, 2000, 1, 5, 2026, '2026-02-26', NULL, 1),
(224, 24, 2000.00, 2000, 1, 6, 2026, '2026-02-26', NULL, 1),
(225, 24, 2000.00, 2000, 1, 7, 2026, '2026-02-26', NULL, 1),
(226, 24, 2000.00, 2000, 1, 8, 2026, '2026-02-26', NULL, 1),
(227, 24, 2000.00, 2000, 1, 9, 2026, '2026-02-26', NULL, 1),
(228, 24, 2000.00, 2000, 1, 10, 2026, '2026-02-26', NULL, 1),
(229, 24, 2000.00, 2000, 1, 11, 2026, '2026-02-26', NULL, 1),
(230, 24, 2000.00, 2000, 1, 12, 2026, '2026-02-26', NULL, 1),
(231, 101, 2000.00, 2000, 1, 2, 2026, '2026-02-27', NULL, 1),
(232, 27, 2000.00, 2000, 1, 10, 2025, '2026-02-27', NULL, 1),
(233, 27, 2000.00, 2000, 1, 11, 2025, '2026-02-27', NULL, 1),
(234, 27, 2000.00, 2000, 1, 12, 2025, '2026-02-27', NULL, 1),
(235, 27, 2000.00, 2000, 1, 1, 2026, '2026-02-27', NULL, 1),
(236, 27, 2000.00, 2000, 1, 2, 2026, '2026-02-27', NULL, 1),
(237, 27, 2000.00, 2000, 1, 3, 2026, '2026-02-27', NULL, 1),
(238, 27, 2000.00, 2000, 1, 4, 2026, '2026-02-27', NULL, 1),
(239, 27, 2000.00, 2000, 1, 5, 2026, '2026-02-27', NULL, 1),
(240, 27, 2000.00, 2000, 1, 6, 2026, '2026-02-27', NULL, 1),
(241, 27, 2000.00, 2000, 1, 7, 2026, '2026-02-27', NULL, 1),
(242, 27, 2000.00, 2000, 1, 8, 2026, '2026-02-27', NULL, 1),
(243, 27, 2000.00, 2000, 1, 9, 2026, '2026-02-27', NULL, 1),
(244, 27, 2000.00, 2000, 1, 10, 2026, '2026-02-27', NULL, 1),
(245, 27, 2000.00, 2000, 1, 11, 2026, '2026-02-27', NULL, 1),
(246, 27, 2000.00, 2000, 1, 12, 2026, '2026-02-27', NULL, 1),
(247, 79, 2000.00, 2000, 1, 1, 2025, '2026-02-27', NULL, 1),
(248, 79, 2000.00, 2000, 1, 2, 2025, '2026-02-27', NULL, 1),
(249, 79, 2000.00, 2000, 1, 3, 2025, '2026-02-27', NULL, 1),
(250, 79, 2000.00, 2000, 1, 4, 2025, '2026-02-27', NULL, 1),
(251, 79, 2000.00, 2000, 1, 5, 2025, '2026-02-27', NULL, 1),
(252, 79, 2000.00, 2000, 1, 6, 2025, '2026-02-27', NULL, 1),
(253, 40, 2000.00, 2000, 1, 2, 2026, '2026-03-01', NULL, 1),
(254, 102, 2000.00, 2000, 1, 2, 2026, '2026-03-01', NULL, 1),
(255, 26, 2000.00, 2000, 1, 2, 2026, '2026-03-01', NULL, 1),
(256, 26, 2000.00, 2000, 1, 3, 2026, '2026-03-01', NULL, 1),
(257, 26, 2000.00, 2000, 1, 4, 2026, '2026-03-01', NULL, 1),
(258, 26, 2000.00, 2000, 1, 5, 2026, '2026-03-01', NULL, 1),
(259, 26, 2000.00, 2000, 1, 6, 2026, '2026-03-01', NULL, 1),
(260, 26, 2000.00, 2000, 1, 7, 2026, '2026-03-01', NULL, 1),
(261, 26, 2000.00, 2000, 1, 8, 2026, '2026-03-01', NULL, 1),
(262, 26, 2000.00, 2000, 1, 9, 2026, '2026-03-01', NULL, 1),
(263, 26, 2000.00, 2000, 1, 10, 2026, '2026-03-01', NULL, 1),
(264, 26, 2000.00, 2000, 1, 11, 2026, '2026-03-01', NULL, 1),
(265, 26, 2000.00, 2000, 1, 12, 2026, '2026-03-01', NULL, 1),
(266, 103, 2000.00, 2000, 1, 3, 2026, '2026-03-03', NULL, 1),
(267, 104, 5000.00, 5000, 1, 3, 2026, '2026-03-03', NULL, 1),
(268, 105, 2000.00, 2000, 1, 3, 2026, '2026-03-03', NULL, 1),
(269, 67, 5000.00, 5000, 1, 3, 2026, '2026-03-04', NULL, 1),
(270, 67, 5000.00, 5000, 1, 4, 2026, '2026-03-04', NULL, 1),
(271, 67, 5000.00, 5000, 1, 5, 2026, '2026-03-04', NULL, 1),
(272, 67, 5000.00, 5000, 1, 6, 2026, '2026-03-04', NULL, 1),
(273, 67, 2000.00, 5000, 1, 7, 2026, '2026-03-04', NULL, 1),
(274, 106, 2000.00, 2000, 1, 9, 2025, '2026-03-07', NULL, 1),
(275, 106, 2000.00, 2000, 1, 10, 2025, '2026-03-07', NULL, 1),
(276, 106, 2000.00, 2000, 1, 11, 2025, '2026-03-07', NULL, 1),
(277, 106, 2000.00, 2000, 1, 12, 2025, '2026-03-07', NULL, 1),
(278, 106, 2000.00, 2000, 1, 1, 2026, '2026-03-07', NULL, 1),
(279, 106, 2000.00, 2000, 1, 2, 2026, '2026-03-07', NULL, 1),
(280, 106, 5000.00, 5000, 1, 3, 2026, '2026-03-07', NULL, 1),
(281, 106, 5000.00, 5000, 1, 4, 2026, '2026-03-07', NULL, 1),
(282, 106, 5000.00, 5000, 1, 5, 2026, '2026-03-07', NULL, 1),
(283, 106, 5000.00, 5000, 1, 6, 2026, '2026-03-07', NULL, 1),
(284, 106, 5000.00, 5000, 1, 7, 2026, '2026-03-07', NULL, 1),
(285, 106, 5000.00, 5000, 1, 8, 2026, '2026-03-07', NULL, 1),
(286, 106, 5000.00, 5000, 1, 9, 2026, '2026-03-07', NULL, 1),
(287, 106, 5000.00, 5000, 1, 10, 2026, '2026-03-07', NULL, 1),
(288, 106, 1300.00, 5000, 1, 11, 2026, '2026-03-07', NULL, 1),
(289, 107, 5000.00, 5000, 1, 3, 2026, '2026-03-07', NULL, 1),
(290, 29, 5000.00, 5000, 1, 6, 2026, '2026-03-07', NULL, 1),
(291, 29, 5000.00, 5000, 1, 7, 2026, '2026-03-07', NULL, 1),
(292, 108, 5000.00, 5000, 1, 3, 2026, '2026-03-11', NULL, 1),
(293, 109, 2000.00, 2000, 1, 9, 2025, '2026-03-17', NULL, 1),
(294, 110, 2000.00, 2000, 1, 10, 2025, '2026-03-17', NULL, 1),
(295, 110, 2000.00, 2000, 1, 11, 2025, '2026-03-17', NULL, 1),
(296, 110, 2000.00, 2000, 1, 12, 2025, '2026-03-17', NULL, 1),
(297, 110, 2000.00, 2000, 1, 1, 2026, '2026-03-17', NULL, 1),
(298, 110, 2000.00, 2000, 1, 2, 2026, '2026-03-17', NULL, 1),
(299, 110, 2000.00, 2000, 1, 3, 2026, '2026-03-17', NULL, 1),
(300, 110, 2000.00, 2000, 1, 4, 2026, '2026-03-17', NULL, 1),
(301, 110, 2000.00, 2000, 1, 5, 2026, '2026-03-17', NULL, 1),
(302, 110, 2000.00, 2000, 1, 6, 2026, '2026-03-17', NULL, 1),
(303, 110, 2000.00, 2000, 1, 7, 2026, '2026-03-17', NULL, 1),
(304, 110, 2000.00, 2000, 1, 8, 2026, '2026-03-17', NULL, 1),
(305, 110, 2000.00, 2000, 1, 9, 2026, '2026-03-17', NULL, 1),
(306, 110, 2000.00, 2000, 1, 10, 2026, '2026-03-17', NULL, 1),
(307, 110, 2000.00, 2000, 1, 11, 2026, '2026-03-17', NULL, 1),
(308, 110, 2000.00, 2000, 1, 12, 2026, '2026-03-17', NULL, 1),
(309, 114, 5000.00, 5000, 1, 6, 2026, '2026-06-23', NULL, NULL),
(310, 111, 5000.00, 5000, 1, 3, 2026, '2026-06-23', NULL, NULL),
(311, 113, 5000.00, 5000, 1, 6, 2026, '2026-06-23', NULL, NULL),
(312, 116, 5000.00, 5000, 1, 6, 2026, '2026-06-23', NULL, NULL),
(313, 115, 5000.00, 5000, 1, 6, 2026, '2026-06-23', NULL, NULL),
(314, 112, 5000.00, 5000, 1, 3, 2026, '2026-06-23', NULL, NULL),
(315, 51, 5000.00, 5000, 1, 4, 2025, '2026-07-01', 66, 1),
(316, 51, 5000.00, 5000, 1, 5, 2025, '2026-07-01', 66, 1),
(317, 51, 5000.00, 5000, 1, 6, 2025, '2026-07-01', 66, 1),
(318, 51, 5000.00, 5000, 1, 7, 2025, '2026-07-01', 66, 1),
(319, 51, 5000.00, 5000, 1, 8, 2025, '2026-07-01', 66, 1),
(320, 51, 5000.00, 5000, 1, 9, 2025, '2026-07-01', 66, 1),
(321, 51, 5000.00, 5000, 1, 10, 2025, '2026-07-01', 66, 1),
(322, 51, 5000.00, 5000, 1, 11, 2025, '2026-07-01', 66, 1),
(323, 51, 5000.00, 5000, 1, 12, 2025, '2026-07-01', 66, 1),
(324, 51, 5000.00, 5000, 1, 1, 2026, '2026-07-01', 66, 1),
(325, 51, 5000.00, 5000, 1, 2, 2026, '2026-07-01', 66, 1),
(326, 51, 5000.00, 5000, 1, 3, 2026, '2026-07-01', 66, 1),
(327, 51, 5000.00, 5000, 1, 4, 2026, '2026-07-01', 66, 1),
(328, 51, 5000.00, 5000, 1, 5, 2026, '2026-07-01', 66, 1),
(329, 51, 5000.00, 5000, 1, 6, 2026, '2026-07-01', 66, 1),
(330, 51, 5000.00, 5000, 1, 7, 2026, '2026-07-01', 66, 1),
(331, 51, 5000.00, 5000, 1, 8, 2026, '2026-07-01', 66, 1),
(332, 51, 5000.00, 5000, 1, 9, 2026, '2026-07-01', 66, 1),
(333, 51, 5000.00, 5000, 1, 10, 2026, '2026-07-01', 66, 1),
(334, 51, 5000.00, 5000, 1, 11, 2026, '2026-07-01', 66, 1),
(335, 51, 5000.00, 5000, 1, 12, 2026, '2026-07-01', 66, 1),
(336, 117, 5000.00, 5000, 1, 7, 2026, '2026-07-01', NULL, NULL),
(337, 118, 5000.00, 5000, 1, 7, 2026, '2026-07-01', NULL, NULL),
(338, 119, 5000.00, 5000, 1, 6, 2026, '2026-07-01', NULL, NULL),
(339, 121, 5000.00, 5000, 1, 7, 2026, '2026-07-01', NULL, NULL),
(340, 120, 5000.00, 5000, 1, 7, 2026, '2026-07-01', NULL, NULL),
(341, 123, 5000.00, 5000, 1, 7, 2026, '2026-07-01', NULL, NULL),
(342, 122, 5000.00, 5000, 1, 7, 2026, '2026-07-01', NULL, NULL),
(343, 124, 5000.00, 5000, 1, 7, 2026, '2026-07-01', NULL, NULL),
(344, 125, 5000.00, 5000, 1, 7, 2026, '2026-07-02', NULL, NULL),
(345, 126, 5000.00, 5000, 1, 7, 2026, '2026-07-02', NULL, NULL),
(346, 107, 5000.00, 5000, 1, 4, 2026, '2026-07-02', 15, 1),
(347, 107, 5000.00, 5000, 1, 5, 2026, '2026-07-02', 15, 1),
(348, 127, 5000.00, 5000, 1, 7, 2026, '2026-07-02', NULL, NULL),
(349, 128, 5000.00, 5000, 1, 7, 2026, '2026-07-02', NULL, NULL),
(350, 20, 5000.00, 5000, 1, 2, 2026, '2026-07-02', 66, 1),
(351, 20, 5000.00, 5000, 1, 3, 2026, '2026-07-02', 66, 1),
(352, 20, 5000.00, 5000, 1, 4, 2026, '2026-07-02', 66, 1),
(353, 40, 5000.00, 5000, 1, 3, 2026, '2026-06-04', 66, 1),
(354, 40, 5000.00, 5000, 1, 4, 2026, '2026-06-04', 66, 1),
(355, 99, 5000.00, 5000, 1, 3, 2026, '2026-03-02', 66, 1),
(356, 129, 5000.00, 5000, 1, 7, 2026, '2026-07-02', NULL, NULL),
(357, 98, 5000.00, 5000, 1, 3, 2026, '2026-07-02', 15, 1),
(358, 98, 5000.00, 5000, 1, 4, 2026, '2026-07-02', 15, 1),
(359, 131, 5000.00, 5000, 1, 7, 2026, '2026-07-05', NULL, NULL),
(360, 133, 5000.00, 5000, 1, 7, 2026, '2026-07-06', NULL, NULL),
(361, 132, 5000.00, 5000, 1, 7, 2026, '2026-07-06', NULL, NULL),
(362, 134, 5000.00, 5000, 1, 7, 2026, '2026-07-07', NULL, NULL),
(363, 88, 2000.00, 2000, 1, 5, 2024, '2025-07-09', 15, 1),
(364, 88, 2000.00, 2000, 1, 6, 2024, '2025-07-09', 15, 1),
(365, 88, 2000.00, 2000, 1, 7, 2024, '2025-07-09', 15, 1),
(366, 88, 2000.00, 2000, 1, 8, 2024, '2025-07-09', 15, 1),
(367, 88, 2000.00, 2000, 1, 9, 2024, '2025-07-09', 15, 1),
(368, 88, 2000.00, 2000, 1, 10, 2024, '2025-07-09', 15, 1),
(369, 88, 2000.00, 2000, 1, 11, 2024, '2025-07-09', 15, 1),
(370, 88, 2000.00, 2000, 1, 12, 2024, '2025-07-09', 15, 1),
(371, 88, 2000.00, 2000, 1, 1, 2025, '2025-07-09', 15, 1),
(372, 88, 2000.00, 2000, 1, 2, 2025, '2025-07-09', 15, 1),
(373, 88, 2000.00, 2000, 1, 3, 2025, '2025-07-09', 15, 1),
(374, 88, 2000.00, 2000, 1, 4, 2025, '2025-07-09', 15, 1),
(375, 88, 2000.00, 2000, 1, 5, 2025, '2025-07-09', 15, 1),
(376, 88, 2000.00, 2000, 1, 6, 2025, '2025-07-09', 15, 1),
(377, 88, 2000.00, 2000, 1, 7, 2025, '2025-07-09', 15, 1),
(378, 88, 2000.00, 2000, 1, 8, 2025, '2025-07-09', 15, 1),
(379, 88, 2000.00, 2000, 1, 9, 2025, '2025-07-09', 15, 1),
(380, 88, 2000.00, 2000, 1, 10, 2025, '2025-07-09', 15, 1),
(381, 88, 2000.00, 2000, 1, 11, 2025, '2025-07-09', 15, 1),
(382, 88, 2000.00, 2000, 1, 12, 2025, '2025-07-09', 15, 1),
(383, 88, 2000.00, 2000, 1, 1, 2026, '2025-07-09', 15, 1),
(384, 88, 2000.00, 2000, 1, 2, 2026, '2025-07-09', 15, 1),
(385, 88, 2000.00, 2000, 1, 3, 2026, '2025-07-09', 15, 1),
(386, 88, 2000.00, 2000, 1, 4, 2026, '2025-07-09', 15, 1),
(387, 88, 2000.00, 2000, 1, 5, 2026, '2025-07-09', 15, 1),
(388, 88, 2000.00, 2000, 1, 6, 2026, '2025-07-09', 15, 1),
(389, 88, 2000.00, 2000, 1, 7, 2026, '2025-07-09', 15, 1),
(390, 88, 2000.00, 2000, 1, 8, 2026, '2025-07-09', 15, 1),
(391, 88, 2000.00, 2000, 1, 9, 2026, '2025-07-09', 15, 1),
(392, 88, 2000.00, 2000, 1, 10, 2026, '2025-07-09', 15, 1),
(393, 88, 2000.00, 2000, 1, 11, 2026, '2025-07-09', 15, 1),
(394, 88, 2000.00, 2000, 1, 12, 2026, '2025-07-09', 15, 1),
(395, 135, 5000.00, 5000, 0, 7, 2026, '2026-07-09', NULL, NULL),
(396, 136, 5000.00, 5000, 0, 7, 2026, '2026-07-09', NULL, NULL),
(397, 37, 2000.00, 2000, 0, 2, 2026, '2025-07-09', 15, 1),
(398, 37, 2000.00, 2000, 0, 3, 2026, '2025-07-09', 15, 1),
(399, 37, 2000.00, 2000, 0, 4, 2026, '2025-07-09', 15, 1),
(400, 37, 2000.00, 2000, 0, 5, 2026, '2025-07-09', 15, 1),
(401, 37, 2000.00, 2000, 0, 6, 2026, '2025-07-09', 15, 1),
(402, 37, 2000.00, 2000, 0, 7, 2026, '2025-07-09', 15, 1),
(403, 37, 2000.00, 2000, 0, 8, 2026, '2025-07-09', 15, 1),
(404, 37, 2000.00, 2000, 0, 9, 2026, '2025-07-09', 15, 1),
(405, 37, 2000.00, 2000, 0, 10, 2026, '2025-07-09', 15, 1),
(406, 37, 2000.00, 2000, 0, 11, 2026, '2025-07-09', 15, 1),
(407, 37, 2000.00, 2000, 0, 12, 2026, '2025-07-09', 15, 1),
(408, 137, 5000.00, 5000, 0, 7, 2026, '2026-07-10', NULL, NULL),
(409, 40, 5000.00, 5000, 0, 5, 2026, '2026-07-11', 66, 2),
(410, 40, 5000.00, 5000, 0, 6, 2026, '2026-07-11', 66, 2),
(411, 40, 5000.00, 5000, 0, 7, 2026, '2026-07-11', 66, 2),
(412, 138, 5000.00, 5000, 0, 7, 2026, '2026-07-11', NULL, NULL),
(413, 139, 5000.00, 5000, 0, 7, 2026, '2026-07-16', NULL, NULL),
(414, 140, 5000.00, 5000, 0, 7, 2026, '2026-07-17', NULL, NULL),
(415, 141, 5000.00, 5000, 0, 7, 2026, '2026-07-27', NULL, NULL),
(416, 142, 5000.00, 5000, 0, 7, 2026, '2026-07-28', NULL, NULL),
(417, 143, 5000.00, 5000, 0, 7, 2026, '2026-07-30', NULL, NULL),
(418, 20, 5000.00, 5000, 0, 5, 2026, '2026-08-03', 66, 2),
(419, 20, 5000.00, 5000, 0, 6, 2026, '2026-08-03', 66, 2),
(420, 20, 5000.00, 5000, 0, 7, 2026, '2026-08-03', 66, 2),
(421, 20, 5000.00, 5000, 0, 8, 2026, '2026-08-03', 66, 2),
(422, 29, 5000.00, 5000, 0, 8, 2026, '2026-08-06', 66, 2),
(423, 29, 5000.00, 5000, 0, 9, 2026, '2026-08-06', 66, 2),
(424, 29, 5000.00, 5000, 0, 10, 2026, '2026-08-06', 66, 2),
(425, 29, 5000.00, 5000, 0, 11, 2026, '2026-08-06', 66, 2),
(426, 29, 5000.00, 5000, 0, 12, 2026, '2026-08-06', 66, 2),
(427, 95, 5000.00, 5000, 0, 2, 2026, '2026-08-06', 66, 1),
(428, 95, 5000.00, 5000, 0, 3, 2026, '2026-08-06', 66, 1),
(429, 95, 5000.00, 5000, 0, 4, 2026, '2026-08-06', 66, 1),
(430, 95, 5000.00, 5000, 0, 5, 2026, '2026-07-19', 66, 2),
(431, 95, 5000.00, 5000, 0, 6, 2026, '2026-07-19', 66, 2),
(432, 95, 5000.00, 5000, 0, 7, 2026, '2026-07-19', 66, 2),
(433, 95, 5000.00, 5000, 0, 8, 2026, '2026-07-19', 66, 2),
(434, 32, 2000.00, 2000, 0, 2, 2026, '2026-02-27', 66, 1),
(435, 32, 2000.00, 2000, 0, 3, 2026, '2026-02-27', 66, 1),
(436, 32, 2000.00, 2000, 0, 4, 2026, '2026-02-27', 66, 1),
(437, 32, 2000.00, 2000, 0, 5, 2026, '2026-02-27', 66, 1),
(438, 32, 2000.00, 2000, 0, 6, 2026, '2026-02-27', 66, 1),
(439, 32, 2000.00, 2000, 0, 7, 2026, '2026-02-27', 66, 1),
(440, 32, 2000.00, 2000, 0, 8, 2026, '2026-02-27', 66, 1),
(441, 32, 2000.00, 2000, 0, 9, 2026, '2026-02-27', 66, 1),
(442, 32, 2000.00, 2000, 0, 10, 2026, '2026-02-27', 66, 1),
(443, 32, 2000.00, 2000, 0, 11, 2026, '2026-02-27', 66, 1),
(444, 32, 2000.00, 2000, 0, 12, 2026, '2026-02-27', 66, 1),
(445, 145, 5000.00, 5000, 0, 8, 2026, '2026-08-07', NULL, NULL),
(446, 146, 5000.00, 5000, 0, 8, 2026, '2026-08-09', NULL, NULL),
(447, 144, 5000.00, 5000, 0, 8, 2026, '2026-08-09', NULL, NULL),
(448, 126, 5000.00, 5000, 0, 8, 2026, '2026-08-10', 66, 2),
(449, 98, 5000.00, 5000, 0, 5, 2026, '2026-08-10', 15, 2),
(450, 98, 5000.00, 5000, 0, 6, 2026, '2026-08-10', 15, 2),
(451, 98, 5000.00, 5000, 0, 7, 2026, '2026-08-10', 15, 2),
(452, 98, 5000.00, 5000, 0, 8, 2026, '2026-08-10', 15, 2),
(453, 147, 5000.00, 5000, 0, 8, 2026, '2026-08-11', NULL, NULL),
(454, 138, 5000.00, 5000, 0, 8, 2026, '2026-08-14', 66, 2),
(455, 62, 5000.00, 5000, 0, 2, 2026, '2026-08-14', 66, 2),
(456, 62, 5000.00, 5000, 0, 3, 2026, '2026-08-14', 66, 2),
(457, 62, 5000.00, 5000, 0, 4, 2026, '2026-08-14', 66, 2),
(458, 62, 5000.00, 5000, 0, 5, 2026, '2026-08-14', 66, 2),
(459, 62, 5000.00, 5000, 0, 6, 2026, '2026-08-14', 66, 2),
(460, 62, 5000.00, 5000, 0, 7, 2026, '2026-08-14', 66, 2),
(461, 62, 5000.00, 5000, 0, 8, 2026, '2026-08-14', 66, 2),
(462, 131, 5000.00, 5000, 0, 8, 2026, '2026-08-14', 66, 2),
(463, 148, 5000.00, 5000, 0, 8, 2026, '2026-08-17', NULL, NULL),
(464, 134, 5000.00, 5000, 0, 8, 2026, '2026-08-04', 66, 2),
(465, 149, 5000.00, 5000, 0, 8, 2026, '2026-08-29', NULL, NULL),
(466, 150, 5000.00, 5000, 0, 9, 2026, '2026-09-02', NULL, NULL),
(467, 134, 5000.00, 5000, 0, 9, 2026, '2026-09-05', 66, 2),
(468, 137, 5000.00, 5000, 0, 8, 2026, '2026-09-04', 66, 2),
(469, 137, 5000.00, 5000, 0, 9, 2026, '2026-09-04', 66, 2),
(470, 137, 5000.00, 5000, 0, 10, 2026, '2026-09-04', 66, 2),
(471, 155, 5000.00, 5000, 0, 9, 2026, '2026-09-07', NULL, NULL),
(472, 154, 5000.00, 5000, 0, 9, 2026, '2026-09-07', NULL, NULL),
(473, 153, 5000.00, 5000, 0, 9, 2026, '2026-09-07', NULL, NULL),
(474, 152, 5000.00, 5000, 0, 9, 2026, '2026-09-07', NULL, NULL),
(475, 151, 5000.00, 5000, 0, 9, 2026, '2026-09-07', NULL, NULL),
(476, 98, 5000.00, 5000, 0, 9, 2026, '2026-09-10', 66, 2),
(477, 133, 5000.00, 5000, 0, 8, 2026, '2026-07-06', 66, 2),
(478, 158, 5000.00, 5000, 0, 9, 2026, '2026-09-10', NULL, NULL),
(479, 157, 5000.00, 5000, 0, 9, 2026, '2026-09-10', NULL, NULL),
(480, 156, 5000.00, 5000, 0, 9, 2026, '2026-09-10', NULL, NULL),
(481, 120, 5000.00, 5000, 0, 8, 2026, '2026-09-10', 66, 2),
(482, 120, 5000.00, 5000, 0, 9, 2026, '2026-09-10', 66, 2),
(483, 120, 5000.00, 5000, 0, 10, 2026, '2026-09-10', 66, 2),
(484, 120, 5000.00, 5000, 0, 11, 2026, '2026-09-10', 66, 2),
(485, 120, 5000.00, 5000, 0, 12, 2026, '2026-09-10', 66, 2),
(486, 107, 5000.00, 5000, 0, 6, 2026, '2026-09-10', 66, 2),
(487, 107, 5000.00, 5000, 0, 7, 2026, '2026-09-10', 66, 2),
(488, 107, 5000.00, 5000, 0, 8, 2026, '2026-09-10', 66, 2),
(489, 107, 5000.00, 5000, 0, 9, 2026, '2026-09-10', 66, 2),
(490, 138, 5000.00, 5000, 0, 9, 2026, '2026-09-12', 66, 2),
(491, 160, 5000.00, 5000, 0, 9, 2026, '2026-09-24', NULL, NULL),
(492, 159, 5000.00, 5000, 0, 9, 2026, '2026-09-24', NULL, NULL),
(493, 161, 5000.00, 5000, 0, 9, 2026, '2026-09-29', NULL, NULL),
(494, 162, 5000.00, 5000, 0, 10, 2026, '2026-10-05', NULL, NULL),
(495, 126, 5000.00, 5000, 0, 9, 2026, '2026-10-06', 66, 2),
(496, 126, 5000.00, 5000, 0, 10, 2026, '2026-10-06', 66, 2),
(497, 98, 5000.00, 5000, 0, 10, 2026, '2026-10-10', 66, 2),
(498, 138, 5000.00, 5000, 0, 10, 2026, '2026-10-15', 66, 2),
(499, 158, 5000.00, 5000, 0, 10, 2026, '2026-10-15', 66, 2),
(500, 15, 2000.00, 5000, 0, 3, 2026, '2026-10-18', NULL, 3),
(501, 160, 5000.00, 5000, 0, 10, 2026, '2026-10-18', NULL, 3),
(502, 82, 2000.00, 2000, 0, 1, 2025, '2025-10-18', 15, 1),
(503, 82, 2000.00, 2000, 0, 2, 2025, '2025-10-18', 15, 1),
(504, 82, 2000.00, 2000, 0, 3, 2025, '2025-10-18', 15, 1),
(505, 82, 2000.00, 2000, 0, 4, 2025, '2025-10-18', 15, 1),
(506, 82, 2000.00, 2000, 0, 5, 2025, '2025-10-18', 15, 1),
(507, 82, 2000.00, 2000, 0, 6, 2025, '2025-10-18', 15, 1),
(508, 82, 2000.00, 2000, 0, 7, 2025, '2025-10-18', 15, 1),
(509, 82, 2000.00, 2000, 0, 8, 2025, '2025-10-18', 15, 1),
(510, 82, 2000.00, 2000, 0, 9, 2025, '2025-10-18', 15, 1),
(511, 82, 2000.00, 2000, 0, 10, 2025, '2025-10-18', 15, 1),
(512, 82, 2000.00, 2000, 0, 11, 2025, '2025-10-18', 15, 1),
(513, 82, 2000.00, 2000, 0, 12, 2025, '2025-10-18', 15, 1),
(514, 82, 2000.00, 2000, 0, 1, 2026, '2025-10-18', 15, 1),
(515, 82, 2000.00, 2000, 0, 2, 2026, '2025-10-18', 15, 1),
(516, 82, 5000.00, 5000, 0, 3, 2026, '2026-10-18', NULL, 3),
(517, 82, 5000.00, 5000, 0, 4, 2026, '2026-10-18', NULL, 3),
(518, 50, 2000.00, 2000, 0, 10, 2025, '2026-10-18', NULL, 3),
(519, 156, 5000.00, 5000, 0, 10, 2026, '2026-10-19', NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `aem_contribution_payment`
--

CREATE TABLE `aem_contribution_payment` (
  `aem_id_cpay` int(10) UNSIGNED NOT NULL,
  `aem_id_user` int(10) UNSIGNED NOT NULL,
  `aem_amount` int(11) NOT NULL,
  `aem_reference` varchar(100) DEFAULT NULL,
  `aem_status` varchar(20) DEFAULT NULL,
  `aem_papi_payment_ref` varchar(100) DEFAULT NULL,
  `aem_notification_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aem_contribution_payment`
--

INSERT INTO `aem_contribution_payment` (`aem_id_cpay`, `aem_id_user`, `aem_amount`, `aem_reference`, `aem_status`, `aem_papi_payment_ref`, `aem_notification_token`, `created_at`) VALUES
(1, 15, 2000, 'CONTRIB-1', 'SUCCESS', '477f539d-e6b8-49c2-ac26-191d30edcdb2', '9f8e348a-d45b-4aec-ae4e-d62f19195dc2', '2026-10-18 11:27:03'),
(2, 15, 10000, 'CONTRIB-2', 'PENDING', NULL, '5317b85a-f38d-4d9b-82bb-4cf28c714ebe', '2026-10-18 11:59:19'),
(3, 65, 35000, 'CONTRIB-3', 'PENDING', NULL, '5bcb87f5-b3c0-41a0-a5b0-286c93c13927', '2026-10-18 12:59:32'),
(4, 160, 5000, 'CONTRIB-4', 'SUCCESS', '7dc34353-a05e-4021-b6b8-4e82c77c5f55', '9f93078e-da7a-4931-aec1-98a1d3028328', '2026-10-18 13:33:50'),
(5, 109, 40000, 'CONTRIB-5', 'PENDING', NULL, '761b65fa-d246-41f0-ad55-cb1511967a9d', '2026-10-18 13:45:05'),
(6, 109, 5000, 'CONTRIB-6', 'PENDING', NULL, '109653c8-2204-415e-a4f8-bc7c46aaece5', '2026-10-18 13:45:53'),
(7, 15, 59000, 'CONTRIB-7', 'PENDING', NULL, '4e4684b0-847c-4598-9210-9d1b9106234c', '2026-10-18 15:29:49'),
(8, 82, 5000, 'CONTRIB-8', 'SUCCESS', 'a2b233fb-4420-49f7-b42a-602ee4415e18', '6349f8bb-802e-46f2-924a-d1dbd32b09db', '2026-10-18 16:50:41'),
(9, 82, 5000, 'CONTRIB-9', 'SUCCESS', 'fa4c6449-c987-401c-974b-da0a57457ed5', 'b4db861a-7104-41e6-97b8-819eebc26de8', '2026-10-18 16:57:29'),
(10, 50, 2000, 'CONTRIB-10', 'SUCCESS', '75009f70-fc84-44f0-bf52-d6f3454b7d19', '012e1638-1be6-498e-8359-0032bebff9a4', '2026-10-18 17:40:12'),
(11, 28, 5000, 'CONTRIB-11', 'PENDING', NULL, '57410b3d-0e12-439e-89b8-085aefdce80f', '2026-10-18 18:36:32'),
(12, 15, 2000, 'CONTRIB-12', 'PENDING', NULL, 'e3a25c8e-a303-450d-a59b-6ef2aaf64193', '2026-10-19 05:59:39'),
(13, 62, 5000, 'CONTRIB-13', 'PENDING', NULL, '18c020ef-169d-4ed3-8221-21663468ba59', '2026-10-19 06:44:23'),
(14, 156, 5000, 'CONTRIB-14', 'SUCCESS', '3fe84632-1699-4f68-8113-0f165412a831', 'a127df22-fa0c-4d06-b686-a2a2db4e7102', '2026-10-19 07:30:30');

-- --------------------------------------------------------

--
-- Structure de la table `aem_contribution_periode`
--

CREATE TABLE `aem_contribution_periode` (
  `aem_id_contribution_periode` int(11) NOT NULL,
  `begin_date` date NOT NULL,
  `end_date` date NOT NULL,
  `value` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `aem_contribution_price`
--

CREATE TABLE `aem_contribution_price` (
  `aem_id_contribution_price` int(11) NOT NULL,
  `aem_start_month` int(11) NOT NULL,
  `aem_start_year` int(11) NOT NULL,
  `aem_end_month` int(11) NOT NULL,
  `aem_end_year` int(11) NOT NULL,
  `aem_value` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_contribution_price`
--

INSERT INTO `aem_contribution_price` (`aem_id_contribution_price`, `aem_start_month`, `aem_start_year`, `aem_end_month`, `aem_end_year`, `aem_value`) VALUES
(1, 1, 2023, 2, 2026, 2000.00),
(3, 3, 2026, 12, 2026, 5000.00);

-- --------------------------------------------------------

--
-- Structure de la table `aem_country`
--

CREATE TABLE `aem_country` (
  `aem_id_country` int(11) NOT NULL,
  `aem_country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_country`
--

INSERT INTO `aem_country` (`aem_id_country`, `aem_country`) VALUES
(1, 'Afghanistan'),
(2, 'Albania'),
(3, 'Algeria'),
(4, 'Andorra'),
(5, 'Angola'),
(6, 'Argentina'),
(7, 'Armenia'),
(8, 'Australia'),
(9, 'Austria'),
(10, 'Azerbaijan'),
(11, 'Bahamas'),
(12, 'Bahrain'),
(13, 'Bangladesh'),
(14, 'Barbados'),
(15, 'Belarus'),
(16, 'Belgium'),
(17, 'Belize'),
(18, 'Benin'),
(19, 'Bhutan'),
(20, 'Bolivia'),
(21, 'Bosnia and Herzegovina'),
(22, 'Botswana'),
(23, 'Brazil'),
(24, 'Brunei'),
(25, 'Bulgaria'),
(26, 'Burkina Faso'),
(27, 'Burundi'),
(28, 'Cambodia'),
(29, 'Cameroon'),
(30, 'Canada'),
(31, 'Cape Verde'),
(32, 'Central African Republic'),
(33, 'Chad'),
(34, 'Chile'),
(35, 'China'),
(36, 'Colombia'),
(37, 'Comoros'),
(38, 'Congo'),
(39, 'Costa Rica'),
(40, 'Croatia'),
(41, 'Cuba'),
(42, 'Cyprus'),
(43, 'Czech Republic'),
(44, 'Denmark'),
(45, 'Djibouti'),
(46, 'Dominican Republic'),
(47, 'Ecuador'),
(48, 'Egypt'),
(49, 'El Salvador'),
(50, 'Equatorial Guinea'),
(51, 'Eritrea'),
(52, 'Estonia'),
(53, 'Eswatini'),
(54, 'Ethiopia'),
(55, 'Fiji'),
(56, 'Finland'),
(57, 'France'),
(58, 'Gabon'),
(59, 'Gambia'),
(60, 'Georgia'),
(61, 'Germany'),
(62, 'Ghana'),
(63, 'Greece'),
(64, 'Guatemala'),
(65, 'Guinea'),
(66, 'Haiti'),
(67, 'Honduras'),
(68, 'Hungary'),
(69, 'Iceland'),
(70, 'India'),
(71, 'Indonesia'),
(72, 'Iran'),
(73, 'Iraq'),
(74, 'Ireland'),
(75, 'Israel'),
(76, 'Italy'),
(77, 'Jamaica'),
(78, 'Japan'),
(79, 'Jordan'),
(80, 'Kazakhstan'),
(81, 'Kenya'),
(82, 'Kuwait'),
(83, 'Latvia'),
(84, 'Lebanon'),
(85, 'Lithuania'),
(86, 'Luxembourg'),
(87, 'Madagascar'),
(88, 'Malaysia'),
(89, 'Maldives'),
(90, 'Mali'),
(91, 'Malta'),
(92, 'Mexico'),
(93, 'Monaco'),
(94, 'Mongolia'),
(95, 'Morocco'),
(96, 'Mozambique'),
(97, 'Myanmar'),
(98, 'Namibia'),
(99, 'Nepal'),
(100, 'Netherlands'),
(101, 'New Zealand'),
(102, 'Niger'),
(103, 'Nigeria'),
(104, 'North Korea'),
(105, 'Norway'),
(106, 'Oman'),
(107, 'Pakistan'),
(108, 'Panama'),
(109, 'Papua New Guinea'),
(110, 'Paraguay'),
(111, 'Peru'),
(112, 'Philippines'),
(113, 'Poland'),
(114, 'Portugal'),
(115, 'Qatar'),
(116, 'Romania'),
(117, 'Russia'),
(118, 'Rwanda'),
(119, 'Saudi Arabia'),
(120, 'Senegal'),
(121, 'Serbia'),
(122, 'Singapore'),
(123, 'Slovakia'),
(124, 'Slovenia'),
(125, 'South Africa'),
(126, 'South Korea'),
(127, 'Spain'),
(128, 'Sri Lanka'),
(129, 'Sudan'),
(130, 'Sweden'),
(131, 'Switzerland'),
(132, 'Syria'),
(133, 'Taiwan'),
(134, 'Tanzania'),
(135, 'Thailand'),
(136, 'Togo'),
(137, 'Tunisia'),
(138, 'Turkey'),
(139, 'Uganda'),
(140, 'Ukraine'),
(141, 'United Arab Emirates'),
(142, 'United Kingdom'),
(143, 'United States'),
(144, 'Uruguay'),
(145, 'Uzbekistan'),
(146, 'Venezuela'),
(147, 'Vietnam'),
(148, 'Yemen'),
(149, 'Zambia'),
(150, 'Zimbabwe'),
(151, 'Mauritius');

-- --------------------------------------------------------

--
-- Structure de la table `aem_document`
--

CREATE TABLE `aem_document` (
  `aem_id_document` int(11) NOT NULL,
  `aem_document_name` varchar(255) NOT NULL,
  `aem_document_path` varchar(255) NOT NULL,
  `aem_date_publication` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_document`
--

INSERT INTO `aem_document` (`aem_id_document`, `aem_document_name`, `aem_document_path`, `aem_date_publication`) VALUES
(3, 'PARTAGE D\'EXPERIENCE HORS-SOL AEM1.pdf', 'assets/documents/1785153436_1785153436_4eb58a41b4c84e472222.pdf', '2026-07-27');

-- --------------------------------------------------------

--
-- Structure de la table `aem_donation`
--

CREATE TABLE `aem_donation` (
  `aem_id_donation` int(10) UNSIGNED NOT NULL,
  `aem_donor_name` varchar(100) DEFAULT NULL,
  `aem_donor_email` varchar(150) DEFAULT NULL,
  `aem_amount` int(11) NOT NULL,
  `aem_cause` varchar(100) DEFAULT NULL,
  `aem_id_activity` int(11) DEFAULT NULL,
  `aem_reference` varchar(100) DEFAULT NULL,
  `aem_status` varchar(20) DEFAULT NULL,
  `aem_papi_payment_ref` varchar(100) DEFAULT NULL,
  `aem_notification_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aem_donation`
--

INSERT INTO `aem_donation` (`aem_id_donation`, `aem_donor_name`, `aem_donor_email`, `aem_amount`, `aem_cause`, `aem_id_activity`, `aem_reference`, `aem_status`, `aem_papi_payment_ref`, `aem_notification_token`, `created_at`) VALUES
(1, 'Anonyme', NULL, 2000, 'Soutien à l\'association AES — enfants en situation de handicap', 1, 'DON-1', 'SUCCESS', '57b468de-3970-4f89-8958-f5320e9166f8', 'fec119bc-9f72-49d7-8dda-ed3824df4a8e', '2026-10-18 11:25:22'),
(2, 'Anonyme', NULL, 5000, 'Soutien à l\'association AES — enfants en situation de handicap', 1, 'DON-2', 'PENDING', NULL, 'c2def032-3833-4efb-a3ba-1cdb1cdf6fae', '2026-10-18 15:27:00'),
(3, 'Anonyme', NULL, 20000, 'Soutien à l\'association AES — enfants en situation de handicap', 1, 'DON-3', 'FAILED', '2a1cee34-c85d-4125-bd74-bcf887622fc4', '5df7e803-2f70-4825-9d04-402f3d56a7cb', '2026-10-18 18:09:31'),
(4, 'Anonyme', NULL, 5000, 'Soutien à l\'association AES — enfants en situation de handicap', 1, 'DON-4', 'PENDING', NULL, 'a29db110-0db6-4880-ac35-17085541231c', '2026-10-19 06:00:47'),
(5, 'Anonyme', NULL, 5000, 'Soutien à l\'association AES — enfants en situation de handicap', 1, 'DON-5', 'PENDING', NULL, 'a1867ed8-fa8d-4203-81fc-ed0ae6221bce', '2026-10-19 06:01:25');

-- --------------------------------------------------------

--
-- Structure de la table `aem_event`
--

CREATE TABLE `aem_event` (
  `aem_id_event` int(11) NOT NULL,
  `aem_event_date` date NOT NULL,
  `aem_event_lieu` varchar(100) NOT NULL,
  `aem_event_theme` varchar(100) NOT NULL,
  `aem_event_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_event`
--

INSERT INTO `aem_event` (`aem_id_event`, `aem_event_date`, `aem_event_lieu`, `aem_event_theme`, `aem_event_description`) VALUES
(2, '2026-02-07', 'Ampefiloha', 'Assemblé générale', 'Chers membres de l’AEM,\r\nnous vous invitons à participer à une rencontre interne ce samedi, autour d’un petit cocktail, suivie de notre Assemblée Générale. Ce sera un moment privilégié pour échanger entre membres, faire le point sur la vie de l’association et renforcer notre esprit de solidarité.'),
(5, '2026-07-06', 'Sur Whatsapp', 'Réunion', '');

-- --------------------------------------------------------

--
-- Structure de la table `aem_formation`
--

CREATE TABLE `aem_formation` (
  `aem_id_formation` int(11) NOT NULL,
  `aem_theme` varchar(100) NOT NULL,
  `aem_prix` decimal(10,2) NOT NULL,
  `aem_date` date NOT NULL,
  `aem_lieu` varchar(100) NOT NULL,
  `aem_description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `idPublisher` int(11) DEFAULT NULL,
  `aem_intervenant_id_user` int(11) DEFAULT NULL,
  `aem_intervenant_nom` varchar(255) DEFAULT NULL,
  `aem_id_account` int(11) DEFAULT NULL,
  `aem_prix_par_personne` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `aem_formation_participant`
--

CREATE TABLE `aem_formation_participant` (
  `aem_id_formation_participant` int(11) NOT NULL,
  `aem_id_formation` int(11) NOT NULL,
  `aem_id_user` int(11) DEFAULT NULL,
  `aem_nom_participant` varchar(50) NOT NULL,
  `aem_prenom_participant` varchar(50) NOT NULL,
  `aem_telephone_participant` varchar(20) NOT NULL,
  `aem_validation` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `aem_function`
--

CREATE TABLE `aem_function` (
  `aem_id_function` int(11) NOT NULL,
  `aem_function_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_function`
--

INSERT INTO `aem_function` (`aem_id_function`, `aem_function_name`) VALUES
(4, 'Comptable'),
(6, 'Conseiller'),
(7, 'Membre'),
(1, 'Président'),
(5, 'Secrétaire'),
(3, 'Trésorier'),
(2, 'Vice-Président');

-- --------------------------------------------------------

--
-- Structure de la table `aem_idea`
--

CREATE TABLE `aem_idea` (
  `aem_id_idea` int(10) UNSIGNED NOT NULL,
  `aem_message` text NOT NULL,
  `aem_is_read` tinyint(1) NOT NULL DEFAULT 0,
  `aem_created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `aem_idea`
--

INSERT INTO `aem_idea` (`aem_id_idea`, `aem_message`, `aem_is_read`, `aem_created_at`) VALUES
(1, 'Salama tompoko , ceci et un test', 1, '2026-07-01 09:59:41'),
(2, 'Bonjour \nMety vé raha mba averina azavaina ato am site ireo conditions an\'iAEM  satria efa mandeha Ilay site de efa betsaka koa ireo vaovao vao miditra Mbola tsy mahalala\nOhatra oe ny badge,ny resaka point,mba ampazoto kokoa ny tsirairay andray anjara amizay rehetra atao\nMankasitraka', 1, '2026-07-01 11:55:58'),
(3, 'Salama! Juste hoe te haneho fotsiny hoe ahoana kay ho anay aty @ faritra @lay casquette , misy manontany ao fa mbola tsy mahazo valiny ! Merci', 1, '2026-09-07 13:10:23'),
(4, 'Salama tompoko.\r\nMembre vaovao aho azafady, nanao modification ny mot de passe dia lazainy fa diso ilay mdp actuel kanefa ilay tao @ mail mihitsy no natao copie collé.\r\nMisaotra tompoko', 1, '2026-09-10 09:37:40');

-- --------------------------------------------------------

--
-- Structure de la table `aem_likes`
--

CREATE TABLE `aem_likes` (
  `aem_id_like` int(11) NOT NULL,
  `aem_id_publication` int(11) DEFAULT NULL,
  `aem_id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_likes`
--

INSERT INTO `aem_likes` (`aem_id_like`, `aem_id_publication`, `aem_id_user`) VALUES
(51, 13, 88),
(54, 13, 51),
(55, 15, 50),
(56, 16, 50),
(57, 13, 50),
(59, 16, 15),
(60, 15, 15),
(61, 15, 106),
(62, 15, 117),
(63, 13, 125),
(64, 13, 107),
(65, 16, 107),
(66, 15, 107),
(67, 13, 126),
(68, 15, 125),
(69, 16, 126),
(70, 16, 109),
(71, 17, 15),
(73, 13, 112),
(74, 15, 112),
(75, 16, 112),
(76, 16, 121),
(77, 17, 24),
(78, 13, 122),
(79, 15, 134),
(80, 17, 136),
(81, 13, 136),
(82, 17, 73),
(83, 15, 126),
(84, 17, 131),
(85, 13, 131),
(86, 17, 138),
(87, 13, 138),
(88, 15, 138),
(89, 16, 138),
(90, 17, 95),
(91, 13, 95),
(92, 17, 118),
(93, 17, 20),
(94, 13, 20),
(95, 15, 20),
(96, 16, 20),
(97, 17, 29),
(98, 13, 29),
(99, 16, 29),
(100, 17, 50),
(101, 17, 133),
(103, 15, 131),
(104, 17, 158),
(105, 13, 110),
(106, 13, 37),
(107, 13, 99),
(108, 13, 15);

-- --------------------------------------------------------

--
-- Structure de la table `aem_mark`
--

CREATE TABLE `aem_mark` (
  `aem_id_mark` int(11) NOT NULL,
  `aem_id_user` int(11) DEFAULT NULL,
  `aem_description` varchar(255) NOT NULL,
  `aem_mark` int(11) DEFAULT NULL,
  `date` date DEFAULT curdate(),
  `aem_added_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_mark`
--

INSERT INTO `aem_mark` (`aem_id_mark`, `aem_id_user`, `aem_description`, `aem_mark`, `date`, `aem_added_by`) VALUES
(31, 15, 'Cotisation mois de Février 2026', 1, '2026-02-03', NULL),
(32, 15, 'Inscription', 5, '2026-02-03', NULL),
(33, 56, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(34, 56, 'Inscription', 5, '2026-02-04', NULL),
(35, 55, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(36, 55, 'Inscription', 5, '2026-02-04', NULL),
(37, 54, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(38, 54, 'Inscription', 5, '2026-02-04', NULL),
(39, 53, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(40, 53, 'Inscription', 5, '2026-02-04', NULL),
(41, 52, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(42, 52, 'Inscription', 5, '2026-02-04', NULL),
(43, 51, 'Cotisation mois de Mars 2025', 1, '2026-02-04', NULL),
(44, 51, 'Inscription', 5, '2026-02-04', NULL),
(45, 50, 'Cotisation mois de Septembre 2025', 1, '2026-02-04', NULL),
(46, 50, 'Inscription', 5, '2026-02-04', NULL),
(47, 49, 'Cotisation mois de Août 2025', 1, '2026-02-04', NULL),
(48, 49, 'Inscription', 5, '2026-02-04', NULL),
(49, 48, 'Cotisation mois de Septembre 2025', 1, '2026-02-04', NULL),
(50, 48, 'Inscription', 5, '2026-02-04', NULL),
(51, 47, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(52, 47, 'Inscription', 5, '2026-02-04', NULL),
(53, 46, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(54, 46, 'Inscription', 5, '2026-02-04', NULL),
(55, 45, 'Cotisation mois de Décembre 2025', 1, '2026-02-04', NULL),
(56, 45, 'Inscription', 5, '2026-02-04', NULL),
(57, 44, 'Cotisation mois de Janvier 2025', 1, '2026-02-04', NULL),
(58, 44, 'Inscription', 5, '2026-02-04', NULL),
(59, 43, 'Cotisation mois de Septembre 2025', 1, '2026-02-04', NULL),
(60, 43, 'Inscription', 5, '2026-02-04', NULL),
(61, 42, 'Cotisation mois de Février 2025', 1, '2026-02-04', NULL),
(62, 42, 'Inscription', 5, '2026-02-04', NULL),
(63, 41, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(64, 41, 'Inscription', 5, '2026-02-04', NULL),
(65, 40, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(66, 40, 'Inscription', 5, '2026-02-04', NULL),
(67, 39, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(68, 39, 'Inscription', 5, '2026-02-04', NULL),
(69, 38, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(70, 38, 'Inscription', 5, '2026-02-04', NULL),
(71, 37, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(72, 37, 'Inscription', 5, '2026-02-04', NULL),
(73, 36, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(74, 36, 'Inscription', 5, '2026-02-04', NULL),
(75, 35, 'Cotisation mois de Janvier 2025', 1, '2026-02-04', NULL),
(76, 35, 'Inscription', 5, '2026-02-04', NULL),
(77, 34, 'Cotisation mois de Septembre 2025', 1, '2026-02-04', NULL),
(78, 34, 'Inscription', 5, '2026-02-04', NULL),
(79, 33, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(80, 33, 'Inscription', 5, '2026-02-04', NULL),
(81, 32, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(82, 32, 'Inscription', 5, '2026-02-04', NULL),
(83, 31, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(84, 31, 'Inscription', 5, '2026-02-04', NULL),
(85, 30, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(86, 30, 'Inscription', 5, '2026-02-04', NULL),
(87, 29, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(88, 29, 'Inscription', 5, '2026-02-04', NULL),
(89, 28, 'Cotisation mois de Avril 2025', 1, '2026-02-04', NULL),
(90, 28, 'Inscription', 5, '2026-02-04', NULL),
(91, 27, 'Cotisation mois de Septembre 2025', 1, '2026-02-04', NULL),
(92, 27, 'Inscription', 5, '2026-02-04', NULL),
(93, 26, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(94, 26, 'Inscription', 5, '2026-02-04', NULL),
(95, 25, 'Cotisation mois de Janvier 2025', 1, '2026-02-04', NULL),
(96, 25, 'Inscription', 5, '2026-02-04', NULL),
(97, 24, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(98, 24, 'Inscription', 5, '2026-02-04', NULL),
(99, 23, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(100, 23, 'Inscription', 5, '2026-02-04', NULL),
(101, 22, 'Cotisation mois de Janvier 2025', 1, '2026-02-04', NULL),
(102, 22, 'Inscription', 5, '2026-02-04', NULL),
(103, 21, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(104, 21, 'Inscription', 5, '2026-02-04', NULL),
(105, 20, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(106, 20, 'Inscription', 5, '2026-02-04', NULL),
(107, 19, 'Cotisation mois de Décembre 2025', 1, '2026-02-04', NULL),
(108, 19, 'Inscription', 5, '2026-02-04', NULL),
(109, 18, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(110, 18, 'Inscription', 5, '2026-02-04', NULL),
(111, 17, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(112, 17, 'Inscription', 5, '2026-02-04', NULL),
(113, 16, 'Cotisation mois de Janvier 2026', 1, '2026-02-04', NULL),
(114, 16, 'Inscription', 5, '2026-02-04', NULL),
(115, 57, 'Cotisation mois de Décembre 2024', 1, '2026-02-04', NULL),
(116, 57, 'Inscription', 5, '2026-02-04', NULL),
(117, 58, 'Cotisation mois de Février 2026', 1, '2026-02-08', NULL),
(118, 58, 'Inscription', 5, '2026-02-08', NULL),
(119, 40, 'Présence', 5, '2026-02-08', NULL),
(120, 57, 'Présence', 5, '2026-02-08', NULL),
(122, 58, 'Présence', 5, '2026-02-08', NULL),
(123, 19, 'Présence', 5, '2026-02-08', NULL),
(124, 34, 'Présence', 5, '2026-02-08', NULL),
(125, 20, 'Présence', 5, '2026-02-08', NULL),
(126, 68, 'Cotisation mois de Février 2026', 1, '2026-02-09', NULL),
(127, 68, 'Inscription', 5, '2026-02-09', NULL),
(128, 67, 'Cotisation mois de Février 2026', 1, '2026-02-09', NULL),
(129, 67, 'Inscription', 5, '2026-02-09', NULL),
(130, 66, 'Cotisation mois de Décembre 2025', 1, '2026-02-09', NULL),
(131, 66, 'Inscription', 5, '2026-02-09', NULL),
(132, 65, 'Cotisation mois de Février 2026', 1, '2026-02-09', NULL),
(133, 65, 'Inscription', 5, '2026-02-09', NULL),
(134, 65, 'Cotisation mois de Mars 2026', 1, '2026-02-09', NULL),
(135, 65, 'Inscription', 5, '2026-02-09', NULL),
(136, 64, 'Cotisation mois de Janvier 2026', 1, '2026-02-09', NULL),
(137, 64, 'Inscription', 5, '2026-02-09', NULL),
(138, 63, 'Cotisation mois de Janvier 2026', 1, '2026-02-09', NULL),
(139, 63, 'Inscription', 5, '2026-02-09', NULL),
(140, 62, 'Cotisation mois de Janvier 2026', 1, '2026-02-09', NULL),
(141, 62, 'Inscription', 5, '2026-02-09', NULL),
(142, 61, 'Cotisation mois de Janvier 2026', 1, '2026-02-09', NULL),
(143, 61, 'Inscription', 5, '2026-02-09', NULL),
(144, 60, 'Cotisation mois de Janvier 2026', 1, '2026-02-09', NULL),
(145, 60, 'Inscription', 5, '2026-02-09', NULL),
(146, 59, 'Cotisation mois de Mars 2025', 1, '2026-02-09', NULL),
(147, 59, 'Inscription', 5, '2026-02-09', NULL),
(164, 15, 'Présence', 5, '2026-02-14', NULL),
(165, 58, 'Présence', 5, '2026-02-14', NULL),
(166, 84, 'Cotisation mois de Février 2026', 1, '2026-02-15', NULL),
(167, 84, 'Inscription', 5, '2026-02-15', NULL),
(168, 77, 'Cotisation mois de Février 2026', 1, '2026-02-15', NULL),
(169, 77, 'Inscription', 5, '2026-02-15', NULL),
(170, 78, 'Cotisation mois de Février 2026', 1, '2026-02-15', NULL),
(171, 78, 'Inscription', 5, '2026-02-15', NULL),
(172, 88, 'Cotisation mois de Avril 2024', 1, '2026-02-15', NULL),
(173, 88, 'Inscription', 5, '2026-02-15', NULL),
(174, 92, 'Cotisation mois de Décembre 2025', 1, '2026-02-15', NULL),
(175, 92, 'Inscription', 5, '2026-02-15', NULL),
(176, 91, 'Cotisation mois de Janvier 2026', 1, '2026-02-15', NULL),
(177, 91, 'Inscription', 5, '2026-02-15', NULL),
(178, 90, 'Cotisation mois de Février 2026', 1, '2026-02-15', NULL),
(179, 90, 'Inscription', 5, '2026-02-15', NULL),
(180, 89, 'Cotisation mois de Janvier 2026', 1, '2026-02-15', NULL),
(181, 89, 'Inscription', 5, '2026-02-15', NULL),
(182, 87, 'Cotisation mois de Février 2026', 1, '2026-02-15', NULL),
(183, 87, 'Inscription', 5, '2026-02-15', NULL),
(184, 86, 'Cotisation mois de Octobre 2025', 1, '2026-02-15', NULL),
(185, 86, 'Inscription', 5, '2026-02-15', NULL),
(186, 83, 'Cotisation mois de Février 2026', 1, '2026-02-15', NULL),
(187, 83, 'Inscription', 5, '2026-02-15', NULL),
(188, 82, 'Cotisation mois de Décembre 2024', 1, '2026-02-15', NULL),
(189, 82, 'Inscription', 5, '2026-02-15', NULL),
(190, 81, 'Cotisation mois de Février 2026', 1, '2026-02-15', NULL),
(191, 81, 'Inscription', 5, '2026-02-15', NULL),
(192, 80, 'Cotisation mois de Février 2026', 1, '2026-02-15', NULL),
(193, 80, 'Inscription', 5, '2026-02-15', NULL),
(194, 79, 'Cotisation mois de Décembre 2024', 1, '2026-02-15', NULL),
(195, 79, 'Inscription', 5, '2026-02-15', NULL),
(196, 76, 'Cotisation mois de Février 2026', 1, '2026-02-15', NULL),
(197, 76, 'Inscription', 5, '2026-02-15', NULL),
(198, 75, 'Cotisation mois de Décembre 2024', 1, '2026-02-15', NULL),
(199, 75, 'Inscription', 5, '2026-02-15', NULL),
(200, 74, 'Cotisation mois de Février 2026', 1, '2026-02-15', NULL),
(201, 74, 'Inscription', 5, '2026-02-15', NULL),
(202, 73, 'Cotisation mois de Décembre 2024', 1, '2026-02-15', NULL),
(203, 73, 'Inscription', 5, '2026-02-15', NULL),
(204, 93, 'Cotisation mois de Février 2026', 1, '2026-02-16', NULL),
(205, 93, 'Inscription', 5, '2026-02-16', NULL),
(206, 94, 'Cotisation mois de Décembre 2024', 1, '2026-02-19', NULL),
(207, 94, 'Inscription', 5, '2026-02-19', NULL),
(208, 95, 'Cotisation mois de Janvier 2026', 1, '2026-02-21', NULL),
(209, 95, 'Inscription', 5, '2026-02-21', NULL),
(210, 98, 'Cotisation mois de Février 2026', 1, '2026-02-21', NULL),
(211, 98, 'Inscription', 5, '2026-02-21', NULL),
(212, 97, 'Cotisation mois de Février 2026', 1, '2026-02-21', NULL),
(213, 97, 'Inscription', 5, '2026-02-21', NULL),
(214, 96, 'Cotisation mois de Février 2026', 1, '2026-02-21', NULL),
(215, 96, 'Inscription', 5, '2026-02-21', NULL),
(216, 99, 'Cotisation mois de Février 2026', 1, '2026-02-22', NULL),
(217, 99, 'Inscription', 5, '2026-02-22', NULL),
(218, 29, 'Cotisation mois de Février 2026', 1, '2026-02-23', NULL),
(219, 29, 'Cotisation mois de Mars 2026', 1, '2026-02-23', NULL),
(220, 29, 'Cotisation mois de Avril 2026', 1, '2026-02-23', NULL),
(221, 29, 'Cotisation mois de Mai 2026', 1, '2026-02-23', NULL),
(222, 48, 'Cotisation mois de Octobre 2025', 1, '2026-02-23', NULL),
(223, 48, 'Cotisation mois de Novembre 2025', 1, '2026-02-23', NULL),
(224, 48, 'Cotisation mois de Décembre 2025', 1, '2026-02-23', NULL),
(225, 48, 'Cotisation mois de Janvier 2026', 1, '2026-02-23', NULL),
(226, 48, 'Cotisation mois de Février 2026', 1, '2026-02-23', NULL),
(227, 48, 'Cotisation mois de Mars 2026', 1, '2026-02-23', NULL),
(228, 48, 'Cotisation mois de Avril 2026', 1, '2026-02-23', NULL),
(229, 48, 'Cotisation mois de Mai 2026', 1, '2026-02-23', NULL),
(230, 48, 'Cotisation mois de Juin 2026', 1, '2026-02-23', NULL),
(231, 48, 'Cotisation mois de Juillet 2026', 1, '2026-02-23', NULL),
(232, 66, 'Cotisation mois de Janvier 2026', 1, '2026-02-23', NULL),
(233, 66, 'Cotisation mois de Février 2026', 1, '2026-02-23', NULL),
(234, 66, 'Cotisation mois de Mars 2026', 1, '2026-02-23', NULL),
(235, 66, 'Cotisation mois de Avril 2026', 1, '2026-02-23', NULL),
(236, 66, 'Cotisation mois de Mai 2026', 1, '2026-02-23', NULL),
(237, 92, 'Cotisation mois de Janvier 2026', 1, '2026-02-23', NULL),
(238, 92, 'Cotisation mois de Février 2026', 1, '2026-02-23', NULL),
(239, 92, 'Cotisation mois de Mars 2026', 1, '2026-02-23', NULL),
(240, 92, 'Cotisation mois de Avril 2026', 1, '2026-02-23', NULL),
(241, 92, 'Cotisation mois de Mai 2026', 1, '2026-02-23', NULL),
(242, 92, 'Cotisation mois de Juin 2026', 1, '2026-02-23', NULL),
(243, 76, 'Cotisation mois de Mars 2026', 1, '2026-02-23', NULL),
(244, 76, 'Cotisation mois de Avril 2026', 1, '2026-02-23', NULL),
(245, 76, 'Cotisation mois de Mai 2026', 1, '2026-02-23', NULL),
(246, 76, 'Cotisation mois de Juin 2026', 1, '2026-02-23', NULL),
(247, 76, 'Cotisation mois de Juillet 2026', 1, '2026-02-23', NULL),
(248, 76, 'Cotisation mois de Août 2026', 1, '2026-02-23', NULL),
(249, 76, 'Cotisation mois de Septembre 2026', 1, '2026-02-23', NULL),
(250, 76, 'Cotisation mois de Octobre 2026', 1, '2026-02-23', NULL),
(251, 76, 'Cotisation mois de Novembre 2026', 1, '2026-02-23', NULL),
(252, 76, 'Cotisation mois de Décembre 2026', 1, '2026-02-23', NULL),
(253, 28, 'Cotisation mois de Mai 2025', 1, '2026-02-23', NULL),
(254, 28, 'Cotisation mois de Juin 2025', 1, '2026-02-23', NULL),
(255, 28, 'Cotisation mois de Juillet 2025', 1, '2026-02-23', NULL),
(256, 28, 'Cotisation mois de Août 2025', 1, '2026-02-23', NULL),
(257, 28, 'Cotisation mois de Septembre 2025', 1, '2026-02-23', NULL),
(258, 28, 'Cotisation mois de Octobre 2025', 1, '2026-02-23', NULL),
(259, 28, 'Cotisation mois de Novembre 2025', 1, '2026-02-23', NULL),
(260, 28, 'Cotisation mois de Décembre 2025', 1, '2026-02-23', NULL),
(261, 28, 'Cotisation mois de Janvier 2026', 1, '2026-02-23', NULL),
(262, 28, 'Cotisation mois de Février 2026', 1, '2026-02-23', NULL),
(263, 28, 'Cotisation mois de Mars 2026', 1, '2026-02-23', NULL),
(264, 28, 'Cotisation mois de Avril 2026', 1, '2026-02-23', NULL),
(265, 47, 'Cotisation mois de Février 2026', 1, '2026-02-23', NULL),
(266, 47, 'Cotisation mois de Mars 2026', 1, '2026-02-23', NULL),
(267, 57, 'Cotisation mois de Janvier 2025', 1, '2026-02-23', NULL),
(268, 57, 'Cotisation mois de Février 2025', 1, '2026-02-23', NULL),
(269, 57, 'Cotisation mois de Mars 2025', 1, '2026-02-23', NULL),
(270, 57, 'Cotisation mois de Avril 2025', 1, '2026-02-23', NULL),
(271, 57, 'Cotisation mois de Mai 2025', 1, '2026-02-23', NULL),
(272, 57, 'Cotisation mois de Juin 2025', 1, '2026-02-23', NULL),
(273, 57, 'Cotisation mois de Juillet 2025', 1, '2026-02-23', NULL),
(274, 57, 'Cotisation mois de Août 2025', 1, '2026-02-23', NULL),
(275, 57, 'Cotisation mois de Septembre 2025', 1, '2026-02-23', NULL),
(276, 84, 'Cotisation mois de Mars 2026', 1, '2026-02-23', NULL),
(277, 84, 'Cotisation mois de Avril 2026', 1, '2026-02-23', NULL),
(278, 84, 'Cotisation mois de Mai 2026', 1, '2026-02-23', NULL),
(279, 84, 'Cotisation mois de Juin 2026', 1, '2026-02-23', NULL),
(280, 84, 'Cotisation mois de Juillet 2026', 1, '2026-02-23', NULL),
(281, 84, 'Cotisation mois de Août 2026', 1, '2026-02-23', NULL),
(282, 84, 'Cotisation mois de Septembre 2026', 1, '2026-02-23', NULL),
(283, 84, 'Cotisation mois de Octobre 2026', 1, '2026-02-23', NULL),
(284, 84, 'Cotisation mois de Novembre 2026', 1, '2026-02-23', NULL),
(285, 84, 'Cotisation mois de Décembre 2026', 1, '2026-02-23', NULL),
(286, 34, 'Cotisation mois de Octobre 2025', 1, '2026-02-23', NULL),
(287, 34, 'Cotisation mois de Novembre 2025', 1, '2026-02-23', NULL),
(288, 34, 'Cotisation mois de Décembre 2025', 1, '2026-02-23', NULL),
(289, 34, 'Cotisation mois de Janvier 2026', 1, '2026-02-23', NULL),
(290, 34, 'Cotisation mois de Février 2026', 1, '2026-02-23', NULL),
(291, 34, 'Cotisation mois de Mars 2026', 1, '2026-02-23', NULL),
(292, 34, 'Cotisation mois de Avril 2026', 1, '2026-02-23', NULL),
(293, 34, 'Cotisation mois de Mai 2026', 1, '2026-02-23', NULL),
(294, 34, 'Cotisation mois de Juin 2026', 1, '2026-02-23', NULL),
(295, 34, 'Cotisation mois de Juillet 2026', 1, '2026-02-23', NULL),
(296, 34, 'Cotisation mois de Août 2026', 1, '2026-02-23', NULL),
(297, 34, 'Cotisation mois de Septembre 2026', 1, '2026-02-23', NULL),
(298, 34, 'Cotisation mois de Octobre 2026', 1, '2026-02-23', NULL),
(299, 34, 'Cotisation mois de Novembre 2026', 1, '2026-02-23', NULL),
(300, 34, 'Cotisation mois de Décembre 2026', 1, '2026-02-23', NULL),
(301, 100, 'Cotisation mois de Février 2026', 1, '2026-02-26', NULL),
(302, 100, 'Inscription', 5, '2026-02-26', NULL),
(303, 48, 'Cotisation mois de Août 2026', 1, '2026-02-26', NULL),
(304, 48, 'Cotisation mois de Septembre 2026', 1, '2026-02-26', NULL),
(305, 48, 'Cotisation mois de Octobre 2026', 1, '2026-02-26', NULL),
(306, 48, 'Cotisation mois de Novembre 2026', 1, '2026-02-26', NULL),
(307, 48, 'Cotisation mois de Décembre 2026', 1, '2026-02-26', NULL),
(308, 44, 'Cotisation mois de Février 2025', 1, '2026-02-26', NULL),
(309, 44, 'Cotisation mois de Mars 2025', 1, '2026-02-26', NULL),
(310, 44, 'Cotisation mois de Avril 2025', 1, '2026-02-26', NULL),
(311, 44, 'Cotisation mois de Mai 2025', 1, '2026-02-26', NULL),
(312, 44, 'Cotisation mois de Juin 2025', 1, '2026-02-26', NULL),
(313, 59, 'Cotisation mois de Avril 2025', 1, '2026-02-26', NULL),
(314, 59, 'Cotisation mois de Mai 2025', 1, '2026-02-26', NULL),
(315, 59, 'Cotisation mois de Juin 2025', 1, '2026-02-26', NULL),
(316, 59, 'Cotisation mois de Juillet 2025', 1, '2026-02-26', NULL),
(317, 59, 'Cotisation mois de Août 2025', 1, '2026-02-26', NULL),
(318, 59, 'Cotisation mois de Septembre 2025', 1, '2026-02-26', NULL),
(319, 59, 'Cotisation mois de Octobre 2025', 1, '2026-02-26', NULL),
(320, 59, 'Cotisation mois de Novembre 2025', 1, '2026-02-26', NULL),
(321, 59, 'Cotisation mois de Décembre 2025', 1, '2026-02-26', NULL),
(322, 59, 'Cotisation mois de Janvier 2026', 1, '2026-02-26', NULL),
(323, 59, 'Cotisation mois de Février 2026', 1, '2026-02-26', NULL),
(324, 59, 'Cotisation mois de Mars 2026', 1, '2026-02-26', NULL),
(325, 59, 'Cotisation mois de Avril 2026', 1, '2026-02-26', NULL),
(326, 59, 'Cotisation mois de Mai 2026', 1, '2026-02-26', NULL),
(327, 59, 'Cotisation mois de Juin 2026', 1, '2026-02-26', NULL),
(328, 59, 'Cotisation mois de Juillet 2026', 1, '2026-02-26', NULL),
(329, 59, 'Cotisation mois de Août 2026', 1, '2026-02-26', NULL),
(330, 59, 'Cotisation mois de Septembre 2026', 1, '2026-02-26', NULL),
(331, 59, 'Cotisation mois de Octobre 2026', 1, '2026-02-26', NULL),
(332, 59, 'Cotisation mois de Novembre 2026', 1, '2026-02-26', NULL),
(333, 59, 'Cotisation mois de Décembre 2026', 1, '2026-02-26', NULL),
(334, 24, 'Cotisation mois de Février 2026', 1, '2026-02-26', NULL),
(335, 24, 'Cotisation mois de Mars 2026', 1, '2026-02-26', NULL),
(336, 24, 'Cotisation mois de Avril 2026', 1, '2026-02-26', NULL),
(337, 24, 'Cotisation mois de Mai 2026', 1, '2026-02-26', NULL),
(338, 24, 'Cotisation mois de Juin 2026', 1, '2026-02-26', NULL),
(339, 24, 'Cotisation mois de Juillet 2026', 1, '2026-02-26', NULL),
(340, 24, 'Cotisation mois de Août 2026', 1, '2026-02-26', NULL),
(341, 24, 'Cotisation mois de Septembre 2026', 1, '2026-02-26', NULL),
(342, 24, 'Cotisation mois de Octobre 2026', 1, '2026-02-26', NULL),
(343, 24, 'Cotisation mois de Novembre 2026', 1, '2026-02-26', NULL),
(344, 24, 'Cotisation mois de Décembre 2026', 1, '2026-02-26', NULL),
(345, 101, 'Cotisation mois de Février 2026', 1, '2026-02-27', NULL),
(346, 101, 'Inscription', 5, '2026-02-27', NULL),
(347, 27, 'Cotisation mois de Octobre 2025', 1, '2026-02-27', NULL),
(348, 27, 'Cotisation mois de Novembre 2025', 1, '2026-02-27', NULL),
(349, 27, 'Cotisation mois de Décembre 2025', 1, '2026-02-27', NULL),
(350, 27, 'Cotisation mois de Janvier 2026', 1, '2026-02-27', NULL),
(351, 27, 'Cotisation mois de Février 2026', 1, '2026-02-27', NULL),
(352, 27, 'Cotisation mois de Mars 2026', 1, '2026-02-27', NULL),
(353, 27, 'Cotisation mois de Avril 2026', 1, '2026-02-27', NULL),
(354, 27, 'Cotisation mois de Mai 2026', 1, '2026-02-27', NULL),
(355, 27, 'Cotisation mois de Juin 2026', 1, '2026-02-27', NULL),
(356, 27, 'Cotisation mois de Juillet 2026', 1, '2026-02-27', NULL),
(357, 27, 'Cotisation mois de Août 2026', 1, '2026-02-27', NULL),
(358, 27, 'Cotisation mois de Septembre 2026', 1, '2026-02-27', NULL),
(359, 27, 'Cotisation mois de Octobre 2026', 1, '2026-02-27', NULL),
(360, 27, 'Cotisation mois de Novembre 2026', 1, '2026-02-27', NULL),
(361, 27, 'Cotisation mois de Décembre 2026', 1, '2026-02-27', NULL),
(362, 79, 'Cotisation mois de Janvier 2025', 1, '2026-02-27', NULL),
(363, 79, 'Cotisation mois de Février 2025', 1, '2026-02-27', NULL),
(364, 79, 'Cotisation mois de Mars 2025', 1, '2026-02-27', NULL),
(365, 79, 'Cotisation mois de Avril 2025', 1, '2026-02-27', NULL),
(366, 79, 'Cotisation mois de Mai 2025', 1, '2026-02-27', NULL),
(367, 79, 'Cotisation mois de Juin 2025', 1, '2026-02-27', NULL),
(368, 40, 'Cotisation mois de Février 2026', 1, '2026-03-01', NULL),
(369, 102, 'Cotisation mois de Février 2026', 1, '2026-03-01', NULL),
(370, 102, 'Inscription', 5, '2026-03-01', NULL),
(371, 26, 'Cotisation mois de Février 2026', 1, '2026-03-01', NULL),
(372, 26, 'Cotisation mois de Mars 2026', 1, '2026-03-01', NULL),
(373, 26, 'Cotisation mois de Avril 2026', 1, '2026-03-01', NULL),
(374, 26, 'Cotisation mois de Mai 2026', 1, '2026-03-01', NULL),
(375, 26, 'Cotisation mois de Juin 2026', 1, '2026-03-01', NULL),
(376, 26, 'Cotisation mois de Juillet 2026', 1, '2026-03-01', NULL),
(377, 26, 'Cotisation mois de Août 2026', 1, '2026-03-01', NULL),
(378, 26, 'Cotisation mois de Septembre 2026', 1, '2026-03-01', NULL),
(379, 26, 'Cotisation mois de Octobre 2026', 1, '2026-03-01', NULL),
(380, 26, 'Cotisation mois de Novembre 2026', 1, '2026-03-01', NULL),
(381, 26, 'Cotisation mois de Décembre 2026', 1, '2026-03-01', NULL),
(382, 103, 'Cotisation mois de Mars 2026', 1, '2026-03-03', NULL),
(383, 103, 'Inscription', 5, '2026-03-03', NULL),
(384, 104, 'Cotisation mois de Mars 2026', 1, '2026-03-03', NULL),
(385, 104, 'Inscription', 5, '2026-03-03', NULL),
(386, 105, 'Cotisation mois de Mars 2026', 1, '2026-03-03', NULL),
(387, 105, 'Inscription', 5, '2026-03-03', NULL),
(388, 67, 'Cotisation mois de Mars 2026', 1, '2026-03-04', NULL),
(389, 67, 'Cotisation mois de Avril 2026', 1, '2026-03-04', NULL),
(390, 67, 'Cotisation mois de Mai 2026', 1, '2026-03-04', NULL),
(391, 67, 'Cotisation mois de Juin 2026', 1, '2026-03-04', NULL),
(392, 67, 'Cotisation mois de Juillet 2026', 1, '2026-03-04', NULL),
(393, 67, 'Don Toamasina', 10, '2026-03-04', NULL),
(394, 106, 'Cotisation mois de Septembre 2025', 1, '2026-03-07', NULL),
(395, 106, 'Inscription', 5, '2026-03-07', NULL),
(396, 106, 'Cotisation mois de Octobre 2025', 1, '2026-03-07', NULL),
(397, 106, 'Cotisation mois de Novembre 2025', 1, '2026-03-07', NULL),
(398, 106, 'Cotisation mois de Décembre 2025', 1, '2026-03-07', NULL),
(399, 106, 'Cotisation mois de Janvier 2026', 1, '2026-03-07', NULL),
(400, 106, 'Cotisation mois de Février 2026', 1, '2026-03-07', NULL),
(401, 106, 'Cotisation mois de Mars 2026', 1, '2026-03-07', NULL),
(402, 106, 'Cotisation mois de Avril 2026', 1, '2026-03-07', NULL),
(403, 106, 'Cotisation mois de Mai 2026', 1, '2026-03-07', NULL),
(404, 106, 'Cotisation mois de Juin 2026', 1, '2026-03-07', NULL),
(405, 106, 'Cotisation mois de Juillet 2026', 1, '2026-03-07', NULL),
(406, 106, 'Cotisation mois de Août 2026', 1, '2026-03-07', NULL),
(407, 106, 'Cotisation mois de Septembre 2026', 1, '2026-03-07', NULL),
(408, 106, 'Cotisation mois de Octobre 2026', 1, '2026-03-07', NULL),
(409, 106, 'Cotisation mois de Novembre 2026', 1, '2026-03-07', NULL),
(410, 107, 'Cotisation mois de Mars 2026', 1, '2026-03-07', NULL),
(411, 107, 'Inscription', 5, '2026-03-07', NULL),
(412, 24, 'Don Toamasina', 5, '2026-03-07', NULL),
(413, 73, 'Partage formation', 20, '2026-03-07', NULL),
(414, 51, 'Don Toamasina et hebergement', 24, '2026-03-07', NULL),
(415, 67, 'Cotisation hebergement', 3, '2026-03-07', NULL),
(416, 29, 'Cotisation mois de Juin 2026', 1, '2026-03-07', NULL),
(417, 29, 'Cotisation mois de Juillet 2026', 1, '2026-03-07', NULL),
(418, 34, 'Don', 12, '2026-03-07', NULL),
(419, 108, 'Cotisation mois de Mars 2026', 1, '2026-03-11', NULL),
(420, 108, 'Inscription', 5, '2026-03-11', NULL),
(421, 109, 'Cotisation mois de Mars 2026', 1, '2026-03-17', NULL),
(422, 109, 'Inscription', 5, '2026-03-17', NULL),
(423, 110, 'Cotisation mois de Mars 2026', 1, '2026-03-17', NULL),
(424, 110, 'Inscription', 5, '2026-03-17', NULL),
(425, 110, 'Cotisation mois de Avril 2026', 1, '2026-03-17', NULL),
(426, 110, 'Cotisation mois de Mai 2026', 1, '2026-03-17', NULL),
(427, 110, 'Cotisation mois de Juin 2026', 1, '2026-03-17', NULL),
(428, 110, 'Cotisation mois de Juillet 2026', 1, '2026-03-17', NULL),
(429, 110, 'Cotisation mois de Août 2026', 1, '2026-03-17', NULL),
(430, 110, 'Cotisation mois de Septembre 2026', 1, '2026-03-17', NULL),
(431, 110, 'Cotisation mois de Octobre 2026', 1, '2026-03-17', NULL),
(432, 110, 'Cotisation mois de Novembre 2026', 1, '2026-03-17', NULL),
(433, 110, 'Cotisation mois de Juillet 2026', 1, '2026-03-17', NULL),
(434, 110, 'Cotisation mois de Août 2026', 1, '2026-03-17', NULL),
(435, 110, 'Cotisation mois de Septembre 2026', 1, '2026-03-17', NULL),
(436, 110, 'Cotisation mois de Octobre 2026', 1, '2026-03-17', NULL),
(437, 110, 'Cotisation mois de Novembre 2026', 1, '2026-03-17', NULL),
(438, 110, 'Cotisation hébergement et Don pour toamasina', 5, '2026-03-17', NULL),
(439, 110, 'Cotisation mois de Décembre 2026', 1, '2026-03-17', NULL),
(440, 114, 'Cotisation mois de Juin 2026', 1, '2026-06-23', NULL),
(441, 114, 'Inscription', 5, '2026-06-23', NULL),
(442, 111, 'Cotisation mois de Mars 2026', 1, '2026-06-23', NULL),
(443, 111, 'Inscription', 5, '2026-06-23', NULL),
(444, 113, 'Cotisation mois de Juin 2026', 1, '2026-06-23', NULL),
(445, 113, 'Inscription', 5, '2026-06-23', NULL),
(446, 116, 'Cotisation mois de Juin 2026', 1, '2026-06-23', NULL),
(447, 116, 'Inscription', 5, '2026-06-23', NULL),
(448, 115, 'Cotisation mois de Juin 2026', 1, '2026-06-23', NULL),
(449, 115, 'Inscription', 5, '2026-06-23', NULL),
(450, 112, 'Cotisation mois de Mars 2026', 1, '2026-06-23', NULL),
(451, 112, 'Inscription', 5, '2026-06-23', NULL),
(452, 51, 'Cotisation mois de Avril 2025', 1, '2026-07-01', NULL),
(453, 51, 'Cotisation mois de Mai 2025', 1, '2026-07-01', NULL),
(454, 51, 'Cotisation mois de Juin 2025', 1, '2026-07-01', NULL),
(455, 51, 'Cotisation mois de Juillet 2025', 1, '2026-07-01', NULL),
(456, 51, 'Cotisation mois de Août 2025', 1, '2026-07-01', NULL),
(457, 51, 'Cotisation mois de Septembre 2025', 1, '2026-07-01', NULL),
(458, 51, 'Cotisation mois de Octobre 2025', 1, '2026-07-01', NULL),
(459, 51, 'Cotisation mois de Novembre 2025', 1, '2026-07-01', NULL),
(460, 51, 'Cotisation mois de Décembre 2025', 1, '2026-07-01', NULL),
(461, 51, 'Cotisation mois de Janvier 2026', 1, '2026-07-01', NULL),
(462, 51, 'Cotisation mois de Février 2026', 1, '2026-07-01', NULL),
(463, 51, 'Cotisation mois de Mars 2026', 1, '2026-07-01', NULL),
(464, 51, 'Cotisation mois de Avril 2026', 1, '2026-07-01', NULL),
(465, 51, 'Cotisation mois de Mai 2026', 1, '2026-07-01', NULL),
(466, 51, 'Cotisation mois de Juin 2026', 1, '2026-07-01', NULL),
(467, 51, 'Cotisation mois de Juillet 2026', 1, '2026-07-01', NULL),
(468, 51, 'Cotisation mois de Août 2026', 1, '2026-07-01', NULL),
(469, 51, 'Cotisation mois de Septembre 2026', 1, '2026-07-01', NULL),
(470, 51, 'Cotisation mois de Octobre 2026', 1, '2026-07-01', NULL),
(471, 51, 'Cotisation mois de Novembre 2026', 1, '2026-07-01', NULL),
(472, 51, 'Cotisation mois de Décembre 2026', 1, '2026-07-01', NULL),
(473, 117, 'Cotisation mois de Juillet 2026', 1, '2026-07-01', NULL),
(474, 117, 'Inscription', 5, '2026-07-01', NULL),
(475, 118, 'Cotisation mois de Juillet 2026', 1, '2026-07-01', NULL),
(476, 118, 'Inscription', 5, '2026-07-01', NULL),
(477, 119, 'Cotisation mois de Juillet 2026', 1, '2026-07-01', NULL),
(478, 119, 'Inscription', 5, '2026-07-01', NULL),
(479, 121, 'Cotisation mois de Juillet 2026', 1, '2026-07-01', NULL),
(480, 121, 'Inscription', 5, '2026-07-01', NULL),
(481, 120, 'Cotisation mois de Juillet 2026', 1, '2026-07-01', NULL),
(482, 120, 'Inscription', 5, '2026-07-01', NULL),
(483, 123, 'Cotisation mois de Juillet 2026', 1, '2026-07-01', NULL),
(484, 123, 'Inscription', 5, '2026-07-01', NULL),
(485, 122, 'Cotisation mois de Juillet 2026', 1, '2026-07-01', NULL),
(486, 122, 'Inscription', 5, '2026-07-01', NULL),
(487, 124, 'Cotisation mois de Juillet 2026', 1, '2026-07-01', NULL),
(488, 124, 'Inscription', 5, '2026-07-01', NULL),
(489, 125, 'Cotisation mois de Juillet 2026', 1, '2026-07-02', NULL),
(490, 125, 'Inscription', 5, '2026-07-02', NULL),
(491, 126, 'Cotisation mois de Juillet 2026', 1, '2026-07-02', NULL),
(492, 126, 'Inscription', 5, '2026-07-02', NULL),
(493, 107, 'Cotisation mois de Avril 2026', 1, '2026-07-02', NULL),
(494, 107, 'Cotisation mois de Mai 2026', 1, '2026-07-02', NULL),
(495, 127, 'Cotisation mois de Juillet 2026', 1, '2026-07-02', NULL),
(496, 127, 'Inscription', 5, '2026-07-02', NULL),
(497, 128, 'Cotisation mois de Juillet 2026', 1, '2026-07-02', NULL),
(498, 128, 'Inscription', 5, '2026-07-02', NULL),
(499, 20, 'Cotisation mois de Février 2026', 1, '2026-07-02', NULL),
(500, 20, 'Cotisation mois de Mars 2026', 1, '2026-07-02', NULL),
(501, 20, 'Cotisation mois de Avril 2026', 1, '2026-07-02', NULL),
(502, 40, 'Cotisation mois de Mars 2026', 1, '2026-07-02', NULL),
(503, 40, 'Cotisation mois de Avril 2026', 1, '2026-07-02', NULL),
(504, 99, 'Cotisation mois de Mars 2026', 1, '2026-07-02', NULL),
(505, 129, 'Cotisation mois de Juillet 2026', 1, '2026-07-02', NULL),
(506, 129, 'Inscription', 5, '2026-07-02', NULL),
(507, 98, 'Cotisation mois de Mars 2026', 1, '2026-07-02', NULL),
(508, 98, 'Cotisation mois de Avril 2026', 1, '2026-07-02', NULL),
(509, 131, 'Cotisation mois de Juillet 2026', 1, '2026-07-05', NULL),
(510, 131, 'Inscription', 5, '2026-07-05', NULL),
(511, 133, 'Cotisation mois de Juillet 2026', 1, '2026-07-06', NULL),
(512, 133, 'Inscription', 5, '2026-07-06', NULL),
(513, 132, 'Cotisation mois de Juillet 2026', 1, '2026-07-06', NULL),
(514, 132, 'Inscription', 5, '2026-07-06', NULL),
(515, 134, 'Cotisation mois de Juillet 2026', 1, '2026-07-07', NULL),
(516, 134, 'Inscription', 5, '2026-07-07', NULL),
(517, 88, 'Cotisation mois de Mai 2024', 1, '2026-07-09', NULL),
(518, 88, 'Cotisation mois de Juin 2024', 1, '2026-07-09', NULL),
(519, 88, 'Cotisation mois de Juillet 2024', 1, '2026-07-09', NULL),
(520, 88, 'Cotisation mois de Août 2024', 1, '2026-07-09', NULL),
(521, 88, 'Cotisation mois de Septembre 2024', 1, '2026-07-09', NULL),
(522, 88, 'Cotisation mois de Octobre 2024', 1, '2026-07-09', NULL),
(523, 88, 'Cotisation mois de Novembre 2024', 1, '2026-07-09', NULL),
(524, 88, 'Cotisation mois de Décembre 2024', 1, '2026-07-09', NULL),
(525, 88, 'Cotisation mois de Janvier 2025', 1, '2026-07-09', NULL),
(526, 88, 'Cotisation mois de Février 2025', 1, '2026-07-09', NULL),
(527, 88, 'Cotisation mois de Mars 2025', 1, '2026-07-09', NULL),
(528, 88, 'Cotisation mois de Avril 2025', 1, '2026-07-09', NULL),
(529, 88, 'Cotisation mois de Mai 2025', 1, '2026-07-09', NULL),
(530, 88, 'Cotisation mois de Juin 2025', 1, '2026-07-09', NULL),
(531, 88, 'Cotisation mois de Juillet 2025', 1, '2026-07-09', NULL),
(532, 88, 'Cotisation mois de Août 2025', 1, '2026-07-09', NULL),
(533, 88, 'Cotisation mois de Septembre 2025', 1, '2026-07-09', NULL),
(534, 88, 'Cotisation mois de Octobre 2025', 1, '2026-07-09', NULL),
(535, 88, 'Cotisation mois de Novembre 2025', 1, '2026-07-09', NULL),
(536, 88, 'Cotisation mois de Décembre 2025', 1, '2026-07-09', NULL),
(537, 88, 'Cotisation mois de Janvier 2026', 1, '2026-07-09', NULL),
(538, 88, 'Cotisation mois de Février 2026', 1, '2026-07-09', NULL),
(539, 88, 'Cotisation mois de Mars 2026', 1, '2026-07-09', NULL),
(540, 88, 'Cotisation mois de Avril 2026', 1, '2026-07-09', NULL),
(541, 88, 'Cotisation mois de Mai 2026', 1, '2026-07-09', NULL),
(542, 88, 'Cotisation mois de Juin 2026', 1, '2026-07-09', NULL),
(543, 88, 'Cotisation mois de Juillet 2026', 1, '2026-07-09', NULL),
(544, 88, 'Cotisation mois de Août 2026', 1, '2026-07-09', NULL),
(545, 88, 'Cotisation mois de Septembre 2026', 1, '2026-07-09', NULL),
(546, 88, 'Cotisation mois de Octobre 2026', 1, '2026-07-09', NULL),
(547, 88, 'Cotisation mois de Novembre 2026', 1, '2026-07-09', NULL),
(548, 88, 'Cotisation mois de Décembre 2026', 1, '2026-07-09', NULL),
(549, 135, 'Cotisation mois de Juillet 2026', 1, '2026-07-09', NULL),
(550, 135, 'Inscription', 5, '2026-07-09', NULL),
(551, 136, 'Cotisation mois de Juillet 2026', 1, '2026-07-09', NULL),
(552, 136, 'Inscription', 5, '2026-07-09', NULL),
(553, 37, 'Cotisation mois de Février 2026', 1, '2026-07-09', NULL),
(554, 37, 'Cotisation mois de Mars 2026', 1, '2026-07-09', NULL),
(555, 37, 'Cotisation mois de Avril 2026', 1, '2026-07-09', NULL),
(556, 37, 'Cotisation mois de Mai 2026', 1, '2026-07-09', NULL),
(557, 37, 'Cotisation mois de Juin 2026', 1, '2026-07-09', NULL),
(558, 37, 'Cotisation mois de Juillet 2026', 1, '2026-07-09', NULL),
(559, 37, 'Cotisation mois de Août 2026', 1, '2026-07-09', NULL),
(560, 37, 'Cotisation mois de Septembre 2026', 1, '2026-07-09', NULL),
(561, 37, 'Cotisation mois de Octobre 2026', 1, '2026-07-09', NULL),
(562, 37, 'Cotisation mois de Novembre 2026', 1, '2026-07-09', NULL),
(563, 37, 'Cotisation mois de Décembre 2026', 1, '2026-07-09', NULL),
(564, 137, 'Cotisation mois de Juillet 2026', 1, '2026-07-10', NULL),
(565, 137, 'Inscription', 5, '2026-07-10', NULL),
(566, 40, 'Cotisation mois de Mai 2026', 1, '2026-07-11', NULL),
(567, 40, 'Cotisation mois de Juin 2026', 1, '2026-07-11', NULL),
(568, 40, 'Cotisation mois de Juillet 2026', 1, '2026-07-11', NULL),
(569, 138, 'Cotisation mois de Juillet 2026', 1, '2026-07-11', NULL),
(570, 138, 'Inscription', 5, '2026-07-11', NULL),
(571, 139, 'Cotisation mois de Juillet 2026', 1, '2026-07-16', NULL),
(572, 139, 'Inscription', 5, '2026-07-16', NULL),
(573, 140, 'Cotisation mois de Juillet 2026', 1, '2026-07-17', NULL),
(574, 140, 'Inscription', 5, '2026-07-17', NULL),
(575, 141, 'Cotisation mois de Juillet 2026', 1, '2026-07-27', NULL),
(576, 141, 'Inscription', 5, '2026-07-27', NULL),
(577, 142, 'Cotisation mois de Juillet 2026', 1, '2026-07-28', NULL),
(578, 142, 'Inscription', 5, '2026-07-28', NULL),
(579, 143, 'Cotisation mois de Juillet 2026', 1, '2026-07-30', NULL),
(580, 143, 'Inscription', 5, '2026-07-30', NULL),
(581, 20, 'Cotisation mois de Mai 2026', 1, '2026-08-03', NULL),
(582, 20, 'Cotisation mois de Juin 2026', 1, '2026-08-03', NULL),
(583, 20, 'Cotisation mois de Juillet 2026', 1, '2026-08-03', NULL),
(584, 20, 'Cotisation mois de Août 2026', 1, '2026-08-03', NULL),
(585, 29, 'Cotisation mois de Août 2026', 1, '2026-08-06', NULL),
(586, 29, 'Cotisation mois de Septembre 2026', 1, '2026-08-06', NULL),
(587, 29, 'Cotisation mois de Octobre 2026', 1, '2026-08-06', NULL),
(588, 29, 'Cotisation mois de Novembre 2026', 1, '2026-08-06', NULL),
(589, 29, 'Cotisation mois de Décembre 2026', 1, '2026-08-06', NULL),
(590, 95, 'Cotisation mois de Février 2026', 1, '2026-08-06', NULL),
(591, 95, 'Cotisation mois de Mars 2026', 1, '2026-08-06', NULL),
(592, 95, 'Cotisation mois de Avril 2026', 1, '2026-08-06', NULL),
(593, 95, 'Cotisation mois de Mai 2026', 1, '2026-08-06', NULL),
(594, 95, 'Cotisation mois de Juin 2026', 1, '2026-08-06', NULL),
(595, 95, 'Cotisation mois de Juillet 2026', 1, '2026-08-06', NULL),
(596, 95, 'Cotisation mois de Août 2026', 1, '2026-08-06', NULL),
(597, 32, 'Cotisation mois de Février 2026', 1, '2026-08-07', NULL),
(598, 32, 'Cotisation mois de Mars 2026', 1, '2026-08-07', NULL),
(599, 32, 'Cotisation mois de Avril 2026', 1, '2026-08-07', NULL),
(600, 32, 'Cotisation mois de Mai 2026', 1, '2026-08-07', NULL),
(601, 32, 'Cotisation mois de Juin 2026', 1, '2026-08-07', NULL),
(602, 32, 'Cotisation mois de Juillet 2026', 1, '2026-08-07', NULL),
(603, 32, 'Cotisation mois de Août 2026', 1, '2026-08-07', NULL),
(604, 32, 'Cotisation mois de Septembre 2026', 1, '2026-08-07', NULL),
(605, 32, 'Cotisation mois de Octobre 2026', 1, '2026-08-07', NULL),
(606, 32, 'Cotisation mois de Novembre 2026', 1, '2026-08-07', NULL),
(607, 32, 'Cotisation mois de Décembre 2026', 1, '2026-08-07', NULL),
(608, 145, 'Cotisation mois de Août 2026', 1, '2026-08-07', NULL),
(609, 145, 'Inscription', 5, '2026-08-07', NULL),
(610, 146, 'Cotisation mois de Août 2026', 1, '2026-08-09', NULL),
(611, 146, 'Inscription', 5, '2026-08-09', NULL),
(612, 144, 'Cotisation mois de Août 2026', 1, '2026-08-09', NULL),
(613, 144, 'Inscription', 5, '2026-08-09', NULL),
(614, 126, 'Cotisation mois de Août 2026', 1, '2026-08-10', NULL),
(615, 98, 'Cotisation mois de Mai 2026', 1, '2026-08-10', NULL),
(616, 98, 'Cotisation mois de Juin 2026', 1, '2026-08-10', NULL),
(617, 98, 'Cotisation mois de Juillet 2026', 1, '2026-08-10', NULL),
(618, 98, 'Cotisation mois de Août 2026', 1, '2026-08-10', NULL),
(619, 147, 'Cotisation mois de Août 2026', 1, '2026-08-11', NULL),
(620, 147, 'Inscription', 5, '2026-08-11', NULL),
(621, 138, 'Cotisation mois de Août 2026', 1, '2026-08-14', NULL),
(622, 62, 'Cotisation mois de Février 2026', 1, '2026-08-14', NULL),
(623, 62, 'Cotisation mois de Mars 2026', 1, '2026-08-14', NULL),
(624, 62, 'Cotisation mois de Avril 2026', 1, '2026-08-14', NULL),
(625, 62, 'Cotisation mois de Mai 2026', 1, '2026-08-14', NULL),
(626, 62, 'Cotisation mois de Juin 2026', 1, '2026-08-14', NULL),
(627, 62, 'Cotisation mois de Juillet 2026', 1, '2026-08-14', NULL),
(628, 62, 'Cotisation mois de Août 2026', 1, '2026-08-14', NULL),
(629, 131, 'Cotisation mois de Août 2026', 1, '2026-08-14', NULL),
(630, 148, 'Cotisation mois de Août 2026', 1, '2026-08-17', NULL),
(631, 148, 'Inscription', 5, '2026-08-17', NULL),
(632, 134, 'Cotisation mois de Août 2026', 1, '2026-08-17', NULL),
(633, 149, 'Cotisation mois de Août 2026', 1, '2026-08-29', NULL),
(634, 149, 'Inscription', 5, '2026-08-29', NULL),
(635, 150, 'Cotisation mois de Septembre 2026', 1, '2026-09-02', NULL),
(636, 150, 'Inscription', 5, '2026-09-02', NULL),
(637, 134, 'Cotisation mois de Septembre 2026', 1, '2026-09-07', NULL),
(638, 137, 'Cotisation mois de Août 2026', 1, '2026-09-07', NULL),
(639, 137, 'Cotisation mois de Septembre 2026', 1, '2026-09-07', NULL),
(640, 137, 'Cotisation mois de Octobre 2026', 1, '2026-09-07', NULL),
(641, 155, 'Cotisation mois de Septembre 2026', 1, '2026-09-07', NULL),
(642, 155, 'Inscription', 5, '2026-09-07', NULL),
(643, 154, 'Cotisation mois de Septembre 2026', 1, '2026-09-07', NULL),
(644, 154, 'Inscription', 5, '2026-09-07', NULL),
(645, 153, 'Cotisation mois de Septembre 2026', 1, '2026-09-07', NULL),
(646, 153, 'Inscription', 5, '2026-09-07', NULL),
(647, 152, 'Cotisation mois de Septembre 2026', 1, '2026-09-07', NULL),
(648, 152, 'Inscription', 5, '2026-09-07', NULL),
(649, 151, 'Cotisation mois de Septembre 2026', 1, '2026-09-07', NULL),
(650, 151, 'Inscription', 5, '2026-09-07', NULL),
(651, 98, 'Cotisation mois de Septembre 2026', 1, '2026-09-10', NULL),
(652, 133, 'Cotisation mois de Août 2026', 1, '2026-09-10', NULL),
(653, 158, 'Cotisation mois de Septembre 2026', 1, '2026-09-10', NULL),
(654, 158, 'Inscription', 5, '2026-09-10', NULL),
(655, 157, 'Cotisation mois de Septembre 2026', 1, '2026-09-10', NULL),
(656, 157, 'Inscription', 5, '2026-09-10', NULL),
(657, 156, 'Cotisation mois de Septembre 2026', 1, '2026-09-10', NULL),
(658, 156, 'Inscription', 5, '2026-09-10', NULL),
(659, 120, 'Cotisation mois de Août 2026', 1, '2026-09-10', NULL),
(660, 120, 'Cotisation mois de Septembre 2026', 1, '2026-09-10', NULL),
(661, 120, 'Cotisation mois de Octobre 2026', 1, '2026-09-10', NULL),
(662, 120, 'Cotisation mois de Novembre 2026', 1, '2026-09-10', NULL),
(663, 120, 'Cotisation mois de Décembre 2026', 1, '2026-09-10', NULL),
(664, 107, 'Cotisation mois de Juin 2026', 1, '2026-09-10', NULL),
(665, 107, 'Cotisation mois de Juillet 2026', 1, '2026-09-10', NULL),
(666, 107, 'Cotisation mois de Août 2026', 1, '2026-09-10', NULL),
(667, 107, 'Cotisation mois de Septembre 2026', 1, '2026-09-10', NULL),
(668, 138, 'Cotisation mois de Septembre 2026', 1, '2026-09-23', NULL),
(669, 160, 'Cotisation mois de Septembre 2026', 1, '2026-09-24', NULL),
(670, 160, 'Inscription', 5, '2026-09-24', NULL),
(671, 159, 'Cotisation mois de Septembre 2026', 1, '2026-09-24', NULL),
(672, 159, 'Inscription', 5, '2026-09-24', NULL),
(673, 161, 'Cotisation mois de Septembre 2026', 1, '2026-09-29', NULL),
(674, 161, 'Inscription', 5, '2026-09-29', NULL),
(675, 162, 'Cotisation mois de Octobre 2026', 1, '2026-10-05', NULL),
(676, 162, 'Inscription', 5, '2026-10-05', NULL),
(677, 126, 'Cotisation mois de Septembre 2026', 1, '2026-10-06', NULL),
(678, 126, 'Cotisation mois de Octobre 2026', 1, '2026-10-06', NULL),
(679, 98, 'Cotisation mois de Octobre 2026', 1, '2026-10-10', NULL),
(680, 138, 'Cotisation mois de Octobre 2026', 1, '2026-10-15', NULL),
(681, 158, 'Cotisation mois de Octobre 2026', 1, '2026-10-15', NULL),
(682, 15, 'Cotisation mois de Mars 2026', 1, '2026-10-18', NULL),
(683, 160, 'Cotisation mois de Octobre 2026', 1, '2026-10-18', NULL),
(684, 82, 'Cotisation mois de Janvier 2025', 1, '2026-10-18', NULL),
(685, 82, 'Cotisation mois de Février 2025', 1, '2026-10-18', NULL),
(686, 82, 'Cotisation mois de Mars 2025', 1, '2026-10-18', NULL),
(687, 82, 'Cotisation mois de Avril 2025', 1, '2026-10-18', NULL),
(688, 82, 'Cotisation mois de Mai 2025', 1, '2026-10-18', NULL),
(689, 82, 'Cotisation mois de Juin 2025', 1, '2026-10-18', NULL),
(690, 82, 'Cotisation mois de Juillet 2025', 1, '2026-10-18', NULL),
(691, 82, 'Cotisation mois de Août 2025', 1, '2026-10-18', NULL),
(692, 82, 'Cotisation mois de Septembre 2025', 1, '2026-10-18', NULL),
(693, 82, 'Cotisation mois de Octobre 2025', 1, '2026-10-18', NULL),
(694, 82, 'Cotisation mois de Novembre 2025', 1, '2026-10-18', NULL),
(695, 82, 'Cotisation mois de Décembre 2025', 1, '2026-10-18', NULL),
(696, 82, 'Cotisation mois de Janvier 2026', 1, '2026-10-18', NULL),
(697, 82, 'Cotisation mois de Février 2026', 1, '2026-10-18', NULL),
(698, 82, 'Cotisation mois de Mars 2026', 1, '2026-10-18', NULL),
(699, 82, 'Cotisation mois de Avril 2026', 1, '2026-10-18', NULL),
(700, 50, 'Cotisation mois de Octobre 2025', 1, '2026-10-18', NULL),
(701, 156, 'Cotisation mois de Octobre 2026', 1, '2026-10-19', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `aem_movement`
--

CREATE TABLE `aem_movement` (
  `aem_id_movement` int(11) NOT NULL,
  `rubrique` varchar(100) NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `type` int(11) NOT NULL,
  `movement_date` date NOT NULL,
  `aem_id_account` int(11) DEFAULT NULL,
  `aem_recorded_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_movement`
--

INSERT INTO `aem_movement` (`aem_id_movement`, `rubrique`, `montant`, `type`, `movement_date`, `aem_id_account`, `aem_recorded_by`) VALUES
(1, 'Famangiana membre AEM', 50000.00, -1, '2026-02-26', 1, NULL),
(2, 'Cotisation pour Toamasina', 600000.00, 1, '2026-02-26', 1, NULL),
(3, 'Aide Toamasina', 600000.00, -1, '2026-02-26', 1, NULL),
(4, 'Famangiana mpikambana teraka', 20000.00, -1, '2026-07-01', 1, 66),
(5, 'Famangiana mpikambana niditra hopitaly (narary)', 50000.00, -1, '2026-07-01', 1, 66),
(6, 'Cotisations', 952300.00, 1, '2026-07-09', NULL, NULL),
(7, 'Don — Soutien à l\'association AES — enfants en situation de handicap', 2000.00, 1, '2026-10-18', 3, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `aem_password_reset`
--

CREATE TABLE `aem_password_reset` (
  `aem_id_reset` int(11) UNSIGNED NOT NULL,
  `aem_id_user` int(11) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `aem_password_reset`
--

INSERT INTO `aem_password_reset` (`aem_id_reset`, `aem_id_user`, `token`, `expires_at`, `used`, `created_at`) VALUES
(3, 110, 'f52a4506f1f549a8344250db43ad08dbf19fea61bc33ab26daa7f88853cae0f5', '2026-06-23 18:02:32', 1, '2026-06-23 17:02:32'),
(5, 15, '2090f88be10ddb3e903f2cf3dfde64ec1b9472edafffe7b7fbafc1f012cba118', '2026-06-24 18:16:06', 0, '2026-06-24 17:16:06'),
(6, 106, '5a37474cea5463da87a878af1e6796e338bb4038a16b2244726ab6eddcc4c522', '2026-07-01 16:52:46', 1, '2026-07-01 15:52:46'),
(7, 109, 'ac2d2f2884954393378d6f016ea6fe2db7d3a1010e1b4e855fd015b984e92f11', '2026-07-02 09:47:51', 1, '2026-07-02 08:47:51'),
(9, 56, 'df83d914720d421144583b5a23ca60e0b3c264f044f9638d2d047fdd299dc80e', '2026-07-07 09:32:11', 1, '2026-07-07 08:32:11'),
(10, 73, '5c4f22d6ef5f03f2502f6f13234e2140cbccd401cc78e492a6efe836f5b54831', '2026-07-09 17:12:15', 1, '2026-07-09 16:12:15'),
(11, 112, 'dd091fb8fef2b656d34c9df9017f4d13fb1903205e85824c297e27bb3a0e4951', '2026-07-17 19:12:05', 1, '2026-07-17 18:12:05'),
(15, 62, '315a505fd90509144d83f134bd03860c9be00bb608b60506530ef851aba6f403', '2026-08-10 18:36:58', 1, '2026-08-10 17:36:58'),
(16, 30, 'ebe03853173cf56f78f71d4fbd327ba8f1926212241ba38c03da98156190a776', '2026-09-06 17:43:27', 1, '2026-09-06 16:43:27'),
(17, 64, '3a7c32f28bfbac73ef10bcda3703dc38c4a60301200ba6ac868e4dedbb988f0b', '2026-09-11 19:56:21', 1, '2026-09-11 18:56:21'),
(18, 29, 'faf72890152d9985d70b1a57cac52a3e9e9f58293246500426564e787a08b3f8', '2026-09-24 07:48:43', 1, '2026-09-24 06:48:43'),
(19, 58, '0416885979c2af62232b6e3e60a0f6077da1f4dc72eab1d70c93e4f9edf4cbdc', '2026-10-01 08:48:43', 1, '2026-10-01 07:48:43'),
(20, 150, 'c91dcb288e990ef53876132aba46c228879d049a951390476999228767fcdfcc', '2026-10-06 14:27:55', 1, '2026-10-06 13:27:55'),
(21, 59, 'f1bf14befc6cfcbd1c5b8b2f99479d650fccd3e81024ccc80b8ce2a5aa8a203e', '2026-10-18 15:40:20', 1, '2026-10-18 14:40:20'),
(25, 82, '3d6ca20f808ba7e797dd3968e15e427397883bc6f2fbcf651b177b89eff96669', '2026-10-19 08:19:37', 1, '2026-10-19 07:19:37');

-- --------------------------------------------------------

--
-- Structure de la table `aem_payment`
--

CREATE TABLE `aem_payment` (
  `aem_id_payment` int(11) NOT NULL,
  `aem_id_user` int(11) DEFAULT NULL,
  `aem_validation` tinyint(1) DEFAULT NULL,
  `aem_registered_by` int(11) DEFAULT NULL,
  `aem_validated_by` int(11) DEFAULT NULL,
  `aem_id_account` int(11) DEFAULT NULL,
  `aem_method` varchar(20) NOT NULL DEFAULT 'transfer',
  `aem_amount` int(11) DEFAULT NULL,
  `aem_papi_reference` varchar(100) DEFAULT NULL,
  `aem_papi_payment_ref` varchar(100) DEFAULT NULL,
  `aem_notification_token` varchar(255) DEFAULT NULL,
  `aem_papi_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_payment`
--

INSERT INTO `aem_payment` (`aem_id_payment`, `aem_id_user`, `aem_validation`, `aem_registered_by`, `aem_validated_by`, `aem_id_account`, `aem_method`, `aem_amount`, `aem_papi_reference`, `aem_papi_payment_ref`, `aem_notification_token`, `aem_papi_status`) VALUES
(14, 15, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(15, 16, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(16, 17, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(17, 18, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(18, 19, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(19, 20, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(20, 21, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(21, 22, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(22, 23, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(23, 24, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(24, 25, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(25, 26, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(26, 27, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(27, 28, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(28, 29, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(29, 30, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(30, 31, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(31, 32, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(32, 33, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(33, 34, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(34, 35, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(35, 36, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(36, 37, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(37, 38, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(38, 39, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(39, 40, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(40, 41, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(41, 42, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(42, 43, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(43, 44, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(44, 45, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(45, 46, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(46, 47, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(47, 48, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(48, 49, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(49, 50, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(50, 51, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(51, 52, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(52, 53, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(53, 54, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(54, 55, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(55, 56, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(56, 57, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(57, 58, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(58, 59, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(59, 60, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(60, 61, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(61, 62, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(62, 63, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(63, 64, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(64, 65, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(65, 66, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(66, 67, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(67, 68, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(69, 73, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(70, 74, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(71, 75, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(72, 76, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(73, 77, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(74, 78, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(75, 79, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(76, 80, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(77, 81, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(78, 82, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(79, 83, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(80, 84, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(82, 86, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(83, 87, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(84, 88, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(85, 89, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(86, 90, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(87, 91, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(88, 92, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(89, 93, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(90, 94, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(91, 95, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(92, 96, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(93, 97, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(94, 98, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(95, 99, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(96, 100, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(97, 101, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(98, 102, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(99, 103, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(100, 104, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(101, 105, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(102, 106, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(103, 107, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(104, 108, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(105, 109, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(106, 110, 1, NULL, NULL, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(107, 111, 1, NULL, 15, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(108, 112, 1, NULL, 15, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(109, 113, 1, NULL, 15, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(110, 114, 1, NULL, 15, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(111, 115, 1, NULL, 15, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(112, 116, 1, NULL, 15, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(113, 117, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(114, 118, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(115, 119, 1, NULL, 66, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(116, 120, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(117, 121, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(118, 122, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(119, 123, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(120, 124, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(121, 125, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(122, 126, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(123, 127, 1, NULL, 15, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(124, 128, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(125, 129, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(127, 131, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(128, 132, 1, NULL, 15, 1, 'transfer', NULL, NULL, NULL, NULL, NULL),
(129, 133, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(130, 134, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(131, 135, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(132, 136, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(133, 137, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(134, 138, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(135, 139, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(136, 140, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(137, 141, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(138, 142, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(139, 143, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(140, 144, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(141, 145, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(142, 146, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(143, 147, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(144, 148, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(145, 149, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(146, 150, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(147, 151, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(148, 152, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(149, 153, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(150, 154, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(151, 155, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(152, 156, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(153, 157, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(154, 158, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(155, 159, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(156, 160, 1, NULL, 66, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(157, 161, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(158, 162, 1, NULL, 15, 2, 'transfer', NULL, NULL, NULL, NULL, NULL),
(159, 163, 1, NULL, NULL, NULL, 'transfer', NULL, NULL, NULL, NULL, NULL),
(160, 164, 1, NULL, NULL, NULL, 'transfer', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `aem_privilege`
--

CREATE TABLE `aem_privilege` (
  `id` int(10) UNSIGNED NOT NULL,
  `aem_role` varchar(60) NOT NULL,
  `aem_module` varchar(60) NOT NULL,
  `can_view` tinyint(1) NOT NULL DEFAULT 0,
  `can_create` tinyint(1) NOT NULL DEFAULT 0,
  `can_edit` tinyint(1) NOT NULL DEFAULT 0,
  `can_delete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `aem_privilege`
--

INSERT INTO `aem_privilege` (`id`, `aem_role`, `aem_module`, `can_view`, `can_create`, `can_edit`, `can_delete`) VALUES
(1, 'secretaire', 'attendance', 1, 1, 1, 0),
(2, 'secretaire', 'contribution', 1, 0, 0, 0),
(3, 'secretaire', 'mark', 1, 0, 0, 0),
(4, 'secretaire', 'formation', 1, 0, 0, 0),
(5, 'secretaire', 'movement', 0, 0, 0, 0),
(6, 'secretaire', 'document', 1, 1, 0, 0),
(7, 'secretaire', 'event', 1, 1, 1, 0),
(8, 'secretaire', 'statistics', 1, 0, 0, 0),
(9, 'secretaire', 'member', 1, 0, 0, 0),
(10, 'comptable', 'attendance', 1, 0, 0, 0),
(11, 'comptable', 'contribution', 1, 1, 1, 0),
(12, 'comptable', 'mark', 1, 0, 0, 0),
(13, 'comptable', 'formation', 1, 1, 1, 0),
(14, 'comptable', 'movement', 1, 1, 0, 0),
(15, 'comptable', 'document', 1, 0, 0, 0),
(16, 'comptable', 'event', 1, 0, 0, 0),
(17, 'comptable', 'statistics', 1, 0, 0, 0),
(18, 'comptable', 'member', 1, 0, 0, 0),
(19, 'communication', 'attendance', 1, 0, 0, 0),
(20, 'communication', 'contribution', 1, 0, 0, 0),
(21, 'communication', 'mark', 1, 0, 0, 0),
(22, 'communication', 'formation', 1, 1, 1, 0),
(23, 'communication', 'movement', 0, 0, 0, 0),
(24, 'communication', 'document', 1, 1, 1, 1),
(25, 'communication', 'event', 1, 1, 1, 1),
(26, 'communication', 'statistics', 1, 0, 0, 0),
(27, 'communication', 'member', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `aem_psw_temp`
--

CREATE TABLE `aem_psw_temp` (
  `aem_id_psw_temp` int(11) NOT NULL,
  `aem_id_user` int(11) DEFAULT NULL,
  `aem_psw_temp` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `aem_publication`
--

CREATE TABLE `aem_publication` (
  `aem_id_publication` int(11) NOT NULL,
  `aem_id_user` int(11) DEFAULT NULL,
  `aem_description` mediumtext DEFAULT NULL,
  `aem_validation` tinyint(1) DEFAULT 1,
  `aem_files_path` varchar(200) DEFAULT NULL,
  `aem_file_name` varchar(200) DEFAULT NULL,
  `aem_date_pub` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `aem_publication`
--

INSERT INTO `aem_publication` (`aem_id_publication`, `aem_id_user`, `aem_description`, `aem_validation`, `aem_files_path`, `aem_file_name`, `aem_date_pub`) VALUES
(13, 15, 'Miarahaba antsika rehetra, \r\nEfa ity numéro 0342837814 ity no andoavana cotisation amin\'izao Misoratra @ Graciana \r\nNy capture efa any amin\'i Arivony, na Sarah ihany', 1, NULL, NULL, '2026-07-01'),
(15, 15, 'Toy izao ny mombamomba ny AEM :\r\n✅ Fanalavana azy : Association d\'Entraide Madagascar \r\n✅ Tanjona fifanampiana amin\'ny lafiny rehetra : fanaovana business iraisina, financement ana projet, fanampiana ireo mpiara-belona sahirana, fampiofanana, Fifampizarana traikefa \r\n✅ Activités efa misy sy natao :\r\n1- Business : misy investisseur/ porteur de projet / demarcheur \r\nNy porteur de projet dia izay olona manana projet ka mila vola any amin\'ny mpikambana. \r\nOhatra hoe mila 30 M ar izy hanafarany entana hamidy nefa tsy ampy ny vola fa 10M ar fotsiny. \r\nMiantso ireo mpikambana izay vonona hiara hiasa izy dia faritany hoe ohatrinona ny tombony azon\'ny mpikambana \r\nIreo mpikambana manome vola ireo no antsoina hoe INVESTISSEUR \r\nOHATRA : manome 3 M ar ny investisseur iray dia mahazo 3M + 40% rehefa lafo ny entana \r\nNy demarcheur indray dia ireo manampy ny investisseur hivarotra mahazo commission isakin\'ny vente ireo \r\n2- Formation ho an\'ny samy mpikambana : entreprenariat, travail en ligne, club de langue \r\n3- Fanampiana ny akany AES, mitaiza ankizy sembana \r\nIreo no efa vita fa ankoatr\'ireo misy foana ny fifamonjena eny antenantenany eny', 1, NULL, NULL, '2026-07-01'),
(16, 66, 'Miarahaba antsika rehetra ! \r\nIreto ny fanampim-panazavana momban\'ny AEM. \r\n\r\nNy AEM dia association ana fifanampiana, misy fifanampiana ara-pitadiavana, ara-traikefa dia misy asa sosialy ary fampianarana.\r\n\r\n✅ Fifanampiana ara-pitadiavana \r\n- Misy business maromaro afaka ahazoana vola ao, 25% à 40 % ny bénéfice. (Nifanaraka ny mpikambana fa samy manome 2,5% ho an\'ny AEM ny porteur de projet sy ny investisseur, satria angady ninanana sy vy nahitana, sady mba ho fampandrosoana ny fikambanana.)\r\n- Mise en relation : mampifandray anao amina mpandraharaha na mpampiasa \r\n- Fifampizarana opportunité : rehefa misy appel d\'offre dia mifampizara foana ny mpikambana \r\n👉🏼 Ireo dia hitantsika amin\'ireo sous groupe tsiray2 avy. \r\n\r\n✅ Fifampizarana traikefa :\r\n- Formation ho an\'ny rehetra, membres na tsia.\r\n- Misy formation en interne ihany koa, tsy azo atrehin\'ny daholo bé fa AEM ihany \r\n- misy club de langue ihany koa\r\n\r\n✅ Asa sosialy\r\nBetsaka ny vina. Hanampy ny mpiara-belona sy hampandroso ny samy Malagasy, efa natombotsika amin\'ny fanampiana ny AES izany (Ankany mitaiza zaza sembana).', 1, NULL, NULL, '2026-07-01'),
(17, 66, 'Bonjour à tous ! ❤️\r\n\r\nAfin d’assurer la bonne marche de nos activités, nous vous invitons à régulariser nos cotisations. Le soutien de chacun est essentiel pour qu\'on continue à grandir et à servir la communauté.\r\n\r\nNotre engagement fait la force de notre association ! 💪', 1, NULL, NULL, '2026-07-02');

-- --------------------------------------------------------

--
-- Structure de la table `aem_role`
--

CREATE TABLE `aem_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_key` varchar(80) NOT NULL COMMENT 'Valeur stockée dans aem_admin.aem_role',
  `role_label` varchar(100) NOT NULL COMMENT 'Libellé affiché',
  `is_system` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = rôle système non supprimable',
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `aem_role`
--

INSERT INTO `aem_role` (`id`, `role_key`, `role_label`, `is_system`, `is_active`) VALUES
(1, 'Super Admin', 'Super Admin', 1, 1),
(2, 'admin', 'Administrateur', 1, 1),
(3, 'secretaire', 'Secrétaire', 0, 1),
(4, 'comptable', 'Comptable', 0, 1),
(5, 'communication', 'Responsable Communication', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `aem_rollement_price`
--

CREATE TABLE `aem_rollement_price` (
  `aem_id_rollement_price` int(11) NOT NULL,
  `aem_start_month` int(11) NOT NULL,
  `aem_start_year` int(11) NOT NULL,
  `aem_end_month` int(11) NOT NULL,
  `aem_end_year` int(11) NOT NULL,
  `aem_value` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_rollement_price`
--

INSERT INTO `aem_rollement_price` (`aem_id_rollement_price`, `aem_start_month`, `aem_start_year`, `aem_end_month`, `aem_end_year`, `aem_value`) VALUES
(1, 1, 2023, 2, 2026, 5000.00),
(2, 3, 2026, 12, 2027, 10000.00);

-- --------------------------------------------------------

--
-- Structure de la table `aem_score_manager`
--

CREATE TABLE `aem_score_manager` (
  `aem_id_score_manager` int(11) NOT NULL,
  `aem_id_score` int(11) DEFAULT NULL,
  `aem_values_score` int(11) DEFAULT NULL,
  `aem_description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_score_manager`
--

INSERT INTO `aem_score_manager` (`aem_id_score_manager`, `aem_id_score`, `aem_values_score`, `aem_description`) VALUES
(1, 0, 5, 'Inscription'),
(2, 1, 1, 'Cotisations'),
(3, 2, 5, 'Présence'),
(4, 3, 5, 'Partage');

-- --------------------------------------------------------

--
-- Structure de la table `aem_scoring`
--

CREATE TABLE `aem_scoring` (
  `aem_id_scoring` int(11) NOT NULL,
  `aem_min` int(11) NOT NULL,
  `aem_max` int(11) NOT NULL,
  `aem_grade` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_scoring`
--

INSERT INTO `aem_scoring` (`aem_id_scoring`, `aem_min`, `aem_max`, `aem_grade`) VALUES
(1, 0, 30, 'Junior 1'),
(2, 31, 70, 'Junior 2'),
(3, 71, 150, 'Silver 1'),
(4, 151, 300, 'Silver 2'),
(5, 301, 1000, 'Gold'),
(6, 1001, 5000, 'Platinum 1'),
(7, 5001, 10000, 'Platinum 2'),
(8, 10001, 99999999, 'Diamond');

-- --------------------------------------------------------

--
-- Structure de la table `aem_user`
--

CREATE TABLE `aem_user` (
  `aem_id_user` int(11) NOT NULL,
  `aem_name` varchar(50) NOT NULL,
  `aem_first_name` varchar(50) NOT NULL,
  `aem_date_of_birth` date NOT NULL,
  `aem_place_of_birth` varchar(100) NOT NULL,
  `aem_id_number` varchar(20) NOT NULL,
  `aem_id_issue_date` date NOT NULL,
  `aem_id_issue_place` varchar(100) NOT NULL,
  `aem_country` int(11) NOT NULL,
  `aem_state` varchar(100) NOT NULL,
  `aem_city` varchar(100) NOT NULL,
  `aem_sex` char(1) NOT NULL,
  `aem_identity_photo` varchar(255) DEFAULT NULL,
  `aem_payment_screenshot` varchar(255) DEFAULT NULL,
  `aem_phone_number` varchar(20) DEFAULT NULL,
  `aem_user_password` varchar(255) NOT NULL,
  `aem_password_is_temporary` tinyint(1) NOT NULL DEFAULT 0,
  `aem_user_email` varchar(100) NOT NULL,
  `aem_profile_picture` varchar(255) DEFAULT NULL,
  `aem_rollement_date` date NOT NULL DEFAULT curdate(),
  `aem_id_function` int(11) NOT NULL DEFAULT 7
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `aem_user`
--

INSERT INTO `aem_user` (`aem_id_user`, `aem_name`, `aem_first_name`, `aem_date_of_birth`, `aem_place_of_birth`, `aem_id_number`, `aem_id_issue_date`, `aem_id_issue_place`, `aem_country`, `aem_state`, `aem_city`, `aem_sex`, `aem_identity_photo`, `aem_payment_screenshot`, `aem_phone_number`, `aem_user_password`, `aem_password_is_temporary`, `aem_user_email`, `aem_profile_picture`, `aem_rollement_date`, `aem_id_function`) VALUES
(15, 'RAZAFIMANDIMBY', 'Josoa', '2006-10-24', 'Soavina', '203011046417', '2023-01-23', 'Ambositra', 87, 'Analamanga', 'Antananarivo', 'M', 'assets/images/identity_69822b0dc3e09.png', 'assets/images/profile_69822b0dc3f49.png', '0349034080', '$2y$10$sXHUwWtR6NTrr8jALERC3uV2e.J8n3ze.Qm5fbVEMQBp.7f8qzIaS', 0, 'josoarazafimandimby66@gmail.com', 'assets/images/profile_6a892d1555537.png', '2025-02-03', 7),
(16, 'BADORO', 'Youssouf', '1987-11-07', 'Toliara', '501071022482', '2005-11-16', 'Toliara', 87, 'Androy', 'Beloha', '', NULL, NULL, '0340225200', 'dW0rb2JUTW93NHdnbkYzNFE2YjJtUT09', 0, 'badorotoliara@gmail.com', 'assets/images/profile_6984334df36f8.png', '2026-01-19', 7),
(17, 'TSITAPIHY', 'Martial Marcus Canisius', '1999-10-14', 'Andemaka', '212011013036', '2019-03-22', 'Vohipeno', 87, 'Haut Matsiatra', 'Fianarantsoa', '', NULL, NULL, '0346800854', 'QU1VUnp3dldoVlhvZDBPTkJCVkI2dXFUUTVrYTRaV0tYeFBjSWJxUnVYcz0=', 0, 'marcuscanisius8008@gmail.com', 'assets/images/profile_6982e3e2b1479.png', '2026-01-20', 7),
(18, 'RAVAHIMANANA HARIVONY', 'Johanna', '2000-09-24', 'Tanjondava Talatamaty', '103052020778', '2018-10-30', 'Ambohidratrimo', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0387254219', 'cnZqdXVCeDZkNTBJb1JXb2JJd0NTQT09', 1, 'ravahimananavony@gmail.com', 'assets/images/default-male.svg', '2026-01-17', 7),
(19, 'Ravalonandrasana', 'Nany', '1983-10-25', 'Anosy Avaratra', '101211166823', '2001-12-10', 'Antananarivo 1', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0342010796', 'MjIvTkFzU1g4WFNSWVVxYzJmUlFFdz09', 0, 'ravnany@yahoo.fr', 'assets/images/profile_69839b0f6ecd5.jpg', '2025-12-22', 7),
(20, 'RANDRIANASOLO', 'Anjaniaina Michella', '2004-05-28', 'Maternité Befelatanana', '105131031904', '2022-06-20', 'ARIVONIMAMO', 1, 'Itasy', 'Imerintsiatosika', '', NULL, NULL, '0349433924', 'ajZWVzJ0UWIySFdCb2tIWWFEdlFTZz09', 0, 'randrianasoloanjaniaina11@gmail.com', 'assets/images/profile_6982d5f7bcde0.jpg', '2026-01-17', 7),
(21, 'RAKOTONIRAINY', 'Tsiry Fenosoa', '1990-05-05', 'Antananarivo', '117031013499', '2008-08-22', 'Antananarivo', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0329906177', 'dUlaZFVTS2pTTmMxbjYyUVlpQ2g3UT09', 1, 'tsiryimportexport@gmail.com', 'assets/images/default-male.svg', '2026-01-15', 7),
(22, 'RANDRIARIMANANA', 'Fitiavanasoa Hanitriniala', '1991-11-11', 'Ambohimanala', '117172014510', '2011-03-11', 'Andoharanofotsy', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0340824327', 'ZlVCZzU2NFVlOUNPUVAweTM5ZTFXUT09', 0, 'hanitrarandriarimanana@gmail.com', 'assets/images/profile_69897f67eeb7d.jpg', '2025-01-17', 7),
(23, 'ANDRIAMPANANA', 'Tanteliniaina', '1980-08-09', 'Betafo', '109011007263', '1999-05-28', 'Betafo', 87, 'Vakinankaratra', 'Antsirabe', 'M', NULL, NULL, '0347350030', 'ZkQwY2FXZDNDdUNOaGRRbjlua2Npdz09', 0, 'tanteliniaina.andriampanana@gmail.com', 'assets/images/default-male.svg', '2026-01-19', 7),
(24, 'RASOARIVELO NOMENJANAHARY', 'Lovasoa', '1997-08-23', 'Antatamo', '106332001978', '2016-10-16', 'Mnjakandriana', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0343775188', 'SkVibGo0NjB1N0VtLzhxSFpBbVI4dz09', 1, 'lnomenjanahary06@gmail.com', 'assets/images/default-male.svg', '2026-01-17', 7),
(25, 'RAHERINJATOVO', 'Harilanto Patrick', '1988-06-22', 'Soavinandriana', '101211184983', '2006-06-27', 'Tana 3', 87, 'Analamanga', 'Tana 2', '', NULL, NULL, '0348180137', 'UENDK0F4T3lDa0JiNitkeHFXSVBBWXRFSDRFc2VrVmxsL3VJajZyNVBOND0=', 0, 'pa_trick67@yahoo.fr', 'assets/images/profile_6982f4ff0ad6b.png', '2025-01-01', 7),
(26, 'Rakotoarison', 'Rovantsoa', '2000-01-10', 'Fianarantsoa', '201012027778', '2018-02-02', 'Fianarantsoa', 87, 'Itasy', 'Miarinarivo', '', NULL, NULL, '0337306819', 'S0RHN0J6UnBrRVhOZG5RSzI3YVZpQT09', 1, 'rovantsrakotoarison@gmail.com', 'assets/images/default-male.svg', '2026-01-21', 7),
(27, 'Ranarinantenaina', 'Jacques Rinah', '1984-05-16', 'Belavabary-Moramanga', '101981066555', '2002-07-09', 'Ambohimanarina-Antananarivo VI', 87, 'Flacq', 'Belair', 'M', NULL, NULL, '034091548754574001', 'cWs0bE5DODVtT0JzczZ0Z2Q3RlhEUT09', 0, 'rjacquesrinah24@gmail.com', 'assets/images/profile_6a3b6ea8b8b17.jpg', '2025-09-22', 7),
(28, 'Rajaonisoa', 'Vahatriniaina', '1991-10-06', 'Tsiroanomandidy', '111011015404', '2010-04-02', 'Tsiroanomandidy', 87, 'Anamanga', 'Antananarivo', '', NULL, NULL, '0340213170', 'UUdiK1N2a1d4YkVCN2NubUNLME1Ddz09', 0, 'rajaonisoa12@gmail.com', 'assets/images/default-male.svg', '2025-04-07', 7),
(29, 'RAZANAKOLONA', 'Honorine Antonine', '1979-10-23', 'Morondava', '508992008022', '1998-05-28', 'Morondava', 87, 'Boeny', 'Mahajanga', 'F', NULL, NULL, '0324084479034375', 'SWRYSEFYREJYQ2pPeENSV0kvSklCQT09', 0, 'mahajangaantonine1979@gmail.com', 'assets/images/profile_6983ecdb9cb74.jpg', '2026-01-19', 7),
(30, 'RAFALIARIVO', 'lovasoa Emmanuel', '1992-04-10', 'TRITRIVA', '108011019522', '2010-06-15', 'Antsirabe', 87, 'Vakinankaratra', 'Antsirabe I', '', NULL, NULL, '0347071443', 'Sk5NbkFjVGJBT0hBUmVUMnRZMFZJZz09', 0, 'lovasoaemmanuel@gmail.com', 'assets/images/default-male.svg', '2026-01-20', 7),
(31, 'Rasoalandy', 'Edmondia', '1993-03-23', 'Bekily', 'GGC290343', '2029-03-05', 'Norvège', 105, 'Stavanger', 'Tananger', '', NULL, NULL, '4799861757', 'TDVjbzM0dEFaS2dOMU9WRmlTaHRDZz09', 0, 'edmondia586@gmail.com', 'assets/images/profile_6982f3e7e65dd.jpg', '2026-01-15', 7),
(32, 'RABEMAMPIONONA', 'Sam Rino', '1994-08-02', 'Toamasina', '301071031228', '2012-08-09', 'Toamasina', 87, 'Antsinanana', 'Toamasina', '', NULL, NULL, '0348981600', 'cUVpMlc3aW10V0FhK2JYSGFUNWx3dz09', 0, 'sam.rino@yahoo.fr', 'assets/images/default-male.svg', '2026-01-17', 7),
(33, 'RANDRIAMANANTENASOA', 'ARO Olivier', '1997-01-28', 'Andoharanofotsy', '101221119975', '2015-10-27', 'Tana 2', 87, 'Antsinanana', 'Tamatave', '', NULL, NULL, '0348552327', 'QzhyZXJTK0twWFc3VGpaVmFDdHJUUT09', 0, 'aroolivier09@gmail.com', 'assets/images/profile_6983953b72d14.jpg', '2026-01-15', 7),
(34, 'RAMAMONJISOA', 'Nohajaina Andriamasiarivony', '2003-11-27', 'Mté Manankavaly Manjakandriana', '106212005252', '2021-12-07', 'Manjakandriana', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0343515734', '$2y$10$4VvaIIMzKp/ghOa/UqkLxuzHAB9XJgv5GHh8gvTHvacpjdTz.dxl2', 0, 'arivonyramamonjisoa5@gmail.com', 'assets/images/profile_6982eb390f55b.jpeg', '2025-09-08', 7),
(35, 'TIANJARA', 'Ivon Dominique', '1997-02-15', 'Ambodinivato', '308301035318', '2015-03-30', 'Mahanoro', 87, 'Atsinanana', 'Mahanoro', 'M', NULL, NULL, '0322514985', 'ckovQUVJbTY2bDFnV1hqak5EMk9WZz09', 0, 'dominiquetidem@gmail.com', 'assets/images/profile_69993ea721315.jpg', '2025-01-16', 7),
(36, 'RAHERINIAINA', 'Mamy', '1988-01-24', 'Ambohimandroso Amparafaravola', '312011017501', '2006-09-06', 'Amparafaravola', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0343265286', 'SEhuL0JsbTl2aWlGTjVNQXVmKzd4UT09', 0, 'serviceherosphoto@gmail.com', 'assets/images/profile_698985818585d.jpg', '2026-01-11', 7),
(37, 'Frédéric', 'Vince Gill', '1992-01-20', 'Vinanibe', '303011017861', '2011-06-27', 'Maroantsetra', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0343920956', 'bFI2cDdPbE8xeUFPTjc2ZVBrSFhZQT09', 0, 'Fredericvincegill@gmail.com', 'assets/images/profile_69830e0b1b51e.jpg', '2026-01-21', 7),
(38, 'Ambinimana', 'Lussele', '2001-10-10', 'Efatsy', '214011111806', '2020-11-03', 'Vangaindrano', 87, 'Antsimo antsinana', 'Farafangana', '', NULL, NULL, '0382821928', 'MENmaGRXN2NNNm84bmd0SEFEeDA1QT09', 1, 'aambinina444@gmail.com', 'assets/images/default-male.svg', '2026-01-16', 7),
(39, 'Manalintsoa', 'Fidele', '2004-08-11', 'Ambositra', '203011042454', '2022-09-16', 'Ambositra', 87, 'Boeny', 'Mahajanga', '', NULL, NULL, '0377517660', 'Y092RE1pY2g2b1NwV3hrendZQnpzUT09', 1, 'fidelemanalintsoa@gmail.com', 'assets/images/default-male.svg', '2026-01-22', 7),
(40, 'RAKOTONDRAZA', 'Andrianjafy Richard', '2001-04-10', 'Manandona', '118211009005', '2019-05-03', 'Antsirabe 2', 87, 'Analamanga', 'Antananarivo', 'M', NULL, NULL, '0387057093', 'WGlCT0dNY1grVmJVaUM4SDErbSsvdz09', 0, 'rakotondrazakaandrianjafyricha@gmail.com', 'assets/images/profile_6983511325ade.jpg', '2026-01-17', 7),
(41, 'Rakotomalala', 'Oniniaina salema', '1991-06-28', 'Soavinandriana', '103292002375', '2009-07-09', 'Ambohidratrimo', 87, 'Analamanga', 'Nanisana', '', NULL, NULL, '0340521450', 'YnJhc2FuVHhIYmpMUFUrcUllZ1JDUT09', 1, 'oniniainasalema@gmail.com', 'assets/images/default-male.svg', '2026-01-15', 7),
(42, 'RAVIMBININTSOA', 'René', '1995-01-21', 'Antoby Est Manazary Itasy', '103131015007', '2013-03-20', 'Ambohitrimanjaka', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '03404784430320706', 'd0FSZnViOG1GRWJKcld6cWIxQVpiZz09', 0, 'ravimbinintsoa50@gmail.com', 'assets/images/default-male.svg', '2025-02-03', 7),
(43, 'FENOSAY', 'Rambolanirina Nasandratra', '1989-03-26', 'Antananarivo', '101211189073', '2007-04-25', 'Antananarivo', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0349103417', 'TVpLdlAxN21mT3A1RHR1TGJyY1ZCUT09', 0, 'fenosayrn@gmail.com', 'assets/images/profile_69834377385a2.jpg', '2025-09-18', 7),
(44, 'Randriambololona', 'Sitraka', '1990-04-12', 'Antsirabe', '108051012971', '2008-10-01', 'Antsirabe', 87, 'Boeny', 'Mahajanga', '', NULL, NULL, '0347330543', 'ZElsT1BJcDhZTVdtZFVKTDRmb1FpUT09', 0, 'bessitraka.randriambololona@gmail.com', 'assets/images/profile_69842cbbe0664.jpg', '2025-01-18', 7),
(45, 'RAFANOMEZANTSOA', 'Ezra', '2019-09-20', 'Talata Volonondry', '101251189584', '2026-01-05', 'Tana V', 87, 'Analamanga', 'Soavimasoandro', '', NULL, NULL, '0344028099', 'QTVpVG8zU1VDQXJQUTZ2eVRwL0EyQT09', 1, 'rdse0209@gmail.com', 'assets/images/default-male.svg', '2025-12-27', 7),
(46, 'RANDRIAMNADROSO', 'Ramanalinarivo Angelot', '2006-05-17', 'Toliara', '201071009157', '2024-06-03', 'Andrainjato Fianarantsoa', 87, 'Fianarantsoa', 'Fianarantsoa', '', NULL, NULL, '0380735506', 'U2VvaHlTYVBqOGFLVlorWEdEeW9rdz09', 1, 'hovabedia@gmail.com', 'assets/images/default-male.svg', '2026-01-25', 7),
(47, 'RAHOLIMALALA', 'Bakoly Elie Noro', '1983-10-08', 'Ambohitrambo', '105012006842', '2002-04-09', 'Arivonimamo', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0347991336', 'bFVqVFd3a1U5ank0enNNUDEwVkJMSXhpZWdKdkJTSnRoM0pyblNha3ZRaz0=', 0, 'rbakelnoor@gmail.com', 'assets/images/default-male.svg', '2026-01-18', 7),
(48, 'ANDRIHERY', 'Nivonirina Sitraka Tiantsoa', '1989-03-30', 'Moramanga', '317011009507', '2007-01-16', 'Anosibe an\'ala', 87, 'Analanjirofo', 'Manompana', '', NULL, NULL, '0340313844', 'cmNyd1FHbmlZNUovMU04VnpDaDlLZkdSOUF5ekZsdTRhUWVNeXFIOW9qbz0=', 0, 'sitrakaandrisoa@gmail.com', 'assets/images/default-male.svg', '2025-09-08', 7),
(49, 'RATSIMBAHAFA', 'Solohery Ricky', '1994-03-06', 'Tana 3', '102031024779', '2012-05-12', 'Ankadikely Ilafy', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0347026212', 'N3R1RXdra1Zha1JRaXZpWk1EZG5DQT09', 0, 'kandroamamaka@gmail.com', 'assets/images/profile_6982edf46d3fb.jpeg', '2025-08-05', 7),
(50, 'NOMENIAVO', 'Tojohery Nemiah', '1999-06-18', 'Morarano Chrome', '312071025140', '2018-01-12', 'Amparafafaravola', 87, 'Alaotra Mangoro', 'Morarano Chrome', 'M', NULL, NULL, '0342345822', 'dS9RNmZsZWNWU3dYQWdob0xRbWIrdktQU0pKOWtMcy9rODAxOE10TGJpOD0=', 0, 'nomeniavotojoherynemiah@gmail.com', 'assets/images/profile_69bbdc23b0257.jpg', '2025-09-11', 7),
(51, 'RAHARIMAHASOA', 'Maria Lalatiana', '1993-06-13', 'Ambohidava', '313012029029', '2012-02-15', 'Ambatondrazaka', 87, 'Analamanga', 'Antananarivo', 'F', NULL, 'assets/images/pay_6a44f587abb8c.jpeg', '0346871114', 'VUVZWTBYQ09ZVVFCSEVmV3BBanpDZz09', 1, 'lalatianaraharimasoa@gmail.com', 'assets/images/profile_69832266c7975.png', '2025-03-12', 7),
(52, 'RANDRIANANTENAINA', 'Mamiharimanana Claudio', '2002-12-01', 'Toamasina', '301051033975', '2020-12-28', 'Toamasina 1', 87, 'Antsinanana', 'Toamasina 1', '', NULL, NULL, '0343612244', 'VlVva3pKVWxieGliTEtYaWtnNWM5UT09', 1, 'randrianantenainamihary49@gmail.com', 'assets/images/default-male.svg', '2026-01-20', 7),
(53, 'RAZAFINDRALAMBO', 'Mialitiana Rajaonarivelo', '1983-12-18', 'Ankadifotsy Antananarivo', '110012008101', '2000-03-27', 'Ambatolampy', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0342051227', 'RXhoY21Hd1RuTWg4aFRIZHNiUGR2QT09', 0, 'mialitiana1@yahoo.com', 'assets/images/default-male.svg', '2026-01-17', 7),
(54, 'RAZAFIMANDRANTO', 'Malanirina Diarisoa', '1998-12-27', 'Soavimbazaha', '112442008894', '2017-01-31', 'Miarinarivo', 87, 'Itasy', 'Miarinarivo', '', NULL, NULL, '0346294624', 'emJacGFpV01ueXZyWlVwRDlBa1VuUT09', 0, 'mandrantod@gmail.com', 'assets/images/default-male.svg', '2026-01-22', 7),
(55, 'Rakotomalala', 'Nomenjanahary Fifaliana', '2001-04-20', 'Fianarantsoa', '210011044512', '2019-06-28', 'Manakara', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0381397431', 'SmphWlBySDg0SHN4L2dOa0dOVDJTZz09', 0, 'fifaliananomenjanahary316@gmail.com', 'assets/images/profile_698713965dcfd.jpg', '2026-01-30', 7),
(56, 'RAZANAMAHANDRY', 'Lovaniaina', '2003-03-13', 'Andoranofotsy', '117172025303', '2021-04-21', 'Andoranofotsy', 87, 'Tananarive', 'Tananarive', '', NULL, NULL, '0341137882', 'WktoTmFCQk9rOVo0bElJekhXaWladz09', 0, 'razpatricia6@gmail.com', 'assets/images/profile_6982cdca5670d.jpg', '2026-01-20', 7),
(57, 'RASOLONIRINA', 'Tafita Frédéric', '2003-08-27', 'Fianaratsoa', '101231180738', '2026-01-28', 'Fianarantsoa', 87, 'Analamanga', 'Antananarivo', 'M', 'assets/images/6982d8171f408_101231180738.jpeg', 'assets/images/6982d8171f584_101231180738_payment.jpeg', '0381461361', 'Y1FtNUdPZFN0a00xUEh0bk5LS2d1UT09', 0, 'rasolonirinatafitafrederic31@gmail.com', 'assets/images/profile_6982dab37ca6d.jpg', '2024-12-04', 7),
(58, 'Tonton', 'Mamy', '1985-01-23', 'Mananjary', '10122111135', '2003-04-13', 'Antananarivo', 87, 'Analam', 'Antanananarivo', 'M', 'assets/images/identity_6988520b28ccd.jpg', 'assets/images/profile_6988520b28ded.jpg', '0347084049', 'QzRQWS9OaU9iZFAxQitjOFJpMlFhUT09', 0, 'niryinfo@gmail.com', 'assets/images/profile_6989d7ba6655f.jpg', '2026-02-08', 7),
(59, 'RAHOASA RAZAFIMAMPIONONA', 'Minoelisoa', '1991-05-18', 'HJRA Antananarivo', '401032038456', '2009-05-19', 'Mahajanga I', 87, 'Analamanga', 'Andoharanofotsy', 'F', NULL, NULL, '0344747348', '$2y$10$TbWLoaQCY2q9bCs/1WM4w.XcXPW7oLBtDiJHjTzB6SamwAuPE80EK', 0, 'minouskaelle@gmail.com', 'assets/images/default-female.svg', '2025-03-23', 7),
(60, 'RAZAFINTSALAMA', 'Maminiaina', '1998-11-22', 'Ihosy', '203011032235', '2016-11-21', 'Ambositra', 87, 'Itasy', 'Imerintsiatosika', '', NULL, NULL, '0349606790', 'OXVOMzdDM1lrOTlUVUY5YmZwRy9jdz09', 0, 'mrazafintsalama711@gmail.com', 'assets/images/profile_6989b310be6e1.jpg', '2026-01-27', 7),
(61, 'MAMPIONONDRAY', 'Elisah', '1997-12-23', 'Andina-Ambositra', '203092008536', '2016-09-30', 'Ambositra', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0343852757', 'dW1oWkszc3M0SER5QkpKTURIcGxqdz09', 0, 'tsimilefitratalosy@gmail.com', 'assets/images/default-male.svg', '2026-01-30', 7),
(62, 'FARAMALALA', 'Fiononantsoa Adrienne', '1994-01-17', 'Antananarivo III', '101222107532', '2012-04-23', 'Antananarivo II', 87, 'Boeny', 'Majunga', 'M', NULL, NULL, '0324083629', 'WUp4a0ljbko0ZytKTEZ2eW1VK3NmZz09', 0, 'afiononantsoa@gmail.com', 'assets/images/default-male.svg', '2026-01-09', 7),
(63, 'ALJY', 'Geralda', '1995-12-20', 'Lalangy VOHEMAR', '717011027491', '2014-03-14', 'Ambilobe', 87, 'DIANA', 'Ambilobe', '', NULL, NULL, '0322455570', 'cUp4dGNmVDU2dE1mY1I3V21BZjUrQT09', 1, 'aljygeralda12@gmail.com', 'assets/images/default-male.svg', '2026-01-27', 7),
(64, 'Ravelomananjara', 'Romeo', '2001-02-28', 'Toamasina 1', '301071042909', '2020-09-24', 'Toamasina 1', 87, 'Antsinanana', 'Tamatave', '', NULL, NULL, '0336750737', 'K0c3Q25Ia0pGS052ZnRrUGJ2UUF4QT09', 0, 'alpharoms91@gmail.com', 'assets/images/default-male.svg', '2026-01-05', 7),
(65, 'RAFIDIARIJAONA', 'RIJA CLEO', '1993-09-19', 'AMPANEFENA', '716231012153', '2011-08-29', 'VOHEMAR', 87, 'ANALAMANGA', 'ANTANANARIVO', '', NULL, NULL, '0327360012', '$2y$10$fFMDUPbOIYUYr0YRQT5POu72uFfsTeMGfM7X3MZ9ZJTje.2EeB4iS', 0, 'rijacleo2@gmail.com', 'assets/images/profile_6989822abefd8.jpeg', '2026-02-04', 7),
(66, 'Hanitriniaina', 'Sara', '1988-08-15', 'Antsirabe', '108052011974', '2006-11-08', 'Antsirabe', 87, 'Vakinankaratra', 'Antsirabe I', 'M', 'assets/images/cin_6a44fd12b6d80.jpeg', NULL, '0322204775', 'UTdDTkZrWDVMYkc5UllzUXVnVG9UQT09', 0, 'hanitrasara@gmail.com', 'assets/images/profile_6989f02e23de3.jpg', '2025-12-16', 7),
(67, 'ZAFIMANANTSOA', 'Moïse Anault', '2026-02-09', 'Ambatomitamba, Andranombolaha, toamasina 2', '301051019221', '2026-02-09', 'Toamasina 1', 30, 'Québec', 'Amos', 'M', NULL, NULL, '18193559383', 'QVRUNkVVNnVja2FTS3NGTWtZWFN2UT09', 0, 'moiseanault@gmail.com', 'assets/images/default-male.svg', '2026-02-09', 7),
(68, 'RANDRIAMANALINA', 'Lucky Valisoa', '2002-01-14', 'Madiomanana', '117311022640', '2020-01-27', 'Fenoarivo', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0338542454', 'R21pK2xncHRtNHJZOTJ1ODRyQnZJZz09', 0, 'valisoaluc@gmail.com', 'assets/images/profile_69897eca79f93.jpg', '2026-02-04', 7),
(73, 'Limbiarisaona', 'François d Assise', '1995-09-12', 'Nosy-be', '718991080374', '2014-06-10', 'Nosy-be', 87, 'Vakinankaratra ', 'Antsirabe', 'M', 'assets/images/1770640470_b0e20ea30452c0b79e6b.pdf', 'asssets/images/1770640470_8ebd45debafd8938abff.jpg', '0324325888', 'TWQ0WDI4SWpacFdZcGx2enVOb2lhRUlYUFdDdUo2SXdvbHFpRm93Sk9vRT0=', 0, 'francoisdigitalworks@gmail.com', 'assets/images/profile_6991b77422458.png', '2024-12-04', 7),
(74, 'RANDRIANANDRASANA', 'Soloniaina Fabrice', '2000-02-21', 'Moramanga', '105011016993', '2018-08-29', 'Arivonimamo', 87, 'Atsinanana', 'Toamasina', 'M', 'assets/images/1770641780_da9b3ff5e449c240a195.png', 'assets/images/1770641781_96548dfc966b79332974.jpeg', '0344052234', 'QWs1ZGxxNHMyRDduWUlOUmZYN2ZiUT09', 0, 'fabrice.aps218@gmail.com', 'assets/images/profile_6991b6a06d668.png', '2026-02-09', 7),
(75, 'RAKOTONIAINA', 'Tantely Jean Mickael', '1988-11-15', 'Ambodivoanjo', '101251148761', '2007-01-29', 'TANA V', 87, 'Analamanga', 'Manjakandriana', 'M', 'assets/images/1770641956_60ed9191ab069ee59c9b.pdf', 'assets/images/1770641956_df36c83763f8407ba5f3.jpg', '0349394655', 'WVVzTkZyd0phTk1NUi9hMjI5LyttQT09', 0, 'rakotoniainamicka@gmail.com', 'assets/images/default-male.svg', '2024-12-04', 7),
(76, 'RASOANOMENJANAHARY', 'Aline', '1984-05-16', 'Antanety Atsimo Ambohimanarina', '715.052.015.727', '2002-08-20', 'Antsiranana I', 87, 'Analamanga', 'ANTANANARIVO', 'F', 'assets/images/1770642309_6fda3abb8d8796a575f1.png', 'assets/images/1770642309_51ec95462ffbaf7621b0.jpg', '0341188704', 'RFI1RkxqOFN3NzBPNkU4YTN6UnhTVFVhTkZoRFRTd2F5c1I2VGlaMzJ5dz0=', 0, 'rasmialy2004@yahoo.fr', 'assets/images/profile_6992aeb2ee637.jpg', '2026-02-09', 7),
(77, 'Razanandrianadary ', 'Blanchardo Victorien ', '2002-03-25', 'Antsohihy, Sofia', '413011040674', '2020-10-09', 'Antsohihy ', 87, 'Sofia', 'Antsohihy ', 'M', 'assets/images/1770643196_b1312ccb643deec77a11.pdf', 'assets/images/1770643196_bd8c89f891dd87dc871d.pdf', '0349032322', 'cHZhSnVQNHFlWHA0OXh3KzFqVkU5V0Nmd1VDTldiQTlUdTNVT0I1bXB6VT0=', 0, 'blanchardovictorienrazanandria@gmail.com', 'assets/images/profile_6991b48265625.jpg', '2026-02-09', 7),
(78, 'RANDRIANIRINA', 'Monja Sitraky Ny Avo Fifaliana', '2000-10-13', 'Anosivavaka Ambohimanarina TANA VI ', '117211005640', '2018-04-13', 'Soalandy Ankadivoribe Atsimondrano ', 87, 'Analamanga ', 'Antananarivo', 'M', 'assets/images/1770643426_8858380fc1ff0446ca07.pdf', 'assets/images/1770643426_9daccf70f1b8dd9d1241.png', '0343560235', 'aVFmMSs0bUNOQ2RWbWZGdkJaRmhSQT09', 0, 'randrianirinanymonjafifaliana@gmail.com', 'assets/images/default-male.svg', '2026-02-09', 7),
(79, 'Raminoharintsoa ', 'Malala Nambinina ', '1994-06-06', 'Ampahimanga ', '102012014585', '2012-10-08', 'Alasora ', 87, 'Analamanga ', 'Tananarive', 'F', 'assets/images/1770645066_ebbbe3746ca08805aae5.jpg', 'assets/images/1770645067_85f1e2d42ca9294d3526.jpg', '0342380164', 'R2N3NVo5OExCWkoraldOZzBWUlBLZz09', 1, 'nambininaharintsoa6@gmail.com', 'assets/images/default-male.svg', '2024-12-04', 7),
(80, 'RAKOTOARISOA ', 'Rojoniaina Fabrice ', '1990-10-09', 'Fianarantsoa ', '104 012 006 461', '2009-02-12', 'Ankazobe ', 87, 'Alaotra Mangoro', 'AMPARAFARAVOLA ', 'F', 'assets/images/1770645630_464790bb9cb3d7e62761.jpeg', 'assets/images/1770645630_5deacb8a1ce9429b73af.jpeg', '0341905347', 'RW1CNWp6Q0hzN0Z0dEs0VFJNRzZHZz09', 0, 'rojoniainafabie@gmail.com', 'assets/images/profile_6991ce38df9ff.jpg', '2026-02-09', 7),
(81, 'LIMBIRAZA ', 'Marie Françoise ', '2002-05-31', 'NOSY BE ', '715052033389', '2020-11-04', 'Antsiranana I', 87, 'Diana', 'Diego Suarez ', 'F', 'assets/images/1770650249_26d3b66b31af406f257e.pdf', 'assets/images/1770650250_f80c9b534ca5e3cd7274.jpg', '0324376381', 'OUZJNFJOSXBtUzZmWjJEdDAySU05QT09', 1, 'limbirazamarie@gmail.com', 'assets/images/default-male.svg', '2026-02-09', 7),
(82, 'RABENAHINAMINOSOA TAHIANJANAHARY', 'Tokiniaina Olivier ', '1992-02-05', 'Maternité Anjahana - CR Mandiavato - MIARINARIVO ', '112131009475', '2012-01-03', 'Mandiavato ', 87, 'Itasy', 'Miarinarivo ', 'M', 'assets/images/1770664003_341086bedbe334ce7679.jpg', 'assets/images/1770664003_ec00ab18ad79d2bb3a02.jpg', '0342553438', '$2y$10$zxdnHsqSnAHoQ7vVG0OHh.PbZGRxtDALnFCWosIwNroIec5J/OC3K', 0, 'r.tokynyainaminosoa@gmail.com', 'assets/images/profile_699ac4d860fe4.jpg', '2024-12-04', 7),
(83, 'Lalaonirina', 'Philibert', '2006-07-02', 'Ambositra ', '203011019711', '2025-09-05', 'Ambatofinandrahana ', 87, 'Amoronmania', 'Ambositra', 'M', 'assets/images/identity_698d815aa47f4.jpg', 'assets/images/profile_698d815c067fa.jpg', '0382412331', 'WmVGT254c3JVeGVJVWFpK2JyZThHZz09', 1, 'manantsoajean01@gmail.com', 'assets/images/default-male.svg', '2026-02-12', 7),
(84, 'Jeanne', 'Arielle', '1997-02-02', 'Vavatenina', '315012029871', '2015-02-17', 'Vavatenina ', 87, 'Analanjirofo', 'Vavatenina', 'F', 'assets/images/1771077420_bde12535a9c958e6395e.jpg', 'assets/images/1771077422_419aa460145b7a5394d7.jpg', '0345087584', 'akh5YUhhaXBjTTRBU1FhWmNsU0pEUT09', 0, 'oscarettterety@gmail.com', 'assets/images/profile_6991b4a31b1d2.jpg', '2026-02-14', 7),
(86, 'Rakotonanahary', 'Oniantsa Nathalie', '1974-05-08', 'Itaosy', '101212124239', '1992-07-13', 'Tana1', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0347901213', 'NDdoTlRvQkNlNGs1SkgzYzlGTjQyQT09', 0, 'oniantsanathalie@gmail.com', 'assets/images/default-male.svg', '2025-10-22', 7),
(87, 'RAHAJASIMANANA', 'Njiva Angenie', '2026-02-27', 'Mandrosoa', '115051006558', '2026-02-02', 'Andràmasina', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0389601007', 'bldjd3hPaHdtWHR3UkRyQ040ejZrZz09', 1, 'rahajasimanana@gmail.com', 'assets/images/default-male.svg', '2026-02-09', 7),
(88, 'RASOLOFOSON', 'Hermann Tefaka Davidson', '1965-02-02', 'Mahajanga', '401991050623', '1985-09-19', 'Mahajanga', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '0349373868', 'WU1BVjF1cTJWNmxOaFlRcDRmMjB6QT09', 0, 'tefakadavidson@gmail.com', 'assets/images/profile_69943993eded0.png', '2024-04-15', 7),
(89, 'RAHARISOA', 'Tiana Lydia', '1994-10-17', 'Analamahitsy', '101252177010', '2012-08-27', 'Antananarivo V', 87, 'Analamanga', 'Antananarivo', 'F', NULL, NULL, '0340432956', 'NWNsTlpsOWxVaGVSWnF6QnFwSEFaUT09', 0, 'tianakely17@gmail.com', 'assets/images/profile_69bbcfd7ec52e.png', '2026-01-19', 7),
(90, 'RAZAFIMANJATO', 'Benarivo', '2005-07-07', 'Ambilombe', '117051025770', '2023-10-27', 'Fiombonana Antsimondrano', 87, 'Analamanga', 'Antananarivo', '', NULL, NULL, '383810847', 'RWZ6YnpPSXhkMFg5MCt1SUE4WXVQdz09', 1, 'benarivo2005@gmail.com', 'assets/images/default-male.svg', '2026-02-11', 7),
(91, 'RAKOTOARIMANANA', 'Nomena Fitahiana', '1998-12-17', 'Anjanahary', '101251200906', '2016-12-21', 'TANA V', 1, 'ANTANANARIVO', 'Ampitatafika', '', NULL, NULL, '0345915121', 'bzRkelpUSjN5b2RuVFFaN3VrcW91Zz09', 1, 'rakotoarimanananomena42@gmail.com', 'assets/images/default-male.svg', '2026-01-20', 7),
(92, 'RANDRIAMAHALEO', 'Andriamarotiana Hébert', '1994-11-28', 'Toamasina I', '301031023858', '2014-06-19', 'Toamasina I', 87, 'Analamanga', 'Antananarivo', 'M', NULL, NULL, '0328524274', 'bkVHUWpSMkJ4aW1qWFBjajBsa2xMUT09', 0, 'randriamahaleotiana@gmail.com', 'assets/images/default-male.svg', '2025-12-20', 7),
(93, 'JOLY', 'Kemba Jackino', '1981-08-21', 'Tana III', '103112005175', '2018-03-23', 'Ambohidratrimo ', 87, 'Analamanga', 'Antananarivo ', 'F', 'assets/images/1771248939_a4f869bb57ed6bec983b.jpeg', 'assets/images/1771248939_f24782ce8f5a9c3f07b0.jpeg', '0327656397', 'bGFPU0tneHhzbDR3VVZ1cWViLzNSZz09', 1, 'jkjackino@gmail.com', 'assets/images/default-female.svg', '2026-02-13', 7),
(94, 'Mahasolo Richade ', 'Christian ', '1990-08-03', 'Mahajanga ', '401011038899', '2018-08-08', 'Mahajanga I', 87, 'Boeny ', 'Mahajanga ', 'M', 'assets/images/1771440794_3a1727e46ade5a17b3da.jpg', 'assets/images/1771440794_e53207a4e636b5f13e31.jpg', '0324297191', 'TDRJclBGVXhPVzZyZ042NzBsZ0Zydz09', 0, 'richadechristian@gmail.com', 'assets/images/default-male.svg', '2024-12-04', 7),
(95, 'ARLA', 'Rindra', '2026-03-08', 'Antsirabe', '108071022798', '2026-06-30', 'Antsirabe', 87, 'Analamanga', 'Tana', 'M', 'assets/images/1771649350_5a2f3862c59b3968067e.pdf', 'assets/images/1771649350_458f4be3f5c550fcc872.jpg', '0347416203', 'bG5VS1dTR1luUS9OWmFOT2oyOGtVUT09', 1, 'rindraarla@gmail.com', 'assets/images/default-male.svg', '2026-01-30', 7),
(96, 'RAFARALAHY ', 'Théophile ', '1986-04-06', 'Tamatave', '301051014313', '2005-06-02', 'Tamatave ', 87, 'Analamanga', 'Antananarivo', 'M', 'assets/images/1771654972_e7c5233c8d5b68ace085.jpg', 'assets/images/1771654972_bb931ae9195a61ed5adf.jpg', '0349160518', 'WGU3SWdDMSs1dDVGb0hSNDZVcmhHdz09', 0, 'theophilerafaralahy@gmail.com', 'assets/images/default-male.svg', '2026-02-16', 7),
(97, 'TSIRINIAINA ', 'Jean de Matha ', '1991-08-19', 'Tsivangiana vatomandry', '307011007319', '2009-11-19', 'Vatomandry ', 87, 'Atsinanana ', 'Mahanoro ', 'M', 'assets/images/1771660795_88737b52e9d0369703ac.pdf', 'assets/images/1771660795_1b85f5ebd6a721fe361e.png', '0346151601', 'dXhKYTVHbG0xempJT2RMWGIrdWRadz09', 1, 'tsirmathadossier@gmail.com', 'assets/images/default-male.svg', '2026-02-21', 7),
(98, 'RAKOTONDRAINIBE ', 'Andraina Itokiana ', '2003-06-10', 'HJRA Pavillon Sainte Fleur', '101241215994', '2022-08-16', 'Antananarivo II', 87, 'Antananarivo ', 'Antananarivo', 'M', 'assets/images/1771662553_7f0cc235ee2cef1504ef.pdf', 'assets/images/1771662554_4e1d1c35c03f8dbce045.jpg', '0325438237', 'UHNZMkhCYkgxZG4yaEpZbWRHR216dz09', 1, 'rakotondrainibeitokiana42@gmail.com', 'assets/images/default-male.svg', '2026-02-04', 7),
(99, 'Deranjanahary', '', '1991-12-23', 'Ambozontany, Fandriana', '204011014230', '2010-02-25', 'Fandriana', 87, 'Analamanga', 'Antananarivo', 'M', 'assets/images/1771689239_902702f75c12c6533084.jpg', 'assets/images/1771689240_b216852e2ead273796d3.jpeg', '0344277346', 'eXlaNVphczc2L29wZ24zdE55aFE2Zz09', 0, 'deranjanahary@gmail.com', 'assets/images/default-male.svg', '2026-02-21', 7),
(100, 'Tolonjanahary', 'François Hilaire', '1996-01-13', 'Arivonimamo ', '105011013547', '2014-01-20', 'ARIVONIMAMO', 87, 'Itasy', 'Arivonimamo', 'M', 'assets/images/identity_699f1ad63cd93.jpg', 'assets/images/profile_699f1ad68b4d0.png', '0385305071', 'd3ArazRsTnl0ZVZxSFNPQkNSTnZtUT09', 0, 'tolonjanaharyhilaire9@gmail.com', 'assets/images/profile_699fee49be194.jpg', '2026-02-25', 7),
(101, 'RAKOTOMANDIMBY', 'Hasinavalona Mahefa José', '1994-06-19', 'Maternité Befelatanana', '101241159497', '2012-07-25', 'ANTANANARIVO IV', 87, 'Analamanga', 'Antananarivo', 'M', 'assets/images/identity_69a1b548de96f.png', 'assets/images/profile_69a1b549b06b8.png', '0341572910', 'WnZMUTI2MHBYcFdRcHZCZXlsdWN2Zz09', 0, 'hasinavalonamj@gmail.com', 'assets/images/profile_69ba6b5aaa89f.jpg', '2026-02-27', 7),
(102, 'ramiharisoa', 'herilalalaina', '1984-11-01', 'Antananarivo', '102091011521', '2004-06-28', 'Antananarivo', 87, 'Analamanga', 'Antananarivo', 'M', 'assets/images/identity_69a2f2f0d2f75.jpg', 'assets/images/profile_69a2f2f171e86.png', '0325915170', 'YlFGeG1NK0xPelRBblE3QjVmS2pvQT09', 0, 'hramiharisoa@gmail.com', 'assets/images/profile_69a5b38f41d22.jpeg', '2026-02-28', 7),
(103, 'RAMILIARINIVO', 'Mirantsoa', '1990-03-22', 'Ambohitrimanjaka Ambohidratrimo', '103132011519', '2008-07-16', 'Ambohidratrimo', 87, 'Itasy', 'Imerintsiatosika', 'F', 'assets/images/identity_69a5660a0b06f.png', 'assets/images/profile_69a5660b6e080.png', '0349259737', 'NjZCNUpQdE5xd2szT3VpZFRMUnFXZz09', 1, 'nehemiahlocation@gmail.com', 'assets/images/default-female.svg', '2026-03-02', 7),
(104, 'Randrianarivony', 'Heriniaina Jean Michel', '1996-04-09', 'Antananarivo', '401031049868', '2014-05-09', 'Mahajanga I', 87, 'Analamanga', 'Antananarive', 'M', 'assets/images/identity_69a5b18b07402.jpg', 'assets/images/profile_69a5b18cf0e61.png', '0342369705', 'UnV6a0M3SnpubktBN3U1U3lWQ2gxdz09', 0, 'heriniainarandria3@gmail.com', 'assets/images/profile_69a72057eb8d7.jpg', '2026-03-02', 7),
(105, 'RAKOTOARISOA', 'Juvence', '1998-11-24', 'Antalaha', '710011057026', '2017-02-09', 'Antalaha', 87, 'SAVA', 'Antalaha', 'M', 'assets/images/identity_69a5cf2a2de1e.jpg', 'assets/images/profile_69a5cf2a5c688.jpg', '0329348836', 'R3puWWVkdzBkNlJOVGdzWlR0WVc3Zz09', 0, 'juvencerakotoarisoa710@gmail.com', 'assets/images/default-male.svg', '2026-03-02', 7),
(106, 'RAKOTOARIMANANA', 'Amy Jara', '2004-12-22', 'Toamasina', '117031027228', '2013-02-13', 'Antananarivo', 87, 'Antsinanana', 'Toamasina', 'M', 'assets/images/identity_69a852abcc6e4.jpg', 'assets/images/profile_69a852ad4b2ca.png', '0343686800', 'bE5McStHZXNRWVI4TkozYzY2OWxKUT09', 0, 'jararakotoarimanana@gmail.com', 'assets/images/default-male.svg', '2025-09-04', 7),
(107, 'RADANIELSON', 'Jean Noël', '1987-08-21', 'Ambilobe', '715031014329', '2001-01-31', 'Antsiranana I', 87, 'Diana', 'Ambilobe', 'M', 'assets/images/identity_69a9c421200f0.jpg', 'assets/images/profile_69a9c421c0080.jpg', '0324053153', 'RUQ5OG5iYzZCL2JiM2d5UVF2bXhNdz09', 0, 'radanielsonjeannoel@gmail.com', 'assets/images/profile_6aa59861bed2c.png', '2026-03-05', 7),
(108, 'Rodin', 'Randriamanalina', '1994-04-14', 'Arivonimamo', '105011012352', '2012-06-06', 'ARIVONIMAMO', 87, 'Analamanga', 'Antananarivo', 'M', 'assets/images/identity_69b1146974596.jpg', 'assets/images/profile_69b1146974737.jpg', '0349959532', 'bmgrT2FCVEVlc3hlSlJJblgzc1Rydz09', 1, 'rodinrandriamanalina6@gmail.com', 'assets/images/default-male.svg', '2026-03-11', 7),
(109, 'RANDRIATSARAFARA', 'Jean Martin', '1985-05-30', 'Moramanga', '101251137911', '2004-09-16', 'Tana V', 87, 'Alaotra Mangoro', 'Moramanga', 'M', 'assets/images/identity_69b30f3379541.jpg', 'assets/images/profile_69b30f337976d.jpg', '0341903777', 'bWI1TDFSRXE3SGx3NmpWNExQenB5QT09', 0, 'randriatsarafara.jeanmartin@gmail.com', 'assets/images/profile_6a5b141766a53.png', '2026-03-12', 7),
(110, 'Ramarokoto', 'Sitraka', '1986-09-13', 'Antananarivo', '314011029777', '2004-09-22', 'MORAMANGA', 87, 'Alaotra Mangoro', 'Moramanga', 'M', 'assets/images/identity_69b95e3edba5f.jpg', 'assets/images/profile_69b95e3ff2d03.jpg', '0345587501', 'RXZYQ2JSOEZxZnNxU1NsbWczTVhBZFlZTEN0bGpXSTRieXBRUHlHT1lLMD0=', 0, 'sitraka.ramarokoto@gmail.com', 'assets/images/profile_69b98f34d3918.png', '2025-09-17', 7),
(111, 'RAKOTONJANAHARY', 'Nandrianintsoa Onja', '2002-03-16', 'Andranomena', '117121023406', '2020-06-24', 'Itaosy', 87, 'Analamanga', 'Anosibe', 'M', 'assets/images/identity_69c2b73ce988d.jpg', 'assets/images/profile_69c2b73ce9a4d.jpg', '0349772420', 'b3dac05DUVlSbWhkYkdNRUtUbHJSZz09', 0, 'Onjanandrianintso@gmail.com', 'assets/images/default-male.svg', '2026-03-24', 7),
(112, 'HANITRINIAINA', 'Marie Lollyta', '1998-01-23', 'Mahajanga', '413012032293', '2016-03-14', 'Antsohihy', 87, 'Boeny', 'Mahajanga', 'F', 'assets/images/identity_69c7c6133b0a7.jpg', 'assets/images/profile_69c7c61416215.jpg', '0341283588', 'NWIvOWt5Nk9hb1dWVnNieXlHWHlyQT09', 0, 'marielollyta@gmail.com', 'assets/images/default-female.svg', '2026-03-28', 7),
(113, 'RANDRIANIRINA', 'Tommy Allan', '2006-03-31', 'Ambatomainty', '101251248485', '2024-05-13', 'TANA V', 87, 'ANALAMANGA', 'ANTANANARIVO', 'M', 'assets/images/identity_6a39326bd534a.jpeg', 'assets/images/profile_6a39326bd5577.png', '0382272961', 'bWlrWHdrUG1SOUxYOVU4LzMyM2ljQT09', 0, 'randrianirina.tommy.allan@gmail.com', 'assets/images/default-male.svg', '2026-06-22', 7),
(114, 'MAMIHARISON', 'Danito Lartin', '1997-05-13', 'Portbergé', '409011030767', '2015-05-27', 'Portbergé', 87, 'Sofia', 'Portbergé', 'M', 'assets/images/identity_6a393a92733e2.png', 'assets/images/profile_6a393a92bc7c4.png', '0344546337', 'U1RzSDd2aWV0bEZxcmgyeHd5bnRoZ2pTdTBoM0NhbE5VMlRDQVpmM0RmTT0=', 0, 'mamidanitolartin@gmail.com', 'assets/images/profile_6a3a2b334bb01.png', '2026-06-22', 7),
(115, 'FOMAHAZOMARINA', 'Sophoniel', '1992-02-17', 'Fort Dauphin', '220071004838', '2010-04-08', 'Ivoamba Lalangina', 87, 'Toliara', 'Ambovombe', 'M', 'assets/images/identity_6a3a6e227f8f7.jpg', 'assets/images/profile_6a3a6e227fced.jpg', '0348470670', 'b1RNZ0pnZkhPV041VGk1cW1FNWoyUT09', 0, 'mahazodaniel@gmail.com', 'assets/images/default-male.svg', '2026-06-23', 7),
(116, 'Josoa', 'Compte test', '2006-10-24', 'Ambositra', '111212122312', '2023-01-13', 'ambosi', 87, 'ANALAMANGA', 'Antanananarivo', 'M', 'assets/images/identity_6a3ab643af092.jpg', 'assets/images/profile_6a3ab6443f9b7.jpg', '0335462338', 'NFVDNjNpbjJ0VFNrRmVOVTVUZnBUdz09', 0, 'josoarazafimandimby67@gmail.com', 'assets/images/profile_6a3abe7d0bcfc.jpg', '2026-06-23', 7),
(117, 'MAMINIRINA', 'Francia', '1999-02-09', 'Imady Ambositra ', '203012032571', '2017-02-13', 'Ambositra', 87, 'ANTANANARIVO', 'ANTANANARIVO', 'F', 'assets/images/identity_6a44e85bed588.jpg', 'assets/images/profile_6a44e85bed8cf.jpg', '0344845403', 'VzhScnVSRG9qRlJLQkNoME10NlozU24zS3J2a0lwdjJBWWVFQWJqeHl4ST0=', 0, 'maminirinafrancia56@gmail.com', 'assets/images/default-female.svg', '2026-07-01', 7),
(118, 'RAVANOSON', 'Tsaraboaka', '1997-01-01', 'Iabomary', '214511100256', '2015-09-08', 'Ambatolava', 87, 'Haute Matsiatra Fianarantsoa', 'Ambohimahasoa', 'M', 'assets/images/identity_6a44ef04735bd.jpg', NULL, '0343820557', 'YnY5VmhsbTNDOG5SM0NCbnVHdnNGdz09', 0, 'tsaraboaka97ravanoson@gmail.com', 'assets/images/default-male.svg', '2026-07-01', 7),
(119, 'RANDRIAMIARIAMBOLA', 'anjara', '1992-05-04', 'Ambatondrazaka', '313011026897', '2010-07-12', 'Ambatondrazaka', 87, 'Alaotra Mangoro', 'Ambatondrazaka', 'M', 'assets/images/identity_6a44fde5c5b4f.jpg', 'assets/images/pay_6a45093a1dd13.jpeg', '0388261987', 'NnczblhmUkc0TGdzcU4wNTJ4MmRMdz09', 0, 'anjarafootball@gmail.com', 'assets/images/default-male.svg', '2026-07-01', 7),
(120, 'Jeram', 'Jeram', '1994-02-11', 'Fianarantsoa', '201031038671', '2012-02-13', 'Fianarantsoa', 87, 'ANTANANARIVO', 'Antanananarivo', 'M', 'assets/images/identity_6a45137407eff.jpeg', 'assets/images/profile_6a451374084ec.jpg', '0348130039', 'dmhFRjZUWFV0cEF5QjgrTHhtd20vZz09', 0, 'jeramhybride@gmail.com', 'assets/images/default-male.svg', '2026-07-01', 7),
(121, 'Ramanatsoa', 'Herylala', '1991-05-09', 'Amparamanina Amparafaravola', '312031012085', '2009-09-11', 'Amparafafaravola', 87, 'Alaotra Mangoro', 'Tamatave', 'M', NULL, 'assets/images/profile_6a451600bf033.jpg', '0341171900', 'WHJqWTk1UDdrRzJTTE5YNWxraEh0dz09', 0, 'herylalara00@gmail.com', 'assets/images/default-male.svg', '2026-07-01', 7),
(122, 'RANDRIAMAHEFA', 'Vonjiniaina Faniry José', '2002-06-23', 'Tamatave', '102371011022', '2020-09-10', 'Talata Volonondry ', 87, 'ANTANANARIVO', 'ANTANANARIVO', 'M', 'assets/images/identity_6a455440c8231.jpg', 'assets/images/profile_6a455440c85e7.jpg', '0342397895', 'NTNEZ2pJNmpJUmxRQndUQU9nL0s4UT09', 0, 'fanirijose@gmail.com', 'assets/images/profile_6a51f8609e8a1.png', '2026-07-01', 7),
(123, 'Yamicole', 'Wendynesyndiana', '1998-04-15', 'Maromitety vavatenina ', '305012044771', '2019-09-16', 'Fenerivo Antsinana ', 87, 'Analanjirofo', 'Fenerivo Antsinana ', 'F', 'assets/images/identity_6a455c50b70c4.jpg', 'assets/images/profile_6a455c51c1d9a.jpg', '0342692840', 'dmQ0aGpCNVdNRUVGaG9GaDV2R3lLZz09', 0, 'syndianawendineyamicole@gmail.com', 'assets/images/default-female.svg', '2026-07-01', 7),
(124, 'RAVELOARINTSOA', 'Mirana Eva', '1992-02-14', 'Antananarivo', '101232147735', '2010-04-07', 'Antananarivo', 87, 'ANALAMANGA', 'ANTANANARIVO', 'F', 'assets/images/identity_6a456929a9865.jpg', 'assets/images/profile_6a456929a9c30.jpg', '0344466886', 'YTFCS20vbkZDRkRGbzI1aTZvb3JtUT09', 0, 'miranaeva295@gmail.com', 'assets/images/default-female.svg', '2026-07-01', 7),
(125, 'RAHARIMILAMANANA', 'Eric Nantenaina', '1996-07-09', 'Anempoka Andramasina', '103151018299', '2014-10-06', 'Ambohidratrimo', 87, 'Atsinanana', 'Toamasina', 'M', 'assets/images/identity_6a45fd687508f.png', 'assets/images/profile_6a45fd6d3d048.png', '0341221692', 'ZW5PS0ExVkZLQmo4Y0U1R1N1aXRjSzZ6YWlxSGUwRWw4dXNrN0hyNEpaWT0=', 0, 'ericnantenaina10@gmail.com', 'assets/images/default-male.svg', '2026-07-02', 7),
(126, 'Marsonfrederic', 'TSANGANASY', '1997-05-24', 'SAHASINAKA MANAKARA ', '216011024656', '1997-05-24', 'Antananarivo', 87, 'ANTANANARIVO', 'Ampasampito', 'M', 'assets/images/identity_6a4620979c56a.jpg', 'assets/images/profile_6a462097e1130.jpg', '0345912903', 'TjgrWjJHWVUzd3k0cUMrSHdVRlNSdz09', 0, 'tsanganasymarsonfrederic@gmail.com', 'assets/images/default-male.svg', '2026-07-02', 7),
(127, 'RANDRIAMIANDRA', 'Zolinirina Miharisoa Hasinarivo', '1978-09-28', 'Antsirabe', '101252109730', '1996-10-08', 'Antananarivo', 87, 'Vakinankaratra ', 'Betafo ', 'F', 'assets/images/identity_6a4626de80cff.jpg', 'assets/images/profile_6a4626e03f001.jpg', '0342160055', 'ckFYN3FXVVRpeEhma2QxbHNhc2ZUZz09', 0, 'zlrandria@gmail.com', 'assets/images/default-female.svg', '2026-07-02', 7),
(128, 'RATEFINANAHARY', 'Santatriniaina', '1993-12-17', 'Arivonimamo', '105011013331', '2013-08-13', 'ARIVONIMAMO', 87, 'Antsinanana', 'Brickaville ', 'M', 'assets/images/identity_6a462c863f2dd.jpg', 'assets/images/profile_6a462c87a6803.jpg', '0344104993', 'dVN2RWVDSkJXRHBvQkNyL0F2OFM1Vlhjbkk3SkVTWnFMK2dUS2VOYm5HMD0=', 0, 'ratefyson5@gmail.com', 'assets/images/default-male.svg', '2026-07-02', 7),
(129, 'RASOLONIAINA', 'Mami Derysson', '2000-02-12', 'Mahitsy', '103152022162', '2000-02-12', 'Ambohidratrimo', 87, 'ANALAMANGA', 'ANTANANARIVO', 'M', 'assets/images/identity_6a46a0d87bdd5.jpg', 'assets/images/profile_6a46a0dbcf7ab.jpg', '0341623753', 'L1UwRmJMYTZaeHlBQm10TTFHaVdaZz09', 0, 'mamiderysson@gmail.com', 'assets/images/default-male.svg', '2026-07-02', 7),
(131, 'RANDRIAMIFIDIARIVONY ', 'Irina Martial ', '1998-06-02', 'Anororo', '312051016880', '2017-01-02', 'Amparafaravola', 87, 'Alaotra Mangoro', 'AMPARAFARAVOLA ', 'M', 'assets/images/identity_6a49a1f6374f0.jpg', 'assets/images/profile_6a49a1f6af24e.jpg', '0382526417', 'djNQTWZsdENqbmU2MkRSWDJmclcvdz09', 0, 'martialrandriamifidy49@gmail.com', 'assets/images/default-male.svg', '2026-07-05', 7),
(132, 'DJAOMAHERY', 'Francis', '2001-09-25', 'Antananambo ', '413011039667', '2019-12-06', 'Antsohihy ', 87, 'ANTANANARIVO', 'Antananarivo', 'M', 'assets/images/identity_6a4aa0f0caca6.jpg', 'assets/images/profile_6a4aa0f288157.png', '0328944537', 'WWppelZrN1k0eGNTYmhoTHAySmlpdz09', 0, 'francisedjaomahery@gmail.com', 'assets/images/default-male.svg', '2026-07-05', 7),
(133, 'RASOAMIARAMANANA', 'Andry Lalaina Michel', '1993-09-08', 'Ivakaka Amparafaravola', '313011028696', '2011-09-28', 'Ambatondrazaka', 87, 'Atsinanana', 'Toamasina', 'M', 'assets/images/identity_6a4b5e9279136.jpg', 'assets/images/profile_6a4b5e9279277.jpg', '0344049118', 'ZGU2WGREUmIxdkE2Tjk5T01SSU5jdz09', 0, 'arasoami@gmail.com', 'assets/images/default-male.svg', '2026-07-06', 7),
(134, 'Razafinirina ', 'Patricia Edine', '1988-07-07', 'Maevatanana', '404012006678', '2006-11-13', 'Maevatanana', 87, 'Menabe', 'Miandrivazo ', 'F', 'assets/images/identity_6a4c0412cac0c.jpg', 'assets/images/profile_6a4c0414072bc.png', '33609672719', 'ejZUQVEzejRLVU1USUpUYmFNbzdFN0VwZXhiZDB2WCs5VDIvMVN3Q3pVWT0=', 0, 'razafinirina07@gmail.com', 'assets/images/default-female.svg', '2026-07-06', 7),
(135, 'RAMITAMPIHAVANANA', 'Tafita Rolland', '1997-03-27', 'Andranomanelatra', '118111016364', '2017-03-30', 'Antsirabe 2', 87, 'ANALAMANGA', 'ANTANANARIVO', 'M', 'assets/images/identity_6a4f73ab6217e.jpg', 'assets/images/profile_6a4f73acf18cc.jpg', '0346098481', 'bmVJaC9kS3h3ZXRiN3JiUlpRSW9XZz09', 0, 'tafitarolland@gmail.com', 'assets/images/profile_6a4f8b385e45b.jpg', '2026-07-09', 7),
(136, 'RANDRIAMAMPIANINA TOLOJANAHARY ', 'Rova Navalona ', '2003-06-10', 'Antananarivo', '101981116618', '2021-06-21', 'Ambohimanarina-Antananarivo VI', 87, 'ANALAMANGA', 'ANTANANARIVO', 'M', 'assets/images/identity_6a4f83f89d148.jpg', 'assets/images/profile_6a4f83f8c693c.jpg', '0343255753', 'dzlwZmpvSXZiWjBBRTV6QlY4K2dwdz09', 0, 'rovanaval6048@gmail.com', 'assets/images/default-male.svg', '2026-07-09', 7),
(137, 'Andriambola', 'Tsiory Mashiyyat', '1998-01-27', 'Antananarivo', '101251194915', '2015-12-29', 'Antananarivo', 87, 'Analamanga', 'Antananarivo', 'M', 'assets/images/identity_6a4f8af2eea29.jpg', 'assets/images/profile_6a4f8af464eb4.jpg', '0346119897', 'aDJ6N0hCU3JnelBXam5qVjJXT29kUT09', 0, 'andriambolatsiory@gmail.com', 'assets/images/default-male.svg', '2026-07-09', 7),
(138, 'RANDRIANJAFY', 'Sitraka', '1994-10-03', 'Antananarivo', '101 231 154 692', '2012-10-16', 'Antananarivo III', 87, 'Analamanga', 'Antananarivo', 'M', 'assets/images/identity_6a521e012f7ae.jpg', 'assets/images/profile_6a521e012f9c6.jpg', '0347766408', 'aVR3NEVuOG51bTFCSmJuT3NJc3lNdz09', 0, 'randrianjafysitraka1@gmail.com', 'assets/images/default-male.svg', '2026-07-11', 7),
(139, 'Rajaoarisoa', 'Pascal olivier', '1985-04-08', 'Benenitra', '502011004840', '2004-07-02', 'Manja', 87, 'Menabe', 'Mahabo', 'M', 'assets/images/identity_6a55fedcb77b9.jpg', 'assets/images/profile_6a55fede804ba.jpeg', '0344720618', 'ZU50SmF3OW9xUlNwOUlQOWdka1gyUT09', 0, 'pascalrajaoarisoa@gmail.com', 'assets/images/default-male.svg', '2026-07-14', 7),
(140, 'RAVELONATOANDRO', 'Hasinavalona', '1999-03-18', 'Vohimarina ', '113 171 007 757', '2017-09-01', 'Soavinandriana ', 87, 'Itasy/Antananarivo ', '117', 'M', 'assets/images/identity_6a59ffd0398f5.jpg', 'assets/images/profile_6a59ffd1c0805.jpg', '0339272938', 'bDRCbUx1ODBydjVLL2lsWi8yekRPQT09', 0, 'hasinavalona9@gmail.com', 'assets/images/default-male.svg', '2026-07-17', 7),
(141, 'SOARINANDRASANA', 'Tafita', '1994-03-19', 'Fianarantsoa', '201 052 011 545', '2012-03-21', 'Fianarantsoa', 87, 'ANALAMANGA', 'ANTANANARIVO', 'F', 'assets/images/identity_6a670ec63a5b8.jpg', 'assets/images/profile_6a670ec683f0f.jpeg', '0344850395', 'UDdOemthRGlMWGgwTURRbmVPeENOZz09', 0, 'tafitanandrasana@gmail.com', 'assets/images/default-female.svg', '2026-07-27', 7),
(142, 'RAKOTONDRAMPARANY ', 'Tahirinambinina Judicael ', '1991-08-08', 'Antananarivo', '117 071 015 535', '2009-09-04', 'Antananarivo Antsimondrano', 87, 'Analamanga', 'ANTANANARIVO', 'M', 'assets/images/identity_6a6853fe6bbe5.jpg', 'assets/images/profile_6a6853feeda61.jpg', '0383759377', 'Q00zZUxUR3BRcFpTMlJGRDVqS1U4Zz09', 0, 'tahiryrakotondramparany@gmail.com', 'assets/images/default-male.svg', '2026-07-28', 7),
(143, 'Rakotondravao ', 'Holiarilanto Evah ', '1992-09-09', 'Antsirabe', '108112021987', '2010-10-27', 'Antsirabe 1', 87, 'ANALAMANGA', 'Antehiroka ', 'F', 'assets/images/identity_6a694ea5b3daa.jpg', 'assets/images/profile_6a694ea604fcf.jpg', '0340133434', 'TWJTQVBMWGV2THJmeGRkVjlCNldOWjBac3BUdHpoZEN3RlNzQWtwZ1ZBND0=', 0, 'rakotondravaoholiarilantoevah@gmail.com', 'assets/images/default-female.svg', '2026-07-29', 7),
(144, 'RAKOTONDRAMBOLA', 'Asera', '1988-05-14', 'Amparafavola', '312131007412', '2006-07-17', 'Amparafafaravola', 87, 'Vakinankaratra', 'Antsirabe I', 'M', 'assets/images/identity_6a74b982a7154.jpg', 'assets/images/profile_6a74b982af25a.jpg', '0348126470', 'cmhyL29QUUFyZXJ1dytlS2xwOHgzUT09', 0, 'isakarrambol@gmail.com', 'assets/images/default-male.svg', '2026-08-06', 7),
(145, 'ANJARASOA', 'Jean Urbain', '2002-02-16', 'Antalaha', '710011062028', '2018-10-30', 'Antalaha', 87, 'ANALAMANGA', 'Antananarivo', 'M', 'assets/images/identity_6a74ce03d28e9.jpg', 'assets/images/profile_6a74ce04b4475.png', '0324015217', 'SFlLbWlwK3F6bXM5RTM0S1c2Vml3QT09', 0, 'urbainjean15@gmail.com', 'assets/images/profile_6a758b5eeca39.jpg', '2026-08-06', 7),
(146, 'RAVONIMANANTENA ', 'Fanilonomena Andrea ', '1996-09-02', 'Bealanana', '101252188374', '2014-09-29', 'Antananarivo V', 87, 'ANALAMANGA', 'ANTANANARIVO', 'F', 'assets/images/identity_6a76b73a9a790.jpg', 'assets/images/profile_6a76b73c01600.jpg', '0349977054', 'cG0rbTF2UXRhN0dCbERLNTlqaTlSZz09', 0, 'noumravonimanantena@gmail.com', 'assets/images/default-female.svg', '2026-08-08', 7),
(147, 'RAZANAPERA ', 'Andriantsitoniaina Finoana Nirina Mampionona ', '1997-04-12', 'Antananarivo', '401011055401', '2015-06-19', 'Mahajanga I', 87, 'DIANA', 'Diego Suarez ', 'M', 'assets/images/identity_6a7a631a3585a.jpg', 'assets/images/profile_6a7a631b39fc3.jpg', '0324950692', '$2y$10$na6SA6vEXzwSEMoU5n8yfOX7tXsjuoolnfPkZcAVTpPZ76plMOegG', 0, 'razadesignpro@gmail.com', 'assets/images/default-male.svg', '2026-08-10', 7),
(148, 'RABEZANAHARY ', 'Tantely Heritiana ', '1989-11-02', 'Ambatomainty', '101251155220', '2008-07-01', 'TANA V', 87, 'ANALAMANGA', 'ANTANANARIVO', 'M', 'assets/images/identity_6a8289b0bc8e1.jpg', 'assets/images/profile_6a8289b17c63e.jpg', '0349036375', '$2y$10$Ir5AO4RFh2fh0I/VFvvASu9ec02J2J4VEZlDHXqx5yfQ/BPmui51u', 0, 'rtheritiana@gmail.com', 'assets/images/default-male.svg', '2026-08-17', 7),
(149, 'RAZAFIMAMELONA', 'Harisoa Jacquette', '1987-01-04', 'Sambava', '712032003155', '2008-02-01', 'Andapa', 87, 'Antsiranana', 'Antalaha', 'F', 'assets/images/identity_6a9088b7253a1.jpg', 'assets/images/profile_6a9088b755540.jpg', '0344622807', 'U1JwYVlqMFhmc01ZM1NkZ21vUVNZQT09', 0, 'harrisoaa@gmail.com', 'assets/images/default-female.svg', '2026-08-27', 7),
(150, 'Andriamihaja', 'sitraka', '1991-02-22', 'Antananarivo', '101.241.143.761', '2009-03-04', 'tana 4', 87, 'ANTANANARIVO', 'ANTANANARIVO', 'M', 'assets/images/identity_6a9833f4a176e.jpg', 'assets/images/profile_6a9833f4a1980.jpg', '23059650413', 'aW5KYmJ6V1NrYUxuMmVuSE51RUdzdz09', 0, 'sixandriamihaja6@gmail.com', 'assets/images/default-male.svg', '2026-09-02', 7),
(151, 'RATOMBOHARIMELY', 'Manana Emileynico ', '1997-01-31', 'Mandritsara', '401031051354', '2015-02-17', 'Mahajanga I', 87, 'Fianarantsoa', 'Manakara', 'M', 'assets/images/identity_6a985babea8b4.jpg', 'assets/images/profile_6a985baccc781.jpg', '0340431178', 'aVRWN1Y1MGhRTVVOVEUybFZiaWhqQT09', 0, 'ratomboharimelymanana@gmail.com', 'assets/images/default-male.svg', '2026-09-02', 7),
(152, 'Fanekea ', 'Arsène Gustera ', '1993-04-12', 'Morondava', '508991022687', '2011-12-01', 'Morondava', 87, 'Fitovinany ', 'Fianarantsoa', 'M', 'assets/images/identity_6a990e062dcf4.jpg', 'assets/images/profile_6a990e079f92b.jpg', '0347753763', 'aXNGakZ2MjlyTHJDWUR2QVVnbFZUQT09', 0, 'fanekeag@gmail.com', 'assets/images/default-male.svg', '2026-09-03', 7),
(153, 'TSIFEFIKE', 'Arsène', '1995-06-11', 'Morondava', '421011009248', '2013-09-20', 'Maintirano', 87, 'Toliara', 'Belo sur Tsiribihina', 'M', 'assets/images/identity_6a99120870f56.jpg', 'assets/images/profile_6a99120871135.jpg', '0328851565', 'Ykx0ckxDdDVUUE1CdW82MTFEeWYxdm1JSlZWM21KMm5nMXV2OGhHTGhjTT0=', 0, 'atsifefike@gmail.com', 'assets/images/default-male.svg', '2026-09-03', 7),
(154, 'RAKOTOARIMANANA ', 'Vololonarivo Michel', '1971-05-13', 'Moramanga', '101251075451', '1990-07-03', 'Antananarivo V', 87, 'ANALAMANGA', 'Anosy Avaratra', 'M', 'assets/images/identity_6a99a27b6cc72.jpg', 'assets/images/profile_6a99a27c7e5aa.png', '0347650530', 'enY3ZmEwQWNDVDFTQndLZHpRNVF6QT09', 0, 'rmiel05@gmail.com', 'assets/images/default-male.svg', '2026-09-03', 7),
(155, 'RANDRIAMAMPIADANA', 'Pierre Célestin', '1994-05-06', 'Fianarantsoa', '201031039044', '2012-05-08', 'Fianarantsoa', 87, 'Haute Matsiatra Fianarantsoa', 'Ambalavao Fianarantsoa', 'M', 'assets/images/identity_6a99a48348604.png', 'assets/images/profile_6a99a48348716.jpeg', '0347387775', 'cmZwM2tTVVFYd1ErZ3dGSCtBSXNXUT09', 0, 'pr.celest1@gmail.com', 'assets/images/default-male.svg', '2026-09-03', 7),
(156, 'RANDRIANIAINA SOLOHANITRA ', 'Zo', '1977-11-08', 'Antsohihy, Sofia', '101211140536', '1996-07-02', 'Antananarivo 1', 87, 'Toliara', 'Toliara ', 'M', 'assets/images/identity_6a9fa67b0150d.jpg', 'assets/images/profile_6a9fa67bb7803.jpg', '0344847649', 'dE42SDNHQkVVN2w5Z0I3RVptRDBMQT09', 0, 'randriazou@yahoo.fr', 'assets/images/default-male.svg', '2026-09-08', 7),
(157, 'Razakandraina ', 'Olivier ', '1977-06-20', 'Itaosy Antananarivo ', '101211137185', '1995-09-06', 'Antananarivo 1', 87, 'Atsinanana', 'Toamasina', 'M', 'assets/images/identity_6a9ff5b27cc50.jpg', 'assets/images/profile_6a9ff5b349a0e.jpg', '0343111267', 'K2tERlJrZnB5VzF1N2t0UXZCdTdRdz09', 0, 'olivierrazaka20@gmail.com', 'assets/images/default-male.svg', '2026-09-08', 7),
(158, 'Rakotoarisoa', 'Finaritra', '1993-10-06', 'Manjakandriana', '106301032038', '2010-06-02', 'Manjakandriana', 87, 'Analamanga', 'Antanananarivo', 'M', 'assets/images/identity_6aa2578c03dde.jpg', 'assets/images/profile_6aa2578d3655e.jpg', '0347027858', 'dUNXMFAyVWZiaU92c2VOQitTeHlnZ0N5SW9jLzVRRk95MzFMeTFGdDlWQT0=', 0, 'finnaritra@gmail.com', 'assets/images/default-male.svg', '2026-09-10', 7),
(159, 'LARISSA ', 'Charlette Sanya ', '2001-08-26', 'Brickaville ', '306012025604', '2020-06-25', 'Brickaville ', 87, 'Antsinanana', 'Brickaville ', 'F', 'assets/images/identity_6ab26e97c21f6.jpg', 'assets/images/profile_6ab26e9857486.jpg', '0343534079', 'N1J3TUVWL0pYNkxnSnVYMzlUNUt6UT09', 0, 'sanyalarry30@gmail.com', 'assets/images/default-female.svg', '2026-09-22', 7);
INSERT INTO `aem_user` (`aem_id_user`, `aem_name`, `aem_first_name`, `aem_date_of_birth`, `aem_place_of_birth`, `aem_id_number`, `aem_id_issue_date`, `aem_id_issue_place`, `aem_country`, `aem_state`, `aem_city`, `aem_sex`, `aem_identity_photo`, `aem_payment_screenshot`, `aem_phone_number`, `aem_user_password`, `aem_password_is_temporary`, `aem_user_email`, `aem_profile_picture`, `aem_rollement_date`, `aem_id_function`) VALUES
(160, 'Razafindratsira ', 'José Herman ', '1999-03-05', 'Fianarantsoa', '206051009633 ', '2017-10-10', 'Ifanadiana ', 87, 'Madagascar', 'Ranomafana ', 'M', 'assets/images/identity_6ab35a87b1059.jpg', 'assets/images/profile_6ab35a890f086.jpg', '0342001672', 'TFpGRzc2aUE1NURsR0YwYXV5N1lsZz09', 0, 'razafindratsiraherman@gmail.com', 'assets/images/default-male.svg', '2026-09-23', 7),
(161, 'Rakotondrainibe ', 'Natanaela ', '2004-06-26', 'Faliarivo ', '117011044933', '2022-08-03', 'Ampitatafika ', 87, 'ANTANANARIVO', 'Ampitatafika', 'M', 'assets/images/identity_6ab520fb4eb7c.jpg', 'assets/images/profile_6ab520fb4edb9.jpg', '0382707854', 'SmY0WnJSRWlla3h3bEhvVW1JUFJmdz09', 0, 'natanaelarakotondrainibe@gmail.com', 'assets/images/default-male.svg', '2026-09-24', 7),
(162, 'IARONJATOVO', 'Riken', '2004-06-28', 'Ambatomainty', '312031022414', '2023-03-03', 'Amparafaravola', 87, 'ANALAMANGA', 'ANTANANARIVO', 'M', 'assets/images/identity_6ac11c2fdff17.jpg', 'assets/images/profile_6ac11c2fe00d7.jpg', '0387161033', 'f3d2b1a0e5c4d6f7a8b9c0d1e2f3a4b5', 0, 'ravo@gmail.com', 'assets/images/default-male.svg', '2026-10-03', 7),
(163, 'Admin', 'Test', '1990-01-01', 'Antananarivo', '101000000001', '2015-01-01', 'Antananarivo', 87, 'Analamanga', 'Antananarivo', 'M', NULL, NULL, '0340000001', 'YkNZb3NFOVNFcU44Z2l4RjB2VHBRQT09', 0, 'admin.test@aem.local', NULL, '2026-10-19', 7),
(164, 'Client', 'Test', '1995-05-05', 'Antananarivo', '101000000002', '2018-01-01', 'Antananarivo', 87, 'Analamanga', 'Antananarivo', 'F', NULL, NULL, '0340000002', 'RStWemRvZkI1azhQMUg3TXRsaDg0Zz09', 0, 'client.test@aem.local', NULL, '2026-10-19', 7);

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created_at`) VALUES
(1, 'Discussion générale', '2025-11-11 12:08:23');

-- --------------------------------------------------------

--
-- Structure de la table `group_messages`
--

CREATE TABLE `group_messages` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aem_account`
--
ALTER TABLE `aem_account`
  ADD PRIMARY KEY (`aem_id_account`);

--
-- Index pour la table `aem_activity`
--
ALTER TABLE `aem_activity`
  ADD PRIMARY KEY (`aem_id_activity`);

--
-- Index pour la table `aem_activity_image`
--
ALTER TABLE `aem_activity_image`
  ADD PRIMARY KEY (`aem_id_image`),
  ADD KEY `aem_activity_image_activity` (`aem_id_activity`);

--
-- Index pour la table `aem_admin`
--
ALTER TABLE `aem_admin`
  ADD PRIMARY KEY (`aem_id_admin`),
  ADD KEY `aem_id_user` (`aem_id_user`);

--
-- Index pour la table `aem_admin_log`
--
ALTER TABLE `aem_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_admin_log_user` (`aem_id_user`),
  ADD KEY `idx_admin_log_date` (`created_at`);

--
-- Index pour la table `aem_attendance_list`
--
ALTER TABLE `aem_attendance_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aem_id_user` (`aem_id_user`);

--
-- Index pour la table `aem_auth_tokens`
--
ALTER TABLE `aem_auth_tokens`
  ADD PRIMARY KEY (`aem_id_token`),
  ADD KEY `idx_token` (`token`(255)),
  ADD KEY `idx_user_id` (`aem_id_user`),
  ADD KEY `idx_expires_at` (`expires_at`);

--
-- Index pour la table `aem_comment`
--
ALTER TABLE `aem_comment`
  ADD PRIMARY KEY (`aem_id_comment`),
  ADD KEY `idx_comment_publication` (`aem_id_publication`),
  ADD KEY `idx_comment_user` (`aem_id_user`),
  ADD KEY `idx_comment_parent` (`aem_parent_id`);

--
-- Index pour la table `aem_contribution`
--
ALTER TABLE `aem_contribution`
  ADD PRIMARY KEY (`aem_id_contribution`),
  ADD KEY `aem_id_user` (`aem_id_user`),
  ADD KEY `fk_contribution_account` (`aem_id_account`);

--
-- Index pour la table `aem_contribution_payment`
--
ALTER TABLE `aem_contribution_payment`
  ADD PRIMARY KEY (`aem_id_cpay`),
  ADD KEY `aem_cpay_reference` (`aem_reference`);

--
-- Index pour la table `aem_contribution_periode`
--
ALTER TABLE `aem_contribution_periode`
  ADD PRIMARY KEY (`aem_id_contribution_periode`);

--
-- Index pour la table `aem_contribution_price`
--
ALTER TABLE `aem_contribution_price`
  ADD PRIMARY KEY (`aem_id_contribution_price`);

--
-- Index pour la table `aem_country`
--
ALTER TABLE `aem_country`
  ADD PRIMARY KEY (`aem_id_country`);

--
-- Index pour la table `aem_document`
--
ALTER TABLE `aem_document`
  ADD PRIMARY KEY (`aem_id_document`);

--
-- Index pour la table `aem_donation`
--
ALTER TABLE `aem_donation`
  ADD PRIMARY KEY (`aem_id_donation`),
  ADD KEY `aem_donation_reference` (`aem_reference`);

--
-- Index pour la table `aem_event`
--
ALTER TABLE `aem_event`
  ADD PRIMARY KEY (`aem_id_event`);

--
-- Index pour la table `aem_formation`
--
ALTER TABLE `aem_formation`
  ADD PRIMARY KEY (`aem_id_formation`),
  ADD KEY `idPublisher` (`idPublisher`);

--
-- Index pour la table `aem_formation_participant`
--
ALTER TABLE `aem_formation_participant`
  ADD PRIMARY KEY (`aem_id_formation_participant`),
  ADD KEY `aem_id_formation` (`aem_id_formation`);

--
-- Index pour la table `aem_function`
--
ALTER TABLE `aem_function`
  ADD PRIMARY KEY (`aem_id_function`),
  ADD UNIQUE KEY `aem_function_name` (`aem_function_name`);

--
-- Index pour la table `aem_idea`
--
ALTER TABLE `aem_idea`
  ADD PRIMARY KEY (`aem_id_idea`);

--
-- Index pour la table `aem_likes`
--
ALTER TABLE `aem_likes`
  ADD PRIMARY KEY (`aem_id_like`),
  ADD KEY `aem_id_publication` (`aem_id_publication`),
  ADD KEY `aem_id_user` (`aem_id_user`);

--
-- Index pour la table `aem_mark`
--
ALTER TABLE `aem_mark`
  ADD PRIMARY KEY (`aem_id_mark`),
  ADD KEY `aem_id_user` (`aem_id_user`);

--
-- Index pour la table `aem_movement`
--
ALTER TABLE `aem_movement`
  ADD PRIMARY KEY (`aem_id_movement`),
  ADD KEY `fk_movement_account` (`aem_id_account`);

--
-- Index pour la table `aem_password_reset`
--
ALTER TABLE `aem_password_reset`
  ADD PRIMARY KEY (`aem_id_reset`),
  ADD KEY `idx_pwreset_token` (`token`);

--
-- Index pour la table `aem_payment`
--
ALTER TABLE `aem_payment`
  ADD PRIMARY KEY (`aem_id_payment`),
  ADD KEY `aem_id_user` (`aem_id_user`);

--
-- Index pour la table `aem_privilege`
--
ALTER TABLE `aem_privilege`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_role_module` (`aem_role`,`aem_module`);

--
-- Index pour la table `aem_psw_temp`
--
ALTER TABLE `aem_psw_temp`
  ADD PRIMARY KEY (`aem_id_psw_temp`),
  ADD KEY `aem_id_user` (`aem_id_user`);

--
-- Index pour la table `aem_publication`
--
ALTER TABLE `aem_publication`
  ADD PRIMARY KEY (`aem_id_publication`),
  ADD KEY `aem_id_user` (`aem_id_user`);

--
-- Index pour la table `aem_role`
--
ALTER TABLE `aem_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_role_key` (`role_key`);

--
-- Index pour la table `aem_rollement_price`
--
ALTER TABLE `aem_rollement_price`
  ADD PRIMARY KEY (`aem_id_rollement_price`);

--
-- Index pour la table `aem_score_manager`
--
ALTER TABLE `aem_score_manager`
  ADD PRIMARY KEY (`aem_id_score_manager`);

--
-- Index pour la table `aem_scoring`
--
ALTER TABLE `aem_scoring`
  ADD PRIMARY KEY (`aem_id_scoring`);

--
-- Index pour la table `aem_user`
--
ALTER TABLE `aem_user`
  ADD PRIMARY KEY (`aem_id_user`),
  ADD UNIQUE KEY `aem_id_number` (`aem_id_number`),
  ADD UNIQUE KEY `uniq_aem_user_email` (`aem_user_email`),
  ADD UNIQUE KEY `uniq_aem_id_number` (`aem_id_number`),
  ADD UNIQUE KEY `uniq_aem_phone_number` (`aem_phone_number`),
  ADD KEY `aem_country` (`aem_country`),
  ADD KEY `aem_id_function` (`aem_id_function`);

--
-- Index pour la table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `group_messages`
--
ALTER TABLE `group_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aem_account`
--
ALTER TABLE `aem_account`
  MODIFY `aem_id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `aem_activity`
--
ALTER TABLE `aem_activity`
  MODIFY `aem_id_activity` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `aem_activity_image`
--
ALTER TABLE `aem_activity_image`
  MODIFY `aem_id_image` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `aem_admin`
--
ALTER TABLE `aem_admin`
  MODIFY `aem_id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `aem_admin_log`
--
ALTER TABLE `aem_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT pour la table `aem_attendance_list`
--
ALTER TABLE `aem_attendance_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `aem_auth_tokens`
--
ALTER TABLE `aem_auth_tokens`
  MODIFY `aem_id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434;

--
-- AUTO_INCREMENT pour la table `aem_comment`
--
ALTER TABLE `aem_comment`
  MODIFY `aem_id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `aem_contribution`
--
ALTER TABLE `aem_contribution`
  MODIFY `aem_id_contribution` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=520;

--
-- AUTO_INCREMENT pour la table `aem_contribution_payment`
--
ALTER TABLE `aem_contribution_payment`
  MODIFY `aem_id_cpay` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `aem_contribution_periode`
--
ALTER TABLE `aem_contribution_periode`
  MODIFY `aem_id_contribution_periode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `aem_contribution_price`
--
ALTER TABLE `aem_contribution_price`
  MODIFY `aem_id_contribution_price` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `aem_country`
--
ALTER TABLE `aem_country`
  MODIFY `aem_id_country` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT pour la table `aem_document`
--
ALTER TABLE `aem_document`
  MODIFY `aem_id_document` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `aem_donation`
--
ALTER TABLE `aem_donation`
  MODIFY `aem_id_donation` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `aem_event`
--
ALTER TABLE `aem_event`
  MODIFY `aem_id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `aem_formation`
--
ALTER TABLE `aem_formation`
  MODIFY `aem_id_formation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `aem_formation_participant`
--
ALTER TABLE `aem_formation_participant`
  MODIFY `aem_id_formation_participant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `aem_function`
--
ALTER TABLE `aem_function`
  MODIFY `aem_id_function` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `aem_idea`
--
ALTER TABLE `aem_idea`
  MODIFY `aem_id_idea` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `aem_likes`
--
ALTER TABLE `aem_likes`
  MODIFY `aem_id_like` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT pour la table `aem_mark`
--
ALTER TABLE `aem_mark`
  MODIFY `aem_id_mark` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=702;

--
-- AUTO_INCREMENT pour la table `aem_movement`
--
ALTER TABLE `aem_movement`
  MODIFY `aem_id_movement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `aem_password_reset`
--
ALTER TABLE `aem_password_reset`
  MODIFY `aem_id_reset` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `aem_payment`
--
ALTER TABLE `aem_payment`
  MODIFY `aem_id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT pour la table `aem_privilege`
--
ALTER TABLE `aem_privilege`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `aem_psw_temp`
--
ALTER TABLE `aem_psw_temp`
  MODIFY `aem_id_psw_temp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `aem_publication`
--
ALTER TABLE `aem_publication`
  MODIFY `aem_id_publication` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `aem_role`
--
ALTER TABLE `aem_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `aem_rollement_price`
--
ALTER TABLE `aem_rollement_price`
  MODIFY `aem_id_rollement_price` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `aem_score_manager`
--
ALTER TABLE `aem_score_manager`
  MODIFY `aem_id_score_manager` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `aem_scoring`
--
ALTER TABLE `aem_scoring`
  MODIFY `aem_id_scoring` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `aem_user`
--
ALTER TABLE `aem_user`
  MODIFY `aem_id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT pour la table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `group_messages`
--
ALTER TABLE `group_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aem_admin`
--
ALTER TABLE `aem_admin`
  ADD CONSTRAINT `aem_admin_ibfk_1` FOREIGN KEY (`aem_id_user`) REFERENCES `aem_user` (`aem_id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aem_attendance_list`
--
ALTER TABLE `aem_attendance_list`
  ADD CONSTRAINT `aem_attendance_list_ibfk_1` FOREIGN KEY (`aem_id_user`) REFERENCES `aem_user` (`aem_id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aem_auth_tokens`
--
ALTER TABLE `aem_auth_tokens`
  ADD CONSTRAINT `aem_auth_tokens_ibfk_1` FOREIGN KEY (`aem_id_user`) REFERENCES `aem_user` (`aem_id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aem_comment`
--
ALTER TABLE `aem_comment`
  ADD CONSTRAINT `aem_comment_ibfk_1` FOREIGN KEY (`aem_id_publication`) REFERENCES `aem_publication` (`aem_id_publication`) ON DELETE CASCADE,
  ADD CONSTRAINT `aem_comment_ibfk_2` FOREIGN KEY (`aem_id_user`) REFERENCES `aem_user` (`aem_id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comment_parent` FOREIGN KEY (`aem_parent_id`) REFERENCES `aem_comment` (`aem_id_comment`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aem_contribution`
--
ALTER TABLE `aem_contribution`
  ADD CONSTRAINT `aem_contribution_ibfk_1` FOREIGN KEY (`aem_id_user`) REFERENCES `aem_user` (`aem_id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_contribution_account` FOREIGN KEY (`aem_id_account`) REFERENCES `aem_account` (`aem_id_account`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `aem_formation`
--
ALTER TABLE `aem_formation`
  ADD CONSTRAINT `aem_formation_ibfk_1` FOREIGN KEY (`idPublisher`) REFERENCES `aem_user` (`aem_id_user`) ON DELETE SET NULL;

--
-- Contraintes pour la table `aem_formation_participant`
--
ALTER TABLE `aem_formation_participant`
  ADD CONSTRAINT `aem_formation_participant_ibfk_1` FOREIGN KEY (`aem_id_formation`) REFERENCES `aem_formation` (`aem_id_formation`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aem_likes`
--
ALTER TABLE `aem_likes`
  ADD CONSTRAINT `aem_likes_ibfk_1` FOREIGN KEY (`aem_id_publication`) REFERENCES `aem_publication` (`aem_id_publication`) ON DELETE CASCADE,
  ADD CONSTRAINT `aem_likes_ibfk_2` FOREIGN KEY (`aem_id_user`) REFERENCES `aem_user` (`aem_id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aem_mark`
--
ALTER TABLE `aem_mark`
  ADD CONSTRAINT `aem_mark_ibfk_1` FOREIGN KEY (`aem_id_user`) REFERENCES `aem_user` (`aem_id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aem_movement`
--
ALTER TABLE `aem_movement`
  ADD CONSTRAINT `fk_movement_account` FOREIGN KEY (`aem_id_account`) REFERENCES `aem_account` (`aem_id_account`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `aem_payment`
--
ALTER TABLE `aem_payment`
  ADD CONSTRAINT `aem_payment_ibfk_1` FOREIGN KEY (`aem_id_user`) REFERENCES `aem_user` (`aem_id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aem_psw_temp`
--
ALTER TABLE `aem_psw_temp`
  ADD CONSTRAINT `aem_psw_temp_ibfk_1` FOREIGN KEY (`aem_id_user`) REFERENCES `aem_user` (`aem_id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aem_publication`
--
ALTER TABLE `aem_publication`
  ADD CONSTRAINT `aem_publication_ibfk_1` FOREIGN KEY (`aem_id_user`) REFERENCES `aem_user` (`aem_id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aem_user`
--
ALTER TABLE `aem_user`
  ADD CONSTRAINT `aem_user_ibfk_1` FOREIGN KEY (`aem_country`) REFERENCES `aem_country` (`aem_id_country`) ON DELETE CASCADE,
  ADD CONSTRAINT `aem_user_ibfk_2` FOREIGN KEY (`aem_id_function`) REFERENCES `aem_function` (`aem_id_function`);

--
-- Contraintes pour la table `group_messages`
--
ALTER TABLE `group_messages`
  ADD CONSTRAINT `group_messages_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `aem_user` (`aem_id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
