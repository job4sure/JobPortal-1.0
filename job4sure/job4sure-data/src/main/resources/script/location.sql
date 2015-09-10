/*
SQLyog - Free MySQL GUI v5.17
Host - 5.0.24-community-nt : Database - jobportal
*********************************************************************
Server version : 5.0.24-community-nt
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `jobportal`;

USE `jobportal`;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `location` */

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `Id` int(11) NOT NULL auto_increment,
  `CURRENT_LOCATION` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `location` */

insert into `location` (`Id`,`CURRENT_LOCATION`) values (1,'bhopal'),(2,'indore'),(3,'jabalpur'),(4,'dewas'),(5,'khandawa'),(6,'jodhpur'),(7,'nepal'),(8,'mesure'),(9,'ratlam');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
