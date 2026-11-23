-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 80.242.59.112    Database: gs325642
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ip` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0.0.0',
  `veh_number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '[ HET HOMEPOB ]',
  `veh_reg` int(1) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `securitycode` int(11) NOT NULL DEFAULT 0,
  `checkcode` int(11) NOT NULL DEFAULT 0,
  `mail` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'None',
  `level` int(11) NOT NULL DEFAULT 1,
  `cash` int(11) NOT NULL DEFAULT 999,
  `bank` int(11) NOT NULL DEFAULT 0,
  `exp` int(11) NOT NULL DEFAULT 0,
  `regip` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0.0.0',
  `datareg` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0.0',
  `leader` int(3) NOT NULL DEFAULT 0,
  `templeader` int(3) NOT NULL DEFAULT 0,
  `member` int(3) NOT NULL DEFAULT 0,
  `rank` int(3) NOT NULL DEFAULT 0,
  `warn` int(11) NOT NULL DEFAULT 0,
  `sex` int(11) NOT NULL DEFAULT 0,
  `age` int(11) NOT NULL DEFAULT 0,
  `model` int(11) NOT NULL DEFAULT 0,
  `memberskin` int(11) NOT NULL DEFAULT 0,
  `lic` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1, 1, 1, 1, 1',
  `guns` varchar(56) NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0,0,0,0',
  `ammos` varchar(56) NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0,0,0,0',
  `mute` int(11) NOT NULL DEFAULT 0,
  `pick` int(11) NOT NULL DEFAULT 0,
  `checktime` int(6) NOT NULL DEFAULT 0,
  `news` int(11) NOT NULL DEFAULT 0,
  `phone` int(11) NOT NULL DEFAULT 0,
  `phonenumber` int(11) NOT NULL DEFAULT 0,
  `text` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0, 0, 0, 0',
  `jail` int(11) NOT NULL DEFAULT 0,
  `jailtime` int(11) NOT NULL DEFAULT 0,
  `wanted` int(11) NOT NULL DEFAULT 0,
  `wantedtime` int(11) NOT NULL DEFAULT 0,
  `wantedwho` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'None',
  `wantedreason` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'None',
  `heal` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '100.0',
  `drugs` int(11) NOT NULL DEFAULT 0,
  `patron` int(11) NOT NULL DEFAULT 0,
  `gunamount` int(11) NOT NULL DEFAULT 0,
  `crimes` int(11) NOT NULL DEFAULT 0,
  `job` int(11) NOT NULL DEFAULT 0,
  `married` int(11) NOT NULL DEFAULT 0,
  `whomarried` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'None',
  `referal` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'None',
  `refmoney` int(11) NOT NULL DEFAULT 0,
  `paycheck` int(11) NOT NULL DEFAULT 0,
  `charity` int(11) NOT NULL DEFAULT 0,
  `vip` int(11) NOT NULL DEFAULT 0,
  `viptime` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `fstyle` int(11) NOT NULL DEFAULT 0,
  `credits` int(11) NOT NULL DEFAULT 0,
  `totalcredits` int(11) NOT NULL DEFAULT 0,
  `skin1` int(11) NOT NULL DEFAULT 0,
  `skin2` int(11) NOT NULL DEFAULT 0,
  `skin3` int(11) NOT NULL DEFAULT 0,
  `spawnchange` int(11) NOT NULL DEFAULT 0,
  `sdpistol` int(11) NOT NULL DEFAULT 0,
  `deserteagle` int(11) NOT NULL DEFAULT 0,
  `shotgun` int(11) NOT NULL DEFAULT 0,
  `mp5` int(11) NOT NULL DEFAULT 0,
  `ak47` int(11) NOT NULL DEFAULT 0,
  `m4` int(11) NOT NULL DEFAULT 0,
  `pistol` int(11) NOT NULL DEFAULT 0,
  `microuzi` int(11) NOT NULL DEFAULT 0,
  `hunger` int(11) NOT NULL DEFAULT 100,
  `healths` float NOT NULL DEFAULT 100,
  `sportexp` int(11) NOT NULL DEFAULT 0,
  `online` int(11) NOT NULL DEFAULT 0,
  `zakon` int(11) NOT NULL DEFAULT 0,
  `city` int(11) NOT NULL DEFAULT 0,
  `repcar` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0, 0',
  `bed` int(11) NOT NULL,
  `watch` int(11) NOT NULL DEFAULT 0,
  `ciggare` int(11) NOT NULL DEFAULT 0,
  `sprunk` int(11) NOT NULL DEFAULT 0,
  `mask` int(11) NOT NULL DEFAULT 0,
  `phonebalance` int(11) NOT NULL DEFAULT 100,
  `truckskill` int(11) NOT NULL DEFAULT 1,
  `cModel` int(11) NOT NULL DEFAULT 0,
  `cClass` int(11) NOT NULL DEFAULT 0,
  `cFuel` int(11) NOT NULL DEFAULT 0,
  `cColor1` int(11) NOT NULL DEFAULT 0,
  `cColor2` int(11) NOT NULL DEFAULT 0,
  `cLock` int(11) NOT NULL DEFAULT 0,
  `cCost` int(11) NOT NULL DEFAULT 0,
  `cVehcom` varchar(64) NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0,0,0,0,0',
  `cPaintjob` int(11) NOT NULL DEFAULT 0,
  `cProbeg` float NOT NULL DEFAULT 0,
  `aptechka` int(11) NOT NULL DEFAULT 0,
  `Voennik` int(11) NOT NULL DEFAULT 0,
  `Family` int(11) NOT NULL DEFAULT 0,
  `FamilySozd` int(11) NOT NULL DEFAULT 0,
  `FamilyZam` int(11) NOT NULL DEFAULT 0,
  `music` int(11) NOT NULL DEFAULT 0,
  `improves` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0, 0, 0, 0',
  `datavhod` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0.0',
  `settings` int(11) NOT NULL DEFAULT 15,
  `phnumber1` int(11) NOT NULL DEFAULT 0,
  `phnumber2` int(11) NOT NULL DEFAULT 0,
  `phnumber3` int(11) NOT NULL DEFAULT 0,
  `phnumber4` int(11) NOT NULL DEFAULT 0,
  `phnumber5` int(11) NOT NULL DEFAULT 0,
  `phnumber6` int(11) NOT NULL DEFAULT 0,
  `phnumber7` int(11) NOT NULL DEFAULT 0,
  `phnumber8` int(11) NOT NULL DEFAULT 0,
  `vehiclekey` int(11) NOT NULL DEFAULT 0,
  `mailconf` int(11) NOT NULL DEFAULT 0,
  `fishki` int(11) NOT NULL DEFAULT 0,
  `pcara` int(11) NOT NULL DEFAULT 0,
  `pcarb` int(11) NOT NULL DEFAULT 0,
  `pcarc` int(11) NOT NULL DEFAULT 0,
  `pcard` int(1) NOT NULL DEFAULT 0,
  `pInt` int(2) NOT NULL,
  `pWorld` int(10) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `trucklevel` int(11) NOT NULL DEFAULT 1,
  `entrance` int(11) NOT NULL DEFAULT -1,
  `room` int(11) NOT NULL DEFAULT -1,
  `deactivate` int(11) NOT NULL DEFAULT 0,
  `SurpriseDay` varchar(32) NOT NULL DEFAULT '0',
  `SurpriseTakeDay` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id`, `name`, `password`, `ip`, `veh_number`, `veh_reg`, `admin`, `securitycode`, `checkcode`, `mail`, `level`, `cash`, `bank`, `exp`, `regip`, `datareg`, `leader`, `templeader`, `member`, `rank`, `warn`, `sex`, `age`, `model`, `memberskin`, `lic`, `guns`, `ammos`, `mute`, `pick`, `checktime`, `news`, `phone`, `phonenumber`, `text`, `jail`, `jailtime`, `wanted`, `wantedtime`, `wantedwho`, `wantedreason`, `heal`, `drugs`, `patron`, `gunamount`, `crimes`, `job`, `married`, `whomarried`, `referal`, `refmoney`, `paycheck`, `charity`, `vip`, `viptime`, `time`, `fstyle`, `credits`, `totalcredits`, `skin1`, `skin2`, `skin3`, `spawnchange`, `sdpistol`, `deserteagle`, `shotgun`, `mp5`, `ak47`, `m4`, `pistol`, `microuzi`, `hunger`, `healths`, `sportexp`, `online`, `zakon`, `city`, `repcar`, `bed`, `watch`, `ciggare`, `sprunk`, `mask`, `phonebalance`, `truckskill`, `cModel`, `cClass`, `cFuel`, `cColor1`, `cColor2`, `cLock`, `cCost`, `cVehcom`, `cPaintjob`, `cProbeg`, `aptechka`, `Voennik`, `Family`, `FamilySozd`, `FamilyZam`, `music`, `improves`, `datavhod`, `settings`, `phnumber1`, `phnumber2`, `phnumber3`, `phnumber4`, `phnumber5`, `phnumber6`, `phnumber7`, `phnumber8`, `vehiclekey`, `mailconf`, `fishki`, `pcara`, `pcarb`, `pcarc`, `pcard`, `pInt`, `pWorld`, `PosX`, `PosY`, `PosZ`, `trucklevel`, `entrance`, `room`, `deactivate`, `SurpriseDay`, `SurpriseTakeDay`) VALUES (1,'SPACE_ONLINE','123123','89.110.85.70','[ HET HOMEPOB ]',0,0,0,0,'',1,12599641,0,2,'46.138.209.205','12.02.2026',4,0,4,10,0,1,0,24,286,'1, 1, 1, 1, 1','0,0,0,0,0,0,0,0,0,0,0,0,0','0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,'0, 0, 0, 0',0,0,0,0,'None','None','100.0',0,0,0,0,0,0,'None','',0,0,0,0,0,0,0,0,0,0,0,0,2,0,100,100,0,0,0,0,0,100,100,0,1,0,0,'0, 0',0,0,0,0,0,100,1,0,0,0,0,0,0,0,'0,0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,0,0,'0, 0, 0, 0','0.0.0',15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.299702,1,-1,-1,0,'0','0'),
(2,'SPACE_ONLINEsa','123123','95.26.169.13','[ HET HOMEPOB ]',0,10,0,0,'',1,999,0,0,'95.26.169.13','12.02.2026',2,0,2,10,0,1,0,14,267,'1, 1, 1, 1, 1','0,0,23,0,0,0,0,0,0,0,0,0,0','0,0,50,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,'0, 0, 0, 0',0,0,0,0,'None','None','100.0',0,0,0,0,0,0,'None','',0,0,0,0,0,0,0,0,0,0,0,0,2,100,100,100,100,100,100,100,100,100,100,0,1,0,0,'0, 0',0,0,0,0,0,100,1,0,0,0,0,0,0,0,'0,0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,0,0,'0, 0, 0, 0','0.0.0',15,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,1,1235.46,-88.1441,1699.69,1,-1,-1,0,'0','0'),
(69,'James_Taylor','Malina16.84','95.105.74.253','[ HET HOMEPOB ]',0,4,0,0,'',1,999,0,0,'95.105.74.253','14.02.2026',0,0,0,0,0,1,0,14,0,'1, 1, 1, 1, 1','0,0,0,0,0,0,0,0,0,0,0,0,0','0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,'0, 0, 0, 0',0,0,0,0,'None','None','100.0',0,0,0,0,0,0,'None','',0,0,0,0,0,0,0,0,0,0,0,0,0,100,100,100,100,100,100,100,100,100,100,0,1,0,0,'0, 0',0,0,0,0,0,100,1,0,0,0,0,0,0,0,'0,0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,0,0,'0, 0, 0, 0','0.0.0',15,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,425.187,737.182,12,1,-1,-1,0,'0','0'),
(70,'Oleg_Harrison','Щдуп1002','109.252.191.43','[ HET HOMEPOB ]',0,10,0,0,'',10,999,0,0,'109.252.191.43','14.02.2026',3,0,3,10,0,1,0,166,166,'1, 1, 1, 1, 1','0,0,0,0,0,0,0,0,0,0,0,0,0','0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,'0, 0, 0, 0',0,0,0,0,'None','None','100.0',0,0,0,0,0,0,'None','',0,0,0,0,0,0,0,0,0,0,0,0,2,100,100,100,100,100,100,100,100,100,100,0,1,0,0,'0, 0',0,0,0,0,0,100,1,0,0,0,0,0,0,0,'0,0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,0,0,'0, 0, 0, 0','0.0.0',15,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,1996.56,2070.04,12.5493,1,-1,-1,0,'0','0'),
(71,'Danil_Firsov','nikita201125','0.0.0.0','[ HET HOMEPOB ]',0,0,0,0,'',1,999,0,0,'77.40.62.194','14.02.2026',0,0,0,0,0,1,0,22,0,'1, 1, 1, 1, 1','0,0,0,0,0,0,0,0,0,0,0,0,0','0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,'0, 0, 0, 0',0,0,0,0,'None','None','100.0',0,0,0,0,0,0,'None','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,100,0,0,0,0,'0, 0',0,0,0,0,0,100,1,0,0,0,0,0,0,0,'0,0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,0,0,'0, 0, 0, 0','0.0.0',15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1891.58,2060.87,15.875,1,-1,-1,0,'0','0'),
(72,'Ruslan_Adomov','Ryclan4ik','151.249.237.119','[ HET HOMEPOB ]',0,0,0,0,'',1,999,0,0,'151.249.237.119','19.02.2026',0,0,0,0,0,1,0,14,0,'1, 1, 1, 1, 1','0,0,0,0,0,0,0,0,0,0,0,0,0','0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,'0, 0, 0, 0',0,0,0,0,'None','None','100.0',0,0,0,0,0,0,'None','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,100,0,1,0,0,'0, 0',0,0,0,0,0,100,1,0,0,0,0,0,0,0,'0,0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,0,0,'0, 0, 0, 0','0.0.0',15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1926.32,2078.51,16.0314,1,-1,-1,0,'0','0'),
(73,'Kerry_King','123123','151.249.237.119','[ HET HOMEPOB ]',0,0,0,0,'',1,999,0,0,'151.249.237.119','19.02.2026',0,0,0,0,0,1,0,76,0,'1, 1, 1, 1, 1','0,0,0,0,0,0,0,0,0,0,0,0,0','0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,'0, 0, 0, 0',0,0,0,0,'None','None','100.0',0,0,0,0,0,0,'None','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,100,0,1,0,0,'0, 0',0,0,0,0,0,100,1,0,0,0,0,0,0,0,'0,0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,0,0,'0, 0, 0, 0','0.0.0',15,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,1926.32,2078.51,15.8047,1,-1,-1,0,'0','0'),
(74,'Nasty_Adomova','Ryclan4ik','151.249.237.119','[ HET HOMEPOB ]',0,0,0,0,'',1,999,0,0,'151.249.237.119','19.02.2026',0,0,0,0,0,0,0,12,0,'1, 1, 1, 1, 1','0,0,0,0,0,0,0,0,0,0,0,0,0','0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,'0, 0, 0, 0',0,0,0,0,'None','None','100.0',0,0,0,0,0,0,'None','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,100,0,1,0,0,'0, 0',0,0,0,0,0,100,1,0,0,0,0,0,0,0,'0,0,0,0,0,0,0,0,0,0,0,0,0,0',0,0,0,0,0,0,0,0,'0, 0, 0, 0','0.0.0',15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1926.32,2078.51,15.8047,1,-1,-1,0,'0','0');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `name` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `level` int(2) NOT NULL,
  `password` varchar(32) NOT NULL DEFAULT 'qwerty',
  `last_connect` varchar(15) NOT NULL,
  `put_admin` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `data` varchar(15) NOT NULL,
  `a_goto` int(1) NOT NULL,
  `a_gethere` int(1) NOT NULL,
  `a_spec` int(1) NOT NULL,
  `timemin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`name`, `level`, `password`, `last_connect`, `put_admin`, `data`, `a_goto`, `a_gethere`, `a_spec`, `timemin`) VALUES ('Kerry_King',7,'123123','19.2.2026','','',0,0,0,0),
('Sava_Zotov',7,'123123','27.1.2026','Kerry_King','27.01.2026',0,0,0,0),
('Dima_Gold',7,'123456','28.1.2026','Dima_Gold','',0,0,0,0),
('Dima_Gold',7,'123123','28.01.2026','Dima_Gold','28.01.2026',0,0,0,0),
('6',2,'qwerty','28.01.2026','Kerry_King','28.01.2026',0,0,0,0),
('Mihail_Mandarinov',6,'123456','28.1.2026','Kerry_King','28.01.2026',0,0,0,0),
('SPACE_ONLINE',10,'123123','18.2.2026','','',0,0,0,0),
('SPACE_ONLINE',7,'123123','','','',0,0,0,0),
('Oleg_Harrison',10,'123123','14.2.2026','','',0,0,0,0),
('Oleg_Harrison',10,'123123','','','',0,0,0,0),
('SPACE_ONLINEsa',10,'123123','12.2.2026','','',0,0,0,0),
('James_Taylor',4,'Malina16.84','13.2.2026','SPACE_ONLINE','13.02.2026',0,0,0,0);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atm`
--

DROP TABLE IF EXISTS `atm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atm` (
  `ID` int(11) NOT NULL,
  `aX` varchar(15) NOT NULL,
  `aY` varchar(15) NOT NULL,
  `aZ` varchar(15) NOT NULL,
  `arX` varchar(15) NOT NULL,
  `arY` varchar(15) NOT NULL,
  `arZ` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atm`
--

LOCK TABLES `atm` WRITE;
/*!40000 ALTER TABLE `atm` DISABLE KEYS */;
INSERT INTO `atm` (`ID`, `aX`, `aY`, `aZ`, `arX`, `arY`, `arZ`) VALUES (1,'1917.287841','2074.000244','14.791217','0.000000','0.000000','0.000000');
/*!40000 ALTER TABLE `atm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bans`
--

DROP TABLE IF EXISTS `bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bans` (
  `name` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `whobanned` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ip` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `bandate` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `time` int(11) NOT NULL,
  `unbandate` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `reason` varchar(32) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bans`
--

LOCK TABLES `bans` WRITE;
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bizz`
--

DROP TABLE IF EXISTS `bizz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bizz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'None',
  `type` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 100000,
  `buyprice` int(11) NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 500000,
  `lic` int(11) NOT NULL DEFAULT 0,
  `x` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0',
  `y` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0',
  `z` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0',
  `xt` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0',
  `yt` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0',
  `zt` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0',
  `menux` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0',
  `menuy` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0',
  `menuz` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.0',
  `vint` int(11) NOT NULL DEFAULT 0,
  `virt` int(11) NOT NULL DEFAULT 0,
  `icon` int(11) NOT NULL DEFAULT 4,
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'None',
  `penter` int(11) NOT NULL DEFAULT 100,
  `block` int(11) NOT NULL DEFAULT 0,
  `product` int(11) NOT NULL DEFAULT 0,
  `till` int(11) NOT NULL DEFAULT 50,
  `locktime` int(11) NOT NULL DEFAULT 0,
  `mafia` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bizz`
--

LOCK TABLES `bizz` WRITE;
/*!40000 ALTER TABLE `bizz` DISABLE KEYS */;
INSERT INTO `bizz` (`id`, `owner`, `type`, `price`, `buyprice`, `money`, `lic`, `x`, `y`, `z`, `xt`, `yt`, `zt`, `menux`, `menuy`, `menuz`, `vint`, `virt`, `icon`, `name`, `penter`, `block`, `product`, `till`, `locktime`, `mafia`) VALUES (1,'None',6,800000,0,500000,0,'1918.878417','2053.202880','15.877220','0.000000','0.000000','0.000000','0.000000','0.000000','0.000000',7,1,18,'122',100,0,20000,50,0,0),
(2,'None',8,500000,0,500000,0,'1921.327758','2071.194580','15.824048','-1772.94543','1774.006713','2377.416015','-1779.24194','1774.699340','2377.416015',5,2,45,'122',100,0,50000,50,0,0),
(3,'None',1,5000000,0,500000,0,'1908.487670','2053.854736','15.875000','-233.516006','592.742370','2113.120117','-238.114700','588.743530','2113.120117',6,3,56,'123122',100,0,5000,50,0,0);
/*!40000 ALTER TABLE `bizz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrances`
--

DROP TABLE IF EXISTS `entrances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_x` float NOT NULL DEFAULT 0,
  `pos_y` float NOT NULL DEFAULT 0,
  `pos_z` float NOT NULL DEFAULT 0,
  `exit_x` float NOT NULL DEFAULT 0,
  `exit_y` float NOT NULL DEFAULT 0,
  `exit_z` float NOT NULL DEFAULT 0,
  `exit_a` float NOT NULL DEFAULT 0,
  `room_price` int(11) NOT NULL DEFAULT 100000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrances`
--

LOCK TABLES `entrances` WRITE;
/*!40000 ALTER TABLE `entrances` DISABLE KEYS */;
INSERT INTO `entrances` (`id`, `pos_x`, `pos_y`, `pos_z`, `exit_x`, `exit_y`, `exit_z`, `exit_a`, `room_price`) VALUES (1,1872.27,2066.97,15.8438,1872.18,2066.93,15.8438,103.432,123123);
/*!40000 ALTER TABLE `entrances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `owned` int(11) NOT NULL DEFAULT -1,
  `owner` varchar(24) NOT NULL,
  `sub` varchar(64) NOT NULL DEFAULT '-1, -1, -1',
  `time` int(11) NOT NULL,
  `house` int(11) NOT NULL DEFAULT -1,
  `drugs` int(11) NOT NULL DEFAULT 0,
  `patron` int(11) NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `prod` int(11) NOT NULL DEFAULT 0,
  `spawn` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_cars`
--

DROP TABLE IF EXISTS `family_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_cars` (
  `id` int(11) NOT NULL,
  `familyid` int(11) NOT NULL DEFAULT -1,
  `model` int(11) NOT NULL DEFAULT 0,
  `slot` int(11) NOT NULL,
  `color_1` int(11) NOT NULL DEFAULT 0,
  `color_2` int(11) NOT NULL DEFAULT 0,
  `pos_x` float NOT NULL DEFAULT 0,
  `pos_y` float NOT NULL DEFAULT 0,
  `pos_z` float NOT NULL DEFAULT 0,
  `pos_r` float NOT NULL DEFAULT 0,
  `virtual` int(11) NOT NULL DEFAULT 0,
  `number` varchar(32) NOT NULL DEFAULT '-1',
  `fuel` int(11) NOT NULL DEFAULT 45,
  `lock` int(11) NOT NULL DEFAULT 0,
  `veh_com` varchar(32) NOT NULL DEFAULT '	0,0,0,0,0,0,0,0,0,0,0,0,0,0	',
  `paintjob` int(11) NOT NULL DEFAULT 3,
  `mileage` float NOT NULL DEFAULT 0,
  `health` float NOT NULL DEFAULT 1000,
  `engine` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_cars`
--

LOCK TABLES `family_cars` WRITE;
/*!40000 ALTER TABLE `family_cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `family_cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_system`
--

DROP TABLE IF EXISTS `family_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_system` (
  `fam_id` int(11) NOT NULL DEFAULT 1,
  `fam_name` varchar(64) NOT NULL,
  `fam_creator` varchar(64) NOT NULL,
  `fam_zamcreator` varchar(64) NOT NULL,
  `fam_data` varchar(32) NOT NULL,
  `fam_chat_color` int(11) NOT NULL,
  `fam_members_amount` int(11) NOT NULL,
  PRIMARY KEY (`fam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_system`
--

LOCK TABLES `family_system` WRITE;
/*!40000 ALTER TABLE `family_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `family_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fullaccess`
--

DROP TABLE IF EXISTS `fullaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fullaccess` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `rank` varchar(64) NOT NULL DEFAULT 'YouTube'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fullaccess`
--

LOCK TABLES `fullaccess` WRITE;
/*!40000 ALTER TABLE `fullaccess` DISABLE KEYS */;
INSERT INTO `fullaccess` (`id`, `name`, `rank`) VALUES (1,'Kerry_King','Developer'),
(1,'SPACE_ONLINE\r\n','YouTube'),
(2,'SPACE_ONLINE','YouTube'),
(3,'Oleg_Harrison','Developer'),
(3,'Oleg_Harrison','Developer'),
(0,'SPACE_ONLINEsa','YouTube'),
(2,'SPACE_ONLINEsa','razrab');
/*!40000 ALTER TABLE `fullaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gang`
--

DROP TABLE IF EXISTS `gang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gang` (
  `grovebank` int(11) NOT NULL DEFAULT 0,
  `ballasbank` int(11) NOT NULL DEFAULT 0,
  `rifabank` int(11) NOT NULL DEFAULT 0,
  `aztecbank` int(11) NOT NULL DEFAULT 0,
  `vagosbank` int(11) NOT NULL DEFAULT 0,
  `grovedrugs` int(11) NOT NULL DEFAULT 0,
  `ballasdrugs` int(11) NOT NULL DEFAULT 0,
  `rifadrugs` int(11) NOT NULL DEFAULT 0,
  `aztecdrugs` int(11) NOT NULL DEFAULT 0,
  `vagosdrugs` int(11) NOT NULL DEFAULT 0,
  `grovepat` int(11) NOT NULL DEFAULT 0,
  `ballaspat` int(11) NOT NULL DEFAULT 0,
  `rifapat` int(11) NOT NULL DEFAULT 0,
  `aztecpat` int(11) NOT NULL DEFAULT 0,
  `vagospat` int(11) NOT NULL DEFAULT 0,
  `groveed` int(11) NOT NULL DEFAULT 0,
  `ballased` int(11) NOT NULL DEFAULT 0,
  `rifaed` int(11) NOT NULL DEFAULT 0,
  `azteced` int(11) NOT NULL DEFAULT 0,
  `vagosed` int(11) NOT NULL DEFAULT 0,
  `bcapt_g` int(1) NOT NULL DEFAULT 0,
  `bcapt_b` int(1) NOT NULL DEFAULT 0,
  `bcapt_r` int(1) NOT NULL DEFAULT 0,
  `bcapt_a` int(1) NOT NULL DEFAULT 0,
  `bcapt_v` int(1) NOT NULL DEFAULT 0,
  `bskl_g` int(1) NOT NULL DEFAULT 0,
  `bskl_b` int(1) NOT NULL DEFAULT 0,
  `bskl_r` int(1) NOT NULL DEFAULT 0,
  `bskl_a` int(1) NOT NULL DEFAULT 0,
  `bskl_v` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gang`
--

LOCK TABLES `gang` WRITE;
/*!40000 ALTER TABLE `gang` DISABLE KEYS */;
INSERT INTO `gang` (`grovebank`, `ballasbank`, `rifabank`, `aztecbank`, `vagosbank`, `grovedrugs`, `ballasdrugs`, `rifadrugs`, `aztecdrugs`, `vagosdrugs`, `grovepat`, `ballaspat`, `rifapat`, `aztecpat`, `vagospat`, `groveed`, `ballased`, `rifaed`, `azteced`, `vagosed`, `bcapt_g`, `bcapt_b`, `bcapt_r`, `bcapt_a`, `bcapt_v`, `bskl_g`, `bskl_b`, `bskl_r`, `bskl_a`, `bskl_v`) VALUES (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `gang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gangzone`
--

DROP TABLE IF EXISTS `gangzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gangzone` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `ginfo1` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `ginfo2` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `ginfo3` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `ginfo4` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `fraction` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gangzone`
--

LOCK TABLES `gangzone` WRITE;
/*!40000 ALTER TABLE `gangzone` DISABLE KEYS */;
INSERT INTO `gangzone` (`id`, `ginfo1`, `ginfo2`, `ginfo3`, `ginfo4`, `fraction`) VALUES (0,'1770.060546','-1783.657470','1890.060546','-1683.657470',8),
(1,'1890.060546','-1783.657470','2010.060546','-1683.657470',8),
(2,'1650.060546','-1783.657470','1770.060546','-1683.657470',8),
(3,'1770.060546','-2683.657470','1890.060546','-2583.657470',8),
(4,'1890.060546','-2683.657470','2010.060546','-2583.657470',8),
(5,'2010.060546','-2683.657470','2130.060546','-2583.657470',8),
(6,'2130.060546','-2683.657470','2250.060546','-2583.657470',8),
(7,'2730.060546','-1883.657470','2850.060546','-1783.657470',7),
(8,'2610.060546','-1883.657470','2730.060546','-1783.657470',7),
(9,'2490.060546','-1883.657470','2610.060546','-1783.657470',7),
(10,'2370.060546','-1883.657470','2490.060546','-1783.657470',7),
(11,'2250.060546','-1883.657470','2370.060546','-1783.657470',7),
(12,'2130.060546','-1883.657470','2250.060546','-1783.657470',7),
(13,'2010.060546','-1883.657470','2130.060546','-1783.657470',8),
(14,'1890.060546','-1883.657470','2010.060546','-1783.657470',8),
(15,'1770.060546','-1883.657470','1890.060546','-1783.657470',8),
(16,'1650.060546','-1883.657470','1770.060546','-1783.657470',8),
(17,'2730.060546','-1983.657470','2850.060546','-1883.657470',7),
(18,'2610.060546','-1983.657470','2730.060546','-1883.657470',7),
(19,'2490.060546','-1983.657470','2610.060546','-1883.657470',7),
(20,'2370.060546','-1983.657470','2490.060546','-1883.657470',7),
(21,'2250.060546','-1983.657470','2370.060546','-1883.657470',7),
(22,'2130.060546','-1983.657470','2250.060546','-1883.657470',7),
(23,'2010.060546','-1983.657470','2130.060546','-1883.657470',8),
(24,'1890.060546','-1983.657470','2010.060546','-1883.657470',8),
(25,'1770.060546','-1983.657470','1890.060546','-1883.657470',8),
(26,'1650.060546','-1983.657470','1770.060546','-1883.657470',8),
(27,'2730.060546','-2083.657470','2850.060546','-1983.657470',7),
(28,'2610.060546','-2083.657470','2730.060546','-1983.657470',7),
(29,'2490.060546','-2083.657470','2610.060546','-1983.657470',7),
(30,'2370.060546','-2083.657470','2490.060546','-1983.657470',7),
(31,'2250.060546','-2083.657470','2370.060546','-1983.657470',7),
(32,'2130.060546','-2083.657470','2250.060546','-1983.657470',7),
(33,'2010.060546','-2083.657470','2130.060546','-1983.657470',8),
(34,'1890.060546','-2083.657470','2010.060546','-1983.657470',8),
(35,'1770.060546','-2083.657470','1890.060546','-1983.657470',8),
(36,'1650.060546','-2083.657470','1770.060546','-1983.657470',8),
(37,'2730.060546','-2183.657470','2850.060546','-2083.657470',7),
(38,'2610.060546','-2183.657470','2730.060546','-2083.657470',7),
(39,'2490.060546','-2183.657470','2610.060546','-2083.657470',7),
(40,'2370.060546','-2183.657470','2490.060546','-2083.657470',7),
(41,'2250.060546','-2183.657470','2370.060546','-2083.657470',7),
(42,'2130.060546','-2183.657470','2250.060546','-2083.657470',8),
(43,'2010.060546','-2183.657470','2130.060546','-2083.657470',8),
(44,'1890.060546','-2183.657470','2010.060546','-2083.657470',8),
(45,'1770.060546','-2183.657470','1890.060546','-2083.657470',8),
(46,'1650.060546','-2183.657470','1770.060546','-2083.657470',8),
(47,'2730.060546','-2283.657470','2850.060546','-2183.657470',7),
(48,'2610.060546','-2283.657470','2730.060546','-2183.657470',7),
(49,'2490.060546','-2283.657470','2610.060546','-2183.657470',8),
(50,'2370.060546','-2283.657470','2490.060546','-2183.657470',7),
(51,'2250.060546','-2283.657470','2370.060546','-2183.657470',7),
(52,'2130.060546','-2283.657470','2250.060546','-2183.657470',8),
(53,'2010.060546','-2283.657470','2130.060546','-2183.657470',8),
(54,'1890.060546','-2283.657470','2010.060546','-2183.657470',8),
(55,'1770.060546','-2283.657470','1890.060546','-2183.657470',8),
(56,'1650.060546','-2283.657470','1770.060546','-2183.657470',8),
(57,'2730.060546','-2383.657470','2850.060546','-2283.657470',7),
(58,'2610.060546','-2383.657470','2730.060546','-2283.657470',7),
(59,'2490.060546','-2383.657470','2610.060546','-2283.657470',9),
(60,'2370.060546','-2383.657470','2490.060546','-2283.657470',9),
(61,'2250.060546','-2383.657470','2370.060546','-2283.657470',7),
(62,'2130.060546','-2383.657470','2250.060546','-2283.657470',8),
(63,'2010.060546','-2383.657470','2130.060546','-2283.657470',8),
(64,'1890.060546','-2383.657470','2010.060546','-2283.657470',8),
(65,'1770.060546','-2383.657470','1890.060546','-2283.657470',8),
(66,'1650.060546','-2383.657470','1770.060546','-2283.657470',8),
(67,'2730.060546','-2483.657470','2850.060546','-2383.657470',7),
(68,'2610.060546','-2483.657470','2730.060546','-2383.657470',7),
(69,'2490.060546','-2483.657470','2610.060546','-2383.657470',7),
(70,'2370.060546','-2483.657470','2490.060546','-2383.657470',7),
(71,'2250.060546','-2483.657470','2370.060546','-2383.657470',7),
(72,'2130.060546','-2483.657470','2250.060546','-2383.657470',8),
(73,'2010.060546','-2483.657470','2130.060546','-2383.657470',8),
(74,'1890.060546','-2483.657470','2010.060546','-2383.657470',8),
(75,'1770.060546','-2483.657470','1890.060546','-2383.657470',8),
(76,'1650.060546','-2483.657470','1770.060546','-2383.657470',8),
(77,'2730.060546','-2583.657470','2850.060546','-2483.657470',7),
(78,'2610.060546','-2583.657470','2730.060546','-2483.657470',7),
(79,'2490.060546','-2583.657470','2610.060546','-2483.657470',7),
(80,'2370.060546','-2583.657470','2490.060546','-2483.657470',8),
(81,'2250.060546','-2583.657470','2370.060546','-2483.657470',8),
(82,'2130.060546','-2583.657470','2250.060546','-2483.657470',8),
(83,'2010.060546','-2583.657470','2130.060546','-2483.657470',8),
(84,'1890.060546','-2583.657470','2010.060546','-2483.657470',8),
(85,'1770.060546','-2583.657470','1890.060546','-2483.657470',8),
(86,'1650.060546','-2583.657470','1770.060546','-2483.657470',8),
(87,'2730.060546','-2683.657470','2850.060546','-2583.657470',7),
(88,'2610.060546','-2683.657470','2730.060546','-2583.657470',7),
(89,'2490.060546','-2683.657470','2610.060546','-2583.657470',7),
(90,'2370.060546','-2683.657470','2490.060546','-2583.657470',8),
(91,'2250.060546','-2683.657470','2370.060546','-2583.657470',8),
(92,'1650.060546','-2683.657470','1770.060546','-2583.657470',8),
(93,'2010.060546','-1783.657470','2130.060546','-1683.657470',8),
(94,'2130.060546','-1783.657470','2250.060546','-1683.657470',7),
(95,'2250.060546','-1783.657470','2370.060546','-1683.657470',7),
(96,'2370.060546','-1783.657470','2490.060546','-1683.657470',7),
(97,'2490.060546','-1783.657470','2610.060546','-1683.657470',7),
(98,'2610.060546','-1783.657470','2730.060546','-1683.657470',9),
(99,'2730.060546','-1783.657470','2850.060546','-1683.657470',7);
/*!40000 ALTER TABLE `gangzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historyname`
--

DROP TABLE IF EXISTS `historyname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historyname` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `idacca` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historyname`
--

LOCK TABLES `historyname` WRITE;
/*!40000 ALTER TABLE `historyname` DISABLE KEYS */;
/*!40000 ALTER TABLE `historyname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hEntrx` varchar(10) NOT NULL DEFAULT '0.0',
  `hEntry` varchar(10) NOT NULL DEFAULT '0.0',
  `hEntrz` varchar(10) NOT NULL DEFAULT '0.0',
  `hExitx` varchar(10) NOT NULL DEFAULT '0.0',
  `hExity` varchar(10) NOT NULL DEFAULT '0.0',
  `hExitz` varchar(10) NOT NULL DEFAULT '0.0',
  `carx` varchar(10) NOT NULL DEFAULT '0.0',
  `cary` varchar(10) NOT NULL DEFAULT '0.0',
  `carz` varchar(10) NOT NULL DEFAULT '0.0',
  `carfa` varchar(10) NOT NULL DEFAULT '0.0',
  `hOwner` varchar(24) NOT NULL DEFAULT 'None',
  `hDiscript` varchar(16) NOT NULL DEFAULT 'Дом',
  `hPrice` int(11) NOT NULL DEFAULT 10000,
  `buyprice` int(11) NOT NULL DEFAULT 0,
  `hInt` int(11) NOT NULL DEFAULT 0,
  `hVirtual` int(11) NOT NULL DEFAULT 0,
  `hLock` int(11) NOT NULL DEFAULT 0,
  `hOplata` int(11) NOT NULL DEFAULT 0,
  `hHeal` int(11) NOT NULL DEFAULT 0,
  `hGarage` int(11) NOT NULL DEFAULT 0,
  `hAutoDoors` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mafia`
--

DROP TABLE IF EXISTS `mafia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mafia` (
  `yakuzabank` int(11) NOT NULL DEFAULT 0,
  `lcnbank` int(11) NOT NULL DEFAULT 0,
  `rmbank` int(11) NOT NULL DEFAULT 0,
  `yakuzadrugs` int(11) NOT NULL DEFAULT 0,
  `lcndrugs` int(11) NOT NULL DEFAULT 0,
  `rmdrugs` int(11) NOT NULL DEFAULT 0,
  `lcnpat` int(11) NOT NULL DEFAULT 0,
  `yakpat` int(11) NOT NULL DEFAULT 0,
  `rmpat` int(11) NOT NULL DEFAULT 0,
  `lcned` int(11) NOT NULL DEFAULT 0,
  `yaked` int(11) NOT NULL DEFAULT 0,
  `rmed` int(11) NOT NULL DEFAULT 0,
  `bskl_l` int(11) NOT NULL DEFAULT 0,
  `bskl_y` int(11) NOT NULL DEFAULT 0,
  `bskl_r` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mafia`
--

LOCK TABLES `mafia` WRITE;
/*!40000 ALTER TABLE `mafia` DISABLE KEYS */;
INSERT INTO `mafia` (`yakuzabank`, `lcnbank`, `rmbank`, `yakuzadrugs`, `lcndrugs`, `rmdrugs`, `lcnpat`, `yakpat`, `rmpat`, `lcned`, `yaked`, `rmed`, `bskl_l`, `bskl_y`, `bskl_r`) VALUES (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `mafia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other`
--

DROP TABLE IF EXISTS `other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `armygun` int(11) NOT NULL DEFAULT 0,
  `armyammo` int(11) NOT NULL DEFAULT 0,
  `d_exp` int(1) NOT NULL DEFAULT 0,
  `d_donate` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other`
--

LOCK TABLES `other` WRITE;
/*!40000 ALTER TABLE `other` DISABLE KEYS */;
INSERT INTO `other` (`id`, `armygun`, `armyammo`, `d_exp`, `d_donate`) VALUES (1,100000,99978,1,1);
/*!40000 ALTER TABLE `other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radar`
--

DROP TABLE IF EXISTS `radar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radar` (
  `r_id` int(11) NOT NULL,
  `r_name` varchar(24) NOT NULL,
  `r_type` int(11) NOT NULL,
  `r_speed` int(11) NOT NULL,
  `r_x` float NOT NULL,
  `r_y` float NOT NULL,
  `r_z` float NOT NULL,
  `r_a` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radar`
--

LOCK TABLES `radar` WRITE;
/*!40000 ALTER TABLE `radar` DISABLE KEYS */;
/*!40000 ALTER TABLE `radar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 0,
  `x` varchar(10) NOT NULL DEFAULT '0',
  `y` varchar(10) NOT NULL DEFAULT '0',
  `z` varchar(10) NOT NULL DEFAULT '0',
  `fa` varchar(10) NOT NULL DEFAULT '0',
  `vint` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL,
  `colors` varchar(10) NOT NULL DEFAULT '0, 0',
  `fraction` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `cost` int(11) NOT NULL DEFAULT 0,
  `family` int(11) NOT NULL DEFAULT 0,
  `rang` int(11) NOT NULL DEFAULT 1,
  `paintjob` int(11) NOT NULL DEFAULT -1,
  `TrunkGuns` varchar(200) NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0',
  `pTrunkMoney` int(11) NOT NULL DEFAULT 0,
  `pTrunkDrugs` int(11) NOT NULL DEFAULT 0,
  `pTrunkMats` int(11) NOT NULL DEFAULT 0,
  `pTrunkArmours` int(11) NOT NULL DEFAULT 0,
  `pTrunkKanistra` int(11) NOT NULL DEFAULT 0,
  `pTrunkDee` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `youtuber`
--

DROP TABLE IF EXISTS `youtuber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `youtuber` (
  `name` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `level` int(2) NOT NULL,
  `password` varchar(32) NOT NULL DEFAULT 'qwerty',
  `last_connect` varchar(15) NOT NULL,
  `put_admin` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `data` varchar(15) NOT NULL,
  `a_goto` int(1) NOT NULL,
  `a_gethere` int(1) NOT NULL,
  `a_spec` int(1) NOT NULL,
  `timemin` int(11) NOT NULL,
  `alog` int(1) NOT NULL DEFAULT 0,
  `ans` int(11) NOT NULL,
  `kicks` int(11) NOT NULL,
  `warns` int(11) NOT NULL,
  `bans` int(11) NOT NULL,
  `jails` int(11) NOT NULL,
  `mutes` int(11) NOT NULL,
  `data_NONLINE` int(11) NOT NULL DEFAULT 0,
  `data_NONLINE_1` int(11) NOT NULL DEFAULT 0,
  `data_NONLINE_2` int(11) NOT NULL DEFAULT 0,
  `data_NONLINE_3` int(11) NOT NULL DEFAULT 0,
  `data_NONLINE_4` int(11) NOT NULL DEFAULT 0,
  `data_NONLINE_5` int(11) NOT NULL DEFAULT 0,
  `data_NONLINE_6` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `youtuber`
--

LOCK TABLES `youtuber` WRITE;
/*!40000 ALTER TABLE `youtuber` DISABLE KEYS */;
/*!40000 ALTER TABLE `youtuber` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-19 20:39:03
