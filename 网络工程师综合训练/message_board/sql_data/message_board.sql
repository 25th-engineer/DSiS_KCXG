-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: message
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `from_user` varchar(255) DEFAULT NULL,
  `to_user` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `message_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (55,'UCI soybean数据集','从实验结果可知，对于UCI soybean数据集，各项指标与初始化随机数的关系大致为：初始化随机数从1增长至2时，各项指标均上升明显，超过20%；初始化随机数从2增长至3时，各项指标均有明显程度的下降；其中准确率下降较小；初始化随机数从3增长至4时，除准确率大致持平外，其余三项指标均有3%~5%的上升；初始化随机数从4增长至5时，各项指标均有超过明显的下降，其中召回率下降达13%；初始化随机数从5增长至6时，各项指标均上升，其中准确率上升程度为8.1%，精确率上升程度是19.5%，召回率与f1上升几乎持平','1',NULL,'2020-11-14 07:22:40',1,1,NULL),(56,'','df','1',NULL,'2020-11-14 07:37:05',1,1,NULL),(59,'迪迦奥特曼','测试一下','2',NULL,'2020-12-29 12:42:09',1,1,NULL),(58,'蒟蒻','好好学习，天天向上！','2',NULL,'2020-12-29 12:41:35',2,1,NULL),(60,'管理员1','管理员测试','1',NULL,'2020-12-29 12:46:41',1,1,NULL),(61,'1','又测试','1',NULL,'2020-12-29 13:47:01',1,1,NULL),(62,'plk','66666','1','2','2020-12-29 13:47:30',1,3,59),(63,'验收啊','马上要验收了！','2',NULL,'2020-12-30 00:26:22',1,1,NULL),(66,' 定理3(归纳证明原理) ','（仅登录可见）设P(n)是关于自然数n的一种性质或命题.如果当n=e时,P(e)成立以及由P(n)成立必可推出P(n+)成立,那么P(n)对所有的n∈N都成立.','3',NULL,'2020-12-30 01:24:43',2,1,NULL),(65,'合肥工业大学宣城校区2020年《操作系统》课程设计（《系统软件综合设计——操作系统》）',' 段页式虚拟存储管理系统：建立一个段页虚拟存储管理系统的模型。（1-2 人，难度：4）\r\n\r\n  首先分配一片较大的内存空间和一段磁盘空间，作为程序运行的可用存储空间和外存兑换区；\r\n\r\n  •建立应用程序的模型，包括分段结构在内；\r\n\r\n  •建立进程的基本数据结构及相应算法；\r\n\r\n  •建立管理存储空间的基本存储结构；\r\n\r\n  •建立管理段页的基本数据结构与算法；\r\n\r\n  •设计存储空间的分配与回收算法；\r\n\r\n  •实现缺页中段支持的逻辑地址到物理地址转换，实现虚拟存储器；\r\n\r\n  •提供信','3',NULL,'2020-12-30 01:22:57',1,1,NULL),(67,'无情的评论机器','66666666！','2','3','2020-12-30 01:32:07',1,3,65),(70,'1111','11111111111111111111','1','2','2021-01-12 10:58:18',1,2,67),(72,'君君','登陆可见！','4',NULL,'2021-01-13 08:03:04',2,1,NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `telephone` varchar(255) DEFAULT NULL COMMENT '手机',
  `blog` varchar(255) DEFAULT NULL COMMENT '博客',
  `qq` varchar(255) DEFAULT NULL COMMENT 'QQ',
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信',
  `weibo` varchar(255) DEFAULT NULL COMMENT '微博',
  `id_public` tinyint(1) DEFAULT NULL,
  `email_public` tinyint(1) DEFAULT NULL,
  `realname_public` tinyint(1) DEFAULT NULL,
  `telephone_public` tinyint(1) DEFAULT NULL,
  `blog_public` tinyint(1) DEFAULT NULL,
  `qq_public` tinyint(1) DEFAULT NULL,
  `wechat_public` tinyint(1) DEFAULT NULL,
  `weibo_public` tinyint(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0' COMMENT '是否为管理员',
  `forbid` varchar(255) DEFAULT '' COMMENT '禁言 -1 永久',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'u25th_engineer@163.com','Utah Xef','18856302551','123456789012345123456789012345','2046195761','u25th_engineer','https://weibo.com/25thEngineer',1,0,1,1,1,1,1,1,'46f94c8de14fb36680850768ff1b7f2a',1,''),(2,'uath@123.com','','','','592551037','','',1,1,0,0,0,1,0,0,'46f94c8de14fb36680850768ff1b7f2a',0,''),(3,'aoteman@123.com','奥特曼','','','2046195761','iShi_qian','',1,0,0,0,0,1,1,0,'46f94c8de14fb36680850768ff1b7f2a',0,'');
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

-- Dump completed on 2021-01-19 14:10:48
