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
  `ZIP` varchar(255) default NULL,
  `DATE_OF_BIRTH` varchar(255) default NULL,
  `GENDER` varchar(255) default NULL,
  `MARITAL_STATUS` varchar(255) default NULL,
  `PHONE` varchar(255) default NULL,
  `MAX_EXPERIENCE_ID` int(11) default NULL,
  `MAX_SALARY_ID` int(11) default NULL,
  `MIN_EXPERIENCE_ID` int(11) default NULL,
  `MIN_SALARY_ID` int(11) default NULL,
  PRIMARY KEY  (`USERID`),
  KEY `FK_j3l0eat83i2g73fu3y2f27fki` (`REGISTRATION_ID`),
  KEY `FK_qcrv7s84dw50niu3li5fa0xip` (`MAX_EXPERIENCE_ID`),
  KEY `FK_l8gycvfmjus1mnvlor6rik4mv` (`MIN_EXPERIENCE_ID`),
  KEY `FK_9o9qu1buvhq3nvho6yf751o89` (`MAX_SALARY_ID`),
  KEY `FK_lpcbesi7swvnwjdmd55yxojy8` (`MIN_SALARY_ID`),
  CONSTRAINT `FK_9o9qu1buvhq3nvho6yf751o89` FOREIGN KEY (`MAX_SALARY_ID`) REFERENCES `salary` (`SALARY_ID`),
  CONSTRAINT `FK_j3l0eat83i2g73fu3y2f27fki` FOREIGN KEY (`REGISTRATION_ID`) REFERENCES `login` (`REGISTRATION_ID`),
  CONSTRAINT `FK_l8gycvfmjus1mnvlor6rik4mv` FOREIGN KEY (`MIN_EXPERIENCE_ID`) REFERENCES `experience` (`EXPERIENCE_ID`),
  CONSTRAINT `FK_lpcbesi7swvnwjdmd55yxojy8` FOREIGN KEY (`MIN_SALARY_ID`) REFERENCES `salary` (`SALARY_ID`),
  CONSTRAINT `FK_qcrv7s84dw50niu3li5fa0xip` FOREIGN KEY (`MAX_EXPERIENCE_ID`) REFERENCES `experience` (`EXPERIENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userprofile` */

insert into `userprofile` (`USERID`,`INDUSTRY`,`STATE`,`ADDRESS`,`CITY`,`CURRENT_LOCATION`,`PREFFERED_LOCATION`,`REGISTRATION_ID`,`RESUME_TITLE`,`ROLE`,`ZIP`,`DATE_OF_BIRTH`,`GENDER`,`MARITAL_STATUS`,`PHONE`,`MAX_EXPERIENCE_ID`,`MAX_SALARY_ID`,`MIN_EXPERIENCE_ID`,`MIN_SALARY_ID`) values (1,NULL,'ghfghf','indorewala','jj','null','null',1,'deepak','null','cghfgh','09/09/2015','Male','single','8982198449',NULL,NULL,1,0);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
