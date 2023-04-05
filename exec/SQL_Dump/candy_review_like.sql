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
-- Table structure for table `review_like`
--

DROP TABLE IF EXISTS `review_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_like` (
  `review_like_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `constructor` varchar(255) DEFAULT NULL,
  `is_delete` bit(1) NOT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `review_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`review_like_id`),
  KEY `review_id` (`review_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `review_like_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`),
  CONSTRAINT `review_like_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_like`
--

LOCK TABLES `review_like` WRITE;
/*!40000 ALTER TABLE `review_like` DISABLE KEYS */;
INSERT INTO `review_like` VALUES (1,'2023-04-01 23:35:20.138149','2023-04-01 23:35:20.138149','2723641995@candy.com',_binary '\0','2723641995@candy.com',1,2498),(2,'2023-04-01 23:40:10.771763','2023-04-02 00:44:46.198855','2723641995@candy.com',_binary '\0','2723641995@candy.com',45069,2498),(3,'2023-04-01 23:40:13.559280','2023-04-03 15:23:21.412268','2723641995@candy.com',_binary '\0','2723641995@candy.com',45070,2498),(4,'2023-04-01 23:40:14.351023','2023-04-02 09:27:06.115856','2723641995@candy.com',_binary '\0','2723641995@candy.com',45071,2498),(5,'2023-04-01 23:41:27.572662','2023-04-01 23:41:27.572662','2723641995@candy.com',_binary '\0','2723641995@candy.com',102,2498),(6,'2023-04-01 23:41:32.778599','2023-04-01 23:41:32.778599','2723641995@candy.com',_binary '\0','2723641995@candy.com',103,2498),(7,'2023-04-01 23:41:33.487640','2023-04-01 23:41:33.487640','2723641995@candy.com',_binary '\0','2723641995@candy.com',104,2498),(8,'2023-04-02 00:32:08.422137','2023-04-02 00:32:08.422137','2723641995@candy.com',_binary '\0','2723641995@candy.com',34989,2498),(9,'2023-04-02 09:40:25.635547','2023-04-03 15:23:07.332307','2723641995@candy.com',_binary '\0','2723641995@candy.com',45073,2498),(10,'2023-04-02 11:14:20.404547','2023-04-02 21:09:06.209434','2700411378@candy.com',_binary '\0','2700411378@candy.com',45073,2496),(11,'2023-04-02 16:23:18.693126','2023-04-02 16:23:18.693126','2723641995@candy.com',_binary '\0','2723641995@candy.com',45074,2498),(12,'2023-04-03 14:09:30.845510','2023-04-03 14:09:33.681484','2733434399@candy.com',_binary '','2733434399@candy.com',45075,2503),(13,'2023-04-03 14:09:32.141083','2023-04-03 14:09:32.141083','2733434399@candy.com',_binary '\0','2733434399@candy.com',45073,2503),(14,'2023-04-03 15:22:56.162380','2023-04-04 12:55:45.877258','2723641995@candy.com',_binary '','2723641995@candy.com',45075,2498),(15,'2023-04-03 15:22:59.656710','2023-04-04 09:23:15.165937','2723641995@candy.com',_binary '','2723641995@candy.com',45076,2498),(16,'2023-04-03 18:08:26.293111','2023-04-03 18:08:27.184873','2733469898@candy.com',_binary '','2733469898@candy.com',45075,2505),(17,'2023-04-03 18:08:30.336152','2023-04-03 18:08:39.922754','2733469898@candy.com',_binary '\0','2733469898@candy.com',45076,2505),(18,'2023-04-04 09:31:17.000692','2023-04-04 13:28:27.260108','2700411378@candy.com',_binary '','2700411378@candy.com',45076,2496),(19,'2023-04-04 14:23:52.847914','2023-04-04 14:23:52.847914','2729570439@candy.com',_binary '\0','2729570439@candy.com',45076,2501),(20,'2023-04-04 14:23:54.415801','2023-04-04 14:23:54.415801','2729570439@candy.com',_binary '\0','2729570439@candy.com',45075,2501);
/*!40000 ALTER TABLE `review_like` ENABLE KEYS */;
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
