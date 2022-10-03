CREATE DATABASE  IF NOT EXISTS `deber1tables` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `deber1tables`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: deber1tables
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cumplimiento`
--

DROP TABLE IF EXISTS `cumplimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cumplimiento` (
  `Norma_codigoNorma` int NOT NULL,
  `ObreroDirecto_Obrero_numeroObrero` int NOT NULL,
  `porcentajeCumplimiento` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Norma_codigoNorma`,`ObreroDirecto_Obrero_numeroObrero`),
  KEY `fk_Norma_has_ObreroDirecto_ObreroDirecto1_idx` (`ObreroDirecto_Obrero_numeroObrero`),
  KEY `fk_Norma_has_ObreroDirecto_Norma1_idx` (`Norma_codigoNorma`),
  CONSTRAINT `fk_Norma_has_ObreroDirecto_Norma1` FOREIGN KEY (`Norma_codigoNorma`) REFERENCES `norma` (`codigoNorma`),
  CONSTRAINT `fk_Norma_has_ObreroDirecto_ObreroDirecto1` FOREIGN KEY (`ObreroDirecto_Obrero_numeroObrero`) REFERENCES `obrerodirecto` (`Obrero_numeroObrero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cumplimiento`
--

LOCK TABLES `cumplimiento` WRITE;
/*!40000 ALTER TABLE `cumplimiento` DISABLE KEYS */;
INSERT INTO `cumplimiento` VALUES (1,3,50),(1,5,50),(2,7,25),(2,8,25),(2,11,25),(2,13,25),(3,4,50),(3,15,50),(4,3,100),(5,15,100),(6,4,100),(7,8,100),(8,7,100),(9,11,100),(10,13,100),(11,7,50),(11,11,50),(12,8,50),(12,13,25),(12,15,25),(13,3,50),(13,4,50),(14,8,100),(15,7,100),(16,5,100),(17,4,100),(18,3,100),(19,11,100),(20,11,100);
/*!40000 ALTER TABLE `cumplimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `nombreEquipo` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `modeloEquipo` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `paisEquipo` varchar(12) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`nombreEquipo`,`modeloEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES ('Cortadora','2009','USA'),('Cortadora','2021','Canada'),('Empacadora','2019','Ecuador'),('Ensambladora','2007','Qatar'),('Ensambladora','2016','Qatar'),('Etiquetadora','2021','Albania'),('Etiquetadora','2022','Ecuador'),('Fresadora','2007','Alemania'),('Motor Fabrica','2002','Argentina'),('Motor Fabrica','2019','Italia');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logmantenimiento`
--

DROP TABLE IF EXISTS `logmantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logmantenimiento` (
  `Equipo_nombreEquipo` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Equipo_modeloEquipo` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ObreroAuxiliar_Obrero_numeroObrero` int NOT NULL,
  `tipoMantenimiento` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fechaMantenimiento` datetime NOT NULL,
  PRIMARY KEY (`Equipo_nombreEquipo`,`Equipo_modeloEquipo`,`ObreroAuxiliar_Obrero_numeroObrero`),
  KEY `fk_Equipo_has_ObreroAuxiliar_ObreroAuxiliar1_idx` (`ObreroAuxiliar_Obrero_numeroObrero`),
  KEY `fk_Equipo_has_ObreroAuxiliar_Equipo1_idx` (`Equipo_nombreEquipo`,`Equipo_modeloEquipo`),
  CONSTRAINT `fk_Equipo_has_ObreroAuxiliar_Equipo1` FOREIGN KEY (`Equipo_nombreEquipo`, `Equipo_modeloEquipo`) REFERENCES `equipo` (`nombreEquipo`, `modeloEquipo`),
  CONSTRAINT `fk_Equipo_has_ObreroAuxiliar_ObreroAuxiliar1` FOREIGN KEY (`ObreroAuxiliar_Obrero_numeroObrero`) REFERENCES `obreroauxiliar` (`Obrero_numeroObrero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logmantenimiento`
--

LOCK TABLES `logmantenimiento` WRITE;
/*!40000 ALTER TABLE `logmantenimiento` DISABLE KEYS */;
INSERT INTO `logmantenimiento` VALUES ('Cortadora','2009',9,'Cambio Aceite','2022-02-22 00:00:00'),('Cortadora','2009',16,'Preventivo','2022-02-21 00:00:00'),('Cortadora','2021',1,'Cambio Engranaje','2022-03-06 00:00:00'),('Cortadora','2021',14,'Cambio Cuchilla','2022-03-18 00:00:00'),('Ensambladora','2007',16,'Preventivo','2022-04-02 00:00:00'),('Fresadora','2007',16,'Preventivo','2022-03-10 00:00:00'),('Motor Fabrica','2002',1,'Cambio Engranaje','2022-03-04 00:00:00'),('Motor Fabrica','2002',2,'Reensamblaje','2022-03-05 00:00:00'),('Motor Fabrica','2002',9,'Cambio Aceite','2022-03-04 00:00:00'),('Motor Fabrica','2002',14,'Cambio Bugia','2022-03-12 00:00:00'),('Motor Fabrica','2002',16,'Preventivo','2022-03-03 00:00:00');
/*!40000 ALTER TABLE `logmantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `norma`
--

DROP TABLE IF EXISTS `norma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `norma` (
  `codigoNorma` int NOT NULL,
  `Equipo_nombreEquipo` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Equipo_modeloEquipo` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Pieza_codigoPieza` int NOT NULL,
  `Operacion_codigoOperacion` int NOT NULL,
  `descripcionNorma` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tiempoexecNorma` decimal(10,0) NOT NULL,
  PRIMARY KEY (`codigoNorma`),
  KEY `fk_table1_Pieza1_idx` (`Pieza_codigoPieza`),
  KEY `fk_table1_Operacion1_idx` (`Operacion_codigoOperacion`),
  KEY `fk_table1_Equipo1` (`Equipo_nombreEquipo`,`Equipo_modeloEquipo`),
  CONSTRAINT `fk_table1_Equipo1` FOREIGN KEY (`Equipo_nombreEquipo`, `Equipo_modeloEquipo`) REFERENCES `equipo` (`nombreEquipo`, `modeloEquipo`),
  CONSTRAINT `fk_table1_Operacion1` FOREIGN KEY (`Operacion_codigoOperacion`) REFERENCES `operacion` (`codigoOperacion`),
  CONSTRAINT `fk_table1_Pieza1` FOREIGN KEY (`Pieza_codigoPieza`) REFERENCES `pieza` (`codigoPieza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `norma`
--

LOCK TABLES `norma` WRITE;
/*!40000 ALTER TABLE `norma` DISABLE KEYS */;
INSERT INTO `norma` VALUES (1,'Cortadora','2009',7,1,'corte Helice std.',1),(2,'Cortadora','2009',8,1,'corte Lamina Plata',2),(3,'Cortadora','2009',9,1,'corte Lamina Bronce',2),(4,'Fresadora','2007',7,2,'fresado Helice std.',3),(5,'Etiquetadora','2022',11,6,'etiquetado Martillo industrial',2),(6,'Fresadora','2007',2,2,'fresado Tuerca Industrial',1),(7,'Ensambladora','2016',6,4,'ensamblado Grapadora Industrial',4),(8,'Fresadora','2007',5,2,'fresado Sierra',3),(9,'Motor Fabrica','2002',4,7,'Arranque Motor de Perforadora',2),(10,'Fresadora','2007',8,2,'fresado Lamina de Plata',1),(11,'Motor Fabrica','2019',13,7,'inicio ensamblado de Iman Industrial',5),(12,'Ensambladora','2016',15,4,'ensamblaje Ciguenado',4),(13,'Fresadora','2007',12,2,'fresado Tuberia',5),(14,'Motor Fabrica','2019',3,7,'inicio de Fabricacion de Taladro',3),(15,'Fresadora','2007',15,2,'fresado de Ciguenado',2),(16,'Empacadora','2019',8,5,'empacado de Lamina de Plata',2),(17,'Fresadora','2007',3,2,'fresado de Taladro',1),(18,'Ensambladora','2007',12,4,'ensamblaje de Tuberia',1),(19,'Etiquetadora','2022',1,6,'etiqueta de Motor',5),(20,'Fresadora','2007',9,2,'fresado Lamina de Oro',3);
/*!40000 ALTER TABLE `norma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obrero`
--

DROP TABLE IF EXISTS `obrero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obrero` (
  `numeroObrero` int NOT NULL,
  `nombreObrero` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `categoriaObrero` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `calificacionObrero` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`numeroObrero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obrero`
--

LOCK TABLES `obrero` WRITE;
/*!40000 ALTER TABLE `obrero` DISABLE KEYS */;
INSERT INTO `obrero` VALUES (1,'Carlos Montiel','Auxiliar','Informatico'),(2,'Paul Quimbita','Auxiliar','Informatico'),(3,'Mara Fortuny','Directo','Informatico'),(4,'Andres Andrade','Directo','Quimico'),(5,'Boris Becker','Directo','Industrial'),(6,'Camilo Castro','Auxiliar','Industrial'),(7,'Daniela Daniel','Directo','Mecanico'),(8,'Emilio Estevez','Directo','Quimico'),(9,'Fanny Flan','Auxiliar','Informatico'),(10,'Gabriel Garcia','Auxiliar','Industrial'),(11,'Ines Izquierdo','Directo','Quimico'),(12,'Jorge Jamil','Auxiliar','Mecanico'),(13,'Kate Kamila','Directo','Mecanico'),(14,'Luis Lamas','Auxiliar','Informatico'),(15,'Maria Montiel','Directo','Industrial'),(16,'Nicolas Narino','Auxiliar','Mecanico');
/*!40000 ALTER TABLE `obrero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obreroauxiliar`
--

DROP TABLE IF EXISTS `obreroauxiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obreroauxiliar` (
  `Obrero_numeroObrero` int NOT NULL,
  `salarioObreroAuxiliar` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Obrero_numeroObrero`),
  CONSTRAINT `fk_ObreroAuxiliar_Obrero1` FOREIGN KEY (`Obrero_numeroObrero`) REFERENCES `obrero` (`numeroObrero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obreroauxiliar`
--

LOCK TABLES `obreroauxiliar` WRITE;
/*!40000 ALTER TABLE `obreroauxiliar` DISABLE KEYS */;
INSERT INTO `obreroauxiliar` VALUES (1,2500),(2,2534),(6,2432),(9,2381),(10,2592),(12,2534),(14,2323),(16,2513);
/*!40000 ALTER TABLE `obreroauxiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obrerodirecto`
--

DROP TABLE IF EXISTS `obrerodirecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obrerodirecto` (
  `Obrero_numeroObrero` int NOT NULL,
  `salarioObreroDirecto` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Obrero_numeroObrero`),
  CONSTRAINT `fk_ObreroDirecto_Obrero1` FOREIGN KEY (`Obrero_numeroObrero`) REFERENCES `obrero` (`numeroObrero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obrerodirecto`
--

LOCK TABLES `obrerodirecto` WRITE;
/*!40000 ALTER TABLE `obrerodirecto` DISABLE KEYS */;
INSERT INTO `obrerodirecto` VALUES (3,1809),(4,1803),(5,1854),(7,1533),(8,1764),(11,1824),(13,1762),(15,1567);
/*!40000 ALTER TABLE `obrerodirecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacion`
--

DROP TABLE IF EXISTS `operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operacion` (
  `codigoOperacion` int NOT NULL,
  `nombreOperacion` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`codigoOperacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacion`
--

LOCK TABLES `operacion` WRITE;
/*!40000 ALTER TABLE `operacion` DISABLE KEYS */;
INSERT INTO `operacion` VALUES (1,'Corte'),(2,'Fresado'),(3,'Enfriado'),(4,'Ensamblado'),(5,'Empacado'),(6,'Etiquetado'),(7,'Arranque Motor');
/*!40000 ALTER TABLE `operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pieza`
--

DROP TABLE IF EXISTS `pieza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pieza` (
  `codigoPieza` int NOT NULL,
  `descripcionPieza` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `pesoPieza` decimal(10,0) NOT NULL,
  PRIMARY KEY (`codigoPieza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pieza`
--

LOCK TABLES `pieza` WRITE;
/*!40000 ALTER TABLE `pieza` DISABLE KEYS */;
INSERT INTO `pieza` VALUES (1,'Motor',10),(2,'Tuerca Industrial',1),(3,'Taladro',4),(4,'Perforadora',26),(5,'Sierra',12),(6,'Grapadora industrial',1),(7,'Helice',12),(8,'Lamina Plata',2),(9,'Lamina Bronce',4),(10,'Lamina Aluminio',1),(11,'Martillo Industrial',23),(12,'Tuberia ',12),(13,'Iman Industrial',15),(14,'Destornillador Industrial',6),(15,'Ciguenado',2);
/*!40000 ALTER TABLE `pieza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pieza_has_operacion`
--

DROP TABLE IF EXISTS `pieza_has_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pieza_has_operacion` (
  `Pieza_codigoPieza` int NOT NULL,
  `Operacion_codigoOperacion` int NOT NULL,
  PRIMARY KEY (`Pieza_codigoPieza`,`Operacion_codigoOperacion`),
  KEY `fk_Pieza_has_Operacion_Operacion1_idx` (`Operacion_codigoOperacion`),
  KEY `fk_Pieza_has_Operacion_Pieza_idx` (`Pieza_codigoPieza`),
  CONSTRAINT `fk_Pieza_has_Operacion_Operacion1` FOREIGN KEY (`Operacion_codigoOperacion`) REFERENCES `operacion` (`codigoOperacion`),
  CONSTRAINT `fk_Pieza_has_Operacion_Pieza` FOREIGN KEY (`Pieza_codigoPieza`) REFERENCES `pieza` (`codigoPieza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pieza_has_operacion`
--

LOCK TABLES `pieza_has_operacion` WRITE;
/*!40000 ALTER TABLE `pieza_has_operacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `pieza_has_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'deber1tables'
--

--
-- Dumping routines for database 'deber1tables'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-02 20:17:10
