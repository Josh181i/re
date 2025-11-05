-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: tecmave
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20251021203016_Agregando datos personales','9.0.10');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agendamiento`
--

DROP TABLE IF EXISTS `agendamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamiento` (
  `id_agendamiento` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `vehiculo_id` int NOT NULL,
  `fecha_agregada` datetime NOT NULL,
  `id_estado` int NOT NULL DEFAULT '2',
  `fecha_estimada` datetime DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL,
  PRIMARY KEY (`id_agendamiento`),
  KEY `FK_Agendamiento_Vehiculo` (`vehiculo_id`),
  KEY `FK_Agendamiento_Cliente` (`cliente_id`),
  KEY `FK_Agendamiento_Estado` (`id_estado`),
  CONSTRAINT `FK_Agendamiento_Cliente` FOREIGN KEY (`cliente_id`) REFERENCES `aspnetusers` (`Id`),
  CONSTRAINT `FK_Agendamiento_Estado` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`),
  CONSTRAINT `FK_Agendamiento_Vehiculo` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamiento`
--

LOCK TABLES `agendamiento` WRITE;
/*!40000 ALTER TABLE `agendamiento` DISABLE KEYS */;
INSERT INTO `agendamiento` VALUES (7,3,3,'2025-10-24 00:00:00',2,'2025-10-30 00:00:00','10:00:00'),(8,9,5,'2025-10-24 00:00:00',2,'2025-10-24 00:00:00','10:00:00');
/*!40000 ALTER TABLE `agendamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` int NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Description` varchar(256) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES (1,'Admin','ADMIN','Administrador con acceso completo al sistema',1,NULL),(2,'Colaborador','COLABORADOR','Empleado o técnico del taller con permisos limitados',1,NULL),(3,'Cliente','CLIENTE','Usuario cliente que puede ver y registrar sus vehículos',1,NULL),(4,'Administrador','ADMINISTRADOR',NULL,1,NULL),(5,'Usuarios','USUARIOS',NULL,1,NULL);
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` int NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` int NOT NULL,
  `RoleId` int NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES (1,1),(3,1),(6,1),(2,3),(8,3),(9,3);
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Apellidos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cedula` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Direccion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES (1,'Darian','Gonzalez','703000893','Limon','kaled@gmail.com','KALED@GMAIL.COM','kaled@gmail.com','KALED@GMAIL.COM',0,'AQAAAAIAAYagAAAAEPuBEw3Q47etro2d2/VHBbu/iJl2FeYmn3gRJi8gq7NThPZ0DiiPqzlzsiQViEddmw==','K4UH2V6B7VERZZHJ3AVS63HND6KU6EGM','6531c732-7c46-48a0-87e3-89d1c8d049f1','60081384',0,0,NULL,1,0),(2,'Darian','Gonzalez','703000893','Limon','prueba@gmail.com','PRUEBA@GMAIL.COM','prueba@gmail.com','PRUEBA@GMAIL.COM',0,'AQAAAAIAAYagAAAAEKP9UFOAppzpF2NZv9K63oZNxPBPDcGNRiSv5HAI9DSoQfm7pRlj7qgompk9GJ/Xyg==','22TXGOKKMN4O6VPRFFNAZAGF4WDNZBGS','a428ab86-7e01-469f-9970-ae2b4763050a','60081384',0,0,NULL,1,0),(3,'Darian','Gonzalez','703000893','Limon','cosas@gmail.com','COSAS@GMAIL.COM','cosas@gmail.com','COSAS@GMAIL.COM',0,'AQAAAAIAAYagAAAAEIB6kpgvj8TzXfRkUfRd1UtBP2P+l0tWVFtlzt7fxtj20seQHVsVEOJRX/2/zq8s9w==','TRM4DGRRJLMPSEPKZE3HDOCD2EA3U4JY','22666ebf-abda-497c-9ae7-8e8e2b10de54','60081384',0,0,NULL,1,0),(4,'Vivian','Velazquez','100000','CASA','Vivian','VIVIAN','vivian@tecmave.com','VIVIAN@TECMAVE.COM',1,'AQAAAAIAAYagAAAAEAdminHashDemo==','SEC123','CONC123','88888888',1,0,NULL,0,0),(5,'Joshua','Lopez','Joshua','100000','CASA','JOSHUA','joshua@tecmave.com','joshua@TECMAVE.COM',1,'AQAAAAIAAYagAAAAEColabHashDemo==','SEC456','CONC456','87777777',1,0,NULL,0,0),(6,'Khaled','Gonzalez','100000','CASA','Khaled','KHALED','khaled@tecmave.com','KHALED@TECMAVE.COM',1,'AQAAAAIAAYagAAAAEClienteHashDemo==','SEC789','CONC789','86666666',1,0,NULL,0,0),(7,'Daniel','Lopez','Daniel','100000','CASA','DANIEL','Daniel@tecmave.com','DANIEL@TECMAVE.COM',1,'AQAAAAIAAYagAAAAEClienteHashDemo==','SEC789','CONC789','86666666',1,0,NULL,0,0),(8,'Darian','Gonzalez','7031231241','Limon','prueba2@gmail.com','PRUEBA2@GMAIL.COM','prueba2@gmail.com','PRUEBA2@GMAIL.COM',0,'AQAAAAIAAYagAAAAEH3F1+SU3zX0NBtakGyBmMVSjLb07DAHFKz539E7oGQHvFDnAbY/5TE1BokxIuQbpA==','L57BLVK3VSAE27GAQZHD2NA5WJCT6225','c98666cf-650b-46e8-989b-90e1ec49bfb0','60081384',0,0,NULL,1,0),(9,'Fabian','Aguilar','7031231241','Limon','kal@gmail.com','KAL@GMAIL.COM','kal@gmail.com','KAL@GMAIL.COM',0,'AQAAAAIAAYagAAAAEJkf3xd3WU/byniucL9b2dQnGD8ONLp2pju6VUC68UETc1fQBz0bSXPZnASV0oCLFg==','EJCBNUU3HTIC43A2B5QQRB424TS46VMW','487e22dd-0971-496b-ae3e-daf81d59bccc','89821384',0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` int NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaboradores`
--

DROP TABLE IF EXISTS `colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colaboradores` (
  `id_colaborador` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `puesto` varchar(45) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `fecha_contratacion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_colaborador`),
  KEY `FK_Colab_Usuario` (`id_usuario`),
  CONSTRAINT `FK_Colab_Usuario` FOREIGN KEY (`id_usuario`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaboradores`
--

LOCK TABLES `colaboradores` WRITE;
/*!40000 ALTER TABLE `colaboradores` DISABLE KEYS */;
/*!40000 ALTER TABLE `colaboradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `factura_id` int NOT NULL,
  `servicio_id` int NOT NULL,
  `descripcion` text NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `FK_DetalleFactura_Factura` (`factura_id`),
  KEY `FK_DetalleFactura_Servicio` (`servicio_id`),
  CONSTRAINT `FK_DetalleFactura_Factura` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id_factura`),
  CONSTRAINT `FK_DetalleFactura_Servicio` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `id_estado` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'activo'),(2,'pendiente'),(3,'inactivo'),(4,'Ingresado'),(5,'En Diagnóstico'),(6,'Pendiente de aprobación'),(7,'En mantenimiento'),(8,'En pruebas'),(9,'Finalizado'),(10,'Entregado'),(11,'Cancelado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `metodo_pago` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `FK_Factura_Cliente` (`cliente_id`),
  CONSTRAINT `FK_Factura_Cliente` FOREIGN KEY (`cliente_id`) REFERENCES `aspnetusers` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Sin marca'),(2,'Jeep'),(3,'Dodge'),(4,'Toyota'),(5,'Nissan'),(6,'Honda'),(7,'Mitsubishi'),(8,'Suzuki'),(9,'Hyundai'),(10,'Chevrolet'),(11,'Chrysler'),(12,'Daihatsu'),(13,'RAM'),(14,'Ford'),(15,'GMC'),(16,'Hummer'),(17,'Isuzu'),(18,'Kia'),(19,'Lexus'),(20,'Mazda');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `id_notificaciones` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `fecha_envio` date NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`id_notificaciones`),
  KEY `FK_Notificaciones_Usuario` (`usuario_id`),
  KEY `FK_Notificaciones_Estado` (`id_estado`),
  CONSTRAINT `FK_Notificaciones_Estado` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`),
  CONSTRAINT `FK_Notificaciones_Usuario` FOREIGN KEY (`usuario_id`) REFERENCES `aspnetusers` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_promocion` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`id_promocion`),
  KEY `FK_Promociones_Estado` (`id_estado`),
  CONSTRAINT `FK_Promociones_Estado` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resenas`
--

DROP TABLE IF EXISTS `resenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resenas` (
  `id_resena` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `servicio_id` int NOT NULL,
  `comentario` text NOT NULL,
  `calificacion` float NOT NULL,
  PRIMARY KEY (`id_resena`),
  KEY `FK_Resenas_Servicio` (`servicio_id`),
  KEY `FK_Resenas_Cliente` (`cliente_id`),
  CONSTRAINT `FK_Resenas_Cliente` FOREIGN KEY (`cliente_id`) REFERENCES `aspnetusers` (`Id`),
  CONSTRAINT `FK_Resenas_Servicio` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resenas`
--

LOCK TABLES `resenas` WRITE;
/*!40000 ALTER TABLE `resenas` DISABLE KEYS */;
/*!40000 ALTER TABLE `resenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision` (
  `id_revision` int NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int NOT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `id_servicio` int NOT NULL,
  `id_estado` int NOT NULL,
  `fecha_estimada_entrega` datetime DEFAULT NULL,
  `fecha_entrega_final` datetime DEFAULT NULL,
  PRIMARY KEY (`id_revision`),
  KEY `FK_Revision_Vehiculo` (`vehiculo_id`),
  KEY `FK_Revision_Servicio` (`id_servicio`),
  KEY `FK_Revision_Estado` (`id_estado`),
  CONSTRAINT `FK_Revision_Estado` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`),
  CONSTRAINT `FK_Revision_Servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  CONSTRAINT `FK_Revision_Vehiculo` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,'2025-10-23 19:30:23',9,2,'2025-10-23 19:30:23','2025-10-23 19:30:23'),(2,1,'2025-10-23 19:34:01',10,2,'2025-10-23 19:34:01','2025-10-23 19:34:01'),(3,1,'2025-10-23 19:34:07',3,2,'2025-10-23 19:34:07','2025-10-23 19:34:07'),(4,3,'2025-10-24 02:17:14',9,2,'2025-10-24 02:17:14','2025-10-24 02:17:14'),(5,5,'2025-10-24 02:41:17',9,2,'2025-10-24 02:41:17','2025-10-24 02:41:17'),(6,5,'2025-10-24 02:44:46',10,2,'2025-10-24 02:44:46','2025-10-24 02:44:46'),(7,5,'2025-10-24 02:44:51',3,2,'2025-10-24 02:44:51','2025-10-24 02:44:51');
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_change_audit`
--

DROP TABLE IF EXISTS `role_change_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_change_audit` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `TargetUserId` int NOT NULL,
  `TargetUserName` varchar(256) DEFAULT NULL,
  `PreviousRole` varchar(256) DEFAULT NULL,
  `NewRole` varchar(256) DEFAULT NULL,
  `ChangedByUserId` int DEFAULT NULL,
  `ChangedByUserName` varchar(256) DEFAULT NULL,
  `ChangedAtUtc` datetime(6) NOT NULL,
  `Action` varchar(20) NOT NULL,
  `Detail` varchar(1024) DEFAULT NULL,
  `SourceIp` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_role_change_audit_TargetUserId` (`TargetUserId`),
  KEY `IX_role_change_audit_ChangedAtUtc` (`ChangedAtUtc`),
  KEY `IX_role_change_audit_Action` (`Action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_change_audit`
--

LOCK TABLES `role_change_audit` WRITE;
/*!40000 ALTER TABLE `role_change_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_change_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tipo_servicio_id` int NOT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `tipo_servicio_idx` (`tipo_servicio_id`),
  CONSTRAINT `FK_Servicios_TipoServicio` FOREIGN KEY (`tipo_servicio_id`) REFERENCES `tipo_servicios` (`id_tipo_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Electrónica','Diagnóstico y reparación de sistemas electrónicos','Falla específica',120.00,3),(2,'Aire acondicionado','Revisión y reparación del sistema de A/C','Falla específica',150.00,3),(3,'Transmisiones','Reparación de cajas de transmisión manual y automática','Falla específica',250.00,3),(4,'Electricidad','Revisión de cableado, luces y alternadores','Falla específica',100.00,3),(5,'Parabrisas','Reemplazo y sellado de parabrisas','Falla específica',180.00,3),(6,'Tapicería','Reparación y limpieza de interiores','Falla específica',130.00,3),(7,'Pintura','Pintura general o parcial del vehículo','Falla específica',300.00,3),(9,'Revisión general','Chequeo completo del vehículo para prevenir averías','Mantenimiento preventivo',100.00,1),(10,'Correctivo','Mantenimiento correctivo','Mantenimiento correctivo',200.00,2);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_revision`
--

DROP TABLE IF EXISTS `servicios_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_revision` (
  `id_servicio_revision` int NOT NULL AUTO_INCREMENT,
  `revision_id` int DEFAULT NULL,
  `servicio_id` int DEFAULT NULL,
  `costo_final` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_servicio_revision`),
  KEY `FK_SR_Servicio` (`servicio_id`),
  KEY `FK_SR_Revision` (`revision_id`),
  CONSTRAINT `FK_SR_Revision` FOREIGN KEY (`revision_id`) REFERENCES `revision` (`id_revision`),
  CONSTRAINT `FK_SR_Servicio` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_revision`
--

LOCK TABLES `servicios_revision` WRITE;
/*!40000 ALTER TABLE `servicios_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servicios`
--

DROP TABLE IF EXISTS `tipo_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_servicios` (
  `id_tipo_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servicios`
--

LOCK TABLES `tipo_servicios` WRITE;
/*!40000 ALTER TABLE `tipo_servicios` DISABLE KEYS */;
INSERT INTO `tipo_servicios` VALUES (1,'Mantenimiento preventivo','Acciones para evitar fallas futuras'),(2,'Mantenimiento correctivo','Reparación de fallas ya ocurridas'),(3,'Fallas específicas','Fallas en componentes concretos del vehículo');
/*!40000 ALTER TABLE `tipo_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `id_marca` int NOT NULL,
  `anno` int NOT NULL,
  `placa` varchar(255) NOT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_vehiculo`),
  KEY `FK_Vehiculos_Cliente` (`cliente_id`),
  KEY `FK_Vehiculos_Marca` (`id_marca`),
  CONSTRAINT `FK_Vehiculos_Cliente` FOREIGN KEY (`cliente_id`) REFERENCES `aspnetusers` (`Id`),
  CONSTRAINT `FK_Vehiculos_Marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES (1,1,16,2021,'CRC241234','Slift'),(3,3,6,2020,'22DSA','asdas'),(5,9,14,2025,'CRC123','everest');
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-05 14:24:10
