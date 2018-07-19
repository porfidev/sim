-- MySQL dump 10.13  Distrib 5.6.40, for Win64 (x86_64)
--
-- Host: localhost    Database: sim
-- ------------------------------------------------------
-- Server version	5.6.40-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DocEntry` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DocNum` int(11) NOT NULL,
  `CardCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CardName` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DocDueDate` timestamp NULL DEFAULT NULL,
  `arrival` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchases_docentry_unique` (`DocEntry`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (42,'1',1,'PRV0002-0003','THE TOPPS COMPANY, INC','2011-07-29 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(43,'2',2,'PRV0002-0003','THE TOPPS COMPANY, INC','2011-06-25 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(44,'3',3,'PRV0002-0001','TROLLI IBERICA, S.A.','2011-06-29 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(45,'4',4,'PRV0002-0002','THE CANDY AND TOY FACTORY','2011-07-25 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(46,'5',5,'PRV0002-0003','THE TOPPS COMPANY, INC','2011-07-04 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(47,'6',6,'PRV0002-0001','TROLLI IBERICA, S.A.','2011-08-15 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(48,'7',7,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-06-27 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(49,'8',8,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-06-27 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(50,'9',9,'PRV0001-0009','CONAGRA FOODS MEXICO, S.A. DE C.V.','2011-06-27 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(51,'10',10,'PRV0001-0010','GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.','2011-06-25 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(52,'11',11,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-06-27 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(53,'12',12,'PRV0001-0001','EFFEM MEXICO INC Y COMPAÑIA , S.EN N.C. DE C.V.','2011-06-25 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(54,'13',13,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-06-27 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(55,'14',14,'PRV0001-0004','SANBORN HERMANOS, S.A. C.V.','2011-06-27 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(56,'15',15,'PRV0001-0009','CONAGRA FOODS MEXICO, S.A. DE C.V.','2011-06-27 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(57,'16',16,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-06-28 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(58,'17',17,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-06-28 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(59,'18',18,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-06-28 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(60,'19',19,'PRV0001-0018','COMPAGNIA DELL ESPRESSO, S DE R.L. C.V.','2011-06-27 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(61,'20',20,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-06-27 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(62,'21',21,'PRV0001-0012','PULPALETA DE MEXICO, S.A. DE C.V.','2011-06-30 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(63,'22',22,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-07-01 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(64,'23',23,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-07-01 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(65,'24',24,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-06-30 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(66,'25',25,'PRV0001-0001','EFFEM MEXICO INC Y COMPAÑIA , S.EN N.C. DE C.V.','2011-06-28 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(67,'26',26,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-06-30 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(68,'27',27,'PRV0001-0007','PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.','2011-07-01 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(69,'28',28,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-05 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(70,'29',29,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-12 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(71,'30',30,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-19 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(72,'31',31,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-26 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(73,'32',32,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-02 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(74,'33',33,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-06-29 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(75,'34',34,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-06-29 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(76,'35',35,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-06-29 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(77,'36',36,'PRV0001-0014','CUANDA, S.A. DE C.V.','2011-06-29 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(78,'37',37,'PRV0001-0014','CUANDA, S.A. DE C.V.','2011-06-29 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(79,'38',38,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-05 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(80,'39',39,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-07-01 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(81,'40',40,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-06-30 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(82,'41',41,'PRV0002-0001','TROLLI IBERICA, S.A.','2011-07-01 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(83,'42',42,'PRV0002-0001','TROLLI IBERICA, S.A.','2011-07-01 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(84,'43',43,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-01 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(85,'44',44,'PRV0001-0014','CUANDA, S.A. DE C.V.','2011-07-04 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(86,'45',45,'PRV0001-0012','PULPALETA DE MEXICO, S.A. DE C.V.','2011-07-06 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(87,'46',46,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-06 05:00:00',NULL,0,'2018-06-12 21:39:43','2018-06-12 21:39:43'),(88,'47',47,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-07-06 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(89,'48',48,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-07-08 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(90,'49',49,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-06 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(91,'50',50,'PRV0001-0001','EFFEM MEXICO INC Y COMPAÑIA , S.EN N.C. DE C.V.','2011-07-06 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(92,'51',51,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-07-06 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(93,'52',52,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-06 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(94,'53',53,'PRV0002-0001','TROLLI IBERICA, S.A.','2011-07-09 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(95,'54',54,'PRV0001-0014','CUANDA, S.A. DE C.V.','2011-07-06 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(96,'55',55,'PRV0001-0009','CONAGRA FOODS MEXICO, S.A. DE C.V.','2011-07-08 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(97,'56',56,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-07-08 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(98,'57',57,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-11 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(99,'58',58,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(100,'59',59,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(101,'60',60,'PRV0001-0001','EFFEM MEXICO INC Y COMPAÑIA , S.EN N.C. DE C.V.','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(102,'61',61,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(103,'62',62,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-07-08 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(104,'63',63,'PRV0001-0004','SANBORN HERMANOS, S.A. C.V.','2011-07-07 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(105,'64',64,'PRV0001-0010','GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.','2011-07-08 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(106,'65',65,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(107,'66',66,'PRV0001-0007','PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.','2011-07-05 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(108,'67',67,'PRV0002-0001','TROLLI IBERICA, S.A.','2011-09-26 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(109,'68',68,'PRV0002-0004','UNITRADE GLOBAL LTD','2011-07-11 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(110,'69',69,'PRV0001-0012','PULPALETA DE MEXICO, S.A. DE C.V.','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(111,'70',70,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-07-12 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(112,'71',71,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(113,'72',72,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-12 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(114,'73',73,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-12 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(115,'74',74,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(116,'75',75,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-12 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(117,'76',76,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-12 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(118,'77',77,'PRV0001-0007','PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.','2011-07-12 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(119,'78',78,'PRV0001-0010','GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.','2011-07-07 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(120,'80',80,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-12 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(121,'81',81,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-12 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(122,'82',82,'PRV0001-0012','PULPALETA DE MEXICO, S.A. DE C.V.','2011-07-15 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(123,'83',83,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(124,'84',84,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(125,'85',85,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(126,'86',86,'PRV0001-0010','GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(127,'87',87,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-07-08 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(128,'88',88,'PRV0001-0007','PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.','2011-07-12 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(129,'89',89,'PRV0001-0007','PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(130,'90',90,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-07-12 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(131,'91',91,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-07-13 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(132,'92',92,'PRV0001-0012','PULPALETA DE MEXICO, S.A. DE C.V.','2011-07-20 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(133,'93',93,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-19 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(134,'94',94,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-19 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(135,'95',95,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-19 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(136,'96',96,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-07-19 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(137,'97',97,'PRV0001-0001','EFFEM MEXICO INC Y COMPAÑIA , S.EN N.C. DE C.V.','2011-07-21 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(138,'98',98,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-07-18 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(139,'99',99,'PRV0002-0004','UNITRADE GLOBAL LTD','2011-07-14 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(140,'100',100,'PRV0001-0009','CONAGRA FOODS MEXICO, S.A. DE C.V.','2011-07-22 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(141,'101',101,'PRV0001-0018','COMPAGNIA DELL ESPRESSO, S DE R.L. C.V.','2011-07-19 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(142,'102',102,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-21 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(143,'103',103,'PRV0001-0014','CUANDA, S.A. DE C.V.','2011-07-19 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(144,'104',104,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-21 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(145,'105',105,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-07-20 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(146,'106',106,'PRV0001-0004','SANBORN HERMANOS, S.A. C.V.','2011-07-22 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(147,'107',107,'PRV0001-0003','IMPORTACIONES BAROUDI, S,A, DE  C.V.','2011-07-18 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(148,'108',108,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-21 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(149,'109',109,'PRV0002-0002','THE CANDY AND TOY FACTORY','2011-09-19 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(150,'110',110,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-21 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(151,'111',111,'PRV0001-0007','PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.','2011-07-19 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(152,'112',112,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-26 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(153,'113',113,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-26 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(154,'114',114,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-26 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(155,'115',115,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-26 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(156,'116',116,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-07-26 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(157,'117',117,'PRV0001-0001','EFFEM MEXICO INC Y COMPAÑIA , S.EN N.C. DE C.V.','2011-07-28 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(158,'118',118,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-07-26 05:00:00',NULL,0,'2018-06-12 21:39:44','2018-06-12 21:39:44'),(159,'119',119,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-07-26 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(160,'120',120,'PRV0001-0018','COMPAGNIA DELL ESPRESSO, S DE R.L. C.V.','2011-07-26 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(161,'121',121,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-07-29 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(162,'122',122,'PRV0001-0014','CUANDA, S.A. DE C.V.','2011-07-26 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(163,'123',123,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-28 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(164,'124',124,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-28 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(165,'125',125,'PRV0001-0010','GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.','2011-07-26 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(166,'126',126,'PRV0001-0007','PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.','2011-07-28 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(167,'127',127,'PRV0001-0004','SANBORN HERMANOS, S.A. C.V.','2011-07-27 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(168,'128',128,'PRV0001-0008','ORGANIZACION SAHUAYO, S.A. DE C.V.','2011-07-27 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(169,'129',129,'PRV0001-0001','EFFEM MEXICO INC Y COMPAÑIA , S.EN N.C. DE C.V.','2011-07-30 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(170,'130',130,'PRV0001-0012','PULPALETA DE MEXICO, S.A. DE C.V.','2011-08-01 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(171,'131',131,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-29 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(172,'132',132,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-07-29 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(173,'133',133,'PRV0001-0019','BARCEL, S.A. DE C.V.','2011-07-30 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(174,'134',134,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-07-27 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(175,'135',135,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-01 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(176,'136',136,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-01 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(177,'137',137,'PRV0001-0003','IMPORTACIONES BAROUDI, S,A, DE  C.V.','2011-08-02 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(178,'138',138,'PRV0001-0003','IMPORTACIONES BAROUDI, S,A, DE  C.V.','2011-08-08 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(179,'139',139,'PRV0001-0003','IMPORTACIONES BAROUDI, S,A, DE  C.V.','2011-09-05 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(180,'140',140,'PRV0001-0003','IMPORTACIONES BAROUDI, S,A, DE  C.V.','2011-10-03 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(181,'141',141,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-02 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(182,'142',142,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-02 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(183,'143',143,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-02 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(184,'144',144,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-02 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(185,'145',145,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-08-02 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(186,'146',146,'PRV0001-0012','PULPALETA DE MEXICO, S.A. DE C.V.','2011-08-08 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(187,'147',147,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-08-05 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(188,'148',148,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-08 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(189,'149',149,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-08 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(190,'150',150,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-08 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(191,'151',151,'PRV0001-0014','CUANDA, S.A. DE C.V.','2011-08-05 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(192,'152',152,'PRV0001-0001','EFFEM MEXICO INC Y COMPAÑIA , S.EN N.C. DE C.V.','2011-08-08 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(193,'153',153,'PRV0001-0004','SANBORN HERMANOS, S.A. C.V.','2011-08-05 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(194,'154',154,'PRV0001-0010','GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.','2011-08-08 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(195,'155',155,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-08-03 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(196,'156',156,'PRV0001-0018','COMPAGNIA DELL ESPRESSO, S DE R.L. C.V.','2011-08-04 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(197,'157',157,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-08-08 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(198,'158',158,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-09 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(199,'159',159,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-09 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(200,'160',160,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-09 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(201,'161',161,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-09 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(202,'162',162,'PRV0001-0009','CONAGRA FOODS MEXICO, S.A. DE C.V.','2011-08-05 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(203,'163',163,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-08-08 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(204,'164',164,'PRV0001-0001','EFFEM MEXICO INC Y COMPAÑIA , S.EN N.C. DE C.V.','2011-08-11 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(205,'165',165,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-08-08 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(206,'166',166,'PRV0001-0004','SANBORN HERMANOS, S.A. C.V.','2011-08-08 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(207,'167',167,'PRV0002-0001','TROLLI IBERICA, S.A.','2011-10-14 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(208,'168',168,'PRV0002-0003','THE TOPPS COMPANY, INC','2011-08-26 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(209,'169',169,'PRV0002-0003','THE TOPPS COMPANY, INC','2011-10-25 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(210,'170',170,'PRV0002-0003','THE TOPPS COMPANY, INC','2011-11-25 06:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(211,'171',171,'PRV0001-0008','ORGANIZACION SAHUAYO, S.A. DE C.V.','2011-08-10 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(212,'172',172,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-08-10 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(213,'173',173,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-08-15 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(214,'174',174,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-15 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(215,'175',175,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-08-17 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(216,'176',176,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-16 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(217,'177',177,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-16 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(218,'178',178,'PRV0001-0014','CUANDA, S.A. DE C.V.','2011-08-12 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(219,'179',179,'PRV0001-0001','EFFEM MEXICO INC Y COMPAÑIA , S.EN N.C. DE C.V.','2011-08-17 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(220,'180',180,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-15 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(221,'181',181,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-16 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(222,'182',182,'PRV0001-0010','GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.','2011-08-15 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(223,'183',183,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-16 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(224,'184',184,'PRV0002-0001','TROLLI IBERICA, S.A.','2011-08-15 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(225,'185',185,'PRV0001-0009','CONAGRA FOODS MEXICO, S.A. DE C.V.','2011-08-12 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(226,'186',186,'PRV0001-0012','PULPALETA DE MEXICO, S.A. DE C.V.','2011-08-19 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(227,'188',187,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-08-15 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(228,'189',187,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-08-19 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(229,'190',188,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-19 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(230,'191',189,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-19 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(231,'192',190,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-23 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(232,'193',191,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-23 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(233,'194',192,'PRV0001-0014','CUANDA, S.A. DE C.V.','2011-08-19 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(234,'195',193,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-19 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(235,'196',194,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-08-17 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(236,'197',195,'PRV0001-0019','BARCEL, S.A. DE C.V.','2011-08-18 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(237,'198',196,'PRV0001-0004','SANBORN HERMANOS, S.A. C.V.','2011-08-19 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(238,'199',197,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-23 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(239,'200',198,'PRV0001-0010','GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.','2011-08-19 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(240,'201',199,'PRV0001-0007','PRODUCTORA Y COMERCIALIZADORA  DE PRODUCTOS, S.A. DE C.V.','2011-08-18 05:00:00',NULL,0,'2018-06-12 21:39:45','2018-06-12 21:39:45'),(241,'203',201,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-19 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(242,'204',202,'PRV0001-0021','DULCES EL DESCUENTO, S.A. DE C.V.','2011-08-22 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(243,'205',203,'PRV0001-0012','PULPALETA DE MEXICO, S.A. DE C.V.','2011-08-29 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(244,'206',204,'PRV0001-0011','IMPORTADORA GREZON, S.A. DE C.V.','2011-08-26 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(245,'207',205,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-29 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(246,'208',206,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-29 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(247,'209',207,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-08-26 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(248,'210',208,'PRV0001-0014','CUANDA, S.A. DE C.V.','2011-08-26 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(249,'211',209,'PRV0001-0001','EFFEM MEXICO INC Y COMPAÑIA , S.EN N.C. DE C.V.','2011-08-30 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(250,'212',210,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-29 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(251,'213',211,'PRV0001-0013','FABRICA DE DULCES LA PROVIDENCIA, S.A. DE C.V.','2011-08-26 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(252,'214',212,'PRV0001-0004','SANBORN HERMANOS, S.A. C.V.','2011-08-26 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(253,'215',213,'PRV0001-0010','GRUPO ABASTECEDOR ABARROTES, S.A. DE C.V.','2011-08-26 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(254,'216',214,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-08-23 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(255,'217',215,'PRV0001-0003','IMPORTACIONES BAROUDI, S,A, DE  C.V.','2011-08-23 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(256,'218',216,'PRV0001-0008','ORGANIZACION SAHUAYO, S.A. DE C.V.','2011-08-25 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(257,'219',217,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-29 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(258,'220',218,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-29 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(259,'221',219,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-29 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(260,'222',220,'PRV0001-0017','MATRE MEXICO, S. DE R.L. DE C.V.','2011-08-29 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(261,'223',221,'PRV0002-0001','TROLLI IBERICA, S.A.','2011-08-29 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(262,'224',222,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-09-05 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(263,'225',223,'PRV0001-0006','HERSHEY MEXICO, S.A. DE C..V','2011-09-05 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46'),(264,'226',224,'PRV0001-0002','PRODUCTOS INDY, S.A. DE C.V.','2011-09-02 05:00:00',NULL,0,'2018-06-12 21:39:46','2018-06-12 21:39:46');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-17 17:16:54
