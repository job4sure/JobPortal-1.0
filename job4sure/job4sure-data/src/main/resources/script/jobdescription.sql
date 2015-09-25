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

/*Table structure for table `job_description` */

DROP TABLE IF EXISTS `job_description`;

CREATE TABLE `job_description` (
  `JOB_ID` int(11) NOT NULL auto_increment,
  `EDUCATION` varchar(50) default NULL,
  `EXPERIENCE` varchar(30) default NULL,
  `JOB_DESC` varchar(200) default NULL,
  `JOB_TITLE` varchar(25) default NULL,
  `JOB_VALID_DATE` varchar(10) default NULL,
  `NO_OF_CANDIDATES` int(11) default NULL,
  `POSTED_DATE` varchar(10) default NULL,
  `ROLE` varchar(30) default NULL,
  `SALARY` varchar(10) default NULL,
  `COMPANY_ID` int(11) default NULL,
  `JD_APPROVAL_STATUS_ID` int(11) default NULL,
  `MAX_SALARY_ID` int(11) default NULL,
  `MIN_SALARY_ID` int(11) default NULL,
  `MAX_EXPERIENCE_ID` int(11) default NULL,
  `MIN_EXPERIENCE_ID` int(11) default NULL,
  `CURRENT_CITY_ID` int(11) default NULL,
  PRIMARY KEY  (`JOB_ID`),
  KEY `FK_l0ciabh8itgm9y6ytotsb5xsd` (`COMPANY_ID`),
  KEY `FK_9uce1fx63sywssn52vrokv18e` (`JOB_ID`),
  KEY `FK_6nyo3xenc77f7hcmsb96x5ww` (`MAX_SALARY_ID`),
  KEY `FK_bxc9cqltf36ssvt6y37v50x1` (`MIN_SALARY_ID`),
  KEY `FK_sbarausmeh37x4x2t83lr52q6` (`JD_APPROVAL_STATUS_ID`),
  KEY `FK_tj2jgu7ulsq2yvrtqk6o2yk1t` (`MAX_EXPERIENCE_ID`),
  KEY `FK_pt0mnmyjowdk772hb1oe7pir5` (`MIN_EXPERIENCE_ID`),
  KEY `FKE64ECA7A3C41AD30` (`COMPANY_ID`),
  KEY `FKE64ECA7A68D1876E` (`CURRENT_CITY_ID`),
  CONSTRAINT `FKE64ECA7A68D1876E` FOREIGN KEY (`CURRENT_CITY_ID`) REFERENCES `city` (`CITY_ID`),
  CONSTRAINT `FKE64ECA7A3C41AD30` FOREIGN KEY (`COMPANY_ID`) REFERENCES `login` (`REGISTRATION_ID`),
  CONSTRAINT `FK_6nyo3xenc77f7hcmsb96x5ww` FOREIGN KEY (`MAX_SALARY_ID`) REFERENCES `salary` (`SALARY_ID`),
  CONSTRAINT `FK_bxc9cqltf36ssvt6y37v50x1` FOREIGN KEY (`MIN_SALARY_ID`) REFERENCES `salary` (`SALARY_ID`),
  CONSTRAINT `FK_pt0mnmyjowdk772hb1oe7pir5` FOREIGN KEY (`MIN_EXPERIENCE_ID`) REFERENCES `experience` (`EXPERIENCE_ID`),
  CONSTRAINT `FK_sbarausmeh37x4x2t83lr52q6` FOREIGN KEY (`JD_APPROVAL_STATUS_ID`) REFERENCES `jd_approval_status` (`JD_APPROVAL_STATUS_ID`),
  CONSTRAINT `FK_tj2jgu7ulsq2yvrtqk6o2yk1t` FOREIGN KEY (`MAX_EXPERIENCE_ID`) REFERENCES `experience` (`EXPERIENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `job_description` */

insert  into `job_description`(`JOB_ID`,`EDUCATION`,`EXPERIENCE`,`JOB_DESC`,`JOB_TITLE`,`JOB_VALID_DATE`,`NO_OF_CANDIDATES`,`POSTED_DATE`,`ROLE`,`SALARY`,`COMPANY_ID`,`JD_APPROVAL_STATUS_ID`,`MAX_SALARY_ID`,`MIN_SALARY_ID`,`MAX_EXPERIENCE_ID`,`MIN_EXPERIENCE_ID`,`CURRENT_CITY_ID`) values (1,'sdf','43','ds','sd','3',32,'2015/09/07','wre','234',2,NULL,NULL,NULL,NULL,NULL,NULL),(2,'e','3','sd','sad','453',34,'2015/09/07','ewr','34',2,NULL,NULL,NULL,NULL,NULL,NULL),(4,'435','435','sf','sad','35',325,'2015/09/07','fret','34',2,NULL,NULL,NULL,NULL,NULL,NULL),(5,'dsf','345','d','s','435',43,'2015/09/07','er','35',2,NULL,NULL,NULL,NULL,NULL,NULL),(6,'sfr','234','sdf','sd','325',432,'2015/09/07','ewr','234',2,NULL,NULL,NULL,NULL,NULL,NULL),(8,'ew','3','er','ser','35',34,'2015/09/07','er','32',2,NULL,NULL,NULL,NULL,NULL,NULL),(9,'r','23','sd','sdf','23',213,'2015/09/07','wqre','213',2,NULL,NULL,NULL,NULL,NULL,NULL),(10,'sefr','34','dfs','sdf','32',21,'2015/09/07','as','234',2,NULL,NULL,NULL,NULL,NULL,NULL),(11,'wdre','345','fsdf','dsf','324',32,'2015/09/08','wr','35',2,NULL,NULL,NULL,NULL,NULL,NULL),(12,'fews','34','eswdf','de','324',32324,'2015/09/08','sewfr','234',2,NULL,NULL,NULL,NULL,NULL,NULL),(13,'sde','34','sdf','sdf','234',43,'2015/09/08','sdfsa','23',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'s','432','fsaf','sd','342',34,'2015/09/08','sdf','34',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'sf','3','saf','sdf','34',235,'2015/09/08','safer','3',2,NULL,NULL,NULL,NULL,NULL,NULL),(16,'dsfe','sdf','dsretg','edsf','435',354,'2015/09/08','sf','45',2,NULL,NULL,NULL,NULL,NULL,NULL),(17,'dsfrg','435','esdfe','sdf','436',345,'2015/09/09','dsfg','54',2,NULL,NULL,NULL,NULL,NULL,NULL),(18,'ds','34','sdf','dmeenal','45',43,'2015/09/09','sdf','35',2,NULL,NULL,NULL,NULL,NULL,NULL),(19,'sf','sf','dewsf','df','fsf',34,'2015/09/10','sf',NULL,2,1,NULL,NULL,NULL,NULL,NULL),(20,'rtg','2','dsfg','dsf','435',35,'2015/09/10','etr',NULL,2,1,NULL,NULL,NULL,NULL,NULL),(21,'df',NULL,'dsg','dfcvg','945',123,'2015/09/11','dfg',NULL,2,1,1,1,1,2,NULL),(22,'sdfgs',NULL,'dsfg','dsf','324',3,'2015/09/12','dsf',NULL,2,1,1,1,1,1,NULL),(23,'sf',NULL,'df','dsf','235',34,'2015/09/12','sdf',NULL,2,1,1,1,1,1,NULL),(24,'BE',NULL,'j..jlk.j;lj;lj','sarfraj','09/01/2015',2,'2015/09/14','sasas',NULL,2,1,NULL,1,NULL,2,NULL),(25,'lkjlkj',NULL,'ljlkjlkjlk','sasasas','09/16/2015',2,'2015/09/14','sas',NULL,2,1,NULL,1,NULL,1,NULL),(26,'gfdg',NULL,'fdgfg','gdfg','09/01/2015',5,'2015/09/19','dfgfg',NULL,3,1,NULL,1,NULL,1,NULL),(27,'uy',NULL,'yuyu','jjjjjjjjjjjjjjj','09/02/2015',7,'2015/09/24','ghuyu',NULL,3,1,1,1,1,1,151),(28,'cvxcv',NULL,'tyuyutuu','yuyy','09/09/2015',8,'2015/09/24','fdgfdg',NULL,3,1,1,1,1,1,339),(29,'dfddg',NULL,'gfhgh','ghjgf','09/16/2015',88,'2015/09/24','fgff',NULL,3,1,1,1,1,1,300),(30,'dfdf',NULL,'dfd','df','09/17/2015',2,'2015/09/25','erf',NULL,3,1,6,2,4,7,517);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
