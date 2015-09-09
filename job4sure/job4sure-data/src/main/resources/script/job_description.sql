/*
SQLyog Enterprise - MySQL GUI v8.14 
MySQL - 5.7.6-m16-log : Database - jobportal
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
  `COMPANY_ID` int(11) DEFAULT NULL,
  `MIN_SALARY_ID` int(50) DEFAULT NULL,
  `MAX_SALARY_ID` int(50) DEFAULT NULL,
  `JD_APPROVAL_STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`),
  KEY `FK_l0ciabh8itgm9y6ytotsb5xsd` (`COMPANY_ID`),
  KEY `FK_bxc9cqltf36ssvt6y37v50x1` (`MIN_SALARY_ID`),
  KEY `FK_6nyo3xenc77f7hcmsb96x5ww` (`MAX_SALARY_ID`),
  CONSTRAINT `FK_l0ciabh8itgm9y6ytotsb5xsd` FOREIGN KEY (`COMPANY_ID`) REFERENCES `login` (`REGISTRATION_ID`),
  CONSTRAINT `job_description_ibfk_1` FOREIGN KEY (`MIN_SALARY_ID`) REFERENCES `salary` (`SALARY_ID`),
  CONSTRAINT `job_description_ibfk_2` FOREIGN KEY (`MAX_SALARY_ID`) REFERENCES `salary` (`SALARY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
