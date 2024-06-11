/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.25-MariaDB : Database - polling_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`polling_system` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `polling_system`;

/*Table structure for table `booths` */

DROP TABLE IF EXISTS `booths`;

CREATE TABLE `booths` (
  `booth_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `booth` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`booth_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `booths` */

insert  into `booths`(`booth_id`,`login_id`,`district_id`,`booth`) values 
(1,5,3,'Trikaripur'),
(2,15,4,'Kunathunadu'),
(3,23,5,'vimala school');

/*Table structure for table `candidates` */

DROP TABLE IF EXISTS `candidates`;

CREATE TABLE `candidates` (
  `candidate_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `election_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `candidate_status` varchar(100) DEFAULT NULL,
  `aadhar` varchar(100) DEFAULT NULL,
  `caste_certificate` varchar(1000) DEFAULT NULL,
  `income_certificate` varchar(1000) DEFAULT NULL,
  `Ration_card` varchar(1000) DEFAULT NULL,
  `Voter_id` varchar(1000) DEFAULT NULL,
  `Aadhar_Card` varchar(1000) DEFAULT NULL,
  `Non_criminal_certificate` varchar(1000) DEFAULT NULL,
  `payment_certificate` varchar(1000) DEFAULT NULL,
  `symbol_certificate` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`candidate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `candidates` */

insert  into `candidates`(`candidate_id`,`login_id`,`election_id`,`district_id`,`first_name`,`last_name`,`age`,`dob`,`place`,`city`,`state`,`phone`,`email`,`candidate_status`,`aadhar`,`caste_certificate`,`income_certificate`,`Ration_card`,`Voter_id`,`Aadhar_Card`,`Non_criminal_certificate`,`payment_certificate`,`symbol_certificate`) values 
(1,6,1,2,'Navaneeth','Ashok','25','1998-05-12','Perumbavoor','ERNAKULAM','Kerala','9876543210','abad@gmail.com','rejected','766010967316','IMG_20221112_190612.jpg','IMG_20221112_191107.jpg','IMG_20221112_191133.jpg','IMG_20221112_190612.jpg','766010967316','IMG_20221112_191133.jpg','IMG_20221112_191107.jpg','IMG_20221112_191133.jpg'),
(2,13,3,2,'Navaneeth','S','33','1990-09-02','Perumbavoor','ERNAKULAM','Kerala','9876543210','aravind123@gmail.com','accepted','static/img112ad378-d321-414d-8052-0dd7b9c8e7bfIMG_20221112_190612.jpg','static/img0e3ac3d6-9bf8-4b4e-9bb7-06dd8c7c8c7aIMG_20221112_191107.jpg','static/img95674186-d4e2-452c-b849-5f4bc2dfaff8IMG_20221112_191133.jpg','static/imgc770300e-c650-4189-bc22-0182c0b842d3IMG_20221112_191107.jpg','static/img45c4aa57-00aa-418b-b8e6-f8208960b7b3IMG_20221112_190612.jpg','static/img112ad378-d321-414d-8052-0dd7b9c8e7bfIMG_20221112_190612.jpg','static/img98c51569-7dbb-4856-bf00-dbac295b48ecIMG_20221112_191133.jpg','static/img867a7d5e-fb81-4e1a-9301-3f2cd78a752dIMG_20221112_191133.jpg','static/img47a293a8-c33b-451d-ab15-2d4e8df3fe92IMG_20221112_191133.jpg'),
(3,24,6,5,'AA','a','33','1990-06-01','vallom','ERNAKULAM','Kerala','9876543210','navaneeth351999@gmail.com','accepted','static/img7c91d187-d894-49e2-a5c1-148e6c0ada33IMG_20221112_191133.jpg','static/imge8645159-7887-4fb4-9bf1-856c2de25056IMG_20221112_191133.jpg','static/img4dace68e-d4b6-4bbf-805c-323bc39b1122IMG_20221112_191133.jpg','static/img492ed5c8-8310-4f72-9f20-d8cc2240696aIMG_20221112_191133.jpg','static/img103d710d-4ea3-496b-94ef-5c879836bda2IMG_20221112_191133.jpg','static/img7c91d187-d894-49e2-a5c1-148e6c0ada33IMG_20221112_191133.jpg','static/imgad6895f0-a717-430a-87e5-118a03c8c3b2IMG_20221112_191107.jpg','static/img3153113c-c17a-4571-82c5-41555d3cd371IMG_20221112_191133.jpg','static/img0906dd7a-1e5a-4a72-8428-3eedc2dac208IMG_20221112_191133.jpg'),
(4,25,6,3,'ss','d','35','1988-10-12','kalady','Angamali','Kerala','9847223652','abad@gmail.com','accepted','static/img65ae0052-5d0e-4667-a68b-ad53721ba152IMG_20221112_191133.jpg','static/imgf0652f05-f47e-4675-8f33-94c1549ab478IMG_20221112_191133.jpg','static/img9ef7ce40-fc99-4d8e-b3ad-ab1103560151IMG_20221112_191107.jpg','static/img120bcc3d-f14a-4c41-9c19-00b3c7413e0cIMG_20221112_191133.jpg','static/imgd7e49cf3-5d6c-494f-b963-9c2feb51c502IMG_20221112_191107.jpg','static/img65ae0052-5d0e-4667-a68b-ad53721ba152IMG_20221112_191133.jpg','static/img97614dc5-36f3-4846-88b0-b680ec0da4a1IMG_20221112_191107.jpg','static/imgecd6d84e-dc4d-40c6-819d-2b156ad05063IMG_20221112_190612.jpg','static/imgafb8b288-7e43-47e8-b0ea-c247690821faIMG_20221112_191133.jpg');

/*Table structure for table `districts` */

DROP TABLE IF EXISTS `districts`;

CREATE TABLE `districts` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `districts` */

insert  into `districts`(`district_id`,`login_id`,`district`) values 
(1,2,'Wayanad'),
(2,3,'Idukki'),
(3,4,'Kasargod'),
(5,22,'Ernakulam');

/*Table structure for table `elections` */

DROP TABLE IF EXISTS `elections`;

CREATE TABLE `elections` (
  `election_id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(100) DEFAULT NULL,
  `election_date` varchar(100) DEFAULT NULL,
  `declared_on` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`election_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `elections` */

insert  into `elections`(`election_id`,`body`,`election_date`,`declared_on`,`status`) values 
(6,'Legislative Assembly Election','2023-04-24','2023-04-22','started');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `login_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`login_type`) values 
(1,'admin','admin','admin'),
(2,'thavi12','thavi12','district'),
(3,'idukki1','idukki1','district'),
(4,'kasarkod1','kasarkod1','district'),
(5,'Trikaripur1','Trikaripur1','booth'),
(6,'navi','Navi44422','rejected'),
(7,'navi123','Navi4442@','voter_pending'),
(8,'navi123','Qwerty#123','voter_pending'),
(11,'navaneethashok','Qwerty#123','voter'),
(12,'v','v','voter'),
(13,'Na','Navi4442@','candidate'),
(22,'ekm','ekm','district'),
(15,'Kk','kk','booth'),
(16,'User1','User@123','voter_pending'),
(17,'user','User@123','voter'),
(18,'navaneethashdsadas','Sankar@112345','voter_pending'),
(19,'navaneethashdsadas','Sankar@112345','voter_pending'),
(20,'navaneethasdsadsa','Sankar@12345','voter_pending'),
(21,'aa','Sankar@12345','voter'),
(23,'vml','vml','booth'),
(24,'Aa','Navi4442@','candidate'),
(25,'ssd','Navi4442@','candidate'),
(26,'navi','Navi4442@','voter_pending'),
(27,'navi','Navi4442@','voter_pending'),
(28,'navi','Navi4442@','voter_pending'),
(29,'navi','Navi4442@','voter_pending'),
(30,'aa','Aa@123456','voter_pending'),
(31,'uu','Aa@12345678','voter_pending'),
(32,'Anju@9876','Anju@9876','voter_pending'),
(33,'hy','Aa@123456','voter'),
(34,'navaneethashok','Navi4442@','voter_pending'),
(35,'Navi','Navi4442@','voter_pending'),
(36,'Navi','Navi4442@','voter_pending'),
(37,NULL,NULL,NULL),
(38,'navaneethashok','Navi4442@','voter_pending');

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) DEFAULT NULL,
  `total_vote` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `result` */

/*Table structure for table `vote` */

DROP TABLE IF EXISTS `vote`;

CREATE TABLE `vote` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_time` varchar(100) DEFAULT NULL,
  `voter_id` int(11) DEFAULT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `hash_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `vote` */

insert  into `vote`(`vote_id`,`vote_time`,`voter_id`,`candidate_id`,`hash_value`) values 
(1,'2023-04-24 13:42:23',11,4,'cc6cca1f40db91a40c8cf9f97194ac310e598f3f72b81d5cf5e68acf');

/*Table structure for table `voters` */

DROP TABLE IF EXISTS `voters`;

CREATE TABLE `voters` (
  `voter_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `booth_id` int(11) DEFAULT NULL,
  `election_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `aadhar` varchar(100) DEFAULT NULL,
  `voter_id_number` varchar(100) DEFAULT NULL,
  `Voterid` varchar(1000) DEFAULT NULL,
  `aadhar_card` varchar(1000) DEFAULT NULL,
  `voter_image` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`voter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `voters` */

insert  into `voters`(`voter_id`,`login_id`,`booth_id`,`election_id`,`first_name`,`last_name`,`age`,`dob`,`place`,`city`,`state`,`phone`,`email`,`aadhar`,`voter_id_number`,`Voterid`,`aadhar_card`,`voter_image`) values 
(1,10,1,1,'Navaneeth','Ashok','24','1999-05-07','Alappuzha','ERNAKULAM','Kerala','3663669923','preethu@gmail.com','122365874623','UTh12365L','static/img43495603-4b79-4594-a106-3075f89ac40aIMG_20221112_191133.jpg','static/imgceffe353-b570-47a0-ad93-3bbb40764b1dIMG_20221112_191107.jpg',NULL),
(2,11,1,1,'Navaneeth','Ashok','24','1999-04-26','Alapuzha','ERNAKULAM','Kerala','3663669923','navaneeth351999@gmail.com','122365875657','UTh12365L','static/imga37fedf8-8b33-498c-9516-725b1eacc6eeIMG_20221112_191107.jpg','static/img9fc5bf76-f59f-4a30-a58e-2493ea55c95eIMG_20221112_191107.jpg',NULL),
(3,12,1,1,'Navaneeth','Ashok','26','1997-05-05','Perumbavoor','ERNAKULAM','Kerala','3663669923','preethu@gmail.com','766010967316','UTh12365L','static/img02043e43-63ab-4317-8fdf-8f3e6d7ef926IMG_20221112_191133.jpg','static/img8638aec8-3ee9-4a56-92ba-47799809e606IMG_20221112_191133.jpg',NULL),
(4,16,2,3,'AA','A','33','1990-08-09','Perumbavoor','ERNAKULAM','Kerala','3663669923','cvb@gmail.com','859652346569','UKT123DF','static/img7639052d-18ba-4ace-ad14-0efca61471a8IMG_20221112_191133.jpg','static/img70980935-f361-45b6-895c-972876ab69f2IMG_20221112_191133.jpg',NULL),
(5,17,2,3,'AA','A','33','1990-05-05','Perumbavoor','ERNAKULAM','Kerala','9847088994','ccvd@gmail.com','223366559988','UKT123DF','static/img17681911-aace-42da-ad5d-438683ac390cIMG_20221112_191133.jpg','static/imgf1c39a1e-ddd7-4e30-80b7-591d07ca42bbIMG_20221112_191133.jpg',NULL),
(6,19,1,1,'san','kar','23','2000-06-08','Alappuzha','ERNAKULAM','Kerala','9847088955','sample@gmail.com','747373737273','UTh12365L','static/imgefb2395c-2a2d-4661-bddf-b51434e05a21softcpy degree.jpg','static/img812f2ceb-f626-4949-9f53-803777ac96b3S4 fee receipt.jpg','pending'),
(7,20,1,4,'dsabbhj','bjbhjbhj','23','2000-06-07','Alapuzha','ERNAKULAM','Kerala','8663669923','navaneeth3fdfd@gmail.com','847389749837','UKT123DG','static/imga37fc355-4c80-45ce-b6f9-1d8e60e19de6softcpy degree.jpg','static/img5495339d-3947-44ce-96d7-c8e11994bdd3IMG_20221112_191107.jpg','pending'),
(8,21,2,5,'dshjhb','jhbjhbhjbhj','24','1999-11-02','dshjbhj','nbnbnbb','bbnbnbnbn','9846354235','hello4@gmail.com','942236117388','UKT123DZ','static/img46406ff3-0762-42b8-a0f6-3742fb49500csoftcpy degree.jpg','static/img4dd2f49e-e1eb-499b-8bd3-6adea69142faDCA(S).jpg','static/trainimages/21/99675362-df80-4915-8726-08fe037b04e5.jpg'),
(9,31,1,6,'oh','kjh',NULL,'2023-04-05','skjfn','kjfdn','sdjkbc','9877897899','eshcdfb@ecdfc.cdc','876678888777','8767888888888888','static/img0e5bf0ff-77e4-4871-a6d4-aaf8d49916d8IMG_20221112_190612.jpg','static/imgfb90aa18-062f-4a56-a179-5259028ac6eaIMG_20221112_191107.jpg','pending'),
(10,32,2,6,'anju','s',NULL,'1995-11-09','Ernakulam','kochi','Kerala','9988776655','navaneeth3519997@gmail.com','123456781234','UUT123DC','static/img0caee034-d22f-4b26-b41b-4ece68de686fsoftcpy degree.jpg','static/img115305ce-0e8e-4383-b1cd-0da3f1894611S4 fee receipt.jpg','static/trainimages/32/329dc1cd-64a7-4251-87cd-baf5785556a3.jpg'),
(11,33,1,6,'ksf','kjwhvf',NULL,'2023-04-19','dgkj','kdbvf','kfj','9877888777','jhvbfv@svfs.sdf','987888888899','234987293797','static/imgd0fdcf43-29ef-4e8c-bc38-334eb3d269c7IMG_20221112_190612.jpg','static/img060c196b-a0ec-4b1c-83c2-2549d1f192b6IMG_20221112_190612.jpg','static/trainimages/33/f8ed006d-7d4c-4f1d-bd40-a659bb7acf6f.jpg'),
(12,34,3,6,'Ss','D',NULL,'1990-05-02','Perumbavoor','ERNAKULAM','Kerala','9847088955','abad@gmail.com','123654789946','UKT123DF','static/img4860d158-f893-4956-8ede-75763ecf3272IMG_20221112_190612.jpg','static/img079b8173-9849-43df-95e8-585013106fd9IMG_20221112_191107.jpg','pending'),
(13,35,3,6,'AA','D',NULL,'1990-05-02','Perumbavoor','ERNAKULAM','Kerala','9962684512','abad@gmail.com','112336655489','UKT123DF','static/img7a13e609-9c80-4458-8fe4-55eb4b668ad7IMG_20221112_191133.jpg','static/img3c65712e-ee59-49c9-858f-fa7bc09b341bIMG_20221112_191107.jpg','static/trainimages/35/6fae3bab-235f-499f-9b08-65b44f673220.jpg'),
(14,36,3,6,'AA','D',NULL,'1990-05-02','Perumbavoor','ERNAKULAM','Kerala','9966332255','adcsx@gmail.com','774411225588','SDR1234F','static/imgaf053415-5f76-4c8c-85de-3ab00fd29ed4IMG_20221112_190612.jpg','static/img99656e96-1596-43a0-82e7-63b7a5ebbac2IMG_20221112_191133.jpg','static/trainimages/36/146f209e-2b0f-4816-a3ca-f3991343a321.jpg'),
(15,38,2,6,'AA','Ashok',NULL,'2023-04-29','Alappuzha','kd bq','dkfvb','3663669923','preethu@gmail.com','987678565745','UUT123DC','static/img39a335ff-f433-4e2a-9323-b4109b4b6cfbIMG_20221112_191133.jpg','static/img592e9b7b-0892-4a18-bcfd-b21ccc0c4af2IMG_20221112_191107.jpg','static/trainimages/38/c2832b7d-47a9-400b-b598-ff3b28184c35.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
