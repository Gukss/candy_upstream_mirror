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
-- Table structure for table `recommendation_candy`
--

DROP TABLE IF EXISTS `recommendation_candy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendation_candy` (
  `recommendation_candy_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `constructor` varchar(255) DEFAULT NULL,
  `is_delete` bit(1) NOT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `beer_id_list` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`recommendation_candy_id`),
  KEY `FK3vh3ch38s3ecad1wbg8dc1nlo` (`user_id`),
  CONSTRAINT `FK3vh3ch38s3ecad1wbg8dc1nlo` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation_candy`
--

LOCK TABLES `recommendation_candy` WRITE;
/*!40000 ALTER TABLE `recommendation_candy` DISABLE KEYS */;
INSERT INTO `recommendation_candy` VALUES (1,'2023-04-03 04:00:00.000000','2023-04-03 16:27:34.000000','admin@admin.com',_binary '\0','admin@admin.com','7 27 30 26 75 71 50 40 10 13 ',2495),(2,'2023-04-03 04:00:00.000000','2023-04-03 16:27:34.000000','admin@admin.com',_binary '\0','admin@admin.com','34 41 14 57 60 29 73 71 9 66 ',2496),(3,'2023-04-03 04:00:00.000000','2023-04-03 16:27:35.000000','admin@admin.com',_binary '\0','admin@admin.com','34 57 41 14 60 29 73 9 71 66 ',2497),(4,'2023-04-03 04:00:00.000000','2023-04-03 16:27:35.000000','admin@admin.com',_binary '\0','admin@admin.com','1 2 41 42 44 45 46 47 48 50 ',2498),(5,'2023-04-03 04:00:00.000000','2023-04-03 16:27:35.000000','admin@admin.com',_binary '\0','admin@admin.com','34 57 14 41 60 29 73 71 9 66 ',2499),(6,'2023-04-03 04:00:00.000000','2023-04-03 16:27:36.000000','admin@admin.com',_binary '\0','admin@admin.com','60 29 73 71 9 66 32 67 70 30 ',2501),(7,'2023-04-03 04:00:00.000000','2023-04-03 16:27:36.000000','admin@admin.com',_binary '\0','admin@admin.com','15 48 34 57 14 41 60 29 73 9 ',2502),(8,'2023-04-03 04:00:00.000000','2023-04-03 16:27:36.000000','admin@admin.com',_binary '\0','admin@admin.com','1 39 41 42 44 45 46 47 48 50 ',2503),(9,'2023-04-03 04:00:00.000000','2023-04-03 16:27:37.000000','admin@admin.com',_binary '\0','admin@admin.com','1 39 41 42 44 45 46 47 48 50 ',2504),(10,'2023-04-03 04:00:00.000000','2023-04-03 18:07:59.000000','admin@admin.com',_binary '\0','admin@admin.com','48 34 57 41 14 60 29 73 71 9 ',2505),(11,'2023-04-04 04:00:00.000000','2023-04-04 04:00:00.000000','admin@admin.com',_binary '\0','admin@admin.com','7 27 30 26 75 71 50 40 10 13 ',2495),(12,'2023-04-04 04:00:00.000000','2023-04-04 04:00:00.000000','admin@admin.com',_binary '\0','admin@admin.com','41 14 57 60 29 73 71 9 66 32 ',2496),(13,'2023-04-04 04:00:01.000000','2023-04-04 04:00:01.000000','admin@admin.com',_binary '\0','admin@admin.com','48 34 57 41 14 60 29 73 71 9 ',2497),(14,'2023-04-04 04:00:02.000000','2023-04-04 04:00:02.000000','admin@admin.com',_binary '\0','admin@admin.com','1 2 41 42 44 45 46 47 48 50 ',2498),(15,'2023-04-04 04:00:02.000000','2023-04-04 04:00:02.000000','admin@admin.com',_binary '\0','admin@admin.com','57 14 41 60 29 73 71 9 66 32 ',2499),(16,'2023-04-04 04:00:02.000000','2023-04-04 04:00:02.000000','admin@admin.com',_binary '\0','admin@admin.com','34 14 57 41 60 29 73 71 9 66 ',2501),(17,'2023-04-04 04:00:02.000000','2023-04-04 04:00:02.000000','admin@admin.com',_binary '\0','admin@admin.com','34 57 41 14 60 29 73 9 71 66 ',2502),(18,'2023-04-04 04:00:03.000000','2023-04-04 04:00:03.000000','admin@admin.com',_binary '\0','admin@admin.com','1 39 41 42 44 45 46 47 48 50 ',2503),(19,'2023-04-04 04:00:04.000000','2023-04-04 04:00:04.000000','admin@admin.com',_binary '\0','admin@admin.com','1 39 41 42 44 45 46 47 48 50 ',2504),(20,'2023-04-04 04:00:04.000000','2023-04-04 04:00:04.000000','admin@admin.com',_binary '\0','admin@admin.com','14 57 34 60 48 73 32 71 9 29 ',2505),(21,'2023-04-04 15:58:27.000000','2023-04-04 15:58:27.000000','admin@admin.com',_binary '\0','admin@admin.com','7 27 30 26 75 71 50 40 10 13 ',2495),(22,'2023-04-04 15:58:27.000000','2023-04-04 15:58:27.000000','admin@admin.com',_binary '\0','admin@admin.com','57 73 32 71 29 9 66 30 67 70 ',2496),(23,'2023-04-04 15:58:27.000000','2023-04-04 15:58:27.000000','admin@admin.com',_binary '\0','admin@admin.com','60 48 73 32 71 9 29 66 30 67 ',2497),(24,'2023-04-04 15:58:28.000000','2023-04-04 15:58:28.000000','admin@admin.com',_binary '\0','admin@admin.com','1 60 42 44 45 46 47 48 50 51 ',2498),(25,'2023-04-04 15:58:28.000000','2023-04-04 15:58:28.000000','admin@admin.com',_binary '\0','admin@admin.com','73 32 71 9 29 66 30 67 69 70 ',2499),(26,'2023-04-04 15:58:28.000000','2023-04-04 15:58:28.000000','admin@admin.com',_binary '\0','admin@admin.com','73 71 32 29 9 30 66 67 69 70 ',2501),(27,'2023-04-04 15:58:29.000000','2023-04-04 15:58:29.000000','admin@admin.com',_binary '\0','admin@admin.com','27 75 30 61 64 40 7 10 50 48 ',2502),(28,'2023-04-04 15:58:30.000000','2023-04-04 15:58:30.000000','admin@admin.com',_binary '\0','admin@admin.com','1 39 41 42 44 45 46 47 48 50 ',2503),(29,'2023-04-04 15:58:31.000000','2023-04-04 15:58:31.000000','admin@admin.com',_binary '\0','admin@admin.com','1 39 41 42 44 45 46 47 48 50 ',2504),(30,'2023-04-04 15:58:31.000000','2023-04-04 15:58:31.000000','admin@admin.com',_binary '\0','admin@admin.com','57 34 60 48 73 32 71 9 29 66 ',2505),(31,'2023-04-04 21:28:58.000000','2023-04-04 21:28:58.000000','admin@admin.com',_binary '\0','admin@admin.com','7 27 30 26 75 71 50 40 10 13 ',2495),(32,'2023-04-04 21:28:58.000000','2023-04-04 21:28:58.000000','admin@admin.com',_binary '\0','admin@admin.com','73 32 71 29 9 66 30 67 70 69 ',2496),(33,'2023-04-04 21:28:58.000000','2023-04-04 21:28:58.000000','admin@admin.com',_binary '\0','admin@admin.com','57 34 60 48 73 32 71 9 29 66 ',2497),(34,'2023-04-04 21:28:58.000000','2023-04-04 21:28:58.000000','admin@admin.com',_binary '\0','admin@admin.com','1 60 42 44 45 46 47 48 50 51 ',2498),(35,'2023-04-04 21:28:59.000000','2023-04-04 21:28:59.000000','admin@admin.com',_binary '\0','admin@admin.com','73 32 71 9 29 66 30 67 69 70 ',2499),(36,'2023-04-04 21:28:59.000000','2023-04-04 21:28:59.000000','admin@admin.com',_binary '\0','admin@admin.com','73 71 32 29 9 30 66 67 70 69 ',2501),(37,'2023-04-04 21:28:59.000000','2023-04-04 21:28:59.000000','admin@admin.com',_binary '\0','admin@admin.com','27 75 30 61 64 40 7 10 50 48 ',2502),(38,'2023-04-04 21:29:00.000000','2023-04-04 21:29:00.000000','admin@admin.com',_binary '\0','admin@admin.com','1 39 41 42 44 45 46 47 48 50 ',2503),(39,'2023-04-04 21:29:01.000000','2023-04-04 21:29:01.000000','admin@admin.com',_binary '\0','admin@admin.com','1 39 41 42 44 45 46 47 48 50 ',2504),(40,'2023-04-04 21:29:01.000000','2023-04-04 21:29:01.000000','admin@admin.com',_binary '\0','admin@admin.com','57 34 60 48 73 32 71 9 29 66 ',2505),(41,'2023-04-05 04:00:00.000000','2023-04-05 04:00:00.000000','admin@admin.com',_binary '\0','admin@admin.com','7 27 30 26 75 71 50 40 10 13 ',2495),(42,'2023-04-05 04:00:00.000000','2023-04-05 04:00:00.000000','admin@admin.com',_binary '\0','admin@admin.com','60 57 73 32 71 29 9 66 30 67 ',2496),(43,'2023-04-05 04:00:00.000000','2023-04-05 04:00:00.000000','admin@admin.com',_binary '\0','admin@admin.com','60 48 73 32 71 9 29 66 30 67 ',2497),(44,'2023-04-05 04:00:01.000000','2023-04-05 04:00:01.000000','admin@admin.com',_binary '\0','admin@admin.com','1 60 42 44 45 46 47 48 50 51 ',2498),(45,'2023-04-05 04:00:01.000000','2023-04-05 04:00:01.000000','admin@admin.com',_binary '\0','admin@admin.com','73 32 71 9 29 66 30 67 69 70 ',2499),(46,'2023-04-05 04:00:01.000000','2023-04-05 04:00:01.000000','admin@admin.com',_binary '\0','admin@admin.com','73 71 32 29 9 30 66 67 70 69 ',2501),(47,'2023-04-05 04:00:02.000000','2023-04-05 04:00:02.000000','admin@admin.com',_binary '\0','admin@admin.com','27 75 30 61 64 40 7 10 50 48 ',2502),(48,'2023-04-05 04:00:03.000000','2023-04-05 04:00:03.000000','admin@admin.com',_binary '\0','admin@admin.com','1 39 41 42 44 45 46 47 48 50 ',2503),(49,'2023-04-05 04:00:04.000000','2023-04-05 04:00:04.000000','admin@admin.com',_binary '\0','admin@admin.com','1 39 41 42 44 45 46 47 48 50 ',2504),(50,'2023-04-05 04:00:04.000000','2023-04-05 04:00:04.000000','admin@admin.com',_binary '\0','admin@admin.com','57 34 60 48 73 32 71 9 29 66 ',2505);
/*!40000 ALTER TABLE `recommendation_candy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-05  9:19:01
