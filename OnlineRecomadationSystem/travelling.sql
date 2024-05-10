# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     travelling
# Server version:               5.1.73-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2020-03-24 21:42:56
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for travelling
CREATE DATABASE IF NOT EXISTS `travelling` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `travelling`;


# Dumping structure for table travelling.bankinfo
CREATE TABLE IF NOT EXISTS `bankinfo` (
  `User` text,
  `BankName` text,
  `AccountNo` text,
  `pin` text,
  `Currentbalance` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table travelling.bankinfo: 2 rows
/*!40000 ALTER TABLE `bankinfo` DISABLE KEYS */;
INSERT INTO `bankinfo` (`User`, `BankName`, `AccountNo`, `pin`, `Currentbalance`) VALUES ('suhas', 'Bank Of India', '9448758562', '1456', '1.2345580672E10'), ('marisha', 'Bank Of Maharashtra', '1234567890', '1234', '750');
/*!40000 ALTER TABLE `bankinfo` ENABLE KEYS */;


# Dumping structure for table travelling.book
CREATE TABLE IF NOT EXISTS `book` (
  `Id` int(11) NOT NULL,
  `name` text,
  `address` text,
  `gender` text,
  `contact` text,
  `email` text,
  `fromadd` text,
  `toadd` text,
  `bdate` text,
  `seat` text,
  `amt_paid` text,
  `flag` int(10) DEFAULT NULL,
  `transport_type` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table travelling.book: 7 rows
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`Id`, `name`, `address`, `gender`, `contact`, `email`, `fromadd`, `toadd`, `bdate`, `seat`, `amt_paid`, `flag`, `transport_type`) VALUES (1, 'suhas', 'pune', 'Male', '9404057557', 'suhasjadhav93@gmail.com', 'Aasangao', 'Pune', '11 April 2018', '2', '350.0', 1, NULL), (2, 'suhas', 'pune', 'Male', '9404057557', 'suhas', 'Nasik', 'Pune', '07 February 2020', '65', '97500.0', 1, NULL), (3, 'suhas', 'pune', 'Male', '9404057557', 'suhas', 'Pune', 'Nasik', '07 February 2020', '2', '500.0', 1, NULL), (4, 'marisha', 'pune', 'Female', '9404057557', 'suhasjadhav93@gmai', 'Pune', 'Nasik', '07 February 2020', '1', '250.0', 1, NULL), (5, 'suhas', 'pune', 'Male', '9404057557', 'suhasjadhav93@gmail.com', 'Pune', 'Nasik', '25 March 2020', '1', '250.0', 1, ''), (6, 'suhas', 'pune', 'Male', '9404057557', 'suhasjadhav93@gmail.com', 'Pune', 'Nasik', '25 March 2020', '1', '250.0', 0, ''), (7, 'suhas', 'pune', 'Male', '9404057557', 'suhasjadhav93@gmail.com', 'Pune', 'Nasik', '25 March 2020', '1', '250.0', 1, ''), (8, 'suhas', 'pune', 'Male', '9404057557', 'suhasjadhav93@gmail.com', 'Pune', 'Nasik', '25 March 2020', '2', '500.0', 1, '');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;


# Dumping structure for table travelling.information
CREATE TABLE IF NOT EXISTS `information` (
  `UserName` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Gender` varchar(100) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `MobNo` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table travelling.information: 2 rows
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` (`UserName`, `Address`, `City`, `Gender`, `EmailId`, `MobNo`, `Password`) VALUES ('suhas', 'pune', 'pune', 'Male', 'suhasjadhav93@gmail.com', '9404057557', 'Suhas@123'), ('marisha', 'pune', 'pune', 'Female', 'yadavmarisha09@gmail.com', '8220347095', 'admin');
/*!40000 ALTER TABLE `information` ENABLE KEYS */;


# Dumping structure for table travelling.localpmtroute
CREATE TABLE IF NOT EXISTS `localpmtroute` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `src` text,
  `dest` text,
  `points` text,
  `routeno` text,
  `distance` text,
  `time` text,
  `price` double DEFAULT NULL,
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

# Dumping data for table travelling.localpmtroute: 12 rows
/*!40000 ALTER TABLE `localpmtroute` DISABLE KEYS */;
INSERT INTO `localpmtroute` (`Id`, `src`, `dest`, `points`, `routeno`, `distance`, `time`, `price`) VALUES (7, 'katraj', 'shivajinagar', 'Bibvevadi - YC garden - Bajirao road - swami vivekanand road', '1', '10.2 km', '37 min', 15), (8, 'katraj', 'shivajinagar', 'Bibvevadi - YC garden - Bajirao road - Deccan gymkhana', '2', '10.2 km ', '37 min', 15), (9, 'Sangavi', 'shivajinagar', 'new sangavi - Breman chauk - University - Shivajinagar', '1', '9 km', '20 min', 10), (10, 'Sangavi', 'shivajinagar', 'new sangavi - Aundh - baner road - University - Shivajinagar', '2', '14 km', '40 min', 15), (11, 'Chinchvad', 'shivajinagar', 'dangechauk - kalewadi - sangavi phata - Breman chauk - University - Shivajinagar', '1', '25 km', '1 hr 20 min', 25), (12, 'Chinchvad', 'shivajinagar', 'dangechauk - kalewadi - sangavi phata- Aundh - baner road - University - Shivajinagar', '2', '31 km', '1 hr 40 min', 35), (13, 'katraj', 'Viman Nagar', 'bibvevadi - Lulla nagar - Camp - vasani nagar - Aadarsh nagar', '1', '19.2 km', '57 min', 20), (14, 'katraj', 'Viman Nagar', 'Bibvevadi - Maharshi nagar -Camp - Koregao park - Airforce Area', '2', '18.7 km', '55 min', 20), (15, 'Sangavi', 'Viman Nagar', 'Dapodi - Phugevadi - Khadaki - Yerawada ', '1', '16.3 km', '40 min', 20), (16, 'Sangavi', 'Viman Nagar', 'Old Sangavi - Pune University - Khadaki - bund garden - sakore nagar', '2', '15.1 km', '39 min', 20), (17, 'Chinchvad', 'Viman Nagar', 'Kasarwadi - Khadaki - Asjok Nagar - Nagapur chaul', '1', '20 km', '44 min', 20), (18, 'Chinchvad', 'Viman Nagar', 'Kasarwadi - Khadaki - Asjok Nagar - Koregaon park', '2', '18.6 km', '45 min', 20);
/*!40000 ALTER TABLE `localpmtroute` ENABLE KEYS */;


# Dumping structure for table travelling.longbusroute
CREATE TABLE IF NOT EXISTS `longbusroute` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `src` text,
  `dest` text,
  `points` text,
  `routeno` text,
  `distance` text,
  `time` text,
  `price` double DEFAULT NULL,
  `bordingpoint` text,
  `timeStamp` datetime DEFAULT NULL,
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

# Dumping data for table travelling.longbusroute: 22 rows
/*!40000 ALTER TABLE `longbusroute` DISABLE KEYS */;
INSERT INTO `longbusroute` (`Id`, `src`, `dest`, `points`, `routeno`, `distance`, `time`, `price`, `bordingpoint`, `timeStamp`) VALUES (1, 'Pune', 'Nasik', 'Manchar - Sangamner - Devlali', '1', '212 km', '4 hr 37 min', 250, 'shivajinagar', '2020-03-28 00:57:32'), (2, 'Pune', 'Nasik', 'Lonavala - Pimpalgao - Aasangao', '2', '281 km', '5 hr 28 min', 310, 'shivajinagar', '2020-03-23 00:55:36'), (3, 'Pune', 'Nasik', 'Lonavala - Thane - Aasangao', '3', '290 km', '5 hr 28 min', 350, 'shivajinagar', '2020-03-23 00:55:43'), (4, 'Nasik', 'Pune', 'Devlali - Sangamner - Manchar', '1', '212 km', '4 hr 37 min', 250, 'CBS bus stop', '2020-03-23 00:55:46'), (5, 'Nasik', 'Pune', 'Aasangao - Pimpalgao - Lonavala', '2', '281 km', '5 hr 28 min', 310, 'CBS bus stop', '2020-03-23 00:55:48'), (6, 'Nasik', 'Pune', 'Aasangao - Thane - Lonavala', '3', '290 km', '5 hr 28 min', 350, 'CBS bus stop', '2020-03-23 00:55:49'), (7, 'Manchar', 'Nasik', 'Sangamner - Devlali', '1', '148.7 km', '2 hr 41 min', 160, 'NA', '2020-03-23 00:55:55'), (8, 'Sangamner', 'Nasik', 'Devlali', '1', '68.9 km', '1 hr 23 min', 65, 'NA', '2020-03-23 00:55:56'), (9, 'Devlali', 'Nasik', 'NA', '1', '113.3 km', '2 hr 21 min', 120, 'NA', '2020-03-23 00:55:57'), (10, 'Lonavala', 'Nasik', 'Pimpalgao - Aasangao', '1', '227.8 km', '4 hr 10min', 275, 'NA', '2020-03-23 00:55:59'), (11, 'Lonavala', 'Nasik', 'Thane - Aasangao', '2', '227.8 km', '4 hr 10 min', 275, 'NA', '2020-03-23 00:56:01'), (12, 'Pimpalgao', 'Nasik', 'Aasangao', '1', '30 km', '41 min', 25, 'NA', '2020-03-23 00:56:03'), (13, 'Thane', 'Nasik', 'Aasangao', '1', '146.0 km', '2 hr 33 min', 160, 'NA', '2020-03-23 00:56:05'), (14, 'Aasangao', 'Nasik', 'NA', '1', '100.5 km', '1 hr 37 min', 100, 'NA', '2020-03-23 00:56:06'), (15, 'Aasangao', 'Pune', 'Pimpalgao - Lonavala', '1', '192.2 km', '3 hr 58 min', 175, 'NA', '2020-03-23 00:56:08'), (16, 'Thane', 'Pune', 'Lonavala', '1', '154.6 km', '2 hr 53 min', 165, 'NA', '2020-03-23 00:56:10'), (17, 'Pimpalgao', 'Pune', 'Lonavala', '1', '235.4 km', '5 hr 2 min', 280, 'NA', '2020-03-23 00:56:12'), (18, 'Aasangao', 'Pune', 'Thane - Lonavala', '2', '175.2 km', '3 hr 10 min', 180, 'NA', '2020-03-23 00:56:14'), (19, 'Lonavala', 'Pune', 'NA', '1', '66.7 km', '1 hr 13 min', 60, 'NA', '2020-03-23 00:56:15'), (20, 'Devlali', 'Pune', 'Sangamner - Manchar', '1', '164.9 km', '3 hr 46 min', 170, 'NA', '2020-03-23 00:56:17'), (21, 'Sangamner', 'Pune', 'Manchar', '1', '143.7 km', '3 hr 21 min', 140, 'NA', '2020-03-23 00:56:19'), (22, 'Manchar', 'Pune', 'NA', '1', '63.2 km', '1 hr 44 min', 60, 'NA', '2020-03-23 00:56:21');
/*!40000 ALTER TABLE `longbusroute` ENABLE KEYS */;


# Dumping structure for table travelling.longplaneroute
CREATE TABLE IF NOT EXISTS `longplaneroute` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `src` text,
  `dest` text,
  `points` text,
  `routeno` text,
  `distance` text,
  `time` text,
  `price` double DEFAULT NULL,
  `bordingpoint` text,
  `timeStamp` datetime DEFAULT NULL,
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

# Dumping data for table travelling.longplaneroute: 2 rows
/*!40000 ALTER TABLE `longplaneroute` DISABLE KEYS */;
INSERT INTO `longplaneroute` (`Id`, `src`, `dest`, `points`, `routeno`, `distance`, `time`, `price`, `bordingpoint`, `timeStamp`) VALUES (1, 'Pune', 'Nasik', 'Nil', '1', '150 km', '1hr', 1500, 'Pune Airport', '2020-03-23 01:25:15'), (2, 'Nasik', 'Pune', 'Nil', '1', '150 km', '1hr', 1500, 'Nasik Airport', '2020-03-23 01:25:12');
/*!40000 ALTER TABLE `longplaneroute` ENABLE KEYS */;


# Dumping structure for table travelling.longtrainroute
CREATE TABLE IF NOT EXISTS `longtrainroute` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `src` text,
  `dest` text,
  `points` text,
  `routeno` text,
  `distance` text,
  `time` text,
  `price` double DEFAULT NULL,
  `bordingpoint` text,
  `timeStamp` datetime DEFAULT NULL,
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

# Dumping data for table travelling.longtrainroute: 20 rows
/*!40000 ALTER TABLE `longtrainroute` DISABLE KEYS */;
INSERT INTO `longtrainroute` (`Id`, `src`, `dest`, `points`, `routeno`, `distance`, `time`, `price`, `bordingpoint`, `timeStamp`) VALUES (1, 'Pune', 'Nasik', 'Shreegonda - Ahamadnagar - Kopargao - Manamad', '1', '270 km', '7 hr 7 min', 270, 'Pune Station', '2020-03-23 01:26:30'), (2, 'Pune', 'Nasik', 'Hinjavadi - Lonavala - Thane - Kasara', '2', '276 km', '7 hr 35 min', 275, 'Pune Station', '2020-03-23 01:26:28'), (3, 'Nasik', 'Pune', 'Manmad - Kopargao - Ahamadnagar - Shreegonda', '1', '270 km', '7 hr 7 min', 270, 'Nasik Station', '2020-03-23 01:26:26'), (4, 'Nasik', 'Pune', 'Kasara - Thane - Lonavala - Hinjavadi', '2', '276 km', '7 hr 35 min', 275, 'Nasik Station', '2020-03-23 01:26:24'), (5, 'Shreegonda', 'Nasik', 'Ahamadnagar - Kopargao - Manamad', '1', '219 km', '5 hr 45 min', 219, 'NA', '2020-03-23 01:26:20'), (6, 'Ahamadnagar', 'Nasik', 'Kopargao - Manamad', '1', '171 km', '4 hr 10 min', 171, 'NA', '2020-03-23 01:26:18'), (7, 'Kopargao', 'Nasik', 'Manamad', '1', '114 km', '2 hr 30 min', 114, 'NA', '2020-03-23 01:26:16'), (8, 'Manamad', 'Nasik', 'NA', '1', '73 km', '1 hr 20 min', 73, 'NA', '2020-03-23 01:26:13'), (9, 'Hinjavadi', 'Nasik', 'Lonavala - Thane - Kasara', '1', '208 km', '6 hr 36 min', 208, 'NA', '2020-03-23 01:26:11'), (10, 'Lonavala', 'Nasik', 'Thane - Kasara', '1', '156 km', '4 hr 15 min', 156, 'NA', '2020-03-23 01:26:09'), (11, 'Thane', 'Nasik', 'Kasara', '1', '150 km', '3 hr 25 min', 150, 'NA', '2020-03-23 01:26:06'), (12, 'Kasara', 'Nasik', 'NA', '1', '61 km', '1 hr 20 min', 61, 'NA', '2020-03-23 01:26:04'), (13, 'Shreegonda', 'Pune', 'NA', '1', '97 km', '2 hr 40 min', 97, 'NA', '2020-03-23 01:26:02'), (14, 'Ahamadnagar', 'Pune', 'Shreegonda', '1', '106 km', '4 hr 26 min', 106, 'NA', '2020-03-23 01:26:00'), (15, 'Kopargao', 'Pune', 'Ahamadnagar - Shreegonda', '1', '267 km', '6 hr 26 min', 267, 'NA', '2020-03-23 01:25:55'), (16, 'Manamad', 'Pune', 'Kopargao - Ahamadnagar - Shreegonda', '1', '312 km', '7 hr 15 min', 312, 'NA', '2020-03-23 01:25:53'), (17, 'Hinjavadi', 'Pune', 'NA', '1', '21 km', '30 min', 21, 'NA', '2020-03-23 01:25:51'), (18, 'Lonavala', 'Pune', 'Hinjavadi', '1', '63 km', '1 hr 7 min', 63, 'NA', '2020-03-23 01:25:49'), (19, 'Thane', 'Pune', 'Lonavala - Hinjavadi', '1', '152 km', '2 hr 59 min', 152, 'NA', '2020-03-23 01:25:46'), (20, 'Kasara', 'Pune', 'Thane - Lonavala - Hinjavadi', '1', '173 km', '4 hr 9 min', 173, 'NA', '2020-03-23 01:25:43');
/*!40000 ALTER TABLE `longtrainroute` ENABLE KEYS */;


# Dumping structure for table travelling.otptable
CREATE TABLE IF NOT EXISTS `otptable` (
  `uname` text,
  `timestamp` timestamp NULL DEFAULT NULL,
  `otp` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table travelling.otptable: 0 rows
/*!40000 ALTER TABLE `otptable` DISABLE KEYS */;
/*!40000 ALTER TABLE `otptable` ENABLE KEYS */;


# Dumping structure for table travelling.transaction
CREATE TABLE IF NOT EXISTS `transaction` (
  `User` text,
  `Bank` text,
  `CreditAmount` text,
  `DebitAmount` text,
  `CurrentAmount` text,
  `DateTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table travelling.transaction: 14 rows
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` (`User`, `Bank`, `CreditAmount`, `DebitAmount`, `CurrentAmount`, `DateTime`) VALUES ('suhas', 'Bank Of India', '500', '0', '2500', '2018-03-11 11:47:34'), ('suhas', 'Bank Of India', '0', '500', '2000', '2018-03-11 11:48:17'), ('suhas', 'Bank Of India', '0', '40', '1960', '2018-03-14 23:45:15'), ('suhas', 'Bank Of India', '0', '340', '1620', '2018-03-15 00:05:13'), ('suhas', 'Bank Of India', '0', '200', '1420', '2018-03-25 11:48:59'), ('suhas', 'Bank Of India', '0', '280', '1140', '2018-03-25 22:26:10'), ('suhas', 'Bank Of India', '0', '30', '1110', '2018-03-25 22:30:07'), ('suhas', 'Bank Of India', '0', '350', '760', '2018-03-25 22:37:33'), ('suhas', 'Bank Of India', '0', '97500', '-96740', '2020-02-06 07:15:26'), ('suhas', 'Bank Of India', '0', '500', '-97240', '2020-02-06 11:11:49'), ('marisha', 'Bank Of Maharashtra', '500', '0', '1000', '2020-02-06 11:42:51'), ('marisha', 'Bank Of Maharashtra', '0', '250', '750', '2020-02-06 11:47:43'), ('suhas', 'Bank Of India', '0', '250', '-97490', '2020-03-24 15:13:26'), ('suhas', 'Bank Of India', '0', '250', '-97740', '2020-03-24 16:19:56'), ('suhas', 'Bank Of India', '12345678912', '0.0', '24691260084', '2020-03-24 21:20:23'), ('suhas', 'Bank Of India', '0.0', '12345678912', '12345581172', '2020-03-24 21:20:43'), ('suhas', 'Bank Of India', '0.0', '500.0', '1.2345580672E10', '2020-03-24 21:23:12');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
