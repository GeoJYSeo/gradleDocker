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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `gds_price` decimal(12,4) NOT NULL,
  `gds_stock` int NOT NULL,
  `gds_desc` text COLLATE utf8mb4_bin NOT NULL,
  `reg_date` datetime NOT NULL,
  `up_date` datetime DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goods_category1_idx` (`category_id`),
  CONSTRAINT `fk_goods_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_image`
--

DROP TABLE IF EXISTS `goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_quantity` int NOT NULL,
  `goods_total_price` int DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `order_group_id` bigint DEFAULT NULL,
  `goods_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_detail_order1_idx` (`order_group_id`),
  KEY `fk_order_detail_goods1_idx` (`goods_id`),
  CONSTRAINT `fk_order_detail_goods1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `fk_order_detail_order1` FOREIGN KEY (`order_group_id`) REFERENCES `order_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `total_price` decimal(12,4) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `access` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `reg_date` datetime NOT NULL,
  `up_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-04  4:37:16
