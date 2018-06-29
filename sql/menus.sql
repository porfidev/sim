-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2018 at 11:24 PM
-- Server version: 5.6.37
-- PHP Version: 7.1.8
SET AUTOCOMMIT = 0;
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

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent`, `sequence`, `label`, `url`, `visible`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 9, 1, 'Usuarios', 'usuarios/listado', 1, 1, '2018-06-13 14:43:33', '2018-06-13 18:21:13'),
(2, 9, 2, 'Menus', 'menu/listado', 1, 1, '2018-06-13 14:44:36', '2018-06-13 18:21:29'),
(3, 9, 3, 'Catalogos', 'catalogos/listado', 1, 1, '2018-06-13 14:45:10', '2018-06-13 18:21:22'),
(4, 9, 0, 'Clientes', 'clientes/listado', 1, 1, '2018-06-13 14:45:32', '2018-06-13 18:21:45'),
(5, 11, 0, 'Listado de Pedidos', 'listadoPedidosJefe', 1, 2, '2018-06-13 14:46:24', '2018-06-13 18:47:17'),
(7, 9, 0, 'Productos', 'productos/listado', 1, 1, '2018-06-13 14:47:40', '2018-06-13 18:22:44'),
(8, NULL, 8, 'Ordenes', 'ordenes/listado', 1, 1, '2018-06-13 18:14:06', '2018-06-13 18:15:48'),
(9, NULL, 99, 'Administración', '#', 1, 1, '2018-06-13 18:15:56', '2018-06-13 18:15:56'),
(11, NULL, 0, 'Surtido de Pedido', '#', 1, 2, '2018-06-13 18:46:28', '2018-06-13 18:46:28'),
(12, NULL, 0, 'Mis Tareas', 'listadoTareas', 1, 1, '2018-06-13 18:51:12', '2018-06-22 19:33:34'),
(13, NULL, 999, 'Permisos no visibles', '#', 0, 1, '2018-06-22 17:37:52', '2018-06-22 18:59:25'),
(14, 13, 0, 'Listado de trabajadores asignados a una tarea', 'usuarios/listaAsig', 1, 1, '2018-06-22 18:58:18', '2018-06-22 19:13:40'),
(15, 13, 0, 'Inicio', 'home', 1, 1, '2018-06-22 19:01:13', '2018-06-22 19:01:13'),
(16, 13, 0, 'Nombres de trabajadores asignados', 'usuarios/obtenerNombresJefe', 1, 1, '2018-06-22 19:13:24', '2018-06-22 19:13:24'),
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
(36, 13, 0, 'Agregar un elemento de un catálogo', 'catalogos/agregar', 1, 1, '2018-06-22 23:05:17', '2018-06-22 23:05:17'),
(37, 13, 0, 'Editar un elemento de un catálogo', 'catalogos/editar', 1, 1, '2018-06-22 23:05:39', '2018-06-22 23:05:52'),
(38, 13, 0, 'Eliminar un elemento de un catálogo', 'catalogos/eliminar', 1, 1, '2018-06-22 23:06:25', '2018-06-22 23:06:25'),
(39, 13, 0, 'Consulta de un elemento de un catálogo', 'catalogos/obtener', 1, 1, '2018-06-22 23:06:57', '2018-06-22 23:06:57'),
(40, 13, 0, 'Agregar Cliente', 'clientes/agregar', 1, 1, '2018-06-22 23:14:24', '2018-06-22 23:14:24'),
(41, 13, 0, 'Editar Cliente', 'clientes/editar', 1, 1, '2018-06-22 23:14:44', '2018-06-22 23:14:55'),
(42, 13, 0, 'Eliminar Cliente', 'clientes/eliminar', 1, 1, '2018-06-22 23:15:22', '2018-06-22 23:15:22'),
(43, 13, 0, 'CSV de clientes', 'clientes/CSVCli', 1, 1, '2018-06-22 23:15:44', '2018-06-22 23:15:44'),
(44, 13, 0, 'Listado de tareas del jefe', 'listadoTareasJ/', 1, 1, '2018-06-22 23:17:41', '2018-06-22 23:17:41'),
(45, 13, 0, 'Registro de productos en surtido de pedidos Trabajador', 'addDet', 1, 1, '2018-06-22 23:18:21', '2018-06-22 23:18:21'),
(46, 13, 0, 'Validación de productos para surtido', 'addDetJ', 1, 1, '2018-06-22 23:19:02', '2018-06-22 23:19:02'),
(47, 13, 0, 'Cierre de surtido para trabajador', 'cierraPed', 1, 1, '2018-06-22 23:19:29', '2018-06-22 23:19:29'),
(48, 13, 0, 'Terminar validación de surtido', 'cierraPedJ', 1, 1, '2018-06-22 23:19:53', '2018-06-22 23:19:53'),
(49, 13, 0, 'Listado de items en Ordenes de compra', 'ordenes/listadoItems/', 1, 1, '2018-06-22 23:20:31', '2018-06-22 23:20:31');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `menus_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;
SET AUTOCOMMIT = 1;