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
INSERT INTO `category` VALUES (1,'N/A','N/A','N/A','2020-12-20 02:44:51'),(2,'ACTION','200','200','2020-12-27 01:32:04'),(3,'ADVENTURE','300','300','2020-12-27 01:32:16'),(4,'ACTION_1','201','200','2020-12-27 01:32:42'),(5,'ACTION_2','202','200','2020-12-27 01:32:54'),(6,'ADVENTURE_1','301','300','2020-12-27 01:33:09'),(7,'RPG','100','100','2021-01-26 03:38:43'),(8,'STRATEGY','400','400','2021-01-26 03:38:43'),(9,'FPS','500','500','2021-01-26 03:38:43'),(10,'PUZZLE','600','600','2021-01-26 03:38:43'),(11,'RACING','700','700','2021-01-26 03:38:43'),(12,'SPORTS','800','800','2021-01-26 03:38:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'Test Goodsaaaaaaaaaaaaaaaaaaaa','100',21320.0000,18,'test','2021-08-22 21:02:08','2021-08-26 00:58:24',7),(2,'Batman','200',3540.0000,3210480,'Batman Arkham Series','2021-08-25 22:52:02','2021-08-25 22:52:02',2),(3,'DarkSouls','201',6890.0000,80650,'DarkSouls','2021-08-25 22:53:16','2021-08-25 22:53:16',4),(4,'Star Wars JEDI Fallen Order','202',7890.0000,5060,'Star Wars JEDI Fallen Order Standard Edition','2021-08-25 23:02:13','2021-08-25 23:02:13',5),(5,'Fallout4','300',8056.0000,6021,'Fallout4 GOTY','2021-08-25 23:02:59','2021-08-25 23:02:59',3),(8,'Elder Scroll Skyrim','301',5654.0000,8977,'Elder Scroll Skyrim Special Edition','2021-08-25 23:40:59','2021-08-25 23:40:59',6),(9,'Assassin\'s Creed','300',1205.0000,562,'Assassin\'s Creed Series','2021-08-25 23:46:30','2021-08-25 23:46:30',3),(10,'Witcher','100',4502.0000,5648,'Witcher3 GOTY','2021-08-25 23:51:37','2021-08-25 23:51:37',7),(11,'Diablo2','100',7805.0000,56489,'Diablo2 Resurrected','2021-08-25 23:53:58','2021-08-25 23:53:58',7),(12,'StarCraft Remastered','400',5051.0000,21654,'StarCraft Remastered','2021-08-25 23:56:24','2021-08-25 23:56:24',8),(13,'Battle Field 2042','500',5462.0000,217892,'Battle Field 2042','2021-08-26 00:02:12','2021-08-26 00:02:12',9),(14,'Gears Of War 5','500',8450.0000,3215675,'Gears Of War 5','2021-08-26 00:02:53','2021-08-26 00:02:53',9),(15,'Far Cry','301',8945.0000,5462087,'Far Cry Series','2021-08-26 00:13:44','2021-08-26 00:13:44',6),(16,'Call Of Duty World War 2','500',8756.0000,560650,'Call Of Duty World War 2','2021-08-26 00:14:48','2021-08-26 00:14:48',9),(17,'Call Of Duty Modern Warfare','500',9050.0000,58795,'Call Of Duty Modern Warfare','2021-08-26 00:18:10','2021-08-26 00:18:10',9),(18,'Forza','700',7560.0000,123489,'Forza','2021-08-26 00:19:04','2021-08-26 00:19:04',11),(19,'The Crew 2','700',9805.0000,985068,'The Crew 2 Gold Edition','2021-08-26 00:28:23','2021-08-26 00:28:23',11),(20,'FIFA 21','800',6450.0000,674560,'FIFA 21','2021-08-26 00:29:38','2021-08-26 00:29:38',12),(21,'NBA 21K','800',9856.0000,5264231,'NBA 21K','2021-08-26 00:30:12','2021-08-26 00:30:12',12),(22,'Tetris','600',521.0000,999999999,'Tetris','2021-08-26 00:31:49','2021-08-26 00:31:49',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_image`
--

LOCK TABLES `goods_image` WRITE;
/*!40000 ALTER TABLE `goods_image` DISABLE KEYS */;
INSERT INTO `goods_image` VALUES (1,'none.jpg','none.jpg',NULL,NULL,NULL,1,'2021-08-22 21:02:08','2021-08-22 21:02:29',1),(2,'f9304b69-0f28-4397-ba62-5c75e7dada4e_1629899521','BatmanArkham.png',NULL,NULL,981907,0,'2021-08-25 22:52:02','2021-08-25 22:52:02',2),(3,'045c5d3d-bcba-4e31-9597-583eb7fc6e9f_1629899522','batmanarkhamknight1.jpg',NULL,NULL,89789,0,'2021-08-25 22:52:03','2021-08-25 22:52:03',2),(4,'59a7865f-93cc-4cb8-91a3-acf29a8d37d3_1629899596','darksouls.jpg',NULL,NULL,206853,0,'2021-08-25 22:53:17','2021-08-25 22:53:17',3),(5,'8080898f-ceb7-4039-8659-53321d683a78_1629900132','jedi.jpg',NULL,NULL,168859,0,'2021-08-25 23:02:13','2021-08-25 23:02:13',4),(6,'f76869de-675e-4103-b7a4-648a88fa08bf_1629900133','jedi2.jpg',NULL,NULL,276459,0,'2021-08-25 23:02:14','2021-08-25 23:02:14',4),(7,'a8e38f94-8c9f-4a2f-a9b5-7e1a003d8793_1629900179','fallout4.png',NULL,NULL,571884,0,'2021-08-25 23:03:00','2021-08-25 23:03:00',5),(14,'68b483f0-0022-416b-92db-d3676aa2cf1c_1629902458','Skyrim.jpg',NULL,NULL,562661,0,'2021-08-25 23:41:00','2021-08-25 23:41:00',8),(15,'b0858bad-5198-48f6-a7a1-bc0c4807c624_1629902459','skyrim2.jpg',NULL,NULL,254577,0,'2021-08-25 23:41:00','2021-08-25 23:41:00',8),(16,'1a7cc23a-68a2-4937-94e1-6932e9fc4c46_1629902460','skyrim3.png',NULL,NULL,1470492,0,'2021-08-25 23:41:01','2021-08-25 23:41:01',8),(18,'ea3aa4c5-7668-43e8-8cde-c8ba900b0cca_1629902790','Assassin.jpg',NULL,NULL,149211,0,'2021-08-25 23:46:31','2021-08-25 23:46:31',9),(19,'cb982361-149f-4f3a-bffe-41911b481eab_1629902790','assassins.jpg',NULL,NULL,184975,0,'2021-08-25 23:46:31','2021-08-25 23:46:31',9),(20,'d2c29703-b8bb-4ce1-aa78-7ed804afc907_1629903096','Witcher.jpg',NULL,NULL,137767,0,'2021-08-25 23:51:38','2021-08-25 23:51:38',10),(21,'0d429d46-d134-4c1e-af0d-a8ab3aa22846_1629903097','Witcher1.jpg',NULL,NULL,790981,0,'2021-08-25 23:51:38','2021-08-25 23:51:38',10),(22,'7f5591a2-1352-4e15-8ba6-2fe934cf58fe_1629903098','Witcher2.jpg',NULL,NULL,71321,0,'2021-08-25 23:51:39','2021-08-25 23:51:39',10),(23,'ac83e125-4ec6-4eab-a1c9-c9361967c7cc_1629903098','witcher3.png',NULL,NULL,969395,0,'2021-08-25 23:51:40','2021-08-25 23:51:40',10),(24,'2f469685-f6a5-4a0d-b416-1bf52b3478e4_1629903238','diablo-II-resurrected.jpg',NULL,NULL,1337775,0,'2021-08-25 23:53:59','2021-08-25 23:53:59',11),(25,'500405d8-57f4-4ca1-89f6-000e64b0a830_1629903383','startcraft.jpg',NULL,NULL,306928,0,'2021-08-25 23:56:24','2021-08-25 23:56:24',12),(26,'c6678d3c-96e0-4740-8630-873d4510d6cb_1629903732','battlefield.jpg',NULL,NULL,201119,0,'2021-08-26 00:02:13','2021-08-26 00:02:13',13),(27,'d1d43d4c-42d8-4eb3-a101-5c3e482e6d14_1629903732','battlefield2.png',NULL,NULL,833601,0,'2021-08-26 00:02:13','2021-08-26 00:02:13',13),(28,'98e12bdc-af2c-4360-8b16-961c56c7bdb9_1629903772','gears5.jpg',NULL,NULL,204815,0,'2021-08-26 00:02:53','2021-08-26 00:02:53',14),(29,'66de28c4-a5cf-402a-b49f-d8a86a0452b6_1629904424','FarCry.jpg',NULL,NULL,243718,0,'2021-08-26 00:13:45','2021-08-26 00:13:45',15),(30,'c781bfbe-e165-4690-8909-ad4e1468963c_1629904424','farcry4.jpg',NULL,NULL,614964,0,'2021-08-26 00:13:45','2021-08-26 00:13:45',15),(31,'890beac9-ec39-4dba-8bc2-81bd20c377d0_1629904425','farcry6.jpeg',NULL,NULL,191042,0,'2021-08-26 00:13:46','2021-08-26 00:13:46',15),(32,'8e3669f0-3056-4b52-b464-e02f90e7b7a5_1629904426','farcry62.jpg',NULL,NULL,166592,0,'2021-08-26 00:13:47','2021-08-26 00:13:47',15),(33,'43f097d5-100f-4192-bb5c-533cf9764f82_1629904426','farcry63.jpg',NULL,NULL,90289,0,'2021-08-26 00:13:47','2021-08-26 00:13:47',15),(34,'4cee0d89-0405-4ab6-bcf4-2cfe05d7370f_1629904488','WorldWar.jpg',NULL,NULL,138383,0,'2021-08-26 00:14:49','2021-08-26 00:14:49',16),(35,'5e1448d5-a417-491a-9f8c-90a0aceedc74_1629904689','callofduty1.jpg',NULL,NULL,106417,0,'2021-08-26 00:18:10','2021-08-26 00:18:10',17),(36,'20ef4145-2c79-4cbc-846c-a7195e5b63d0_1629904690','callofduty2.jpg',NULL,NULL,54237,0,'2021-08-26 00:18:11','2021-08-26 00:18:11',17),(37,'12ad8e3b-b1d2-4635-945e-f9772c447ba9_1629904690','callofduty3.jpg',NULL,NULL,119757,0,'2021-08-26 00:18:11','2021-08-26 00:18:11',17),(38,'80d30ad7-9c31-49ee-976e-9e7551e60c30_1629904743','forza.jpeg',NULL,NULL,506056,0,'2021-08-26 00:19:05','2021-08-26 00:19:05',18),(39,'37fe2cc6-4aca-4a8d-842d-c74e05a36737_1629905302','thecrew.jpg',NULL,NULL,214191,0,'2021-08-26 00:28:24','2021-08-26 00:28:24',19),(40,'aada3d5e-4801-46dc-8888-0bf18c0f10cf_1629905303','thecrew1.jpg',NULL,NULL,42379,0,'2021-08-26 00:28:24','2021-08-26 00:28:24',19),(41,'a48d6526-7184-4526-b56f-395e96b28bc1_1629905303','thecrew2.jpg',NULL,NULL,174192,0,'2021-08-26 00:28:24','2021-08-26 00:28:24',19),(42,'be3f4bbf-7eba-4cea-a60b-0b568255a4c2_1629905304','thecrew3.jpg',NULL,NULL,55457,0,'2021-08-26 00:28:25','2021-08-26 00:28:25',19),(43,'45ddcf18-aaf4-4f2f-b99e-7f1d1e6aaf4c_1629905304','thecrew4.jpg',NULL,NULL,119566,0,'2021-08-26 00:28:25','2021-08-26 00:28:25',19),(44,'c70c9ee7-5ff8-46f9-a0c4-81ffe2b903fd_1629905378','fifa21.jpg',NULL,NULL,112711,0,'2021-08-26 00:29:39','2021-08-26 00:29:39',20),(45,'514430bf-ff2c-4334-ae2b-70b152135504_1629905412','nba21k.jpeg',NULL,NULL,166786,0,'2021-08-26 00:30:13','2021-08-26 00:30:13',21),(46,'none.jpg','none.jpg',NULL,NULL,NULL,0,'2021-08-26 00:31:49','2021-08-26 00:31:49',22);
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
INSERT INTO `user` VALUES (1,'admin@example.com','$2a$10$.WPHaOiWFKVF4hXzbHNx/Oxao.MurvgfIU4YYa.a5ggE5zahfPW7y','test','admin','2003/June/3','0012578','NSW','Sydney','building 305','08012345678','ACTIVATED','ADMINISTRATOR','2021-08-26 00:56:03','2021-08-15 23:10:39','2021-08-25 22:42:06'),(2,'manager@example.com','$2a$10$y0IEPZDCjnDhN2kCZBkeyuGw43uqnENxie0azFGNCdGV.gpNrrR9K','test','manager','2004/May/6','0125487','QLD','Ayr','street 102','08098746512','ACTIVATED','MANAGER','2021-08-22 10:32:52','2021-08-16 02:22:04','2021-08-16 02:22:04'),(3,'member@example.com','$2a$10$ZBwKmFGCABW3TS66qodeBOhhryk7TPpopQvQLEchmgdmgD87UVEJO','test','member','1994/March/18','0235479','SA','ADELIDE','unit 302','09074562146','ACTIVATED','MEMBER','2021-08-26 00:32:31','2021-08-16 02:23:52','2021-08-16 02:23:52');
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

-- Dump completed on 2021-08-26  2:58:50
