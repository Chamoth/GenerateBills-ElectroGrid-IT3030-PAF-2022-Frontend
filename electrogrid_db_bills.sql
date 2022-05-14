-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: electrogrid_db
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoiceNo` varchar(45) DEFAULT NULL,
  `accountNo` varchar(45) DEFAULT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobileNo` varchar(45) DEFAULT NULL,
  `home` varchar(100) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `billAmount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,'00001','Elec0001','Chamith','chamith@gmail.com','0719595435','No:04, Polhena, Matara','12.01.2022','Rs.5500'),(2,'00002','Elec0002','Kavindu','kavindu@gmail.com','0712136514','No: 235, Papiliyana, Gotagogama','10.03.2022','Rs.8000'),(3,'00003','Elec0003','Ravindu','ravindu@gmail.com','0712136514','No: 235, Mirihana, Gotagogama','10.03.2022','Rs.10000'),(4,'00004','Elec0004','Pasan','pasan@gmail.com','0712136514','No:3, Borupana, Gotagogama','10.03.2022','Rs.7500'),(5,'00005','Elec0005','Ravindu','ravindu@gmail.com','0718056985','No:5, 3rd Lane, Koswatta','15.03.2022','Rs.10500'),(6,'00006','Elec0006','Mahesh','mahesh@gmail.com','0712136514','No:3, 6th Ln','11.06.2021','Rs.9500');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-14 23:56:03
