-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: faculty
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','sdmsmk');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `fac_id` int NOT NULL AUTO_INCREMENT,
  `fac_name` varchar(30) NOT NULL,
  `fac_dept` varchar(50) NOT NULL,
  `fac_email` varchar(100) NOT NULL,
  `fac_password` varchar(50) NOT NULL,
  PRIMARY KEY (`fac_id`),
  UNIQUE KEY `fac_email` (`fac_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'ANITHA','COMPUTER','anitha@siddharthamahila.ac.in','Anitha@12');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `roll_no` varchar(8) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `mobile_no` bigint DEFAULT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  `section` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`roll_no`),
  UNIQUE KEY `mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES ('206806','niveditha','niveditha@gmail.com',9515757792,'anitha','statistics','stat','B:(Excellent)','MSCS'),('206807','niveditha','nivi@gmail.com',9515757792,'anitha','computer','computer','A:(Out Standing)','MSDS'),('206808','yamini','yamini@1233gmail.com',9515757792,'anitha','computer','computer','B:(Excellent)','MSDS'),('206809','yashu','yashu@gmail.com',935757792,'anitha','computer','subject','(A)Outstanding',NULL),('206810','haritha','haritha@1gmail.com',9515757792,'anitha','computer','computer','B:(Excellent)','MSDS'),('206811','yamini','yamini@12gmail.com',9515757792,'anitha','computer','computer','A:(Out Standing)','MSDS'),('206888','penumaka yashu','yashu123@gmail.com',9515757792,'anitha','computer','computer','A:(Out Standing)','MSDS');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpcfeedback`
--

DROP TABLE IF EXISTS `mpcfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mpcfeedback` (
  `roll_no` varchar(8) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `mobile_no` int NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  PRIMARY KEY (`roll_no`),
  UNIQUE KEY `mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpcfeedback`
--

LOCK TABLES `mpcfeedback` WRITE;
/*!40000 ALTER TABLE `mpcfeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpcfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpcsfeedback`
--

DROP TABLE IF EXISTS `mpcsfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mpcsfeedback` (
  `roll_no` varchar(8) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `mobile_no` int NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  PRIMARY KEY (`roll_no`),
  UNIQUE KEY `mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpcsfeedback`
--

LOCK TABLES `mpcsfeedback` WRITE;
/*!40000 ALTER TABLE `mpcsfeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpcsfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mscafeedback`
--

DROP TABLE IF EXISTS `mscafeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mscafeedback` (
  `roll_no` varchar(8) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `mobile_no` int NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  PRIMARY KEY (`roll_no`),
  UNIQUE KEY `mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mscafeedback`
--

LOCK TABLES `mscafeedback` WRITE;
/*!40000 ALTER TABLE `mscafeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mscafeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mscsfeedback`
--

DROP TABLE IF EXISTS `mscsfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mscsfeedback` (
  `roll_no` varchar(8) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `mobile_no` int NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  PRIMARY KEY (`roll_no`),
  UNIQUE KEY `mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mscsfeedback`
--

LOCK TABLES `mscsfeedback` WRITE;
/*!40000 ALTER TABLE `mscsfeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mscsfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msdsfeedback`
--

DROP TABLE IF EXISTS `msdsfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msdsfeedback` (
  `roll_no` varchar(8) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `mobile_no` int NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  PRIMARY KEY (`roll_no`),
  UNIQUE KEY `mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msdsfeedback`
--

LOCK TABLES `msdsfeedback` WRITE;
/*!40000 ALTER TABLE `msdsfeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `msdsfeedback` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-26  7:28:41
