-- MySQL dump 10.13  Distrib 9.6.0, for macos26.2 (arm64)
--
-- Host: localhost    Database: campusconnect
-- ------------------------------------------------------
-- Server version	9.4.0

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (15,'Tech Career Fair 2026','Meet top tech companies hiring for internships and full-time positions','2026-04-10 00:00:00','Student Union Building',NULL,'10:00:00'),(16,'AI & Machine Learning Workshop','Hands-on workshop on building ML models with Python','2026-04-12 00:00:00','Computer Science Building Room 201',NULL,'14:30:00'),(17,'Campus Hackathon','24-hour coding competition with prizes worth $5000','2026-04-15 00:00:00','Engineering Hall',NULL,'09:00:00'),(18,'Resume Building Session','Learn how to create a professional resume that stands out','2026-04-18 00:00:00','Career Center',NULL,'15:00:00'),(19,'Spring Music Festival','Annual campus music festival featuring student bands','2026-04-20 00:00:00','Main Quad',NULL,'18:00:00'),(20,'Guest Lecture: Future of Space Exploration','NASA engineer discusses Mars missions','2026-04-22 00:00:00','Physics Auditorium',NULL,'11:00:00'),(21,'Basketball Tournament','Inter-department basketball competition','2026-04-25 00:00:00','Sports Complex',NULL,'16:00:00'),(22,'Financial Literacy Workshop','Learn about budgeting, investments and student loans','2026-04-27 00:00:00','Business School Room 105',NULL,'13:00:00'),(23,'Cultural Fest Night','Celebrate diversity with food, music and dance performances','2026-04-29 00:00:00','Student Center',NULL,'19:00:00'),(24,'Startup Pitch Competition','Present your business idea to investors - $10,000 prize','2026-05-02 00:00:00','Innovation Hub',NULL,'14:00:00'),(25,'Yoga and Meditation Session','De-stress before finals with guided meditation','2026-05-05 00:00:00','Wellness Center',NULL,'08:30:00'),(26,'Robotics Workshop','Build and program your first robot','2026-05-08 00:00:00','Engineering Lab B',NULL,'10:00:00'),(27,'International Food Festival','Taste cuisines from around the world','2026-05-10 00:00:00','International House',NULL,'12:00:00'),(28,'Career Networking Mixer','Connect with alumni working in various industries','2026-05-12 00:00:00','Alumni Hall',NULL,'17:30:00'),(29,'Photography Exhibition','Student photography showcase','2026-05-15 00:00:00','Art Gallery',NULL,'11:00:00'),(30,'Debate Competition','Inter-college debate on current affairs','2026-05-18 00:00:00','Humanities Building',NULL,'15:00:00'),(31,'Movie Night: Classic Cinema','Screening of classic films with discussion','2026-05-20 00:00:00','Auditorium',NULL,'19:30:00'),(32,'Sustainability Workshop','Learn about eco-friendly practices on campus','2026-05-22 00:00:00','Environmental Science Center',NULL,'13:00:00'),(33,'Chess Tournament','Open chess competition for all skill levels','2026-05-25 00:00:00','Student Lounge',NULL,'10:00:00'),(34,'End of Semester Party','Celebrate the end of semester with music and fun','2026-05-28 00:00:00','Main Quad',NULL,'20:00:00');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-19 14:53:28
