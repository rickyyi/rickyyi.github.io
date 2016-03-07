-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.55-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema onlinefruitshop
--

CREATE DATABASE IF NOT EXISTS onlinefruitshop;
USE onlinefruitshop;

--
-- Definition of table `goods`
--

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(128) NOT NULL,
  `category` varchar(64) NOT NULL,
  `introduction` varchar(2048) DEFAULT NULL,
  `price` float NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `createTime` varchar(128) NOT NULL,
  `lastModifyTime` varchar(128) NOT NULL,
  `thumbnail` varchar(128) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `imageList` varchar(1028) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `goods`
--

/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`id`,`goodsName`,`category`,`introduction`,`price`,`stock`,`createTime`,`lastModifyTime`,`thumbnail`,`isDeleted`,`imageList`) VALUES 
 (1,'小红','fresh','新鲜上市的小红',12,66600,'2016-02-21 22:05:11','2016-02-22 23:36:39','所虐他',1,'c://logs,c://logs,c://logs,c://logs'),
 (2,'凤梨','fruit','来之澳大利亚',12,1000,'2016-02-22 22:00:05','2016-02-22 22:02:44','c://logs',1,'c://logs,c://logs,c://logs,c://logs'),
 (3,'凤梨','fruit','来之澳大利亚',12,0,'2016-02-22 22:00:13','2016-02-25 23:23:47','c://logs',1,'c://logs,c://logs,c://logs,c://logs'),
 (4,'小红','fruit','新鲜上市的小红',12,66600,'2016-02-28 17:55:06','2016-02-28 17:55:06','所虐他',1,'c://logs,c://logs,c://logs,c://logs'),
 (5,'小小红','fruit','新鲜上市的小红',12,66600,'2016-02-28 18:01:31','2016-02-28 18:03:32','所虐他',1,'c://logs,c://logs,c://logs,c://logs'),
 (6,'墨西哥牛油果','fruit','来自新西兰,绿色无污染',49,983,'2016-02-28 18:10:05','2016-03-06 13:31:34','http://cdn.fruitday.com/images/product_pic/4339/1/1-370x370-4339-BAAP9R9W.jpg',0,'http://img4.fruitday.com/up_images/20151106/14467802836722.jpg;\r\nhttp://img4.fruitday.com/up_images/20151106/14467802887158.jpg;\r\nhttp://img4.fruitday.com/up_images/20151106/14467802911753.jpg;\r\nhttp://img4.fruitday.com/up_images/20151106/14467802958511.jpg;\r\nhttp://img4.fruitday.com/up_images/20151106/14467802999133.jpg;\r\nhttp://img4.fruitday.com/up_images/20151106/14467803284992.jpg;\r\nhttp://img4.fruitday.com/up_images/20160127/14538886686074.jpg;\r\nhttp://img4.fruitday.com/up_images/20160127/14538886714623.jpg;\r\nhttp://img4.fruitday.com/up_images/20160127/14538886738394.jpg'),
 (7,'海南芒果','fruit','海南芒果（小台农）',49,9990,'2016-02-28 18:19:09','2016-03-02 22:21:57','http://cdn.fruitday.com/images/product_pic/3803/1/1-370x370-3803-17DYB5BD.jpg',0,'http://img9.fruitday.com/up_images/1423986621.jpg;\r\nhttp://img9.fruitday.com/up_images/1423986646.jpg;\r\nhttp://img9.fruitday.com/up_images/1423986666.jpg;\r\nhttp://img9.fruitday.com/up_images/1423986917.jpg;\r\nhttp://img9.fruitday.com/up_images/1423986938.jpg;\r\nhttp://img9.fruitday.com/up_images/20160201/14543157968321.jpg;\r\nhttp://img9.fruitday.com/up_images/20160201/14543157998519.jpg;\r\nhttp://img9.fruitday.com/up_images/20160201/14543158025613.jpg'),
 (8,'绿奇异果','fruit','佳沛意大利绿奇异果',49,451,'2016-02-28 18:22:19','2016-03-06 15:56:49','http://cdn.fruitday.com/images/product_pic/8528/1/1-370x370-8528-8CR8PFU5.jpg',0,'http://img7.fruitday.com/up_images/20151203/1449136037755.jpg;http://img6.fruitday.com/up_images/1397107026.jpg;\r\nhttp://img6.fruitday.com/up_images/1397106995.jpg'),
 (9,'玉菇甜瓜','fruit','精品玉菇甜瓜',39,994,'2016-02-29 22:02:27','2016-03-06 16:03:40','http://cdn.fruitday.com/images/product_pic/4046/1/1-370x370-4046-TH7FBHSB.jpg',0,''),
 (10,'台湾释迦','fruit','存储方法0°冷藏',99,1000,'2016-02-29 22:13:52','2016-02-29 22:29:51','http://cdn.fruitday.com/images/product_pic/8562/1/1-370x370-8562-77W32519.jpg',0,'http://img4.fruitday.com/up_images/20151118/14478384143822.jpg;http://img4.fruitday.com/up_images/20151118/14478384163176.jpg;http://img4.fruitday.com/up_images/20151118/14478384194546.jpg;http://img4.fruitday.com/up_images/20151118/14478384236774.jpg;http://img4.fruitday.com/up_images/20151118/14478384269748.jpg;http://img4.fruitday.com/up_images/20151126/14485287389822.jpg;http://img4.fruitday.com/up_images/20151118/1447838433143.jpg;http://img4.fruitday.com/up_images/20151118/14478384363520.jpg;http://img4.fruitday.com/up_images/20160122/14534355675401.jpg;http://img4.fruitday.com/up_images/20160122/14534355708055.jpg;http://img4.fruitday.com/up_images/20160122/14534355727292.jpg'),
 (11,'智利蓝莓','fruit','0°冷藏',139.9,1000,'2016-02-29 22:29:28','2016-02-29 22:29:28','http://cdn.fruitday.com/images/product_pic/6052/2/2-370x370-6052-X7569T34.jpg',0,'http://img2.fruitday.com/up_images/20151126/14485206343990.jpg;http://img2.fruitday.com/up_images/20151127/14486008676300.jpg;http://img2.fruitday.com/up_images/20151106/14467888587579.jpg;http://img2.fruitday.com/up_images/20151106/14467888629487.jpg;http://img2.fruitday.com/up_images/20151106/14467888668523.jpg;http://img2.fruitday.com/up_images/20151106/14467888712319.jpg'),
 (12,'凤梨','fruit','汁多味甜，香甜怡口',39,1000,'2016-02-29 22:33:40','2016-02-29 22:33:40','http://cdn.fruitday.com/images/product_pic/3265/1/1-370x370-3265-TXT5UP19.jpg',0,'http://img1.fruitday.com/up_images/1426657928.jpg;\r\nhttp://img1.fruitday.com/up_images/1426757828.jpg;\r\nhttp://img1.fruitday.com/up_images/1378367366.jpg;\r\nhttp://img1.fruitday.com/up_images/1428478607.jpg;\r\nhttp://img1.fruitday.com/up_images/1378367395.jpg;\r\nhttp://img1.fruitday.com/up_images/20160205/14546502896476.jpg'),
 (13,'葡萄柚','fruit',' 美国佛罗里达葡萄柚',39,500,'2016-02-29 22:37:08','2016-02-29 22:37:08','http://cdn.fruitday.com/images/product_pic/6682/1/1-370x370-6682-1RHFRW3U.jpg',0,'http://img4.fruitday.com/up_images/20160203/14544678108636.jpg;http://img4.fruitday.com/up_images/20160203/14544678124653.jpg;http://img4.fruitday.com/up_images/20160203/14544678144663.jpg;http://img4.fruitday.com/up_images/20160203/14544678157334.jpg;http://img4.fruitday.com/up_images/20160203/14544678179556.jpg;http://img4.fruitday.com/up_images/20160203/14544678198490.jpg;http://img4.fruitday.com/up_images/20160203/14544678207706.jpg'),
 (14,'四川枇杷','fruit','枝头的萌宝宝，只属于我的闪耀',39,400,'2016-02-29 22:40:34','2016-02-29 22:40:34','http://cdn.fruitday.com/images/product_pic/3171/1/1-370x370-3171-88RHW16A.jpg',0,'http://img2.fruitday.com/up_images/20151110/14471522968702.jpg;http://img2.fruitday.com/up_images/20151110/14471523007549.jpg;http://img2.fruitday.com/up_images/20151110/14471523047356.jpg;http://img2.fruitday.com/up_images/20151110/14471523086149.jpg;http://img2.fruitday.com/up_images/20151110/14471523129544.jpg;http://img2.fruitday.com/up_images/20151110/14471523166885.jpg'),
 (15,'库尔勒香梨','fruit','新疆库尔勒香梨',59,498,'2016-02-29 22:42:51','2016-03-01 23:02:49','http://cdn.fruitday.com/images/product_pic/7144/3/3-370x370-7144-CY68XYR2.jpg',0,'http://img9.fruitday.com/up_images/20151105/1446718124514.jpg;http://img9.fruitday.com/up_images/20151105/14467181283785.jpg;http://img9.fruitday.com/up_images/20151105/14467181324361.jpg;http://img9.fruitday.com/up_images/20151105/14467181371444.jpg;http://img9.fruitday.com/up_images/20151105/14467181417091.jpg;http://img9.fruitday.com/up_images/20151105/14467181462936.jpg');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;


--
-- Definition of table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsId` int(10) unsigned NOT NULL,
  `src` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;


--
-- Definition of table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `goodsId` int(10) unsigned NOT NULL,
  `orderCount` int(10) unsigned NOT NULL,
  `totalPrice` float NOT NULL,
  `createTime` varchar(64) NOT NULL,
  `lastModifyTime` varchar(64) NOT NULL,
  `orderStatus` varchar(64) NOT NULL,
  `expressNo` int(10) unsigned DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`,`userId`,`goodsId`,`orderCount`,`totalPrice`,`createTime`,`lastModifyTime`,`orderStatus`,`expressNo`,`isDeleted`) VALUES 
 (1,1,1,50,90,'2016-02-25 23:09:10','2016-02-25 23:09:10','等待收货',NULL,0),
 (2,3,3,50,50,'2016-02-25 23:10:30','2016-02-25 23:10:30','等待发货',NULL,0),
 (3,3,3,50,50,'2016-02-25 23:11:29','2016-02-25 23:11:29','等待发货',NULL,0),
 (4,3,3,50,50,'2016-02-25 23:14:11','2016-02-25 23:14:11','等待发货',NULL,0),
 (5,3,3,10,10,'2016-02-25 23:23:47','2016-02-25 23:23:47','等待发货',NULL,0),
 (6,3,8,1,49,'2016-03-01 22:13:05','2016-03-01 22:13:05','等待发货',NULL,0),
 (7,3,8,1,49,'2016-03-01 22:13:24','2016-03-01 22:13:24','等待发货',NULL,0),
 (8,3,8,10,490,'2016-03-01 22:13:43','2016-03-01 22:13:43','等待发货',NULL,0),
 (9,3,8,10,490,'2016-03-01 22:14:58','2016-03-01 22:14:58','等待发货',NULL,0),
 (10,3,8,1,49,'2016-03-01 22:16:03','2016-03-01 22:16:03','等待发货',NULL,0),
 (11,3,8,1,49,'2016-03-01 22:16:12','2016-03-01 22:16:12','等待发货',NULL,0),
 (12,3,9,1,39,'2016-03-01 22:16:39','2016-03-01 22:16:39','等待发货',NULL,0),
 (13,3,6,8,392,'2016-03-01 22:23:29','2016-03-01 22:23:29','等待发货',NULL,0),
 (14,3,6,1,49,'2016-03-01 22:37:11','2016-03-01 22:37:11','等待发货',NULL,0),
 (15,3,6,1,49,'2016-03-01 22:37:18','2016-03-01 22:37:18','等待发货',NULL,0),
 (16,3,6,1,49,'2016-03-01 22:38:38','2016-03-01 22:38:38','等待发货',NULL,0),
 (17,3,6,1,49,'2016-03-01 22:38:41','2016-03-01 22:38:41','等待发货',NULL,0),
 (18,3,6,1,49,'2016-03-01 22:38:49','2016-03-01 22:38:49','等待发货',NULL,0),
 (19,3,6,1,49,'2016-03-01 22:39:34','2016-03-01 22:39:34','等待发货',NULL,0),
 (20,3,6,1,49,'2016-03-01 22:42:30','2016-03-01 22:42:30','等待发货',NULL,0),
 (21,3,6,1,49,'2016-03-01 22:42:40','2016-03-01 22:42:40','等待发货',NULL,0),
 (22,3,15,1,59,'2016-03-01 22:52:54','2016-03-01 22:52:54','等待发货',NULL,0),
 (23,3,15,1,59,'2016-03-01 23:02:49','2016-03-01 23:02:49','等待发货',NULL,0),
 (24,3,8,5,245,'2016-03-02 22:19:48','2016-03-02 22:19:48','等待发货',NULL,0),
 (25,3,7,10,490,'2016-03-02 22:21:57','2016-03-02 22:21:57','等待发货',NULL,0),
 (26,3,6,1,49,'2016-03-06 13:31:34','2016-03-06 13:31:34','等待发货',NULL,0),
 (27,3,8,10,490,'2016-03-06 15:53:02','2016-03-06 15:53:02','等待发货',NULL,0),
 (28,4,8,10,490,'2016-03-06 15:56:49','2016-03-06 15:56:49','等待发货',NULL,0),
 (29,4,9,5,195,'2016-03-06 16:03:40','2016-03-06 16:03:40','等待发货',NULL,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleName` varchar(48) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`,`roleName`) VALUES 
 (1,'admin'),
 (2,'registered'),
 (3,'visitor');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `phone` varchar(128) NOT NULL,
  `address` varchar(1024) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `registerTime` varchar(128) NOT NULL,
  `lastUpdateTime` varchar(128) NOT NULL,
  `age` int(8) unsigned NOT NULL,
  `gender` varchar(32) NOT NULL DEFAULT 'male',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`username`,`password`,`userId`,`phone`,`address`,`isDeleted`,`registerTime`,`lastUpdateTime`,`age`,`gender`) VALUES 
 (1,'tom','123','0001','13122868630','上海市浦东新区',0,'','',0,''),
 (2,'yolanda','123','12','13212343212','上海市浦东新区',0,'2016-02-20 12:31:51','2016-02-20 12:31:51',12,'male'),
 (3,'ricky','123','2','13838017640','河南大学软件学院',0,'','2016-02-20 12:31:50',0,''),
 (4,'jerry','123456','2','13812321234','北京中关村',0,'','2016-02-20 12:31:51',0,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `roleId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`,`userId`,`roleId`) VALUES 
 (1,1,1),
 (2,2,2),
 (3,3,3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
