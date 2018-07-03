-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2018 at 08:17 PM
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
-- Table structure for table `calculations`
--

CREATE TABLE IF NOT EXISTS `calculations` (
  `id` int(10) unsigned NOT NULL,
  `P` int(11) NOT NULL,
  `V` int(11) NOT NULL,
  `D` int(11) NOT NULL,
  `FP` date NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `dist_id` int(10) unsigned NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calculations`
--

INSERT INTO `calculations` (`id`, `P`, `V`, `D`, `FP`, `order_id`, `dist_id`, `priority`, `created_at`, `updated_at`) VALUES
(30, 100, 37, 0, '2018-06-14', 37, 12, 78, '2018-06-11 07:29:48', '2018-06-11 07:29:48'),
(31, 100, 37, 0, '2018-06-14', 38, 12, 78, '2018-06-11 07:31:12', '2018-06-11 07:31:12'),
(32, 100, 37, 0, '2018-06-16', 39, 12, 78, '2018-06-11 07:31:13', '2018-06-11 07:31:13'),
(33, 100, 37, 0, '2018-06-14', 40, 12, 78, '2018-06-11 07:31:13', '2018-06-11 07:31:13'),
(34, 100, 37, 0, '2018-06-14', 41, 12, 78, '2018-06-11 07:31:13', '2018-06-11 07:31:13'),
(35, 100, 37, 0, '2018-06-16', 42, 12, 78, '2018-06-11 07:31:14', '2018-06-11 07:31:14'),
(36, 100, 37, 0, '2018-06-14', 43, 12, 78, '2018-06-11 07:31:14', '2018-06-11 07:31:14'),
(37, 100, 37, 0, '2018-06-14', 44, 12, 78, '2018-06-11 07:31:14', '2018-06-11 07:31:14'),
(38, 100, 37, 0, '2018-06-14', 45, 12, 78, '2018-06-11 07:31:15', '2018-06-11 07:31:15'),
(39, 100, 37, 0, '2018-06-14', 46, 12, 78, '2018-06-11 07:31:15', '2018-06-11 07:31:15'),
(40, 100, 37, 0, '2018-06-14', 47, 12, 78, '2018-06-11 07:31:15', '2018-06-11 07:31:15'),
(41, 100, 37, 0, '2018-06-14', 48, 12, 78, '2018-06-11 07:31:16', '2018-06-11 07:31:16'),
(42, 100, 37, 0, '2018-06-14', 49, 12, 78, '2018-06-11 07:31:16', '2018-06-11 07:31:16'),
(43, 100, 37, 0, '2018-06-14', 50, 12, 78, '2018-06-11 07:31:16', '2018-06-11 07:31:16'),
(44, 100, 37, 0, '2018-06-14', 51, 12, 78, '2018-06-11 07:31:17', '2018-06-11 07:31:17'),
(45, 100, 37, 0, '2018-06-14', 52, 12, 78, '2018-06-11 07:31:17', '2018-06-11 07:31:17'),
(46, 100, 37, 0, '2018-06-14', 53, 12, 78, '2018-06-11 07:31:17', '2018-06-11 07:31:17'),
(47, 100, 37, 0, '2018-06-14', 54, 12, 78, '2018-06-11 07:31:18', '2018-06-11 07:31:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calculations`
--
ALTER TABLE `calculations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calculations_order_id_foreign` (`order_id`),
  ADD KEY `calculations_dist_id_foreign` (`dist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calculations`
--
ALTER TABLE `calculations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `calculations`
--
ALTER TABLE `calculations`
  ADD CONSTRAINT `calculations_dist_id_foreign` FOREIGN KEY (`dist_id`) REFERENCES `catalogs` (`id`),
  ADD CONSTRAINT `calculations_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
