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

/*Table structure for table `attachment` */

DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `attachment` (
  `ATTACHMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ATTACHMENT_NAME` varchar(255) DEFAULT NULL,
  `PATH` varchar(255) DEFAULT NULL,
  `PROFILE_PIC` int(11) DEFAULT NULL,
  `REGISTRATION_ID` int(11) DEFAULT NULL,
  `RESUME` int(11) DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
