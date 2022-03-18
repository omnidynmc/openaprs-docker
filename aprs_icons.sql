-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: aprs
-- ------------------------------------------------------
-- Server version	5.6.22-71.0

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
-- Table structure for table `aprs_icons`
--

DROP TABLE IF EXISTS `aprs_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprs_icons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `symbol_table` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '/',
  `icon` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `gpsxyz` char(2) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `index_no` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `image` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `icon_path` enum('primary','secondary','compass') CHARACTER SET utf8 DEFAULT 'primary',
  `direction` enum('Y','N') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `google_earth_scale` float(3,2) DEFAULT '1.00',
  PRIMARY KEY (`id`),
  KEY `icon` (`icon`),
  KEY `symbol_table_code_idx` (`symbol_table`,`icon`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1 MAX_ROWS=1000000000;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-18  7:14:56
