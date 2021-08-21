-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gradlemall
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_quantity` int NOT NULL,
  `cart_price` decimal(20,4) NOT NULL,
  `reg_date` datetime NOT NULL,
  `up_date` datetime NOT NULL,
  `user_id` bigint NOT NULL,
  `goods_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_user1_idx` (`user_id`),
  KEY `fk_cart_goods1_idx` (`goods_id`),
  CONSTRAINT `fk_cart_goods1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `fk_cart_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `cate_code` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `cate_code_ref` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cate_code_UNIQUE` (`cate_code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'N/A','N/A','N/A','2020-12-20 02:44:51'),(2,'ACTION','200','200','2020-12-27 01:32:04'),(3,'ARCADE','300','300','2020-12-27 01:32:16'),(4,'ACTION_1','201','200','2020-12-27 01:32:42'),(5,'ACTION_2','202','200','2020-12-27 01:32:54'),(6,'ARCADE_1','301','300','2020-12-27 01:33:09'),(7,'RPG','100','100','2021-01-26 03:38:43'),(8,'BOARD','400','400','2021-01-26 03:38:43'),(9,'FPS','500','500','2021-01-26 03:38:43'),(10,'PUZZLE','600','600','2021-01-26 03:38:43'),(11,'RACING','700','700','2021-01-26 03:38:43'),(12,'SPORTS','800','800','2021-01-26 03:38:43');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8mb4_bin NOT NULL,
  `reg_date` datetime NOT NULL,
  `up_date` datetime DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `goods_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reply_user1_idx` (`user_id`),
  KEY `fk_reply_goods1_idx` (`goods_id`),
  CONSTRAINT `fk_reply_goods1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `fk_reply_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gds_name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `cate_code` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `gds_price` decimal(24,4) NOT NULL,
  `gds_stock` int NOT NULL,
  `gds_desc` text COLLATE utf8mb4_bin NOT NULL,
  `reg_date` datetime NOT NULL,
  `up_date` datetime DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goods_category1_idx` (`category_id`),
  CONSTRAINT `fk_goods_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_image`
--

DROP TABLE IF EXISTS `goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `img_name` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `ori_name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `gds_img` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `gds_thumb_img` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `img_size` int DEFAULT NULL,
  `img_flg` tinyint NOT NULL DEFAULT '1',
  `reg_date` datetime DEFAULT NULL,
  `up_date` datetime DEFAULT NULL,
  `goods_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goods_image_goods1_idx` (`goods_id`),
  CONSTRAINT `fk_goods_image_goods1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_image`
--

LOCK TABLES `goods_image` WRITE;
/*!40000 ALTER TABLE `goods_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_key`
--

DROP TABLE IF EXISTS `goods_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_key` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reg_key` varchar(100) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `reg_date` datetime NOT NULL,
  `up_date` datetime DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `order_detail_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goods_key_user1_idx` (`user_id`),
  KEY `fk_goods_key_order_detail1_idx` (`order_detail_id`),
  CONSTRAINT `fk_goods_key_order_detail1` FOREIGN KEY (`order_detail_id`) REFERENCES `order_detail` (`id`),
  CONSTRAINT `fk_goods_key_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_key`
--

LOCK TABLES `goods_key` WRITE;
/*!40000 ALTER TABLE `goods_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_quantity` int NOT NULL,
  `goods_total_price` decimal(24,4) NOT NULL,
  `reg_date` datetime NOT NULL,
  `order_group_id` bigint NOT NULL,
  `goods_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_detail_order1_idx` (`order_group_id`),
  KEY `fk_order_detail_goods1_idx` (`goods_id`),
  CONSTRAINT `fk_order_detail_goods1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `fk_order_detail_order1` FOREIGN KEY (`order_group_id`) REFERENCES `order_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_group`
--

DROP TABLE IF EXISTS `order_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_num` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `order_rcp` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `post_code` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `user_addr1` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `user_addr2` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `user_addr3` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `phone_num` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `total_price` decimal(24,4) NOT NULL,
  `total_quantity` int NOT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `order_status` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `order_date` datetime NOT NULL,
  `up_date` datetime DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum_UNIQUE` (`order_num`),
  KEY `fk_order_user1_idx` (`user_id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_group`
--

LOCK TABLES `order_group` WRITE;
/*!40000 ALTER TABLE `order_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `passwd` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `user_name` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `user_surname` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `birthday` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `post_code` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_addr1` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_addr2` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_addr3` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_num` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `access` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `reg_date` datetime NOT NULL,
  `up_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@example.com','$2a$10$.WPHaOiWFKVF4hXzbHNx/Oxao.MurvgfIU4YYa.a5ggE5zahfPW7y','test','admin','1989/December/3','0012578','NSW','Sydney','building 305','08012345678','ACTIVATED','ADMINISTRATOR','2021-08-20 21:58:09','2021-08-15 23:10:39','2021-08-16 01:46:32'),(2,'manager@example.com','$2a$10$y0IEPZDCjnDhN2kCZBkeyuGw43uqnENxie0azFGNCdGV.gpNrrR9K','test','manager','2004/May/6','0125487','QLD','Ayr','street 102','08098746512','ACTIVATED','MANAGER',NULL,'2021-08-16 02:22:04','2021-08-16 02:22:04'),(3,'member@example.com','$2a$10$ZBwKmFGCABW3TS66qodeBOhhryk7TPpopQvQLEchmgdmgD87UVEJO','test','member','1994/March/18','0235479','SA','ADELIDE','unit 302','09074562146','ACTIVATED','MEMBER',NULL,'2021-08-16 02:23:52','2021-08-16 02:23:52');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-22  8:39:21
