/*
SQLyog Enterprise - MySQL GUI v8.14 
MySQL - 5.5.24 : Database - jobportal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jobportal` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jobportal`;

/*Table structure for table `jd_approval_status` */

DROP TABLE IF EXISTS `jd_approval_status`;

CREATE TABLE `jd_approval_status` (
  `JD_APPROVAL_STATUS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `JD_APPROVAL_STATUS` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`JD_APPROVAL_STATUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `jd_approval_status` */

insert  into `jd_approval_status`(`JD_APPROVAL_STATUS_ID`,`JD_APPROVAL_STATUS`) values (1,'pending'),(2,'approval');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
