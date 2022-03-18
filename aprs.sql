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
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_customuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_customuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_customuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `callsign`
--

DROP TABLE IF EXISTS `callsign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callsign` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(9) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coordinate`
--

DROP TABLE IF EXISTS `coordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` double(8,6) NOT NULL,
  `longitude` double(9,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `digis`
--

DROP TABLE IF EXISTS `digis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_uniq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `last_bulletin`
--

DROP TABLE IF EXISTS `last_bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_bulletin` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `callsign_to_id` int(11) NOT NULL DEFAULT '0',
  `message_id` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `id` varchar(10) DEFAULT NULL,
  `create_ts` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`),
  KEY `packet_id` (`packet_id`),
  KEY `create_ts` (`create_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_dfr`
--

DROP TABLE IF EXISTS `last_dfr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_dfr` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  `bearing` int(11) DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `range` double(9,2) NOT NULL,
  `quality` int(11) NOT NULL,
  `create_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`,`name_id`),
  KEY `packet_id` (`packet_id`),
  KEY `create_ts` (`create_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_dfs`
--

DROP TABLE IF EXISTS `last_dfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_dfs` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  `power` double(10,2) DEFAULT NULL,
  `haat` double(10,2) DEFAULT NULL,
  `gain` double(10,2) DEFAULT NULL,
  `range` double(10,2) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `create_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`,`name_id`),
  KEY `packet_id` (`packet_id`),
  KEY `create_ts` (`create_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_frequency`
--

DROP TABLE IF EXISTS `last_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_frequency` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL DEFAULT '0',
  `frequency` varchar(11) CHARACTER SET latin1 NOT NULL,
  `range` double(9,2) DEFAULT NULL,
  `range_east` double(9,2) DEFAULT NULL,
  `tone` varchar(6) CHARACTER SET latin1 DEFAULT NULL,
  `afrs_type` enum('pl','ctcss','dcs','burst') CHARACTER SET latin1 DEFAULT NULL,
  `receive` varchar(7) CHARACTER SET latin1 DEFAULT NULL,
  `alternate` varchar(7) CHARACTER SET latin1 DEFAULT NULL,
  `type` enum('P','O','I') CHARACTER SET latin1 NOT NULL DEFAULT 'P',
  `create_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`),
  KEY `packet_id` (`packet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_message`
--

DROP TABLE IF EXISTS `last_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_message` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `callsign_to_id` int(11) NOT NULL,
  `message_id` binary(16) NOT NULL,
  `id` varchar(10) DEFAULT NULL,
  `create_ts` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`),
  KEY `packet_id` (`packet_id`),
  KEY `create_ts` (`create_ts`),
  KEY `callsign_to_id` (`callsign_to_id`),
  KEY `message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_phg`
--

DROP TABLE IF EXISTS `last_phg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_phg` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  `power` double(10,2) DEFAULT NULL,
  `haat` double(10,2) DEFAULT NULL,
  `gain` double(10,2) DEFAULT NULL,
  `range` double(10,2) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `beacon` int(11) DEFAULT NULL,
  `create_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`,`name_id`),
  KEY `packet_id` (`packet_id`),
  KEY `create_ts` (`create_ts`),
  KEY `callsign_id` (`callsign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_position`
--

DROP TABLE IF EXISTS `last_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_position` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  `icon_id` tinyint(4) unsigned NOT NULL,
  `maidenhead` char(6) NOT NULL,
  `latitude` double(8,6) NOT NULL DEFAULT '0.000000',
  `longitude` double(9,6) NOT NULL DEFAULT '0.000000',
  `create_ts` int(11) NOT NULL,
  PRIMARY KEY (`callsign_id`,`name_id`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `packet_id` (`packet_id`),
  KEY `callsign_id` (`callsign_id`),
  KEY `lat_lng_create_idx` (`latitude`,`longitude`),
  KEY `create_ts` (`create_ts`),
  KEY `name_id` (`name_id`),
  KEY `maidenhead` (`maidenhead`),
  KEY `icon_id` (`icon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_position_meta`
--

DROP TABLE IF EXISTS `last_position_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_position_meta` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  `dest_id` int(11) NOT NULL DEFAULT '0',
  `path_id` int(11) NOT NULL,
  `course` smallint(5) unsigned DEFAULT NULL,
  `speed` smallint(5) unsigned DEFAULT NULL,
  `altitude` mediumint(9) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '0',
  `symbol_table` char(1) DEFAULT NULL,
  `symbol_code` char(1) DEFAULT NULL,
  `overlay` varchar(3) DEFAULT NULL,
  `range` double(10,2) DEFAULT NULL,
  `type` enum('P','O','I') NOT NULL DEFAULT 'P',
  `weather` enum('Y','N') NOT NULL DEFAULT 'N',
  `telemetry` enum('Y','N') NOT NULL DEFAULT 'N',
  `igate` enum('Y','N') NOT NULL DEFAULT 'N',
  `position_type_id` tinyint(11) NOT NULL,
  `mbits` varchar(3) DEFAULT NULL,
  `create_ts` int(11) NOT NULL,
  PRIMARY KEY (`callsign_id`,`name_id`),
  KEY `packet_id` (`packet_id`),
  KEY `symbol_table` (`symbol_table`,`symbol_code`),
  KEY `destination` (`dest_id`),
  KEY `path_id` (`path_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_raw`
--

DROP TABLE IF EXISTS `last_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_raw` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `information` longtext,
  `create_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`),
  KEY `create_ts` (`create_ts`),
  KEY `packet_id` (`packet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_raw_meta`
--

DROP TABLE IF EXISTS `last_raw_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_raw_meta` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `ip_source` varchar(255) DEFAULT NULL,
  `dest_id` int(11) NOT NULL,
  `digi0_id` int(11) NOT NULL,
  `digi1_id` int(11) NOT NULL,
  `digi2_id` int(11) NOT NULL,
  `digi3_id` int(11) NOT NULL,
  `digi4_id` int(11) NOT NULL,
  `digi5_id` int(11) NOT NULL,
  `digi6_id` int(11) NOT NULL,
  `digi7_id` int(11) NOT NULL,
  `hostid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`),
  KEY `create_ts` (`create_ts`),
  KEY `packet_id` (`packet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_telemetry`
--

DROP TABLE IF EXISTS `last_telemetry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_telemetry` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `sequence` int(3) NOT NULL DEFAULT '0',
  `analog_0` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `analog_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `analog_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `analog_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `analog_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `digital` char(8) NOT NULL DEFAULT '000000',
  `create_ts` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`),
  KEY `create_ts` (`create_ts`),
  KEY `sequence` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_weather`
--

DROP TABLE IF EXISTS `last_weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_weather` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `latitude` double(8,6) DEFAULT '0.000000',
  `longitude` double(9,6) DEFAULT '0.000000',
  `wind_direction` smallint(3) unsigned DEFAULT NULL,
  `wind_speed` tinyint(4) unsigned DEFAULT NULL,
  `wind_gust` tinyint(4) unsigned DEFAULT NULL,
  `wind_sustained` tinyint(4) unsigned DEFAULT NULL,
  `temperature` tinyint(4) DEFAULT NULL,
  `rain_hour` float DEFAULT NULL,
  `rain_calendar_day` float DEFAULT NULL,
  `rain_24hour_day` float DEFAULT NULL,
  `humidity` tinyint(4) unsigned DEFAULT NULL,
  `barometer` double(6,2) DEFAULT NULL,
  `luminosity` smallint(5) unsigned DEFAULT NULL,
  `create_ts` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`),
  KEY `packet_id` (`packet_id`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` binary(16) NOT NULL,
  `body` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_meta`
--

DROP TABLE IF EXISTS `message_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_meta` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `callsign_to_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `msgid` varchar(10) NOT NULL,
  `create_ts` int(11) NOT NULL DEFAULT '0',
  KEY `callsign_id` (`callsign_id`),
  KEY `callsign_to_id_idx` (`callsign_to_id`),
  KEY `packet_date` (`create_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `object_name`
--

DROP TABLE IF EXISTS `object_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_name` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(9) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `source` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `path`
--

DROP TABLE IF EXISTS `path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` binary(16) NOT NULL,
  `body` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash_idx` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `latitude` double(8,6) DEFAULT NULL,
  `longitude` double(9,6) DEFAULT NULL,
  `create_ts` int(11) NOT NULL,
  KEY `callsign_id` (`callsign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position_meta`
--

DROP TABLE IF EXISTS `position_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_meta` (
  `packet_id` binary(16) NOT NULL,
  `path_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '0',
  `time_of_fix` int(10) unsigned DEFAULT NULL,
  `course` smallint(5) unsigned DEFAULT NULL,
  `speed` smallint(3) unsigned DEFAULT NULL,
  `altitude` mediumint(5) DEFAULT NULL,
  `symbol_table` char(1) NOT NULL,
  `symbol_code` char(1) NOT NULL,
  `create_ts` int(11) NOT NULL,
  KEY `packet_id` (`packet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (create_ts)
(PARTITION 2013_08_05 VALUES LESS THAN (1375682400) ENGINE = InnoDB,
 PARTITION 2013_08_06 VALUES LESS THAN (1375768800) ENGINE = InnoDB,
 PARTITION 2013_08_07 VALUES LESS THAN (1375855200) ENGINE = InnoDB,
 PARTITION 2013_08_08 VALUES LESS THAN (1375941600) ENGINE = InnoDB,
 PARTITION 2013_08_09 VALUES LESS THAN (1376028000) ENGINE = InnoDB,
 PARTITION 2013_08_10 VALUES LESS THAN (1376114400) ENGINE = InnoDB,
 PARTITION 2013_08_11 VALUES LESS THAN (1376200800) ENGINE = InnoDB,
 PARTITION 2013_08_12 VALUES LESS THAN (1376287200) ENGINE = InnoDB,
 PARTITION 2013_08_13 VALUES LESS THAN (1376373600) ENGINE = InnoDB,
 PARTITION 2013_08_14 VALUES LESS THAN (1376460000) ENGINE = InnoDB,
 PARTITION 2013_08_15 VALUES LESS THAN (1376546400) ENGINE = InnoDB,
 PARTITION 2013_08_16 VALUES LESS THAN (1376632800) ENGINE = InnoDB,
 PARTITION 2013_08_17 VALUES LESS THAN (1376719200) ENGINE = InnoDB,
 PARTITION 2013_08_18 VALUES LESS THAN (1376805600) ENGINE = InnoDB,
 PARTITION 2013_08_19 VALUES LESS THAN (1376892000) ENGINE = InnoDB,
 PARTITION 2013_08_20 VALUES LESS THAN (1376978400) ENGINE = InnoDB,
 PARTITION 2013_08_21 VALUES LESS THAN (1377064800) ENGINE = InnoDB,
 PARTITION 2013_08_22 VALUES LESS THAN (1377151200) ENGINE = InnoDB,
 PARTITION 2013_08_23 VALUES LESS THAN (1377237600) ENGINE = InnoDB,
 PARTITION 2013_08_24 VALUES LESS THAN (1377324000) ENGINE = InnoDB,
 PARTITION 2013_08_25 VALUES LESS THAN (1377410400) ENGINE = InnoDB,
 PARTITION 2013_08_26 VALUES LESS THAN (1377496800) ENGINE = InnoDB,
 PARTITION 2013_08_27 VALUES LESS THAN (1377583200) ENGINE = InnoDB,
 PARTITION 2013_08_28 VALUES LESS THAN (1377669600) ENGINE = InnoDB,
 PARTITION 2013_08_29 VALUES LESS THAN (1377756000) ENGINE = InnoDB,
 PARTITION 2013_08_30 VALUES LESS THAN (1377842400) ENGINE = InnoDB,
 PARTITION 2013_08_31 VALUES LESS THAN (1377928800) ENGINE = InnoDB,
 PARTITION 2013_09_01 VALUES LESS THAN (1378015200) ENGINE = InnoDB,
 PARTITION 2013_09_02 VALUES LESS THAN (1378101600) ENGINE = InnoDB,
 PARTITION 2013_09_03 VALUES LESS THAN (1378188000) ENGINE = InnoDB,
 PARTITION 2013_09_04 VALUES LESS THAN (1378274400) ENGINE = InnoDB,
 PARTITION 2013_09_05 VALUES LESS THAN (1378360800) ENGINE = InnoDB,
 PARTITION 2013_09_06 VALUES LESS THAN (1378447200) ENGINE = InnoDB,
 PARTITION 2013_09_07 VALUES LESS THAN (1378533600) ENGINE = InnoDB,
 PARTITION 2013_09_08 VALUES LESS THAN (1378620000) ENGINE = InnoDB,
 PARTITION 2013_09_09 VALUES LESS THAN (1378706400) ENGINE = InnoDB,
 PARTITION 2013_09_10 VALUES LESS THAN (1378792800) ENGINE = InnoDB,
 PARTITION 2013_09_11 VALUES LESS THAN (1378879200) ENGINE = InnoDB,
 PARTITION 2013_09_12 VALUES LESS THAN (1378965600) ENGINE = InnoDB,
 PARTITION 2013_09_13 VALUES LESS THAN (1379052000) ENGINE = InnoDB,
 PARTITION 2013_09_14 VALUES LESS THAN (1379138400) ENGINE = InnoDB,
 PARTITION 2013_09_15 VALUES LESS THAN (1379224800) ENGINE = InnoDB,
 PARTITION 2013_09_16 VALUES LESS THAN (1379311200) ENGINE = InnoDB,
 PARTITION 2013_09_17 VALUES LESS THAN (1379397600) ENGINE = InnoDB,
 PARTITION 2013_09_18 VALUES LESS THAN (1379484000) ENGINE = InnoDB,
 PARTITION 2013_09_19 VALUES LESS THAN (1379570400) ENGINE = InnoDB,
 PARTITION 2013_09_20 VALUES LESS THAN (1379656800) ENGINE = InnoDB,
 PARTITION 2013_09_21 VALUES LESS THAN (1379743200) ENGINE = InnoDB,
 PARTITION 2013_09_22 VALUES LESS THAN (1379829600) ENGINE = InnoDB,
 PARTITION 2013_09_23 VALUES LESS THAN (1379916000) ENGINE = InnoDB,
 PARTITION 2013_09_24 VALUES LESS THAN (1380002400) ENGINE = InnoDB,
 PARTITION 2013_09_25 VALUES LESS THAN (1380088800) ENGINE = InnoDB,
 PARTITION 2013_09_26 VALUES LESS THAN (1380175200) ENGINE = InnoDB,
 PARTITION 2013_09_27 VALUES LESS THAN (1380261600) ENGINE = InnoDB,
 PARTITION 2013_09_28 VALUES LESS THAN (1380348000) ENGINE = InnoDB,
 PARTITION 2013_09_29 VALUES LESS THAN (1380434400) ENGINE = InnoDB,
 PARTITION 2013_09_30 VALUES LESS THAN (1380520800) ENGINE = InnoDB,
 PARTITION 2013_10_01 VALUES LESS THAN (1380607200) ENGINE = InnoDB,
 PARTITION 2013_10_02 VALUES LESS THAN (1380693600) ENGINE = InnoDB,
 PARTITION 2013_10_03 VALUES LESS THAN (1380780000) ENGINE = InnoDB,
 PARTITION 2013_10_04 VALUES LESS THAN (1380866400) ENGINE = InnoDB,
 PARTITION 2013_10_05 VALUES LESS THAN (1380952800) ENGINE = InnoDB,
 PARTITION 2013_10_06 VALUES LESS THAN (1381039200) ENGINE = InnoDB,
 PARTITION 2013_10_07 VALUES LESS THAN (1381125600) ENGINE = InnoDB,
 PARTITION 2013_10_08 VALUES LESS THAN (1381212000) ENGINE = InnoDB,
 PARTITION 2013_10_09 VALUES LESS THAN (1381298400) ENGINE = InnoDB,
 PARTITION 2013_10_10 VALUES LESS THAN (1381384800) ENGINE = InnoDB,
 PARTITION 2013_10_11 VALUES LESS THAN (1381471200) ENGINE = InnoDB,
 PARTITION 2013_10_12 VALUES LESS THAN (1381557600) ENGINE = InnoDB,
 PARTITION 2013_10_13 VALUES LESS THAN (1381644000) ENGINE = InnoDB,
 PARTITION 2013_10_14 VALUES LESS THAN (1381730400) ENGINE = InnoDB,
 PARTITION 2013_10_15 VALUES LESS THAN (1381816800) ENGINE = InnoDB,
 PARTITION 2013_10_16 VALUES LESS THAN (1381903200) ENGINE = InnoDB,
 PARTITION 2013_10_17 VALUES LESS THAN (1381989600) ENGINE = InnoDB,
 PARTITION 2013_10_18 VALUES LESS THAN (1382076000) ENGINE = InnoDB,
 PARTITION 2013_10_19 VALUES LESS THAN (1382162400) ENGINE = InnoDB,
 PARTITION 2013_10_20 VALUES LESS THAN (1382248800) ENGINE = InnoDB,
 PARTITION 2013_10_21 VALUES LESS THAN (1382335200) ENGINE = InnoDB,
 PARTITION 2013_10_22 VALUES LESS THAN (1382421600) ENGINE = InnoDB,
 PARTITION 2013_10_23 VALUES LESS THAN (1382508000) ENGINE = InnoDB,
 PARTITION 2013_10_24 VALUES LESS THAN (1382594400) ENGINE = InnoDB,
 PARTITION 2013_10_25 VALUES LESS THAN (1382680800) ENGINE = InnoDB,
 PARTITION 2013_10_26 VALUES LESS THAN (1382767200) ENGINE = InnoDB,
 PARTITION 2013_10_27 VALUES LESS THAN (1382853600) ENGINE = InnoDB,
 PARTITION 2013_10_28 VALUES LESS THAN (1382940000) ENGINE = InnoDB,
 PARTITION 2013_10_29 VALUES LESS THAN (1383026400) ENGINE = InnoDB,
 PARTITION 2013_10_30 VALUES LESS THAN (1383112800) ENGINE = InnoDB,
 PARTITION 2013_10_31 VALUES LESS THAN (1383199200) ENGINE = InnoDB,
 PARTITION 2013_11_01 VALUES LESS THAN (1383285600) ENGINE = InnoDB,
 PARTITION 2013_11_02 VALUES LESS THAN (1383372000) ENGINE = InnoDB,
 PARTITION 2013_11_03 VALUES LESS THAN (1383458400) ENGINE = InnoDB,
 PARTITION 2013_11_04 VALUES LESS THAN (1383548400) ENGINE = InnoDB,
 PARTITION 2013_11_05 VALUES LESS THAN (1383634800) ENGINE = InnoDB,
 PARTITION 2013_11_06 VALUES LESS THAN (1383721200) ENGINE = InnoDB,
 PARTITION 2013_11_07 VALUES LESS THAN (1383807600) ENGINE = InnoDB,
 PARTITION 2013_11_08 VALUES LESS THAN (1383894000) ENGINE = InnoDB,
 PARTITION 2013_11_09 VALUES LESS THAN (1383980400) ENGINE = InnoDB,
 PARTITION 2013_11_10 VALUES LESS THAN (1384066800) ENGINE = InnoDB,
 PARTITION 2013_11_11 VALUES LESS THAN (1384153200) ENGINE = InnoDB,
 PARTITION 2013_11_12 VALUES LESS THAN (1384239600) ENGINE = InnoDB,
 PARTITION 2013_11_13 VALUES LESS THAN (1384326000) ENGINE = InnoDB,
 PARTITION 2013_11_14 VALUES LESS THAN (1384412400) ENGINE = InnoDB,
 PARTITION 2013_11_15 VALUES LESS THAN (1384498800) ENGINE = InnoDB,
 PARTITION 2013_11_16 VALUES LESS THAN (1384585200) ENGINE = InnoDB,
 PARTITION 2013_11_17 VALUES LESS THAN (1384671600) ENGINE = InnoDB,
 PARTITION 2013_11_18 VALUES LESS THAN (1384758000) ENGINE = InnoDB,
 PARTITION 2013_11_19 VALUES LESS THAN (1384844400) ENGINE = InnoDB,
 PARTITION 2013_11_20 VALUES LESS THAN (1384930800) ENGINE = InnoDB,
 PARTITION 2013_11_21 VALUES LESS THAN (1385017200) ENGINE = InnoDB,
 PARTITION 2013_11_22 VALUES LESS THAN (1385103600) ENGINE = InnoDB,
 PARTITION 2013_11_23 VALUES LESS THAN (1385190000) ENGINE = InnoDB,
 PARTITION 2013_11_24 VALUES LESS THAN (1385276400) ENGINE = InnoDB,
 PARTITION 2013_11_25 VALUES LESS THAN (1385362800) ENGINE = InnoDB,
 PARTITION 2013_11_26 VALUES LESS THAN (1385449200) ENGINE = InnoDB,
 PARTITION 2013_11_27 VALUES LESS THAN (1385535600) ENGINE = InnoDB,
 PARTITION 2013_11_28 VALUES LESS THAN (1385622000) ENGINE = InnoDB,
 PARTITION 2013_11_29 VALUES LESS THAN (1385708400) ENGINE = InnoDB,
 PARTITION 2013_11_30 VALUES LESS THAN (1385794800) ENGINE = InnoDB,
 PARTITION 2013_12_01 VALUES LESS THAN (1385881200) ENGINE = InnoDB,
 PARTITION 2013_12_02 VALUES LESS THAN (1385967600) ENGINE = InnoDB,
 PARTITION 2013_12_03 VALUES LESS THAN (1386054000) ENGINE = InnoDB,
 PARTITION 2013_12_04 VALUES LESS THAN (1386140400) ENGINE = InnoDB,
 PARTITION 2013_12_05 VALUES LESS THAN (1386226800) ENGINE = InnoDB,
 PARTITION 2013_12_06 VALUES LESS THAN (1386313200) ENGINE = InnoDB,
 PARTITION 2013_12_07 VALUES LESS THAN (1386399600) ENGINE = InnoDB,
 PARTITION 2013_12_08 VALUES LESS THAN (1386486000) ENGINE = InnoDB,
 PARTITION 2013_12_09 VALUES LESS THAN (1386572400) ENGINE = InnoDB,
 PARTITION 2013_12_10 VALUES LESS THAN (1386658800) ENGINE = InnoDB,
 PARTITION 2013_12_11 VALUES LESS THAN (1386745200) ENGINE = InnoDB,
 PARTITION 2013_12_12 VALUES LESS THAN (1386831600) ENGINE = InnoDB,
 PARTITION 2013_12_13 VALUES LESS THAN (1386918000) ENGINE = InnoDB,
 PARTITION 2013_12_14 VALUES LESS THAN (1387004400) ENGINE = InnoDB,
 PARTITION 2013_12_15 VALUES LESS THAN (1387090800) ENGINE = InnoDB,
 PARTITION 2013_12_16 VALUES LESS THAN (1387177200) ENGINE = InnoDB,
 PARTITION 2013_12_17 VALUES LESS THAN (1387263600) ENGINE = InnoDB,
 PARTITION 2013_12_18 VALUES LESS THAN (1387350000) ENGINE = InnoDB,
 PARTITION 2013_12_19 VALUES LESS THAN (1387436400) ENGINE = InnoDB,
 PARTITION 2013_12_20 VALUES LESS THAN (1387522800) ENGINE = InnoDB,
 PARTITION 2013_12_21 VALUES LESS THAN (1387609200) ENGINE = InnoDB,
 PARTITION 2013_12_22 VALUES LESS THAN (1387695600) ENGINE = InnoDB,
 PARTITION 2013_12_23 VALUES LESS THAN (1387782000) ENGINE = InnoDB,
 PARTITION 2013_12_24 VALUES LESS THAN (1387868400) ENGINE = InnoDB,
 PARTITION 2013_12_25 VALUES LESS THAN (1387954800) ENGINE = InnoDB,
 PARTITION 2013_12_26 VALUES LESS THAN (1388041200) ENGINE = InnoDB,
 PARTITION 2013_12_27 VALUES LESS THAN (1388127600) ENGINE = InnoDB,
 PARTITION 2013_12_28 VALUES LESS THAN (1388214000) ENGINE = InnoDB,
 PARTITION 2013_12_29 VALUES LESS THAN (1388300400) ENGINE = InnoDB,
 PARTITION 2013_12_30 VALUES LESS THAN (1388386800) ENGINE = InnoDB,
 PARTITION 2013_12_31 VALUES LESS THAN (1388473200) ENGINE = InnoDB,
 PARTITION 2014_01_01 VALUES LESS THAN (1388559600) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `position_type`
--

DROP TABLE IF EXISTS `position_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_type` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw`
--

DROP TABLE IF EXISTS `raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raw` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `information` longtext,
  `create_ts` int(11) NOT NULL DEFAULT '0',
  KEY `create_ts` (`create_ts`),
  KEY `callsign_id` (`callsign_id`),
  KEY `packet_id` (`packet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_meta`
--

DROP TABLE IF EXISTS `raw_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raw_meta` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `dest_id` int(11) NOT NULL,
  `digi0_id` int(11) NOT NULL,
  `digi1_id` int(11) NOT NULL,
  `digi2_id` int(11) NOT NULL,
  `digi3_id` int(11) NOT NULL,
  `digi4_id` int(11) NOT NULL,
  `digi5_id` int(11) NOT NULL,
  `digi6_id` int(11) NOT NULL,
  `digi7_id` int(11) NOT NULL,
  `packet_time` int(10) unsigned NOT NULL DEFAULT '0',
  `packet_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hostid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_ts` int(11) NOT NULL DEFAULT '0',
  KEY `create_ts` (`create_ts`),
  KEY `packet_date` (`packet_date`),
  KEY `callsign_id` (`callsign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(packet_date))
(PARTITION 2013_11_12 VALUES LESS THAN (1384239600) ENGINE = InnoDB,
 PARTITION 2013_11_13 VALUES LESS THAN (1384326000) ENGINE = InnoDB,
 PARTITION 2013_11_14 VALUES LESS THAN (1384412400) ENGINE = InnoDB,
 PARTITION 2013_11_15 VALUES LESS THAN (1384498800) ENGINE = InnoDB,
 PARTITION 2013_11_16 VALUES LESS THAN (1384585200) ENGINE = InnoDB,
 PARTITION 2013_11_17 VALUES LESS THAN (1384671600) ENGINE = InnoDB,
 PARTITION 2013_11_18 VALUES LESS THAN (1384758000) ENGINE = InnoDB,
 PARTITION 2013_11_19 VALUES LESS THAN (1384844400) ENGINE = InnoDB,
 PARTITION 2013_11_20 VALUES LESS THAN (1384930800) ENGINE = InnoDB,
 PARTITION 2013_11_21 VALUES LESS THAN (1385017200) ENGINE = InnoDB,
 PARTITION 2013_11_22 VALUES LESS THAN (1385103600) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` binary(16) NOT NULL,
  `body` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash_idx` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telemetry`
--

DROP TABLE IF EXISTS `telemetry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telemetry` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `source` char(10) NOT NULL DEFAULT '',
  `packet_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sequence` int(3) NOT NULL DEFAULT '0',
  `analog_0` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `analog_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `analog_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `analog_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `analog_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `digital` char(8) NOT NULL DEFAULT '00000000',
  `create_ts` int(14) NOT NULL DEFAULT '0',
  KEY `source` (`source`),
  KEY `create_ts` (`create_ts`),
  KEY `callsign_id` (`callsign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telemetry_bits`
--

DROP TABLE IF EXISTS `telemetry_bits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telemetry_bits` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `bitsense` char(8) DEFAULT '00000000',
  `project_title` varchar(23) NOT NULL,
  `packet_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_ts` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`),
  KEY `packet_date` (`packet_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telemetry_eqns`
--

DROP TABLE IF EXISTS `telemetry_eqns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telemetry_eqns` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `a_0` double DEFAULT NULL,
  `b_0` double DEFAULT NULL,
  `c_0` double DEFAULT NULL,
  `a_1` double DEFAULT NULL,
  `b_1` double DEFAULT NULL,
  `c_1` double DEFAULT NULL,
  `a_2` double DEFAULT NULL,
  `b_2` double DEFAULT NULL,
  `c_2` double DEFAULT NULL,
  `a_3` double DEFAULT NULL,
  `b_3` double DEFAULT NULL,
  `c_3` double DEFAULT NULL,
  `a_4` double DEFAULT NULL,
  `b_4` double DEFAULT NULL,
  `c_4` double DEFAULT NULL,
  `packet_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_ts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`callsign_id`),
  KEY `create_ts` (`create_ts`),
  KEY `packet_date` (`packet_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telemetry_parm`
--

DROP TABLE IF EXISTS `telemetry_parm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telemetry_parm` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `a_0` varchar(7) DEFAULT NULL,
  `a_1` varchar(6) DEFAULT NULL,
  `a_2` varchar(5) DEFAULT NULL,
  `a_3` varchar(5) DEFAULT NULL,
  `a_4` varchar(4) DEFAULT NULL,
  `d_0` varchar(5) DEFAULT NULL,
  `d_1` varchar(4) DEFAULT NULL,
  `d_2` varchar(3) DEFAULT NULL,
  `d_3` varchar(3) DEFAULT NULL,
  `d_4` varchar(3) DEFAULT NULL,
  `d_5` varchar(2) DEFAULT NULL,
  `d_6` varchar(2) DEFAULT NULL,
  `d_7` varchar(2) DEFAULT NULL,
  `packet_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_ts` int(11) DEFAULT '0',
  PRIMARY KEY (`callsign_id`),
  KEY `packet_date` (`packet_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telemetry_unit`
--

DROP TABLE IF EXISTS `telemetry_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telemetry_unit` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `a_0` varchar(7) DEFAULT NULL,
  `a_1` varchar(6) DEFAULT NULL,
  `a_2` varchar(5) DEFAULT NULL,
  `a_3` varchar(6) DEFAULT NULL,
  `a_4` varchar(4) DEFAULT NULL,
  `d_0` varchar(5) DEFAULT NULL,
  `d_1` varchar(4) DEFAULT NULL,
  `d_2` varchar(3) DEFAULT NULL,
  `d_3` varchar(3) DEFAULT NULL,
  `d_4` varchar(3) DEFAULT NULL,
  `d_5` varchar(2) DEFAULT NULL,
  `d_6` varchar(2) DEFAULT NULL,
  `d_7` varchar(2) DEFAULT NULL,
  `create_ts` int(11) DEFAULT '0',
  PRIMARY KEY (`callsign_id`),
  KEY `create_ts` (`create_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather` (
  `packet_id` binary(16) NOT NULL,
  `callsign_id` int(11) NOT NULL,
  `wind_direction` smallint(3) unsigned DEFAULT NULL,
  `wind_speed` tinyint(4) unsigned DEFAULT NULL,
  `wind_gust` tinyint(4) unsigned DEFAULT NULL,
  `wind_sustained` tinyint(4) unsigned DEFAULT NULL,
  `temperature` tinyint(4) DEFAULT NULL,
  `rain_hour` float DEFAULT NULL,
  `rain_calendar_day` float DEFAULT NULL,
  `rain_24hour_day` float DEFAULT NULL,
  `humidity` tinyint(4) unsigned DEFAULT NULL,
  `barometer` double(6,2) DEFAULT NULL,
  `luminosity` smallint(5) unsigned DEFAULT NULL,
  `create_ts` int(14) NOT NULL DEFAULT '0',
  KEY `create_ts` (`create_ts`),
  KEY `callsign_id` (`callsign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weather_meta`
--

DROP TABLE IF EXISTS `weather_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `callsign_id` int(11) NOT NULL,
  `last_rollup` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_ts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `callsign_id` (`callsign_id`),
  KEY `last_rollup` (`last_rollup`),
  KEY `callsign_rollup_idx` (`callsign_id`,`last_rollup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weather_rollup`
--

DROP TABLE IF EXISTS `weather_rollup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_rollup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `callsign_id` int(11) NOT NULL,
  `num_rolled` int(11) NOT NULL,
  `packet_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wind_direction` smallint(3) unsigned DEFAULT NULL,
  `wind_speed` tinyint(4) unsigned DEFAULT NULL,
  `wind_gust` tinyint(4) unsigned DEFAULT NULL,
  `wind_sustained` tinyint(4) unsigned DEFAULT NULL,
  `temperature` tinyint(4) DEFAULT NULL,
  `rain_hour` float DEFAULT NULL,
  `rain_calendar_day` float DEFAULT NULL,
  `rain_24hour_day` float DEFAULT NULL,
  `humidity` tinyint(4) unsigned DEFAULT NULL,
  `barometer` double(6,2) DEFAULT NULL,
  `luminosity` smallint(5) unsigned DEFAULT NULL,
  `create_ts` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `create_ts` (`create_ts`),
  KEY `callsign_id` (`callsign_id`),
  KEY `packet_date` (`packet_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-18  7:14:54
