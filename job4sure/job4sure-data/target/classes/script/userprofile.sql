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

/*Table structure for table `userprofile` */

DROP TABLE IF EXISTS `userprofile`;

CREATE TABLE `userprofile` (
  `USERID` int(11) NOT NULL auto_increment,
  `INDUSTRY` varchar(255) default NULL,
  `STATE` varchar(255) default NULL,
  `ADDRESS` varchar(255) default NULL,
  `CITY` varchar(255) default NULL,
  `CURRENT_LOCATION` varchar(255) default NULL,
  `PREFFERED_LOCATION` varchar(255) default NULL,
  `REGISTRATION_ID` int(11) default NULL,
  `RESUME_TITLE` varchar(255) default NULL,
  `ROLE` varchar(255) default NULL,
  `SALARY` varchar(255) default NULL,
  `ZIP` varchar(255) default NULL,
  `DATE_OF_BIRTH` varchar(255) default NULL,
  PRIMARY KEY  (`USERID`),
  KEY `FK_j3l0eat83i2g73fu3y2f27fki` (`REGISTRATION_ID`),
  CONSTRAINT `FK_j3l0eat83i2g73fu3y2f27fki` FOREIGN KEY (`REGISTRATION_ID`) REFERENCES `login` (`REGISTRATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userprofile` */

insert into `userprofile` (`USERID`,`INDUSTRY`,`STATE`,`ADDRESS`,`CITY`,`CURRENT_LOCATION`,`PREFFERED_LOCATION`,`REGISTRATION_ID`,`RESUME_TITLE`,`ROLE`,`SALARY`,`ZIP`,`DATE_OF_BIRTH`) values (1,NULL,'ghfghf','indorewala','jj','jabalpur','delhi',1,'deepak','managere','50000','cghfgh','09/11/2015');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
