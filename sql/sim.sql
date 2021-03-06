-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2018 at 06:56 PM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sim`
--

-- --------------------------------------------------------

--
-- Table structure for table `arrival_items`
--

DROP TABLE IF EXISTS `arrival_items`;
CREATE TABLE IF NOT EXISTS `arrival_items` (
  `id` int(10) unsigned NOT NULL,
  `purchase_id` int(10) unsigned NOT NULL,
  `ItemCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pedimento` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned DEFAULT '0',
  `cantidad_rec` int(10) unsigned DEFAULT NULL,
  `DistNumber` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `u_Caducidad` timestamp NULL DEFAULT NULL,
  `caducidad_minima` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `arrival_items`
--

INSERT INTO `arrival_items` (`id`, `purchase_id`, `ItemCode`, `pedimento`, `product_id`, `quantity`, `cantidad_rec`, `DistNumber`, `u_Caducidad`, `caducidad_minima`, `status`, `purchase_status`, `created_at`, `updated_at`) VALUES
(1, 42, 'TOP-0102', NULL, 3878, 168, 14, '1', '2033-06-08 00:57:29', NULL, 'validado', NULL, '2018-07-24 00:57:29', '2018-07-24 01:08:30');

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
CREATE TABLE IF NOT EXISTS `assignments` (
  `id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_design_id` int(10) unsigned DEFAULT NULL,
  `order_detail_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `order_id`, `order_design_id`, `order_detail_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 182, NULL, NULL, 3, 0, '2018-07-17 16:43:18', '2018-07-17 16:43:18'),
(16, 182, 24, 157, 8, 0, '2018-07-24 22:53:55', '2018-07-24 22:53:55'),
(17, 182, 25, 158, 8, 0, '2018-07-24 22:53:55', '2018-07-24 22:53:55'),
(18, 182, 26, 159, 8, 0, '2018-07-24 22:53:56', '2018-07-24 22:53:56'),
(19, 182, 27, 160, 8, 0, '2018-07-24 22:53:56', '2018-07-24 22:53:56'),
(20, 182, 28, 161, 8, 0, '2018-07-24 22:53:56', '2018-07-24 22:53:56'),
(21, 182, 29, 162, 8, 0, '2018-07-24 22:53:56', '2018-07-24 22:53:56'),
(22, 182, 30, 163, 8, 0, '2018-07-24 22:53:56', '2018-07-24 22:53:56');

-- --------------------------------------------------------

--
-- Table structure for table `boxes`
--

DROP TABLE IF EXISTS `boxes`;
CREATE TABLE IF NOT EXISTS `boxes` (
  `id` int(10) unsigned NOT NULL,
  `description` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` double(15,2) NOT NULL DEFAULT '0.00',
  `height` double(15,2) NOT NULL DEFAULT '0.00',
  `depth` double(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boxes`
--

INSERT INTO `boxes` (`id`, `description`, `width`, `height`, `depth`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Caja Origen', 1.00, 1.00, 1.00, '2018-07-03 19:09:14', '2018-07-03 19:09:14', NULL),
(2, 'Alcan', 40.50, 53.00, 68.00, '2018-07-17 07:09:48', '2018-07-17 07:09:48', NULL),
(4, 'Alucaps recortada', 33.50, 54.60, 39.80, '2018-07-17 07:10:36', '2018-07-17 07:10:36', NULL),
(5, 'Alucaps 45', 33.00, 40.50, 40.20, '2018-07-17 07:11:23', '2018-07-17 07:11:23', NULL),
(6, 'Alucaps completa', 33.50, 59.30, 40.30, '2018-07-17 07:12:03', '2018-07-17 07:12:03', NULL),
(7, 'Tena completa', 33.30, 40.30, 39.70, '2018-07-17 07:12:55', '2018-07-17 07:12:55', NULL),
(8, 'Corona', 30.20, 26.70, 54.70, '2018-07-17 07:13:16', '2018-07-17 07:13:16', NULL),
(9, 'Tena recortada', 28.00, 27.00, 40.50, '2018-07-17 07:13:37', '2018-07-17 07:13:37', NULL),
(10, 'Standhome grande', 28.20, 18.50, 37.50, '2018-07-17 07:14:00', '2018-07-17 07:14:00', NULL),
(11, 'Standhome chica', 24.20, 15.50, 36.00, '2018-07-17 07:14:17', '2018-07-17 07:14:17', NULL),
(12, 'Bon Ice', 20.20, 13.20, 33.00, '2018-07-17 07:14:34', '2018-07-17 07:14:34', NULL),
(13, 'Picot', 16.00, 11.40, 32.60, '2018-07-17 07:14:54', '2018-07-17 07:14:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `box_ids`
--

DROP TABLE IF EXISTS `box_ids`;
CREATE TABLE IF NOT EXISTS `box_ids` (
  `id` int(10) unsigned NOT NULL,
  `box_type_id` int(10) unsigned DEFAULT NULL,
  `label` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `box_ids`
--

INSERT INTO `box_ids` (`id`, `box_type_id`, `label`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 2, '2018-07-04 05:00:00', '2018-07-05 16:59:53'),
(2, 1, NULL, 0, '2018-07-05 05:00:00', NULL),
(3, 1, NULL, 0, '2018-07-05 05:00:00', NULL),
(7, NULL, '1234', 0, '2018-07-25 20:02:23', '2018-07-25 20:43:51'),
(8, NULL, '123', 2, '2018-07-25 20:02:37', '2018-07-25 20:43:51');

-- --------------------------------------------------------

--
-- Table structure for table `calculations`
--

DROP TABLE IF EXISTS `calculations`;
CREATE TABLE IF NOT EXISTS `calculations` (
  `id` int(10) unsigned NOT NULL,
  `P` int(11) NOT NULL,
  `V` int(11) NOT NULL,
  `D` int(11) NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `dist_id` int(10) unsigned NOT NULL,
  `priority` int(11) NOT NULL,
  `FP` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calculations`
--

INSERT INTO `calculations` (`id`, `P`, `V`, `D`, `order_id`, `dist_id`, `priority`, `FP`, `created_at`, `updated_at`) VALUES
(173, 0, 0, 0, 181, 82, 0, NULL, '2018-07-17 00:07:03', '2018-07-17 00:07:03'),
(174, 10, 22, 0, 182, 83, 51, '2018-07-18', '2018-07-17 00:07:03', '2018-07-17 05:02:13'),
(175, 0, 0, 0, 183, 84, 0, NULL, '2018-07-19 18:48:49', '2018-07-19 18:48:49'),
(176, 0, 0, 0, 184, 85, 0, NULL, '2018-07-19 18:48:49', '2018-07-19 18:48:49'),
(177, 0, 0, 0, 185, 86, 0, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(178, 0, 0, 0, 186, 86, 0, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(179, 0, 0, 0, 187, 86, 0, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(180, 0, 0, 0, 188, 87, 0, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(181, 0, 0, 0, 189, 88, 0, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(182, 0, 0, 0, 190, 88, 0, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(183, 0, 0, 0, 191, 88, 0, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(184, 0, 0, 0, 192, 89, 0, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(185, 0, 0, 0, 193, 89, 0, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(186, 0, 0, 0, 194, 89, 0, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(187, 0, 0, 0, 195, 89, 0, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(188, 0, 0, 0, 196, 90, 0, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(189, 0, 0, 0, 197, 90, 0, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(190, 0, 0, 0, 198, 91, 0, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(191, 0, 0, 0, 199, 92, 0, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(192, 0, 0, 0, 200, 93, 0, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(193, 0, 0, 0, 201, 94, 0, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
CREATE TABLE IF NOT EXISTS `catalogs` (
  `id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catalogs`
--

INSERT INTO `catalogs` (`id`, `group_id`, `label`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'constantes', '0', '2018-05-25 06:16:17', '2018-05-25 06:22:13', NULL),
(2, 1, 'c1', '4', '2018-05-25 06:19:45', '2018-05-25 06:19:45', NULL),
(3, 1, 'c2', '5', '2018-05-25 06:19:55', '2018-05-25 06:19:55', NULL),
(4, 1, 'c3', '1', '2018-05-25 06:20:13', '2018-05-25 06:20:13', NULL),
(5, 1, 'c4', '500', '2018-05-31 03:06:12', '2018-05-31 03:06:12', NULL),
(6, 1, 'c5', '0.1', '2018-05-31 03:06:26', '2018-05-31 03:06:26', NULL),
(7, 1, 'c6', '2600', '2018-05-31 03:06:41', '2018-05-31 03:06:41', NULL),
(8, NULL, 'Distancias', '0', '2018-06-11 04:59:34', '2018-06-11 04:59:34', NULL),
(10, NULL, 'oaxaca 2 dias', '10', '2018-06-11 05:00:51', '2018-06-11 05:01:23', '2018-06-11 05:01:23'),
(13, NULL, 'Tipo Empaque', '1', '2018-07-03 21:36:44', '2018-07-03 21:36:44', NULL),
(14, 13, 'Exhibidor', '2', NULL, NULL, NULL),
(15, 13, 'Mixto', '1.8', NULL, NULL, NULL),
(16, 13, 'Caja', '1', NULL, NULL, NULL),
(17, 1, 'c7', '-3', '2018-07-12 23:25:51', '2018-07-12 23:25:51', NULL),
(82, 8, 'CEDIS IZTAPALAPA', '-1', '2018-07-17 00:07:03', '2018-07-17 00:07:03', NULL),
(83, 8, 'SHASA CENTRO DE DISTRIBUCION', '35', '2018-07-17 00:07:03', '2018-07-17 05:02:13', NULL),
(84, 8, 'CEDIS YAUTEPEC 1004', '-1', '2018-07-19 18:48:49', '2018-07-19 18:48:49', NULL),
(85, 8, 'LIVERPOOL PERINORTE 29', '-1', '2018-07-19 18:48:49', '2018-07-19 18:48:49', NULL),
(86, 8, 'LIVERPOOL SATELITE 04', '-1', '2018-07-19 18:48:51', '2018-07-19 18:48:51', NULL),
(87, 8, 'LIVERPOOL ECATEPEC 80', '-1', '2018-07-19 18:48:52', '2018-07-19 18:48:52', NULL),
(88, 8, 'LIVERPOOL CENTRO 01', '-1', '2018-07-19 18:48:53', '2018-07-19 18:48:53', NULL),
(89, 8, 'LIVERPOOL LAS ANTENAS 456', '-1', '2018-07-19 18:48:54', '2018-07-19 18:48:54', NULL),
(90, 8, 'LIVERPOOL ATIZAPAN 104', '-1', '2018-07-19 18:48:56', '2018-07-19 18:48:56', NULL),
(91, 8, 'LIVERPOOL LINDAVISTA 83', '-1', '2018-07-19 18:48:57', '2018-07-19 18:48:57', NULL),
(92, 8, 'LIVERPOOL MONTERREY 189', '-1', '2018-07-19 18:48:58', '2018-07-19 18:48:58', NULL),
(93, 8, 'LIVERPOOL MERIDA 76', '-1', '2018-07-19 18:48:58', '2018-07-19 18:48:58', NULL),
(94, 8, 'CC01 CEDIS TULTITLAN', '-1', '2018-07-19 18:48:58', '2018-07-19 18:48:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(10) unsigned NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rfc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `P` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shops` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `D2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CE` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TP` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TE` int(10) unsigned DEFAULT NULL,
  `appointment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `branch_id`, `name`, `email`, `telephone`, `rfc`, `cp`, `city`, `address`, `status`, `code`, `P`, `shops`, `sku`, `D2`, `CE`, `TP`, `average`, `TE`, `appointment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'CLIENTES NO IDENTIFICADOS', '-', '-', 'XXXXXXXXXXXX', '-', '-', '-', 1, 'CLN-0000-0000', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(2, NULL, 'ALIMENTOS CENTRALIZADOS DE MEXICO S. DE R.L. DE C.V.', '-', '5091-5718', 'ACM040107U93', '54870', 'CUAUTITLAN', 'AV. SAN ANTONIO S/N', 1, 'CLN-0001-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(3, NULL, 'MAROSA DISTRIBUCIONES S.A. DE C.V.', '-', '013336660050', 'MDI920518HI1', '45690', 'EL SALTO', 'AVENIDA PRODUCTIVIDAD 201 A', 1, 'CLN-0001-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(4, NULL, 'ALMACENES DISTRIBUIDORES DE LA FRONTERA S.A. D.E. C.V.', '-', '01 656 686 2200', 'ADF6908013Q9', '32310', 'CIUDAD JUAREZ', 'ELIAS CALLES 744 NTE', 1, 'CLN-0002-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(5, NULL, 'ADMINISTRADORA MEXICANA DE HIPODROMO S.A. DE C.V.', '-', '53870600 EXT 6016', 'AMH9709043N1', '11200', 'MEXICO, D.F.', 'AV CONSCRIPTO ACCESO 4 CABALLERIZA 6 No. 311', 1, 'CLN-0003-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(6, NULL, 'TIENDAS BAMA S.A. D.E. C.V.', 'compras@bama.mx', '01 921 2157-407', 'BAM010705DG5', '96496', 'COATZACOALCOS', 'CARR TRANSISTMICA KM 7.5 102 BA', 1, 'CLN-0004-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(7, NULL, 'BEST BUY STORES S. DE R.L. DE C.V.', '-', '5362-7938', 'BBS070606D33', '05348', 'CUAJIMALPA DE MORELOS', 'AVENIDA SANTA FE 440 PISO 2', 1, 'CLN-0005-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(8, NULL, 'IMPULSORA CIRCULO CCK S.A. DE C.V.', '-', '26292000 Ext 2006', 'ICC050606AD6', '53380', 'NAUCALPAN DE JUAREZ', 'INGENIEROS MILITARES 2 PISO 9', 1, 'CLN-0006-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(9, NULL, 'OPERADORA DE CINEMAS S.A. DE C.V.', '-', '5201-5800', 'OCI970818KX9', '01210', 'ALVARO OBREGON', 'AV JAVIER BARROS SIERRA # 540 TORRE-1 PH-1', 1, 'CLN-0007-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(10, NULL, 'TIENDAS COMERCIAL MEXICANA S.A. DE C.V.', '-', '5270-9761', 'TCM951030A17', '03730', 'MEXICO, D.F.', 'AV. REVOLUCION  (MOD. 2 HOLBEIN Y RUBENS) 780', 1, 'CLN-0008-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(11, NULL, 'COMERCIAL CITY FRESKO, S. DE R.L. DE C.V.', '-', '5270-9761', 'CCF121101KQ4', '03730', 'MEXICO, D.F.', 'AV. REVOLUCION  (MOD. 2 HOLBEIN Y RUBENS) 780', 1, 'CLN-0008-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(12, NULL, 'Distribuidora Liverpool SA de CV', '-', '5328-6500', 'DLI931201MI9', '05348', 'CUAJIMALPA DE MORELOS', 'PROLONGACION VASCO DE QUIROGA', 1, 'CLN-0009-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:52', NULL),
(13, NULL, 'SERVICIOS LIVERPOOL, S.A. DE C.V.', '-', '(55) 52683000', 'SLI8007013R7', '05348', 'MEXICO, D.F.', 'MARIO PANI 200', 1, 'CLN-0009-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(14, NULL, 'ALMACENES COMERCIALES LIVERPOOL, S.A. DE C.V.', '-', '5328-6500', 'ACL1505087W3', '05348', 'CUAJIMALPA DE MORELOS', 'MARIO PANI', 1, 'CLN-0009-0003', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(15, NULL, 'Distribuidora Liverpool SA de CV', '-', '5328-6500', 'DLI931201MI9', '05348', 'CUAJIMALPA DE MORELOS', 'PROLONGACION VASCO DE QUIROGA', 1, 'CLN-0009-0004', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(16, NULL, 'SUPER MERCADOS INTERNACIONALES HEB S.A. DE C.V.', '-', '01-81-81-53-11-00', 'SIH9511279T7', '64060', 'MONTERREY', 'AVENIDA HIDALGO 64060', 1, 'CLN-0010-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(17, NULL, 'EL NUEVO MUNDO MEXICO S. A.', 'recibo_cfd_mex@elnuevomundo.com', '51300353', 'NMM101011JP0', '06000', 'MEXICO, D.F.', 'VENUSTIANO CARRANZA 72', 1, 'CLN-0011-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(18, NULL, 'OPERADORA DE CIUDAD JUAREZ S.A. DE C.V.', 'facturacion@s-martmx.com', '656 629 55 55', 'OCJ980219MI5', '32680', 'CIUDAD JUAREZ', 'AV LOPEZ MATEOS 2125 SUR', 1, 'CLN-0012-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(19, NULL, 'OPERADORA DE REYNOSA, S.A. DE C.V.', 'facturacion@s-martmx.com', '656 629 55 55', 'ORE980722BZ1', '32380', 'CIUDAD JUAREZ', 'GENERAL MONTERDE 1750', 1, 'CLN-0013-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(20, NULL, 'OPERADORA VIPS S. DE R.L. DE C.V.', 'Mandres.Ucallejas@walmart.com', '5377-0020 EXT109', 'OVI800131GQ6', '01040', 'CIUDAD DE MEXICO', 'AV.REVOLUCION   NO.1267 PISO 20-21', 1, 'CLN-0014-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(21, NULL, 'DISTRIBUIDORA E IMPORTADORA ALSEA S.A. DE C.V.', '-', '52 41 71 00', 'DIA910809ST5', '13300', 'MEXICO, D.F.', 'AVENIDA TLAHUAC No. 6768', 1, 'CLN-0014-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(22, NULL, 'SUPERMERCADO GONZALEZ DE ALTAVISTA S.A. DE C.V.', '-', '633 00 00', 'SGA921026CI5', '32120', 'CIUDAD JUAREZ', 'BOULEVARD FRONTERIZO 3530 A', 1, 'CLN-0015-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(23, NULL, 'SERVICIOS EN PUERTOS Y TERMINALES S.A. DE C.V.', '-', '5322-4320', 'SPT9603143M3', '03900', 'CIUDAD DE MEXICO', 'AV. INSURGENTES SUR # 1605 PISO 19', 1, 'CLN-0016-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(24, NULL, 'TIENDAS EXTRA, S.A. DE C.V.', 'alfredo.navarro@cck.com.mx', '5261 9800', 'TEX9302097F3', '01210', 'MEXICO, D.F.', 'JAVIER BARROS SIERRA 555', 1, 'CLN-0017-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(25, NULL, 'TIENDAS GARCES S.A. DE C.V.', '-', '0172 12 84 11', 'TGA870401FV4', '50140', 'TOLUCA DE LERDO', 'PASEO TOLLOCAN ORIENTE 312', 1, 'CLN-0018-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(26, NULL, 'TIENDAS Y RESTAURANTES DE VERACRUZ S.A. DE C.V.', '-', '012299328250 E.121', 'TRV920409A99', '91900', 'VERACRUZ', 'BLVD. MIGUEL AVILA CAMACHO S/N LOCAL 23 P ALTA 1', 1, 'CLN-0019-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(27, NULL, 'WALDO S DOLAR MART DE MEXICO S. DE R.L. DE C.V.', 'productocedis@waldos.com', '52460700', 'WDM990126350', '22210', 'TIJUANA', 'AVENIDA PASEO CUCAPAH No.  16822', 1, 'CLN-0020-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(28, NULL, 'NUEVA WALMART DE MEXICO S. DE R.L. DE C.V.', '-', '53283500', 'NWM9709244W4', '45679', 'MEXICO, D.F.', 'NEXTENGO', 1, 'CLN-0021-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(29, NULL, 'WMA CEDIS GUADALAJARA 7493', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:55', '2018-06-08 16:51:53', NULL),
(30, NULL, 'WMA CEDIS MONTERREY 7465', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0003', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:53', NULL),
(31, NULL, 'WMA CEDIS CUAUTITLAN 7486', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0004', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(32, NULL, 'WMA CEDIS CUAUTITLAN 7464', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0005', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(33, NULL, 'WMA CEDIS CHALCO 7471', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0006', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(34, NULL, 'WMA CEDIS CULIACAN 7487', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0007', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(35, NULL, 'WMA CEDIS MONTERREY  7490', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0008', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(36, NULL, 'WMA CEDIS VILLAHERMOSA 7468', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0010', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(37, NULL, 'WMB CEDIS MONTERREY 7465', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0011', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(38, NULL, 'WMB CEDIS GUADALAJARA 7463', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0012', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(39, NULL, 'WMB CEDIS CUAUTITLAN 7486', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0013', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(40, NULL, 'WMB CEDIS CUAUTITLAN 7464', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0014', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(41, NULL, 'WMB CEDIS SANTA BARBARA 7482', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0015', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(42, NULL, 'WMB CEDIS CHALCO 7471', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0016', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(43, NULL, 'WMB CEDIS CULIACAN 7487', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0017', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(44, NULL, 'WMB CEDIS MONTERREY  7490', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0018', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(45, NULL, 'WMB CEDIS GUADALAJARA 7493', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0019', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(46, NULL, 'WMB CEDIS CUAUTITLAN 7494', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0020', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(47, NULL, 'WMB CEDIS VILLAHERMOSA 7468', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0021', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(48, NULL, 'WMC CEDIS SAMS S.M.O. 6388', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0022', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:54', NULL),
(49, NULL, 'WMC SAMS CENTRO DISTR. MTY. 6548', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0023', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(50, NULL, 'WMC SAMS TEPEYAC 4901', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0024', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(51, NULL, 'WMC SAMS LAS AMERICAS 4934', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0025', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(52, NULL, 'WMC SAMS CUAUTITLAN IZCALLI 6207', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0026', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(53, NULL, 'WMC SAMS POLANCO 6390', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0027', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(54, NULL, 'WMC SAMS SAN JERONIMO 6393', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0028', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(55, NULL, 'WMC SAMS PACHUCA 6534', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0029', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(56, NULL, 'WMC SAMS TULANCINGO 4946', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0030', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(57, NULL, 'WMC SAMS LOMAS VERDES 4879', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0031', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(58, NULL, 'WMC SAMS QUERETARO 4827', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0032', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(59, NULL, 'WMC SAMS COACALCO 4805', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0033', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(60, NULL, 'WMC SAMS ACOXPA 4910', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0034', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(61, NULL, 'WMC CEDIS VILLAHERMOSA 6549', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0035', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(62, NULL, 'WMC CEDIS CULIACAN 4971', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0036', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(63, NULL, 'WMC CEDIS SAMS DC 4850', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0037', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:56', '2018-06-08 16:51:55', NULL),
(64, NULL, 'WMS CEDIS MONTERREY 7465', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0038', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:55', NULL),
(65, NULL, 'WMS  CEDIS GUADALAJARA 7463', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0039', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:55', NULL),
(66, NULL, 'WMS CEDIS CUAUTITLAN 7486', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0040', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:55', NULL),
(67, NULL, 'WMS CEDIS CUAUTITLAN 7464', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0041', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(68, NULL, 'WMS CEDIS CHALCO 7471', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0042', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(69, NULL, 'WMS CEDIS GUADALAJARA 7493', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0043', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(70, NULL, 'WMB CEDIS CUAUTITLAN 7492', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0044', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(71, NULL, 'WMBE CEDIS CHALCO 7459', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0045', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(72, NULL, 'WMBE CEDIS GUADALAJARA 7460', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0046', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(73, NULL, 'WMBE CEDIS MONTERREY 7461', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0047', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(74, NULL, 'WMB 7 DIST CENTER 7457', '-', '58996700', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0048', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(75, NULL, 'WMA SAN MARCOS IZCALLI 1044', '-', '53 28 35 00', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0049', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(76, NULL, 'WMA PLAZA ARBOLEDAS 1169', '-', '53 28 35 00', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0050', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(77, NULL, 'WMA SAN JOSE TECAMAC 1171', '-', '53 28 35 00', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0051', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(78, NULL, 'WMA HORIZONTE 1202', '-', '53 28 35 00', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0052', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(79, NULL, 'WMA SANTA ELENA 1423', '-', '53 28 35 00', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0053', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(80, NULL, 'WMA EL ROSARIO 1580', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0054', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(81, NULL, 'WMA ESPACIO ESMERALDA 1584', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0055', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(82, NULL, 'WMA VICENTE GUERRERO 1683', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0056', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(83, NULL, 'WMA PLAZA ORIENTE 2033', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0057', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(84, NULL, 'WMA TOREO 2344', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0058', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(85, NULL, 'WMA TEPEYAC 2345', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0059', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:56', NULL),
(86, NULL, 'WMA TLAHUAC 2347', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0060', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:57', NULL),
(87, NULL, 'WMA MIRAMONTES 2464', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0061', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:57', NULL),
(88, NULL, 'WMA CUITLAHUAC 2466', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0062', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:57', NULL),
(89, NULL, 'WMA TLALPAN 2670', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0063', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:57', NULL),
(90, NULL, 'WMA PLAZA ARAGON 3005', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0064', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:57', NULL),
(91, NULL, 'WMA MACRO PLAZA HEROES 3016', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0065', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:57', NULL),
(92, NULL, 'WMA UNIVERSIDAD 3845', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0066', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:57', NULL),
(93, NULL, 'WMA BUENAVISTA 3846', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0067', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:57', NULL),
(94, NULL, 'WMA ECHEGARAY 3850', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0068', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:57', '2018-06-08 16:51:57', NULL),
(95, NULL, 'WMA VILLA COAPA 3857', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0069', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:57', NULL),
(96, NULL, 'WMA BALBUENA 3872', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0070', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:57', NULL),
(97, NULL, 'WMA TORRES LINDAVISTA 3877', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0071', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:57', NULL),
(98, NULL, 'WMA COACALCO 3900', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0072', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:57', NULL),
(99, NULL, 'WMA SANTA MARIA 4018', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0073', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:57', NULL),
(100, NULL, 'WMA LAGO DE GUADALUPE 4191', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0074', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:57', NULL),
(101, NULL, 'WMA PLAZA EDUARDO MOLINA 4547', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0075', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:57', NULL),
(102, NULL, 'WMA LAS AMERICAS 5765', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0076', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:57', NULL),
(103, NULL, 'WMA LAS ALAMEDAS 5855', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0077', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:57', NULL),
(104, NULL, 'WMC SAMS MERIDA 6576', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0078', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(105, NULL, 'WMA PIRULES 3854', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0079', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(106, NULL, 'WMA JESUS DEL MONTE 3504', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0080', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(107, NULL, 'WMA AZCAPOTZALCO 3862', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0081', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(108, NULL, 'WMB BODEGA SAN JUANICO 3792', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO No.78', 1, 'CLN-0021-0082', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(109, NULL, 'WMB BODEGA IZTAPALAPA NORTE 3916', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO No. 78', 1, 'CLN-0021-0083', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(110, NULL, 'WMC SAMS CENTRO DISTR. 7504', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO No. 78', 1, 'CLN-0021-0084', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(111, NULL, 'WMS CEDIS CUAUTITLAN 7492', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0085', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(112, NULL, 'WMS CEDIS VILLAHERMOSA 7468', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0086', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(113, NULL, 'WMS CEDIS MONTERREY  7490', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0087', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(114, NULL, 'WMC CEDIS SAMS DC 4850', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0088', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(115, NULL, 'WMC CEDIS CHALCO 7505', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0089', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(116, NULL, 'WMA CEDIS CUAUTITLAN 7492', '-', '53283500', 'NWM9709244W4', '02770', 'AZCAPOTZALCO', 'NEXTENGO NO 78', 1, 'CLN-0021-0090', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(117, NULL, 'BED BATH & BEYOND MEXICO S. DE R.L DE C.V.', 'mariaesther.perez@bedbath.com', '53 21 30 00', 'BBA060405BQ5', '53140', 'NAUCALPAN DE JUAREZ, ESTADO DE MEXICO', 'BOULEVARD MANUEL AVILA CAMACHO No. 3228', 1, 'CLN-0022-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(118, NULL, 'BLOCKBUSTER DE MEXICO, S.A. DE C.V.', 'eterant@elektra.com.mx', '52 79 52 00', 'BME910111JT5', '53950', 'NAUCALPAN DE JUAREZ, EDO DE MEXICO', 'AVENIDA DE LAS FUENTES NO. 33  PISO 2 Y 3', 1, 'CLN-0023-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(119, NULL, 'SERVICIOS INTEGRALES MOVILES Y DIGITALES, S.A. DE C.V.', 'eterant@elektra.com.mx', '52 79 52 00', 'BME910111JT5', '53950', 'NAUCALPAN DE JUAREZ, EDO DE MEXICO', 'AVENIDA DE LAS FUENTES NO. 33  PISO 2 Y 3', 1, 'CLN-0023-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(120, NULL, 'ENTRETENIMIENTO DEL GOLFO, S.A. DE C.V.', 'cuentasporpagar@hdgmx.com', '01 99 33 52 02 33', 'EGO9207236N9', '86040', 'VILLAHERMOSA, TABASCO', 'CALLE SUR 101', 1, 'CLN-0024-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(121, NULL, 'MAS BODEGA Y LOGISTICA, S.A. DE C.V.', 'pagosfe@masbodega.com', '01 81 81 30 69 00', 'CCA030408D46', '67110', 'CIUDAD GUADALUPE, NUEVO LEON', 'AUTOPISTA MONTERREY REYNOSA 9350', 1, 'CLN-0025-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:58', NULL),
(122, NULL, 'LA EUROPEA MEXICO, S.A. P.I. DE C.V.', '-', '55 80 50 57', 'EME910610G1A', '02760', 'MEXICO, D.F.', 'NUEVA SANTO DOMINGO 130', 1, 'CLN-0026-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:59', NULL),
(123, NULL, 'FARMACIAS BENAVIDES, S.A.B. DE C.V.', '-', '01 81 81 50 77 00', 'FBE9110215Z3', '64750', 'MONTERREY, NUEVO LEON', 'AV. FUNDADORES 935 INT. 301', 1, 'CLN-0027-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:58', '2018-06-08 16:51:59', NULL),
(124, NULL, 'FARMACIA GUADALAJARA, S.A. DE C.V.', 'cfdproveedores@fragua.com.mx', '01 33 36 69 33 33', 'FGU830930PD3', '44200', 'GUADALAJARA, JALISCO', 'ENRIQUE DIAZ DE LEON 261', 1, 'CLN-0028-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(125, NULL, 'GRUPO COMERCIAL CONTROL, S.A. DE C.V.', 'archivosxml@ccontrol.com.mx', '01 81 83 29 55 00', 'GCC0512227F3', '64000', 'MONTERREY, NUEVO LEON', 'PADRE MIER 167 PTE.', 1, 'CLN-0029-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(126, NULL, 'GRUPO COMERCIAL DSW, S.A. DE C.V.', 'archivosxml@ccontrol.com.mx', '01 81 83 29 55 00', 'GCD170101GS6', '64000', 'MONTERREY, NUEVO LEON', 'PADRE MIER 167 PTE.', 1, 'CLN-0029-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(127, NULL, 'GRUPO DISTRIBUIDOR TIA LUPITA, S.A. DE C.V.', 'direccion@tialupita.com', '01 99 81 85 61 37', 'GDT090413QP2', '77530', 'CANCUN, QUINTANA ROO', 'AV. COMALCALCO MANZANA 4 LOTE 4 LOCAL A', 1, 'CLN-0030-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(128, NULL, 'HOME DEPOT MEXICO S. DE R.L. DE C.V.', '-', '01 81 81 55 70 00', 'HDM001017AS1', '66267', 'SAN PEDRO GARZA GARCIA, NUEVO LEON.', 'RICARDO MARGAIN ZOZAYA # 605', 1, 'CLN-0031-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(129, NULL, 'IMELDA MANUELA HERNANDEZ FLOREZ', '-', '53 05 06 08', 'HEFI8608191B0', '52923', 'CIUDAD ADOLFO LOPEZ MATEOS, ESTADO DE MEXICO', 'NANCHE MZ 208 LT 24', 1, 'CLN-0032-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(130, NULL, 'IMMEX CEDIS MONTERREY', 'IMMEXMTYFACTURAS@immex.femsa.com.mx', '01 81 80 48 70 00', 'IMM861215HH0', '64480', 'MONTERREY, NUEVO LEON', 'EDISON 1235 NORTE', 1, 'CLN-0033-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(131, NULL, 'IMMEX CEDIS MEXICALI', 'MVGARGAR@immex.femsa.com.mx', '01 68 65 77 57 88', 'IMM861215HH0', '21395', 'MEXICALI, BAJA CALIFORNIA', 'AV. ALEJANDRITA 1593', 1, 'CLN-0033-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(132, NULL, 'IMMEX CEDIS LA PAZ', 'MVGARGAR@immex.femsa.com.mx', '01 61 21 24 66 77', 'IMM861215HH0', '23070', 'LA PAZ, BAJA CALIFORNIA', 'QUERETARO NO. 1846 ENTRE CALLE J MIJICA Y YUCATAN', 1, 'CLN-0033-0003', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(133, NULL, 'IMMEX CEDIS HERMOSILLO', 'VIHERREY@immex.femsa.com.mx', '01 66 22 13 08 94', 'IMM861215HH0', '83120', 'HERMOSILLO, SONORA', 'BLVD GARCIA MORALES NO. 162', 1, 'CLN-0033-0004', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(134, NULL, 'IMMEX CEDIS CD. OBREGON', 'VIHERREY@immex.femsa.com.mx', '-', 'IMM861215HH0', '85160', 'CIUDAD OBREGON, SONORA', 'IGNACIO RAMIREZ 256 OTE.', 1, 'CLN-0033-0005', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(135, NULL, 'IMMEX CEDIS CHIHUAHUA', 'PCENRSAN@oxxo.com', '-', 'IMM861215HH0', '31136', 'CHIHUAHUA, CHIHUAHUA.', 'NICOLAS GOGOL 11363', 1, 'CLN-0033-0006', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(136, NULL, 'IMMEX CEDIS CD. JUAREZ', 'JLCARELI@immex.femsa.com.mx', '01 65 66 26 29 76', 'IMM861215HH0', '32350', 'CIUDAD JUAREZ, CHIHAHUA', 'AV. PASEO DE LA VICTORIA 800', 1, 'CLN-0033-0007', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(137, NULL, 'IMMEX CEDIS TORREON', 'NPMEDDEL@immex.femsa.com.mx', '01 87 17 16 27 27', 'IMM861215HH0', '27089', 'TORREON, COAHUILA', 'AV. JUAREZ 5845 OTE.', 1, 'CLN-0033-0008', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(138, NULL, 'IMMEX CEDIS REYNOSA', 'LLOPGON@immex.femsa.com.mx', '01 89 99 24 98 33', 'IMM861215HH0', '88710', 'REYNOSA, TAMAULIPAS', 'AV. SAN RAFAEL LOTE 10 CRUCE LIBRAMIENTO  MONTERREY', 1, 'CLN-0033-0009', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(139, NULL, 'IMMEX CEDIS PIEDRAS NEGRAS', 'AJIMSEG@immex.femsa.com.mx', '01 87 87 82 25 77', 'IMM861215HH0', '26015', 'PIEDRAS NEGRAS, COAHUILA', 'FRANCISCO VILLA 210', 1, 'CLN-0033-0010', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(140, NULL, 'IMMEX CEDIS', '-', '01 81 80 48 70 00', 'IMM861215HH0', '64480', 'MONTERREY, NUEVO LEON', 'EDISON 1235 NORTE', 1, 'CLN-0033-0011', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:51:59', NULL),
(141, NULL, 'IMMEX CEDIS TAMPICO', 'DIBAMAR@immex.femsa.com.mx', '01 83 32 10 05 20', 'IMM861215HH0', '89344', 'TAMPICO, TAMAULIPAS', 'AV. RIVERA DE CHAMPAYAN 107 BODEGA 6', 1, 'CLN-0033-0012', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:52:00', NULL),
(142, NULL, 'IMMEX CEDIS GUADALAJARA', 'DEOLGPER@immex.femsa.com.mx', '-', 'IMM861215HH0', '45134', 'ZAPOPAN, JALISCO', 'AV. JUAN GIL PRECIADO 1904 A', 1, 'CLN-0033-0013', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:52:00', NULL),
(143, NULL, 'IMMEX CEDIS LEON', 'MAROBPIN@immex.femsa.com.mx', '-', 'IMM861215HH0', '37545', 'LEON DE LOS ALDAMA, GUANAJUATO', 'CALLE OMEGA 403 B', 1, 'CLN-0033-0014', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:52:00', NULL),
(144, NULL, 'IMMEX CEDIS QUERETARO', 'zorayda.morales@oxxo.com', '01 44 21 95 63 94', 'IMM861215HH0', '76920', 'CORREGIDORA, QUERETARO', 'CIRCUITO BALVANERA 16 BODEGA 8B', 1, 'CLN-0033-0015', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:52:00', NULL),
(145, NULL, 'IMMEX CEDIS ACAPULCO', 'JHSANGON@immex.femsa.com.mx', '-', 'IMM861215HH0', '39690', 'ACAPULCO DE JUAREZ, GUERRERO', 'AV FARALLON 50 LOCAL C ESQ. AV. MEXICO', 1, 'CLN-0033-0016', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:52:00', NULL),
(146, NULL, 'IMMEX CEDIS MERIDA', 'REXOONEG@immex.femsa.com.mx', '01 99 92 00 59 27', 'IMM861215HH0', '97390', 'UMAN, YUCATAN', 'CALLE 35 NUM 613 ENTRE CALLE 60', 1, 'CLN-0033-0017', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:52:00', NULL),
(147, NULL, 'IMMEX CEDIS MEXICO', 'MAMEDREY@immex.femsa.com.mx', '53 54 75 00', 'IMM861215HH0', '02760', 'MEXICO, D.F.', 'CALLE TOCHTLI No. 227 2', 1, 'CLN-0033-0018', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:52:00', NULL),
(148, NULL, 'IMMEX CEDIS PUEBLA', 'GHERMOR@immex.femsa.com.mx', '-', 'IMM861215HH0', '72494', 'PUEBLA', 'CAMINO REAL A CHAPULCO # 1647 BODEGAS 2 Y 3', 1, 'CLN-0033-0019', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:52:00', NULL),
(149, NULL, 'IMMEX CEDIS CULIACAN', 'YROMLOP@immex.femsa.com.mx', '-', 'IMM861215HH0', '80020', 'CULIACAN, SINALOA', 'CARRETERA MEXICO-NOGALES KILOMETRO 1430 S/N', 1, 'CLN-0033-0020', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:52:00', NULL),
(150, NULL, 'IMMEX CEDIS LOS MOCHIS', 'YROMLOP@immex.femsa.com.mx', '01 66 88 17 29 81', 'IMM861215HH0', '81249', 'LOS MOCHIS,SINALOA', 'BLVD. 10 DE MAYO 1591', 1, 'CLN-0033-0021', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:27:59', '2018-06-08 16:52:00', NULL),
(151, NULL, 'IMMEX CEDIS MAZATLAN', 'YROMLOP@immex.femsa.com.mx', '-', 'IMM861215HH0', '82110', 'MAZATLAN, SINALOA', 'CERRO DE LAS TORRES 101', 1, 'CLN-0033-0022', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:00', NULL),
(152, NULL, 'IMMEX CEDIS TIJUANA', 'MVGARGAR@immex.femsa.com.mx', '-', 'IMM861215HH0', '22643', 'TIJUANA, BAJA CALIFORNIA', 'BLVD. PACIFICO # 7630 ENTRE LIBRAMIENTO SUR Y BLVD PACIFICO', 1, 'CLN-0033-0023', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:00', NULL),
(153, NULL, 'IMMEX CEDIS SAN LUIS POTOSI', '-', '-', 'IMM861215HH0', '78390', 'SAN LUIS POTOSI', 'ISRAEL 429', 1, 'CLN-0033-0024', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:00', NULL),
(154, NULL, 'IMMEX CEDIS MATAMOROS', 'LLOPGON@immex.femsa.com.mx', '01 86 81 10 93 20', 'IMM861215HH0', '87396', 'MATAMOROS, TAMAULIPAS', 'CALLE NARDOS 2 ESQ. JOAQUIN PARDAVE', 1, 'CLN-0033-0025', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:00', NULL),
(155, NULL, 'IMMEX CEDIS VERACRUZ', '-', '-', 'IMM861215HH0', '94298', 'BOCA DEL RIO, VERACRUZ', 'CALLE URANO 17', 1, 'CLN-0033-0026', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:00', NULL),
(156, NULL, 'IMMEX CEDIS LA PAZ II', '-', '-', 'IMM861215HH0', '23205', 'LA PAZ, BAJA CALIFORNIA SUR', 'DESV CARRETERA AEROPUERTO 300', 1, 'CLN-0033-0027', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:01', NULL),
(157, NULL, 'IMMEX CEDIS NOGALES', 'VIHERREY@immex.femsa.com.mx', '-', 'IMM861215HH0', '84092', 'NOGALES, SONORA', 'AV. NUEVO NOGALES 182 LETRA A', 1, 'CLN-0033-0028', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:01', NULL),
(158, NULL, 'IMMEX CEDIS VERACRUZ (2)', 'GHERMOR@immex.femsa.com.mx', '01 44 33 17 94 86', 'IMM861215HH0', '91697', 'VERACRUZ', 'AV FRAMBOYANES MANZANA VII', 1, 'CLN-0033-0029', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:01', NULL),
(159, NULL, 'IMMEX CEDIS VILLAHERMOSA', 'REXOONEG@immex.femsa.com.mx', '01 99 31 90 39 60', 'IMM861215HH0', '86280', 'VILLAHERMOSA, TABASCO', 'CARR VILLAHERMOSA MACUSPANA KM 10 PARQUE IND ANGUIANO S/N', 1, 'CLN-0033-0030', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:01', NULL),
(160, NULL, 'IMMEX CEDIS CANCUN', 'REXOONEG@immex.femsa.com.mx', '01 99 81 47 49 52', 'IMM861215HH0', '77530', 'CANCUN, QUINTANA ROO', 'AV. COMALCALCO LOTE 1, SUPERMANZANA 97; MANZANA 6; ENTRE CALLE ACANCEH Y AV. COMALCALCO', 1, 'CLN-0033-0031', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:01', NULL),
(161, NULL, 'IMMEX CEDIS TUXTLA', '-', '-', 'IMM861215HH0', '29047', 'TUXTLA GUTIERREZ, TUXTLA GUTIERREZ', 'BLVD. ANTONIO PARIENTE ALGARIN  NO. 125 INTERIOR 1', 1, 'CLN-0033-0032', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:01', NULL),
(162, NULL, 'CHILIM BALAM, S. DE R. L. DE C. V.', 'respinosa@chilimbalam.com.mx', '53 57 49 00', 'CBA951115457', '11570', 'CIUDAD DE MEXICO', 'AV. EJERCITO NACIONAL 980 LOCAL 24O B-241', 1, 'CLN-0034-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:01', NULL),
(163, NULL, 'DULCERIAS DON GOLOSO, S.A. DE C.V.', 'svilla@productosmarcopolo.mx', '55 22 38 63', 'DDG080627AA5', '15810', 'CIUDAD DE MEXICO', 'GOMEZ PEDRAZA No.2', 1, 'CLN-0035-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:01', NULL),
(164, NULL, 'PASTELERIA BODON, S.A. DE C.V.', 'facturas@karamelo.com.mx;contabilidad@karamelo.com.mx', '56-89-30-48', 'PBO8907183G2', '04040', 'CIUDAD DE MEXICO', 'AV. MIGUEL ANGEL DE QUEVEDO NO. 1078', 1, 'CLN-0036-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:01', NULL),
(165, NULL, 'CLAUDINA DEL PILAR GUILLERMO RODRIGUEZ', 'svilla@productosmarcopolo.mx', '52 98 31 02 01 77', 'GURC8409181G5', '97116', 'MERIDA, YUCATAN', 'CALLE 49 X 30 Y 32 213 LOCAL 2', 1, 'CLN-0037-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:00', '2018-06-08 16:52:01', NULL),
(166, NULL, 'AUTOSUPER LA MONTA??ESA, S.A. DE C.V.', 'lamontanesa76@hotmail.com', '01 22 99 32 49 73', 'AMO830723PZ5', '91700', 'VERACRUZ, VERACRUZ', 'ALLENDE 2233', 1, 'CLN-0038-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:01', NULL),
(167, NULL, 'LOGISTICA Y ADMINISTRACION LOAD, S.A. DE C.V.', 'victena@hotmail.com', '57 19 64 49', 'LAL050308M52', '02300', 'CIUDAD DE MEXICO', 'PONIENTE 140 No. 671', 1, 'CLN-0039-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:01', NULL),
(168, NULL, 'GUTIERREZ ESCALANTE MARIA ENRIQUETA', '-', '15 48 40 23', 'GUEE740303H57', '43800', 'TIZAYUCA, HIDALGO', 'ALVARO OBREGON S/N', 1, 'CLN-0040-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:01', NULL),
(169, NULL, 'JOSE JIMENEZ MONTESINOS', 'rodolfo80@hotmail.es', '-', 'JIMJ560319793', '07250', 'MEXICO, D.F.', 'PRIMERA CERRADA DE RUIZ CORTINEZ 13', 1, 'CLN-0041-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:01', NULL),
(170, NULL, 'NUTRISA, S.A. DE C.V.', '-', '54 26 66 00', 'NUT840801733', '11230', 'CIUDAD DE MEXICO', 'CALZADA SAN BARTOLO NAUCALPAN 360', 1, 'CLN-0042-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:01', NULL),
(171, NULL, 'YOGURT HELADO YOZEN, S. A. DE C.V.', '-', '54 24 66 00', 'YHY1005159B0', '04700', 'MEXICO, D.F.', 'PERIFERICO SUR 5482', 1, 'CLN-0042-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:01', NULL),
(172, NULL, 'BASES Y PRODUCTOS NATURALES LA PLANTA, S. A. DE C. V', '-', '54 24 66 00', 'BPN110509A36', '01210', 'MEXICO, D.F.', 'AV. ANTONIO DOVALI JAIME NO. 70  PISO 3, TORRE C', 1, 'CLN-0042-0003', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:01', NULL),
(173, NULL, 'OPERADORA OMX, S.A. DE C.V.', 'ana.segovia@officemax.com.mx', '91 77 28 00', 'OOM960429832', '05348', 'CIUDAD DE MEXICO', 'PROLONGACION REFORMA NO. 1235 ENTRE CALLE DE MARIO PANI Y PROL. REFORMA', 1, 'CLN-0043-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:01', NULL),
(174, NULL, 'CADENA COMERCIAL OXXO, S.A. DE C.V.', 'recepcion.cscoxxo@csc.femsa.com.mx', '01 81 83 89 21 21', 'CCO8605231N4', '64480', 'MONTERREY', 'EDISON 1235 NORTE', 1, 'CLN-0044-0001', '100', '19', '15', '0.3', '85', '0', '1832', NULL, NULL, '2018-06-03 02:28:01', '2018-06-11 06:37:13', NULL),
(175, NULL, 'PROTIEND S.A. DE C.V.', '-', '01 55 55 33 74 33', 'PRO090903TD1', '03100', 'MEXICO, D.F.', 'BARRANCA DEL MUERTO NO 261 LOC B', 1, 'CLN-0045-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(176, NULL, 'SEARS OPERADORA MEXICO S.A. DE C.V.', '-', '56543899', 'SOM101125UEA', '11529', 'CIUDAD DE MEXICO', 'LAGO ZURICH 245 EDIF. PRESA FALCON PISO 7', 1, 'CLN-0046-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(177, NULL, 'SERVIDULCE, S.A. DE C.V.', 'rjaloma@servidulce.com', '10 85 08 90', 'SER080627TZA', '03020', 'MEXICO, D.F.', 'AV. CUAUHTEMOC NO. 462 K-06', 1, 'CLN-0047-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(178, NULL, 'TIENDAS CHEDRAUI, S.A. DE C.V.', '-', '01 22 88 42 11 00', 'TCH850701RM1', '11950', 'CIUDAD DE MEXICO', 'AV. CONSTITUYENTES 1150', 1, 'CLN-0048-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(179, NULL, 'TIENDAS SORIANA, S.A. DE C.V.', '-', '01 81 83 29 90 00', 'TSO991022PB6', '64610', 'MONTERREY, NUEVO LEON', 'ALEJANDRO DE RODAS 3102 A', 1, 'CLN-0049-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(180, NULL, 'TIENDAS SORIANA', '-', '01 81 83 29 90 00', 'TSO991022PB6', '64610', 'MONTERREY, NUEVO LEON', 'ALEJANDRO DE RODAS 3102 A', 1, 'CLN-0049-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(181, NULL, 'TIENDAS SORIANA MERCADOS', '-', '01 81 83 29 90 00', 'TSO991022PB6', '64610', 'MONTERREY, NUEVO LEON', 'ALEJANDRO DE RODAS 3102 A', 1, 'CLN-0049-0003', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(182, NULL, 'TIENDAS SORIANA', '-', '01 81 83 29 90 00', 'TSO991022PB6', '64610', 'MONTERREY, NUEVO LEON', 'ALEJANDRO DE RODAS 3102 A', 1, 'CLN-0049-0004', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(183, NULL, 'VENTA MOSTRADOR', '-', '-', 'XAXX010101000', '08400', 'MEXICO, D.F.', 'AZAFRAN 175', 1, 'CLN-0050-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(184, NULL, 'VENTA MOSTRADOR (MUESTRAS)', '-', '-', 'XAXX010101000', '08400', 'MEXICO, D.F.', 'AZAFRAN 175', 1, 'CLN-0050-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(185, NULL, 'VENTA MOSTRADOR (MAYOREO)', '-', '-', 'XAXX010101000', '08400', 'MEXICO, D.F.', 'AZAFRAN 175', 1, 'CLN-0050-0003', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(186, NULL, 'VENTA MOSTRADOR (MIGUEL ANGEL CRUZ)', '-', '52 57 40 35', 'XAXX010101000', '01210', 'MEXICO, D.F.', 'CALLE PRIMAVERA 40', 1, 'CLN-0051-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(187, NULL, 'ZONE COMPRA, S. DE R.L. DE C.V.', 'factura.xml@autozone.com', '01 86 77 19 26 82', 'ZCO980914I98', '88240', 'NUEVO LAREDO, TAMAULIPAS', 'AV. GUERRERO 2911 B', 1, 'CLN-0052-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:01', '2018-06-08 16:52:02', NULL),
(188, NULL, 'GRUPO GASTRONOMICO LA PANCHITA S.A. DE C.V.', '-', '55 89 09 04', 'GGP0403151B1', '52760', 'HUIXQUILUCAN', 'CERRADA DE LA CAMPANA 4 A', 1, 'CLN-0053-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:02', NULL),
(189, NULL, 'MORRIKOS, S.A. DE C.V.', '-', '55 5304 0926', 'MOR1409114C1', '52760', 'HUIXQUILUCAN', 'MONTE ALBAN MZ 2 LT2', 1, 'CLN-0053-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:02', NULL),
(190, NULL, 'OPERADORA EL SECRETO GOURMET, S.A. DE C.V.', '-', '55954728', 'OSG0805133Z0', '10610', 'MEXICO', 'VIOLETA 9', 1, 'CLN-0054-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:02', NULL),
(191, NULL, 'DIVERSIONES MOY MEXICO, S.A.  DE C.V.', '-', '01 33 36 21 16 45', 'DMM010227AY8', '45010', 'ZAPOPAN', 'VALLARTA 6503 48 E', 1, 'CLN-0055-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:02', NULL),
(192, NULL, 'ZETINA FRITSCHE AZUL KARISHA', '-', '-', 'ZEFA7803157S5', '52977', 'ADOLFO LOPEZ MATEOS', 'AV. RUIZ CORTINES 3 ED. 3', 1, 'CLN-0056-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(193, NULL, 'SUPER SMART DE VERACRUZ, S. A. DE C. V.', '-', '012299272030', 'SSV980817PL1', '91697', 'VERACRUZ', 'LAUREL MANZANA 19 LOTE 44 BOD. 1', 1, 'CLN-0057-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(194, NULL, 'IRMA SCHROEDER RODRIGUEZ', '-', '019585871006', 'SOR16911178U7', '70989', 'BAHIAS DE HUATULCO, OAXACA', 'JAZMIN 1501 SECTOR H', 1, 'CLN-0058-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL);
INSERT INTO `clients` (`id`, `branch_id`, `name`, `email`, `telephone`, `rfc`, `cp`, `city`, `address`, `status`, `code`, `P`, `shops`, `sku`, `D2`, `CE`, `TP`, `average`, `TE`, `appointment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(195, NULL, 'DANIELA LETICIA GUALINO CARDENAS', 'svilla@productosmarcopolo.mx', '312 3070878', 'GUCD760216BA9', '28030', 'COLIMA', 'LIBRO DE TEXTO GRATUITO 563', 1, 'CLN-0059-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(196, NULL, 'PFS DE MEXICO, SAPI DE C.V.', '-', '58995900', 'PME921109IS8', '54769', 'ESTADO DE MEXICO', 'CALZADA CETIS No. 10', 1, 'CLN-0060-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(197, NULL, 'BODEGAS EL CELLER, S. A. DE C. V.', 'rogeliogarcia@lanaval.com.mx', '55646294', 'BCE871119HZ9', '01780', 'MEXICO', 'ZAMORA 30', 1, 'CLN-0061-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(198, NULL, 'VINOS LA NAVAL, S. A. DE C. V.', 'facturas@lanaval.com.mx', '55646294', 'VNA150622SK4', '06100', 'CIUDAD DE MEXICO', 'INSURGENTES SUR 373 LOC 3-4', 1, 'CLN-0061-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(199, NULL, 'VENTAS Y SERVICIOS AL CONSUMIDOR, S. A. DE C. V.', 'cxpvesec@sixflags.com', '53393600', 'VSC8609016J2', '14200', 'CIUDAD DE MEXICO', 'CARR PICACHO AJUSCO KM 1.5', 1, 'CLN-0062-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(200, NULL, 'SIX FLAGS OAXTEPEC, S. A. DE C. V.', 'cxpvesec@sixflags.com', '53393600', 'SFO1512221X7', '62738', '-', 'CARRETERA FEDERAL MEXICO CUAUTLA KM 27+200', 1, 'CLN-0062-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(201, NULL, 'MMCINEMAS SUN MALL S.A. DE C.V.', '-', '-', 'MSM051017PT5', '67190', 'CD GUADALUPE', 'AVENIDA PABLO LIVAS 7601', 1, 'CLN-0063-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(202, NULL, 'VENDMAX INTERNACIONAL INC', '-', '-', 'XEXX010101000', '-', 'CANADA', '10 1393 BORDER STREET', 1, 'CLN-0064-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(203, NULL, 'FRANCISCO GERARDO CAMARGO ESPINOZA', '-', '014423123194', 'CAEF6010233K3', '76230', 'QUERETARO', 'AV. SANTA FE NO. 122 CASA 44', 1, 'CLN-0065-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(204, NULL, 'DISTRIBUIDORA DE BASICOS REGIOMONTANOS S.A. DE C.V.', '-', '01(818)327-3045', 'DBR930615B81', '66362', 'MONTERREY', 'CONSTITUCION 1201', 1, 'CLN-0066-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(205, NULL, 'DAVILA RAMIREZ MARIA MERCEDES', 'svilla@productosmarcopolo.mx', '017444433439', 'DARM390912MB7', '39890', 'ACAPULCO DE JUAREZ', 'JOYAS DIAMANTE 1 COND 6 CASA 185', 1, 'CLN-0067-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(206, NULL, 'LA RIVIERA VIVE CONTIGO MEXICO S.A. DE C.V.', '-', '57868469', 'RVC070710JW3', '15520', 'MEXICO, DF.', 'FRANCISCO SARABIA 7869747 INT B', 1, 'CLN-0068-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(207, NULL, 'HUMAR LOGISTICS, S.A. DE C.V.', '-', '-', 'HLO080515NL1', '72550', '-', 'AV. EJIDO No.5991', 1, 'CLN-0069-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(208, NULL, 'COSTCO DE MEXICO S.A. DE C.V.', '-', '52455567', 'CME910715UB9', '52760', 'HUIXQUILUCAN', 'BLVD MAGNOCENTRO 4', 1, 'CLN-0070-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(209, NULL, 'DISTRIBUIDORA STOREHOME, S. A. DE C. V.', '-', '52698000', 'DST080610JQ2', '11520', 'MEXICO, D. F.', 'AV. EJERCITO NACIONAL 769 , TORRE B PISO 14', 1, 'CLN-0071-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:03', NULL),
(210, NULL, 'RODOLFO ANTONIO VASQUEZ GRAMAJO', '-', '50250179768', 'XEXX010101000', 'S/N', 'QUETZALTENAGO', '28 AVENIDA A 1-14 ZONA 7', 1, 'CLN-0072-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:04', NULL),
(211, NULL, 'LUISASS PARTY, S. A. DE C. V.', '-', '36050941', 'LPA0508222W1', '52784', 'HUIXQUILUCAN', 'CIRCUITO EMPRESARIAL SN LOTE 12', 1, 'CLN-0073-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:04', NULL),
(212, NULL, 'AUTOTRANSPORTES DE CARGA TRESGUERRAS, S. A. DE C. V.', '-', '-', 'ACT6808066SA', '38110', 'CELAYA, GTO.', 'CARR. CELAYA VILLAGRAN KM 3.57 S/N', 1, 'CLN-0074-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:04', NULL),
(213, NULL, 'NORMA GABRIELA TALAMAS MERINO', '-', '5584886052', 'TAMN8403218R1', '6470', 'MEXICO, D. F.', 'IGNACIO MANUEL ALTAMIRANO 134', 1, 'CLN-0075-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:04', NULL),
(214, NULL, 'DANIEL GURAIEB MUSI', '-', '-', 'GUMD710723SW3', '52786', '-', 'AV MAGNOCENTRO SN LT 1 MZ 2 LOC 18', 1, 'CLN-0076-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:02', '2018-06-08 16:52:04', NULL),
(215, NULL, 'EXPRESS LOGISTICS RAMY, S. A. DE C. V.', '-', '-', 'ELR080515CM5', '72550', 'PUEBLA, PUEBLA', 'AVENIDA EJIDO 5991 A 1', 1, 'CLN-0077-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(216, NULL, 'ALFREDO GURAIEB MUSI', '-', '53114092', 'GUMA6711087M2', '01900', 'MEXICO, D. F.', 'AV. SAN JERONIMO 630 LOCAL 39', 1, 'CLN-0078-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(217, NULL, 'PRODUCTOS DE CONSUMO Z, S. A. DE C. V.', 'facturacion@pcz.com.mx', '01 951 501 99 99', 'PCZ071128UM9', '45590', 'TLAQUEPAQUE', 'CALLE INCALPA N. 2000', 1, 'CLN-0079-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(218, NULL, 'ULTRAMARINOS COLISEO, S. A. DE C. V.', 'facturas@ucoliseo.com.mx', '55181023', 'UCO941006D36', '6000', 'CIUDAD DE MEXICO', 'FRANCISCO I. MADERO ENTRE MOTOLINIA E I. CATOLICA 40 LOC A', 1, 'CLN-0080-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(219, NULL, 'PATENTES Y SERVICIOS INMOBILIARIOS S.A. DE C.V.', 'afierros@modeloplus.com.mx', '01(962)625-2753', 'PSI0401308Y2', '30770', 'TAPACHULA', 'CARRETERA A TALISMAN KM 2 SN', 1, 'CLN-0081-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(220, NULL, 'CENTRO COMERCIAL CRUZ AZUL, S. A. DE C. V.', 'facelec.ccca.hgo@prodigy.net.mx', '017737329201 EXT 115', 'CCC980828IW0', '42840', 'CIUDAD COOPERATIVA CRUZ AZUL', 'BOULEVARD DEL COOPERATIVISMO 1', 1, 'CLN-0082-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(221, NULL, 'ABASTECEDORA MARGO DEL CENTRO S. DE R.L. DE C.V.', '-', '01(222)621-6261', 'AMC1103023AA', '72377', 'PUEBLA', 'CALLE 12 ORIENTE 2220-1', 1, 'CLN-0083-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(222, NULL, 'YOGURT HELADO YOZEN, S. A. DE C. V.', '-', '54 24 66 00', 'YHY1005159B0', '04700', 'MEXICO, D.F.', 'PERIFERICO SUR 5482', 1, 'CLN-0084-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(223, NULL, 'OFFICE DEPOT DE MEXICO S.A. DE C.V.', '-', '5246-4000', 'ODM950324V2A', '05348', 'MEXICO', 'JUAN SALVADOR AGRAZ #101', 1, 'CLN-0085-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(224, NULL, 'GRUPO ISLY S.A. DE C.V.', '-', '2598-3450', 'GIS100708H11', '33000', 'MEXICO', 'AV. DIVISION DEL NORTE No. 2462-1', 1, 'CLN-0086-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(225, NULL, 'IXIM A.C.', '-', '0445523007395', 'IX10012059N1', '01030', 'MEXICO', '2DA. CERRADA DE MINERVA No. 34 5TO PISO', 1, 'CLN-0087-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(226, NULL, 'ROSA MARIA SANCHEZ MONDRAGON', '-', '018183586668', 'SAMR590127LJ6', '64000', 'MONTERREY, NUEVO LEON', 'SERAFIN PE??A # 1010 LOCAL 34', 1, 'CLN-0088-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(227, NULL, 'IVONNE BAROUDI ESTEFANO', '-', '-', 'BAEI470816187', '01780', 'MEXICO, D.F.', 'AV TOLUCA 1047 13', 1, 'CLN-0089-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:04', NULL),
(228, NULL, 'OLIVER CHRISTIAN BABINI MUZQUIZ', '-', '017222105606', 'BAMO900829KG1', '52140', 'METEPEC, EDO DE MEXICO', 'GUADALUPE VICTORIA 226-34', 1, 'CLN-0090-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(229, NULL, 'MARIA TERESA SUAREZ MONROY', 'svilla@productosmarcopolo.mx', '55522744', 'SUMT590409RV1', '15820', 'CIUDAD DE MEXICO', 'NIVEL 127 ESQ CONGRESO DE LA UNION', 1, 'CLN-0091-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(230, NULL, 'OMAR GUILLERMO ROJAS ALTAMIRANO', '-', '013324005933', 'ROAO761214915', '44690', 'GUADALAJARA', 'HERODOTO 130', 1, 'CLN-0092-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(231, NULL, 'COMERCIALIZADORA Y PROVEEDORA DE INSUMOS Y SERVICIOS INTEGRALES DE MEXICO S.A. DE C.V.', 'monikareyes77@yahoo.com', '58253240', 'CPI061019GAA', '52947', 'ATIZAPAN DE ZARAGOZA', 'OCEANO INDICO 55', 1, 'CLN-0093-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(232, NULL, 'MORONI GONZAGA CARAPIA', '-', '46149797', 'GOCM7102132M2', '54140', 'MEXICO', 'AQUILA 41', 1, 'CLN-0094-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(233, NULL, 'CLAUDIA ARELI MARIN VAZQUEZ', '-', '50974995', 'MAVC771113945', '55270', 'ECATEPEC, EDO DE MEXICO', 'MARAVILLAS NO. 104-1', 1, 'CLN-0095-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(234, NULL, 'POLANCO REPRESENTACIONES S.A. DE C.V.', 'facturas1@polancorepresentaciones.com', '56946449', 'PRE9909014BA', '09310', 'CIUDAD DE MEXICO', '16 DE MARZO No. 186 MZ 113 LT 1189', 1, 'CLN-0096-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(235, NULL, 'MAROSA DISTRIBUCIONES S.A. DE C.V.', '-', '01 33 36660050', 'MDI920518HI1', '45690', 'EL SALTO', 'AVENIDA PRODUCTIVIDAD 201-A', 1, 'CLN-0097-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(236, NULL, 'UPS AND DOWN S.A. DE C.V.', 'ups_down@infosel.net.mx', '18 18 34 51 600', 'UDO920428G30', '66269', 'NUEVO LEON', 'REAL SAN AGUSTIN 314 B-10', 1, 'CLN-0098-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(237, NULL, 'TIENDAS DE CONVENIENCIA DE OAXACA S.A. DE C.V.', 'compras@bama.mx', '01 921 21 57 409', 'TCO1205217N5', '70000', 'HEROICA CIUDAD DE JUCHITAN DE ZARAGOZA', 'CARRETERA PANAMERICANA KM 820 1', 1, 'CLN-0099-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(238, NULL, 'OPERADORA SISGO S.A. DE C.V.', 'proveedores@gomart.com.mx', '52 08 65 50', 'OSI000808GB0', '06470', 'MEXICO', 'INSURGENTES 23 INT-402', 1, 'CLN-0100-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(239, NULL, 'GRUPO OPERATIVO MART S.A. DE C.V.', '-', '52 08 04 01', 'GOM140325ES7', '06500', 'MEXICO, D.F.', 'RIO NILO No. 90 PISO - 7', 1, 'CLN-0100-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(240, NULL, 'WOW OPERADORA S.A. DE C.V.', 'facturas@tiendaswow.com', '21 67 96 70', 'WOP091201P93', '05120', 'MEXICO', 'PASEO DE LOS TAMARINDOS 400 SUITE 104', 1, 'CLN-0101-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(241, NULL, 'DAVID MARTIN TRUJILLO ELIZARRARAS', '-', '55 14 79 28 04', 'TUED9110298S6', '7969', 'MEXICO, D. F.', 'AV. 537 NO. 197 UNIDAD HABITACIONAL SAN JUAN DE ARAGON 2A SECC', 1, 'CLN-0102-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(242, NULL, 'LOTOPRO, S. A. DE C. V.', '-', '55 46 30 17  EXT 204', 'LOT970220EA0', '06030', 'MEXICO, D. F.', 'I MARISCAL 45 NO. 301', 1, 'CLN-0103-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(243, NULL, 'DISTRIBUIDORA LUDI, S. A. DE C. V.', 'ludiproveedores@gmail.com', '01 95 15 17 48 42', 'DLU970104UW0', '68090', 'OAXACA DE JUAREZ', 'MODULO U LOCAL 22 COSIJOEZA OAXACA', 1, 'CLN-0104-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:03', '2018-06-08 16:52:05', NULL),
(244, NULL, 'DISTRIBUIDORA DE PRODUCTOS SECOS S.A. DE C.V.', 'svilla@productosmarcopolo.mx', '01 81 83 85 62 01', 'DPS050203B26', '31107', 'CHIHUAHUA', 'REPUBLICA DE CUBA No. 522', 1, 'CLN-0105-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:05', NULL),
(245, NULL, 'MODELO SURTIDOR ABARROTERO S.A. DE C.V.', 'contabilidad@modelosurtidor.com', '01 244 446 10 57', 'MSA0805126K2', '74290', 'ATLIXCO', 'CALZADA OAXACA # 3101', 1, 'CLN-0106-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:05', NULL),
(246, NULL, 'VESTINI&A S. A. DE C. V.', '-', '-', 'VES8507044T0', '08400', 'MEXICO, D. F.', 'AVENA 532 A PB', 1, 'CLN-0107-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:05', NULL),
(247, NULL, 'INTERMEDIARIA DE BIENES MONTERREY S.A. DE C.V.', '-', '01 81 83 40 40 73', 'IBM1104046Y5', '64720', 'MONTERREY', 'ZUAZUA No. 309', 1, 'CLN-0108-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:05', NULL),
(248, NULL, 'COMERCIALIZADORA RAPIDO, S. A. DE C. V.', 'facxml@724.com.mx', '272 106 1083', 'CRA0404041I0', '94300', 'ORIZABA, VERACRUZ', 'AVENIDA ORIENTE 6 1217 A CENTRO', 1, 'CLN-0109-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(249, NULL, 'GRUPO COKAME, S DE R. L. DE C. V.', '-', '56 88 09 94', 'GCO031219EJ2', '3300', 'MEXICO, D. F.', 'RUMANIA 1198 VISTA HERMOSA Y RIO CHURUBUSCO', 1, 'CLN-0110-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(250, NULL, 'OPERADORA DE ALIMENTOS GALLETUCAS S.A. DE C.V.', 'earoche@hiilda.com', '52 81 46 82', 'OAG050826HH7', '53370', 'ESTADO DE MEXICO', 'PLASTICOS 96-A', 1, 'CLN-0111-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(251, NULL, 'ORGANIZACION IDEAL,  S DE R L DE C V', '-', '01 74 44 69 10 00', 'OID6704272V2', '39890', 'ACAPULCO DE JUAREZ, GRO', 'COSTERA DE LAS PALMAS S/N', 1, 'CLN-0112-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(252, NULL, 'CYNTHIA ELIZABETH MOTA RUIZ', 'cynmota@hotmail.com', '01 614 299 00 09', 'MORC780310EH3', '31207', 'CHIHUAHUA', 'PEDRO ZULUAGA No. 11400 INT-48', 1, 'CLN-0113-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(253, NULL, 'FRUTAS SECAS EL CASCANUECES S.A. DE C.V.', 'svilla@productosmarcopolo.mx', '56 94 07 69', 'FSC1001216K1', '09040', 'CIUDAD DE MEXICO', 'ZONA-1 SECTOR-4 NAVE-1 BODEGA B-32', 1, 'CLN-0114-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(254, NULL, 'GRUPO BETREL S.A. DE C.V.', '-', '-', 'GBE100129HD6', '66129', 'NUEVO LEON', 'SANTA MARIA RIVERA No 604', 1, 'CLN-0115-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(255, NULL, 'COMERCIALIZADORA CARCIE S.A. DE C.V.', 'fcardenas@carcie.com.mx', '01 81 84 48 85 63', 'CCA0709053EA', '64620', 'MONTERREY', 'PUERTO RICO 290-A', 1, 'CLN-0116-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(256, NULL, 'JORGE MANUEL ACEVEDO RAMIREZ', '-', '-', 'AERJ710423JF1', '9310', 'MEXICO, D. F.', '22 DE DIC. 1860 NO. 1374', 1, 'CLN-0117-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(257, NULL, 'VENTAS SERVICIOS Y ESPECTACULOS RECREATIVOS S. A. DE C. V.', 'contabilidadveser@recorcholis.com.mx', '53770020', 'VSE8902019B7', '09209', 'CIUDAD DE MEXICO', 'AV. MICHOACAN NO. 20 MODULOS 20 Y 22 BODEGAS 5 Y 6', 1, 'CLN-0118-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(258, NULL, 'CASA MARCHAND S.A. DE C.V.', 'facturas_cm@grupomarchand.com', '50 62 49 05', 'CMA831005SG1', '6000', 'MEXICO D.F.', 'MESONES 155 Y 157', 1, 'CLN-0119-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(259, NULL, 'TITO SORENSE MARTINEZ GUTIERREZ', 'lamexicana54@prodigy.net.mx', '-', 'MAGT680615P12', '75700', 'TEHUACAN, PUEBLA', 'CALLE 1 NORTE NO. 131 INT. 12', 1, 'CLN-0120-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(260, NULL, 'MAGICO COMERCIAL, S. A. DE C. V.', '-', '52302121   E-2215', 'MCO030320U39', '11580', 'MEXICO, D. F.', 'CIRCUITO DEL BOSQUE S/N', 1, 'CLN-0121-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(261, NULL, 'JOSEPHINE DEL CARMEN BAROUDI ESTEFANO', '-', '-', 'BAEJ501107IS9', '97000', 'MERIDA, YUCATAN', 'AV. CUPULES NO. 507 X62', 1, 'CLN-0122-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(262, NULL, 'DULCERIA LA ESTRELLA, S. A. DE C. V.', 'corporativo@dulcerialaestrella.com.mx', '-', 'DES020907CKA', '86126', 'VILLAHERMOSA, TABASCO', 'PERIF. CARLOS PELLICER CAMARA # 565-A', 1, 'CLN-0123-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(263, NULL, 'INOVACION COMERCIAL, S. A. DE C. V.', '-', '01 81 83427581', 'ICO8907203L5', '64620', 'MONTERREY, NUEVO LEON', 'INSURGENTES 2500 #227', 1, 'CLN-0124-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(264, NULL, 'REGULO FLORES VASQUEZ', 'svilla@productosmarcopolo.mx', '01 961 196 13 10', 'FOVR640725843', '30450', 'ARRIAGA', 'CENTRAL SUR No. 148-B', 1, 'CLN-0125-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(265, NULL, 'AMPARO VELAZQUEZ LOPEZ', 'svilla@productosmarcopolo.mx', '01 961 196 13 10', 'VELA730802LU5', '29000', 'TUXTLA GUTIERREZ', 'AV 4a SUR PONIENTE No. 232', 1, 'CLN-0126-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:06', NULL),
(266, NULL, 'CENTRAL DE DULCES DE MONCLOVA S.A. DE C.V.', 'svilla@productosmarcopolo.mx', '01 866 633 02 92', 'CDM040729DG9', '25700', 'MONCLOVA', 'GUERRERO No. 227', 1, 'CLN-0127-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:07', NULL),
(267, NULL, 'JAIME ESTEBAN MIRANDA NAJERA', 'svilla@productosmarcopolo.mx', '01 993 312 62 60', 'MINJ870716D3A', '86000', 'VILLAHERMOSA', 'PEDRO FUENTES No. 228', 1, 'CLN-0128-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:07', NULL),
(268, NULL, 'SUPER DULCERIA SALAS S.A.', 'dulceriasalas3@hotmail.com', '01 878 795 32 33', 'SDS000118C44', '26090', 'PIEDRAS NEGRAS', 'AV 16 DE SEPTIEMBRE No. 710 LOC-1', 1, 'CLN-0129-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:07', NULL),
(269, NULL, 'ENDO PORTILLO MIDORI', '-', '55 13 38 47', 'EOPM8207152UA', '14608', 'CIUDAD DE MEXICO', 'RETORNO 4 DEL TEPOZTECO No. 24', 1, 'CLN-0130-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:07', NULL),
(270, NULL, 'JESUS VILLATORO ALVARADO', 'laobakh@hotmail.com', '01-967-678-08-83', 'VIAJ470130P34', '29200', 'SAN CRISTOBAL DE LAS CASAS', 'INSURGENTES No. 7', 1, 'CLN-0131-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:07', NULL),
(271, NULL, 'LA IGLESIA DE JESUCRISTO DE LOS SANTOS DE LOS ULTIMOS DIAS EN MEXICO, A. R.', '-', '55 5245 9100', 'IJS930831J80', '53950', 'NAUCALPAN DE JUAREZ, ESTADO DE MEXICO', 'AV FUENTE DE PIRAMIDES NO. 1 PISOS 9,10 Y 11', 1, 'CLN-0132-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:07', NULL),
(272, NULL, 'DESARROLLOS INMOBILIARIOS SADASI, S. A. DE C. V.', '-', '55 3644 6556', 'DIS94050209X2', '11570', 'MEXICO, D. F.', 'ARQUIMEDES 3, 302', 1, 'CLN-0133-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:04', '2018-06-08 16:52:07', NULL),
(273, NULL, 'JESUS MARIA GUZMAN CAVAZOS', 'facturasdulceriasanjorge@hotmail.com', '-', 'GUCJ580207A59', '88650', 'REYNOSA, TAMAULIPAS', 'INDEPENDENCIA S/N', 1, 'CLN-0134-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:07', NULL),
(274, NULL, 'MATERIAS PRIMAS DE REYNOSA, S. A. DE C. V.', 'svilla@productosmarcopolo.mx', '-', 'MPR9209251H0', '88630', 'REYNOSA, TAMAULIPAS', 'HERON RAMIREZ NO. 790 INT. A', 1, 'CLN-0135-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:07', NULL),
(275, NULL, 'ADRIANA IRENE ACU??A ORTIZ', 'svilla@productosmarcopolo.mx', '0458992772531', 'AUOA760302C49', '88740', 'REYNOSA, TAMAULIPAS', 'AV. CENTRAL 125', 1, 'CLN-0136-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:07', NULL),
(276, NULL, 'CENTRO DISTRIBUIDOR DE ARTICULOS DESECHABLES S.A. DE C.V.', 'svilla@productosmarcopolo.mx', '01 993 351 23 05', 'CDA970207TB9', '86150', 'VILLAHERMOSA', 'IGNACIO ALLENDE No. 206', 1, 'CLN-0137-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:07', NULL),
(277, NULL, 'ANGELINA HERRERA RANGEL', 'svilla@productosmarcopolo.mx', '8948425300', 'HERA680419UL7', '87500', 'VALLE HERMOSO TAM.', 'SEGUNDA ENTRE ZARAGOZA Y FCO. I MADERO #320', 1, 'CLN-0138-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:07', NULL),
(278, NULL, 'JOSE ANGEL CERDA GARZA', 'svilla@productosmarcopolo.mx', '01 186 26 24 59 37', 'CEGA7903104X9', '26170', 'NAVA COAHUILA', 'ALDAMA No. 550 ORIENTE', 1, 'CLN-0139-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:07', NULL),
(279, NULL, 'SILVIA PATRICIA CARRILLO', 'svilla@productosmarcopolo.mx', '01 867 710 65 04', 'CASI6504277S2', '88190', 'NUEVO LAREDO', 'CALLE 5 DE FEBRERO No. 5410', 1, 'CLN-0140-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:07', NULL),
(280, NULL, 'ALFONSO LOPEZ MARTINEZ', 'svilla@productosmarcopolo.mx', '658 514 2399', 'LOMA621105D18', '21911', 'MEXICALI, B. C.', 'CARR. MEXICALI-SAN LUIS KM 40.5', 1, 'CLN-0141-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:07', NULL),
(281, NULL, 'JESUS DIAZ ONTIVEROS', 'svilla@productosmarcopolo.mx', '01 686 556 04 44', 'DIOJ740430SH6', '21030', 'MEXICALI', 'CALLE 1 No. 2198', 1, 'CLN-0142-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:07', NULL),
(282, NULL, 'ISAIAS MORALES SALGADO', 'svilla@productosmarcopolo.mx', '01 646 176 32 48', 'MOSI431119T33', '22880', 'ENSENADA BC', 'CALZADA CORTES Y BOULEVARD REFORMA No. 9', 1, 'CLN-0143-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:07', NULL),
(283, NULL, 'BLANCA ESTELA DOMINGUEZ MEJIA', 'svilla@productosmarcopolo.mx', '01686-5526-526', 'DOMB5802142V1', '21100', 'MEXICALI, B. C.', 'CALLE MEXICO NO. 434', 1, 'CLN-0144-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:07', NULL),
(284, NULL, 'DULCERIA LAS TRES CHICAS S DE R L DE C V', 'svilla@productosmarcopolo.mx', '686 562 7180', 'DTC0705155S5', '21399', 'MEXICALI, B. C.', 'RIO SAN PEDRO MEZQUITAL NO. 2101', 1, 'CLN-0145-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(285, NULL, 'DULCERIA LA TAPATIA, S. A. DE C. V.', 'svilla@productosmarcopolo.mx', '664 103 6027', 'DTA940218UN7', '22226', 'TIJUANA, B. C.', 'CALLE PRIVADA BENTON NO. 15228', 1, 'CLN-0146-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(286, NULL, 'OPERADORA HIILDA S A DE C V', '-', '56952882', 'OHI110907TEA', '53370', 'NAUCALPAN DE JUAREZ', 'PLASTICOS 96 SN', 1, 'CLN-0147-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(287, NULL, 'MARIA CONCEPCION ORTIZ PILAS', 'svilla@productosmarcopolo.mx', '01 664 684 25 26', 'OIPC670307D45', '22010', 'TIJUANA', 'BLVD SANCHEZ TABOADA INT MERCADO HIDALGO LOC-12', 1, 'CLN-0148-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(288, NULL, 'JOSE ALBERTO CANTERO RAMIREZ', 'svilla@productosmarcopolo.mx', '01 664 200 28 19', 'CARA820709SA0', '22320', 'TIJUANA', 'BLVD SANCHEZ TABOADA No. 9351 - 18', 1, 'CLN-0149-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(289, NULL, 'DULSETAM S. DE R.L. DE C.V.', 'dulsetam@gmail.com', '01 664 607 35 49', 'DUL1206065J5', '22300', 'TIJUANA', 'CALLE 16 No. 10528  LOCAL 11', 1, 'CLN-0150-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(290, NULL, 'MAYOREO DE DULCES LA ABEJA REYNA, S. A. DE C. V.', 'svilla@productosmarcopolo.mx', '961 611 2303', 'MDA900906SX7', '29049', 'TUXTLA GUTIERREZ, CHIS', 'CALLE 23 PONIENTE SUR S/N', 1, 'CLN-0151-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(291, NULL, 'LUIS ALBERTO MONTESINOS LEON', 'svilla@productosmarcopolo.mx', '968 688 3357', 'MOLL491015U99', '29140', 'TUXTLA GUTIERREZ, CHIS.', 'CALLE 2 NORTE PONIENTE NO. 29', 1, 'CLN-0152-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(292, NULL, 'ABASTECEDORA DE DULCERIAS S.A. DE C.V.', 'svilla@productosmarcopolo.mx', '-', 'ADU970619MLA', '64000', 'MONTERREY', 'RUPERTO MARTINEZ OTE No. 219', 1, 'CLN-0153-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(293, NULL, 'AXEL MAURICIO RODRIGUEZ GARCIA', 'svilla@productosmarcopolo.mx', '56 00 18 84', 'ROGA830318KW4', '09040', 'CIUDAD DE MEXICO', 'NAVE 104 CRUJIA E-2 LOCAL 55', 1, 'CLN-0154-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(294, NULL, 'WEYLER JOSE OY BALAM', 'svilla@productosmarcopolo.mx', '-', 'OBWE8903262E9', '77500', 'CANCUN, Q. ROO', 'CURICOTE MANZANA 31 LOTE 5', 1, 'CLN-0155-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(295, NULL, 'MARIA DEL PILAR BOUTTIER ABARCA', 'svilla@productosmarcopolo.mx', '963 631 0496', 'BOAP670427CZ7', '30140', 'TUXTLA GUTIERREZ, CHIS.', 'AV. CENTRAL SUR 38', 1, 'CLN-0156-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(296, NULL, 'ASHANTTI SOPHIE ANGULO GRACIA', 'svilla@productosmarcopolo.mx', '-', 'AUGA080818DW2', '21050', 'MEXICALI, BC', 'CASCADA NO. 400 LOC C1', 1, 'CLN-0157-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(297, NULL, 'PRADERAS DEL GRIJALVA S.A. DE C.V.', '-', '01 921 21 13 340', 'PGR931119QJ2', '86040', 'VILLAHERMOSA', 'AV. UNIVERSIDAD No. 212 ALTOS', 1, 'CLN-0158-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(298, NULL, 'CARLOS ANDRES DE LA TORRE PACHECO', 'herreradiaz70@hotmail.com', '244 445 2945', 'TOPC750611KT0', '74200', 'ATLIXCO, PUEBLA', 'CALLE 3 SUR #310 B', 1, 'CLN-0159-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(299, NULL, 'GLORIA ESCAMILLA MIRANDA', 'herreradiaz70@hotmail.com', '243 436 7450', 'EAMG770410JJA', '74400', 'IZUCAR DE MATAMOROS, PUEBLA', 'CONSTITUCION NO. 3', 1, 'CLN-0160-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:05', '2018-06-08 16:52:08', NULL),
(300, NULL, 'MARIO ALBERTO CORDOVA CERINO', 'svilla@productosmarcopolo.mx', '01 937 372 11 33', 'COCM7111242Q1', '86500', 'CARDENAS TABASCO', 'ABRAHAM BANDALA S/N', 1, 'CLN-0161-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:08', NULL),
(301, NULL, 'MULTIDULCES S.A. DE C.V.', 'herreradiaz70@hotmail.com', '01 222 234 22 64', 'MUL920101BQ6', '72000', 'PUEBLA', '4 ORIENTE No. 1613', 1, 'CLN-0162-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:08', NULL),
(302, NULL, 'MARIA MARCELA ROMERO QUINTERO', 'herreradiaz70@hotmail.com', '-', 'ROQM700116GU8', '72501', 'PUEBLA, PUE.', '13 ORIENTE 1428-A', 1, 'CLN-0163-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:08', NULL),
(303, NULL, 'JULIETA BERENICE RODRIGUEZ VILLALPANDO', 'svilla@productosmarcopolo.mx', '10 87 09 06', 'ROVJ870823JSA', '55070', 'ECATEPEC DE MORELOS', 'JARDINES DE MORELOS MANZANA 801 LOTE 20 S/N', 1, 'CLN-0164-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(304, NULL, 'JACOBO RODRIGUEZ CRUZ', 'herreradiaz70@hotmail.com', '01 248 484 09 63', 'ROCJ821103C92', '74000', 'SAN MARTIN TEXMELUCAN', '16 DE SEPTIEMBRE SUR No. 205-A', 1, 'CLN-0165-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(305, NULL, 'BENIGNO PEDRO PEREZ SANCHEZ', 'herreradiaz70@hotmail.com', '01 222 288 04 15', 'PESB470213183', '72019', 'PUEBLA', 'CIRCUITO ORIENTE No. 13 LOC- C,D Y E', 1, 'CLN-0166-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(306, NULL, 'DULCERIA SUSY S.A. DE C.V.', 'gsaulrivera@yahoo.com.mx', '01 222 288 09 14', 'DSU910312LS0', '72019', 'PUEBLA', 'NAVE A BODEGA No.20', 1, 'CLN-0167-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(307, NULL, 'DULCERIAS GABY S.A. DE C.V.', 'herreradiaz70@hotmail.com', '01 246 462 78 54', 'DGA910910L68', '90000', 'TLAXCALA', 'BOULEVARD GUILLERMO VALLE No. 66 LOC-35', 1, 'CLN-0168-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(308, NULL, 'RAUL BARON CASTILLO', 'grupodulcerowally@hotmail.com', '55 59 38 05 39', 'BACR570924P60', '55060', 'ECATEPEC', 'AVENIDA CENTRAL No. 38 B LOC-NE1', 1, 'CLN-0169-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(309, NULL, 'MARIA ESTELA SALADO DORANTES', 'dulceriatita@hotmail.com', '01 241 113 11 50', 'SADE711226KB4', '90300', 'APIZACO', 'CUAHUTEMOC 1108-A', 1, 'CLN-0170-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(310, NULL, 'MARIA IRMA PEREZ ESPINOZA', 'herreradiaz70@hotmail.com', '-', 'PEEI8712244E3', '90000', 'TLAXCALA', 'LIRA Y ORTEGA No. 47', 1, 'CLN-0171-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(311, NULL, 'LAURA BERNAL BAUTISTA', 'herreradiaz70@hotmail.com', '01 222 296 86 68', 'BEBL740529SJ8', '72760', 'CHOLULA', 'CAMINO A MORILLOTLA No.4212-B', 1, 'CLN-0172-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(312, NULL, 'JIMENA MANUELA CORTES QUINTANA', 'lizalex320@hotmail.com', '-', 'COQJ810108Q37', '29000', 'OAXACA', 'CORREGIDORA NORTE No. 109', 1, 'CLN-0173-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(313, NULL, 'MAYORISTA DE  DULCES ECATEPEC S.A. DE C.V.', 'mayorista_ecatepec@hotmail.com', '55 59 58 75 07', 'MDE0803132A2', '55065', 'ECATEPEC DE MORELOS', 'AV. CENTRAL NAVE-1 BODEGAS-814 Y 817', 1, 'CLN-0174-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(314, NULL, 'MAYORISTA DE DULCES IZTAPALAPA S.A. DE C.V.', 'svilla@productosmarcopolo.mx', '55 56 94 37 07', 'MDI0803131A9', '09040', 'CIUDAD DE MEXICO', 'CENTRAL DE ABASTO ZONA V SECC 3 NAVE 2 BOD D50 D52', 1, 'CLN-0175-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(315, NULL, 'ABARROTES TLACOTEPEC S.A. DE C.V.', 'lizalex320@hotmail.com', '-', 'ATL030813QJ4', '75680', 'TLACOTEPEC DE BENITO JUAREZ', 'AVENIDA MEXICO No. 69', 1, 'CLN-0176-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(316, NULL, 'NORMA GABRIELA TALAMAS MERINO', 'svilla@productosmarcopolo.mx', '84 88 60 52', 'TAMN8403218R1', '06470', 'CIUDAD DE MEXICO', 'IGNACIO MANUEL ALTAMIRANO No. 134', 1, 'CLN-0177-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(317, NULL, 'SUPER DULCERIA LARYN S.A. DE C.V.', 'grupolaryn@prodigy.net.mx', '01274-743-2622', 'SDL060620A11', '95100', 'TIERRA BLANCA', 'CALLE 5 DE MAYO No. 801', 1, 'CLN-0178-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(318, NULL, 'LA NUEVA SERPENTINA S.A. DE C.V.', 'laserpentina@hotmail.com', '0122-8817-0693', 'NSE921217N90', '91040', 'XALAPA VER.', 'CALLE VERACRUZ #86', 1, 'CLN-0179-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(319, NULL, 'DULCERA LA JOSEFINA S.A. DE C.V.', 'cfd@lajosefina.mx', '271 712 4764', 'DJO800131U52', '94500', 'CORDOBA', 'AVENIDA CENTRAL No. 1025', 1, 'CLN-0180-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:09', NULL),
(320, NULL, 'CONAGRA FOODS MEXICO S. A. DE C. V.', '-', '044 55 40802090', 'CFM600506V82', '36680', 'IRAPUATO, GTO', 'BLVD PASEO SOLIDARIDAD NO. 11251', 1, 'CLN-0181-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:10', NULL),
(321, NULL, 'ERIKA GUADALUPE ESTEBAN GUZMAN', '-', '63 91 64 00', 'EEGE790222JA5', '06170', 'MEXICO, D. F.', 'AV. ALTATA NO. 43', 1, 'CLN-0182-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:10', NULL),
(322, NULL, 'VICTOR MANUEL NU??EZ TORRES', 'lizalex320@hotmail.com', '-', 'NUTV841116U61', '42500', 'ACTOPAN', 'PLAZA JUAREZ # 23', 1, 'CLN-0183-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:10', NULL),
(323, NULL, 'ABARROTES LA CORONA DE TEHUACAN S.A. DE C.V.', 'herreradiaz70@hotmail.com', '-', 'ACT9709191VA', '75700', 'TEHUACAN, PUE', '3 ORIENTE No. 322', 1, 'CLN-0184-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:10', NULL),
(324, NULL, 'MARIA FELIX MENESES RUIZ', 'herreradiaz70@hotmail.com', '01 222 220 92 64', 'MERF650710I55', '72050', 'PUEBLA, PUE', 'BOULEVARD NORTE No. 2702 LOC-H', 1, 'CLN-0185-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:10', NULL),
(325, NULL, 'AGUSTIN HERRERA MORENO', 'alangel39@hotmail.com', '01231-0311-1533', 'HEMA731003F16', '73940', 'ATEMPAN, PUEBLA', '2 SUR Y 3 ORIENTE No. 3-C', 1, 'CLN-0186-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:10', NULL),
(326, NULL, 'VICTOR ALFONSO CORTES HERNANDEZ', 'herreradiaz70@hotmail.com', '-', 'COHV840314PD0', '73800', 'TEZIUTLAN, PUEBLA', 'AVENIDA HIDALGO No. 608 LOC-2', 1, 'CLN-0187-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:10', NULL),
(327, NULL, 'RESTAURANTE BEER CITY S.A. DE C.V.', 'herreradiaz70@hotmail.com', '-', 'RBC120719JN7', '72197', 'PUEBLA, PUE', 'BOULEVARD DEL NI??O POBLANO No. 2510 E-3', 1, 'CLN-0188-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:10', NULL),
(328, NULL, 'MIGUEL GERARDO CRUZ GUZMAN', 'berdeja63@hotmail.com', '-', 'CUGM5809298V0', '69000', 'HUAJUAPAN DE LEON OAX', 'MORELOS No. 370', 1, 'CLN-0189-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:06', '2018-06-08 16:52:10', NULL),
(329, NULL, 'MARISOL PATRON RIVERA', 'berdeja@hotmail.com', '01 747 472 87 14', 'PARM870806AW5', '39010', 'CHILPANCINGO DE LOS BRAVOS, GRO', 'INGENIERO DAVID SANTILLAN # 7', 1, 'CLN-0190-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:10', NULL),
(330, NULL, 'OSVALDO DE JESUS LOPEZ LEAL', 'svilla@productosmarcopolo.mx', '01 899 922 23 48', 'LOLO780709JU8', '88550', 'REYNOSA, TAMPS', 'MIGUEL ALEMAN No. 103 LOC- 26A', 1, 'CLN-0191-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:10', NULL),
(331, NULL, 'MARIA LUISA WILCHES BECERRA', 'svilla@productosmarcopolo.mx', '8332140098', 'WIBL7307078M9', '89339', 'TAMPICO, TAMPS', 'ALVARO OBREGON No. 205', 1, 'CLN-0192-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:10', NULL),
(332, NULL, 'MAYORISTA DE  DULCES TLALNEPANTLA S.A. DE  C.V.', 'svilla@productosmarcopolo.mx', '-', 'MDT080313LW3', '54030', 'TLALNEPANTLA, MEXICO', 'RADIAL TOLTECA No. 348', 1, 'CLN-0193-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:10', NULL),
(333, NULL, 'LA CASA DEL DULCE', 'svilla@productosmarcopolo.mx', '01 899 284 46 46', 'XEXX010101000', '78537', 'DONNA, TEX', '2215 E, BUSINESS HIGHWAY 83', 1, 'CLN-0194-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:10', NULL),
(334, NULL, 'GRUPO DULCERO ABOYTES S.A. DE C.V.', 'svilla@productosmarcopolo.mx', '-', 'GDA920601RU0', '98604', 'GUADALUPE, ZAC', 'SECRETARIA DE COMUNICACIONES Y TRANSPORTES No. 5', 1, 'CLN-0195-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:10', NULL),
(335, NULL, 'OPERADORA CINEMEX DE MEXICO SA DE CV', '-', '52 01 58 00', 'CME920910DR7', '01210', 'ALVARO OBREGON', 'AV JAVIER BARROS SIERRA No. 540 TORRE-1 PH-1', 1, 'CLN-0196-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:10', NULL),
(336, NULL, 'CORPORATIVO GASOLINERO DEL CARIBE S.A. DE C.V.', 'recepcion.facturas@lodemored.com.mx', '01 999 91 90 050', 'CGC1005243I3', '97246', 'MERIDA, YUC', 'ANILLO PERIFERICO T.C. 13893', 1, 'CLN-0197-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:10', NULL),
(337, NULL, 'ESTATIENDAS, SA DE CV.', 'recepcion.facturas@lodemored.com.mx', '01 999 942 21 00', 'EST150114FW8', '97300', 'MERIDA, YUC', 'AV.60 DIAGONAL #490', 1, 'CLN-0197-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:10', NULL),
(338, NULL, 'BOUTIQUE DEL DULCE, S.A. DE C.V.', 'candylabplazacarso@gmail.com', '55 20 78 83', 'BDU100705S32', '11410', 'MEXICO, D. F.', 'CALLE MAR NEGRO NO.1 INT. 2', 1, 'CLN-0198-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(339, NULL, 'JUAN CARLOS LARA AVILA', 'svilla@productosmarcopolo.mx', '-', 'LAAJ741110MR7', '22244', 'TIJUANA, BC', 'HACIENDA SANTA AGUEDA No. 10155  S-27', 1, 'CLN-0199-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(340, NULL, 'ALBERTO JOVANY MEJIA REBOLLEDO', 'herreradiaz70@hotmail.com', '5539934621', 'MERA840523HU2', '43600', 'TULANCINGO DE BRAVO, HGO', 'CIPRES No. 204', 1, 'CLN-0200-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(341, NULL, 'DULCERIA EL COMPETIDOR S.A. DE C.V.', 'dulceriaelcompetidor@hotmail.com', '56946693', 'DCO041202BD7', '09040', 'CIUDAD DE MEXICO', 'C-15 Z-1 S-2 N-1 BODEGA F-20 Y 22', 1, 'CLN-0201-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(342, NULL, 'DISTRIBUIDORA LA DULCE VIDA S.A. DE C.V.', 'svilla@productosmarcopolo.mx', '-', 'DDV010726MN2', '09660', 'CIUDAD DE MEXICO', 'AV ERMITA IZTAPALAPA No. 3365 LOC-B1', 1, 'CLN-0202-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(343, NULL, 'ISRAEL DELGADO MONTER', 'laplazadeldulce@hotmail.com', '-', 'DEMI760402CB8', '07850', 'CIUDAD DE MEXICO', 'CALLE NORTE No. 5946', 1, 'CLN-0203-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(344, NULL, 'SUSANA SERRANO LUNA', 'svilla@productosmarcopolo.mx', '-', 'SELS761222P22', '55065', 'ECATEPEC, ESTADO DE MEXICO', 'LECHERIA NAVE-1 LT-803', 1, 'CLN-0204-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(345, NULL, 'DISTRIBUIDORA DE DULCES HUAMANTLA S.A. DE C.V.', 'diduhsa85@hotmail.com', '01 247 472 10 96', 'DDH850216T49', '90500', 'HUAMANTLA, TLAX', 'ALLENDE NORTE No. 108', 1, 'CLN-0205-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(346, NULL, 'BLANCA ESTELA MARTINEZ GONZALEZ', 'herreradiaz70@hotmail.com', '01 222 246 46 96', 'MAGB6703316XA', '72000', 'PUEBLA, PUE', '6 PONIENTE No. 505-C', 1, 'CLN-0206-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(347, NULL, 'MARIO ALBERTO MONTERROSAS RIVERA', 'herreradiaz70@hotmail.com', '-', 'MORM840301AI3', '72760', 'CHOLULA, PUE', 'BOULEVARD CHOLULA HUEJOTZINGO No. 1311', 1, 'CLN-0207-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(348, NULL, 'COMERCIALIZADORA A UN SOLO PRECIO, S. A. DE C. V.', '-', '57616162', 'CUS0510118J1', '06080', 'CIUDAD DE MEXICO', 'NETZAHUALCOYOTL 79', 1, 'CLN-0208-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(349, NULL, 'RICARDO MONTIEL MENDEZ', 'herreradiaz70@hotmail.com', '-', 'MOMR900916TK6', '72000', 'PUEBLA, PUE', '8 PONIENTE No. 315-7', 1, 'CLN-0209-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(350, NULL, 'RESTAURANTES IZY DE MEXICO, S. A. DE C. V.', '-', '01 712 1204056', 'RIM13102217A', '52140', 'METEPEC, EDO DE MEXICO', 'LEONA VICARIO 346', 1, 'CLN-0210-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(351, NULL, 'RESTAURANTES IZY DE MEXICO, S. A. DE C. V.', '-', '01 712 1204056', 'RIM13102217A', '50075', 'TOLUCA DE LERDO', 'BOULEVARD ALFREDO DEL MAZO # 703', 1, 'CLN-0210-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(352, NULL, 'GRUPO EMPRESARIAL S. J. S. A. DE C. V.', '-', '50 78 01 00', 'GES021031BL9', '02300', 'CIUDAD DE MEXICO', 'PONIENTE 150 660-C', 1, 'CLN-0211-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(353, NULL, 'DULCERIA SU-MERCA S.A. DE C.V.', 'svilla@productosmarcopolo.mx', '01 993 266 24 71', 'DSU111123FG2', '86000', 'VILLAHERMOSA, TABS', 'PRIMAVERA No. 128 B Y C', 1, 'CLN-0212-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(354, NULL, 'MAGDIEL MORALES CASTRO', 'svilla@productosmarcopolo.mx', '01 993 317 96 08', 'MOCM8102137P2', '86220', 'NACAJUCA, TAB', 'CERRADA MONTEJO No. 162', 1, 'CLN-0213-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(355, NULL, 'IRIS ABRIL VELASCO VALDEZ', 'iris.abril.velasco@gmail.com', '5855-5719', 'VEVI7909022G2', '57840', 'NEZAHUALCOYOTL, MEXICO', 'AVENIDA FLORESTA No. 161', 1, 'CLN-0214-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:11', NULL),
(356, NULL, 'NICOLAS ARTURO JUAREZ HERRERA', '-', '21 63 22 88', 'JUHN590910IE4', '5000', 'CUAJIMALPA DE MORELOS, CDMX', 'AVENIDA VERACRUZ No. 17', 1, 'CLN-0215-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:12', NULL),
(357, NULL, 'LARINKA MISSURY NAVARRO MODAD', 'larink_1506@hotmail.com', '01 323 235 47 58', 'NAML9303106G7', '63300', 'SANTIAGO IXCUINTLA, NAY', 'BRAVO No. 45', 1, 'CLN-0216-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:12', NULL),
(358, NULL, 'HUMBERTO RODRIGUEZ FAUSTO', 'contabilidadlasuiza@outlook.com', '01 311 456 07 77', 'ROFH590310986', '63164', 'TEPIC, NAY', 'DRESDE No. 595', 1, 'CLN-0217-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:07', '2018-06-08 16:52:12', NULL),
(359, NULL, 'ARNOLDO RAMIREZ VAZQUEZ', 'dulceriaarnoldo@gmail.com', '01 311 232 21 51', 'RAVA7210178P2', '63200', 'TUXPAN, NAY', 'INDEPENDENCIA S/N LOCAL 9 Y 10', 1, 'CLN-0218-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(360, NULL, 'JAIME ENRIQUE MEDINA GARCIA', 'jemg_messi@hotmail.com', '01 311 212 14 42', 'MEGJ6401059M9', '63000', 'TEPIC, NAY', 'ZACATECAS No. 356', 1, 'CLN-0219-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(361, NULL, 'RAUL ABUD MARTINEZ', 'svilla@productosmarcopolo.mx', '01 319 233 01 66', 'AUMR73060917A', '63600', 'RUIZ, NAY', 'HIDALGO No. 210', 1, 'CLN-0220-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(362, NULL, 'NORMA ALICIA JIMENEZ LOPEZ', 'lasamericasdulcerias@hotmail.com', '01 311 212 08 57', 'JILN720125HZ4', '63000', 'TEPIC, NAY', 'MERIDA NORTE No. 68', 1, 'CLN-0221-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(363, NULL, 'JOSE ANGEL ARTEAGA MEJIA', 'lapinatacontabilidad@hotmail.com', '01 311 212 64 26', 'AEMA800209S19', '63000', 'TEPIC, NAY', 'ZARAGOZA 64 ORIENTE', 1, 'CLN-0222-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(364, NULL, 'NAYELI GUERRERO PEREZ', 'svilla@productosmarcopolo.mx', '01 389 25 31 220', 'GUPN890218M41', '63440', 'TECUALA, NAY', 'MORELOS No. 69', 1, 'CLN-0223-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(365, NULL, 'RICARDO PARRA TIZNADO', 'svilla@productosmarcopolo.mx', '01 389 253 09 90', 'PATR8011153U5', '63440', 'TECUALA, NAY', 'MORELOS No. 61', 1, 'CLN-0224-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(366, NULL, 'ALMA ROSA AGUILAR HERRERA', 'svilla@productosmarcopolo.mx', '01 669 953 22 39', 'AUHA621109838', '82400', 'ESCUINAPA, SIN', 'INDEPENDENCIA LOC-2', 1, 'CLN-0225-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(367, NULL, 'FRANCISCO JAVIER VELARDE BURGUE??O', 'francisco-donjuan@outlook.es', '01 669 967 21 16', 'VEBF771021BT1', '82210', 'VILLA UNION, SIN', 'FRANCISCO I MADERO No. 209', 1, 'CLN-0226-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(368, NULL, 'SUPER DULCERIA VALDEZ S.A. DE C.V.', 'svilla@productosmarcopolo.mx', '01 669 980 80 10', 'SDV9101173J7', '82129', 'MAZATLAN, SIN', 'CARRETERA INT AL NORTE No. 1217', 1, 'CLN-0227-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(369, NULL, 'DRESS FOR HOME S. A. P. I. DE C. V.', 'jibanez@homeprice.com.mx', '52 92 11 75', 'DFH130606FCA', '01210', 'MEXICO, D. F.', 'PROLONGACION PASEO DE LA REFORMA NO. 400', 1, 'CLN-0228-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(370, NULL, 'COMPA??IA PROMOTORA DE EVENTOS INTERNACIONALES S A P I  DE CV', '-', '62 35 70 16', 'PEI0803284X0', '64740', 'MONTEREY, NVO LEON', 'RIO TAMESI No. 300', 1, 'CLN-0229-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(371, NULL, 'ESPERANZA MARTINEZ JIMENEZ', 'esperanza_m_43@hotmail.com', '01 311 233 01 66', 'MAJE430515AW2', '63600', 'RUIZ, NAYARIT', 'MIGUEL HIDALGO No. 210', 1, 'CLN-0230-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(372, NULL, 'MARIA ISABEL SALAS SANDOVAL', 'svilla@productosmarcopolo.mx', '01 311 109 84 52', 'SASI640703EQ0', '63200', 'TUXPAN, NAY', 'VICTORIA NORTE No. 33', 1, 'CLN-0231-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(373, NULL, 'INFRA, S.A. DE C.V.', 'JVELAZQUEZ@INFRA.COM.MX', '5329-3000', 'INF891031LT4', '53398', 'NAUCALPAN EDO. DE MEXICO', 'FELIX GUZMAN NUM.16 3ER. PISO', 1, 'CLN-0232-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(374, NULL, 'ESPECIA S.A. DE C.V.', '-', '52 39 90 00', 'ESP010112KJ0', '11550', 'MEXICO, D.F.', 'NEWTON 16', 1, 'CLN-0233-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL);
INSERT INTO `clients` (`id`, `branch_id`, `name`, `email`, `telephone`, `rfc`, `cp`, `city`, `address`, `status`, `code`, `P`, `shops`, `sku`, `D2`, `CE`, `TP`, `average`, `TE`, `appointment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(375, NULL, 'JORGE SALOMON MOLINA', '-', '771 71 55 800', 'SAMJ5705176A2', '42000', 'PACHUCA DE SOTO', 'VICTORIA NO. 207 PLANTA BAJA', 1, 'CLN-0234-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:12', NULL),
(376, NULL, 'ABASTECEDORA LUMEN, S. A. DE C. V.', '-', '54906500', 'ALU830902ST5', '06000', 'CIUDAD DE MEXICO', 'AV. REPUBLICA DEL SALVADOR  NO. 52 Y 54', 1, 'CLN-0235-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:13', NULL),
(377, NULL, 'LA CAVA DE JAMES S. A. DE C. V.', '-', '01 782 111 8394', 'CJA060614MW6', '92912', 'VERACRUZ', 'INDEPENDENCIA 116', 1, 'CLN-0236-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:13', NULL),
(378, NULL, 'SERVICIOS SHASA, S DE R. L. DE C. V.', 'pcervantes@shasa.com', '52 728 28 272 60', 'SSH9608016NA', '52000', 'TOLUCA', 'BLVD. AEROPUERTO MIGUEL ALEMAN 154 11', 1, 'CLN-0237-0001', '10', '10', '10', '0.3', '54', '0', '9', 15, 1, '2018-06-03 02:28:08', '2018-07-23 18:57:13', NULL),
(379, NULL, 'SANBORN HERMANOS S A', '-', '52 25 99 00', 'SHE190630V37', '11529', 'DISTRITO FEDERAL', 'LAGO ZURICH 245 EDIFICIO PRESA FALCON PISO 7', 1, 'CLN-0238-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:13', NULL),
(380, NULL, 'ADMINISTRACION INTEGRAL DE ALIMENTOS S A DE C V', '-', '53 25 99 00', 'AIA941123Q99', '11529', 'DISTRITO FEDERAL', 'LAGO ZURICH 245 EDIFICIO PRESA FALCON PISO 7', 1, 'CLN-0238-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:13', NULL),
(381, NULL, 'FLAVIO ARTEMIO FERNANDEZ SOTO', 'dulces.casa.faby@live.com', '56944919', 'FESF751020927', '9300', 'CIUDAD DE MEXICO', 'PAS 1 SECC.4 CENTRAL DE ABTOS LOC.7 CRUJIA107', 1, 'CLN-0239-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:13', NULL),
(382, NULL, 'NOELIA EDNA JARQUIN PERALTA', 'gugj06@hotmail.com', '9515730835', 'JAPN67031584A', '71500', 'EJUTLA DE CRESPO OAX', 'MANUEL SABINO CRESPO #53', 1, 'CLN-0240-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:13', NULL),
(383, NULL, 'FERNANDO AREVALO CORREA', 'jcarevalo@hotmail.com', '015959540417', 'AECF740727UG2', '56100', 'TEXCOCO EDO MEX.', '2 DE MARZO #505', 1, 'CLN-0241-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:13', NULL),
(384, NULL, 'BERTHA YOLANDA AYALA LOPEZ', 'angie-maryhigh@hotmail.com', '59710675', 'AALB6503255G1', '56615', 'VALLE DE CHALCO', 'CALLE NORTE 30 MZ.4 LT 48', 1, 'CLN-0242-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:13', NULL),
(385, NULL, 'CORINA PEREZ CRUZ', 'corina.comprasxml@outlook.com', '222 288 0415', 'PECC800409T18', '72920', 'PUEBLA', 'CTO. INT. NTE 3', 1, 'CLN-0243-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:08', '2018-06-08 16:52:13', NULL),
(386, NULL, 'ODILON MOLINA GARCIA', 'svilla@productosmarcopolo.mx', '15404428', 'MOGO660101815', '55510', 'ECATEPEC', 'MANZANA 39 LOTE 18 S/N', 1, 'CLN-0244-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:13', NULL),
(387, NULL, 'TIENDAS TRES B S.A. DE C.V.', 'nr@tiendas3b.com', '5511021200', 'TTB040915CY9', '06500', 'DF', 'RIO DANUBIO #51 PISO 2', 1, 'CLN-0245-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:13', NULL),
(388, NULL, 'ESTAMOS DE FIESTA S.A. DE C.V.', 'compras@fiestaslaconcordia.com', '012222843007', 'EFI020621PZ0', '72150', 'PUEBLA', 'CALZADA ZAVALETA 2519 LOCAL B', 1, 'CLN-0246-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:13', NULL),
(389, NULL, 'CORONADULCES S.A DE C.V.', 'coronadulces@hotmail.com', '-', 'COR010403NQ6', '68000', 'OAXACA OAX', 'LAS CASAS 202', 1, 'CLN-0247-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:13', NULL),
(390, NULL, 'MARIA YUCUNDA ROSARIO HERNANDEZ GUERRERO', 'dulceria303@gmail.com', '0452313228442', 'HEGY5711145F5', '73800', 'TEZUITLAN PUE.', '16 DE SEPTIEMBRE # 303', 1, 'CLN-0248-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:13', NULL),
(391, NULL, 'HERIBERTO MELENDEZ VAZQUEZ', 'berdeja63@hotmail.com', '019535522402', 'MEVH700803SA4', '69800', 'TLAXIACO OAX', 'ALLENDE 9 BIS', 1, 'CLN-0249-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:13', NULL),
(392, NULL, 'LOPEZ MARTINEZ CARLOS ALBERTO', 'dulcifiesta_minimas@hotmail.com', '019515710412', 'LOMC801117GS7', '68090', 'OAXACA DE JUAREZ', 'MODULO M LOCAL 19 Y 21 CENTRAL DE ABASTOS', 1, 'CLN-0250-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:13', NULL),
(393, NULL, 'DULCERIA JUCHITAN EL CASTILLO DEL DULCE S.A DE C.V.', 'castillodeldulcesa@hotmail.com', '019717110374', 'DJC980511KA2', '70000', 'JUCHITAN DE ZARAGOZA OAX', 'JUAREZ 25 S/N', 1, 'CLN-0251-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:13', NULL),
(394, NULL, 'PRODUCTOS LIZ MAR S.A. DE C.V.', 'lizmarproductos@gmail.com', '56946451', 'PLM120228D61', '09040', 'CIUDAD DE MEXICO', 'PASILLO A-B  BODEGA 35 CENTRAL DE ABASTOS', 1, 'CLN-0252-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:13', NULL),
(395, NULL, 'FERNANDO MARTINEZ ALAMILLA', 'ase_ret@hotmail.com', '58216212', 'MAAF700530AU3', '52947', 'EDO. DE MEX.', 'CARR. PROGRESO INDUSTRIAL NAVE 25 INT.LOCAL 154', 1, 'CLN-0253-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:13', NULL),
(396, NULL, 'ABARROTERA DE TECUALA S.A. DE C.V.', 'abarrotera_tecuala@yahoo.com.mx', '01 125 25 30999', 'ATE800218AN8', '63440', 'TECUALA NAY.', 'MEXICO SUR 150', 1, 'CLN-0254-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:13', NULL),
(397, NULL, 'LORENA GALARZA YA??EZ', 'distribuidora_laregional@hotmail.com', '58906738', 'GAYL891216G50', '54910', 'TULTITLAN EDO MEX.', 'NAVE 4 BODEGA 4', 1, 'CLN-0255-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(398, NULL, 'OMAR TALONIA VARGAS', '040811fr@prodigy.net.mx', '43249928', 'TAVO750225KZ8', '54400', 'NICOLAS ROMERO EDO MEX.', 'NICOLAS ROMERO 1-A', 1, 'CLN-0256-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(399, NULL, 'DULCERIA AYALA S.A DE C.V.', 'svilla@productosmarcopolo.mx', '6646384265', 'DAY940820KC1', '22000', 'TIJUANA', 'CALLE 2DA # 8025', 1, 'CLN-0257-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(400, NULL, 'FRANCISCO JAVIER MORALES SANCHEZ', 'svilla@productosmarcopolo.mx', '68611030100', 'MOSF8108173U0', '21100', 'MEXICALI B.C.', 'CALLE MEXICO #497', 1, 'CLN-0258-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(401, NULL, 'MAYOREO DE DULCES MEXICANA S.A DE C.V.', 'svilla@productosmarcopolo.mx', '68611030100', 'MDM020409GF3', '21100', 'MEXICALI B.C.', 'AV. ZUAZUA #531', 1, 'CLN-0259-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(402, NULL, 'DISTRIBUIDORA DE DULCES PALACO S. DE RL DE C.V.', 'svilla@productosmarcopolo.mx', '01686 562 7180', 'DDP150124FQ1', '21396', 'MEXICALI B.C.', 'CALLE 4TA # 299', 1, 'CLN-0260-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(403, NULL, 'FRANCISCO JAVIER DIAZ AYALA', 'svilla@productosmarcopolo.mx', '6646859781', 'DIAF68031916A', '22000', 'TIJUANA', '2DA # 8033', 1, 'CLN-0261-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(404, NULL, 'ELIZABETH PROCUNA GUTIERREZ', 'procugeli@hotmail.com', '55422691', 'POGE710625QY1', '15810', 'CIUDAD DE MEXICO', 'ANILLO DE CIRCUNVALACION #40  LOC 148', 1, 'CLN-0262-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(405, NULL, 'JULIO CESAR VARGAS SOTO', 'juliocesar.facturas@hotmail.com', '55229387', 'VASJ8112149H6', '15810', 'CIUDAD DE MEXICO', 'ANILLO DE CIRCUNVALACION #420  LOCAL 2', 1, 'CLN-0263-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(406, NULL, 'FRANCISCO JAVIER BENITEZ ARIAS', 'cataalcantar25@gmail.com', '01327 27 72903', 'BEAF680728V78', '63700', 'COMPOSTOLA. NAY.', 'BRAVO # 69', 1, 'CLN-0264-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(407, NULL, 'AMALIA BARRAGAN AVALOS', 'micasita01cyc@gmail.com', '01322 225 5079', 'BAAA521220L60', '48290', 'PUERTO VALLARTA. JAL.', 'INDEPENDENCIA # 205', 1, 'CLN-0265-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(408, NULL, 'ARAEL S??NCHEZ L??PEZ', 'svilla@productosmarcopolo.mx', '-', 'SALA590226441', '51200', 'VALLE DE BRAVO. EDO. DE MEX.', '16 DE SEPTIEMBRE #401', 1, 'CLN-0266-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(409, NULL, 'SURTIDORA EL VAQUERO, S.A. DE C.V.', 'surtidora.vaquero@gmail.com', '-', 'SVA060519J73', '21387', 'MEXICALI B.C.', 'RIO PARANA #43 INT. D', 1, 'CLN-0267-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(410, NULL, 'RICARDA SARA DE ITA SEVERIANO', 'svilla@productosmarcopolo.mx', '5959251235', 'LASR44020774A', '56100', 'TEXCOCO', 'COLON #17', 1, 'CLN-0268-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(411, NULL, 'ROSARIO NOELIA YA??EZ ARELLANO', 'dulceriaoti2014@hotmail.com', '66502404', 'YAAR680505124', '09040', 'CIUDAD DE MEXICO', 'PASILLO  2 LOC. 25B', 1, 'CLN-0269-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(412, NULL, 'HECTOR VELASQUEZ ROGEL', 'comercial.tauro@hotmail.com', '0122 8817 6272', 'VERH580420722', '91000', 'XALAPA VER.', 'ABASOLO #4', 1, 'CLN-0270-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(413, NULL, 'MARIA DE LA PAZ GEORGINA CARRION CARRILLO', 'bombon59@gmail.com', '2969628037', 'CACP590423QG2', '91681', 'CARDEL VER.', 'REVOLUCION # 11', 1, 'CLN-0271-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(414, NULL, 'JOSE CRUZ GONZALEZ GARCIA', '-', '01 664 2465 472', 'GOGC860811MC7', '22236', 'TIJUANA', 'REAL DE OCOTLAN #7545-60', 1, 'CLN-0272-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:09', '2018-06-08 16:52:14', NULL),
(415, NULL, 'PUBLICIDAD Y PROMOCIONES MAZZ, S. A. DE C. V.', '-', '01 712 12 231 14', 'PPM070108K42', '50454', 'ATLACOMULCO', 'BLVD ISIDRO FABELA SUR NO. 601', 1, 'CLN-0273-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:14', NULL),
(416, NULL, 'ABARROTES FASTI S.A DE C.V.', 'recepcionfe@superfasti.com', '01 228 812 6606', 'AFA901128115', '91000', 'XALAPA VERACRUZ', 'ALCALDE Y GARCIA 11 BIS', 1, 'CLN-0274-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:14', NULL),
(417, NULL, 'PABLO ROBERTO VALDEZ GARCIA', 'sanpablo.facturaciones@gmail.com.mx', '045 247 109 5976', 'VAGP7406293B8', '90590', 'SAN PABLO ZITLALTEPEC. TLAXCALA', 'CALLE 5 NORTE #78 ENTRE CALLE 14 PTE 12 PTE', 1, 'CLN-0275-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:14', NULL),
(418, NULL, 'JAHIR FILIBERTO URIAS SUFFO', 'svilla@productosmarcopolo.mx', '6861620082', 'UISJ810206KL7', '21395', 'B.CALIFORNIA', 'CALZADA ROSA DEL DESIERTO # 4598 L2', 1, 'CLN-0276-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:14', NULL),
(419, NULL, 'ROBERTO RAMIREZ MARTINEZ', 'svilla@productosmarcopolo.mx', '6646340384', 'RAMR591210GM4', '22000', 'TIJUANA', '5 TA  # 8413', 1, 'CLN-0277-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:14', NULL),
(420, NULL, 'ANA ALICIA JIMENEZ GARCIA', 'svilla@productosmarcopolo.mx', '01662 260 7406', 'JIGA570313BEA', '83171', 'SONORA', 'AV. JOSE MARIA MENDOZA S/N LOCAL 1', 1, 'CLN-0278-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(421, NULL, 'YULIANA PONCE CASTILLO', 'mickey_yuliana@hotmail.com', '01489 109 6135', 'POCY811109EPA', '79200', 'SAN LUIS POTOSI', 'BRAVO #4', 1, 'CLN-0279-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(422, NULL, 'LAURA ADRIANA LAGUNA SEVILLA', 'svilla@productosmarcopolo.mx', '045 3312 450707', 'LASL780425ND1', '45602', 'JALISCO', 'BOSQUE DE MAZAMITLA # 106 INT 17', 1, 'CLN-0280-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(423, NULL, 'MIGUEL ANGEL PUENTES REYES', 'mpuente01@hotmail.com', '013847 3378 38', 'PURM760601B75', '45300', 'JALISCO', 'HIDALGO # 22 LETRA A', 1, 'CLN-0281-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(424, NULL, 'GERARDO ADRIAN GARCIA ROMERO', 'facturasdulcelandia@gmail.com', '01784 842 2049', 'GARG540924SR4', '93486', 'VERACRUZ', 'FRANCISCO VILLA # 317', 1, 'CLN-0282-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(425, NULL, 'JORGE ALBERTO VELASCO HERNANDEZ', 'jvelascoh7805@hotmail.com', '899-2167-922', 'VEHJ780113V70', '88730', 'TAMAULIPAS', 'AV. TECNOLOGICO # 305', 1, 'CLN-0283-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(426, NULL, 'LUCIO GENARO GUERRERO INOJOSA', '-', '0149-6851-3274', 'GUHI790502U94', '98839', 'ZACATECAS', 'VICENTE GUERRERO # 500 INT-A', 1, 'CLN-0284-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(427, NULL, 'MARIO ALBERTO MADRID CINCO', 'mario.madrid.5@hotmail.com', '0168-7872-6510', 'MACM7201063Q5', '81000', 'SINALOA', 'DOCTOR.LUIS G. DE LA TORRE # 181-A', 1, 'CLN-0285-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(428, NULL, 'EL CAFETO DE TECAMACHALCO S.A DE C.V.', 'cafetos@outlook.com', '5234-2844', 'CTE880825221', '53950', 'NAUCALPAN', 'AV. DE LAS FUENTES # 184 LOCALES 616 y 617', 1, 'CLN-0286-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(429, NULL, 'JOSE REYNALDO VARO BERRA', 'comprasdulces.sevillana@hotmail.com', '01971-716-2184', 'VABR5501064M3', '70600', 'OAXACA', 'MAZATLAN # 7', 1, 'CLN-0287-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(430, NULL, 'REYNALDO SANCHEZ ALVARADO', 'reysan_2@outlook.com', '01222-246-1242', 'SAAR541002UZ0', '72000', 'PUEBLA', '6 ORIENTE # 16 LOCAL 2', 1, 'CLN-0288-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(431, NULL, 'DISTRIBUIDULCES S.A DE C.V.', 'facturasdistribuidulces@hotmail.com', '01777-321-0697', 'DIS110427RE4', '62570', 'MORELOS', 'AV. HIDALGO # 2', 1, 'CLN-0289-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(432, NULL, 'JAQUELINE SALGADO MORALES', '-', '01653-5341-115', 'SAMJ740324IF3', '83449', 'SONORA', 'AV. JUAREZ Y TERCERA  S/N', 1, 'CLN-0290-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(433, NULL, 'FRUTERIA WELTON S.A. DE C.V.', 'facturascomprasfw@gmail.com', '01653-5340265', 'FWE940228N67', '83440', 'SAN LUIS RIO COLORADO', 'AV. SONORA SN', 1, 'CLN-0291-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(434, NULL, 'MARIA DEL CARMEN MORALES GUTIERREZ', '-', '01686-5540-490', 'MOGC610411TT6', '21100', 'BAJA CALIFORNIA', 'CALLE MEXICO # 393', 1, 'CLN-0292-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(435, NULL, 'JONATHAN MARQUEZ BARRANCO', 'dulceriacepillin@hotmail.com', '01228-204-1740', 'MABJ931113936', '91100', 'VERACRUZ', 'AV. ATENAS VERACRUZANA # 60', 1, 'CLN-0293-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(436, NULL, 'EUNICE ASAREEL NOLASCO CERVANTES', 'nolascoeunice@yahoo.com.mx', '045-951-216-8288', 'NOCE801105LR5', '68090', 'OAXACA', 'PERIFERICO MODULO E LOCAL  MERCADO DE ABASTO N 57', 1, 'CLN-0294-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(437, NULL, 'SANDRA LUZ GARCIA GALEANA', 'sandra86_@hotmail.com', '01742-425-2400', 'GAGS8601296M6', '40900', 'GUERRERO', 'JUAN BERDEJA # 2', 1, 'CLN-0295-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(438, NULL, 'VICENTE FLORES GARCIA', 'berdeja63@hotmail.com', '01745-458-0039', 'FOGV550406DYA', '41800', 'GUERRERO', 'OBREGON #36', 1, 'CLN-0296-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:10', '2018-06-08 16:52:15', NULL),
(439, NULL, 'JUAN CONDE GUZMAN', 'condecorp@gmail.com', '015-9595-2444', 'COGJ750804HR4', '56030', 'EDO. DE MEXICO', 'PORFIRIO DIAZ # 32', 1, 'CLN-0297-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:15', NULL),
(440, NULL, 'EDGAR VAZQUEZ DE LA CRUZ', 'dulci.fiesta@hotmail.com', '0155-5732-2185', 'VACE840817A86', '57940', 'EDO. DE MEXICO', 'VICENTE GUERRERO # 236', 1, 'CLN-0298-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(441, NULL, 'GRUPO BETAVIL S.A DE C.V.', 'compras@lamimi.com.mx', '53761512', 'GBE9902047C6', '53000', 'EDO. DE MEXICO', 'PRIMER ANDADOR #1 ESQ. AV. MORELOS', 1, 'CLN-0299-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(442, NULL, 'RUBEN MENDEZ ORTIZ', 'ruben_caruma@hotmail.com', '01777-230-8104', 'MEOR730419145', '62000', 'MORELOS', 'MERCADO ADOLFO LOPEZ MATEOS LOC. 788 Y 789', 1, 'CLN-0300-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(443, NULL, 'CARMEN FILIO PANIAGUA', 'dulceria-anita@hotmail.com', '01735-301-4318', 'FIPC700716CT9', '62757', 'MORELOS', 'CARRT. MEXICO CUAUTLA  NAVE  C  BODEGA 10', 1, 'CLN-0301-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(444, NULL, 'DULCES MIXTOS DE B.C. S. DE R.L. DE C.V.', '-', '01664-9011-697', 'DMB070511NR1', '22205', 'BAJA CALIFORNIA', 'ARANJUEZ  22749 # 3', 1, 'CLN-0302-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(445, NULL, 'CHRISTIAN GUADALUPE LOPEZ CABRALES', 'chachon.a4@hotmail.com', '016535183524', 'LOCC841212ER8', '83499', 'SONORA', 'CALLE CUARTA # 400 INT-B', 1, 'CLN-0303-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(446, NULL, 'JOSE RAMON LIZARRAGA CORONADO', 'svilla@productosmarcopolo.mx', '-', 'LICR8408226F3', '82700', 'SINALOA', 'AV. PONIENTE 24 S/N', 1, 'CLN-0304-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(447, NULL, 'ORALIA TANAYRY MARTINEZ PALAZUELOS', 'svilla@productosmarcopolo.mx', '-', 'MAPO920609LG4', '80320', 'SINALOA', 'JOSE MARIA MORELOS # 55', 1, 'CLN-0305-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(448, NULL, 'ROSA CARMINA ANGULO AGUILERA', 'svilla@productosmarcopolo.mx', '-', 'AUAR510911M12', '80299', 'SINALOA', 'CUARTA ORIENTE 2721', 1, 'CLN-0306-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(449, NULL, 'JANET GUADALUPE GARCIA NAVARRO', 'svilla@productosmarcopolo.mx', '-', 'GANJ620412DPA', '80000', 'SINALOA', 'BENITO JUAREZ ORIENTE 712', 1, 'CLN-0307-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(450, NULL, 'OLEGARIO FRANCISCO ARELLANO ROMERO', 'cfdaero85@yahoo.com', '01222-399-1559', 'AERO8510034B2', '72480', 'PUEBLA PUEBLA', '11 SUR 10575  LOCAL  A', 1, 'CLN-0308-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(451, NULL, 'MATRE SERVICIOS S DE RL DE CV', '-', '55 28 58 47 96', 'MSE0111085X2', '66358', 'SANTA CATARINA', 'GALAXIAS 701', 1, 'CLN-0309-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(452, NULL, 'ALFREDO MANSUR DEMENEGHI', 'alfredomansur@hotmail.com', '01271-405-7339', 'MADA570825L6A', '94540', 'CORDOBA', 'AVENIDA 3 # 83', 1, 'CLN-0310-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(453, NULL, 'DULCERIAS EL SUPER MERCADO S.A DE C.V.', 'dulcerias_smd@hotmail.com', '01272-725-3527', 'DSM960724E55', '94732', 'RIO BLANCO', 'NICOLAS BRAVO # 52', 1, 'CLN-0311-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(454, NULL, 'FRANCISCO FLORES CELAYA', 'comer_caz2012@hotmail.com', '01784-887-0309', 'FOCF470813MF4', '92980', 'CAZONES DE HERRERA', 'AV. REFORMA   68', 1, 'CLN-0312-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(455, NULL, 'LINDA IBETH VERA PACHECO', 'linda_ibeth_vera_pacheco@hotmail.com', '01765-844-8980', 'VEPL6609069W0', '92730', 'ALAMO TEMAPACHE', 'ALVARO OBREGON ESQ. E CARRANZA # 6', 1, 'CLN-0313-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(456, NULL, 'GRUPO EVLY DE ALAMO S.A DE C.V.', 'dulceriaelglobo_yanely@live.com.mx', '01765-844-8011', 'GEA1005226A1', '92730', 'ALAMO TEMAPACHE', 'AV. INDEPENDENCIA 60', 1, 'CLN-0314-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(457, NULL, 'SUPER DULCERIAS LIZ S DE RL DE C.V.', 'dulceria_liz@hotmail.com', '01311-110-7580', 'SDL090812E90', '63440', 'TECUALA', 'HIDALGO # 73', 1, 'CLN-0315-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(458, NULL, 'BODEGA DE CARAMELOS EL VENADITO S.A DE C.V.', 'moisesmarin2003@yahoo.com.mx', '01767-672-2920', 'BDCA111019UA2', '40660', 'CD. ALTAMIRANO', 'JOSE INOCENTE LUGO PONIENTE 223', 1, 'CLN-0316-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:16', NULL),
(459, NULL, 'MARIA DOLORES GARCIA PARRA', '-', '-', 'GAPD530915A88', '41100', 'IGUALA', 'AV.CONSTITUCION Y MUNICIPIO LIBRE 1602', 1, 'CLN-0317-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:17', NULL),
(460, NULL, 'ZENAIDA BELTRAN RODRIGUEZ', 'cpfernando_mb@hotmail.com', '01733-332-6448', 'BERZ610605P53', '40000', 'IGUALA', 'IGNACIO MANUEL ALTAMIRANO 91 A', 1, 'CLN-0318-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:17', NULL),
(461, NULL, 'SALVADOR MENDEZ RODRIGUEZ', '-', '01777-310-0480', 'MERS571214T71', '62000', 'CUERNAVACA', 'CIRCUITO ADOLFO LOPEZ MATEOS 850 y 851', 1, 'CLN-0319-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:17', NULL),
(462, NULL, 'COMERCIALIZADORA DE SEMILLAS Y CACAHUATES SOL S.A DE C.V.', 'facturas.comercializadora@botanassol.com.mx', '57-31-74-89', 'CSC081216G40', '57000', 'NEZAHUALCOYOTL', 'AV. CHIMALHUACAN # 575', 1, 'CLN-0320-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:11', '2018-06-08 16:52:17', NULL),
(463, NULL, 'YADIRA HERNANDEZ BETANCOURT', 'dbetyv1@hotmail.com', '54-41-91-90', 'HEBY8505123BA', '57710', 'NEZAHUALCOYOTL', 'AV. VICENTE VILLADA # 155', 1, 'CLN-0321-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(464, NULL, 'ANA PATRICIA AGUILAR MU??OZ', 'dulceriamimi@Hotmail.com', '045-231-319-1619', 'AUMA8208266IA', '73800', 'TEZIUTLAN', '16 DE SEPTIEMBRE # 303', 1, 'CLN-0322-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(465, NULL, 'ALFREDO HERNANDEZ MENDOZA', 'dulceriateziutlan@hotmail.com', '01231-313-1387', 'HEMA761026F82', '73800', 'TEZIUTLAN', 'CUAUHTEMOC # 401 INT. 2', 1, 'CLN-0323-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(466, NULL, 'SUPER DULCERIA LA REYNA DE ABASTOS S.A DE C.V.', 'lareynadeabastos@prodigy.nt.com', '0133-3671-3653', 'SDR980605CH6', '44530', 'GUADALAJARA', 'CALLE 1  BODEGAS  117  Y  119', 1, 'CLN-0324-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(467, NULL, 'ARNULFO JIMENEZ GAMBOA', 'facturasdidu@gmail.com', '01222-130-9681', 'JIGA350605IB8', '72000', 'PUEBLA', '4 PONIENTE # 1702', 1, 'CLN-0325-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(468, NULL, 'LA INDUSTRIAL DEL GOLFO DE VERACRUZ S.A DE C.V.', 'ana.garcia@dulcerialajosefina', '0122-9932-4291', 'IGV8708159I6', '91700', 'VERACRUZ', 'HIDALGO 916', 1, 'CLN-0326-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(469, NULL, 'GEORGINA ELIZABETH IRABIEN PACHECO', 'ginaeli27@hotmail.com', '01744-587-6219', 'IAPG660702P71', '39350', 'ACAPULCO DE JUAREZ', 'IGNACIO VALLARTA 15 D', 1, 'CLN-0327-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(470, NULL, 'ANNEL GWENDOLYN VILLALOBOS ORTEGA', '-', '-', 'VIOA930904PR4', '22207', 'BAJA CALIFORNIA', 'LA PURISIMA # 19908', 1, 'CLN-0328-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(471, NULL, 'ESPINOZA ROJAS ANTONIO', 'ramtonio01@gmail.com', '01664-683-2287', 'EIRA900112A50', '22530', 'BAJA CALIFORNIA', 'AV.INDEPENDENCIA #4500-2', 1, 'CLN-0329-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(472, NULL, 'RODRIGUEZ RICO JULIO AARON', '-', '01661-612-0583', 'RORJ8007016W0', '22700', 'PLAYAS DE ROSARITO', 'BLVD.BENITO JUAREZ #984 LOCAL 12', 1, 'CLN-0330-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(473, NULL, 'GODINEZ RAMIREZ MARIA DE LA LUZ', 'jfa.porras@hotmail.com', '54212453', 'GORL500524C10', '04600', 'CIUDAD DE MEXICO', 'SAN CARLOS # 104', 1, 'CLN-0331-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(474, NULL, 'DULCERIA SAN ANTONIO DE CHILPANCINGO S.A DE C.V.', 'dulceriasanantonio@live.com.mx', '01747-472-3758', 'DSA0108164N0', '39000', 'CHILPANCINGO DE LOS BRAVOS', 'ZARAGOZA # 21', 1, 'CLN-0332-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(475, NULL, 'NAVARRETE RENTERIA EDUARDO EDRAS', 'eduardoedras@gmail.com', '01757-476-7846', 'NARE710929CC2', '41304', 'TLAPA DE COMONFORT', 'JOSE MARIA MORELOS # 126', 1, 'CLN-0333-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(476, NULL, 'MIRIAM LIZBETH VALENCIA RODRIGUEZ', 'ulimart83@gmail.com', '5890-4701', 'VARM950712C51', '54900', 'TULTITLAN DE MARIANO ESCOBEDO', 'AVENIDA MEXIQUENSE MODULO A # 7', 1, 'CLN-0334-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(477, NULL, 'RIVERA BASURTO MARTIN', 'dulceriasmary@outlook.com', '2620-2536', 'RIBM890604757', '54800', 'CUAUTITLAN', 'FILIBERTO GOMEZ # 3', 1, 'CLN-0335-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:17', NULL),
(478, NULL, 'JOSE DANIEL NAVARRO CAMACHO', '-', '045-673-7322-731', 'NACD680801LV1', '81460', 'GUAMUCHIL', 'DR. GENARO SALAZAR NTE 55', 1, 'CLN-0336-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(479, NULL, 'FRANCISCO VARGAS SAAVEDRA', 'dulceriaimperial@hotmail.com', '0166-7721-5409', 'VASF570616II4', '80150', 'CULIACAN', 'CALZADA AEROPUERTO # 4989', 1, 'CLN-0337-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(480, NULL, 'TORRES BENAVIDES RAFAEL', 'dulceriart@outlook.com', '5008-4724', 'TOBR670301L79', '54400', 'VILLA NICOLAS ROMERO', '20 DE NOVIEMBRE # 3 LOCAL 1A', 1, 'CLN-0338-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(481, NULL, 'SALAZAR PADILLA ITZEL  MARGARITA', 'imsp_magi@hotmail.com', '01781-45-20086', 'SAPI92081621A', '40980', 'COYUCA DE BENITEZ', 'ZACARIAS ZU??IGA', 1, 'CLN-0339-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(482, NULL, 'ALDO VALDIVIA GONZALEZ', 'manuel_hdz70@hotmail.com', '0127-3734-2397', 'VAGX710928QN7', '94100', 'HUATUSCO VERACRUZ', 'AV. 1 PONIENTE 428', 1, 'CLN-0340-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(483, NULL, 'FLORES NAVARRO J.JESUS', 'dulceria-reyna@hotmail.com', '5618-3361', 'FONJ490819HA4', '04600', 'CIUDAD DE MEXICO', 'AV. SANTA URSULA MANZANA 935 LOTE 13', 1, 'CLN-0341-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(484, NULL, 'ABARROTERA HIDALGO DE TEHUACAN S.A DE C.V.', '-', '-', 'AHT020517123', '75784', 'PUEBLA', '5 ORIENTE 1500', 1, 'CLN-0342-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(485, NULL, 'SANTOS AQUILEO CHALE CAN', 'santoschale@hotmail.com', '-', 'CACS6305126U3', '07710', 'MEXICO, D.F.', 'MAR 150 EDIF 4  DEPTO 16', 1, 'CLN-0343-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(486, NULL, 'OLIVIA ROJAS RAMIREZ', 'centraldedulces@gmail.com', '01238-383-1852', 'RORO7011051U3', '75701', 'TEHUACAN', '3 SUR # 302 B', 1, 'CLN-0344-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(487, NULL, 'LILIANA GOVANTES TADEO', 'lopsanliliana@hotmail.com', '5386-6672', 'GOTL7506257F8', '02009', 'CIUDAD DE MEXICO', 'ESPERANZA 2A LOCAL B2', 1, 'CLN-0345-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(488, NULL, 'JOSE HERIBERTO OCTAVIANO DAMIAN DAMIAN', 'jeddax_25@hotmail.com', '01227-276-3263', 'DADH590316FC1', '74160', 'HUEJOTZINGO', 'SOLEDAD 295', 1, 'CLN-0346-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(489, NULL, 'SANCHEZ BONILLA MARTHA DELIA', 'dulcessanjorge@yahoo.com.mx', '01222-271-0262', 'SABM660926286', '72980', 'AMOZOC', 'CALLE 4 SUR # 308', 1, 'CLN-0347-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(490, NULL, 'ANTONIO HERNANDEZ LUNA', 'antonio_lunahdez@hotmail.com', '01797-101-6701', 'HELA670724TW2', '73310', 'ZACATLAN', 'INDEPENDENCIA # 15', 1, 'CLN-0348-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(491, NULL, 'ANTONIA IZAGUIRRE', '-', '01687-872-8138', 'IAAN560207RK6', '81020', 'GUAZAVE', 'AV. ADOLFO LOPEZ MATEOS # 164', 1, 'CLN-0349-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:12', '2018-06-08 16:52:18', NULL),
(492, NULL, 'GOLOSINAS LUPITA S.A DE C.V.', 'herreradiaz70@hotmail.com', '0123-1106-4535', 'GLU080317VA7', '73800', 'TEZIUTLAN', 'LERDO # 166', 1, 'CLN-0350-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:18', NULL),
(493, NULL, 'PLASTICOS Y RESINAS DEL NOROESTE S.A DE C.V.', 'svictoria@plasticosyresinas.com.mx', '01668-816-3434', 'PRN790901IP9', '81200', 'LOS MOCHIS', 'IGNACIO ALLENDE SUR  S/N', 1, 'CLN-0351-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:18', NULL),
(494, NULL, 'CABRERA CANO MARIA DEL SAGRARIO EMA', 'dulceriaemy_57@yahoo.com.mx', '01744-189-0648', 'CACS570204K55', '39350', 'ACAPULCO DE JUAREZ', 'VALLARTA # 9', 1, 'CLN-0352-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:18', NULL),
(495, NULL, 'TLALMIS NAVA ADRIAN', 'adriantlalmis@hotmail.com', '017848-4211-03', 'TANA590708FK5', '93400', 'PAPANTLA VER.', 'AQUILES SERDAN # 417', 1, 'CLN-0353-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:18', NULL),
(496, NULL, 'OPERADORA PASION TORERA, S. A. DE C. V.', '-', '17221800302', 'OPT131111CC3', '50160', 'TOLUCA DE LERDO', 'AV. PASEO TOLLOCAN NO. 1210', 1, 'CLN-0354-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:18', NULL),
(497, NULL, 'MERCADOS ZAZUETA S.A DE C.V.', 'zazuetacomercial@hotmail.com', '01662-215-8494', 'MZA810422IB2', '83000', 'HERMOSILLO', 'MATAMOROS #24 NORTE', 1, 'CLN-0355-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:18', NULL),
(498, NULL, 'ALEJANDRO OSUNA MEDINA', '-', '01662-221-75508', 'OUMA7208033S9', '83000', 'HERMOSILLO', 'MORELIA # 30', 1, 'CLN-0356-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:18', NULL),
(499, NULL, 'RAMONA AISPURO RUIZ', '-', '01662-141-6630', 'AIRR410228DD3', '83140', 'HERMOSILLO', 'GENERAL PI??A # 241', 1, 'CLN-0357-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:18', NULL),
(500, NULL, 'ERIKA JUDITH SERRANO CALDERON', '-', '01662-1999-482', 'SECE880120QX4', '83117', 'HERMOSILLO', 'CIRCUITO DEL ALAMO #65', 1, 'CLN-0358-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(501, NULL, 'CARLOS FRANCISCO IBARRA CASAS', '-', '01662-215-8615', 'IACC710121791', '83140', 'HERMOSILLO', 'BOULEVARD MORELOS #231-2', 1, 'CLN-0359-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(502, NULL, 'ZAZUETA COMERCIAL HERMOSILLO S.A DE C.V.', '-', '01662-264-3239', 'ZCH060626645', '83116', 'HERMOSILLO', 'BOULEVARD SOLIDARIDAD #784 ESQ. CALLE OSCURA', 1, 'CLN-0360-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(503, NULL, 'MARIO DIAZ HERNANDEZ', 'compras.diher@outlook.com;admon.diher@outlook.com', '01276-473-1273', 'DIHM940328M62', '73780', 'PUEBLA', 'COLON # 600', 1, 'CLN-0361-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(504, NULL, 'GRISEIDA LIZBET CAMACHO LEAL', 'griseidacamacho@gmail.com', '01669-983-4314', 'CALG8109135J9', '82180', 'MAZATLAN', '13 DE ABRIL # 902', 1, 'CLN-0362-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(505, NULL, 'LAURA ENRIQUETA GUERRERO CURIEL', 'icurielgro@hotmail.com', '01311-217-2048', 'GUCL770903BX2', '63000', 'TEPIC', 'IGNACIO ZARAGOZA # 38', 1, 'CLN-0363-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(506, NULL, 'JOSE GUADALUPE FUENTES GONZALEZ', 'josefuentes.laperla0313@hotmail.com', '01993-1310464', 'FUGG6702059KA', '86000', 'VILLAHERMOSA', 'PEDRO FUENTES # 228', 1, 'CLN-0364-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(507, NULL, 'KARINA DEL CARMEN JIMENEZ DE LA CRUZ', '-', '01993-309-3073', 'JICK820714BD7', '86281', 'VILLAHERMOSA', '9 SUR MANZANA 23 LOTE 22', 1, 'CLN-0365-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(508, NULL, 'KLOVER CENTRO DULCERO S.A DE C.V.', 'facturas@dulceriaseltrebol.com', '01228-812-3123', 'KCD120725S77', '91000', 'XALAPA', 'CONSTITUCION # 36', 1, 'CLN-0366-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(509, NULL, 'RAQUEL ROMERO BOJORQUEZ', '-', '01662-176-5411', 'ROBR740304918', '83170', 'HERMOSILLO', 'SOLIDARIDAD # 619 ESQ.MAZATAN', 1, 'CLN-0367-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(510, NULL, 'GEOVANNY ESAUD LOPEZ GUZMAN', 'dulceria.la.paz@gmail.com', '01757-476-1475', 'LOGG770201450', '41300', 'TLAPA DE COMONFORT', 'HEROICO COLEGIO MILITAR # 219', 1, 'CLN-0368-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(511, NULL, 'EDGARDO HERNANDEZ MORALES', 'superbombon_facturas@hotmail.com', '01276-473-1089', 'HEME8505148T5', '73780', 'PUEBLA', '16 DE SEPTIEMBRE # 966 C', 1, 'CLN-0369-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(512, NULL, 'DIAZ CASTILLO EDITH', 'dulceriaandy@gmail.com', '5830-3636', 'DICE740513RLA', '55270', 'ECATEPEC DE MORELOS', 'FRANCISCO JAVIER GONZALEZ MZ-37 LOT-37', 1, 'CLN-0370-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(513, NULL, 'LA FUENTE DE LAS NUECES FINAS S.A DE C.V.', 'comprasb74@gmail.com', '5640-5958', 'FNF050207V62', '09040', 'CIUDAD DE MEXICO', 'PASILLO 2 Y 3 BODEGA B74', 1, 'CLN-0371-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(514, NULL, 'RAQUEL GUADALUPE VELAZCO VAZQUEZ', 'juan-1960@hotmail.com', '01282-825-2607', 'VEVR600225JZ0', '91270', 'PEROTE', '16 DE SEPTIEMBRE 17 Y 18', 1, 'CLN-0372-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(515, NULL, 'LIDIA VANESSA MARTINEZ GONZALEZ', '-', '01922-2641-188', 'MAGL891101IK9', '96340', 'COSOLEACAQUE', 'VICENTE GUERRERO # 19 A', 1, 'CLN-0373-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:13', '2018-06-08 16:52:19', NULL),
(516, NULL, 'CORTES SANTIZ JULIO CESAR', '-', '-', 'COSJ680701969', '96757', 'MINATITLAN', 'AZUETA # 1', 1, 'CLN-0374-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:19', NULL),
(517, NULL, 'ROSARIO ARANGO DANIEL', '-', '-', 'ROAD710903J37', '96757', 'MINATITLAN', 'V.CARRANZA # 14', 1, 'CLN-0375-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:19', NULL),
(518, NULL, 'JOSE ARTURO GRANADOS FRIAS', 'artgran57@gmail.com', '55-3333-7509', 'GAFA571209FL0', '09820', 'CIUDAD DE MEXICO', '2A PRIVADA DESVIACION ERMITA IZTAPALAPA', 1, 'CLN-0376-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:19', NULL),
(519, NULL, 'SURVI SCJ S.A DE C.V.', 'herreradiaz70@hotmail.com', '0122-2271-1776', 'SSC030609485', '072980', 'PUEBLA', '3 PONIENTE # 105', 1, 'CLN-0377-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:19', NULL),
(520, NULL, 'DULCELANDIA DE TKT  S DE R.L DE C.V.', '-', '01665-654-2677', 'DTK101118V84', '21400', 'TECATE', 'AV. HIDALGO # 170', 1, 'CLN-0378-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:19', NULL),
(521, NULL, 'DULCELANDIA UN MUNDO DE DULCES S DE R.L DE C.V.', 'dulcelandiatkt@hotmail.com', '01665-654-2677', 'DUM160303NBA', '21400', 'TECATE', 'AV. HIDALGO # 170', 1, 'CLN-0378-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:19', NULL),
(522, NULL, 'ARCOIRIS CONFIGRUP S.A. DE C.V.', 'jm.oropeza@hotmail.com', '58 72 73 08', 'ACO1302274J6', '54800', 'CUAUTITLAN', 'FERRONALES  466 SIN NUMERO', 1, 'cln-0379-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(523, NULL, 'HOLLAND BAKERY GROUP, S. A. DE C. V.', '-', '43835407', 'HBG131211M82', '06140', 'MEXICO, D. F.', 'CADEREYTA 173', 1, 'CLN-0380-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(524, NULL, 'MARGARITA VELARDE RAMIREZ', '-', '01669-176-8746', 'VERM920729IC0', '82120', 'MAZATLAN', 'MERCADO MIGUEL HIDALGO- INTERIOR LOCAL D-10', 1, 'CLN-0381-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(525, NULL, 'PEREDA ALVARADO MARIA OLGA', '-', '01686-8382-790', 'PEAO771010H75', '21323', 'MEXICALI', 'HEROICO COLEGIO MILITAR # 1263', 1, 'CLN-0382-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(526, NULL, 'DULCERIAS CONFITA2 S.A DE C.V.', '-', '0166-4626-0966', 'DCD131206PE8', '22185', 'TIJUANA', 'SANCHEZ TABOADA # 9179', 1, 'CLN-0383-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(527, NULL, 'CATALAN ROJAS ABRAHAM', '-', '01686-5613-144', 'CARA810716850', '21100', 'MEXICALI', 'BLVD. LAZARO CARDENAS # 2626', 1, 'CLN-0384-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(528, NULL, 'TORRES MARTINEZ DAVID GERARDO', 'guadalupana297@outlook.com', '57344915', 'TOMD661229IU8', '57000', 'NEZAHUALCOYOTL', 'MERCADO MARIANO MATAMOROS LOC-297 ENTRE CALLE AMANECER RANCHERO Y CIELITO LINDO', 1, 'CLN-0385-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(529, NULL, 'COMERCIAL SUPER ALIANZA, S.A. DE C.V.', 'alianza.facturaelectronica@bodegasalianza.com.mx', '5804 2436', 'CSA981230A79', '03400', 'CIUDAD DE MEXICO', 'SORIA # 149 LOC C.', 1, 'CLN-0386-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(530, NULL, 'COMERCIALIZADORA DE VINOS ALIANZA, S.A. DE C.V.', 'alianza.facturaelectronica@bodegasalianza.com.mx', '5804 2436', 'CVA991118C63', '42080', 'PACHUCA DE SOTO', 'AV. BOULEVARD VALLE DE SAN JAVIER # 101-A LOCAL 1', 1, 'CLN-0387-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(531, NULL, 'LEON VALDEZ HOMERO ELEAZAR', 'leonmaximonomano@hotmail.com', '5563-8953', 'LEVH610406EL9', '01460', 'CIUDAD DE MEXICO', 'MERCADO MIXCOAC LOC-101 ENTRE TIZIANO Y MOLINOS', 1, 'CLN-0388-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(532, NULL, 'ROSA MERCEDES LOPEZ MENESES', 'especias.laaveja@gmail.com', '-', 'LOMR660924GJ1', '22654', 'TIJUANA', 'BOULEVAR SANTA FE # 6127-2', 1, 'CLN-0389-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(533, NULL, 'ANTONIO IZQUIERDO CARRILLO', '-', '914-337-0549', 'IUCA630215R67', '86200', 'JALPA DE MENDEZ', 'CARLOS A MADRAZO # 2', 1, 'CLN-0390-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(534, NULL, 'ISRAEL FLORES MONTERROSAS', 'herreradiaz70@hotmail.com', '01223-1020-621', 'FOMI751021U50', '75200', 'TEPEACA', 'FRANCISCO I. MADERO # 106', 1, 'CLN-0391-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(535, NULL, 'OPERADORA AERO-BOUTIQUES S.A. DE C.V.', 'luis.tova@areasmail.com', '5153 2100', 'OAB990614CE1', '15520', 'CIUDAD DE MEXICO', 'AVENIDA CAPITAN CARLOS LEON S/N EDIFICIO C PISO 2', 1, 'CLN-0392-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(536, NULL, 'AEROCOMIDAS, S.A. DE C.V.', 'luis.tova@areasmail.com', '5153 2100', 'AER990218E83', '15620', 'CIUDAD DE MEXICO', 'CAPITAN CARLOS LEON SIN /NUM. EDIFICIO C PISO 2', 1, 'CLN-0392-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(537, NULL, 'MONSERRAT LOPEZ TRUJILLO', 'globosyfiestasmiguel@gmail.com', '01951-5148-955 E117', 'LOTM800224UA7', '11550', 'C.D. MEXICO', 'TENNYSON # 90 INT.101', 1, 'CLN-0393-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(538, NULL, 'SEVERIANO CUEVAS REYES', 'severianocu05@yahoo.com.mx', '01951-5164-704', 'CURS670221TD8', '68090', 'OAXACA', 'MODULO R LOCAL-9 ANDADOR-7 CENTRAL DE ABASTOS', 1, 'CLN-0394-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(539, NULL, 'TIENDAS FERPA, S. A. DE C. V.', '-', '01 7121204599', 'TFE1106171LA', '50454', 'ATLACOMULCO', 'BOULEVARD ISIDRO FABELA SUR 600', 1, 'CLN-0395-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(540, NULL, 'DUFRY YUCATAN, S.A. DE C.V.', 'paula.carvallo@mx.dufry.com', '5036 09 00', 'DYU9711175Y6', '15520', 'CIUDAD DE MEXICO', 'AV. CAPITAN CARLOS LEON S/N 2 NIVEL EDIF B OFICINA 11', 1, 'CLN-0396-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:14', '2018-06-08 16:52:20', NULL),
(541, NULL, 'PRODUCTOS MIXTOS PROMIX MEXICO S.A DE C.V.', 'armando.gordon@promixmexico.com.mx', '55123097', 'PMP140513QWA', '06050', 'C.D MX', 'AV. JUAREZ #32 INT 214', 1, 'CLN-0397-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:20', NULL),
(542, NULL, 'ALBERTINA CARMELITA CERVANTES GARCIA', 'carmen.cervantes12@yahoo.com', '01951-514-0644', 'CEGA570807PYA', '68090', 'OAXACA', 'PROLONGACION NU??O DEL MERCADO MODULO S LOC 24', 1, 'CLN-0398-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:20', NULL),
(543, NULL, 'ALEJANDRA VIANEI LOPEZ RIVERA', '-', '-', 'LORA901024SJ1', '83499', 'SAN LUIS RIO COLORADO', 'CALLEJON NAYARIT 2508 ESQ. CALLE 26', 1, 'CLN-0399-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:20', NULL),
(544, NULL, 'GOMEZ VASQUEZ MA. DEL CARMEN', 'elsoldesantafe_compras@hotmail.com', '0133-3336-4419', 'GOVC700530CB9', '44700', 'GUADALAJARA', 'SANTA FE #2849', 1, 'CLN-0400-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:20', NULL),
(545, NULL, 'SEBASTIAN ARMENTA CASTRO', 'fborunda@hotmail.es', '01668-8125-140', 'CAAS030415832', '81240', 'LOS MOCHIS', 'BLVD. RIO FUERTE #612 NTE', 1, 'CLN-0401-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:20', NULL),
(546, NULL, 'IVETH AYME ZAVALA TAPIA', 'jpsilva.ventastijuana@gmail.com', '-', 'ZATI720619FL1', '21100', 'MEXICALI', 'ALDAMA # 528', 1, 'CLN-0402-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:20', NULL),
(547, NULL, 'JOSE GUADALUPE CHAVEZ NAVARRO', 'jpsilva.ventastijuana@gmail.com', '-', 'CANG911201JV2', '21100', 'MEXICALI', 'IGNACIO ALDAMA # 538', 1, 'CLN-0403-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(548, NULL, 'I CANDY ROMA S.A DE C.V.', 'icandyluu@gmail.com', '5520534841', 'ICR140610Q55', '57740', 'EDO. MEX.', 'AV. ADOLFO LOPEZ MATEOS # 183 LOCAL 2', 1, 'CLN-0404-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(549, NULL, 'MARIA DE JESUS BOJORQUEZ', 'dulcerialaflor@hotmail.com', '01668-176-3438', 'BOJE6101112S2', '81200', 'LOS MOCHIS', 'ZARAGOZA SUR 580 L-6', 1, 'CLN-0405-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(550, NULL, 'PROMOTORA MUSICAL S.A. DE C.V.', '-', '26295400  EXT. 1256', 'PMU940317114', '11529', 'CIUDAD DE MEXICO', 'LAGO ZURICH # 245 EDIFICIO PRESA FALCON PISO 7', 1, 'CLN-0406-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(551, NULL, 'OLEGARIO ORONIA', 'olegaoronia@hotmail.com', '01686-554-2107', 'OOOL4903082N0', '21100', 'MEXICALI', 'ALDAMA # 534 1RA SECCION', 1, 'CLN-0407-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(552, NULL, 'DUVECA S DE R.L DE C.V.', 'dulfifacturaelectronica@hotmail.com', '01664-231-7406 AL 09', 'DUV9403114Z7', '22444', 'TIJUANA', 'EXPORTADORES # 19303', 1, 'CLN-0408-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(553, NULL, 'EMBOTELLADORA GARMA S.A DE C.V.', 'benjamin.vega@hotmail.com', '7090-3588', 'EGA121108SD3', '54769', 'CUAUTITLAN IZCALLI', 'VICENTE SUAREZ # 47', 1, 'CLN-0409-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(554, NULL, 'CENTRAL CONFITERA S.A DE C.V.', 'facturas@surtidoendulces.com', '5600-7337', 'CCO130909V73', '03530', 'CIUDAD DE MEXICO', 'LUIS G. INCLAN # 2811 INT-1', 1, 'CLN-0410-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(555, NULL, 'OROL OPERADORA COMERCIALIZADORA Y DISTRIBUIDORA S.A DE C.V.', 'orolmexico@yahoo.com.mx', '55-16-65-60-72', 'OOC050816R33', '52946', 'ATIZAPAN DE ZARAGOZA', 'CALLE 1A CERRADA DE BRISAS #127 A', 1, 'CLN-0411-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL);
INSERT INTO `clients` (`id`, `branch_id`, `name`, `email`, `telephone`, `rfc`, `cp`, `city`, `address`, `status`, `code`, `P`, `shops`, `sku`, `D2`, `CE`, `TP`, `average`, `TE`, `appointment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(556, NULL, 'COMERCIALIZADORA DE PRODUCTOS PC, S.A. DE C.V.', 'gabriela.jeronimo@officemax.com.mx', '9177 2800', 'CPP150520NG3', '05348', 'CIUDAD DE MEXICO', 'PROLONGACION REFORMA # 1235', 1, 'CLN-0412-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(557, NULL, 'HIR EXPO INTERNACIONAL, S.A. DE C.V.', '-', '9000 9000  EXT. 9709', 'HEI050128535', '03810', 'CIUDAD DE MEXICO', 'FILADELFIA S/N PISO 1', 1, 'CLN-0413-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(558, NULL, 'ZUGARAZO GONZALEZ LUCILA', 'izugarazo@yahoo.com.mx', '5613-4724', 'ZUGL5404301AA', '09830', 'CIUDAD DE MEXICO', 'AV. DEL ROSAL LOTE 1 MZ 16', 1, 'CLN-0414-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(559, NULL, 'GLORIA GARIBAY GARDU??O', 'garibay-g2@hotmail.com', '5590-6940', 'GAGG830414NUA', '54030', 'TLALNEPANTLA', 'CUAUHTEMOC # 219', 1, 'CLN-0415-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(560, NULL, 'SUPER RIVERA S.A DE C.V.', 'pagosrivera@hotmail.com', '01241-4180083', 'SRI090825JQ6', '90300', 'APIZACO', 'HIDALGO SUR  2303 S/N', 1, 'CLN-0416-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(561, NULL, 'DULCERIA MIRAMONTES DE GUAYMAS S.A DE C.V.', 'alan.valenzuelav@gmail.com', '016222220503', 'DMG761231KQ7', '85400', 'GUAYMAS', 'YA??EZ # 78', 1, 'CLN-0417-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(562, NULL, 'EL PALACIO DEL DULCE S.A DE C.V.', 'elpalaciodeldulcepagos@hotmail.com', '01644-413-0114', 'PDU851024QQ3', '85140', 'CD. OBREGON', 'JESUS GARCIA Y YUCATAN # 824', 1, 'CLN-0418-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(563, NULL, 'EDUARDO GOMEZ LEON', 'dulceriacentral@prodigy.net.mx', '-', 'GOLE6510134Q4', '85800', 'NAVOJOA', 'ALLENDE # 207', 1, 'CLN-0419-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(564, NULL, 'CIA COMERCIAL CIMACO, S.A. DE C.V.', 'daniela.vega@cimaco.com.mx', '01 871 747 2292', 'CCI8111293TA', '27000', 'TORREON', 'AV. HIDALGO PTE 399', 1, 'CLN-0420-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(565, NULL, 'DULCERIA EVELINOVA S.A DE C.V.', 'evelinova_facturas@hotmail.com', '5565-2948', 'DEV0704249F2', '54030', 'TLALNEPANTLA', 'EMILIANO CARRANZA # 62 LOC. C', 1, 'CLN-0421-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(566, NULL, 'ALEJANDRA ZAYURIK RODRIGUEZ ROMERO', 'alezayu25@hotmail.com', '5973-0834', 'RORA8909158F4', '56600', 'CHALCO', 'EMILIANO ZAPATA # 2', 1, 'CLN-0422-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:15', '2018-06-08 16:52:21', NULL),
(567, NULL, 'LOPEZ RIVERA EDER ALFONSO', '-', '01686-5433-453', 'LORE920721L57', '83449', 'SAN LUIS RIO COLORADO', 'CALLE QUINTA  S/N', 1, 'CLN-0423-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:21', NULL),
(568, NULL, 'COMERCIAL ZAZUETA  S.A DE C.V.', 'zazuetacomercial@hotmail.com', '-', 'CZA870226NG1', '83000', 'HERMOSILLO', 'GUERRERO # 84', 1, 'CLN-0424-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(569, NULL, 'JUAN MARIO SANCHEZ ALVARADO', 'xml@grupoevolutions.com.mx', '57415224', 'SAAJ690624ND9', '08500', 'CIUDAD D EMEXICO', 'ORIENTE 237 # 231-B', 1, 'CLN-0425-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(570, NULL, 'KEVIN OLIVER JIMENEZ DOMINGUEZ', 'berdeja63@hotmail.com', '045-744-1659-904', 'JIDK9112095W3', '39390', 'ACAPULCO', 'AV. RANCHO GRANDE # 160', 1, 'CLN-0426-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(571, NULL, 'ANSELMO RAMOS ARAUJO', 'anselmoramos@gmail.com', '01667-716-8787', 'RAAA530421S97', '80000', 'CULIACAN', 'GRANADOS LOCAL # 90', 1, 'CLN-0427-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(572, NULL, 'ABASTECEDORA MONTERO GONZALEZ S DE R.L.', 'abmonterog@outlook.com', '01237-3811-405', 'AMG1405074Y4', '75680', 'TLACOTEPEC', 'AVE. MEXICO NUM.9', 1, 'CLN-0428-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(573, NULL, 'STATUS SYE S. A. DE C. V.', '-', '53586835', 'SSY110414EA6', '53140', 'NAUCALPAN DE JUAREZ', 'COLINA DE HERNAN NO. 28', 1, 'CLN-0429-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(574, NULL, 'COMERCIALIZADORA SANTA FE RIO GRANDE S.A DE C.V.', 'santafefacturas06@gmail.com', '0149-8982-2150', 'CSF060906EK7', '98400', 'RIO GRANDE', 'CARRETRA TORREON KM.61.5 S/N', 1, 'CLN-0430-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(575, NULL, 'I??IGUEZ MIRANDA ALVARO', 'bernardoim1977@hotmail.com', '045-645-33-10095', 'IIMA630821RA9', '84620', 'CANANEA', 'CALLE 7 # 108 ENTRE CALLE JUAREZ Y SONORA', 1, 'CLN-0431-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(576, NULL, 'ERICK VAZQUEZ SUAREZ', 'dulceria_suarez@hotmail.com', '01764-764-1434', 'VASE8808149G6', '73080', 'XICOTEPEC DE JUAREZ', 'REFORMA # 7', 1, 'CLN-0432-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(577, NULL, 'MONSERRAT MONTERO DELGADO', 'beehappygalletas@live.com.mx', '-', 'MODM900830LM3', '44360', 'GUADALAJARA', 'ALVARO OBREGON # 605', 1, 'CLN-0433-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(578, NULL, 'GRUPO PARA ALCOHOLICOS Y DROGADICTOS PRIMER PASO AC', 'julio.jcmi81@gmail.com', '045-644-198-0043', 'GAD140710LA5', '85197', 'CD. OBREGON', 'PLAN DE IGUALA # 507', 1, 'CLN-0434-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(579, NULL, 'JULIO CESAR LORENZO JUAREZ', 'juliolorenzo75@hotmail.com', '045-644-198-0043', 'LOJJ950414M49', '34170', 'DURANGO', 'BLVD.DOMINGO ARRIETA', 1, 'CLN-0435-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(580, NULL, 'LA FIESTA Y GLOBOS DE TODOS S.A DE C.V', 'cp.patyland@hotmail.com', '01222-215-6965', 'FGT160828HF0', '72410', 'PUEBLA', 'CIRCUITO JUAN PABLO II # 2134', 1, 'CLN-0436-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(581, NULL, 'ROCIO ISABEL BARRETO VALDEPE??A', 'canario_cuautla@hotmail.com', '01777.1003-191', 'BAVR710316HV5', '62744', 'CUAUTLA', 'FRANCISCO I MADERO # 164', 1, 'CLN-0437-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(582, NULL, 'ALBERT HANAN CREDIT', '-', '5590 9455', 'HACA820312E54', '52760', 'ESTADO DE MEXICO', 'BOULEVARD INTERLOMAS # 5 iNT. lOCAL K 1', 1, 'CLN-0438-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(583, NULL, 'CORTITA Y AL PIE, S.A. DE C.V.', 'contacto.rafaella@gmail.com', '672 55569', 'CPI150120KJ0', '04100', 'CIUDAD DE MEXICO', 'AVENIDA DIVISION DEL NORTE # 2515 C', 1, 'CLN-0439-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(584, NULL, 'PABLO BOJORQUEZ PARRA', 'ddsinaloa2002@hotmail.com', '-', 'BOPP700817434', '80180', 'CULIACAN', 'HERIBERTO JARA # 3472', 1, 'CLN-0440-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(585, NULL, 'OSUNA DULCERIAS S.A DE C.V.', 'osunadulcerias@gmail.com', '016886885550', 'ODU020213UDA', '81200', 'LOS MOCHIS', 'IGNACIO ALLENDE # 269 SUR', 1, 'CLN-0441-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(586, NULL, 'INGREDION MEXICO S.A DE C.V.', '-', '-', 'CPI950901F3A', '44900', 'GUADALAJARA', 'PARAISO # 1944', 1, 'CLN-0442-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(587, NULL, 'MARIA LUISA SALDIVAR CEDILLO', '-', '4833312', 'SACL5706212X3', '30350', 'ACAPULCO', 'INTERIOR MERCADO CENTRAL S/N LOCAL 159', 1, 'CLN-0443-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(588, NULL, 'DISTRIBUIDORA DE ALIMENTOS SAN VICENTE S.A DE C.V.', 'pcamposm@hotmail.com', '54297910', 'IAD060918SF6', '09500', 'CIUDAD DE MEXICO', 'ERMITA IZTAPALAPA 4028', 1, 'CLN-0444-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(589, NULL, 'DISTRIBUIDORA WELTON S.A DE C.V.', 'fruteriawelton@yahoo.com.mx;facturascomprasfw@gmail.com;facturascomprasdw@gmail.com', '01686-552-2382', 'DWE010212HN6', '21100', 'MEXICALI', 'MERCADO BRAULIO MALDONADO SIN NUMERO 172 Y 173', 1, 'CLN-0445-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:16', '2018-06-08 16:52:22', NULL),
(590, NULL, 'GRUPO OFICIAL, S.A. DE C.V.', '-', '01 33 368 21 500', 'GOF070509IC0', '45110', 'ZAPOPAN', 'AV. PATRIA # 573 C', 1, 'CLN-0446-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:22', NULL),
(591, NULL, 'ABARROTES CADENA S.A DE C.V.', 'factura.cadena@gmail.com', '0123-8383-2442', 'ACA870610SW0', '75786', 'TEHUACAN', 'AV. INDEPENDENCIA ORIENTE 1701', 1, 'CLN-0447-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:22', NULL),
(592, NULL, 'ENVIAFLORES,S.A. DE C.V.', '-', '01 81 4624 8921', 'ENV0708288K9', '64630', 'NUEVO LEON', 'JUSTO SIERRA # 334', 1, 'CLN-0448-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:22', NULL),
(593, NULL, 'PROVEEDORA DE ABARROTES RIVERA SA DE CV', 'manuelmartinez@grupolagranbodega.mx;manuelmartinez-1992@hotmail.com', '044-2225-2280-86', 'PAR900605CAA', '72019', 'PUEBLA', 'CIRCUITO INTERIOR OTE 2 D1D2D3D4D5', 1, 'CLN-0449-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:22', NULL),
(594, NULL, 'COMERCIALIZADORA ALGEBE SA DE CV', 'jgalindo@gmail.com;rosalbaanita@hotmail.com', '20650158', 'CAL070927P73', '03100', 'CIUDAD DE MEXICO', 'AMORES  # 1746', 1, 'CLN-0450-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:22', NULL),
(595, NULL, 'DAVID GONZALEZ SEPULVEDA', '-', '0181 1157 6555', 'GOSD730405788', '64580', 'NUEVO LEON', 'RAMON TREVI??O # 1902', 1, 'CLN-0451-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:23', NULL),
(596, NULL, 'DISTRIBUIDORA FIBE S.A DE C.V.', 'lersi_2009@hotmail.com', '01742-423-3122', 'DFI141001A89', '03200', 'MEXICO', 'INSURGENTES SUR 1188 PISO 2 OFICINA 207', 1, 'CLN-0452-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:23', NULL),
(597, NULL, 'GRUPO HUIZAR Y DH S.A DE C.V', 'dulceriashuizar@hotmail.com', '-', 'GHD931220DC1', '80000', 'CULIACAN', 'ANGEL FLORES # 302 PONIENTE', 1, 'CLN-0453-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:23', NULL),
(598, NULL, 'CASA AYALA DEL NOROESTE S.A DE C.V.', 'gpoayala@outlook.com', '-', 'CAN801121F96', '85065', 'CD. OBREGON', 'CARRETERA INTERNACIONAL KM 1845  ZONA INDUSTRIAL #2 CENTRAL DE ABASTOS', 1, 'CLN-0454-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:23', NULL),
(599, NULL, 'REBEL FOOD SERVICE, S.A. DE C.V.', '-', '01871 722 3886', 'RFS150424VA9', '27100', 'TORREON', 'BRUSELAS # 402', 1, 'CLN-0455-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:23', NULL),
(600, NULL, 'ROSALIA AIDE RUIZ MENDOZA', 'martharuiz214@hotmail.com', '-', 'RUMR630904QB9', '71256', 'OAXACA', 'AVENIDA LUIS ECHEVERRIA #2', 1, 'CLN-0456-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:23', NULL),
(601, NULL, 'DULIMP S.A DE C.V.', 'dulceriaimperial@hotmail.com', '0166-7721-5409', 'DUL1602067S4', '80150', 'CULIACAN', 'CALZADA AEROPUERTO # 4989', 1, 'CLN-0457-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:23', NULL),
(602, NULL, 'LUIS ALBERTO RUBIO MENDEZ', '-', '16531127726', 'RUML800620GT5', '83488', 'SAN LUIS RIO COLORADO', 'AV.JAZMIN B# 2200 LOCAL 3', 1, 'CLN-0458-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:23', NULL),
(603, NULL, 'PLAZA COMERCIAL ORIENTE, S.A. DE C.V.', '-', '-', 'PCO7903276Y9', '15390', 'DISTRITO FEDERAL', 'IGNACIO ZARAGOZA # 200 EDIF. B', 1, 'CLN-0459-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:17', '2018-06-08 16:52:23', NULL),
(604, NULL, 'PARADOR DEL VIAJERO, S.A. DE C.V.', '-', '-', 'PVI730329EM0', '15390', 'DISTRITO FEDERAL', 'CALZ. IGNACIO ZARAGOZA # 200 EDIFICIO B', 1, 'CLN-0459-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(605, NULL, 'PLAZA COMERCIAL DE PUEBLA, S.A. DE C.V.', 'glopez@grupoado.com.mx', '-', 'PCP8709033K2', '15390', 'DISTRITO FEDERAL', 'CALZ. IGNACIO ZARAGOZA # 200 EDIF. B 1ER PISO', 1, 'CLN-0459-0003', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(606, NULL, 'DISTRIBUIDORA PARADOR DEL VIAJERO, S.A. DE C.V.', 'glopez@grupoado.com.mx', '-', 'HYM091130QYA', '15390', 'CIUDAD DE MEXICO', 'CALZ. IGNACIO ZARAGOZA # 200 EDIFICIO B 1ER PISO', 1, 'CLN-0459-0004', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(607, NULL, 'FUNDACION XOCHITLA, A.C.', '-', '-', 'FXO970123B29', '54600', 'MEXICO', 'CARRETERA CIRCUNVALACION SN', 1, 'CLN-0460-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(608, NULL, 'KIDZANIA DE MEXICO S.A. DE C.V.', 'apmexico@kidzania.com', '-', 'KME940630DR2', '05348', 'CIUDAD DE MEXICO', 'VASCO DE QUIROGA # 3800 LOCAL 1', 1, 'CLN-0461-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(609, NULL, 'NINOFLEX S.A. DE C.V.', '-', '56961000', 'NIN140814PD9', '03500', 'CIUDAD DE MEXICO', 'DON JUAN   #8', 1, 'CLN-0462-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(610, NULL, 'IMPORTADORA GREZON, S.A. DE C.V.', '-', '-', 'IGR990430172', '11950', 'CIUDAD DE MEXICO', 'AV. CONSTITUYENTES 888 B', 1, 'CLN-0463-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(611, NULL, 'FARMACIAS MODERNAS DE TIJUANA, S.A. DE C.V.', '-', '-', 'FMT890126BZ4', '22105', 'TIJUANA', 'AV. DE LOS CHARROS #314', 1, 'CLN-0464-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(612, NULL, 'GIOVANNA LINETTE AMADOR HERNANDEZ', '-', '-', 'AAHG830914JP3', '03300', 'CIUDAD DE MEXICO', 'SEVILLA 1023', 1, 'CLN-0465-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(613, NULL, 'NUTRI-ZAZ, S. A. DE C. V.', '-', '58951710', 'NUT100126BM5', '11950', 'CIUDAD DE MEXICO', 'AV. CONSTITUYENTES 888 B', 1, 'CLN-0466-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(614, NULL, 'RAFAEL FARARONI MORTERA', '-', '-', 'FAMR6405194X4', '95700', 'SAN ANDRES TUXTLA', 'CARR. SAN ANDRES CATEMACO KM 584', 1, 'CLN-0467-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(615, NULL, 'CODIGO ALIMENTARIO S.A DE C.V.', '-', '5882887', 'CAL0804077FA', '54948', 'EDO.MEXICO', 'BLVD.BENITO JUAREZ 10 NAVE E4', 1, 'CLN-0468-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(616, NULL, 'BENJAMIN VEGA LOZADA', 'benjamin.vega@hotmail.com', '5558170594', 'VELB650919N72', '54715', 'CUAUTITLAN IZCALLI', 'BOSQUES ALPINO #50', 1, 'CLN-0469-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(617, NULL, 'UNIVERSO DE CONVENIENCIA SAPI DE CV', 'mauricio@elpuesto.mx', '5569693707', 'UCO130624E54', '05120', 'CIUDAD DE MEXICO', 'PASEO DE LOS TAMARINDOS 90 TORRE 1 PISO 32', 1, 'CLN-0470-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(618, NULL, 'LUIS MARQUEZ NAVARRETE', '-', '-', 'MANL660621E55', '07530', 'CIUDAD DE MEXICO', 'CAMINO A LA PROSPERIDAD NO. 182', 1, 'CLN-0471-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(619, NULL, 'MARISOL LOZANO JUAREZ', '-', '-', 'LOJM901226V78', '50226', 'TOLUCA', 'EDIFICIO E  5 S/N', 1, 'CLN-0472-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(620, NULL, 'BACK TO BUSINESS, S. A. DE C. V.', '-', '-', 'BTB021025GXA', '06500', 'CIUDAD DE MEXICO', 'RIO HUDSON NO. 25 1er PISO', 1, 'CLN-0473-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(621, NULL, 'OPERADORA KRISES S.A.P.I. DE C.V.', 'contacto.krises@gmail.com', '5207 8410 EXT. 2008', 'OKR1704075M6', '03100', 'CIUDAD DE MEXICO', 'ADOLFO PRIETO# 1322 INT 2', 1, 'CLN-0474-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:23', NULL),
(622, NULL, 'COMERSINERGIA, S. A. DE C. V.', 'rodolfo@comersinergia.com.mx', '449 915 5945 EXT 122', 'COM080315RD7', '2000', 'AGUASCALIENTES', 'VAZQUEZ DEL MERCADO 134 1', 1, 'CLN-0475-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:24', NULL),
(623, NULL, 'DAYRA ESMERALDA GARCIA MIRANDA', 'andrygarcia64@yahoo.com', '55711010', 'GAMD980112AG9', '15900', 'CIUDAD DE MEXICO', 'FERNANDO IGLESIAS Y CALDERON  NO. 48', 1, 'CLN-0476-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:24', NULL),
(624, NULL, 'COMERCIALIZADORA FARMACEUTICA DEL SURESTE, S.A. DE C.V.', 'luisr.lazarom@farmaciasunion.com', '01 99 33 58 01 30', 'CFS950529980', '86000', 'VILLAHERMOSA', 'IGNACIO LOPEZ RAYON 1ER PISO #110', 1, 'CLN-0477-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:24', NULL),
(625, NULL, 'EMOCION INTENSA, S.A. DE C.V.', 'supervisordetiendas@xtasea.mx', '01 74 48 85 37 94', 'EIN160406MN4', '39890', 'ACAPULCO', 'AV. COSTERA DE LAS PALMAS S/N', 1, 'CLN-0478-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:24', NULL),
(626, NULL, 'JOSUE GEREMIAS HOIL POOT', 'info@thecandyfesrt.com', '0181 11 57 65 55', 'HOPJ950416715', '77720', 'PLAYA DEL CARMEN', 'C 42 / AV 30 Y 35 M-128 L-13', 1, 'CLN-0479-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:24', NULL),
(627, NULL, 'ROSA MARIA LOPEZ ALVAREZ', 'eltulipandulceria@gmail.co', '5539775173', 'LOAR500317BG9', '36300', 'SAN FRANCISCO DEL RINCON', 'BOULEVARD AQUILES SERDAN 200', 1, 'CLN-0480-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:24', NULL),
(628, NULL, 'COMERCIALIZADORA XANTAR S.A. DE C.V.', 'ajuarez@tiendaseqqus.com', '36 83 68 00', 'CXA1312129U1', '55349', 'ECATEPEC DE MORELOS', 'VIA MORELOS 484 SIN NUMERO', 1, 'CLN-0481-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:24', NULL),
(629, NULL, 'BC COMERCIO S.A. DE C.V.', 'lorena.galindo@24.com.mx', '0122 88 15 22 11', 'ZJA000815313', '91150', 'XALAPA', 'AV. LAZARO CARDENAS 521', 1, 'CLN-0482-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:24', NULL),
(630, NULL, 'ERNESTO DEL ANGEL GUERRA', 'ernesto.delangel@gmail.com', '3313827726', 'AEGE801116V1A', '45019', 'ZAPOPAN', 'BLVD. ASTURIAS 200 5 B', 1, 'CLN-0483-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:24', NULL),
(631, NULL, 'CARBAJO CERVANTES IMANOL', 'grupocervantessma@hotmail.com', '415 1670065', 'CACI970326IW5', '37737', 'SAN MIGUEL DE ALLENDE', 'SAN RAFAEL NO. 5', 1, 'CLN-0484-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:18', '2018-06-08 16:52:24', NULL),
(632, NULL, 'TIENDAS CHAPUR S.A. DE C.V.', 'cfdi@chapur.com', '019 99 930 28 00', 'TCA820316NX8', '97000', 'MERIDA', 'CALLE 63 No. 474 ENTRE 54 Y 56', 1, 'CLN-0485-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(633, NULL, 'MULTISERVICIOS DZIBALCHEN', 'u77caution@hotmail.com', '0198 1143 33 03', 'MDZ100112V70', '24611', 'HOPELCHEN', 'CARRETERA DZIBALCHEN-CHENCOH KM 0 500', 1, 'CLN-0486-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(634, NULL, 'ROBERTO BAZAN RAMIREZ', '-', '70404041', 'BARR5406068V2', '02125', 'CIUDAD DE MEXICO', 'XOCHINAHUAC EDIFICIO 7 305', 1, 'CLN-0487-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(635, NULL, 'AUTOTRANSPORTES DE CARGA TRESGUERRAS, S. A. DE C. V.', '-', '-', 'ACT6808066SA', '38110', 'CELAYA, GTO.', 'CARR. CELAYA VILLAGRAN KM 3.57 S/N', 1, 'CLN-5000-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(636, NULL, 'SUZHOU MEGA FOOD CO. LTD', '-', '-', 'XEXX010101000', '215127', 'CHINA', 'LUZHI TWON WUXIAN SUZHOU', 1, 'CLP-0001-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(637, NULL, 'TRANSPORTES PITIC, S.A. DE C.V.', '-', '5392-8381', 'TPI730201V28', '83060', 'HERMOSILLO', 'CALZADA DE LOS PINOS S/N', 1, 'CLP-0001-0002', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(638, NULL, 'HERSHEY MEXICO, S.A. DE C.V.', 'druiz@hershey.com', '-', 'HME690225IZ3', '45680', '-', 'CARRETERA GUADALAJRA EL CASTILLO KM8.05', 1, 'CLP-0001-0003', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(639, NULL, 'IMPORTADORA GREZON,S.A. DE C.V.', '-', '-', 'IGR9904030172', '11700', 'DE MEXICO', 'BOSQUES DE DURAZNOS #61 PISO 3', 1, 'CLP0001-0004', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(640, NULL, 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '-', '-', 'EME940318NI5', '76246', 'QUERETARO', 'CARRETERA A CHICHIMEQUILLAS KM4.5', 1, 'CLP-0001-0005', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(641, NULL, 'ORGANIZACION SAHUAYO, S.A. DE C.V.', '-', '-', 'OSA840206MK6', '14210', 'MEXICO', 'PICO DE TOLIMA #29', 1, 'CLP-0001-0006', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(642, NULL, 'CONAGRA FOODS MEXICO, S.A. DE C.V.', '-', '-', 'CFM600506V82', '36680', 'GUANAJUATO', 'BLVD PASEO SOLIDARIDAD #11251', 1, 'CLP-0001-0007', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(643, NULL, 'MATRE MEXICO, S. DE R.L. DE C.V.', '-', '-', 'MME080729180', '66358', 'NUEVO LEON', 'GALAXIAS #701', 1, 'CLP-0001-0008', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(644, NULL, 'PULPALETA DE MEXICO, S.A. DE C.V.', '-', '-', 'PME041125GHA', '53219', 'ESTADO DE MEXICO', 'CARRETERA CAMINO REAL A SAN MATEO  KM 7 PLANO GB3', 1, 'CLP-0001-0009', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(645, NULL, 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '-', '-', 'FDP930715465', '-', 'JALISCO', 'BARTOLOME DE LAS CASAS #304', 1, 'CLP-0001-0010', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(646, NULL, 'PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.', '-', '(81) 8336-9990', 'PCP920423KQA', '66370', 'NUEVO LEON', 'ZEUS', 1, 'CLP-0001-0011', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(647, NULL, 'GRUPO ABASTECEDOR DE ABARROTES, S.A. DE C.V.', '-', '5694-6713', 'GAA970226DL8', '09300', '-', 'TAMEMES MZ 2 LT 21 #20', 1, 'CLP-0001-0012', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(648, NULL, 'DULCES EL DESCUENTO, S.A. DE C.V.', '-', '-', 'DDE9512217R4', '56259', '-', 'CARRETERA MEXICO TEXCOCO 28 KILOMETRO 31.2', 1, 'CLP-0001-0013', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(649, NULL, 'AUTOTRANSPORTES DE CARGA TRES GUERRAS, S.A. DE C.V.', '-', '018007108352', 'ACT6808066SA', '38110', 'CELAYA', 'CARR-CELAYA VILLAGRAN KM 3.57 S/N', 1, 'CLP-0001-0014', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:24', NULL),
(650, NULL, 'IMPORTACIONES BAROUDI, S,A, DE  C.V.', '-', '(983)832-2298 (CHETU', 'IBA970522TB6', '77016', 'QUINTANARRO', 'PABLO GONZALEZ #260', 1, 'CLP-0001-0015', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:25', NULL),
(651, NULL, 'SINGLE PACK, S.A. DE C.V.', '-', '5861-7888', 'SPA070709FL5', '54701', '-', 'AV.SAN ISIDRO No.35', 1, 'CLP-0001-0016', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:25', NULL),
(652, NULL, 'FLETES DE ORIENTE, S. A. DE C. V.', '-', '-', 'FOR630225561', '45625', 'TLAQUEPAQUE, JAL.', 'CARRETERA A LOS ALTOS NO. 4985', 1, 'CLS-0001-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:25', NULL),
(653, NULL, 'EXPRESS LOGISTICS RAMY S.A. DE C.V.', '-', '01-722-237-35-65', 'ELR080515CM5', '50020', 'TOLUCA', 'AV. DE LOS HORNOS No. 6', 1, 'CLS-0002-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:25', NULL),
(654, NULL, 'AUTOTRANSPORTES DE CARGA TRESGUERRAS, S. A. DE C. V.', 'pago@tresguerras.com.mx', '-', 'ACT6808066SA', '38110', 'CELAYA, GTO.', 'CARR. CELAYA VILLAGRAN KM 3.57 S/N', 1, 'CLS-0003-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:25', NULL),
(655, NULL, 'TRANSPORTES PITIC S. A. DE C. V.', '-', '-', 'TPI730201V28', '83060', 'HERMOSILLO, SONORA', 'CALZADA DE LOS PINOS S/N', 1, 'CLS-0004-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:25', NULL),
(656, NULL, 'HUMAR LOGISTICS S.A DE C.V', '-', '-', 'HLO080515NL1', '72550', '-', 'AV. EJIDO No.5991', 1, 'CLS-0005-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:25', NULL),
(657, NULL, 'TRANSPORTES LOGISTICOS CORTEZ SA DE CV', '-', '-', 'TLC110211SX1', '66414', 'SAN NICOLAS DE LOS GARZA, NUEVO LEON', 'ANGEL ZARRAGA NO. 211', 1, 'CLS-0006-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:25', NULL),
(658, NULL, 'JUST SERVICE LOGISTICA Y COMERCIAL SA DE CV', '-', '-', 'JSL020401110', '54130', 'TLALNEPANTLA, EDO DE MEXICO', 'AV SANTA CECILIA LT 3 211', 1, 'CLS-0007-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:25', NULL),
(659, NULL, 'ALMA DELIA MARTINEZ CASTILLO', '-', '43278741', 'MACA8012103N3', '54720', 'CUAUTITLAN IZCALLI, EDO DE MEXICO', 'LA ERA NO. 28-B', 1, 'CLS-0008-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:25', NULL),
(660, NULL, 'TRANSPORTES SOTOMAYOR S A DE C V', '-', '42711591', 'TSO9012044E7', '76800', 'SAN JUAN DEL RIO, QUERETARO', 'CANARIOS NO. 6', 1, 'CLS-0009-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:19', '2018-06-08 16:52:25', NULL),
(661, NULL, 'MART', '-', '46080873', 'MACI740313RQ4', '8400', 'MEXICO, D. F.', 'AVENA NO. 376 INT. 8', 1, 'CLS-0010-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(662, NULL, 'APOLINAR NAVARRO TREVI??O', '-', '018111646814', 'NATA661207GA1', '67110', 'GUADALUPE, NUEVO LEON', 'IGNACIO ZARAGOZA NO. 4002', 1, 'CLS-0011-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(663, NULL, 'DRAKE GARCIA ALAND', '-', '-', 'DAGA770105V75', '11260', 'MEXICO, D. F.', 'IGNACIO ALLENDE 328 EDIF B 501', 1, 'CLS-0012-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(664, NULL, 'JORGE SANDOVAL CAMACHO', '-', '-', 'SACJ720506RGA', '02400', 'MEXICO, D. F.', 'FRANCISCO SARABIA NO. 97', 1, 'CLS-0013-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(665, NULL, 'ODILON LUNA FERNANDEZ', '-', '01 722 2995881', 'LUFO750429JVA', '50459', 'EDO DE MEXICO', 'DOMICILIO CONOCIDO S/N  S/C KM 8.5 CARRETERA ATLACOMULCO-EL ORO', 1, 'CLS-0014-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(666, NULL, 'TRANSPORTES MEB, S. A. DE C. V.', '-', '44 290190', 'TME080114Q88', '76120', 'QUERETARO, QUERETARO', 'ACCESO III No. 14 BODEGA 4 INT. 2', 1, 'CLS-0015-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(667, NULL, 'ALTERNATIVAS EN DISTRIBUCION Y LOGISTICA DE CARGA SA DE CV', '-', '55 81 87 35', 'ADL090518LY6', '04260', 'MEXICO, D. F.', 'VICENTE GUERRERO NO. 12', 1, 'CLS-0017-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(668, NULL, 'TRANSPO, S. A. DE C. V.', '-', '58 70 35 57', 'TRA9801201Y2', '54840', 'CUAUTITLAN IZCALLI', 'CARRETERA CUAUTITLAN-TEPOTZOTLAN KM 3.5', 1, 'CLS-0018-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(669, NULL, 'QUALITAS COMPA??IA DE SEGUROS, S. A. DE C. V.', '-', '-', 'QCS931209G49', '05200', 'CUAJIMALPA, MEXICO, D.F.', 'JOSE MARIA CASTORENA NO. 426', 1, 'CLS-0019-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(670, NULL, 'MAPFRE TEPEYAC, S. A.', '-', '-', 'MTE440316E54', '06500', 'CIUDAD DE MEXICO', 'AV. PASEO DE LA REFORMA 243', 1, 'CLS-0020-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(671, NULL, 'ADRO S. A.', '-', '57 4 3323759', 'XEXX010101000', '-', '-', 'CARRERA 48 N. 46 A SUR 31', 1, 'CLS-0021-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(672, NULL, 'CENTAUROS DEL SURESTE S A DE C V', 'atencion_clientes02@centauros.com.mx', '55 52 31 22', 'CSU570704QP5', '15820', 'CIUDADA DE MEXICO', 'PROLONGACION ROSARIO 569', 1, 'CLS-0022-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:25', NULL),
(673, NULL, 'HERSHEY MEXICO, S. A. DE C. V.', '-', '-', 'HME690225IZ3', '45680', 'EL SALTO', 'CARR. GUADALAJARA-EL CASTILLO KM 8.05', 1, 'CLS-0023-0001', '-', '-', '-', '-', '-', '-', '-', NULL, NULL, '2018-06-03 02:28:20', '2018-06-08 16:52:26', NULL),
(674, NULL, 'BARCEL, S. A. DE C. V.', 'barcel@barcel.com', '444444', 'BAR011108CC6', '52000', 'LERMA', 'CARR. MEXICO TOLUCA KM 54', 1, 'CLS-0024-0001', '1', '34', '23', '1', '1407', '0', '10', 15, 1, '2018-06-03 02:28:20', '2018-07-13 03:36:41', NULL),
(675, NULL, 'magia', 'magia@gmail.com', '43434343', 'uiiu45', '434343', '43434', '43434rew', 1, 'magia333', '1', '12', '12', '1', '2304', '0', '12', 16, 1, '2018-07-13 04:13:48', '2018-07-13 04:13:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dist`
--

DROP TABLE IF EXISTS `dist`;
CREATE TABLE IF NOT EXISTS `dist` (
  `id` int(10) unsigned NOT NULL,
  `place` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distribution`
--

DROP TABLE IF EXISTS `distribution`;
CREATE TABLE IF NOT EXISTS `distribution` (
  `id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `shop` int(11) NOT NULL,
  `order_detail_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_supply`
--

DROP TABLE IF EXISTS `history_supply`;
CREATE TABLE IF NOT EXISTS `history_supply` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `detail_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `hist_date_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history_supply`
--

INSERT INTO `history_supply` (`id`, `user_id`, `order_id`, `detail_id`, `product_id`, `quantity`, `hist_date_time`, `created_at`, `updated_at`) VALUES
(1, 3, 182, 152, 3131, 1, '2018-07-17 11:43:43', '2018-07-17 16:43:43', '2018-07-17 16:43:43'),
(2, 3, 182, 152, 3131, 1, '2018-07-17 11:43:43', '2018-07-17 16:43:43', '2018-07-17 16:43:43'),
(3, 3, 182, 152, 3131, 1, '2018-07-17 11:43:44', '2018-07-17 16:43:44', '2018-07-17 16:43:44'),
(4, 3, 182, 152, 3131, 1, '2018-07-17 11:43:44', '2018-07-17 16:43:44', '2018-07-17 16:43:44'),
(5, 3, 182, 152, 3131, 1, '2018-07-17 11:43:44', '2018-07-17 16:43:44', '2018-07-17 16:43:44'),
(6, 3, 182, 152, 3131, 1, '2018-07-17 11:43:45', '2018-07-17 16:43:45', '2018-07-17 16:43:45'),
(7, 3, 182, 152, 3131, 1, '2018-07-17 11:43:45', '2018-07-17 16:43:45', '2018-07-17 16:43:45'),
(8, 3, 182, 152, 3131, 1, '2018-07-17 11:43:45', '2018-07-17 16:43:45', '2018-07-17 16:43:45'),
(9, 3, 182, 152, 3131, 1, '2018-07-17 11:43:46', '2018-07-17 16:43:46', '2018-07-17 16:43:46'),
(10, 3, 182, 152, 3131, 1, '2018-07-17 11:43:46', '2018-07-17 16:43:46', '2018-07-17 16:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `sequence` int(11) NOT NULL DEFAULT '0',
  `label` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` int(11) NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent`, `sequence`, `label`, `url`, `visible`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 9, 1, 'Usuarios', 'usuarios/listado', 1, 1, '2018-06-13 14:43:33', '2018-06-13 18:21:13'),
(2, 9, 2, 'Menus', 'menu/listado', 1, 1, '2018-06-13 14:44:36', '2018-06-13 18:21:29'),
(3, 9, 3, 'Catalogos', 'catalogos/listado', 1, 1, '2018-06-13 14:45:10', '2018-06-13 18:21:22'),
(4, 9, 4, 'Clientes', 'clientes/listado', 1, 1, '2018-06-13 14:45:32', '2018-07-03 19:06:33'),
(5, 11, 0, 'Listado de Pedidos', 'listadoPedidosJefe', 1, 2, '2018-06-13 14:46:24', '2018-06-13 18:47:17'),
(7, 9, 5, 'Productos', 'productos/listado', 1, 1, '2018-06-13 14:47:40', '2018-07-03 19:06:40'),
(8, NULL, 8, 'Recepci??n de Mercanc??a', '#', 1, 1, '2018-06-13 18:14:06', '2018-07-17 17:07:01'),
(9, NULL, 99, 'Administraci??n', '#', 1, 1, '2018-06-13 18:15:56', '2018-06-13 18:15:56'),
(11, NULL, 1, 'Surtido de Pedido', '#', 1, 1, '2018-06-13 18:46:28', '2018-06-30 00:08:35'),
(12, NULL, 0, 'Mis Tareas', 'listadoTareas', 1, 1, '2018-06-13 18:51:12', '2018-06-22 19:33:34'),
(13, NULL, 999, 'Permisos no visibles', '#', 0, 1, '2018-06-22 17:37:52', '2018-06-22 18:59:25'),
(14, 13, 0, 'Listado de trabajadores asignados a una tarea', 'usuarios/listaAsig', 1, 1, '2018-06-22 18:58:18', '2018-06-22 19:13:40'),
(15, 13, 0, 'Inicio', 'home', 1, 1, '2018-06-22 19:01:13', '2018-06-22 19:01:13'),
(16, 13, 0, 'Nombres de trabajadores asignados', 'usuarios/obtenerNombresJefe/.*', 1, 1, '2018-06-22 19:13:24', '2018-07-03 16:04:55'),
(17, 13, 0, 'Agregar Usuarios', 'usuarios/agregar', 1, 1, '2018-06-22 19:28:15', '2018-06-22 19:28:15'),
(18, 13, 0, 'Consultar Usuarios', 'usuarios/consultar', 1, 1, '2018-06-22 19:28:43', '2018-06-22 19:28:43'),
(19, 13, 0, 'Editar Usuarios', 'usuarios/editar', 1, 1, '2018-06-22 19:28:59', '2018-06-22 19:28:59'),
(20, 13, 0, 'Asignar Jefe', 'usuarios/asignarJefe', 1, 1, '2018-06-22 19:29:42', '2018-06-22 19:29:42'),
(21, 13, 0, 'Asignar usuario a tarea', 'usuarios/asignarUsuario', 1, 1, '2018-06-22 19:30:50', '2018-06-22 19:30:50'),
(22, 13, 0, 'Desasignar usuario', 'usuarios/desasignarUsuario', 1, 1, '2018-06-22 19:31:36', '2018-06-22 19:31:36'),
(23, 13, 0, 'Datos de un pedido asignado', 'pedidos/listaAsig', 1, 1, '2018-06-22 19:37:10', '2018-06-22 19:38:02'),
(24, 13, 0, 'Agregar Productos', 'productos/agregar', 1, 1, '2018-06-22 21:52:33', '2018-06-22 21:52:33'),
(25, 13, 0, 'Consultar Productos', 'productos/consultar', 1, 1, '2018-06-22 21:52:58', '2018-06-22 21:52:58'),
(26, 13, 0, 'Editar Productos', 'productos/editar', 1, 1, '2018-06-22 21:53:22', '2018-06-22 21:53:22'),
(27, 13, 0, 'Eliminar Productos', 'productos/eliminar', 1, 1, '2018-06-22 21:53:39', '2018-06-22 21:53:39'),
(28, 13, 0, 'Csv de Productos', 'productos/CSVPro', 1, 1, '2018-06-22 21:54:35', '2018-06-22 21:54:35'),
(29, 13, 0, 'Agregar Menu o permiso', 'menu/agregar', 1, 1, '2018-06-22 22:57:50', '2018-06-22 22:57:50'),
(30, 13, 0, 'Agregar Menu o permiso', 'menu/consultar', 1, 1, '2018-06-22 22:58:55', '2018-06-22 22:58:55'),
(31, 13, 0, 'Editar Menu o permiso', 'menu/editar', 1, 1, '2018-06-22 22:59:17', '2018-06-22 22:59:17'),
(32, 13, 0, 'Eliminar Menu o permiso', 'menu/eliminar', 1, 1, '2018-06-22 22:59:32', '2018-06-22 22:59:32'),
(33, 13, 0, 'Agregar Permiso', 'menu/agregar/permiso', 1, 1, '2018-06-22 23:00:05', '2018-06-22 23:00:05'),
(34, 13, 0, 'Consultar Permisos', 'menu/consultar/permiso', 1, 1, '2018-06-22 23:02:50', '2018-06-22 23:02:50'),
(35, 13, 0, 'Eliminar permisos', 'menu/eliminar/permiso', 1, 1, '2018-06-22 23:03:21', '2018-06-22 23:03:21'),
(36, 13, 0, 'Agregar un elemento de un cat??logo', 'catalogos/agregar', 1, 1, '2018-06-22 23:05:17', '2018-06-22 23:05:17'),
(37, 13, 0, 'Editar un elemento de un cat??logo', 'catalogos/editar', 1, 1, '2018-06-22 23:05:39', '2018-06-22 23:05:52'),
(38, 13, 0, 'Eliminar un elemento de un cat??logo', 'catalogos/eliminar', 1, 1, '2018-06-22 23:06:25', '2018-06-22 23:06:25'),
(39, 13, 0, 'Consulta de un elemento de un cat??logo', 'catalogos/obtener', 1, 1, '2018-06-22 23:06:57', '2018-06-22 23:06:57'),
(40, 13, 0, 'Agregar Cliente', 'clientes/agregar', 1, 1, '2018-06-22 23:14:24', '2018-06-22 23:14:24'),
(41, 13, 0, 'Editar Cliente', 'clientes/editar', 1, 1, '2018-06-22 23:14:44', '2018-06-22 23:14:55'),
(42, 13, 0, 'Eliminar Cliente', 'clientes/eliminar', 1, 1, '2018-06-22 23:15:22', '2018-06-22 23:15:22'),
(43, 13, 0, 'CSV de clientes', 'clientes/CSVCli', 1, 1, '2018-06-22 23:15:44', '2018-06-22 23:15:44'),
(44, 13, 0, 'Listado de tareas del jefe', 'listadoTareasJ/.*', 1, 1, '2018-06-22 23:17:41', '2018-06-22 23:17:41'),
(45, 13, 0, 'Registro de productos en surtido de pedidos Trabajador', 'addDet', 1, 1, '2018-06-22 23:18:21', '2018-06-22 23:18:21'),
(46, 13, 0, 'Validaci??n de productos para surtido', 'addDetJ', 1, 1, '2018-06-22 23:19:02', '2018-06-22 23:19:02'),
(47, 13, 0, 'Cierre de surtido para trabajador', 'cierraPed', 1, 1, '2018-06-22 23:19:29', '2018-06-22 23:19:29'),
(48, 13, 0, 'Terminar validaci??n de surtido', 'cierraPedJ', 1, 1, '2018-06-22 23:19:53', '2018-06-22 23:19:53'),
(49, 13, 0, 'Listado de items en Ordenes de compra', 'ordenes/listadoItems/.*', 1, 1, '2018-06-22 23:20:31', '2018-07-23 22:40:17'),
(50, NULL, 2, 'Preparaci??n de Pedido', '#', 1, 1, '2018-06-30 00:08:17', '2018-06-30 00:08:54'),
(51, 50, 1, 'Listado de pedidos', 'preparacion/listado', 1, 1, '2018-06-30 00:11:00', '2018-06-30 00:11:00'),
(52, 13, 0, 'Recibir un pedido en Preparaci??n', 'preparacion/recibir', 1, 1, '2018-07-02 22:53:35', '2018-07-02 22:53:35'),
(53, 9, 6, 'Cajas', 'cajas/listado', 1, 1, '2018-07-03 19:06:17', '2018-07-03 19:06:46'),
(54, 13, 0, 'Agregar caja', 'cajas/agregar', 1, 1, '2018-07-03 19:07:49', '2018-07-03 19:07:49'),
(55, 13, 0, 'Eliminar Caja', 'cajas/eliminar', 1, 1, '2018-07-03 19:08:31', '2018-07-03 19:08:31'),
(56, 13, 0, 'Consulta de tareas en preparaci??n de pedidos', 'preparacion/tareas', 1, 1, '2018-07-03 23:40:07', '2018-07-05 00:09:47'),
(57, 13, 0, 'Asignaci??n de tarea por detalla en preparaci??n de pedido', 'preparacion/asignacionDetalle', 1, 1, '2018-07-04 01:10:13', '2018-07-04 01:12:46'),
(58, 13, 0, 'Autocomplete de jefes', 'usuarios/obtenerNombre?.*', 1, 1, '2018-07-04 01:24:37', '2018-07-04 01:24:37'),
(59, NULL, 0, 'Mis Tareas PP', 'preparacion/listadoTareas', 1, 1, '2018-07-05 00:02:45', '2018-07-05 00:02:45'),
(60, 13, 0, 'Asignaci??n de caja a una tarea en preparaci??n de pedidos', 'preparacion/asignaCaja', 1, 1, '2018-07-05 02:46:14', '2018-07-05 02:46:14'),
(61, 13, 0, 'Registro de que se termina una tarea en preparaci??n de pedido', 'preparacion/terminaTarea', 1, 1, '2018-07-05 05:02:23', '2018-07-05 05:02:23'),
(62, 13, 0, 'subirCSVReparto', 'preparacion/CSVReparto', 1, 1, '2018-07-10 19:00:32', '2018-07-10 19:00:32'),
(63, 13, 0, 'editaCliente', 'clientes/editar', 1, 1, '2018-07-13 03:06:05', '2018-07-13 03:06:05'),
(64, NULL, 0, 'Pedidos pendientes', 'pendientes/listado', 1, 1, '2018-07-16 05:05:42', '2018-07-16 05:05:42'),
(65, 13, 0, 'apartarPedidos', 'pendientes/apartar', 1, 1, '2018-07-17 00:40:06', '2018-07-17 00:40:06'),
(66, 13, 0, 'arreglaCliente', 'pendientes/arreglaCli', 1, 1, '2018-07-17 03:27:56', '2018-07-17 03:27:56'),
(67, 13, 0, 'arreglaDist', 'pendientes/arreglaDist', 1, 1, '2018-07-17 04:30:32', '2018-07-17 04:30:32'),
(68, 13, 0, 'Se crea dise??o de pedido en preparaci??n', 'preparacion/disenio', 1, 1, '2018-07-17 07:00:33', '2018-07-17 07:00:33'),
(69, 13, 0, 'Mostrar dise??o de pedido en preparaci??n', 'preparacion/mostrarDisenio/.*', 1, 1, '2018-07-17 07:01:12', '2018-07-17 07:01:12'),
(70, 13, 0, 'Validar Dise??o de pedido en preparaci??n', 'preparacion/validarDiseion', 1, 1, '2018-07-17 07:02:00', '2018-07-17 07:02:00'),
(71, 8, 0, 'Listado de Ordenes de Compra', 'ordenes/listado', 1, 1, '2018-07-17 17:06:51', '2018-07-17 17:06:51'),
(72, 8, 0, 'Listado de Ordenes de Compra', 'hh/recepcion/listadoHH', 1, 1, '2018-07-17 17:09:15', '2018-07-17 17:09:15'),
(73, 13, 0, 'Validaci??n de Ordenes de Compra', 'ordenes/validar', 1, 1, '2018-07-17 17:36:53', '2018-07-17 17:36:53'),
(74, 13, 0, 'Lista de items de Ordenes de compra en HH', 'hh/recepcion/listadoItemsHH/.*', 1, 1, '2018-07-17 17:38:14', '2018-07-17 17:41:16'),
(75, 13, 0, 'Validaci??n de lote y caducidad', 'hh/recepcion/captura', 1, 1, '2018-07-17 17:39:01', '2018-07-17 17:39:01'),
(76, 13, 0, 'valida Captura de Orden de Compra', 'hh/recepcion/validaCaptura.*', 1, 1, '2018-07-17 17:45:53', '2018-07-17 17:46:05'),
(77, 13, 0, 'Actualizar cantidad en la validaci??n del dise??o del pedido', 'preparacion/actualizarCantidad', 1, 1, '2018-07-19 17:27:25', '2018-07-19 17:27:25'),
(78, 13, 0, 'Eliminar un producto de una caja en validaci??n del dise??o de pedido', 'preparacion/quitarProducto', 1, 1, '2018-07-19 20:09:56', '2018-07-19 20:09:56'),
(79, 13, 0, 'Agregar productos a una caja en validaci??n de dise??o de pedido', 'preparacion/agregarProducto', 1, 1, '2018-07-19 22:12:23', '2018-07-19 22:12:23'),
(80, 13, 0, 'Cambiar orden de empaque en la validaci??n del dise??o de pedido', 'preparacion/cambiarOrden', 1, 1, '2018-07-20 17:37:25', '2018-07-20 17:37:25'),
(81, 13, 0, 'Quitar caja del dise??o de pedido', 'preparacion/quitarCaja', 1, 1, '2018-07-20 18:03:25', '2018-07-20 18:03:25'),
(82, NULL, 3, 'Distribuci??n', '#', 1, 1, '2018-07-23 16:40:16', '2018-07-23 16:44:41'),
(83, 82, 0, 'Listado de Camiones', 'camiones/listado', 1, 1, '2018-07-23 16:41:02', '2018-07-23 16:41:02'),
(84, 13, 0, 'Agregar cami??n en cat??logo de camiones', 'camiones/agregar', 1, 1, '2018-07-23 16:41:53', '2018-07-23 16:41:53'),
(85, 13, 0, 'Editar datos de un cami??n', 'camiones/editar', 1, 1, '2018-07-23 16:42:38', '2018-07-23 16:42:38'),
(86, 13, 0, 'Eliminar datos de un cami??n', 'camiones/eliminar', 1, 1, '2018-07-23 16:43:41', '2018-07-23 16:43:41'),
(87, 13, 0, 'Lectura de c??digo de barras es Recepci??n', 'hh/recepcion/obtenCantidadPorCodigo', 1, 1, '2018-07-23 22:44:57', '2018-07-23 22:44:57'),
(88, 8, 1, 'Validaci??n', 'hh/recepcion/validacionHH', 1, 1, '2018-07-24 01:01:10', '2018-07-24 01:01:10'),
(89, 13, 0, 'Validaci??n de recepci??n', 'hh/recepcion/validacionRecepcionesHH', 1, 1, '2018-07-24 01:03:12', '2018-07-24 01:03:12'),
(90, 13, 0, 'Validaci??n final en recepci??n de mercanc??a', 'hh/recepcion/finalValidacionHH', 1, 1, '2018-07-24 01:05:41', '2018-07-24 01:05:41'),
(91, 13, 0, 'Actualizaci??n de datos capturados', 'hh/recepcion/actualizar', 1, 1, '2018-07-24 01:07:01', '2018-07-24 01:07:27'),
(92, 13, 0, 'Listado de tareas por caja', 'preparacion/tareasPorCaja', 1, 1, '2018-07-24 17:11:31', '2018-07-24 17:11:31'),
(93, 13, 0, 'Asignaci??n de tarea por caja en preparaci??n de pedido', 'preparacion/asignacionCaja', 1, 1, '2018-07-24 19:23:45', '2018-07-24 19:23:45'),
(94, 13, 0, 'Registro de productos en preparaci??n', 'preparacion/registrarProducto', 1, 1, '2018-07-26 18:54:54', '2018-07-26 18:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_03_192113_add_status_to_users', 1),
(4, '2018_05_07_095222_create_rols_table', 1),
(5, '2018_05_07_095305_create_menus_table', 1),
(6, '2018_05_07_101149_create_profiles_table', 1),
(7, '2018_05_07_105313_add_description_to_roles', 1),
(8, '2018_05_07_122651_add_rol_to_users', 1),
(9, '2018_05_18_005045_create_catalogs_table', 1),
(10, '2018_05_18_005103_create_clients_table', 1),
(13, '2018_05_23_234142_add_codigo_clientes', 2),
(15, '2018_05_24_003731_add_code_clients', 3),
(16, '2018_05_24_004342_create_orders_table', 4),
(17, '2018_05_24_023755_add_code_orders', 5),
(18, '2018_05_24_024536_create_orders_table', 6),
(19, '2018_05_24_024831_create_order_details_table', 7),
(20, '2018_05_25_000442_create_calculations_table', 8),
(21, '2018_05_29_022126_add_calc_clients', 9),
(24, '2018_05_30_015925_add_program_date_to_calc', 10),
(25, '2018_05_30_210919_change_key_calc', 11),
(26, '2018_05_30_221556_create_dist_table', 11),
(27, '2018_06_01_082146_add_priority_calc', 12),
(28, '2018_06_02_204834_fix_calc_clients', 13),
(29, '2018_05_11_193315_add_sequence_to_menu', 14),
(30, '2018_05_15_214639_create_products_table', 14),
(31, '2018_05_30_131651_create_purchases_table', 14),
(32, '2018_05_30_131654_create_purchase_items_table', 14),
(33, '2018_05_30_164618_create_arrival_items_table', 14),
(34, '2018_06_10_235536_change_foreign_dist', 14),
(35, '2018_06_11_015038_change_priority_calc', 15),
(36, '2018_06_06_134458_add_doc_entry_purchases', 16),
(37, '2018_06_06_134715_add_doc_entry_purchase_items', 16),
(38, '2018_06_11_181409_create_table_assignments', 16),
(40, '2018_06_12_153939_add_check_details', 17),
(41, '2018_06_12_094923_changes_purchase_items', 18),
(42, '2018_06_13_124249_add_line_num_to_puchase_items', 18),
(43, '2018_06_19_181330_agregar_caducidad_minima_products', 19),
(44, '2018_06_20_084905_add_dist_orders', 19),
(45, '2018_06_20_125931_create_sessions_table', 19),
(46, '2018_06_21_002831_create_hist_surtido', 19),
(47, '2018_06_21_171101_create_boxes_table', 20),
(48, '2018_06_21_171247_create_box_ids_table', 20),
(49, '2018_06_21_171955_create_order_dsesigns_table', 20),
(50, '2018_06_22_123907_add_visible_to_menues', 21),
(51, '2018_06_27_235422_add_presreq_detail', 22),
(52, '2018_06_27_131750_add_pedimento_cantidadto_arrival_items', 23),
(53, '2018_06_29_135201_create_rules_table', 23),
(54, '2018_06_29_172100_create_order_by_stores_table', 23),
(55, '2018_06_29_182314_add_box_id_to_assignments', 23),
(56, '2018_07_02_180020_create_order_traces_table', 24),
(57, '2018_07_02_210958_add_token_to_sessions', 25),
(58, '2018_07_03_144344_rename_order_design', 26),
(59, '2018_07_03_190136_delete_foreign_box_in_assignments', 27),
(60, '2018_07_03_190610_add_design_to_assigments', 28),
(61, '2018_07_04_161643_add_qty_to_order_details', 29),
(62, '2018_07_04_200311_add_status_to_assignments', 30),
(63, '2018_07_02_113536_change_products', 31),
(64, '2018_07_09_015608_add_foreign_cli', 32),
(65, '2018_07_11_075413_create_distribution_table', 33),
(66, '2018_07_11_080826_add_numat_orders', 34),
(67, '2018_07_10_141949_add_label_to_box_ids', 35),
(68, '2018_07_10_142313_remove_quantity_op_user_to_order_details', 35),
(69, '2018_07_12_080931_drop_orders_group_table', 35),
(70, '2018_07_12_081730_add_date_client', 36),
(71, '2018_07_12_082042_add_detail_id_distribution', 36),
(75, '2018_07_11_174415_remove_qty_validation_to_order_designs', 37),
(76, '2018_07_11_180023_add_sequence_to_order_designs', 37),
(77, '2018_07_15_134510_create_order_pending_table', 37),
(78, '2018_07_16_133104_change_fp_calc', 38),
(79, '2018_07_16_184707_add_bool_pendings', 39),
(80, '2018_07_17_122642_change_caducidad_minima_to_products', 40),
(81, '2018_07_17_145051_change_quantity_to_arrival_items', 41),
(82, '2018_07_17_205803_create_pallet_table', 41),
(83, '2018_07_17_230652_create_pall_box_table', 41),
(84, '2018_07_18_144109_add_paking_order_to_order_designs', 41),
(85, '2018_07_18_154025_add_ped_pallets', 41),
(86, '2018_07_22_165231_create_trucks_esp_table', 42),
(87, '2018_07_20_024401_add_status_arrival_items', 43),
(88, '2018_07_25_164910_add_quantity_op_to_order_details', 44),
(89, '2018_07_25_180038_add_quantity_op_to_order_designs', 45),
(90, '2018_07_23_230623_create_trips_table', 46),
(91, '2018_07_25_024106_add_status_purchase_items', 46),
(92, '2018_07_25_081942_create_assi_ped_table', 46),
(93, '2018_07_25_193345_add_dates_trips', 46),
(94, '2018_07_26_073126_add_purchase_status_arrival_items', 46),
(95, '2018_07_26_124404_add_client_appointment_orders', 47);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL,
  `codeOrder` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numat` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `dist_id` int(10) unsigned DEFAULT NULL,
  `client_appointment` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `codeOrder`, `start`, `end`, `code`, `numat`, `status`, `dist_id`, `client_appointment`, `created_at`, `updated_at`) VALUES
(181, '197989', '2018-07-10', '2018-07-24', 'CLN-0118-0001', NULL, 0, NULL, NULL, '2018-07-17 00:07:03', '2018-07-17 00:07:03'),
(182, '198470', '2018-07-16', '2018-07-18', 'CLN-0237-0001', NULL, 12, NULL, NULL, '2018-07-17 00:07:03', '2018-07-23 18:12:44'),
(183, '198597', '2018-07-18', '2018-07-25', 'CLN-0245-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:49', '2018-07-19 18:48:49'),
(184, '198601', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:49', '2018-07-19 18:48:49'),
(185, '198602', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(186, '198603', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(187, '198604', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(188, '198605', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(189, '198606', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(190, '198607', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(191, '198608', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(192, '198609', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(193, '198610', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(194, '198611', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(195, '198612', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(196, '198613', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(197, '198614', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(198, '198615', '2018-07-30', '2018-08-03', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(199, '198646', '2018-07-18', '2018-07-25', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(200, '198647', '2018-07-20', '2018-07-26', 'CLN-0009-0001', NULL, 0, NULL, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(201, '198648', '2018-07-18', '2018-07-28', 'CLN-0029-0002', NULL, 0, NULL, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `order_designs`
--

DROP TABLE IF EXISTS `order_designs`;
CREATE TABLE IF NOT EXISTS `order_designs` (
  `id` int(10) unsigned NOT NULL,
  `sequence` int(10) unsigned DEFAULT NULL,
  `packing_order` int(11) NOT NULL DEFAULT '0',
  `box_id` int(10) unsigned DEFAULT NULL,
  `box_type_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `order_detail_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `quantity_op` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_designs`
--

INSERT INTO `order_designs` (`id`, `sequence`, `packing_order`, `box_id`, `box_type_id`, `order_id`, `order_detail_id`, `quantity`, `quantity_op`, `created_at`, `updated_at`) VALUES
(24, 1, 0, 8, 6, 182, 157, 656, NULL, '2018-07-23 16:59:27', '2018-07-25 20:43:51'),
(25, 1, 0, 8, 6, 182, 158, 468, NULL, '2018-07-23 16:59:30', '2018-07-25 20:43:51'),
(26, 1, 0, 8, 6, 182, 159, 852, NULL, '2018-07-23 16:59:33', '2018-07-25 20:43:51'),
(27, 1, 0, 8, 6, 182, 160, 360, NULL, '2018-07-23 16:59:39', '2018-07-25 20:43:51'),
(28, 1, 0, 8, 6, 182, 161, 546, NULL, '2018-07-23 16:59:43', '2018-07-25 20:43:51'),
(29, 1, 0, 8, 6, 182, 162, 792, NULL, '2018-07-23 16:59:47', '2018-07-25 20:43:51'),
(30, 1, 0, 8, 6, 182, 163, 218, NULL, '2018-07-23 16:59:52', '2018-07-25 20:43:51'),
(31, 2, 0, NULL, 9, 182, 163, 82, NULL, '2018-07-23 17:03:27', '2018-07-23 17:03:47'),
(32, 2, 0, NULL, 9, 182, 164, 180, NULL, '2018-07-23 17:03:31', '2018-07-23 17:03:47'),
(33, 2, 0, NULL, 9, 182, 165, 360, NULL, '2018-07-23 17:03:35', '2018-07-23 17:03:47'),
(34, 2, 0, NULL, 9, 182, 166, 240, NULL, '2018-07-23 17:03:39', '2018-07-23 17:03:47'),
(35, 3, 0, NULL, 11, 182, 152, 1488, NULL, '2018-07-23 17:04:05', '2018-07-23 17:04:05'),
(36, 3, 0, NULL, 11, 182, 153, 1404, NULL, '2018-07-23 17:04:08', '2018-07-23 17:04:08'),
(37, 3, 0, NULL, 11, 182, 154, 360, NULL, '2018-07-23 17:04:11', '2018-07-23 17:04:11'),
(38, 3, 0, NULL, 11, 182, 155, 450, NULL, '2018-07-23 17:04:14', '2018-07-23 17:04:14'),
(39, 3, 0, NULL, 11, 182, 156, 144, NULL, '2018-07-23 17:04:18', '2018-07-23 17:04:18'),
(40, 3, 0, NULL, 11, 182, 157, 46, NULL, '2018-07-23 17:04:23', '2018-07-23 17:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(10) unsigned NOT NULL,
  `itemcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `quantitypack` int(11) NOT NULL,
  `idOrder` int(10) unsigned NOT NULL,
  `pres_req` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity_user` int(11) DEFAULT NULL,
  `quantity_boss` int(11) DEFAULT NULL,
  `quantity_op` int(11) DEFAULT NULL,
  `quantity_op_boss` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `itemcode`, `quantity`, `quantitypack`, `idOrder`, `pres_req`, `quantity_user`, `quantity_boss`, `quantity_op`, `quantity_op_boss`, `created_at`, `updated_at`) VALUES
(148, 'IPO-0107', 864, 72, 181, NULL, NULL, NULL, NULL, NULL, '2018-07-17 00:07:03', '2018-07-17 00:07:03'),
(149, 'IPO-0301', 900, 75, 181, NULL, NULL, NULL, NULL, NULL, '2018-07-17 00:07:03', '2018-07-17 00:07:03'),
(150, 'EFR-0401', 1008, 84, 181, NULL, NULL, NULL, NULL, NULL, '2018-07-17 00:07:03', '2018-07-17 00:07:03'),
(151, 'SUP-0301', 126, 126, 181, NULL, NULL, NULL, NULL, NULL, '2018-07-17 00:07:03', '2018-07-17 00:07:03'),
(152, 'EFR-0401', 1488, 124, 182, NULL, 1488, 1488, NULL, NULL, '2018-07-17 00:07:03', '2018-07-17 16:43:46'),
(153, 'NUT-0101', 1404, 117, 182, NULL, 1404, 1404, NULL, NULL, '2018-07-17 00:07:03', '2018-07-17 00:07:03'),
(154, 'SKI-0106', 360, 10, 182, NULL, 360, 360, NULL, NULL, '2018-07-17 00:07:03', '2018-07-17 00:07:03'),
(155, 'LUC-0109', 450, 75, 182, NULL, 450, 450, NULL, NULL, '2018-07-17 00:07:03', '2018-07-17 00:07:03'),
(156, 'IND-0101', 144, 6, 182, NULL, 144, 144, NULL, NULL, '2018-07-17 00:07:04', '2018-07-17 00:07:04'),
(157, 'MAR-0119', 702, 117, 182, NULL, 702, 702, NULL, NULL, '2018-07-17 00:07:04', '2018-07-17 00:07:04'),
(158, 'MAR-0120', 468, 78, 182, NULL, 468, 468, NULL, NULL, '2018-07-17 00:07:04', '2018-07-17 00:07:04'),
(159, 'WRI-0501', 852, 142, 182, NULL, 852, 852, NULL, NULL, '2018-07-17 00:07:04', '2018-07-17 00:07:04'),
(160, 'WRI-0502', 360, 60, 182, NULL, 360, 360, NULL, NULL, '2018-07-17 00:07:04', '2018-07-17 00:07:04'),
(161, 'WRI-0504', 546, 91, 182, NULL, 546, 546, NULL, NULL, '2018-07-17 00:07:04', '2018-07-17 00:07:04'),
(162, 'WIN-0104', 792, 66, 182, NULL, 792, 792, NULL, NULL, '2018-07-17 00:07:04', '2018-07-17 00:07:04'),
(163, 'LUK-0403', 300, 25, 182, NULL, 300, 300, NULL, NULL, '2018-07-17 00:07:04', '2018-07-17 00:07:04'),
(164, 'EFR-0210', 180, 15, 182, NULL, 180, 180, NULL, NULL, '2018-07-17 00:07:04', '2018-07-17 00:07:04'),
(165, 'IND-0102', 360, 30, 182, NULL, 360, 360, NULL, NULL, '2018-07-17 00:07:04', '2018-07-17 00:07:04'),
(166, 'SUP-0306', 240, 20, 182, NULL, 240, 240, NULL, NULL, '2018-07-17 00:07:04', '2018-07-17 00:07:04'),
(167, 'PPR-0115', 864, 3, 183, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:49', '2018-07-19 18:48:49'),
(168, 'NES-0201', 1080, 15, 183, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:49', '2018-07-19 18:48:49'),
(169, 'SUP-0306', 144, 1, 183, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:49', '2018-07-19 18:48:49'),
(170, 'NES-0303', 2400, 25, 183, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:49', '2018-07-19 18:48:49'),
(171, 'LIF-0103', 12, 12, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(172, 'LIF-0104', 12, 12, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(173, 'SKI-0106', 36, 36, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(174, 'RIC-0202', 35, 35, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(175, 'RIC-0301', 5, 5, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(176, 'RIC-0302', 6, 6, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(177, 'RIC-0401', 6, 6, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(178, 'RIC-0402', 6, 6, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(179, 'RIC-0403', 6, 6, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(180, 'EFR-0401', 12, 12, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(181, 'IND-0101', 24, 24, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(182, 'EFR-0317', 12, 12, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(183, 'LUC-0301', 3, 3, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(184, 'RIC-0306', 5, 5, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(185, 'LUC-0305', 3, 3, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(186, 'LUC-0304', 3, 3, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(187, 'VIL-0304', 3, 3, 184, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(188, 'LIF-0104', 12, 12, 185, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(189, 'EFR-0211', 12, 12, 185, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(190, 'EFR-0212', 12, 12, 185, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(191, 'LIF-0103', 12, 12, 185, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(192, 'WRI-0502', 6, 6, 186, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(193, 'WRI-0401', 10, 10, 186, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(194, 'WRI-0304', 24, 24, 186, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(195, 'WRI-0201', 10, 10, 186, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(196, 'PPR-0116', 6, 6, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(197, 'PPR-0115', 12, 12, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(198, 'EFR-0304', 6, 6, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(199, 'EFR-0401', 24, 24, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(200, 'HER-0115', 12, 12, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(201, 'RIC-0302', 6, 6, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(202, 'RIC-0301', 10, 10, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(203, 'MAR-0202', 11, 11, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(204, 'HER-0418', 6, 6, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(205, 'LIF-0401', 12, 12, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(206, 'EFR-0317', 12, 12, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(207, 'LUC-0301', 3, 3, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(208, 'LUC-0303', 3, 3, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(209, 'PPR-0114', 4, 4, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(210, 'RIC-0306', 5, 5, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(211, 'RIC-0202', 35, 35, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(212, 'MAR-0109', 36, 36, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(213, 'NES-0101', 16, 16, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(214, 'VIL-0304', 3, 3, 187, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(215, 'RIC-0301', 5, 5, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(216, 'RIC-0302', 6, 6, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(217, 'RIC-0401', 6, 6, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(218, 'EFR-0401', 12, 12, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(219, 'PPR-0115', 12, 12, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(220, 'EFR-0303', 6, 6, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(221, 'LIF-0401', 12, 12, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(222, 'LIF-0402', 6, 6, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(223, 'EFR-0322', 6, 6, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(224, 'HER-0411', 5, 5, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(225, 'LUC-0305', 3, 3, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(226, 'VIL-0302', 3, 3, 188, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(227, 'SKI-0203', 12, 12, 189, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(228, 'WRI-0101', 10, 10, 190, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(229, 'HER-0418', 6, 6, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(230, 'RIC-0301', 5, 5, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(231, 'RIC-0403', 6, 6, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(232, 'EFR-0401', 12, 12, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(233, 'PPR-0115', 12, 12, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(234, 'IND-0101', 24, 24, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(235, 'IND-0102', 12, 12, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(236, 'HER-0203', 12, 12, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(237, 'MAR-0202', 11, 11, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(238, 'LIF-0402', 6, 6, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(239, 'LUC-0302', 3, 3, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(240, 'LUC-0303', 3, 3, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(241, 'PPR-0114', 4, 4, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(242, 'RIC-0306', 5, 5, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(243, 'LUC-0305', 3, 3, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(244, 'MAR-0109', 36, 36, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(245, 'NES-0101', 16, 16, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(246, 'VIL-0303', 3, 3, 191, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(247, 'LIF-0103', 12, 12, 192, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(248, 'SKI-0107', 36, 36, 192, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(249, 'SUP-0307', 12, 12, 192, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(250, 'SUP-0306', 12, 12, 192, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(251, 'LUC-0203', 10, 10, 193, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(252, 'WRI-0504', 6, 6, 194, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(253, 'SUP-0312', 12, 12, 194, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(254, 'WRI-0304', 24, 24, 194, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(255, 'WRI-0501', 6, 6, 194, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(256, 'HER-0125', 12, 12, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(257, 'RIC-0508', 6, 6, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(258, 'RIC-0507', 6, 6, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(259, 'EFR-0307', 6, 6, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(260, 'NES-0201', 6, 6, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(261, 'NES-0101', 16, 16, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(262, 'LUC-0305', 9, 9, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(263, 'RIC-0306', 10, 10, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(264, 'PPR-0114', 4, 4, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(265, 'LUC-0303', 3, 3, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(266, 'HER-0203', 12, 12, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(267, 'PPR-0116', 6, 6, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(268, 'EFR-0401', 12, 12, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(269, 'RIC-0403', 6, 6, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(270, 'RIC-0402', 6, 6, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(271, 'RIC-0302', 6, 6, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(272, 'RIC-0301', 15, 15, 195, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(273, 'WRI-0501', 6, 6, 196, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(274, 'RIC-0301', 5, 5, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(275, 'RIC-0302', 6, 6, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(276, 'RIC-0402', 6, 6, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(277, 'HER-0117', 6, 6, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(278, 'EFR-0401', 12, 12, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(279, 'LIF-0402', 6, 6, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(280, 'LUC-0302', 3, 3, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(281, 'RIC-0306', 5, 5, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(282, 'LUC-0305', 3, 3, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(283, 'LUC-0304', 3, 3, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(284, 'NES-0101', 16, 16, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(285, 'LUC-0307', 3, 3, 197, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(286, 'EFR-0211', 12, 12, 198, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(287, 'LIF-0103', 12, 12, 198, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(288, 'LIF-0104', 12, 12, 198, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(289, 'LIF-0201', 12, 12, 198, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(290, 'EFR-0339', 6, 6, 198, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(291, 'SUP-0307', 12, 12, 198, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(292, 'WRI-0501', 12, 12, 199, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(293, 'RIC-0403', 6, 6, 200, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(294, 'LUC-0303', 3, 3, 200, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(295, 'PPR-0114', 4, 4, 200, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(296, 'LUK-0115', 96, 12, 201, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(297, 'EFR-0325', 60, 10, 201, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:59', '2018-07-19 18:48:59'),
(298, 'EFR-0343', 18, 3, 201, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:59', '2018-07-19 18:48:59'),
(299, 'LUC-0301', 84, 28, 201, NULL, NULL, NULL, NULL, NULL, '2018-07-19 18:48:59', '2018-07-19 18:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_pendings`
--

DROP TABLE IF EXISTS `order_pendings`;
CREATE TABLE IF NOT EXISTS `order_pendings` (
  `id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `client_status` int(11) NOT NULL,
  `cat_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_pendings`
--

INSERT INTO `order_pendings` (`id`, `order_id`, `user_id`, `client_id`, `cat_id`, `client_status`, `cat_status`, `created_at`, `updated_at`) VALUES
(126, 181, 1, 257, 82, 1, 1, '2018-07-17 00:07:03', '2018-07-17 07:17:16'),
(128, 183, NULL, 387, 84, 1, 1, '2018-07-19 18:48:49', '2018-07-19 18:48:49'),
(129, 184, NULL, 12, 85, 1, 1, '2018-07-19 18:48:50', '2018-07-19 18:48:50'),
(130, 185, NULL, 12, 86, 1, 1, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(131, 186, NULL, 12, 86, 1, 1, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(132, 187, NULL, 12, 86, 1, 1, '2018-07-19 18:48:51', '2018-07-19 18:48:51'),
(133, 188, NULL, 12, 87, 1, 1, '2018-07-19 18:48:52', '2018-07-19 18:48:52'),
(134, 189, NULL, 12, 88, 1, 1, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(135, 190, NULL, 12, 88, 1, 1, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(136, 191, NULL, 12, 88, 1, 1, '2018-07-19 18:48:53', '2018-07-19 18:48:53'),
(137, 192, NULL, 12, 89, 1, 1, '2018-07-19 18:48:54', '2018-07-19 18:48:54'),
(138, 193, NULL, 12, 89, 1, 1, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(139, 194, NULL, 12, 89, 1, 1, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(140, 195, NULL, 12, 89, 1, 1, '2018-07-19 18:48:55', '2018-07-19 18:48:55'),
(141, 196, NULL, 12, 90, 1, 1, '2018-07-19 18:48:56', '2018-07-19 18:48:56'),
(142, 197, NULL, 12, 90, 1, 1, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(143, 198, NULL, 12, 91, 1, 1, '2018-07-19 18:48:57', '2018-07-19 18:48:57'),
(144, 199, NULL, 12, 92, 1, 1, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(145, 200, NULL, 12, 93, 1, 1, '2018-07-19 18:48:58', '2018-07-19 18:48:58'),
(146, 201, NULL, 126, 94, 1, 1, '2018-07-19 18:48:58', '2018-07-19 18:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `order_traces`
--

DROP TABLE IF EXISTS `order_traces`;
CREATE TABLE IF NOT EXISTS `order_traces` (
  `id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `trace_type` int(11) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_traces`
--

INSERT INTO `order_traces` (`id`, `order_id`, `trace_type`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 182, 1, 1, '2018-07-19 23:48:39', '2018-07-19 23:48:39'),
(2, 182, 2, 1, '2018-07-19 23:48:45', '2018-07-19 23:48:45'),
(3, 182, 5, 1, '2018-07-19 23:48:46', '2018-07-19 23:48:46'),
(4, 182, 3, 1, '2018-07-23 18:12:44', '2018-07-23 18:12:44');

-- --------------------------------------------------------

--
-- Table structure for table `pallet`
--

DROP TABLE IF EXISTS `pallet`;
CREATE TABLE IF NOT EXISTS `pallet` (
  `id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pall_box`
--

DROP TABLE IF EXISTS `pall_box`;
CREATE TABLE IF NOT EXISTS `pall_box` (
  `id` int(10) unsigned NOT NULL,
  `box_id` int(10) unsigned NOT NULL,
  `pallet_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `concept` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_per_piece` double(15,2) NOT NULL DEFAULT '0.00',
  `items_per_display` int(11) NOT NULL DEFAULT '0',
  `display_per_box` int(11) NOT NULL DEFAULT '0',
  `weight_per_display` double(15,2) NOT NULL DEFAULT '0.00',
  `weight_per_box` double(15,2) NOT NULL DEFAULT '0.00',
  `width` double(15,2) NOT NULL DEFAULT '0.00',
  `height` double(15,2) NOT NULL DEFAULT '0.00',
  `depth` double(15,2) NOT NULL DEFAULT '0.00',
  `barcode` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_barcode` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corrugated_barcode` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caducidad_minima` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4034 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `concept`, `alias`, `weight_per_piece`, `items_per_display`, `display_per_box`, `weight_per_display`, `weight_per_box`, `width`, `height`, `depth`, `barcode`, `display_barcode`, `corrugated_barcode`, `caducidad_minima`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3007, 'ACT-0101', 'PALOMITAS CARAMELO', 'Palom caramelo 184g', 1.00, 9, 1, 9.00, 9.00, 2.50, 5.00, 3.00, '76150420098', '7501006551129', '76150230345', 90, 1, '2018-06-13 15:54:40', '2018-07-17 17:28:18', NULL),
(3008, 'ACT-0102', 'PALOMITAS NATURAL', 'Palom natural - 99g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501006551044', '7501006555622', '17501006555629', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3009, 'ACT-0103', 'PALOMITAS MANTEQUILLA', 'Palom mantequilla - 99g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501006551051', '7501006555639', '17501006555636', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3010, 'ACT-0104', 'PALOMITAS MANTEQUILLA EXTRA', 'Palom mantequilla xt 99g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501006551068', '7501006555370', '17501006555377', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3011, 'ACT-0105', 'PALOMITAS REDUCIDAS EN GRASA', 'Palom reducidas grasa 99g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '7501006551075', '7501006555370', '17501006555377', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3012, 'ACT-0107', 'PALOMITAS CHAMOY', 'Palom chamoy - 99g', 1.00, 15, 1, 15.00, 15.00, 2.50, 5.00, 3.00, '7501006555578', '7501006555585', '17501006555582', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3013, 'ACT-0108', 'PALOMITA NAT LINTERNA VERDE', 'Palom nat L Verde 99g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '7501006556223', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3014, 'ACT-0109', 'PALOMITA NATURAL OPTIMUS', 'Palom natural OP- 85g', 1.00, 14, 1, 14.00, 14.00, 2.50, 5.00, 3.00, '7501006551044', '17501006556794', '27501006556791', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3015, 'ACT-0110', 'PALOMITA MANTEQUILLA OPTIMUS', 'Palom Manteq OP- 85g', 1.00, 14, 1, 14.00, 14.00, 2.50, 5.00, 3.00, '7501006551051', '17501006556800', '27501006556807', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3016, 'ACT-0111', 'PALOMITA EXTRA MANTEQUILLA OPTIMUS', 'Palom XT Manteq OP- 85g', 1.00, 14, 1, 14.00, 14.00, 2.50, 5.00, 3.00, '7501006551068', '17501006556817', '27501006556814', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3017, 'BAL-0101', 'MANGO ENCHILADO', 'Mango enchilado - 60g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7538129500604', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3018, 'BAL-0102', 'CACAHUATE ACARAMELADO', 'Cacahuate acaramelado 5kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501700501055', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3019, 'BRE-0101', 'TAPON MINI', 'Tapon Mini 50g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587035876', '', '10742587035873', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3020, 'BRE-0102', 'MALVAVISCO MINI', 'Malvavisco Mini 40g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587050732', '', '10742587050739', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3021, 'BRE-0103', 'FATS', 'Fats 60g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587041952', '', '10742587041959', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3022, 'BRE-0104', 'LENGUA DE GATO', 'Lengua Gato 90g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587033285', '', '10742587035873', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3023, 'BRE-0105', 'PASITAS PICASSO', 'Pasas 90g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587035081', '', '10742587035088', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3024, 'BRE-0106', 'CERECETS', 'Cerecet - 70g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587054099', '', '10742587054096', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3025, 'BRE-0107', 'CEREZAS AL LICOR 3 PZS', 'Cerezas 3 - 45g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587032059', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3026, 'BRE-0108', 'CEREZAS AL LICOR ALMOHADA', 'Cerezas almohada - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587044212', '', '10742587044219', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3027, 'BRE-0109', 'PASAS PICASSO (20)', 'Pasas 20 - 90g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587035081', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3028, 'BRE-0110', 'MALVAVISCO MINI (25)', 'Malvavisco Mini 25 - 40g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587050732', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3029, 'BRE-0111', 'LENGUAS DE GATO (15)', 'Lengua de gato 15 - 40g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587033285', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3030, 'BRE-0201', 'TAPON MINI GRANEL (1)', 'Tapon Mini G - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '742587040832', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3031, 'BRE-0202', 'CERECETS GRANEL', 'Cerecet - 1Kg', 1.00, 1, 10, 1.00, 10.00, 2.50, 5.00, 3.00, ' 7 ', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3032, 'CER-0101', 'MAZAPAN', 'Mazapan - 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '094789100020', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3033, 'CER-0201', 'CHOCOMAZAPAN', 'Chocomazapan - 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '094789100099', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3034, 'CHO-0101', 'CHOCO BITES COOKIES+CREAM', 'Choco Bites C+C - 40g', 1.00, 10, 8, 10.00, 80.00, 2.50, 5.00, 3.00, '7503023769006', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3035, 'CHO-0102', 'GUMMY BEARS+CHOCO', 'Gummy B+C - 40g', 1.00, 10, 8, 10.00, 80.00, 2.50, 5.00, 3.00, '7503023763013', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3036, 'CHO-0103', 'CACAHUATES+CHOCO', 'Cacahuates+Choco - 40g', 1.00, 10, 8, 10.00, 80.00, 2.50, 5.00, 3.00, '7503023769211', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3037, 'CHO-0201', 'ALQUIMIA RICE LECHE Y ARANDANO', 'Alquimia Rice  L y A - 22g', 1.00, 6, 8, 6.00, 48.00, 2.50, 5.00, 3.00, '7503023769426', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3038, 'CHO-0202', 'ALQUIMIA RICE SEMIAMARGO Y NUEZ', 'Alquimia Rice  S Y N - 22g', 1.00, 6, 8, 6.00, 48.00, 2.50, 5.00, 3.00, '7503023769433', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3039, 'CHO-0203', 'GRANOS CAFE SEMIAMARGO EXPRESSO', 'Granos Cafe S E - 96g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503023769365', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3040, 'CHO-0204', 'GRANOS CAFE CAPUCHINO LECHE', 'Granos Cafe C L - 96g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503023769372', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3041, 'DIE-0101', 'CAFE MOLIDO CAFEINADO', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8003866012011', '', '18003866012018', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3042, 'DIE-0102', 'CAFE COLECCION LATA VERDE MOLIDO', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341439', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3043, 'DIE-0103', 'CAFE COLECCION LATA ROJA MOLIDO', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341446', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3044, 'DIE-0201', 'CAFE ORO C/CAFEINA MOLIDO', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8003866016095', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3045, 'DIE-0301', 'CAFE WHITE MOLIDO S/CAFEINA', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8003866010017', '', '18003866010014', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3046, 'DLR-0102', 'MAZAPAN CHOCOLATE', 'Mazapan Chod - 25g', 1.00, 16, 24, 16.00, 384.00, 2.50, 5.00, 3.00, '724869011006', '724869001007', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3047, 'DLR-0103', 'MAZAPAN GIGANTE', 'MAZAPAN GIG - 50g', 1.00, 20, 16, 20.00, 320.00, 2.50, 5.00, 3.00, '7,24869E+11', '7,24869E+11', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3048, 'DLR-0201', 'PULPARINDO GRANDE', 'Pulparindo Gde - 14g', 1.00, 20, 32, 20.00, 640.00, 2.50, 5.00, 3.00, '7,25226E+11', '7,25226E+11', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3049, 'DLR-0202', 'PULPARINDO GIGANTE', 'Pulparindo gigante - 28g', 1.00, 16, 20, 16.00, 320.00, 2.50, 5.00, 3.00, '7,25226E+11', '7,25226E+11', '1,07252E+13', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3050, 'DLR--0202', 'PULPARINDO GIGANTE', 'Pulparindto gig - 28g', 1.00, 16, 20, 16.00, 320.00, 2.50, 5.00, 3.00, '', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3051, 'DLR-0203', 'PULPARINDOTS', 'Pulparindots - 30g', 1.00, 20, 16, 20.00, 320.00, 2.50, 5.00, 3.00, '7,25226E+11', '7,25226E+11', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3052, 'DLR-0204', 'PULPARINDO PUSH', 'Pulparindo Push - 35g', 1.00, 12, 18, 12.00, 216.00, 2.50, 5.00, 3.00, '725226003191', '725226003399', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3053, 'DOT-0101', 'AMORCITO CORAZON', 'Amorcito C. - 480G', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214092', '', '17503018214099', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3054, 'DOT-0102', 'BESAME MUCHO', 'Besame M. - 480G', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214030', '', '17503018214037', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3055, 'DOT-0103', 'CHELADOTA', 'Cheladota - 480G', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214061', '', '17503018214068', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3056, 'DOT-0104', 'DOT COLA', 'Dot Cola - 480G', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214047', '', '17503018214044', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3057, 'DOT-0105', 'FRESA MARAVILLA', 'Fresa M. - 480G', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214078', '', '17503018214075', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3058, 'DOT-0106', 'LABIOS ROJOS', 'Labios R. - 480G', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214023', '', '17503018214020', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3059, 'DOT-0107', 'MI MEDIA SANDIA', 'Mi media S. - 480G', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214054', '', '17503018214051', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3060, 'DOT-0108', 'PINTA BLUE', 'Pinta Blue - 480G', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214085', '', '17503018214082', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3061, 'DOT-0109', 'QUE TRAVIESOS', 'Que Traviesos - 480G', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214016', '', '17503018214013', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3062, 'DOT-0110', 'MARANGO MANGO FURIOSO', 'Manrango Mango F - 480g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214139', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3063, 'DOT-0111', 'DINO PEPINO FURIOSO', 'Dino Pepino F - 480g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3064, 'DOT-0112', 'NACHO MOSTACHO', 'Nacho Mostacho - 480g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3065, 'DOT-0113', 'MI MEDIA SANDIA FURIOSA', 'Mi Media Sandia F - 480g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214221', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3066, 'DOT-0114', 'CHATO PULGON MENTA-CEREZA', 'Chato Pulgon M C - 690g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214122', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3067, 'DOT-0115', 'CHATO PULGON LIPTUS', 'Chato Pulgon L. - 690g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214122', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3068, 'DOT-0116', 'CHILOVER', 'Chilover - 480g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214160', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3069, 'DOT-0117', 'CORAZON VALIENTE', 'Corazon Valiente - 480g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503018214177', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3070, 'EFR-0101', 'ORUGAS ACIDAS', NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8437003969744', '8437005297180', '18437003969741', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3071, 'EFR-0102', 'ORUGAS NEON', NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8437003969751', '8437005297197', '18437003969758', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3072, 'EFR-0103', 'AROS DE DURAZNO', 'Aros Durazno - 50g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8437003969737', '8437005297821', '18437003969734', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3073, 'EFR-0104', 'OSOS', 'Osos - 50g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8437003969768', '8437005297203', '18437003969765', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3074, 'EFR-0201', 'ORUGAS ACIDAS', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8437003969485', '', '38437003969486', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3075, 'EFR-0202', 'ORUGAS NEON', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8437003969492', '', '38437003969493', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3076, 'EFR-0203', 'PULPOS', 'Pulpos - 125g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8437004904911', '', '38437004904912', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3077, 'EFR-0204', 'AROS DE DURAZNO', 'Aros Durazno - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8437005297753', '', '38437005297754', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3078, 'EFR-0205', 'OSOS', 'Osos - 125g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8437003969508', '', '38437003969509', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3079, 'EFR-0206', 'FISH MIX', 'Fish Mix - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '677840500252', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3080, 'EFR-0207', 'YOGURTH', 'Yogurth - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '677840500252', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3081, 'EFR-0208', 'PULPOS ACIDOS', 'Pulpos Acidos - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036187699', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3082, 'EFR-0209', NULL, NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036189952', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3083, 'EFR-0210', 'ORUGAS ACIDAS (100)', 'Orugas Acidas - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036187620', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3084, 'EFR-0211', 'ORUGAS NEON (100)', 'Orugas Neon - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036187637', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3085, 'EFR-0212', 'PULPOS (100)', 'Pulpos - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036187644', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3086, 'EFR-0213', 'OSOS (100)', 'Osos - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036187651', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3087, 'EFR-0214', 'SANDIAS (100)', 'Sandias - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436556392689', '', '38436556392680', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3088, 'EFR-0215', 'TARANTULAS (100)', 'Tarantulas - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436556392672', '', '38436556392673', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3089, 'EFR-0301', 'ORUGA NEON', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '25015539', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3090, 'EFR-0302', 'OSOS', 'Osos - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '25015515', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3091, 'EFR-0303', 'PULPOS', 'Pulpos - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050037669822', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3092, 'EFR-0304', 'PULPOS ACIDOS', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341477', '', '18436036187733', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3093, 'EFR-0305', 'ANILLOSOS', 'Anillosos - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341507', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3094, 'EFR-0306', 'RENACUAJOS', 'Renacuajos - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341514', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3095, 'EFR-0307', 'ORUGAS ACIDAS', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341521', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3096, 'EFR-0308', 'CULEBRAS', 'Culebras - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341538', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3097, 'EFR-0309', 'YOGURTH', 'Yogurth - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050037051290', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3098, 'EFR-0310', 'PLAYMOUSE', 'Playmouse - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050037051320', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3099, 'EFR-0311', 'MINI SOUR GECKO', 'Mini Sour Gecko - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050057385467', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3100, 'EFR-0312', 'LOVE MIX', 'Love Mix - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050057385948', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3101, 'EFR-0313', 'CIEN PIES', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050057386105', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3102, 'EFR-0314', 'CARAMELOS', 'Caramelos - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050057386112', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3103, 'EFR-0315', 'PRETZEL BRILLOSO', 'Pretzel Brilloso - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050058524032', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3104, 'EFR-0316', 'PRETZEL ACIDO', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050058524049', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3105, 'EFR-0317', 'AROS TROPICALES', 'Aros Tropicales - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050058455664', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3106, 'EFR-0318', 'BESITOS DE COCO', 'Besitos Coco - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050058455671', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3107, 'EFR-0319', 'BESITOS DE MORAS', 'Besitos Moras - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050058455688', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3108, 'EFR-0320', 'CIEN PIES ACIDOS', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050058455695', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3109, 'EFR-0321', 'CARAMELOS ACIDOS', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050058455701', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3110, 'EFR-0322', 'TIBURONES ACIDOS', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050058455718', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3111, 'EFR-0323', 'FRESON', 'Freson - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036189013', '', '18436036189010', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3112, 'EFR-0324', 'LEE - MON', 'Lee mon - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036189020', '', '18436036189027', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3113, 'EFR-0325', 'WITZY', 'Witzy - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036189037', '', '18436036189034', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3114, 'EFR-0326', 'CATERPILLARS', 'Caterpillars - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036189044', '', '18436036189041', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3115, 'EFR-0327', 'FUTBOL MIX', 'Futbol Mix - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036189198', '', '1843603618919', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3116, 'EFR-0328', 'PATOS', 'Patos - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036189433', '', '18436036189430', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3117, 'EFR-0329', NULL, NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036189426', '', '18436036189423', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3118, 'EFR-0330', 'ANACONDAS', 'Anacondas - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036187866', '', '18436036187863', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3119, 'EFR-0331', 'BLOB', 'Blob - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036180447', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3120, 'EFR-0332', 'AROS DE SANDIA', 'Aros de Sandia - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036180836', '', '1843603618083', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3121, 'EFR-0333', 'CULEBRAS ACIDAS', 'Culebras Acidas - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036180843', '', '18436036180840', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3122, 'EFR-0334', 'ORCAS', 'Orcas - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036188863', '', '1843603618888', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3123, 'EFR-0335', 'DIENTES', 'Dientes - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036188207', '', '1843603618820', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3124, 'EFR-0336', 'HUEVITOS FRITOS', 'Huevitos Fritos - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036188887', '', '1843603618888', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3125, 'EFR-0337', 'BESITOS DE FRESA', 'Besitos de Fresa - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036181864', '', '1843603618186', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3126, 'EFR-0338', 'BESITOS DE FRESA MINIS', 'Besitos de Fresa M- 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436036188214', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3127, 'EFR-0339', 'REBANADAS SANDIA', 'Rebanadas Sandia - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436556391828', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3128, 'EFR-0341', 'CONCHITAS DE MAR', 'Conchitas de Mar - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436556392771', '', '18436556392778', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3129, 'EFR-0343', 'LETRAS', 'Letras - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8436556392788', '', '18436556392785', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3130, 'EFR-0344', 'GAJOS DE NARANJA', 'Gajos de Naranja - 1Kg', 1.00, 1, 6, 1.00, 6.00, 2.50, 5.00, 3.00, '8436036180690', '', '18436036180697', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3131, 'EFR-0401', 'LUNCH BAG', 'Lunch Bag - 77g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '813805002298', '', '10813805002295', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3132, 'EFR-0402', 'SOUR GECKO', 'Sour Gecko - 88g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '677840503758', '', '677840503826', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3133, 'EFR-0403', 'MINI BURGER', 'Mini Burger - 70g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '813805002526', '', '10813805002523', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3134, 'EFR-0404', 'HOT DOG', 'Hot Dog - 70g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '813805002540', '', '10813805002547', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3135, 'EFR-0405', 'MINI BURGER GRANEL', 'Mini Burger - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411816', '', '17502245411813', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3136, 'EFR-0406', 'HOT DOG GRANEL', 'Hot dog - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411823', '', '17502245411820', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3137, 'EFR-0501', 'MANGO TROPICAL', 'Mango tropical - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '4003084133134', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3138, 'EFR-0502', NULL, NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '4003084133141', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3139, 'EFR-0503', 'GROSELLAS', 'Grosellas - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '4003084133158', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3140, 'EFR-0601', 'CARACOLES', 'Caracoles - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050059394436', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3141, 'EFR-0602', 'SANDIAS', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050059394467', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3142, 'EFR-0603', 'RANAS', 'Ranas - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050059394474', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3143, 'EFR-0701', 'VITRO GUMMIES PULPOS ACIDOS', 'Vitro Pulpos Ac - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411052', '', '1750224541105 9', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3144, 'EFR-0702', 'VITRO GUMMIES AROS TROPICALES', 'Vitro A. Tropical - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411069', '', '17502245411066', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3145, 'EFR-0703', 'VITRO GUMMIES WITZY', 'Vitro Witzy - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411076', '', '17502245411073', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3146, 'EFR-0704', 'VITRO GUMMIES CATERPILLARS', 'Vitro Caterpillar - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411083', '', '17502245411080', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3147, 'EFR-0705', 'VITRO GUMMIES PATOS', 'Vitro Patos - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411090', '', '17502245411097', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3148, 'EFR-0706', NULL, NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411106', '', '17502245411103', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3149, 'EFR-0707', 'VITRO GUMMIES MANGO TROPICAL', 'Vitro Mango Trop - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411113', '', '17502245411110', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3150, 'EFR-0708', NULL, NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411120', '', '17502245411127', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3151, 'EFR-0709', 'VITRO GUMMIES GROSELLAS', 'Vitro Grosellas - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411137', '', '17502245411134', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3152, 'FER-0101', 'FERRERO ROCHER 3 PACK', 'Ferrero R. 3 pack', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '78909434', '8000500116869', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3153, 'FER-0102', 'KINDER DELICE', 'Kinder Delice - 42g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '80052463', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3154, 'FER-0103', 'KINDER BUENO', 'Kinder Bueno - 43g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '80052760', '789742191824', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3155, 'FRA-0101', 'BOB ESPONJA LOLLIPOP RING', 'B Esponja lolli ring 20g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '41376102332', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3156, 'FRU-0101', 'PALETA FRULER DISPLAY TAMARINDO', 'Fruler tamarindo 35g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7503007884046', '7503007884183', '17503007884180', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3157, 'FRU-0102', NULL, NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7503007884022', '7503007884220', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3158, 'FRU-0103', 'PALETA FRULER DISPLAY MANGO', 'Fruler mango 35g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7503007884015', '7503007884206', '17503007884203', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3159, 'FRU-0104', 'PALETA FRULER DISPLAY FRESA', 'Fruler fresa 35g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7503007884121', '7503007884534', '17503007884531', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3160, 'FRU-0201', 'PALETA FRULER 3 PACK TAMARINDO', 'Fruler 3pack tamarindo 105g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503007884633', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3161, 'FRU-0202', 'PALETA FRULER 3 PACK MANGO', 'Fruler 3pack Mango 105g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503007884626', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3162, 'FRU-0203', 'PALETA FRULER 3 PACK FRESA', 'Fruler 3pack Fresa 105g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503007884619', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3163, 'FRU-0204', 'PALETA FRULER MINI 5 PACK MANGO', 'Fruler m. 5 pack mango 90g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503007884718', '', '17503007884715', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3164, 'FRU-0205', 'PALETA FRULER MINI 15 PACK MANGO', 'Fruler m. 15 pack mango 270g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503007884916', '', '17503007884913', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3165, 'FRU-0301', 'PALETA FRULER MANGO MINI', 'Fruler Mango Mini - 180g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503007884536', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3166, 'FRU-0302', 'PALETA FRULER MANGO MINI TIRA', 'Fruler Mango Mini Tr - 180g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503007884640', '', '17503007884647', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3167, 'FRU-0401', 'FRULER MANGO CON CHILE GRANEL', 'Fruler Granel - 1 Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503007884701', '', '1750300784708', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3168, 'GAL-0101', 'QUESO GALLO PORCIONES', 'Queso Gallo porciones 140g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '87181982', '', '10000087181989', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3169, 'GAL-0102', 'QUESO GALLO PORCIONES 3 PACK', 'Queso Gallo porc 3 pk 420g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341149', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3170, 'GAL-0103', 'QUESO EDAM BOLA', 'Queso Edam Bola - 1.6kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8713300432861', '', '18713300432868', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3171, 'GAL-0104', 'QUESO EDAM BOLA KG', 'Queso Edam Bola kg - 1.5kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8713300432861', '', '18713300432868', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3172, 'GAL-0105', 'QUESO GALLO LATA', 'Queso Gallo lata - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501541903001', '', '17501541903008', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3173, 'GAL-0106', 'QUESO EDAM BOLA BABY', 'Queso Edam Bola baby 800g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411694', '', '17502245411691', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3174, 'GAL-0107', 'QUESO PATAGRAS', 'Queso Patagras - 4.5Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411380', '', '17502245411387', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3175, 'GAL-0108', 'QUESO EDAM BOLA BABY KG', 'Queso Edam Bola baby Kg - 800g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341552', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3176, 'GAL-0109', 'QUESO PATAGRAS KG', 'Queso Patagras kg - 4Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411380', '', '17502245411387', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3177, 'GAL-0110', NULL, NULL, 1.00, 1, 10, 1.00, 10.00, 2.50, 5.00, 3.00, '8710912046776', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3178, 'GRE-0101', 'HUEVO PRINCESAS', 'Huevo Princesas - 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506032105643', '', '7506032105643', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3179, 'GRE-0102', 'HUEVO WINNE POOH', 'Huevo Winne Pooh - 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506032105612', '', '7506032105612', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3180, 'GRE-0103', 'HUEVO HADAS', 'Huevo Hadas - 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506032104257', '', '7506032104257', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3181, 'GRE-0104', 'HUEVO BOB ESPONJA', 'Huevo Bob Esponja - 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506161205894', '', '7506161205894', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3182, 'GRE-0105', 'HUEVO CARS', 'Huevo Cars - 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506161206129', '', '7506161206129', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3183, 'GRE-0106', 'HUEVO MARVEL HEROES', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506161206082', '', '7506161206082', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3184, 'GRE-0107', 'HUEVO DISTROLLER', 'Huevo Distroller - 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506161206273', '', '7506161206273', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3185, 'GRE-0108', 'HUEVO BEN 10', 'Huevo Ben 10 - 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506161206679', '', '7506161206679', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3186, 'GRE-0109', 'HUEVO TRON', 'Huevo Tron - 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506161206945', '', '7506161206945', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3187, 'GRE-0110', 'HUEVO TOY STORY', 'Huevo Toy Story - 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506161206389', '', '7506161206389', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3188, 'GRE-0111', 'HUEVO PHINEAS & FERB', 'Huevo P. Ferb - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161207867', '7506161207553', '27506161207557', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3189, 'GRE-0112', 'HUEVO DORA LA EXPLORADORA', 'Huevo Dora - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161207874', '7506161207560', '27506161207564', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3190, 'GRE-0113', 'HUEVO MONSTER INC.', 'Huevo Monster - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161208659', '7506161208703', '27506161208707', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3191, 'GRE-0114', 'HUEVO AVIONES', 'Huevo Aviones - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161208956', '7506161208987', '27506161208981', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3192, 'GRE-0115', 'HUEVO MI VILLANO FAVORITO 2', 'Huevo M Villano F - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161209090', '7506161209120', '27506161209124', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3193, 'GRE-0116', 'HUEVO PRINCESAS 8/12', 'Huevo Princesas 8/12 - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506032105643', '7506032105636', '27506032105630', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3194, 'GRE-0117', 'HUEVO CARS 8/12', 'Huevo Cars 8/12 - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161206129', '7506161206174', '27506161206178', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3195, 'GRE-0118', 'HUEVO MARVEL HEROES 8/12', 'Huevo M Heroes 8/12 - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161206082', '7506161206181', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3196, 'GRE-0119', 'HUEVO TOY STORY 8/12', 'Huevo Toy Story 8/12 - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161206389', '7506161206365', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3197, 'GRE-0120', 'HUEVO JAKE Y LOS PIRATAS', 'Huevo Jake y los piratas 8/12 - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161209663', '7506161206181', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3198, 'GRE-0121', 'HUEVO STAR WARS 8/12', 'Huevo Star wars 8/12 - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161209038', '7506161206181', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3199, 'GRE-0122', 'HUEVO AVENTURAS EN EL TIEMPO 8/12', 'Huevo Aventuras en el T. 8/12 - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161209380', '7506161209410', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3200, 'GRE-0123', 'HUEVO PEPA PIG 8/12', 'Huevo Pepa Pig - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161209953', '7506161209984', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3201, 'GRE-0124', 'HUEVO MINNIE 8/12', 'Huevo Minnie - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161209748', '7506161209779', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3202, 'GRE-0125', 'HUEVO DRA JUGUETES 8/12', 'Huevo Dra Juguetes - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161209700', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3203, 'GRE-0126', 'HUEVO INTENSA MENTE 8/12', 'Huevo Intensa mente - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161214803', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3204, 'GRE-0127', 'HUEVO REY LEON 8/12', 'Huevo R Leon - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161215527', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3205, 'GRE-0128', 'BUSCANDO A DORY 8/12', 'Buscando a Dory - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161216050', '7506161216081', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3206, 'GRE-0129', 'HUEVO MASCOTAS 8/12', 'Huevo Mascotas - 20g', 1.00, 12, 8, 12.00, 96.00, 2.50, 5.00, 3.00, '7506161215688 ', '7506161215718 ', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3207, 'GRE-0130', 'HUEVO TROLLS 8/12', 'Huevo Trolls - 20g', 1.00, 12, 8, 12.00, 96.00, 2.50, 5.00, 3.00, '7506161216586 ', '7506161208703 ', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3208, 'GRE-0131', 'HUEVO PAW PATROL 8/12', 'Huevo P. Patrol - 20g', 1.00, 12, 8, 12.00, 96.00, 2.50, 5.00, 3.00, '7506161218672', '7506161218702', '27506161218706', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3209, 'GRE-0201', 'TUBO GOMITAS PRINCESAS', 'Tubo Gom Princesas 10g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161208086', '7506161208116', '17506032110507', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3210, 'GRE-0202', 'TUBO GOMITAS CARS', 'Tubo Gom Cars 10g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161208093', '7506161208123', '17506032589013', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3211, 'GRE-0203', 'TUBO GOMITAS TOY STORY', 'Tubo Gom Toy Story 10g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161208109', '7506161208130', '17506032589013', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3212, 'GRE-0301', 'HUEVO PLASTICO PRINCESAS', 'Huevo Gde Princesas 10g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161207768', '7506161208000', '7506481652552', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3213, 'GRE-0302', 'HUEVO PLASTICO CARS', 'Huevo Gde Cars 10g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161207775', '7501612080174', '7506160001558', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3214, 'GRE-0303', 'HUEVO PLASTICO TOY STORY', 'Huevo Gde Toy Story 10g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161207782', '75061661208024', '7506194857657', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3215, 'GRE-0304', 'HUEVO PLASTICO LITTLE PET SHOP', 'Huevo Gde Litte Pet Shop 10g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7795874123322', '7795874123339', '7506125849454', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3216, 'GRE-0305', 'HUEVO PLASTICO DORA Y DIEGO', 'Huevo Gde Dora y Diego - 12g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506161207829', '7506161208321', '17506161208328', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3217, 'GUA-0101', 'MALVAVISCO CHOCOMENTA GUANDY', 'Malvavisco Chocomenta G - 100g', 1.00, 1, 24, 1.00, 24.00, 2.50, 5.00, 3.00, '760203005645', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3218, 'GUA-0102', 'MALVAVISCO CAPUCCINO GUANDY', 'Malvavisco Capuccino G - 100g', 1.00, 1, 24, 1.00, 24.00, 2.50, 5.00, 3.00, '760203009346', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3219, 'GUA-0103', 'MALVAVISCO LIMONCELLO GUANDY', 'Malvavisco Limoncello G - 100g', 1.00, 1, 24, 1.00, 24.00, 2.50, 5.00, 3.00, '760203009339', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3220, 'GUA-0901', NULL, 'Bota Nav, Guandy - 125g', 1.00, 1, 30, 1.00, 30.00, 2.50, 5.00, 3.00, '760203007991', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3221, 'HER-0101', 'HERSHEYS LECHE', 'HE leche - 40g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024511310', '', '17501024511317', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3222, 'HER-0102', 'HERSHEYS ALMENDRA', 'HE almendra 38g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024513314', '', '17501024513311', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3223, 'HER-0103', 'COOKIES & CREAM BARRA', 'Cookies&Cream barra 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024523412', '', '17501024523419', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3224, 'HER-0104', 'COOKIES & CREME BARRA', 'Cookies&Creme barra 43g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '75011192', '', '17501024579812', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3225, 'HER-0105', 'SPECIAL DARK BARRA', 'Special Dark barra 41g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024501007', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3226, 'HER-0106', 'HERSHEYS EXTRA CREAMY MILK C/ALMOND TOFEE', 'HE xt creamy mlk c/alm 40g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024511396', '', '07501024511372', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3227, 'HER-0107', 'HERSHEYS FIVE PACK', 'HE five pack - 34g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024529544', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3228, 'HER-0108', 'HERSHEYS LECHE BARRA', 'HE leche barra 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024541423', '', '17501024541420', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3229, 'HER-0109', 'RESSE''S CRUNCHY CUP AVELLANA', 'Resse''s Crunchy avell 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024592203', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3230, 'HER-0110', 'RESSE''S CRUNCHY CUP CACAHUATE', 'Resse''s Crunchy cacah 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024592005', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3231, 'HER-0111', 'HERSHEYS SMOOTH BUBBLES', 'HE smooth bubbles 40g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024533008', '', '17501024533005', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3232, 'HER-0112', 'HERSHEYS ALMENDRA KING SIZE', 'Hersheys Almendra Ks - 60g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024544295', '7501024544301', '27501024544305', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3233, 'HER-0113', 'HERSHEYS COOKIES N CREME KING SIZE', 'Hersheys CNC Ks - 60g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024524556', '7501024524563', '27501024524567', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3234, 'HER-0114', 'KRACKEL BARRA', 'Krackel - 40g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024512348', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3235, 'HER-0115', 'HERSHEYS LECHE 4/6', 'HE leche 6/4 - 40g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501024511310', '7501024541393', '2750102454139', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3236, 'HER-0116', 'HERSHEYS ALMENDRA 4/6', 'HE Alm 4/6 38g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501024513314', '7501024513369', '2750102451336', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3237, 'HER-0117', 'HERSHEYS COOKIES & CREME BARRA 4/6', 'Hersheys C&C 4/6 43g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '75011192', '7501024512423', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3238, 'HER-0118', 'HERSHEYS LECHE 100', 'HE leche 100 - 100g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501024541423', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3239, 'HER-0119', 'HERSHEYS ALMENDRA 100', 'HE Alm 100 - 100g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501024544325', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3240, 'HER-0120', 'HERSHEYS COOKIES & CREME BARRA 100', 'Hersheys C&C 100 - 100g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024523412', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3241, 'HER-0121', 'BARRA HERSHEYS CHOCOYOGO MANGO', 'Chocoyogo Mango 20g', 1.00, 12, 6, 12.00, 72.00, 2.50, 5.00, 3.00, '7501024515141 ', '7501024515134 ', '27501024515138 ', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3242, 'HER-0122', 'BARRA HERSHEYS CHOCOYOGO FRESA', 'Chocoyogo Fresa 20g', 1.00, 12, 6, 12.00, 72.00, 2.50, 5.00, 3.00, '7501024515127 ', '7501024515110 ', '27501024515114 ', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3243, 'HER-0123', 'MINIATURAS BOLSA', 'MIN bolsa - 850g', 1.00, 1, 5, 1.00, 5.00, 2.50, 5.00, 3.00, '7,50102E+12', '', '1,7501E+13', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3244, 'HER-0125', 'RESSE''S COPA CREMA CACAHUATE', 'Resse''s Crema Cacahuate 39.6g', 1.00, 12, 6, 12.00, 72.00, 2.50, 5.00, 3.00, '7501024592517', '7501024592500', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3245, 'HER-0201', 'BITES COOKIES & CREME', 'Bites Cookies&Creme 43g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024523788', '7501024500031', '17501024523785', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3246, 'HER-0202', 'BITES COOKIES & CREME', 'Bites Cookies&Creme 150g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024523795', '', '17501024523792', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3247, 'HER-0203', 'BITES C/ALMENDRA', 'Bites c/almendra - 43g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024523801', '7501024500048', '17501024523808', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3248, 'HER-0204', 'BITES CLASSIC', 'Bites Classic - 43g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024524211', '7501024524204', '27501024524208', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3249, 'HER-0205', 'BITES CLASSIC', 'Bites Classic - 150g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024524228', '', '17501024524225', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3250, 'HER-0206', 'BITES DARK', 'Bites Dark - 43g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024524242', '7501024524235', '27501024524239', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3251, 'HER-0207', 'BITES DARK', 'Bites Dark - 150g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024524259', '', '17501024524256', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3252, 'HER-0208', 'BITES KING SIZE COOKIES AND CREME', 'Bites KS C&C - 60g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024576210', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3253, 'HER-0209', 'BITES KING SIZE DARK', 'Bites KS Dark - 60g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024576234', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3254, 'HER-0210', 'BITES KING SIZE KRACKEL', 'Bites KS Krackel - 60g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024576258', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL);
INSERT INTO `products` (`id`, `sku`, `concept`, `alias`, `weight_per_piece`, `items_per_display`, `display_per_box`, `weight_per_display`, `weight_per_box`, `width`, `height`, `depth`, `barcode`, `display_barcode`, `corrugated_barcode`, `caducidad_minima`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3255, 'HER-0211', 'BITES COOKIES AND CREME', 'Bites C&C - 138g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024576159', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3256, 'HER-0212', 'BITES ALMENDRAS', 'Bites alm - 138g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024576166', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3257, 'HER-0213', 'BITES LECHE', 'Bites Leche - 138g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024576180', '', '', NULL, 1, '2018-06-13 15:54:40', '2018-06-13 15:54:40', NULL),
(3258, 'HER-0214', 'BITES DARK', 'Bites Dark - 138g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024576173', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3259, 'HER-0215', 'BITES KRACKEL', 'Bites Krackel - 138g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024576197', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3260, 'HER-0301', 'ICE BREAKERS FRUIT SOURS', 'Ice Break Fruit sours 13g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024512003', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3261, 'HER-0302', 'ICE BREAKERS BERRY SOURS', 'Ice Break Berry sours 13g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024512034', '7501024512041', '27501024511969', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3262, 'HER-0303', 'ICE CUBES MORAS', 'Ice Cubes moras - 23g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '75028459', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3263, 'HER-0304', 'ICE CUBES YERBABUENA', 'Ice Cubes yerbabuena - 23g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '75025687', '7501024516025', '27501024516029', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3264, 'HER-0305', 'ICE CUBES MENTA', 'Ice Cubes menta - 23g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '75025694', '7501024516001', '27501024516005', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3265, 'HER-0401', 'KISSABLES', 'Kissables - 30g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024528493', '7501024528486', '27501024528480', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3266, 'HER-0402', 'KISSES BOLSA', 'KIS bolsa - 850g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024529872', '', '17501024529879', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3267, 'HER-0403', 'KISSES CAJA DE REGALO', 'KIS caja de regalo - 80g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024527731', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3268, 'HER-0404', 'KISS JUNIOR REGULAR', 'KIS Junior regular 41.4g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '75020149', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3269, 'HER-0405', 'KISSES SE CEREZA', 'KIS s.esp cereza 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024546138', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3270, 'HER-0406', 'KISSES SE ITALIANO', 'KIS s.esp italiano 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024546190', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3271, 'HER-0407', 'KISSES SE CARAMELO', 'KIS s.esp caramelo 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024583003', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3272, 'HER-0408', 'KISSES ALMENDRA BOLSA', 'KIS ALM bolsa - 850g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024528998', '', '17501024528995', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3273, 'HER-0409', 'KISSES COOKIES & CREAM BOLSA', 'KIS C&C bolsa - 850g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024523450', '', '17501024523457', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3274, 'HER-0410', 'KISSES COOKIES & CREAM', 'KIS C&C - 140g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024524082', '', '17501024524089', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3275, 'HER-0411', 'KISSES LECHE GRANEL', 'KIS bolsa - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024529872', '', '17501024529879', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3276, 'HER-0412', 'KISSES ALMENDRA GRANEL', 'KIS ALM bolsa - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024528998', '', '17501024528995', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3277, 'HER-0413', 'KISSES COOKIES & CREAM GRANEL', 'KIS C&C bolsa - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024523450', '', '17501024524089', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3278, 'HER-0414', 'KISS JR', 'KIS Jr - 41.4g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '75020149', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3279, 'HER-0415', 'KISSES ESTUCHE FIORI', 'KIS Fiori - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024522927', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3280, 'HER-0416', 'KISSES MILK', 'Kiss Milk - 36g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024545520', '7501024545513', '27501024545517', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3281, 'HER-0417', 'KISS GIGANTE LECHE', 'Kiss G Leche -198g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024527816', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3282, 'HER-0418', 'KISS GIGANTE ALMENDRA', 'Kiss G Alm -196g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024527823', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3283, 'HER-0419', 'KISSES FRASCO LECHE', 'Kisses F Leche -212g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '75012045', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3284, 'HER-0420', 'KISSES FRASCO ALMENDRA', 'Kisses F Alm -216g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '75012076', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3285, 'HER-0421', 'KISSES SE SURTIDO CHANEL', 'KISS SE Chanel 262.2g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024546428', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3286, 'HER-0422', 'KISSES SE DARK', 'KIS s.esp dark 120g', 1.00, 1, 6, 1.00, 6.00, 2.50, 5.00, 3.00, '7501024546442', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3287, 'HER-0423', 'KISSES SE HUGS', 'KIS s.esp Hugs 120g', 1.00, 1, 6, 1.00, 6.00, 2.50, 5.00, 3.00, '7501024546435', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3288, 'HER-0424', 'KISSES SE EXPRESSO', 'KIS s.esp expresso 120g', 1.00, 1, 6, 1.00, 6.00, 2.50, 5.00, 3.00, '7501024546213 ', '', '1750102454621 ', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3289, 'HER-0425', 'MINIATURAS BOLSA GRANEL', 'MIN bolsa - 1Kg', 1.00, 1, 5, 1.00, 5.00, 2.50, 5.00, 3.00, '7,50102E+12', '', '1,7501E+13', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3290, 'HER-0501', 'BROOKISE GRANADA', 'Brookside Gra. - 200g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024512522', '', '17501024512529', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3291, 'HER-0502', 'BROOKISE ARANDANO', 'Brookside Arand. - 200g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024512539', '', '17501024512529', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3292, 'HER-0503', 'BROOKSIDE GRANADA v2', 'Brookside Gra. - 198g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024512584', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3293, 'HER-0504', 'BROOKSIDE ARANDANO v2', 'Brookside Arand. - 198g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024512577', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3294, 'HER-0601', 'HERSHEYS COCOA LIMITED', 'Hersheys cocoa - 226g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024526291', '', '17501024526298', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3295, 'HER-0602', 'MINI KISSES SEMIAMARGO', 'Mini Kisses - 2.5 Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024529292', '', '17501024529299', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3296, 'HER-0701', 'JOLLY RANCHER MACIZO', 'Jolly R. Macizo - 34.2g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024528127', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3297, 'HER-0702', 'JOLLY RANCHER SUAVE', 'Jolly R. Suave - 33g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024562039', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3298, 'HER-0801', 'CAJA FUNDA CORAZON', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024525331', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3299, 'HER-0802', 'MINI TRAPECIO', 'Mini Trapecio - 80g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024525409', '', '27501024525366', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3300, 'HER-0803', 'LITTLE GIFT', 'Little Gift - 48g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7501024547111', '7501024525089', '27501024525083', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3301, 'HER-0804', 'BASTON CORAZON', NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024525423', '7501024525416', '27501024525410', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3302, 'HER-0805', 'CAJA VERTICAL CNC', 'Caja vertical cnc - 180g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024525386', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3303, 'HER-0806', 'MINI BOLSA POUCH 7', 'Mini bolsa pouch 7 - 84g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547197', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3304, 'HER-0807', 'KISSES CAJA CORAZON', 'KIS Caja Corazon - 160g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547401', '125', '17501024547408', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3305, 'HER-0808', 'KISSES CAJA ESTRELLA', 'KIS Caja Estrella - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024525348', '125', '17501024525345', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3306, 'HER-0809', 'KISSES LATA LAPICERA', 'KIS Lata Lapicera - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547425', '125', '17501024547422', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3307, 'HER-0810', 'CAJA MARIPOSA', 'Caja Mariposa - 32g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501024547845', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3308, 'HER-0811', 'CAJA VALENTINA', 'Caja Valentina - 104g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547814', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3309, 'HER-0812', 'CAJA CORAZON', 'Caja Corazon - 104g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547876', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3310, 'HER-0813', 'CAJA VENUS', 'Caja Venus - 100g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501024547890', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3311, 'HER-0814', 'CAJA SE CHANEL', 'Caja SE Chanel - 262.2g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024546374', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3312, 'HER-0815', 'CAJA DETALLE', 'Caja Detalle - 55.7g', 1.00, 1, 24, 1.00, 24.00, 2.50, 5.00, 3.00, '7501024548071', '', '17501024548078', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3313, 'HER-0816', 'SHARING BOXES', 'Shaking Boxes - 144g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7501024546855', '', '17501024546852', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3314, 'HER-0817', 'SV CAJA DETALLE', 'SV Caja Detalle - 56g', 1.00, 1, 24, 1.00, 24.00, 2.50, 5.00, 3.00, '7501024537648', '', '17501024537645', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3315, 'HER-0818', 'SV CAJA TRIANGULO', 'SV Caja Triangulo - 88g', 1.00, 1, 16, 1.00, 16.00, 2.50, 5.00, 3.00, '7501024548064', '7501024548057', '27501024548051', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3316, 'HER-0819', 'SV CAJA LUXURY', 'SV Caja Luxury - 184g', 1.00, 1, 16, 1.00, 16.00, 2.50, 5.00, 3.00, '7501024546930', '', '17501024546937', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3317, 'HER-0901', 'KISSES CAJA PRISMA', 'KIS caja prisma - 68g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7501024527762', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3318, 'HER-0902', 'KISSES BASTON TRADICIONAL', NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024523481', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3319, 'HER-0903', 'KISSES CAJA', 'KIS caja - 150g', 1.00, 9, 1, 9.00, 9.00, 2.50, 5.00, 3.00, '7501024547289', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3320, 'HER-0904', 'KISSES LATA SANTA', 'KIS latas santa - 200g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547296', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3321, 'HER-0905', NULL, NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024525553', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3322, 'HER-0906', 'KISS JR EDICION LIMITADA', NULL, 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '75035686', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3323, 'HER-0907', 'KISSES SELECCION ESPECIAL CREMA SUIZA', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547326', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3324, 'HER-0908', 'KISSES SELECCION ESPECIAL SURTIDO', 'KIS s.esp surt 280g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024546602', '', '1750102454660', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3325, 'HER-0909', 'LATA RECTANGULAR', 'Lata rectangular - 150g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547180', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3326, 'HER-0910', 'BASTON OSO', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024529964', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3327, 'HER-0911', 'CAJA DESEOS', 'Caja Deseos - 180g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024525171', '', '17501024525178', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3328, 'HER-0912', 'CAJA TWIST', 'Caja Twist - 60g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7501024546534', '7501024546527', '27501024546521', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3329, 'HER-0913', 'CAJA TARJETA', 'Caja Tarjeta - 140g', 1.00, 9, 1, 9.00, 9.00, 2.50, 5.00, 3.00, '7501024546558', '7501024547012', '17501024546555', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3330, 'HER-0914', 'LATA MINIATURA', 'Caja Minuatura - 136g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024546589', '', '17501024546586', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3331, 'HER-0915', 'KISSES LATA', 'KIS Lata - 60g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024546619', '', '17501024546616', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3332, 'HER-0916', 'KISS JR NAVIDAD', 'KIS JR Navidad - 41.4g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7501024547609', '7501024546657', '27501024546651', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3333, 'HER-0917', 'KISSES LATA GRANDE', 'KIS Lata Gde - 180g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024546695', '', '17501024546692', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3334, 'HER-0918', 'KISSES CAJA CHIMENEA', 'KIS caja Chimenea 160g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547753', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3335, 'HER-0919', 'KISSES LATA', 'KIS Lata 240g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547548', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3336, 'HER-0920', 'KISSES CAJA TRIANGULO', 'KIS Caja Triangulo 52g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547586', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3337, 'HER-0921', 'KISSES LATITA', 'KISS Latita 61.5g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547623', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3338, 'HER-0922', 'KISS BASTON TRADICIONAL', NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024547746', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3339, 'HER-0923', 'KISSES SE SURTIDO', 'KISS SE Surtido 262.2g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024546374', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3340, 'HER-0924', 'KISSES CAJA TRIANGULO', 'KIS Triangulo 44g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501024547722', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3341, 'HER-0925', 'KISSES LATITA', 'Kisses Latita 52g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547791', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3342, 'HER-0926', 'KISSES COOKIES N CREME', 'Kisses CNC 88g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547777', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3343, 'HER-0927', 'SNOWMAN', 'Snowman 56g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024556038', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3344, 'HER-0928', 'CAJA DESTELLOS', 'Caja Destellos 120g', 1.00, 9, 1, 9.00, 9.00, 2.50, 5.00, 3.00, '7501024525195', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3345, 'HER-0929', 'LATA CUBETA', 'Lata Cubeta 184g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024525201', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3346, 'HER-0930', 'REGALO PREMIUM', 'Regalo Premium 160g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7501024525232', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3347, 'HER-0931', 'KISSES SE POCKET CEREZA', 'KISS SE Cereza 32g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7501024546367', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3348, 'HER-0932', NULL, NULL, 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7501024547982', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3349, 'HER-0933', NULL, NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024546725', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3350, 'HER-0934', 'LATA FUNDA KISSES', 'Lata Funda - 52g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024547999', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3351, 'HER-0935', 'REGALO BOLSITA', 'Regalo Bolsita - 140g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501024546770', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3352, 'HER-0936', 'REGALO ROMBO', 'Regalo Rombo - 128g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7501024646715', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3353, 'HER-0937', 'KISSES LUXURY', 'Kisses Luxury - 184g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024537617', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3354, 'HER-0938', 'KISSES REGALO BOLSITA', 'Kiss Regalo B. - 120g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501024525218', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3355, 'HER-0939', 'KISSES LATA FUNDA', 'Kiss Lata F. - 48g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024537570', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3356, 'HER-0940', 'KISSES CAJA REGALO', 'Kiss Caja R. - 80g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501024537594', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3357, 'HER-0941', 'KISSES SHARING BOX', 'Kiss Sharing B. - 144g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501024537624', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3358, 'HER-0942', 'KISSES CAJA DE REGALO MIX', 'Kiss Caja R. Mix - 309.3g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7501024541508', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3359, 'HER-0943', 'KISSES CAJA DETALLE', 'Kiss Caja Detalle - 55.7g', 1.00, 1, 24, 1.00, 24.00, 2.50, 5.00, 3.00, '7501024548170', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3360, 'HER-0944', 'KISSES CAJA ARBOLITO', 'Kiss Caja Arbolito - 88g', 1.00, 1, 24, 1.00, 24.00, 2.50, 5.00, 3.00, '7501024548187', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3361, 'HER-1001', 'LECHE SABORIZADA CHOCOLATE', 'Leche Sab Choc - 236ml', 1.00, 1, 27, 1.00, 27.00, 2.50, 5.00, 3.00, '7501024579327', '', '7501024579334', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3362, 'HER-1002', 'LECHE SABORIZADA COOKIES & CREAM', 'Leche Sab C&C - 236ml', 1.00, 1, 27, 1.00, 27.00, 2.50, 5.00, 3.00, '7501024579297', '', '7501024579294', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3363, 'HER-1003', 'LECHE SABORIZADA FRESA', 'Leche Sab Fresa - 236ml', 1.00, 1, 27, 1.00, 27.00, 2.50, 5.00, 3.00, '7501024579280 ', '', '7501024579287 ', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3364, 'HER-1005', 'LECHE SABORIZADA CHOCOBANANA', 'Leche Sab Chocobanana - 236ml', 1.00, 1, 27, 1.00, 27.00, 2.50, 5.00, 3.00, '7501024580248', '', '7501024580245', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3365, 'HER-1006', 'LECHE SABORIZADA CHOCOLATE (18)', 'Leche Sab Choc - 236ml', 1.00, 1, 18, 1.00, 18.00, 2.50, 5.00, 3.00, '7501024579327', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3366, 'IND-0101', 'DEDO INDY', 'Dedo Indy - 20g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '790203019113', '790203023509', '10790203019110', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3367, 'IND-0102', 'MARIMBA INDY', 'Marimba Indy - 35g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '790203039111', '790203023561', '10790203039118', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3368, 'IND-0103', 'MINI DEDO', 'Mini Dedo - 400g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '0790203020331', '', '790203030262', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3369, 'IND-0104', 'MARIMBA INDY DISPLAY', 'Marimba Indy D - 35g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '790203023561', '', '10790203039118', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3370, 'IPO-0102', 'BRACKETS', 'Brackets - 15g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502245411229', '7502245411236', '17502245411233', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3371, 'IPO-0103', 'LENGUAS', 'Lenguas - 15g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502245411205', '7502245411212', '17502245411219', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3372, 'IPO-0104', 'ZIPPER', 'Zipper - 15g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502245411243', '7502245411250', '17502245411257', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3373, 'IPO-0105', 'BPOP SURTIDOS', 'Mix Ipop - 15g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502245411229', '7502245411236', '17502245411233', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3374, 'IPO-0106', 'B-POP MIX (OXXO)', 'Bpop Mix OX - 15g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502245411229', '7502245411236', '17502245411233', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3375, 'IPO-0201', 'SEL FEET', 'Sel Feet - 10g', 1.00, 12, 6, 12.00, 72.00, 2.50, 5.00, 3.00, '7502245412073', '7502245412080', '17502245412087', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3376, 'IPO-0301', 'EAT YOUR WORD', 'EYW - 17g', 1.00, 12, 12, 12.00, 144.00, 2.50, 5.00, 3.00, '7502245412097', '7502245412103', '17502245412100', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3377, 'KIT-0101', 'BOTADERO SURTIDO MASTER WOM', 'Botadero surt/Master Wom 5.5kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8435124852891', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3378, 'KIT-0102', 'BOTADERO TOPPS', 'Botadero Topps', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411984', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3379, 'KIT-0103', 'BOTADERO SUPER ALIMENTOS', 'Botadero SA', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245412004', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3380, 'KIT-0104', 'BOTADERO EFRUTTI', 'Botadero Efrutti', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245412028', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3381, 'KIT-0105', 'BOTADERO FRULER', 'Botadero Fruler', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245412035', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3382, 'KIT-0106', 'BOTADERO LUCKY GUMMYS', 'Botadero Lucky Gummys', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245412134', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3383, 'KIT-0201', 'CUBETA ALVIN Y LAS ARDILLAS 3', 'Cubeta Alvin & Ard 3 s/grm', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341569', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3384, 'KIT-0301', 'KIT LICENCIAS', 'Kit Licencias - 154g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '681307403925', '', '681307403925', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3385, 'KIT-0302', 'KIT LICENCIAS POP IN CANDY', 'Kit Licencias P in C - 13g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '681307413061', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3386, 'KRA-0101', 'GOMITA ANGRY BIRDS ROJA', 'Goma Angry B roja 20g', 1.00, 150, 1, 150.00, 150.00, 2.50, 5.00, 3.00, '000790520085', '000790520214', '10000790520082', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3387, 'KRA-0102', 'GOMITA ANGRY BIRDS AMARILLA', 'Goma Angry B amarilla 20g', 1.00, 150, 1, 150.00, 150.00, 2.50, 5.00, 3.00, '000790520092', '000790520221', '10000790520099', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3388, 'KRA-0103', 'GOMITA ANGRY BIRDS AZUL', 'Goma Angry B azul 20g', 1.00, 150, 1, 150.00, 150.00, 2.50, 5.00, 3.00, '000790520108', '000790520238', '10000790520105', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3389, 'KRA-0104', 'GOMITA ANGRY BIRDS VERDE', 'Goma Angry B verde 20g', 1.00, 150, 1, 150.00, 150.00, 2.50, 5.00, 3.00, '000790520115', '000790520245', '100007905201112', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3390, 'LIF-0101', 'GOMITAS WILD BERRIES LIFE SAVERS', 'Goma WB L Savers 56g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '7502226811451', '7502226811475', '10022000227383', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3391, 'LIF-0102', 'GOMITAS 5 FLAVORS LIFE SAVERS', 'Goma 5F L Savers 56g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '7502226811468', '7502226811482', '10022000225723', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3392, 'LIF-0103', 'GOMITAS WILD BERRIES LIFE SAVERS', 'Goma WB L Savers 198g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '19000083449', '7502226811475', '10019000083446', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3393, 'LIF-0104', 'GOMITAS 5 FLAVOR LIFE SAVERS', 'Goma 5 Flav L Savers 198g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '19000083425', '', '10019000083422', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3394, 'LIF-0105', 'SALVAVIDAS 5 FLAVORS', 'Salvavidas 5 flavors 177g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502226812281', '', '10019000085013', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3395, 'LIF-0106', 'SALVAVIDAS CEREZA', 'Salvavidas cereza - 177g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502226812274', '', '10019000085082', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3396, 'LIF-0107', 'SALVAVIDAS 5 FLAVORS', 'Salvavidas 5 flavors - 26g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '75035693', '7502226812205', '10022000239430', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3397, 'LIF-0108', 'GOMITAS WILD BERRIES LIFE SAVERS', 'Goma WB L Savers 56g 12-9', 1.00, 9, 1, 9.00, 9.00, 2.50, 5.00, 3.00, '7502226812595', '7502226812588', '10022000244175', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3398, 'LIF-0109', 'GOMITAS 5 FLAVOR LIFE SAVERS', 'Goma 5 Flav L Savers 56g 12-9', 1.00, 9, 1, 9.00, 9.00, 2.50, 5.00, 3.00, '7502226812564', '7502226812557', '10022000244212', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3399, 'LIF-0201', '5 FLAVOR LIVE SAVERS CAJITA', '5 Flav Live Savers caj 99g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '22000003607', '', '10022000209747', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3400, 'LIF-0202', 'WILD BERRIES LIFE SAVER CAJITA', 'W Berries L Saver caj 99g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '0022000003591', '', '10022000209716', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3401, 'LIF-0301', 'LIFE SAVERS LATA', 'Life Savers lata - 206g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '022000115805', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3402, 'LIF-0401', 'GOMITAS 5 FLAVOR LIFE SAVERS GRANEL', '5 Flav L Savers granel', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050056992925', '', '20500569929254', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3403, 'LIF-0402', 'GOMITAS WILD BERRIES LIFE SAVERS GRANEL', 'Goma W Berries L Savers 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050056993335', '', '20500569933350', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3404, 'LUC-0101', 'SKW  FRUTAS ROJAS', 'SKW frutas rojas - 26g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '706460236361', '706460236378', '10706460236368', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3405, 'LUC-0102', NULL, NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '725181207016', '725181436102', '725181355205', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3406, 'LUC-0103', 'SKW SALSAGUETTI SANDIA', NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '725181249016', '725181510109', '10706460238461', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3407, 'LUC-0104', 'SKW SALSAGHETTI KING SIZE', 'SKW Salsag King s. 70g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '706460240467', '706460240450', '10706460240457', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3408, 'LUC-0105', 'SKWINKLOTE', 'Skwinklote - 40g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502226811970', '7502226811956', '17502226811991', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3409, 'LUC-0106', 'SKW SOPEADO RELLENO', 'SKW Sopeado relleno - 50g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '706460240740', '706460240757', '10706460240747', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3410, 'LUC-0107', 'SKWINKLES CHAMOY', 'SKW chamoy - 19.5g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '725181105015', '725181248101', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3411, 'LUC-0108', 'SKWINKLES SALSAGUETI CHAMOY EXTREMO', 'SKW Salsag Chamoy Extmo 24g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226812427', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3412, 'LUC-0109', 'SKWINKLOTE 24/6', 'Skwinklote 24/6 40g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502226811970', '7502226811956', '17502226813001', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3413, 'LUC-0110', 'SKW SANDIA ENCHILADA', 'SKW sandia enchilada - 26g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226812960', '7502226812953', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3414, 'LUC-0111', NULL, NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226813677', '750222681366 0', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3415, 'LUC-0112', 'SKWINKLOTE SANDIA', 'Skwinklote Sandia 40g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502226813820', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3416, 'LUC-0201', 'BOMVASO', 'Bomvaso - 30g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '725181389019', '725181750109', '725181721208', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3417, 'LUC-0202', 'MUECAS MANGO', 'Muecas mango - 25g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '725181203018', '725181424109', '725181353201', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3418, 'LUC-0203', 'GUSANO CHAMOY', 'Gusano chamoy - 38g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '725181035015', '725181820109', '725181191209', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3419, 'LUC-0204', 'MUECAS CHAMOY', 'Muecas chamoy - 25g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '725181068013', '725181128106', '725181067207', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3420, 'LUC-0205', 'PANZON CHAMOY', NULL, 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '75021184', '725181774105', '725181739203', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3421, 'LUC-0206', 'PANZON PI-K MACHIN', NULL, 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '706460241310', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3422, 'LUC-0207', 'MUECAS PIKA PEPINO', 'Muecas pika pepino - 25g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '706460750973', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3423, 'LUC-0208', 'MUECAS SANDIA', NULL, 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502226812335', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3424, 'LUC-0209', 'DJ MIX MANGO CHAMOY', 'Dj Mix - 30g', 1.00, 9, 1, 9.00, 9.00, 2.50, 5.00, 3.00, '7502226813141', '7502226813134', '17502226813124', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3425, 'LUC-0210', 'PIK LUCAS', 'Pik Lucas - 25g', 1.00, 9, 1, 9.00, 9.00, 2.50, 5.00, 3.00, '7502226813882', '7502226813875', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3426, 'LUC-0211', 'MUECAS MANGO v2', 'Muecas mango - 24g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502226814995', '7502226814988', '17502226814978', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3427, 'LUC-0212', 'MUECAS CHAMOY v2', 'Muecas chamoy - 24g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502226815022', '7502226815015', '1750226815005', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3428, 'LUC-0213', 'PANZON CHAMOY v2', NULL, 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502226815145', '7502226815138', '17502226815128', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3429, 'LUC-0301', NULL, NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050065103763', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3430, 'LUC-0302', 'SKW SALSAGHETTI GRANEL', 'SKW Salsaguetti S. 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050065104494', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3431, 'LUC-0303', 'SKW CHAMOY GRANEL', 'SKW chamoy - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050065104500', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3432, 'LUC-0304', 'SKW RELLENO SANDIA GRANEL', 'SKW relleno sandia - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050068631348', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3433, 'LUC-0305', 'SKWINKLOTE GRANEL', 'Skwinklote - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050066591545', '', '20500665915458', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3434, 'LUC-0306', NULL, 'SKW Salsaguetti P/T - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411670', '', '17502245411677', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3435, 'LUC-0307', 'SKWINKLOTE SANDIA GRANEL', 'Skwinklote Sandia - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411847', '', '17502245411844', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3436, 'LUK-0101', 'GOMA LUCKY GUMMI  GOTITAS', 'Lucky G Gotitas 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '744218100069', '', '30744218100060', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3437, 'LUK-0102', 'GOMA LUCKY GUMMI  FRUTITAS', 'Lucky G Frutitas 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '744218100021', '', '30744218100022', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3438, 'LUK-0103', 'GOMA LUCKY GUMMI ARO DE DURAZNO', 'Lucky G Aro durazno 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '744218100090', '', '30744218100091', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3439, 'LUK-0104', 'GOMA LUCKY GUMMI ARO DE MANZANA', 'Lucky G Aro manzana 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '744218100106', '', '30744218100107', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3440, 'LUK-0105', 'GOMA LUCKY GUMMI CHILITOS', 'Lucky G Chilitos 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '744218100113', '', '30744218100114', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3441, 'LUK-0107', 'GOMA LUCKY GUMMI  LOMBRIZ NEON', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '744218100045', '', '30744218100046', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3442, 'LUK-0108', 'GOMA LUCKY GUMMI LOMBRICES', 'Lucky G Lombrices 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '744218100038', '', '30744218100039', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3443, 'LUK-0109', 'GOMA  LUCKY GUMMI OSITOS', 'Lucky G Ositos 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '744218100014', '', '30744218100015', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3444, 'LUK-0110', 'GOMA LUCKY GUMMI ORUGA', 'Lucky G Oruga - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '#N/A', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3445, 'LUK-0301', 'GOMA LUCKY GUMMYS FRUTITAS (50)', 'Frutitas - 50g', 1.00, 12, 6, 12.00, 72.00, 2.50, 5.00, 3.00, '744218110211', '744218110228', '30744218110229', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3446, 'LUK-0302', 'GOMA LUCKY GUMMYS GAJITOS (50)', 'Gajitos - 50g', 1.00, 12, 6, 12.00, 72.00, 2.50, 5.00, 3.00, '744218112116', '744218112123', '30744218112124', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3447, 'LUK-0303', 'GOMA LUCKY GUMMYS MANGUITOS (50)', 'Manguitos - 50g', 1.00, 12, 6, 12.00, 72.00, 2.50, 5.00, 3.00, '74411', '744111', '7441122', NULL, 1, '2018-06-13 15:54:41', '2018-07-02 20:37:42', NULL),
(3448, 'LUK-0402', 'GOMA LUCKY GUMMYS GAJITOS(100)', 'gajitos - 100g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '744218122115', '', '3074421822116', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3449, 'LUK-0403', 'GOMA LUCKY GUMMYS MANGUITOS (100)', 'Manguitos - 100g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7,44E+11', '', '3,07E+13', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3450, 'MAR-0101', 'M&M CHOCOLATE  SIX PACK  (CAFE)', NULL, 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7506174500467', '10706460243274', '706460243239', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3451, 'MAR-0102', 'M&M CACAHUATE SIX PACK  (AMARILLO)', 'M&M Cacah 6 pk  (amar) 42.5g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7506174500450', '10706460243267', '706460243222', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3452, 'MAR-0103', 'M&M MINIS TUBO', 'M&M Minis tubo - 30g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '04056704', '40000432319', '706460201758', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3453, 'MAR-0104', 'MILKY WAY  SIX PACK', 'Milky Way six pack - 58.1g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7506174500214', '10706460241287', '706460241198', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3454, 'MAR-0105', 'SNICKERS SIX PACK', 'Snickers six pack - 58.7g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7506174500207', '10706460241270', '706460241181', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3455, 'MAR-0106', 'M&M PRETZEL', 'M&M Pretzel - 32.3g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7506174500931', '706460244700', '10706460244592', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3456, 'MAR-0107', 'MILKY WAY LIGERO', 'Milky Way ligero - 20.5g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7506174500924', '706460244687', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3457, 'MAR-0108', 'SKICKERS ALMOND', 'Snickers almond - 49.9g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '40000007074', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3458, 'MAR-0109', 'TWIX', 'Twix - 50.7g', 1.00, 36, 1, 36.00, 36.00, 2.50, 5.00, 3.00, '04040305', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3459, 'MAR-0110', 'DOVE LECHE', 'Dove Leche 40g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174502423', '', '706460247893', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3460, 'MAR-0111', 'DOVE COOKIES & CREME', 'Dove Cookies & Creme 38g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174502430', '', '706460247923', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3461, 'MAR-0112', 'SNICKERS ROCKIN NUT', 'Snickers R.N. - 49.9g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7506174502928', '706460249545', '10706460249566', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3462, 'MAR-0113', 'M&M BOTANERO', 'M&M botanero - 200g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174502539', '', '10706460248064', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3463, 'MAR-0114', 'DOVE GIFTING', 'Dove Gifting - 128g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174502812', '', '10706460249016', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3464, 'MAR-0115', 'SNICKERS BITES', 'Snickers Bites - 80.2g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506174503604', '17506174503601', '27506174503608', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3465, 'MAR-0116', 'MILKY WAY BITES', 'Milky Way bites - 80.2g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506174503598', '17506174503595', '27506174503592', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3466, 'MAR-0117', 'DOVE DARK', 'Dove Dark - 40.8g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503246', '', '10706460250616', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3467, 'MAR-0118', 'MILKY WAY VAINILLA', 'Milky Way V. - 48.8g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7506174503413', '', '17506174503410', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3468, 'MAR-0119', 'M&M CHOCOLATE POP IT', 'M&M Choc Pop it - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174502850', '', '10706460250579', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3469, 'MAR-0120', 'M&M CACAHUATE POP IT', 'M&M Cacahuate Pop it - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174502867', '', '10706460250586', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3470, 'MAR-0121', 'M&M MEGA', 'M&M Mega - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174504311', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3471, 'MAR-0122', 'MILKY WAY MARSHMALLOW', 'Milky Way Marshmallow - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503512', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3472, 'MAR-0123', 'SNICKERS INTENSE', 'Snickers Intense - 49.5g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501907', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3473, 'MAR-0124', 'SNICKERS CRISPER', 'Snickers Crisper - 40g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '040000503156', '040000503149', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3474, 'MAR-0125', 'M&M POP IT CRISPY', 'M&M pop it C - 80g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174505301', '', '17506174505308', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3475, 'MAR-0126', 'M&M CRISPY', 'M&M Crispy - 38.3g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7506174504922', '17506174504929', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3476, 'MAR-0127', 'MILKY WAY RED BERRIES', 'Milky Way Red Berries - 48.5g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7506174505318', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3477, 'MAR-0201', 'MINI M&M BULK', 'Mini M&M bulk - 11.340kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '0058496731311', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3478, 'MAR-0202', 'M&M CHOCOLATE BULK', 'M&M Choc. bulk 11.340kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '0040000182313', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3479, 'MAR-0203', 'M&M CACAHUATE BULK', 'M&M Cacah. bulk 11.340kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '0040000182320', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3480, 'MAR-0301', '2 PACK SNICKERS', '2 Pack Snickers - 86g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7506174500764', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3481, 'MAR-0302', '2 PACK MILKY WAY', '2 Pack Milky Way - 86g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7506174500771', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3482, 'MAR-0401', 'M&M CACAHUATE POUCH', 'M&M Cacahuate pouch - 124g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '706460243147', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3483, 'MAR-0402', 'M&M CHOCOLATE POUCH', 'M&M Chocolate pouch - 124g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '706460243161', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3484, 'MAR-0501', 'SNICKERS PEG PACK', 'Snickers peg pack 124.7g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '40000437291', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3485, 'MAR-0502', 'MILKY WAY PEG PACK', 'Milky Way peg pack 124.7g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '40000437277', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3486, 'MAR-0601', 'SNICKERS', 'Snickers - 21.5g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7506174500481', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3487, 'MAR-0602', 'MILKY WAY', 'Milky Way - 22g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7506174500474', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3488, 'MAR-0801', 'MINI TUBO CON PIN SV', 'Mini Tubo Con Pin sv - 30g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '7506174501174', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3489, 'MAR-0802', 'VASO CIRCULAR MILKY WAY', 'Vaso circular Milky Way 102.5g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501181', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3490, 'MAR-0803', 'CAJA ACETATO MILKY WAY', 'Caja acetato Milky Way 136g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501198', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3491, 'MAR-0804', 'ENMARCA MILKY WAY', 'Enmarca Milky Way - 187g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501211', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3492, 'MAR-0805', 'LATA COLLECTIBLE', 'Lata collectible - 127.5g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501228', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3493, 'MAR-0806', 'LATA CRIPTEX 3 PK', 'Lata criptex 3 pk - 51g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501235', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3494, 'MAR-0807', NULL, 'Regalo C. M&M - 49.3g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174504014', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3495, 'MAR-0808', NULL, 'Corazon C. Dove - 80g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174504045', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3496, 'MAR-0809', NULL, 'Cubeta M&M - 102g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174504007', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3497, 'MAR-0810', NULL, 'Regalo Dove - 96g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174504083', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3498, 'MAR-0811', NULL, 'Margo Regago MW - 170g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174504052', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3499, 'MAR-0812', NULL, 'Regalo C. MW - 44g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174504106', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3500, 'MAR-0813', NULL, 'Lata E. Snickers - 86g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174504069', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3501, 'MAR-0814', NULL, 'Bs Cajitas C. Snickers - 212g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174504205', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL);
INSERT INTO `products` (`id`, `sku`, `concept`, `alias`, `weight_per_piece`, `items_per_display`, `display_per_box`, `weight_per_display`, `weight_per_box`, `width`, `height`, `depth`, `barcode`, `display_barcode`, `corrugated_barcode`, `caducidad_minima`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3502, 'MAR-0815', NULL, 'Corazon M&M - 68g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174504021', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3503, 'MAR-0901', 'MINI TUBO CON PIN N', 'Mini Tubo Con Pin n - 30g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7506174501143', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3504, 'MAR-0902', 'DUENDE', 'Duende - 68g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174500962', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3505, 'MAR-0903', 'M&M COFRE', 'M&M cofre - 85g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501037', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3506, 'MAR-0904', 'M&M LATA CUADRADA', 'M&M lata cuadrada - 248g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501044', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3507, 'MAR-0905', 'DESEOS', 'Deseos - 175g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501006', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3508, 'MAR-0906', 'SORPRESA', 'Sorpresa - 262.5g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501020', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3509, 'MAR-0907', 'M&M ELFO', 'M&M Elfo - 42.5g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501051', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3510, 'MAR-0908', 'BASTON M&M CACAHUATE', 'Baston M&M Cah - 49.3g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501761', '', '10706460246374', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3511, 'MAR-0909', 'BASTON M&M CHOCOLATE', 'Baston M&M Choc - 49.3g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501778', '', '10706460246381', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3512, 'MAR-0910', 'DUENDE M&M', 'Duende M&M - 51g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174501785', '', '10706460246398', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3513, 'MAR-0911', 'TUBO IMAN M&M', 'Tubo M&M - 30g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '7506174501716', '706460246322', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3514, 'MAR-0912', 'XMAS ESTUCHE SNICKERS', 'XMAS snickers  - 86g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503024', '', '10706460250180', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3515, 'MAR-0913', 'XMAS LATA COLLECTIBLE M&M', 'XMAS Lata C M&M  - 97.0g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503031', '', '10706460250197', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3516, 'MAR-0914', 'XMAS LATA CRIPTEX M&M', 'XMAS Lata Criptex M&M  - 17g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503086', '', '10706460250241', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3517, 'MAR-0915', 'XMAS TUBO NOVELTY M&M', 'XMAS Lata Criptex M&M  - 30g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '70506174503369', '706460250770', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3518, 'MAR-0916', 'XMAS REGALO GRANDE MILKY WAY', 'XMAS Regalo Grande MW  - 272g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503093', '', '10706460250258', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3519, 'MAR-0917', 'XMAS MARCO REGALO SNICKERS', 'XMAS Marco Regalo Snk  - 180g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503338', '', '10706460250739', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3520, 'MAR-0918', NULL, 'Dove Colleccion - 136g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503772', '', '17506174503779', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3521, 'MAR-0919', NULL, 'Regalo chico MW - 44g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503710', '', '17506174503717', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3522, 'MAR-0920', NULL, 'Regalo SNK - 198g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503703', '', '17506174503700', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3523, 'MAR-0921', NULL, 'Dove Colleccion - 93.6g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503680', '', '17506174503687', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3524, 'MAR-0922', NULL, 'Lata Alcancia m&m - 194.4g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503758', '', '17506174503755', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3525, 'MAR-0923', NULL, 'Snowman Disp - 17g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503734', '', '17506174503731', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3526, 'MAR-0924', NULL, 'Marco Regalo MW - 170g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503901', '', '17506174503908', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3527, 'MAR-0925', NULL, 'Dove Colleccion - 96g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503741', '', '17506174503748', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3528, 'MAR-0926', NULL, 'Estuche SNK - 86g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503697', '', '17506174503694', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3529, 'MAR-0927', NULL, 'Esfera m&m - 17g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174503765', '', '17506174503762', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3530, 'MAR-0928', NULL, 'XMAS16 Snickers G. Pack  - 107.5g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174505523', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3531, 'MAR-0929', NULL, 'M&M gift Pk - 124g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174505516', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3532, 'MAR-0930', NULL, 'XMAS16 M regalo Snickers  - 180g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174506568', '', '', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3533, 'MAR-0931', NULL, 'XMAS16 Mega Personajes  - 248g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7506174504977', '', '27506174504971', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3534, 'MDE-0101', 'ASSORTED CHOCOLATES', 'Zaini Degusta - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735033076', '', '8004735070071', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3535, 'MON-0101', 'TRIDENT SLAB 6''S MENTA', 'Trident Slab Menta - 10.2g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '7622210461704', '7622210461698', '17622210461695', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3536, 'MON-0102', 'TRIDENT SLAB 6''S YERBABUENA', 'Trident Slab Yerbabuena - 10.2g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '7622210461742', '7622210461735', '17622210461732', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3537, 'MON-0103', 'TRIDENT SLAB 6''S FRESA', 'Trident Slab Fresa - 10.2g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '7622210461674', '7622210461650', '17622210461657', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3538, 'MON-0104', 'TRIDENT SLAB 6''S MORAS', 'Trident Slab Moras - 10.2g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '7622210461728', '7622210461711', '17622210461718', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3539, 'MON-0201', 'TRIDENT TWIST 9''S MENTA', 'Trident Twist Menta - 17.1g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7506105604448', '7506105614447', '17506105614444', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3540, 'MON-0202', 'TRIDENT TWIST 9''S SANDIA YERBACOOL', 'Trident Twist Sandia - 17.1g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7506105604462', '7506105614461', '17506105614468', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3541, 'MON-0203', 'TRIDENT TWIST 9''S FRESA LIMON', 'Trident Twist Fresa Limon - 17.1g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7506105604431', '7506105614430', '17506105614437', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3542, 'MON-0204', 'TRIDENT TWIST 9''S UVA NARANJA', 'Trident Twist Uva Naranja - 17.1g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7506105602635', '7506105612634', '17506105612631', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3543, 'MON-0205', 'TRIDENT TWIST 9''S COLORS', 'Trident Twist Colors - 17.1g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7506105604455', '7506105614454', '17506105614451', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3544, 'MON-0301', 'TRIDENT XTRA CARE 12''S MENTA', 'Trident Xtra Care Menta - 16.3g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210464774', '7622210464767', '17622210464764', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3545, 'MON-0302', 'TRIDENT XTRA CARE 12''S YERBABUENA', 'Trident Xtra Care Yerbabuena - 16.3g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210464798', '7622210464781', '17622210464788', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3546, 'MON-0303', 'TRIDENT XTRA CARE 12''S FRESHMINT', 'Trident Xtra Care Freshmint - 16.3g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210464811', '7622210464804', '17622210464801', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3547, 'MON-0304', 'TRIDENT XTRA CARE 12''S COOL BUBBLE', 'Trident Xtra Care Cool Bubble - 16.3g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210464835', '7622210464828', '17622210464825', NULL, 1, '2018-06-13 15:54:41', '2018-06-13 15:54:41', NULL),
(3548, 'MON-0401', 'TRIDENT VAL-U PAK 18''S MENTA', 'Trident Val-U-Pack Menta - 30.6g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506105606053', '750610561605 2', '1750610561605 9', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3549, 'MON-0402', 'TRIDENT VAL-U PAK 18''S YERBABUENA', 'Trident Val-U-Pack Yerbabuena - 30.6g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506105606060', '7506105616069', '17506105616066', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3550, 'MON-0403', 'TRIDENT VAL-U PAK 18''S SANDIA', 'Trident Val-U-Pack Sandia - 30.6g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506105606084', '7506105616083', '17506105616080', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3551, 'MON-0404', 'TRIDENT VAL-U PAK 18''S FRESMINT', 'Trident Val-U-Pack Fresmint - 30.6g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506105606077', '7506105616076', '17506105616073', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3552, 'MON-0405', 'TRIDENT VAL-U PAK 18''S COOL BUBBLE', 'Trident Val-U-Pack Cool Bubble - 30.6g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7506105606091', '7506105616090', '17506105616097', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3553, 'MON-0406', 'TRIDENT VAL-U PAK 18''S UVA LIMON', 'Trident Val-U-Pack Uva Lim - 30.6g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3554, 'MON-0503', 'CLORETS VAL-U PAK 30''S', 'Clorets Val-U-pak - 42g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7501056901158', '7501056911157', '27501056911151', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3555, 'MON-1101', 'HALLS MENTA', 'Halls Menta - 25.5g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7622210267818', '7622210267740', '17622210267747', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3556, 'MON-1102', 'HALLS YERBABUENA', 'Halls Yerbabuena - 25.5g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7622210267832', '7622210267764', '17622210267761', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3557, 'MON-1103', 'HALLS MIEL LIMON', 'Halls Miel Limon - 25.5g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7622210267863', '7622210267795', '17622210267792', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3558, 'MON-1104', 'HALLS MORA AZUL', 'Halls Mora - 25.5g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7622210267856', '7622210267788', '17622210267785', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3559, 'MON-1105', 'HALLS COLORS', 'Halls Colors - 25.5g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7622210267870', '7622210267801', '17622210267808', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3560, 'MON-1106', 'HALLS CEREZA', 'Halls Cereza - 25.5g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7622210267825', '7622210267757', '17622210267754', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3561, 'MON-1107', 'HALLS FRESA', 'Halls Fresa - 25.5g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7622210267849', '7622210267771', '17622210267778', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3562, 'MON-1108', 'HALLS MENTA 30/12', 'Halls Menta 30/12 - 25.5g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210267818', '7622210457462', '17622210457469', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3563, 'MON-1109', 'HALLS YERBABUENA 30/12', 'Halls Yerbabuena 30/12 - 25.5g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210267832', '7622210457486', '17622210457483', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3564, 'MON-1110', 'HALLS MIEL LIMON 30/12', 'Halls Miel Limon 30/12 - 25.5g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210267863', '7622210457516', '17622210457513', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3565, 'MON-1111', 'HALLS MORA AZUL 30/12', 'Halls Mora A. 30/12 - 25.5g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210267856', '7622210457509', '17622210457506', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3566, 'MON-1112', 'HALLS COLORS 30/12', 'Halls Colors 30/12 - 25.5g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210267870', '7622210457523', '17622210457520', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3567, 'MON-1113', 'HALLS CEREZA 30/12', 'Halls Cereza 30/12 - 25.5g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210267825', '7622210457479', '17622210457476', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3568, 'MON-1114', 'HALLS FRESA 30/12', 'Halls Fresa 30/12 - 25.5g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210267849', '7622210267771', '17622210267778', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3569, 'MON-1115', 'HALLS FRUIT EXPLOSION 30/12', 'Halls Fruit E. 30/12 - 25.5g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7622210612014', '7622210611970', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3570, 'MON-1201', 'CRACK UPS', 'Crack ups - 35g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3571, 'MON-1401', 'PALETA BUBBA XTREME MORA', 'P Bubba X mora - 16.6g', 1.00, 20, 1, 20.00, 20.00, 2.50, 5.00, 3.00, '', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3572, 'MON-1402', 'PALETA BUBBA XTREME FRESA', 'P Bubba X Fresa - 16.6g', 1.00, 20, 1, 20.00, 20.00, 2.50, 5.00, 3.00, '', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3573, 'MPO-0101', 'ROSITA FRESITA GOMITA', 'Rosita Fresita gomita 45g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7504015341316', '7504015341323', '17504015341313', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3574, 'MPO-0201', 'BOB ESPONJA GOMITA', 'Bob Esponja gomita - 45g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7504015341248', '7504015341255', '17504015341245', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3575, 'MPO-0202', 'BOB ESPONJA GOMITA', 'Bob Esponja gomita - 18g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341231', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3576, 'MPO-0301', 'BOLO GOMITAS', 'Bolo gomitas - 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341576', '', '17504015341573', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3577, 'MPO-0302', 'BOLO GIGANTE', 'Bolo gigante - 1.8Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8435124853683', '', '18435124853680', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3578, 'MPO-0303', 'BOLO GRANEL', 'Bolo granel - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8435124853669', '', '15735124853666', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3579, 'MPO-0304', 'DULCES SURTIDOS BOLO', 'Dulces S. Bolo - 88g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410017', '123', '17502245410007', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3580, 'MPO-0305', 'DULCES SURTIDOS VS BOLO', 'Dulces S. VS. Bolo - 44g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410390', '', '17502245410397', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3581, 'MPO-0401', 'FORKS', 'Forks - 22g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124852693', '8435124852686', '18435124852690', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3582, 'MPO-0501', 'DULCES SURTIDOS MONSTER HIGH', 'Dulces S. Monster High - 168g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341545', '', '17504015341542', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3583, 'MPO-0502', 'GOMITA DE GRENETINA MONSTER HIGH', 'Gomita M. High 42g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7504015341583', '7504015341590', '17504015341580', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3584, 'MPO-0503', 'PALETA DE CARAMELO MONSTER HIGH', 'Paleta caram m High 13g', 1.00, 20, 1, 20.00, 20.00, 2.50, 5.00, 3.00, '7504015341606', '7504015341613', '17504015341603', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3585, 'MPO-0504', 'NOVELTY BUBBLE GUM MONSTER HIGH', 'Bubble Gum M. High 16g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7504015341644', '7504015341651', '17504015341641', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3586, 'MPO-0505', 'POP IN CANDY MONSTER HIGH', 'Pop In Candy M High 13g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410086', '7502245410093', '17502245410090', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3587, 'MPO-0506', 'PALETA DE CARAMELO MONSTER HIGH BS/10', 'Paleta M. High bs/10 130g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341781', '', '17504015341788', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3588, 'MPO-0507', 'PALETA DE CARAMELO MONSTER HIGH BS/20', 'Paleta M. High bs/20 260g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341774', '', '17504015341771', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3589, 'MPO-0508', 'CHAP UP MONSTER HIGH', 'Chap up M High - 12g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124853539', '8435124853546', '18435124853543', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3590, 'MPO-0509', 'GOMITA GRENETINA MONSTER HIGH', 'Gomita M High - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410161', '', '17502245410168', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3591, 'MPO-0510', 'MINI DULCES SURTIDOS MONSTER HIGH', 'Mini M High - 21g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7502245410314', '7502245410369', '17502245410366', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3592, 'MPO-0511', 'GOMITA GRENETINA MONSTER HIGH TIRA', 'Gomita MH Tira - 42g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7504015341583', '7502245410697', '17502245410694', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3593, 'MPO-0512', 'BUBBLE GUM TARJETA MONSTER HIGH', 'Bubble G Tarjeta MH Tira- 16g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7504015341644', '7502245410741', '17502245410748', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3594, 'MPO-0513', 'POP IN CANDY MONSTER HIGH TIRA', 'Pop in candy MH Tira - 13g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502245410086', '7502245410642', '17502245410649', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3595, 'MPO-0514', 'GOMA DE MASCAR C/CENTRO ACIDITO MONSTER HIGH', 'Chicle C. Acidito MH - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410529', '', '7502245410536', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3596, 'MPO-0515', 'GOMA DE MASCAR C/CENTRO ACIDITO MONSTER HIGH TUBO', 'Chicle C. Acidito MH - 36g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7502245410581', '7502245410598', '7502245410595', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3597, 'MPO-0516', 'GOMA DE MASCAR C/CENTRO ACIDITO MH TUBO TIRA', 'Chicle C. Acidito MH Tira- 36g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410581', '7502245410949', '17502245410946', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3598, 'MPO-0517', 'CHAP UP MONSTER HIGH TIRA', 'Chap up MH Tira - 12g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410925', '7502245410932', '17502245410939', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3599, 'MPO-0518', 'GOMA DE MASCAR C/CENTRO ACIDITO MH GRANEL', 'Chicle C. Acidito MH - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050070399045', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3600, 'MPO-0519', 'DULCE SURTIDO MONSTER HIGH 2', 'Dulces S. Monster High 2 - 168g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410970', '', '17502245410977', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3601, 'MPO-0520', 'MALVAVISCO MONSTER HIGH', 'Malvavisco MH - 32g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7502245411038', '7502245411045', '17502245411042', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3602, 'MPO-0521', 'BOLSA GOMITA MONSTER HIGH', 'Bolsa Gomita MH - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411144', '', '17502245411141', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3603, 'MPO-0522', 'DUO MALVAVISCO MONSTER HIGH', 'Duo Malvavisco MH - 32g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411793', '', '1750224541179 0', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3604, 'MPO-0523', 'LATA GDE MONSTER HIGH 2 W', 'Lata Monster High 2 - 168g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410970', '', '17502245410977', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3605, 'MPO-0601', 'GOMITA DE GRENETINA HELLO KITTY', 'Gomita H Kitty 42g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7504015341293', '7504015341309', '17504015341290', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3606, 'MPO-0602', 'PALETA DE CARAMELO C/CENTRO DE CHICLE HELLO KITTY', 'Paleta c/chicle H Kitty 13g', 1.00, 20, 1, 20.00, 20.00, 2.50, 5.00, 3.00, '7504015341262', '7504015341279', '17504015341269', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3607, 'MPO-0603', 'NOVELTY BUBBLE GUM HELLO KITTY', 'Bubble gum H Kitty 16g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7504015341668', '7504015341675', '17504015341665', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3608, 'MPO-0604', 'POP IN CANDY HELLO KITTY', 'Pop In Candy H Kitty 13g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410147', '7502245410154', '17502245410151', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3609, 'MPO-0605', 'DULCES SURTIDOS HELLO KITTY', 'Dulces S. Hello Kitty - 168g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341767', '', '17504015341764', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3610, 'MPO-0606', 'MINI DULCES SURTIDOS HELLO KITTY', 'Mini HK - 21g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7502245410055', '7502245410338', '17502245410335', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3611, 'MPO-0607', 'GOMITA GRENETINA HELLO KITTY', 'Gomita H Kitty - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410178', '', '17502245410175', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3612, 'MPO-0608', 'GOMITA GRENETINA HELLO KITTY TIRA', 'Gomita HK Tira - 42g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7504015341293', '7502245410703', '17502245410700', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3613, 'MPO-0609', 'BUBBLE GUM TARJETA HELLO KITTY', 'Bubble G Tarjeta HK Tira - 16g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7504015341668', '7502245410758', '17502245410755', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3614, 'MPO-0610', 'POP IN CANDY HELLO KITTY TIRA', 'Pop in Candy HK Tira - 13g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502245410147', '7502245410673', '17502245410670', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3615, 'MPO-0611', 'GOMA DE MASCAR C/CENTRO ACIDITO HELLO KITTY', 'Chicle C. Acidito HK - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410543', '', '7502245410550', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3616, 'MPO-0612', 'GOMA DE MASCAR C/CENTRO ACIDITO HELLO KITTY TUBO', 'Chicle C. Acidito HK - 36g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7502245410604', '7502245410611', '7502245410618', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3617, 'MPO-0613', 'GOMA DE MASCAR C/CENTRO ACIDITO HK TUBO TIRA', 'Chicle C. Acidito HK Tira- 36g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410604', '7502245410956', '17502245410953', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3618, 'MPO-0614', 'GOMA DE MASCAR C/CENTRO ACIDITO HK GRANEL', 'Chicle C. Acidito HK - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050070399069', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3619, 'MPO-0615', 'BOLSA GOMITA HELLO KITTY', 'Bolsa Gomita HK - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411151', '', '17502245411158', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3620, 'MPO-0616', 'DULCE SURTIDO HELLO KITTY V.2', 'Dulces S. Hello Kitty 2 - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7504015341767', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3621, 'MPO-0617', 'BOLSA PALETA HELLO KITTY', 'Bolsa Paleta HK - 32g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411403', '', '17502245411400', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3622, 'MPO-0618', 'GOMITA GRENETINA CAJILLA HELLO KITTY', 'Gomita Grenetina HK - 60g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411373', '', '1750224541137 0', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3623, 'MPO-0619', 'DUO MINI LATAS HELLO KITTY', 'Duo Mini Latas HK - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '750224541142 7', '', '17502245411424', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3624, 'MPO-0701', 'GOMITA GRENETINA HOT WHEELS', 'Gomita H Wheels 42g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410239', '7502245410246', '17502245410243', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3625, 'MPO-0702', 'POP IN CANDY HOT WHEELS', 'Pop In Candy H Wheels 13g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410109', '7502245410116', '17502245410113', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3626, 'MPO-0703', 'DULCES SURTIDOS VS HOT WHEELS', 'Dulces S. VS. HW - 59g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410383', '', '17502245410380', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3627, 'MPO-0704', 'DULCE SURTIDO HOT WHEELS', 'Dulces S. Hot Wheels - 168g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410062', '', '17502245410069', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3628, 'MPO-0705', 'MINI DULCE SURTIDO HOT WHEELS', 'Mini HW - 21g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410079', '7502245410345', '17502245410342', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3629, 'MPO-0706', 'GOMITA GRENETINA HOT WHEELS', 'Gomita H Wheels - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410192', '', '17502245410199', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3630, 'MPO-0707', 'GOMITA GRENETINA HOT WHEELS TIRA', 'Gomita Hw Tira - 42g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502245410239', '7502245410727', '17502245410724', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3631, 'MPO-0708', 'POP IN CANDY HOT WHEELS TIRA', 'Pop in Candy HW Tira - 13g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502245410109', '7502245410659', '17502245410656', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3632, 'MPO-0709', 'DULCE SURTIDO HOT WHEELS 2 PACK', 'Dulces S. HW 2 pk - 344g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410819', '', '1750224541081 6', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3633, 'MPO-0710', 'BOLSA GOMITA HOT WHEELS', 'Bolsa Gomita HW - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411168', '', '17502245411165', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3634, 'MPO-0711', 'DULCES SURTIDOS VS HOT WHEELS v.2', 'Dulces S. VS. HW 2 - 50g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410383', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3635, 'MPO-0712', 'DUO MINI LATAS HOT WHEELS', 'Duo mini latas HW - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411434', '', '17502245411431', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3636, 'MPO-0713', 'LATA GRANDE HOT WHEELS v3', 'Lata Gde Hw v3 - 130g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411458', '', '17502245411455', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3637, 'MPO-0714', 'DULCE CON LAPICERA HOT WHEELS', 'Dulce Lapicer HW - 60g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411779', '', '17502245411776', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3638, 'MPO-0715', 'MINI DULCE SURTIDO HOT WHEELS v2', 'Mini HW v2 - 21g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410079', '7502245410345', '17502245410342', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3639, 'MPO-0801', 'POP IN CANDY BARBIE', 'Pop In Candy Barbie 13g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410123', '7502245410130', '17502245410137', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3640, 'MPO-0802', 'GOMITA GRENETINA BARBIE', 'Gomita Barbie - 42g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410253', '7502245410260', '17502245410267', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3641, 'MPO-0803', 'DULCE SURTIDO BARBIE', 'Dulces S. Barbie - 168g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410291', '', '17502245410298', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3642, 'MPO-0804', 'MINI DULCE SURTIDO BARBIE', 'Mini Barbie - 21g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7502245410307', '7502245410352', '17502245410359', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3643, 'MPO-0805', 'DULCES SURTIDOS VS BARBIE', 'Dulces S. VS. barbie - 59g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410406', '', '17502245410403', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3644, 'MPO-0806', 'GOMITA GRENETINA BARBIE', 'Gomita Barbie - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410208', '', '17502245410205', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3645, 'MPO-0807', 'POP IN CANDY BARBIE TIRA', 'Pop in Candy Barbie Tira - 13g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502245410123', '7502245410666', '17502245410663', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3646, 'MPO-0808', 'GOMITA GRENETINA BARBIE TIRA', 'Gomita Barbie Tira  - 42g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502245410253', '7502245410734', '17502245410731', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3647, 'MPO-0809', 'DULCE SURTIDO VS BARBIE 2 PACK', 'Dulce S. VS barbie 2 pack - 118g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410789', '', '1750224541078 6', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3648, 'MPO-0810', 'BOLSA GOMITA BARBIE', 'Bolsa Gomita BB - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411175', '', '17502245411172', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3649, 'MPO-0811', 'DULCE SURTIDO BARBIE V.2', 'Dulces S. Barbie 2 - 54g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410291', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3650, 'MPO-0812', 'DUO MINI LATA BARBIE', 'Duo mini lata Barbie - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '1', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3651, 'MPO-0813', 'LATA GRANDE BARBIE v3', 'Lata Gde Barbie v3 - 195g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411465', '', '17502245411462', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3652, 'MPO-0814', 'LATA GRANDE BARBIE W', 'Lata Gde Barbie W - 36g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410291', '', '17502245410298', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3653, 'MPO-0815', 'LATA GRANDE MIX FG', 'Lata Gde Mix - 36g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410291', '', '17502245410298', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3654, 'MPO-0901', 'GOMITA DE GRENETINA ANGRY BIRD', 'Gomita A Bird 42g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410215', '7502245410222', '17502245410229', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3655, 'MPO-0902', 'DULCES SURTIDOS ANGRY BIRD', 'Dulces S. Angry Birds - 167g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410024', '', '17502245410021', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3656, 'MPO-0903', 'MINI DULCES SURTIDOS ANGRY BIRDS', 'Mini AB - 21g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7502245410031', '7502245410321', '17502245410328', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3657, 'MPO-0904', 'DULCE SURTIDO ANGRY BIRDS ESFERA', 'Esfera AB - 63g', 1.00, 4, 1, 4.00, 4.00, 2.50, 5.00, 3.00, '7502245410048', '7502245410413', '17502245410410', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3658, 'MPO-0905', 'DULCES SURTIDOS VS ANGRY BIRDS', 'Dulces S. VS. AB - 52g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410376', '', '17502245410373', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3659, 'MPO-0906', 'NOVELTY BUBBLE GUM ANGRY BIRDS', 'Bubble gum A Bird 16g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7502245410277', '7502245410284', '17502245410281', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3660, 'MPO-0907', 'GOMITA GRENETINA ANGRY BIRDS TIRA', 'Gomita AB Tira - 42g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502245410215', '7502245410710', '17502245410717', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3661, 'MPO-0908', 'BUBBLE GUM TARJETA ANGRY BIRDS', 'Bubble G Tarjeta AB - 16g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502245410277', '7502245410765', '17502245410762', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3662, 'MPO-0909', 'DULCE SURTIDO VS ANGRY BIRDS 2 PACK', 'Dulce S. VS AB 2 pk - 118g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410796', '', '1750224541079 3', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3663, 'MPO-0910', 'GOMA DE MASCAR C/CENTRO ACIDITO ANGRY BIRD', 'Chicle C. Acidito AB - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410567', '', '7502245410635', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3664, 'MPO-0911', 'GOMA DE MASCAR C/CENTRO ACIDITO ANGRY BIRDS TUBO', 'Chicle C. Acidito AB - 36g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7502245410628', '7502245410635', '7502245410632', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3665, 'MPO-0912', 'GOMA DE MASCAR C/CENTRO ACIDITO AB TUBO TIRA', 'Chicle C. Acidito AB Tira- 36g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410628', '7502245410963', '17502245410960', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3666, 'MPO-0913', 'GOMA DE MASCAR C/CENTRO ACIDITO AB GRANEL', 'Chicle C. Acidito AB - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050070399076', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3667, 'MPO-0914', 'BOLSA GOMITA ANGRY BIRDS', 'Bolsa Gomita AB - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411182', '', '17502245411189', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3668, 'MPO-0915', 'LATA GRANDE ANGRY BIRDS W', 'LATA GRANDE AB - 36g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410024', '', '17502245410021', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3669, 'MPO-0916', 'DUO MINI LATA AB', 'Duo mini lata AB - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411441', '', '17502245411448', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3670, 'MPO-0917', 'LATA GRANDE ANGRY BIRDS v3', 'Lata Gde AB v3 - 195g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411472', '', '17502245411479', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3671, 'MPO-0918', 'LATA ESFERA AB v2', 'Lata esfera AB v2 - 70g', 1.00, 4, 1, 4.00, 4.00, 2.50, 5.00, 3.00, '7502245411489', '7502245411687', '17502245411684', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3672, 'MPO-0919', NULL, 'Lata esfera Nav AB - 70g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411809', '', '17502245411806', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3673, 'MPO-0920', 'LATA ESFERA AB v3', 'Lata esfera AB v3 - 38g', 1.00, 4, 1, 4.00, 4.00, 2.50, 5.00, 3.00, '7502245411885', '7502245411892', '17502245411899', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3674, 'MPO-1001', 'POP IN CANDY MI VILLANO FAVORITO 2', 'Pop in candy M Villano F. - 13g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410437', '7502245410444', '17502245410441', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3675, 'MPO-1002', 'NOVELTY BUBBLE GUM MI VILLANO FAVORITO 2', 'Bubble gum M Villano F. - 16g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7502245410505', '7502245410512', '17502245410519', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3676, 'MPO-1003', 'GOMITA DE GRENETINA MI VILLANO FAVORITO 2', 'Gomita M Villano F. - 42g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410482', '7502245410499', '17502245410496', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3677, 'MPO-1004', 'MALVAVISCO CON CHOCOLATE MI VILLANO FAVORITO 2', 'Malvavisco M Villano F. - 32g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7502245410468', '7502245410475', '17502245410472', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3678, 'MPO-1005', 'DULCES SURTIDOS MI VILLANO FAVORITO 2', 'Dulces S M Villano F. - 42g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410451', '', '17502245410458', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3679, 'MPO-1006', 'POP IN CANDY MI VILLANO FAVORITO 2 TIRA', 'Pop in candy M Villano F Tira- 13g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7502245410437', '7502245410680', '17502245410687', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3680, 'MPO-1007', 'MALVAVISCO CON CHOCOLATE MI VILLANO FAVORITO 2 TIRA', 'Malvavisco M Villano F Tira - 32g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '', '7502245410772', '17502245410779', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3681, 'MPO-1101', 'GOMITA DE GRENETINA RIO 2', 'Gomita Rio 2 - 40g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410833', '7502245410840', '17502245410847', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3682, 'MPO-1102', 'MALVAVISCO CUBIERTO RIO 2', 'Malvavisco Rio 2 - 32g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7502245410857', '7502245410864', '17502245410861', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3683, 'MPO-1103', 'DULCES SURTIDOS RIO 2', 'Dulces S. Rio 2 - 184g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410826', '', '17502245410823', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3684, 'MPO-1104', 'DULCES SURTIDOS VS RIO 2', 'Dulces S. V. Rio 2 - 59g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410871', '', '17502245410878', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3685, 'MPO-1105', 'PIKA MIX RIO 2', 'Pika Mix - 40g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245410888', '7502245410895', '17502245410892', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3686, 'MPO-1201', 'LATA GRANDE MINIONS SURTIDA', 'Lata Gde Minions - 148g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411199', '', '17502245411196', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3687, 'MPO-1202', 'MALVAVISCO CUBIERTO MINIONS', 'Malvavisco Minions - 32g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '7502245411328', '7502245411335', '17502245411332', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3688, 'MPO-1203', 'NOVELTY BUBBLE GUM MINIONS', 'Bubble gum Minions - 16g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7502245411359', '7502245411366', '17502245411363', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3689, 'MPO-1204', 'GOMITA GRENETINA CAJILLA MINIONS', 'Gomita Grenetina Minions - 60g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411342', '', '17502245411349', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3690, 'MPO-1205', 'MINI THUMB DIPPER MINIONS', 'M Thumb Dipper Minions - 23g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245411281', '7502245411298', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3691, 'MPO-1206', 'LATA GDE MINIONS SURTIDA CROMINION LIV', 'Lata Gde Minions Crominion - 148g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050074763521', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3692, 'MPO-1207', 'LATA GDE MINIONS SURTIDA EGIPCIO LIV', 'Lata Gde Minions Egipcio - 148g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050074765037', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3693, 'MPO-1208', 'LATA GDE MINIONS SURTIDA VAMPIRO LIV', 'Lata Gde Minions Vampiro - 148g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050074765044', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3694, 'MPO-1209', 'LATA GDE MINIONS SURTIDA PIRATA LIV', 'Lata Gde Minions Pirata - 148g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050074765051', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3695, 'MPO-1210', 'LATA GDE MINIONS SURTIDA NAVIDAD', 'Lata Gde Minions Nav- 151g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411755', '', '17502245411752', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3696, 'MPO-1211', 'LATA GDE MINIONS SURTIDA 2', 'Lata Gde Minions 2 - 151g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411762', '', '17502245411769', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3697, 'MPO-1212', 'LATA GDE MINIONS SURTIDA 2 W', 'Lata Gde Minions 2  W- 151g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411762', '', '17502245411769', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3698, 'NES-0101', 'CARLOS V CHOCOLATE', 'Carlos V CH - 20g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7501059299221', '7501059299191', '17501059299198', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3699, 'NES-0102', 'CARLOS V COOKIES & CREAM', 'Carlos V C&C - 18g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '7501059298835', '7501059298842', '17501059298832', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3700, 'NES-0103', 'CARLOS V BITES CHOCOLATE', 'Carlos V Bites - 30g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501059299641', '7501059299634', '17501058619010', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3701, 'NES-0104', 'CARLOS V AERO MILKY', 'Carlos V Aero M - 25g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7861091132673', '7861091132680', '17861091132687', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3702, 'NES-0105', 'CARLOS V AERO INTENSE', 'Carlos V Aero In - 25g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7861091132697', '7861091132703', '17861091132700', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3703, 'NES-0106', 'CARLOS V SIN AZUCAR', 'Carlos V S/A - 17g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7501058617736', '7501058617750', '17501058617757', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3704, 'NES-0107', 'CARLOS V KING', 'Carlos V King - 36g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501058612496', '7501058612489', '17501058612486', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3705, 'NES-0108', 'LATA CARLOS V RETRO', 'Lata Carlos V Retro - 240g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501058620651', '', '17501058621242', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3706, 'NES-0111', 'CARLOS V COOKIES & CREAM BOLSA', 'Carlos V C&C Bolsa- 72g', 1.00, 1, 224, 1.00, 224.00, 2.50, 5.00, 3.00, ' 6 ', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3707, 'NES-0112', 'CARLOS V SIN AZUCAR BOLSA', 'Carlos V S/A Bolsa- 68g', 1.00, 1, 20, 1.00, 20.00, 2.50, 5.00, 3.00, ' 4 ', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3708, 'NES-0114', 'CARLOS V DUO', 'Carlos V Duo - 36g', 1.00, 20, 8, 20.00, 160.00, 2.50, 5.00, 3.00, '7501058620798', '7501058623829', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3709, 'NES-0115', 'CARLOS V RESERVA REAL LECHE', 'Carlos V R. Real Leche - 80g', 1.00, 10, 12, 10.00, 120.00, 2.50, 5.00, 3.00, '7501058625427 ', '17501058625424 ', '27501058625421 ', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3710, 'NES-0116', 'CARLOS V RESERVA REAL SEMI AMARGO', 'Carlos V R. Real Sermi amargo - 80g', 1.00, 10, 12, 10.00, 120.00, 2.50, 5.00, 3.00, '7501058625441 ', '17501058625448 ', '27501058625445 ', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3711, 'NES-0117', 'CARLOS V RESERVA REAL AMARGO', 'Carlos V R. Real Amargo - 80g', 1.00, 10, 12, 10.00, 120.00, 2.50, 5.00, 3.00, '7501058625434 ', '17501058625431 ', '27501058625438 ', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3712, 'NES-0201', 'CRUNCH CHOCOLATE', 'Crunch Choc  - 40g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501059223905', '7501059223912', '7501059271364', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3713, 'NES-0202', 'CRUNCH CRISP', 'Crunch Crisp  - 50g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501059239036', '7501058618573', '17501058618570', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3714, 'NES-0203', 'CRUNCH MAX', 'Crunch Max  - 50g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501059281516', '7501058618566', '17501058618563', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3715, 'NES-0204', 'CRUNCH CRISP v2', 'Crunch Crisp V2 - 50g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501059239036', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3716, 'NES-0205', 'CRUNCH MAX v2', 'Crunch Max  V2- 50g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '7501059281516', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3717, 'NES-0301', 'KIT KAT', 'Kit kat  - 45g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7891000109427', '7891000109434', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3718, 'NES-0302', 'KIT KAT v2', 'Kit kat  V2 - 45g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7891000109427', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3719, 'NES-0303', 'KIT KAT v3', 'Kit kat  V2 - 41.5g', 1.00, 24, 4, 24.00, 96.00, 2.50, 5.00, 3.00, '7891000248362', '7891000248379', '17501058629811', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3720, 'NES-0401', 'FRESKAS', 'Freskas  - 35g', 1.00, 9, 1, 9.00, 9.00, 2.50, 5.00, 3.00, '7501059281165', '7501059281172', '17501059281179', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3721, 'NES-0501', 'ALMOND RIS', 'Almond Ris  - 26g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7501059238541', '7501059238558', '17501059238555', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3722, 'NES-0502', 'LA LECHERA COOKIE WAFER', 'La Lechera  - 18g', 1.00, 10, 24, 10.00, 240.00, 2.50, 5.00, 3.00, '7501059279575', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3723, 'NES-0601', 'TIN LARIN', 'Tin Larin  - 21g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7501059242913', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3724, 'NES-0602', 'LARIN SIN AZUCAR', 'Larin Sin Azucar - 21g', 1.00, 15, 1, 15.00, 15.00, 2.50, 5.00, 3.00, '7501059274341', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3725, 'NES-0603', 'LARIN SIN AZUCAR BOLSA', 'Larin S/A Bolsa - 76g', 1.00, 1, 20, 1.00, 20.00, 2.50, 5.00, 3.00, '7501058618757 ', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3726, 'NES-0604', 'LARIN CHOCOLATE NUT', 'Larin Nut - 24g', 1.00, 10, 30, 10.00, 300.00, 2.50, 5.00, 3.00, '7501059299443', '7501059299009', '17501059299006', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL);
INSERT INTO `products` (`id`, `sku`, `concept`, `alias`, `weight_per_piece`, `items_per_display`, `display_per_box`, `weight_per_display`, `weight_per_box`, `width`, `height`, `depth`, `barcode`, `display_barcode`, `corrugated_barcode`, `caducidad_minima`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3727, 'NES-0605', 'LARIN CHOCOLATE HAZELNUT', 'Larin Hazelnut - 24g', 1.00, 10, 30, 10.00, 300.00, 2.50, 5.00, 3.00, '7501059299429', '7501059299023', '17501059299020', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3728, 'NES-0606', 'LARIN CHOCOLATE ALMOND', 'Larin Almond - 24g', 1.00, 10, 30, 10.00, 300.00, 2.50, 5.00, 3.00, '7501059299436', '7501059299016', '17501059299013', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3729, 'NES-0607', 'LARIN CHOCOLATE SEMIAMARGO', 'Larin Semiamargo - 24g', 1.00, 10, 30, 10.00, 300.00, 2.50, 5.00, 3.00, '7501059298828', '7501059298811', '17501059298818', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3730, 'NEV-0101', 'NEVELLA', 'Nevella - 2000g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '890812001261', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3731, 'NIS-0101', 'CACAHUATE JAPONES NISHIKAWA', 'Cacahuate japones 60g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '126620', '126620', '126620', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3732, 'NUT-0101', 'RING POP', 'Ring pop -14g', 1.00, 12, 6, 12.00, 72.00, 2.50, 5.00, 3.00, '41116206252', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3733, 'NUT-0102', 'PUSH POP', 'Push Pop  -14g', 1.00, 24, 4, 24.00, 96.00, 2.50, 5.00, 3.00, '41116209031', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3734, 'NUT-0103', 'PUSH POP DUO', 'Push Pop D. -14g', 1.00, 20, 4, 20.00, 80.00, 2.50, 5.00, 3.00, '7,79804E+12', '7,79804E+12', '7,79804E+12', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3735, 'NUT-0104', 'BOTTLE POP', 'Bottle pop -31g', 1.00, 12, 4, 12.00, 48.00, 2.50, 5.00, 3.00, '41116204777', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3736, 'PPR-0114', 'PELONAZO (80)', 'Pelonazo - 80g', 1.00, 4, 12, 4.00, 48.00, 2.50, 5.00, 3.00, '719886211898', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3737, 'PPR-0115', 'PELON PELO RICO (30)', NULL, 1.00, 12, 24, 12.00, 288.00, 2.50, 5.00, 3.00, '719886211713', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3738, 'PPR-0116', 'PELONETE (30)', 'Pelonete - 30g', 1.00, 6, 24, 6.00, 144.00, 2.50, 5.00, 3.00, '75064631', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3739, 'PPR-0801', 'PELONETE GRANEL', 'Pelonete Granel - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411700', '', '17502245411707', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3740, 'PPR-0901', 'PELONETA TAMARINDO', 'Peloneta Tamarindo - 23g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '719886250019', '719886250071', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3741, 'PPR-0902', 'PELONETA CHAMOY', 'Peloneta Chamoy - 23g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '719886250033', '719886250088', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3742, 'PPR-0903', 'PELONAZO', 'Pelonazo - 100g', 1.00, 4, 1, 4.00, 4.00, 2.50, 5.00, 3.00, '719886080432', '719886080425', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3743, 'PPR-0904', 'PULPATON PATRICIO', NULL, 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '719886511486', '719886511059', '719886210594', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3744, 'PPR-0905', 'PULPATON CALAMARDO', NULL, 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '719886210969', '719886511325', '714886210877', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3745, 'PPR-0906', 'PELON PELO RICO', NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '719886001017', '719886511325', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3746, 'PPR-0907', 'PELONETE', 'Pelonete - 35g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '719886511066', '719886511394', '20719886210598', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3747, 'PPR-0908', 'PULPATON BOB ESPONJA', NULL, 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '719886511011', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3748, 'PPR-0909', 'PELONETE POUCH', 'Pelonetes Pouch - 180g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '719886400070', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3749, 'PPR-0910', 'PELONETA HOT INTENSE', 'Peloneta Hot Intense - 21g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '719886250163', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3750, 'PPR-0911', 'PELONETE HOT INTENSE', 'Pelonete Hot Intense- 30g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '719886400117', '719886400131', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3751, 'PPR-0912', 'PELON PELO RASTA', 'Pelon P. Rasta - 20g', 1.00, 15, 1, 15.00, 15.00, 2.50, 5.00, 3.00, '719886212475', '719886212468', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3752, 'PPR-0913', 'PELONETE JUMBO', 'Pelonete Jumbo - 65g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '719886400193', '719886400186', '20719886400180', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3753, 'PPR-0914', 'PELONETA TAMARINDO', 'Peloneta Tamarindo - 21g', 1.00, 12, 12, 12.00, 144.00, 2.50, 5.00, 3.00, '719886250330 ', '719886250347 ', '2071988625034 ', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3754, 'PPR-0915', 'PELONETA CHAMOY', 'Peloneta Chamoy - 21g', 1.00, 12, 12, 12.00, 144.00, 2.50, 5.00, 3.00, '719886250316 ', '719886250354 ', '2071988625035 ', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3755, 'PRO-0101', 'MINI GLORIAS', 'Mini Glorias - 200g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606021026', '', '10713606021023', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3756, 'PRO-0102', 'JAMONCILLO JUMBO', 'Jamoncillo Jumbo - 43g', 1.00, 15, 1, 15.00, 15.00, 2.50, 5.00, 3.00, '713606010396', '713606010518', '20713606010512', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3757, 'PRO-0103', 'MARINA JUMBO', 'Marina Jumbo - 53g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '713606010297', '713606012215', '713606012215', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3758, 'PRO-0104', 'COCOY JUMBO', 'Cocoy Jumbo - 100g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, 'x713606040195', '713606041215', '713606041215', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3759, 'PRO-0105', 'HUESITO DE LECHE', 'Huesito de leche - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606012529', '', '20713606012523', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3760, 'PRO-0106', 'BESITOS MEXICANOS', 'Besitos Mexicanos - 200g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606022726', '', '10713606022723', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3761, 'PRO-0107', 'COCOY JUM', 'Cocoy Jum - 80g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '713606040195', '713606041215', '713606041215', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3762, 'PRO-0108', 'HUESITO DE LECHE VITROLERO', 'Huesito Leche Vit - 720g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606012734', '', '20713606012738', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3763, 'PRO-0109', 'GLORIAS VITROLERO', 'Glorias Vit - 900g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606022931', '', '20113606022935', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3764, 'PRO-0110', 'BARRAS DE JAMONCILLO', 'Barras Jamoncillo - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606012826', '', '10713606015428', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3765, 'PRO-0111', 'NATILLON BOLSA', 'Natillon - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606029527', '', '10713606024321', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3766, 'PRO-0112', 'COCOY JUMBO BOLSA', 'Cocoy Jum Bs - 160g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606041925', '', '20713606042629', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3767, 'PRO-0113', 'OBLEA CON CAJETA MEDIANAS', 'Oblea - 200g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606071724', '', '20713606073425', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3768, 'PRO-0114', 'GLORIAS', 'Glorias - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606021224', '', '20713606021228', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3769, 'PRO-0115', 'JAMONCILLO DISPLAY', 'Jamoncillo D - 40g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '713606010396', '713606014745', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3770, 'PRO-0116', 'COCOY JUMBO DISPLAY', 'Cocoy J. Display - 80g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '0713606040195', '713606042045', '20713606042049', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3771, 'PRO-0117', 'OBLEA CON CAJETA DISPLAY', 'Oblea cajeta D- 40g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '713606072394', '713606071946', '20713606071940', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3772, 'PRO-0118', 'BARRAS DE JAMONCILLO WM', 'Barras Jamoncillo WM - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606012727', '', '07136060127272', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3773, 'PRO-0119', 'MINI GLORIAS (100)', 'Mini Glorias - 100g', 1.00, 1, 24, 1.00, 24.00, 2.50, 5.00, 3.00, '713606023228', '', '1,07136E+13', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3774, 'PRO-0120', 'COCOY (50)', 'Cocoy - 50g', 1.00, 4, 12, 4.00, 48.00, 2.50, 5.00, 3.00, '713606043691', '713606043615', '20713606043619', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3775, 'PRO-0201', 'JAMONCILLO JUMBO m', 'Jamoncillo Jumbo m - 43g', 1.00, 15, 1, 15.00, 15.00, 2.50, 5.00, 3.00, '713606010396', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3776, 'PRO-0202', 'MARINA JUMBO m', 'Marina Jumbo m - 53g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '713606010297', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3777, 'PRO-0203', 'COCOY JUMBO m', 'Cocoy Jumbo m - 100g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, 'x713606040195', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3778, 'PRO-0204', 'COCOY JUM m', 'Cocoy Jum m - 80g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '0713606040195', '713606041215', '713606041215', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3779, 'PRO-0301', 'JAMONCILLO SABORES', 'Jamoncillo Sabores - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606014417', '', '10713606014414', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3780, 'PRO-0302', 'COCOY COLORES', 'Cocoy colores - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606042618', '', '10713606042615', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3781, 'PRO-0401', 'HUESITO LECHE GRANEL', 'Huesito de leche - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606015223', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3782, 'PRO-0402', 'MARINA CHICA GRANEL', 'Marina chica - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606015322', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3783, 'PRO-0403', 'MINI GLORIA GRANEL', 'Mini Gloria - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606023624', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3784, 'PRO-0404', 'BESITOS MEXICANOS GRANEL', 'Besitos Mexicanos - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606023723', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3785, 'PRO-0405', 'CAFENATTI', 'Cafenatti - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606023822', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3786, 'PRO-0406', 'CHOCONATTI', 'Choconatti - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606023921', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3787, 'PRO-0407', 'NATILLON', 'Natillon - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606024027', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3788, 'PRO-0408', 'GLORIAS', 'Glorias - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606024126', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3789, 'PRO-0409', 'MINI OBLEAS', 'Mini Obleas - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606073223', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3790, 'PRO-0410', 'MINI COCOY', 'Mini Cocoy - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '713606042823', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3791, 'RIC-0101', 'BUBULUBU', 'Bubulubu - 35g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '07432354', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3792, 'RIC-0102', 'BUBULUBU GRANEL', 'Bubulubu G - 35g', 1.00, 15, 1, 15.00, 15.00, 2.50, 5.00, 3.00, '07432354', '', '10000007432351', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3793, 'RIC-0201', 'PALETA PAYASO', 'Paleta Payaso - 45g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7501000278404', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3794, 'RIC-0202', 'PALETA PAYASO GRANEL', 'Paleta Payaso G - 45g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501000278404', '', '10757528012878', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3795, 'RIC-0301', 'PANDITAS GRANEL', 'Panditas Granel - 1 Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '074323077346', '', '10074323077343', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3796, 'RIC-0302', 'DULCIGOMAS GRANEL', 'Dulcigomas Granel - 1 Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '074323077803', '', '10074323077800', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3797, 'RIC-0303', 'GOMILOCAS DIENTES GRANEL', 'Gomilocas D. Granel - 1 Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '757528007195', '', '10757528007192', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3798, 'RIC-0304', 'CHOCORETA GRANEL', 'Chocoreta Granel - 500g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '757528016395', '', '10757528016392', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3799, 'RIC-0305', 'PASITAS CON CHOCOLATE GRANEL', 'Pasita Choc. granel - 500g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '757528016418', '', '10757528016415', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3800, 'RIC-0306', 'HUEVITO PINTO GRANEL', 'Huevito P. Granel - 1 Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501025955083', '', '17501025955080', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3801, 'RIC-0307', 'KRANKY GRANEL', 'Kranky granel - 500g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '757528016401', '', '10757528016408', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3802, 'RIC-0308', 'ALMENDRAS CONFITADAS GRANEL', 'Almendra Granel - 500g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '757528016388', '', '10757528016385', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3803, 'RIC-0309', 'GOMITAS MANITAS GRANEL', 'Manitas G. -  1kg', 1.00, 1, 10, 1.00, 10.00, 2.50, 5.00, 3.00, '757528023706', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3804, 'RIC-0310', 'GOMITAS TARRITOS GRANEL', 'Tarritos G. -  1kg', 1.00, 1, 10, 1.00, 10.00, 2.50, 5.00, 3.00, '757528023737', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3805, 'RIC-0401', 'CHOCORETA GRANEL', 'Chocoreta Granel - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '757528016395', '', '10757528016392', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3806, 'RIC-0402', 'PASITAS CON CHOCOLATE GRANEL', 'Pasita Choc. granel - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '757528016418', '', '10757528016415', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3807, 'RIC-0403', 'KRANKY GRANEL', 'Kranky granel - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '757528016401', '', '10757528016408', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3808, 'RIC-0404', 'ALMENDRAS CONFITADAS GRANEL', 'Almendra Granel - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '757528016388', '', '10757528016385', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3809, 'RIC-0501', 'CHOCORETAS', 'Chocoreta - 44g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '074323078688', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3810, 'RIC-0502', 'DULCIGOMAS', 'Dulcigomas - 45.5g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '074323092486', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3811, 'RIC-0503', 'KRANKY', 'Kranky - 40g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '074323096989', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3812, 'RIC-0504', 'PANDITAS', 'Panditas  - 45g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '074323077827', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3813, 'RIC-0505', 'CHOCORETAS (70)', 'Chocoreta - 70g', 1.00, 10, 6, 10.00, 60.00, 2.50, 5.00, 3.00, '757528022532', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3814, 'RIC-0506', 'DULCIGOMAS (70)', 'Dulcigomas - 70g', 1.00, 12, 5, 12.00, 60.00, 2.50, 5.00, 3.00, '757528022556', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3815, 'RIC-0507', 'KRANKY (70)', 'Kranky - 70g', 1.00, 10, 6, 10.00, 60.00, 2.50, 5.00, 3.00, '757528022549', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3816, 'RIC-0508', 'PANDITAS (70)', 'Panditas  - 70g', 1.00, 10, 6, 10.00, 60.00, 2.50, 5.00, 3.00, '757528022587', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3817, 'RIC-0509', 'PANDITAS ACIDOS (70)', 'Panditas  Acidos - 70g', 1.00, 10, 6, 10.00, 60.00, 2.50, 5.00, 3.00, '757528022570', '', '', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3818, 'SAN-0102', 'PON PONS SOBRE', 'Pon Pons sobre - 50g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501006402155', '', '7501006402162', NULL, 1, '2018-06-13 15:54:42', '2018-06-13 15:54:42', NULL),
(3819, 'SAN-0103', 'PON PONS CAJITA', 'Pon Pons caj. - 50g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501006404036', '', '7501006404043', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3820, 'SAP-0101', 'ACEITUNA NEGRA KALAMATA', 'Aceituna Negra Kalamata 2kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '#N/A', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3821, 'SAP-0102', 'ACEITUNA NEGRA KALAMATA', 'Aceituna Negra Kalamata 5kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3822, 'SAP-0103', 'ACEITUNA NEGRA KALAMATA', 'Aceituna Negra Kalamata 12kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3823, 'SAP-0201', 'ACEITUNA NEGRA COLOSAL', 'Aceituna Negra Colosal 2kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3824, 'SAP-0202', 'ACEITUNA NEGRA COLOSAL', 'Aceituna Negra Colosal 12kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3825, 'SKI-0101', 'SKITTLES ORIGINAL', 'SKI original - 61.5g', 1.00, 36, 1, 36.00, 36.00, 2.50, 5.00, 3.00, '7502226811871', '7502226811888', '10040000011603', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3826, 'SKI-0102', 'SKITTLES WILD BERRY', 'SKI Wild Berry - 61.5g', 1.00, 36, 1, 36.00, 36.00, 2.50, 5.00, 3.00, '7502226811819', '7502226811826', '10040000011627', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3827, 'SKI-0103', 'SKITTLES CORES', 'SKI Cores - 56g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7502226812373', '7502226812366', '10040000297939', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3828, 'SKI-0104', 'SKITTLES SOUR', 'SKI Sour - 51g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7502226811857', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3829, 'SKI-0105', 'SKITTLES TROPICAL', 'SKI Tropical - 61.5g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '7502226814445', '7502226814407', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3830, 'SKI-0106', 'SKITTLES ORIGINAL v2', 'SKI original v2 - 61.5g', 1.00, 36, 1, 36.00, 36.00, 2.50, 5.00, 3.00, '022000018465', '022000136251', '10022000252699', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3831, 'SKI-0107', 'SKITTLES WILD BERRY v2', 'SKI WB v2- 61.5g', 1.00, 36, 1, 36.00, 36.00, 2.50, 5.00, 3.00, '22000018489', '22000136268', '10022000252705', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3832, 'SKI-0108', 'SKITTLES SWEET & SOURS', 'SKI ST & Sours - 56.7g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '022000017352', '022000124739', '10022000251319', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3833, 'SKI-0201', 'SKITTLES ORIGINAL PEG PK', 'SKI original peg pk 204.1g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '040000140924', '', '10040000140921', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3834, 'SKI-0202', 'SKITTLES WILD BERRY PEG PK', 'SKI Wild Berry peg pk 204.1g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '040000141150', '', '10040000141157', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3835, 'SKI-0203', 'SKITTLES WILD BERRY + TROPICAL', 'SKI WB + Trop - 204.1g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '022000073563', '', '10022000265866', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3836, 'SKI-0301', 'SKITTLES CRAZY CORES CAJITA', 'SKI Crazy Cores caj. 113.4g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '040000298038', '', '10040000298035', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3837, 'SKI-0302', 'SKITTLES ORIGINAL CAJITA', 'SKI original caja 113.4g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '040000322511', '', '10040000322518', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3838, 'SKI-0401', 'SKITTLES/STARBURST FUN SIZE MIX', 'SKA/STA fun size mix 904.4g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '040000347873', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3839, 'SKI-0402', 'SKITTLES ORIGINAL BAG', 'SKI original bag 396.9g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '40000248729', '', '10040000248726', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3840, 'SKI-0501', 'SKITTLES ORIGINAL GRANEL', 'SKI original granel 1KG', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050056993342', '', '20500569933428', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3841, 'SKI-0502', 'SKITTLES WILD BERRY GRANEL', 'SKI Wild Berry granel 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050056993359', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3842, 'SKI-0503', 'SKITTLES WB + TROPICAL GRANEL', 'SKI WB + Tropical granel 1kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411854', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3843, 'STA-0101', 'STABURST GUMMIBURST PEG PK', 'STA GummiburSTA peg pk 170.1g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '040000162643', '', '10040000162640', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3844, 'STA-0102', 'STARBURST ORIGINAL', 'STA original - 58.7g', 1.00, 36, 1, 36.00, 36.00, 2.50, 5.00, 3.00, '7502226811796', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3845, 'STA-0202', 'STARBURST GUMMIBURST CAJITA', 'STA GummiburSTA caja 85g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '040000162612', '', '10040000162619', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3846, 'STA-0203', 'STARBURST GUMMIBURST', 'STA GummiburSTA 42.5g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7502226811833', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3847, 'SUP-0101', 'BIG BEN SURTIDO CLASICO', 'Big Ben S. Clasico - 600g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993012994', '', '17702993012991', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3848, 'SUP-0102', 'BIG BEN CHOCOLATE BLANCO', 'Big Ben Chocolate B. - 400g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993022924', '', '17702993024734', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3849, 'SUP-0103', 'BIG BEN CHOCOLATE', 'Big Ben Chocolate - 400g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993902103', '', '17702993010744', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3850, 'SUP-0201', 'MENTA CHAO', 'Menta Chao - 380g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993012871', '', '17702993019662', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3851, 'SUP-0202', 'MENTA CHAO LIMON', 'Menta Chao L.- 380g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993025963', '', '17702993027087', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3852, 'SUP-0301', 'OKA LOKA NANOS BOLSA', 'Oka Loka N. - 288g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993018200', '', '17702993018450', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3853, 'SUP-0302', 'OKA LOKA NANOS DISPLAY (40g)', 'Oka Loka - 40g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7702993016558', '7702993016572', '17702993016579', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3854, 'SUP-0303', 'OKA LOKA MEZCLA LOKA', 'Oka Loka M. Loka - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993020920', '', '17702993021122', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3855, 'SUP-0304', 'OKA LOKA FUSION', NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7702993019573', '7702993019580', '17702993020309', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3856, 'SUP-0305', 'OKA LOKA SPIN', 'Oka Loka Spin - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7702993021385', '7702993021378', '17702993021375', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3857, 'SUP-0306', 'OKA LOKA NANOS DISPALY UVA SANDIA (40g)', 'Oka Loka Uva/Sandia- 40g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7702993016589', '7702993020791', '17702993026271', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3858, 'SUP-0307', 'OKA LOKA NANOS DISPLAY FRESA LIMON (40g)', 'Oka Loka Fresa/Limon - 40g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7702993016558', '7702993016572', '17702993026264', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3859, 'SUP-0308', 'OKA LOKA FUSION FRESA (ROJO)', 'Oka Loka F Fresa - 14g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7702993019573', '7702993020784', '17702993021269', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3860, 'SUP-0309', 'OKA LOKA FUSION FRAMBUESA (AZUL)', 'Oka Loka F Frambuesa - 14g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7702993019887', '7702993028124', '17702993028138', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3861, 'SUP-0310', 'OKA LOKA OVNIS', 'Oka Loka Ovnis - 35g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7702993028391', '7702993028384', '17702993029166', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3862, 'SUP-0311', 'OKA LOKA CHICLE EN POLVO', 'Oka Loka Chicle P - 15g', 1.00, 12, 12, 12.00, 144.00, 2.50, 5.00, 3.00, '7702993027264', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3863, 'SUP-0312', 'OKA LOKA CHICLE EN POLVO (ROSA)', 'Oka Loka C P rosa - 15g', 1.00, 12, 12, 12.00, 144.00, 2.50, 5.00, 3.00, '7702993027264', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3864, 'SUP-0313', 'OKA LOKA CHICLE EN POLVO (AZUL)', 'Oka Loka C P Azul - 15g', 1.00, 12, 12, 12.00, 144.00, 2.50, 5.00, 3.00, '7702993027271', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3865, 'SUP-0401', NULL, NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993023662', '', '17702993024827', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3866, 'SUP-0402', NULL, NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993022740', '', '17702993026300', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3867, 'SUP-0501', 'TRULULU FRUTAS', 'Trululu Frutas - 700g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993025710', '', '17702993026653', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3868, 'SUP-0502', 'TRULULU SABORES', 'Trululu Sabores - 35g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7702993018828', '7702993018835', '17702993018832', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3869, 'SUP-0503', 'TRULULU CASQUITOS', 'Trululu casquitos - 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '2050081599434', '', '17702993023195', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3870, 'SUP-0601', 'BARRILETE', 'Barrilete - 400g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993602508', '', '17702993011161', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3871, 'SUP-0701', 'KRAMEL', 'Kramel - 400g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993152102', '', '17702993017729', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3872, 'SUP-0703', 'CAFE GURME', 'Cafe Gurme - 400g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993182109', '', '17702993010690', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3873, 'SUP-0801', 'SUPERCOCO PALETA', 'Supercoco P. - 384g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993016022', '', '17702993018122', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3874, 'SUP-0901', 'CHOCOLORES GOMAS', 'Chocolores G. 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7702993016206', '7702993016541', '17702993016548', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3875, 'SUP-0902', 'CHOCOLORES GOMAS GRANEL', 'Chocolores Gomas G. 1Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7702993023105', '', '1770299303137', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3876, 'SUP-1101', 'TRULULU SABORES GRANEL', 'Trululu Sabores Granel - 1 Kg', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245411878', '', '17502245411875', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3877, 'TOP-0101', 'RING POP DISPLAY', 'Ring Pop display - 14g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '041116206252', '41116006258', '10041116106252', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3878, 'TOP-0102', 'PUSH POP', 'Push Pop - 14g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '041116209031', '41116009037', '10041116109031', 10, 1, '2018-06-13 15:54:43', '2018-07-23 23:01:46', NULL),
(3879, 'TOP-0103', 'BOTTLE POP', 'Bottle Pop (18) - 31g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '041116204777', '41116004773', '10041116104777', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3880, 'TOP-0104', 'BAZOOKA BUBBLE JUICE', 'Bazooka Bubble Juice - 56g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '041116002946', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3881, 'TOP-0105', 'BOTTLE POP', 'Bottle Pop (12) - 31g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '041116204777', '041116004360', '10041116104364', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3882, 'TOP-0106', 'PUSH POP JUMBO', 'Push pop Jumbo - 30g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '41116005275', '41116006265', '10041116106269', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3883, 'TOP-0107', 'TRIPLE PUSH POP', 'Triple Push pop  - 34g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '41116004926', '41116104923', '10041116204927', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3884, 'TOP-0108', 'JUICY DROP', 'Juicy Drop - 26g', 1.00, 21, 1, 21.00, 21.00, 2.50, 5.00, 3.00, '041116005923', '041116009150', '10041116109154', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3885, 'TOP-0109', 'SLIDERZ', 'Slider - 14g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '41116005282', '41116105289', '10041116205283', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3886, 'TOP-0110', 'RING POP PROMOCIONAL', 'Ring Pop Promo - 14g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '041116206252', '41116006258', '10041116106252', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3887, 'TOP-0111', 'RING POP DISPLAY (12)', 'Ring Pop display (12) - 14g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '041116206252', '7502245411007', '17502245411004', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3888, 'TOP-0112', 'RING POP MINIONS', 'Ring Pop Minions - 14g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '7502245411717', '7502245411724', '17502245411721', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3889, 'TOP-0113', 'BOTTLE POP MINIONS', 'Bottle Pop Minions - 31g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502245411731', '7502245411748', '17502245411745', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3890, 'TOP-0201', 'RING POP VITROLERO ESFERA', 'Ring pop Vit Esf - 336g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410987', '', '17502245410984', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3891, 'TOP-0202', 'PUSH POP VITROLERO ESFERA', 'Push pop Vit Esf - 504g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7502245410994', '', '17502245410991', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3892, 'TOP-0203', 'RING POP VITROLERO', 'Ring pop Vit - 490g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '041116506512', '', '10041116506519', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3893, 'TOP-0301', 'PUSH POP MASCOTAS', 'Push Pop Mascotas - 112g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7798040460917', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3894, 'TUR-0101', 'CONEJO TURIN', 'Conejo Turin - 20g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '756774011567', '7546774012564', '10756774011564', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3895, 'TUR-0102', 'BARRA CHOCOLATE CON LECHE', 'Barra Leche - 18g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '756774011741', '756774013745', '10756774013742', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3896, 'TUR-0103', 'BARRA CHOCOLATE AMARGO SIN AZUCAR', 'Barra Amargo SA - 18g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '756774011727', '756774013721', '10756774013728', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3897, 'TUR-0104', 'BARRA CHOCOLATE EXOTICAS NUEZ', 'Barra Exoticas - 18g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '756774011895', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3898, 'TUR-0105', 'BARRA CHOCOLATE AMARGO S/ AZUCAR', 'Barra Amargo SA - 18g (5)', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '756774011727', '756774013721', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3899, 'TUR-0106', 'BARRA CHOCOLATE 70% CACAO', 'Barra 70% Cacao - 18g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '756774011734', '756774013738', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3900, 'TUR-0107', 'BARRA CHOCOLATE EXOTICAS OREO', 'Barra Exoticas Oreo - 18g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '756774011871', '756774013875', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3901, 'TUR-0108', 'BARRA CHOCOLATE EXOTICAS ALMENDRA', 'Barra Exoticas Alm - 18g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '756774011888', '756774013882', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3902, 'TUR-0109', 'BAILEYS 3 PACK', 'Baileys 3 pk - 30g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '756774013042', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3903, 'TUR-0111', 'CONEJO BOLSA TURIN', 'Conejo Turin - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7501008360071', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3904, 'TUR-0112', 'KAHLUA SLIM', 'Kahlua Slim - 80g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '756774054830', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3905, 'TUR-0113', 'BAILEYS SLIM', 'Baileys Slim - 80g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '756774054847', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3906, 'TUR-0114', 'JOSE CUERVO SLIM', 'Jose Cuervo Slim - 80g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '756774054854', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3907, 'TUR-0115', 'SNACKS ARANDANOS', 'Snack Arand - 33g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '756774061203', '756774062200', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3908, 'TUR-0116', 'SNACKS ALMENDRAS', 'Snack Alm - 30g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '756774061210', '756774062217', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3909, 'TUR-0117', 'SNACKS PASITAS', 'Snack Pasitas - 33g', 1.00, 8, 1, 8.00, 8.00, 2.50, 5.00, 3.00, '756774061197', '756774062194', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3910, 'TUR-0118', 'KAHLUA 3 PACK', 'Kahlua 3 pk - 30g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '756774013059', '7567740140566', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3911, 'TUR-0119', 'JOSE CUERVO 3 PACK', 'Jose cuervo 3 pk - 30g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '756774013073', '756774014070', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3912, 'TUR-0120', 'JOHNNIE WALKER 3 PACK', 'Johnnie Walker 3 pk - 30g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '756774013066', '756774014063', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3913, 'TUR-0121', 'BAILEYS ORIGINAL TUBO', 'Baileys Tubo - 200g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '756774024895', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3914, 'VAL-0101', 'VALOR DARK C/ALM 70%', 'Valor dark c/alm 70% 150g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8410109050912', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3915, 'VAL-0102', 'VALOR DARK C/ALM 52%', 'Valor dark c/alm 52% 150g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8410109050929', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3916, 'VAL-0103', 'VALOR CHOCOLATE MILK C/ALM', 'Valor milk c/alm 150g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8410109050936', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3917, 'VAL-0104', 'CHOCOLATE DARK C/ALM S/AZUCAR', 'Valor dark c/alm s/az 150g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8410109003178', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3918, 'VAL-0105', 'CHOCOLATE MILK S/AZUCAR', 'Chocol Milk s/az 150g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8410109003192', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3919, 'VAL-0106', 'CHOCOLATE MILK C/ALM S/AZUCAR', 'Valor milk c/alm s/az 150g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8410109003208', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3920, 'VAL-0107', 'VALOR CHOC SURT. P SECRET', 'Valor Choc Surt P. Secret - 190g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8410109006384', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3921, 'VAL-0108', 'VALOR DARK 70% P SECRETOS', 'Valor Dark 70% P Secret 190g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8410109006391', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3922, 'VIL-0101', 'AGAVE BITES FRESA', 'Agave B. Fresa - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503010857433', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3923, 'VIL-0102', 'AGAVE BITES GUAYABA', 'Agave B. Guayaba - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503010857440', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3924, 'VIL-0103', 'AGAVE BITES MANGO', 'Agave B. Mango - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503010857570', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3925, 'VIL-0104', 'AGAVE BITES MARACUYA', 'Agave B. Maracuya - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503010857297', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3926, 'VIL-0105', 'AGAVE BITES TAMARINDO', 'Agave B. Tamarindo - 100g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '7503010857464', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3927, 'VIL-0201', 'AGAVE BITES FRESA (190)', 'Agave B. Fresa - 190g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503010857310', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3928, 'VIL-0202', 'AGAVE BITES GUAYABA (190)', 'Agave B. Guayaba - 190g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503010857426', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3929, 'VIL-0203', 'AGAVE BITES MANGO (190)', 'Agave B. Mango - 190g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503010857365', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3930, 'VIL-0204', 'AGAVE BITES MARACUYA (190)', 'Agave B. Maracuya - 190g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503010857334', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3931, 'VIL-0205', 'AGAVE BITES TAMARINDO (190)', 'Agave B. Tamarindo - 190g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '7503010857327', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3932, 'VIL-0301', 'ESTRELLA ENCHILADA MANGO', 'Estrella E. Mango - 1Kg', 1.00, 1, 3, 1.00, 3.00, 2.50, 5.00, 3.00, ' 11 ', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3933, 'VIL-0302', 'GOTITA MENTA FRESCA', 'Gotita M Fresca - 1Kg', 1.00, 1, 3, 1.00, 3.00, 2.50, 5.00, 3.00, ' 12 ', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3934, 'VIL-0303', 'GOTITA MARACUYA', 'Gotita Maracuya - 1Kg', 1.00, 1, 3, 1.00, 3.00, 2.50, 5.00, 3.00, ' 12 ', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3935, 'VIL-0304', 'GOTITA PEPINO ENCHILADO', 'Gotita Pepino E.  - 1Kg', 1.00, 1, 3, 1.00, 3.00, 2.50, 5.00, 3.00, ' 12 ', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3936, 'VIL-0305', 'GOTITA YOGURT DURAZNO', 'Gotita Y. Durazno  - 1Kg', 1.00, 1, 3, 1.00, 3.00, 2.50, 5.00, 3.00, ' 12 ', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3937, 'WIN-0101', 'CUADRETA ORIGINAL T7 CEREZA', 'Cuadreta O. T7 cereza - 18g', 1.00, 12, 24, 12.00, 288.00, 2.50, 5.00, 3.00, '754177505829', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3938, 'WIN-0102', 'CUADRETA ORIGINAL T7 UVA', 'Cuadreta O. T7 Uva - 18g', 1.00, 12, 24, 12.00, 288.00, 2.50, 5.00, 3.00, '754177505805', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3939, 'WIN-0103', 'CUBO RELLENO CHILITO', 'Cubo relleno CH - 36g', 1.00, 12, 6, 12.00, 72.00, 2.50, 5.00, 3.00, '754177505607', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3940, 'WIN-0104', 'CUBO RELLENO ACIDITO', 'Cubo relleno AC - 36g', 1.00, 12, 6, 12.00, 72.00, 2.50, 5.00, 3.00, '754177506437', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3941, 'WOM-0101', 'B-POP BLUE', 'B Pop Blue - 15g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124850460', '8435124850477', '18435124850078', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3942, 'WOM-0102', 'B POP VAMP', 'B Pop Vamp - 15g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124850835', '8435124850842', '18435124851785', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3943, 'WOM-0103', 'B POP BUNNY', 'B Pop Bunny - 15g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124852884', '8435124852891', '8435124851313', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3944, 'WOM-0104', 'B POP BONE', 'B Pop Bone - 15g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124851290', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3945, 'WOM-0105', 'FIERAS POP', 'Fieras Pop - 15g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124851511', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3946, 'WOM-0106', 'B-POP MIX (TORRE)', 'B-Pop Mix (torre) - 15g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '8435124851603', '', '18435124851600', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3947, 'WOM-0108', 'PICA D2', 'Pica D2 - 38g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124852419', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3948, 'WOM-0109', 'EMOTIPOP STAND', 'Emotipop stand - 15g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124852020', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3949, 'WOM-0110', 'EMOTIPOP HUEVO CARTOON', 'Emotipop Hvo Cartoon 15g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '8435124852471', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3950, 'WOM-0111', 'POP & BALL', 'Pop & Ball - 17g', 1.00, 18, 1, 18.00, 18.00, 2.50, 5.00, 3.00, '8435124853287', '8435124853270', '18435124853284', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3951, 'WOM-0112', 'THUMB DIPPER 2', 'Thumb dipper - 38g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124854208', '8435124854093', '18435124854090', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3952, 'WOM-0113', 'B POP', 'B Pop - 15g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124850460', '8435124850477', '18435124850078', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3953, 'WOM-0114', 'KISS POP', 'Kiss pop - 15g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '8435124853935', '8435124853928', '18435124853925', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3954, 'WOM-0115', 'KISS POP TIRA', 'Kiss pop tira - 15g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '8435124853898', '8435124854215', '18435124854236', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3955, 'WOM-0116', 'MUSTACHO', 'Mustacho - 15g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '8435124854178', '8435124854185', '18435124854182', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3956, 'WOM-0117', 'MUSTACHO TIRA', 'Mustacho Tira - 15g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '8435124854147', '8435124854215', '18435124854212', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3957, 'WOM-0118', 'B POP (IMMEX)', 'B Pop Im - 15g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124850460', '8435124850477', '18435124850078', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3958, 'WOM-0119', 'B POP', 'B Pop (10) - 15g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '8435124850460', '8435124850477', '18435124850078', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3959, 'WOM-0201', 'CHICK & CHAT GALLINA', 'Chick&Chat Gallina - 6g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '8435124850644', '8435124850651', '8435124850668', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3960, 'WOM-0202', 'CHICKEN INVADERS', 'Chicken Invaders - 6g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '823710696079', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3961, 'WOM-0203', 'CHICKEN CHAT FOOTBALL', 'Chick&Chat Fut - 6g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '8435124852976', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3962, 'WOM-0204', 'CHICKEN KLAUS', 'Chicken Klaus - 6g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '8435124853126', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3963, 'WOM-0205', 'DULCE CON GALLINA DE REGALO', 'Dulce Gallina 6g', 1.00, 16, 1, 16.00, 16.00, 2.50, 5.00, 3.00, '8435124850644', '8435124850651', '8435124850668', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3964, 'WOM-0301', 'PALETA BOB ESPONJA', 'Paleta Bob Esponja - 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124852310', '8435124852327', '18435124852331', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3965, 'WOM-0302', 'PALETA ROSITA FRESITA', 'Paleta Rosita Fresita 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124853003', '8435124852990', '18435124853000', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3966, 'WOM-0401', 'ALGOTRON', 'Algotron - 10g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124852914', '8435124852921', '18435124852911', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3967, 'WOM-0402', 'THUMB DIPPERS', 'Thumb Dippers - 43g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124850705', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3968, 'WOM-0403', 'SAFARI POP', 'Safari Pop - 10g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '8435124851054', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3969, 'WOM-0404', 'CHICKEN LEG', 'Chicken Leg - 20g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '8435124851009', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3970, 'WOM-0405', 'BUNNY', 'Bunny - 10g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '8435124851665', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL);
INSERT INTO `products` (`id`, `sku`, `concept`, `alias`, `weight_per_piece`, `items_per_display`, `display_per_box`, `weight_per_display`, `weight_per_box`, `width`, `height`, `depth`, `barcode`, `display_barcode`, `corrugated_barcode`, `caducidad_minima`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3971, 'WOM-0406', 'THUMB SUCKER 6X12', 'Thumb Sucker 6x12- 27g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '8435124851047', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3972, 'WOM-0407', 'BABY FOOT', 'Baby Foot - 20g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '8435124852211', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3973, 'WON-0101', 'SWETARTS', 'Swetarts - 51g', 1.00, 36, 1, 36.00, 36.00, 2.50, 5.00, 3.00, '7916423', '79200136468', '00079200136062', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3974, 'WON-0102', 'NERDS UVA FRESA', 'Nerds uva fresa - 46.7g', 1.00, 36, 1, 36.00, 36.00, 2.50, 5.00, 3.00, '79200370107', '79200240004', '00079200369859', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3975, 'WON-0103', 'SWEETARTS GUMMY BUGS', 'Sweetarts gummy bugs 42.5g', 1.00, 24, 1, 24.00, 24.00, 2.50, 5.00, 3.00, '79200136284', '79200136291', '00079200136307', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3976, 'WRI-0101', 'GOMA DE MASCAR WINTERFRESH', 'Winterfresh 40.5g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502226811680', '7502226811703', '17502226811748', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3977, 'WRI-0102', 'GOMA DE MASCAR WINTERFRESH', 'Winterfresh 13.5g', 1.00, 20, 1, 20.00, 20.00, 2.50, 5.00, 3.00, '75034177', '7502226811727', '17502226811762', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3978, 'WRI-0201', 'GOMA DE MASCAR DOUBLEMINT', 'Doublemint 40.5g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502226811673', '7502226811697', '17502226811731', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3979, 'WRI-0202', 'GOMA DE MASCAR DOUBLEMINT', 'Doublemint 13.5g', 1.00, 20, 1, 20.00, 20.00, 2.50, 5.00, 3.00, '75034184', '7502226811710', '17502226811755', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3980, 'WRI-0203', 'GOMA DE MASCAR DOUBLEMINT (8)', 'Doublemint 11.2g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226813455', '7502226813448', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3981, 'WRI-0301', 'GOMA DE MASCAR FRUTAS ORBIT 14''s', 'Orbit frutas 26.6g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226810027', '7502226810065', '10022000214895', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3982, 'WRI-0302', 'GOMA DE MASCAR YERBABUENA ORBIT 14''s', 'Orbit yerb 26.6g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '022000012173', '022000116604', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3983, 'WRI-0303', 'GOMA DE MASCAR MENTA ORBIT 14''s', 'Orbit menta 26.6g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '022000012197', '7502226810089', '10022000214864', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3984, 'WRI-0304', 'GOMA DE MASCAR YERBABUENA ORBIT', 'Orbit yerb 11.2g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226811567', '7502226811574', '17502226811588', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3985, 'WRI-0305', 'GOMA DE MASCAR MENTA ORBIT', 'Orbit menta 11.2g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226811598', '7502226811604', '17502226811618', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3986, 'WRI-0306', 'GOMA DE MASCAR FRUTAS ORBIT', 'Orbit frutas 11.2g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226811628', '7502226811635', '17502226811649', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3987, 'WRI-0307', 'GOMA DE MASCAR ORBIT SANDIA', NULL, 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226811536', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3988, 'WRI-0308', 'GOMA DE MASCAR FRESA ORBIT', 'Orbit Fresa 11.2g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226813301', '7502226813295', '17502226813285', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3989, 'WRI-0309', 'GOMA DE MASCAR ORBIT FRESA', 'Orbit Fresa 10.6g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226814292', '7502226814285', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3990, 'WRI-0310', 'GOMA DE MASCAR POLAR MINT ORBIT', 'Orbit Polar Mint 11.2g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '7502226812533', '7502226812526', '17502226812516', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3991, 'WRI-0401', 'GOMA DE MASCAR JUICY FRUIT', 'Juicy Fruit 40.5g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '7502226812304', '7502226812298', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3992, 'WRI-0402', 'GOMA DE MASCAR BIG RED', 'Big Red 40.5g', 1.00, 10, 12, 10.00, 120.00, 2.50, 5.00, 3.00, '022000006684', '022000106995', '10022000217377', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3993, 'WRI-0403', 'GOMA DE MASCAR SPEARMINT', 'Spearmint 40.5g', 1.00, 10, 12, 10.00, 120.00, 2.50, 5.00, 3.00, '022000006653', '022000106964', '10022000217346', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3994, 'WRI-0501', 'HUBBA BUBBA ORIGINAL', 'H Bubba 56.7g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '022110079806', '7502226812762', '17502226812752', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3995, 'WRI-0502', 'HUBBA BUBBA UVA', 'H Bubba Uva 56.7g', 1.00, 6, 1, 6.00, 6.00, 2.50, 5.00, 3.00, '93613583', '750222681274 8', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3996, 'WRI-0503', 'HUBBA BUBBA NAVIDAD', 'H Bubba Nav 56.7g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '022000011480', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3997, 'WRI-0504', 'HUBBA BUBBA TRIPLE TREAT', 'H Bubba Triple 56.7g', 1.00, 6, 24, 6.00, 144.00, 2.50, 5.00, 3.00, '7502226814476', '7502226814469', '17502226814459', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3998, 'WRI-0601', 'GOMA DE MASCAR YERBABUENA ORBIT 5''s', 'Orbit yerb 9.5g', 1.00, 15, 1, 15.00, 15.00, 2.50, 5.00, 3.00, '022000000514', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(3999, 'WRI-0602', 'GOMA DE MASCAR MENTA ORBIT 5''s', 'Orbit Menta 9.5g', 1.00, 15, 1, 15.00, 15.00, 2.50, 5.00, 3.00, '022000000507', '', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4000, 'WRI-0701', 'GOMA DE MASCAR 5 COBALT', '5 Cobalt 40g', 1.00, 10, 12, 10.00, 120.00, 2.50, 5.00, 3.00, '022000018779', '022000111098', '10022000252927', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4001, 'WRI-0801', 'GOMA DE MASCAR ORBIT MENTA SLIMPACK', 'Orbit Menta Slimt 40g', 1.00, 10, 12, 10.00, 120.00, 2.50, 5.00, 3.00, '022000020925', '022000124166', '10022000241792', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4002, 'WRI-0802', 'GOMA DE MASCAR ORBIT HIERBABUENA SLIMPACK', 'Orbit Hierbabuena Slimt 40g', 1.00, 10, 12, 10.00, 120.00, 2.50, 5.00, 3.00, '22000020918', '022000124180', '10022000241969', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4003, 'ZAI-0101', 'GRANDE ASSORTIMENTO', 'Gde Assort - 350g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735035186', '', '8004735019940', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4004, 'ZAI-0102', 'FANTASIA RIPIENA', 'Fant Ripiena - 350g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735035193', '', '8004735019957', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4005, 'ZAI-0103', 'BOERI', 'Boeri - 350g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735030549', '', '8004735019933', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4006, 'ZAI-0104', 'CREMINI', 'Cremini - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735035179', '', '8004735019926', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4007, 'ZAI-0201', 'COCOA AND RUM FILLED PRALINES', 'C&R Filled Pralines - 240g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735032604', '', '8004735018165', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4008, 'ZAI-0202', 'BOERI', 'Boeri - 240g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735032598', '', '8004735018158', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4009, 'ZAI-0203', 'PEAR AND CHOCOLATE FILLED PRALINES', 'P&C Filled Pralines - 240g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735032611', '', '8004735018172', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4010, 'ZAI-0204', 'GIANDUIOTTI', 'Gianduiotti - 200g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735031966', '', '8004735019421', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4011, 'ZAI-0301', 'MILANO GIANDUIOTTI', 'Milano Giand - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735035308', '', '8004735070910', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4012, 'ZAI-0302', 'MILANO CREMINI', 'Milani Crem - 120g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735035315', '', '8004735070927', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4013, 'ZAI-0303', 'CREMINI  MILANO', 'Cremini Milano - 240g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735035292', '', '8004735070903', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4014, 'ZAI-0304', 'BOERI MILANO', 'Boeri Milano - 285g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735035278', '', '8004735070880', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4015, 'ZAI-0401', 'CARAMELLONE JELLIES', 'Caramell Jellies - 175g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735061109', '', '8004735018035', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4016, 'ZAI-0402', 'FRUIT JELLIES BOX', 'F. Jellies Box - 300g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '8004735061130', '', '8004735019445', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4017, 'ZUP-0101', 'CUCHARA MIX MANGO/TAMARINDO', 'Cuch Mix mango/tamar 20g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '703885001536', '703885061530', '20703885061534', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4018, 'ZUP-0102', 'CUCHARA MIX MANGO/TAMARINDO 4 PACK', 'Cuch mang/tam 4 pck 20g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '703885051531', '', '703885351532', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4019, 'ZUP-0103', 'CUCHARA MIX SANDIA/TAMARINDO 4 PACK', NULL, 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '703885051555', '', '703885351556', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4020, 'ZUP-0201', 'ZUMBALETA TAMARINDO', 'Zumbaleta tamarindo - 30g', 1.00, 10, 1, 10.00, 10.00, 2.50, 5.00, 3.00, '703885000621', '703885060625', '20703885000625', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4021, 'ZUP-0202', 'TIROLO', 'Tirolo - 26g', 1.00, 12, 1, 12.00, 12.00, 2.50, 5.00, 3.00, '703885003806', '703885063800', '20703885063804', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4022, 'ZUP-0203', 'ZUMBA RICA', 'Zumba Rica - 20g', 1.00, 12, 24, 12.00, 288.00, 2.50, 5.00, 3.00, '713885006401', '703885066405', '', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4023, 'ZUP-0301', 'FORRITOS CHAMOY', 'Forritos chamoy - 380g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '703885063114', '', '703885263118', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4024, 'ZUP-0302', 'FORRITOS TAMARINDO.', 'Forritos tamarindo - 380g', 1.00, 1, 1, 1.00, 1.00, 2.50, 5.00, 3.00, '703885063121', '', '703885263125', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4025, 'ZUP-0401', 'TILIKO RELLENO MANGO TAMARINDO', 'Tiliko R. Mango Tam  - 400g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '703885015731 ', '', '20703885015735 ', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4026, 'ZUP-0402', 'TILIKO RELLENO SANDIA TAMARINDO', 'Tiliko R. Sandia Tam  - 400g', 1.00, 1, 12, 1.00, 12.00, 2.50, 5.00, 3.00, '703885015755 ', '', '20703885015759 ', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4027, 'ZUP-0501', 'ZUMBA GOMA BITES', 'Zumba G. Bites - 220g', 1.00, 1, 24, 1.00, 24.00, 2.50, 5.00, 3.00, '703885016332', '', '20703885016336', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4028, 'ZUP-0502', 'ZUMBA GOMA MANGO', 'Zumba G. Mango - 440g', 1.00, 1, 20, 1.00, 20.00, 2.50, 5.00, 3.00, '703885015229', '', '703885115226', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4029, 'ZUP-0503', 'ZUMBA GOMA SANDIA', 'Zumba G. Sandia - 440g', 1.00, 1, 20, 1.00, 20.00, 2.50, 5.00, 3.00, '703885015250', '', '20703885015254', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4030, 'ZUP-0601', 'ZUMBA GOMA BITES MIX GRANEL', 'Zumba G. Bites Mix- 1Kg', 1.00, 1, 3, 1.00, 3.00, 2.50, 5.00, 3.00, '703885096334 ', '', '703885396335 ', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4031, 'ZUP-0602', 'ZUMBA GOMA MANGO GRANEL', 'Zumba G. Mango Granel - 1Kg', 1.00, 1, 3, 1.00, 3.00, 2.50, 5.00, 3.00, '703885095221 ', '', '703885395222 ', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4032, 'ZUP-0603', 'ZUMBA GOMA SANDIA GRANEL', 'Zumba G. Sancia Granel - 1Kg', 1.00, 1, 3, 1.00, 3.00, 2.50, 5.00, 3.00, '703885095252 ', '', '703885395253 ', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL),
(4033, 'ZUP-0604', 'FORRITOS CONFITADOS MIX GRANEL', 'Forritos Mix Granel - 1Kg', 1.00, 1, 3, 1.00, 3.00, 2.50, 5.00, 3.00, '703885094910 ', '', '703885394911 ', NULL, 1, '2018-06-13 15:54:43', '2018-06-13 15:54:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(10) unsigned NOT NULL,
  `rol_id` int(10) unsigned DEFAULT NULL,
  `menu_item_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `rol_id`, `menu_item_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2018-06-13 14:43:56', '2018-06-13 14:43:56'),
(2, 1, 2, 1, '2018-06-13 14:44:42', '2018-06-13 14:44:42'),
(3, 1, 3, 1, '2018-06-13 14:45:17', '2018-06-13 14:45:17'),
(4, 1, 4, 1, '2018-06-13 14:45:38', '2018-06-13 14:45:38'),
(5, 1, 5, 1, '2018-06-13 14:46:36', '2018-06-13 14:46:36'),
(7, 1, 7, 1, '2018-06-13 14:47:45', '2018-06-13 14:47:45'),
(9, 1, 8, 1, '2018-06-13 18:18:53', '2018-06-13 18:18:53'),
(10, 1, 9, 1, '2018-06-13 18:20:13', '2018-06-13 18:20:13'),
(12, 4, 11, 2, '2018-06-13 18:46:55', '2018-06-13 18:46:55'),
(13, 1, 11, 2, '2018-06-13 18:46:58', '2018-06-13 18:46:58'),
(18, 1, 14, 1, '2018-06-22 18:58:34', '2018-06-22 18:58:34'),
(19, 4, 14, 1, '2018-06-22 18:58:39', '2018-06-22 18:58:39'),
(20, 1, 15, 1, '2018-06-22 19:01:18', '2018-06-22 19:01:18'),
(21, 2, 15, 1, '2018-06-22 19:01:21', '2018-06-22 19:01:21'),
(22, 1, 16, 1, '2018-06-22 19:14:05', '2018-06-22 19:14:05'),
(23, 2, 16, 1, '2018-06-22 19:14:08', '2018-06-22 19:14:08'),
(24, 5, 14, 1, '2018-06-22 19:23:58', '2018-06-22 19:23:58'),
(25, 3, 15, 1, '2018-06-22 19:24:08', '2018-06-22 19:24:08'),
(26, 4, 15, 1, '2018-06-22 19:24:10', '2018-06-22 19:24:10'),
(27, 5, 15, 1, '2018-06-22 19:24:12', '2018-06-22 19:24:12'),
(28, 6, 15, 1, '2018-06-22 19:24:16', '2018-06-22 19:24:16'),
(29, 7, 15, 1, '2018-06-22 19:24:24', '2018-06-22 19:24:24'),
(30, 8, 15, 1, '2018-06-22 19:24:27', '2018-06-22 19:24:27'),
(31, 9, 15, 1, '2018-06-22 19:24:30', '2018-06-22 19:24:30'),
(32, 10, 15, 1, '2018-06-22 19:24:41', '2018-06-22 19:24:41'),
(33, 11, 15, 1, '2018-06-22 19:24:44', '2018-06-22 19:24:44'),
(34, 12, 15, 1, '2018-06-22 19:24:47', '2018-06-22 19:24:47'),
(35, 13, 15, 1, '2018-06-22 19:24:50', '2018-06-22 19:24:50'),
(36, 14, 15, 1, '2018-06-22 19:24:53', '2018-06-22 19:24:53'),
(37, 15, 15, 1, '2018-06-22 19:24:56', '2018-06-22 19:24:56'),
(38, 17, 15, 1, '2018-06-22 19:24:59', '2018-06-22 19:24:59'),
(39, 18, 15, 1, '2018-06-22 19:25:01', '2018-06-22 19:25:01'),
(40, 16, 15, 1, '2018-06-22 19:25:52', '2018-06-22 19:25:52'),
(41, 4, 16, 1, '2018-06-22 19:26:20', '2018-06-22 19:26:20'),
(42, 1, 17, 1, '2018-06-22 19:28:19', '2018-06-22 19:28:19'),
(43, 1, 18, 1, '2018-06-22 19:29:25', '2018-06-22 19:29:25'),
(44, 1, 19, 1, '2018-06-22 19:29:29', '2018-06-22 19:29:29'),
(45, 1, 21, 1, '2018-06-22 19:30:54', '2018-06-22 19:30:54'),
(46, 1, 20, 1, '2018-06-22 19:31:01', '2018-06-22 19:31:01'),
(47, 1, 22, 1, '2018-06-22 19:31:40', '2018-06-22 19:31:40'),
(48, 4, 23, 1, '2018-06-22 19:37:44', '2018-06-22 19:37:44'),
(49, 1, 24, 1, '2018-06-22 21:52:38', '2018-06-22 21:52:38'),
(50, 1, 29, 1, '2018-06-22 22:58:00', '2018-06-22 22:58:00'),
(51, 1, 28, 1, '2018-06-22 22:58:04', '2018-06-22 22:58:04'),
(52, 1, 27, 1, '2018-06-22 22:58:10', '2018-06-22 22:58:10'),
(53, 1, 26, 1, '2018-06-22 22:58:14', '2018-06-22 22:58:14'),
(54, 1, 25, 1, '2018-06-22 22:58:18', '2018-06-22 22:58:18'),
(55, 1, 30, 1, '2018-06-22 22:58:58', '2018-06-22 22:58:58'),
(56, 1, 32, 1, '2018-06-22 22:59:42', '2018-06-22 22:59:42'),
(57, 1, 31, 1, '2018-06-22 22:59:46', '2018-06-22 22:59:46'),
(58, 1, 33, 1, '2018-06-22 23:02:36', '2018-06-22 23:02:36'),
(59, 1, 35, 1, '2018-06-22 23:03:26', '2018-06-22 23:03:26'),
(60, 1, 36, 1, '2018-06-22 23:05:21', '2018-06-22 23:05:21'),
(61, 1, 37, 1, '2018-06-22 23:06:02', '2018-06-22 23:06:02'),
(62, 1, 38, 1, '2018-06-22 23:06:34', '2018-06-22 23:06:34'),
(63, 1, 39, 1, '2018-06-22 23:07:02', '2018-06-22 23:07:02'),
(64, 1, 40, 1, '2018-06-22 23:14:36', '2018-06-22 23:14:36'),
(65, 1, 41, 1, '2018-06-22 23:15:04', '2018-06-22 23:15:04'),
(66, 1, 42, 1, '2018-06-22 23:15:26', '2018-06-22 23:15:26'),
(67, 1, 43, 1, '2018-06-22 23:15:49', '2018-06-22 23:15:49'),
(68, 1, 44, 1, '2018-06-22 23:17:57', '2018-06-22 23:17:57'),
(69, 4, 45, 1, '2018-06-22 23:18:29', '2018-06-22 23:18:29'),
(70, 5, 45, 1, '2018-06-22 23:18:31', '2018-06-22 23:18:31'),
(71, 4, 46, 1, '2018-06-22 23:19:07', '2018-06-22 23:19:07'),
(72, 5, 46, 1, '2018-06-22 23:19:10', '2018-06-22 23:19:10'),
(73, 4, 47, 1, '2018-06-22 23:19:33', '2018-06-22 23:19:33'),
(74, 5, 47, 1, '2018-06-22 23:19:35', '2018-06-22 23:19:35'),
(75, 4, 48, 1, '2018-06-22 23:19:58', '2018-06-22 23:19:58'),
(76, 5, 48, 1, '2018-06-22 23:20:00', '2018-06-22 23:20:00'),
(77, 1, 49, 1, '2018-06-22 23:20:34', '2018-06-22 23:20:34'),
(78, 1, 50, 1, '2018-06-30 00:09:00', '2018-06-30 00:09:00'),
(79, 1, 34, 1, '2018-06-30 00:09:53', '2018-06-30 00:09:53'),
(80, 1, 51, 1, '2018-06-30 00:11:09', '2018-06-30 00:11:09'),
(81, 1, 48, 1, '2018-07-02 19:24:20', '2018-07-02 19:24:20'),
(82, 1, 46, 1, '2018-07-02 19:25:48', '2018-07-02 19:25:48'),
(83, 1, 52, 1, '2018-07-02 22:53:45', '2018-07-02 22:53:45'),
(84, 1, 53, 1, '2018-07-03 19:06:52', '2018-07-03 19:06:52'),
(85, 1, 54, 1, '2018-07-03 19:07:54', '2018-07-03 19:07:54'),
(86, 1, 55, 1, '2018-07-03 19:08:36', '2018-07-03 19:08:36'),
(87, 1, 56, 1, '2018-07-03 23:45:06', '2018-07-03 23:45:06'),
(88, 1, 57, 1, '2018-07-04 01:12:09', '2018-07-04 01:12:09'),
(89, 1, 58, 1, '2018-07-04 01:24:54', '2018-07-04 01:24:54'),
(91, 7, 59, 1, '2018-07-05 00:04:37', '2018-07-05 00:04:37'),
(92, 8, 50, 1, '2018-07-05 00:07:54', '2018-07-05 00:07:54'),
(93, 8, 51, 1, '2018-07-05 00:08:10', '2018-07-05 00:08:10'),
(94, 8, 57, 1, '2018-07-05 00:09:11', '2018-07-05 00:09:11'),
(95, 8, 56, 1, '2018-07-05 00:09:33', '2018-07-05 00:09:33'),
(96, 8, 52, 1, '2018-07-05 00:10:03', '2018-07-05 00:10:03'),
(97, 8, 58, 1, '2018-07-05 00:11:20', '2018-07-05 00:11:20'),
(98, 7, 60, 1, '2018-07-05 02:46:27', '2018-07-05 02:46:27'),
(99, 7, 61, 1, '2018-07-05 05:02:38', '2018-07-05 05:02:38'),
(100, 1, 62, 1, '2018-07-10 19:00:53', '2018-07-10 19:00:53'),
(101, 1, 63, 1, '2018-07-13 03:06:11', '2018-07-13 03:06:11'),
(102, 1, 64, 1, '2018-07-16 05:05:50', '2018-07-16 05:05:50'),
(103, 1, 65, 1, '2018-07-17 00:40:33', '2018-07-17 00:40:33'),
(104, 1, 66, 1, '2018-07-17 03:28:28', '2018-07-17 03:28:28'),
(105, 1, 67, 1, '2018-07-17 04:30:43', '2018-07-17 04:30:43'),
(106, 5, 12, 1, '2018-07-17 06:32:49', '2018-07-17 06:32:49'),
(107, 4, 5, 1, '2018-07-17 06:33:17', '2018-07-17 06:33:17'),
(108, 4, 21, 1, '2018-07-17 06:33:57', '2018-07-17 06:33:57'),
(109, 4, 22, 1, '2018-07-17 06:34:05', '2018-07-17 06:34:05'),
(110, 5, 23, 1, '2018-07-17 06:40:42', '2018-07-17 06:40:42'),
(111, 4, 44, 1, '2018-07-17 06:59:32', '2018-07-17 06:59:32'),
(112, 1, 68, 1, '2018-07-17 07:00:38', '2018-07-17 07:00:38'),
(113, 8, 68, 1, '2018-07-17 07:00:43', '2018-07-17 07:00:43'),
(114, 1, 69, 1, '2018-07-17 07:01:17', '2018-07-17 07:01:17'),
(115, 8, 69, 1, '2018-07-17 07:01:25', '2018-07-17 07:01:25'),
(116, 1, 70, 1, '2018-07-17 07:02:06', '2018-07-17 07:02:06'),
(117, 8, 70, 1, '2018-07-17 07:02:10', '2018-07-17 07:02:10'),
(118, 4, 8, 1, '2018-07-17 16:51:57', '2018-07-17 16:51:57'),
(119, 10, 8, 1, '2018-07-17 16:56:51', '2018-07-17 16:56:51'),
(120, 4, 71, 1, '2018-07-17 17:07:11', '2018-07-17 17:07:11'),
(121, 1, 71, 1, '2018-07-17 17:07:22', '2018-07-17 17:07:22'),
(122, 10, 72, 1, '2018-07-17 17:09:26', '2018-07-17 17:09:26'),
(123, 1, 73, 1, '2018-07-17 17:37:06', '2018-07-17 17:37:06'),
(124, 4, 73, 1, '2018-07-17 17:37:10', '2018-07-17 17:37:10'),
(125, 10, 74, 1, '2018-07-17 17:38:27', '2018-07-17 17:38:27'),
(126, 10, 75, 1, '2018-07-17 17:39:12', '2018-07-17 17:39:12'),
(127, 10, 76, 1, '2018-07-17 17:46:15', '2018-07-17 17:46:15'),
(128, 1, 77, 1, '2018-07-19 17:27:37', '2018-07-19 17:27:37'),
(129, 8, 77, 1, '2018-07-19 17:27:50', '2018-07-19 17:27:50'),
(130, 1, 78, 1, '2018-07-19 20:10:02', '2018-07-19 20:10:02'),
(131, 8, 78, 1, '2018-07-19 20:10:06', '2018-07-19 20:10:06'),
(132, 1, 79, 1, '2018-07-19 22:12:32', '2018-07-19 22:12:32'),
(133, 8, 79, 1, '2018-07-19 22:12:37', '2018-07-19 22:12:37'),
(134, 1, 80, 1, '2018-07-20 17:37:34', '2018-07-20 17:37:34'),
(135, 8, 80, 1, '2018-07-20 17:37:36', '2018-07-20 17:37:36'),
(136, 1, 81, 1, '2018-07-20 18:03:33', '2018-07-20 18:03:33'),
(137, 8, 81, 1, '2018-07-20 18:03:36', '2018-07-20 18:03:36'),
(138, 1, 82, 1, '2018-07-23 16:40:30', '2018-07-23 16:40:30'),
(139, 12, 82, 1, '2018-07-23 16:40:39', '2018-07-23 16:40:39'),
(140, 1, 83, 1, '2018-07-23 16:41:12', '2018-07-23 16:41:12'),
(141, 12, 83, 1, '2018-07-23 16:41:17', '2018-07-23 16:41:17'),
(142, 1, 84, 1, '2018-07-23 16:42:01', '2018-07-23 16:42:01'),
(143, 12, 84, 1, '2018-07-23 16:42:14', '2018-07-23 16:42:14'),
(144, 1, 85, 1, '2018-07-23 16:42:47', '2018-07-23 16:42:47'),
(145, 12, 85, 1, '2018-07-23 16:42:50', '2018-07-23 16:42:50'),
(146, 1, 86, 1, '2018-07-23 16:43:45', '2018-07-23 16:43:45'),
(147, 12, 86, 1, '2018-07-23 16:43:48', '2018-07-23 16:43:48'),
(148, 4, 49, 1, '2018-07-23 22:40:35', '2018-07-23 22:40:35'),
(149, 1, 87, 1, '2018-07-23 22:45:53', '2018-07-23 22:45:53'),
(150, 10, 87, 1, '2018-07-23 22:46:00', '2018-07-23 22:46:00'),
(151, 1, 88, 1, '2018-07-24 01:01:48', '2018-07-24 01:01:48'),
(152, 4, 88, 1, '2018-07-24 01:01:50', '2018-07-24 01:01:50'),
(153, 1, 89, 1, '2018-07-24 01:03:20', '2018-07-24 01:03:20'),
(154, 4, 89, 1, '2018-07-24 01:03:25', '2018-07-24 01:03:25'),
(155, 1, 90, 1, '2018-07-24 01:05:48', '2018-07-24 01:05:48'),
(156, 4, 90, 1, '2018-07-24 01:05:51', '2018-07-24 01:05:51'),
(157, 1, 91, 1, '2018-07-24 01:07:36', '2018-07-24 01:07:36'),
(158, 4, 91, 1, '2018-07-24 01:07:38', '2018-07-24 01:07:38'),
(159, 1, 92, 1, '2018-07-24 17:11:38', '2018-07-24 17:11:38'),
(160, 8, 92, 1, '2018-07-24 17:11:46', '2018-07-24 17:11:46'),
(161, 1, 93, 1, '2018-07-24 19:23:52', '2018-07-24 19:23:52'),
(162, 8, 93, 1, '2018-07-24 19:23:59', '2018-07-24 19:23:59'),
(163, 7, 94, 1, '2018-07-26 18:56:06', '2018-07-26 18:56:06');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int(10) unsigned NOT NULL,
  `DocEntry` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DocNum` int(11) NOT NULL,
  `CardCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CardName` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DocDueDate` timestamp NULL DEFAULT NULL,
  `arrival` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `DocEntry`, `DocNum`, `CardCode`, `CardName`, `DocDueDate`, `arrival`, `status`, `created_at`, `updated_at`) VALUES
(42, '1', 1, 'PRV0002-0003', 'THE TOPPS COMPANY, INC', '2011-07-29 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(43, '2', 2, 'PRV0002-0003', 'THE TOPPS COMPANY, INC', '2011-06-25 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(44, '3', 3, 'PRV0002-0001', 'TROLLI IBERICA, S.A.', '2011-06-29 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(45, '4', 4, 'PRV0002-0002', 'THE CANDY AND TOY FACTORY', '2011-07-25 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(46, '5', 5, 'PRV0002-0003', 'THE TOPPS COMPANY, INC', '2011-07-04 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(47, '6', 6, 'PRV0002-0001', 'TROLLI IBERICA, S.A.', '2011-08-15 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(48, '7', 7, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-06-27 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(49, '8', 8, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-06-27 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(50, '9', 9, 'PRV0001-0009', 'CONAGRA FOODS MEXICO, S.A. DE C.V.', '2011-06-27 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(51, '10', 10, 'PRV0001-0010', 'GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.', '2011-06-25 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(52, '11', 11, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-06-27 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(53, '12', 12, 'PRV0001-0001', 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '2011-06-25 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(54, '13', 13, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-06-27 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(55, '14', 14, 'PRV0001-0004', 'SANBORN HERMANOS, S.A. C.V.', '2011-06-27 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(56, '15', 15, 'PRV0001-0009', 'CONAGRA FOODS MEXICO, S.A. DE C.V.', '2011-06-27 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(57, '16', 16, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-06-28 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(58, '17', 17, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-06-28 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(59, '18', 18, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-06-28 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(60, '19', 19, 'PRV0001-0018', 'COMPAGNIA DELL ESPRESSO, S DE R.L. C.V.', '2011-06-27 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(61, '20', 20, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-06-27 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(62, '21', 21, 'PRV0001-0012', 'PULPALETA DE MEXICO, S.A. DE C.V.', '2011-06-30 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(63, '22', 22, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-07-01 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(64, '23', 23, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-07-01 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(65, '24', 24, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-06-30 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(66, '25', 25, 'PRV0001-0001', 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '2011-06-28 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(67, '26', 26, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-06-30 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(68, '27', 27, 'PRV0001-0007', 'PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.', '2011-07-01 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(69, '28', 28, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-05 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(70, '29', 29, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-12 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(71, '30', 30, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-19 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(72, '31', 31, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-26 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(73, '32', 32, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-02 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(74, '33', 33, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-06-29 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(75, '34', 34, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-06-29 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(76, '35', 35, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-06-29 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(77, '36', 36, 'PRV0001-0014', 'CUANDA, S.A. DE C.V.', '2011-06-29 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(78, '37', 37, 'PRV0001-0014', 'CUANDA, S.A. DE C.V.', '2011-06-29 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(79, '38', 38, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-05 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(80, '39', 39, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-07-01 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(81, '40', 40, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-06-30 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(82, '41', 41, 'PRV0002-0001', 'TROLLI IBERICA, S.A.', '2011-07-01 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(83, '42', 42, 'PRV0002-0001', 'TROLLI IBERICA, S.A.', '2011-07-01 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(84, '43', 43, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-01 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(85, '44', 44, 'PRV0001-0014', 'CUANDA, S.A. DE C.V.', '2011-07-04 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(86, '45', 45, 'PRV0001-0012', 'PULPALETA DE MEXICO, S.A. DE C.V.', '2011-07-06 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(87, '46', 46, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-06 05:00:00', NULL, 0, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
(88, '47', 47, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-07-06 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(89, '48', 48, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-07-08 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(90, '49', 49, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-06 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(91, '50', 50, 'PRV0001-0001', 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '2011-07-06 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(92, '51', 51, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-07-06 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(93, '52', 52, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-06 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(94, '53', 53, 'PRV0002-0001', 'TROLLI IBERICA, S.A.', '2011-07-09 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(95, '54', 54, 'PRV0001-0014', 'CUANDA, S.A. DE C.V.', '2011-07-06 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(96, '55', 55, 'PRV0001-0009', 'CONAGRA FOODS MEXICO, S.A. DE C.V.', '2011-07-08 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(97, '56', 56, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-07-08 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(98, '57', 57, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-11 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(99, '58', 58, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(100, '59', 59, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(101, '60', 60, 'PRV0001-0001', 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(102, '61', 61, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(103, '62', 62, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-07-08 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(104, '63', 63, 'PRV0001-0004', 'SANBORN HERMANOS, S.A. C.V.', '2011-07-07 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(105, '64', 64, 'PRV0001-0010', 'GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.', '2011-07-08 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(106, '65', 65, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(107, '66', 66, 'PRV0001-0007', 'PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.', '2011-07-05 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(108, '67', 67, 'PRV0002-0001', 'TROLLI IBERICA, S.A.', '2011-09-26 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(109, '68', 68, 'PRV0002-0004', 'UNITRADE GLOBAL LTD', '2011-07-11 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(110, '69', 69, 'PRV0001-0012', 'PULPALETA DE MEXICO, S.A. DE C.V.', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(111, '70', 70, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-07-12 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(112, '71', 71, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(113, '72', 72, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-12 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(114, '73', 73, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-12 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(115, '74', 74, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(116, '75', 75, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-12 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(117, '76', 76, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-12 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(118, '77', 77, 'PRV0001-0007', 'PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.', '2011-07-12 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(119, '78', 78, 'PRV0001-0010', 'GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.', '2011-07-07 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(120, '80', 80, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-12 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(121, '81', 81, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-12 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(122, '82', 82, 'PRV0001-0012', 'PULPALETA DE MEXICO, S.A. DE C.V.', '2011-07-15 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(123, '83', 83, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(124, '84', 84, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(125, '85', 85, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(126, '86', 86, 'PRV0001-0010', 'GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(127, '87', 87, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-07-08 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(128, '88', 88, 'PRV0001-0007', 'PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.', '2011-07-12 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(129, '89', 89, 'PRV0001-0007', 'PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(130, '90', 90, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-07-12 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(131, '91', 91, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-07-13 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(132, '92', 92, 'PRV0001-0012', 'PULPALETA DE MEXICO, S.A. DE C.V.', '2011-07-20 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(133, '93', 93, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-19 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(134, '94', 94, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-19 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(135, '95', 95, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-19 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(136, '96', 96, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-07-19 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(137, '97', 97, 'PRV0001-0001', 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '2011-07-21 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(138, '98', 98, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-07-18 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(139, '99', 99, 'PRV0002-0004', 'UNITRADE GLOBAL LTD', '2011-07-14 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(140, '100', 100, 'PRV0001-0009', 'CONAGRA FOODS MEXICO, S.A. DE C.V.', '2011-07-22 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(141, '101', 101, 'PRV0001-0018', 'COMPAGNIA DELL ESPRESSO, S DE R.L. C.V.', '2011-07-19 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(142, '102', 102, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-21 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(143, '103', 103, 'PRV0001-0014', 'CUANDA, S.A. DE C.V.', '2011-07-19 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(144, '104', 104, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-21 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(145, '105', 105, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-07-20 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(146, '106', 106, 'PRV0001-0004', 'SANBORN HERMANOS, S.A. C.V.', '2011-07-22 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(147, '107', 107, 'PRV0001-0003', 'IMPORTACIONES BAROUDI, S,A, DE  C.V.', '2011-07-18 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(148, '108', 108, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-21 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(149, '109', 109, 'PRV0002-0002', 'THE CANDY AND TOY FACTORY', '2011-09-19 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(150, '110', 110, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-21 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(151, '111', 111, 'PRV0001-0007', 'PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.', '2011-07-19 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(152, '112', 112, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-26 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(153, '113', 113, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-26 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(154, '114', 114, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-26 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(155, '115', 115, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-26 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(156, '116', 116, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-07-26 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(157, '117', 117, 'PRV0001-0001', 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '2011-07-28 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(158, '118', 118, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-07-26 05:00:00', NULL, 0, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
(159, '119', 119, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-07-26 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(160, '120', 120, 'PRV0001-0018', 'COMPAGNIA DELL ESPRESSO, S DE R.L. C.V.', '2011-07-26 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(161, '121', 121, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-07-29 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(162, '122', 122, 'PRV0001-0014', 'CUANDA, S.A. DE C.V.', '2011-07-26 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(163, '123', 123, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-28 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(164, '124', 124, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-28 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(165, '125', 125, 'PRV0001-0010', 'GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.', '2011-07-26 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(166, '126', 126, 'PRV0001-0007', 'PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.', '2011-07-28 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(167, '127', 127, 'PRV0001-0004', 'SANBORN HERMANOS, S.A. C.V.', '2011-07-27 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(168, '128', 128, 'PRV0001-0008', 'ORGANIZACION SAHUAYO, S.A. DE C.V.', '2011-07-27 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(169, '129', 129, 'PRV0001-0001', 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '2011-07-30 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(170, '130', 130, 'PRV0001-0012', 'PULPALETA DE MEXICO, S.A. DE C.V.', '2011-08-01 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(171, '131', 131, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-29 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(172, '132', 132, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-07-29 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(173, '133', 133, 'PRV0001-0019', 'BARCEL, S.A. DE C.V.', '2011-07-30 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(174, '134', 134, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-07-27 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(175, '135', 135, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-01 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(176, '136', 136, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-01 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(177, '137', 137, 'PRV0001-0003', 'IMPORTACIONES BAROUDI, S,A, DE  C.V.', '2011-08-02 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(178, '138', 138, 'PRV0001-0003', 'IMPORTACIONES BAROUDI, S,A, DE  C.V.', '2011-08-08 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(179, '139', 139, 'PRV0001-0003', 'IMPORTACIONES BAROUDI, S,A, DE  C.V.', '2011-09-05 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(180, '140', 140, 'PRV0001-0003', 'IMPORTACIONES BAROUDI, S,A, DE  C.V.', '2011-10-03 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(181, '141', 141, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-02 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(182, '142', 142, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-02 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(183, '143', 143, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-02 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(184, '144', 144, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-02 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(185, '145', 145, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-08-02 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(186, '146', 146, 'PRV0001-0012', 'PULPALETA DE MEXICO, S.A. DE C.V.', '2011-08-08 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(187, '147', 147, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-08-05 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(188, '148', 148, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-08 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(189, '149', 149, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-08 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(190, '150', 150, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-08 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(191, '151', 151, 'PRV0001-0014', 'CUANDA, S.A. DE C.V.', '2011-08-05 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(192, '152', 152, 'PRV0001-0001', 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '2011-08-08 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(193, '153', 153, 'PRV0001-0004', 'SANBORN HERMANOS, S.A. C.V.', '2011-08-05 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(194, '154', 154, 'PRV0001-0010', 'GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.', '2011-08-08 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(195, '155', 155, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-08-03 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(196, '156', 156, 'PRV0001-0018', 'COMPAGNIA DELL ESPRESSO, S DE R.L. C.V.', '2011-08-04 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(197, '157', 157, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-08-08 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(198, '158', 158, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-09 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(199, '159', 159, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-09 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(200, '160', 160, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-09 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(201, '161', 161, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-09 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(202, '162', 162, 'PRV0001-0009', 'CONAGRA FOODS MEXICO, S.A. DE C.V.', '2011-08-05 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(203, '163', 163, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-08-08 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(204, '164', 164, 'PRV0001-0001', 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '2011-08-11 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(205, '165', 165, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-08-08 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(206, '166', 166, 'PRV0001-0004', 'SANBORN HERMANOS, S.A. C.V.', '2011-08-08 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(207, '167', 167, 'PRV0002-0001', 'TROLLI IBERICA, S.A.', '2011-10-14 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(208, '168', 168, 'PRV0002-0003', 'THE TOPPS COMPANY, INC', '2011-08-26 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(209, '169', 169, 'PRV0002-0003', 'THE TOPPS COMPANY, INC', '2011-10-25 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(210, '170', 170, 'PRV0002-0003', 'THE TOPPS COMPANY, INC', '2011-11-25 06:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(211, '171', 171, 'PRV0001-0008', 'ORGANIZACION SAHUAYO, S.A. DE C.V.', '2011-08-10 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(212, '172', 172, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-08-10 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(213, '173', 173, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-08-15 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(214, '174', 174, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-15 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(215, '175', 175, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-08-17 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(216, '176', 176, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-16 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(217, '177', 177, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-16 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(218, '178', 178, 'PRV0001-0014', 'CUANDA, S.A. DE C.V.', '2011-08-12 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(219, '179', 179, 'PRV0001-0001', 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '2011-08-17 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(220, '180', 180, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-15 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(221, '181', 181, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-16 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(222, '182', 182, 'PRV0001-0010', 'GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.', '2011-08-15 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(223, '183', 183, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-16 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(224, '184', 184, 'PRV0002-0001', 'TROLLI IBERICA, S.A.', '2011-08-15 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(225, '185', 185, 'PRV0001-0009', 'CONAGRA FOODS MEXICO, S.A. DE C.V.', '2011-08-12 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(226, '186', 186, 'PRV0001-0012', 'PULPALETA DE MEXICO, S.A. DE C.V.', '2011-08-19 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(227, '188', 187, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-08-15 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(228, '189', 187, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-08-19 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(229, '190', 188, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-19 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(230, '191', 189, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-19 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(231, '192', 190, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-23 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(232, '193', 191, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-23 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(233, '194', 192, 'PRV0001-0014', 'CUANDA, S.A. DE C.V.', '2011-08-19 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(234, '195', 193, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-19 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(235, '196', 194, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-08-17 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(236, '197', 195, 'PRV0001-0019', 'BARCEL, S.A. DE C.V.', '2011-08-18 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(237, '198', 196, 'PRV0001-0004', 'SANBORN HERMANOS, S.A. C.V.', '2011-08-19 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(238, '199', 197, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-23 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(239, '200', 198, 'PRV0001-0010', 'GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.', '2011-08-19 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(240, '201', 199, 'PRV0001-0007', 'PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.', '2011-08-18 05:00:00', NULL, 0, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
(241, '203', 201, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-19 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(242, '204', 202, 'PRV0001-0021', 'DULCES EL DESCUENTO, S.A. DE C.V.', '2011-08-22 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(243, '205', 203, 'PRV0001-0012', 'PULPALETA DE MEXICO, S.A. DE C.V.', '2011-08-29 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(244, '206', 204, 'PRV0001-0011', 'IMPORTADORA GREZON, S.A. DE C.V.', '2011-08-26 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(245, '207', 205, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-29 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(246, '208', 206, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-29 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(247, '209', 207, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-08-26 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(248, '210', 208, 'PRV0001-0014', 'CUANDA, S.A. DE C.V.', '2011-08-26 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(249, '211', 209, 'PRV0001-0001', 'EFFEM MEXICO INC Y COMPA??IA , S.EN N.C. DE C.V.', '2011-08-30 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(250, '212', 210, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-29 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(251, '213', 211, 'PRV0001-0013', 'FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.', '2011-08-26 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(252, '214', 212, 'PRV0001-0004', 'SANBORN HERMANOS, S.A. C.V.', '2011-08-26 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(253, '215', 213, 'PRV0001-0010', 'GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.', '2011-08-26 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(254, '216', 214, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-08-23 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(255, '217', 215, 'PRV0001-0003', 'IMPORTACIONES BAROUDI, S,A, DE  C.V.', '2011-08-23 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(256, '218', 216, 'PRV0001-0008', 'ORGANIZACION SAHUAYO, S.A. DE C.V.', '2011-08-25 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(257, '219', 217, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-29 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(258, '220', 218, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-29 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(259, '221', 219, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-29 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(260, '222', 220, 'PRV0001-0017', 'MATRE MEXICO, S. DE R.L. DE C.V.', '2011-08-29 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(261, '223', 221, 'PRV0002-0001', 'TROLLI IBERICA, S.A.', '2011-08-29 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(262, '224', 222, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-09-05 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(263, '225', 223, 'PRV0001-0006', 'HERSHEY MEXICO, S.A. DE C..V', '2011-09-05 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
(264, '226', 224, 'PRV0001-0002', 'PRODUCTOS INDY, S.A. DE C.V.', '2011-09-02 05:00:00', NULL, 0, '2018-06-12 21:39:46', '2018-06-12 21:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

DROP TABLE IF EXISTS `purchase_items`;
CREATE TABLE IF NOT EXISTS `purchase_items` (
  `DocEntry` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_id` int(10) unsigned NOT NULL,
  `ItemCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(19,6) NOT NULL DEFAULT '0.000000',
  `CodeBars` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `u_CantReq` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0.000000',
  `DistNumber` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `u_Caducidad` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`DocEntry`, `purchase_id`, `ItemCode`, `product_id`, `quantity`, `CodeBars`, `u_CantReq`, `DistNumber`, `u_Caducidad`, `status`, `created_at`, `updated_at`) VALUES
('1', 42, 'TOP-0102', '3878', 0.000000, '41116209031', '14', 'LOTE1', NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('2', 43, 'TOP-0103', '3879', 0.000000, '41116204777', NULL, NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('3', 44, 'EFR-0101', '3070', 0.000000, '8437003969744', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('3', 44, 'EFR-0103', '3072', 0.000000, '8437003969737', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('3', 44, 'EFR-0201', '3074', 0.000000, '8437003969485', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('3', 44, 'EFR-0301', '3089', 0.000000, '25015539', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('3', 44, 'EFR-0303', '3091', 0.000000, '2050037669822', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('3', 44, 'EFR-0305', '3093', 0.000000, '7504015341507', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('3', 44, 'EFR-0307', '3095', 0.000000, '7504015341521', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('3', 44, 'EFR-0308', '3096', 0.000000, '7504015341538', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('3', 44, 'EFR-0104', '3073', 0.000000, '8437003969768', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('3', 44, 'EFR-0205', '3078', 0.000000, '8437003969508', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('4', 45, 'WOM-0101', '3941', 0.000000, '8435124850460', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('5', 46, 'TOP-0101', '3877', 0.000000, '41116206252', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('6', 47, 'EFR-0101', '3070', 0.000000, '8437003969744', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('6', 47, 'EFR-0103', '3072', 0.000000, '8437003969737', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('6', 47, 'EFR-0201', '3074', 0.000000, '8437003969485', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('6', 47, 'EFR-0301', '3089', 0.000000, '25015539', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('6', 47, 'EFR-0302', '3090', 0.000000, '25015515', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('6', 47, 'EFR-0303', '3091', 0.000000, '2050037669822', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('6', 47, 'EFR-0304', '3092', 0.000000, '7504015341477', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('6', 47, 'EFR-0307', '3095', 0.000000, '7504015341521', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('6', 47, 'EFR-0308', '3096', 0.000000, '7504015341538', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('6', 47, 'EFR-0104', '3073', 0.000000, '8437003969768', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('7', 48, 'GRE-0101', '3178', 0.000000, '7506032105643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('7', 48, 'GRE-0104', '3181', 0.000000, '7506161205894', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('7', 48, 'GRE-0105', '3182', 0.000000, '7506032104257', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('8', 49, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('8', 49, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('8', 49, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('8', 49, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('9', 50, 'ACT-0101', '3007', 0.000000, '76150420098', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('9', 50, 'ACT-0102', '3008', 0.000000, '7501006551044', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('9', 50, 'ACT-0103', '3009', 0.000000, '7501006551051', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('9', 50, 'ACT-0104', '3010', 0.000000, '7501006551068', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('9', 50, 'ACT-0105', '3011', 0.000000, '7501006551075', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('9', 50, 'ACT-0102', '3008', 0.000000, '7501006551044', NULL, NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('9', 50, 'ACT-0103', '3009', 0.000000, '7501006551051', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('9', 50, 'ACT-0104', '3010', 0.000000, '7501006551068', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('9', 50, 'ACT-0105', '3011', 0.000000, '7501006551075', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('10', 51, 'WON-0101', '3973', 0.000000, '7916423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('10', 51, 'WON-0102', '3974', 0.000000, '79200370107', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('10', 51, 'WON-0103', '3975', 0.000000, '79200136284', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('10', 51, 'NCR-0030', NULL, 0.000000, '', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('11', 52, 'PPR-0904', '3743', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('11', 52, 'PPR-0905', '3744', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('11', 52, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('11', 52, 'PPR-0908', '3747', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('12', 53, 'MAR-0104', '3453', 0.000000, '7506174500214', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('12', 53, 'MAR-0105', '3454', 0.000000, '7506174500207', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('12', 53, 'MAR-0101', '3450', 0.000000, '7506174500467', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('12', 53, 'MAR-0102', '3451', 0.000000, '7506174500450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('12', 53, 'NCR-0030', NULL, 0.000000, '', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('13', 54, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('13', 54, 'PRO-0102', '3756', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('13', 54, 'PRO-0201', '3775', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('13', 54, 'PRO-0103', '3757', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('13', 54, 'PRO-0202', '3776', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('13', 54, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('13', 54, 'PRO-0203', '3777', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('13', 54, 'PRO-0105', '3759', 0.000000, '713606012529', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('13', 54, 'PRO-0106', '3760', 0.000000, '713606022726', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('14', 55, 'SAN-0103', '3819', 0.000000, '7501006404036', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('14', 55, 'SAN-0103', '3819', 0.000000, '7501006404036', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('15', 56, 'ACT-0108', '3013', 0.000000, '7501006556223', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('16', 57, 'LUC-0104', '3407', 0.000000, '706460240450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('16', 57, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('16', 57, 'LUC-0203', '3418', 0.000000, '725181035015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('16', 57, 'LUC-0204', '3419', 0.000000, '725181068013', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('16', 57, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('16', 57, 'LUC-0103', '3406', 0.000000, '725181249016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('16', 57, 'NCR-0030', NULL, 0.000000, '', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('17', 58, 'SKI-0101', '3825', 0.000000, '7502226811871', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('17', 58, 'SKI-0102', '3826', 0.000000, '7502226811819', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('17', 58, 'SKI-0201', '3833', 0.000000, '040000140924', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('17', 58, 'SKI-0202', '3834', 0.000000, '040000141150', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('17', 58, 'SKI-0301', '3836', 0.000000, '040000298038', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'WRI-0301', '3981', 0.000000, '7502226810027', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'WRI-0302', '3982', 0.000000, '7502226810034', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'LIF-0102', '3391', 0.000000, '7502226811468', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'LIF-0101', '3390', 0.000000, '7502226811451', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'WRI-0305', '3985', 0.000000, '7502226811598', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'WRI-0304', '3984', 0.000000, '7502226811567', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'WRI-0101', '3976', 0.000000, '7502226811680', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'WRI-0202', '3979', 0.000000, '75034184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'LIF-0104', '3393', 0.000000, '19000083425', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'LIF-0105', '3394', 0.000000, '7502226812281', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'LIF-0106', '3395', 0.000000, '7502226812274', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('18', 59, 'LIF-0107', '3396', 0.000000, '75035693', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('19', 60, 'DIE-0101', '3041', 0.000000, '8003866012011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('19', 60, 'DIE-0301', '3045', 0.000000, '8003866010017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('19', 60, 'DIE-0102', '3042', 0.000000, '7504015341439', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('19', 60, 'DIE-0103', '3043', 0.000000, '7504015341446', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('20', 61, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('20', 61, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('20', 61, 'HER-0201', '3245', 0.000000, '7501024523788', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('20', 61, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('20', 61, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('20', 61, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('20', 61, 'HER-0304', '3263', 0.000000, '75025687', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('20', 61, 'NCR-0030', NULL, 0.000000, '', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('21', 62, 'FRU-0101', '3156', 0.000000, '7503007884046', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('21', 62, 'FRU-0102', '3157', 0.000000, '7503007884022', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('21', 62, 'FRU-0103', '3158', 0.000000, '7503007884015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('21', 62, 'FRU-0104', '3159', 0.000000, '7503007884121', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('22', 63, 'GRE-0106', '3183', 0.000000, '7506161206082', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('22', 63, 'GRE-0108', '3185', 0.000000, '7506161206679', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('22', 63, 'GRE-0110', '3187', 0.000000, '7506161206389', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('22', 63, 'GRE-0101', '3178', 0.000000, '7506032105643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('22', 63, 'GRE-0102', '3179', 0.000000, '7506032105612', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('22', 63, 'GRE-0104', '3181', 0.000000, '7506161205894', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('22', 63, 'GRE-0105', '3182', 0.000000, '7506032104257', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('23', 64, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('23', 64, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('23', 64, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('23', 64, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('24', 65, 'PPR-0904', '3743', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('24', 65, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('24', 65, 'PPR-0908', '3747', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('25', 66, 'MAR-0104', '3453', 0.000000, '7506174500214', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('25', 66, 'MAR-0105', '3454', 0.000000, '7506174500207', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('25', 66, 'MAR-0101', '3450', 0.000000, '7506174500467', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('25', 66, 'MAR-0102', '3451', 0.000000, '7506174500450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('25', 66, 'NCR-0030', NULL, 0.000000, '', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('26', 67, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('26', 67, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('26', 67, 'PRO-0203', '3777', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('26', 67, 'PRO-0105', '3759', 0.000000, '713606012529', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('26', 67, 'PRO-0102', '3756', 0.000000, '713606010396', NULL, NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('26', 67, 'PRO-0201', '3775', 0.000000, '713606010396', NULL, NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('27', 68, 'ZUP-0201', '4020', 0.000000, '703885000621', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('27', 68, 'ZUP-0202', '4021', 0.000000, '703885003806', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('27', 68, 'ZUP-0102', '4018', 0.000000, '703885051531', NULL, NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('28', 69, 'STA-0202', '3845', 0.000000, '040000162612', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('29', 70, 'SKI-0201', '3833', 0.000000, '040000140924', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('29', 70, 'SKI-0202', '3834', 0.000000, '040000141150', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('29', 70, 'SKI-0302', '3837', 0.000000, '040000322511', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('29', 70, 'LIF-0202', '3400', 0.000000, '022000003591', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('29', 70, 'LIF-0201', '3399', 0.000000, '022000003607', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('29', 70, 'STA-0101', '3843', 0.000000, '040000162643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('29', 70, 'SKI-0301', '3836', 0.000000, '040000298038', NULL, NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('30', 71, 'SKI-0201', '3833', 0.000000, '040000140924', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('30', 71, 'SKI-0202', '3834', 0.000000, '040000141150', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('30', 71, 'SKI-0301', '3836', 0.000000, '040000298038', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('30', 71, 'SKI-0302', '3837', 0.000000, '040000322511', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('30', 71, 'LIF-0201', '3399', 0.000000, '022000003607', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('30', 71, 'LIF-0202', '3400', 0.000000, '022000003591', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('30', 71, 'STA-0101', '3843', 0.000000, '040000162643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('31', 72, 'SKI-0201', '3833', 0.000000, '040000140924', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('31', 72, 'SKI-0202', '3834', 0.000000, '040000141150', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('31', 72, 'SKI-0301', '3836', 0.000000, '040000298038', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('31', 72, 'SKI-0302', '3837', 0.000000, '040000322511', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('31', 72, 'STA-0101', '3843', 0.000000, '040000162643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('32', 73, 'SKI-0201', '3833', 0.000000, '040000140924', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('32', 73, 'SKI-0301', '3836', 0.000000, '040000298038', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('32', 73, 'SKI-0302', '3837', 0.000000, '040000322511', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('32', 73, 'STA-0101', '3843', 0.000000, '040000162643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('33', 74, 'SKI-0101', '3825', 0.000000, '7502226811871', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('34', 75, 'LIF-0106', '3395', 0.000000, '7502226812274', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('35', 76, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('35', 76, 'LIF-0106', '3395', 0.000000, '7502226812274', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('36', 77, 'MPO-0202', '3575', 0.000000, '7504015341231', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('37', 78, 'MPO-0202', '3575', 0.000000, '7504015341231', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('38', 79, 'LUC-0101', '3404', 0.000000, '706460236361', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('38', 79, 'LUC-0104', '3407', 0.000000, '706460240450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('38', 79, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('38', 79, 'LUC-0203', '3418', 0.000000, '725181035015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('38', 79, 'LUC-0204', '3419', 0.000000, '725181068013', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('38', 79, 'LUC-0205', '3420', 0.000000, '75021184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('38', 79, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('39', 80, 'GRE-0105', '3182', 0.000000, '7506161206129', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('39', 80, 'GRE-0110', '3187', 0.000000, '7506161206389', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('39', 80, 'GRE-0106', '3183', 0.000000, '7506161206082', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('40', 81, 'SKI-0101', '3825', 0.000000, '7502226811871', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('40', 81, 'SKI-0102', '3826', 0.000000, '7502226811819', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('40', 81, 'SKI-0103', '3827', 0.000000, '7502226812373', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('41', 82, 'EFR-0101', '3070', 0.000000, '8437003969744', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('41', 82, 'EFR-0103', '3072', 0.000000, '8437003969737', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('41', 82, 'EFR-0201', '3074', 0.000000, '8437003969485', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('41', 82, 'EFR-0301', '3089', 0.000000, '25015539', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('41', 82, 'EFR-0303', '3091', 0.000000, '2050037669822', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('41', 82, 'EFR-0305', '3093', 0.000000, '7504015341507', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('41', 82, 'EFR-0307', '3095', 0.000000, '7504015341521', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('41', 82, 'EFR-0308', '3096', 0.000000, '7504015341538', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('41', 82, 'EFR-0104', '3073', 0.000000, '8437003969768', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('41', 82, 'EFR-0205', '3078', 0.000000, '8437003969508', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('42', 83, 'EFR-0101', '3070', 0.000000, '8437003969744', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('42', 83, 'EFR-0103', '3072', 0.000000, '8437003969737', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('42', 83, 'EFR-0201', '3074', 0.000000, '8437003969485', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('42', 83, 'EFR-0301', '3089', 0.000000, '25015539', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('42', 83, 'EFR-0303', '3091', 0.000000, '2050037669822', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('42', 83, 'EFR-0305', '3093', 0.000000, '7504015341507', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('42', 83, 'EFR-0307', '3095', 0.000000, '7504015341521', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('42', 83, 'EFR-0308', '3096', 0.000000, '7504015341538', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('42', 83, 'EFR-0104', '3073', 0.000000, '8437003969768', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('42', 83, 'EFR-0205', '3078', 0.000000, '8437003969508', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('43', 84, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('43', 84, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('43', 84, 'HER-0201', '3245', 0.000000, '7501024523788', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('43', 84, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('43', 84, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('43', 84, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('43', 84, 'HER-0302', '3261', 0.000000, '7501024512034', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('43', 84, 'HER-0305', '3264', 0.000000, '75025694', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('43', 84, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('44', 85, 'LUK-0102', '3437', 0.000000, '744218100021', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('44', 85, 'LUK-0105', '3440', 0.000000, '744218100113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('45', 86, 'FRU-0101', '3156', 0.000000, '7503007884046', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('45', 86, 'FRU-0103', '3158', 0.000000, '7503007884015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('45', 86, 'FRU-0104', '3159', 0.000000, '7503007884121', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('46', 87, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('46', 87, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('46', 87, 'HER-0103', '3223', 0.000000, '7501024523412', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('46', 87, 'HER-0201', '3245', 0.000000, '7501024523788', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('46', 87, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('46', 87, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:43', '2018-06-12 21:39:43'),
('46', 87, 'HER-0205', '3249', 0.000000, '7501024524228', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('46', 87, 'HER-0206', '3250', 0.000000, '7501024524242', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('46', 87, 'HER-0207', '3251', 0.000000, '7501024524259', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('46', 87, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('46', 87, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('46', 87, 'HER-0401', '3265', 0.000000, '7501024528523', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('46', 87, 'HER-0108', '3228', 0.000000, '7501024541423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('46', 87, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('46', 87, 'HER-0304', '3263', 0.000000, '75025687', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('46', 87, 'HER-0305', '3264', 0.000000, '75025694', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('47', 88, 'GRE-0101', '3178', 0.000000, '7506032105643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('47', 88, 'GRE-0102', '3179', 0.000000, '7506032105612', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('47', 88, 'GRE-0104', '3181', 0.000000, '7506161205894', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('47', 88, 'GRE-0105', '3182', 0.000000, '7506161206129', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('47', 88, 'GRE-0108', '3185', 0.000000, '7506161206679', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('48', 89, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('48', 89, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('48', 89, 'IND-0101', '3366', 0.000000, '790203019113', NULL, NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('48', 89, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('49', 90, 'PPR-0904', '3743', 0.000000, '719886511486', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('49', 90, 'PPR-0905', '3744', 0.000000, '719886210969', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('49', 90, 'PPR-0906', '3745', 0.000000, '719886001017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('49', 90, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('49', 90, 'PPR-0908', '3747', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('50', 91, 'MAR-0103', '3452', 0.000000, '4056704', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('50', 91, 'MAR-0104', '3453', 0.000000, '7506174500214', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('50', 91, 'MAR-0105', '3454', 0.000000, '7506174500207', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('50', 91, 'MAR-0101', '3450', 0.000000, '7506174500467', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('50', 91, 'MAR-0102', '3451', 0.000000, '7506174500450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('51', 92, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('51', 92, 'PRO-0102', '3756', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('51', 92, 'PRO-0201', '3775', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('51', 92, 'PRO-0103', '3757', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('51', 92, 'PRO-0202', '3776', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('51', 92, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('51', 92, 'PRO-0203', '3777', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('51', 92, 'PRO-0105', '3759', 0.000000, '713606012529', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('51', 92, 'PRO-0106', '3760', 0.000000, '713606022726', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('52', 93, 'WRI-0101', '3976', 0.000000, '7502226811680', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('52', 93, 'WRI-0201', '3978', 0.000000, '7502226811673', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('52', 93, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('52', 93, 'LIF-0104', '3393', 0.000000, '19000083425', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('52', 93, 'LIF-0105', '3394', 0.000000, '7502226812281', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('52', 93, 'LIF-0201', '3399', 0.000000, '022000003607', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('52', 93, 'LIF-0202', '3400', 0.000000, '022000003591', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('53', 94, 'EFR-0101', '3070', 0.000000, '8437003969744', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('53', 94, 'EFR-0103', '3072', 0.000000, '8437003969737', NULL, NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('53', 94, 'EFR-0104', '3073', 0.000000, '8437003969768', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('53', 94, 'EFR-0201', '3074', 0.000000, '8437003969485', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('53', 94, 'EFR-0205', '3078', 0.000000, '8437003969508', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('53', 94, 'EFR-0301', '3089', 0.000000, '25015539', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('53', 94, 'EFR-0303', '3091', 0.000000, '2050037669822', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('53', 94, 'EFR-0305', '3093', 0.000000, '7504015341507', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('53', 94, 'EFR-0307', '3095', 0.000000, '7504015341521', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('53', 94, 'EFR-0308', '3096', 0.000000, '7504015341538', NULL, NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('54', 95, 'LUK-0102', '3437', 0.000000, '744218100021', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('54', 95, 'LUK-0105', '3440', 0.000000, '744218100113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('55', 96, 'ACT-0101', '3007', 0.000000, '76150420098', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('55', 96, 'ACT-0102', '3008', 0.000000, '7501006551044', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('55', 96, 'ACT-0103', '3009', 0.000000, '7501006551051', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('55', 96, 'ACT-0104', '3010', 0.000000, '7501006551068', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('55', 96, 'ACT-0105', '3011', 0.000000, '7501006551075', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('55', 96, 'ACT-0107', '3012', 0.000000, '7501006555578', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('56', 97, 'GRE-0104', '3181', 0.000000, '7506161205894', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('56', 97, 'GRE-0105', '3182', 0.000000, '7506161206129', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('56', 97, 'GRE-0106', '3183', 0.000000, '7506161206082', NULL, NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('56', 97, 'GRE-0110', '3187', 0.000000, '7506161206389', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0103', '3223', 0.000000, '7501024523412', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0201', '3245', 0.000000, '7501024523788', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0205', '3249', 0.000000, '7501024524228', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0207', '3251', 0.000000, '7501024524259', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0304', '3263', 0.000000, '75025687', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0305', '3264', 0.000000, '75025694', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0401', '3265', 0.000000, '7501024528523', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('57', 98, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('58', 99, 'LIF-0101', '3390', 0.000000, '7502226811451', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('58', 99, 'LIF-0102', '3391', 0.000000, '7502226811468', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('58', 99, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('58', 99, 'LIF-0104', '3393', 0.000000, '19000083425', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('58', 99, 'LIF-0105', '3394', 0.000000, '7502226812281', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('58', 99, 'LIF-0107', '3396', 0.000000, '75035693', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('59', 100, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('59', 100, 'LUC-0103', '3406', 0.000000, '725181249016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('59', 100, 'LUC-0104', '3407', 0.000000, '706460240450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('59', 100, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('59', 100, 'LUC-0106', '3409', 0.000000, '706460240740', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('59', 100, 'LUC-0101', '3404', 0.000000, '706460236361', NULL, NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('59', 100, 'LUC-0203', '3418', 0.000000, '725181035015', NULL, NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('59', 100, 'LUC-0204', '3419', 0.000000, '725181068013', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('59', 100, 'LUC-0205', '3420', 0.000000, '75021184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('60', 101, 'MAR-0101', '3450', 0.000000, '7506174500467', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('60', 101, 'MAR-0102', '3451', 0.000000, '7506174500450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('60', 101, 'MAR-0104', '3453', 0.000000, '7506174500214', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('60', 101, 'MAR-0105', '3454', 0.000000, '7506174500207', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('61', 102, 'PPR-0904', '3743', 0.000000, '719886511486', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('61', 102, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('61', 102, 'PPR-0908', '3747', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('62', 103, 'PRO-0102', '3756', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('62', 103, 'PRO-0103', '3757', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('62', 103, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('62', 103, 'PRO-0201', '3775', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('62', 103, 'PRO-0202', '3776', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('62', 103, 'PRO-0203', '3777', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('63', 104, 'SAN-0102', '3818', 0.000000, '7501006402155', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('63', 104, 'SAN-0102', '3818', 0.000000, '7501006402155', NULL, NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('64', 105, 'WON-0102', '3974', 0.000000, '79200370107', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('64', 105, 'WON-0103', '3975', 0.000000, '79200136284', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('65', 106, 'WRI-0101', '3976', 0.000000, '7502226811680', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('65', 106, 'WRI-0201', '3978', 0.000000, '7502226811673', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('65', 106, 'WRI-0302', '3982', 0.000000, '7502226810034', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('65', 106, 'WRI-0303', '3983', 0.000000, '7502226810041', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('65', 106, 'WRI-0304', '3984', 0.000000, '7502226811567', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('65', 106, 'WRI-0305', '3985', 0.000000, '7502226811598', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('66', 107, 'ZUP-0101', '4017', 0.000000, '703885001536', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('66', 107, 'ZUP-0201', '4020', 0.000000, '703885000621', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('66', 107, 'ZUP-0202', '4021', 0.000000, '703885003806', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0101', '3070', 0.000000, '8437003969744', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0102', '3071', 0.000000, '8437003969751', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0103', '3072', 0.000000, '8437003969737', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0201', '3074', 0.000000, '8437003969485', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0203', '3076', 0.000000, '8437004904911', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0204', '3077', 0.000000, '8437005297753', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0205', '3078', 0.000000, '8437003969508', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0301', '3089', 0.000000, '25015539', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0302', '3090', 0.000000, '25015515', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0303', '3091', 0.000000, '2050037669822', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0305', '3093', 0.000000, '7504015341507', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0306', '3094', 0.000000, '7504015341514', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0307', '3095', 0.000000, '7504015341521', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('67', 108, 'EFR-0308', '3096', 0.000000, '7504015341538', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('68', 109, 'WOM-0202', '3960', 0.000000, '823710696079', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('69', 110, 'FRU-0101', '3156', 0.000000, '7503007884046', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('69', 110, 'FRU-0102', '3157', 0.000000, '7503007884022', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('69', 110, 'FRU-0103', '3158', 0.000000, '7503007884015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('69', 110, 'FRU-0104', '3159', 0.000000, '7503007884121', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('70', 111, 'GRE-0101', '3178', 0.000000, '7506032105643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('70', 111, 'GRE-0103', '3180', 0.000000, '7506032104257', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('70', 111, 'GRE-0104', '3181', 0.000000, '7506161205894', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('70', 111, 'GRE-0105', '3182', 0.000000, '7506161206129', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('70', 111, 'GRE-0106', '3183', 0.000000, '7506161206082', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('70', 111, 'GRE-0110', '3187', 0.000000, '7506161206389', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0103', '3223', 0.000000, '7501024523412', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0108', '3228', 0.000000, '7501024541423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0201', '3245', 0.000000, '7501024523788', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0205', '3249', 0.000000, '7501024524228', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0206', '3250', 0.000000, '7501024524242', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0207', '3251', 0.000000, '7501024524259', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0302', '3261', 0.000000, '7501024512034', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0401', '3265', 0.000000, '7501024528523', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('71', 112, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('72', 113, 'LIF-0101', '3390', 0.000000, '7502226811451', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('72', 113, 'LIF-0102', '3391', 0.000000, '7502226811468', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44');
INSERT INTO `purchase_items` (`DocEntry`, `purchase_id`, `ItemCode`, `product_id`, `quantity`, `CodeBars`, `u_CantReq`, `DistNumber`, `u_Caducidad`, `status`, `created_at`, `updated_at`) VALUES
('72', 113, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('72', 113, 'LIF-0104', '3393', 0.000000, '19000083425', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('72', 113, 'LIF-0105', '3394', 0.000000, '7502226812281', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('72', 113, 'LIF-0106', '3395', 0.000000, '7502226812274', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('72', 113, 'LIF-0107', '3396', 0.000000, '75035693', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('73', 114, 'LUC-0101', '3404', 0.000000, '706460236361', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('73', 114, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('73', 114, 'LUC-0103', '3406', 0.000000, '725181249016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('73', 114, 'LUC-0104', '3407', 0.000000, '706460240450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('73', 114, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('73', 114, 'LUC-0106', '3409', 0.000000, '706460240740', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('73', 114, 'LUC-0203', '3418', 0.000000, '725181035015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('73', 114, 'LUC-0204', '3419', 0.000000, '725181068013', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('73', 114, 'LUC-0205', '3420', 0.000000, '75021184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('74', 115, 'PPR-0904', '3743', 0.000000, '719886511486', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('74', 115, 'PPR-0905', '3744', 0.000000, '719886210969', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('74', 115, 'PPR-0906', '3745', 0.000000, '719886001017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('74', 115, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('74', 115, 'PPR-0908', '3747', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('75', 116, 'SKI-0101', '3825', 0.000000, '7502226811871', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('75', 116, 'SKI-0102', '3826', 0.000000, '7502226811819', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('76', 117, 'WRI-0101', '3976', 0.000000, '7502226811680', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('76', 117, 'WRI-0201', '3978', 0.000000, '7502226811673', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('76', 117, 'WRI-0202', '3979', 0.000000, '75034184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('76', 117, 'WRI-0301', '3981', 0.000000, '7502226810027', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('76', 117, 'WRI-0304', '3984', 0.000000, '7502226811567', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('76', 117, 'WRI-0305', '3985', 0.000000, '7502226811598', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('77', 118, 'ZUP-0101', '4017', 0.000000, '703885001536', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('77', 118, 'ZUP-0201', '4020', 0.000000, '703885000621', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('77', 118, 'ZUP-0202', '4021', 0.000000, '703885003806', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('78', 119, 'WON-0102', '3974', 0.000000, '79200370107', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('78', 119, 'WON-0103', '3975', 0.000000, '79200136284', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('80', 120, 'LUC-0101', '3404', 0.000000, '706460236361', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('80', 120, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('80', 120, 'LUC-0103', '3406', 0.000000, '725181249016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('80', 120, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('80', 120, 'LUC-0106', '3409', 0.000000, '706460240740', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('81', 121, 'WRI-0101', '3976', 0.000000, '7502226811680', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('81', 121, 'WRI-0102', '3977', 0.000000, '75034177', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('81', 121, 'WRI-0201', '3978', 0.000000, '7502226811673', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('81', 121, 'WRI-0202', '3979', 0.000000, '75034184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('81', 121, 'WRI-0304', '3984', 0.000000, '7502226811567', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('81', 121, 'WRI-0305', '3985', 0.000000, '7502226811598', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('82', 122, 'FRU-0101', '3156', 0.000000, '7503007884046', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('82', 122, 'FRU-0102', '3157', 0.000000, '7503007884022', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('82', 122, 'FRU-0103', '3158', 0.000000, '7503007884015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('82', 122, 'FRU-0104', '3159', 0.000000, '7503007884121', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0103', '3223', 0.000000, '7501024523412', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0108', '3228', 0.000000, '7501024541423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0201', '3245', 0.000000, '7501024523788', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0205', '3249', 0.000000, '7501024524228', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0206', '3250', 0.000000, '7501024524242', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0207', '3251', 0.000000, '7501024524259', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0302', '3261', 0.000000, '7501024512034', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0304', '3263', 0.000000, '75025687', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0305', '3264', 0.000000, '75025694', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('83', 123, 'HER-0401', '3265', 0.000000, '7501024528523', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('84', 124, 'PPR-0905', '3744', 0.000000, '719886210969', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('84', 124, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('84', 124, 'PPR-0908', '3747', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('85', 125, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('85', 125, 'PRO-0102', '3756', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('85', 125, 'PRO-0103', '3757', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('85', 125, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('85', 125, 'PRO-0202', '3776', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('86', 126, 'WON-0101', '3973', 0.000000, '7916423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('86', 126, 'WON-0102', '3974', 0.000000, '79200370107', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('86', 126, 'WON-0103', '3975', 0.000000, '79200136284', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('87', 127, 'IND-0103', '3368', 0.000000, '790203020331', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('87', 127, 'IND-0103', '3368', 0.000000, '790203020331', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('88', 128, 'ZUP-0102', '4018', 0.000000, '703885051531', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('88', 128, 'ZUP-0103', '4019', 0.000000, '703885051555', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('89', 129, 'ZUP-0102', '4018', 0.000000, '703885051531', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('89', 129, 'ZUP-0103', '4019', 0.000000, '703885051555', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('90', 130, 'IND-0103', '3368', 0.000000, '0790203020331', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('90', 130, 'IND-0103', '3368', 0.000000, '0790203020331', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('91', 131, 'IND-0103', '3368', 0.000000, '0790203020331', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('91', 131, 'IND-0103', '3368', 0.000000, '0790203020331', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('92', 132, 'FRU-0101', '3156', 0.000000, '7503007884046', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('92', 132, 'FRU-0102', '3157', 0.000000, '7503007884022', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('92', 132, 'FRU-0103', '3158', 0.000000, '7503007884015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('92', 132, 'FRU-0104', '3159', 0.000000, '7503007884121', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('93', 133, 'LIF-0102', '3391', 0.000000, '7502226811468', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('93', 133, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('93', 133, 'LIF-0104', '3393', 0.000000, '19000083425', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('93', 133, 'WRI-0401', '3991', 0.000000, '7502226812304', NULL, NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('94', 134, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('94', 134, 'LUC-0103', '3406', 0.000000, '725181249016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('94', 134, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('94', 134, 'LUC-0204', '3419', 0.000000, '725181068013', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('95', 135, 'SKI-0101', '3825', 0.000000, '7502226811871', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('95', 135, 'SKI-0102', '3826', 0.000000, '7502226811819', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('96', 136, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('96', 136, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('96', 136, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('96', 136, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('97', 137, 'MAR-0101', '3450', 0.000000, '7506174500467', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('97', 137, 'MAR-0102', '3451', 0.000000, '7506174500450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('97', 137, 'MAR-0103', '3452', 0.000000, '04056704', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('97', 137, 'MAR-0105', '3454', 0.000000, '7506174500207', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('98', 138, 'GRE-0101', '3178', 0.000000, '7506032105643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('98', 138, 'GRE-0102', '3179', 0.000000, '7506032105612', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('99', 139, 'WOM-0202', '3960', 0.000000, '823710696079', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('100', 140, 'ACT-0101', '3007', 0.000000, '76150420098', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('100', 140, 'ACT-0102', '3008', 0.000000, '7501006551044', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('100', 140, 'ACT-0103', '3009', 0.000000, '7501006551051', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('100', 140, 'ACT-0104', '3010', 0.000000, '7501006551068', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('100', 140, 'ACT-0105', '3011', 0.000000, '7501006551075', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('100', 140, 'ACT-0107', '3012', 0.000000, '7501006555578', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('101', 141, 'DIE-0101', '3041', 0.000000, '8003866012011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0108', '3228', 0.000000, '7501024541423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0201', '3245', 0.000000, '7501024523788', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0204', '3248', 0.000000, '7501024524211', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0205', '3249', 0.000000, '7501024524228', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0305', '3264', 0.000000, '75025694', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0401', '3265', 0.000000, '7501024528523', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('102', 142, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('103', 143, 'LUK-0102', '3437', 0.000000, '744218100021', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('103', 143, 'LUK-0105', '3440', 0.000000, '744218100113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('104', 144, 'PPR-0904', '3743', 0.000000, '719886511486', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('104', 144, 'PPR-0905', '3744', 0.000000, '719886210969', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('104', 144, 'PPR-0906', '3745', 0.000000, '719886001017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('104', 144, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('104', 144, 'PPR-0908', '3747', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('105', 145, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('105', 145, 'PRO-0102', '3756', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('105', 145, 'PRO-0103', '3757', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('105', 145, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('105', 145, 'PRO-0106', '3760', 0.000000, '713606022726', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('106', 146, 'SAN-0103', '3819', 0.000000, '7501006404036', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('106', 146, 'SAN-0103', '3819', 0.000000, '7501006404036', NULL, NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('107', 147, 'GAL-0103', '3170', 0.000000, '8713300432861', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('108', 148, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('109', 149, 'WOM-0101', '3941', 0.000000, '8435124850460', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('110', 150, 'WRI-0202', '3979', 0.000000, '75034184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('111', 151, 'ZUP-0102', '4018', 0.000000, '703885051531', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('111', 151, 'ZUP-0103', '4019', 0.000000, '703885051555', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('112', 152, 'LIF-0101', '3390', 0.000000, '7502226811451', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('112', 152, 'LIF-0102', '3391', 0.000000, '7502226811468', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('112', 152, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('112', 152, 'LIF-0104', '3393', 0.000000, '19000083425', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('112', 152, 'LIF-0105', '3394', 0.000000, '7502226812281', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('112', 152, 'LIF-0107', '3396', 0.000000, '75035693', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('113', 153, 'LUC-0101', '3404', 0.000000, '706460236361', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('113', 153, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('113', 153, 'LUC-0103', '3406', 0.000000, '725181249016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('113', 153, 'LUC-0104', '3407', 0.000000, '706460240450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('113', 153, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('113', 153, 'LUC-0201', '3416', 0.000000, '725181389019', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('113', 153, 'LUC-0203', '3418', 0.000000, '725181035015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('113', 153, 'LUC-0204', '3419', 0.000000, '725181068013', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('113', 153, 'LUC-0205', '3420', 0.000000, '75021184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('113', 153, 'LUC-0107', '3410', 0.000000, '725181105015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('114', 154, 'SKI-0101', '3825', 0.000000, '7502226811871', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('114', 154, 'SKI-0102', '3826', 0.000000, '7502226811819', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('115', 155, 'WRI-0202', '3979', 0.000000, '75034184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('115', 155, 'WRI-0303', '3983', 0.000000, '7502226810041', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('115', 155, 'WRI-0401', '3991', 0.000000, '7502226812304', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('116', 156, 'GRE-0110', '3187', 0.000000, '7506161206389', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('116', 156, 'GRE-0105', '3182', 0.000000, '7506161206129', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('116', 156, 'GRE-0106', '3183', 0.000000, '7506161206082', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('117', 157, 'MAR-0101', '3450', 0.000000, '7506174500467', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('117', 157, 'MAR-0102', '3451', 0.000000, '7506174500450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('117', 157, 'MAR-0105', '3454', 0.000000, '7506174500207', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('118', 158, 'LUC-0201', '3416', 0.000000, '725181389019', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:44', '2018-06-12 21:39:44'),
('118', 158, 'LUC-0107', '3410', 0.000000, '725181105015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('119', 159, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('120', 160, 'DIE-0101', '3041', 0.000000, '8003866012011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('120', 160, 'DIE-0301', '3045', 0.000000, '8003866010017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('121', 161, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('121', 161, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('121', 161, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('121', 161, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('122', 162, 'LUK-0102', '3437', 0.000000, '744218100021', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('122', 162, 'LUK-0105', '3440', 0.000000, '719886511486', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('123', 163, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('123', 163, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('123', 163, 'HER-0108', '3228', 0.000000, '7501024541423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('123', 163, 'HER-0205', '3249', 0.000000, '7501024524228', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('123', 163, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('124', 164, 'PPR-0906', '3745', 0.000000, '719886001017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('124', 164, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('124', 164, 'PPR-0908', '3747', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('125', 165, 'WON-0101', '3973', 0.000000, '7916423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('125', 165, 'WON-0102', '3974', 0.000000, '79200370107', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('125', 165, 'WON-0103', '3975', 0.000000, '79200136284', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('126', 166, 'ZUP-0101', '4017', 0.000000, '703885001536', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('126', 166, 'ZUP-0201', '4020', 0.000000, '703885000621', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('126', 166, 'ZUP-0202', '4021', 0.000000, '703885003806', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('127', 167, 'SAN-0103', '3819', 0.000000, '7501006404036', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('127', 167, 'SAN-0103', '3819', 0.000000, '7501006404036', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('128', 168, 'ACT-0101', '3007', 0.000000, '76150420098', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('128', 168, 'ACT-0104', '3010', 0.000000, '7501006551068', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('128', 168, 'ACT-0103', '3009', 0.000000, '7501006551051', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('128', 168, 'ACT-0102', '3008', 0.000000, '7501006551044', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('129', 169, 'MAR-0101', '3450', 0.000000, '7506174500467', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('129', 169, 'MAR-0102', '3451', 0.000000, '7506174500450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('129', 169, 'MAR-0103', '3452', 0.000000, '04056704', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('129', 169, 'MAR-0104', '3453', 0.000000, '7506174500214', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('129', 169, 'MAR-0105', '3454', 0.000000, '7506174500207', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('130', 170, 'FRU-0101', '3156', 0.000000, '7503007884046', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('130', 170, 'FRU-0103', '3158', 0.000000, '7503007884015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('130', 170, 'FRU-0104', '3159', 0.000000, '7503007884121', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('131', 171, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('131', 171, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('131', 171, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('131', 171, 'HER-0201', '3245', 0.000000, '7501024523788', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('132', 172, 'PPR-0906', '3745', 0.000000, '719886001017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('132', 172, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('133', 173, 'RIC-0101', '3791', 0.000000, '07432354', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('134', 174, 'GRE-0105', '3182', 0.000000, '7506161206129', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('134', 174, 'GRE-0106', '3183', 0.000000, '7506161206082', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('134', 174, 'GRE-0110', '3187', 0.000000, '7506161206389', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('134', 174, 'GRE-0101', '3178', 0.000000, '7506032105643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('134', 174, 'GRE-0102', '3179', 0.000000, '7506032105612', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('134', 174, 'GRE-0104', '3181', 0.000000, '7506161205894', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('134', 174, 'GRE-0109', '3186', 0.000000, '7506161206945', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('135', 175, 'PPR-0906', '3745', 0.000000, '719886001017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('135', 175, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('136', 176, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('136', 176, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('136', 176, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('136', 176, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('136', 176, 'HER-0201', '3245', 0.000000, '7501024523788', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('136', 176, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('136', 176, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('136', 176, 'HER-0204', '3248', 0.000000, '7501024524211', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('136', 176, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('137', 177, 'GAL-0101', '3168', 0.000000, '87181982', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('138', 178, 'GAL-0105', '3172', 0.000000, '7501541903001', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('139', 179, 'GAL-0103', '3170', 0.000000, '8713300432861', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('140', 180, 'GAL-0103', '3170', 0.000000, '8713300432861', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('140', 180, 'GAL-0105', '3172', 0.000000, '7501541903001', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('141', 181, 'LIF-0101', '3390', 0.000000, '7502226811451', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('141', 181, 'LIF-0102', '3391', 0.000000, '7502226811468', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('141', 181, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('141', 181, 'LIF-0104', '3393', 0.000000, '19000083425', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('141', 181, 'LIF-0105', '3394', 0.000000, '7502226812281', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('141', 181, 'LIF-0106', '3395', 0.000000, '7502226812274', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('141', 181, 'LIF-0107', '3396', 0.000000, '75035693', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('142', 182, 'LUC-0101', '3404', 0.000000, '706460236361', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('142', 182, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('142', 182, 'LUC-0103', '3406', 0.000000, '725181249016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('142', 182, 'LUC-0104', '3407', 0.000000, '706460240450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('142', 182, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('142', 182, 'LUC-0203', '3418', 0.000000, '725181035015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('142', 182, 'LUC-0204', '3419', 0.000000, '725181068013', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('142', 182, 'LUC-0205', '3420', 0.000000, '75021184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('143', 183, 'SKI-0101', '3825', 0.000000, '7502226811871', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('143', 183, 'SKI-0103', '3827', 0.000000, '7502226812373', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('144', 184, 'WRI-0101', '3976', 0.000000, '7502226811680', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('144', 184, 'WRI-0102', '3977', 0.000000, '75034177', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('144', 184, 'WRI-0304', '3984', 0.000000, '7502226811567', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('144', 184, 'WRI-0305', '3985', 0.000000, '7502226811598', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('144', 184, 'WRI-0306', '3986', 0.000000, '7502226811628', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('144', 184, 'WRI-0401', '3991', 0.000000, '7502226812304', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('145', 185, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('145', 185, 'PRO-0102', '3756', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('145', 185, 'PRO-0103', '3757', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('145', 185, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('145', 185, 'PRO-0201', '3775', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('145', 185, 'PRO-0202', '3776', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('145', 185, 'PRO-0203', '3777', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('146', 186, 'FRU-0101', '3156', 0.000000, '7503007884046', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('146', 186, 'FRU-0103', '3158', 0.000000, '7503007884015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('146', 186, 'FRU-0104', '3159', 0.000000, '7503007884121', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('147', 187, 'GRE-0101', '3178', 0.000000, '7506032105643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('147', 187, 'GRE-0102', '3179', 0.000000, '7506032105612', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('147', 187, 'GRE-0104', '3181', 0.000000, '7506161205894', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('147', 187, 'GRE-0105', '3182', 0.000000, '7506161206129', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('147', 187, 'GRE-0110', '3187', 0.000000, '7506161206389', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('148', 188, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('148', 188, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('148', 188, 'HER-0103', '3223', 0.000000, '7501024523412', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('148', 188, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('148', 188, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('148', 188, 'HER-0108', '3228', 0.000000, '7501024541423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('148', 188, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('148', 188, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('148', 188, 'HER-0205', '3249', 0.000000, '7501024524228', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('148', 188, 'HER-0401', '3265', 0.000000, '7501024528523', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('148', 188, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('149', 189, 'HER-0304', '3263', 0.000000, '75025687', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('149', 189, 'HER-0305', '3264', 0.000000, '75025694', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('150', 190, 'PPR-0904', '3743', 0.000000, '719886511486', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('150', 190, 'PPR-0905', '3744', 0.000000, '719886210969', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('150', 190, 'PPR-0906', '3745', 0.000000, '719886001017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('150', 190, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('150', 190, 'PPR-0908', '3747', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('151', 191, 'LUK-0102', '3437', 0.000000, '744218100021', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('151', 191, 'LUK-0105', '3440', 0.000000, '719886511486', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('152', 192, 'MAR-0101', '3450', 0.000000, '7506174500467', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('152', 192, 'MAR-0102', '3451', 0.000000, '7506174500450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('152', 192, 'MAR-0103', '3452', 0.000000, '04056704', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('152', 192, 'MAR-0104', '3453', 0.000000, '7506174500214', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('152', 192, 'MAR-0105', '3454', 0.000000, '7506174500207', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('153', 193, 'SAN-0103', '3819', 0.000000, '7501006404036', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('153', 193, 'SAN-0103', '3819', 0.000000, '7501006404036', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('154', 194, 'WON-0101', '3973', 0.000000, '7916423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('154', 194, 'WON-0102', '3974', 0.000000, '79200370107', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('155', 195, 'PRO-0105', '3759', 0.000000, '713606012529', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('155', 195, 'PRO-0106', '3760', 0.000000, '713606022726', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('155', 195, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('155', 195, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('156', 196, 'DIE-0101', '3041', 0.000000, '8003866012011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('156', 196, 'DIE-0301', '3045', 0.000000, '8003866010017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('157', 197, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('157', 197, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('157', 197, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('157', 197, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('158', 198, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('158', 198, 'LIF-0104', '3393', 0.000000, '19000083425', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('158', 198, 'LIF-0105', '3394', 0.000000, '7502226812281', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('158', 198, 'LIF-0107', '3396', 0.000000, '75035693', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('158', 198, 'LIF-0106', '3395', 0.000000, '7502226812274', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('159', 199, 'LUC-0101', '3404', 0.000000, '706460236361', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('159', 199, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('159', 199, 'LUC-0103', '3406', 0.000000, '725181249016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('159', 199, 'LUC-0104', '3407', 0.000000, '706460240450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('159', 199, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('159', 199, 'LUC-0107', '3410', 0.000000, '725181105015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('159', 199, 'LUC-0201', '3416', 0.000000, '725181389019', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('159', 199, 'LUC-0203', '3418', 0.000000, '725181035015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('159', 199, 'LUC-0204', '3419', 0.000000, '725181068013', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('159', 199, 'LUC-0205', '3420', 0.000000, '75021184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('160', 200, 'SKI-0101', '3825', 0.000000, '7502226811871', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('160', 200, 'SKI-0102', '3826', 0.000000, '7502226811819', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('160', 200, 'SKI-0202', '3834', 0.000000, '040000141150', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('161', 201, 'WRI-0102', '3977', 0.000000, '75034177', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('161', 201, 'WRI-0202', '3979', 0.000000, '75034184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('161', 201, 'WRI-0301', '3981', 0.000000, '7502226810027', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('161', 201, 'WRI-0302', '3982', 0.000000, '7502226810034', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('161', 201, 'WRI-0303', '3983', 0.000000, '7502226810041', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('161', 201, 'WRI-0305', '3985', 0.000000, '7502226811598', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('161', 201, 'WRI-0306', '3986', 0.000000, '7502226811628', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('161', 201, 'WRI-0401', '3991', 0.000000, '7502226812304', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('162', 202, 'ACT-0101', '3007', 0.000000, '76150420098', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('162', 202, 'ACT-0102', '3008', 0.000000, '7501006551044', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('162', 202, 'ACT-0103', '3009', 0.000000, '7501006551051', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('162', 202, 'ACT-0104', '3010', 0.000000, '7501006551068', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('162', 202, 'ACT-0105', '3011', 0.000000, '7501006551075', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('162', 202, 'ACT-0107', '3012', 0.000000, '7501006555578', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('163', 203, 'GRE-0105', '3182', 0.000000, '7506161206129', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('164', 204, 'MAR-0101', '3450', 0.000000, '7506174500467', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('164', 204, 'MAR-0102', '3451', 0.000000, '7506174500450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('164', 204, 'MAR-0103', '3452', 0.000000, '04056704', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('164', 204, 'MAR-0104', '3453', 0.000000, '7506174500214', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('164', 204, 'MAR-0105', '3454', 0.000000, '7506174500207', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('165', 205, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('165', 205, 'PRO-0102', '3756', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('165', 205, 'PRO-0103', '3757', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('165', 205, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('165', 205, 'PRO-0105', '3759', 0.000000, '713606012529', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('165', 205, 'PRO-0106', '3760', 0.000000, '713606022726', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('165', 205, 'PRO-0201', '3775', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('165', 205, 'PRO-0202', '3776', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('165', 205, 'PRO-0203', '3777', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('166', 206, 'SAN-0102', '3818', 0.000000, '7501006402155', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('166', 206, 'SAN-0102', '3818', 0.000000, '7501006402155', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('167', 207, 'EFR-0101', '3070', 0.000000, '8437003969744', NULL, NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('167', 207, 'EFR-0103', '3072', 0.000000, '8437003969737', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('167', 207, 'EFR-0201', '3074', 0.000000, '8437003969485', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('167', 207, 'EFR-0202', '3075', 0.000000, '8437003969492', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45');
INSERT INTO `purchase_items` (`DocEntry`, `purchase_id`, `ItemCode`, `product_id`, `quantity`, `CodeBars`, `u_CantReq`, `DistNumber`, `u_Caducidad`, `status`, `created_at`, `updated_at`) VALUES
('167', 207, 'EFR-0203', '3076', 0.000000, '8437004904911', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('167', 207, 'EFR-0204', '3077', 0.000000, '8437005297753', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('167', 207, 'EFR-0304', '3092', 0.000000, '7504015341477', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('167', 207, 'EFR-0307', '3095', 0.000000, '7504015341521', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('167', 207, 'EFR-0308', '3096', 0.000000, '7504015341538', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('167', 207, 'EFR-0104', '3073', 0.000000, '8437003969768', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('168', 208, 'TOP-0101', '3877', 0.000000, '41116206252', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('169', 209, 'TOP-0103', '3879', 0.000000, '41116204777', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('170', 210, 'TOP-0102', '3878', 0.000000, '41116209031', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('171', 211, 'ACT-0101', '3007', 0.000000, '76150420098', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('171', 211, 'ACT-0102', '3008', 0.000000, '7501006551044', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('171', 211, 'ACT-0103', '3009', 0.000000, '7501006551051', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('171', 211, 'ACT-0104', '3010', 0.000000, '7501006551068', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('172', 212, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('172', 212, 'PRO-0102', '3756', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('172', 212, 'PRO-0103', '3757', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('172', 212, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('172', 212, 'PRO-0105', '3759', 0.000000, '713606012529', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('172', 212, 'PRO-0106', '3760', 0.000000, '713606022726', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('172', 212, 'PRO-0201', '3775', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('172', 212, 'PRO-0202', '3776', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('172', 212, 'PRO-0203', '3777', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('173', 213, 'GRE-0104', '3181', 0.000000, '7506161205894', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('173', 213, 'GRE-0105', '3182', 0.000000, '7506161206129', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('173', 213, 'GRE-0106', '3183', 0.000000, '7506161206082', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('173', 213, 'GRE-0110', '3187', 0.000000, '7506161206389', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('174', 214, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('174', 214, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('174', 214, 'HER-0103', '3223', 0.000000, '7501024523412', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('174', 214, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('174', 214, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('174', 214, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('174', 214, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('174', 214, 'HER-0207', '3251', 0.000000, '7501024524259', NULL, NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('175', 215, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('175', 215, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('175', 215, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('175', 215, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('176', 216, 'LIF-0102', '3391', 0.000000, '7502226811468', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('176', 216, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('176', 216, 'LIF-0104', '3393', 0.000000, '19000083425', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('176', 216, 'LIF-0107', '3396', 0.000000, '75035693', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('177', 217, 'LUC-0101', '3404', 0.000000, '706460236361', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('177', 217, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('177', 217, 'LUC-0103', '3406', 0.000000, '725181249016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('177', 217, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('177', 217, 'LUC-0203', '3418', 0.000000, '725181035015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('177', 217, 'LUC-0204', '3419', 0.000000, '725181068013', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('177', 217, 'LUC-0205', '3420', 0.000000, '75021184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('178', 218, 'LUK-0108', '3442', 0.000000, '744218100038', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('178', 218, 'LUK-0101', '3436', 0.000000, '744218100069', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('178', 218, 'LUK-0102', '3437', 0.000000, '744218100021', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('178', 218, 'LUK-0105', '3440', 0.000000, '719886511486', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('179', 219, 'MAR-0101', '3450', 0.000000, '7506174500467', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('179', 219, 'MAR-0103', '3452', 0.000000, '04056704', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('179', 219, 'MAR-0104', '3453', 0.000000, '7506174500214', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('179', 219, 'MAR-0105', '3454', 0.000000, '7506174500207', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('180', 220, 'PPR-0905', '3744', 0.000000, '719886210969', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('180', 220, 'PPR-0906', '3745', 0.000000, '719886001017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('180', 220, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('180', 220, 'PPR-0908', '3747', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('181', 221, 'SKI-0101', '3825', 0.000000, '7502226811871', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('181', 221, 'SKI-0102', '3826', 0.000000, '7502226811819', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('181', 221, 'SKI-0202', '3834', 0.000000, '040000141150', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('182', 222, 'WON-0101', '3973', 0.000000, '7916423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('182', 222, 'WON-0102', '3974', 0.000000, '79200370107', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('183', 223, 'WRI-0101', '3976', 0.000000, '7502226811680', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('183', 223, 'WRI-0201', '3978', 0.000000, '7502226811673', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('183', 223, 'WRI-0202', '3979', 0.000000, '75034184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('183', 223, 'WRI-0301', '3981', 0.000000, '7502226810027', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('183', 223, 'WRI-0304', '3984', 0.000000, '7502226811567', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('183', 223, 'WRI-0305', '3985', 0.000000, '7502226811598', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('183', 223, 'WRI-0401', '3991', 0.000000, '7502226812304', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('184', 224, 'EFR-0101', '3070', 0.000000, '8437003969744', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('184', 224, 'EFR-0103', '3072', 0.000000, '8437003969737', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('184', 224, 'EFR-0201', '3074', 0.000000, '8437003969485', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('184', 224, 'EFR-0301', '3089', 0.000000, '25015539', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('184', 224, 'EFR-0302', '3090', 0.000000, '25015515', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('184', 224, 'EFR-0303', '3091', 0.000000, '2050037669822', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('184', 224, 'EFR-0304', '3092', 0.000000, '7504015341477', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('184', 224, 'EFR-0307', '3095', 0.000000, '7504015341521', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('184', 224, 'EFR-0308', '3096', 0.000000, '7504015341538', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('184', 224, 'EFR-0104', '3073', 0.000000, '8437003969768', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('185', 225, 'ACT-0101', '3007', 0.000000, '76150420098', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('185', 225, 'ACT-0102', '3008', 0.000000, '7501006551044', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('185', 225, 'ACT-0103', '3009', 0.000000, '7501006551051', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('185', 225, 'ACT-0104', '3010', 0.000000, '7501006551068', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('185', 225, 'ACT-0105', '3011', 0.000000, '7501006551075', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('186', 226, 'FRU-0101', '3156', 0.000000, '7503007884046', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('186', 226, 'FRU-0103', '3158', 0.000000, '7503007884015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('186', 226, 'FRU-0104', '3159', 0.000000, '7503007884121', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('188', 227, 'GRE-0101', '3178', 0.000000, '7506032105643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('188', 227, 'GRE-0104', '3181', 0.000000, '7506161205894', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('189', 228, 'GRE-0105', '3182', 0.000000, '7506161206129', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('189', 228, 'GRE-0101', '3178', 0.000000, '7506032105643', NULL, NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('189', 228, 'GRE-0104', '3181', 0.000000, '7506161205894', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('190', 229, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('190', 229, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('190', 229, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('190', 229, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('190', 229, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('190', 229, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('191', 230, 'HER-0201', '3245', 0.000000, '7501024523788', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('192', 231, 'LIF-0102', '3391', 0.000000, '7502226811468', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('192', 231, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('192', 231, 'LIF-0104', '3393', 0.000000, '19000083425', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('192', 231, 'LIF-0105', '3394', 0.000000, '7502226812281', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('192', 231, 'LIF-0106', '3395', 0.000000, '7502226812274', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('192', 231, 'LIF-0107', '3396', 0.000000, '75035693', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('193', 232, 'LUC-0101', '3404', 0.000000, '706460236361', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('193', 232, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('193', 232, 'LUC-0103', '3406', 0.000000, '725181249016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('193', 232, 'LUC-0104', '3407', 0.000000, '706460240450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('193', 232, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('193', 232, 'LUC-0203', '3418', 0.000000, '725181035015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('193', 232, 'LUC-0204', '3419', 0.000000, '725181068013', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('193', 232, 'LUC-0205', '3420', 0.000000, '75021184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('194', 233, 'LUK-0101', '3436', 0.000000, '744218100069', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('194', 233, 'LUK-0102', '3437', 0.000000, '744218100021', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('194', 233, 'LUK-0108', '3442', 0.000000, '744218100038', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('195', 234, 'PPR-0906', '3745', 0.000000, '719886001017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('195', 234, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('196', 235, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('196', 235, 'PRO-0102', '3756', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('196', 235, 'PRO-0103', '3757', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('196', 235, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('196', 235, 'PRO-0105', '3759', 0.000000, '713606012529', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('196', 235, 'PRO-0106', '3760', 0.000000, '713606022726', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('196', 235, 'PRO-0201', '3775', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('196', 235, 'PRO-0202', '3776', 0.000000, '713606010297', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('196', 235, 'PRO-0203', '3777', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('197', 236, 'RIC-0101', '3791', 0.000000, '07432354', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('197', 236, 'RIC-0101', '3791', 0.000000, '07432354', NULL, NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('198', 237, 'SAN-0103', '3819', 0.000000, '7501006404036', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('198', 237, 'SAN-0103', '3819', 0.000000, '7501006404036', NULL, NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('199', 238, 'SKI-0101', '3825', 0.000000, '7502226811871', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('199', 238, 'SKI-0102', '3826', 0.000000, '7502226811819', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('199', 238, 'SKI-0103', '3827', 0.000000, '7502226812373', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('199', 238, 'SKI-0202', '3834', 0.000000, '040000141150', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('200', 239, 'WON-0102', '3974', 0.000000, '79200370107', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:45', '2018-06-12 21:39:45'),
('201', 240, 'ZUP-0201', '4020', 0.000000, '703885000621', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('201', 240, 'ZUP-0202', '4021', 0.000000, '703885003806', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('203', 241, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('203', 241, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('203', 241, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('203', 241, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('203', 241, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('204', 242, 'PPR-0908', '3747', 0.000000, '719886511011', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('204', 242, 'PPR-0904', '3743', 0.000000, '719886511486', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('205', 243, 'FRU-0101', '3156', 0.000000, '7503007884046', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('205', 243, 'FRU-0103', '3158', 0.000000, '7503007884015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('205', 243, 'FRU-0104', '3159', 0.000000, '7503007884121', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('206', 244, 'GRE-0101', '3178', 0.000000, '7506032105643', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('206', 244, 'GRE-0102', '3179', 0.000000, '7506032105612', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('206', 244, 'GRE-0104', '3181', 0.000000, '7506161205894', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('206', 244, 'GRE-0105', '3182', 0.000000, '7506161206129', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('207', 245, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('207', 245, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('207', 245, 'HER-0103', '3223', 0.000000, '7501024523412', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('207', 245, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('207', 245, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('207', 245, 'HER-0201', '3245', 0.000000, '7501024523788', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('207', 245, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('207', 245, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('207', 245, 'HER-0401', '3265', 0.000000, '7501024528523', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('207', 245, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('208', 246, 'HER-0302', '3261', 0.000000, '7501024512034', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('209', 247, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('209', 247, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('209', 247, 'IND-0101', '3366', 0.000000, '790203019113', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('209', 247, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('210', 248, 'LUK-0101', '3436', 0.000000, '744218100069', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('210', 248, 'LUK-0102', '3437', 0.000000, '744218100021', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('210', 248, 'LUK-0105', '3440', 0.000000, '719886511486', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('211', 249, 'MAR-0101', '3450', 0.000000, '7506174500467', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('211', 249, 'MAR-0102', '3451', 0.000000, '7506174500450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('211', 249, 'MAR-0103', '3452', 0.000000, '04056704', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('211', 249, 'MAR-0104', '3453', 0.000000, '7506174500214', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('211', 249, 'MAR-0105', '3454', 0.000000, '7506174500207', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('212', 250, 'PPR-0906', '3745', 0.000000, '719886001017', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('212', 250, 'PPR-0907', '3746', 0.000000, '719886511042', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('213', 251, 'PRO-0101', '3755', 0.000000, '713606021026', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('213', 251, 'PRO-0102', '3756', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('213', 251, 'PRO-0104', '3758', 0.000000, '713606040195', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('213', 251, 'PRO-0105', '3759', 0.000000, '713606012529', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('213', 251, 'PRO-0201', '3775', 0.000000, '713606010396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('214', 252, 'SAN-0102', '3818', 0.000000, '7501006402155', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('214', 252, 'SAN-0102', '3818', 0.000000, '7501006402155', NULL, NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('215', 253, 'WON-0102', '3974', 0.000000, '79200370107', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('215', 253, 'WON-0103', '3975', 0.000000, '79200136284', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('216', 254, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('216', 254, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('216', 254, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('216', 254, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('216', 254, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('217', 255, 'GAL-0103', '3170', 0.000000, '8713300432861', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('218', 256, 'ACT-0103', '3009', 0.000000, '7501006551051', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('219', 257, 'LIF-0101', '3390', 0.000000, '7502226811451', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('219', 257, 'LIF-0102', '3391', 0.000000, '7502226811468', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('219', 257, 'LIF-0103', '3392', 0.000000, '19000083449', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('219', 257, 'LIF-0104', '3393', 0.000000, '19000083425', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('219', 257, 'LIF-0107', '3396', 0.000000, '75035693', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('219', 257, 'LIF-0201', '3399', 0.000000, '022000003607', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('219', 257, 'LIF-0202', '3400', 0.000000, '022000003591', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('220', 258, 'LUC-0101', '3404', 0.000000, '706460236361', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('220', 258, 'LUC-0102', '3405', 0.000000, '725181207016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('220', 258, 'LUC-0103', '3406', 0.000000, '725181249016', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('220', 258, 'LUC-0104', '3407', 0.000000, '706460240450', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('220', 258, 'LUC-0105', '3408', 0.000000, '7502226811970', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('220', 258, 'LUC-0201', '3416', 0.000000, '725181389019', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('220', 258, 'LUC-0202', '3417', 0.000000, '725181203018', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('220', 258, 'LUC-0203', '3418', 0.000000, '725181035015', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('220', 258, 'LUC-0204', '3419', 0.000000, '725181068013', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('220', 258, 'LUC-0205', '3420', 0.000000, '75021184', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('221', 259, 'SKI-0101', '3825', 0.000000, '7502226811871', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('221', 259, 'SKI-0102', '3826', 0.000000, '7502226811819', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('221', 259, 'SKI-0202', '3834', 0.000000, '040000141150', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('221', 259, 'STA-0202', '3845', 0.000000, '040000162612', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('222', 260, 'WRI-0101', '3976', 0.000000, '7502226811680', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('222', 260, 'WRI-0201', '3978', 0.000000, '7502226811673', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('222', 260, 'WRI-0301', '3981', 0.000000, '7502226810027', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('222', 260, 'WRI-0302', '3982', 0.000000, '7502226810034', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('222', 260, 'WRI-0303', '3983', 0.000000, '7502226810041', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('222', 260, 'WRI-0304', '3984', 0.000000, '7502226811567', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('222', 260, 'WRI-0305', '3985', 0.000000, '7502226811598', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('222', 260, 'WRI-0306', '3986', 0.000000, '7502226811628', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('222', 260, 'WRI-0401', '3991', 0.000000, '7502226812304', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('223', 261, 'EFR-0101', '3070', 0.000000, '8437003969744', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('223', 261, 'EFR-0103', '3072', 0.000000, '8437003969737', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('223', 261, 'EFR-0201', '3074', 0.000000, '8437003969485', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('223', 261, 'EFR-0307', '3095', 0.000000, '7504015341521', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('223', 261, 'EFR-0308', '3096', 0.000000, '7504015341538', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('223', 261, 'EFR-0303', '3091', 0.000000, '2050037669822', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('223', 261, 'EFR-0301', '3089', 0.000000, '25015539', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('224', 262, 'HER-0101', '3221', 0.000000, '7501024511310', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('224', 262, 'HER-0102', '3222', 0.000000, '7501024513314', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('224', 262, 'HER-0103', '3223', 0.000000, '7501024523412', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('224', 262, 'HER-0104', '3224', 0.000000, '75011192', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('224', 262, 'HER-0106', '3226', 0.000000, '7501024511396', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('224', 262, 'HER-0108', '3228', 0.000000, '7501024541423', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('224', 262, 'HER-0202', '3246', 0.000000, '7501024523795', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('224', 262, 'HER-0203', '3247', 0.000000, '7501024523801', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('224', 262, 'HER-0401', '3265', 0.000000, '7501024528523', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('224', 262, 'HER-0402', '3266', 0.000000, '7501024529872', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('225', 263, 'HER-0302', '3261', 0.000000, '7501024512034', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46'),
('226', 264, 'IND-0102', '3367', 0.000000, '790203039111', '.000000', NULL, NULL, NULL, '2018-06-12 21:39:46', '2018-06-12 21:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `rols`
--

DROP TABLE IF EXISTS `rols`;
CREATE TABLE IF NOT EXISTS `rols` (
  `id` int(10) unsigned NOT NULL,
  `rol` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rols`
--

INSERT INTO `rols` (`id`, `rol`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', 'Administrador del sistema', NULL, NULL),
(2, 'DIRECCION', 'Direcci??n General', NULL, NULL),
(3, 'JEFE_ALMACEN', 'Jefe de Almac??n', NULL, NULL),
(4, 'RECIBO_Y_ALMACEN', 'Responsable de recibo y Almacen', NULL, NULL),
(5, 'SURTIDO_A', 'Encargado de Surtido a Almac??n', NULL, NULL),
(6, 'PASILLO', 'Encargado de pasillo', NULL, NULL),
(7, 'A_GENERAL', 'Ayudante General', NULL, NULL),
(8, 'EMBALAJE', 'Responsable de Embalaje', NULL, NULL),
(9, 'SURTIDO_PP', 'Responsable de surtido', NULL, NULL),
(10, 'PP_GENERAL', 'Ayudante General Preparaci??n', NULL, NULL),
(11, 'DEVOLUCIONES', 'Responsable de devoluciones', NULL, NULL),
(12, 'COORDINADOR', 'Coordinador de distribuci??n', NULL, NULL),
(13, 'CAPTURISTA', 'Capturista', NULL, NULL),
(14, 'AUXILIAR', 'Auxiliar administrativo', NULL, NULL),
(15, 'EMBARQUE', 'Responsable de embarque', NULL, NULL),
(16, 'A_EMBARQUE', 'Ayudante de embarque', NULL, NULL),
(17, 'CHOFER', 'Chofer', NULL, NULL),
(18, 'A_DISTRIBUCION', 'Ayudante de distribuci??n', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
CREATE TABLE IF NOT EXISTS `rules` (
  `id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `select` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operator` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip`, `token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '::1', NULL, '2018-06-21 19:16:52', '2018-06-21 21:38:43', '2018-06-21 21:38:43'),
(2, 2, '::1', NULL, '2018-06-21 20:26:02', '2018-06-21 20:31:58', '2018-06-21 20:31:58'),
(3, 1, '::1', NULL, '2018-06-21 21:38:43', '2018-06-21 21:39:19', '2018-06-21 21:39:19'),
(4, 1, '::1', NULL, '2018-06-22 14:57:38', '2018-06-22 14:57:53', '2018-06-22 14:57:53'),
(5, 1, '::1', NULL, '2018-06-22 15:34:36', '2018-06-22 19:11:02', '2018-06-22 19:11:02'),
(6, 1, '::1', NULL, '2018-06-22 19:11:02', '2018-06-22 19:32:23', '2018-06-22 19:32:23'),
(7, 2, '::1', NULL, '2018-06-22 19:32:32', '2018-06-22 19:32:51', '2018-06-22 19:32:51'),
(8, 1, '::1', NULL, '2018-06-22 19:32:53', '2018-06-22 19:33:43', '2018-06-22 19:33:43'),
(9, 2, '::1', NULL, '2018-06-22 19:33:52', '2018-06-22 19:34:40', '2018-06-22 19:34:40'),
(10, 1, '::1', NULL, '2018-06-22 19:34:41', '2018-06-22 19:38:04', '2018-06-22 19:38:04'),
(11, 2, '::1', NULL, '2018-06-22 19:38:14', '2018-06-22 19:38:23', '2018-06-22 19:38:23'),
(12, 1, '::1', NULL, '2018-06-22 21:50:34', '2018-06-23 23:05:08', '2018-06-23 23:05:08'),
(13, 1, '::1', NULL, '2018-06-23 23:05:08', '2018-06-23 23:06:21', '2018-06-23 23:06:21'),
(14, 1, '::1', NULL, '2018-06-25 23:55:42', '2018-06-26 00:26:18', '2018-06-26 00:26:18'),
(15, 1, '::1', NULL, '2018-06-26 00:26:20', '2018-06-26 00:27:01', '2018-06-26 00:27:01'),
(16, 2, '::1', NULL, '2018-06-26 00:27:09', '2018-06-26 00:27:20', '2018-06-26 00:27:20'),
(17, 1, '::1', NULL, '2018-06-26 00:27:22', '2018-06-27 14:15:31', '2018-06-27 14:15:31'),
(18, 1, '::1', NULL, '2018-06-27 14:15:31', '2018-06-27 14:18:52', '2018-06-27 14:18:52'),
(19, 2, '::1', NULL, '2018-06-27 14:19:08', '2018-06-27 14:52:00', '2018-06-27 14:52:00'),
(20, 1, '::1', NULL, '2018-06-28 22:35:30', '2018-06-28 22:37:08', '2018-06-28 22:37:08'),
(21, 2, '::1', NULL, '2018-06-28 22:37:23', '2018-06-28 22:38:49', '2018-06-28 22:38:49'),
(22, 1, '::1', NULL, '2018-06-28 22:38:56', '2018-06-28 22:39:17', '2018-06-28 22:39:17'),
(23, 1, '::1', NULL, '2018-06-29 18:18:33', '2018-06-30 00:07:58', '2018-06-30 00:07:58'),
(24, 1, '::1', NULL, '2018-06-30 00:07:58', '2018-06-30 00:11:15', '2018-06-30 00:11:15'),
(25, 1, '::1', NULL, '2018-06-30 00:11:16', '2018-07-02 16:39:37', '2018-07-02 16:39:37'),
(26, 1, '::1', NULL, '2018-07-02 16:39:37', '2018-07-02 20:23:16', '2018-07-02 20:23:16'),
(27, 1, '::1', NULL, '2018-07-02 20:23:16', '2018-07-02 20:28:36', '2018-07-02 20:28:36'),
(28, 1, '::1', NULL, '2018-07-02 20:33:59', '2018-07-02 20:34:10', '2018-07-02 20:34:10'),
(29, 2, '::1', NULL, '2018-07-02 20:34:24', '2018-07-02 20:34:43', '2018-07-02 20:34:43'),
(30, 1, '::1', NULL, '2018-07-02 20:36:21', '2018-07-02 20:36:32', '2018-07-02 20:36:32'),
(31, 2, '::1', NULL, '2018-07-02 20:36:39', '2018-07-02 20:36:47', '2018-07-02 20:36:47'),
(32, 1, '::1', NULL, '2018-07-02 20:36:49', '2018-07-02 20:37:52', '2018-07-02 20:37:52'),
(33, 2, '::1', NULL, '2018-07-02 20:38:38', '2018-07-02 20:38:52', '2018-07-02 20:38:52'),
(34, 1, '::1', NULL, '2018-07-02 20:38:54', '2018-07-03 02:06:26', '2018-07-03 02:06:26'),
(35, 2, '::1', NULL, '2018-07-03 01:51:46', '2018-07-03 01:52:35', '2018-07-03 01:52:35'),
(36, 1, '::1', NULL, '2018-07-03 02:06:26', '2018-07-03 02:08:02', '2018-07-03 02:08:02'),
(37, 1, '::1', '7bphKOqfGsKJ7bnqAkCniGtJGwj5Sv', '2018-07-03 02:08:51', '2018-07-03 02:24:32', '2018-07-03 02:24:32'),
(38, 1, '::1', '2sPEMJ88l63l5hL7gXFSnH3versaX5', '2018-07-03 15:49:10', '2018-07-03 19:06:56', '2018-07-03 19:06:56'),
(39, 2, '::1', 'mAgVSnB5lrrRcSBXfAIpStYxbRWWSm', '2018-07-03 16:51:05', '2018-07-03 16:51:33', '2018-07-03 16:51:33'),
(40, 1, '::1', '3Wjlz51R7U51vKyi9BjJpquEYEtFaT', '2018-07-03 19:06:56', '2018-07-03 21:39:56', '2018-07-03 21:39:56'),
(41, 1, '::1', 'eAjtVFn4gD1PqEfkfhEflAcBkfaxMr', '2018-07-03 21:39:56', '2018-07-03 23:43:53', '2018-07-03 23:43:53'),
(42, 1, '::1', 'L9c2IxHG5j1Ve5QeddvGV2RbJdWZdk', '2018-07-03 23:43:53', '2018-07-04 01:13:07', '2018-07-04 01:13:07'),
(43, 1, '::1', 'UROge7th7C1C60v56ArNEsV0QsH9cL', '2018-07-04 01:13:08', '2018-07-04 01:27:13', '2018-07-04 01:27:13'),
(44, 1, '::1', 'lDJAmi6WZ26WzZ7hDhZfWRs2TnoSYc', '2018-07-04 01:27:15', '2018-07-04 02:28:52', '2018-07-04 02:28:52'),
(45, 1, '::1', 'heg3RMHsgMehzPvR4TPgKPL71yq9SQ', '2018-07-04 16:46:18', '2018-07-04 17:33:32', '2018-07-04 17:33:32'),
(46, 2, '::1', 'PghztfC6WGLjdnbfIFn0wsYvfcnOaO', '2018-07-04 17:33:40', '2018-07-04 18:02:35', '2018-07-04 18:02:35'),
(47, 2, '::1', 'BZnq66gEfPmZb6uqwhwhaNAKonbbEq', '2018-07-04 18:41:02', '2018-07-04 19:27:05', '2018-07-04 19:27:05'),
(48, 1, '::1', 'UdberNuzA7Tr7z6JOfhtwCEusQwY8K', '2018-07-04 19:27:07', '2018-07-04 21:15:44', '2018-07-04 21:15:44'),
(49, 1, '::1', 'I3enQhwNbAd91Dq40wF8J9TP95RsrR', '2018-07-04 21:15:44', '2018-07-05 00:02:08', '2018-07-05 00:02:08'),
(50, 1, '::1', 'g4gaqdLC4rO6MOA4eHykALGskjrUxw', '2018-07-05 00:02:08', '2018-07-05 00:08:21', '2018-07-05 00:08:21'),
(51, 6, '::1', 's9FwZDMxRMLjgDH6asPRiHxShFbGVs', '2018-07-05 00:08:27', '2018-07-05 00:08:52', '2018-07-05 00:08:52'),
(52, 1, '::1', 'F5bhjC2cjCuYpuVrejfO57AXr1Do8Q', '2018-07-05 00:08:53', '2018-07-05 00:10:20', '2018-07-05 00:10:20'),
(53, 6, '::1', '8e6GvZK8wgABTDBnYeLjP0jWCblFfO', '2018-07-05 00:10:30', '2018-07-05 00:10:54', '2018-07-05 00:10:54'),
(54, 1, '::1', 'l95QghjRMv7gtqQiX10PPZTep3OAV5', '2018-07-05 00:10:59', '2018-07-05 00:11:26', '2018-07-05 00:11:26'),
(55, 6, '::1', '75p6vyI1XNY2LDdII87WgArG0TijKD', '2018-07-05 00:11:38', '2018-07-05 00:12:11', '2018-07-05 00:12:11'),
(56, 1, '::1', '8w8ElwJytjgeubPnY9GdJqdKKSO0iU', '2018-07-05 00:12:13', '2018-07-05 00:12:45', '2018-07-05 00:12:45'),
(57, 6, '::1', '0C6Vsop46qBVi9Ce8zSnt906c3dU2t', '2018-07-05 00:12:55', '2018-07-05 00:29:24', '2018-07-05 00:29:24'),
(58, 1, '::1', 'MUc66OkRsZb3xBzLnSVCKpaSDLQWhF', '2018-07-05 00:29:25', '2018-07-05 00:30:03', '2018-07-05 00:30:03'),
(59, 7, '::1', 'kWb4EQ66uyxhB3VmEWMZnLmKliA2Q2', '2018-07-05 00:30:08', '2018-07-05 00:31:54', '2018-07-05 00:31:54'),
(60, 2, '::1', 'SxAuIDFndXJK3ngLBcXSSVFQjWw2ZY', '2018-07-05 00:32:14', '2018-07-05 00:33:11', '2018-07-05 00:33:11'),
(61, 7, '::1', '2A07ihnXpDPXtjnsNHvZoxAP5BsI26', '2018-07-05 00:33:21', '2018-07-05 02:43:50', '2018-07-05 02:43:50'),
(62, 7, '::1', '1ZfoPVoCe61r6870nerxkQNDyyvkDf', '2018-07-05 02:43:50', '2018-07-05 02:45:47', '2018-07-05 02:45:47'),
(63, 1, '::1', 'tpv8dXPkj90jeKSFDXIPQphg6gwdRZ', '2018-07-05 02:45:48', '2018-07-05 02:46:30', '2018-07-05 02:46:30'),
(64, 7, '::1', 'V4ify3SuzwUsmguWJVCeOt6Kb5MSbW', '2018-07-05 02:46:40', '2018-07-05 05:00:07', '2018-07-05 05:00:07'),
(65, 7, '::1', 'Q5HU9omzCQ2wcEVZCXyMhiUlwbQimR', '2018-07-05 05:00:07', '2018-07-05 05:01:52', '2018-07-05 05:01:52'),
(66, 1, '::1', '5k3zeG5PDOlBBcncfsPvD91BrlZoTc', '2018-07-05 05:01:54', '2018-07-05 05:02:42', '2018-07-05 05:02:42'),
(67, 7, '::1', 'qO2PQZKgT0nBMspNJeDOXAq6y4ljWI', '2018-07-05 05:02:52', '2018-07-05 15:57:18', '2018-07-05 15:57:18'),
(68, 1, '::1', '3gE3bHJEuStqAsnfzyRxVGDPnlIW5h', '2018-07-05 15:56:53', '2018-07-05 15:57:08', '2018-07-05 15:57:08'),
(69, 7, '::1', 'PJjxE6ZU1gbH850FvtuAbdjMEj9Rz4', '2018-07-05 15:57:18', '2018-07-05 17:17:27', NULL),
(70, 2, '127.0.0.1', 'P9t6cIbXtwiDrbpoHasK50iBAVadqT', '2018-07-09 17:02:15', '2018-07-10 03:12:23', '2018-07-10 03:12:23'),
(71, 2, '127.0.0.1', '5QFS7Am14OzSkmC42I089KOMGavQ16', '2018-07-10 03:12:23', '2018-07-11 20:46:39', '2018-07-11 20:46:39'),
(72, 1, '127.0.0.1', 'kRlGH1VFd7L996Il6AG8cVMqrwYaMX', '2018-07-10 14:16:48', '2018-07-10 18:00:59', '2018-07-10 18:00:59'),
(73, 1, '127.0.0.1', '0a55Vw4XddGFMSpCEdKiVgWmQbaica', '2018-07-10 18:00:59', '2018-07-11 21:56:02', '2018-07-11 21:56:02'),
(74, 2, '127.0.0.1', 'uUi6MRsk6uR3BRG4w1zeIstsnHkND9', '2018-07-11 20:46:39', '2018-07-11 20:57:18', NULL),
(75, 1, '127.0.0.1', 'uTfaNJbuIOZVc7WBImH5PcCyHNhaqE', '2018-07-11 21:56:02', '2018-07-12 22:19:43', '2018-07-12 22:19:43'),
(76, 1, '127.0.0.1', 'q20QII28w7bGsso8wVEbl2tCUCiN2b', '2018-07-12 22:19:43', '2018-07-13 03:09:05', '2018-07-13 03:09:05'),
(77, 1, '127.0.0.1', 'iJ64aDFoNUChaO8HlJHZxngBM7yBee', '2018-07-13 03:09:05', '2018-07-15 18:39:34', '2018-07-15 18:39:34'),
(78, 1, '127.0.0.1', 'mVUmjOtKFxHPkB4ov4fjuYqLCluC67', '2018-07-15 18:39:34', '2018-07-16 05:05:17', '2018-07-16 05:05:17'),
(79, 1, '127.0.0.1', 'GoU2MfyRZ4T8644NViftqTqjABD7x8', '2018-07-16 05:05:17', '2018-07-16 19:29:30', '2018-07-16 19:29:30'),
(80, 1, '127.0.0.1', 'zUlscbJZ5WD8LwNF7dknA4pH3UDvJe', '2018-07-16 19:29:30', '2018-07-17 00:11:13', '2018-07-17 00:11:13'),
(81, 1, '127.0.0.1', 'h5aot8ZbTOGpe4fpV50KOUDdKzZhSr', '2018-07-17 00:11:13', '2018-07-17 06:32:33', '2018-07-17 06:32:33'),
(82, 1, '::1', 'Bufn7Qis4jg0krS67zbMrRKFDY5e74', '2018-07-17 06:32:33', '2018-07-17 06:34:10', '2018-07-17 06:34:10'),
(83, 1, '::1', 'CyymFnwpjfKJYlSLikP948l9CYFta1', '2018-07-17 06:34:12', '2018-07-17 06:37:00', '2018-07-17 06:37:00'),
(84, 4, '::1', 'hM3cB804oYOxf6OUrtSqpCFXypO4Fy', '2018-07-17 06:37:09', '2018-07-17 06:39:49', '2018-07-17 06:39:49'),
(85, 3, '::1', 'Ix9Z13YrkTIB3q1aFAVNnDIsZkqUCk', '2018-07-17 06:37:49', '2018-07-17 06:39:46', '2018-07-17 06:39:46'),
(86, 3, '::1', 'IoaeEPtTmnipsHmYXKaw82GLTDGBty', '2018-07-17 06:39:57', '2018-07-17 06:40:10', '2018-07-17 06:40:10'),
(87, 1, '::1', '3UxqrDuWFLq4c3PrsuCrJcdSfzh8jb', '2018-07-17 06:40:12', '2018-07-17 06:40:45', '2018-07-17 06:40:45'),
(88, 3, '::1', 'iLNb5ywE3XJ5ytbuSDGjwmLdnAwb2g', '2018-07-17 06:40:52', '2018-07-17 06:41:16', '2018-07-17 06:41:16'),
(89, 4, '::1', '7eMbKRYb8pEdhMYYvaWq3tjymrn07c', '2018-07-17 06:41:24', '2018-07-17 16:43:11', '2018-07-17 16:43:11'),
(90, 3, '::1', '3bg0anwcyGzCzFIQWqVnometUE5HH3', '2018-07-17 06:41:48', '2018-07-17 06:42:06', '2018-07-17 06:42:06'),
(91, 1, '::1', 'GECEU0Xpe8OD4gb9KDMKwvHKtbDXdj', '2018-07-17 06:58:48', '2018-07-17 07:06:42', '2018-07-17 07:06:42'),
(92, 1, '::1', 'jJUrafo7WKrxjzfB62kWCkM3Yfxtzh', '2018-07-17 07:17:11', '2018-07-17 16:38:03', '2018-07-17 16:38:03'),
(93, 1, '::1', 'rIWlygKkCK86BURb9m9lV5bdmxIVjr', '2018-07-17 16:38:03', '2018-07-17 16:43:04', '2018-07-17 16:43:04'),
(94, 3, '::1', 'ydtqyxrVOeR7BEKh9hLpcQEbenhvEd', '2018-07-17 16:42:57', '2018-07-17 16:56:20', '2018-07-17 16:56:20'),
(95, 4, '::1', 'iCI2SbDBVeE4VsRIsqlWOPlA9k7zWa', '2018-07-17 16:43:11', '2018-07-17 16:43:31', '2018-07-17 16:43:31'),
(96, 1, '::1', '3xRgWf7ZaYCpHslvC6UBtndwIjbcyt', '2018-07-17 16:43:32', '2018-07-17 16:52:05', '2018-07-17 16:52:05'),
(97, 9, '::1', 'v3usbAlYQrX42D3UHNa7bKDKlY9tjo', '2018-07-17 16:52:17', '2018-07-17 16:52:28', '2018-07-17 16:52:28'),
(98, 1, '::1', 'ZXI88WRCkeasbE2s2RJjFkMuAC6zxF', '2018-07-17 16:52:32', '2018-07-17 17:07:44', '2018-07-17 17:07:44'),
(99, 10, '::1', 'GuRZAa1AmJdWxcMAHFwuXAQUcK4jgT', '2018-07-17 16:56:31', '2018-07-17 16:56:56', '2018-07-17 16:56:56'),
(100, 10, '::1', 'iC4rZpsprWppHsXOf4JvNvrvKnET2V', '2018-07-17 16:57:14', '2018-07-17 16:57:22', '2018-07-17 16:57:22'),
(101, 1, '::1', 'MtPZ9MwOh5Ua67MsFpcPF61uA0RL0q', '2018-07-17 17:07:45', '2018-07-17 17:15:49', '2018-07-17 17:15:49'),
(102, 10, '::1', '9uZXD5cfmzs2ReBApVGk2zcQcwL0qs', '2018-07-17 17:09:42', '2018-07-17 17:15:32', '2018-07-17 17:15:32'),
(103, 10, '::1', 'PNOByk0xqSittvt9MtW3FfzWzS1lh3', '2018-07-17 17:15:55', '2018-07-17 17:23:43', '2018-07-17 17:23:43'),
(104, 1, '::1', 'vciiVLthUKStJ3UjVKbI37bk3F9Eh0', '2018-07-17 17:18:18', '2018-07-17 17:23:36', '2018-07-17 17:23:36'),
(105, 1, '::1', 'mFtGiJ7tjn9CADJ1q7oyF4dFgVdtH1', '2018-07-17 17:23:46', '2018-07-17 17:40:16', '2018-07-17 17:40:16'),
(106, 10, '::1', 'QAi7Pe3LEeFDr4zsDHsCe2a1zy8tb9', '2018-07-17 17:39:42', '2018-07-17 17:40:01', '2018-07-17 17:40:01'),
(107, 10, '::1', 'StngcxZEpmQSrqdKuQqgXeCNVoLEEu', '2018-07-17 17:40:22', '2018-07-17 17:40:50', '2018-07-17 17:40:50'),
(108, 1, '::1', 'X2NTiwA2Y5a5WgpsgXS8og5vpgDVa7', '2018-07-17 17:40:52', '2018-07-17 17:41:27', '2018-07-17 17:41:27'),
(109, 10, '::1', 'ICRb8r6HIID4twtqfnvhB6Hn0Nrn0o', '2018-07-17 17:41:37', '2018-07-17 17:43:26', '2018-07-17 17:43:26'),
(110, 1, '::1', 'HjRIsdSgOZBoy7SLomlCSj9qBQHYDB', '2018-07-17 17:42:06', '2018-07-17 17:43:17', '2018-07-17 17:43:17'),
(111, 1, '::1', 'UW2bNQK4NbajJ4KFouqicoDxTwaSkO', '2018-07-17 17:43:27', '2018-07-17 17:44:30', '2018-07-17 17:44:30'),
(112, 10, '::1', 'QbvPA0fp6M9UK1TafcXdTppTWngV2r', '2018-07-17 17:44:40', '2018-07-17 17:45:29', '2018-07-17 17:45:29'),
(113, 1, '::1', 'hDNFHdr0HgbiqEqJmu2unWz53sTUtu', '2018-07-17 17:45:31', '2018-07-17 17:47:13', '2018-07-17 17:47:13'),
(114, 10, '::1', 'jgAapISpxgXq6eeRrZfQI2YezfzmGZ', '2018-07-17 17:46:40', '2018-07-17 17:47:08', '2018-07-17 17:47:08'),
(115, 10, '::1', 'zBkoEhCQnrmA7sHnTWyBeIof5adm4r', '2018-07-17 17:47:30', '2018-07-23 22:42:17', '2018-07-23 22:42:17'),
(116, 1, '::1', 'ZwggCnL0hIJoi2TQBIbRxRMbTPXP5S', '2018-07-19 23:13:00', '2018-07-19 23:18:51', '2018-07-19 23:18:51'),
(117, 3, '::1', 'WgMFKiCmZoOxyhmoMEziCPLH8IF2qX', '2018-07-19 23:19:01', '2018-07-19 23:19:08', '2018-07-19 23:19:08'),
(118, 1, '::1', 'OunviEFOeaynkqlav5cy4uzuqhXnVH', '2018-07-19 23:19:09', '2018-07-20 14:26:44', '2018-07-20 14:26:44'),
(119, 1, '::1', 'bjkKDhC8Bdzz4b8LfX4rG0hvNDcjIT', '2018-07-20 14:26:44', '2018-07-20 17:36:17', '2018-07-20 17:36:17'),
(120, 1, '::1', '8TqwQ3yHjHroURFa8x9IH5n6VTep70', '2018-07-20 17:36:17', '2018-07-23 16:36:27', '2018-07-23 16:36:27'),
(121, 1, '::1', 'VXzWCz1vzyLdtka0AkD1SyZKNbxgo9', '2018-07-23 16:36:27', '2018-07-23 16:45:01', '2018-07-23 16:45:01'),
(122, 1, '::1', 'rN1gnQgcYcew67a6HnR5O9Sf836tLp', '2018-07-23 16:45:03', '2018-07-23 18:41:29', '2018-07-23 18:41:29'),
(123, 1, '::1', '2MDVBAcTsNamP6G9pYahGZixF8Rklc', '2018-07-23 18:41:30', '2018-07-23 22:41:48', '2018-07-23 22:41:48'),
(124, 9, '::1', 'r21ZuyWBboibdCkzR3MjqRXAo2b7Wm', '2018-07-23 22:41:37', '2018-07-23 22:41:47', '2018-07-23 22:41:47'),
(125, 1, '::1', 'Y0hkRkjMgLLPKq3RHWNrSdiOYU8vf5', '2018-07-23 22:41:48', '2018-07-23 22:42:11', '2018-07-23 22:42:11'),
(126, 10, '::1', 'Fo776liy8fubPOEqqbvLqIiPYc8iHE', '2018-07-23 22:42:17', '2018-07-23 22:45:34', '2018-07-23 22:45:34'),
(127, 1, '::1', 'ntxBbw7nyjrsHA087UkPb55PAehB9h', '2018-07-23 22:43:00', '2018-07-23 22:45:21', '2018-07-23 22:45:21'),
(128, 1, '::1', '6Ua5ck19FylbHVWAPiONKJqbShqL6Y', '2018-07-23 22:45:35', '2018-07-23 22:46:03', '2018-07-23 22:46:03'),
(129, 10, '::1', 'PHHnRC4XO3azDEpsCGmhV5RQYB8QJT', '2018-07-23 22:46:22', '2018-07-23 23:04:33', '2018-07-23 23:04:33'),
(130, 1, '::1', 'LrJ6QsG0U61JWdJWYQJFwbndL1RJCn', '2018-07-23 22:46:40', '2018-07-24 01:00:10', '2018-07-24 01:00:10'),
(131, 10, '::1', '8La6hNAOoE7GAWoXUQPcSdHOL2B3P0', '2018-07-24 00:42:19', '2018-07-24 01:00:05', '2018-07-24 01:00:05'),
(132, 1, '::1', '07BBSAtYNh3zfS9MwEhSq7w9IjTGkt', '2018-07-24 01:00:10', '2018-07-24 01:01:59', '2018-07-24 01:01:59'),
(133, 1, '::1', 'EAIt8Posi94IbrsS7b3m7UbIyBnjYe', '2018-07-24 01:02:00', '2018-07-24 16:41:07', '2018-07-24 16:41:07'),
(134, 1, '::1', 'mxOdyl7S7YkBlOH8jUALGXe1rbYmnh', '2018-07-24 16:41:07', '2018-07-24 22:29:53', '2018-07-24 22:29:53'),
(135, 1, '::1', 'X5iQADBXg3WwvMMP6iy5T5HGd9Yw7A', '2018-07-24 22:29:53', '2018-07-24 22:31:27', '2018-07-24 22:31:27'),
(136, 6, '::1', 'pFARz8oCJVfj8WmhHgTpy57KYxYMNQ', '2018-07-24 22:31:47', '2018-07-24 22:50:57', '2018-07-24 22:50:57'),
(137, 1, '::1', 'piCefuYdvh0s4zCqNgr6cUb5Ouu4xs', '2018-07-24 22:50:59', '2018-07-24 22:51:15', '2018-07-24 22:51:15'),
(138, 11, '::1', 'EOhlyHe8MdQbw1XFqbEbxUEvGNh9XM', '2018-07-24 22:51:12', '2018-07-24 22:51:43', '2018-07-24 22:51:43'),
(139, 6, '::1', '68JLoACYXGlIMBrDtc2pmM5AWodGqf', '2018-07-24 22:51:25', '2018-07-24 22:51:49', '2018-07-24 22:51:49'),
(140, 1, '::1', 'YsS7K6dQq76UcAuGdIPGitQUBEvBFs', '2018-07-24 22:51:50', '2018-07-24 22:52:08', '2018-07-24 22:52:08'),
(141, 8, '::1', 'dpT7KgW4Qtyxh4b5Ylq1OdHM9TU4ET', '2018-07-24 22:52:04', '2018-07-24 23:22:10', '2018-07-24 23:22:10'),
(142, 6, '::1', 'crnTZorqBQSow2jicipYZXXR80jTX8', '2018-07-24 22:52:16', '2018-07-24 23:21:04', '2018-07-24 23:21:04'),
(143, 1, '::1', 't3JtF1a6Zjm42JHwhcwggxUmOnvDFe', '2018-07-24 23:21:56', '2018-07-24 23:22:04', '2018-07-24 23:22:04'),
(144, 1, '::1', 'wJy2FxRlT4buaB3AkFnYobUT4ks5iX', '2018-07-25 14:15:04', '2018-07-25 17:22:26', '2018-07-25 17:22:26'),
(145, 1, '::1', 'bmHSN0KhmeSPSWmn4gwxisVhuyIQfR', '2018-07-25 17:22:26', '2018-07-25 17:22:36', '2018-07-25 17:22:36'),
(146, 6, '::1', 'yxSvHZ8kDAKu2PJ1uVDZCwy5f9Z6wp', '2018-07-25 17:22:46', '2018-07-25 17:26:07', '2018-07-25 17:26:07'),
(147, 1, '::1', 'Jhjgll8liTHu7rsfNE4RbaqJkTlrry', '2018-07-25 17:26:24', '2018-07-25 17:26:37', '2018-07-25 17:26:37'),
(148, 8, '::1', 'fA0XrCY4FQXE3e44TBMUxULTPJgsVh', '2018-07-25 17:26:48', '2018-07-26 18:48:48', '2018-07-26 18:48:48'),
(149, 8, '::1', 'W2qfzIw00VNFNURIcJC3KOCRT86mtt', '2018-07-26 18:48:48', '2018-07-26 18:53:48', '2018-07-26 18:53:48'),
(150, 1, '::1', 'xARTOp3XtwS0zN6xHCGmisx5vRNxsQ', '2018-07-26 18:53:50', '2018-07-26 18:56:10', '2018-07-26 18:56:10'),
(151, 8, '::1', 'w6mpZl1lb2xiVtB8AuUojYtX0qa6eE', '2018-07-26 18:56:18', '2018-07-26 18:56:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
CREATE TABLE IF NOT EXISTS `trips` (
  `id` int(10) unsigned NOT NULL,
  `truck_id` int(10) unsigned NOT NULL,
  `arrive_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trip_pallets`
--

DROP TABLE IF EXISTS `trip_pallets`;
CREATE TABLE IF NOT EXISTS `trip_pallets` (
  `id` int(10) unsigned NOT NULL,
  `trip_id` int(10) unsigned NOT NULL,
  `pallet_id` int(10) unsigned DEFAULT NULL,
  `box_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trucks`
--

DROP TABLE IF EXISTS `trucks`;
CREATE TABLE IF NOT EXISTS `trucks` (
  `id` int(10) unsigned NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub-brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plates` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truck_series` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `boss_id` int(10) unsigned DEFAULT NULL,
  `rol_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `boss_id`, `rol_id`, `name`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Jaime Ulises Cruz Mac??as', 'jaimeucm@gmail.com', '$2y$10$vhFL1lqwGHuMtZkKsx.5Zug9Rharqb8gZZT7phEV0rQiYwEQ9irYi', 1, 'nX4EPOX2iLL33zYjVrSBShICeQANaGRGqRFQYBvrh2d80YXZuRCyA5qUWcgw', NULL, NULL),
(2, 1, 4, 'Enrique L??pez Aldamas', 'enriqueprogra@gmail.com', '$2y$10$eQhJuFiAFdwrYv4KcRmdmeDniny93JNlFGI4hAvw99c.zKyzdFKGm', 1, 'tQOBEWsG85a93E37EwwMmovE4OzUUfwoL9OnM2lGaglG7XgMYyXcT8enPkW2', NULL, '2018-06-13 18:48:09'),
(3, 4, 5, 'Operador de almac??n', 'op.almacen@marcopolo.mx', '$2y$10$iIC047GqTP5lAITmjrwBWO2OvQQdrbIy283MJB3PxHyF7OvsEPZ36', 1, '9EanEKetP2GcSIvn3JOysQVRVoE2xr4Hhiiug33CD83zYYVnm8saPFmNVB9I', '2018-07-04 01:21:45', '2018-07-04 01:25:21'),
(4, NULL, 4, 'Encargado de almac??n', 'en.almacen@marcopolo.mx', '$2y$10$t5FP8pud76vjAX0I1MOv4.8Gjy30dj0QIT6GnT8Liv9ZBo3CRUaDy', 1, 'ozaVyItjhpN19CuShBzNdSuaaFkqI4itcaYthIsvxJVvFf7FuLibO7KvaKbZ', '2018-07-04 01:22:21', '2018-07-04 01:22:21'),
(5, 4, 5, 'Operador 2 de almac??n', 'op.almacen2@marcopolo.mx', '$2y$10$PkG9/SgX3vGtQL5PnUSo4OhT278PYPUO9xjRCJ2YPbTfFz0yW/qPq', 1, NULL, '2018-07-04 01:22:58', '2018-07-04 01:25:12'),
(6, NULL, 8, 'Encargado de Preparaci??n de Pedido', 'en.preparacion@marcopolo.mx', '$2y$10$6c52sP5Ac0gPB8Fzxkm6ZOVwvepwJTphJTj0KetNXFle3jTKW/iA6', 1, 'kqlf9XWukcw1NggQwJex6GJrGbHYBkooJOWsXW2nPsmQ6E5wL7LGnnyfFibu', '2018-07-05 00:05:46', '2018-07-05 00:05:46'),
(7, 6, 7, 'Ayudante General 1', 'ayudante1@marcopolo.mx', '$2y$10$NoYQ.rmN/yn2iHv5BigykucR1SSWY0JBemlEUgnQhWed6CtUCa04K', 1, '6Kfu8ENPpRgUl3xGXtbk13vEkSqvOxcgPUQYI2EWkbWo6PHTGBrSuAfQcrpY', '2018-07-05 00:06:25', '2018-07-05 00:06:39'),
(8, 6, 7, 'Ayudante General 2', 'ayudante2@marcopolo.mx', '$2y$10$RVAhgwsSQYoZmqAcCl.NKOiwzqPCaxskGk1NuYQIArgSub1UIkPnq', 1, 'jugDaOZRzNhu3TeGk6qQYCmBFDHFAARf6jhsuzYy2OEOHtpvlKq19Xtrg6v2', '2018-07-05 00:07:10', '2018-07-05 00:07:21'),
(9, NULL, 4, 'Recepci??n de Mercanc??a', 'recepcion@marcopolo.mx', '$2y$10$Vdkj7rbbrUqwXULQqPG8iemvQq.LtUrEgM2PzqHrytBXKKV7DOSMW', 1, '2PFU7boGiCQaYe8NH1tThm4y3HHsOZRQhMoO2Ja579rI1P8F1PBioJj2dbEo', '2018-07-17 16:51:17', '2018-07-17 16:51:17'),
(10, 9, 10, 'Ayudante en Recepci??n', 'ayudante.recepcion.1@marcopolo.mx', '$2y$10$mSVyKp1HUX0EpCBkvAF3keA3bFSqkdZqZqn4BKJ23kH2BmY6fomoq', 1, 'bqdIBRpqMrAf3KgbZE0IKhAKxakdbxjhzRYGFzeiSmzi2tE6YJ5zrYnser0Y', '2018-07-17 16:55:15', '2018-07-17 16:56:01'),
(11, 9, 10, 'Ayudante 2 en Recepci??n', 'ayudante.recepcion.2@marcopolo.mx', '$2y$10$Vrz.lmSFkqUtY43h1eZnZuFdYqPKDFdwi25P/hItFPQjVDLPkXhvS', 1, 'aOy2RAWvegYPQaNhDJXBXVwEWxPEVj9xIKZGvhSl7PxOCw4e2fB6Pnbn7MWc', '2018-07-17 16:55:43', '2018-07-17 16:55:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arrival_items`
--
ALTER TABLE `arrival_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `arrival_items_purchase_id_foreign` (`purchase_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_order_id_foreign` (`order_id`),
  ADD KEY `assignments_user_id_foreign` (`user_id`),
  ADD KEY `assignments_order_detail_id_foreign` (`order_detail_id`),
  ADD KEY `assignments_order_design_id_foreign` (`order_design_id`);

--
-- Indexes for table `boxes`
--
ALTER TABLE `boxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `box_ids`
--
ALTER TABLE `box_ids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `box_ids_box_type_id_foreign` (`box_type_id`);

--
-- Indexes for table `calculations`
--
ALTER TABLE `calculations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calculations_order_id_foreign` (`order_id`),
  ADD KEY `calculations_dist_id_foreign` (`dist_id`);

--
-- Indexes for table `catalogs`
--
ALTER TABLE `catalogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalogs_group_id_foreign` (`group_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_code_unique` (`code`),
  ADD KEY `clients_te_foreign` (`TE`);

--
-- Indexes for table `dist`
--
ALTER TABLE `dist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distribution`
--
ALTER TABLE `distribution`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distribution_order_id_foreign` (`order_id`),
  ADD KEY `distribution_sku_foreign` (`sku`),
  ADD KEY `distribution_order_detail_id_foreign` (`order_detail_id`);

--
-- Indexes for table `history_supply`
--
ALTER TABLE `history_supply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_supply_user_id_foreign` (`user_id`),
  ADD KEY `history_supply_order_id_foreign` (`order_id`),
  ADD KEY `history_supply_detail_id_foreign` (`detail_id`),
  ADD KEY `history_supply_product_id_foreign` (`product_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_parent_foreign` (`parent`),
  ADD KEY `menus_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_codeorder_unique` (`codeOrder`),
  ADD KEY `orders_code_foreign` (`code`),
  ADD KEY `orders_dist_id_foreign` (`dist_id`);

--
-- Indexes for table `order_designs`
--
ALTER TABLE `order_designs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_dsesigns_box_id_foreign` (`box_id`),
  ADD KEY `order_dsesigns_order_id_foreign` (`order_id`),
  ADD KEY `order_dsesigns_order_detail_id_foreign` (`order_detail_id`),
  ADD KEY `order_designs_box_type_id_foreign` (`box_type_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_idorder_foreign` (`idOrder`);

--
-- Indexes for table `order_pendings`
--
ALTER TABLE `order_pendings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_pendings_order_id_foreign` (`order_id`),
  ADD KEY `order_pendings_user_id_foreign` (`user_id`),
  ADD KEY `order_pendings_client_id_foreign` (`client_id`),
  ADD KEY `order_pendings_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `order_traces`
--
ALTER TABLE `order_traces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_traces_order_id_foreign` (`order_id`),
  ADD KEY `order_traces_user_id_foreign` (`user_id`);

--
-- Indexes for table `pallet`
--
ALTER TABLE `pallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pallet_code_unique` (`code`),
  ADD KEY `pallet_order_id_foreign` (`order_id`);

--
-- Indexes for table `pall_box`
--
ALTER TABLE `pall_box`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pall_box_box_id_foreign` (`box_id`),
  ADD KEY `pall_box_pallet_id_foreign` (`pallet_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_rol_id_foreign` (`rol_id`),
  ADD KEY `profiles_menu_item_id_foreign` (`menu_item_id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchases_docentry_unique` (`DocEntry`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD KEY `purchase_items_purchase_id_foreign` (`purchase_id`);

--
-- Indexes for table `rols`
--
ALTER TABLE `rols`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rols_rol_unique` (`rol`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rules_client_id_foreign` (`client_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_foreign` (`user_id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trips_truck_id_foreign` (`truck_id`);

--
-- Indexes for table `trip_pallets`
--
ALTER TABLE `trip_pallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip_pallets_trip_id_foreign` (`trip_id`),
  ADD KEY `trip_pallets_pallet_id_foreign` (`pallet_id`),
  ADD KEY `trip_pallets_box_id_foreign` (`box_id`);

--
-- Indexes for table `trucks`
--
ALTER TABLE `trucks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_boss_id_foreign` (`boss_id`),
  ADD KEY `users_rol_id_foreign` (`rol_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arrival_items`
--
ALTER TABLE `arrival_items`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `boxes`
--
ALTER TABLE `boxes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `box_ids`
--
ALTER TABLE `box_ids`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `calculations`
--
ALTER TABLE `calculations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `catalogs`
--
ALTER TABLE `catalogs`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=676;
--
-- AUTO_INCREMENT for table `dist`
--
ALTER TABLE `dist`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `distribution`
--
ALTER TABLE `distribution`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `history_supply`
--
ALTER TABLE `history_supply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=202;
--
-- AUTO_INCREMENT for table `order_designs`
--
ALTER TABLE `order_designs`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=300;
--
-- AUTO_INCREMENT for table `order_pendings`
--
ALTER TABLE `order_pendings`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=147;
--
-- AUTO_INCREMENT for table `order_traces`
--
ALTER TABLE `order_traces`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pallet`
--
ALTER TABLE `pallet`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pall_box`
--
ALTER TABLE `pall_box`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4034;
--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=265;
--
-- AUTO_INCREMENT for table `rols`
--
ALTER TABLE `rols`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=152;
--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trip_pallets`
--
ALTER TABLE `trip_pallets`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `arrival_items`
--
ALTER TABLE `arrival_items`
  ADD CONSTRAINT `arrival_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`);

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_order_design_id_foreign` FOREIGN KEY (`order_design_id`) REFERENCES `order_designs` (`id`),
  ADD CONSTRAINT `assignments_order_detail_id_foreign` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`id`),
  ADD CONSTRAINT `assignments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `assignments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `box_ids`
--
ALTER TABLE `box_ids`
  ADD CONSTRAINT `box_ids_box_type_id_foreign` FOREIGN KEY (`box_type_id`) REFERENCES `boxes` (`id`);

--
-- Constraints for table `calculations`
--
ALTER TABLE `calculations`
  ADD CONSTRAINT `calculations_dist_id_foreign` FOREIGN KEY (`dist_id`) REFERENCES `catalogs` (`id`),
  ADD CONSTRAINT `calculations_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `catalogs`
--
ALTER TABLE `catalogs`
  ADD CONSTRAINT `catalogs_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `catalogs` (`id`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_te_foreign` FOREIGN KEY (`TE`) REFERENCES `catalogs` (`id`);

--
-- Constraints for table `distribution`
--
ALTER TABLE `distribution`
  ADD CONSTRAINT `distribution_order_detail_id_foreign` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`id`),
  ADD CONSTRAINT `distribution_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `distribution_sku_foreign` FOREIGN KEY (`sku`) REFERENCES `products` (`sku`);

--
-- Constraints for table `history_supply`
--
ALTER TABLE `history_supply`
  ADD CONSTRAINT `history_supply_detail_id_foreign` FOREIGN KEY (`detail_id`) REFERENCES `order_details` (`id`),
  ADD CONSTRAINT `history_supply_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `history_supply_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `history_supply_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `menus_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_code_foreign` FOREIGN KEY (`code`) REFERENCES `clients` (`code`),
  ADD CONSTRAINT `orders_dist_id_foreign` FOREIGN KEY (`dist_id`) REFERENCES `catalogs` (`id`);

--
-- Constraints for table `order_designs`
--
ALTER TABLE `order_designs`
  ADD CONSTRAINT `order_designs_box_type_id_foreign` FOREIGN KEY (`box_type_id`) REFERENCES `boxes` (`id`),
  ADD CONSTRAINT `order_dsesigns_box_id_foreign` FOREIGN KEY (`box_id`) REFERENCES `box_ids` (`id`),
  ADD CONSTRAINT `order_dsesigns_order_detail_id_foreign` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`id`),
  ADD CONSTRAINT `order_dsesigns_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_idorder_foreign` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`);

--
-- Constraints for table `order_pendings`
--
ALTER TABLE `order_pendings`
  ADD CONSTRAINT `order_pendings_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `catalogs` (`id`),
  ADD CONSTRAINT `order_pendings_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `order_pendings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_pendings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_traces`
--
ALTER TABLE `order_traces`
  ADD CONSTRAINT `order_traces_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_traces_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pallet`
--
ALTER TABLE `pallet`
  ADD CONSTRAINT `pallet_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `pall_box`
--
ALTER TABLE `pall_box`
  ADD CONSTRAINT `pall_box_box_id_foreign` FOREIGN KEY (`box_id`) REFERENCES `box_ids` (`id`),
  ADD CONSTRAINT `pall_box_pallet_id_foreign` FOREIGN KEY (`pallet_id`) REFERENCES `pallet` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `profiles_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `rols` (`id`),
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`);

--
-- Constraints for table `rules`
--
ALTER TABLE `rules`
  ADD CONSTRAINT `rules_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_truck_id_foreign` FOREIGN KEY (`truck_id`) REFERENCES `trucks` (`id`);

--
-- Constraints for table `trip_pallets`
--
ALTER TABLE `trip_pallets`
  ADD CONSTRAINT `trip_pallets_box_id_foreign` FOREIGN KEY (`box_id`) REFERENCES `box_ids` (`id`),
  ADD CONSTRAINT `trip_pallets_pallet_id_foreign` FOREIGN KEY (`pallet_id`) REFERENCES `pallet` (`id`),
  ADD CONSTRAINT `trip_pallets_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_boss_id_foreign` FOREIGN KEY (`boss_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `rols` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
