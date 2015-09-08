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

/*Table structure for table `description_skills` */

DROP TABLE IF EXISTS `description_skills`;

CREATE TABLE `description_skills` (
  `JOB_ID` int(11) DEFAULT NULL,
  `SKILLS_ID` int(11) DEFAULT NULL,
  `DESCRIPTION_SKILLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`DESCRIPTION_SKILLS_ID`),
  KEY `JOB_ID` (`JOB_ID`),
  KEY `SKILLS_ID` (`SKILLS_ID`),
  CONSTRAINT `description_skills_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `job_description` (`JOB_ID`),
  CONSTRAINT `description_skills_ibfk_2` FOREIGN KEY (`SKILLS_ID`) REFERENCES `skills` (`SKILLS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
