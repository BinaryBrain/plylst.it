-- MySQL dump 10.15  Distrib 10.0.24-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: plylst_it
-- ------------------------------------------------------
-- Server version	10.0.24-MariaDB-7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `plylst_it`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `plylst_it` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `plylst_it`;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) CHARACTER SET utf8 NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2016-05-09 17:19:29','2016-05-09 17:19:29');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,2,1),(2,5,3),(3,5,2),(4,3,2);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user1_id` int(11) DEFAULT NULL,
  `user2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendships`
--

DROP TABLE IF EXISTS `friendships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendships`
--

LOCK TABLES `friendships` WRITE;
/*!40000 ALTER TABLE `friendships` DISABLE KEYS */;
INSERT INTO `friendships` VALUES (3,3,2),(4,2,3);
/*!40000 ALTER TABLE `friendships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_invites`
--

DROP TABLE IF EXISTS `pending_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `invite_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_invites`
--

LOCK TABLES `pending_invites` WRITE;
/*!40000 ALTER TABLE `pending_invites` DISABLE KEYS */;
INSERT INTO `pending_invites` VALUES (1,2,'6');
/*!40000 ALTER TABLE `pending_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `public` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,2,'ben2 public playlist','2016-06-07 12:29:19','2016-06-07 12:29:19',1),(2,2,'ben2 private playlist','2016-06-07 12:29:24','2016-06-07 12:29:24',0),(3,3,'ben3 public playlist','2016-06-07 12:29:52','2016-06-07 12:29:52',1),(5,1,'Best public playlist','2016-06-07 13:39:46','2016-06-07 22:36:35',1),(6,2,'My other public playlist','2016-06-07 22:45:05','2016-06-07 22:45:05',1),(7,3,'ben3 private playlist','2016-06-07 23:40:27','2016-06-07 23:40:27',0);
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_songs`
--

DROP TABLE IF EXISTS `playlists_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlists_songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_id` int(11) DEFAULT NULL,
  `song_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists_songs`
--

LOCK TABLES `playlists_songs` WRITE;
/*!40000 ALTER TABLE `playlists_songs` DISABLE KEYS */;
INSERT INTO `playlists_songs` VALUES (1,1,1),(2,2,1),(3,1,2),(4,2,2),(5,3,3),(6,5,3),(9,3,5),(10,5,6),(11,1,7),(12,6,8),(13,6,9),(14,7,10);
/*!40000 ALTER TABLE `playlists_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160509171415'),('20160509171653'),('20160509171731'),('20160517070515'),('20160518202532'),('20160524084619'),('20160606151501'),('20160606164732');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `original_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'Michael Jackson - They Don\'t Care About Us','1465303418201276388','https://www.youtube.com/watch?v=QNJL6nfu__Q','2016-06-07 12:43:49','2016-06-07 12:43:49',282),(2,'Michael Jackson - Thriller','1465303446772037125','https://www.youtube.com/watch?v=sOnqjkJTMaA','2016-06-07 12:44:35','2016-06-07 12:44:35',822),(3,'Michael Jackson - Earth Song','1465303514656619232','https://www.youtube.com/watch?v=XAi3VTSdTxU','2016-06-07 12:45:29','2016-06-07 12:45:29',403),(4,'Michael Jackson - Billie Jean','1465306826623422954','https://www.youtube.com/watch?v=Zi_XLOBDo_Y','2016-06-07 13:40:38','2016-06-07 13:40:38',294),(5,'Michael Jackson - Black Or White','1465307094102884318','https://www.youtube.com/watch?v=F2AitTPI5U0','2016-06-07 13:45:08','2016-06-07 13:45:08',383),(6,'Elton John - Sacrifice','1465339028364141273','https://www.youtube.com/watch?v=NrLkTZrPZA4','2016-06-07 22:37:20','2016-06-07 22:37:20',290),(7,'Survivor - Eye Of The Tiger','1465339213457783154','https://www.youtube.com/watch?v=btPJPFnesV4','2016-06-07 22:40:24','2016-06-07 22:40:24',251),(8,'Rihanna - Needed Me','1465339567755068849','https://www.youtube.com/watch?v=wfN4PVaOU5Q','2016-06-07 22:46:17','2016-06-07 22:46:17',195),(9,'MIKA - Hurts (Remix - Official Video)','1465339600990456875','https://www.youtube.com/watch?v=vPKkmu-pBMQ','2016-06-07 22:46:50','2016-06-07 22:46:50',210),(10,'Ibrahim Maalouf - Baïkal (Extrait de la bande originale du film \"Dans Les Forêts De Siberie\")','1465342850667755821','https://www.youtube.com/watch?v=Z0ElTBRRUHg','2016-06-07 23:40:58','2016-06-07 23:40:58',175);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Benoist',1,'2016-06-07 12:28:52','2016-06-07 22:50:52','benoist.wolleb@la-cave.ch','$2a$11$GXlXNgHTXk00K25jOQxCw.zQA3K4KTzsRsYjiMJjXw/OOy5k/wWkK',NULL,NULL,NULL,9,'2016-06-07 22:50:52','2016-06-07 22:36:15','::1','::1'),(2,'Ben2',NULL,'2016-06-07 12:29:09','2016-06-07 23:41:10','benoist.wolleb@la-cave.ch2','$2a$11$YbOaoA84dMyfg3oB5FqN5.PDWNLIsfx/qyLp0jsIXbZvo.hpKbECK',NULL,NULL,NULL,13,'2016-06-07 23:41:10','2016-06-07 23:37:32','::1','::1'),(3,'Ben3',NULL,'2016-06-07 12:29:39','2016-06-07 23:39:53','benoist.wolleb@la-cave.ch3','$2a$11$4B8KrSH50NoB7ayl4rn6COGlIYn69pcdpFSgI4qARYrFtjIFhCKfC',NULL,NULL,NULL,9,'2016-06-07 23:39:53','2016-06-07 22:42:13','::1','::1'),(6,'Ben4',NULL,'2016-06-07 13:01:14','2016-06-07 22:49:37','benoist.wolleb@la-cave.ch4','$2a$11$l4K9uKSpFh36vD6Y31hUnefs4IrFQm./ggWBvZAtScAkTwK.ow53G',NULL,NULL,NULL,2,'2016-06-07 22:49:37','2016-06-07 13:01:14','::1','::1'),(7,'Ben5',NULL,'2016-06-07 22:42:55','2016-06-07 22:42:55','benoist.wolleb@la-cave.ch5','$2a$11$1FgMvq03CcFwaVar422G1u3U1B2ApAC.H9BBdKGXnDtTDDX7EX0va',NULL,NULL,NULL,1,'2016-06-07 22:42:55','2016-06-07 22:42:55','::1','::1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-08  1:41:32
