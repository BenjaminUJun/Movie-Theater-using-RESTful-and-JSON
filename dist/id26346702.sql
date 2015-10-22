CREATE DATABASE  IF NOT EXISTS `id26346702`;
USE `id26346702`; 
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: id26346702
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `MovieName` varchar(255) NOT NULL,
  `Director` varchar(255) NOT NULL,
  `Producer` varchar(255) NOT NULL,
  `Stars` varchar(255) NOT NULL,
  `Writers` varchar(255) NOT NULL,
  `Rating` double(10,2) NOT NULL,
  `Rank` varchar(255) NOT NULL,
  `MovieGenre` varchar(255) NOT NULL,
  `Duration` int(10) NOT NULL,
  `GamePictureURL` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'No This Movie Information','Null','Null','Null','Null',0.00,'Null','Null',0,'images/404.jpg'),(2,'MONSTER HUNT','Raman Hui','Bill Kong','Baihe Bai, Boran Jing','Alan Yuen',7.20,'PG-13','Plot, Adventure, Fantasy',118,'http://jiangsu.china.com.cn/uploadfile/2015/0714/1436866253559543.jpg'),(3,'MONKEY KING: HERO IS BACK','Xiaopeng Tian','Zhijiang Liu, Hui Jiang','Wukong Sun, Shen Tang','Xiaopeng Tian',8.50,'PG-12','Fantasy, Cartoon',89,'http://imge.gmw.cn/attachement/jpg/site2/20150722/f04da226e54a1719572526.jpg'),(4,'PRIDE & PREJUDICE','Joe Wright','Tim Bevan','Keira Knightley, Matthew Macfadyen, Brenda Blethyn','Jane Austen',7.80,'PG',' Drama, Romance',129,'http://img21.mtime.cn/mg/2010/05/08/110306.93689474.jpg'),(5,'JURASSIC WORLD','Colin Trevorrow','Patrick Crowley, Frank Marshall','Chris Pratt, Bryce Dallas Howard, Ty Simpkins','Rick Jaffa',7.30,'PG-13','Action, Adventure, Sci-Fi',124,'http://i-7.vcimg.com/crop/530d21feb58704d2ac9a2c15d9984776235778%28600x%29/thumb.jpg'),(6,'YOKOMICHI YONOSUKE','Shuichi Okita','Toshikazu Nishigaya','Kengo Kora, Yuriko Yoshitaka','Shuichi Yoshida, Shiro Maeda',7.80,'G','Drama',160,'http://file.61kb.com/UploadFiles/images/2013/08/15/21-30/2013081521304382541176HengDaoShiZhiJie.jpg'),(7,'DEPARTURES','Yojiro Takita','Toshiaki Nakazawa','Masahiro Motoki, Ryoko Hirosue, Tsutomu Yamazaki','Kundo Koyama',8.10,'PG-13','Drama, Music',130,'http://www.hereisjapan.net/wp-content/uploads/2013/04/Okuribito.jpg'),(8,'SILVER LININGS PLAYBOOK','David O. Russell','Bruce Cohen','Bradley Cooper, Jennifer Lawrence, Robert De Niro','David O. Russell',7.80,'R','Comedy, Romance, Drama',122,'http://img31.mtime.cn/pi/2013/09/06/170129.41047636.jpg'),(9,'DALLAS BUYERS CLUB','Jean-Marc Vallee','Robbie Brenner','Matthew McConaughey, Jennifer Garner, Jared Leto','Craig Borten, Melisa Wallack',8.00,'R','Biography, Drama ',117,'http://pic.baike.soso.com/p/20140116/20140116102917-1908317921.jpg'),(10,'FURIOUS SEVEN','James Wan','Vin Diesel','Vin Diesel, Paul Walker, Dwayne Johnson','Chris Morgan, Gary Scott Thompson',7.50,'PG-13','Action, Crime, Thriller',137,'http://static1.businessinsider.com/image/544ea087ecad04e42c911e8c-1200-924/fast-and-furious-7-poster.jpg'),(11,'THE KING\'S SPEECH','Tom Hooper','Iain Canning','Colin Firth, Geoffrey Rush, Helena Bonham Carter','David Seidler',8.10,'R','Biography, Drama, History',118,'http://ff.topit.me/f/63/a1/11038445591a3a163fo.jpg');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-15 14:02:29
