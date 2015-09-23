/*
SQLyog Enterprise - MySQL GUI v8.14 
MySQL - 5.0.24-community-nt : Database - jobportal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jobportal` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jobportal`;

/*Table structure for table `companyprofile` */

DROP TABLE IF EXISTS `companyprofile`;

CREATE TABLE `companyprofile` (
  `COMPANYID` int(11) NOT NULL auto_increment,
  `DOMAIN` varchar(255) default NULL,
  `ABOUTUS` varchar(255) default NULL,
  `COMPANYADDRESS` varchar(255) default NULL,
  `COMPANYADDRESS2` varchar(255) default NULL,
  `COMPANYSIZE` varchar(255) default NULL,
  `COMPANYURL` varchar(255) default NULL,
  `REGISTRATION_ID` int(11) default NULL,
  `ZIPCODE` varchar(255) default NULL,
  `CURRENT_CITY_ID` int(11) default NULL,
  PRIMARY KEY  (`COMPANYID`),
  KEY `FK_nnfab67hkc3ofp6lfwgn1o2n0` (`REGISTRATION_ID`),
  KEY `FK7A7EB68C68D1876E` (`CURRENT_CITY_ID`),
  CONSTRAINT `FK7A7EB68C68D1876E` FOREIGN KEY (`CURRENT_CITY_ID`) REFERENCES `city` (`CITY_ID`),
  CONSTRAINT `FK_nnfab67hkc3ofp6lfwgn1o2n0` FOREIGN KEY (`REGISTRATION_ID`) REFERENCES `login` (`REGISTRATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `companyprofile` */

insert  into `companyprofile`(`COMPANYID`,`DOMAIN`,`ABOUTUS`,`COMPANYADDRESS`,`COMPANYADDRESS2`,`COMPANYSIZE`,`COMPANYURL`,`REGISTRATION_ID`,`ZIPCODE`,`CURRENT_CITY_ID`) values (1,'MANAGER','kjdsjsdj','asdasd','asdasdsad','5-10','sadasd',3,'457887',295);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
