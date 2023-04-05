-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: j8b105.p.ssafy.io    Database: candy
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `constructor` varchar(255) DEFAULT NULL,
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  `updater` varchar(255) DEFAULT NULL,
  `country_en_name` varchar(255) DEFAULT NULL,
  `country_kr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','South Korea','한국'),(2,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Japan','일본'),(3,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Indonesia','인도네시아'),(4,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Netherlands','네덜란드'),(5,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Germany','독일'),(6,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','United States','미국'),(7,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Spain','스페인'),(8,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Denmark','덴마크'),(9,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Australia','호주'),(10,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Austria','오스트리아'),(11,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Czech Republic','체코'),(12,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Ireland','아일랜드'),(13,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','China','중국'),(14,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Belgium','벨기에'),(15,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','France','프랑스'),(16,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Finland','핀란드'),(17,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Croatia','크로아티아'),(18,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Italy','이탈리아'),(19,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Philippines','필리핀'),(20,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Singapore','싱가포르'),(21,'2023-03-22 09:56:24.198515','2023-03-22 09:56:24.198515','admin@admin.com',_binary '\0','admin@admin.com','Lithuania','리투아니아');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-05  9:19:04
