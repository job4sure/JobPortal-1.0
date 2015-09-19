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

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `USER_ROLE_ID` int(11) NOT NULL,
  `ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_roles` */

insert  into `user_roles`(`USER_ROLE_ID`,`ROLE`) values (1,'USER'),(2,'COMP');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
