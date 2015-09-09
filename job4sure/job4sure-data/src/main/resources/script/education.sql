/*
SQLyog Enterprise - MySQL GUI v8.14 
MySQL - 5.0.24-community-nt : Database - jobportal
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

/*Table structure for table `education` */

DROP TABLE IF EXISTS `education`;

CREATE TABLE `education` (
  `GRADUATION` varchar(40) default NULL,
  `EDUCATION` varchar(40) default NULL,
  `SPECIALIZATION` varchar(40) default NULL,
  `INSTITUTE` varchar(40) default NULL,
  `YEAR` varchar(40) default NULL,
  `REGISTRATION_ID` int(40) default NULL,
  `EDUCATION_ID` int(40) NOT NULL auto_increment,
  `POSTGRADUATION` varchar(40) default NULL,
  `POSTSPECIALIZATION` varchar(40) default NULL,
  `POSTINSTITUTE` varchar(40) default NULL,
  `POSTYEAR` varchar(40) default NULL,
  `POSTEDUCATION` varchar(40) default NULL,
  `DOCTORATE` varchar(40) default NULL,
  `DOC_SPECIALIZATION` varchar(40) default NULL,
  `DOC_INSTITUTE` varchar(40) default NULL,
  `DOC_YEAR` varchar(40) default NULL,
  `DOC_EDUCATION` varchar(40) default NULL,
  PRIMARY KEY  (`EDUCATION_ID`),
  KEY `FK_o49i9vmoq70n7i0tdx2h149lb` (`REGISTRATION_ID`),
  CONSTRAINT `FK_o49i9vmoq70n7i0tdx2h149lb` FOREIGN KEY (`REGISTRATION_ID`) REFERENCES `login` (`REGISTRATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `education` */

insert  into `education`(`GRADUATION`,`EDUCATION`,`SPECIALIZATION`,`INSTITUTE`,`YEAR`,`REGISTRATION_ID`,`EDUCATION_ID`,`POSTGRADUATION`,`POSTSPECIALIZATION`,`POSTINSTITUTE`,`POSTYEAR`,`POSTEDUCATION`,`DOCTORATE`,`DOC_SPECIALIZATION`,`DOC_INSTITUTE`,`DOC_YEAR`,`DOC_EDUCATION`) values ('BSc','Part Time','Agriculture','LPU','2015',1,40,'ME/MTECH','Aviation','LPU','2012','Correspondance/Distance learning','MPHIL','Automobile','IIT','2015','Part Time');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
