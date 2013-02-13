-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: sphere
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.10.2

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
-- Table structure for table `admin_tools_dashboard_preferences`
--

DROP TABLE IF EXISTS `admin_tools_dashboard_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_tools_dashboard_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `data` longtext NOT NULL,
  `dashboard_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_tools_dashboard_preferences_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_7b78c8a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_tools_dashboard_preferences`
--

LOCK TABLES `admin_tools_dashboard_preferences` WRITE;
/*!40000 ALTER TABLE `admin_tools_dashboard_preferences` DISABLE KEYS */;
INSERT INTO `admin_tools_dashboard_preferences` VALUES (1,1,'{}','dashboard'),(2,1,'{}','products-dashboard'),(3,2,'{}','dashboard'),(4,2,'{}','products-dashboard');
/*!40000 ALTER TABLE `admin_tools_dashboard_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_tools_menu_bookmark`
--

DROP TABLE IF EXISTS `admin_tools_menu_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_tools_menu_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_tools_menu_bookmark_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_63b2844f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_tools_menu_bookmark`
--

LOCK TABLES `admin_tools_menu_bookmark` WRITE;
/*!40000 ALTER TABLE `admin_tools_menu_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_tools_menu_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add bookmark',1,'add_bookmark'),(2,'Can change bookmark',1,'change_bookmark'),(3,'Can delete bookmark',1,'delete_bookmark'),(4,'Can add dashboard preferences',2,'add_dashboardpreferences'),(5,'Can change dashboard preferences',2,'change_dashboardpreferences'),(6,'Can delete dashboard preferences',2,'delete_dashboardpreferences'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add content type',6,'add_contenttype'),(17,'Can change content type',6,'change_contenttype'),(18,'Can delete content type',6,'delete_contenttype'),(19,'Can add session',7,'add_session'),(20,'Can change session',7,'change_session'),(21,'Can delete session',7,'delete_session'),(22,'Can add site',8,'add_site'),(23,'Can change site',8,'change_site'),(24,'Can delete site',8,'delete_site'),(25,'Can add log entry',9,'add_logentry'),(26,'Can change log entry',9,'change_logentry'),(27,'Can delete log entry',9,'delete_logentry'),(28,'Can add menu_item',10,'add_sitemenu'),(29,'Can change menu_item',10,'change_sitemenu'),(30,'Can delete menu_item',10,'delete_sitemenu'),(31,'Can add site_setting',11,'add_settings'),(32,'Can change site_setting',11,'change_settings'),(33,'Can delete site_setting',11,'delete_settings'),(34,'Can add page_item',12,'add_page'),(35,'Can change page_item',12,'change_page'),(36,'Can delete page_item',12,'delete_page'),(37,'Can add файл',13,'add_pagedoc'),(38,'Can change файл',13,'change_pagedoc'),(39,'Can delete файл',13,'delete_pagedoc'),(40,'Can add картинка',14,'add_pagepic'),(41,'Can change картинка',14,'change_pagepic'),(42,'Can delete картинка',14,'delete_pagepic'),(43,'Can add meta',15,'add_metadata'),(44,'Can change meta',15,'change_metadata'),(45,'Can delete meta',15,'delete_metadata'),(46,'Can add тип конструкции',16,'add_product'),(47,'Can change тип конструкции',16,'change_product'),(48,'Can delete тип конструкции',16,'delete_product'),(49,'Can add применение',17,'add_imagetype'),(50,'Can change применение',17,'change_imagetype'),(51,'Can delete применение',17,'delete_imagetype'),(52,'Can add фото конструкций',18,'add_productimage'),(53,'Can change фото конструкций',18,'change_productimage'),(54,'Can delete фото конструкций',18,'delete_productimage'),(55,'Can add свойство',19,'add_property'),(56,'Can change свойство',19,'change_property'),(57,'Can delete свойство',19,'delete_property'),(58,'Can add описание технологии',20,'add_tech'),(59,'Can change описание технологии',20,'change_tech'),(60,'Can delete описание технологии',20,'delete_tech'),(61,'Can add пояснение',21,'add_techproperty'),(62,'Can change пояснение',21,'change_techproperty'),(63,'Can delete пояснение',21,'delete_techproperty'),(64,'Can add заявка',22,'add_request'),(65,'Can change заявка',22,'change_request'),(66,'Can delete заявка',22,'delete_request'),(67,'Can add kv store',23,'add_kvstore'),(68,'Can change kv store',23,'change_kvstore'),(69,'Can delete kv store',23,'delete_kvstore'),(70,'Can add message',24,'add_message'),(71,'Can change message',24,'change_message'),(72,'Can delete message',24,'delete_message'),(73,'Can add migration history',25,'add_migrationhistory'),(74,'Can change migration history',25,'change_migrationhistory'),(75,'Can delete migration history',25,'delete_migrationhistory');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','admin@sphere.ru','pbkdf2_sha256$10000$u4aOuGnIYiOZ$5zhhIiFz0Ct4Z3HqGGuGpWNqtfPonc0K4GOQkDo8hiA=',1,1,1,'2013-02-04 20:30:34','2013-02-04 20:26:22'),(2,'grigl','','','grigl@mail.ru','pbkdf2_sha256$10000$J3IOaqp920Rx$Kjh/FYskY/7st6XcJVKh1KBBj5nH26H2C4LStPMNIsY=',1,1,1,'2013-02-06 01:10:07','2013-02-04 09:56:42');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-02-04 21:33:46',1,16,'1','Ангар',1,''),(2,'2013-02-04 21:34:43',1,19,'1','Дешево',1,''),(3,'2013-02-04 21:34:55',1,19,'2','Просто',1,''),(4,'2013-02-04 21:35:18',1,19,'3','Быстро',1,''),(5,'2013-02-04 21:35:38',1,19,'4','Герметично',1,''),(6,'2013-02-04 21:36:04',1,19,'3','Быстро',2,'Изменен order.'),(7,'2013-02-04 21:36:04',1,19,'4','Герметично',2,'Изменен order.'),(8,'2013-02-04 21:36:04',1,19,'1','Дешево',2,'Изменен order.'),(9,'2013-02-04 21:36:05',1,19,'2','Просто',2,'Изменен order.'),(10,'2013-02-04 21:36:30',1,17,'1','На сельхозработах',1,''),(11,'2013-02-04 21:36:41',1,17,'2','В медицине',1,''),(12,'2013-02-04 21:36:53',1,17,'3','На войне',1,''),(13,'2013-02-04 21:38:01',1,16,'1','Ангар',2,'Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\".'),(14,'2013-02-04 21:39:17',1,16,'2','Мансарда',1,''),(15,'2013-02-04 23:41:59',1,20,'1','Общее описание',1,''),(16,'2013-02-04 23:46:48',1,20,'2','Сборка',1,''),(17,'2013-02-04 23:47:37',1,20,'3','Технические характеристики',1,''),(18,'2013-02-05 00:14:40',1,20,'4','Утепление',1,''),(19,'2013-02-05 01:17:46',1,11,'1','price',1,''),(20,'2013-02-05 01:18:19',1,11,'2','price_warm',1,''),(21,'2013-02-05 01:20:43',1,11,'3','phone',1,''),(22,'2013-02-05 01:21:18',1,12,'1','О компании (/about/)',1,''),(23,'2013-02-05 01:39:29',1,12,'2','Спасибо (/thanks/)',1,''),(24,'2013-02-04 10:22:39',2,16,'1','Ангар',2,'Изменен image.'),(25,'2013-02-04 10:23:01',2,16,'2','Мансарда',2,'Изменен image.'),(26,'2013-02-04 10:24:40',2,19,'3','Быстро',2,'Изменен description.'),(27,'2013-02-04 10:25:06',2,19,'1','Дешево',2,'Изменен description.'),(28,'2013-02-04 10:25:49',2,19,'2','Гарантия',2,'Изменен name и description.'),(29,'2013-02-04 10:26:31',2,19,'4','Малый вес',2,'Изменен name и description.'),(30,'2013-02-04 10:39:17',2,19,'5','ГЕРМЕТИЧНО',1,''),(31,'2013-02-04 10:39:31',2,19,'3','Быстро',2,'Изменен image.'),(32,'2013-02-04 10:39:39',2,19,'1','Дешево',2,'Изменен image.'),(33,'2013-02-04 10:39:48',2,19,'2','Гарантия',2,'Изменен image.'),(34,'2013-02-04 10:39:56',2,19,'4','Малый вес',2,'Изменен image.'),(35,'2013-02-04 10:40:08',2,19,'5','герметично',2,'Изменен name.'),(36,'2013-02-04 10:40:30',2,19,'5','герметично',2,'Ни одно поле не изменено.'),(37,'2013-02-04 10:40:38',2,19,'5','Герметично',2,'Изменен name.'),(38,'2013-02-04 10:41:39',2,19,'6','Надежно',1,''),(39,'2013-02-04 10:42:24',2,19,'7','Практично',1,''),(40,'2013-02-04 10:42:42',2,19,'3','Быстро',2,'Изменен order.'),(41,'2013-02-04 10:42:42',2,19,'1','Дешево',2,'Изменен order.'),(42,'2013-02-04 10:42:42',2,19,'2','Гарантия',2,'Изменен order.'),(43,'2013-02-04 10:42:42',2,19,'4','Малый вес',2,'Изменен order.'),(44,'2013-02-04 10:42:42',2,19,'5','Герметично',2,'Изменен order.'),(45,'2013-02-04 10:42:42',2,19,'6','Надежно',2,'Изменен order.'),(46,'2013-02-04 10:42:42',2,19,'7','Практично',2,'Изменен order.'),(47,'2013-02-04 10:53:14',2,16,'3','Пристройка',1,''),(48,'2013-02-04 10:54:26',2,16,'4','Кровля',1,''),(49,'2013-02-04 10:55:08',2,16,'2','Мансарда',2,'Изменен order.'),(50,'2013-02-04 10:55:09',2,16,'3','Пристройка',2,'Изменен order.'),(51,'2013-02-04 10:55:09',2,16,'4','Кровля',2,'Изменен order.'),(52,'2013-02-04 11:10:17',2,20,'5','Фундамент',1,''),(53,'2013-02-04 11:10:50',2,20,'6','Ворота и окна',1,''),(54,'2013-02-04 11:11:16',2,20,'1','Общее описание',2,'Изменен alias.'),(55,'2013-02-04 11:11:22',2,20,'2','Сборка',2,'Ни одно поле не изменено.'),(56,'2013-02-04 11:11:45',2,20,'3','Технические характеристики',2,'Изменен alias.'),(57,'2013-02-04 11:12:15',2,20,'3','Технические характеристики',2,'Изменен alias.'),(58,'2013-02-04 11:35:17',2,20,'1','Общее описание',2,'Ни одно поле не изменено.'),(59,'2013-02-04 11:35:45',2,20,'2','Сборка',2,'Изменен alias.'),(60,'2013-02-04 11:36:34',2,20,'3','Технические характеристики',2,'Изменен alias.'),(61,'2013-02-04 11:36:53',2,20,'4','Утепление',2,'Изменен alias.'),(62,'2013-02-04 11:37:42',2,20,'6','Ворота и окна',2,'Ни одно поле не изменено.'),(63,'2013-02-04 11:41:12',2,19,'4','Малый вес',2,'Изменен on_product_page.'),(64,'2013-02-04 11:41:12',2,19,'5','Герметично',2,'Изменен on_product_page.'),(65,'2013-02-04 11:41:12',2,19,'6','Надежно',2,'Изменен on_product_page.'),(66,'2013-02-04 12:20:01',2,20,'6','Ворота и окна',2,'Изменен order.'),(67,'2013-02-04 12:20:01',2,20,'2','Сборка',2,'Изменен order.'),(68,'2013-02-04 12:20:01',2,20,'3','Технические характеристики',2,'Изменен order.'),(69,'2013-02-04 12:20:01',2,20,'4','Утепление',2,'Изменен order.'),(70,'2013-02-04 12:20:01',2,20,'5','Фундамент',2,'Изменен order.'),(71,'2013-02-04 12:33:33',2,16,'2','Мансарда',2,'Изменен alias.'),(72,'2013-02-05 22:41:51',2,16,'1','Ангар',2,'Изменен description_for_main.'),(73,'2013-02-06 01:11:41',2,17,'2','Производственные и складские помещения',2,'Изменен name,icon_for_main и icon.'),(74,'2013-02-06 01:12:04',2,17,'1','Ремонтные мастерские и СТО',2,'Изменен name,icon_for_main и icon.'),(75,'2013-02-06 01:12:27',2,17,'3','Гараж, автостоянка, автомойка',2,'Изменен name,icon_for_main и icon.'),(76,'2013-02-06 01:13:08',2,17,'4','Спортивный комплекс',1,''),(77,'2013-02-06 01:13:53',2,17,'5','Сельское хозяйство',1,''),(78,'2013-02-06 01:14:27',2,16,'1','Ангар',2,'Изменен draft.'),(79,'2013-02-06 01:18:43',2,16,'1','Ангар',2,'Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Изменены image для фото конструкций \"ProductImage object\". Изменены image для фото конструкций \"ProductImage object\". Изменены type и image для фото конструкций \"ProductImage object\".'),(80,'2013-02-06 01:19:30',2,16,'2','Мансарда',2,'Изменен draft.'),(81,'2013-02-06 01:22:29',2,16,'2','Мансарда',2,'Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Добавлен фото конструкций \"ProductImage object\". Изменены image для фото конструкций \"ProductImage object\". Изменены type и image для фото конструкций \"ProductImage object\".'),(82,'2013-02-06 01:22:52',2,16,'4','Кровля',2,'Изменен draft. Добавлен фото конструкций \"ProductImage object\".'),(83,'2013-02-06 01:23:13',2,16,'3','Пристройка',2,'Изменен draft. Добавлен фото конструкций \"ProductImage object\".'),(84,'2013-02-06 01:43:54',2,17,'2','Производственные и складские помещения',2,'Изменен icon_for_main.'),(85,'2013-02-06 01:54:19',2,16,'1','Ангар',2,'Изменены order для фото конструкций \"ProductImage object\". Изменены order для фото конструкций \"ProductImage object\". Изменены order для фото конструкций \"ProductImage object\". Изменены order для фото конструкций \"ProductImage object\". Изменены order для фото конструкций \"ProductImage object\". Изменены order для фото конструкций \"ProductImage object\". Изменены order для фото конструкций \"ProductImage object\". Изменены order для фото конструкций \"ProductImage object\". Изменены order для фото конструкций \"ProductImage object\". Изменены order для фото конструкций \"ProductImage object\". Изменены order для фото конструкций \"ProductImage object\".'),(86,'2013-02-06 01:55:11',2,16,'1','Ангар',2,'Добавлен фото конструкций \"ProductImage object\".'),(87,'2013-02-06 01:55:52',2,16,'1','Ангар',2,'Добавлен фото конструкций \"ProductImage object\".'),(88,'2013-02-06 19:44:02',2,16,'1','Ангар',2,'Изменен description.'),(89,'2013-02-06 20:23:34',2,20,'1','Общее описание',2,'Изменен description и description_2.'),(90,'2013-02-06 20:40:17',2,20,'3','Технические характеристики',2,'Изменен description.'),(91,'2013-02-06 21:19:11',2,20,'4','Утепление',2,'Изменены description для пояснение \"TechProperty object\".'),(92,'2013-02-06 21:21:55',2,20,'4','Утепление',2,'Изменены image1,image2 и image3 для пояснение \"TechProperty object\".'),(93,'2013-02-06 21:22:58',2,20,'4','Утепление',2,'Изменен description.'),(94,'2013-02-06 21:33:03',2,20,'5','Фундамент',2,'Добавлен пояснение \"TechProperty object\".'),(95,'2013-02-06 21:33:34',2,20,'5','Фундамент',2,'Добавлен пояснение \"TechProperty object\".'),(96,'2013-02-06 21:34:03',2,20,'5','Фундамент',2,'Добавлен пояснение \"TechProperty object\".'),(97,'2013-02-06 21:36:14',2,20,'4','Утепление',2,'Добавлен пояснение \"TechProperty object\". Добавлен пояснение \"TechProperty object\".'),(98,'2013-02-06 22:54:27',2,20,'4','Утепление',2,'Ни одно поле не изменено.'),(99,'2013-02-06 22:54:30',2,20,'4','Утепление',2,'Ни одно поле не изменено.'),(100,'2013-02-06 22:59:46',2,20,'6','Ворота и окна',2,'Изменен description и image. Добавлен пояснение \"TechProperty object\". Добавлен пояснение \"TechProperty object\". Добавлен пояснение \"TechProperty object\". Добавлен пояснение \"TechProperty object\".'),(101,'2013-02-06 23:09:21',2,20,'1','Общее описание',2,'Изменен alias.'),(102,'2013-02-06 23:09:24',2,20,'2','Сборка',2,'Ни одно поле не изменено.'),(103,'2013-02-06 23:09:31',2,20,'3','Технические характеристики',2,'Изменен alias.'),(104,'2013-02-06 23:09:39',2,20,'3','Технические характеристики',2,'Ни одно поле не изменено.'),(105,'2013-02-06 23:09:45',2,20,'4','Утепление',2,'Ни одно поле не изменено.'),(106,'2013-02-06 23:09:51',2,20,'5','Фундамент',2,'Ни одно поле не изменено.'),(107,'2013-02-06 23:09:55',2,20,'6','Ворота и окна',2,'Ни одно поле не изменено.'),(108,'2013-02-06 23:11:16',2,20,'1','Общее описание',2,'Изменен alias.'),(109,'2013-02-06 23:11:21',2,20,'2','Сборка',2,'Ни одно поле не изменено.'),(110,'2013-02-06 23:11:27',2,20,'3','Технические характеристики',2,'Изменен alias.'),(111,'2013-02-06 23:28:28',2,20,'6','Ворота и окна',2,'Изменен description.');
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'bookmark','menu','bookmark'),(2,'dashboard preferences','dashboard','dashboardpreferences'),(3,'permission','auth','permission'),(4,'group','auth','group'),(5,'user','auth','user'),(6,'content type','contenttypes','contenttype'),(7,'session','sessions','session'),(8,'site','sites','site'),(9,'log entry','admin','logentry'),(10,'menu_item','siteblocks','sitemenu'),(11,'site_setting','siteblocks','settings'),(12,'page_item','pages','page'),(13,'файл','pages','pagedoc'),(14,'картинка','pages','pagepic'),(15,'meta','pages','metadata'),(16,'тип конструкции','products','product'),(17,'применение','products','imagetype'),(18,'фото конструкций','products','productimage'),(19,'свойство','products','property'),(20,'описание технологии','products','tech'),(21,'пояснение','products','techproperty'),(22,'заявка','products','request'),(23,'kv store','thumbnail','kvstore'),(24,'message','auth','message'),(25,'migration history','south','migrationhistory');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3f743d68383ba00ee865008b1eecb39b','NzcwNjIxNWI0YTgzZDlmMTFkODBlZmYwNThlMTg3NDlmNTFhOWEzNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n','2013-02-19 22:41:43'),('4cc3ddbdf79335285fa875108b7558a2','N2MzYzdlM2MzOTdlNDY0ODc4NTM0ODk0MDI1M2NlM2EyYzQ4ODFmMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-02-18 20:30:34'),('9cdcffaa60d62d151100db791cf960ac','NzcwNjIxNWI0YTgzZDlmMTFkODBlZmYwNThlMTg3NDlmNTFhOWEzNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n','2013-02-20 01:10:07'),('bfb46092706ca35c358fe482d41200a5','NzcwNjIxNWI0YTgzZDlmMTFkODBlZmYwNThlMTg3NDlmNTFhOWEzNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n','2013-02-18 09:57:00');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_metadata`
--

DROP TABLE IF EXISTS `pages_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `keywords` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_metadata`
--

LOCK TABLES `pages_metadata` WRITE;
/*!40000 ALTER TABLE `pages_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_page`
--

DROP TABLE IF EXISTS `pages_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_add` datetime NOT NULL,
  `title` varchar(120) NOT NULL,
  `url` varchar(200) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `content` longtext NOT NULL,
  `order` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `is_at_menu` tinyint(1) NOT NULL,
  `is_at_footer_menu` tinyint(1) NOT NULL,
  `template` varchar(100) NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `pages_page_63f17a16` (`parent_id`),
  KEY `pages_page_42b06ff6` (`lft`),
  KEY `pages_page_6eabc1a6` (`rght`),
  KEY `pages_page_102f80d8` (`tree_id`),
  KEY `pages_page_2a8f42e8` (`level`),
  CONSTRAINT `parent_id_refs_id_353c0eed` FOREIGN KEY (`parent_id`) REFERENCES `pages_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_page`
--

LOCK TABLES `pages_page` WRITE;
/*!40000 ALTER TABLE `pages_page` DISABLE KEYS */;
INSERT INTO `pages_page` VALUES (1,'2013-02-05 01:21:18','О компании','/about/',NULL,'<p>jhvjhvhjjhhjjh</p>',10,1,0,0,'default.html',1,2,1,0),(2,'2013-02-05 01:39:29','Спасибо','/thanks/',NULL,'<p>Спасибо!</p><p>Мы рассмотрим вашу заявку в самое ближайшее время!</p>',10,1,0,0,'default.html',1,2,2,0);
/*!40000 ALTER TABLE `pages_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_pagedoc`
--

DROP TABLE IF EXISTS `pages_pagedoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_pagedoc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `size` int(11) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `file` varchar(100) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_pagedoc_32d04bc7` (`page_id`),
  CONSTRAINT `page_id_refs_id_20be1fae` FOREIGN KEY (`page_id`) REFERENCES `pages_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_pagedoc`
--

LOCK TABLES `pages_pagedoc` WRITE;
/*!40000 ALTER TABLE `pages_pagedoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_pagedoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_pagepic`
--

DROP TABLE IF EXISTS `pages_pagepic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_pagepic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `size` int(11) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `file` varchar(100) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_pagepic_32d04bc7` (`page_id`),
  CONSTRAINT `page_id_refs_id_42aca3ec` FOREIGN KEY (`page_id`) REFERENCES `pages_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_pagepic`
--

LOCK TABLES `pages_pagepic` WRITE;
/*!40000 ALTER TABLE `pages_pagepic` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_pagepic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_imagetype`
--

DROP TABLE IF EXISTS `products_imagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_imagetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `icon_for_main` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_imagetype`
--

LOCK TABLES `products_imagetype` WRITE;
/*!40000 ALTER TABLE `products_imagetype` DISABLE KEYS */;
INSERT INTO `products_imagetype` VALUES (1,'Ремонтные мастерские и СТО','images/product/usecase-category-image-2.png','images/product/object-usecase-category-image-2.png',10,1),(2,'Производственные и складские помещения','images/product/usecase-category-image-1_1.png','images/product/object-usecase-category-image-1.png',10,1),(3,'Гараж, автостоянка, автомойка','images/product/usecase-category-image-3.png','images/product/object-usecase-category-image-3.png',10,1),(4,'Спортивный комплекс','images/product/usecase-category-image-4.png','images/product/object-usecase-category-image-4.png',10,1),(5,'Сельское хозяйство','images/product/usecase-category-image-5.png','images/product/object-usecase-category-image-5.png',10,1);
/*!40000 ALTER TABLE `products_imagetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description_for_main` longtext NOT NULL,
  `description` longtext NOT NULL,
  `alias` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `draft` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (1,'Ангар','Универсальный тип здания, которое используется как склад, гараж, терминал. Можно использовать в составе спортивного, выставочного или торгового комплекса или как укрытие для крупногабаритной техники.','<p class=\"focused-p\">Строение арочного типа уже не одно столетие остается наиболее оптимальной строительной конструкцией, позволяющей быстро и дешево возводить здания самого широкого назначения с минимальными эксплуатиционными затратами.</p>\r\n                <p>Универсальный тип здания, которое используется как склад, гараж, терминал и т.д. Ширина до 18 метров и высота до 9 метров позволяют использовать его также в составе спортивного, выставочного или торгового комплекса или как укрытие для крупногабаритной техники.</p>\r\n                <p>По окончанию строительства не требуются отделочные работы, а также ремонтные работы раз в три года. За счёт всего этого стоимость ангара значительно ниже по сравнению с дугими технологиями строительства зданий.</p>','angar','images/product/slider-hangar.png','images/product/object-advantages-image.png',10,1),(2,'Мансарда','Описание мансарды на главной странице','<p>Описание мансарды, какая она клевая<br></p>','mansard','images/product/slider-mansard.png','images/product/object-advantages-image_1.png',9,1),(3,'Пристройка','123','<p>123</p>','outbuilding','images/product/slider-outbuilding.png','images/product/object-advantages-image_3.png',7,1),(4,'Кровля','123','<p>123</p>','roof','images/product/slider-roof.png','images/product/object-advantages-image_2.png',8,1);
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productimage`
--

DROP TABLE IF EXISTS `products_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productimage_44bdf3ee` (`product_id`),
  KEY `products_productimage_777d41c8` (`type_id`),
  CONSTRAINT `product_id_refs_id_65913619` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `type_id_refs_id_27d5b799` FOREIGN KEY (`type_id`) REFERENCES `products_imagetype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productimage`
--

LOCK TABLES `products_productimage` WRITE;
/*!40000 ALTER TABLE `products_productimage` DISABLE KEYS */;
INSERT INTO `products_productimage` VALUES (1,1,2,'images/product_image/usecases-image-1.png',10,1),(2,1,2,'images/product_image/usecases-image-2.png',10,1),(3,1,2,'images/product_image/usecases-image-3.png',10,1),(4,2,2,'images/product_image/usecases-image-7_2.png',10,1),(5,2,2,'images/product_image/usecases-image-4_2.png',10,1),(6,1,3,'images/product_image/usecases-image-7.png',6,1),(7,1,3,'images/product_image/usecases-image-11.png',6,1),(8,1,1,'images/product_image/usecases-image-6.png',7,1),(9,1,1,'images/product_image/usecases-image-9.png',7,1),(10,1,1,'images/product_image/usecases-image-1_1.png',7,1),(11,1,1,'images/product_image/usecases-image-4.png',7,1),(12,1,5,'images/product_image/usecases-image-8.png',8,1),(13,1,5,'images/product_image/usecases-image-7_1.png',8,1),(14,1,4,'images/product_image/usecases-image-3_1.png',9,1),(15,1,4,'images/product_image/usecases-image-1_2.png',9,1),(16,1,4,'images/product_image/usecases-image-4_1.png',9,1),(17,2,5,'images/product_image/usecases-image-1_3.png',10,1),(18,2,5,'images/product_image/usecases-image-11_1.png',10,1),(19,2,5,'images/product_image/usecases-image-10.png',10,1),(20,4,1,'images/product_image/usecases-image-5.png',10,1),(21,3,3,'images/product_image/usecases-image-4_3.png',10,1),(22,1,4,'images/product_image/usecases-image-8_1.png',9,1),(23,1,5,'images/product_image/usecases-image-9_1.png',8,1);
/*!40000 ALTER TABLE `products_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_property`
--

DROP TABLE IF EXISTS `products_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `on_product_page` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_property`
--

LOCK TABLES `products_property` WRITE;
/*!40000 ALTER TABLE `products_property` DISABLE KEYS */;
INSERT INTO `products_property` VALUES (1,'Дешево','images/property/advantage-cheap.png','В 1,5-2 раза дешевле\r\nтрадиционного варианта\r\nстроительства',1,7,1),(2,'Гарантия','images/property/advantage-warranty.png','Срок службы здания\r\n30-50 лет',1,5,1),(3,'Быстро','images/property/advantage-fast.png','1 000 м2 за 3-4 недели',1,6,1),(4,'Малый вес','images/property/advantage-lightweight.png','Позволяет обойтись\r\nбез мощного\r\nфундамента',1,4,1),(5,'Герметично','images/property/advantage-hermetically.png','Снижают расходы\r\nна обогрев помещения',1,3,1),(6,'Надежно','images/property/advantage-safe.png','Выдерживает высокие\r\nветровые и снеговые\r\nнагрузки',1,2,1),(7,'Практично','images/property/advantage-practical.png','Возводится на любых\r\nгрунтах и устойчив к\r\nсейсмическим нагрузкам',0,1,1);
/*!40000 ALTER TABLE `products_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_request`
--

DROP TABLE IF EXISTS `products_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(75) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_request_44bdf3ee` (`product_id`),
  CONSTRAINT `product_id_refs_id_5f314af1` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_request`
--

LOCK TABLES `products_request` WRITE;
/*!40000 ALTER TABLE `products_request` DISABLE KEYS */;
INSERT INTO `products_request` VALUES (1,1,'jhjkhjkhjkh','fgh','66','serzhilin@gmail.com','2013-02-05 01:37:06'),(2,2,'hjgjhg','jhgjhg','jhgjh','serzhilin@gmail.com','2013-02-05 01:38:23');
/*!40000 ALTER TABLE `products_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_tech`
--

DROP TABLE IF EXISTS `products_tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_tech` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `alias` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `description_2` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_tech`
--

LOCK TABLES `products_tech` WRITE;
/*!40000 ALTER TABLE `products_tech` DISABLE KEYS */;
INSERT INTO `products_tech` VALUES (1,'Общее описание','<p><p>Универсальный тип здания, которое используется как склад, гараж, терминал и т.д. Ширина до 18 метров и высота до 9 метров позволяют также в составе спортивного, выставочного или торгового комплекса или как укрытие для крупногабаритной техники.</p><p>По окончанию строительства не требуются отделочные работы, а также ремонтные работы раз в три года. За счёт всего этого стоимость ангара по сравнению с дугими технологиями строительства зданий.</p><p>Современная технология предоставляет возможность в короткие сроки изготовить и смонтировать крытое арочное сооружение большой площади. ара производится на месте установки сооружения. Продолжительность возведения сооружения площадью 1 000 м2 — две-три недели.</p></p>\r\n','tech-description','',10,1,'<p>Малый вес конструкции позволяет обойтись без мощного дорогостоящего фундамента, что существенно ускоряет работу. Фальцевые соединения секций тичным, за счёт этого снижаютя расходы на обогрев помещения. Быстровозводимый ангар сейсмоустойчив, выдерживает высокие вые нагрузки.<br></p>'),(2,'Сборка','<p>оролрол</p>','assembly','',9,1,''),(3,'Технические характеристики','<li><span class=\"title\">Ширина&nbsp;</span><span class=\"value\">от 6 до 24 метров</span></li>\r\n&nbsp; &nbsp; <li><span class=\"title\">Высота&nbsp;</span><span class=\"value\">от 3 до 12 метров</span></li>\r\n&nbsp; &nbsp; <li><span class=\"title\">Длина&nbsp;</span><span class=\"value\">от 10 до 150 метров</span></li>\r\n&nbsp; &nbsp; <li><span class=\"title\">Степень огнестойкости&nbsp;</span><span class=\"value\">II, V</span></li>\r\n&nbsp; &nbsp; <li><span class=\"title\">Снеговая нагрузка&nbsp;</span><span class=\"value\">до 180 кг/м</span></li>\r\n&nbsp; &nbsp; <li><span class=\"title\">Скоростной напор ветра&nbsp;</span><span class=\"value\">до 200 км/час</span></li>\r\n&nbsp; &nbsp; <li><span class=\"title\">Сейсмичность&nbsp;</span><span class=\"value\">9 баллов</span></li>','tech-stats','',8,1,''),(4,'Утепление','<p>Потери тепла через наружные стены составляют до 50 % от общих теплопотерь. Рациональным и эффективным способом сокращения потерь тепла, а значит, снижения затрат на отопление, является утепление наружных стен теплоизоляционными изделиями, которые имеют сопротивление теплопроводности в 10 раз выше, чем материалы, традиционно используемые в строительстве (кирпич, бетон). При этом несущие конструкции здания будут защищены от промерзания, что позволит увеличить срок их службы. За счет отсутствия температурных колебаний и снижения уровня шума в помещении создается комфортный микроклимат.</p>','insulation','',7,1,''),(5,'Фундамент','<p>123</p>','basement','',6,1,''),(6,'Ворота и окна','Возможна врезка окон и оконных конструкций любого типа','windows-and-gates','images/property/windows-and-gates-main.png',5,1,'');
/*!40000 ALTER TABLE `products_tech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_techproperty`
--

DROP TABLE IF EXISTS `products_techproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_techproperty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tech_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image2` varchar(100) DEFAULT NULL,
  `image3` varchar(100) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_techproperty_18935a00` (`tech_id`),
  CONSTRAINT `tech_id_refs_id_1e43cb54` FOREIGN KEY (`tech_id`) REFERENCES `products_tech` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_techproperty`
--

LOCK TABLES `products_techproperty` WRITE;
/*!40000 ALTER TABLE `products_techproperty` DISABLE KEYS */;
INSERT INTO `products_techproperty` VALUES (1,4,'Напыляемый утеплитель','images/tech_property/insulation-1-main.png','Утеплитель является термоизоляционным и звукопоглощающим покрытием, не требует крепежа, наносится путем напыления на поверхность. о напылять в толщине от 15 мм до 200 мм в зависимости от требуемых параметров тепло-технических характеристик здания.','images/tech_property/insulation-1-1.png','images/tech_property/insulation-1-2.png',10,1),(2,5,'Ленточный фундамент','images/tech_property/basement-1-main.png','Сегодня их используют при возведении домов любого типа, в том числе с тяжелыми стенами, цокольными этажами и подвалами. Ленточные адывают сплошной линией под всеми наружными и внутренними капитальными стенами. Для устройства ленточного фундамента отлован. Внутри него размечается линия фундамента. По этой линии устанавливают опалубку. После того как опалубка нее помещают укрепляющую металлическую арматуру, а затем заливают бетоном.','images/tech_property/basement-1-1.png','images/tech_property/basement-1-2.png',10,1),(3,5,'Столбчатый фундамент','images/tech_property/basement-2-main.png','Дают значительную экономию материала. Устройство фундаментов начинается с разбивки плана сооружения. Затем бурят или выкапывают скважины 450 мм, глубиной 500 - 750 мм., через каждый 1 - 1,5 м. по периметру. Заливается бетон и устанавливаются закладные.','images/tech_property/basement-2-1.png','images/tech_property/basement-2-2.png',10,1),(4,5,'Монолитная плита','images/tech_property/basement-3-main.png','Дают значительную экономию материала. Устройство фундаментов начинается с разбивки плана сооружения. Затем бурят или выкапывают скважины 450 мм, глубиной 500 - 750 мм., через каждый 1 - 1,5 м. по периметру. Заливается бетон и устанавливаются закладные.','images/tech_property/basement-2-1_1.png','images/tech_property/basement-2-2_1.png',10,1),(5,4,'Подвесной утеплитель','images/tech_property/insulation-2-main.png','При монтаже в арочную конструкцию закладываются с шагом 1220 мм закладные элементы. к которым при помощи шурупов крепится металлический уголок, повторяющий форму арки с меньшим радиусом (радиус определяется толщиной утеплительного материала), к уголку крепится профильный лист с антикоррозийным покрытием. В проем между аркой и профильным листом закладывается утеплительный материал.','images/tech_property/insulation-2-1.png','images/tech_property/basement-2-2_2.png',10,1),(6,4,'Двойная арочная конструкция','images/tech_property/insulation-3-main.png','В паз панели шириной 305 мм наносится утеплитель, после чего панели монтируются на фундамент.Поверх монтируется вторая арка с большим радиусом, основания обеих арок после монтажа бетонируется. Испоьзуется утеплитель на основе пенополиуритана, минеральной ваты (URSA, ISOVER и др.).','images/tech_property/insulation-2-1_1.png','images/tech_property/insulation-2-2.png',10,1),(7,6,'Распашные ворота','images/tech_property/windows-and-gates-1-left.png','с калиткой снаружи ворот','images/tech_property/windows-and-gates-1.png','',10,1),(8,6,'Распашные ворота','images/tech_property/windows-and-gates-2-left.png','с калиткой внутри ворот','images/tech_property/windows-and-gates-2.png','',10,1),(9,6,'Подъемные ворота','images/tech_property/windows-and-gates-3-left.png','с боковой стороны ангара','images/tech_property/windows-and-gates-3.png','',10,1),(10,6,'Распашные ворота','images/tech_property/windows-and-gates-4-left.png','с боковой стороны ангара','images/tech_property/windows-and-gates-4.png','',10,1);
/*!40000 ALTER TABLE `products_techproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteblocks_settings`
--

DROP TABLE IF EXISTS `siteblocks_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siteblocks_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `name` varchar(250) NOT NULL,
  `value` longtext NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteblocks_settings`
--

LOCK TABLES `siteblocks_settings` WRITE;
/*!40000 ALTER TABLE `siteblocks_settings` DISABLE KEYS */;
INSERT INTO `siteblocks_settings` VALUES (1,'Цена за кв.м','price','3500','input'),(2,'Цена с утеплением за кв.м','price_warm','7800','input'),(3,'Телефон из хедера','phone','71-77-71','input');
/*!40000 ALTER TABLE `siteblocks_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteblocks_sitemenu`
--

DROP TABLE IF EXISTS `siteblocks_sitemenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siteblocks_sitemenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `url` varchar(150) NOT NULL,
  `order` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteblocks_sitemenu_63f17a16` (`parent_id`),
  KEY `siteblocks_sitemenu_42b06ff6` (`lft`),
  KEY `siteblocks_sitemenu_6eabc1a6` (`rght`),
  KEY `siteblocks_sitemenu_102f80d8` (`tree_id`),
  KEY `siteblocks_sitemenu_2a8f42e8` (`level`),
  CONSTRAINT `parent_id_refs_id_247648db` FOREIGN KEY (`parent_id`) REFERENCES `siteblocks_sitemenu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteblocks_sitemenu`
--

LOCK TABLES `siteblocks_sitemenu` WRITE;
/*!40000 ALTER TABLE `siteblocks_sitemenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `siteblocks_sitemenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'products','0001_initial','2013-02-06 10:18:36'),(2,'products','0002_auto__add_field_tech_description_2','2013-02-06 10:19:41');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_kvstore`
--

DROP TABLE IF EXISTS `thumbnail_kvstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_kvstore`
--

LOCK TABLES `thumbnail_kvstore` WRITE;
/*!40000 ALTER TABLE `thumbnail_kvstore` DISABLE KEYS */;
INSERT INTO `thumbnail_kvstore` VALUES ('sorl-thumbnail||image||03b8778a74a73f5453c9dd2b538afbe9','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/c1/66/c166979a45d3dd9b6a3c431c2ce7cb6f.jpg\", \"size\": [137, 80]}'),('sorl-thumbnail||image||06d4aaddd6a52e6d46389c2cd532e6ea','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/9b/1b/9b1b6d9e8223a314d4134fc057f90689.jpg\", \"size\": [23, 80]}'),('sorl-thumbnail||image||0a792bb280ff66455e0c458e4e5b112d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/6a/0b/6a0b0a0dedb48e363c40d34f7c9d44ca.jpg\", \"size\": [23, 80]}'),('sorl-thumbnail||image||0e566bc8319e1d43bf679143710b2e6e','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/slider-hangar.png\", \"size\": [679, 396]}'),('sorl-thumbnail||image||0ec8c6b7fec295622a5cce0e9bae40a1','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/4c/72/4c72a2083cbf09cade126c252548b20c.jpg\", \"size\": [137, 80]}'),('sorl-thumbnail||image||0f492fd4354905c6fa17b300edd71595','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/tech_property/8osGSWvNCuY.jpg\", \"size\": [340, 455]}'),('sorl-thumbnail||image||13c49e382735b5cccf2a66c86094cd4d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/38/98/38981b458981fe39445d3b3bc1955427.jpg\", \"size\": [200, 120]}'),('sorl-thumbnail||image||186acdd55794ffa0e37c9e2b05d25f2f','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/97/a4/97a45bfb6ee9df14d8ef3e22f0e6e35f.jpg\", \"size\": [321, 300]}'),('sorl-thumbnail||image||1f3c8d28f6429f97d839aa8708706872','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/f1/b2/f1b2deed4f5cc229972a3df09a44e627.jpg\", \"size\": [100, 60]}'),('sorl-thumbnail||image||1fd1e4909d467777fbbbcd092f077b1e','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/e1/fb/e1fbfa9bfa68b53805526f7e92e1281f.jpg\", \"size\": [137, 80]}'),('sorl-thumbnail||image||23d60b3a7b7a6b4a13c8d04b83218298','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product_image/OQ4uXuEj3jc.jpg\", \"size\": [604, 425]}'),('sorl-thumbnail||image||26dd1521750d3752942797ad06e1edc7','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/ac/de/acdeca3ab06ffd6cf42594068bd94c83.jpg\", \"size\": [68, 80]}'),('sorl-thumbnail||image||2799677baf3599add5fb98afbb40f164','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/6a/71/6a71d49392a9b650e56a76c3c707e73e.jpg\", \"size\": [137, 80]}'),('sorl-thumbnail||image||28b5591fc17081e064bbdce740cf1c05','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/ad/b4/adb41bac0bbb8813045288d7d20f384b.jpg\", \"size\": [152, 80]}'),('sorl-thumbnail||image||29c50e8af3ba8d8e3f20b91cf23f8690','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/slider-outbuilding.png\", \"size\": [679, 396]}'),('sorl-thumbnail||image||2be94f6a1ac428f292ec9ecf478f9aa4','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/d1.png\", \"size\": [51, 179]}'),('sorl-thumbnail||image||316e3c3eab100dcd378c8cf6ec3fbaf0','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/object-usecase-category-image-1.png\", \"size\": [25, 28]}'),('sorl-thumbnail||image||36c124e1b2f8bd81197a7fa10fc06b7f','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/63/03/63037a150bdf5abaa70b96a419bc6a07.jpg\", \"size\": [23, 80]}'),('sorl-thumbnail||image||37de9e23b4d6e6a46b7a53ed9e3e2914','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/d1_6.png\", \"size\": [51, 179]}'),('sorl-thumbnail||image||37ff54d524e7f7797c822cf26d91d7ad','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/ba/c1/bac10b39ef68a4804bfef107d93516e7.jpg\", \"size\": [100, 60]}'),('sorl-thumbnail||image||38d742451252c3fbf203e5c9ee15a50d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/2f/f2/2ff2e6b58cef4a0e92a30587e123db7c.jpg\", \"size\": [200, 120]}'),('sorl-thumbnail||image||399d0819bd00c94022bbf124a49011e7','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/slider-outbuilding_1.png\", \"size\": [679, 396]}'),('sorl-thumbnail||image||4e4aea4b0a6d7ef6ce12eb225c40551c','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/4b/0c/4b0cab36b3047bf7f772bf2585675a14.jpg\", \"size\": [137, 80]}'),('sorl-thumbnail||image||5318ba9da73f1a2cb937afd5fb3feeb5','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/30/49/3049b159ce978f0c55f464f4c7ee9233.jpg\", \"size\": [23, 80]}'),('sorl-thumbnail||image||55b26ace6707ac992d1aaeccb8dbe613','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/d1_5.png\", \"size\": [51, 179]}'),('sorl-thumbnail||image||55e8ad50637b8fd34733d99ef9a413a9','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/4f/a1/4fa1bfaffb58a276ac74d88163172a26.jpg\", \"size\": [200, 120]}'),('sorl-thumbnail||image||560d8bba623e84dfeaf7cbe9d984b9cb','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/db/a0/dba0288552c20a1f4aefe256373350e1.jpg\", \"size\": [152, 80]}'),('sorl-thumbnail||image||56570954770d03ff8d40acf27ff1ae88','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product_image/386539_10150416043750909_11071120908_8411614_1202873416_n.jpg\", \"size\": [960, 720]}'),('sorl-thumbnail||image||5c4a045dacbc653c70bf8e2389e4af93','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/d1_3.png\", \"size\": [51, 179]}'),('sorl-thumbnail||image||6acc88a9e0afefa19bf608a175e201fa','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/44/b2/44b236601d1bba9ee96562bba2d5b665.jpg\", \"size\": [23, 80]}'),('sorl-thumbnail||image||6d4c8631538d0620c9210fcc240247aa','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/slider-roof.png\", \"size\": [679, 396]}'),('sorl-thumbnail||image||6e2b57ac726afaa4ac72a527b93a3a6e','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/6em1zl.jpg\", \"size\": [543, 640]}'),('sorl-thumbnail||image||704b6a4c7397abe1d5d443c5a282c540','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/cb/b7/cbb73928e1950c99edf0abc0ba33d3cf.jpg\", \"size\": [100, 60]}'),('sorl-thumbnail||image||71fcd7f5480f90eb88d1e3e54583a9ca','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/object-advantages-image.png\", \"size\": [240, 126]}'),('sorl-thumbnail||image||7209cee3e28f775ffaa6f936c4c88b68','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/tech_property/8936af.jpg\", \"size\": [700, 521]}'),('sorl-thumbnail||image||722340265890e7d302acbddf7559f624','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/inst_1000c_preview.png\", \"size\": [330, 308]}'),('sorl-thumbnail||image||73b4cefe6c2717ad090486e9692af1ce','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/0c/31/0c316f51dcff04ac5224dd4b1da271b5.jpg\", \"size\": [25, 28]}'),('sorl-thumbnail||image||7a862e40a38e479bccba8c6466b594c1','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/0_783d6_a4ef6436_orig.jpg\", \"size\": [450, 477]}'),('sorl-thumbnail||image||8002f2827b7995701292e4d6aef3de3a','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/tech_property/104d9c35.jpg\", \"size\": [500, 407]}'),('sorl-thumbnail||image||80cfb4508a8d9e7e6383a0d565e3a2cd','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/b2/70/b270f1b6ce6b0a73abe30254f7129d43.jpg\", \"size\": [86, 80]}'),('sorl-thumbnail||image||9005899c763de3ad0c061bdeedaf8eec','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/d1_4.png\", \"size\": [51, 179]}'),('sorl-thumbnail||image||94933f18f831df9d3eef081ab97e68ac','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/e9/37/e937a1614fbe9fce3e87035effbc51aa.jpg\", \"size\": [25, 28]}'),('sorl-thumbnail||image||954132528799b6bdb0cb4617af459d70','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/5d/ef/5def0213c70468ab038d10939fa1bf48.jpg\", \"size\": [23, 80]}'),('sorl-thumbnail||image||960cd65799c665be2a7d727c08bb5f30','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/de/94/de94c1a559d531f82801c6bc67ee9f99.jpg\", \"size\": [23, 80]}'),('sorl-thumbnail||image||9648f5cc4b926d4cecf3a69bc065185d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product_image/20121104_163243.jpg\", \"size\": [3264, 2448]}'),('sorl-thumbnail||image||9b4da7bed20e4add4a589a52894f92ab','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/bf/7b/bf7b2d3a08448829cc83c4493686e9cb.jpg\", \"size\": [137, 80]}'),('sorl-thumbnail||image||a15da464539930c50390a057e183cc98','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product_image/8936af.jpg\", \"size\": [700, 521]}'),('sorl-thumbnail||image||a32f57ea1df29cc7ecf9a63069f1d7e2','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/d1_2.png\", \"size\": [51, 179]}'),('sorl-thumbnail||image||a7824b52542fa06aba6e3658bd096c7a','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/usecase-category-image-1.png\", \"size\": [25, 28]}'),('sorl-thumbnail||image||b020bb19a4001b07f4a20fe85750175c','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/slider-roof_1.png\", \"size\": [679, 396]}'),('sorl-thumbnail||image||d59be6f7f6cc359879620ea4c64bbb7b','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/ad/2a/ad2a08f264fb13f589faf095e65640b0.jpg\", \"size\": [100, 60]}'),('sorl-thumbnail||image||d5c2cacba5e6e60349c92bab8a14e80d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/slider-mansard.png\", \"size\": [679, 396]}'),('sorl-thumbnail||image||d6ce8e380cc9ea394def5e0152d45519','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/object-advantages-image_1.png\", \"size\": [240, 126]}'),('sorl-thumbnail||image||da586496be090a0b394d5c3b8a1dcf86','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/f7/d1/f7d18a30b9134acf90237e5bd1456a4c.jpg\", \"size\": [100, 60]}'),('sorl-thumbnail||image||e129d5a53cc42cdd75d412cf6b5a433d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/37/be/37be8d6f680749f5d27c014b12d17f0b.jpg\", \"size\": [76, 80]}'),('sorl-thumbnail||image||f2a2df0ac196db89fdd0352ef437bdfb','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/usecase-category-image-1_1.png\", \"size\": [25, 28]}'),('sorl-thumbnail||image||f6ccac8138c128822ec3e730be2ef574','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/04/d9/04d9806e92fc4f10387debdf73f537bd.jpg\", \"size\": [283, 300]}'),('sorl-thumbnail||image||f78b423a5842ff4c7403c14e33e5cac1','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product/d1_1.png\", \"size\": [51, 179]}'),('sorl-thumbnail||image||f9e3bdb5097f2c5a0cb4af7912241007','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/product_image/1316345442_www.nevseoboi.com.ua_by-nevseoboi-8.jpg\", \"size\": [2000, 1333]}'),('sorl-thumbnail||image||fd0fe776cded59bdd0b9605cf2d3e0e8','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/17/8c/178c41d54cb413c123213f113b510c1c.jpg\", \"size\": [100, 60]}'),('sorl-thumbnail||image||ff0e01216fa24208f6dd6ba635053503','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/24/8c/248cf967788b85b7db31d2dad8411f6b.jpg\", \"size\": [25, 28]}'),('sorl-thumbnail||image||ff2abad37abcc8cbcbc2702f1af28ff6','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"images/property/windows-and-gates-main.png\", \"size\": [200, 210]}'),('sorl-thumbnail||thumbnails||0e566bc8319e1d43bf679143710b2e6e','[\"1fd1e4909d467777fbbbcd092f077b1e\"]'),('sorl-thumbnail||thumbnails||0f492fd4354905c6fa17b300edd71595','[\"13c49e382735b5cccf2a66c86094cd4d\"]'),('sorl-thumbnail||thumbnails||23d60b3a7b7a6b4a13c8d04b83218298','[\"d59be6f7f6cc359879620ea4c64bbb7b\"]'),('sorl-thumbnail||thumbnails||29c50e8af3ba8d8e3f20b91cf23f8690','[\"2799677baf3599add5fb98afbb40f164\"]'),('sorl-thumbnail||thumbnails||2be94f6a1ac428f292ec9ecf478f9aa4','[\"6acc88a9e0afefa19bf608a175e201fa\", \"1f3c8d28f6429f97d839aa8708706872\"]'),('sorl-thumbnail||thumbnails||316e3c3eab100dcd378c8cf6ec3fbaf0','[\"ff0e01216fa24208f6dd6ba635053503\"]'),('sorl-thumbnail||thumbnails||37de9e23b4d6e6a46b7a53ed9e3e2914','[\"06d4aaddd6a52e6d46389c2cd532e6ea\"]'),('sorl-thumbnail||thumbnails||399d0819bd00c94022bbf124a49011e7','[\"9b4da7bed20e4add4a589a52894f92ab\"]'),('sorl-thumbnail||thumbnails||55b26ace6707ac992d1aaeccb8dbe613','[\"5318ba9da73f1a2cb937afd5fb3feeb5\"]'),('sorl-thumbnail||thumbnails||56570954770d03ff8d40acf27ff1ae88','[\"fd0fe776cded59bdd0b9605cf2d3e0e8\"]'),('sorl-thumbnail||thumbnails||5c4a045dacbc653c70bf8e2389e4af93','[\"954132528799b6bdb0cb4617af459d70\"]'),('sorl-thumbnail||thumbnails||6d4c8631538d0620c9210fcc240247aa','[\"0ec8c6b7fec295622a5cce0e9bae40a1\"]'),('sorl-thumbnail||thumbnails||6e2b57ac726afaa4ac72a527b93a3a6e','[\"26dd1521750d3752942797ad06e1edc7\"]'),('sorl-thumbnail||thumbnails||71fcd7f5480f90eb88d1e3e54583a9ca','[\"560d8bba623e84dfeaf7cbe9d984b9cb\"]'),('sorl-thumbnail||thumbnails||7209cee3e28f775ffaa6f936c4c88b68','[\"55e8ad50637b8fd34733d99ef9a413a9\"]'),('sorl-thumbnail||thumbnails||722340265890e7d302acbddf7559f624','[\"80cfb4508a8d9e7e6383a0d565e3a2cd\", \"186acdd55794ffa0e37c9e2b05d25f2f\"]'),('sorl-thumbnail||thumbnails||7a862e40a38e479bccba8c6466b594c1','[\"f6ccac8138c128822ec3e730be2ef574\"]'),('sorl-thumbnail||thumbnails||8002f2827b7995701292e4d6aef3de3a','[\"38d742451252c3fbf203e5c9ee15a50d\"]'),('sorl-thumbnail||thumbnails||9005899c763de3ad0c061bdeedaf8eec','[\"0a792bb280ff66455e0c458e4e5b112d\"]'),('sorl-thumbnail||thumbnails||9648f5cc4b926d4cecf3a69bc065185d','[\"37ff54d524e7f7797c822cf26d91d7ad\"]'),('sorl-thumbnail||thumbnails||a15da464539930c50390a057e183cc98','[\"704b6a4c7397abe1d5d443c5a282c540\"]'),('sorl-thumbnail||thumbnails||a32f57ea1df29cc7ecf9a63069f1d7e2','[\"960cd65799c665be2a7d727c08bb5f30\"]'),('sorl-thumbnail||thumbnails||a7824b52542fa06aba6e3658bd096c7a','[\"73b4cefe6c2717ad090486e9692af1ce\"]'),('sorl-thumbnail||thumbnails||b020bb19a4001b07f4a20fe85750175c','[\"4e4aea4b0a6d7ef6ce12eb225c40551c\"]'),('sorl-thumbnail||thumbnails||d5c2cacba5e6e60349c92bab8a14e80d','[\"03b8778a74a73f5453c9dd2b538afbe9\"]'),('sorl-thumbnail||thumbnails||d6ce8e380cc9ea394def5e0152d45519','[\"28b5591fc17081e064bbdce740cf1c05\"]'),('sorl-thumbnail||thumbnails||f2a2df0ac196db89fdd0352ef437bdfb','[\"94933f18f831df9d3eef081ab97e68ac\"]'),('sorl-thumbnail||thumbnails||f78b423a5842ff4c7403c14e33e5cac1','[\"36c124e1b2f8bd81197a7fa10fc06b7f\"]'),('sorl-thumbnail||thumbnails||f9e3bdb5097f2c5a0cb4af7912241007','[\"da586496be090a0b394d5c3b8a1dcf86\"]'),('sorl-thumbnail||thumbnails||ff2abad37abcc8cbcbc2702f1af28ff6','[\"e129d5a53cc42cdd75d412cf6b5a433d\"]');
/*!40000 ALTER TABLE `thumbnail_kvstore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-07 18:08:06
