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

/*Table structure for table `state` */

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `STATE_ID` int(11) NOT NULL auto_increment,
  `STATE` varchar(25) default NULL,
  PRIMARY KEY  (`STATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `state` */

insert into `state` (`STATE_ID`,`STATE`) values (1,'ANDAMAN AND NICOBAR ISLAN');
insert into `state` (`STATE_ID`,`STATE`) values (2,'ANDHRA PRADESH');
insert into `state` (`STATE_ID`,`STATE`) values (3,'ARUNACHAL PRADESH');
insert into `state` (`STATE_ID`,`STATE`) values (4,'ASSAM');
insert into `state` (`STATE_ID`,`STATE`) values (5,'BIHAR');
insert into `state` (`STATE_ID`,`STATE`) values (6,'CHATTISGARH');
insert into `state` (`STATE_ID`,`STATE`) values (7,'CHANDIGARH');
insert into `state` (`STATE_ID`,`STATE`) values (8,'DAMAN AND DIU');
insert into `state` (`STATE_ID`,`STATE`) values (9,'DELHI');
insert into `state` (`STATE_ID`,`STATE`) values (10,'DADRA AND NAGAR HAVELI');
insert into `state` (`STATE_ID`,`STATE`) values (11,'GOA');
insert into `state` (`STATE_ID`,`STATE`) values (12,'GUJARAT');
insert into `state` (`STATE_ID`,`STATE`) values (13,'HIMACHAL PRADESH');
insert into `state` (`STATE_ID`,`STATE`) values (14,'HARYANA');
insert into `state` (`STATE_ID`,`STATE`) values (15,'JAMMU AND KASHMIR');
insert into `state` (`STATE_ID`,`STATE`) values (16,'JHARKHAND');
insert into `state` (`STATE_ID`,`STATE`) values (17,'KERALA');
insert into `state` (`STATE_ID`,`STATE`) values (18,'KARNATAKA');
insert into `state` (`STATE_ID`,`STATE`) values (19,'LAKSHADWEEP');
insert into `state` (`STATE_ID`,`STATE`) values (20,'MEGHALAYA');
insert into `state` (`STATE_ID`,`STATE`) values (21,'MAHARASHTRA');
insert into `state` (`STATE_ID`,`STATE`) values (22,'MANIPUR');
insert into `state` (`STATE_ID`,`STATE`) values (23,'MADHYA PRADESH');
insert into `state` (`STATE_ID`,`STATE`) values (24,'MIZORAM');
insert into `state` (`STATE_ID`,`STATE`) values (25,'NAGALAND');
insert into `state` (`STATE_ID`,`STATE`) values (26,'ORISSA');
insert into `state` (`STATE_ID`,`STATE`) values (27,'PUNJAB');
insert into `state` (`STATE_ID`,`STATE`) values (28,'PONDICHERRY');
insert into `state` (`STATE_ID`,`STATE`) values (29,'RAJASTHAN');
insert into `state` (`STATE_ID`,`STATE`) values (30,'SIKKIM');
insert into `state` (`STATE_ID`,`STATE`) values (31,'TAMIL NADU');
insert into `state` (`STATE_ID`,`STATE`) values (32,'TRIPURA');
insert into `state` (`STATE_ID`,`STATE`) values (33,'UTTARAKHAND');
insert into `state` (`STATE_ID`,`STATE`) values (34,'UTTAR PRADESH');
insert into `state` (`STATE_ID`,`STATE`) values (35,'WEST BENGAL');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
