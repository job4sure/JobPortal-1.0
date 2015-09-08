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

/*Table structure for table `job_description` */

DROP TABLE IF EXISTS `job_description`;

CREATE TABLE `job_description` (
  `JOB_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EDUCATION` varchar(50) DEFAULT NULL,
  `EXPERIENCE` varchar(30) DEFAULT NULL,
  `JOB_DESC` varchar(200) DEFAULT NULL,
  `JOB_LOCATION` varchar(30) DEFAULT NULL,
  `JOB_TITLE` varchar(25) DEFAULT NULL,
  `JOB_VALID_DATE` varchar(10) DEFAULT NULL,
  `NO_OF_CANDIDATES` int(11) DEFAULT NULL,
  `POSTED_DATE` varchar(10) DEFAULT NULL,
  `ROLE` varchar(30) DEFAULT NULL,
  `SALARY` varchar(10) DEFAULT NULL,
  `COMPANY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`),
  KEY `FK_l0ciabh8itgm9y6ytotsb5xsd` (`COMPANY_ID`),
  KEY `FK_9uce1fx63sywssn52vrokv18e` (`JOB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
