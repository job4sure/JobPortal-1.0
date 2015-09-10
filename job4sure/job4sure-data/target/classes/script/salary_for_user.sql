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

/*Table structure for table `salary_for_user` */

DROP TABLE IF EXISTS `salary_for_user`;

CREATE TABLE `salary_for_user` (
  `ID` int(11) NOT NULL auto_increment,
  `SALARY` varchar(30) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `salary_for_user` */

insert into `salary_for_user` (`ID`,`SALARY`) values (1,'10000'),(2,'50000'),(3,'100000'),(4,'500000'),(5,'1000000'),(6,'6000000'),(7,'7000000'),(8,'8000000');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
