CREATE DATABASE  IF NOT EXISTS `sacopro` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sacopro`;
-- MySQL dump 10.13  Distrib 5.6.11, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: sacopro
-- ------------------------------------------------------
-- Server version	5.1.45

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
-- Table structure for table `anuncio`
--

DROP TABLE IF EXISTS `anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anuncio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `fecha_expiracion` datetime NOT NULL,
  `fecha_publicacion` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `mensaje` varchar(2000) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCD95C783EA496FAD` (`categoria_id`),
  CONSTRAINT `FKCD95C783EA496FAD` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
INSERT INTO `anuncio` VALUES (1,0,1,'2013-08-31 14:57:42','2013-09-05 14:57:42','2013-08-31 14:57:42','2013-08-31 14:57:42','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nunc eu enim sodales vulputate in sit amet ligula. In hac habitasse platea dictumst. Aenean porttitor, erat at lobortis posuere, leo diam pretium eros, nec hendrerit risus lacus id nisi. Pellentesque sodales luctus sem eu mattis. In hac habitasse platea dictumst. Nunc eu blandit libero, in elementum dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque nec orci sodales, tristique erat ac, euismod orci. Duis erat est, pellentesque ac est vel, varius auctor elit. Sed rhoncus condimentum neque quis ornare. ','Primer anuncio'),(2,0,1,'2013-08-31 14:57:42','2013-09-01 14:57:42','2013-08-31 14:57:42','2013-08-31 14:57:42','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nunc eu enim sodales vulputate in sit amet ligula. In hac habitasse platea dictumst. Aenean porttitor, erat at lobortis posuere, leo diam pretium eros, nec hendrerit risus lacus id nisi. Pellentesque sodales luctus sem eu mattis. In hac habitasse platea dictumst. Nunc eu blandit libero, in elementum dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque nec orci sodales, tristique erat ac, euismod orci. Duis erat est, pellentesque ac est vel, varius auctor elit. Sed rhoncus condimentum neque quis ornare. ','Incorporacion de fulanito'),(3,0,1,'2013-08-31 14:57:42','2013-08-30 14:57:42','2013-08-21 14:57:42','2013-08-31 14:57:42','Aenean eleifend felis a magna gravida iaculis. Mauris pellentesque nunc ipsum, et ullamcorper justo porta vitae. Etiam nec rhoncus libero. Aliquam ultrices tellus nec enim malesuada aliquet. Cras eget diam ultrices sapien consequat consectetur. Integer mollis, mi a molestie sodales, elit augue rhoncus mauris, vitae sagittis orci augue vitae enim. In laoreet hendrerit quam vel fermentum. Suspendisse potenti. Aenean ac lacus ultricies neque dignissim venenatis vitae ac ipsum. Morbi aliquam commodo sapien sit amet gravida','Anuncio Vencido');
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anuncio_comentario`
--

DROP TABLE IF EXISTS `anuncio_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anuncio_comentario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `anuncio_id` bigint(20) NOT NULL,
  `colaborador_id` bigint(20) NOT NULL,
  `comentario` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL,
  `fecha` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK39ABB61DE7E241F3` (`colaborador_id`),
  KEY `FK39ABB61DDDFA66D` (`anuncio_id`),
  CONSTRAINT `FK39ABB61DDDFA66D` FOREIGN KEY (`anuncio_id`) REFERENCES `anuncio` (`id`),
  CONSTRAINT `FK39ABB61DE7E241F3` FOREIGN KEY (`colaborador_id`) REFERENCES `colaborador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio_comentario`
--

LOCK TABLES `anuncio_comentario` WRITE;
/*!40000 ALTER TABLE `anuncio_comentario` DISABLE KEYS */;
INSERT INTO `anuncio_comentario` VALUES (1,0,1,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:42','2013-08-31 14:57:42','2013-08-31 14:57:42'),(2,0,1,3,'Prueba comentario','2013-08-31 14:57:42','2013-08-31 14:57:42','2013-08-31 14:57:42'),(3,0,2,3,'Prueba comentario','2013-08-31 14:57:42','2013-08-31 14:57:42','2013-08-31 14:57:42'),(4,0,3,4,'Prueba comentario','2013-08-31 14:57:42','2013-08-31 14:57:42','2013-08-31 14:57:42');
/*!40000 ALTER TABLE `anuncio_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anuncio_etiquetas`
--

DROP TABLE IF EXISTS `anuncio_etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anuncio_etiquetas` (
  `anuncio_id` bigint(20) NOT NULL,
  `etiqueta_id` bigint(20) NOT NULL,
  PRIMARY KEY (`anuncio_id`,`etiqueta_id`),
  KEY `FK417BEDA3DDFA66D` (`anuncio_id`),
  KEY `FK417BEDA37A154407` (`etiqueta_id`),
  CONSTRAINT `FK417BEDA37A154407` FOREIGN KEY (`etiqueta_id`) REFERENCES `etiqueta` (`id`),
  CONSTRAINT `FK417BEDA3DDFA66D` FOREIGN KEY (`anuncio_id`) REFERENCES `anuncio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio_etiquetas`
--

LOCK TABLES `anuncio_etiquetas` WRITE;
/*!40000 ALTER TABLE `anuncio_etiquetas` DISABLE KEYS */;
INSERT INTO `anuncio_etiquetas` VALUES (1,1),(2,2),(3,2);
/*!40000 ALTER TABLE `anuncio_etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banda_nivel_posicion`
--

DROP TABLE IF EXISTS `banda_nivel_posicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banda_nivel_posicion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `banda_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `departamento_id` bigint(20) NOT NULL,
  `encargado_id` bigint(20) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `max_salario` float NOT NULL,
  `min_salario` float NOT NULL,
  `nivel_id` bigint(20) NOT NULL,
  `posicion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nivel_id` (`nivel_id`,`banda_id`,`posicion_id`),
  KEY `FKCF51524A5650DE70` (`departamento_id`),
  KEY `FKCF51524A69630A10` (`encargado_id`),
  KEY `FKCF51524AB986F1B0` (`posicion_id`),
  KEY `FKCF51524AE097B604` (`banda_id`),
  KEY `FKCF51524A27D6AE18` (`nivel_id`),
  CONSTRAINT `FKCF51524A27D6AE18` FOREIGN KEY (`nivel_id`) REFERENCES `nivel_profesional` (`id`),
  CONSTRAINT `FKCF51524A5650DE70` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`),
  CONSTRAINT `FKCF51524A69630A10` FOREIGN KEY (`encargado_id`) REFERENCES `banda_nivel_posicion` (`id`),
  CONSTRAINT `FKCF51524AB986F1B0` FOREIGN KEY (`posicion_id`) REFERENCES `posicion` (`id`),
  CONSTRAINT `FKCF51524AE097B604` FOREIGN KEY (`banda_id`) REFERENCES `banda_profesional` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banda_nivel_posicion`
--

LOCK TABLES `banda_nivel_posicion` WRITE;
/*!40000 ALTER TABLE `banda_nivel_posicion` DISABLE KEYS */;
INSERT INTO `banda_nivel_posicion` VALUES (1,0,5,'2013-08-31 14:57:37',1,NULL,'2013-08-31 14:57:37',750,600,2,1),(2,0,5,'2013-08-31 14:57:37',1,NULL,'2013-08-31 14:57:37',750,600,2,2),(3,0,5,'2013-08-31 14:57:37',2,NULL,'2013-08-31 14:57:37',750,600,2,3),(4,0,5,'2013-08-31 14:57:37',3,NULL,'2013-08-31 14:57:37',750,600,2,4),(5,0,5,'2013-08-31 14:57:37',4,NULL,'2013-08-31 14:57:37',750,600,2,5),(6,0,5,'2013-08-31 14:57:37',4,NULL,'2013-08-31 14:57:37',750,600,2,6),(7,0,5,'2013-08-31 14:57:37',5,NULL,'2013-08-31 14:57:37',750,600,2,7),(8,0,5,'2013-08-31 14:57:37',5,NULL,'2013-08-31 14:57:37',650,500,2,8),(9,0,5,'2013-08-31 14:57:37',1,NULL,'2013-08-31 14:57:37',850,750,1,1),(10,0,5,'2013-08-31 14:57:37',1,NULL,'2013-08-31 14:57:37',850,750,1,2),(11,0,5,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',850,750,1,9),(12,0,5,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',850,750,1,10),(13,0,5,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',850,750,1,12),(14,0,5,'2013-08-31 14:57:38',2,NULL,'2013-08-31 14:57:38',850,750,1,3),(15,0,5,'2013-08-31 14:57:38',3,NULL,'2013-08-31 14:57:38',850,750,1,4),(16,0,5,'2013-08-31 14:57:38',4,NULL,'2013-08-31 14:57:38',1000,750,1,5),(17,0,5,'2013-08-31 14:57:38',4,NULL,'2013-08-31 14:57:38',1000,750,1,6),(18,0,5,'2013-08-31 14:57:38',5,NULL,'2013-08-31 14:57:38',850,750,1,7),(19,0,5,'2013-08-31 14:57:38',5,NULL,'2013-08-31 14:57:38',800,750,1,8),(20,0,4,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1000,850,2,9),(21,0,4,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1000,850,2,11),(22,0,4,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1000,850,2,1),(23,0,4,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1000,850,2,10),(24,0,4,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1000,850,2,12),(25,0,4,'2013-08-31 14:57:38',2,NULL,'2013-08-31 14:57:38',1000,850,2,3),(26,0,4,'2013-08-31 14:57:38',3,NULL,'2013-08-31 14:57:38',1000,850,2,4),(27,0,4,'2013-08-31 14:57:38',4,NULL,'2013-08-31 14:57:38',1400,1000,2,13),(28,0,4,'2013-08-31 14:57:38',5,NULL,'2013-08-31 14:57:38',1000,850,2,14),(29,0,4,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1200,1000,1,9),(30,0,4,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1200,1000,1,11),(31,0,4,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1200,1000,1,10),(32,0,4,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1200,1000,1,12),(33,0,4,'2013-08-31 14:57:38',2,NULL,'2013-08-31 14:57:38',1200,1000,1,3),(34,0,4,'2013-08-31 14:57:38',3,NULL,'2013-08-31 14:57:38',1200,1000,1,4),(35,0,4,'2013-08-31 14:57:38',4,NULL,'2013-08-31 14:57:38',1800,1400,1,13),(36,0,4,'2013-08-31 14:57:38',5,NULL,'2013-08-31 14:57:38',1200,1000,1,14),(37,0,3,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1400,1200,2,15),(38,0,3,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1400,1200,2,16),(39,0,3,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1400,1200,2,10),(40,0,3,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1400,1200,2,17),(41,0,3,'2013-08-31 14:57:38',2,NULL,'2013-08-31 14:57:38',1400,1200,2,18),(42,0,3,'2013-08-31 14:57:38',4,NULL,'2013-08-31 14:57:38',2200,1800,2,19),(43,0,3,'2013-08-31 14:57:38',5,NULL,'2013-08-31 14:57:38',1400,1200,2,20),(44,0,3,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1800,1400,1,15),(45,0,3,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1800,1400,1,10),(46,0,3,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',1800,1400,1,17),(47,0,3,'2013-08-31 14:57:38',2,NULL,'2013-08-31 14:57:38',1800,1400,1,18),(48,0,3,'2013-08-31 14:57:38',4,NULL,'2013-08-31 14:57:38',2400,2200,1,19),(49,0,3,'2013-08-31 14:57:38',4,NULL,'2013-08-31 14:57:38',2600,2400,1,21),(50,0,3,'2013-08-31 14:57:38',5,NULL,'2013-08-31 14:57:38',1800,1400,1,20),(51,0,2,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',2400,1800,2,22),(52,0,2,'2013-08-31 14:57:38',4,NULL,'2013-08-31 14:57:38',3000,2600,2,21),(53,0,2,'2013-08-31 14:57:38',4,NULL,'2013-08-31 14:57:38',3000,2600,2,23),(54,0,2,'2013-08-31 14:57:38',1,NULL,'2013-08-31 14:57:38',3000,2400,1,22),(55,0,2,'2013-08-31 14:57:38',4,NULL,'2013-08-31 14:57:38',3400,3000,1,21),(56,0,2,'2013-08-31 14:57:38',4,NULL,'2013-08-31 14:57:38',3400,3000,1,23),(57,0,1,'2013-08-31 14:57:38',3,NULL,'2013-08-31 14:57:38',2800,2000,3,24),(58,0,1,'2013-08-31 14:57:38',3,NULL,'2013-08-31 14:57:38',3200,2400,3,25),(59,0,1,'2013-08-31 14:57:38',3,NULL,'2013-08-31 14:57:38',3600,2800,2,24),(60,0,1,'2013-08-31 14:57:38',3,NULL,'2013-08-31 14:57:38',4000,3200,2,25),(61,0,1,'2013-08-31 14:57:38',3,NULL,'2013-08-31 14:57:38',4400,3600,1,24),(62,0,1,'2013-08-31 14:57:38',3,NULL,'2013-08-31 14:57:38',4800,4000,1,25);
/*!40000 ALTER TABLE `banda_nivel_posicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banda_nivel_posicion_competencia_nivel`
--

DROP TABLE IF EXISTS `banda_nivel_posicion_competencia_nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banda_nivel_posicion_competencia_nivel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `competencia_nivel_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `posicion_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posicion_id` (`posicion_id`,`competencia_nivel_id`),
  KEY `FKFA8CE78278D7510F` (`competencia_nivel_id`),
  KEY `FKFA8CE782FE151EE6` (`posicion_id`),
  CONSTRAINT `FKFA8CE782FE151EE6` FOREIGN KEY (`posicion_id`) REFERENCES `banda_nivel_posicion` (`id`),
  CONSTRAINT `FKFA8CE78278D7510F` FOREIGN KEY (`competencia_nivel_id`) REFERENCES `competencia_nivel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banda_nivel_posicion_competencia_nivel`
--

LOCK TABLES `banda_nivel_posicion_competencia_nivel` WRITE;
/*!40000 ALTER TABLE `banda_nivel_posicion_competencia_nivel` DISABLE KEYS */;
INSERT INTO `banda_nivel_posicion_competencia_nivel` VALUES (1,0,21,'2013-08-31 14:57:38','2013-08-31 14:57:38',21),(2,0,12,'2013-08-31 14:57:38','2013-08-31 14:57:38',21),(3,0,9,'2013-08-31 14:57:38','2013-08-31 14:57:38',21),(4,0,23,'2013-08-31 14:57:38','2013-08-31 14:57:38',21),(5,0,68,'2013-08-31 14:57:38','2013-08-31 14:57:38',21),(6,0,42,'2013-08-31 14:57:38','2013-08-31 14:57:38',21),(7,0,20,'2013-08-31 14:57:38','2013-08-31 14:57:38',30),(8,0,11,'2013-08-31 14:57:38','2013-08-31 14:57:38',30),(9,0,9,'2013-08-31 14:57:38','2013-08-31 14:57:38',30),(10,0,23,'2013-08-31 14:57:38','2013-08-31 14:57:38',30),(11,0,68,'2013-08-31 14:57:38','2013-08-31 14:57:38',30),(12,0,41,'2013-08-31 14:57:38','2013-08-31 14:57:38',30),(13,0,20,'2013-08-31 14:57:38','2013-08-31 14:57:38',37),(14,0,10,'2013-08-31 14:57:38','2013-08-31 14:57:38',37),(15,0,8,'2013-08-31 14:57:38','2013-08-31 14:57:38',37),(16,0,22,'2013-08-31 14:57:38','2013-08-31 14:57:38',37),(17,0,67,'2013-08-31 14:57:38','2013-08-31 14:57:38',37),(18,0,41,'2013-08-31 14:57:38','2013-08-31 14:57:38',37),(19,0,19,'2013-08-31 14:57:38','2013-08-31 14:57:38',44),(20,0,10,'2013-08-31 14:57:38','2013-08-31 14:57:38',44),(21,0,7,'2013-08-31 14:57:38','2013-08-31 14:57:38',44),(22,0,22,'2013-08-31 14:57:38','2013-08-31 14:57:38',44),(23,0,67,'2013-08-31 14:57:38','2013-08-31 14:57:38',44),(24,0,40,'2013-08-31 14:57:38','2013-08-31 14:57:38',44),(25,0,33,'2013-08-31 14:57:38','2013-08-31 14:57:38',11),(26,0,27,'2013-08-31 14:57:38','2013-08-31 14:57:38',11),(27,0,29,'2013-08-31 14:57:38','2013-08-31 14:57:38',11),(28,0,5,'2013-08-31 14:57:38','2013-08-31 14:57:38',11),(29,0,24,'2013-08-31 14:57:38','2013-08-31 14:57:38',11),(30,0,63,'2013-08-31 14:57:38','2013-08-31 14:57:38',11),(31,0,42,'2013-08-31 14:57:38','2013-08-31 14:57:38',11),(32,0,32,'2013-08-31 14:57:38','2013-08-31 14:57:38',20),(33,0,27,'2013-08-31 14:57:38','2013-08-31 14:57:38',20),(34,0,29,'2013-08-31 14:57:38','2013-08-31 14:57:38',20),(35,0,5,'2013-08-31 14:57:38','2013-08-31 14:57:38',20),(36,0,23,'2013-08-31 14:57:38','2013-08-31 14:57:38',20),(37,0,62,'2013-08-31 14:57:38','2013-08-31 14:57:38',20),(38,0,42,'2013-08-31 14:57:38','2013-08-31 14:57:38',20),(39,0,32,'2013-08-31 14:57:38','2013-08-31 14:57:38',29),(40,0,26,'2013-08-31 14:57:38','2013-08-31 14:57:38',29),(41,0,28,'2013-08-31 14:57:38','2013-08-31 14:57:38',29),(42,0,4,'2013-08-31 14:57:38','2013-08-31 14:57:38',29),(43,0,23,'2013-08-31 14:57:38','2013-08-31 14:57:38',29),(44,0,62,'2013-08-31 14:57:38','2013-08-31 14:57:38',29),(45,0,41,'2013-08-31 14:57:38','2013-08-31 14:57:38',29),(46,0,31,'2013-08-31 14:57:38','2013-08-31 14:57:38',38),(47,0,25,'2013-08-31 14:57:38','2013-08-31 14:57:38',38),(48,0,28,'2013-08-31 14:57:38','2013-08-31 14:57:38',38),(49,0,4,'2013-08-31 14:57:38','2013-08-31 14:57:38',38),(50,0,22,'2013-08-31 14:57:38','2013-08-31 14:57:38',38),(51,0,61,'2013-08-31 14:57:38','2013-08-31 14:57:38',38),(52,0,41,'2013-08-31 14:57:38','2013-08-31 14:57:38',38),(53,0,21,'2013-08-31 14:57:38','2013-08-31 14:57:38',12),(54,0,12,'2013-08-31 14:57:38','2013-08-31 14:57:38',12),(55,0,9,'2013-08-31 14:57:38','2013-08-31 14:57:38',12),(56,0,24,'2013-08-31 14:57:38','2013-08-31 14:57:38',12),(57,0,27,'2013-08-31 14:57:38','2013-08-31 14:57:38',12),(58,0,42,'2013-08-31 14:57:39','2013-08-31 14:57:39',12),(59,0,21,'2013-08-31 14:57:39','2013-08-31 14:57:39',23),(60,0,11,'2013-08-31 14:57:39','2013-08-31 14:57:39',23),(61,0,9,'2013-08-31 14:57:39','2013-08-31 14:57:39',23),(62,0,23,'2013-08-31 14:57:39','2013-08-31 14:57:39',23),(63,0,26,'2013-08-31 14:57:39','2013-08-31 14:57:39',23),(64,0,42,'2013-08-31 14:57:39','2013-08-31 14:57:39',23),(65,0,20,'2013-08-31 14:57:39','2013-08-31 14:57:39',31),(66,0,11,'2013-08-31 14:57:39','2013-08-31 14:57:39',31),(67,0,8,'2013-08-31 14:57:39','2013-08-31 14:57:39',31),(68,0,23,'2013-08-31 14:57:39','2013-08-31 14:57:39',31),(69,0,26,'2013-08-31 14:57:39','2013-08-31 14:57:39',31),(70,0,41,'2013-08-31 14:57:39','2013-08-31 14:57:39',31),(71,0,20,'2013-08-31 14:57:39','2013-08-31 14:57:39',39),(72,0,10,'2013-08-31 14:57:39','2013-08-31 14:57:39',39),(73,0,8,'2013-08-31 14:57:39','2013-08-31 14:57:39',39),(74,0,22,'2013-08-31 14:57:39','2013-08-31 14:57:39',39),(75,0,25,'2013-08-31 14:57:39','2013-08-31 14:57:39',39),(76,0,40,'2013-08-31 14:57:39','2013-08-31 14:57:39',39),(77,0,19,'2013-08-31 14:57:39','2013-08-31 14:57:39',45),(78,0,10,'2013-08-31 14:57:39','2013-08-31 14:57:39',45),(79,0,7,'2013-08-31 14:57:39','2013-08-31 14:57:39',45),(80,0,22,'2013-08-31 14:57:39','2013-08-31 14:57:39',45),(81,0,25,'2013-08-31 14:57:39','2013-08-31 14:57:39',45),(82,0,40,'2013-08-31 14:57:39','2013-08-31 14:57:39',45),(83,0,24,'2013-08-31 14:57:39','2013-08-31 14:57:39',13),(84,0,6,'2013-08-31 14:57:39','2013-08-31 14:57:39',13),(85,0,15,'2013-08-31 14:57:39','2013-08-31 14:57:39',13),(86,0,66,'2013-08-31 14:57:39','2013-08-31 14:57:39',13),(87,0,42,'2013-08-31 14:57:39','2013-08-31 14:57:39',13),(88,0,23,'2013-08-31 14:57:39','2013-08-31 14:57:39',24),(89,0,6,'2013-08-31 14:57:39','2013-08-31 14:57:39',24),(90,0,14,'2013-08-31 14:57:39','2013-08-31 14:57:39',24),(91,0,66,'2013-08-31 14:57:39','2013-08-31 14:57:39',24),(92,0,42,'2013-08-31 14:57:39','2013-08-31 14:57:39',24),(93,0,23,'2013-08-31 14:57:39','2013-08-31 14:57:39',32),(94,0,5,'2013-08-31 14:57:39','2013-08-31 14:57:39',32),(95,0,14,'2013-08-31 14:57:39','2013-08-31 14:57:39',32),(96,0,65,'2013-08-31 14:57:39','2013-08-31 14:57:39',32),(97,0,41,'2013-08-31 14:57:39','2013-08-31 14:57:39',32),(98,0,22,'2013-08-31 14:57:39','2013-08-31 14:57:39',40),(99,0,5,'2013-08-31 14:57:39','2013-08-31 14:57:39',40),(100,0,14,'2013-08-31 14:57:39','2013-08-31 14:57:39',40),(101,0,64,'2013-08-31 14:57:39','2013-08-31 14:57:39',40),(102,0,40,'2013-08-31 14:57:39','2013-08-31 14:57:39',40),(103,0,22,'2013-08-31 14:57:39','2013-08-31 14:57:39',46),(104,0,4,'2013-08-31 14:57:39','2013-08-31 14:57:39',46),(105,0,13,'2013-08-31 14:57:39','2013-08-31 14:57:39',46),(106,0,64,'2013-08-31 14:57:39','2013-08-31 14:57:39',46),(107,0,40,'2013-08-31 14:57:39','2013-08-31 14:57:39',46),(108,0,83,'2013-08-31 14:57:39','2013-08-31 14:57:39',57),(109,0,81,'2013-08-31 14:57:39','2013-08-31 14:57:39',57),(110,0,78,'2013-08-31 14:57:39','2013-08-31 14:57:39',57),(111,0,23,'2013-08-31 14:57:39','2013-08-31 14:57:39',57),(112,0,8,'2013-08-31 14:57:39','2013-08-31 14:57:39',57),(113,0,87,'2013-08-31 14:57:39','2013-08-31 14:57:39',57),(114,0,83,'2013-08-31 14:57:39','2013-08-31 14:57:39',59),(115,0,80,'2013-08-31 14:57:39','2013-08-31 14:57:39',59),(116,0,77,'2013-08-31 14:57:39','2013-08-31 14:57:39',59),(117,0,22,'2013-08-31 14:57:39','2013-08-31 14:57:39',59),(118,0,8,'2013-08-31 14:57:39','2013-08-31 14:57:39',59),(119,0,86,'2013-08-31 14:57:39','2013-08-31 14:57:39',59),(120,0,82,'2013-08-31 14:57:39','2013-08-31 14:57:39',61),(121,0,79,'2013-08-31 14:57:39','2013-08-31 14:57:39',61),(122,0,76,'2013-08-31 14:57:39','2013-08-31 14:57:39',61),(123,0,22,'2013-08-31 14:57:39','2013-08-31 14:57:39',61),(124,0,7,'2013-08-31 14:57:39','2013-08-31 14:57:39',61),(125,0,86,'2013-08-31 14:57:39','2013-08-31 14:57:39',61),(126,0,19,'2013-08-31 14:57:39','2013-08-31 14:57:39',51),(127,0,11,'2013-08-31 14:57:39','2013-08-31 14:57:39',51),(128,0,8,'2013-08-31 14:57:39','2013-08-31 14:57:39',51),(129,0,23,'2013-08-31 14:57:39','2013-08-31 14:57:39',51),(130,0,84,'2013-08-31 14:57:39','2013-08-31 14:57:39',51),(131,0,40,'2013-08-31 14:57:39','2013-08-31 14:57:39',51),(132,0,87,'2013-08-31 14:57:39','2013-08-31 14:57:39',51),(133,0,19,'2013-08-31 14:57:39','2013-08-31 14:57:39',54),(134,0,10,'2013-08-31 14:57:39','2013-08-31 14:57:39',54),(135,0,7,'2013-08-31 14:57:39','2013-08-31 14:57:39',54),(136,0,22,'2013-08-31 14:57:39','2013-08-31 14:57:39',54),(137,0,83,'2013-08-31 14:57:39','2013-08-31 14:57:39',54),(138,0,40,'2013-08-31 14:57:39','2013-08-31 14:57:39',54),(139,0,86,'2013-08-31 14:57:39','2013-08-31 14:57:39',54);
/*!40000 ALTER TABLE `banda_nivel_posicion_competencia_nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banda_profesional`
--

DROP TABLE IF EXISTS `banda_profesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banda_profesional` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banda_profesional`
--

LOCK TABLES `banda_profesional` WRITE;
/*!40000 ALTER TABLE `banda_profesional` DISABLE KEYS */;
INSERT INTO `banda_profesional` VALUES (1,0,'2013-08-31 14:57:37','2013-08-31 14:57:37','Banda I'),(2,0,'2013-08-31 14:57:37','2013-08-31 14:57:37','Banda II'),(3,0,'2013-08-31 14:57:37','2013-08-31 14:57:37','Banda III'),(4,0,'2013-08-31 14:57:37','2013-08-31 14:57:37','Banda IV'),(5,0,'2013-08-31 14:57:37','2013-08-31 14:57:37','Banda V');
/*!40000 ALTER TABLE `banda_profesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,0,'2013-08-31 14:57:42','2013-08-31 14:57:42','Contrataciones'),(2,0,'2013-08-31 14:57:42','2013-08-31 14:57:42','Anuncios');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_educativo`
--

DROP TABLE IF EXISTS `centro_educativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_educativo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_educativo`
--

LOCK TABLES `centro_educativo` WRITE;
/*!40000 ALTER TABLE `centro_educativo` DISABLE KEYS */;
INSERT INTO `centro_educativo` VALUES (1,0,'2013-08-31 14:57:39','2013-08-31 14:57:39','Universidad de Alcalá de Henares','Esp',NULL),(2,0,'2013-08-31 14:57:39','2013-08-31 14:57:39','Universidad Complutense de Madrid','Esp',NULL),(3,0,'2013-08-31 14:57:39','2013-08-31 14:57:39','Universidad Politécnica de Madrid','CR',NULL),(4,0,'2013-08-31 14:57:39','2013-08-31 14:57:39','Universidad de Costa Rica','CR',NULL),(5,0,'2013-08-31 14:57:39','2013-08-31 14:57:39','Universidad Latina','CR',NULL),(6,0,'2013-08-31 14:57:39','2013-08-31 14:57:39','Instituto Tecnológico de Costa Rica','CR',NULL);
/*!40000 ALTER TABLE `centro_educativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,0,NULL,'2013-08-31 14:57:42',NULL,'2013-08-31 14:57:42','Cliente 1',NULL,NULL),(2,0,NULL,'2013-08-31 14:57:42',NULL,'2013-08-31 14:57:42','Cliente Interno',NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador`
--

DROP TABLE IF EXISTS `colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador` (
  `id` bigint(20) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `comentarios` varchar(1000) NOT NULL,
  `date_created` datetime NOT NULL,
  `departamento_id` bigint(20) DEFAULT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `posicion_id` bigint(20) DEFAULT NULL,
  `primer_nombre` varchar(100) NOT NULL,
  `segundo_nombre` varchar(100) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6D7AB28A5650DE70` (`departamento_id`),
  KEY `FK6D7AB28AFE151EE6` (`posicion_id`),
  CONSTRAINT `FK6D7AB28AFE151EE6` FOREIGN KEY (`posicion_id`) REFERENCES `banda_nivel_posicion` (`id`),
  CONSTRAINT `FK6D7AB28A5650DE70` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador`
--

LOCK TABLES `colaborador` WRITE;
/*!40000 ALTER TABLE `colaborador` DISABLE KEYS */;
INSERT INTO `colaborador` VALUES (2,'Rodriguez','','2013-08-31 14:57:40',3,'1981-03-26 00:00:00','2013-08-31 14:57:40',61,'Jesus','','111-11-11'),(3,'Apellido1','','2013-08-31 14:57:40',2,'1985-02-15 00:00:00','2013-08-31 14:57:40',41,'Maria','','222-22-22'),(4,'usuario1','','2013-08-31 14:57:40',4,'1979-07-16 00:00:00','2013-08-31 14:57:40',11,'USUARIO1','','333-33-33'),(5,'usuario2','','2013-08-31 14:57:41',1,'1984-12-11 00:00:00','2013-08-31 14:57:41',46,'USUARIO2','','111-11-11'),(6,'usuario3','','2013-08-31 14:57:41',1,'1958-09-05 00:00:00','2013-08-31 14:57:41',44,'USUARIO3','','111-11-11'),(7,'usuario4','','2013-08-31 14:57:41',5,'1980-01-25 00:00:00','2013-08-31 14:57:41',54,'USUARIO4','','111-11-11'),(8,'usuario5','','2013-08-31 14:57:41',4,'1980-01-25 00:00:00','2013-08-31 14:57:41',57,'USUARIO5','','111-11-11'),(9,'usuario6','','2013-08-31 14:57:41',5,'1980-01-25 00:00:00','2013-08-31 14:57:41',21,'USUARIO6','','111-11-11');
/*!40000 ALTER TABLE `colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_colaborador`
--

DROP TABLE IF EXISTS `colaborador_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_colaborador` (
  `colaborador_seguido_id` bigint(20) DEFAULT NULL,
  `colaborador_id` bigint(20) DEFAULT NULL,
  KEY `FKFC084455CA073D1E` (`colaborador_seguido_id`),
  KEY `FKFC084455E7E241F3` (`colaborador_id`),
  CONSTRAINT `FKFC084455E7E241F3` FOREIGN KEY (`colaborador_id`) REFERENCES `colaborador` (`id`),
  CONSTRAINT `FKFC084455CA073D1E` FOREIGN KEY (`colaborador_seguido_id`) REFERENCES `colaborador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_colaborador`
--

LOCK TABLES `colaborador_colaborador` WRITE;
/*!40000 ALTER TABLE `colaborador_colaborador` DISABLE KEYS */;
/*!40000 ALTER TABLE `colaborador_colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_competencia_nivel`
--

DROP TABLE IF EXISTS `colaborador_competencia_nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_competencia_nivel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `colaborador_id` bigint(20) NOT NULL,
  `competencia_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `competencia_id` (`competencia_id`,`colaborador_id`),
  KEY `FKFB6B7C2E7E241F3` (`colaborador_id`),
  KEY `FKFB6B7C2CC117BF2` (`competencia_id`),
  CONSTRAINT `FKFB6B7C2CC117BF2` FOREIGN KEY (`competencia_id`) REFERENCES `competencia_nivel` (`id`),
  CONSTRAINT `FKFB6B7C2E7E241F3` FOREIGN KEY (`colaborador_id`) REFERENCES `colaborador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_competencia_nivel`
--

LOCK TABLES `colaborador_competencia_nivel` WRITE;
/*!40000 ALTER TABLE `colaborador_competencia_nivel` DISABLE KEYS */;
INSERT INTO `colaborador_competencia_nivel` VALUES (1,0,2,1,'2013-08-31 14:57:41','2013-08-31 14:57:41'),(2,0,2,26,'2013-08-31 14:57:41','2013-08-31 14:57:41'),(3,0,2,7,'2013-08-31 14:57:41','2013-08-31 14:57:41'),(4,0,2,22,'2013-08-31 14:57:41','2013-08-31 14:57:41'),(5,0,2,77,'2013-08-31 14:57:41','2013-08-31 14:57:41'),(6,0,2,79,'2013-08-31 14:57:41','2013-08-31 14:57:41'),(7,0,2,83,'2013-08-31 14:57:41','2013-08-31 14:57:41'),(8,0,3,6,'2013-08-31 14:57:41','2013-08-31 14:57:41');
/*!40000 ALTER TABLE `colaborador_competencia_nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_curso`
--

DROP TABLE IF EXISTS `colaborador_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_curso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `colaborador_id` bigint(20) NOT NULL,
  `curso_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `estado_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `colaborador_id` (`colaborador_id`,`curso_id`),
  KEY `FK2B0F86A7AFC668B3` (`estado_id`),
  KEY `FK2B0F86A72454411D` (`curso_id`),
  KEY `FK2B0F86A7E7E241F3` (`colaborador_id`),
  CONSTRAINT `FK2B0F86A7E7E241F3` FOREIGN KEY (`colaborador_id`) REFERENCES `colaborador` (`id`),
  CONSTRAINT `FK2B0F86A72454411D` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`),
  CONSTRAINT `FK2B0F86A7AFC668B3` FOREIGN KEY (`estado_id`) REFERENCES `colaborador_curso_estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_curso`
--

LOCK TABLES `colaborador_curso` WRITE;
/*!40000 ALTER TABLE `colaborador_curso` DISABLE KEYS */;
INSERT INTO `colaborador_curso` VALUES (1,0,2,1,'2013-08-31 14:57:41',1,'2013-08-31 14:57:41'),(2,0,2,2,'2013-08-31 14:57:41',2,'2013-08-31 14:57:41'),(3,0,3,1,'2013-08-31 14:57:41',2,'2013-08-31 14:57:41'),(4,0,3,2,'2013-08-31 14:57:41',3,'2013-08-31 14:57:41');
/*!40000 ALTER TABLE `colaborador_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_curso_estado`
--

DROP TABLE IF EXISTS `colaborador_curso_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_curso_estado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_curso_estado`
--

LOCK TABLES `colaborador_curso_estado` WRITE;
/*!40000 ALTER TABLE `colaborador_curso_estado` DISABLE KEYS */;
INSERT INTO `colaborador_curso_estado` VALUES (1,0,'2013-08-31 14:57:39','2013-08-31 14:57:39','Matriculado'),(2,0,'2013-08-31 14:57:39','2013-08-31 14:57:39','Aprobado'),(3,0,'2013-08-31 14:57:39','2013-08-31 14:57:39','Reprobado');
/*!40000 ALTER TABLE `colaborador_curso_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencia`
--

DROP TABLE IF EXISTS `competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `descripcion` varchar(2000) NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `FKBE7A6234E0978310` (`tipo_id`),
  CONSTRAINT `FKBE7A6234E0978310` FOREIGN KEY (`tipo_id`) REFERENCES `competencia_tipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencia`
--

LOCK TABLES `competencia` WRITE;
/*!40000 ALTER TABLE `competencia` DISABLE KEYS */;
INSERT INTO `competencia` VALUES (1,0,'2013-08-31 14:57:36','Capacidad para realizar un análisis lógico, sistemático y estructurado de una situación o problema hasta llegar a determinar, las posibles causas o alternativas de solución de esta situación o dificultad.','2013-08-31 14:57:36','Análisis y Solución de Problemas',1),(2,0,'2013-08-31 14:57:36','Capacidad para atender e indentificar los detalles relevantes en una tarea. Implica la habilidad para detectar de manera rápida y oportunida los posibles errores en el manejo de la información.','2013-08-31 14:57:36','Atención al detalle',1),(3,0,'2013-08-31 14:57:36','Capacidad para persuadir a otras personas, utilizar argumentos sólidos y honestos y acercar posisciones mediante el ejercicio del razonamiento conjunto, que contemple los intereses de todas las partes intervinientes y los objetivos organizacionales. Implica la capacidad para influenciar a otros a través de estrategias que permitan construir acuerdos satisfactorios para todos, mediante la aplicación del concepto ganar-ganar.','2013-08-31 14:57:36','Capacidad de negociación',1),(4,0,'2013-08-31 14:57:36','Capacidad para escuchar y entender al otro, para transmitir en forma clara y oportuna la información requerida por los demás a fin de alcanzar los objetivos organizacionales, y para mantener canales de comunicación abiertos y redes de contacto formales e informales, que abarquen los diferentes niveles de la organización.','2013-08-31 14:57:36','Comunicación Eficaz',1),(5,0,'2013-08-31 14:57:36','Capacidad para actuar proactivamente, idear e implementar soluciones a nuevas problemáticas y/o retos, con decisión e independecia de criterio. Generar ideas, desarrollarlas, enriquecerlas, someterlas a crítica y a juicio, implantarlas para construir con ellas soluciones a problemas planteados u oportunidades de innovación.','2013-08-31 14:57:36','Iniciativa',1),(6,0,'2013-08-31 14:57:36','Capacidad para comprender y apreciar perspectivas diferentes, cambiar convicciones y conductas a fin de adaptarse en forma rápida y eficiente a diversas situaciones, contextos, medios y personas.','2013-08-31 14:57:36','Flexibilidad',1),(7,0,'2013-08-31 14:57:36','Capacidad para actuar con sensibilidad ante las necesidades de un cliente y/o conjunto de clientes actuales o potenciales (ya sea internos o externos). Implica una vocación permanente de servicio al cliente, comprender adecuadamente sus demandas y generar soluciones efectivas a sus necesidades.','2013-08-31 14:57:36','Orientación al Cliente',1),(8,0,'2013-08-31 14:57:36','Capacidad para orientar los comportamientos propios o de los demás hacia el logro o superación de los resultados esperados, bajo estándares de calidad establecidos, fijar metas desafiantes, mejorar y mantener altos niveles de rendimientos en el marco de la estrategia de la organización. Implica establecer indicadores de logro y hacer seguimiento permanente, enfocado en una mejora continua.','2013-08-31 14:57:36','Orientación al Logro',1),(9,0,'2013-08-31 14:57:36','Capacidad para fijar metas y prioridades a la hora de realizar una tarea, desarrollar un área o un proyecto conviniendo la acción, los plazos y los recursos que se deben utilizar. Capacidad para poner en marcha cuando se tiene que hacer concurrir las acciones coordinadas de un conjunto de personas, en tiempo y costes efectivos de modo que se aprovechen del modo más eficiente posible los esfuerzos y se alcancen los objetivos.','2013-08-31 14:57:36','Organización y Planificación',1),(10,0,'2013-08-31 14:57:36','Capacidad para colaborar con los demás, formar parte de un grupo y trabajar con otras áreas de la organización con el propósito de alcanzar, en conjunto, la estrategia organizacional. Implica tener expectativas positivas respecto de los demás, comprender a los otros, y generar y matener un buen clima de trabajo.','2013-08-31 14:57:36','Trabajo en equipo',1),(11,0,'2013-08-31 14:57:36','Capacidad para trabajar con determinación, firmeza y perseverancia a fin de alcanzar objetivos difíciles o para concretar aaciones/ decisiones que requieran un compromiso y esfuerzo mayores que los habituales. Implica mantener un alto nivel de compromiso y esfuerzo mayores que los habituales. Implica matener un alto nivel de desempeño aún en situaciones exigentes y cambiantes.','2013-08-31 14:57:36','Tolerancia a la presión',1),(12,0,'2013-08-31 14:57:36','Conocimiento teórico y práctico para la gestión de proyectos de acuerdo a las mejores prácticas. Capacidad de adaptar un modelo estándar de administracion de proyectos a las particularidades de cada proyecto, manteniendo siempre los principios y buenas prácticas. Implica conocer ampliamente el modelo de gestion de proyectos, sus fases y entregables, asi como las partes involucradas con sus responsabilidades. Debe tener la capacidad de planificar de acuerdo a la realidad y brindar un excelente seguimiento a cada etapa del proyecto, tomando las medidas correctivas que sean requeridas antes de impactar de forma negativa el proyecto.','2013-08-31 14:57:36','Administración de proyectos',2),(13,0,'2013-08-31 14:57:36','Conocimiento técnico avanzado y amplia experiencia práctica en la implementación de soluciones en las área de seguridad McAfee, Colaboracion o Infraestructura. Capacidad de realizar un diseño y dimensionamiento apropiado en un escenario dado con alguna de estas soluciones, proporcionando los requerimientos técnicos y esfuerzo requerido para implementar la solución de la mejor forma posible.','2013-08-31 14:57:36','Conocimiento en diseño y arquitectura de soluciones',2),(14,0,'2013-08-31 14:57:36','Capacidad para conocer los productos y/o servicios de la organización y evaluar la factibilidad de su adaptación a los requerimientos, preferencias y necesidades de los clientes. Implica la capacidad para relacionar las ventajas de los productos o servicios que se ofrecen con las necesidades de los clientes y presentar propuestas o soluciones que agreguen valor.','2013-08-31 14:57:36','Conocimiento de los productos Compañía',2),(15,0,'2013-08-31 14:57:36','Conocimiento de conceptos, principios y modelos de redes de datos. Entendimiento de una infraestructura de comunicaciones y la interaccion de los servicios tecnológicos dentro de la misma.','2013-08-31 14:57:36','Conocimiento en redes',2),(16,0,'2013-08-31 14:57:36','Conocimientos de los principales elementos que conforman una infraestructura tecnológica tales como: datacenter, nube privada, DNS, DHCP, Servicio de Directorio, dominio, virtualizacion, servicio de correo electronico, internet, entre otros.','2013-08-31 14:57:36','Conocimientos en Infraestructura',2),(17,0,'2013-08-31 14:57:36','Conocimiento teórico y práctico en las soluciones de infraestructura Microsoft: introduccion, instalacion, configuracion, diseño, resolucion de problemas.','2013-08-31 14:57:36','Conocimiento en soluciones de infraestructura Microsoft',2),(18,0,'2013-08-31 14:57:36','Conocimiento teórico y práctico en las soluciones de seguridad McAfee: introduccion, instalacion, configuracion, diseño, resolucion de problemas.','2013-08-31 14:57:36','Conocimientos en soluciones de Seguridad McAfee',2),(19,0,'2013-08-31 14:57:36','Conocimientos de los principales elementos que conforman Share Point tales como: Herramientas de redes sociales, Integración con sistemas externos, Construcción de soluciones no-código, automatización de formularios electrónicos, Inteligencia de negocios, Búsqueda empresarial, Administración de contenido/Arquitectura de información, Herramientas de colaboración, Infraestructura y diseño de sitios web, Bases de datos basadas en Microsoft SQL Server,ASP.NET e Internet Information Services.','2013-08-31 14:57:36','Conocimiento en soluciones Share Point',2),(20,0,'2013-08-31 14:57:36','Conocimiento técnico en soluciones de TI especializadas y puntuales tales como Microsoft Office 365.','2013-08-31 14:57:36','Conocimientos en soluciones técnicas especializadas',2),(21,0,'2013-08-31 14:57:36','Conocmiiento de los procesos de contratación administrativa desde el inicio hasta su finalización del proceso, capacidad para redactar nomas y formalizar contratos, tramitar documentos en Instituciones Públicas, puede realiar consultas escritas y verbales','2013-08-31 14:57:36','Conocimientos contratación administrativa',2),(22,0,'2013-08-31 14:57:36','Conocimiento para realizar la venta por teléfono de servicios y/o productos, considerando las características del cliente, las técnicas de venta adecuadas y los requerimientos de la empresa.','2013-08-31 14:57:36','Conocimientos telemarketing',2),(23,0,'2013-08-31 14:57:36','Conocimiento de ventas consultivas, técnicas de comunicación como herramienta base para creación de nuevas oportunidades y cierre de negocios, así como mantenimiento de cartea activa de clientes.','2013-08-31 14:57:36','Conocimientos ventas efectivas',2),(24,0,'2013-08-31 14:57:36','Conocimiento y puesta en práctica de actividades de apoyo administrativo en el ámbito de la actividad comercial.','2013-08-31 14:57:36','Conocimientos back office',2),(25,0,'2013-08-31 14:57:36','Conocimiento técnico y experiencia en análisis, interpretación y aplicación de información contable, aplicación de técnicas e interpretación de Estados Financieros.','2013-08-31 14:57:36','Conocimientos contables',2),(26,0,'2013-08-31 14:57:36','Capacidad para analizar las diversas variantes u opciones, considerar las circunstancias axistentes, los recursos disponibles y su impacto en la compañía, para luego seleccionar la alternativa más adecuada, con el fin de lograr el mejor resultado en función de los objetivos organizacionales. Implica capacidad para ejecutar las acciones con calidad, oportunidad y conciencia acerca de las posibles consecuencias de la decisión tomada.','2013-08-31 14:57:36','Toma de decisiones',3),(27,0,'2013-08-31 14:57:36','Capacidad para integrar, desarrollar, consolidar y conducir con éxito un equipo de trabajo y alentar a sus integrantes a actuar con responsabilidad. Implica la capacidad para coordinar, distribuir y delegar adecuadamente las tareas en el equipo, en función de las competencias y conocimientos de cada integrante, estipular plazos de cumplimiento y dirigir las acciones del grupo hacia una meta u objetivo determinado.','2013-08-31 14:57:36','Dirección de equipos',3),(28,0,'2013-08-31 14:57:36','Capacidad para generar compromiso y lograr el respaldo de sus superiores con vistas a enfrentar con éxito los desafíos de la organización. Capacidad para asegurar una adecuada conducción de personas, desarrollar el talento y lograr mantener un clima organizacional armónico y desafiante.','2013-08-31 14:57:36','Liderazgo',3),(29,0,'2013-08-31 14:57:36','Capacidad para anticiparse y comprender los cambios del entorno, y establecer su impacto a corto, mediano y largo plazo en la organización, con el propósito de optimizar las fortalezas, actuar sobre las debilidades y aprovechar oportunidades del contexto. Implica la capacidad para visualizar y conducir el área a cargo como un sistema integral, para lograr los objetivos y metas retadoras, asociados a la estrategia y objetivos corporativos.','2013-08-31 14:57:36','Visión Estratégica',3);
/*!40000 ALTER TABLE `competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencia_nivel`
--

DROP TABLE IF EXISTS `competencia_nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencia_nivel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `competencia_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `descripcion` varchar(2000) NOT NULL,
  `last_updated` datetime NOT NULL,
  `nivel_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `competencia_id` (`competencia_id`,`nivel_id`),
  KEY `FK4C8EA37C4AA97BC` (`competencia_id`),
  KEY `FK4C8EA3759EA5B91` (`nivel_id`),
  CONSTRAINT `FK4C8EA3759EA5B91` FOREIGN KEY (`nivel_id`) REFERENCES `niveles_competencias` (`id`),
  CONSTRAINT `FK4C8EA37C4AA97BC` FOREIGN KEY (`competencia_id`) REFERENCES `competencia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencia_nivel`
--

LOCK TABLES `competencia_nivel` WRITE;
/*!40000 ALTER TABLE `competencia_nivel` DISABLE KEYS */;
INSERT INTO `competencia_nivel` VALUES (1,0,1,'2013-08-31 14:57:36','Identifica problemas con gran facilidad, propone y contruye soluciones a problemas en diversos ámbitos con una visión global, es capaz de formular preguntas clave en vistas de definir el problema y valorar su magnitud, posee eficacia y agilidad para dar soluciones a estos problemas, emprendiendo las acciones correctivas necesarias con sentido común e iniciativa.','2013-08-31 14:57:36',1),(2,0,1,'2013-08-31 14:57:36','Identifica con facilidad lo que es un problema, utiliza su experiencia y criterio para analizar las causas de un problema. Es capaz de realizar preguntas adecuadas para definir el problema, es capaz de recoger la información que necesita y analizarla correctamente, es capaz de dar solución a los problemas emprendiendo acciones correctivas que sean eficientes y eficaces.','2013-08-31 14:57:36',2),(3,0,1,'2013-08-31 14:57:36','Posee la capacidad para identificar lo que es y no es un problema, lo analiza y recoge información significativa con el fin de abordarlo generando alternativas de solución, no siempre sigue un método de análisis, sin embargo, generalmente es capaz de dar solución a los problemas aplicando los métodos aprendidos','2013-08-31 14:57:36',3),(4,0,2,'2013-08-31 14:57:36','Destina tiempo a informar sobre las consecuencias para la organización y clientes de los errores en el trabajo. Busca concientizar a los demás sobre la importancia de los procedimientos, como es la relevancia de entregar información completa, ordenada y oportuna en temas sobre nuevas y mejores prácticas en el trabajo.','2013-08-31 14:57:36',1),(5,0,2,'2013-08-31 14:57:36','Da especial atención a la revisión de detalles, es detallista y ordenado en su trabajo. Una vez identificado un errore se ingenia posibles maneras de preveerlo y compete a los demás a su implementación.','2013-08-31 14:57:36',2),(6,0,2,'2013-08-31 14:57:36','Trabaja con rapidez y minuciosidad detectando y corrigiendo errores que puedan interferir o identificar los procedimientos.','2013-08-31 14:57:36',3),(7,0,3,'2013-08-31 14:57:36','Posee la capacidad para persuadir a otras personas y exhibir actitudes que generen un impacto positivo en los demás a fin de producir cambios de opiniones, enfoques o posturas mediante la utilización de argumentos sólidos y honestos. Capacidad para desarrollar conceptos y explicaciones fundadas y veraces, dirigidos a respaldar posiciones y criterios. Capacidad para inclinar y acercar posiciones mediante el ejercicio del razonamiento conjunto, y contemplar los intereses de todas las partes intervinentes y los objetivos organizacionales como base para alcanzar el resultado esperado. Capacidad para desarrollar estrategias complejas que le permitan influencia a otros y construir acuerdos satisfactorios para todas las partes, mediante la aplicación del concepto ganar-ganar.','2013-08-31 14:57:36',1),(8,0,3,'2013-08-31 14:57:36','Tiene la capacidad para persuadir a clientes y a otras personas mediante la utilización de argumentos sólidos y honestos. Capacidad para desarrollar, ante situaciones especiales, conceptos y explicaciones fundadas y veraces, dirigidos a respaldar posiciones y criterios. Capacidad para utilizar tales argumentaciones con el fin de inclinar y acercar posiciones mediante el ejercicio del razonamiento conjunto y contemplar los intereses de todas las partes intervinientes y los objetivos de la organización como base para alcanzar el resultado esperado. Capacidad pra influenciar a otros a través de estrategias que permitan construir acuerdos satisfactorios para todos al procurar utilizar técnicas basadas en el concepto ganar-ganar.','2013-08-31 14:57:36',2),(9,0,3,'2013-08-31 14:57:37','Posee la capacidad para persuadir a clientes y otras personas de las que necesita colaboración, a través de acciones concretas y argumentaciones adecuadas y honestas. Capacidad para llevar a cabo negociaciones que persuadan a la contraparte y contemplar sus intereses y los de la organización.','2013-08-31 14:57:37',3),(10,0,4,'2013-08-31 14:57:37','Tiene la capacidad para escuchar y entender al otro en forma clara y oportuna la información requerida por los demás a fin de lograr objetivos organizacionales, y para mantener siempre canales de comunicación abiertos. Posee la capacidad para adaptar su estilo comunicacional a las características particulares de la audiencia o el interlocutor. Tiene la capacidad para estructurar canales de comunicación organizacionales que permitan establecer relaciones en todos los sentidos y promover el intercambio inteligente y portuno de información necesaria para la consecución de los objetivos organizacionales.','2013-08-31 14:57:37',1),(11,0,4,'2013-08-31 14:57:37','Posee la capacidad para escuchar a los demás y para seleccionar los métodos más adecuados a fin de lograr comunicaciones efectivas. Capacidad para minimizar las barreras y distorsiones que afectan la circulación de la información. Capacidad para promover dentro de su sector el intercambio permanente de información con el propósito de mantener a todas las personas adecuadamente informadas acerca de los diferentes temas. Capacidad para hacer uso efectivo de los canales de comunicación existentes, tanto formales como informales. Capacidad para transmitir de manera efectiva y clara las ideas e información','2013-08-31 14:57:37',2),(12,0,4,'2013-08-31 14:57:37','Posee la capacidad para escuchar atentamente a sus interlocutores y comunicarse de manera clara y entendible. Capacidad para realizar las preguntas adecuadas a fin de obtener información que necesita y capacidad para transmitir sus ideas de manera clara y ordenada.','2013-08-31 14:57:37',3),(13,0,5,'2013-08-31 14:57:37','Propone permanentemente acciones e ideas, responde con rapidez a las situaciones tanto externas como internas de la organización, asegurando una efectiva respuesta, de forma clara y simple. Su iniciativa y rapidez transforman su accionar en una ventaja competitiva. Es creativo e innovador','2013-08-31 14:57:37',1),(14,0,5,'2013-08-31 14:57:37','Pone en marcha adecuadamente acciones y propone soluciones con el fin de resolver diferentes situaciones internas y externas de la organización. Tiene la capacidad de analizar situacones planteadas y elaborar planes de contingencia con el propósito de crear oportunidades y/o evitar problemas potenciales.','2013-08-31 14:57:37',2),(15,0,5,'2013-08-31 14:57:37','Posee la capacidad para actuar proactivamente y brindar soluciones a situaciones. Capacidad para responder con rapidez y eficiencia ante nuevos requerimientos. Capacidad para utilizar las aplicaciones tecnológicas, herramientas y recursos cuando sea pertinente,Generalmente pone en marcha las acciones que se le proponen, tiene tendencia a hacer aquellas actividades que considera obligatorias.','2013-08-31 14:57:37',3),(16,0,6,'2013-08-31 14:57:37','Capacidad para comprender y apreciar (otorgar un valor especial) perspectivas diferentes, cambiar convicciones y conductas a fin de adaptarse en forma rápida y eficiente a diversas situaciones, contextos (interno o externo a la organización), medios y personas. Capacidad para llevar a cabo una revisión crítica de las estrategias y objetivos de su propia actividad y la de su equipo de trabajo, proponer cambios cuando resulte necesario, a fin de lograr una adecuada adaptación a las nuevas situaciones. Implica realizar un revisión crítica de las estrategias de la organización en su conjunto y proponer los cambios pertinentes. Implica poseer la disposición de apoyar al resto del equipo y departamentos cuando se considere necesario para cumplir con los objetivos organizacionales.','2013-08-31 14:57:37',1),(17,0,6,'2013-08-31 14:57:37','Capacidad para comprender perspectivas diferentes, cambiar convicciones y conductas a fin de adaptarse en forma eficiente a diversas situaciones, contextos, medios y personas. Capacidad para llevar a cabo una revisión crítica de los objetivos bajo su responsabilidad, así como de su propia actividad y proponer cambios cuando resulte necesario, a fin de lograr una adecuada adaptación a las nuevas situaciones. Capacidad para ajustar su accionar a los objetivos de la organización y tener la disposición y disponibilidad de colaborar con diferentes tareas, situaciones y personas cuando sea requerido.','2013-08-31 14:57:37',2),(18,0,6,'2013-08-31 14:57:37','Capacidad para comprender perspectivas diferentes, cambiar convicciones y conductas a fin de adaptarse en forma eficiente a diversas situaciones, contextos, medios y personas . Capacidad para adecuarse y realizar nuevas tareas que le sean impuestas sin previa planificación.','2013-08-31 14:57:37',3),(19,0,7,'2013-08-31 14:57:37','Detecta necesidades en el cliente y logra que este lo reconozca y aprecie su valor agregado. Se muestra proactivo para atender con rapidez al cliente y su trato es muy cortés. Muestra inquietud por conocer con exactitud el punto de vista del cliente. Es orientado a diseñar procedimientos que brinden soluciones de excelencia para todos los clientes y lograr de ese modo reconocimiento en el mercado, en el cual aprecie el valor agregado ofrecido y reforzar de ese modo el prestigio organizacional. Posee la capacidad para constituirse en un referente por ofrecer soluciones que satisfacen tanto a los clientes internos como externos.','2013-08-31 14:57:37',1),(20,0,7,'2013-08-31 14:57:37','Identifica las necesidades del cliente, posee la capacidad para anticiparse a los pedidos de los clientes tanto internos como externos, demuestra interés en atender a los clientes con rapidez. Diagnostica correctamente la necesidad y plantea soluciones adecuadas. Genera satisfacción en el clientes.','2013-08-31 14:57:37',2),(21,0,7,'2013-08-31 14:57:37','Posee la capacidad para mantenerse atento y atender las necesidades de los clientes, escuchar sus problemas y brindar una respuesta efectiva en tiempo y a la medida de sus requerimientos, generalmente actúa a partir de los pedidos de los clientes.','2013-08-31 14:57:37',3),(22,0,8,'2013-08-31 14:57:37','Cumple los objetivos superando el promedio establecido, siempre va un paso más adelante en el camino de los objetivos fijados, preocupado por los resultados globales de la empresa. Emprende acciones de mejora, centrándose en la optimización de recursos, considerando todas las variables, utilizando metodologías para la planeación, seguimiento y verificación de la información. Se marca estándares de excelencia y posee la capacidad para realizar las mediciones pertinentes que permitan evaluar el logro de metas planteadas a través de la correcta utilización de las herramientas correspondientes. Capacidad para fomentar igual actitud en otros a través del ejemplo.','2013-08-31 14:57:37',1),(23,0,8,'2013-08-31 14:57:37','Posee la capacidad para fijarse a si mismo objetivos y metas retadoras y pose la capacidad para mantener una actitud constante orientada al logro o superación de los resultados esperados, según los estándares establecidos. Define prioridades, y tiene la capacidad para realizar el seguimiento de las labores propias a través del uso eficiente de las herramientas disponibles en la organización para tal fin.','2013-08-31 14:57:37',2),(24,0,8,'2013-08-31 14:57:37','Capacidad para demostrar a través de su comportamiento, una predisposición para realizar las acciones necesarias para alcanzar los objetivos asignados y cumplir metas. Capacidad para realizar el control de su propio trabajo.','2013-08-31 14:57:37',3),(25,0,9,'2013-08-31 14:57:37','Capacidad para conocer y organizar las actividades a realizar para conseguir los objetivos del trabajo/proyecto; define con claridad los objetivos de un trabajo / proyecto; Define con claridad el alcance y los entregables del trabajo/proyecto; Identifica las fases (componentes) del trabajo y las justifica; Define correctamente las actividades necesarias para realizar el trabajo. Estima la duración de las actividades según parámetros objetivos; establece una secuencia de las actividades según un orden lógico; desarrolla un cronograma de las actividades realista; cumple en tiempo y forma con las tareas; programa actividades secuenciales para conseguir objetivos. Se asegura de que cuenta con los recursos necesarios para realizar las actividades y cumplir con los plazos y objetivos planificados. Desarrolla y aplica técnicas de seguimiento y control de las actividades para adelantarse a los cambios reales que puedan producirse, modificar el calendario, durante la realización del trabajo/proyecto. Aplica técnicas de evaluación continua de los resultados del proyecto, toma medidas para la mejora, identifica desviaciones de resultados y documenta lecciones de experiencia para la mejora de la competencia.','2013-08-31 14:57:37',1),(26,0,9,'2013-08-31 14:57:37','Capacidad para definir los objetivos del trabajo y las actividades para lograrlos.Ordena las actividades según un orden lógico y realiza un cronograma de actividades realista. Aplica técnicas de control para realizar los controles y cambios necesarios en el calendario. Realiza una evaluación expost del trabajo realizado.','2013-08-31 14:57:37',2),(27,0,9,'2013-08-31 14:57:37','Capacidad para conocer y organizar las actividades a realizar para conseguir los objetivos del trabajo/proyecto. Estima la duración de las actividades según un orden lógico y realista. Conoce las técnicas de seguimiento y control. Realiza una evaluación expost del trabajo realizado. Pone en marcha acciones cuando es necesario realizarlas con tal de alcanzar los objetivos.','2013-08-31 14:57:37',3),(28,0,10,'2013-08-31 14:57:37','Capacidad para fomentar el espíritu de colaboración en toda la organización, ayuda a orientar el trabajo de pares a la consecución de los objetivos organizacionales y departamentales. Interactúa con los demás desarrollando un ambiente de trabajo amistoso, buen clima y espíritu de cooperación. Busca y comparte información, se abre a los demás para facilitar la comunicación. Capacidad para constituirse en un ejemplo de colaboración y cooperación en toda la organización, comprender a otros y generar y mantener un buen clima de trabajo.','2013-08-31 14:57:37',1),(29,0,10,'2013-08-31 14:57:37','Fomenta la colaboración y cooperación en su área de trabajo, en ocasiones orienta el trabajo de sus pares a la consecución de objetivos fijados, es capaz de priorizar los objetivos grupales a los individuales, sabe reconocer el éxito de otros, es comunicativo y comparte información. Mantiene un buen clima de trabajo con sus compañeros.','2013-08-31 14:57:37',2),(30,0,10,'2013-08-31 14:57:37','Posee la capacidad para colaborar y cooperar con otras personas, tanto de su área como de otras áreas de la organización con el propósito de alcanzar los objetivos fijados. Generalmente prioriza los objetivos individuales a los grupales.','2013-08-31 14:57:37',3),(31,0,11,'2013-08-31 14:57:37','Capacidad para trabajar con determinación, firmeza y perseverancia a fin de alcanzar objetivos difíciles con eficacia, diseñar políticas y procedimientos que permitan lleva a cabo los planes organizacionales en contextos complejos y tomar decisiones que requieren un compromiso y esfuerzo mayores que los habituales. Implica trabajar con energía y mantener un alto nivel de desempeño aun en situaciones exigentes y cambiantes, con interlocutores diversos que se suceden en cortos espacios de tiempo, a lo largo de jornadas prolongadas. También implica ser un ejemplo para la organización al cuidar las relaciones interpersonales en momento difíciles y motivar a otros a obrar del mismo modo, para lograr un clima laboral armónico y de alta productividad.','2013-08-31 14:57:37',1),(32,0,11,'2013-08-31 14:57:37','Capacidad para trabajar con determinación y perseverancia a fin de alcanzar objetivos difíciles con eficacia, diseñar procedimientos de trabajo que permitan llevar a cabo los planes del área o departamento en contextos complejos y tomar decisiones que requieren un compromiso y esfuerzo mayores que los habituales. Implica trabajar con energía y mantener un buen nivel de desempeño aun en situaciones exigentes y cambiantes, con interlocutores diversos que se suceden en cortos espacios de tiempo, a lo largo de jornadas prolongadas. Cuida las relaciones interpersonales en momentos difíciles.','2013-08-31 14:57:37',2),(33,0,11,'2013-08-31 14:57:37','Capacidad para trabajar con perseverancia y eficiencia a fin de alcanzar objetivos que se le han fijado, aun en contextos complejos. Implica trabajar con energía y mantener el nivel de desempeño esperando incluso en circunstancias exigentes y cambiantes, a lo largo de jornadas prolongadas.','2013-08-31 14:57:37',3),(34,0,12,'2013-08-31 14:57:37','Tiene amplia experiencia comprobable en administración de proyectos de tecnologías de información. Capacidad de identificar proactivamente riesgos y dificultades en los proyectos, así como tomar las medidas necesarias para evitarlas. Capacidad de proponer de forma proactiva mejoras en el modelo de administración de proyectos, aportando con su experiencia nuevas ideas y procedimientos de mejora. Busca siempre agilizar cada tarea y hacer mas eficientes los proyectos.','2013-08-31 14:57:37',1),(35,0,12,'2013-08-31 14:57:37','Tiene experiencia práctica comprobable en administración de proyectos. Sabe como enfrentar las dificultades de un proyecto. Capacidad de aprovechar al máximo los skills del equipo de trabajo y combinarlos apropiadamente. Tiene la capacidad de adaptar fácilmente un modelo de administración de proyectos y nuevos conceptos de mejora. Revisa resultados por cada etapa del proyecto brindando seguimiento detallado y buscando mejoras. Capacidad de aprovechar las experiencias de cada proyecto para optimizar los tiempos de tareas, mantenimiento la calidad. Tiene gran capacidad de flexibilizar y ajustar tareas, recursos, tiempos y procedimientos buscando siempre lo mejor para el negocio.','2013-08-31 14:57:37',2),(36,0,12,'2013-08-31 14:57:37','Tiene conocimiento teórico y maneja conceptos básicos de administracion de proyectos. Capacidad para trabajar con un modelo existente de administracion de proyectos, siguiendo cada fase de forma ordenada y precisa. Conoce a los miembros del equipo y su forma de trabajar, de modo sabe como brindar un seguimiento apropiado.Puede planificar proyectos con tiempos reales certeros y excelente calidad.','2013-08-31 14:57:37',3),(37,0,13,'2013-08-31 14:57:37','Capacidad de analizar escenarios mas complejos buscando soluciones nuevas e innovadoras con productos del área, integraciones de productos o soluciones de otra área. Tiene la capacidad de aprender y mejorar diseños anteriores reutilizando tareas y recursos. Debe buscar siempre disminuir los tiempos del proyecto, aprovechar la máximo los recursos, buscar nuevas formas de hacer las cosas para agilizar tareas como: imagenes, scripts, automatizaciones, etc.','2013-08-31 14:57:37',1),(38,0,13,'2013-08-31 14:57:37','Capacidad de realizar un dimensionamiento basado en su experiencia técnica con la solución. Puede entender un escenario, analizar las alternativas de solución, delimitar las funcionalidades de la solución, asesorar al cliente en su escenario. El diseño y dimensionamiento siempre se realiza con la mejor alternativa de calidad, buscando la eficiencia en cada tarea y evitando el desperdicio de recursos. Busca disminuir los tiempos del proyecto al máximo con diseños apropiados y justos a la solución.','2013-08-31 14:57:37',2),(39,0,13,'2013-08-31 14:57:37','Sin definir','2013-08-31 14:57:37',3),(40,0,14,'2013-08-31 14:57:37','Capacidad para conocer en profundidad cada uno de los servicios que ofrece la organización y para relacionar sus ventajas con las necesidades de los clientes. Capacidad para presentar propuestas o soluciones adecuadas a esas necesidades, y para explicar a los clientes el valor que los productos y servicios agregan a sus negocios y los beneficios que producen. Capacidad para anticiparse a las observaciones que los clientes pueden realizar a las propuestas o soluciones presentadas y responder ante ellas con argumentos sólidos, veraces y fundados. Crea la necesidad de ese producto en la organización.','2013-08-31 14:57:37',1),(41,0,14,'2013-08-31 14:57:37','Capacidad para conocer los productos y servicios ofrecidos por la organización, realizar propuestas de calidad de acuerdo con las características particulares de cada cliente y responder con argumentos convincentes a las objeciones que se presentan. Capacidad de ver el valor agregarlo y asociarlo a los objetivos del negocio.','2013-08-31 14:57:37',2),(42,0,14,'2013-08-31 14:57:37','Capacidad para conocer adecuadamente los productos y servicios de la organización, presentar los beneficios fundamentales que representan y exponer sus ventajas, a través de propuestas que expliquen como agregan valor al negocio del cliente. Capacidad para responder en forma clara y consistente a las observaciones de los clientes respecto de las propuestas y soluciones ofrecidas.','2013-08-31 14:57:37',3),(43,0,15,'2013-08-31 14:57:37','Entiende una infraestructura de comunicaciones y los elementos que interactuan en ella: comunicación con oficinas remotas, servicios tecnológicos como: internet, correo electronico, sitios web. Conoce sobre routing, buenas practicas de seguridad en redes, balanceo de cargas, alta disponibilidad, red virtual','2013-08-31 14:57:37',1),(44,0,15,'2013-08-31 14:57:37','Tiene conocimiento intermedio-avazando sobre direccionamiento ip, máscaras, tools de resolucion de problemas, puertos, enrutamiento, comprende el funcionamiento de un firewall, captura de tráfico, capas de un modelo de redes','2013-08-31 14:57:37',2),(45,0,15,'2013-08-31 14:57:37','Tiene un conocimiento basico de conceptos y principios de redes de datos: swiches, routers, redes, LAN, WAN, gateway, DMZ, VPN, velocidad de enlaces, entre otros','2013-08-31 14:57:37',3),(46,0,16,'2013-08-31 14:57:37','Experto técnico en infraestructura Microsoft. Tiene conocimiento teórico y práctico a nivel avanzado en Windows Server y sus roles como DNS, DHCP, WDS, DFS, AD, DA, Hyper-V entre otros. Entiende el funcionamiento de un datacenter y una nube privada o publica. Conoce sobre tecnologias en la nube. Tiene la capacidad de diseñar un proyecto de infraestrucutra.','2013-08-31 14:57:37',1),(47,0,16,'2013-08-31 14:57:37','Tiene conocimiento práctico de Active Directory, máquinas virtuales, identificacion de problemas de DNS, acceso remoto a servidores, administracion de Windows Server. Identifica Microsoft Servers como: Exchange, TMG, Hyper V, Sharepoint, SQL. Entiende el funcionamiento de GPOs, buenas praticas de directivas y permisos, administracion y configuracion, comprende la interaccion de los servicios en un ambiente o escenario en particular, sabe sobre redes Microsoft y entiende conceptos mas avanzados como cluster, SAN, balanceo, punteros DNS, relay de correo, sitio alterno.','2013-08-31 14:57:37',2),(48,0,16,'2013-08-31 14:57:37','Conocimiento de conceptos básicos de infraestructura: que es un dominio, DNS, DHCP, grupos, directivas, virtualizacion, permisos, autenticacion Windows.','2013-08-31 14:57:37',3),(49,0,17,'2013-08-31 14:57:37','Tiene dominio técnico total de al menos uno de los siguientes: Exchange Server, System Center, TMG, Lync Server. Puede realizar implementación, diseño y resolución de problemas avanzados','2013-08-31 14:57:37',1),(50,0,17,'2013-08-31 14:57:37','Tiene dominio técnico total de Windows Server Windows Server y sus roles y servicios a nivel avanzado. Tiene conocimiento teórico y práctico a nivel intermedio de al menos una de las siguientes soluciones: Exchange Server, System Center, TMG, Lync Server. Puede implementar alguna de estas tecnologías sin problema, así como resolver casos y problemas. Tiene todas las certificaciones Microsoft de al menos una de las soluciones anteriores o Windows Server vigente.','2013-08-31 14:57:37',2),(51,0,17,'2013-08-31 14:57:37','Tiene conocimiento teórico y práctico de Windows Server sus roles y servicios. Puede resolver casos y realizar implementaciones de estos roles sin ningún problema. Tiene al menos una certificación Microsoft de Windows Server vigente. Tiene conocimiento teórico y práctico a nivel básico de al menos uno de los siguientes: Exchange Server, System Center, TMG, Lync Server, Virtualización. Puede implementar alguna de estas tecnologías en escenarios simplificados sin problema.','2013-08-31 14:57:37',3),(52,0,18,'2013-08-31 14:57:37','Tiene dominio total de las soluciones McAfee System Security, Data Protection, Network Security, Email And Web Security, Risk and Compliance. Puede resolver casos de soporte de nivel avanzado, realizar implementaciones complejas de las soluciones, integracion de soluciones, diseño de escenarios.','2013-08-31 14:57:37',1),(53,0,18,'2013-08-31 14:57:37','Tiene conocimiento teórico y práctico de McAfee System Security, Data Protection, Network Security, Email And Web Security, Risk and Compliance a nivel intermedio. Puede resolver casos de soporte de nivel intermedio, implementaciones puntuales de las soluciones. Puede dar presentaciones y charlas sobre las soluciones.','2013-08-31 14:57:37',2),(54,0,18,'2013-08-31 14:57:37','Tiene conocimiento teórico y práctico de McAfee System Security, Data Protection, Network Security, Email And Web Security, Risk and Compliance a nivel básico. Tiene certificaciones técnicas y MASP al día. Puede resolver casos de soporte de nivel básico, maneja procedimientos de investigacion, elavación de casos, registro, técnicas de resolución de problemas, herramientas y recursos para solucionar problemas.','2013-08-31 14:57:37',3),(55,0,19,'2013-08-31 14:57:37','Experto técnico en Share Point. Tiene conocimiento teórico y práctico a nivel avanzado en: Herramientas de colaboración, Infraestructura y diseño de sitios web, Bases de datos basadas en Microsoft SQL Server, ASP.NET e Internet Information Services. Además posee conocimiento avanzado en Integración con sistemas externos, herramientas de redes sociales, construcción de soluciones no-código, automatización de formularios electrónicos, Inteligencia de Negocios, Búsqueda empresarial y Administración de contenido/ Arquitectura de información.','2013-08-31 14:57:37',1),(56,0,19,'2013-08-31 14:57:37','Posee conocimiento práctico y entiende el funcionamiento de: Herramientas de colaboración, Infraestructura y diseño de sitios web, Bases de datos basadas en Microsoft SQL Server, ASP.NET e Internet Information Services. Posee conocimiento básico de conceptos como: Integración de sistemas externos, construcción de soliciones no-código, automatización de formularios electrónicos, inteligencia de negocios, búsqueda empresarial y Administración de Contenido/ Arquitectura de Información.','2013-08-31 14:57:37',2),(57,0,19,'2013-08-31 14:57:37','Conocimiento de conceptos básicos de sharepoint: que son Herramientas de colaboración, Infraestructura y diseño de sitios web, Bases de datos basadas en Microsoft SQL Server, ASP.NET e Internet Information Services.','2013-08-31 14:57:37',3),(58,0,20,'2013-08-31 14:57:37','Tiene dominio técnico total de al menos uno de los siguientes: office 365. Puede realizar implementación, diseño y resolución de problemas avanzados. Tiene al menos 1 certificacion de Windows Server vigente.','2013-08-31 14:57:37',1),(59,0,20,'2013-08-31 14:57:37','Tiene dominio técnico total de Windows Server Windows Server y sus roles y servicios a nivel avanzado. Tiene conocimiento teórico y práctico a nivel intermedio de al menos una de las siguientes soluciones: Office 365. Puede implementar alguna de estas tecnologías sin problema, así como resolver casos y problemas. Tiene todas las certificaciones Microsoft de al menos una de las soluciones anteriores.','2013-08-31 14:57:37',2),(60,0,20,'2013-08-31 14:57:37','Tiene conocimiento teórico y práctico de Windows Server y sus roles y servicios. Puede resolver casos y realizar implementaciones de estos roles sin ningún problema. Tiene conocimiento teórico y práctico a nivel básico de al menos uno de los siguientes: office 365. Puede implementar alguna de estas tecnologías en escenarios simplificados sin problema.','2013-08-31 14:57:37',3),(61,0,21,'2013-08-31 14:57:37','Domina procedimientos y métodos referidos a Contratación Administrativa, maneja detalladamente los alcances y límites de los instrumentos del derecho de Contratación administrativa, tiene la capacidad de brindar asesoría sobre temas relacionados con su área, tiene la capacidad de darle seguimiento a los procesos desde el inicio hasta la fnalización del procedimiento de Contratación Administrativa, realiza trámites de documentos en Instituciones Públicas, posee la capacidad de realizar análisis y resoluciones de casos concretos.','2013-08-31 14:57:37',1),(62,0,21,'2013-08-31 14:57:37','Posee conocimiento acerca de la normativa, métodos y los procedimientos de Contratación Administrativa, conoce los instrumentos de derecho Administrativo, posee la capacidad para brindar asesoría en casos puntuales, le da seguimiento a los procesos desde el inicio hasta la finalización del proceso de licitaciones.','2013-08-31 14:57:37',2),(63,0,21,'2013-08-31 14:57:37','Posee conocimiento acerca de la normativa y los procesos de Contratación Administrativa, tiene la capacidad de ejecutar las contrataciones desde las etapas de actos preparatorios hasta la etapa contractual.','2013-08-31 14:57:37',3),(64,0,22,'2013-08-31 14:57:37','Posee la capacidad para crear y generar oportunidades con clientes, domina y es muy efectivo en cierres de negocio, planifica con total efectividad el orden de las llamadas, utiliza técnicas agresivas de mercadeo telefónico.','2013-08-31 14:57:37',1),(65,0,22,'2013-08-31 14:57:37','Es muy eficiente generando nuevas oportunidades de venta y cerrando nuevos negocios por medio telefónico, posee la capacidad para clasificar el orden de las llamadas y acciones a realizar. Aplica técnicas específicas para atender los distintos tipos de clientes y según los productos o servicios. Conoce técnicas de mercadeo telefónico.','2013-08-31 14:57:37',2),(66,0,22,'2013-08-31 14:57:37','Tiene la capacidad para realizar venta telefónica de servicios y productos, capacidad para generar nuevos negocios, mantener cartera activa de clientes y en ocasiones capacidad de cierre de negocios.','2013-08-31 14:57:37',3),(67,0,23,'2013-08-31 14:57:37','Domina diferentes técnicas de ventas y las aplica según los casos con el fin de crear nuevas oportunidades, aumentar la cartera de clientes, dominio del proceso de ventas, específicamente las ventas consultivas, aplica exitosamente técnicas de cierre. Manejo exitoso de los clientes. Realización adecuada de forecasts y cumplimiento del mismo. Conocimiento y análisis de la competencia.','2013-08-31 14:57:37',1),(68,0,23,'2013-08-31 14:57:37','Posee la capacidad para aplicar técnicas de ventas con el fin de crear nuevas oportunidades, aumentar la cartera de clientes, conoce y aplica el proceso de ventas, específicamente las ventas consultivas, maneja técnicas de cierre. Tiene la capacida de realizar forecasts y normalmente cumple con el mismo. Conoce la competencia.','2013-08-31 14:57:37',2),(69,0,23,'2013-08-31 14:57:37','Posee la capacidad para crear nuevas oportunidades, aumentar la cartera de clientes y cerrar negocios. Tiene conocimiento del proceso de venta, realiza forecast y alguna veces lo cumple. Conoce la competencia.','2013-08-31 14:57:37',3),(70,0,24,'2013-08-31 14:57:37','Capacidad para analizar, gestionar y tramitarr documentos internos y externos relacionados con el ámbito comercial de la compañía, domina técnicas para darle un tratamiento informático a la información. Domina la capacidad para clasificar, registrar y archivar comunicaciones y documentos según las técnicas apropiadas y los parámetros establecidos en la compañía. Desempeña con efectividad actividades de atención al cliente en el ámbito comercial asegurando los niveles de calidad y relacionados con la imagen de la empresa. Conoce las operaciones administrativas comerciales de la empresa. Posee conocimientos en contratación administrativa.','2013-08-31 14:57:37',1),(71,0,24,'2013-08-31 14:57:37','Capacidad para elaborar, gestionar y tramitar documentos internos y externos en el ámbito comercial, elabora comunicaciones e informes, según necesidadad. Capacidad para clasificar, registrar y archivar comunicaciones y documentos según las técnicas apropiadas y los parámetros establecidos en la compañía. Desempeña con efectividad actividades de atención al cliente en el ámbito comercial asegurando los niveles de calidad y relacionados con la imagen de la empresa.','2013-08-31 14:57:37',2),(72,0,24,'2013-08-31 14:57:37','Posee la capacidad para tramitar documentos e informes cuando se le solicita. Tiene capacidad para clasificar, registrar y archivar comunicaciones y documentos según los parámetros establecidos en la compañía. Desempeña actividades de atención al cliente en el ámbito comercial.','2013-08-31 14:57:37',3),(73,0,25,'2013-08-31 14:57:37','Posee la capacidad para recabar la información del medio y analizarla para posteriormente aplicar técnicas contables, interpretar y registrar los efectos de las transacciones que realiza la empresa, determinar los distintos subtotales y totales que son útiles para la toma de decisiones y analiza e interpreta Estados Financieros.','2013-08-31 14:57:37',1),(74,0,25,'2013-08-31 14:57:37','Capacidad para entender la información contable y aplicarla, conoce y en ocasiones utiliza técnicas contables, es capaz de determinar los subtotales y totales que son necesarios para la toma de decisiones, puede entender Estados Financieros.','2013-08-31 14:57:37',2),(75,0,25,'2013-08-31 14:57:37','Capacidad para utilizar información contable, conoce las técnicas contables pero no las aplica.','2013-08-31 14:57:37',3),(76,0,27,'2013-08-31 14:57:37','Capacidad para diseñar e implantar métodos de trabajo que promuevan la dirección de equipos eficaces para una mejor consecución de las metas corporativas. Capacidad para seleccionar a los integrantes de los equipos de trabajo y alentar este tipo de prácticas entre los niveles directivos de la organización. Capacidad para integrar, desarrollar, consolidar y conducir uno o varios equiposde trabajo y alentar a sus integrantes a actuar con autonomía y responsabilidad. Capacidad para desarrollar el talento y potencial de su gente y brindar retroalimentación oportuna sobre el desempeño Capacidad para coordinar y distribuir las tareas y prioridades en función de las competencias y conocimientos de los integrantes del o los equipos a su cargo y de los objetivos que se desee alcanzar. Implica estipular plazos de cumplimiento y dirigir las acciones de los equipos hacia una meta u objetivo determinado.','2013-08-31 14:57:37',1),(77,0,27,'2013-08-31 14:57:37','Capacidad para seleccionar a los integrantes de los equipos de trabajo y fijar metas. Capacidad para integrar, desarrollar, consolidar y conducir un equipo de trabajo, y alentar a sus integrantes a actuar con autonomía y responsabilidad. Capacidad para desarrollar el talento y potencial de su gente y brindar retroalimentación oportuna sobre el desempeñoCapacidad para coordinar, distribuir y delegar las tareas y prioridades en función de las competencias y conocimientos de los colaboradores y los objetivos que se desee alcanzar. Implica estipular plazos de cumplimiento y dirigir las acciones del equipo hacia una meta u objetivo determinado.','2013-08-31 14:57:37',2),(78,0,27,'2013-08-31 14:57:37','Capacidad para integrar y conducir un equipo de trabajo alentando a sus integrantes a actuar con responsabilidad.Capacidad para brindar una retroalimentación a sus integrantes. Capacidad para coordinar, distribuir y delegar tareas en función de las competencias y conocimientos de los colaboradores, estipular plazos de cumplimiento y dirigir las acciones del equipo hacia una meta u objetivo determinado.','2013-08-31 14:57:37',3),(79,0,28,'2013-08-31 14:57:37','Capacidad para diseñar estrategias, procesos, cursos de acción y métodos de trabajo con el propósito de asegurar una adecuada conducción de personas, desarrollar el talento, y al mismo tiempo, lograr el compromiso y el respaldo de las distintas áreas que componen la organización para alcanzar la estrategia. Implica lograr y mantener un clima organizacional armónico, desafiante y ser un referente por su liderazgo, capacidad para desarrollar a los otros en el marco de la organización, con una visión y proyección de largo plazo.','2013-08-31 14:57:37',1),(80,0,28,'2013-08-31 14:57:37','Capacidad para diseñar estrategias, procesos, cursos de acción y métodos de trabajo con el propósito de asegurar una adecuada conducción de personas, desarrollar el talento, y al mismo tiempo, lograr el compromiso y el respaldo de sus superiores a fin de enfrentar con éxito los desafíos propuestos para su área. Implica promover y mantener un clima organizacional armónico y desafiante, ser un ejemplo dentro de la organización por su liderazgo y capacidad para desarrollar a los otros, con una visión y proyección de mediano plazo.','2013-08-31 14:57:37',2),(81,0,28,'2013-08-31 14:57:37','Capacidad para proponer cursos de acción y nuevas formas de hacer las cosas con el propósito de asegurar una adecuada conducción de personas, desarrollar el talento y al mismo tiempo, lograr el compromiso y el respaldo de sus superiores a fin de enfrentar con éxito los desafíos del equipo a su cargo. Implica propiciar un clima organizacional armónico y desafiante y ser un ejemplo para su entorno próximo por su liderazgo y capacidad de desarrollar a los otros, con una visión y proyección de corto plazo.','2013-08-31 14:57:37',3),(82,0,26,'2013-08-31 14:57:37','Capacidad para encarar el proceso de toma de decisiones, mediante la elección sistemática de opciones viables y convenientes, considerar las circunstancias existentes, los recursos disponibles y su impacto en la compañía. Capacidad para convencer a sus colaboradores de la necesidad de generar opciones múltiples frente a cada situación a resolver y especialmente ante cuestiones críticas o sensibles para la organización. Capacidad para establecer mecanismos de selección opciones que contemplen el mejor resultado, desde diversos puntos de vista, en función de los objetivos organizacionales. Implica capacidad para controlar el desarrollo de las opciones elegidas para asegurarse de que respetan las pautas de calidad y oportunidad fijadas, y tomar conciencia de sus posibles consecuencias.','2013-08-31 14:57:37',1),(83,0,26,'2013-08-31 14:57:37','Capacidad para tomar decisiones mediante el desarrollo de opciones viables y convenientes, considerar las circunstancias existentes, los recursos disponibles y su impacto en la compañía. Capacidad para generar opciones múltiples frente a cada situación a resolver, y especialmente ante cuestiones críticas para la organización. Capacidad para aplicar el mecanismo de selección de opciones establecido, a fin de obtener el mejor resultados, desde diversos puntos de vista, en funcipón de los objetivos organizacionales. Implica capacidad para ejecutar y supervisar las opciones elegidas con calidad y oportunidad.','2013-08-31 14:57:37',2),(84,0,26,'2013-08-31 14:57:37','Capacidad para generar más de una opción frente a cada situación a resolver, aplicar el mecanismo de selección de opciones establecido y ejecutar las opciones elegidas según los procedimientos vigentes.','2013-08-31 14:57:37',3),(85,0,29,'2013-08-31 14:57:37','Capacidad para anticiparse y comprender los cambios del entorno, y establecer su impacto a corto, mediano y largo plazo en la organización. Capacidad par diseñar procedimientos que permitan, al mismo tiempo optimizar la utilización de las fortalezas y actuar sobre las debilidades, con el propósito de aprovechar las oportunidades del contexto. Implica la capacidad para fijar la visión de la organización y conducirla como un sistema integral, para que en conjunto pueda lograr objetivos y metas retadoras, asociados a los objetivos corporativos.','2013-08-31 14:57:37',1),(86,0,29,'2013-08-31 14:57:37','Capacidad para anticiparse y comprender los cambios del entorno, y establecer su impacto a corto, mediano y largo plazo en la organización. Habilidad para modificar procedimientos en el área a su cargo a fin de optimizar fortalezas y actuar sobre las debilidades, a partir de la consideración de las oportunidades que ofrece el contexto. Implica la capacidad para conducir el área bajo su responsabilidad y tener en cuenta que la organización es un sistema integral, donde las acciones y resultados de un sector repercuten sobre el conjunto. Capacidad para comprender que el objetivo último es alcanzar metas retadoras asociadas a la estrategia corporativa.','2013-08-31 14:57:37',2),(87,0,29,'2013-08-31 14:57:37','Capacidad para comprender los cambios del entorno y establecer su impacto en la organización a corto y mediano plazo. Habilidad para proponer mejoras sobre aspectos relacionados con su ámbito de actuación, a fin de mejorar la utilización de los recursos y fortalezas, y reducir las debilidades. Capacidad para actuar y/o conducir al grupo a su cargo bajo la visualización de la empresa y su área específica como sistemas integrados.','2013-08-31 14:57:37',3);
/*!40000 ALTER TABLE `competencia_nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencia_tipo`
--

DROP TABLE IF EXISTS `competencia_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencia_tipo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencia_tipo`
--

LOCK TABLES `competencia_tipo` WRITE;
/*!40000 ALTER TABLE `competencia_tipo` DISABLE KEYS */;
INSERT INTO `competencia_tipo` VALUES (1,0,'2013-08-31 14:57:36','2013-08-31 14:57:36','Personal'),(2,0,'2013-08-31 14:57:36','2013-08-31 14:57:36','Técnica'),(3,0,'2013-08-31 14:57:36','2013-08-31 14:57:36','Gerencial');
/*!40000 ALTER TABLE `competencia_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `certificacion` bit(1) DEFAULT NULL,
  `costo` float NOT NULL,
  `date_created` datetime NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `duracion` int(11) NOT NULL,
  `last_updated` datetime NOT NULL,
  `moneda_id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `proveedor_id` bigint(20) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5AA009CD738BFA9` (`proveedor_id`),
  KEY `FK5AA009C855445AB` (`moneda_id`),
  CONSTRAINT `FK5AA009C855445AB` FOREIGN KEY (`moneda_id`) REFERENCES `moneda` (`id`),
  CONSTRAINT `FK5AA009CD738BFA9` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,0,NULL,100,'2013-08-31 14:57:39','Lorem ipsum dolor sit amet, consectetur adipiscing elit.',40,'2013-08-31 14:57:39',1,'Iniciación a Grails',NULL,1,'Online',NULL),(2,0,NULL,250,'2013-08-31 14:57:39','Lorem ipsum dolor sit amet, consectetur adipiscing elit.',80,'2013-08-31 14:57:39',2,'Desarrollo Aplicaciones Web','observacion curso bla bla bla bla',2,'Presencial',NULL);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_competencia_nivel`
--

DROP TABLE IF EXISTS `curso_competencia_nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso_competencia_nivel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `competencia_nivel_id` bigint(20) NOT NULL,
  `curso_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `curso_id` (`curso_id`,`competencia_nivel_id`),
  KEY `FKF9E965542454411D` (`curso_id`),
  KEY `FKF9E9655478D7510F` (`competencia_nivel_id`),
  CONSTRAINT `FKF9E9655478D7510F` FOREIGN KEY (`competencia_nivel_id`) REFERENCES `competencia_nivel` (`id`),
  CONSTRAINT `FKF9E965542454411D` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_competencia_nivel`
--

LOCK TABLES `curso_competencia_nivel` WRITE;
/*!40000 ALTER TABLE `curso_competencia_nivel` DISABLE KEYS */;
INSERT INTO `curso_competencia_nivel` VALUES (1,0,2,1,'2013-08-31 14:57:39','2013-08-31 14:57:39'),(2,0,3,2,'2013-08-31 14:57:39','2013-08-31 14:57:39'),(3,0,5,2,'2013-08-31 14:57:39','2013-08-31 14:57:39');
/*!40000 ALTER TABLE `curso_competencia_nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_horario`
--

DROP TABLE IF EXISTS `curso_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso_horario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `curso_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `detalle_horario` varchar(255) NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE353933F2454411D` (`curso_id`),
  CONSTRAINT `FKE353933F2454411D` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_horario`
--

LOCK TABLES `curso_horario` WRITE;
/*!40000 ALTER TABLE `curso_horario` DISABLE KEYS */;
INSERT INTO `curso_horario` VALUES (1,0,1,'2013-08-31 14:57:39','LMX 17-20','2013-06-30 00:00:00','2013-08-31 14:57:39','2013-08-31 14:57:39');
/*!40000 ALTER TABLE `curso_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,0,'2013-08-31 14:57:36','2013-08-31 14:57:36','Desarrollo de Negocios'),(2,0,'2013-08-31 14:57:36','2013-08-31 14:57:36','Potencial Humano'),(3,0,'2013-08-31 14:57:36','2013-08-31 14:57:36','Gerencia'),(4,0,'2013-08-31 14:57:36','2013-08-31 14:57:36','Consultoría'),(5,0,'2013-08-31 14:57:36','2013-08-31 14:57:36','Financiero');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `autor_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `mensaje` varchar(140) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB2E43966440B93A` (`autor_id`),
  CONSTRAINT `FKB2E43966440B93A` FOREIGN KEY (`autor_id`) REFERENCES `colaborador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudio`
--

DROP TABLE IF EXISTS `estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `centro_id` bigint(20) NOT NULL,
  `colaborador_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nivel_id` bigint(20) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA9AC0A7B5F248EF5` (`centro_id`),
  KEY `FKA9AC0A7BE7E241F3` (`colaborador_id`),
  KEY `FKA9AC0A7BCF23844E` (`nivel_id`),
  CONSTRAINT `FKA9AC0A7BCF23844E` FOREIGN KEY (`nivel_id`) REFERENCES `nivel_estudio` (`id`),
  CONSTRAINT `FKA9AC0A7B5F248EF5` FOREIGN KEY (`centro_id`) REFERENCES `centro_educativo` (`id`),
  CONSTRAINT `FKA9AC0A7BE7E241F3` FOREIGN KEY (`colaborador_id`) REFERENCES `colaborador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudio`
--

LOCK TABLES `estudio` WRITE;
/*!40000 ALTER TABLE `estudio` DISABLE KEYS */;
INSERT INTO `estudio` VALUES (1,0,2,2,'2013-08-31 14:57:41','2008-07-09 00:00:00','2003-05-05 00:00:00','2013-08-31 14:57:41',3,'Ing. Sistemas'),(2,0,1,2,'2013-08-31 14:57:41','2013-09-13 00:00:00','2011-10-10 00:00:00','2013-08-31 14:57:41',5,'Ingenieria del Software Para la Web'),(3,0,5,3,'2013-08-31 14:57:41','2008-07-09 00:00:00','2003-05-05 00:00:00','2013-08-31 14:57:41',2,'Psicologia'),(4,0,2,3,'2013-08-31 14:57:41','2009-07-09 00:00:00','2008-05-05 00:00:00','2013-08-31 14:57:41',5,'Gestion RRHH y direccion empresas'),(5,0,1,3,'2013-08-31 14:57:41','2012-07-09 00:00:00','2011-05-05 00:00:00','2013-08-31 14:57:41',5,'Desarrollo Profesional');
/*!40000 ALTER TABLE `estudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etiqueta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
INSERT INTO `etiqueta` VALUES (1,1,'2013-08-31 14:57:42','2013-08-31 14:57:42','Varios'),(2,1,'2013-08-31 14:57:42','2013-08-31 14:57:42','Avisos');
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetas_tareas`
--

DROP TABLE IF EXISTS `etiquetas_tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etiquetas_tareas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas_tareas`
--

LOCK TABLES `etiquetas_tareas` WRITE;
/*!40000 ALTER TABLE `etiquetas_tareas` DISABLE KEYS */;
INSERT INTO `etiquetas_tareas` VALUES (1,1,'2013-08-31 14:57:41','2013-08-31 14:57:42','Departamento'),(2,1,'2013-08-31 14:57:41','2013-08-31 14:57:42','General'),(3,0,'2013-08-31 14:57:41','2013-08-31 14:57:41','Tecnica'),(4,0,'2013-08-31 14:57:41','2013-08-31 14:57:41','Personal');
/*!40000 ALTER TABLE `etiquetas_tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcion`
--

DROP TABLE IF EXISTS `funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcion`
--

LOCK TABLES `funcion` WRITE;
/*!40000 ALTER TABLE `funcion` DISABLE KEYS */;
INSERT INTO `funcion` VALUES (1,0,'2013-08-31 14:57:42','2013-08-31 14:57:42','Encargado'),(2,0,'2013-08-31 14:57:42','2013-08-31 14:57:42','Colaborador'),(3,0,'2013-08-31 14:57:42','2013-08-31 14:57:42','Revisor');
/*!40000 ALTER TABLE `funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moneda` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `simbolo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` VALUES (1,0,'2013-08-31 14:57:36','2013-08-31 14:57:36','Colones','C'),(2,0,'2013-08-31 14:57:36','2013-08-31 14:57:36','Dólares','$'),(3,0,'2013-08-31 14:57:36','2013-08-31 14:57:36','Euros','€');
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_estudio`
--

DROP TABLE IF EXISTS `nivel_estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel_estudio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_estudio`
--

LOCK TABLES `nivel_estudio` WRITE;
/*!40000 ALTER TABLE `nivel_estudio` DISABLE KEYS */;
INSERT INTO `nivel_estudio` VALUES (1,0,'2013-08-31 14:57:41','2013-08-31 14:57:41','Diplomado'),(2,0,'2013-08-31 14:57:41','2013-08-31 14:57:41','Licenciatura'),(3,0,'2013-08-31 14:57:41','2013-08-31 14:57:41','Ingenieria'),(4,0,'2013-08-31 14:57:41','2013-08-31 14:57:41','Grado'),(5,0,'2013-08-31 14:57:41','2013-08-31 14:57:41','Master'),(6,0,'2013-08-31 14:57:41','2013-08-31 14:57:41','Doctorado');
/*!40000 ALTER TABLE `nivel_estudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_profesional`
--

DROP TABLE IF EXISTS `nivel_profesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel_profesional` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_profesional`
--

LOCK TABLES `nivel_profesional` WRITE;
/*!40000 ALTER TABLE `nivel_profesional` DISABLE KEYS */;
INSERT INTO `nivel_profesional` VALUES (1,0,'2013-08-31 14:57:37','2013-08-31 14:57:37','Nivel 1'),(2,0,'2013-08-31 14:57:37','2013-08-31 14:57:37','Nivel 2'),(3,0,'2013-08-31 14:57:37','2013-08-31 14:57:37','Nivel 3');
/*!40000 ALTER TABLE `nivel_profesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles_competencias`
--

DROP TABLE IF EXISTS `niveles_competencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveles_competencias` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles_competencias`
--

LOCK TABLES `niveles_competencias` WRITE;
/*!40000 ALTER TABLE `niveles_competencias` DISABLE KEYS */;
INSERT INTO `niveles_competencias` VALUES (1,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','A'),(2,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','B'),(3,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','C');
/*!40000 ALTER TABLE `niveles_competencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authority` (`authority`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,0,'ROLE_ADMIN'),(2,0,'ROLE_USUARIO'),(3,0,'ROLE_CapitalHumano'),(4,0,'ROLE_Gerencia'),(5,0,'ROLE_Suplantar'),(6,0,'ROLE_Anuncios');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicion`
--

DROP TABLE IF EXISTS `posicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posicion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicion`
--

LOCK TABLES `posicion` WRITE;
/*!40000 ALTER TABLE `posicion` DISABLE KEYS */;
INSERT INTO `posicion` VALUES (1,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Telemercadeo'),(2,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Back Office'),(3,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Analista de Gestión de Potencial Humano'),(4,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Asistente de Gerencia'),(5,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Help Desk'),(6,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Especialista Técnico'),(7,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Auxiliar administrativo'),(8,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Mensajero'),(9,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Licitaciones'),(10,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Especialista en Competencia'),(11,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Desarrollador de Negocios Jr.'),(12,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Mercadeo'),(13,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Consultor Junior'),(14,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Asistente Financiero'),(15,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Desarrollador Negocios Sr'),(16,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Experto Licitaciones'),(17,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Especialista Mercadeo'),(18,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Especialista en Gestión de Potencial Humano'),(19,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Consultor Senior'),(20,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Analista Financiero'),(21,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Team Leader'),(22,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Key Account Manager/Product Manager'),(23,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Arquitecto de soluciones'),(24,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Manager'),(25,0,'2013-08-31 14:57:36','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','2013-08-31 14:57:36','Core Manager');
/*!40000 ALTER TABLE `posicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `direccion` varchar(1000) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,0,'2013-08-31 14:57:39',NULL,'2013-08-31 14:57:39','Academia Computón SA',NULL),(2,0,'2013-08-31 14:57:39',NULL,'2013-08-31 14:57:39','Formación Interna',NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `descripcion` varchar(3000) NOT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `FKC54C7905E7509D49` (`cliente_id`),
  CONSTRAINT `FKC54C7905E7509D49` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (1,0,2,'2013-08-31 14:57:42','Aenean eleifend felis a magna gravida iaculis. Mauris pellentesque nunc ipsum, et ullamcorper justo porta vitae. Etiam nec rhoncus libero. Aliquam ultrices tellus nec enim malesuada aliquet. Cras eget diam ultrices sapien consequat consectetur. Integer mollis, mi a molestie sodales, elit augue rhoncus mauris, vitae sagittis orci augue vitae enim. In laoreet hendrerit quam vel fermentum. Suspendisse potenti. Aenean ac lacus ultricies neque dignissim venenatis vitae ac ipsum. Morbi aliquam commodo sapien sit amet gravida','2013-09-01 00:00:00','2013-06-01 00:00:00','2013-08-31 14:57:42','SACOPRO'),(2,0,2,'2013-08-31 14:57:42','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nunc eu enim sodales vulputate in sit amet ligula. In hac habitasse platea dictumst. Aenean porttitor, erat at lobortis posuere, leo diam pretium eros, nec hendrerit risus lacus id nisi. Pellentesque sodales luctus sem eu mattis. In hac habitasse platea dictumst. Nunc eu blandit libero, in elementum dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque nec orci sodales, tristique erat ac, euismod orci. Duis erat est, pellentesque ac est vel, varius auctor elit. Sed rhoncus condimentum neque quis ornare. ','2013-08-01 00:00:00','2013-07-01 00:00:00','2013-08-31 14:57:42','Web Corporativa');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_colaborador`
--

DROP TABLE IF EXISTS `proyecto_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_colaborador` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `colaborador_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `funcion_id` bigint(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `proyecto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK12552A503DB77109` (`funcion_id`),
  KEY `FK12552A507A322BAB` (`proyecto_id`),
  KEY `FK12552A50E7E241F3` (`colaborador_id`),
  CONSTRAINT `FK12552A50E7E241F3` FOREIGN KEY (`colaborador_id`) REFERENCES `colaborador` (`id`),
  CONSTRAINT `FK12552A503DB77109` FOREIGN KEY (`funcion_id`) REFERENCES `funcion` (`id`),
  CONSTRAINT `FK12552A507A322BAB` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_colaborador`
--

LOCK TABLES `proyecto_colaborador` WRITE;
/*!40000 ALTER TABLE `proyecto_colaborador` DISABLE KEYS */;
INSERT INTO `proyecto_colaborador` VALUES (1,0,2,'2013-08-31 14:57:42',NULL,'2013-08-31 14:57:42',1,'2013-08-31 14:57:42',1),(2,0,3,'2013-08-31 14:57:42',NULL,'2013-08-31 14:57:42',1,'2013-08-31 14:57:42',2),(3,0,2,'2013-08-31 14:57:42',NULL,'2013-08-31 14:57:42',2,'2013-08-31 14:57:42',2);
/*!40000 ALTER TABLE `proyecto_colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_tecnologias`
--

DROP TABLE IF EXISTS `proyecto_tecnologias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_tecnologias` (
  `tecnologia_id` bigint(20) NOT NULL,
  `proyecto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`proyecto_id`,`tecnologia_id`),
  KEY `FK2518FB707A322BAB` (`proyecto_id`),
  KEY `FK2518FB70253D10EB` (`tecnologia_id`),
  CONSTRAINT `FK2518FB70253D10EB` FOREIGN KEY (`tecnologia_id`) REFERENCES `tecnologia` (`id`),
  CONSTRAINT `FK2518FB707A322BAB` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_tecnologias`
--

LOCK TABLES `proyecto_tecnologias` WRITE;
/*!40000 ALTER TABLE `proyecto_tecnologias` DISABLE KEYS */;
INSERT INTO `proyecto_tecnologias` VALUES (1,1),(2,1),(4,2),(5,2);
/*!40000 ALTER TABLE `proyecto_tecnologias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_code`
--

DROP TABLE IF EXISTS `registration_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `token` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_code`
--

LOCK TABLES `registration_code` WRITE;
/*!40000 ALTER TABLE `registration_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `comentarios_resolucion` varchar(1000) DEFAULT NULL,
  `creador_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `ejecutor_id` bigint(20) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_finalizacion` datetime DEFAULT NULL,
  `fecha_tope` datetime DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `prioridad` varchar(14) NOT NULL,
  `tiempo_utilizado` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK690770137A63B58` (`ejecutor_id`),
  KEY `FK6907701E55B6F21` (`creador_id`),
  CONSTRAINT `FK6907701E55B6F21` FOREIGN KEY (`creador_id`) REFERENCES `colaborador` (`id`),
  CONSTRAINT `FK690770137A63B58` FOREIGN KEY (`ejecutor_id`) REFERENCES `colaborador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
INSERT INTO `tarea` VALUES (1,0,NULL,2,'2013-08-31 14:57:41','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nunc eu enim sodales vulputate in sit amet ligula. In hac habitasse platea dictumst. Aenean porttitor, erat at lobortis posuere, leo diam pretium eros, nec hendrerit risus lacus id nisi. Pellentesque sodales luctus sem eu mattis. In hac habitasse platea dictumst. Nunc eu blandit libero, in elementum dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque nec orci sodales, tristique erat ac, euismod orci. Duis erat est, pellentesque ac est vel, varius auctor elit. Sed rhoncus condimentum neque quis ornare. ',2,'Abierta','2013-08-31 14:57:41',NULL,'2013-09-07 14:57:41','2013-08-31 14:57:41','Tarea 1','Accion',0),(2,0,NULL,3,'2013-08-31 14:57:41','Aenean eleifend felis a magna gravida iaculis. Mauris pellentesque nunc ipsum, et ullamcorper justo porta vitae. Etiam nec rhoncus libero. Aliquam ultrices tellus nec enim malesuada aliquet. Cras eget diam ultrices sapien consequat consectetur. Integer mollis, mi a molestie sodales, elit augue rhoncus mauris, vitae sagittis orci augue vitae enim. In laoreet hendrerit quam vel fermentum. Suspendisse potenti. Aenean ac lacus ultricies neque dignissim venenatis vitae ac ipsum. Morbi aliquam commodo sapien sit amet gravida',2,'Abierta','2013-08-31 14:57:41',NULL,'2013-09-07 14:57:41','2013-08-31 14:57:41','Tarea 2','Accion',0),(3,0,NULL,3,'2013-08-31 14:57:41','Cras sem diam, elementum ut fermentum vitae, lobortis vitae nunc. Pellentesque consequat venenatis libero, non interdum elit dignissim nec. Pellentesque sodales libero ornare semper mattis. Sed convallis porttitor dignissim. Pellentesque lobortis enim sed urna pretium mattis. Morbi ut suscipit eros. Nunc enim neque, pulvinar dictum justo eget, convallis pretium quam. Fusce at scelerisque erat, nec sollicitudin tellus. Nullam eget purus diam. Ut lobortis dignissim est, ac tincidunt massa sodales eget. Phasellus vestibulum rutrum lectus. Proin id enim in nisl vehicula mattis sed eu elit. Vestibulum blandit ligula quis nunc egestas pretium. Curabitur volutpat tempus odio, ut tristique sapien adipiscing vitae. ',3,'Abierta','2013-08-31 14:57:41',NULL,'2013-09-07 14:57:41','2013-08-31 14:57:41','Tarea 3','Accion',0),(4,0,NULL,3,'2013-08-31 14:57:41','Aenean eleifend felis a magna gravida iaculis. Mauris pellentesque nunc ipsum, et ullamcorper justo porta vitae. Etiam nec rhoncus libero. Aliquam ultrices tellus nec enim malesuada aliquet. Cras eget diam ultrices sapien consequat consectetur. Integer mollis, mi a molestie sodales, elit augue rhoncus mauris, vitae sagittis orci augue vitae enim. In laoreet hendrerit quam vel fermentum. Suspendisse potenti. Aenean ac lacus ultricies neque dignissim venenatis vitae ac ipsum. Morbi aliquam commodo sapien sit amet gravida',3,'Finalizada','2013-08-31 14:57:41','2013-08-31 14:57:41','2013-09-07 14:57:41','2013-08-31 14:57:41','Tarea 4','Proxima Accion',0);
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_etiquetas`
--

DROP TABLE IF EXISTS `tarea_etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_etiquetas` (
  `tarea_id` bigint(20) NOT NULL,
  `etiquetas_tareas_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tarea_id`,`etiquetas_tareas_id`),
  KEY `FKA8B7D7A12E54B0EE` (`etiquetas_tareas_id`),
  KEY `FKA8B7D7A1715A4D6F` (`tarea_id`),
  CONSTRAINT `FKA8B7D7A1715A4D6F` FOREIGN KEY (`tarea_id`) REFERENCES `tarea` (`id`),
  CONSTRAINT `FKA8B7D7A12E54B0EE` FOREIGN KEY (`etiquetas_tareas_id`) REFERENCES `etiquetas_tareas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_etiquetas`
--

LOCK TABLES `tarea_etiquetas` WRITE;
/*!40000 ALTER TABLE `tarea_etiquetas` DISABLE KEYS */;
INSERT INTO `tarea_etiquetas` VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `tarea_etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnologia`
--

DROP TABLE IF EXISTS `tecnologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnologia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnologia`
--

LOCK TABLES `tecnologia` WRITE;
/*!40000 ALTER TABLE `tecnologia` DISABLE KEYS */;
INSERT INTO `tecnologia` VALUES (1,1,'2013-08-31 14:57:42','2013-08-31 14:57:42','Grails'),(2,1,'2013-08-31 14:57:42','2013-08-31 14:57:42','Java'),(3,0,'2013-08-31 14:57:42','2013-08-31 14:57:42','.Net'),(4,1,'2013-08-31 14:57:42','2013-08-31 14:57:42','HTML'),(5,1,'2013-08-31 14:57:42','2013-08-31 14:57:42','CSS'),(6,0,'2013-08-31 14:57:42','2013-08-31 14:57:42','MySQL'),(7,0,'2013-08-31 14:57:42','2013-08-31 14:57:42','SQL Server'),(8,0,'2013-08-31 14:57:42','2013-08-31 14:57:42','Ruby on Rails'),(9,0,'2013-08-31 14:57:42','2013-08-31 14:57:42','Javascript'),(10,0,'2013-08-31 14:57:42','2013-08-31 14:57:42','AJAX');
/*!40000 ALTER TABLE `tecnologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_expired` bit(1) NOT NULL,
  `username` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,0,'\0','\0','admin@admin.com','','$2a$10$4rzXoFZeFhRny42nHuFTJOckOVC9sIvGSQfN7LfPNjhQxHY74uYj2','\0','admin'),(2,0,'\0','\0','jesusrodriguezm@gmail.com','','$2a$10$Afa8dKfwqLbrrhm0RQKaLO3SG.3RfGMkKAdbl2SFXh0a5W9l.6ayq','\0','jesusrodriguezm'),(3,0,'\0','\0','maria@gmail.com','','$2a$10$uVXFUejwwJrX0C/i77fGPesMAjfcZM6CFKvovXNfCL5yWQaMPsb1K','\0','maria'),(4,0,'\0','\0','usuario1@gmail.com','','$2a$10$QvNkPA0E.ao3HGbaKET0TuSImoXKU/IuVOozrn.P2cQYniWV58Xw6','\0','usuario1'),(5,0,'\0','\0','usuario2@gmail.com','','$2a$10$AcRGOfSedV4Xapc5dFNsY.F873DwOvwmWKi/V36L..8ZPAElItBzC','\0','usuario2'),(6,0,'\0','\0','usuario3@gmail.com','','$2a$10$MpBSD3WEJ3KdYGmG73SX0eg4Acozw0bwVTkimLiZD7yYj3c8cMrWa','\0','usuario3'),(7,0,'\0','\0','usuario4@gmail.com','','$2a$10$HaMoFWjLaZwnqM1o4rq.j.WDdKvRSa34jN3LFLJSe122HSFRBboPq','\0','usuario4'),(8,0,'\0','\0','usuario5@gmail.com','','$2a$10$1L4/mhD00lBHywnskmk6veooVjIqGpClob1WqPn/BdaJDQl7fd2qu','\0','usuario5'),(9,0,'\0','\0','usuario6@gmail.com','','$2a$10$GxaOqot3iEejUu1B4Hzb4edQXYsQX4ofiRZ.8jZ9ih/k1MvuZ6ety','\0','usuario6');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_perfil`
--

DROP TABLE IF EXISTS `usuario_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_perfil` (
  `perfil_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`perfil_id`,`usuario_id`),
  KEY `FK57CD23FDE2E2FD69` (`usuario_id`),
  KEY `FK57CD23FDD8281EB` (`perfil_id`),
  CONSTRAINT `FK57CD23FDD8281EB` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`),
  CONSTRAINT `FK57CD23FDE2E2FD69` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_perfil`
--

LOCK TABLES `usuario_perfil` WRITE;
/*!40000 ALTER TABLE `usuario_perfil` DISABLE KEYS */;
INSERT INTO `usuario_perfil` VALUES (1,1),(2,1),(2,2),(4,2),(2,3),(3,3),(6,3),(2,4),(2,5),(2,6),(2,7);
/*!40000 ALTER TABLE `usuario_perfil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-31 15:05:21
