-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: borsa
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'admin_borsa'),(2,'admin_empresa'),(3,'alumnes'),(4,'profes');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (103,1,41),(104,1,42),(105,1,43),(106,1,44),(95,1,45),(96,1,46),(97,1,47),(98,1,48),(99,1,49),(100,1,50),(101,1,51),(102,1,52),(77,1,65),(78,1,66),(79,1,67),(80,1,68),(81,1,69),(82,1,70),(83,1,71),(84,1,72),(85,1,74),(86,1,76),(87,1,77),(88,1,78),(89,1,79),(90,1,80),(91,1,85),(92,1,86),(93,1,87),(94,1,88),(107,2,68),(108,2,70),(109,2,72),(110,2,77),(111,2,78),(112,2,79),(113,2,80),(114,3,65),(115,3,66),(116,3,67),(117,3,68),(118,3,80),(119,3,81),(120,3,82),(121,3,83),(122,3,84),(123,3,88),(124,3,92),(125,3,93),(126,3,94),(127,3,96),(128,3,104),(129,3,108),(130,3,112),(131,4,89),(132,4,90),(133,4,91),(134,4,92),(135,4,93),(136,4,94),(137,4,95),(138,4,96),(141,4,97),(139,4,98),(140,4,100),(142,4,101),(143,4,102),(144,4,103),(145,4,104),(146,4,105),(147,4,106),(148,4,107),(149,4,108),(150,4,109),(151,4,110),(152,4,111),(153,4,112);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add association',1,'add_association'),(2,'Can change association',1,'change_association'),(3,'Can delete association',1,'delete_association'),(4,'Can view association',1,'view_association'),(5,'Can add code',2,'add_code'),(6,'Can change code',2,'change_code'),(7,'Can delete code',2,'delete_code'),(8,'Can view code',2,'view_code'),(9,'Can add nonce',3,'add_nonce'),(10,'Can change nonce',3,'change_nonce'),(11,'Can delete nonce',3,'delete_nonce'),(12,'Can view nonce',3,'view_nonce'),(13,'Can add user social auth',4,'add_usersocialauth'),(14,'Can change user social auth',4,'change_usersocialauth'),(15,'Can delete user social auth',4,'delete_usersocialauth'),(16,'Can view user social auth',4,'view_usersocialauth'),(17,'Can add partial',5,'add_partial'),(18,'Can change partial',5,'change_partial'),(19,'Can delete partial',5,'delete_partial'),(20,'Can view partial',5,'view_partial'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add permission',7,'add_permission'),(26,'Can change permission',7,'change_permission'),(27,'Can delete permission',7,'delete_permission'),(28,'Can view permission',7,'view_permission'),(29,'Can add group',8,'add_group'),(30,'Can change group',8,'change_group'),(31,'Can delete group',8,'delete_group'),(32,'Can view group',8,'view_group'),(33,'Can add content type',9,'add_contenttype'),(34,'Can change content type',9,'change_contenttype'),(35,'Can delete content type',9,'delete_contenttype'),(36,'Can view content type',9,'view_contenttype'),(37,'Can add session',10,'add_session'),(38,'Can change session',10,'change_session'),(39,'Can delete session',10,'delete_session'),(40,'Can view session',10,'view_session'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user'),(45,'Can add categoria',12,'add_categoria'),(46,'Can change categoria',12,'change_categoria'),(47,'Can delete categoria',12,'delete_categoria'),(48,'Can view categoria',12,'view_categoria'),(49,'Can add centre',13,'add_centre'),(50,'Can change centre',13,'change_centre'),(51,'Can delete centre',13,'delete_centre'),(52,'Can view centre',13,'view_centre'),(53,'Can add cicle',14,'add_cicle'),(54,'Can change cicle',14,'change_cicle'),(55,'Can delete cicle',14,'delete_cicle'),(56,'Can view cicle',14,'view_cicle'),(57,'Can add modul professional',15,'add_modulprofessional'),(58,'Can change modul professional',15,'change_modulprofessional'),(59,'Can delete modul professional',15,'delete_modulprofessional'),(60,'Can view modul professional',15,'view_modulprofessional'),(61,'Can add unitat formativa',16,'add_unitatformativa'),(62,'Can change unitat formativa',16,'change_unitatformativa'),(63,'Can delete unitat formativa',16,'delete_unitatformativa'),(64,'Can view unitat formativa',16,'view_unitatformativa'),(65,'Can add demanda',17,'add_demanda'),(66,'Can change demanda',17,'change_demanda'),(67,'Can delete demanda',17,'delete_demanda'),(68,'Can view demanda',17,'view_demanda'),(69,'Can add empresa',18,'add_empresa'),(70,'Can change empresa',18,'change_empresa'),(71,'Can delete empresa',18,'delete_empresa'),(72,'Can view empresa',18,'view_empresa'),(73,'Can add notificacio',19,'add_notificacio'),(74,'Can change notificacio',19,'change_notificacio'),(75,'Can delete notificacio',19,'delete_notificacio'),(76,'Can view notificacio',19,'view_notificacio'),(77,'Can add oferta',20,'add_oferta'),(78,'Can change oferta',20,'change_oferta'),(79,'Can delete oferta',20,'delete_oferta'),(80,'Can view oferta',20,'view_oferta'),(81,'Can add subscripcio',21,'add_subscripcio'),(82,'Can change subscripcio',21,'change_subscripcio'),(83,'Can delete subscripcio',21,'delete_subscripcio'),(84,'Can view subscripcio',21,'view_subscripcio'),(85,'Can add titol',22,'add_titol'),(86,'Can change titol',22,'change_titol'),(87,'Can delete titol',22,'delete_titol'),(88,'Can view titol',22,'view_titol'),(89,'Can add done spec',23,'add_donespec'),(90,'Can change done spec',23,'change_donespec'),(91,'Can delete done spec',23,'delete_donespec'),(92,'Can view done spec',23,'view_donespec'),(93,'Can add equip',24,'add_equip'),(94,'Can change equip',24,'change_equip'),(95,'Can delete equip',24,'delete_equip'),(96,'Can view equip',24,'view_equip'),(97,'Can add projecte',25,'add_projecte'),(98,'Can change projecte',25,'change_projecte'),(99,'Can delete projecte',25,'delete_projecte'),(100,'Can view projecte',25,'view_projecte'),(101,'Can add qualificacio',26,'add_qualificacio'),(102,'Can change qualificacio',26,'change_qualificacio'),(103,'Can delete qualificacio',26,'delete_qualificacio'),(104,'Can view qualificacio',26,'view_qualificacio'),(105,'Can add spec',27,'add_spec'),(106,'Can change spec',27,'change_spec'),(107,'Can delete spec',27,'delete_spec'),(108,'Can view spec',27,'view_spec'),(109,'Can add sprint',28,'add_sprint'),(110,'Can change sprint',28,'change_sprint'),(111,'Can delete sprint',28,'delete_sprint'),(112,'Can view sprint',28,'view_sprint');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borsApp_demanda`
--

DROP TABLE IF EXISTS `borsApp_demanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borsApp_demanda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borsApp_demanda`
--

LOCK TABLES `borsApp_demanda` WRITE;
/*!40000 ALTER TABLE `borsApp_demanda` DISABLE KEYS */;
/*!40000 ALTER TABLE `borsApp_demanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borsApp_empresa`
--

DROP TABLE IF EXISTS `borsApp_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borsApp_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `direccio` longtext NOT NULL,
  `poblacio` varchar(255) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `web` varchar(200) NOT NULL,
  `localitzacio` point NOT NULL,
  `descripcio` longtext NOT NULL,
  `imatge` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`),
  SPATIAL KEY `borsApp_empresa_localitzacio_id` (`localitzacio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borsApp_empresa`
--

LOCK TABLES `borsApp_empresa` WRITE;
/*!40000 ALTER TABLE `borsApp_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `borsApp_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borsApp_empresa_admins`
--

DROP TABLE IF EXISTS `borsApp_empresa_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borsApp_empresa_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `borsApp_empresa_admins_empresa_id_user_id_4617df85_uniq` (`empresa_id`,`user_id`),
  KEY `borsApp_empresa_admins_user_id_6af8cb69_fk_core_user_id` (`user_id`),
  CONSTRAINT `borsApp_empresa_admins_empresa_id_615f7001_fk_borsApp_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `borsApp_empresa` (`id`),
  CONSTRAINT `borsApp_empresa_admins_user_id_6af8cb69_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borsApp_empresa_admins`
--

LOCK TABLES `borsApp_empresa_admins` WRITE;
/*!40000 ALTER TABLE `borsApp_empresa_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `borsApp_empresa_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borsApp_empresa_adscripcio`
--

DROP TABLE IF EXISTS `borsApp_empresa_adscripcio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borsApp_empresa_adscripcio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL,
  `centre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `borsApp_empresa_adscripcio_empresa_id_centre_id_925d7576_uniq` (`empresa_id`,`centre_id`),
  KEY `borsApp_empresa_adscripcio_centre_id_d2d08829_fk_core_centre_id` (`centre_id`),
  CONSTRAINT `borsApp_empresa_adsc_empresa_id_584fc9c1_fk_borsApp_e` FOREIGN KEY (`empresa_id`) REFERENCES `borsApp_empresa` (`id`),
  CONSTRAINT `borsApp_empresa_adscripcio_centre_id_d2d08829_fk_core_centre_id` FOREIGN KEY (`centre_id`) REFERENCES `core_centre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borsApp_empresa_adscripcio`
--

LOCK TABLES `borsApp_empresa_adscripcio` WRITE;
/*!40000 ALTER TABLE `borsApp_empresa_adscripcio` DISABLE KEYS */;
/*!40000 ALTER TABLE `borsApp_empresa_adscripcio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borsApp_notificacio`
--

DROP TABLE IF EXISTS `borsApp_notificacio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borsApp_notificacio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registre` longtext NOT NULL,
  `enviament` datetime(6) DEFAULT NULL,
  `confirmacio` datetime(6) DEFAULT NULL,
  `oferta_id` int(11) NOT NULL,
  `usuari_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `borsApp_notificacio_oferta_id_usuari_id_da73e340_uniq` (`oferta_id`,`usuari_id`),
  KEY `borsApp_notificacio_usuari_id_432e1dd8_fk_core_user_id` (`usuari_id`),
  CONSTRAINT `borsApp_notificacio_oferta_id_8bcf6fbc_fk_borsApp_oferta_id` FOREIGN KEY (`oferta_id`) REFERENCES `borsApp_oferta` (`id`),
  CONSTRAINT `borsApp_notificacio_usuari_id_432e1dd8_fk_core_user_id` FOREIGN KEY (`usuari_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borsApp_notificacio`
--

LOCK TABLES `borsApp_notificacio` WRITE;
/*!40000 ALTER TABLE `borsApp_notificacio` DISABLE KEYS */;
/*!40000 ALTER TABLE `borsApp_notificacio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borsApp_oferta`
--

DROP TABLE IF EXISTS `borsApp_oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borsApp_oferta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inici` datetime(6) NOT NULL,
  `final` datetime(6) NOT NULL,
  `activa` tinyint(1) NOT NULL,
  `titol` varchar(255) NOT NULL,
  `descripcio` longtext NOT NULL,
  `creador_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borsApp_oferta_creador_id_72eb45ec_fk_core_user_id` (`creador_id`),
  KEY `borsApp_oferta_empresa_id_39510958_fk_borsApp_empresa_id` (`empresa_id`),
  CONSTRAINT `borsApp_oferta_creador_id_72eb45ec_fk_core_user_id` FOREIGN KEY (`creador_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `borsApp_oferta_empresa_id_39510958_fk_borsApp_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `borsApp_empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borsApp_oferta`
--

LOCK TABLES `borsApp_oferta` WRITE;
/*!40000 ALTER TABLE `borsApp_oferta` DISABLE KEYS */;
/*!40000 ALTER TABLE `borsApp_oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borsApp_oferta_cicles`
--

DROP TABLE IF EXISTS `borsApp_oferta_cicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borsApp_oferta_cicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oferta_id` int(11) NOT NULL,
  `cicle_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `borsApp_oferta_cicles_oferta_id_cicle_id_35228147_uniq` (`oferta_id`,`cicle_id`),
  KEY `borsApp_oferta_cicles_cicle_id_dfe64cfe_fk_core_cicle_id` (`cicle_id`),
  CONSTRAINT `borsApp_oferta_cicles_cicle_id_dfe64cfe_fk_core_cicle_id` FOREIGN KEY (`cicle_id`) REFERENCES `core_cicle` (`id`),
  CONSTRAINT `borsApp_oferta_cicles_oferta_id_f5363c47_fk_borsApp_oferta_id` FOREIGN KEY (`oferta_id`) REFERENCES `borsApp_oferta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borsApp_oferta_cicles`
--

LOCK TABLES `borsApp_oferta_cicles` WRITE;
/*!40000 ALTER TABLE `borsApp_oferta_cicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `borsApp_oferta_cicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borsApp_subscripcio`
--

DROP TABLE IF EXISTS `borsApp_subscripcio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borsApp_subscripcio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distancia` double NOT NULL,
  `creat` datetime(6) NOT NULL,
  `modificat` datetime(6) NOT NULL,
  `alumne_id` int(11) NOT NULL,
  `centre_educatiu_id` int(11) DEFAULT NULL,
  `centre_treball_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borsApp_subscripcio_alumne_id_5c12068b_fk_core_user_id` (`alumne_id`),
  KEY `borsApp_subscripcio_centre_educatiu_id_0c99fd46_fk_core_cent` (`centre_educatiu_id`),
  KEY `borsApp_subscripcio_centre_treball_id_154aa701_fk_borsApp_e` (`centre_treball_id`),
  CONSTRAINT `borsApp_subscripcio_alumne_id_5c12068b_fk_core_user_id` FOREIGN KEY (`alumne_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `borsApp_subscripcio_centre_educatiu_id_0c99fd46_fk_core_cent` FOREIGN KEY (`centre_educatiu_id`) REFERENCES `core_centre` (`id`),
  CONSTRAINT `borsApp_subscripcio_centre_treball_id_154aa701_fk_borsApp_e` FOREIGN KEY (`centre_treball_id`) REFERENCES `borsApp_empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borsApp_subscripcio`
--

LOCK TABLES `borsApp_subscripcio` WRITE;
/*!40000 ALTER TABLE `borsApp_subscripcio` DISABLE KEYS */;
/*!40000 ALTER TABLE `borsApp_subscripcio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borsApp_subscripcio_categories`
--

DROP TABLE IF EXISTS `borsApp_subscripcio_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borsApp_subscripcio_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscripcio_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `borsApp_subscripcio_cate_subscripcio_id_categoria_a782ca7f_uniq` (`subscripcio_id`,`categoria_id`),
  KEY `borsApp_subscripcio__categoria_id_187182ec_fk_core_cate` (`categoria_id`),
  CONSTRAINT `borsApp_subscripcio__categoria_id_187182ec_fk_core_cate` FOREIGN KEY (`categoria_id`) REFERENCES `core_categoria` (`id`),
  CONSTRAINT `borsApp_subscripcio__subscripcio_id_45c5c583_fk_borsApp_s` FOREIGN KEY (`subscripcio_id`) REFERENCES `borsApp_subscripcio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borsApp_subscripcio_categories`
--

LOCK TABLES `borsApp_subscripcio_categories` WRITE;
/*!40000 ALTER TABLE `borsApp_subscripcio_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `borsApp_subscripcio_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borsApp_subscripcio_cicles`
--

DROP TABLE IF EXISTS `borsApp_subscripcio_cicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borsApp_subscripcio_cicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscripcio_id` int(11) NOT NULL,
  `cicle_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `borsApp_subscripcio_cicles_subscripcio_id_cicle_id_64e9c2d6_uniq` (`subscripcio_id`,`cicle_id`),
  KEY `borsApp_subscripcio_cicles_cicle_id_004ecb63_fk_core_cicle_id` (`cicle_id`),
  CONSTRAINT `borsApp_subscripcio__subscripcio_id_7dc7f5cf_fk_borsApp_s` FOREIGN KEY (`subscripcio_id`) REFERENCES `borsApp_subscripcio` (`id`),
  CONSTRAINT `borsApp_subscripcio_cicles_cicle_id_004ecb63_fk_core_cicle_id` FOREIGN KEY (`cicle_id`) REFERENCES `core_cicle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borsApp_subscripcio_cicles`
--

LOCK TABLES `borsApp_subscripcio_cicles` WRITE;
/*!40000 ALTER TABLE `borsApp_subscripcio_cicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `borsApp_subscripcio_cicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borsApp_titol`
--

DROP TABLE IF EXISTS `borsApp_titol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borsApp_titol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `graduat` tinyint(1) NOT NULL,
  `data` date DEFAULT NULL,
  `descripcio` longtext NOT NULL,
  `alumne_id` int(11) NOT NULL,
  `centre_id` int(11) DEFAULT NULL,
  `cicle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borsApp_titol_alumne_id_31e29f62_fk_core_user_id` (`alumne_id`),
  KEY `borsApp_titol_centre_id_37d1692f_fk_core_centre_id` (`centre_id`),
  KEY `borsApp_titol_cicle_id_f89864d9_fk_core_cicle_id` (`cicle_id`),
  CONSTRAINT `borsApp_titol_alumne_id_31e29f62_fk_core_user_id` FOREIGN KEY (`alumne_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `borsApp_titol_centre_id_37d1692f_fk_core_centre_id` FOREIGN KEY (`centre_id`) REFERENCES `core_centre` (`id`),
  CONSTRAINT `borsApp_titol_cicle_id_f89864d9_fk_core_cicle_id` FOREIGN KEY (`cicle_id`) REFERENCES `core_cicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borsApp_titol`
--

LOCK TABLES `borsApp_titol` WRITE;
/*!40000 ALTER TABLE `borsApp_titol` DISABLE KEYS */;
INSERT INTO `borsApp_titol` VALUES (1,0,NULL,'',7,30,124);
/*!40000 ALTER TABLE `borsApp_titol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_categoria`
--

DROP TABLE IF EXISTS `core_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `descripcio` longtext,
  `pare_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`),
  KEY `core_categoria_pare_id_4218f562_fk_core_categoria_id` (`pare_id`),
  CONSTRAINT `core_categoria_pare_id_4218f562_fk_core_categoria_id` FOREIGN KEY (`pare_id`) REFERENCES `core_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_categoria`
--

LOCK TABLES `core_categoria` WRITE;
/*!40000 ALTER TABLE `core_categoria` DISABLE KEYS */;
INSERT INTO `core_categoria` VALUES (26,'Cicles Formatius de Formaci√≥ Professional',NULL,NULL),(27,'AF',NULL,26),(28,'AG',NULL,26),(29,'AR',NULL,26),(30,'CM',NULL,26),(31,'EA',NULL,26),(32,'EE',NULL,26),(33,'EO',NULL,26),(34,'FM',NULL,26),(35,'FS',NULL,26),(36,'HT',NULL,26),(37,'IA',NULL,26),(38,'IC',NULL,26),(39,'IE',NULL,26),(40,'IM',NULL,26),(41,'IP',NULL,26),(42,'IS',NULL,26),(43,'MP',NULL,26),(44,'QU',NULL,26),(45,'SA',NULL,26),(46,'SC',NULL,26),(47,'SM',NULL,26),(48,'TM',NULL,26),(49,'TX',NULL,26),(50,'AE',NULL,26);
/*!40000 ALTER TABLE `core_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_centre`
--

DROP TABLE IF EXISTS `core_centre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_centre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `direccio` longtext NOT NULL,
  `poblacio` varchar(255) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `web` varchar(200) NOT NULL,
  `localitzacio` point NOT NULL,
  `descripcio` longtext NOT NULL,
  `imatge` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `core_centre_localitzacio_id` (`localitzacio`)
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_centre`
--

LOCK TABLES `core_centre` WRITE;
/*!40000 ALTER TABLE `core_centre` DISABLE KEYS */;
INSERT INTO `core_centre` VALUES (1,'Institut La Pineda','C. de la Batlloria, s/n','Badalona','08917',1,'a8001421@xtec.cat','',_binary '\0\0\0\0\0\0\0\∆úO\Á@;˚πD@','',''),(2,'Institut Isaac Alb√©niz','Parc Serentill, s/n','Badalona','08915',1,'a8001431@xtec.cat','',_binary '\0\0\0\0\0\0\0ébãmˆ@4t`w∫D@','',''),(3,'Institut Eugeni d\'Ors','Av. Maresme, 192-212','Badalona','08918',1,'a8001443@xtec.cat','',_binary '\0\0\0\0\0\0\0´iç1\ @\ﬁ\"Õ´º∑D@','',''),(4,'Institut Anna Gironella de Mundet','Pg. Vall d\'Hebron, s/n','Barcelona','08035',1,'a8012714@xtec.cat','',_binary '\0\0\0\0\0\0\0Aê5Éı0@˜™\Ó¡∆∂D@','',''),(5,'Institut Montju√Øc','C. Cisell, 19','Barcelona','08038',1,'a8013093@xtec.cat','',_binary '\0\0\0\0\0\0\0Ä\›˝≤˙)@•¯ïZq≠D@','',''),(6,'Institut Joan d\'√Äustria','C. Selva de Mar, 211','Barcelona','08020',1,'a8013101@xtec.cat','',_binary '\0\0\0\0\0\0\0rògÚò@C†\“?CµD@','',''),(7,'Institut Jaume Balmes','C. Pau Claris, 121','Barcelona','08009',1,'a8013111@xtec.cat','',_binary '\0\0\0\0\0\0\0ûÒE\«JV@Û\‘\Ÿ?≤D@','',''),(8,'Institut Joan Bosc√†','Av. d\'Esplugues, 40','Barcelona','08034',1,'a8013123@xtec.cat','',_binary '\0\0\0\0\0\0\04U]´\ÿ\0@\›@\ﬂ\Ës±D@','',''),(9,'Institut Mois√®s Broggi','C. Sant Quint√≠, 32-50','Barcelona','08041',1,'a8013135@xtec.cat','',_binary '\0\0\0\0\0\0\03\≈m@Sh\È¥D@','',''),(10,'Institut Emperador Carles','C. Enric Barg√©s, 9-13','Barcelona','08014',1,'a8013147@xtec.cat','',_binary '\0\0\0\0\0\0\0¢]\Ãi+@R\À˙¿⁄∞D@','',''),(11,'Institut Infanta Isabel d\'Arag√≥','Pl. d\'Angeleta Ferrer, 1','Barcelona','08020',1,'a8013159@xtec.cat','',_binary '\0\0\0\0\0\0\0Ú\„êIò@g!\ËEµD@','',''),(12,'Institut Poeta Maragall','C. Proven√ßa, 187','Barcelona','08036',1,'a8013160@xtec.cat','',_binary '\0\0\0\0\0\0\0ó∏A@*´Û\Ï≤D@','',''),(13,'Institut Ausi√†s March','Av. d\'Esplugues, 38','Barcelona','08034',1,'a8013172@xtec.cat','',_binary '\0\0\0\0\0\0\0ñêw]´\ÿ\0@\›@\ﬂ\Ës±D@','',''),(14,'Institut Bernat Metge','C. Menorca, 55','Barcelona','08020',1,'a8013184@xtec.cat','',_binary '\0\0\0\0\0\0\0ö±Sù@†©˝Ù$∂D@','',''),(15,'Institut Mil√† i Fontanals','Pl. Josep Ma. Folch i Torres, s/n','Barcelona','08001',1,'a8013196@xtec.cat','',_binary '\0\0\0\0\0\0\0DªmS˙a@è\¬O®∞D@','',''),(16,'Institut Montserrat','C. Cop√®rnic, 84','Barcelona','08006',1,'a8013202@xtec.cat','',_binary '\0\0\0\0\0\0\0c6.%@\ ¯4}o≥D@','',''),(17,'Institut Narc√≠s Monturiol','C. Harmonia, s/n','Barcelona','08035',1,'a8013214@xtec.cat','',_binary '\0\0\0\0\0\0\05¥s-i#@õ{NÄ∑D@','',''),(18,'Institut Men√©ndez y Pelayo','Via Augusta, 140','Barcelona','08006',1,'a8013226@xtec.cat','',_binary '\0\0\0\0\0\0\0m\Ónπà(@JØùç4≥D@','',''),(19,'Institut Verdaguer','Parc de la Ciutadella, s/n','Barcelona','08003',1,'a8013238@xtec.cat','',_binary '\0\0\0\0\0\0\0o±ÀÖ?@∆Ä\Ô≠=∑D@','',''),(20,'Institut Escola del Treball','C. Comte d\'Urgell, 187','Barcelona','08036',1,'a8013275@xtec.cat','',_binary '\0\0\0\0\0\0\0˚UÅ∏1@:©ÉJ…±D@','',''),(21,'Institut Sant Andreu','C. Badosa, 10-14','Barcelona','08016',1,'a8013366@xtec.cat','',_binary '\0\0\0\0\0\0\0yz\’eYq@M_öe∏D@','',''),(22,'Institut Rambla Prim','C. Crist√≤bal de Moura, 223','Barcelona','08019',1,'a8013469@xtec.cat','',_binary '\0\0\0\0\0\0\0v0Nª≥@\‰Y™6µD@','',''),(23,'Institut Barri Bes√≤s','C. Pujadas, 397','Barcelona','08019',1,'a8013470@xtec.cat','',_binary '\0\0\0\0\0\0\0e\Èƒó\È¥@\œ)Ø2¶¥D@','',''),(24,'Institut Ferran Tallada','C. Gran Vista, 54','Barcelona','08032',1,'a8014115@xtec.cat','',_binary '\0\0\0\0\0\0\0Ã∫ò\…\‰N@\·“ô\ ŒµD@','',''),(25,'Institut Josep Serrat i Bonastre','C. Marqu√®s de Santa Anna, 4','Barcelona','08023',1,'a8014188@xtec.cat','',_binary '\0\0\0\0\0\0\0Ø~\ÃL/@¥`ò¥D@','',''),(26,'Institut Juan Manuel Zafra','C. Rogent, 51','Barcelona','08026',1,'a8014206@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ïû-w@1è	ÏÇ¥D@','',''),(27,'Institut Mare de D√©u de la Merc√®','C. Motors, 122-130','Barcelona','08040',1,'a8014401@xtec.cat','',_binary '\0\0\0\0\0\0\0\Íø*æq\'@v∑˜»¨D@','',''),(28,'Institut Guillem de Bergued√†','Cam√≠ de Pedret, 2','Berga','08600',1,'a8014693@xtec.cat','',_binary '\0\0\0\0\0\0\0\›-?∏˝?Q%0¡\rE@','',''),(29,'Institut Bisbe Sivilla','C. Valldebanador, 39','Calella','08370',1,'a8015171@xtec.cat','',_binary '\0\0\0\0\0\0\0pO\„ 5@,`?\Z\«\ŒD@','',''),(30,'Institut Esteve Terradas i Illa','<p>C. Bonavista, 70</p>','Cornell√† de Llobregat','08940',1,'a8016781@xtec.cat','',_binary '\0\0\0\0\0\0\0\Í\‚KZù\0@çüyõ≠D@','',''),(31,'Institut Francesc Maci√†','C. Joan Maragall, 42','Cornell√† de Llobregat','08940',1,'a8016793@xtec.cat','',_binary '\0\0\0\0\0\0\0≥ˇê\0@Ü≠óÆπ≠D@','',''),(32,'Institut Severo Ochoa','C. Severo Ochoa, 1-13','Esplugues de Llobregat','08950',1,'a8017131@xtec.cat','',_binary '\0\0\0\0\0\0\0gy\n¯∂∂\0@}»ò◊ØD@','',''),(33,'Institut Joanot Martorell','C. Sant Mateu, 30-32','Esplugues de Llobregat','08950',1,'a8017153@xtec.cat','',_binary '\0\0\0\0\0\0\0\≈\‹\ŸJÙ\≈\0@g¡YÑÅ∞D@','',''),(34,'Institut de Bruguers','C. Jaume I, 4','Gav√†','08850',1,'a8017530@xtec.cat','',_binary '\0\0\0\0\0\0\0p\≈0\Ìº\0@\„Wö˛¶ßD@','',''),(35,'Institut Antoni Cumella','C. Roger de Flor, s/n','Granollers','08401',1,'a8017931@xtec.cat','',_binary '\0\0\0\0\0\0\0AA˘ £B@\Ô!ı_¶\ÕD@','',''),(36,'Institut Santa Eul√†lia','Pl. Pius XII, s/n','L\'Hospitalet de Llobregat','08902',1,'a8019307@xtec.cat','',_binary '\0\0\0\0\0\0\0ciáè\Ì@≤*ºÆD@','',''),(37,'Institut Pedraforca','C. Enginyer Moncunill, 2','L\'Hospitalet de Llobregat','08905',1,'a8019319@xtec.cat','',_binary '\0\0\0\0\0\0\0›è\«K∏\Â\0@™=aìπØD@','',''),(38,'Institut Torras i Bages','Av. Can Serra, 101','L\'Hospitalet de Llobregat','08906',1,'a8019320@xtec.cat','',_binary '\0\0\0\0\0\0\0)\0p3Ø\œ\0@LÚ(\ÎÆD@','',''),(39,'Institut Llobregat','C. Enric Prat de la Riba, 11-17','L\'Hospitalet de Llobregat','08901',1,'a8019371@xtec.cat','',_binary '\0\0\0\0\0\0\0\’.û(¶\Í\0@´\Ÿ\’tïÆD@','',''),(40,'Institut Proven√ßana','C. de Sant Pius X, 8','L\'Hospitalet de Llobregat','08901',1,'a8019401@xtec.cat','',_binary '\0\0\0\0\0\0\0QﬂÆ\÷\Í\0@\‡J*\ﬁ~ÆD@','',''),(41,'Institut Bellvitge','Av. Am√®rica, 99','L\'Hospitalet de Llobregat','08907',1,'a8019411@xtec.cat','',_binary '\0\0\0\0\0\0\0\»ZåJ\Í\0@•D˛\ÿ%≠D@','',''),(42,'Institut Pere Vives i Vich','Av. Emili Vall√®s, 17','Igualada','08700',1,'a8019630@xtec.cat','',_binary '\0\0\0\0\0\0\0)Dç0Øù˘?wp®\∆\ D@','',''),(43,'Institut Lacet√†nia','Av. Bases de Manresa, 51-59','Manresa','08240',1,'a8020462@xtec.cat','',_binary '\0\0\0\0\0\0\0uC\‚<˝?\'Ç¡\0E\ﬁD@','',''),(44,'Institut Llu√≠s de Peguera','Pl. Espanya, 2','Manresa','08240',1,'a8020474@xtec.cat','',_binary '\0\0\0\0\0\0\0:¯;tw6˝?N—†á\›D@','',''),(45,'Institut Pompeu Fabra','C. F√®lix Duran i Canyameres, 3','Martorell','08760',1,'a8020620@xtec.cat','',_binary '\0\0\0\0\0\0\0Øüâæ˛?\Ì†’≥ºD@','',''),(46,'Institut Maremar','Av. Cus√≠ Fortunet, 52','El Masnou','08320',1,'a8020826@xtec.cat','',_binary '\0\0\0\0\0\0\0\÷\Á ù\"í@XYæD@','',''),(47,'Institut Mediterr√†nia','C. Rosa Sensat, s/n','El Masnou','08320',1,'a8020838@xtec.cat','',_binary '\0\0\0\0\0\0\0^mˇ©<n@\…53jfΩD@','',''),(48,'Institut Miquel Biada','C. Puig i Cadafalch, 89','Matar√≥','08303',1,'a8021259@xtec.cat','',_binary '\0\0\0\0\0\0\0\ÿkB¶Òm@^]\ƒ\≈D@','',''),(49,'Institut Alexandre Satorras','Av. Vel√≤drom, s/n','Matar√≥','08304',1,'a8021260@xtec.cat','',_binary '\0\0\0\0\0\0\07\€Ñ@Ú\“Mb\∆D@','',''),(50,'Institut Dami√† Campeny','Pl. dels Bous, 5','Matar√≥','08301',1,'a8021302@xtec.cat','',_binary '\0\0\0\0\0\0\0á)Hnxé@@°sæe\≈D@','',''),(51,'Institut Llu√≠s de Requesens','C. Felip Canalias, 19-23','Molins de Rei','08750',1,'a8021430@xtec.cat','',_binary '\0\0\0\0\0\0\0µ\ÃE#o&\0@\ÁÙx˛\r¥D@','',''),(52,'Institut de Mollet del Vall√®s','Av. Burgos, 96','Mollet del Vall√®s','08100',1,'a8021594@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ë\\†ê‹ß@çtm\ƒD@','',''),(53,'Institut Vicen√ß Plantada','C. Palau de Plegamans, 8','Mollet del Vall√®s','08100',1,'a8021600@xtec.cat','',_binary '\0\0\0\0\0\0\0«Ωf™Aß@MK¢\ZS\≈D@','',''),(54,'Institut Montserrat Mir√≥ i Vila','C. Carrerada, s/n','Montcada Centre','08110',1,'a8021788@xtec.cat','',_binary '\0\0\0\0\0\0\0ﬂÜ{\Ÿx@5≥üﬁæD@','',''),(55,'Institut Baldiri Guilera','C. Mestre Vigo Garreta, 1','El Prat de Llobregat','08820',1,'a8023131@xtec.cat','',_binary '\0\0\0\0\0\0\0(≥7¥•∑\0@˛p{uZ©D@','',''),(56,'Institut Escola Industrial','C. Calder√≥n, 56','Sabadell','08201',1,'a8024741@xtec.cat','',_binary '\0\0\0\0\0\0\0-\Ï]\÷\0@\ﬁpR™\Z\∆D@','',''),(57,'Institut Arraona','C. Praga, 43','Sabadell','08207',1,'a8024765@xtec.cat','',_binary '\0\0\0\0\0\0\0qSÇL“ø\0@˛\’\Ëw\»D@','',''),(58,'Institut Egara','C. Am√©rica, 55(Can Parellada)','Terrassa','08228',1,'a8024777@xtec.cat','',_binary '\0\0\0\0\0\0\0Ö\’l¶¡S\0@\Ÿyd\ƒD@','',''),(59,'Institut Pau Vila','C. Viladomat, 118','Sabadell','08205',1,'a8024871@xtec.cat','',_binary '\0\0\0\0\0\0\0ﬁ£ôOü\Œ\0@^R\\%˝\ƒD@','',''),(60,'Institut Ferran Casablancas','C. Mare de les Aig√ºes, 2','Sabadell','08206',1,'a8024881@xtec.cat','',_binary '\0\0\0\0\0\0\0\€w!*º\0@a[b\Œ\«D@','',''),(61,'Institut Castellarnau','Carretera N-150, Km. 15','Sabadell','08206',1,'a8024893@xtec.cat','',_binary '\0\0\0\0\0\0\0\„Rï∂∏Ü\0@\r•ˆ\"\⁄\∆D@','',''),(62,'Institut Camps Blancs','Av. Arag√≥, 40','Sant Boi de Llobregat','08830',1,'a8025605@xtec.cat','',_binary '\0\0\0\0\0\0\0íﬂ†ízD\0@∑p¯[Ω™D@','',''),(63,'Institut Joaquim Rubi√≥ i Ors','C. Pau Claris, 4','Sant Boi de Llobregat','08830',1,'a8025654@xtec.cat','',_binary '\0\0\0\0\0\0\0#\∆Gò]L\0@WπC\œ’´D@','',''),(64,'Institut Olorda','C. Carles Buigas, s/n','Sant Feliu de Llobregat','08980',1,'a8026397@xtec.cat','',_binary '\0\0\0\0\0\0\0ëÂ∫Øm\0@”ææx4±D@','',''),(65,'Institut Francesc Ferrer i Gu√†rdia','Av. de la Generalitat, 30','Sant Joan Desp√≠','08970',1,'a8026683@xtec.cat','',_binary '\0\0\0\0\0\0\0q\"ö‹Ç\0@£\…\·mGØD@','',''),(66,'Institut Puig Castellar','C. Anselm Rius, 10','Santa Coloma de Gramenet','08924',1,'a8028047@xtec.cat','',_binary '\0\0\0\0\0\0\0ø∂]\Ï\Êõ@Mò\Á\√^∫D@','',''),(67,'Institut de Terrassa','Rbla. d\'Egara, 331','Terrassa','08224',1,'a8030339@xtec.cat','',_binary '\0\0\0\0\0\0\0Ù±*ﬁ¢	\0@]/\—\…\»D@','',''),(68,'Institut Investigador Blanxart','C. Granada, 3','Terrassa','08226',1,'a8030340@xtec.cat','',_binary '\0\0\0\0\0\0\0)ZG\¬;\0@~ø-\…D@','',''),(69,'Institut de Vic','Av. Sant Bernat Calb√≥, 8','Vic','08500',1,'a8031022@xtec.cat','',_binary '\0\0\0\0\0\0\0~™ûC@cL:¨˜D@','',''),(70,'Institut Jaume Call√≠s','Av. Ol√≠mpia, 2','Vic','08500',1,'a8031034@xtec.cat','',_binary '\0\0\0\0\0\0\06{ˆ\—\Ó@C¸\0˙v˜D@','',''),(71,'Institut Torre Roja','Av. dels Jocs Ol√≠mpics, 8','Viladecans','08840',1,'a8031228@xtec.cat','',_binary '\0\0\0\0\0\0\0˛ù¸¸H$\0@=“µ6Z©D@','',''),(72,'Institut Francesc Xavier Lluch i Rafecas','C. Doctor Zamenhof, 30','Vilanova i la Geltr√∫','08800',1,'a8031681@xtec.cat','',_binary '\0\0\0\0\0\0\0[\ÔÆ\Ë_˚?&πñ•júD@','',''),(73,'Institut Manuel de Cabanyes','Av. Francesc Maci√†, 110-114','Vilanova i la Geltr√∫','08800',1,'a8031711@xtec.cat','',_binary '\0\0\0\0\0\0\0b¯¸\„~˚?\0ëAòbúD@','',''),(74,'Institut Forat del Vent','Pizarro, 35','Cerdanyola del Vall√®s','08290',1,'a8031757@xtec.cat','',_binary '\0\0\0\0\0\0\0§ª\»]¥.@v–û+GæD@','',''),(75,'Institut Can Jofresa','Av. Can Jofresa, 9','Terrassa','08223',1,'a8031770@xtec.cat','',_binary '\0\0\0\0\0\0\0¨<e[$.\0@∞\ZıWb\∆D@','',''),(76,'Institut Valldemossa','C. Pintor Alsamora, 7-9','Barcelona','08016',1,'a8031812@xtec.cat','',_binary '\0\0\0\0\0\0\0Ûi¶_Hq@Ãï2äî∑D@','',''),(77,'Institut Illa dels Banyols','C. Lo Gaiter del Llobregat, 121-123','El Prat de Llobregat','08820',1,'a8031836@xtec.cat','',_binary '\0\0\0\0\0\0\0xé•h\–\0@eks]™D@','',''),(78,'Institut Leonardo da Vinci','Ctra. de Sant Cugat a Rub√≠, s/n','Sant Cugat del Vall√®s','08190',1,'a8031861@xtec.cat','',_binary '\0\0\0\0\0\0\0≥µ\ﬂVQn\0@f`™∫ÉΩD@','',''),(79,'Institut Arnau Cadell','Av. Villadelprat, 91-93','Sant Cugat del Vall√®s','08190',1,'a8031873@xtec.cat','',_binary '\0\0\0\0\0\0\0\›\Ô\«\"é\0@\€–∫D@','',''),(80,'Institut Mitjans Audiovisuals','Via Laietana, 48-A','Barcelona','08003',1,'a8032385@xtec.cat','',_binary '\0\0\0\0\0\0\0´z˘ù&g@Xè=s}±D@','',''),(81,'Institut Pau Casals','Av. Lloreda, 16-32','Badalona','08917',1,'a8033869@xtec.cat','',_binary '\0\0\0\0\0\0\06Éı\0\Õ@SxâóπD@','',''),(82,'Institut Joan Coromines','Ctra. de la Bordeta, 39-41','Barcelona','08014',1,'a8033882@xtec.cat','',_binary '\0\0\0\0\0\0\0xé\–\Ëq(@Iºè¬ØD@','',''),(83,'Institut Pr√≠ncep de Girona','Travessera de Gr√†cia, 357','Barcelona','08025',1,'a8033894@xtec.cat','',_binary '\0\0\0\0\0\0\0Xa|ñX@å3-Å9¥D@','',''),(84,'Institut Joan Mir√≥','Av. Mare de D√©u de Montserrat, s/n','Cornell√† de Llobregat','08940',1,'a8033900@xtec.cat','',_binary '\0\0\0\0\0\0\0GµÄ∑›è\0@\Ô:Úœ¨D@','',''),(85,'Institut Merc√® Rodoreda','Rbla. Marina, 393','L\'Hospitalet de Llobregat','08907',1,'a8033912@xtec.cat','',_binary '\0\0\0\0\0\0\0Òßz\‘\0@õEúñ≠D@','',''),(86,'Institut Pius Font i Quer','C. Amadeu Vives, s/n','Manresa','08240',1,'a8033924@xtec.cat','',_binary '\0\0\0\0\0\0\0Üm»ï3a˝?Ω|\¬D\…\ﬁD@','',''),(87,'Institut Rafael Casanova','C. Frederic Mompou, 41-45','Sant Boi de Llobregat','08830',1,'a8033961@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ó\Á&\«#<\0@@0Vâ≠D@','',''),(88,'Institut Jaume Salvador i Pedrol','C. Sant Mart√≠ de l\'Erm, 4','Sant Joan Desp√≠','08970',1,'a8033973@xtec.cat','',_binary '\0\0\0\0\0\0\0K\√Û…ø\0@?“†õOØD@','',''),(89,'Institut de Sant Just Desvern','Pg. de la Muntanya, s/n','Sant Just Desvern','08960',1,'a8033985@xtec.cat','',_binary '\0\0\0\0\0\0\0µáK˚◊õ\0@ë>\'i±D@','',''),(90,'Institut Terra Roja','Circumval¬∑laci√≥, 45-57','Santa Coloma de Gramenet','08923',1,'a8034001@xtec.cat','',_binary '\0\0\0\0\0\0\0∫h\nïfº@UˇÄŒ∏D@','',''),(91,'Institut Frederic Mompou','Av. Mas Pic√≥, 65-69','Sant Vicen√ß dels Horts','08620',1,'a8034011@xtec.cat','',_binary '\0\0\0\0\0\0\0SkÄ#ò\Íˇ?$Ä0±D@','',''),(92,'Institut Federica Montseny','C. Oporto, s/n','Badia del Vall√®s','08214',1,'a8034035@xtec.cat','',_binary '\0\0\0\0\0\0\0\ﬂp\ÿ\„©\Ê\0@t∏ß\¬W¡D@','',''),(93,'Institut Nicolau Cop√®rnic','C. del Torrent del Batlle, 10','Terrassa','08225',1,'a8034059@xtec.cat','',_binary '\0\0\0\0\0\0\0\⁄_\‡3æÒˇ?n\È®\’\›\»D@','',''),(94,'Institut Poblenou','C. Doctor Josep Trueta, 206','Barcelona','08005',1,'a8034138@xtec.cat','',_binary '\0\0\0\0\0\0\0\È\ﬂY†@\€\\à¸≤D@','',''),(95,'Institut Dom√®nec Perramon','Paratge Torrent d\'en Terra, s/n','Arenys de Munt','08358',1,'a8034187@xtec.cat','',_binary '\0\0\0\0\0\0\0◊º\À¡CK@Cõ?M=\œD@','',''),(96,'Institut La Guineueta','C. Artesania, 53-55','Barcelona','08042',1,'a8034205@xtec.cat','',_binary '\0\0\0\0\0\0\0{&l`@ÿ§á´∏D@','',''),(97,'Institut Bernat el Ferrer','C. Nostra Senyora de Lourdes, 34','Molins de Rei','08750',1,'a8034217@xtec.cat','',_binary '\0\0\0\0\0\0\0Öˇ¢7\0@\ŒN÷ç¥D@','',''),(98,'Institut Les Corts','Travessera de les Corts, 131-159','Barcelona','08028',1,'a8034564@xtec.cat','',_binary '\0\0\0\0\0\0\0\ﬂqR\‰Ö@úük*Œ∞D@','',''),(99,'Institut Joan Salvat i Papasseit','Pg. Salvat Papasseit, s/n','Barcelona','08003',1,'a8034576@xtec.cat','',_binary '\0\0\0\0\0\0\0\Z\¬Œ†\„á@l¸fªÚ∞D@','',''),(100,'Institut Joan Oliver','C. Armand Obiols, 2-30','Sabadell','08207',1,'a8034591@xtec.cat','',_binary '\0\0\0\0\0\0\0,\∆+÷ëØ\0@Ù¶¸M#\…D@','',''),(101,'Institut Baix Montseny','Pl.. de Muriel Casals, 2','Sant Celoni','08470',1,'a8034606@xtec.cat','',_binary '\0\0\0\0\0\0\0}˚éo\\\€@\›R^\œ\ÿD@','',''),(102,'Institut de Sales','C. Antonio Machado, 43','Viladecans','08840',1,'a8034621@xtec.cat','',_binary '\0\0\0\0\0\0\0l\"\"8\0@Æèπ¯º®D@','',''),(103,'Institut Les Vinyes','C. Am√®rica, 53','Santa Coloma de Gramenet','08924',1,'a8034643@xtec.cat','',_binary '\0\0\0\0\0\0\0Û[\œ_•@∞ø@ûä∫D@','',''),(104,'Institut Bonanova','Pg. de Circumval¬∑laci√≥, 8','Barcelona','08003',1,'a8035039@xtec.cat','',_binary '\0\0\0\0\0\0\0pMõ \”~@ós†A±D@','',''),(105,'Institut Miquel Mart√≠ i Pol','Av. Mare de D√©u de Montserrat, 51','Cornell√† de Llobregat','08940',1,'a8035143@xtec.cat','',_binary '\0\0\0\0\0\0\0 \œ˛•\‰è\0@¯ÉÒ;‹¨D@','',''),(106,'Institut Els Tres Turons','Ptge. Tres Turons, 1','Arenys de Mar','08350',1,'a8035155@xtec.cat','',_binary '\0\0\0\0\0\0\0\ÍˆCÄîW@\÷\◊v∑ã\ D@','',''),(107,'Institut Barcelona-Congr√©s','C. Bar√≥ d\'Esponell√†, 1-15','Barcelona','08031',1,'a8035167@xtec.cat','',_binary '\0\0\0\0\0\0\0ÇÛ?ıb@äEΩÙ∂D@','',''),(108,'Institut Pablo R. Picasso','C. Sant Feliu de Codines, 1','Barcelona','08033',1,'a8035209@xtec.cat','',_binary '\0\0\0\0\0\0\0[\€-,,r@\»¿\Ó∫D@','',''),(109,'Institut Manuel Blancafort','Av. 11 de Setembre, s/n','La Garriga','08530',1,'a8035222@xtec.cat','',_binary '\0\0\0\0\0\0\0\“¿uNZ@\ÿl≤4\Z\◊D@','',''),(110,'Institut Vil¬∑la Romana','C. Santa Maria del Cam√≠, s/n','La Garriga','08530',1,'a8035234@xtec.cat','',_binary '\0\0\0\0\0\0\0bÉÄ\⁄zF@\‹˜\‚jh\÷D@','',''),(111,'Institut Gelida','C. de Joan Pascual i Batlle, 1-15','Gelida','08790',1,'a8035246@xtec.cat','',_binary '\0\0\0\0\0\0\0¡Yµµ\«˝?˜\Î~∞¥∏D@','',''),(112,'Institut Apel¬∑les Mestres','C. Zuloaga, s/n','L\'Hospitalet de Llobregat','08906',1,'a8035258@xtec.cat','',_binary '\0\0\0\0\0\0\0∫7a†π\0@Ò\‰ˆrØÆD@','',''),(113,'Institut Palau Ausit','Ctra. de Santiga, s/n','Ripollet','08291',1,'a8035295@xtec.cat','',_binary '\0\0\0\0\0\0\02Kh∂6@RS[Ç˝øD@','',''),(114,'Institut Duc de Montblanc','Av. Can Fatj√≥, s/n','Rub√≠','08191',1,'a8035301@xtec.cat','',_binary '\0\0\0\0\0\0\0®ND∑/\0@y˜¸cæD@','',''),(115,'Institut Quercus','Av. Montserrat, 95','Sant Joan de Vilatorrada','08250',1,'a8035313@xtec.cat','',_binary '\0\0\0\0\0\0\02\À…Ñí\€¸?˛IÒî\ﬂD@','',''),(116,'Institut Torrent de les Bruixes','C. Santa Eul√†lia, s/n','Santa Coloma de Gramenet','08921',1,'a8035325@xtec.cat','',_binary '\0\0\0\0\0\0\0£õ ëÜ∏@ùå¸äç∫D@','',''),(117,'Institut La Rom√†nica','Rda.. de Santa Maria, 310','Barber√† del Vall√®s','08210',1,'a8035349@xtec.cat','',_binary '\0\0\0\0\0\0\0\¬Ò8\È\÷@f7Ló2\√D@','',''),(118,'Institut Alt Pened√®s','Av. de Tarragona, s/n','Vilafranca del Pened√®s','08720',1,'a8035362@xtec.cat','',_binary '\0\0\0\0\0\0\0ﬂóá˙˙?öZ\»ˆ™D@','',''),(119,'Institut Mig-M√≥n','C. Ramon i Cajal, 9-11','S√∫ria','08260',1,'a8042044@xtec.cat','',_binary '\0\0\0\0\0\0\01µGO˜˚?ÿ∂êñ∂\ÍD@','',''),(120,'Institut J.V. Foix','Can Sempere, s/n','Rub√≠','08191',1,'a8036330@xtec.cat','',_binary '\0\0\0\0\0\0\0w\–Ù+\0Úˇ?⁄Øå$˘¿D@','',''),(121,'Institut Arquitecte Manuel Raspall','Av. Mare de D√©u de Montserrat, s/n','Cardedeu','08440',1,'a8036391@xtec.cat','',_binary '\0\0\0\0\0\0\0\÷G\ÿ\Â@\‚\¬=s\Ô\“D@','',''),(122,'Institut La Vall de Tenes','Cam√≠ de la Rovira, s/n','La Sagrera','08187',1,'a8036998@xtec.cat','',_binary '\0\0\0\0\0\0\0∞ûX|J\√@\÷B†%\”D@','',''),(123,'Institut Joan Or√≥','C. Feliu Duran i Canyameres, 7','Martorell','08760',1,'a8037152@xtec.cat','',_binary '\0\0\0\0\0\0\0Øüâæ˛?\Ì†’≥ºD@','',''),(124,'Institut La Bastida','C. Santa Eul√†lia, s/n','Santa Coloma de Gramenet','08921',1,'a8037176@xtec.cat','',_binary '\0\0\0\0\0\0\0£õ ëÜ∏@ùå¸äç∫D@','',''),(125,'Institut Llu√≠s Companys','Ctra. de l\'Estaci√≥, s/n','Ripollet','08291',1,'a8037206@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ÿ¿SQá4@=D_øD@','',''),(126,'E.S.Art Dramat. de l\'Institut del Teatre','Pl. Margarida Xirgu, s/n','Barcelona','08004',1,'a8038399@xtec.cat','',_binary '\0\0\0\0\0\0\0Q\…x\ÀA@WÉ-ØD@','',''),(127,'Institut L\'Alzina','Ptge. Salvador Riera, s/n','Barcelona','08027',1,'a8039057@xtec.cat','',_binary '\0\0\0\0\0\0\0&¥õ\œon@\Ì\ÕÚY∂D@','',''),(128,'Institut Margarida Xirgu','Trav. de Collblanch, 56','L\'Hospitalet de Llobregat','08904',1,'a8039069@xtec.cat','',_binary '\0\0\0\0\0\0\0ß\◊8+:Û\0@π\›\Ïã∞D@','',''),(129,'Institut Agust√≠ Serra i Fontanet','C. Vallmany√†, 13-15','Sabadell','08207',1,'a8039203@xtec.cat','',_binary '\0\0\0\0\0\0\0Ñó˜p}\À\0@ªÚ8ê\»D@','',''),(130,'Institut La Valira','C. de l\'Orri, 66','La Seu d\'Urgell','25700',1,'c5009186@xtec.cat','',_binary '\0\0\0\0\0\0\0B=Ø.˜?´c](U-E@','',''),(131,'Institut La Sedeta','C. Ind√∫stria, 67-73','Barcelona','08025',1,'a8040138@xtec.cat','',_binary '\0\0\0\0\0\0\0Ñ®“ÅrX@\Ÿˇ\rï◊≥D@','',''),(132,'Institut Ic√†ria','C. Doctor Trueta, 81','Barcelona','08005',1,'a8040141@xtec.cat','',_binary '\0\0\0\0\0\0\0Kp†í@øæ£¥a≤D@','',''),(133,'Institut La Llauna','C. Sagunto, 5 (edifici la Llauna)','Badalona','08912',1,'a8040527@xtec.cat','',_binary '\0\0\0\0\0\0\0\·\√\‡Ú<ˆ@\"_¯w¨∏D@','',''),(134,'Institut Les Marines','Cam√≠ Ral de Val√®ncia, 12','Castelldefels','08860',1,'a8040539@xtec.cat','',_binary '\0\0\0\0\0\0\0\∆\„⁄±ˇ?Ç\—O≤£D@','',''),(135,'Institut El Cairat','C. Gorgon√ßana, 1','Esparreguera','08292',1,'a8040540@xtec.cat','',_binary '\0\0\0\0\0\0\0\«\‰V™ˆ˝?≤+(j˚\ƒD@','',''),(136,'Institut Antoni Pous i Argila','Av. Roma, 260','Manlleu','08560',1,'a8040552@xtec.cat','',_binary '\0\0\0\0\0\0\0P%π≤˙1@\Ÿ\r\ÍAR\0E@','',''),(137,'Institut Jaume Almera','C. Rafart, 5','Vilassar de Dalt','08339',1,'a8040564@xtec.cat','',_binary '\0\0\0\0\0\0\0ë_ù5\„@`¿ª™\¬D@','',''),(138,'Institut Fort Pius','C. Ausias March, 78','Barcelona','08013',1,'a8040849@xtec.cat','',_binary '\0\0\0\0\0\0\0\\$Ä5p@ºb9Ny≤D@','',''),(139,'Institut La Mallola','C. Andreu Amat, 11','Esplugues de Llobregat','08950',1,'a8041374@xtec.cat','',_binary '\0\0\0\0\0\0\0}++∞t¨\0@\‰ã+k±∞D@','',''),(140,'Institut Mart√≠ Dot','C. Josep Teixidor, 2-12','Sant Feliu de Llobregat','08980',1,'a8041519@xtec.cat','',_binary '\0\0\0\0\0\0\0`ˇ≠9Q\0@óà\ƒ¯A±D@','',''),(141,'Institut El Calamot','Av. Joan Carles I, 62','Gav√†','08850',1,'a8041866@xtec.cat','',_binary '\0\0\0\0\0\0\0∏¿¬¢R\Áˇ?Pı\0/ßD@','',''),(142,'Institut Rubi√≥ i Tudur√≠','Av. Francesc Ferrer i Gu√†rdia, 16','Barcelona','08038',1,'a8041933@xtec.cat','',_binary '\0\0\0\0\0\0\0\∆Hññ0@∞\‘˜=QØD@','',''),(143,'Institut Badalona VII','C. Ausi√†s March, 86','Badalona','08912',1,'a8042019@xtec.cat','',_binary '\0\0\0\0\0\0\0»µZç\Â@1n\’˚∏D@','',''),(144,'Institut Vall√®s','C. Valent√≠ Almirall, s/n','Sabadell','08206',1,'a8042020@xtec.cat','',_binary '\0\0\0\0\0\0\0\…R62\∆\0@ˆén0\∆D@','',''),(145,'Institut Can Puig','C. Joan Maragall, s/n','Sant Pere de Ribes','08810',1,'a8042056@xtec.cat','',_binary '\0\0\0\0\0\0\0¨4∑ØÙK¸?Ö0ß_°D@','',''),(146,'Institut Vinyes Velles','Av. de Barcelona, 2','Montorn√®s Centre','08170',1,'a8042093@xtec.cat','',_binary '\0\0\0\0\0\0\0ï\ﬁ/MÆ@,Fñc\≈D@','',''),(147,'Institut Manuel V√°zquez Montalb√°n','Av. Eduard Maristany, 59-61','Sant Adri√† de Bes√≤s','08930',1,'a8042101@xtec.cat','',_binary '\0\0\0\0\0\0\0?}¸å®\‘@\«Ú \–(∂D@','',''),(148,'Institut Sant Ramon','Pl. de Les Fabricantes, 1','Cardona','08261',1,'a8042330@xtec.cat','',_binary '\0\0\0\0\0\0\0∑‘à3õ\‰˙?ö&l?ıD@','',''),(149,'Institut de Badia del Vall√®s','C. Mallorca, s/n','Badia del Vall√®s','08214',1,'a8042342@xtec.cat','',_binary '\0\0\0\0\0\0\0π>i\ËÙ\0@>öp\Ã¿D@','',''),(150,'Institut Llu√Øsa Cura','Rda.. Sant Antoni, 19','Barcelona','08011',1,'a8042573@xtec.cat','',_binary '\0\0\0\0\0\0\03\Ë5N@rLN°æ∞D@','',''),(151,'Institut Alexandre de Riquer','C. Joan Baptista de la Salle, 6 i 8','Calaf','08280',1,'a8043395@xtec.cat','',_binary '\0\0\0\0\0\0\0bï˚≤\Ó6¯?ÜÒ\–\0©\›D@','',''),(152,'Institut Ernest Lluch','C. Diputaci√≥, 15','Barcelona','08015',1,'a8043462@xtec.cat','',_binary '\0\0\0\0\0\0\0\ŒÚe75@˘‹úYq∞D@','',''),(153,'Institut Manolo Hugu√©','C. Josep Germ√†, 2','Caldes de Montbui','08140',1,'a8043486@xtec.cat','',_binary '\0\0\0\0\0\0\0;°j$`@ñ\Íû\–D@','',''),(154,'Institut Pere Calders','Campus U.A.B.','Cerdanyola del Vall√®s','08193',1,'a8043504@xtec.cat','',_binary '\0\0\0\0\0\0\07Ç\\B\”\0@˙\‹R\Ã\÷¿D@','',''),(155,'Institut Salvador Dal√≠','Av. Pare Andreu de Palma de Mallorca,1-3','El Prat de Llobregat','08820',1,'a8043589@xtec.cat','',_binary '\0\0\0\0\0\0\0|àØ§\–\0@Fé\»T™D@','',''),(156,'Institut Carles Vallbona','Camp de les Moreres, 14','Granollers','08401',1,'a8043644@xtec.cat','',_binary '\0\0\0\0\0\0\0yÄuº\ÃC@ºZ|w\‹\ÃD@','',''),(157,'Institut Marina','C. Estaci√≥, s/n','La Llagosta','08120',1,'a8043656@xtec.cat','',_binary '\0\0\0\0\0\0\0B%\Ÿ„∏ë@`Å\ÍJÑ¡D@','',''),(158,'Institut L\'Estatut','C. Flammarion, 1','Rub√≠','08191',1,'a8043668@xtec.cat','',_binary '\0\0\0\0\0\0\0ä´\Ê[T\0@¬É≠¨	øD@','',''),(159,'Institut El Palau','C. Empord√†, 7-13','Sant Andreu de la Barca','08740',1,'a8043671@xtec.cat','',_binary '\0\0\0\0\0\0\0\ﬁpGbˇ?y§,	1∫D@','',''),(160,'Institut Marianao','Pg. de les Mimoses, 18','Sant Boi de Llobregat','08830',1,'a8043681@xtec.cat','',_binary '\0\0\0\0\0\0\0F\Ì\œ\\\ﬂ/\0@Æø{\0∏¨D@','',''),(161,'Institut Joaquim Mir','Av. Vilafranca, s/n','Vilanova i la Geltr√∫','08800',1,'a8043693@xtec.cat','',_binary '\0\0\0\0\0\0\0\ƒR	Øü˚?ˇA3n;ûD@','',''),(162,'Institut Daniel Blanxart i Pedrals','C. Vall d\'Aran, 96-98','Olesa de Montserrat','08640',1,'a8043978@xtec.cat','',_binary '\0\0\0\0\0\0\0\€?π\Á•D˛?N±ëI\∆D@','',''),(163,'Institut Joan Ramon Benapr√®s','Cam√≠ de la Fita, s/n','Sitges','08870',1,'a8043981@xtec.cat','',_binary '\0\0\0\0\0\0\0CM\‡B¯¸?Ò3\ÏüD@','',''),(164,'Institut Salvador Segu√≠','C. Santander, 7-9','Barcelona','08020',1,'a8044053@xtec.cat','',_binary '\0\0\0\0\0\0\0\„∏5\‰˝í@\Ôø\È\Î&∂D@','',''),(165,'Institut Galileo Galilei','C. Mol√≠, 57','Barcelona','08016',1,'a8044065@xtec.cat','',_binary '\0\0\0\0\0\0\0Ôº∫Ns@oéB\Î∏D@','',''),(166,'Institut Pla de les Moreres','C. Crist√≤for Colom, s/n','Vilanova del Cam√≠','08788',1,'a8044168@xtec.cat','',_binary '\0\0\0\0\0\0\0:\ÍUUIC˙?@‹é÷º\»D@','',''),(167,'Institut La Ferreria','C. del Progr√©s, 3','Montcada Centre','08110',1,'a8044533@xtec.cat','',_binary '\0\0\0\0\0\0\0\◊\'7~V@∏\◊=\næD@','',''),(168,'Institut Pere Barnils','Av. Pere Barnils, s/n','Centelles','08540',1,'a8044569@xtec.cat','',_binary '\0\0\0\0\0\0\0@\·vª@∂=\◊}õ\ÊD@','',''),(169,'Institut Vall d\'Ar√∫s','C. Mestres Esqu√® i Art√≥, 2','Vallirana Centre','08759',1,'a8044570@xtec.cat','',_binary '\0\0\0\0\0\0\0Fñ_éˇ?8\‚\Ï}∫±D@','',''),(170,'Institut Giola','C. Tulipa, s/n','Llinars del Vall√®s','08450',1,'a8044594@xtec.cat','',_binary '\0\0\0\0\0\0\0]\\H_ø.@2{U>∂\“D@','',''),(171,'Institut Moian√®s','C. de l\'Institut, 2','Moi√†','08180',1,'a8044600@xtec.cat','',_binary '\0\0\0\0\0\0\0\“\n	°N\Ã\0@G¨\ `:\ÁD@','',''),(172,'Institut Torre de Malla','Av. Espanya, 116','Parets del Vall√®s','08150',1,'a8044612@xtec.cat','',_binary '\0\0\0\0\0\0\0\÷aÿ£h\Ã@0çW]\»D@','',''),(173,'Institut Sabadell','C. Juvenal, 1','Sabadell','08206',1,'a8044624@xtec.cat','',_binary '\0\0\0\0\0\0\0\”)\Ã—úÆ\0@f]vd˘\∆D@','',''),(174,'Institut Jaume Mim√≥','C. Serra dels Galliners, s/n','Cerdanyola del Vall√®s','08290',1,'a8044715@xtec.cat','',_binary '\0\0\0\0\0\0\0\ƒk\‡\”@7\"á§0øD@','',''),(175,'Institut Dr. Puigvert','Pg. de Santa Coloma, 46-54','Barcelona','08030',1,'a8044922@xtec.cat','',_binary '\0\0\0\0\0\0\0\À^¢πœã@p°y†πD@','',''),(176,'Institut Escola d\'Hoteleria i Turisme de Barcelona','C. Pintor Alsamora, 3-5','Barcelona','08016',1,'a8044934@xtec.cat','',_binary '\0\0\0\0\0\0\0–îˆ6òr@›≤9äê∑D@','',''),(177,'Institut Josep Pla','C. Vall d\'Ordesa, 24-34','Barcelona','08031',1,'a8044958@xtec.cat','',_binary '\0\0\0\0\0\0\0\‰òeáP@\–Q¯ÄA∑D@','',''),(178,'Institut Pere Fontdevila','Pont de les Eres, 4','Gironella','08680',1,'a8044971@xtec.cat','',_binary '\0\0\0\0\0\0\0ò\ŸE£\À˛?Ä\ÂøBE@','',''),(179,'Institut Barres i Ones','Ctra. Antiga de Val√®ncia, 95','Badalona','08913',1,'a8044995@xtec.cat','',_binary '\0\0\0\0\0\0\0ú\Áä}\¬\ƒ@\≈\‰Ò\⁄∏D@','',''),(180,'Institut Torre del Palau','Can Boada del Pi, s/n','Terrassa','08225',1,'a8045011@xtec.cat','',_binary '\0\0\0\0\0\0\0G\Ã-˜ˇ?|∫dj\…D@','',''),(181,'Institut Estela Ib√®rica','Ptge. de Mas Granollacs, s/n','Santa Perp√®tua de Mogoda','08130',1,'a8045021@xtec.cat','',_binary '\0\0\0\0\0\0\0èÆ(\ﬁ.{@\·∞%\≈v\√D@','',''),(182,'Institut Europa','Av. Europa, 153','L\'Hospitalet de Llobregat','08907',1,'a8045070@xtec.cat','',_binary '\0\0\0\0\0\0\0èèF†\"\Ë\0@æ£.hç≠D@','',''),(183,'Institut Obert de Catalunya','Av. del Paral¬∑lel, 71-73','Barcelona','08004',1,'a8045203@xtec.cat','',_binary '\0\0\0\0\0\0\0û\ÂÛ6®X@-8o\€¯ØD@','',''),(184,'Institut Escola Intermunicipal del Pened√®s','Pl. Santiago Rusi√±ol, s/n','Sant Sadurn√≠ d\'Anoia','08770',1,'a8045239@xtec.cat','',_binary '\0\0\0\0\0\0\0∑ça_¸?õrC[\'∂D@','',''),(185,'Institut Ramon Casas i Carb√≥','C. Lluis Companys, 2','Palau-solit√† i Plegamans','08184',1,'a8045306@xtec.cat','',_binary '\0\0\0\0\0\0\0„¶∞ôi@&\œ\Ôz\ÀD@','',''),(186,'Institut Vila de Gr√†cia','C. Riera de Sant Miquel, 58-62','Barcelona','08006',1,'a8045483@xtec.cat','',_binary '\0\0\0\0\0\0\0Çg≤\Á=@ãçÅ≥D@','',''),(187,'Institut Flos i Calcat','Av. Rio de Janeiro, 92','Barcelona','08016',1,'a8045513@xtec.cat','',_binary '\0\0\0\0\0\0\0Úá\„t@&ç&∏D@','',''),(188,'Institut Manuel Carrasco i Formiguera','C. Santa Fe, 2','Barcelona','08031',1,'a8045525@xtec.cat','',_binary '\0\0\0\0\0\0\0®Çs\Êc@\∆\‰r[ô∂D@','',''),(189,'Institut Josep Llu√≠s Sert','Cam√≠ Ral de Val√®ncia, 10','Castelldefels','08860',1,'a8045537@xtec.cat','',_binary '\0\0\0\0\0\0\0\∆\„⁄±ˇ?Ç\—O≤£D@','',''),(190,'Institut Ban√∫s','C. Sant Casimir, 16','Cerdanyola del Vall√®s','08290',1,'a8045549@xtec.cat','',_binary '\0\0\0\0\0\0\0)\n$\√@æ˛†øD@','',''),(191,'Institut Can Planas','C. Folch i Torres, 1','Barber√† del Vall√®s','08210',1,'a8045562@xtec.cat','',_binary '\0\0\0\0\0\0\0∂¿\·Ø@ë@êw\¬D@','',''),(192,'Institut Enric Borr√†s','Ptge. Encants, s/n','Badalona','08914',1,'a8045604@xtec.cat','',_binary '\0\0\0\0\0\0\00p	X\\\–@ón\r\ ∆∏D@','',''),(193,'Institut Celest√≠ Bellera','C. Esteve Terrades, s/n','Granollers','08402',1,'a8045628@xtec.cat','',_binary '\0\0\0\0\0\0\0v;0ΩSR@\ÏV45\ÃD@','',''),(194,'Institut Llu√≠s Dom√®nech i Montaner','C. Francesc Camb√≥, 2','Canet de Mar','08360',1,'a8045641@xtec.cat','',_binary '\0\0\0\0\0\0\0\“\«Õáüó@(ø.ãï\ÀD@','',''),(195,'Institut Dolors Mallafr√® i Ros','C. Doctor Zamenhof, 57','Vilanova i la Geltr√∫','08800',1,'a8045653@xtec.cat','',_binary '\0\0\0\0\0\0\0JYU˚?yú\≈2ÕúD@','',''),(196,'Institut Ramon Turr√≥ i Darder','Av. Tarragona, 4-12','Malgrat de Mar','08380',1,'a8045665@xtec.cat','',_binary '\0\0\0\0\0\0\0\ÀÛe\œ\Â@\≈2\» °\“D@','',''),(197,'Institut Thalassa','Av. de la Uni√≥ , s/n','Montgat','08390',1,'a8045677@xtec.cat','',_binary '\0\0\0\0\0\0\0˝\Ï\¬˙.@cû\œ_¨ªD@','',''),(198,'Institut Voltrera','Pg. de l\'Estaci√≥, 18','Entitat Oest d\'Abrera','08630',1,'a8045689@xtec.cat','',_binary '\0\0\0\0\0\0\0\ﬂ.)Æín˛?\n˘Ωõ\¬D@','',''),(199,'Institut de Corbera de Llobregat','C. Andr√≤meda, 2','Corbera de Llobregat','08757',1,'a8045859@xtec.cat','',_binary '\0\0\0\0\0\0\0a;}\‹5ˇ?A \≈p›µD@','',''),(200,'Institut Miramar','Av. Miramar, 16','Viladecans','08840',1,'a8045860@xtec.cat','',_binary '\0\0\0\0\0\0\0ôsw=õ\0@∞çM2ø®D@','',''),(201,'Institut Llu√≠s Vives','C. Canalejas, 107','Barcelona','08028',1,'a8046581@xtec.cat','',_binary '\0\0\0\0\0\0\0¨C\Œ¯G@h∂[-òØD@','',''),(202,'Institut Pr√≠ncep de Viana','C. Torroella de Montgr√≠, 6-18','Barcelona','08027',1,'a8046608@xtec.cat','',_binary '\0\0\0\0\0\0\0 ó\ÀU~@)4Uü«∂D@','',''),(203,'Institut Mol√≠ de la Vila','C. Doctor Fleming, 24','Capellades','08786',1,'a8046645@xtec.cat','',_binary '\0\0\0\0\0\0\0nºH\\X˚˙?!PòX\"\ƒD@','',''),(204,'Institut Joaquim Blume','C. Sant Mateu, 27-37','Esplugues de Llobregat','08950',1,'a8046657@xtec.cat','',_binary '\0\0\0\0\0\0\0\Á\„!&Ω\ƒ\0@w§F]u∞D@','',''),(205,'Institut Ribot i Serra','C. Concha Espina, 33','Sabadell','08204',1,'a8046669@xtec.cat','',_binary '\0\0\0\0\0\0\0\È\‚∏Q9\Â\0@\∆!U\√D@','',''),(206,'Institut Angeleta Ferrer i Sensat','C. Granollers, 43','Sant Cugat del Vall√®s','08190',1,'a8046670@xtec.cat','',_binary '\0\0\0\0\0\0\0XáÄú`í\0@ ©\»\·ΩD@','',''),(207,'Institut de Castellar','C. Carrasco i Formiguera, 6','Castellar del Vall√®s','08211',1,'a8046682@xtec.cat','',_binary '\0\0\0\0\0\0\0†No∞™\0@\”8úE$\ŒD@','',''),(208,'Institut Centre d\'Alt Rendiment Esportiu','Av. Alcalde Barnils, s/n','Sant Cugat del Vall√®s','08174',1,'a8046694@xtec.cat','',_binary '\0\0\0\0\0\0\0Ø|zíû\0@≥ıÆoWæD@','',''),(209,'Institut Montserrat Roig','C. Cervantes, 46','Terrassa','08221',1,'a8046724@xtec.cat','',_binary '\0\0\0\0\0\0\0¨¢ì3Å\0@L¬û\‘\»D@','',''),(210,'Institut Thos i Codina','Riera de Cirera, 57','Matar√≥','08304',1,'a8046748@xtec.cat','',_binary '\0\0\0\0\0\0\0;±\∆Zıy@Æ÷éÑk\∆D@','',''),(211,'Institut Ventura Gassol','Av. M√≥naco, 36-50','Badalona','08917',1,'a8046751@xtec.cat','',_binary '\0\0\0\0\0\0\0\Õº)\¬@0G>ò∫D@','',''),(212,'Institut Guillem Cat√†','C. de Rosa Sensat, 6-8','Manresa','08243',1,'a8046761@xtec.cat','',_binary '\0\0\0\0\0\0\0≤5ôv˝?ÊÇæ\ÍÑ\›D@','',''),(213,'Institut d\'Alella','Av. del Bosquet, 7','Alella','08328',1,'a8046785@xtec.cat','',_binary '\0\0\0\0\0\0\0Ee\Èamf@`B`@JøD@','',''),(214,'Institut Laia l\'Arquera','C. Ciutat Freta, 26','Matar√≥','08302',1,'a8046797@xtec.cat','',_binary '\0\0\0\0\0\0\0/“•.w@œª“ÆY\ƒD@','',''),(215,'Institut Vilatzara','Av. Arquitecte Eduard Farr√©s, 101','Vilassar de Mar','08340',1,'a8046803@xtec.cat','',_binary '\0\0\0\0\0\0\0q˙\\h%@\÷B$¡D@','',''),(216,'Institut Castellet','C. Bisbe Perell√≥, s/n','Sant Vicen√ß de Castellet','08295',1,'a8046840@xtec.cat','',_binary '\0\0\0\0\0\0\0™!ïU\—˝?í\‚AÖÛ\’D@','',''),(217,'Institut Llavaneres','Pg. del Perell√≥, 2','Sant Andreu de Llavaneres','08392',1,'a8046852@xtec.cat','',_binary '\0\0\0\0\0\0\0¥√≥í\√\Ë@#Ω®\…D@','',''),(218,'Institut Bellulla','Pl. de l\'Ajuntament, s/n','Bellulla','08420',1,'a8046864@xtec.cat','',_binary '\0\0\0\0\0\0\0äú¯¨7@\ZC\›`ò\œD@','',''),(219,'Institut Miquel Bosch i Jover','C. Arquitecte Gaud√≠, 2-4','Art√©s','08271',1,'a8046876@xtec.cat','',_binary '\0\0\0\0\0\0\0E\Âa\ÃV1ˇ?S\”hQ£\ÂD@','',''),(220,'Institut Joan Mercader','C. Sant Vicen√ß, 27','Igualada','08700',1,'a8047364@xtec.cat','',_binary '\0\0\0\0\0\0\0\0˛u\„\Á˚˘?\–\¬Y¢W\ D@','',''),(221,'Institut Secretari Coloma','C. Secretari Coloma, 25','Barcelona','08025',1,'a8047421@xtec.cat','',_binary '\0\0\0\0\0\0\0∑:.\ZR@d§å$¥D@','',''),(222,'Institut XXV Olimp√≠ada','C. D√†lia, s/n','Barcelona','08004',1,'a8047431@xtec.cat','',_binary '\0\0\0\0\0\0\0æ∑˚≤:-@§∂±2JØD@','',''),(223,'Institut Alexandre Gal√≠','C. Miquel Servet, s/n','Les Roquetes','08812',1,'a8047467@xtec.cat','',_binary '\0\0\0\0\0\0\0;.k\·\0˙˚?üã+ùD@','',''),(224,'Institut Alba del Vall√®s','Av. Bux√≥ Baliarda, 3','Sant Fost de Campsentelles','08105',1,'a8047479@xtec.cat','',_binary '\0\0\0\0\0\0\0D©U•A\ﬁ@érˆ\Ôˆ\¬D@','',''),(225,'Institut Ribera Baixa','C. de l\'Aneto, 2-4','El Prat de Llobregat','08820',1,'a8047492@xtec.cat','',_binary '\0\0\0\0\0\0\0\ﬁ=˘!Z≤\0@˝ìﬁàÖ©D@','',''),(226,'Institut √çtaca','C. Bonaventura Calopa, 15-21','Sant Boi de Llobregat','08830',1,'a8047509@xtec.cat','',_binary '\0\0\0\0\0\0\0ÛØH^\0@ªw¸®´D@','',''),(227,'Institut Sant Quirze del Vall√®s','C. Bages, 21','Sant Quirze del Vall√®s','08192',1,'a8047583@xtec.cat','',_binary '\0\0\0\0\0\0\0N¯0qó\0@[\\ç3†\ƒD@','',''),(228,'Institut Crist√≤fol Colom','C. Mollerussa, s/n','Barcelona','08030',1,'a8047698@xtec.cat','',_binary '\0\0\0\0\0\0\0û†@‰ú§@a\ \„%∏D@','',''),(229,'Institut Guinovarda','C. Pompeu Fabra, 17','Piera','08784',1,'a8047820@xtec.cat','',_binary '\0\0\0\0\0\0\0ÄÄ˘¸?^öÖ\Í\‰\√D@','',''),(230,'Institut Eduard Fontser√®','C. Mimoses, 31','L\'Hospitalet de Llobregat','08905',1,'a8051264@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ï\ÿ˛Q\‰\0@\rø$`˜ÆD@','',''),(231,'Institut de Puig-reig','Pg. Riera de la Sala, 3','Puig-reig','08692',1,'a8052207@xtec.cat','',_binary '\0\0\0\0\0\0\0|`\Ëç˛?´\’∆±¸D@','',''),(232,'Institut Miquel Tarradell','C. dels √Ängels, 1 bis','Barcelona','08001',1,'a8052581@xtec.cat','',_binary '\0\0\0\0\0\0\0ß\∆˛rX@G#ÆÇ\È∞D@','',''),(233,'Institut Pau Claris','Pg. Llu√≠s Companys, 18','Barcelona','08018',1,'a8052608@xtec.cat','',_binary '\0\0\0\0\0\0\0\–\—\Ï\\s@a.ãÑ≤D@','',''),(234,'Institut Vall d\'Hebron','Pg. de la Vall d\'Hebron, 93-95','Barcelona','08035',1,'a8052700@xtec.cat','',_binary '\0\0\0\0\0\0\0}M}\Ë @\„•J}!∂D@','',''),(235,'Institut Francisco de Goya','C. Garriga i Roca, 21','Barcelona','08041',1,'a8052724@xtec.cat','',_binary '\0\0\0\0\0\0\0|CNP§Z@ë©°^∂D@','',''),(236,'Institut Josep Comas i Sol√†','Via Barcino, s/n','Barcelona','08033',1,'a8052761@xtec.cat','',_binary '\0\0\0\0\0\0\05∑û\Èâ@~è ≥∏πD@','',''),(237,'Institut Salvador Espriu','Pl. de les Gl√≤ries Catalanes, 20','Barcelona','08018',1,'a8052797@xtec.cat','',_binary '\0\0\0\0\0\0\0º∂\À@VtÛ¶≈≥D@','',''),(238,'Institut Consell de Cent','C. Carrera, 25','Barcelona','08004',1,'a8052839@xtec.cat','',_binary '\0\0\0\0\0\0\0¸Ù|&+e@\ 8¡ØD@','',''),(239,'Institut d\'Argentona','C. Peons Caminers, 25','Argentona','08310',1,'a8052876@xtec.cat','',_binary '\0\0\0\0\0\0\0JÉ˘0@@cmØ¨Ñ\∆D@','',''),(240,'Institut J√∫lia Minguell','C. Ni√ßa, 4 (apartat 544)','Badalona','08913',1,'a8052888@xtec.cat','',_binary '\0\0\0\0\0\0\0πúÙπ8∏@Æ$¢-!∏D@','',''),(241,'Institut L\'Alt Bergued√†','Av. Salarich, 29','Bag√†','08695',1,'a8052891@xtec.cat','',_binary '\0\0\0\0\0\0\09p>›è\◊˝?˜¨\Ô\Ï@ E@','',''),(242,'Institut Lauro','C. Ast√∫ries, 3','Bellavista','08520',1,'a8052906@xtec.cat','',_binary '\0\0\0\0\0\0\0ƒì\Èf@°§2XÄ\œD@','',''),(243,'Institut Bisbe Berenguer','C. Aprestadora, 49','L\'Hospitalet de Llobregat','08902',1,'a8052918@xtec.cat','',_binary '\0\0\0\0\0\0\0∑¡±∞•@>±≈£ëÆD@','',''),(244,'Institut de Lli√ß√†','Av. dels Pa√Øsos Catalans, 26','Lli√ß√† d\'Amunt','08186',1,'a8052955@xtec.cat','',_binary '\0\0\0\0\0\0\0eñV¶Ú@Û\Ô∂\ÕD@','',''),(245,'Institut Josep Puig i Cadafalch','C. Sant Josep de Calassan√ß, 16','Matar√≥','08303',1,'a8052979@xtec.cat','',_binary '\0\0\0\0\0\0\0®§5£ri@[e,\Ó\Õ\≈D@','',''),(246,'Institut Montmel√≥','Av. Mil¬∑lenari, 19','Montmel√≥','08160',1,'a8052980@xtec.cat','',_binary '\0\0\0\0\0\0\0¢HnÇ¨\Ì@ö\∆˛ã\∆D@','',''),(247,'Institut Euclides','C. Passeig d\'Europa, 65','Pineda de Mar','08397',1,'a8052992@xtec.cat','',_binary '\0\0\0\0\0\0\0Am\Z∞[@[,Y\÷|\œD@','',''),(248,'Institut Castell de Quer','C. Mateu Garreta, s/n','Prats de Llu√ßan√®s','08513',1,'a8053005@xtec.cat','',_binary '\0\0\0\0\0\0\02\‡Z]∂@\0@ˆ∂\Ó\ÂE@','',''),(249,'Institut Valeri√† Pujol i Bosch','Pg. de Can Balet, s/n','Premi√† de Dalt','08338',1,'a8053017@xtec.cat','',_binary '\0\0\0\0\0\0\0}%tΩã\Ã@\‘c£C¿D@','',''),(250,'Institut de la Roca del Vall√®s','Pl. Sant Jordi, s/n (APl. correus 128)','La Roca del Vall√®s','08430',1,'a8053030@xtec.cat','',_binary '\0\0\0\0\0\0\0<òˆ»ò@Lî\√Y\ÀD@','',''),(251,'Institut Gerbert d\'Aurillac','Av. Llu√≠s Companys, s/n','Sant Fruit√≥s de Bages','08272',1,'a8053054@xtec.cat','',_binary '\0\0\0\0\0\0\0¿$\≈b¸˝˝?êq\Ô±\‡D@','',''),(252,'Institut Num√†ncia','C. Prat de la Riba, 118','Santa Coloma de Gramenet','08921',1,'a8053078@xtec.cat','',_binary '\0\0\0\0\0\0\0Ò\Ã\Z®Ø@\ !+Ωã∫D@','',''),(253,'Institut El Foix','C. Maria Aur√®lia Capmany, s/n','Els Monjos','08730',1,'a8053091@xtec.cat','',_binary '\0\0\0\0\0\0\0—®¯sïÑ˙?±+9©D@','',''),(254,'Institut Reguissol','Pg. Reguissol, 1','Santa Maria de Palautordera','08460',1,'a8053108@xtec.cat','',_binary '\0\0\0\0\0\0\0\ÏáaR?â@Ú≤§Ñ\ŸD@','',''),(255,'Institut d\'Auro','C. del Convent, 20','Santpedor','08251',1,'a8053111@xtec.cat','',_binary '\0\0\0\0\0\0\0\›=\ƒ/r˝?\Êm2\À\Z\‰D@','',''),(256,'Institut Taradell','C. Pompeu Fabra, 12','Taradell','08552',1,'a8053121@xtec.cat','',_binary '\0\0\0\0\0\0\0u\Ë=xO@;\Ôû©\ÔD@','',''),(257,'Institut Castellbisbal','Pla√ßa Llu√≠s Companys, 7','Castellbisbal','08755',1,'a8053145@xtec.cat','',_binary '\0\0\0\0\0\0\0CD%e∏ˇ?ó˝Ú}<ΩD@','',''),(258,'Institut Gorgs','C. de l\'√Äliga, 65','Cerdanyola del Vall√®s','08290',1,'a8053157@xtec.cat','',_binary '\0\0\0\0\0\0\0\Z\Ô\Z6\¬	@4ÆîrræD@','',''),(259,'Institut Matadepera','Av. del Mas Sot, 4- 10','Matadepera','08230',1,'a8053169@xtec.cat','',_binary '\0\0\0\0\0\0\0ÆLI\Ì}:\0@ê\È∑\ÃD@','',''),(260,'Institut Poliny√†','Av. Sabadell, 1-3','Poliny√†','08213',1,'a8053170@xtec.cat','',_binary '\0\0\0\0\0\0\0,\’wµ3@d\À=º\«D@','',''),(261,'Institut La Serreta','C. Lepant, 1','Rub√≠','08191',1,'a8053182@xtec.cat','',_binary '\0\0\0\0\0\0\0Gb\‚å\ÍG\0@rMjπøD@','',''),(262,'Institut Miquel Crusafont i Pair√≥','C. Fuerteventura, 51-71','Sabadell','08205',1,'a8053200@xtec.cat','',_binary '\0\0\0\0\0\0\0ΩB\À,’∏\0@\Óî\Ë\›\≈D@','',''),(263,'Institut Jonqueres','C. Somport, 30','Sabadell','08207',1,'a8053212@xtec.cat','',_binary '\0\0\0\0\0\0\0;6˝7æ\0@A;c<#\…D@','',''),(264,'Institut Les Termes','C. Illa Bella, 20','Sabadell','08204',1,'a8053224@xtec.cat','',_binary '\0\0\0\0\0\0\0ﬁí¥\Ã˙\0@\Z¢π˜\√D@','',''),(265,'Institut Rovira-Forns','C. Tierno Galvan, 77','Santa Perp√®tua de Mogoda','08130',1,'a8053236@xtec.cat','',_binary '\0\0\0\0\0\0\0ß≈Ä\Ô≠m@^˙il\«\√D@','',''),(266,'Institut de Sentmenat','C. Poca Farina, s/n','Sentmenat','08181',1,'a8053248@xtec.cat','',_binary '\0\0\0\0\0\0\0¿îÅZ\Z@°QÙüy\ÕD@','',''),(267,'Institut Cavall Bernat','C. la Castellassa, s/n','Terrassa','08227',1,'a8053251@xtec.cat','',_binary '\0\0\0\0\0\0\05ﬂß˚@\0@üÆØ1\ D@','',''),(268,'Institut de Viladecavalls','Vial de Sant Jordi, s/n','Viladecavalls','08232',1,'a8053261@xtec.cat','',_binary '\0\0\0\0\0\0\0\0òvFXˇ?7FMÇ\«D@','',''),(269,'Institut El Castell','C. Barcelona, 91','Esparreguera','08292',1,'a8053285@xtec.cat','',_binary '\0\0\0\0\0\0\0y!Úùe¸˝?´ùOáO\ƒD@','',''),(270,'Institut de Pallej√†','Cam√≠ de Can Coll, s/n','Pallej√†','08780',1,'a8053297@xtec.cat','',_binary '\0\0\0\0\0\0\0àç\–‘ç\›ˇ?#MÙµ∂D@','',''),(271,'Institut Gabriela Mistral','C. Osca, 95-105','Sant Vicen√ß dels Horts','08620',1,'a8053340@xtec.cat','',_binary '\0\0\0\0\0\0\0\rG	Z~Òˇ? íñ‘ç≤D@','',''),(272,'Institut Montbui','C. de la Merc√®, 9','Santa Margarida de Montbui','08710',1,'a8053352@xtec.cat','',_binary '\0\0\0\0\0\0\0#à¶ò≠˘??;®\ƒ\…D@','',''),(273,'Institut Josep Mestres i Busquets','C. Ferran i Clua, 19','Viladecans','08840',1,'a8053364@xtec.cat','',_binary '\0\0\0\0\0\0\0∫´.\0@™Ω{å!®D@','',''),(274,'Institut Gallecs','Pg. Cesc Bas, 3','Mollet del Vall√®s','08100',1,'a8054034@xtec.cat','',_binary '\0\0\0\0\0\0\0πq¿ÎâØ@b{Vg/\∆D@','',''),(275,'Institut La Ribera','C. Larramendi, s/n','Montcada Centre','08110',1,'a8054174@xtec.cat','',_binary '\0\0\0\0\0\0\0∑Ö&\n¶Ç@£-jΩD@','',''),(276,'Institut Can Mas','C. Pau Casals, 102-104','Ripollet','08291',1,'a8054186@xtec.cat','',_binary '\0\0\0\0\0\0\0}â°j.N@∫Æ\·\Á¿D@','',''),(277,'Institut Estany de la Ricarda','C. Salvador Espriu, 1-3','El Prat de Llobregat','08820',1,'a8054198@xtec.cat','',_binary '\0\0\0\0\0\0\0C*U:	\Õ\0@\‘^ÛìÚ©D@','',''),(278,'Institut Joan Fuster','Pl. Ferran Reyes, 2-3','Barcelona','08027',1,'a8054228@xtec.cat','',_binary '\0\0\0\0\0\0\0\«^µS\Ô|@*YﬂêµD@','',''),(279,'Institut Eugeni Xammar','Antic Cam√≠ de Bigues, s/n','L\'Ametlla del Vall√®s','08480',1,'a8054241@xtec.cat','',_binary '\0\0\0\0\0\0\0∂.\“Ñ@çí˜t,\÷D@','',''),(280,'Institut de Tona','C. Torres i Bages, 32','Tona','08551',1,'a8054277@xtec.cat','',_binary '\0\0\0\0\0\0\0ü~ä¬≤\ @ï?ˆ≤a\ÏD@','',''),(281,'Institut El Sui','C. Penyafort, s/n','Cardedeu','08440',1,'a8054401@xtec.cat','',_binary '\0\0\0\0\0\0\0aâ\ÊÖd\Í@B•¢ï!\”D@','',''),(282,'Institut Bosc de Montju√Øc','Av. Miramar, s/n','Barcelona','08038',1,'a8054848@xtec.cat','',_binary '\0\0\0\0\0\0\0\‰I\»\√R@µe0ÆGØD@','',''),(283,'Institut Joaquima Pla i Farreras','Av. Ragull, 45-49','Sant Cugat del Vall√®s','08190',1,'a8054873@xtec.cat','',_binary '\0\0\0\0\0\0\0\n-y©…π\0@WQÖ8ΩD@','',''),(284,'Institut Rubi√≥ i Ors','C. Mol√≠, 24','L\'Hospitalet de Llobregat','08906',1,'a8055944@xtec.cat','',_binary '\0\0\0\0\0\0\0ojìœö\œ\0@Ö»¥˘)ØD@','',''),(285,'Institut Can Vilumara','Av. de Josep Tarradellas i Joan, 153','L\'Hospitalet de Llobregat','08901',1,'a8056109@xtec.cat','',_binary '\0\0\0\0\0\0\0\⁄=fJ\’\0@;@·ÄÆD@','',''),(286,'Institut Ramon Berenguer IV','C. Ramon Berenguer, 157','Santa Coloma de Gramenet','08924',1,'a8056985@xtec.cat','',_binary '\0\0\0\0\0\0\0\“\Èj˝©@≥}e1sªD@','',''),(287,'Institut Cubelles','C. Josep Pla, s/n','Cubelles','08880',1,'a8057230@xtec.cat','',_binary '\0\0\0\0\0\0\0M~òxò≤˙?}±\÷‘¢ôD@','',''),(288,'Institut Pere Ribot','C. Santa Eug√®nia, 62-72','Vilassar de Mar','08340',1,'a8057254@xtec.cat','',_binary '\0\0\0\0\0\0\0î√∑@c˛\œ6>¿D@','',''),(289,'Institut Joan Brossa','Av. Mare de D√©u de Montserrat, 78-84','Barcelona','08024',1,'a8057540@xtec.cat','',_binary '\0\0\0\0\0\0\0Ü¸Ef¥U@Õö≥ôµD@','',''),(290,'Institut Baetulo','Av. Marqu√®s de Sant Mori, 251','Badalona','08914',1,'a8057746@xtec.cat','',_binary '\0\0\0\0\0\0\0sÒÆ\œ@=c\ÃN\‡∏D@','',''),(291,'Institut Cirvi√†num de Torell√≥','C. Ausi√†s March-Molina A. correus 69','Torell√≥','08570',1,'a8058404@xtec.cat','',_binary '\0\0\0\0\0\0\0«≥åS˚@D¶\È§E@','',''),(292,'Institut Bisaura','C. Mestre Quer, 13','Sant Quirze de Besora','08580',1,'a8058428@xtec.cat','',_binary '\0\0\0\0\0\0\0ãßêæX∫@¶\Ë{\rE@','',''),(293,'Institut Puig de la Creu','C. Alemanya, 34','Castellar del Vall√®s','08211',1,'a8058520@xtec.cat','',_binary '\0\0\0\0\0\0\0Sh¢\ÕF∫\0@ö\Ì[ƒØ\ÕD@','',''),(294,'Institut Front Mar√≠tim','C. Espronceda, 18-34','Barcelona','08005',1,'a8058775@xtec.cat','',_binary '\0\0\0\0\0\0\0\']\Ó$´@)†êjÜ≥D@','',''),(295,'Institut El Vern','Pg. Esgl√©sia, s/n','Lli√ß√† de Vall','08185',1,'a8058969@xtec.cat','',_binary '\0\0\0\0\0\0\0$ˇE0\‚@!?\œ*i\ÀD@','',''),(296,'Institut Can Peixauet','C. Moss√®n Jacint Verdaguer, 10-14','Santa Coloma de Gramenet','08923',1,'a8059329@xtec.cat','',_binary '\0\0\0\0\0\0\0Y∏cÏØ´@πía8˛∏D@','',''),(297,'IESA Institut del Teatre','Pl. Margarida Xirgu, s/n','Barcelona','08004',1,'a8059342@xtec.cat','',_binary '\0\0\0\0\0\0\0Q\…x\ÀA@WÉ-ØD@','',''),(298,'Institut de Navarcles','Cam√≠ de l\'Angla, 8','Navarcles','08270',1,'a8059524@xtec.cat','',_binary '\0\0\0\0\0\0\0Åï;c¢QA8z		)\‡D@','',''),(299,'Institut Maria Aur√®lia Capmany','C. Garrofer, 8','Cornell√† de Llobregat','08940',1,'a8059688@xtec.cat','',_binary '\0\0\0\0\0\0\0¢^\·>!§\0@\'\ÍúÆD@','',''),(300,'Cons.Sup.Dansa Institut del Teatre','Pl. Margarida Xirgu, s/n','Barcelona','08004',1,'a8060307@xtec.cat','',_binary '\0\0\0\0\0\0\0Q\…x\ÀA@WÉ-ØD@','',''),(301,'Institut de Masquefa','Av. del Maresme, 47-87','Masquefa','08783',1,'a8060514@xtec.cat','',_binary '\0\0\0\0\0\0\0c$%Ñ\·˝?á¨6KæøD@','',''),(302,'Institut Maria de Bell-lloc','Av. del Castell de Montbui, 11','El Rieral de Bigues','08415',1,'a8060915@xtec.cat','',_binary '\0\0\0\0\0\0\0\Z”©±ò@ç@kg\‡\’D@','',''),(303,'Institut del Voltregan√®s','C. Matagalls, 48','La Gleva','08508',1,'a8060976@xtec.cat','',_binary '\0\0\0\0\0\0\0≤\Ê¿•uÒ@e\ÿ\‰\Õ:E@','',''),(304,'Institut Vinyet','C. Mestre Manel Torrens Girona, 2-6','Sitges','08870',1,'a8061014@xtec.cat','',_binary '\0\0\0\0\0\0\0ã\÷Àõ5£¸?Fû˚\›ûD@','',''),(305,'Institut de Vilanova del Vall√®s','C. Cam√≠ de Vilassar/ C. El Terral','Vilanova del Vall√®s','08410',1,'a8061038@xtec.cat','',_binary '\0\0\0\0\0\0\0fÅˇxr@?ë\·\≈D@','',''),(306,'Institut Font del Ferro','Cam√≠ de la Ciutadella, s/n','Palafolls','08389',1,'a8061099@xtec.cat','',_binary '\0\0\0\0\0\0\0ã®^æ\¬¸@6\0t\»(\÷D@','',''),(307,'Institut Tur√≥ d\'en Baldiri','C. Charles Darwin, 19','Tei√† Centre','08329',1,'a8061117@xtec.cat','',_binary '\0\0\0\0\0\0\0;q˜AØ¢@o d&øøD@','',''),(308,'Institut Montserrat Colomer','Av. de Josep Llobet/ Cam√≠ de Ca n\'Amat','Sant Esteve Sesrovires','08635',1,'a8061129@xtec.cat','',_binary '\0\0\0\0\0\0\0Ñ\◊\r_O˘˝?¢∫\»#âøD@','',''),(309,'Institut Vacarisses','C. Josep Carner, 39','Vacarisses','08233',1,'a8061208@xtec.cat','',_binary '\0\0\0\0\0\0\0\·,ZΩ¶˛?Ä§9\∆\÷\ÀD@','',''),(310,'Institut Torrelles de Llobregat','C. Ernest Lluch, 4','Torrelles de Llobregat','08629',1,'a8061361@xtec.cat','',_binary '\0\0\0\0\0\0\0∏b»ØÙôˇ?9ﬁå∂D≠D@','',''),(311,'Institut Cabrils','C. de Can Tosca, 2','Cabrils','08348',1,'a8062717@xtec.cat','',_binary '\0\0\0\0\0\0\0IJ\r¯@DU√≥Å\¬D@','',''),(312,'Institut Pla Marcell','C. Ramon i Cajal, 58','Cardedeu','08440',1,'a8062729@xtec.cat','',_binary '\0\0\0\0\0\0\0∑n∫\ÕÚ@:ôú\0a\—D@','',''),(313,'Institut Els Roures','C. del Doctor Joan Cardona, s/n','Dosrius','08319',1,'a8062730@xtec.cat','',_binary '\0\0\0\0\0\0\0a4\’\⁄\ŒG@¢=.Ò\ÀD@','',''),(314,'Institut Vilamajor','C. de Can Llobera, s/n','Sant Pere de Vilamajor','08458',1,'a8062791@xtec.cat','',_binary '\0\0\0\0\0\0\0Lp£.=!@¥›©%\ÿD@','',''),(315,'Institut Esteve Albert','Av. Sot del Camp, 1-3','Sant Vicen√ß de Montalt','08394',1,'a8062808@xtec.cat','',_binary '\0\0\0\0\0\0\0±\\UG•@\Ô\Ê\‘\…D@','',''),(316,'Institut Tiana','C. Eduard Fontser√®, s/n','Tiana','08391',1,'a8062857@xtec.cat','',_binary '\0\0\0\0\0\0\0¨\Â$M\È@3ôxß≈æD@','',''),(317,'Institut La Plana','C. Rector de Vallfogona, 65','Vic','08500',1,'a8062870@xtec.cat','',_binary '\0\0\0\0\0\0\0\"P?†\Z@’©\œ.ˆD@','',''),(318,'Institut Montpedr√≥s','C. Esquirol, 9','Santa Coloma de Cervell√≥','08690',1,'a8063229@xtec.cat','',_binary '\0\0\0\0\0\0\0¸±˙7\0@SëwˇπÆD@','',''),(319,'Institut Salvador Claramunt','C. de La Plana, 6','Piera','08784',1,'a8063746@xtec.cat','',_binary '\0\0\0\0\0\0\0ò˚Óö≥˝˚?`Ä\Àõ\¬D@','',''),(320,'Institut de Collbat√≥','C. Tarragona, 26','Collbat√≥','08293',1,'a8063801@xtec.cat','',_binary '\0\0\0\0\0\0\0Çd\ﬁ§\0˝?°çO\r\„\»D@','',''),(321,'Institut Creu de Saba','Av. de Francesc Maci√†, 193','Olesa de Montserrat','08640',1,'a8063813@xtec.cat','',_binary '\0\0\0\0\0\0\0¯ÉØ\ &˛?\Z\Ì\»\›\≈D@','',''),(322,'Institut Les Margues','Av. de Francesc Maci√†, 14','Calldetenes','08506',1,'a8063837@xtec.cat','',_binary '\0\0\0\0\0\0\0ñº9fO@/¨ˆD@','',''),(323,'Institut Montgr√≤s','C. Joan Cuadras i Marcer, 1','Sant Pere de Ribes','08810',1,'a8063904@xtec.cat','',_binary '\0\0\0\0\0\0\0πı\Ó¢Z¸?FB:¿|°D@','',''),(324,'Institut Can Margarit','Av. dels Pins, 49 bis','Corbera de Llobregat','08757',1,'a8064003@xtec.cat','',_binary '\0\0\0\0\0\0\0\nVI\"ˇ?\›\÷\Ëel∂D@','',''),(325,'Institut Quatre Cantons','Cam√≠ Antic de Val√®ncia, 37-39','Barcelona','08018',1,'a8064155@xtec.cat','',_binary '\0\0\0\0\0\0\0Cy™9¸ö@x\„\ÓΩ…≥D@','',''),(326,'Institut Serra de Noet','C. del Programari Lliure, 9','Berga','08600',1,'a8064830@xtec.cat','',_binary '\0\0\0\0\0\0\0.~K\Á`q˝?\√\»4fE@','',''),(327,'Institut Begues','Cam√≠ Ral, s/n','Begues','08859',1,'a8064908@xtec.cat','',_binary '\0\0\0\0\0\0\0Z4\‹Pù˛?\Â˝W‘¢™D@','',''),(328,'Institut Val√®ria Halin√©','Cam√≠ Fondo de Ca n\'Aymerich, 4','Castelldefels','08860',1,'a8064911@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ÿ’äÖùˇ?\‚°\Ã_—£D@','',''),(329,'Institut de Sant Andreu','Av. Bonaventura Pedemonte, 2','Sant Andreu de la Barca','08740',1,'a8064921@xtec.cat','',_binary '\0\0\0\0\0\0\0±¯H®\ÎÅˇ?ß\‹=s(πD@','',''),(330,'Institut Nou de Vilafranca del Pened√®s','<p>Av. Europa, s/n</p>','Vilafranca del Pened√®s','08720',1,'a8064970@xtec.cat','',_binary '\0\0\0\0\0\0\0FÖaÆ2˚?j[3∞P´D@','',''),(331,'Institut de Vallbona d\'Anoia','C. Reguerot, s/n','Vallbona d\'Anoia','08785',1,'a8065019@xtec.cat','',_binary '\0\0\0\0\0\0\0Ÿø	ä¡Q˚?R\‹rß\¬D@','',''),(332,'Institut de l\'Alt Foix','Pg. Esportiu, 18','Sant Mart√≠ Sarroca','08731',1,'a8065329@xtec.cat','',_binary '\0\0\0\0\0\0\0oå~\„T≥˘?y8\0i_±D@','',''),(333,'Institut Cal Gravat','C. Puig i Cadafalch,54-56','Manresa','08242',1,'a8065330@xtec.cat','',_binary '\0\0\0\0\0\0\0\Â±W9É˝?\ \›\ÿ\Õ;\‹D@','',''),(334,'Institut Xaloc','C. Guifr√© el Pil√≥s, s/n','Les Roquetes','08812',1,'a8065342@xtec.cat','',_binary '\0\0\0\0\0\0\0∞\◊&\€\·˚˚?\›)\÷\÷ÛùD@','',''),(335,'Institut Baix a mar','C. √Äncora, 29','Vilanova i la Geltr√∫','08800',1,'a8065354@xtec.cat','',_binary '\0\0\0\0\0\0\0¿\\`ñCπ˚?h\ËNô#úD@','',''),(336,'Institut de Pineda de Mar','C. Botticelli, 6-8','Pineda de Mar','08397',1,'a8065366@xtec.cat','',_binary '\0\0\0\0\0\0\0\¬#}úaÅ@h\ÿK˙\—D@','',''),(337,'Institut El Til¬∑ler','Ctra. de Ribes, 45-55','Corr√≥ d\'Avall','08520',1,'a8065391@xtec.cat','',_binary '\0\0\0\0\0\0\0°•¢\Ê\Ë_@\Ã>Ä&1\—D@','',''),(338,'Institut Hip√†tia d\'Alexandria','C. Folch i Torres, 104-116','Lli√ß√† d\'Amunt','08186',1,'a8065408@xtec.cat','',_binary '\0\0\0\0\0\0\0u)Cè˜\Í@å†\ÔvV\ŒD@','',''),(339,'Institut Aiguaviva','Rbla. Pompeu Fabra, 1','Mollet del Vall√®s','08100',1,'a8065411@xtec.cat','',_binary '\0\0\0\0\0\0\01é\‡2\Êª@[^w¬§\ƒD@','',''),(340,'Institut Marta Mata','Cam√≠ de la Justada, 5','Montorn√®s Centre','08170',1,'a8065421@xtec.cat','',_binary '\0\0\0\0\0\0\0Û\‘ˇF.@Ä˙Z\r\≈D@','',''),(341,'Institut La S√≠nia','C. V√≠ctor Catal√†, 8','Parets del Vall√®s','08150',1,'a8065433@xtec.cat','',_binary '\0\0\0\0\0\0\0\‘.\Ô\÷\‰@^µ®A\…D@','',''),(342,'Institut Can Record','C. Galerna, 2','Sant Esteve de Palautordera','08461',1,'a8065469@xtec.cat','',_binary '\0\0\0\0\0\0\0åÚ¡}@∏¥c\⁄D@','',''),(343,'Institut Cardener','C. del Sol, 13','Sant Joan de Vilatorrada','08250',1,'a8066322@xtec.cat','',_binary '\0\0\0\0\0\0\0QRI\‚¸?èÚOM\"\ﬂD@','',''),(344,'Institut Mont Perdut','C. Mont Perdut, 1','Terrassa','08225',1,'a8066437@xtec.cat','',_binary '\0\0\0\0\0\0\0scN\0@§_ı\\s\»D@','',''),(345,'Institut Mart√≠ Pous','C. Segre, 34','Barcelona','08009',1,'a8066528@xtec.cat','',_binary '\0\0\0\0\0\0\0˚E\€¡ ä@ö>;\‡z∑D@','',''),(346,'Institut Maria Espinalt','C. Llacuna, 87-101','Barcelona','08018',1,'a8066541@xtec.cat','',_binary '\0\0\0\0\0\0\0\ÊÑ}˘lí@\ÿ\⁄\0è≥D@','',''),(347,'Institut Viladomat','C. Consell de Cent, 127-129','Barcelona','08015',1,'a8066905@xtec.cat','',_binary '\0\0\0\0\0\0\0ú¿¯í[9@ú)Ö⁄∞D@','',''),(348,'Institut de Cervell√≥','C. del Pi, s/n','Cervell√≥','08758',1,'a8067144@xtec.cat','',_binary '\0\0\0\0\0\0\0û|âVóˇ??Q\≈Ãø±D@','',''),(349,'Institut Salas i Xandri','Rda.. Arraona, s/n','Sant Quirze del Vall√®s','08192',1,'a8067211@xtec.cat','',_binary '\0\0\0\0\0\0\0YåûÅØ•\0@†.#∂\ƒD@','',''),(350,'Institut Escola Les Vinyes','C. Major, 109','Castellbisbal','08755',1,'a8067594@xtec.cat','',_binary '\0\0\0\0\0\0\0®∂´\¬,µˇ?P>»®nΩD@','',''),(351,'Institut Manresa Sis','Vivendes Pare Ignasi Puig, s/n','Manresa','08242',1,'a8067636@xtec.cat','',_binary '\0\0\0\0\0\0\0ˆ{bù*\Á¸?†;hF\€D@','',''),(352,'Institut Gurb','C. de l\'Olivera, s/n','Gurb','08503',1,'a8068380@xtec.cat','',_binary '\0\0\0\0\0\0\0\„–üYπ\„@jE\Âp7¯D@','',''),(353,'Institut Josefina Castellv√≠ i Piulachs','C. Remolar, 3','Viladecans','08840',1,'a8068495@xtec.cat','',_binary '\0\0\0\0\0\0\02CMn¿\0@éQiáißD@','',''),(354,'Institut Les Aimerigues','C. Ic√†ria, 80','Terrassa','08224',1,'a8068537@xtec.cat','',_binary '\0\0\0\0\0\0\0\”ä∞X¯ˇ?;\’J∂t\«D@','',''),(355,'Institut Bages Sud','C. Salt del Rec, 10','El Borr√†s','08296',1,'a8068616@xtec.cat','',_binary '\0\0\0\0\0\0\0,àSvíÆ˝?lc\"∏\–D@','',''),(356,'Institut Escola La Tordera','Ptge. Margarida, 1','Santa Maria de Palautordera','08460',1,'a8070908@xtec.cat','',_binary '\0\0\0\0\0\0\0M>\Ó\œ@\Í\Z¢Ò\◊D@','',''),(357,'Institut Can Roca','C. F√†tima, 12','Terrassa','08225',1,'a8071196@xtec.cat','',_binary '\0\0\0\0\0\0\0¨0Ñ;!\0@*ääJ@\ D@','',''),(358,'Institut Escola Castellter√ßol','C. de Rocacorba, 23-29','Castellter√ßol','08183',1,'a8071214@xtec.cat','',_binary '\0\0\0\0\0\0\0ˆ\’\÷pı\0@\Ï\≈v\Á\ﬂD@','',''),(359,'Institut Escola Costa i Llobera','Cam√≠ de la Capella de Can Caralleu, s/n','Barcelona','08017',1,'a8071226@xtec.cat','',_binary '\0\0\0\0\0\0\0Åm¬í≤\ﬁ\0@∏GπÅ≥D@','',''),(360,'Institut Escola Jacint Verdaguer','C. Gelida, s/n','Sant Sadurn√≠ d\'Anoia','08770',1,'a8071238@xtec.cat','',_binary '\0\0\0\0\0\0\0\»˜Pò≥£¸?\ÿ&©Œ∂D@','',''),(361,'Institut Vall del Mediona','Pg. de les Deus, 17','Sant Quint√≠ de Mediona','08777',1,'a8071317@xtec.cat','',_binary '\0\0\0\0\0\0\0ù>⁄∂*î˙?^í|ÖBªD@','',''),(362,'Institut Escola del Prat','C. del Riu T√∫ria, 2-4','El Prat de Llobregat','08820',1,'a8071691@xtec.cat','',_binary '\0\0\0\0\0\0\0ÄL3)Æ\0@2Q^®D@','',''),(363,'Institut del Ter','C. Eduard Rif√†, 24','Manlleu','08560',1,'a8072176@xtec.cat','',_binary '\0\0\0\0\0\0\0·´∏ôSW@µòò°\0E@','',''),(364,'Institut Escola Sant Jordi','C. Puig-reig, s/n','Nav√†s','08670',1,'a8072188@xtec.cat','',_binary '\0\0\0\0\0\0\0ô\“-Mß˛?R=ç´ÛD@','',''),(365,'Institut Premi√† de Mar','C. Rafael de Casanova, s/n','Premi√† de Mar','08330',1,'a8072255@xtec.cat','',_binary '\0\0\0\0\0\0\0#ßòKˆ¯@ﬂ¢\’¡høD@','',''),(366,'Institut Escola Tur√≥ de Roquetes','C. Alc√†ntara, 22','Barcelona','08001',1,'a8072292@xtec.cat','',_binary '\0\0\0\0\0\0\0Ü•Ù\Óa@/aö\r%πD@','',''),(367,'Institut Domus d\'Olivet','Av. de Canovelles, 125','La Serra','08420',1,'a8072383@xtec.cat','',_binary '\0\0\0\0\0\0\0ë\œh;@ê@V\ÃU\–D@','',''),(368,'Institut Torrent dels Alous','Ptge. Marconi, 13-15','Rub√≠','08191',1,'a8072401@xtec.cat','',_binary '\0\0\0\0\0\0\0˜åù LR\0@˘`Q\≈ÿΩD@','',''),(369,'Institut Sunsi M√≥ra','C. Jaume Romagosa Duran, 4','Canet de Mar','08360',1,'a8072978@xtec.cat','',_binary '\0\0\0\0\0\0\0Yev{\Ëç@±ˇïü\ÃD@','',''),(370,'Institut de Sant Pol de Mar','Parc del Litoral, s/n','Sant Pol de Mar','08395',1,'a8073028@xtec.cat','',_binary '\0\0\0\0\0\0\0øp\ÕnD\Ô@\◊˚*L°\ÃD@','',''),(371,'Institut de Cornell√†','Av. Sant Ildefons, 24','Cornell√† de Llobregat','08940',1,'a8073031@xtec.cat','',_binary '\0\0\0\0\0\0\0ïhO9´\0@.ﬁÄ∞ÇÆD@','',''),(372,'Institut Maria Canela','Pl. Maria Canela, 1','Martorell','08760',1,'a8073077@xtec.cat','',_binary '\0\0\0\0\0\0\0tr!∑®\ƒ˛?Ü5\»6ΩD@','',''),(373,'Institut Can Periquet','Cam√≠ de Can Llonch, s/n','Palau-solit√† i Plegamans','08184',1,'a8073119@xtec.cat','',_binary '\0\0\0\0\0\0\0\"B†Vxo@Ja{π\—\…D@','',''),(374,'Institut La Riera','C. Jacinto Benavente, 13','Badalona','08915',1,'a8073171@xtec.cat','',_binary '\0\0\0\0\0\0\0H¶Ç,\r@˜t)y∫D@','',''),(375,'Institut Badia i Margarit','Av. de Montserrat, 38-40','Igualada','08700',1,'a8073193@xtec.cat','',_binary '\0\0\0\0\0\0\0\—à\Õ˙?¢∫ì\€\…D@','',''),(376,'Institut Pic del Vent','C. Maria Aur√®lia Campmany, 2','Caldes de Montbui','08140',1,'a8073651@xtec.cat','',_binary '\0\0\0\0\0\0\0z¨}V@\ﬂq\ƒ9\Ó\œD@','',''),(377,'Institut Tord√†ria','C. Val√®ncia, s/n','Tordera','08490',1,'a8073843@xtec.cat','',_binary '\0\0\0\0\0\0\0†∂\ƒ\Ãiª@\Ë]sI¿\ÿD@','',''),(378,'Institut de Seguretat P√∫blica de Catalunya','Ctra. C-17, Barcelona-Ripoll, km 13,5','Mollet del Vall√®s','08100',1,'a8073910@xtec.cat','',_binary '\0\0\0\0\0\0\0ì7¿\Ãw\–@\ÂÚw\Ô\∆D@','',''),(379,'Institut Pla del Bosc','C. de la Verge de Montserrat, 1','Canyelles','08811',1,'a8073961@xtec.cat','',_binary '\0\0\0\0\0\0\0Ñ•@∫fá˚?ôS∏\‘w§D@','',''),(380,'Institut La Serra','Av. Can Bordoll, 92-94','Sabadell','08201',1,'a8074410@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ë\÷\Z\∆@\œH>\≈D@','',''),(381,'Institut Les Salines','Av. 11 de Setembre, 36','El Prat de Llobregat','08820',1,'a8074631@xtec.cat','',_binary '\0\0\0\0\0\0\0k˝{êhµ\0@º∏9\‚®D@','',''),(382,'Institut Marta Estrada','C. Maria Palau, s/n','Granollers','08403',1,'a8074801@xtec.cat','',_binary '\0\0\0\0\0\0\0m\Á⁄õ<@°ù\Í»Ö\ŒD@','',''),(383,'Institut de N√†utica de Barcelona','C. de l\'Escar, 6-8','Barcelona','08039',1,'a8074847@xtec.cat','',_binary '\0\0\0\0\0\0\04	HÅ@l\Ë∞D@','',''),(384,'Institut de Santa Coloma de Gramenet','C. Moss√®n Jacint Verdaguer, 16','Santa Coloma de Gramenet','08922',1,'a8075074@xtec.cat','',_binary '\0\0\0\0\0\0\0≤L\”(£¨@7Ç\\πD@','',''),(385,'Institut Escola Marta Mata','Av. del Castell, 42','Torell√≥','08570',1,'a8075256@xtec.cat','',_binary '\0\0\0\0\0\0\0™¢E§@íë ME@','',''),(386,'Institut Bit√†cola','Rda.. de l\'Est, s/n','Barber√† del Vall√®s','08210',1,'a8075281@xtec.cat','',_binary '\0\0\0\0\0\0\0˛ 8x¸\0@^F:Œ∞¡D@','',''),(387,'Institut Escola Gav√† Mar','C. Tellinaires, 59-61','Gav√†','08850',1,'a8075293@xtec.cat','',_binary '\0\0\0\0\0\0\0\«(¿ë\Ô/\0@\Z#ß\ÈR¢D@','',''),(388,'Institut Escola Sant Adri√† de Bes√≤s','Rbla. de la Mina, 36','Sant Adri√† de Bes√≤s','08930',1,'a8075384@xtec.cat','',_binary '\0\0\0\0\0\0\0;w~˚Å\≈@rá>9yµD@','',''),(389,'Institut de Formaci√≥ Professional d\'Enoturisme de Catalunya','C. Am√†lia Soler, 29','Vilafranca del Pened√®s','08720',1,'a8075451@xtec.cat','',_binary '\0\0\0\0\0\0\0öû\\5˚?E›Æg\Ì´D@','',''),(390,'Institut Escola Antaviana','C. Nou Barris, 12','Barcelona','08001',1,'a8075657@xtec.cat','',_binary '\0\0\0\0\0\0\0|/€ªm@m]πD@','',''),(391,'Institut Escola El Til¬∑ler','Pg. de Mollerussa, 1','Barcelona','08030',1,'a8075669@xtec.cat','',_binary '\0\0\0\0\0\0\0£&¶}ü@Ca\'\' ∏D@','',''),(392,'Institut Escola Trinitat Nova','C. Pedrosa, 16','Barcelona','08001',1,'a8075670@xtec.cat','',_binary '\0\0\0\0\0\0\0¢É=˛y@\ﬂAoπD@','',''),(393,'Institut Viladecans VI','Av. Jocs Ol√≠mpics, 11','Viladecans','08840',1,'a8075682@xtec.cat','',_binary '\0\0\0\0\0\0\0˙˝H$\0@=“µ6Z©D@','',''),(394,'Institut Les Cinc S√©nies','Rda.. de Rafael Estrany, 60','Matar√≥','08304',1,'a8075712@xtec.cat','',_binary '\0\0\0\0\0\0\0\0æ<£ò@!jˆŒï\∆D@','',''),(395,'Institut Ca n\'Oriac','C. Pr√≠ncep de Viana, s/n','Sabadell','08201',1,'a8076091@xtec.cat','',_binary '\0\0\0\0\0\0\0qSÇL“ø\0@˛\’\Ëw\»D@','',''),(396,'Institut Joan Marqu√®s','Av. Vall√®s, 483','Terrassa','08225',1,'a8076108@xtec.cat','',_binary '\0\0\0\0\0\0\0\√(EÅ˜7\0@™£\÷@\"\ D@','',''),(397,'Institut Nou de l\'Hospitalet de Llobregat','C. Ferrer i Gu√†rdia, s/n','L\'Hospitalet de Llobregat','08902',1,'a8076111@xtec.cat','',_binary '\0\0\0\0\0\0\0∆õó\Î∂Ò\0@Q·ØôaÆD@','',''),(398,'Institut Escola Mar Mediterr√†nia','Pg. de Ramon Berenguer III, 130','Matar√≥','08303',1,'a8076145@xtec.cat','',_binary '\0\0\0\0\0\0\02Yπzk@å¨\Î\0\≈D@','',''),(399,'Institut Escola √Ängela Bransuela','Rda.. Sant Oleguer, 76','Matar√≥','08304',1,'a8076157@xtec.cat','',_binary '\0\0\0\0\0\0\0Én\Ã>ë@ ãoS|\∆D@','',''),(400,'Institut Escola Gornal','Av. Carmen Amaya, 44','L\'Hospitalet de Llobregat','08902',1,'a8076169@xtec.cat','',_binary '\0\0\0\0\0\0\0\‡p\⁄\‰\‘\0@uNáœ≠D@','',''),(401,'Institut Tecnol√≤gic de Barcelona','C. Aiguablava, 121','Barcelona','08033',1,'a8076194@xtec.cat','',_binary '\0\0\0\0\0\0\0¡2äsA~@m\Ï\r∫D@','',''),(402,'Institut Pere Alsius i Torrent','C. Sardana, 17','Banyoles','17820',1,'b7000305@xtec.cat','',_binary '\0\0\0\0\0\0\0ˇ\Zè†ò@.\‘¬ÆE@','',''),(403,'Institut Josep Brugulat','Ctra. de Figueroles, s/n','Banyoles','17820',1,'b7000330@xtec.cat','',_binary '\0\0\0\0\0\0\0`Ñ\‰ıD@2˜\‰\ÔE@','',''),(404,'Institut Sa Palomera','C. Vilar Petit, s/n','Blanes','17300',1,'b7000551@xtec.cat','',_binary '\0\0\0\0\0\0\0≤ë54Ø@@\Ã\Î\ _\»\÷D@','',''),(405,'Institut Puig Cargol','Pla de Calonge, s/n','Calonge','17251',1,'b7000706@xtec.cat','',_binary '\0\0\0\0\0\0\0\r$ç©r8@$\ ma\ÌD@','',''),(406,'Institut Ramon Muntaner','C. Sant Pau, s/n','Figueres','17600',1,'b7001218@xtec.cat','',_binary '\0\0\0\0\0\0\0¥CV≥@f& !E@','',''),(407,'Institut Jaume Vicens Vives','C. Ferr√†ndiz i de Bell√©s, s/n','Girona','17004',1,'b7001723@xtec.cat','',_binary '\0\0\0\0\0\0\0_ı\€2;ö@\‚7ˇ[{˝D@','',''),(408,'Institut Montilivi','Av. Montilivi, 125','Girona','17003',1,'b7001735@xtec.cat','',_binary '\0\0\0\0\0\0\0É¢´¢ù@\’*\Ìq˚D@','',''),(409,'Institut Escola d\'Hostaleria i Turisme de Girona','C. Josep Viader Moliner, 11','Girona','17005',1,'b7001759@xtec.cat','',_binary '\0\0\0\0\0\0\0o[c\È~@˙ \Z…ù˝D@','',''),(410,'Institut Montsacopa','Av. Joan de Cabirol, s/n','Olot','17800',1,'b7002387@xtec.cat','',_binary '\0\0\0\0\0\0\0èv©ˇ\‚@r\Ê.ÙNE@','',''),(411,'Institut La Garrotxa','Ctra. de Riudaura, 110','Olot','17800',1,'b7002399@xtec.cat','',_binary '\0\0\0\0\0\0\0:è\«bTø@VJíëzE@','',''),(412,'Institut Frederic Mart√≠ i Carreras','C. Frederic Mart√≠ Carreras, 13','Palafrugell','17200',1,'b7002545@xtec.cat','',_binary '\0\0\0\0\0\0\0o\≈	\÷R	@Qã˚næÙD@','',''),(413,'Institut Baix Empord√†','Av. de les Corts Catalanes, s/n','Palafrugell','17200',1,'b7002557@xtec.cat','',_binary '\0\0\0\0\0\0\0\r\›)s¨T	@q}ﬁ®£ÙD@','',''),(414,'Institut Sant Elm','C. Abat Sunyer, s/n','Sant Feliu de Gu√≠xols','17220',1,'b7003306@xtec.cat','',_binary '\0\0\0\0\0\0\0”ªä\"*<@!],\„D@','',''),(415,'Institut de Sant Feliu de Gu√≠xols','C. Canig√≥, 41','Sant Feliu de Gu√≠xols','17220',1,'b7003318@xtec.cat','',_binary '\0\0\0\0\0\0\0$˙\Z!∫2@\∆\◊C†ü\ÂD@','',''),(416,'Institut Alexandre Deulofeu','C. Joaquim Cus√≠ Fortunet, 3','Figueres','17600',1,'b7004438@xtec.cat','',_binary '\0\0\0\0\0\0\0\'∏I&Võ@ôPL\‘N\"E@','',''),(417,'Institut Rafael Campalans','Pl. del Remei, s/n','Angl√®s','17160',1,'b7004487@xtec.cat','',_binary '\0\0\0\0\0\0\0`ò¨á∏@ì£4l˙D@','',''),(418,'Institut Narc√≠s Xifra i Masmitj√†','Pg. Sant Joan Bosco, 1','Girona','17007',1,'b7004499@xtec.cat','',_binary '\0\0\0\0\0\0\0Ö\0\«;ò@_^8Ü\0E@','',''),(419,'Institut Anton Busquets i Punset','C. de Joan Serras, 21','Sant Hilari Sacalm','17403',1,'b7004517@xtec.cat','',_binary '\0\0\0\0\0\0\0>+®)@ho\ÕvuD@','',''),(420,'Institut Santiago Sobrequ√©s i Vidal','C. Joan Regl√†, 2-4','Girona','17003',1,'b7004530@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ÿ\‰?ê˚è@§vp\ƒ[¸D@','',''),(421,'Institut Castell d\'Estela','Pujada de l\'Estaci√≥, 4','Amer','17170',1,'b7004578@xtec.cat','',_binary '\0\0\0\0\0\0\0Éá\—\ @qF\Á9E@','',''),(422,'Institut Carles Rahola i Llorens','C. Joan Mir√≥ i Ferr√†, 10','Girona','17007',1,'b7005042@xtec.cat','',_binary '\0\0\0\0\0\0\0ç^)•Il@≥§\Ë,ˇD@','',''),(423,'Institut El Pedr√≥','C. Vilabertran, 2-4','L\'Escala','17130',1,'b7005251@xtec.cat','',_binary '\0\0\0\0\0\0\0ã\ÌÉf∂	@pΩ}\»E@','',''),(424,'Institut de Palam√≥s','C. N√†pols, 22','Palam√≥s','17230',1,'b7005352@xtec.cat','',_binary '\0\0\0\0\0\0\0!,◊ôJÙ@\œ`<\ÌD@','',''),(425,'Institut Cap Norfeu','C. Ponent, s/n','Roses','17480',1,'b7005364@xtec.cat','',_binary '\0\0\0\0\0\0\0ï\Ÿ	˜k	@\‡ïsJ\"E@','',''),(426,'Institut de Santa Coloma de Farners','Av. Salvador Espriu, s/n','Santa Coloma de Farners','17430',1,'b7005376@xtec.cat','',_binary '\0\0\0\0\0\0\0ò`\»R@)Q\∆\ÌD@','',''),(427,'Institut Vallvera','Ptge. de la F√†brica T√®xtil Coma Cros, 4','Salt','17190',1,'b7005388@xtec.cat','',_binary '\0\0\0\0\0\0\0B\√˛^@aáä°7˝D@','',''),(428,'Institut Cendrassos','C. Arquitecte Pelai Martinez, 1','Figueres','17600',1,'b7005649@xtec.cat','',_binary '\0\0\0\0\0\0\0{Y˘∂wπ@yÑ!#E@','',''),(429,'Institut de Cass√† de la Selva','C. Josep Pla, s/n','Cass√† de la Selva','17244',1,'b7005650@xtec.cat','',_binary '\0\0\0\0\0\0\0X\ÓE`˛@Kä\¬@ÚD@','',''),(430,'Institut Serrallarga','C. Joan Benejam, 1','Blanes','17300',1,'b7005662@xtec.cat','',_binary '\0\0\0\0\0\0\0˝Víûa@\rÉR\‰\Î\◊D@','',''),(431,'Institut Abat Oliba','Ctra. Barcelona, 57','Ripoll','17500',1,'b7005704@xtec.cat','',_binary '\0\0\0\0\0\0\04\ÃMÉå@˙\Ê6ïêE@','',''),(432,'Institut S\'Agulla','Ctra. de Malgrat, 13','Blanes','17300',1,'b7005731@xtec.cat','',_binary '\0\0\0\0\0\0\0úuı∂;@\Ÿ\‚´p\÷D@','',''),(433,'Institut Pere Borrell','C. Escoles Pies, 46','Puigcerd√†','17520',1,'b7005741@xtec.cat','',_binary '\0\0\0\0\0\0\0\ÔoYP\€\‡˛?j\⁄S\ﬂj7E@','',''),(434,'Institut Bosc de la Coma','C. Toledo, s/n','Olot','17800',1,'b7005893@xtec.cat','',_binary '\0\0\0\0\0\0\0¿\∆o∂+\œ@I@•E@','',''),(435,'Institut Ramon Coll i Rod√©s','C. Senyora de Rossell, 28-30','Lloret de Mar','17310',1,'b7005911@xtec.cat','',_binary '\0\0\0\0\0\0\0¡†ëw*≤@(F\Á1\⁄D@','',''),(436,'Institut Montgr√≠','C. Santa Caterina, 137','Torroella de Montgr√≠','17257',1,'b7005923@xtec.cat','',_binary '\0\0\0\0\0\0\0˝Ö1z\n	@p\»4\n±E@','',''),(437,'Institut Castell√≥ d\'Emp√∫ries','C. Santa Clara, 55','Castell√≥ d\'Emp√∫ries','17486',1,'b7006083@xtec.cat','',_binary '\0\0\0\0\0\0\0\ﬁj\∆7N°@+¶˝\œ\‘ E@','',''),(438,'Institut Montsoriu','Av. Doctor Carulla, s/n','Arb√∫cies','17401',1,'b7006605@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ó]ç0h(@õ\…[\ËD@','',''),(439,'Institut Pla de l\'Estany','C. Jaume Farriol i Montserrat, 31','Banyoles','17820',1,'b7006666@xtec.cat','',_binary '\0\0\0\0\0\0\0¶<U\Ê@ùÆ˚\rE@','',''),(440,'Institut Cap de Creus','C. Teresa Miramont, s/n','Cadaqu√©s','17488',1,'b7006678@xtec.cat','',_binary '\0\0\0\0\0\0\0\Í©Yê˚4\n@√æ:\ZI%E@','',''),(441,'Institut Germans Vila-Riera','Ctra. de Moll√≥, s/n','Camprodon','17867',1,'b7006681@xtec.cat','',_binary '\0\0\0\0\0\0\0¨\r\‡tı@¿w\rçˆ\'E@','',''),(442,'Institut Ridaura','C. Amadeu Vives, 42','Castell d\'Aro','17249',1,'b7006691@xtec.cat','',_binary '\0\0\0\0\0\0\0Ä¿BgO@ﬁÜ‘ëº\ÁD@','',''),(443,'Institut de Celr√†','C. Pa√Øsos Catalans, s/n','Celr√†','17460',1,'b7006708@xtec.cat','',_binary '\0\0\0\0\0\0\0ª\ŒrM@˚«ñE@','',''),(444,'Institut Vescomtat de Cabrera','Pl. Catalunya, 1','Hostalric','17850',1,'b7006733@xtec.cat','',_binary '\0\0\0\0\0\0\0£Iµë\„@\⁄\Œ1ø\ﬁD@','',''),(445,'Institut de La Jonquera','C. de Llu√≠s Companys, s/n','La Jonquera','17700',1,'b7006745@xtec.cat','',_binary '\0\0\0\0\0\0\0¡NQ¯\„ˇ@ßTC5E@','',''),(446,'Institut de Llagostera','Av. del Giron√®s, 51','Llagostera','17240',1,'b7006757@xtec.cat','',_binary '\0\0\0\0\0\0\0ë\Àkd\ÿ.@ê\”0,\ÈD@','',''),(447,'Institut de Llan√ß√†','C. Vuit de mar√ß, s/n','Llan√ß√†','17490',1,'b7006769@xtec.cat','',_binary '\0\0\0\0\0\0\0?\ K®\':	@ö\¬>íˆ-E@','',''),(448,'Institut Rocagrossa','C. Rosa Sensat, 1-11','Lloret de Mar','17310',1,'b7006770@xtec.cat','',_binary '\0\0\0\0\0\0\01f˜V∑@\Œ_¶\⁄D@','',''),(449,'Institut Joan Triad√∫','Pg. √Ängel Guimer√†, 2-3','Ribes de Freser','17534',1,'b7006794@xtec.cat','',_binary '\0\0\0\0\0\0\0ñØ\Ï˛àY@\‘	æ!\'E@','',''),(450,'Institut de Tossa de Mar','Av. Catalunya, s/n','Tossa de Mar','17320',1,'b7006812@xtec.cat','',_binary '\0\0\0\0\0\0\0ùÉ\œ%j@)0ü\◊\ÿ\‹D@','',''),(451,'Institut Vidreres','C. de l\'Institut, s/n','Vidreres','17411',1,'b7006824@xtec.cat','',_binary '\0\0\0\0\0\0\0 \·\Î\”@#@Ü0ßô(\ÂD@','',''),(452,'Institut Illa de Rodes','Ctra. de les Arenes, 57','Roses','17480',1,'b7006851@xtec.cat','',_binary '\0\0\0\0\0\0\0\‚inè\"f	@^ìÒ\Ãd\"E@','',''),(453,'Institut Santa Eug√®nia','C. Enric Marqu√®s i Ribalta, 3','Girona','17006',1,'b7006939@xtec.cat','',_binary '\0\0\0\0\0\0\0h¢0q©o@∏\—:I¸D@','',''),(454,'Institut La Bisbal','C. Eusebi D√≠az Costa, 16-38','La Bisbal d\'Empord√†','17100',1,'b7007300@xtec.cat','',_binary '\0\0\0\0\0\0\0Çö®EGY@≥.®Nã˙D@','',''),(455,'Institut Olivar Gran','Av. Maria √Ängels Anglada, 11','Figueres','17600',1,'b7007609@xtec.cat','',_binary '\0\0\0\0\0\0\0‹æQØ@Uˇ_ˆ\‰ E@','',''),(456,'Institut de Vilafant','C. Pla de l\'Estany, s/n','Vilafant','17740',1,'b7008390@xtec.cat','',_binary '\0\0\0\0\0\0\0˘\Z\r÷ª∞@\ﬁ\·%!YE@','',''),(457,'Institut Salvador Sunyer i Aimeric','C. de Miquel Mart√≠ i Pol, s/n','Salt','17190',1,'b7008407@xtec.cat','',_binary '\0\0\0\0\0\0\0É4ì\nãC@ÆOM\nÚ˚D@','',''),(458,'Institut de Caldes de Malavella','Av. Onze de Setembre, 4-18','Caldes de Malavella','17455',1,'b7008651@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ï:\√\Îi@\’{\ÎD@','',''),(459,'Institut Empuriabrava','C. Olivera, s/n','Castell√≥ d\'Emp√∫ries','17487',1,'b7008729@xtec.cat','',_binary '\0\0\0\0\0\0\0á›ò\Z\Ã@ã\«)`!E@','',''),(460,'Institut Ma√ßanet de la Selva','C. Escoles, 19','Ma√ßanet de la Selva','17412',1,'b7008951@xtec.cat','',_binary '\0\0\0\0\0\0\0{ü\ﬂ1\”@DÙWA\„D@','',''),(461,'Institut de Vilablareix','C. Marie Curie, s/n','Vilablareix','17180',1,'b7009205@xtec.cat','',_binary '\0\0\0\0\0\0\0ó9àñoc@¡\Zœ∂˙D@','',''),(462,'Institut de Sils','C.de l\'Abat Oliva-C.Llu√≠s Llach-C.JoseC','Sils','17410',1,'b7009308@xtec.cat','',_binary '\0\0\0\0\0\0\0\—˜9è°\„@∫t»º\ËD@','',''),(463,'Institut La Miquela','C. Salvador Dal√≠, 2','Bescan√≥','17162',1,'b7009783@xtec.cat','',_binary '\0\0\0\0\0\0\0ÅI\÷S>\„@LöP\“M˚D@','',''),(464,'Institut Escola Francesc Camb√≥ i Batlle','Cam√≠ de Mareny√†, s/n','Verges','17142',1,'b7009795@xtec.cat','',_binary '\0\0\0\0\0\0\0n¡∫@5]@\Ë%6á:E@','',''),(465,'Institut Escola Salvador Vilarrasa','Pg. Pare Pujiula, 29','Besal√∫','17850',1,'b7009801@xtec.cat','',_binary '\0\0\0\0\0\0\0$\∆ﬂ¥\Ëí@©\ÎàE@','',''),(466,'Institut Escola Mestre Andreu','C. Mestre Josep Maria Andreu, 2','Sant Joan de les Abadesses','17860',1,'b7009813@xtec.cat','',_binary '\0\0\0\0\0\0\0˚s¨K@íí\›E@','',''),(467,'Institut Escola Lloret de Mar','C. Santiago de Cuba, s/n','Lloret de Mar','17310',1,'b7009898@xtec.cat','',_binary '\0\0\0\0\0\0\0x;~Lƒü@∏µ∫\Ÿı\ÿD@','',''),(468,'Institut El Bruc','C. dels Prats, 2','Viabrea','17404',1,'b7010037@xtec.cat','',_binary '\0\0\0\0\0\0\0á!t˚•T@t≠\·\›D@','',''),(469,'Institut Vall de Ll√©mena','Pl. Rafel Mas√≥, s/n','Sant Gregori','17150',1,'b7010189@xtec.cat','',_binary '\0\0\0\0\0\0\0#\«@@2∞πc\‰˛D@','',''),(470,'Institut Ermessenda de Girona','C. Doctor Antic Roca, 38','Girona','17003',1,'b7010414@xtec.cat','',_binary '\0\0\0\0\0\0\0áMüó@lØâıõ¸D@','',''),(471,'Institut Ciutat de Balaguer','C. Urgell, 94','Balaguer','25600',1,'c5000833@xtec.cat','',_binary '\0\0\0\0\0\0\0I¡\‘H\Í?1Ú\∆\n=\ÂD@','',''),(472,'Institut Antoni Torroja','Pl. Universitat, s/n','Cervera','25200',1,'c5001311@xtec.cat','',_binary '\0\0\0\0\0\0\0w¨O\¬aÙ?3\Ô\›\’D@','',''),(473,'Institut Samuel Gili i Gaya','C. Ton Sirera, s/n','Lleida','25002',1,'c5002684@xtec.cat','',_binary '\0\0\0\0\0\0\0Û∏·ØΩ\„?\r\⁄Hè\ÕD@','',''),(474,'Institut Marius Torres','C. Narc√≠s Monturiol, 2','Lleida','25002',1,'c5002696@xtec.cat','',_binary '\0\0\0\0\0\0\0\‹Af“Ω\„?ü\‚\›6∏\ÕD@','',''),(475,'Institut Guind√†vols','C. Eugeni d\'Ors, s/n','Lleida','25196',1,'c5002726@xtec.cat','',_binary '\0\0\0\0\0\0\0.fe™I®\„?ﬂµ˛\–D@','',''),(476,'Institut Caparrella','Partida Caparrella, 98','Lleida','25192',1,'c5002799@xtec.cat','',_binary '\0\0\0\0\0\0\00°Ç\√¢\‚?\ÿÒ_\ÃD@','',''),(477,'Institut Mollerussa','Ctra. Torregrossa km. 1,9','Mollerussa','25230',1,'c5003202@xtec.cat','',_binary '\0\0\0\0\0\0\0\›P8à\ƒ˜\Î?ùQ\Ê+\ŒD@','',''),(478,'Institut Joan Brudieu','C. Doctor Iglesias Navarri, 27','La Seu d\'Urgell','25700',1,'c5004188@xtec.cat','',_binary '\0\0\0\0\0\0\0\–PF\÷\∆R˜?PaÛ;-E@','',''),(479,'Institut Manuel de Pedrolo','Av. Tarragona, 2','T√†rrega','25300',1,'c5004498@xtec.cat','',_binary '\0\0\0\0\0\0\0@-Ú*\ÏCÚ?;´L\À$\“D@','',''),(480,'Institut Ribera del Si√≥','C. Petronel¬∑la, 1','Agramunt','25310',1,'c5005260@xtec.cat','',_binary '\0\0\0\0\0\0\0â,\Îa‹ìÒ?vúâÜ\‰D@','',''),(481,'Institut Els Planells','Ctra. Montsonis, s/n','Artesa de Segre','25730',1,'c5005429@xtec.cat','',_binary '\0\0\0\0\0\0\07â25∏∂?Qˇ\⁄s9ÚD@','',''),(482,'Institut Francesc Ribalta','C. Francesc  Ribalta, s/n','Solsona','25280',1,'c5005454@xtec.cat','',_binary '\0\0\0\0\0\0\0X¨~¯;L¯?ZæBßf˛D@','',''),(483,'Institut Terres de Ponent','Ctra. de Torregrossa, s/n','Mollerussa','25230',1,'c5005582@xtec.cat','',_binary '\0\0\0\0\0\0\0¥¢B\Âd\Ï?˘\œ5Ù\–D@','',''),(484,'Institut La Segarra','C. President Maci√†, s/n','Cervera','25200',1,'c5005685@xtec.cat','',_binary '\0\0\0\0\0\0\0Th\·1äeÙ?\ﬂ˝G_Æ\÷D@','',''),(485,'Institut Almat√†','Parc p√∫blic el Reial','Balaguer','25600',1,'c5005727@xtec.cat','',_binary '\0\0\0\0\0\0\0≠^)\n\ƒ\È?Öëñ˛\ÂD@','',''),(486,'Institut d\'Ostalaria de Les-Val d\'Aran','C. dels Banys, s/n','Les','25540',1,'c5006148@xtec.cat','',_binary '\0\0\0\0\0\0\0<z~∑\Ê?\Ï[9ΩÉgE@','',''),(487,'Institut Escola de Sobrestants','C. Salvador Espriu, 2','T√†rrega','25300',1,'c5006215@xtec.cat','',_binary '\0\0\0\0\0\0\0\ j>◊å>Ú?\0\Á\—.\“D@','',''),(488,'Institut d\'Almenar','C. Espad√≥s, 75','Almenar','25126',1,'c5006227@xtec.cat','',_binary '\0\0\0\0\0\0\0Ò\Ô\‚\Êh\‚?êÄ	êl\ÊD@','',''),(489,'Institut d\'Aran','Ctra. de Betren, s/n','Vielha','25530',1,'c5006239@xtec.cat','',_binary '\0\0\0\0\0\0\0Û¥˘«Ø\È?\"Eı∫kYE@','',''),(490,'Institut El Pont de Suert','Barri Arag√≥, s/n','El Pont de Suert','25520',1,'c5006240@xtec.cat','',_binary '\0\0\0\0\0\0\0I∆∏Çpú\Á?\Ãàr˜3E@','',''),(491,'Institut de Tremp','C. Bisbe Iglesias, 5','Tremp','25620',1,'c5006288@xtec.cat','',_binary '\0\0\0\0\0\0\0\…\0*˛\Íü\Ï?z\0Nô\‚E@','',''),(492,'Institut Hug Roger III','C. Joaquim Sostres, s/n','Sort','25560',1,'c5006291@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ãå≠Ú?¯R,B\Á4E@','',''),(493,'Institut Auben√ß','C. Germ√† Frederic, s/n','Oliana','25790',1,'c5006471@xtec.cat','',_binary '\0\0\0\0\0\0\0tév\Êbı?˙˚Ä\ÿE@','',''),(494,'Institut Canig√≥','C. Canig√≥, s/n','Almacelles','25100',1,'c5006483@xtec.cat','',_binary '\0\0\0\0\0\0\0,¬áÒ\–\€?®&\√}\›D@','',''),(495,'Institut Josep Lladonosa','C. Jeroni Pujades, 16','Lleida','25005',1,'c5006495@xtec.cat','',_binary '\0\0\0\0\0\0\0ôñÜQx_\‰?≤∏˙ª\œD@','',''),(496,'Institut Manuel de Montsuar','Partida de Montcada, 22','Lleida','25196',1,'c5006513@xtec.cat','',_binary '\0\0\0\0\0\0\0úo\◊Z~¡\„?j¢ é\–D@','',''),(497,'Institut Josep Vallverd√∫','C. Doctor Josep Trueta, s/n','Les Borges Blanques','25400',1,'c5006525@xtec.cat','',_binary '\0\0\0\0\0\0\0de\Ídø\Î?¨≈Å95\¬D@','',''),(498,'Institut de Ponts','Av. Pompeu Fabra, 59','Ponts','25740',1,'c5006574@xtec.cat','',_binary '\0\0\0\0\0\0\0IÉøÖìÛ?p^	ïôÙD@','',''),(499,'Institut Lo Pla d\'Urgell','Av. d\'Urgell, 34','Bellpuig','25250',1,'c5006598@xtec.cat','',_binary '\0\0\0\0\0\0\0\ÿ¿¯ó?‹≠Ë≥ú\–D@','',''),(500,'Institut d\'Hoteleria i Turisme','Partida Caparrella, s/n','Lleida','25192',1,'c5006720@xtec.cat','',_binary '\0\0\0\0\0\0\0[Ä\Î\«|ô\‚?¯\ﬁr\œ\ÃD@','',''),(501,'Institut Torrevicens','Av. Torre Vicens, 3','Lleida','25005',1,'c5006732@xtec.cat','',_binary '\0\0\0\0\0\0\0\◊\ÏK≠,\‰?0\œÔ†æ\–D@','',''),(502,'Institut Ronda','C. Henri Dunant, 3','Lleida','25003',1,'c5006771@xtec.cat','',_binary '\0\0\0\0\0\0\0\Î$-%É\„?ºHî˙\ŒD@','',''),(503,'Institut Alfons Costafreda','Ctra. de Tarragona, s/n','T√†rrega','25300',1,'c5006781@xtec.cat','',_binary '\0\0\0\0\0\0\0-∫\«b39Ú?Ä_u\„\—D@','',''),(504,'Institut Morell√≥','Pl. la Closa, 7','Esterri d\'√Äneu','25580',1,'c5007025@xtec.cat','',_binary '\0\0\0\0\0\0\0Hm7ñ\ÔÒ?˚X\Á6fPE@','',''),(505,'Institut d\'Alcarr√†s','Pl. de l\'Arquitecte Ignasi Miquel, 1','Alcarr√†s','25180',1,'c5007153@xtec.cat','',_binary '\0\0\0\0\0\0\0Ì™¥Éú\‡?\'\Ï•\‡\«D@','',''),(506,'Institut Maria R√∫bies','C. Boqu√©/Av. Pla d\'Urgell, s/n','Lleida','25001',1,'c5007189@xtec.cat','',_binary '\0\0\0\0\0\0\0\—RÛÛ≥\‰?£i(lÅ\ÕD@','',''),(507,'Institut l\'Olivera','Pl. Escoles, 3','La Granadella','25177',1,'c5007499@xtec.cat','',_binary '\0\0\0\0\0\0\0\“)A\ﬂ3\Â?\Ô$\ÍQ≠≠D@','',''),(508,'Institut de Guissona','C. Castanyers, 13','Guissona','25210',1,'c5007505@xtec.cat','',_binary '\0\0\0\0\0\0\0ä	7röÙ?ˆπ\Èµ\Í\„D@','',''),(509,'Institut Ser√≤s','Pl. de les Escoles, s/n','Ser√≤s','25183',1,'c5007529@xtec.cat','',_binary '\0\0\0\0\0\0\0¯˘}lÉT\⁄? ä\„odªD@','',''),(510,'Institut Ermengol IV','C. Enric Servet, s/n','Bellcaire d\'Urgell','25337',1,'c5007700@xtec.cat','',_binary '\0\0\0\0\0\0\0›Ä\Ë¨\√\Ô\Ï?F-\‘\‡D@','',''),(511,'Institut de Sant Lloren√ß de Morunys','C. de la Creueta, s/n','Sant Lloren√ß de Morunys','25282',1,'c5008248@xtec.cat','',_binary '\0\0\0\0\0\0\0\ÏuA3>r˘?ÙE\ÿv.E@','',''),(512,'Institut de La Pobla de Segur','Av. Catalunya, 22','La Pobla de Segur','25500',1,'c5008352@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ì\Íπ\Í\·\Ó?Ñ˜∞r E@','',''),(513,'Institut d\'Alpicat','C. Pompeu Fabra, 1','Alpicat','25110',1,'c5009721@xtec.cat','',_binary '\0\0\0\0\0\0\0V\”\ ƒ∫\·?(äl¥\’D@','',''),(514,'Institut Joan Sol√†','Av. Europa /Av. Corts Catalanes','Torrefarrera','25123',1,'c5009733@xtec.cat','',_binary '\0\0\0\0\0\0\0céZklí\„?H≠å\Ë\’D@','',''),(515,'Institut La Mitjana','C. Vicen√ß Ximenis, 4','Lleida','25005',1,'c5009836@xtec.cat','',_binary '\0\0\0\0\0\0\0¸\¬\’H\ÂR\‰?\–`ö<\–D@','',''),(516,'Institut Castell dels Templers','C. Mart, 7','Lleida','25003',1,'c5010127@xtec.cat','',_binary '\0\0\0\0\0\0\0f#–ìD|\„?”© 4\ŒD@','',''),(517,'Institut Escola Torre Queralt','Av. Sant Pere, 54','Lleida','25001',1,'c5010280@xtec.cat','',_binary '\0\0\0\0\0\0\0π~\€\¬\‹\‰?Ç3¢˚\Ã\—D@','',''),(518,'Institut Gaud√≠','Ctra. d\'Osca, 1 (Barri Gaud√≠)','Reus','43206',1,'e3002570@xtec.cat','',_binary '\0\0\0\0\0\0\0\Œ=™µæ}Ò?\"ÑÕîD@','',''),(519,'Institut Salvador Vilaseca','C. Miseric√≤rdia, 12 bis','Reus','43205',1,'e3002582@xtec.cat','',_binary '\0\0\0\0\0\0\0†æ\Ó?ıπÒ?◊∏û\ÎrìD@','',''),(520,'Institut Baix Camp','C. Jacint Barrau, 1','Reus','43201',1,'e3002594@xtec.cat','',_binary '\0\0\0\0\0\0\0-\n\·\Ô¨Ò?E\‹Y\ËìD@','',''),(521,'Institut Antoni de Mart√≠ i Franqu√®s','C. Enric d\'Oss√≥, 3','Tarragona','43005',1,'e3003641@xtec.cat','',_binary '\0\0\0\0\0\0\0\◊˚≥=\‹Û?¢\ÌπHèD@','',''),(522,'Institut Comte de Rius','Ctra. de Valls, s/n (Zona Educacional)','Tarragona','43007',1,'e3003653@xtec.cat','',_binary '\0\0\0\0\0\0\0T	˜P\‹Û?n9dÒEëD@','',''),(523,'Institut Pons d\'Icart','C. Assalt, 4','Tarragona','43003',1,'e3003732@xtec.cat','',_binary '\0\0\0\0\0\0\0\Â|¯\Ãn\nÙ?Ù0¨˙éD@','',''),(524,'Institut Dertosa','Av. Estadi, 14','Tortosa','43500',1,'e3004438@xtec.cat','',_binary '\0\0\0\0\0\0\0\œˆZc\ﬂt\‡?≥\"“ÖhD@','',''),(525,'Institut de l\'Ebre','Av. Colom, 34-42','Tortosa','43500',1,'e3004441@xtec.cat','',_binary '\0\0\0\0\0\0\0:?\0&}\‡?G•…¶KhD@','',''),(526,'Institut Narc√≠s Oller','C. Francesc Gum√† Ferran, 1','Valls','43800',1,'e3004608@xtec.cat','',_binary '\0\0\0\0\0\0\0~TÒ¨ Ù?æ1UGF•D@','',''),(527,'Institut Jaume Huguet','C. Creu de Cames, s/n','Valls','43800',1,'e3004611@xtec.cat','',_binary '\0\0\0\0\0\0\0U2L\‚∂ÚÛ?\”76)\Ô§D@','',''),(528,'Institut Baix Pened√®s','Av. Salvador Palau Rabass√≥, 1','El Vendrell','43700',1,'e3004797@xtec.cat','',_binary '\0\0\0\0\0\0\0\≈:\Ë!9j¯?˜c∂KõD@','',''),(529,'Institut Andreu Nin','Av. Salvador Palau Rabass√≥, 18','El Vendrell','43700',1,'e3004803@xtec.cat','',_binary '\0\0\0\0\0\0\0%¸4\È^¯?í¸˝lhõD@','',''),(530,'Institut Francesc Vidal i Barraquer','Av. Llu√≠s Companys, 1','Tarragona','43005',1,'e3005704@xtec.cat','',_binary '\0\0\0\0\0\0\0F ±\’\ÊÛ?wöŸ¢]èD@','',''),(531,'Institut Ramon Barbat i Miracle','Av. de l\'Alcalde Pere Molas, s/n','Vila-seca de Solcina','43480',1,'e3005972@xtec.cat','',_binary '\0\0\0\0\0\0\0˛®©\·gÚ?∑TÙsçD@','',''),(532,'Institut Montsi√†','C. Madrid, 35-49','Amposta','43870',1,'e3006101@xtec.cat','',_binary '\0\0\0\0\0\0\0∂∏ñ.ú¢\‚?ªìåÚ\≈ZD@','',''),(533,'Institut Campclar','Rambla de Ponent, 66','Tarragona','43006',1,'e3006125@xtec.cat','',_binary '\0\0\0\0\0\0\0\Àﬁ©PbÛ?]\·b\Á€èD@','',''),(534,'Institut Manuel Sales i Ferr√©','Av. de les Escoles, 6','Ulldecona','43550',1,'e3006496@xtec.cat','',_binary '\0\0\0\0\0\0\0V>≤V@C\‹?\ËOFU\∆LD@','',''),(535,'Institut Joan Amig√≥ i Callau','C. del Ser√®, 10','L¬¥Espluga de Francol√≠','43440',1,'e3006617@xtec.cat','',_binary '\0\0\0\0\0\0\0î	{Ò?Pd°i≤D@','',''),(536,'Institut Pere Martell','Autovia de Salou, s/n','Tarragona','43006',1,'e3006630@xtec.cat','',_binary '\0\0\0\0\0\0\0Ç3\0m\‘Û?\Œ\"yéD@','',''),(537,'Institut Terra Alta','Ctra. de Vilalba, 30','Gandesa','43780',1,'e3006642@xtec.cat','',_binary '\0\0\0\0\0\0\0\0ûö\È\‹?”ê¢‚ÄáD@','',''),(538,'Institut Cambrils','Pl. Ajuntament, 7','Cambrils','43850',1,'e3006654@xtec.cat','',_binary '\0\0\0\0\0\0\0\'$/Òõ\Ë?0§oD\nâD@','',''),(539,'Institut Gabriel Ferrater i Soler','Ctra. de Montblanc, 5-9','Reus','43206',1,'e3006678@xtec.cat','',_binary '\0\0\0\0\0\0\0SS~ëQ\ﬂÒ?\\µ‰ùîD@','',''),(540,'Institut de La S√©nia','C. Domenges, s/n','La S√©nia','43560',1,'e3006681@xtec.cat','',_binary '\0\0\0\0\0\0\0_hqB\“?‘æ[NπQD@','',''),(541,'Institut Priorat','Ctra. de Porrera, s/n','Falset','43730',1,'e3006691@xtec.cat','',_binary '\0\0\0\0\0\0\0ƒ£€≤FÑ\Í?äŸß€ìD@','',''),(542,'Institut Joan Segura i Valls','C. Progr√®s, 7','Santa Coloma de Queralt','43420',1,'e3006708@xtec.cat','',_binary '\0\0\0\0\0\0\0ùAΩ\≈ˆ?^Hy\ƒD@','',''),(543,'Institut Torredembarra','Av. de Sant Jordi, 62-64','Torredembarra','43830',1,'e3006952@xtec.cat','',_binary '\0\0\0\0\0\0\0\◊pä\\nˆ?\¬˜k£[ìD@','',''),(544,'Institut de Deltebre','Av. de Catalunya, s/n','Deltebre','43580',1,'e3006964@xtec.cat','',_binary '\0\0\0\0\0\0\0#w\Ã\—\«\"\Á?EP¿l>\\D@','',''),(545,'Institut Mare de D√©u de la Candelera','Av. l\'Ensenyament, s/n','L\'Ametlla de Mar','43860',1,'e3006976@xtec.cat','',_binary '\0\0\0\0\0\0\0`\…Z\Â7å\È?Ùú\ÓpD@','',''),(546,'Institut Escola d\'Hoteleria i Turisme','C. Estel (Pg. Mar√≠tim)','Cambrils','43850',1,'e3007038@xtec.cat','',_binary '\0\0\0\0\0\0\020ıjΩ?\È\Èß(,àD@','',''),(547,'Institut S√≤l de Riu','C. Joan Maragall, s/n','Alcanar','43530',1,'e3007087@xtec.cat','',_binary '\0\0\0\0\0\0\0>$:”ùj\ﬁ?-§ñ\¬ED@','',''),(548,'Institut Julio Antonio','C. Comarques Catalanes, 103','M√≥ra d\'Ebre','43740',1,'e3007129@xtec.cat','',_binary '\0\0\0\0\0\0\0U\\£Ö\Œb\‰?@7dû=ãD@','',''),(549,'Institut Berenguer d\'Enten√ßa','C. Ramon Berenguer IV, 7','L\'Hospitalet de l\'Infant','43890',1,'e3007208@xtec.cat','',_binary '\0\0\0\0\0\0\0°É†6πn\Ì?\◊\‹«ç?D@','',''),(550,'Institut Blanca d\'Anjou','Av. Sant Jordi, 1','El Perell√≥','43519',1,'e3007211@xtec.cat','',_binary '\0\0\0\0\0\0\0¬ì9=øΩ\Ê?Qpá&pD@','',''),(551,'Institut Els Alfacs','C. Doctor Torn√©, s/n','Sant Carles de la R√†pita','43540',1,'e3007221@xtec.cat','',_binary '\0\0\0\0\0\0\0(\»|˛É\—\‚?n∏KøùOD@','',''),(552,'Institut de Flix','C. Salvador Espriu, 1','Flix','43750',1,'e3007233@xtec.cat','',_binary '\0\0\0\0\0\0\0úÙ\À∏g\·?\ƒ5ˇ.˙úD@','',''),(553,'Institut Cam√≠ de Mar','C. Jaume Pallar√®s, s/n','Calafell','43820',1,'e3007257@xtec.cat','',_binary '\0\0\0\0\0\0\0\ÏÄ(\Ó1˘?†%ôD@','',''),(554,'Institut d\'Horticultura i Jardineria','Autovia de Bellissens, 41','Reus','43204',1,'e3007385@xtec.cat','',_binary '\0\0\0\0\0\0\0’∑ï</Ú?üJ=seëD@','',''),(555,'Institut Jaume I','C. Advocat Gallego, 6','Salou','43840',1,'e3007543@xtec.cat','',_binary '\0\0\0\0\0\0\0.ñû¿¶$Ú?Y 0≈ãäD@','',''),(556,'Institut de L\'Arbo√ß','C. Pompeu Fabra, s/n','L\'Arbo√ß','43720',1,'e3007580@xtec.cat','',_binary '\0\0\0\0\0\0\0™$®ù>ã˘?,£†˙X¢D@','',''),(557,'Institut de Constant√≠','C. Onze de Setembre, s/n','Constant√≠','43120',1,'e3007646@xtec.cat','',_binary '\0\0\0\0\0\0\0\„¥\ÁˇC|Û?’∫0yììD@','',''),(558,'Institut Joan Guinjoan i Gispert','C. Baltasar de Tod√† i de T√†pies, s/n','Riudoms','43330',1,'e3007658@xtec.cat','',_binary '\0\0\0\0\0\0\0\«Z%Sc\‹?k\»^@íD@','',''),(559,'Institut Ramon de la Torre','C. Cam√≠ del Moro, 28-40','Torredembarra','43830',1,'e3007661@xtec.cat','',_binary '\0\0\0\0\0\0\0k£#ÅRôˆ?Ç\—y+ìD@','',''),(560,'Institut Torreforta','C. M√≥ra d\'Ebre, s/n','Tarragona','43006',1,'e3008390@xtec.cat','',_binary '\0\0\0\0\0\0\0ß\‰ıêãrÛ?K ëY≥èD@','',''),(561,'Institut El Morell','C. C√©sar Martinell, 1','El Morell','43760',1,'e3008407@xtec.cat','',_binary '\0\0\0\0\0\0\0ˇá0>Û?wôƒ©òD@','',''),(562,'Institut Camarles','C. de la Granadella, s/n','Camarles','43894',1,'e3008419@xtec.cat','',_binary '\0\0\0\0\0\0\0≥9Ú3:O\Â?I≠jbD@','',''),(563,'Institut Roquetes','C. Anselm Clav√©, 8','Roquetes','43520',1,'e3008420@xtec.cat','',_binary '\0\0\0\0\0\0\0\’\‰á\Î˙\ﬂ?∞Zá\rPiD@','',''),(564,'Institut Sant Pere i Sant Pau','C. de l\'Institut, s/n','Sant Pere i Sant Pau','43007',1,'e3008432@xtec.cat','',_binary '\0\0\0\0\0\0\0\Ô6\◊â˜Û?\’\'`ﬂëD@','',''),(565,'Institut Josep Tapir√≥','C. Astorga, 37-39','Reus','43205',1,'e3008444@xtec.cat','',_binary '\0\0\0\0\0\0\0˘¡\‚8\‹Ò?\ƒÃÄ´£ëD@','',''),(566,'Institut Les Planes','Pl. Catalunya, 1','Santa B√†rbara','43570',1,'e3008456@xtec.cat','',_binary '\0\0\0\0\0\0\0T~VEJ\ﬂ?åª\Î≥[D@','',''),(567,'Institut Collblanc','C. Carrasco i Formiguera, 12','La Canonja','43110',1,'e3008481@xtec.cat','',_binary '\0\0\0\0\0\0\0BmêS∏Û?ı¢>lèD@','',''),(568,'Institut Escola de Capacitaci√≥ Nauticopesquera de Catalunya','C. del Mediterrani, 2','L\'Ametlla de Mar','43860',1,'e3008493@xtec.cat','',_binary '\0\0\0\0\0\0\0ªó˚\‰(ê\È?µ©èµpD@','',''),(569,'Institut Pont del Diable','Av. de Sant Salvador, 17-A','Sant Salvador','43130',1,'e3008501@xtec.cat','',_binary '\0\0\0\0\0\0\0¶\·∑\»\r\‹Û?.sx‘îD@','',''),(570,'Institut Joan Puig i Ferreter','C. Abel Ferrater, s/n','La Selva del Camp','43470',1,'e3008511@xtec.cat','',_binary '\0\0\0\0\0\0\0ΩS\"&\"Ú?\Óu´õD@','',''),(571,'Institut Vila-seca','Av. de l\'Alcalde Pere Molas, s/n','Vila-seca de Solcina','43480',1,'e3008523@xtec.cat','',_binary '\0\0\0\0\0\0\0˛®©\·gÚ?∑TÙsçD@','',''),(572,'Institut Antoni Ballester','C. de l\'1 d\'Octubre, 5','Mont-roig del Camp','43300',1,'e3008638@xtec.cat','',_binary '\0\0\0\0\0\0\0xQ\04fº\Ó?c\Õ\¬\‡äD@','',''),(573,'Institut Montsant','C. Comte de Rius, s/n','Cornudella de Montsant','43360',1,'e3008699@xtec.cat','',_binary '\0\0\0\0\0\0\0u™0A˝\Ï?\›f\ÃR¢°D@','',''),(574,'Esc. de M√∫sica Institut Musical de Reus','C. d\'Antoni Gaud√≠, 14','Reus','43202',1,'e3008833@xtec.cat','',_binary '\0\0\0\0\0\0\0I\ÂjáfÆÒ?#f3\›dîD@','',''),(575,'Institut Mart√≠ l\'Hum√†','Av. Doctor Folch, s/n','Montblanc','43400',1,'e3009187@xtec.cat','',_binary '\0\0\0\0\0\0\0]Ü§ªê{Ú?q:Ù\÷ÛØD@','',''),(576,'Institut Fonts del Glorieta','Av. de Mart√≠ i Pol, 2','Alcover','43460',1,'e3009497@xtec.cat','',_binary '\0\0\0\0\0\0\0Ü#á	©Ú?\‰\'.˜d°D@','',''),(577,'Institut Cal¬∑l√≠polis','Autovia de Salou, s/n','Tarragona','43006',1,'e3009722@xtec.cat','',_binary '\0\0\0\0\0\0\0Ç3\0m\‘Û?\Œ\"yéD@','',''),(578,'Institut Ernest Lluch i Mart√≠','Av. del Castell, s/n','Cunit','43881',1,'e3009850@xtec.cat','',_binary '\0\0\0\0\0\0\0xÒbá˜˘?û\‚\”\ƒôD@','',''),(579,'Institut d\'Altafulla','C. Cam√≠ de l\'Oliverot, s/n','Altafulla','43893',1,'e3009977@xtec.cat','',_binary '\0\0\0\0\0\0\0Á£ûõºˆ?\⁄ˆîïíD@','',''),(580,'Institut La Mar de la Frau','C. Mas de Vileta, 1-3','Cambrils','43850',1,'e3010335@xtec.cat','',_binary '\0\0\0\0\0\0\0ız∏c`Ò?µ\ËïYâD@','',''),(581,'Institut La Talaia','C. Brasil, 8','Segur de Calafell','43882',1,'e3010372@xtec.cat','',_binary '\0\0\0\0\0\0\0e\ËÒ\ﬁ≈π˘?Ùy\„ôD@','',''),(582,'Institut Coster de la Torre','Av. de la Diputaci√≥, s/n','La Bisbal del Pened√®s','43717',1,'e3010414@xtec.cat','',_binary '\0\0\0\0\0\0\0ê\Ï\n∞°\Ÿ˜?6_°\ÊV£D@','',''),(583,'Institut Fontanelles','C. Cultura, 1','Les Borges del Camp','43350',1,'e3010578@xtec.cat','',_binary '\0\0\0\0\0\0\08ÉLo?ïs\÷e\0ñD@','',''),(584,'Institut Serra de Miramar','Pl. del Quarter, s/n','Valls','43800',1,'e3010608@xtec.cat','',_binary '\0\0\0\0\0\0\0~.ï}	Ù?†m\nk∞§D@','',''),(585,'Institut Els Pallaresos','Av. Catalunya, 12','Els Pallaresos','43151',1,'e3010748@xtec.cat','',_binary '\0\0\0\0\0\0\0$\‰ÜV\\Ù?≥\nÉEñD@','',''),(586,'Institut Roseta Mauri','C. Jaume Vidal i Alcover, 17-19','Reus','43204',1,'e3010852@xtec.cat','',_binary '\0\0\0\0\0\0\0S\’n5ó\›Ò?êT±¡öíD@','',''),(587,'Institut de Tecnificaci√≥','C. Fran√ßa, 19-21','Amposta','43870',1,'e3010888@xtec.cat','',_binary '\0\0\0\0\0\0\0\„>o≥Cü\‚?ãªvZD@','',''),(588,'Institut Crist√≤fol Despuig','C. Rub√≠, 16','Tortosa','43500',1,'e3011170@xtec.cat','',_binary '\0\0\0\0\0\0\0˚µ48\√\›\‡?\«\"{ÙÆgD@','',''),(589,'Institut Roda de Ber√†','C. de la Font, 3','Roda de Ber√†','43883',1,'e3011418@xtec.cat','',_binary '\0\0\0\0\0\0\0yÅ>}9˜?2∏/•óD@','',''),(590,'Institut Tarragona','Pl. de la Imperial Tarraco, 1','Tarragona','43003',1,'e3011479@xtec.cat','',_binary '\0\0\0\0\0\0\0˝{ëÛ?íÙññDèD@','',''),(591,'Institut Escola Pi del Burgar','C. Josep Vidal i Llecha, 1','Reus','43204',1,'e3012083@xtec.cat','',_binary '\0\0\0\0\0\0\0m£¶ì\ËÒ?\ﬂym,dîD@','',''),(592,'Institut Escola Mare de D√©u del Portal','C. del C√≥s, 8','Batea','43786',1,'e3012113@xtec.cat','',_binary '\0\0\0\0\0\0\0ú\rä ¨\‘?˜ƒì\r∆ãD@','',''),(593,'Institut Escola 3 d\'Abril','C. √Ängel Guimer√†, 2','M√≥ra la Nova','43770',1,'e3012289@xtec.cat','',_binary '\0\0\0\0\0\0\0Ω96\‰ö\‡\‰?ïè\Õ#πåD@','',''),(594,'Institut Escola Daniel Mangran√©','Ctra. Jes√∫s-Roquetes, s/n','Jes√∫s','43590',1,'e3012307@xtec.cat','',_binary '\0\0\0\0\0\0\0†Ú∑V\ﬁB\‡?Ñlø†iD@','',''),(595,'Institut Escola L\'Agulla','Av. Catalunya, 3','El Catllar','43764',1,'e3012812@xtec.cat','',_binary '\0\0\0\0\0\0\0á!e\–xFı?j•®\‰pñD@','',''),(596,'Institut Escola Mediterrani','C. Riu Ter, s/n','Bonavista','43001',1,'e3012976@xtec.cat','',_binary '\0\0\0\0\0\0\0\0´?úi=Û?~π`∫⁄éD@','',''),(597,'Institut de Miami','Av. de Cadis, s/n','Miami Platja','43892',1,'e3012988@xtec.cat','',_binary '\0\0\0\0\0\0\0•\Ô&Ÿô´\Ì?\0*sÀÄD@','','');
/*!40000 ALTER TABLE `core_centre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_centre_admins`
--

DROP TABLE IF EXISTS `core_centre_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_centre_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centre_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_centre_admins_centre_id_user_id_8325712b_uniq` (`centre_id`,`user_id`),
  KEY `core_centre_admins_user_id_de80d1cb_fk_core_user_id` (`user_id`),
  CONSTRAINT `core_centre_admins_centre_id_00b1d535_fk_core_centre_id` FOREIGN KEY (`centre_id`) REFERENCES `core_centre` (`id`),
  CONSTRAINT `core_centre_admins_user_id_de80d1cb_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_centre_admins`
--

LOCK TABLES `core_centre_admins` WRITE;
/*!40000 ALTER TABLE `core_centre_admins` DISABLE KEYS */;
INSERT INTO `core_centre_admins` VALUES (3,30,2),(4,30,3),(2,30,6),(1,330,5);
/*!40000 ALTER TABLE `core_centre_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_centre_cicles`
--

DROP TABLE IF EXISTS `core_centre_cicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_centre_cicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centre_id` int(11) NOT NULL,
  `cicle_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_centre_cicles_centre_id_cicle_id_d283c7fd_uniq` (`centre_id`,`cicle_id`),
  KEY `core_centre_cicles_cicle_id_5a552b32_fk_core_cicle_id` (`cicle_id`),
  CONSTRAINT `core_centre_cicles_centre_id_58566ee8_fk_core_centre_id` FOREIGN KEY (`centre_id`) REFERENCES `core_centre` (`id`),
  CONSTRAINT `core_centre_cicles_cicle_id_5a552b32_fk_core_cicle_id` FOREIGN KEY (`cicle_id`) REFERENCES `core_cicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_centre_cicles`
--

LOCK TABLES `core_centre_cicles` WRITE;
/*!40000 ALTER TABLE `core_centre_cicles` DISABLE KEYS */;
INSERT INTO `core_centre_cicles` VALUES (2,30,1),(10,30,28),(3,30,37),(4,30,73),(5,30,75),(6,30,76),(8,30,120),(9,30,121),(7,30,124),(1,30,128);
/*!40000 ALTER TABLE `core_centre_cicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_cicle`
--

DROP TABLE IF EXISTS `core_cicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grau` varchar(4) NOT NULL,
  `codi` varchar(4) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `pladestudis` varchar(200) DEFAULT NULL,
  `descripcio` longtext NOT NULL,
  `familia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codi` (`codi`),
  UNIQUE KEY `nom` (`nom`),
  KEY `core_cicle_familia_id_50b819b4_fk_core_categoria_id` (`familia_id`),
  CONSTRAINT `core_cicle_familia_id_50b819b4_fk_core_categoria_id` FOREIGN KEY (`familia_id`) REFERENCES `core_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_cicle`
--

LOCK TABLES `core_cicle` WRITE;
/*!40000 ALTER TABLE `core_cicle` DISABLE KEYS */;
INSERT INTO `core_cicle` VALUES (1,'CFGM','AF10','Preimpressi√≥ digital',NULL,'Preimpressi√≥ digital',27),(2,'CFGM','AF20','Impressi√≥ gr√†fica',NULL,'Impressi√≥ gr√†fica',27),(3,'CFGM','AF21','Impressi√≥ gr√†fica (converting)',NULL,'Impressi√≥ gr√†fica (converting)',27),(4,'CFGM','AF30','Postimpressi√≥ i acabats gr√†fics',NULL,'Postimpressi√≥ i acabats gr√†fics',27),(5,'CFGM','AG10','Gesti√≥ administrativa',NULL,'Gesti√≥ administrativa',28),(6,'CFGM','AG11','Gesti√≥ administrativa (√†mbit jur√≠dic)',NULL,'Gesti√≥ administrativa (√†mbit jur√≠dic)',28),(7,'CFGM','AG12','Gesti√≥ administrativa (√†mbit sanitari)',NULL,'Gesti√≥ administrativa (√†mbit sanitari)',28),(8,'CFGM','AR10','Producci√≥ agropecu√†ria',NULL,'Producci√≥ agropecu√†ria',29),(9,'CFGM','AR11','Producci√≥ agropecu√†ria (Producci√≥ agr√≠cola)',NULL,'Producci√≥ agropecu√†ria (Producci√≥ agr√≠cola)',29),(10,'CFGM','AR12','Producci√≥ agropecu√†ria (Producci√≥ ramadera)',NULL,'Producci√≥ agropecu√†ria (Producci√≥ ramadera)',29),(11,'CFGM','AR20','Producci√≥ agroecol√≤gica',NULL,'Producci√≥ agroecol√≤gica',29),(12,'CFGM','AR21','Producci√≥ agroecol√≤gica (Producci√≥ agr√≠cola ecol√≤gica)',NULL,'Producci√≥ agroecol√≤gica (Producci√≥ agr√≠cola ecol√≤gica)',29),(13,'CFGM','AR22','Producci√≥ agroecol√≤gica (Producci√≥ ramadera ecol√≤gica)',NULL,'Producci√≥ agroecol√≤gica (Producci√≥ ramadera ecol√≤gica)',29),(14,'CFGM','AR30','Aprofitament i conservaci√≥ del medi natural',NULL,'Aprofitament i conservaci√≥ del medi natural',29),(15,'CFGM','AR50','Jardineria i floristeria',NULL,'Jardineria i floristeria',29),(16,'CFGM','AR60','Activitats eq√ºestres',NULL,'Activitats eq√ºestres',29),(17,'CFGM','CM10','Activitats comercials',NULL,'Activitats comercials',30),(18,'CFGM','CM11','Activitats comercials (productes frescos)',NULL,'Activitats comercials (productes frescos)',30),(19,'CFGM','CM12','Activitats comercials (log√≠stica)',NULL,'Activitats comercials (log√≠stica)',30),(20,'CFGM','CM13','Activitats comercials (moda)',NULL,'Activitats comercials (moda)',30),(21,'CFGM','EA10','Xarxes, instal¬∑lacions i estacions de tractament d\'aigua',NULL,'Xarxes, instal¬∑lacions i estacions de tractament d\'aigua',31),(22,'CFGM','EA20','Xarxes i estacions de tractament d\'aig√ºes',NULL,'Xarxes i estacions de tractament d\'aig√ºes',31),(23,'CFGM','EE10','Instal¬∑lacions el√®ctriques i autom√†tiques',NULL,'Instal¬∑lacions el√®ctriques i autom√†tiques',32),(24,'CFGM','EE30','Instal.lacions de telecomunicacions',NULL,'Instal.lacions de telecomunicacions',32),(25,'CFGM','EO10','Obres d\'interior, decoraci√≥ i rehabilitaci√≥',NULL,'Obres d\'interior, decoraci√≥ i rehabilitaci√≥',33),(26,'CFGM','EO20','Construcci√≥',NULL,'Construcci√≥',33),(27,'CFGM','FM10','Soldadura i caldereria',NULL,'Soldadura i caldereria',34),(28,'CFGM','FM20','Mecanitzaci√≥',NULL,'Mecanitzaci√≥',34),(29,'CFGM','FM21','Mecanitzaci√≥ (Manteniment i reparaci√≥ en rellotgeria) ',NULL,'Mecanitzaci√≥ (Manteniment i reparaci√≥ en rellotgeria) ',34),(30,'CFGM','FS10','Fusteria i moble',NULL,'Fusteria i moble',35),(31,'CFGM','FS20','Instal¬∑laci√≥ i moblament',NULL,'Instal¬∑laci√≥ i moblament',35),(32,'CFGM','HT10','Cuina i gastronomia',NULL,'Cuina i gastronomia',36),(33,'CFGM','HT30','Serveis en restauraci√≥',NULL,'Serveis en restauraci√≥',36),(34,'CFGM','IA10','Elaboraci√≥ de productes alimentaris',NULL,'Elaboraci√≥ de productes alimentaris',37),(35,'CFGM','IA30','Olis d\'oliva i vins',NULL,'Olis d\'oliva i vins',37),(36,'CFGM','IA60','Forneria, pastisseria i confiteria',NULL,'Forneria, pastisseria i confiteria',37),(37,'CFGM','IC10','Sistemes microinform√†tics i xarxes',NULL,'Sistemes microinform√†tics i xarxes',38),(38,'CFGM','IE10','Excavacions i sondatges',NULL,'Excavacions i sondatges',39),(39,'CFGM','IE11','Excavacions i sondatges (operacions de maquin√†ria de construcci√≥)',NULL,'Excavacions i sondatges (operacions de maquin√†ria de construcci√≥)',39),(40,'CFGM','IE20','Pedra natural',NULL,'Pedra natural',39),(41,'CFGM','IM10','Manteniment electromec√†nic',NULL,'Manteniment electromec√†nic',40),(42,'CFGM','IM11','Manteniment electromec√†nic (vaixells d\'esbarjo i serveis portuaris)',NULL,'Manteniment electromec√†nic (vaixells d\'esbarjo i serveis portuaris)',40),(43,'CFGM','IM20','Instal¬∑lacions de producci√≥ de calor',NULL,'Instal¬∑lacions de producci√≥ de calor',40),(44,'CFGM','IM30','Instal¬∑lacions frigor√≠fiques i de climatitzaci√≥',NULL,'Instal¬∑lacions frigor√≠fiques i de climatitzaci√≥',40),(45,'CFGM','IP10','Perruqueria i cosm√®tica capil¬∑lar',NULL,'Perruqueria i cosm√®tica capil¬∑lar',41),(46,'CFGM','IP20','Est√®tica i bellesa',NULL,'Est√®tica i bellesa',41),(47,'CFGM','IS10','V√≠deo, discj√≤quei i so',NULL,'V√≠deo, discj√≤quei i so',42),(48,'CFGM','MP10','Cultius Aq√º√≠coles',NULL,'Cultius Aq√º√≠coles',43),(49,'CFGM','MP20','Operacions subaqu√†tiques i hiperb√†riques',NULL,'Operacions subaqu√†tiques i hiperb√†riques',43),(50,'CFGM','MP30','Navegaci√≥ i pesca de litoral',NULL,'Navegaci√≥ i pesca de litoral',43),(51,'CFGM','MP40','Manteniment i control de la maquin√†ria de vaixells i embarcacions',NULL,'Manteniment i control de la maquin√†ria de vaixells i embarcacions',43),(52,'CFGM','QU10','Planta qu√≠mica',NULL,'Planta qu√≠mica',44),(53,'CFGM','QU11','Planta qu√≠mica (productes farmac√®utics i cosm√®tics)',NULL,'Planta qu√≠mica (productes farmac√®utics i cosm√®tics)',44),(54,'CFGM','QU20','Operacions de laboratori',NULL,'Operacions de laboratori',44),(55,'CFGM','SA20','Farm√†cia i parafarm√†cia',NULL,'Farm√†cia i parafarm√†cia',45),(56,'CFGM','SA30','Emerg√®ncies sanit√†ries',NULL,'Emerg√®ncies sanit√†ries',45),(57,'CFGM','SC10','Atenci√≥ a persones en situaci√≥ de depend√®ncia',NULL,'Atenci√≥ a persones en situaci√≥ de depend√®ncia',46),(58,'CFGM','SM20','Emerg√®ncies i protecci√≥ civil',NULL,'Emerg√®ncies i protecci√≥ civil',47),(59,'CFGM','TM10','Electromec√†nica de vehicles autom√≤bils',NULL,'Electromec√†nica de vehicles autom√≤bils',48),(60,'CFGM','TM11','Electromec√†nica de vehicles autom√≤bils (Avions amb motor de pist√≥)',NULL,'Electromec√†nica de vehicles autom√≤bils (Avions amb motor de pist√≥)',48),(61,'CFGM','TM12','Electromec√†nica de vehicles autom√≤bils (Electromec√°nica de vehicles industrials)',NULL,'Electromec√†nica de vehicles autom√≤bils (Electromec√°nica de vehicles industrials)',48),(62,'CFGM','TM20','Carrosseria',NULL,'Carrosseria',48),(63,'CFGM','TM30','Electromec√†nica de maquin√†ria',NULL,'Electromec√†nica de maquin√†ria',48),(64,'CFGM','TM40','Manteniment de material rodant ferroviari',NULL,'Manteniment de material rodant ferroviari',48),(65,'CFGM','TM50','Conducci√≥ de vehicles de transport per carretera',NULL,'Conducci√≥ de vehicles de transport per carretera',48),(66,'CFGM','TM60','Manteniment d\'embarcacions d\'esbarjo',NULL,'Manteniment d\'embarcacions d\'esbarjo',48),(67,'CFGM','TX10','Fabricaci√≥ i ennobliment de productes t√®xtils',NULL,'Fabricaci√≥ i ennobliment de productes t√®xtils',49),(68,'CFGM','TX11','Fabricaci√≥ i ennobliment de productes t√®xtils (g√®neres de punt)',NULL,'Fabricaci√≥ i ennobliment de productes t√®xtils (g√®neres de punt)',49),(69,'CFGM','TX50','Confecci√≥ i moda',NULL,'Confecci√≥ i moda',49),(70,'CFGM','TX51','Confecci√≥ i moda (innovaci√≥ i producci√≥ de la moda)',NULL,'Confecci√≥ i moda (innovaci√≥ i producci√≥ de la moda)',49),(71,'CFGS','AEA0','Ensenyament i animaci√≥ socioesportiva',NULL,'Ensenyament i animaci√≥ socioesportiva',50),(72,'CFGS','AEB0','Condicionament f√≠sic',NULL,'Condicionament f√≠sic',50),(73,'CFGS','AFA0','Disseny i edici√≥ de publicacions impreses i multim√®dia ',NULL,'Disseny i edici√≥ de publicacions impreses i multim√®dia ',27),(74,'CFGS','AFB0','Disseny i gesti√≥ de la producci√≥ gr√†fica',NULL,'Disseny i gesti√≥ de la producci√≥ gr√†fica',27),(75,'CFGS','AGA0','Assist√®ncia a la direcci√≥ ',NULL,'Assist√®ncia a la direcci√≥ ',28),(76,'CFGS','AGB0','Administraci√≥ i finances',NULL,'Administraci√≥ i finances',28),(77,'CFGS','AGB1','Administraci√≥ i finances (gestor d\'assegurances)',NULL,'Administraci√≥ i finances (gestor d\'assegurances)',28),(78,'CFGS','ARA0','Gesti√≥ forestal i del medi natural',NULL,'Gesti√≥ forestal i del medi natural',29),(79,'CFGS','ARB0','Paisatgisme i medi rural',NULL,'Paisatgisme i medi rural',29),(80,'CFGS','ARB1','Paisatgisme i medi rural (gesti√≥ agropecu√†ria)',NULL,'Paisatgisme i medi rural (gesti√≥ agropecu√†ria)',29),(81,'CFGS','ARC0','Ramaderia i assist√®ncia en sanitat animal',NULL,'Ramaderia i assist√®ncia en sanitat animal',29),(82,'CFGS','CMA0','Gesti√≥ de vendes i espais comercials ',NULL,'Gesti√≥ de vendes i espais comercials ',30),(83,'CFGS','CMB0','Comer√ß internacional',NULL,'Comer√ß internacional',30),(84,'CFGS','CMC0','Transport i log√≠stica',NULL,'Transport i log√≠stica',30),(85,'CFGS','CMD0','M√†rqueting i publicitat ',NULL,'M√†rqueting i publicitat ',30),(86,'CFGS','CMD1','M√†rqueting i publicitat (enol√≤gic)',NULL,'M√†rqueting i publicitat (enol√≤gic)',30),(87,'CFGS','CMD2','M√†rqueting i publicitat (promoci√≥ tur√≠stica)',NULL,'M√†rqueting i publicitat (promoci√≥ tur√≠stica)',30),(88,'CFGS','EAA0','Efici√®ncia energ√®tica i energia solar t√®rmica',NULL,'Efici√®ncia energ√®tica i energia solar t√®rmica',31),(89,'CFGS','EAC0','Energies renovables',NULL,'Energies renovables',31),(90,'CFGS','EAD0','Gesti√≥ de l\'aigua',NULL,'Gesti√≥ de l\'aigua',31),(91,'CFGS','EEA0','Sistemes electrot√®cnics i automatitzats',NULL,'Sistemes electrot√®cnics i automatitzats',32),(92,'CFGS','EEA1','Sistemes electrot√®cnics i automatitzats (instal¬∑lacions el√®ctriques i comunicacions del vaixell)',NULL,'Sistemes electrot√®cnics i automatitzats (instal¬∑lacions el√®ctriques i comunicacions del vaixell)',32),(93,'CFGS','EEB0','Automatitzaci√≥ i rob√≤tica industrial',NULL,'Automatitzaci√≥ i rob√≤tica industrial',32),(94,'CFGS','EEC0','Manteniment electr√≤nic',NULL,'Manteniment electr√≤nic',32),(95,'CFGS','EED0','Sistemes de telecomunicacions i inform√†tics',NULL,'Sistemes de telecomunicacions i inform√†tics',32),(96,'CFGS','EEE0','Electromedicina cl√≠nica',NULL,'Electromedicina cl√≠nica',32),(97,'CFGS','EOA0','Projectes d\'obra civil',NULL,'Projectes d\'obra civil',33),(98,'CFGS','EOA1','Projectes d\'obra civil (Sobrestants)',NULL,'Projectes d\'obra civil (Sobrestants)',33),(99,'CFGS','EOA2','Projectes d\'obra civil (√∫s d\'aplicacions SIG)',NULL,'Projectes d\'obra civil (√∫s d\'aplicacions SIG)',33),(100,'CFGS','EOB0','Projectes d\'edificaci√≥',NULL,'Projectes d\'edificaci√≥',33),(101,'CFGS','EOB1','Projectes d\'edificaci√≥ (rehabilitaci√≥ i restauraci√≥)',NULL,'Projectes d\'edificaci√≥ (rehabilitaci√≥ i restauraci√≥)',33),(102,'CFGS','EOC0','Organitzaci√≥ i control d\'obres de construcci√≥',NULL,'Organitzaci√≥ i control d\'obres de construcci√≥',33),(103,'CFGS','FMA0','Construccions met√†l¬∑liques',NULL,'Construccions met√†l¬∑liques',34),(104,'CFGS','FMB0','Programaci√≥ de la producci√≥ en fabricaci√≥ mec√†nica',NULL,'Programaci√≥ de la producci√≥ en fabricaci√≥ mec√†nica',34),(105,'CFGS','FMB1','Programaci√≥ de la producci√≥ en fabricaci√≥ mec√†nica (motlles i matrius)',NULL,'Programaci√≥ de la producci√≥ en fabricaci√≥ mec√†nica (motlles i matrius)',34),(106,'CFGS','FMC0','Disseny en fabricaci√≥ mec√†nica',NULL,'Disseny en fabricaci√≥ mec√†nica',34),(107,'CFGS','FMC1','Disseny en fabricaci√≥ mec√†nica (desenvolupament virtual de l\'autom√≤bil)',NULL,'Disseny en fabricaci√≥ mec√†nica (desenvolupament virtual de l\'autom√≤bil)',34),(108,'CFGS','FMD0','Programaci√≥ de la producci√≥ en emmotllament de metalls i pol√≠mers',NULL,'Programaci√≥ de la producci√≥ en emmotllament de metalls i pol√≠mers',34),(109,'CFGS','FSA0','Disseny i moblament',NULL,'Disseny i moblament',35),(110,'CFGS','FSA1','Disseny i moblament (construccions ef√≠meres i decorats)',NULL,'Disseny i moblament (construccions ef√≠meres i decorats)',35),(111,'CFGS','HTA0','Ag√®ncies de viatges i gesti√≥ d\'esdeveniments',NULL,'Ag√®ncies de viatges i gesti√≥ d\'esdeveniments',36),(112,'CFGS','HTB0','Gesti√≥ d\'allotjaments tur√≠stics',NULL,'Gesti√≥ d\'allotjaments tur√≠stics',36),(113,'CFGS','HTD0','Direcci√≥ de cuina',NULL,'Direcci√≥ de cuina',36),(114,'CFGS','HTE0','Direcci√≥ de serveis en restauraci√≥',NULL,'Direcci√≥ de serveis en restauraci√≥',36),(115,'CFGS','HTF0','Guia, informaci√≥ i assist√®ncia tur√≠stiques',NULL,'Guia, informaci√≥ i assist√®ncia tur√≠stiques',36),(116,'CFGS','HTF1','Guia, informaci√≥ i assist√®ncia tur√≠stiques (animaci√≥ tur√≠stica)',NULL,'Guia, informaci√≥ i assist√®ncia tur√≠stiques (animaci√≥ tur√≠stica)',36),(117,'CFGS','IAA0','Vitivinicultura',NULL,'Vitivinicultura',37),(118,'CFGS','IAB0','Processos i qualitat en la ind√∫stria aliment√†ria',NULL,'Processos i qualitat en la ind√∫stria aliment√†ria',37),(119,'CFGS','ICA0','Administraci√≥ de sistemes inform√†tics en xarxa',NULL,'Administraci√≥ de sistemes inform√†tics en xarxa',38),(120,'CFGS','ICA1','Administraci√≥ de sistemes inform√†tics en xarxa (ciberseguretat)',NULL,'Administraci√≥ de sistemes inform√†tics en xarxa (ciberseguretat)',38),(121,'CFGS','ICB0','Desenvolupament d\'aplicacions multiplataforma',NULL,'Desenvolupament d\'aplicacions multiplataforma',38),(122,'CFGS','ICB1','Desenvolupament d\'aplicacions multiplataforma (inform√†tica aplicada a la log√≠stica)',NULL,'Desenvolupament d\'aplicacions multiplataforma (inform√†tica aplicada a la log√≠stica)',38),(123,'CFGS','ICB2','Desenvolupament d\'aplicacions multiplataforma (videojocs i oci digital)',NULL,'Desenvolupament d\'aplicacions multiplataforma (videojocs i oci digital)',38),(124,'CFGS','ICC0','Desenvolupament d\'aplicacions web',NULL,'Desenvolupament d\'aplicacions web',38),(125,'CFGS','ICC1','Desenvolupament d\'aplicacions web (bioinform√†tica)',NULL,'Desenvolupament d\'aplicacions web (bioinform√†tica)',38),(126,'CFGS','IMA0','Manteniment d\'instal¬∑lacions t√®rmiques i de fluids',NULL,'Manteniment d\'instal¬∑lacions t√®rmiques i de fluids',40),(127,'CFGS','IMB0','Desenvolupament de projectes d\'instal¬∑lacions t√®rmiques i de fluids',NULL,'Desenvolupament de projectes d\'instal¬∑lacions t√®rmiques i de fluids',40),(128,'CFGS','IMC0','Mecatr√≤nica industrial',NULL,'Mecatr√≤nica industrial',40),(129,'CFGS','IMC1','Mecatr√≤nica industrial (fabricaci√≥ de productes cer√†mics)',NULL,'Mecatr√≤nica industrial (fabricaci√≥ de productes cer√†mics)',40),(130,'CFGS','IPA0','Assessoria d\'imatge personal i corporativa',NULL,'Assessoria d\'imatge personal i corporativa',41),(131,'CFGS','IPB0','Est√®tica integral i benestar',NULL,'Est√®tica integral i benestar',41),(132,'CFGS','IPC0','Estilisme i direcci√≥ de perruqueria',NULL,'Estilisme i direcci√≥ de perruqueria',41),(133,'CFGS','IPD0','Caracteritzaci√≥ i maquillatge professional',NULL,'Caracteritzaci√≥ i maquillatge professional',41),(134,'CFGS','ISA0','Realitzaci√≥ de projectes d\'audiovisuals i espectacles',NULL,'Realitzaci√≥ de projectes d\'audiovisuals i espectacles',42),(135,'CFGS','ISB0','Il¬∑luminaci√≥, captaci√≥ i tractament d\'imatge',NULL,'Il¬∑luminaci√≥, captaci√≥ i tractament d\'imatge',42),(136,'CFGS','ISC0','So per a audiovisuals i espectacles',NULL,'So per a audiovisuals i espectacles',42),(137,'CFGS','ISD0','Producci√≥ d\'audiovisuals i espectacles',NULL,'Producci√≥ d\'audiovisuals i espectacles',42),(138,'CFGS','ISE0','Animacions 3D, jocs i entorns interactius',NULL,'Animacions 3D, jocs i entorns interactius',42),(139,'CFGS','ISE1','Animacions 3D, jocs i entorns interactius (m√≥ns virtuals, realitat augmentada i gamificaci√≥)',NULL,'Animacions 3D, jocs i entorns interactius (m√≥ns virtuals, realitat augmentada i gamificaci√≥)',42),(140,'CFGS','MPA0','Transport mar√≠tim i pesca d\'altura',NULL,'Transport mar√≠tim i pesca d\'altura',43),(141,'CFGS','MPB0','Aq√ºicultura',NULL,'Aq√ºicultura',43),(142,'CFGS','MPC0','Organitzaci√≥ del manteniment de la maquin√†ria de vaixells i embarcacions',NULL,'Organitzaci√≥ del manteniment de la maquin√†ria de vaixells i embarcacions',43),(143,'CFGS','QUA0','Qu√≠mica industrial',NULL,'Qu√≠mica industrial',44),(144,'CFGS','QUB0','Fabricaci√≥ de productes farmac√®utics, biotecnol√≤gics i afins',NULL,'Fabricaci√≥ de productes farmac√®utics, biotecnol√≤gics i afins',44),(145,'CFGS','QUD0','Laboratori d\'an√†lisi i control de qualitat',NULL,'Laboratori d\'an√†lisi i control de qualitat',44),(146,'CFGS','SAA0','Pr√≤tesis dentals',NULL,'Pr√≤tesis dentals',45),(147,'CFGS','SAB0','Ortopr√≤tesi i productes de suport',NULL,'Ortopr√≤tesi i productes de suport',45),(148,'CFGS','SAC0','Anatomia patol√≤gica i citodiagn√≤stic',NULL,'Anatomia patol√≤gica i citodiagn√≤stic',45),(149,'CFGS','SAD0','Documentaci√≥ i administraci√≥ sanit√†ria',NULL,'Documentaci√≥ i administraci√≥ sanit√†ria',45),(150,'CFGS','SAD1','Documentaci√≥ i administraci√≥ sanit√†ries (gesti√≥ de dades)',NULL,'Documentaci√≥ i administraci√≥ sanit√†ries (gesti√≥ de dades)',45),(151,'CFGS','SAE0','Laboratori cl√≠nic i biom√®dic',NULL,'Laboratori cl√≠nic i biom√®dic',45),(152,'CFGS','SAE1','Laboratori cl√≠nic i biom√®dic (recerca)',NULL,'Laboratori cl√≠nic i biom√®dic (recerca)',45),(153,'CFGS','SAF0','Radioter√†pia i dosimetria',NULL,'Radioter√†pia i dosimetria',45),(154,'CFGS','SAG0','Audiologia prot√®tica',NULL,'Audiologia prot√®tica',45),(155,'CFGS','SAH0','Higiene bucodental',NULL,'Higiene bucodental',45),(156,'CFGS','SAI0','Imatge per al diagn√≤stic i medicina nuclear',NULL,'Imatge per al diagn√≤stic i medicina nuclear',45),(157,'CFGS','SCA0','Animaci√≥ sociocultural i tur√≠stica ',NULL,'Animaci√≥ sociocultural i tur√≠stica ',46),(158,'CFGS','SCB0','Educaci√≥ Infantil',NULL,'Educaci√≥ Infantil',46),(159,'CFGS','SCC0','Integraci√≥ social',NULL,'Integraci√≥ social',46),(160,'CFGS','SCD0','Promoci√≥ d\'igualtat de g√®nere',NULL,'Promoci√≥ d\'igualtat de g√®nere',46),(161,'CFGS','SCE0','Mediaci√≥ comunicativa',NULL,'Mediaci√≥ comunicativa',46),(162,'CFGS','SMA0','Educaci√≥ i control ambiental',NULL,'Educaci√≥ i control ambiental',47),(163,'CFGS','SMB0','Coordinaci√≥ d\'emerg√®ncies i protecci√≥ civil',NULL,'Coordinaci√≥ d\'emerg√®ncies i protecci√≥ civil',47),(164,'CFGS','TMA0','Automoci√≥',NULL,'Automoci√≥',48),(165,'CFGS','TMA1','Automoci√≥ (Vehicles industrials)',NULL,'Automoci√≥ (Vehicles industrials)',48),(166,'CFGS','TXA0','Disseny t√®cnic en t√®xtil i pell',NULL,'Disseny t√®cnic en t√®xtil i pell',49),(167,'CFGS','TXB0','Vestuari a mida i d\'espectacles',NULL,'Vestuari a mida i d\'espectacles',49),(168,'CFGS','TXE0','Patronatge i moda',NULL,'Patronatge i moda',49);
/*!40000 ALTER TABLE `core_cicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_modulprofessional`
--

DROP TABLE IF EXISTS `core_modulprofessional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_modulprofessional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `descripcio` longtext NOT NULL,
  `cicle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_modulprofessional_cicle_id_ebc6c6ca_fk_core_cicle_id` (`cicle_id`),
  CONSTRAINT `core_modulprofessional_cicle_id_ebc6c6ca_fk_core_cicle_id` FOREIGN KEY (`cicle_id`) REFERENCES `core_cicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_modulprofessional`
--

LOCK TABLES `core_modulprofessional` WRITE;
/*!40000 ALTER TABLE `core_modulprofessional` DISABLE KEYS */;
INSERT INTO `core_modulprofessional` VALUES (141,1,'MP01 Implantaci√≥ de sistemes operatius.','',119),(142,2,'MP02 Gesti√≥ de bases de dades','',119),(143,3,'MP03 Programaci√≥ b√†sica','',119),(144,4,'MP04 Llenguatges de marques i sistemes de gesti√≥ d\'informaci√≥.','',119),(145,5,'MP05 Fonaments de maquinari.','',119),(146,6,'MP06 Administraci√≥ de sistemes operatius.','',119),(147,7,'MP07 Planificaci√≥ i administraci√≥ de xarxes.','',119),(148,8,'MP08 Serveis de xarxa i Internet.','',119),(149,9,'MP09 Implantaci√≥ d\'aplicacions web.','',119),(150,10,'MP10 Administraci√≥ de sistemes gestors de bases de dades.','',119),(151,11,'MP11 Seguretat i alta disponibilitat.','',119),(152,12,'MP12 FOL','',119),(153,13,'MP13 EIE','',119),(154,14,'MP14 Projecte ','',119),(155,1,'MP01 Sistemes inform√†tics','',121),(156,2,'MP02 Bases de dades','',121),(157,3,'MP03 Programaci√≥ b√†sica','',121),(158,4,'MP04 Llenguatges de marques i sistemes de gesti√≥ d\'informaci√≥.','',121),(159,5,'MP05 Entorns de desenvolupament.','',121),(160,6,'MP06 Acc√©s a dades','',121),(161,7,'MP07. Desenvolupament d‚Äôinterf√≠cies.','',121),(162,8,'MP08 Programaci√≥ multim√®dia i dispositius m√≤bils.','',121),(163,9,'MP09 Programaci√≥ de serveis i processos.','',121),(164,10,'MP10 Sistemes de gesti√≥ empresarial.','',121),(165,11,'MP11 FOL','',121),(166,12,'MP12 EIE','',121),(167,13,'MP13 Projecte ','',121),(168,1,'MP01 Sistemes inform√†tics','',124),(169,2,'MP02 Bases de dades','',124),(170,3,'MP03 Programaci√≥','',124),(171,4,'MP04 Llenguatge de marques i sistemes de gesti√≥ d‚Äôinformaci√≥','',124),(172,5,'MP05 Entorns de desenvolupament','',124),(173,6,'MP06 Desenvolupament web en entorn client','',124),(174,7,'MP07 Desenvolupament web en entorn servidor','',124),(175,8,'MP08 Desplegament d\'aplicacions web','',124),(176,9,'M09 Disseny d\'interf√≠cies web','',124),(177,10,'MP10 Formaci√≥ i Orientaci√≥ Laboral','',124),(178,11,'MP11 Empresa i iniciativa emprenedora','',124),(179,12,'MP12 Projecte ','',124),(180,1,'MP01.  Muntatge i manteniment d‚Äôequips','',37),(181,2,'MP02. Sistemes Operatius Monolloc','',37),(182,3,'MP03. Aplicacions ofim√†tiques','',37),(183,4,'MP04. Sistemes operatius en xarxa','',37),(184,5,'MP05. Xarxes locals','',37),(185,6,'MP06.  Seguretat inform√†tica','',37),(186,7,'MP07.  Serveis de xarxa','',37),(187,8,'MP08.  Aplicacions Web','',37),(188,9,'MP09. FOL','',37),(189,10,'MP10. EiE','',37),(190,11,'MP11. Angl√®s ','',37),(191,12,'MP12. S√≠ntesi','',37);
/*!40000 ALTER TABLE `core_modulprofessional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_unitatformativa`
--

DROP TABLE IF EXISTS `core_unitatformativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_unitatformativa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `descripcio` longtext NOT NULL,
  `mp_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_unitatformativa_mp_id_5e6cff8f_fk_core_modulprofessional_id` (`mp_id`),
  CONSTRAINT `core_unitatformativa_mp_id_5e6cff8f_fk_core_modulprofessional_id` FOREIGN KEY (`mp_id`) REFERENCES `core_modulprofessional` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_unitatformativa`
--

LOCK TABLES `core_unitatformativa` WRITE;
/*!40000 ALTER TABLE `core_unitatformativa` DISABLE KEYS */;
INSERT INTO `core_unitatformativa` VALUES (1,1,'UF1:  Instal¬∑laci√≥, configuraci√≥ i explotaci√≥ del sistema inform√†tic','',141),(2,2,'UF2:  Gesti√≥ de la informaci√≥ i de recursos en una xarxa','',141),(3,3,'UF3:  Implantaci√≥ de programari espec√≠fic','',141),(4,4,'UF4:  Seguretat, rendiment i recursos','',141),(5,1,'UF1: Introducci√≥ a les bases de dades','',142),(6,2,'UF2: Llenguatges SQL: DML i DDL','',142),(7,3,'UF3: Assegurament de la informaci√≥','',142),(8,1,'UF1: Programaci√≥ estructurada.','',143),(9,2,'UF2: Disseny modular','',143),(10,3,'UF3: Fonaments de gesti√≥ de fitxers','',143),(11,1,'UF1: Programaci√≥ amb XML','',144),(12,2,'UF2: √Ämbits d‚Äôaplicaci√≥ de l‚ÄôXML','',144),(13,3,'UF3: Sistemes de gesti√≥ d‚Äôinformaci√≥ empresarial','',144),(14,1,'UF1: Arquitectura de sistemes','',145),(15,2,'UF2: Instal¬∑laci√≥, configuraci√≥ i recuperaci√≥ de programari','',145),(16,3,'UF3: Implantaci√≥ i manteniment de CPD','',145),(17,1,'UF1: Administraci√≥ avan√ßada de sistemes operatius','',146),(18,2,'UF2: Automatitzaci√≥ de tasques i llenguatges de guions','',146),(19,1,'UF1: Introducci√≥ a les xarxes.','',147),(20,2,'UF2: Administraci√≥ de dispositius de xarxa','',147),(21,3,'UF3: Administraci√≥ avan√ßada de xarxes.','',147),(22,1,'UF1: Serveis de noms i configuraci√≥ autom√†tica','',148),(23,2,'UF2: Serveis Web i de transfer√®ncia de fitxers','',148),(24,3,'UF3: Correu electr√≤nic i missatgeria','',148),(25,4,'UF4: Serveis d\'√†udio I v√≠deo','',148),(26,1,'UF1: Llenguatges de guions de servidor','',149),(27,2,'UF2: Implantaci√≥ de gestors de continguts','',149),(28,1,'UF1: Llenguatges SQL: DCL i extensi√≥ procedimental ','',150),(29,2,'UF2: Instal¬∑laci√≥ i ajustament de SGBD corporatiu','',150),(30,1,'UF1: Seguretat f√≠sica, l√≤gica i legislaci√≥','',151),(31,2,'UF2: Seguretat activa i acc√©s remot','',151),(32,3,'UF3: Tallafocs i servidors intermediaris','',151),(33,4,'UF4: Alta disponibilitat','',151),(34,1,'UF1: Incorporaci√≥ al treball','',152),(35,2,'UF2: Prevenci√≥ de riscos laborals','',152),(36,1,'UF1: Empresa i iniciativa emprenedora','',153),(37,1,'UF1: Projecte','',154),(38,1,'UF1:  Instal¬∑laci√≥, configuraci√≥ i explotaci√≥ del sistema inform√†tic','',155),(39,2,'UF2:  Gesti√≥ de la informaci√≥ i de recursos en una xarxa','',155),(40,3,'UF3:  Implantaci√≥ de programari espec√≠fic','',155),(41,1,'UF1: Introducci√≥ a les bases de dades','',156),(42,2,'UF2: Llenguatges SQL: DML i DDL','',156),(43,3,'UF3: Llenguatge SQL: DCL i extensi√≥ procedimental','',156),(44,4,'UF4: Bases de dades objecte-relacionals','',156),(45,1,'UF1: Programaci√≥ estructurada.','',157),(46,2,'UF2: Disseny modular','',157),(47,3,'UF3: Fonaments de gesti√≥ de fitxers','',157),(48,4,'UF4: Programaci√≥ orientada a objectes. Fonaments','',157),(49,5,'UF5: POO. Llibreries de classes fonamentals','',157),(50,6,'UF6: POO. Introducci√≥ a la persist√®ncia en BD','',157),(51,1,'UF1: Programaci√≥ amb XML','',158),(52,2,'UF2: √Ämbits d‚Äôaplicaci√≥ de l‚ÄôXML','',158),(53,3,'UF3: Sistemes de gesti√≥ d‚Äôinformaci√≥ empresarial','',158),(54,1,'UF1: Desenvolupament de programari','',159),(55,2,'UF2: Optimitzaci√≥ del programari','',159),(56,3,'UF3: Introducci√≥ al disseny orientat a objectes','',159),(57,1,'UF1: Persist√®ncia en fitxers','',160),(58,2,'UF2: Persist√®ncia en BDR-BDOR-BDOO','',160),(59,3,'UF3: Persist√®ncia en BD natives XML','',160),(60,4,'UF4: Components d‚Äôacc√©s a dades','',160),(61,1,'UF1: Disseny i implementaci√≥ d‚Äôinterf√≠cies.','',161),(62,2,'UF2: Preparaci√≥ i distribuci√≥ d‚Äôaplicacions.','',161),(63,1,'UF1: Desenvolupament d‚Äôaplicacions per dispositius m√≤bils','',162),(64,2,'UF2: Programaci√≥ multim√®dia','',162),(65,3,'UF3: Desenvolupament de jocs per dispositius m√≤bils','',162),(66,1,'UF1: Seguretat i criptografia ','',163),(67,2,'UF2: Processos i fils','',163),(68,3,'UF3: S√≤cols i serveis','',163),(69,1,'UF1: Sistemes ERP-CRM. Implantaci√≥.','',164),(70,2,'UF2: Sistemes ERP-CRM. Explotaci√≥ i adequaci√≥.','',164),(71,1,'UF1: Incorporaci√≥ al treball','',165),(72,2,'UF2: Prevenci√≥ de riscos laborals','',165),(73,1,'UF1: Empresa i iniciativa emprenedora','',166),(74,1,'UF1: Projecte','',167),(75,1,'UF1:  Instal¬∑laci√≥, configuraci√≥ i explotaci√≥ del sistema inform√†tic','',168),(76,2,'UF2:  Gesti√≥ de la informaci√≥ i de recursos en una xarxa','',168),(77,3,'UF3:  Implantaci√≥ de programari espec√≠fic','',168),(78,1,'UF1. Introducci√≥ a les bases de dades','',169),(79,2,'UF2. Llenguatges SQL: DML i DDL','',169),(80,3,'UF3. Llenguatges SQL: DCL i extensi√≥ procedimental','',169),(81,4,'UF4. Bases de dades objecte-relacionals','',169),(82,1,'UF1. Programaci√≥ estructurada','',170),(83,2,'UF2. Disseny modular','',170),(84,3,'UF3. Fonaments de gesti√≥ de fitxers','',170),(85,4,'UF4. Programaci√≥ orientada a objectes. Fonaments','',170),(86,5,'UF5. POO. Llibreries de classes fonamentals','',170),(87,6,'UF6. POO. Introducci√≥ a la persist√®ncia en BD','',170),(88,1,'UF1. Programaci√≥ amb XML','',171),(89,2,'UF2. √Ämbits d‚Äôaplicaci√≥ de l‚ÄôXML ','',171),(90,3,'UF3. Sistemes de gesti√≥ empresarial','',171),(91,1,'UF1. Desenvolupament de programari','',172),(92,2,'UF2. Optimitzaci√≥ de programari:','',172),(93,3,'UF3. Introducci√≥ al disseny orientat a objectes','',172),(94,1,'UF1. Sintaxi del llenguatge. Objectes predefinits del llenguatge','',173),(95,2,'UF2. Estructures definides pel programador. Objectes. ','',173),(96,3,'UF3. Esdeveniments. Manegament de formularis. Model d\'objectes del document. ','',173),(97,4,'UF4. Comunicaci√≥ as√≠ncrona client-servidor.','',173),(98,1,'UF1. Desenvolupament web en entorn servidor. ','',174),(99,2,'UF2. Generaci√≥ din√†mica de pagines web. ','',174),(100,3,'UF3. T√®cniques d‚Äôacc√©s a dades. ','',174),(101,4,'UF4. Serveis web. P√†gines din√†miques interactives. Webs H√≠brids. ','',174),(102,1,'UF1. Servidors web i de transfer√®ncia de fitxers. ','',175),(103,2,'UF2. Servidors d‚Äôaplicacions web. ','',175),(104,3,'UF3. Desplegament d‚Äôaplicacions web. ','',175),(105,4,'UF4. Control de versions i documentaci√≥. ','',175),(106,1,'UF1. Disseny de la interf√≠cie. Estils. ','',176),(107,2,'UF2. Elements multim√®dia: creaci√≥ i integraci√≥. ','',176),(108,3,'UF3. Accessibilitat i usabilitat. ','',176),(109,1,'UF1: Incorporaci√≥ al treball. ','',177),(110,2,'UF2: Prevenci√≥ de riscos laborals.','',177),(111,1,'UF1: Empresa iniciativa emprenedora. ','',178),(112,1,'UF1: Projecte desenvolupament','',179),(113,1,'UF1 Electricitat a l‚Äôordinador','',180),(114,2,'UF2 Components d‚Äôun equip microinform√†tic','',180),(115,3,'UF3 Muntatge d‚Äôun equip microinform√†tic','',180),(116,4,'UF4 Noves tend√®ncies de muntatge','',180),(117,5,'UF5 Manteniment d‚Äôequips microinform√†tics','',180),(118,6,'UF6 Instal¬∑laci√≥ de programari','',180),(119,1,'UF1 Introducci√≥ als sistemes operatius','',181),(120,2,'UF2 Sistemes operatius propietaris','',181),(121,3,'UF3 Sistemes operatius lliures.','',181),(122,1,'UF1 Aplicacions ofim√†tiques i atenci√≥ a l‚Äôusuari','',182),(123,2,'UF2 El correu i l‚Äôagenda electr√≤nica ','',182),(124,3,'UF3 Processadors de text  ','',182),(125,4,'UF4 Fulls de c√†lcul  ','',182),(126,5,'UF5 Bases de dades  ','',182),(127,6,'UF6 Imatge i v√≠deo ‚Äì Presentacions   ','',182),(128,1,'UF1 Sistemes operatius propietaris en xarxa','',183),(129,2,'UF2 Sistemes operatius lliures en xarxa','',183),(130,3,'UF3 Compartici√≥ de recursos i seguretat','',183),(131,4,'UF4 Integraci√≥ de sistemes operatius ','',183),(132,1,'UF1 Introducci√≥ a les xarxes locals','',184),(133,2,'UF2 Configuraci√≥ de commutadors  i encaminadors','',184),(134,3,'UF3 Resoluci√≥ d‚Äôincid√®ncies en xarxes locals','',184),(135,1,'UF1 Seguretat passiva','',185),(136,2,'UF2 C√≤pies de seguretat','',185),(137,3,'UF3 Legislaci√≥ de seguretat i protecci√≥ de dades','',185),(138,4,'UF4 Seguretat activa','',185),(139,5,'UF5 Tallafocs i monitoratge de xarxes','',185),(140,1,'UF1 Configuraci√≥ de la xarxa (DNS i DHCP)','',186),(141,2,'UF2 Correu electr√≤nic i transmissi√≥ d‚Äôarxius','',186),(142,3,'UF3 Servidor web i servidor intermediari o proxy','',186),(143,4,'UF4 Acc√©s a sistemes remots ','',186),(144,1,'UF1 Ofim√†tica i eines web','',187),(145,2,'UF2 Gestors d\'arxius web','',187),(146,3,'UF3 Gestors de continguts','',187),(147,4,'UF4 Portals web d‚Äôaprenentatge','',187),(148,5,'UF5 Fonaments d‚ÄôHTML i fulls d‚Äôestils','',187),(149,1,'UF1. Incorporaci√≥ al treball','',188),(150,2,'UF2. Prevenci√≥ de riscos laborals','',188),(151,1,'UF1. Empresa i iniciativa emprenedora','',189),(152,1,'UF1. Angl√®s','',190),(153,1,'UF1. S√≠ntesi','',191);
/*!40000 ALTER TABLE `core_unitatformativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `imatge` varchar(100) NOT NULL,
  `arxiu` varchar(100) NOT NULL,
  `descripcio` longtext,
  `localitzacio` point DEFAULT NULL,
  `centre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `core_user_centre_id_e1f86fd0_fk_core_centre_id` (`centre_id`),
  CONSTRAINT `core_user_centre_id_e1f86fd0_fk_core_centre_id` FOREIGN KEY (`centre_id`) REFERENCES `core_centre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$150000$u63m1RL2e69D$/Wl8K8OLNNB/tl/G7szxlhF1G5Jdv3NInnF13Rd66m4=','2019-09-05 10:26:43.231573',1,'admin','admin','ADMIN','emieza@xtec.cat',1,1,'2019-08-21 18:00:35.639408','','','',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL),(2,'pbkdf2_sha256$150000$J6PBxL6evzpJ$jQgDlYcW3VP5ayLPtk1tPMduXBl5NEfhDwZ5TPUMbns=','2019-09-05 10:00:47.590342',0,'lzabala','LEANDRO HERNAN','ZABALA IGLESIAS','lzabala@xtec.cat',1,1,'2019-08-21 18:38:17.107334','','','',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',30),(3,'pbkdf2_sha256$150000$4vaJOa9boCsA$rVYt7XHjZfBRyMmOLHKs24SQkXNDw65tOhd7Op1wV2k=','2019-09-05 10:27:35.332547',0,'emieza','Enric','Mieza','emieza@iesesteveterradas.cat',1,1,'2019-08-21 18:48:02.429894','imatgesPerfil/sonic.gif','','',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',30),(4,'pbkdf2_sha256$150000$tHUtBn1BQLLl$yqWDziP+RQHtJ5wfwrV34hMhLoAT2tsC8aHCUj4Evcg=','2019-08-22 10:01:47.410985',0,'testUser','Test User Almaixera','Manresa','almaixeracat@gmail.com',1,1,'2019-08-22 10:00:30.228608','','','',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',30),(5,'pbkdf2_sha256$150000$7hHTVwKJtUEc$2kXpTJmP9iAo/MQj3AfH7+xxruipV3R0DOBCZS47hf0=',NULL,0,'iporta','','','iporta3@xtec.cat',1,1,'2019-08-22 17:25:46.829556','','','',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',3),(6,'pbkdf2_sha256$150000$X3oOPDEYI9JT$/WIbhHggXk7+5/+IZNkd/1vN0sqzP4gJ4ark8N7t79I=','2019-09-02 12:28:26.785772',0,'jmengua2','Jordi','Mengual Portero','jmengua2@iesesteveterradas.cat',1,1,'2019-08-25 11:14:44.019501','','','',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',30),(7,'','2019-09-05 10:29:54.311363',0,'leandro.zabala_gmail.com','Leandro Hern√°n','Zabala Iglesias','leandro.zabala@gmail.com',1,1,'2019-09-05 10:28:15.097838','','',NULL,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',30);
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_groups`
--

DROP TABLE IF EXISTS `core_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_groups`
--

LOCK TABLES `core_user_groups` WRITE;
/*!40000 ALTER TABLE `core_user_groups` DISABLE KEYS */;
INSERT INTO `core_user_groups` VALUES (1,2,4),(7,3,1),(2,3,4),(3,4,3),(4,5,1),(5,6,1),(6,6,4),(8,7,3);
/*!40000 ALTER TABLE `core_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_user_permissions`
--

DROP TABLE IF EXISTS `core_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_user_permissions`
--

LOCK TABLES `core_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_core_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-08-21 18:38:17.222463','2','lzabala',1,'[{\"added\": {}}]',11,1),(2,'2019-08-21 18:38:26.975373','2','lzabala',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',11,1),(3,'2019-08-21 18:39:35.316709','2','lzabala',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"groups\", \"centre\"]}}]',11,1),(4,'2019-08-21 18:48:02.544262','3','emieza',1,'[{\"added\": {}}]',11,1),(5,'2019-08-21 18:48:30.987808','3','emieza',2,'[{\"changed\": {\"fields\": [\"email\", \"is_staff\", \"groups\", \"centre\"]}}]',11,1),(6,'2019-08-21 20:01:55.386866','30','Institut Esteve Terradas i Illa',2,'[{\"changed\": {\"fields\": [\"direccio\", \"cicles\"]}}]',13,1),(7,'2019-08-21 20:02:37.398454','1','Puzzle',1,'[{\"added\": {}}]',25,3),(8,'2019-08-21 20:03:56.860994','1','Puzzle',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"doble taulell\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"drag and drop peces taulell esq a dreta\"}}]',25,3),(9,'2019-08-21 23:14:44.118504','104','MP01 Sistemes inform√†tics',3,'',15,1),(10,'2019-08-21 23:14:44.121246','105','MP02 Bases de dades',3,'',15,1),(11,'2019-08-21 23:14:44.130187','106','MP03 Programaci√≥ b√†sica',3,'',15,1),(12,'2019-08-21 23:14:44.143432','107','MP04 Llenguatges de marques i sistemes de gesti√≥ d\'informaci√≥.',3,'',15,1),(13,'2019-08-21 23:14:44.153435','108','MP05 Entorns de desenvolupament.',3,'',15,1),(14,'2019-08-21 23:14:44.163534','109','MP06 Acc√©s a dades',3,'',15,1),(15,'2019-08-21 23:14:44.173691','110','MP07. Desenvolupament d‚Äôinterf√≠cies.',3,'',15,1),(16,'2019-08-21 23:14:44.183718','111','MP08 Programaci√≥ multim√®dia i dispositius m√≤bils.',3,'',15,1),(17,'2019-08-21 23:14:44.194067','112','MP09 Programaci√≥ de serveis i processos.',3,'',15,1),(18,'2019-08-21 23:14:44.204042','113','MP10 Sistemes de gesti√≥ empresarial.',3,'',15,1),(19,'2019-08-21 23:14:44.214212','114','MP11 FOL',3,'',15,1),(20,'2019-08-21 23:14:44.224266','115','MP12 EIE',3,'',15,1),(21,'2019-08-21 23:14:44.234244','116','MP13 Projecte ',3,'',15,1),(22,'2019-08-21 23:14:44.245205','117','MP01 Sistemes inform√†tics',3,'',15,1),(23,'2019-08-21 23:14:44.255146','118','MP02 Bases de dades',3,'',15,1),(24,'2019-08-21 23:14:44.265326','119','MP03 Programaci√≥',3,'',15,1),(25,'2019-08-21 23:14:44.275257','120','MP04 Llenguatge de marques i sistemes de gesti√≥ d‚Äôinformaci√≥',3,'',15,1),(26,'2019-08-21 23:14:44.285185','121','MP05 Entorns de desenvolupament',3,'',15,1),(27,'2019-08-21 23:14:44.295059','122','MP06 Desenvolupament web en entorn client',3,'',15,1),(28,'2019-08-21 23:14:44.305145','123','MP07 Desenvolupament web en entorn servidor',3,'',15,1),(29,'2019-08-21 23:14:44.314989','124','MP08 Desplegament d\'aplicacions web',3,'',15,1),(30,'2019-08-21 23:14:44.324819','125','MP09 Disseny d\'interf√≠cies web',3,'',15,1),(31,'2019-08-21 23:14:44.334733','126','MP10 Formaci√≥ i Orientaci√≥ Laboral',3,'',15,1),(32,'2019-08-21 23:14:44.344578','127','MP11 Empresa i iniciativa emprenedora',3,'',15,1),(33,'2019-08-21 23:14:44.354831','128','MP12 Projecte ',3,'',15,1),(34,'2019-08-21 23:14:44.364540','129','MP01.  Muntatge i manteniment d‚Äôequips',3,'',15,1),(35,'2019-08-21 23:14:44.374490','130','MP02. Sistemes Operatius Monolloc',3,'',15,1),(36,'2019-08-21 23:14:44.384332','131','MP03. Aplicacions ofim√†tiques',3,'',15,1),(37,'2019-08-21 23:14:44.394263','132','MP04. Sistemes operatius en xarxa',3,'',15,1),(38,'2019-08-21 23:14:44.404234','133','MP05. Xarxes locals',3,'',15,1),(39,'2019-08-21 23:14:44.414305','134','MP06.  Seguretat inform√†tica',3,'',15,1),(40,'2019-08-21 23:14:44.424430','135','MP07.  Serveis de xarxa',3,'',15,1),(41,'2019-08-21 23:14:44.434258','136','MP08.  Aplicacions Web',3,'',15,1),(42,'2019-08-21 23:14:44.444164','137','MP09. FOL',3,'',15,1),(43,'2019-08-21 23:14:44.454190','138','MP10. EiE',3,'',15,1),(44,'2019-08-21 23:14:44.464189','139','MP11. Angl√®s ',3,'',15,1),(45,'2019-08-21 23:14:44.474306','140','MP12. S√≠ntesi',3,'',15,1),(46,'2019-08-21 23:14:44.484076','90','MP01 Implantaci√≥ de sistemes operatius.',3,'',15,1),(47,'2019-08-21 23:14:44.494053','91','MP02 Gesti√≥ de bases de dades',3,'',15,1),(48,'2019-08-21 23:14:44.504064','92','MP03 Programaci√≥ b√†sica',3,'',15,1),(49,'2019-08-21 23:14:44.514009','93','MP04 Llenguatges de marques i sistemes de gesti√≥ d\'informaci√≥.',3,'',15,1),(50,'2019-08-21 23:14:44.523792','94','MP05 Fonaments de maquinari.',3,'',15,1),(51,'2019-08-21 23:14:44.533606','95','MP06 Administraci√≥ de sistemes operatius.',3,'',15,1),(52,'2019-08-21 23:14:44.543660','96','MP07 Planificaci√≥ i administraci√≥ de xarxes.',3,'',15,1),(53,'2019-08-21 23:14:44.553933','97','MP08 Serveis de xarxa i Internet.',3,'',15,1),(54,'2019-08-21 23:14:44.563732','98','MP09 Implantaci√≥ d\'aplicacions web.',3,'',15,1),(55,'2019-08-21 23:14:44.574077','99','MP10 Administraci√≥ de sistemes gestors de bases de dades.',3,'',15,1),(56,'2019-08-21 23:14:44.583937','100','MP11 Seguretat i alta disponibilitat.',3,'',15,1),(57,'2019-08-21 23:14:44.593830','101','MP12 FOL',3,'',15,1),(58,'2019-08-21 23:14:44.603782','102','MP13 EIE',3,'',15,1),(59,'2019-08-21 23:14:44.613706','103','MP14 Projecte ',3,'',15,1),(60,'2019-08-21 23:17:26.477889','1','Puzzle',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"posta en producci\\u00f3 en Amazon AWS\"}}, {\"changed\": {\"name\": \"spec\", \"object\": \"doble taulell\", \"fields\": [\"mp\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"drag and drop peces taulell esq a dreta\", \"fields\": [\"mp\"]}}]',25,3),(61,'2019-08-21 23:19:19.715386','1','Puzzle',2,'[{\"added\": {\"name\": \"sprint\", \"object\": \"sprint #1\"}}]',25,3),(62,'2019-08-21 23:20:25.077717','1','Puzzle',2,'[{\"changed\": {\"name\": \"sprint\", \"object\": \"sprint #1\", \"fields\": [\"specs\"]}}]',25,3),(63,'2019-08-22 09:18:10.672992','1','Puzzle',2,'[{\"changed\": {\"name\": \"spec\", \"object\": \"drag and drop peces taulell esq a dreta\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"posta en producci\\u00f3 en Amazon AWS\", \"fields\": [\"ordre\"]}}]',25,3),(64,'2019-08-22 09:20:23.353116','1','Equip 1',1,'[{\"added\": {}}]',24,3),(65,'2019-08-22 09:22:19.546234','1','Equip 1',3,'',24,3),(66,'2019-08-22 09:22:19.548605','1','Equip 1',3,'',24,3),(67,'2019-08-22 09:22:35.150651','2','Equip 11',1,'[{\"added\": {}}]',24,3),(68,'2019-08-22 09:44:48.961086','3','Equip 12',1,'[{\"added\": {}}]',24,3),(69,'2019-08-22 10:00:30.343054','4','testUser',1,'[{\"added\": {}}]',11,1),(70,'2019-08-22 10:01:09.635830','4','testUser',2,'[{\"changed\": {\"fields\": [\"first_name\", \"is_staff\", \"groups\", \"centre\"]}}]',11,1),(71,'2019-08-22 10:01:40.060420','4','testUser',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',11,1),(72,'2019-08-22 10:05:31.277033','4','Equipo A',1,'[{\"added\": {}}]',24,4),(73,'2019-08-22 17:25:46.944436','5','iporta',1,'[{\"added\": {}}]',11,1),(74,'2019-08-22 17:26:30.312581','5','iporta',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"groups\"]}}]',11,1),(75,'2019-08-22 17:28:46.523637','330','Institut Nou de Vilafranca del Pened√®s',2,'[{\"changed\": {\"fields\": [\"direccio\", \"admins\"]}}]',13,1),(76,'2019-08-25 11:14:44.155360','6','jmengua2',1,'[{\"added\": {}}]',11,1),(77,'2019-08-25 11:15:11.013824','6','jmengua2',2,'[{\"changed\": {\"fields\": [\"email\", \"is_staff\", \"groups\", \"centre\"]}}]',11,1),(78,'2019-08-25 11:15:37.368326','30','Institut Esteve Terradas i Illa',2,'[{\"changed\": {\"fields\": [\"admins\"]}}]',13,1),(79,'2019-08-25 11:18:42.115768','1','admin',2,'[{\"changed\": {\"fields\": [\"first_name\"]}}]',11,1),(80,'2019-09-03 11:16:28.814917','5','iporta',2,'[{\"changed\": {\"fields\": [\"email\", \"centre\"]}}]',11,1),(81,'2019-09-04 12:07:55.631832','2','Terminal Fallout',1,'[{\"added\": {}}]',25,1),(82,'2019-09-05 08:58:04.604534','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"diccionari de paraules (arxiu)\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"diccionari de contrasenyes\"}}]',25,3),(83,'2019-09-05 09:08:07.685101','2','Terminal Fallout',2,'[{\"changed\": {\"name\": \"spec\", \"object\": \"crear string de volcado de memoria\", \"fields\": [\"nom\"]}}]',25,3),(84,'2019-09-05 09:20:31.141078','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"sprint\", \"object\": \"sprint #1 fallout\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"formateo en pantalla (spans) del volcado de memoria\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"simular fondo de pantalla del terminal de fallout\"}}]',25,3),(85,'2019-09-05 09:22:19.467110','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"marcador de nombre d\'intents (4)\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"al fer hover sobre una paraula s\'ha de marcar amb v\\u00eddeo invers\"}}, {\"changed\": {\"name\": \"spec\", \"object\": \"simular fons de pantalla del terminal de fallout\", \"fields\": [\"nom\"]}}]',25,3),(86,'2019-09-05 09:24:12.600988','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"el servidor tria (i envia) una paraula com a contrasenya v\\u00e0lida\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"al fer click sobre paraula s\'ha de comprovar si coincideix amb la contrasenya\"}}]',25,3),(87,'2019-09-05 09:25:56.747014','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"si es clica la contrasenya, final de joc\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"si es clica una paraula que no \\u00e9s la contrasenya, cal especificar el nombre de car\\u00e0cters correctes que coincideixen en la seva posici\\u00f3 amb la contrasenya\"}}]',25,3),(88,'2019-09-05 09:26:30.536015','2','Terminal Fallout',2,'[{\"changed\": {\"name\": \"sprint\", \"object\": \"sprint #1 fallout\", \"fields\": [\"specs\"]}}]',25,3),(89,'2019-09-05 09:32:35.743777','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"prompt: al fer clic es mostra la paraula seleccionada i el resultat al prompt\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"si esgotem el nombre d\'intents, joc fallit (0 punts)\"}}, {\"changed\": {\"name\": \"spec\", \"object\": \"simular fons de pantalla del terminal de fallout\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"marcador de nombre d\'intents (4)\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"al fer hover sobre una paraula s\'ha de marcar amb v\\u00eddeo invers\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"el servidor tria (i envia) una paraula com a contrasenya v\\u00e0lida\", \"fields\": [\"ordre\"]}}]',25,3),(90,'2019-09-05 09:38:57.645151','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"marcador de temps, compta el temps que triga l\'usuari fins encertar la contrasenya\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"ranking: si la contrasenya \\u00e9s correcta, apareix prompt per demanar nom d\'usuari pel ranking\"}}]',25,3),(91,'2019-09-05 09:40:47.325839','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"acabada la partida, enviem puntuaci\\u00f3 (intents, temps, nom d\'usuari) pel ranking\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"menu prinicpal: jugar i veure ranking\"}}]',25,3),(92,'2019-09-05 09:46:25.694641','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"Github: el projecte ha d\'estar gestionat des del primer dia a Github\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"Posta en producci\\u00f3 p\\u00fablica IETI\"}}, {\"changed\": {\"name\": \"spec\", \"object\": \"diccionari (arxiu) de paraules de 5 car\\u00e0cters\", \"fields\": [\"nom\"]}}]',25,3),(93,'2019-09-05 09:48:38.969572','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"Posta en producci\\u00f3 en domini propi (freenom, AWS)\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"ajudes (eliminaci\\u00f3 de brossa)\"}}]',25,3),(94,'2019-09-05 09:50:24.241808','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"ajudas (restabliment d\'intents)\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"si la contrasenya \\u00e9s incorrecta, es substitueix per punts\"}}]',25,3),(95,'2019-09-05 09:50:59.347882','2','Terminal Fallout',2,'[{\"changed\": {\"name\": \"spec\", \"object\": \"si contrasenya \\u00e9s incorrecta, cal especificar el nombre de car\\u00e0cters correctes que coincideixen en la seva posici\\u00f3 amb la contrasenya\", \"fields\": [\"nom\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"prompt: al fer clic es mostra la paraula seleccionada i el resultat al prompt\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"si esgotem el nombre d\'intents, joc fallit (0 punts)\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"marcador de temps, compta el temps que triga l\'usuari fins encertar la contrasenya\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"ranking: si la contrasenya \\u00e9s correcta, apareix prompt per demanar nom d\'usuari pel ranking\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"acabada la partida, enviem puntuaci\\u00f3 (intents, temps, nom d\'usuari) pel ranking\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"menu prinicpal: jugar i veure ranking\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"Github: el projecte ha d\'estar gestionat des del primer dia a Github\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"Posta en producci\\u00f3 p\\u00fablica IETI\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"Posta en producci\\u00f3 en domini propi (freenom, AWS)\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"ajudes (eliminaci\\u00f3 de brossa)\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"ajudas (restabliment d\'intents)\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"si la contrasenya \\u00e9s incorrecta, es substitueix per punts\", \"fields\": [\"ordre\"]}}]',25,3),(96,'2019-09-05 09:53:47.328648','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"al comen\\u00e7ar la partida tries entre 3 nivells de dificultats (f\\u00e1cil, normal, alt)\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"nivell f\\u00e0cil: menys car\\u00e0cters a la contrasenya i/o menys paraules i/o m\\u00e9s ajuts\"}}]',25,3),(97,'2019-09-05 09:56:29.634884','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"nivell dif\\u00edcil: m\\u00e9s car\\u00e0cters a la contrasenya, m\\u00e9s contrasenyes, menys ajuts\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"visualitzaci\\u00f3 del ranking per nivells de dificultat\"}}]',25,3),(98,'2019-09-05 09:57:25.286319','2','Terminal Fallout',2,'[{\"added\": {\"name\": \"spec\", \"object\": \"visualitzaci\\u00f3 del ranking ordenat per intents\"}}, {\"added\": {\"name\": \"spec\", \"object\": \"visualitzaci\\u00f3 del ranking ordenat per temps\"}}]',25,3),(99,'2019-09-05 10:01:29.125221','2','Terminal Fallout',2,'[{\"changed\": {\"name\": \"spec\", \"object\": \"diccionari (arxiu) de paraules de 5 car\\u00e0cters\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"crear string de volcado de memoria\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"formateo en pantalla (spans) del volcado de memoria\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"el servidor tria (i envia) una paraula com a contrasenya v\\u00e0lida\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"simular fons de pantalla del terminal de fallout\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"marcador de nombre d\'intents (4)\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"al fer hover sobre una paraula s\'ha de marcar amb v\\u00eddeo invers\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"al fer click sobre paraula s\'ha de comprovar si coincideix amb la contrasenya\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"si es clica la contrasenya, final de joc\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"si contrasenya \\u00e9s incorrecta, cal especificar el nombre de car\\u00e0cters correctes que coincideixen en la seva posici\\u00f3 amb la contrasenya\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"si la contrasenya \\u00e9s incorrecta, es substitueix per punts\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"prompt: al fer clic es mostra la paraula seleccionada i el resultat al prompt\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"si esgotem el nombre d\'intents, joc fallit (0 punts)\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"marcador de temps, compta el temps que triga l\'usuari fins encertar la contrasenya\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"ranking: si la contrasenya \\u00e9s correcta, apareix prompt per demanar nom d\'usuari pel ranking\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"acabada la partida, enviem puntuaci\\u00f3 (intents, temps, nom d\'usuari) pel ranking\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"menu prinicpal: jugar i veure ranking\", \"fields\": [\"ordre\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"Github: el projecte ha d\'estar gestionat des del primer dia a Github\", \"fields\": [\"ordre\"]}}]',25,2),(100,'2019-09-05 10:02:21.362813','2','Terminal Fallout',2,'[{\"changed\": {\"name\": \"spec\", \"object\": \"crear string de volcat de memoria (6 paraules + simbols)\", \"fields\": [\"nom\"]}}, {\"changed\": {\"name\": \"spec\", \"object\": \"format en pantalla (spans) del volcado de memoria\", \"fields\": [\"nom\"]}}]',25,2),(101,'2019-09-05 10:05:03.308415','2','Terminal Fallout',2,'[{\"changed\": {\"name\": \"sprint\", \"object\": \"sprint #1 fallout\", \"fields\": [\"specs\"]}}]',25,2),(102,'2019-09-05 10:19:07.144986','3','Equipo A (sprint #1) : None',2,'[{\"changed\": {\"name\": \"done spec\", \"object\": \"Equipo A (doble taulell) : True\", \"fields\": [\"done\"]}}]',26,1),(103,'2019-09-05 10:23:09.096124','3','emieza',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',11,1),(104,'2019-09-05 10:27:25.748933','30','Institut Esteve Terradas i Illa',2,'[{\"changed\": {\"fields\": [\"admins\"]}}]',13,1),(105,'2019-09-05 10:30:47.206736','5','lele',1,'[{\"added\": {}}]',24,7),(106,'2019-09-05 10:33:05.090600','2','Terminal Fallout',2,'[{\"changed\": {\"name\": \"sprint\", \"object\": \"sprint #1 fallout\", \"fields\": [\"specs\"]}}]',25,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(8,'auth','group'),(7,'auth','permission'),(17,'borsApp','demanda'),(18,'borsApp','empresa'),(19,'borsApp','notificacio'),(20,'borsApp','oferta'),(21,'borsApp','subscripcio'),(22,'borsApp','titol'),(9,'contenttypes','contenttype'),(12,'core','categoria'),(13,'core','centre'),(14,'core','cicle'),(15,'core','modulprofessional'),(16,'core','unitatformativa'),(11,'core','user'),(23,'scrum','donespec'),(24,'scrum','equip'),(25,'scrum','projecte'),(26,'scrum','qualificacio'),(27,'scrum','spec'),(28,'scrum','sprint'),(10,'sessions','session'),(1,'social_django','association'),(2,'social_django','code'),(3,'social_django','nonce'),(5,'social_django','partial'),(4,'social_django','usersocialauth');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-08-21 17:52:14.754730'),(2,'contenttypes','0002_remove_content_type_name','2019-08-21 17:52:15.020899'),(3,'auth','0001_initial','2019-08-21 17:52:15.263157'),(4,'auth','0002_alter_permission_name_max_length','2019-08-21 17:52:15.970146'),(5,'auth','0003_alter_user_email_max_length','2019-08-21 17:52:15.984972'),(6,'auth','0004_alter_user_username_opts','2019-08-21 17:52:15.994418'),(7,'auth','0005_alter_user_last_login_null','2019-08-21 17:52:16.004568'),(8,'auth','0006_require_contenttypes_0002','2019-08-21 17:52:16.010103'),(9,'auth','0007_alter_validators_add_error_messages','2019-08-21 17:52:16.024664'),(10,'auth','0008_alter_user_username_max_length','2019-08-21 17:52:16.034354'),(11,'auth','0009_alter_user_last_name_max_length','2019-08-21 17:52:16.044334'),(12,'core','0001_initial','2019-08-21 17:52:17.003898'),(13,'admin','0001_initial','2019-08-21 17:52:19.914089'),(14,'admin','0002_logentry_remove_auto_add','2019-08-21 17:52:20.316039'),(15,'admin','0003_logentry_add_action_flag_choices','2019-08-21 17:52:20.328888'),(16,'auth','0010_alter_group_name_max_length','2019-08-21 17:52:20.352326'),(17,'auth','0011_update_proxy_permissions','2019-08-21 17:52:20.378211'),(18,'borsApp','0001_initial','2019-08-21 17:52:21.120298'),(19,'borsApp','0002_auto_20190821_1504','2019-08-21 17:52:22.981046'),(20,'scrum','0001_initial','2019-08-21 17:52:28.599897'),(21,'sessions','0001_initial','2019-08-21 17:52:32.385631'),(22,'default','0001_initial','2019-08-21 17:52:32.986807'),(23,'social_auth','0001_initial','2019-08-21 17:52:32.996411'),(24,'default','0002_add_related_name','2019-08-21 17:52:33.611189'),(25,'social_auth','0002_add_related_name','2019-08-21 17:52:33.620899'),(26,'default','0003_alter_email_max_length','2019-08-21 17:52:33.651937'),(27,'social_auth','0003_alter_email_max_length','2019-08-21 17:52:33.661828'),(28,'default','0004_auto_20160423_0400','2019-08-21 17:52:33.744466'),(29,'social_auth','0004_auto_20160423_0400','2019-08-21 17:52:33.747978'),(30,'social_auth','0005_auto_20160727_2333','2019-08-21 17:52:33.832682'),(31,'social_django','0006_partial','2019-08-21 17:52:33.916976'),(32,'social_django','0007_code_timestamp','2019-08-21 17:52:34.140027'),(33,'social_django','0008_partial_timestamp','2019-08-21 17:52:34.354869'),(34,'social_django','0005_auto_20160727_2333','2019-08-21 17:52:34.428280'),(35,'social_django','0001_initial','2019-08-21 17:52:34.436566'),(36,'social_django','0002_add_related_name','2019-08-21 17:52:34.446750'),(37,'social_django','0004_auto_20160423_0400','2019-08-21 17:52:34.456740'),(38,'social_django','0003_alter_email_max_length','2019-08-21 17:52:34.466949');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('14ric4xko0j7psyy6kv1dovsor6ilupg','YjQ3Y2M2OWVjYTc3MzYwNzdkMjdhYjlkNWVkOGViNjQ3NjQ0ZDZhMDp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJrc082dVRLMENEaWtTU0tCQmJaM0JKcTVnSzB3UEpxWiIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjM2YzI1MTllMWFiNjI2MmU2MWMwNjIxYzI1MzNlODc5NTdhYzk5YTAiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2019-09-05 09:57:37.373347'),('2tu4k3gh654jfowwt4jxkmq6okoc3z0y','YzdiZmQxNzZlYTU4ZGY1NDk1N2UzZDU5ZmExMGEwZGU4ZjcxOWM4Yjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJ5dlVIZkl0MTNqTkxGM1lVamt5dmdnMlltb0VZZUdZWiJ9','2019-08-26 16:59:08.339858'),('33j4enuvza80b7772zsuyenm9dkep1u5','Y2FkMDc4NTEzZGE0YTQzMDQ1MGVlODNkODZhYzQzMmIxNzRmYTdjMzp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJyek5qQmtENUNRMHZkWFpOdmczWU5rV1V0SHgydGhMNiJ9','2019-08-29 16:48:28.540859'),('5td0d1kyp8t75cwb79y8hbihk5rwgfkh','YjdhMTgyMDdkZGQ5MWJkNzhmYThiNjkyOTY0OTZkY2U1NzEzYjYwMjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJvZGZnRE8xSkJBTHVmcmVHbDdzNjZSQ0VNemtwVVR5MyJ9','2019-08-28 11:30:45.627331'),('9m53s9at3k14dqw6ywcqn8os0g5nu8br','MDY0NzVmM2M1YjkxMTlmN2Y4NzgyMDRhMWM3YzkyNDMwZDNmNGU3Njp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJFSzZzYTQ2dmI1cXdMeVV6SU00RWZSUk5mQ3NHcnRwTiIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6ImMxNzNhZjYyMDFiODZjOTgyMjdhOGNiMDg4NzA2ODI1MjE4ZDM1YmQiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2019-09-03 11:58:15.083661'),('anll33ml7j9u53dtemhp7oziq8vmd1nz','ZTRiNzk4OGE3YjcwOTdkYWNiN2I4NjFhN2FkMzE1NDg4ODNhMjM2NTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJIdExQR1Z4QnFlRDdLYXdab0RhM0lkczUyN2VVbkFNdyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjY3MzljMjZkYjRjNDExYTdiZmY4YjUyNWVkNjkyMzhkMDhkNWVlODUiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2019-08-25 12:33:21.840236'),('bvyp8uan62ipow5gpdmytq2kxhce6oeb','NWRhY2JhMTdmYzc1Yjg4NzYzYTJkNDI3NmVmM2RlNTcxMzI3YmRkYjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJsc1J0Q3hLc2V4Q3I5MUJjVUg5d1ZnMEVmTmtwb2g2ciJ9','2019-09-04 18:08:12.350745'),('bz845heo5xt53sb7gcfl0etx0uwuvyw9','YTVlNTU5YTNkZDhjMTYwMDkwZGFjMThkY2U3ZDNiMTg4ZDI3M2NiNTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJyOUhFaGxTWmVXUVBubG45aHNwd0FDUHdJR01vYVJ1ciIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjM2YzI1MTllMWFiNjI2MmU2MWMwNjIxYzI1MzNlODc5NTdhYzk5YTAiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2019-09-05 11:27:35.342823'),('lmorh4y9dug90puc5pfavsxsorzlztdx','NDhjZjY0MDlhNjcwYWM4ZDI4YThmNWEyNjA3Y2NmMGRhODBhODY2NTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJwNDNES2RocFpTTkh1NEdadzdzT1dGN1pzVzJRYUR6NiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjY3MzljMjZkYjRjNDExYTdiZmY4YjUyNWVkNjkyMzhkMDhkNWVlODUiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2019-09-05 09:51:57.333702'),('nc5xpts6bon5zxhnqsetv8vbs87p7bol','OWZlY2VhNzQzYjRkMzhlYmY4YmE4MGZhZTQxMDdiY2EzMGM1MTI2OTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJpb3dYNXRBM1ZDZFlEbkE3b0dPWnJSQ0ExeGV2Q1hBYSIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6ImMxNzNhZjYyMDFiODZjOTgyMjdhOGNiMDg4NzA2ODI1MjE4ZDM1YmQiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2019-09-05 10:00:33.845402'),('qroa052i9ifmz7s810q3r9qn79kps9s2','MjZmYTcxMmNiYjg3OGVhY2M5OTBjODBjOWMyODcyZDQwYWY2OWM3Nzp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJqV2lTdnp5SkRQZHROU3JBaEtTYUtMTFdrcTlXY1Y3UyIsIl9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjEzYmZhM2IxZDk1ZDVhNzZhN2ExMGQzY2IzZTljZmMwNmY1MmVkZjQiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2019-09-02 13:28:26.804242'),('r38378s2jch2qf9ik7ptfzj9g5udq0wk','NWU3YjM0YWExYmZiMTE2ZDEyNmRhZGIyM2YwMzk1NWU2NDJlNDEyZTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJWRGppMXR4dUVISFlRUVdDb1VpaDdIaDNLekZKTklHRiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjY3MzljMjZkYjRjNDExYTdiZmY4YjUyNWVkNjkyMzhkMDhkNWVlODUiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2019-08-25 18:07:08.701990'),('rf5tgkt159akcqomh0wszc1gcleba000','ODcwZmNjZGE4MThhZGJkZTE3NDhjOTM0ODI1YmQ2NDhjZDcyN2RjNTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJxeUxoVkt4VmhLSE80dUFhTE05RUJ6V2RFZGZNT09STSJ9','2019-08-26 11:59:04.225664'),('rfkoeyl4rkmh1px7l3yyqnv1l8wf4jzo','OGFkNDczMDk1NjQ5YTFmYmNhNDQwNDkzNzAwYWU0NmE0ODhiMmE0YTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiI2WnRROFJqQ0ZKdW9ZSjFGYmE3eVByMVhPNjY1dzB4UyIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjM2YzI1MTllMWFiNjI2MmU2MWMwNjIxYzI1MzNlODc5NTdhYzk5YTAiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2019-09-04 13:08:22.837301'),('yfqyo7gu73kxf3usvahyfgshz6pi2u0c','ZWJkOTI3NjAxZjA2N2Q1YTFjY2JjN2U0YjdhNWE4MzExYWUxODk3YTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJRaG4yN0FRd0VFU0NOazJHc3dxU2dzeVoxMFhXWWxUayIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjY3MzljMjZkYjRjNDExYTdiZmY4YjUyNWVkNjkyMzhkMDhkNWVlODUiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2019-09-03 12:11:22.847061'),('ym6k5wxhg6z745ete5y8lxq8p8312awx','Y2FhYTIzYzY1OWI5Njg4ZWY5ZTI0NWU4NWIxNzI5MGM0Njk3NGZhZjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJHM0pzdWg1bTZzY3NlTzFLUnN5Q2x1RmJGb3FYV3k3YyJ9','2019-08-29 16:47:55.757581'),('zd1ik5vmu1z6mtgyiz6ju80qlb9zif7n','MjFiYTE3M2Y2ZTJkMjFhYzY3ZGY5NGY3MjE3Y2QwZGM2MjU1MzViODp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJ0czg0bDBLdlZiRGdObXQ3TFpHWTJLa2k1UmQ2cmV1eSIsIl9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjEzYmZhM2IxZDk1ZDVhNzZhN2ExMGQzY2IzZTljZmMwNmY1MmVkZjQiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2019-08-29 07:46:47.159166');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrum_donespec`
--

DROP TABLE IF EXISTS `scrum_donespec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_donespec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `done` tinyint(1) NOT NULL,
  `qualificacio_id` int(11) NOT NULL,
  `spec_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scrum_donespec_qualificacio_id_5fe4e6cd_fk_scrum_qualificacio_id` (`qualificacio_id`),
  KEY `scrum_donespec_spec_id_11762dca_fk_scrum_spec_id` (`spec_id`),
  CONSTRAINT `scrum_donespec_qualificacio_id_5fe4e6cd_fk_scrum_qualificacio_id` FOREIGN KEY (`qualificacio_id`) REFERENCES `scrum_qualificacio` (`id`),
  CONSTRAINT `scrum_donespec_spec_id_11762dca_fk_scrum_spec_id` FOREIGN KEY (`spec_id`) REFERENCES `scrum_spec` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrum_donespec`
--

LOCK TABLES `scrum_donespec` WRITE;
/*!40000 ALTER TABLE `scrum_donespec` DISABLE KEYS */;
INSERT INTO `scrum_donespec` VALUES (1,0,1,1),(2,0,1,2),(3,0,2,1),(4,0,2,2),(5,1,3,1),(6,0,3,2),(7,0,4,20),(8,0,4,4),(9,0,4,5),(10,0,4,6);
/*!40000 ALTER TABLE `scrum_donespec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrum_equip`
--

DROP TABLE IF EXISTS `scrum_equip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_equip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `descripcio` longtext NOT NULL,
  `projecte_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scrum_equip_projecte_id_10815176_fk_scrum_projecte_id` (`projecte_id`),
  CONSTRAINT `scrum_equip_projecte_id_10815176_fk_scrum_projecte_id` FOREIGN KEY (`projecte_id`) REFERENCES `scrum_projecte` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrum_equip`
--

LOCK TABLES `scrum_equip` WRITE;
/*!40000 ALTER TABLE `scrum_equip` DISABLE KEYS */;
INSERT INTO `scrum_equip` VALUES (2,'Equip 11','<p>aaaa</p>',1),(3,'Equip 12','<p>aaa</p>',1),(4,'Equipo A','<p>aaa</p>',1),(5,'lele','',2);
/*!40000 ALTER TABLE `scrum_equip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrum_equip_membres`
--

DROP TABLE IF EXISTS `scrum_equip_membres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_equip_membres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equip_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scrum_equip_membres_equip_id_user_id_2005aabd_uniq` (`equip_id`,`user_id`),
  KEY `scrum_equip_membres_user_id_5092e0b3_fk_core_user_id` (`user_id`),
  CONSTRAINT `scrum_equip_membres_equip_id_12e72785_fk_scrum_equip_id` FOREIGN KEY (`equip_id`) REFERENCES `scrum_equip` (`id`),
  CONSTRAINT `scrum_equip_membres_user_id_5092e0b3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrum_equip_membres`
--

LOCK TABLES `scrum_equip_membres` WRITE;
/*!40000 ALTER TABLE `scrum_equip_membres` DISABLE KEYS */;
INSERT INTO `scrum_equip_membres` VALUES (2,2,3),(3,3,2),(4,4,4),(5,5,4),(6,5,7);
/*!40000 ALTER TABLE `scrum_equip_membres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrum_projecte`
--

DROP TABLE IF EXISTS `scrum_projecte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_projecte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `descripcio` longtext NOT NULL,
  `inici` date NOT NULL,
  `final` date NOT NULL,
  `centre_id` int(11) NOT NULL,
  `cicle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scrum_projecte_centre_id_f8eb63a0_fk_core_centre_id` (`centre_id`),
  KEY `scrum_projecte_cicle_id_4ab548cf_fk_core_cicle_id` (`cicle_id`),
  CONSTRAINT `scrum_projecte_centre_id_f8eb63a0_fk_core_centre_id` FOREIGN KEY (`centre_id`) REFERENCES `core_centre` (`id`),
  CONSTRAINT `scrum_projecte_cicle_id_4ab548cf_fk_core_cicle_id` FOREIGN KEY (`cicle_id`) REFERENCES `core_cicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrum_projecte`
--

LOCK TABLES `scrum_projecte` WRITE;
/*!40000 ALTER TABLE `scrum_projecte` DISABLE KEYS */;
INSERT INTO `scrum_projecte` VALUES (1,'Puzzle','<p>Puzzle per AWS2</p>','2019-08-21','2019-09-30',30,124),(2,'Terminal Fallout','<p>Minijoc de hackig de terminal en el joc Fallout 4</p>\r\n<p>Mireu aquest <a href=\"https://www.youtube.com/watch?v=zeik4hTEolc\">v&iacute;deo explicatiu</a>.</p>\r\n<p>&nbsp;</p>','2019-10-14','2019-11-11',30,124);
/*!40000 ALTER TABLE `scrum_projecte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrum_projecte_admins`
--

DROP TABLE IF EXISTS `scrum_projecte_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_projecte_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projecte_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scrum_projecte_admins_projecte_id_user_id_d18d3dda_uniq` (`projecte_id`,`user_id`),
  KEY `scrum_projecte_admins_user_id_8584b61f_fk_core_user_id` (`user_id`),
  CONSTRAINT `scrum_projecte_admins_projecte_id_39f86f88_fk_scrum_projecte_id` FOREIGN KEY (`projecte_id`) REFERENCES `scrum_projecte` (`id`),
  CONSTRAINT `scrum_projecte_admins_user_id_8584b61f_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrum_projecte_admins`
--

LOCK TABLES `scrum_projecte_admins` WRITE;
/*!40000 ALTER TABLE `scrum_projecte_admins` DISABLE KEYS */;
INSERT INTO `scrum_projecte_admins` VALUES (1,1,2),(2,1,3),(3,2,2),(4,2,3);
/*!40000 ALTER TABLE `scrum_projecte_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrum_qualificacio`
--

DROP TABLE IF EXISTS `scrum_qualificacio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_qualificacio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota` double DEFAULT NULL,
  `comentaris` longtext NOT NULL,
  `equip_id` int(11) NOT NULL,
  `sprint_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scrum_qualificacio_equip_id_841b6ad6_fk_scrum_equip_id` (`equip_id`),
  KEY `scrum_qualificacio_sprint_id_92f4008f_fk_scrum_sprint_id` (`sprint_id`),
  CONSTRAINT `scrum_qualificacio_equip_id_841b6ad6_fk_scrum_equip_id` FOREIGN KEY (`equip_id`) REFERENCES `scrum_equip` (`id`),
  CONSTRAINT `scrum_qualificacio_sprint_id_92f4008f_fk_scrum_sprint_id` FOREIGN KEY (`sprint_id`) REFERENCES `scrum_sprint` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrum_qualificacio`
--

LOCK TABLES `scrum_qualificacio` WRITE;
/*!40000 ALTER TABLE `scrum_qualificacio` DISABLE KEYS */;
INSERT INTO `scrum_qualificacio` VALUES (1,NULL,'',2,1),(2,NULL,'',3,1),(3,NULL,'',4,1),(4,NULL,'',5,2);
/*!40000 ALTER TABLE `scrum_qualificacio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrum_spec`
--

DROP TABLE IF EXISTS `scrum_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `descripcio` longtext NOT NULL,
  `ordre` int(11) NOT NULL,
  `pare_id` int(11) DEFAULT NULL,
  `projecte_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scrum_spec_pare_id_916e56b7_fk_scrum_spec_id` (`pare_id`),
  KEY `scrum_spec_projecte_id_8190fe7c_fk_scrum_projecte_id` (`projecte_id`),
  CONSTRAINT `scrum_spec_pare_id_916e56b7_fk_scrum_spec_id` FOREIGN KEY (`pare_id`) REFERENCES `scrum_spec` (`id`),
  CONSTRAINT `scrum_spec_projecte_id_8190fe7c_fk_scrum_projecte_id` FOREIGN KEY (`projecte_id`) REFERENCES `scrum_projecte` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrum_spec`
--

LOCK TABLES `scrum_spec` WRITE;
/*!40000 ALTER TABLE `scrum_spec` DISABLE KEYS */;
INSERT INTO `scrum_spec` VALUES (1,'doble taulell','',1,NULL,1),(2,'drag and drop peces taulell esq a dreta','',3,NULL,1),(3,'posta en producci√≥ en Amazon AWS','',2,NULL,1),(4,'diccionari (arxiu) de paraules de 5 car√†cters','',2,NULL,2),(5,'crear string de volcat de memoria (6 paraules + simbols)','',3,NULL,2),(6,'format en pantalla (spans) del volcado de memoria','',4,NULL,2),(7,'simular fons de pantalla del terminal de fallout','',6,NULL,2),(8,'marcador de nombre d\'intents (4)','',7,NULL,2),(9,'al fer hover sobre una paraula s\'ha de marcar amb v√≠deo invers','',8,NULL,2),(10,'el servidor tria (i envia) una paraula com a contrasenya v√†lida','',5,NULL,2),(11,'al fer click sobre paraula s\'ha de comprovar si coincideix amb la contrasenya','',9,NULL,2),(12,'si es clica la contrasenya, final de joc','',10,NULL,2),(13,'si contrasenya √©s incorrecta, cal especificar el nombre de car√†cters correctes que coincideixen en la seva posici√≥ amb la contrasenya','',11,NULL,2),(14,'prompt: al fer clic es mostra la paraula seleccionada i el resultat al prompt','',13,NULL,2),(15,'si esgotem el nombre d\'intents, joc fallit (0 punts)','',14,NULL,2),(16,'marcador de temps, compta el temps que triga l\'usuari fins encertar la contrasenya','',15,NULL,2),(17,'ranking: si la contrasenya √©s correcta, apareix prompt per demanar nom d\'usuari pel ranking','',16,NULL,2),(18,'acabada la partida, enviem puntuaci√≥ (intents, temps, nom d\'usuari) pel ranking','',17,NULL,2),(19,'menu prinicpal: jugar i veure ranking','',18,NULL,2),(20,'Github: el projecte ha d\'estar gestionat des del primer dia a Github','',1,NULL,2),(21,'Posta en producci√≥ p√∫blica IETI','',19,NULL,2),(22,'Posta en producci√≥ en domini propi (freenom, AWS)','',20,NULL,2),(23,'ajudes (eliminaci√≥ de brossa)','',21,NULL,2),(24,'ajudas (restabliment d\'intents)','',22,NULL,2),(25,'si la contrasenya √©s incorrecta, es substitueix per punts','',12,NULL,2),(26,'al comen√ßar la partida tries entre 3 nivells de dificultats (f√°cil, normal, alt)','',23,NULL,2),(27,'nivell f√†cil: menys car√†cters a la contrasenya i/o menys paraules i/o m√©s ajuts','',24,NULL,2),(28,'nivell dif√≠cil: m√©s car√†cters a la contrasenya, m√©s contrasenyes, menys ajuts','',25,NULL,2),(29,'visualitzaci√≥ del ranking per nivells de dificultat','',26,NULL,2),(30,'visualitzaci√≥ del ranking ordenat per intents','',27,NULL,2),(31,'visualitzaci√≥ del ranking ordenat per temps','',28,NULL,2);
/*!40000 ALTER TABLE `scrum_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrum_spec_mp`
--

DROP TABLE IF EXISTS `scrum_spec_mp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_spec_mp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_id` int(11) NOT NULL,
  `modulprofessional_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scrum_spec_mp_spec_id_modulprofessional_id_ff4b2e2f_uniq` (`spec_id`,`modulprofessional_id`),
  KEY `scrum_spec_mp_modulprofessional_id_f1c77f33_fk_core_modu` (`modulprofessional_id`),
  CONSTRAINT `scrum_spec_mp_modulprofessional_id_f1c77f33_fk_core_modu` FOREIGN KEY (`modulprofessional_id`) REFERENCES `core_modulprofessional` (`id`),
  CONSTRAINT `scrum_spec_mp_spec_id_bedacb01_fk_scrum_spec_id` FOREIGN KEY (`spec_id`) REFERENCES `scrum_spec` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrum_spec_mp`
--

LOCK TABLES `scrum_spec_mp` WRITE;
/*!40000 ALTER TABLE `scrum_spec_mp` DISABLE KEYS */;
INSERT INTO `scrum_spec_mp` VALUES (2,1,173),(3,1,174),(1,1,176),(5,2,173),(4,2,176),(6,3,174),(7,3,175),(8,4,174),(9,5,174),(11,6,173),(12,6,174),(10,6,176),(13,7,176),(14,8,173),(15,8,174),(17,9,173),(16,9,176),(18,10,174),(19,11,173),(20,12,173),(21,13,173),(22,14,173),(23,15,173),(24,16,173),(26,17,173),(25,17,176),(27,18,174),(29,19,174),(28,19,176),(30,20,175),(31,21,175),(32,22,175),(33,23,173),(34,23,174),(35,24,173),(36,25,173),(38,26,173),(39,26,174),(37,26,176),(40,27,173),(41,27,174),(42,28,173),(43,28,174),(44,29,174),(45,30,174),(46,31,174);
/*!40000 ALTER TABLE `scrum_spec_mp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrum_sprint`
--

DROP TABLE IF EXISTS `scrum_sprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_sprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `inici` date NOT NULL,
  `final` date NOT NULL,
  `projecte_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scrum_sprint_projecte_id_7f253eaa_fk_scrum_projecte_id` (`projecte_id`),
  CONSTRAINT `scrum_sprint_projecte_id_7f253eaa_fk_scrum_projecte_id` FOREIGN KEY (`projecte_id`) REFERENCES `scrum_projecte` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrum_sprint`
--

LOCK TABLES `scrum_sprint` WRITE;
/*!40000 ALTER TABLE `scrum_sprint` DISABLE KEYS */;
INSERT INTO `scrum_sprint` VALUES (1,'sprint #1','','2019-08-26','2019-09-02',1),(2,'sprint #1 fallout','','2019-10-14','2019-10-21',2);
/*!40000 ALTER TABLE `scrum_sprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrum_sprint_specs`
--

DROP TABLE IF EXISTS `scrum_sprint_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_sprint_specs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sprint_id` int(11) NOT NULL,
  `spec_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scrum_sprint_specs_sprint_id_spec_id_90e3683e_uniq` (`sprint_id`,`spec_id`),
  KEY `scrum_sprint_specs_spec_id_a99b9521_fk_scrum_spec_id` (`spec_id`),
  CONSTRAINT `scrum_sprint_specs_spec_id_a99b9521_fk_scrum_spec_id` FOREIGN KEY (`spec_id`) REFERENCES `scrum_spec` (`id`),
  CONSTRAINT `scrum_sprint_specs_sprint_id_9f3fdd73_fk_scrum_sprint_id` FOREIGN KEY (`sprint_id`) REFERENCES `scrum_sprint` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrum_sprint_specs`
--

LOCK TABLES `scrum_sprint_specs` WRITE;
/*!40000 ALTER TABLE `scrum_sprint_specs` DISABLE KEYS */;
INSERT INTO `scrum_sprint_specs` VALUES (1,1,1),(2,1,2),(7,2,4),(5,2,5),(8,2,6),(6,2,20);
/*!40000 ALTER TABLE `scrum_sprint_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_core_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,'google-oauth2','emieza@xtec.cat','{\"auth_time\": 1567679203, \"expires\": 3599, \"token_type\": \"Bearer\", \"access_token\": \"ya29.Glx6BwjkyROxrF-LFTd5yRv_T889NMTX5WFaEWfQ_SnIFg0FW94sU2Oq3ZL-0_IK7_4V_OwXnD_K8glZvgyjebjhPuVGF2K3zRhBzVlsMstmqczjZGXa_-8f8hV7hw\"}',1),(2,'google-oauth2','emieza@iesesteveterradas.cat','{\"auth_time\": 1567679255, \"expires\": 3600, \"token_type\": \"Bearer\", \"access_token\": \"ya29.Glx6BydlL5Exh6XMONaedEOsSuaHJKedRyxof9fl8qnd02DqhBKn0u__NF_0kwz65o22R-188eZhS5UwA_CmL8dV0p2JjxlTRv5-AdKaC_-q5XIDggnOSXCA0jFa_w\"}',3),(3,'google-oauth2','almaixeracat@gmail.com','{\"auth_time\": 1566468107, \"expires\": 3600, \"token_type\": \"Bearer\", \"access_token\": \"ya29.GlxsB9obY1lgzdnXQDBsi4IWm8epOfhG6IYpcDRNr4-TFn-GAH06Z_zclTfM_BbJyabq_oTXbpaz_zZLrUDjLoSGJuExOeFOgDzJv27KwFxw19jneykBsJ1o7AdhAw\"}',4),(4,'google-oauth2','jmengua2@iesesteveterradas.cat','{\"auth_time\": 1567427306, \"expires\": 3600, \"token_type\": \"Bearer\", \"access_token\": \"ya29.Glx3B61XFSv_cm0qvxzA85WHGTjIYyjVHZKy54-bdvzyH6YHAxHeI9tj-myxhWqWOIRUgyXXrAcTw-fPDzwkLqTlHxBqC7a7H7ETpUqsGY4VBEhH7mWuES0mTNB_-w\"}',6),(5,'google-oauth2','lzabala@xtec.cat','{\"auth_time\": 1567677647, \"expires\": 3600, \"token_type\": \"Bearer\", \"access_token\": \"ya29.Glx6B04eFsFQFx6EystRUaYGo2b43sJaNAVkZTOgk1eqNnWirvsNlzMREd8jooYTkEBgBYawV9Gs9_oZG8b8EAt7Ts5ZfHacYq5aW3UTMHSdnthic8W8Op4OEBkgyw\"}',2),(6,'google-oauth2','leandro.zabala@gmail.com','{\"auth_time\": 1567679394, \"expires\": 3600, \"token_type\": \"Bearer\", \"access_token\": \"ya29.Glt6BwMtKVTk3px32izgOHw8oFz5GV7gcJAif6b1cN__LCK5OH36UI2tO1d09mOEYlFDbn14UA6hlLWwtKF823A9b71qXKgL7KEpponPqJYwg6GDVVmfwdNnbtoL\"}',7);
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-05 14:51:21
