-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: monkey
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,934720420,419832079,'test'),(2,934720420,419832079,'message from u2 to nvim (u1)'),(3,934720420,419832079,'covid tester shouldn\'t be able to see this.'),(4,419832079,934720420,'ok'),(5,333847941,700969582,'test'),(6,419832079,700969582,'test'),(7,700969582,419832079,'test'),(8,700969582,419832079,'test'),(9,700969582,419832079,'tes test asdfasl;fdkja;gs'),(10,934720420,419832079,'yo u1'),(11,333847941,419832079,'yoh admin'),(12,419832079,333847941,'yoh user'),(13,333847941,419832079,'yoh admin again\''),(14,333847941,700969582,'hello admin'),(15,700969582,333847941,'hello user'),(16,333847941,934720420,'hello my fellow'),(17,934720420,333847941,'hello my bro'),(18,934720420,419832079,'yo u1'),(19,1645465005,934720420,'hi'),(20,934720420,1645465005,'test'),(21,1645465005,934720420,'just test'),(22,700969582,934720420,'test'),(23,419832079,934720420,'a;lsdfjaoizxvcl'),(24,1645465005,934720420,'testasdfsafd'),(25,934720420,419832079,'เธ—เธ”เธชเธญเธ'),(26,1645465005,419832079,'เธ—เธ”เธชเธญเธเธเธฃเธฑเธ'),(27,419832079,1645465005,'เธเธฃเธฑเธเธเธก'),(28,419832079,1645465005,'เธชเธญเธเธ–เธฒเธกเน€เธเธตเนเธขเธงเธเธฑเธเน€เธญเธเธชเธฒเธฃเธเธณเธเธฅเธ”เธเธฃเธฑเธ'),(29,419832079,1645465005,'เธชเธฒเธกเธฒเธฃเธ–เธฃเธฑเธเนเธ”เนเธ•เธญเธเนเธซเธเธเธฃเธฑเธ'),(30,1645465005,419832079,'เธชเธงเธฑเธชเธ”เธตเธเธฃเธฑเธเนเธญเธ”เธกเธดเธ'),(31,419832079,1645465005,'เธชเธงเธฑเธชเธ”เธตเธเนเธฒ'),(32,1645465005,419832079,'เธฐเธณเธซเธฐ'),(33,1645465005,419832079,'เธเธชเธซเธเธ”เนเธเธงเธเธ”เธเธตเธเนเธณเธฃเนเธดเธ—เธซเธงเธชเธฒเนเธญเนเธเธ'),(34,1645465005,419832079,'เธเธธเธกเธเธฑเธ'),(35,1645465005,419832079,'asdfasdfsafasdfaqwefasdfrewaf'),(36,1645465005,419832079,'เธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธ'),(37,1645465005,419832079,'dddddddddddddddddddddddddddddddddddd'),(38,1645465005,419832079,'เธเธเธเธเธเธเธเธเธเธเธเธเธซเธเน€เธเธซเธเธ”เธเธเนเธ”เน€เธ”เธเธซเธเธเธ”เน€'),(39,1645465005,419832079,'เธซเธเธ”'),(40,1645465005,419832079,'เนเธเธเธซเธเธฃเธญเธถเธตเธเธงเธเธซเธชเธณเธฒเธ”เนเธเนเธฃเนเธชเธเธซเธเธ”เธเนเธ เน€เธเธขเธฒเธตเธดเธเธ•เธเธญเนเธญเธเธฃเนเธญเนเธงเธ”เนเธฒเธณเธ”เธชเธฒเธเนเธกเธซเธ”เธญเนเธชเธ');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,934720420,'u1','u1','u1@gmail.com','0c0b9ecdc10e056f327f04c6727c92d6','1738555799214219526-dfb3cd22-7b67-475b-9294-914590d2913b-3677435849.jpg','Offline now','user'),(2,419832079,'u2','u2','u2@gmail.com','e0f5906ec31919804a414e02b4ea9b97','1738555845types-of-colorblindness-574022932.jpg','Offline now','user'),(3,700969582,'u2','u3','u3@gmail.com','fb2f96fe3410f561a56d2100a2702ee5','1738555870iHealth-covid-19-rapid-test-856887885.jpg','Offline now','user'),(7,1645465005,'admin','admin','admin@gmail.com','7a25b0bc04e77a2f7453dd021168cdc2','1738571766admin.jpg','Active now','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-03 20:58:09
