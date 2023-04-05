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
-- Table structure for table `preference`
--

DROP TABLE IF EXISTS `preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preference` (
  `preference_id` bigint NOT NULL AUTO_INCREMENT,
  `appearance` int NOT NULL,
  `aroma` int NOT NULL,
  `constructor` varchar(255) DEFAULT NULL,
  `is_delete` bit(1) NOT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `flavor` int NOT NULL,
  `mouthfeel` int NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`preference_id`),
  KEY `FKqu3gv3nodgwunw63mj8iv018j` (`user_id`),
  CONSTRAINT `FKqu3gv3nodgwunw63mj8iv018j` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preference`
--

LOCK TABLES `preference` WRITE;
/*!40000 ALTER TABLE `preference` DISABLE KEYS */;
INSERT INTO `preference` VALUES (1,2,3,'ac@naver.com',_binary '\0','ac@naver.com',4,1,2495,'2023-03-29 17:44:53.400591','2023-03-29 17:44:53.400591'),(2,1,4,'2700411378@candy.com',_binary '\0','2700411378@candy.com',2,3,2496,'2023-03-30 03:09:27.620372','2023-03-30 03:09:27.620372'),(3,3,2,'abc@naver.com',_binary '\0','abc@naver.com',1,4,2497,'2023-03-30 03:09:54.000538','2023-03-30 03:09:54.000538'),(4,3,2,'2723641995@candy.com',_binary '\0','2723641995@candy.com',4,1,2498,'2023-03-30 03:10:11.975108','2023-03-30 03:10:11.975108'),(14,2,4,'2700411378@candy.com',_binary '\0','2700411378@candy.com',1,3,2496,'2023-03-31 17:20:19.866096','2023-03-31 17:20:19.866096'),(15,1,2,'2729570439@candy.com',_binary '\0','2729570439@candy.com',4,3,2501,'2023-03-31 17:48:39.716214','2023-03-31 17:48:39.716214'),(16,4,2,'2729907287@candy.com',_binary '\0','2729907287@candy.com',1,3,2502,'2023-03-31 20:25:13.816165','2023-03-31 20:25:13.816165'),(17,4,2,'2733434399@candy.com',_binary '\0','2733434399@candy.com',3,1,2503,'2023-04-03 14:01:23.826628','2023-04-03 14:01:23.826628'),(18,3,2,'2733471329@candy.com',_binary '\0','2733471329@candy.com',1,4,2504,'2023-04-03 14:27:54.820002','2023-04-03 14:27:54.820002'),(19,3,2,'2733469898@candy.com',_binary '\0','2733469898@candy.com',1,4,2505,'2023-04-03 18:07:58.864455','2023-04-03 18:07:58.864455');
/*!40000 ALTER TABLE `preference` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-05  9:19:03
