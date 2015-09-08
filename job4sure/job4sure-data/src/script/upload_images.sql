/*
SQLyog Enterprise - MySQL GUI v7.15 
MySQL - 5.7.6-m16-log : Database - jobportal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`jobportal` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jobportal`;

/*Table structure for table `upload_images` */

DROP TABLE IF EXISTS `upload_images`;

CREATE TABLE `upload_images` (
  `UPLOAD_IMAGES_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROFILE_PIC` varchar(255) DEFAULT NULL,
  `RESUME` varchar(255) DEFAULT NULL,
  `UPLOAD_IMAGES_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UPLOAD_IMAGES_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
