-- MySQL dump 10.13  Distrib 9.6.0, for macos26.2 (arm64)
--
-- Host: localhost    Database: campusconnect
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'd7e8b172-8332-11f0-9266-65761f3bc941:1-88';

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `description` text,
  `event_date` datetime DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `event_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (15,'Tech Career Fair 2026','Meet top tech companies hiring for internships and full-time positions','2026-04-10 00:00:00','Student Union Building',NULL,'10:00:00'),(16,'AI & Machine Learning Workshop','Hands-on workshop on building ML models with Python','2026-04-12 00:00:00','Computer Science Building Room 201',NULL,'14:30:00'),(17,'Campus Hackathon','24-hour coding competition with prizes worth $5000','2026-04-15 00:00:00','Engineering Hall',NULL,'09:00:00'),(18,'Resume Building Session','Learn how to create a professional resume that stands out','2026-04-18 00:00:00','Career Center',NULL,'15:00:00'),(19,'Spring Music Festival','Annual campus music festival featuring student bands','2026-04-20 00:00:00','Main Quad',NULL,'18:00:00'),(20,'Guest Lecture: Future of Space Exploration','NASA engineer discusses Mars missions','2026-04-22 00:00:00','Physics Auditorium',NULL,'11:00:00'),(21,'Basketball Tournament','Inter-department basketball competition','2026-04-25 00:00:00','Sports Complex',NULL,'16:00:00'),(22,'Financial Literacy Workshop','Learn about budgeting, investments and student loans','2026-04-27 00:00:00','Business School Room 105',NULL,'13:00:00'),(23,'Cultural Fest Night','Celebrate diversity with food, music and dance performances','2026-04-29 00:00:00','Student Center',NULL,'19:00:00'),(24,'Startup Pitch Competition','Present your business idea to investors - $10,000 prize','2026-05-02 00:00:00','Innovation Hub',NULL,'14:00:00'),(25,'Yoga and Meditation Session','De-stress before finals with guided meditation','2026-05-05 00:00:00','Wellness Center',NULL,'08:30:00'),(26,'Robotics Workshop','Build and program your first robot','2026-05-08 00:00:00','Engineering Lab B',NULL,'10:00:00'),(27,'International Food Festival','Taste cuisines from around the world','2026-05-10 00:00:00','International House',NULL,'12:00:00'),(28,'Career Networking Mixer','Connect with alumni working in various industries','2026-05-12 00:00:00','Alumni Hall',NULL,'17:30:00'),(29,'Photography Exhibition','Student photography showcase','2026-05-15 00:00:00','Art Gallery',NULL,'11:00:00'),(30,'Debate Competition','Inter-college debate on current affairs','2026-05-18 00:00:00','Humanities Building',NULL,'15:00:00'),(31,'Movie Night: Classic Cinema','Screening of classic films with discussion','2026-05-20 00:00:00','Auditorium',NULL,'19:30:00'),(32,'Sustainability Workshop','Learn about eco-friendly practices on campus','2026-05-22 00:00:00','Environmental Science Center',NULL,'13:00:00'),(33,'Chess Tournament','Open chess competition for all skill levels','2026-05-25 00:00:00','Student Lounge',NULL,'10:00:00'),(34,'End of Semester Party','Celebrate the end of semester with music and fun','2026-05-28 00:00:00','Main Quad',NULL,'20:00:00');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations`
--

LOCK TABLES `registrations` WRITE;
/*!40000 ALTER TABLE `registrations` DISABLE KEYS */;
INSERT INTO `registrations` VALUES (3,1,8,'registered'),(6,1,13,'registered'),(7,51,8,'registered'),(9,1,15,'registered'),(10,1,35,'registered'),(11,1,34,'registered'),(12,1,16,'registered'),(13,1,17,'registered'),(14,1,22,'registered'),(15,1,30,'registered'),(16,1,31,'registered'),(17,1,19,'registered'),(18,52,15,'registered'),(19,1,28,'registered'),(20,1,21,'registered'),(21,1,18,'registered'),(22,1,20,'registered'),(23,52,37,'registered'),(24,52,39,'registered'),(25,51,15,'registered'),(26,52,41,'registered'),(27,52,42,'registered'),(28,51,16,'registered'),(29,52,43,'registered');
/*!40000 ALTER TABLE `registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Aarav Patel','aarav.patel@campus.com','123456','student','2026-03-11 14:35:49'),(2,'Vivaan Shah','vivaan.shah@campus.com','123456','student','2026-03-11 14:35:49'),(3,'Aditya Mehta','aditya.mehta@campus.com','123456','student','2026-03-11 14:35:49'),(4,'Vihaan Desai','vihaan.desai@campus.com','123456','student','2026-03-11 14:35:49'),(5,'Arjun Joshi','arjun.joshi@campus.com','123456','student','2026-03-11 14:35:49'),(6,'Sai Reddy','sai.reddy@campus.com','123456','student','2026-03-11 14:35:49'),(7,'Krishna Nair','krishna.nair@campus.com','123456','student','2026-03-11 14:35:49'),(8,'Rohan Kapoor','rohan.kapoor@campus.com','123456','student','2026-03-11 14:35:49'),(9,'Ishaan Verma','ishaan.verma@campus.com','123456','student','2026-03-11 14:35:49'),(10,'Kabir Gupta','kabir.gupta@campus.com','123456','student','2026-03-11 14:35:49'),(11,'Anaya Sharma','anaya.sharma@campus.com','123456','student','2026-03-11 14:35:49'),(12,'Diya Patel','diya.patel@campus.com','123456','student','2026-03-11 14:35:49'),(13,'Aadhya Singh','aadhya.singh@campus.com','123456','student','2026-03-11 14:35:49'),(14,'Myra Shah','myra.shah@campus.com','123456','student','2026-03-11 14:35:49'),(15,'Ira Mehta','ira.mehta@campus.com','123456','student','2026-03-11 14:35:49'),(16,'Sara Khan','sara.khan@campus.com','123456','student','2026-03-11 14:35:49'),(17,'Kiara Kapoor','kiara.kapoor@campus.com','123456','student','2026-03-11 14:35:49'),(18,'Riya Joshi','riya.joshi@campus.com','123456','student','2026-03-11 14:35:49'),(19,'Anika Desai','anika.desai@campus.com','123456','student','2026-03-11 14:35:49'),(20,'Meera Nair','meera.nair@campus.com','123456','student','2026-03-11 14:35:49'),(21,'Yash Patel','yash.patel@campus.com','123456','student','2026-03-11 14:35:49'),(22,'Harsh Shah','harsh.shah@campus.com','123456','student','2026-03-11 14:35:49'),(23,'Dev Mehta','dev.mehta@campus.com','123456','student','2026-03-11 14:35:49'),(24,'Aryan Joshi','aryan.joshi@campus.com','123456','student','2026-03-11 14:35:49'),(25,'Dhruv Patel','dhruv.patel@campus.com','123456','student','2026-03-11 14:35:49'),(26,'Kunal Shah','kunal.shah@campus.com','123456','student','2026-03-11 14:35:49'),(27,'Parth Mehta','parth.mehta@campus.com','123456','student','2026-03-11 14:35:49'),(28,'Raj Patel','raj.patel@campus.com','123456','student','2026-03-11 14:35:49'),(29,'Tushar Shah','tushar.shah@campus.com','123456','student','2026-03-11 14:35:49'),(30,'Nikhil Joshi','nikhil.joshi@campus.com','123456','student','2026-03-11 14:35:49'),(31,'Sneha Patel','sneha.patel@campus.com','123456','student','2026-03-11 14:35:49'),(32,'Priya Shah','priya.shah@campus.com','123456','student','2026-03-11 14:35:49'),(33,'Pooja Mehta','pooja.mehta@campus.com','123456','student','2026-03-11 14:35:49'),(34,'Neha Joshi','neha.joshi@campus.com','123456','student','2026-03-11 14:35:49'),(35,'Kavya Patel','kavya.patel@campus.com','123456','student','2026-03-11 14:35:49'),(36,'Riddhi Shah','riddhi.shah@campus.com','123456','student','2026-03-11 14:35:49'),(37,'Khushi Mehta','khushi.mehta@campus.com','123456','student','2026-03-11 14:35:49'),(38,'Mansi Patel','mansi.patel@campus.com','123456','student','2026-03-11 14:35:49'),(39,'Palak Shah','palak.shah@campus.com','123456','student','2026-03-11 14:35:49'),(40,'Heena Patel','heena.patel@campus.com','123456','student','2026-03-11 14:35:49'),(41,'Om Patel','om.patel@campus.com','123456','student','2026-03-11 14:35:49'),(42,'Jay Shah','jay.shah@campus.com','123456','student','2026-03-11 14:35:49'),(43,'Meet Mehta','meet.mehta@campus.com','123456','student','2026-03-11 14:35:49'),(44,'Ravi Joshi','ravi.joshi@campus.com','123456','student','2026-03-11 14:35:49'),(45,'Karan Patel','karan.patel@campus.com','123456','student','2026-03-11 14:35:49'),(46,'Vikas Shah','vikas.shah@campus.com','123456','student','2026-03-11 14:35:49'),(47,'Manav Mehta','manav.mehta@campus.com','123456','student','2026-03-11 14:35:49'),(48,'Nirav Patel','nirav.patel@campus.com','123456','student','2026-03-11 14:35:49'),(49,'Chirag Shah','chirag.shah@campus.com','123456','student','2026-03-11 14:35:49'),(50,'Amit Mehta','amit.mehta@campus.com','123456','student','2026-03-11 14:35:49'),(51,'John Student','student@campus.edu','password123',NULL,'2026-03-17 08:02:35'),(52,'Admin User','admin@campus.edu','admin123','admin','2026-03-17 14:06:36'),(53,'Test User','test123@campus.edu','test123','student','2026-03-22 16:25:23'),(54,'dhruv dhonde','dhruv@campus.com','123456','student','2026-03-22 16:26:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-27 17:58:48
