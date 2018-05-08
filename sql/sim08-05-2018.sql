-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2018 at 05:49 PM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sim`
--
CREATE DATABASE IF NOT EXISTS `sim` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sim`;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `label` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `menus`
--

TRUNCATE TABLE `menus`;
--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent`, `label`, `url`, `user_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Usuarios', '/usuarios/listado', NULL, '2018-05-07 23:32:43', '2018-05-08 00:19:10'),
(2, NULL, 'Administración', '#', NULL, '2018-05-07 23:34:18', '2018-05-07 23:34:18'),
(3, 2, 'Menu', '/menu/listado', NULL, '2018-05-07 23:34:37', '2018-05-07 23:34:37');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `migrations`
--

TRUNCATE TABLE `migrations`;
--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_03_192113_add_status_to_users', 2),
(4, '2018_05_07_095222_create_rols_table', 3),
(5, '2018_05_07_095305_create_menus_table', 3),
(6, '2018_05_07_101149_create_profiles_table', 4),
(7, '2018_05_07_105313_add_description_to_roles', 5),
(8, '2018_05_07_122651_add_rol_to_users', 6);

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

--
-- Truncate table before insert `password_resets`
--

TRUNCATE TABLE `password_resets`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `profiles`
--

TRUNCATE TABLE `profiles`;
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
-- Truncate table before insert `rols`
--

TRUNCATE TABLE `rols`;
--
-- Dumping data for table `rols`
--

INSERT INTO `rols` (`id`, `rol`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', 'Administrador del sistema', NULL, NULL),
(2, 'DIRECCION', 'Dirección General', NULL, NULL),
(3, 'JEFE_ALMACEN', 'Jefe de Almacén', NULL, NULL),
(4, 'RECIBO_Y_ALMACEN', 'Responsable de recibo y Almacen', NULL, NULL),
(5, 'SURTIDO_A', 'Encargado de Surtido a Almacén', NULL, NULL),
(6, 'PASILLO', 'Encargado de pasillo', NULL, NULL),
(7, 'A_GENERAL', 'Ayudante General', NULL, NULL),
(8, 'EMBALAJE', 'Responsable de Embalaje', NULL, NULL),
(9, 'SURTIDO_PP', 'Responsable de surtido', NULL, NULL),
(10, 'PP_GENERAL', 'Ayudante General', NULL, NULL),
(11, 'DEVOLUCIONES', 'Responsable de devoluciones', NULL, NULL),
(12, 'COORDINADOR', 'Coordinador de distribución', NULL, NULL),
(13, 'CAPTURISTA', 'Capturista', NULL, NULL),
(14, 'AUXILIAR', 'Auxiliar administrativo', NULL, NULL),
(15, 'EMBARQUE', 'Responsable de embarque', NULL, NULL),
(16, 'A_EMBARQUE', 'Ayudante de embarque', NULL, NULL),
(17, 'CHOFER', 'Chofer', NULL, NULL),
(18, 'A_DISTRIBUCION', 'Ayudante de distribución', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `users`
--

TRUNCATE TABLE `users`;
--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `boss_id`, `rol_id`, `name`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Jaime Ulises Cruz Macías', 'jaimeucm@gmail.com', '$2y$10$tO8/xpGTTkLUlQE00BirFOaE5pUlinahqiJGtRCCLKzcrUAybUP7C', 1, 'hylMWyUVnkRg2un3zZOIFEt1KzIxvMWqFo1vXsc1OSck1qikqbHFAMTXcfHd', NULL, NULL),
(2, NULL, 1, 'Enrique López Aldama', 'enriqueprogra@gmail.com', '$2y$10$Kj90FsM1c6yNobuQ3Rxna.UbPfqdu.p2ZhMpCL9FJk5hq5C.h3la.', 1, NULL, NULL, NULL),
(3, NULL, 3, 'Rebeca Paredes Villegas', 'rebeca@marcopolo.com', '$2y$10$ppFFPfz/kP.HdBspvsLZPuY.xwzhqtQUH617cAgAu0r68umdz9MbG', 1, NULL, '2018-05-07 22:26:04', '2018-05-07 22:30:02');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_rol_id_foreign` (`rol_id`),
  ADD KEY `profiles_menu_item_id_foreign` (`menu_item_id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `rols`
--
ALTER TABLE `rols`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rols_rol_unique` (`rol`);

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
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rols`
--
ALTER TABLE `rols`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `menus_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `profiles_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `rols` (`id`),
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_boss_id_foreign` FOREIGN KEY (`boss_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `rols` (`id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
