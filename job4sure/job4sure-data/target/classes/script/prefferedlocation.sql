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

/*Table structure for table `prefferedlocation` */

DROP TABLE IF EXISTS `prefferedlocation`;

CREATE TABLE `prefferedlocation` (
  `ID` int(11) NOT NULL auto_increment,
  `PREFFERED_LOCATION` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prefferedlocation` */

insert into `prefferedlocation` (`ID`,`PREFFERED_LOCATION`) values (1,'pune'),(2,'delhi'),(3,'banglore'),(4,'indore'),(5,'mumbai');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
