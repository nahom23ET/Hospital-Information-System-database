CREATE DATABASE  IF NOT EXISTS `hospital_information_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital_information_system`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_information_system
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `allergen_codes`
--

DROP TABLE IF EXISTS `allergen_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergen_codes` (
  `allergen_code_id` int NOT NULL AUTO_INCREMENT,
  `allergen_name` varchar(150) NOT NULL,
  `code_system` varchar(50) DEFAULT NULL COMMENT 'e.g. SNOMED, NDF-RT, RxNorm',
  `external_code` varchar(50) DEFAULT NULL,
  `allergy_type` enum('Drug','Food','Environmental','Other') NOT NULL,
  PRIMARY KEY (`allergen_code_id`),
  UNIQUE KEY `uq_allergen_name` (`allergen_name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergen_codes`
--

LOCK TABLES `allergen_codes` WRITE;
/*!40000 ALTER TABLE `allergen_codes` DISABLE KEYS */;
INSERT INTO `allergen_codes` VALUES (1,'Penicillin',NULL,NULL,'Drug'),(2,'Amoxicillin',NULL,NULL,'Drug'),(3,'Aspirin',NULL,NULL,'Drug'),(4,'Ibuprofen',NULL,NULL,'Drug'),(5,'Sulfa Drugs',NULL,NULL,'Drug'),(6,'Codeine',NULL,NULL,'Drug'),(7,'Morphine',NULL,NULL,'Drug'),(8,'Insulin',NULL,NULL,'Drug'),(9,'Peanuts',NULL,NULL,'Food'),(10,'Tree Nuts',NULL,NULL,'Food'),(11,'Milk',NULL,NULL,'Food'),(12,'Eggs',NULL,NULL,'Food'),(13,'Shellfish',NULL,NULL,'Food'),(14,'Fish',NULL,NULL,'Food'),(15,'Soy',NULL,NULL,'Food'),(16,'Wheat',NULL,NULL,'Food'),(17,'Latex',NULL,NULL,'Environmental'),(18,'Pollen',NULL,NULL,'Environmental'),(19,'Dust',NULL,NULL,'Environmental'),(20,'Mold',NULL,NULL,'Environmental'),(21,'Animal Dander',NULL,NULL,'Environmental'),(22,'Insect Stings',NULL,NULL,'Other'),(23,'Contrast Dye',NULL,NULL,'Other');
/*!40000 ALTER TABLE `allergen_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergies`
--

DROP TABLE IF EXISTS `allergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergies` (
  `allergy_id` int NOT NULL AUTO_INCREMENT,
  `allergen_code_id` int DEFAULT NULL COMMENT 'FK to allergen_codes',
  `allergen_name` varchar(100) NOT NULL,
  `allergy_type` enum('Drug','Food','Environmental','Other') DEFAULT 'Other',
  PRIMARY KEY (`allergy_id`),
  UNIQUE KEY `allergen_name` (`allergen_name`),
  KEY `idx_allergies_code_id` (`allergen_code_id`),
  CONSTRAINT `fk_allergies_code` FOREIGN KEY (`allergen_code_id`) REFERENCES `allergen_codes` (`allergen_code_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergies`
--

LOCK TABLES `allergies` WRITE;
/*!40000 ALTER TABLE `allergies` DISABLE KEYS */;
INSERT INTO `allergies` VALUES (1,1,'Penicillin','Drug'),(2,2,'Amoxicillin','Drug'),(3,3,'Aspirin','Drug'),(4,4,'Ibuprofen','Drug'),(5,5,'Sulfa Drugs','Drug'),(6,6,'Codeine','Drug'),(7,7,'Morphine','Drug'),(8,8,'Insulin','Drug'),(9,9,'Peanuts','Food'),(10,10,'Tree Nuts','Food'),(11,11,'Milk','Food'),(12,12,'Eggs','Food'),(13,13,'Shellfish','Food'),(14,14,'Fish','Food'),(15,15,'Soy','Food'),(16,16,'Wheat','Food'),(17,17,'Latex','Environmental'),(18,18,'Pollen','Environmental'),(19,19,'Dust','Environmental'),(20,20,'Mold','Environmental'),(21,21,'Animal Dander','Environmental'),(22,22,'Insect Stings','Other'),(23,23,'Contrast Dye','Other');
/*!40000 ALTER TABLE `allergies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allowances`
--

DROP TABLE IF EXISTS `allowances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allowances` (
  `allowance_id` int NOT NULL AUTO_INCREMENT,
  `allowance_name` varchar(100) NOT NULL,
  `allowance_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`allowance_id`),
  UNIQUE KEY `allowance_name` (`allowance_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowances`
--

LOCK TABLES `allowances` WRITE;
/*!40000 ALTER TABLE `allowances` DISABLE KEYS */;
INSERT INTO `allowances` VALUES (1,'Transport Allowance','Transportation support for commuting employees'),(2,'Meal Allowance','Meal support during scheduled shifts'),(3,'Housing Allowance','Housing support for eligible staff'),(4,'Night Shift Allowance','Additional pay for overnight shifts'),(5,'Weekend Allowance','Additional pay for weekend duty'),(6,'On-Call Allowance','Compensation for on-call availability'),(7,'Overtime Allowance','Additional earnings for overtime hours'),(8,'Hazard Allowance','Extra pay for hazardous or high-risk work areas'),(9,'Uniform Allowance','Support for uniforms and work attire'),(10,'Communication Allowance','Phone and communication reimbursement'),(11,'Training Allowance','Support for approved training and certification'),(12,'Relocation Allowance','Support for employee relocation expenses'),(13,'Childcare Allowance','Childcare support for eligible employees'),(14,'Medical Allowance','Employee healthcare-related support'),(15,'Attendance Bonus','Bonus for excellent attendance'),(16,'Performance Bonus','Bonus based on performance evaluation'),(17,'Holiday Allowance','Additional pay for public holiday duty'),(18,'ICU Allowance','Additional pay for ICU assignments'),(19,'ER Allowance','Additional pay for Emergency Room assignments'),(20,'Rural Assignment Allowance','Support for remote or rural assignment roles');
/*!40000 ALTER TABLE `allowances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_key_roles`
--

DROP TABLE IF EXISTS `api_key_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_key_roles` (
  `api_key_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`api_key_id`,`role_id`),
  KEY `idx_akr_role_id` (`role_id`),
  CONSTRAINT `fk_akr_key` FOREIGN KEY (`api_key_id`) REFERENCES `api_keys` (`api_key_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_akr_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_key_roles`
--

LOCK TABLES `api_key_roles` WRITE;
/*!40000 ALTER TABLE `api_key_roles` DISABLE KEYS */;
INSERT INTO `api_key_roles` VALUES (1,1),(10,1),(20,2),(18,3),(2,6),(17,6),(4,10),(5,11),(14,17),(3,18),(15,18),(6,19),(16,20),(8,21),(7,23),(9,28),(19,31),(11,33),(12,34),(13,35);
/*!40000 ALTER TABLE `api_key_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_keys` (
  `api_key_id` int NOT NULL AUTO_INCREMENT,
  `key_hash` varchar(255) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `rate_limit_per_min` int DEFAULT '60',
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_used_at` datetime DEFAULT NULL,
  PRIMARY KEY (`api_key_id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `api_keys_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `api_keys_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
INSERT INTO `api_keys` VALUES (1,'hash-api-001','Patient Portal API',4,1,1,120,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-20 12:00:00'),(2,'hash-api-002','Mobile App API',6,6,1,100,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 09:15:00'),(3,'hash-api-003','Billing System API',11,18,1,80,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 10:30:00'),(4,'hash-api-004','Lab Integration API',20,10,1,90,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 11:45:00'),(5,'hash-api-005','Pharmacy System API',10,11,1,85,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 13:00:00'),(6,'hash-api-006','Insurance Gateway API',23,19,1,70,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 14:10:00'),(7,'hash-api-007','HR Portal API',12,23,1,60,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 15:20:00'),(8,'hash-api-008','Payroll Service API',25,21,1,65,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 16:00:00'),(9,'hash-api-009','Reporting Dashboard API',28,28,1,50,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 16:45:00'),(10,'hash-api-010','Admin Console API',31,1,1,150,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 17:30:00'),(11,'hash-api-011','Audit Service API',36,33,1,40,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-20 18:00:00'),(12,'hash-api-012','Compliance Monitor API',37,34,1,40,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-20 18:30:00'),(13,'hash-api-013','Research Data API',38,35,1,30,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-20 19:00:00'),(14,'hash-api-014','Transport System API',21,17,1,55,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-20 19:30:00'),(15,'hash-api-015','Facility Management API',22,18,1,45,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-20 20:00:00'),(16,'hash-api-016','Legacy Billing API',24,20,0,60,'2025-12-31 00:00:00','2026-04-30 13:51:29','2025-12-01 12:00:00'),(17,'hash-api-017','Old Mobile App API',8,6,0,80,'2025-11-30 00:00:00','2026-04-30 13:51:29','2025-11-15 10:00:00'),(18,'hash-api-018','Test Sandbox API',33,3,1,200,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 18:00:00'),(19,'hash-api-019','Analytics Engine API',30,31,1,70,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 18:30:00'),(20,'hash-api-020','Backup Sync API',32,2,1,90,'2027-01-01 00:00:00','2026-04-30 13:51:29','2026-04-21 19:00:00');
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `appointment_checkin_view`
--

DROP TABLE IF EXISTS `appointment_checkin_view`;
/*!50001 DROP VIEW IF EXISTS `appointment_checkin_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `appointment_checkin_view` AS SELECT 
 1 AS `appointment_id`,
 1 AS `patient_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `appt_datetime`,
 1 AS `appointment_status`,
 1 AS `checkin_id`,
 1 AS `checkin_time`,
 1 AS `method`,
 1 AS `checkin_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `cancelled_by_user_id` int DEFAULT NULL,
  `appt_datetime` datetime NOT NULL,
  `duration_minutes` int NOT NULL DEFAULT '30' COMMENT 'Appointment length in minutes',
  `status` enum('Scheduled','Completed','NoShow','Cancelled') DEFAULT 'Scheduled',
  `cancel_reason` varchar(255) DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `provider_id` (`provider_id`),
  KEY `department_id` (`department_id`),
  KEY `cancelled_by_user_id` (`cancelled_by_user_id`),
  KEY `idx_appointment_datetime` (`appt_datetime`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `appointments_ibfk_4` FOREIGN KEY (`cancelled_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,1,1,NULL,'2026-04-01 08:00:00',30,'Completed',NULL,NULL),(2,2,2,2,NULL,'2026-04-01 08:30:00',30,'Completed',NULL,NULL),(3,3,3,5,NULL,'2026-04-01 09:00:00',30,'Completed',NULL,NULL),(4,4,4,6,NULL,'2026-04-01 09:30:00',30,'Completed',NULL,NULL),(5,5,5,7,NULL,'2026-04-01 10:00:00',30,'Completed',NULL,NULL),(6,6,6,8,NULL,'2026-04-01 10:30:00',30,'Completed',NULL,NULL),(7,7,7,9,NULL,'2026-04-01 11:00:00',30,'Completed',NULL,NULL),(8,8,8,1,NULL,'2026-04-01 11:30:00',30,'Completed',NULL,NULL),(9,9,9,2,NULL,'2026-04-01 13:00:00',30,'Completed',NULL,NULL),(10,10,10,5,NULL,'2026-04-01 13:30:00',30,'Completed',NULL,NULL),(11,11,11,6,NULL,'2026-04-01 14:00:00',30,'Completed',NULL,NULL),(12,12,12,7,NULL,'2026-04-01 14:30:00',30,'Completed',NULL,NULL),(13,13,13,8,NULL,'2026-04-02 08:00:00',30,'Completed',NULL,NULL),(14,14,14,9,NULL,'2026-04-02 08:30:00',30,'Completed',NULL,NULL),(15,15,15,1,NULL,'2026-04-02 09:00:00',30,'Completed',NULL,NULL),(16,16,1,2,NULL,'2026-04-02 09:30:00',30,'Completed',NULL,NULL),(17,17,2,5,NULL,'2026-04-02 10:00:00',30,'Completed',NULL,NULL),(18,18,3,6,NULL,'2026-04-02 10:30:00',30,'Completed',NULL,NULL),(19,19,4,7,NULL,'2026-04-02 11:00:00',30,'Completed',NULL,NULL),(20,20,5,8,NULL,'2026-04-02 11:30:00',30,'Completed',NULL,NULL),(21,21,6,9,NULL,'2026-04-02 13:00:00',30,'Completed',NULL,NULL),(22,22,7,1,NULL,'2026-04-02 13:30:00',30,'Completed',NULL,NULL),(23,23,8,2,NULL,'2026-04-02 14:00:00',30,'Completed',NULL,NULL),(24,24,9,5,NULL,'2026-04-02 14:30:00',30,'Completed',NULL,NULL),(25,25,10,6,NULL,'2026-04-03 08:00:00',30,'Completed',NULL,NULL),(26,26,11,7,NULL,'2026-04-03 08:30:00',30,'Completed',NULL,NULL),(27,27,12,8,NULL,'2026-04-03 09:00:00',30,'Completed',NULL,NULL),(28,28,13,9,NULL,'2026-04-03 09:30:00',30,'Completed',NULL,NULL),(29,29,14,1,NULL,'2026-04-03 10:00:00',30,'Completed',NULL,NULL),(30,30,15,2,NULL,'2026-04-03 10:30:00',30,'Completed',NULL,NULL),(31,31,1,5,NULL,'2026-04-03 11:00:00',30,'Completed',NULL,NULL),(32,32,2,6,NULL,'2026-04-03 11:30:00',30,'Completed',NULL,NULL),(33,33,3,7,NULL,'2026-04-03 13:00:00',30,'Completed',NULL,NULL),(34,34,4,8,NULL,'2026-04-03 13:30:00',30,'Completed',NULL,NULL),(35,35,5,9,NULL,'2026-04-03 14:00:00',30,'Completed',NULL,NULL),(36,36,6,1,NULL,'2026-04-03 14:30:00',30,'Completed',NULL,NULL),(37,37,7,2,NULL,'2026-04-04 08:00:00',30,'Completed',NULL,NULL),(38,38,8,5,NULL,'2026-04-04 08:30:00',30,'Completed',NULL,NULL),(39,39,9,6,NULL,'2026-04-04 09:00:00',30,'Completed',NULL,NULL),(40,40,10,7,NULL,'2026-04-04 09:30:00',30,'Completed',NULL,NULL),(41,41,11,8,NULL,'2026-04-04 10:00:00',30,'Completed',NULL,NULL),(42,42,12,9,NULL,'2026-04-04 10:30:00',30,'Completed',NULL,NULL),(43,43,13,1,NULL,'2026-04-04 11:00:00',30,'Completed',NULL,NULL),(44,44,14,2,NULL,'2026-04-04 11:30:00',30,'Completed',NULL,NULL),(45,45,15,5,NULL,'2026-04-04 13:00:00',30,'Completed',NULL,NULL),(46,46,1,6,NULL,'2026-04-04 13:30:00',30,'Completed',NULL,NULL),(47,47,2,7,NULL,'2026-04-04 14:00:00',30,'Completed',NULL,NULL),(48,48,3,8,NULL,'2026-04-04 14:30:00',30,'Completed',NULL,NULL),(49,49,4,9,NULL,'2026-04-05 08:00:00',30,'Completed',NULL,NULL),(50,50,5,1,NULL,'2026-04-05 08:30:00',30,'Completed',NULL,NULL),(51,51,6,2,NULL,'2026-04-05 09:00:00',30,'Completed',NULL,NULL),(52,52,7,5,NULL,'2026-04-05 09:30:00',30,'Completed',NULL,NULL),(53,53,8,6,NULL,'2026-04-05 10:00:00',30,'Completed',NULL,NULL),(54,54,9,7,NULL,'2026-04-05 10:30:00',30,'Completed',NULL,NULL),(55,55,10,8,NULL,'2026-04-05 11:00:00',30,'Completed',NULL,NULL),(56,56,11,9,NULL,'2026-04-05 11:30:00',30,'Completed',NULL,NULL),(57,57,12,1,NULL,'2026-04-05 13:00:00',30,'Completed',NULL,NULL),(58,58,13,2,NULL,'2026-04-05 13:30:00',30,'Completed',NULL,NULL),(59,59,14,5,NULL,'2026-04-05 14:00:00',30,'Completed',NULL,NULL),(60,60,15,6,NULL,'2026-04-05 14:30:00',30,'Completed',NULL,NULL),(61,61,1,7,NULL,'2026-04-06 08:00:00',30,'Completed',NULL,NULL),(62,62,2,8,NULL,'2026-04-06 08:30:00',30,'Completed',NULL,NULL),(63,63,3,9,NULL,'2026-04-06 09:00:00',30,'Completed',NULL,NULL),(64,64,4,1,NULL,'2026-04-06 09:30:00',30,'Completed',NULL,NULL),(65,65,5,2,NULL,'2026-04-06 10:00:00',30,'Completed',NULL,NULL),(66,66,6,5,NULL,'2026-04-06 10:30:00',30,'Completed',NULL,NULL),(67,67,7,6,NULL,'2026-04-06 11:00:00',30,'Completed',NULL,NULL),(68,68,8,7,NULL,'2026-04-06 11:30:00',30,'Completed',NULL,NULL),(69,69,9,8,NULL,'2026-04-06 13:00:00',30,'Completed',NULL,NULL),(70,70,10,9,NULL,'2026-04-06 13:30:00',30,'Completed',NULL,NULL),(71,71,11,1,NULL,'2026-04-06 14:00:00',30,'Completed',NULL,NULL),(72,72,12,2,NULL,'2026-04-06 14:30:00',30,'Completed',NULL,NULL),(73,73,13,5,NULL,'2026-04-07 08:00:00',30,'Completed',NULL,NULL),(74,74,14,6,NULL,'2026-04-07 08:30:00',30,'Completed',NULL,NULL),(75,75,15,7,NULL,'2026-04-07 09:00:00',30,'Completed',NULL,NULL),(76,76,1,8,NULL,'2026-04-07 09:30:00',30,'Completed',NULL,NULL),(77,77,2,9,NULL,'2026-04-07 10:00:00',30,'Completed',NULL,NULL),(78,78,3,1,NULL,'2026-04-07 10:30:00',30,'Completed',NULL,NULL),(79,79,4,2,NULL,'2026-04-07 11:00:00',30,'Completed',NULL,NULL),(80,80,5,5,NULL,'2026-04-07 11:30:00',30,'Completed',NULL,NULL),(81,81,6,6,NULL,'2026-04-07 13:00:00',30,'Completed',NULL,NULL),(82,82,7,7,NULL,'2026-04-07 13:30:00',30,'Completed',NULL,NULL),(83,83,8,8,NULL,'2026-04-07 14:00:00',30,'Completed',NULL,NULL),(84,84,9,9,NULL,'2026-04-07 14:30:00',30,'Completed',NULL,NULL),(85,85,10,1,NULL,'2026-04-08 08:00:00',30,'Completed',NULL,NULL),(86,86,11,2,NULL,'2026-04-08 08:30:00',30,'Completed',NULL,NULL),(87,87,12,5,NULL,'2026-04-08 09:00:00',30,'Completed',NULL,NULL),(88,88,13,6,NULL,'2026-04-08 09:30:00',30,'Completed',NULL,NULL),(89,89,14,7,NULL,'2026-04-08 10:00:00',30,'Completed',NULL,NULL),(90,90,15,8,NULL,'2026-04-08 10:30:00',30,'Completed',NULL,NULL),(91,91,1,9,NULL,'2026-04-08 11:00:00',30,'Completed',NULL,NULL),(92,92,2,1,NULL,'2026-04-08 11:30:00',30,'Completed',NULL,NULL),(93,93,3,2,NULL,'2026-04-08 13:00:00',30,'Completed',NULL,NULL),(94,94,4,5,NULL,'2026-04-08 13:30:00',30,'Completed',NULL,NULL),(95,95,5,6,NULL,'2026-04-08 14:00:00',30,'Completed',NULL,NULL),(96,96,6,7,NULL,'2026-04-08 14:30:00',30,'Completed',NULL,NULL),(97,97,7,8,NULL,'2026-04-09 08:00:00',30,'Completed',NULL,NULL),(98,98,8,9,NULL,'2026-04-09 08:30:00',30,'Completed',NULL,NULL),(99,99,9,1,NULL,'2026-04-09 09:00:00',30,'Completed',NULL,NULL),(100,100,10,2,NULL,'2026-04-09 09:30:00',30,'Completed',NULL,NULL),(101,1,11,5,NULL,'2026-04-10 08:00:00',30,'Scheduled',NULL,NULL),(102,2,12,6,NULL,'2026-04-10 08:30:00',30,'Scheduled',NULL,NULL),(103,3,13,7,NULL,'2026-04-10 09:00:00',30,'Scheduled',NULL,NULL),(104,4,14,8,NULL,'2026-04-10 09:30:00',30,'Scheduled',NULL,NULL),(105,5,15,9,NULL,'2026-04-10 10:00:00',30,'Scheduled',NULL,NULL),(106,6,1,1,NULL,'2026-04-10 10:30:00',30,'Scheduled',NULL,NULL),(107,7,2,2,NULL,'2026-04-10 11:00:00',30,'Scheduled',NULL,NULL),(108,8,3,5,NULL,'2026-04-10 11:30:00',30,'Scheduled',NULL,NULL),(109,9,4,6,NULL,'2026-04-10 13:00:00',30,'Scheduled',NULL,NULL),(110,10,5,7,NULL,'2026-04-10 13:30:00',30,'Scheduled',NULL,NULL),(111,11,6,8,NULL,'2026-04-10 14:00:00',30,'Scheduled',NULL,NULL),(112,12,7,9,NULL,'2026-04-10 14:30:00',30,'Scheduled',NULL,NULL),(113,13,8,1,NULL,'2026-04-11 08:00:00',30,'Scheduled',NULL,NULL),(114,14,9,2,NULL,'2026-04-11 08:30:00',30,'Scheduled',NULL,NULL),(115,15,10,5,NULL,'2026-04-11 09:00:00',30,'Scheduled',NULL,NULL),(116,16,11,6,NULL,'2026-04-11 09:30:00',30,'Scheduled',NULL,NULL),(117,17,12,7,NULL,'2026-04-11 10:00:00',30,'Scheduled',NULL,NULL),(118,18,13,8,NULL,'2026-04-11 10:30:00',30,'Scheduled',NULL,NULL),(119,19,14,9,NULL,'2026-04-11 11:00:00',30,'Scheduled',NULL,NULL),(120,20,15,1,NULL,'2026-04-11 11:30:00',30,'Scheduled',NULL,NULL),(121,21,1,2,NULL,'2026-04-11 13:00:00',30,'Scheduled',NULL,NULL),(122,22,2,5,NULL,'2026-04-11 13:30:00',30,'Scheduled',NULL,NULL),(123,23,3,6,NULL,'2026-04-11 14:00:00',30,'Scheduled',NULL,NULL),(124,24,4,7,NULL,'2026-04-11 14:30:00',30,'Scheduled',NULL,NULL),(125,25,5,8,NULL,'2026-04-12 08:00:00',30,'Scheduled',NULL,NULL),(126,26,6,9,NULL,'2026-04-12 08:30:00',30,'Scheduled',NULL,NULL),(127,27,7,1,NULL,'2026-04-12 09:00:00',30,'Scheduled',NULL,NULL),(128,28,8,2,NULL,'2026-04-12 09:30:00',30,'Scheduled',NULL,NULL),(129,29,9,5,NULL,'2026-04-12 10:00:00',30,'Scheduled',NULL,NULL),(130,30,10,6,NULL,'2026-04-12 10:30:00',30,'Scheduled',NULL,NULL),(131,31,11,7,NULL,'2026-04-12 11:00:00',30,'Scheduled',NULL,NULL),(132,32,12,8,NULL,'2026-04-12 11:30:00',30,'Scheduled',NULL,NULL),(133,33,13,9,NULL,'2026-04-12 13:00:00',30,'Scheduled',NULL,NULL),(134,34,14,1,NULL,'2026-04-12 13:30:00',30,'Scheduled',NULL,NULL),(135,35,15,2,NULL,'2026-04-12 14:00:00',30,'Scheduled',NULL,NULL),(136,36,1,5,NULL,'2026-04-12 14:30:00',30,'Scheduled',NULL,NULL),(137,37,2,6,NULL,'2026-04-13 08:00:00',30,'Scheduled',NULL,NULL),(138,38,3,7,NULL,'2026-04-13 08:30:00',30,'Scheduled',NULL,NULL),(139,39,4,8,NULL,'2026-04-13 09:00:00',30,'Scheduled',NULL,NULL),(140,40,5,9,NULL,'2026-04-13 09:30:00',30,'Scheduled',NULL,NULL),(141,41,6,1,NULL,'2026-04-13 10:00:00',30,'Scheduled',NULL,NULL),(142,42,7,2,NULL,'2026-04-13 10:30:00',30,'Scheduled',NULL,NULL),(143,43,8,5,NULL,'2026-04-13 11:00:00',30,'Scheduled',NULL,NULL),(144,44,9,6,NULL,'2026-04-13 11:30:00',30,'Scheduled',NULL,NULL),(145,45,10,7,NULL,'2026-04-13 13:00:00',30,'Scheduled',NULL,NULL),(146,46,11,8,NULL,'2026-04-13 13:30:00',30,'Scheduled',NULL,NULL),(147,47,12,9,NULL,'2026-04-13 14:00:00',30,'Scheduled',NULL,NULL),(148,48,13,1,NULL,'2026-04-13 14:30:00',30,'Scheduled',NULL,NULL),(149,49,14,2,NULL,'2026-04-14 08:00:00',30,'Scheduled',NULL,NULL),(150,50,15,5,NULL,'2026-04-14 08:30:00',30,'Scheduled',NULL,NULL),(151,51,1,6,NULL,'2026-04-14 09:00:00',30,'Scheduled',NULL,NULL),(152,52,2,7,NULL,'2026-04-14 09:30:00',30,'Scheduled',NULL,NULL),(153,53,3,8,NULL,'2026-04-14 10:00:00',30,'Scheduled',NULL,NULL),(154,54,4,9,NULL,'2026-04-14 10:30:00',30,'Scheduled',NULL,NULL),(155,55,5,1,NULL,'2026-04-14 11:00:00',30,'Scheduled',NULL,NULL),(156,56,6,2,NULL,'2026-04-14 11:30:00',30,'Scheduled',NULL,NULL),(157,57,7,5,NULL,'2026-04-14 13:00:00',30,'Scheduled',NULL,NULL),(158,58,8,6,NULL,'2026-04-14 13:30:00',30,'Scheduled',NULL,NULL),(159,59,9,7,NULL,'2026-04-14 14:00:00',30,'Scheduled',NULL,NULL),(160,60,10,8,NULL,'2026-04-14 14:30:00',30,'Scheduled',NULL,NULL),(161,61,11,9,NULL,'2026-04-15 08:00:00',30,'Scheduled',NULL,NULL),(162,62,12,1,NULL,'2026-04-15 08:30:00',30,'Scheduled',NULL,NULL),(163,63,13,2,NULL,'2026-04-15 09:00:00',30,'Scheduled',NULL,NULL),(164,64,14,5,NULL,'2026-04-15 09:30:00',30,'Scheduled',NULL,NULL),(165,65,15,6,NULL,'2026-04-15 10:00:00',30,'Scheduled',NULL,NULL),(166,66,1,7,NULL,'2026-04-15 10:30:00',30,'Scheduled',NULL,NULL),(167,67,2,8,NULL,'2026-04-15 11:00:00',30,'Scheduled',NULL,NULL),(168,68,3,9,NULL,'2026-04-15 11:30:00',30,'Scheduled',NULL,NULL),(169,69,4,1,NULL,'2026-04-15 13:00:00',30,'Scheduled',NULL,NULL),(170,70,5,2,NULL,'2026-04-15 13:30:00',30,'Scheduled',NULL,NULL),(171,71,6,5,NULL,'2026-04-15 14:00:00',30,'Scheduled',NULL,NULL),(172,72,7,6,NULL,'2026-04-15 14:30:00',30,'Scheduled',NULL,NULL),(173,73,8,7,NULL,'2026-04-16 08:00:00',30,'Scheduled',NULL,NULL),(174,74,9,8,NULL,'2026-04-16 08:30:00',30,'Scheduled',NULL,NULL),(175,75,10,9,NULL,'2026-04-16 09:00:00',30,'Scheduled',NULL,NULL),(176,76,11,1,NULL,'2026-04-16 09:30:00',30,'Scheduled',NULL,NULL),(177,77,12,2,NULL,'2026-04-16 10:00:00',30,'Scheduled',NULL,NULL),(178,78,13,5,NULL,'2026-04-16 10:30:00',30,'Scheduled',NULL,NULL),(179,79,14,6,NULL,'2026-04-16 11:00:00',30,'Scheduled',NULL,NULL),(180,80,15,7,NULL,'2026-04-16 11:30:00',30,'Scheduled',NULL,NULL),(181,81,1,8,NULL,'2026-04-16 13:00:00',30,'Scheduled',NULL,NULL),(182,82,2,9,NULL,'2026-04-16 13:30:00',30,'Scheduled',NULL,NULL),(183,83,3,1,NULL,'2026-04-16 14:00:00',30,'Scheduled',NULL,NULL),(184,84,4,2,NULL,'2026-04-16 14:30:00',30,'Scheduled',NULL,NULL),(185,85,5,5,NULL,'2026-04-17 08:00:00',30,'Scheduled',NULL,NULL),(186,86,6,6,NULL,'2026-04-17 08:30:00',30,'Scheduled',NULL,NULL),(187,87,7,7,NULL,'2026-04-17 09:00:00',30,'Scheduled',NULL,NULL),(188,88,8,8,NULL,'2026-04-17 09:30:00',30,'Scheduled',NULL,NULL),(189,89,9,9,NULL,'2026-04-17 10:00:00',30,'Scheduled',NULL,NULL),(190,90,10,1,NULL,'2026-04-17 10:30:00',30,'Scheduled',NULL,NULL),(191,91,11,2,NULL,'2026-04-17 11:00:00',30,'Scheduled',NULL,NULL),(192,92,12,5,NULL,'2026-04-17 11:30:00',30,'Scheduled',NULL,NULL),(193,93,13,6,NULL,'2026-04-17 13:00:00',30,'Scheduled',NULL,NULL),(194,94,14,7,NULL,'2026-04-17 13:30:00',30,'Scheduled',NULL,NULL),(195,95,15,8,NULL,'2026-04-17 14:00:00',30,'Scheduled',NULL,NULL),(196,96,1,9,NULL,'2026-04-17 14:30:00',30,'Scheduled',NULL,NULL),(197,97,2,1,NULL,'2026-04-18 08:00:00',30,'Scheduled',NULL,NULL),(198,98,3,2,NULL,'2026-04-18 08:30:00',30,'Scheduled',NULL,NULL),(199,99,4,5,NULL,'2026-04-18 09:00:00',30,'Scheduled',NULL,NULL),(200,100,5,6,NULL,'2026-04-18 09:30:00',30,'Scheduled',NULL,NULL);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `log_type` enum('IN','OUT') NOT NULL,
  `datetime_log` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`attendance_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,6,'IN','2026-04-01 06:55:00','2026-04-30 13:51:29'),(2,6,'OUT','2026-04-01 15:05:00','2026-04-30 13:51:29'),(3,7,'IN','2026-04-01 06:58:00','2026-04-30 13:51:29'),(4,7,'OUT','2026-04-01 15:02:00','2026-04-30 13:51:29'),(5,8,'IN','2026-04-01 14:55:00','2026-04-30 13:51:29'),(6,8,'OUT','2026-04-01 23:10:00','2026-04-30 13:51:29'),(7,9,'IN','2026-04-01 22:50:00','2026-04-30 13:51:29'),(8,9,'OUT','2026-04-02 07:05:00','2026-04-30 13:51:29'),(9,10,'IN','2026-04-01 07:00:00','2026-04-30 13:51:29'),(10,10,'OUT','2026-04-01 15:00:00','2026-04-30 13:51:29'),(11,11,'IN','2026-04-01 08:00:00','2026-04-30 13:51:29'),(12,11,'OUT','2026-04-01 16:00:00','2026-04-30 13:51:29'),(13,12,'IN','2026-04-01 08:10:00','2026-04-30 13:51:29'),(14,12,'OUT','2026-04-01 16:05:00','2026-04-30 13:51:29'),(15,13,'IN','2026-04-01 08:00:00','2026-04-30 13:51:29'),(16,13,'OUT','2026-04-01 16:00:00','2026-04-30 13:51:29'),(17,14,'IN','2026-04-01 08:05:00','2026-04-30 13:51:29'),(18,14,'OUT','2026-04-01 16:10:00','2026-04-30 13:51:29'),(19,6,'IN','2026-04-02 06:57:00','2026-04-30 13:51:29'),(20,6,'OUT','2026-04-02 15:03:00','2026-04-30 13:51:29'),(21,7,'IN','2026-04-02 07:02:00','2026-04-30 13:51:29'),(22,7,'OUT','2026-04-02 15:01:00','2026-04-30 13:51:29'),(23,8,'IN','2026-04-02 15:00:00','2026-04-30 13:51:29'),(24,8,'OUT','2026-04-02 23:05:00','2026-04-30 13:51:29'),(25,9,'IN','2026-04-02 23:00:00','2026-04-30 13:51:29'),(26,9,'OUT','2026-04-03 07:10:00','2026-04-30 13:51:29'),(27,10,'IN','2026-04-02 07:01:00','2026-04-30 13:51:29'),(28,10,'OUT','2026-04-02 15:00:00','2026-04-30 13:51:29'),(29,11,'IN','2026-04-02 08:00:00','2026-04-30 13:51:29'),(30,11,'OUT','2026-04-02 16:00:00','2026-04-30 13:51:29'),(31,12,'IN','2026-04-02 08:03:00','2026-04-30 13:51:29'),(32,12,'OUT','2026-04-02 16:08:00','2026-04-30 13:51:29'),(33,13,'IN','2026-04-02 08:00:00','2026-04-30 13:51:29'),(34,13,'OUT','2026-04-02 16:00:00','2026-04-30 13:51:29'),(35,14,'IN','2026-04-02 08:06:00','2026-04-30 13:51:29'),(36,14,'OUT','2026-04-02 16:10:00','2026-04-30 13:51:29'),(37,6,'IN','2026-04-03 06:59:00','2026-04-30 13:51:29'),(38,6,'OUT','2026-04-03 15:04:00','2026-04-30 13:51:29'),(39,7,'IN','2026-04-03 07:00:00','2026-04-30 13:51:29'),(40,7,'OUT','2026-04-03 15:00:00','2026-04-30 13:51:29'),(41,8,'IN','2026-04-03 15:02:00','2026-04-30 13:51:29'),(42,8,'OUT','2026-04-03 23:08:00','2026-04-30 13:51:29'),(43,9,'IN','2026-04-03 22:55:00','2026-04-30 13:51:29'),(44,9,'OUT','2026-04-04 07:03:00','2026-04-30 13:51:29'),(45,10,'IN','2026-04-03 07:00:00','2026-04-30 13:51:29'),(46,10,'OUT','2026-04-03 15:00:00','2026-04-30 13:51:29'),(47,11,'IN','2026-04-03 08:00:00','2026-04-30 13:51:29'),(48,11,'OUT','2026-04-03 16:00:00','2026-04-30 13:51:29'),(49,12,'IN','2026-04-03 08:05:00','2026-04-30 13:51:29'),(50,12,'OUT','2026-04-03 16:10:00','2026-04-30 13:51:29'),(51,13,'IN','2026-04-03 08:00:00','2026-04-30 13:51:29'),(52,13,'OUT','2026-04-03 16:00:00','2026-04-30 13:51:29'),(53,14,'IN','2026-04-03 08:08:00','2026-04-30 13:51:29'),(54,14,'OUT','2026-04-03 16:12:00','2026-04-30 13:51:29'),(55,6,'IN','2026-04-04 07:01:00','2026-04-30 13:51:29'),(56,6,'OUT','2026-04-04 15:02:00','2026-04-30 13:51:29'),(57,7,'IN','2026-04-04 06:59:00','2026-04-30 13:51:29'),(58,7,'OUT','2026-04-04 15:01:00','2026-04-30 13:51:29'),(59,8,'IN','2026-04-04 15:00:00','2026-04-30 13:51:29'),(60,8,'OUT','2026-04-04 23:05:00','2026-04-30 13:51:29'),(61,9,'IN','2026-04-04 23:02:00','2026-04-30 13:51:29'),(62,9,'OUT','2026-04-05 07:06:00','2026-04-30 13:51:29'),(63,10,'IN','2026-04-04 07:00:00','2026-04-30 13:51:29'),(64,10,'OUT','2026-04-04 15:00:00','2026-04-30 13:51:29'),(65,11,'IN','2026-04-04 08:00:00','2026-04-30 13:51:29'),(66,11,'OUT','2026-04-04 16:00:00','2026-04-30 13:51:29'),(67,12,'IN','2026-04-04 08:04:00','2026-04-30 13:51:29'),(68,12,'OUT','2026-04-04 16:06:00','2026-04-30 13:51:29'),(69,13,'IN','2026-04-04 08:00:00','2026-04-30 13:51:29'),(70,13,'OUT','2026-04-04 16:00:00','2026-04-30 13:51:29'),(71,14,'IN','2026-04-04 08:07:00','2026-04-30 13:51:29'),(72,14,'OUT','2026-04-04 16:11:00','2026-04-30 13:51:29'),(73,6,'IN','2026-04-05 07:00:00','2026-04-30 13:51:29'),(74,6,'OUT','2026-04-05 15:00:00','2026-04-30 13:51:29'),(75,7,'IN','2026-04-05 07:03:00','2026-04-30 13:51:29'),(76,7,'OUT','2026-04-05 15:02:00','2026-04-30 13:51:29'),(77,8,'IN','2026-04-05 15:01:00','2026-04-30 13:51:29'),(78,8,'OUT','2026-04-05 23:07:00','2026-04-30 13:51:29'),(79,9,'IN','2026-04-05 23:00:00','2026-04-30 13:51:29'),(80,9,'OUT','2026-04-06 07:05:00','2026-04-30 13:51:29'),(81,10,'IN','2026-04-05 07:00:00','2026-04-30 13:51:29'),(82,10,'OUT','2026-04-05 15:00:00','2026-04-30 13:51:29');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `event_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `actor_user_id` int DEFAULT NULL,
  `action_type` varchar(100) DEFAULT NULL,
  `entity_name` varchar(100) DEFAULT NULL,
  `entity_pk` int DEFAULT NULL,
  `changed_columns` varchar(255) DEFAULT NULL,
  `old_values_json` text,
  `new_values_json` text,
  `status` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`audit_id`),
  KEY `actor_user_id` (`actor_user_id`),
  CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`actor_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
INSERT INTO `audit_logs` VALUES (1,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',1,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 1, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(2,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',2,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 2, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(3,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',3,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 3, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(4,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',4,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 4, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(5,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',5,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 5, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(6,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',6,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 6, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(7,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',7,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 7, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(8,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',8,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 8, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(9,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',9,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 9, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(10,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',10,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 10, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(11,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',11,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 11, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(12,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',12,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 12, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(13,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',13,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 13, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(14,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',14,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 14, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(15,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',15,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 15, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(16,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',16,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 16, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(17,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',17,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 17, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(18,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',18,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 18, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(19,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',19,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 19, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(20,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',20,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 20, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(21,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',21,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 21, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(22,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',22,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 22, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(23,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',23,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 23, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(24,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',24,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 24, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(25,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',25,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 25, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(26,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',26,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 26, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(27,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',27,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 27, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(28,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',28,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 28, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(29,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',29,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 29, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(30,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',30,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 30, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(31,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',31,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 31, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(32,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',32,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 32, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(33,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',33,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 33, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(34,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',34,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 34, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(35,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',35,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 35, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(36,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',36,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 36, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(37,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',37,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 37, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(38,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',38,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 38, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(39,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',39,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 39, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(40,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',40,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 40, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(41,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',41,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 41, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(42,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',42,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 42, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(43,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',43,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 43, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(44,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',44,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 44, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(45,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',45,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 45, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(46,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',46,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 46, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(47,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',47,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 47, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(48,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',48,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 48, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(49,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',49,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 49, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(50,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',50,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 50, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(51,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',51,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 51, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(52,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',52,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 52, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(53,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',53,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 53, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(54,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',54,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 54, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(55,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',55,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 55, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(56,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',56,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 56, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(57,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',57,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 57, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(58,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',58,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 58, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(59,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',59,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 59, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(60,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',60,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 60, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(61,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',61,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 61, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(62,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',62,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 62, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(63,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',63,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 63, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(64,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',64,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 64, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(65,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',65,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 65, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(66,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',66,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 66, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(67,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',67,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 67, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(68,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',68,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 68, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(69,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',69,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 69, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(70,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',70,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 70, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(71,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',71,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 71, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(72,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',72,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 72, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(73,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',73,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 73, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(74,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',74,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 74, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(75,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',75,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 75, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(76,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',76,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 76, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(77,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',77,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 77, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(78,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',78,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 78, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(79,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',79,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 79, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(80,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',80,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 80, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(81,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',81,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 81, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(82,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',82,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 82, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(83,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',83,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 83, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(84,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',84,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 84, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(85,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',85,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 85, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(86,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',86,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 86, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(87,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',87,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 87, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(88,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',88,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 88, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(89,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',89,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 89, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(90,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',90,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 90, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(91,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',91,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 91, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(92,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',92,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 92, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(93,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',93,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 93, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(94,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',94,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 94, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(95,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',95,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 95, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(96,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',96,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Collected\", \"encounter_id\": 96, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(97,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',97,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 97, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(98,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',98,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 98, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(99,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',99,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Resulted\", \"encounter_id\": 99, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(100,'2026-04-30 13:51:29',NULL,'INSERT','lab_orders',100,'encounter_id,ordered_by_provider_id,status',NULL,'{\"status\": \"Pending\", \"encounter_id\": 100, \"ordered_by_provider_id\": 1}','SUCCESS',NULL),(101,'2026-04-30 13:51:29',NULL,'INSERT','claims',1,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 1, \"total_amount\": 200.00}','SUCCESS',NULL),(102,'2026-04-30 13:51:29',NULL,'INSERT','claims',2,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 5, \"total_amount\": 180.00}','SUCCESS',NULL),(103,'2026-04-30 13:51:29',NULL,'INSERT','claims',3,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 19, \"total_amount\": 950.00}','SUCCESS',NULL),(104,'2026-04-30 13:51:29',NULL,'INSERT','claims',4,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 17, \"total_amount\": 180.00}','SUCCESS',NULL),(105,'2026-04-30 13:51:29',NULL,'INSERT','claims',5,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 9, \"total_amount\": 165.00}','SUCCESS',NULL),(106,'2026-04-30 13:51:29',NULL,'INSERT','claims',6,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 2, \"total_amount\": 425.00}','SUCCESS',NULL),(107,'2026-04-30 13:51:29',NULL,'INSERT','claims',7,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 6, \"total_amount\": 4200.00}','SUCCESS',NULL),(108,'2026-04-30 13:51:29',NULL,'INSERT','claims',8,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 20, \"total_amount\": 850.00}','SUCCESS',NULL),(109,'2026-04-30 13:51:29',NULL,'INSERT','claims',9,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 18, \"total_amount\": 75.00}','SUCCESS',NULL),(110,'2026-04-30 13:51:29',NULL,'INSERT','claims',10,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 10, \"total_amount\": 380.00}','SUCCESS',NULL),(111,'2026-04-30 13:51:29',NULL,'INSERT','claims',11,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 3, \"total_amount\": 650.00}','SUCCESS',NULL),(112,'2026-04-30 13:51:29',NULL,'INSERT','claims',12,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 7, \"total_amount\": 45.00}','SUCCESS',NULL),(113,'2026-04-30 13:51:29',NULL,'INSERT','claims',13,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 21, \"total_amount\": 420.00}','SUCCESS',NULL),(114,'2026-04-30 13:51:29',NULL,'INSERT','claims',14,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 16, \"total_amount\": 135.00}','SUCCESS',NULL),(115,'2026-04-30 13:51:29',NULL,'INSERT','claims',15,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 11, \"total_amount\": 40.00}','SUCCESS',NULL),(116,'2026-04-30 13:51:29',NULL,'INSERT','claims',16,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 4, \"total_amount\": 55.00}','SUCCESS',NULL),(117,'2026-04-30 13:51:29',NULL,'INSERT','claims',17,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 8, \"total_amount\": 95.00}','SUCCESS',NULL),(118,'2026-04-30 13:51:29',NULL,'INSERT','claims',18,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 22, \"total_amount\": 35.00}','SUCCESS',NULL),(119,'2026-04-30 13:51:29',NULL,'INSERT','claims',19,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 17, \"total_amount\": 150.00}','SUCCESS',NULL),(120,'2026-04-30 13:51:29',NULL,'INSERT','claims',20,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 12, \"total_amount\": 700.00}','SUCCESS',NULL),(121,'2026-04-30 13:51:29',NULL,'INSERT','claims',21,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 13, \"total_amount\": 140.00}','SUCCESS',NULL),(122,'2026-04-30 13:51:29',NULL,'INSERT','claims',22,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 14, \"total_amount\": 520.00}','SUCCESS',NULL),(123,'2026-04-30 13:51:29',NULL,'INSERT','claims',23,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 15, \"total_amount\": 320.00}','SUCCESS',NULL),(124,'2026-04-30 13:51:29',NULL,'INSERT','claims',24,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 23, \"total_amount\": 3500.00}','SUCCESS',NULL),(125,'2026-04-30 13:51:29',NULL,'INSERT','claims',25,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 24, \"total_amount\": 160.00}','SUCCESS',NULL),(126,'2026-04-30 13:51:29',NULL,'INSERT','claims',26,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 25, \"total_amount\": 155.00}','SUCCESS',NULL),(127,'2026-04-30 13:51:29',NULL,'INSERT','claims',27,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 26, \"total_amount\": 260.00}','SUCCESS',NULL),(128,'2026-04-30 13:51:29',NULL,'INSERT','claims',28,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 27, \"total_amount\": 780.00}','SUCCESS',NULL),(129,'2026-04-30 13:51:29',NULL,'INSERT','claims',29,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 28, \"total_amount\": 210.00}','SUCCESS',NULL),(130,'2026-04-30 13:51:29',NULL,'INSERT','claims',30,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 29, \"total_amount\": 175.00}','SUCCESS',NULL),(131,'2026-04-30 13:51:29',NULL,'INSERT','claims',31,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 30, \"total_amount\": 460.00}','SUCCESS',NULL),(132,'2026-04-30 13:51:29',NULL,'INSERT','claims',32,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 1, \"total_amount\": 165.00}','SUCCESS',NULL),(133,'2026-04-30 13:51:29',NULL,'INSERT','claims',33,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 5, \"total_amount\": 170.00}','SUCCESS',NULL),(134,'2026-04-30 13:51:29',NULL,'INSERT','claims',34,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 19, \"total_amount\": 760.00}','SUCCESS',NULL),(135,'2026-04-30 13:51:29',NULL,'INSERT','claims',35,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 9, \"total_amount\": 1450.00}','SUCCESS',NULL),(136,'2026-04-30 13:51:29',NULL,'INSERT','claims',36,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 2, \"total_amount\": 60.00}','SUCCESS',NULL),(137,'2026-04-30 13:51:29',NULL,'INSERT','claims',37,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 6, \"total_amount\": 120.00}','SUCCESS',NULL),(138,'2026-04-30 13:51:29',NULL,'INSERT','claims',38,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 20, \"total_amount\": 20.00}','SUCCESS',NULL),(139,'2026-04-30 13:51:29',NULL,'INSERT','claims',39,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 18, \"total_amount\": 85.00}','SUCCESS',NULL),(140,'2026-04-30 13:51:29',NULL,'INSERT','claims',40,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 10, \"total_amount\": 180.00}','SUCCESS',NULL),(141,'2026-04-30 13:51:29',NULL,'INSERT','claims',41,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 3, \"total_amount\": 310.00}','SUCCESS',NULL),(142,'2026-04-30 13:51:29',NULL,'INSERT','claims',42,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 7, \"total_amount\": 140.00}','SUCCESS',NULL),(143,'2026-04-30 13:51:29',NULL,'INSERT','claims',43,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 21, \"total_amount\": 210.00}','SUCCESS',NULL),(144,'2026-04-30 13:51:29',NULL,'INSERT','claims',44,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 16, \"total_amount\": 80.00}','SUCCESS',NULL),(145,'2026-04-30 13:51:29',NULL,'INSERT','claims',45,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 11, \"total_amount\": 245.00}','SUCCESS',NULL),(146,'2026-04-30 13:51:29',NULL,'INSERT','claims',46,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 4, \"total_amount\": 35.00}','SUCCESS',NULL),(147,'2026-04-30 13:51:29',NULL,'INSERT','claims',47,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 8, \"total_amount\": 165.00}','SUCCESS',NULL),(148,'2026-04-30 13:51:29',NULL,'INSERT','claims',48,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 22, \"total_amount\": 340.00}','SUCCESS',NULL),(149,'2026-04-30 13:51:29',NULL,'INSERT','claims',49,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 17, \"total_amount\": 140.00}','SUCCESS',NULL),(150,'2026-04-30 13:51:29',NULL,'INSERT','claims',50,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 12, \"total_amount\": 180.00}','SUCCESS',NULL),(151,'2026-04-30 13:51:29',NULL,'INSERT','claims',51,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 13, \"total_amount\": 75.00}','SUCCESS',NULL),(152,'2026-04-30 13:51:29',NULL,'INSERT','claims',52,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 14, \"total_amount\": 1250.00}','SUCCESS',NULL),(153,'2026-04-30 13:51:29',NULL,'INSERT','claims',53,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 15, \"total_amount\": 170.00}','SUCCESS',NULL),(154,'2026-04-30 13:51:29',NULL,'INSERT','claims',54,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 23, \"total_amount\": 290.00}','SUCCESS',NULL),(155,'2026-04-30 13:51:29',NULL,'INSERT','claims',55,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 24, \"total_amount\": 410.00}','SUCCESS',NULL),(156,'2026-04-30 13:51:29',NULL,'INSERT','claims',56,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 25, \"total_amount\": 25.00}','SUCCESS',NULL),(157,'2026-04-30 13:51:29',NULL,'INSERT','claims',57,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 26, \"total_amount\": 135.00}','SUCCESS',NULL),(158,'2026-04-30 13:51:29',NULL,'INSERT','claims',58,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 27, \"total_amount\": 120.00}','SUCCESS',NULL),(159,'2026-04-30 13:51:29',NULL,'INSERT','claims',59,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 28, \"total_amount\": 35.00}','SUCCESS',NULL),(160,'2026-04-30 13:51:29',NULL,'INSERT','claims',60,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 29, \"total_amount\": 35.00}','SUCCESS',NULL),(161,'2026-04-30 13:51:29',NULL,'INSERT','claims',61,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 30, \"total_amount\": 650.00}','SUCCESS',NULL),(162,'2026-04-30 13:51:29',NULL,'INSERT','claims',62,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 1, \"total_amount\": 700.00}','SUCCESS',NULL),(163,'2026-04-30 13:51:29',NULL,'INSERT','claims',63,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 5, \"total_amount\": 140.00}','SUCCESS',NULL),(164,'2026-04-30 13:51:29',NULL,'INSERT','claims',64,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 19, \"total_amount\": 180.00}','SUCCESS',NULL),(165,'2026-04-30 13:51:29',NULL,'INSERT','claims',65,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 9, \"total_amount\": 320.00}','SUCCESS',NULL),(166,'2026-04-30 13:51:29',NULL,'INSERT','claims',66,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 2, \"total_amount\": 20.00}','SUCCESS',NULL),(167,'2026-04-30 13:51:29',NULL,'INSERT','claims',67,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 6, \"total_amount\": 175.00}','SUCCESS',NULL),(168,'2026-04-30 13:51:29',NULL,'INSERT','claims',68,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 20, \"total_amount\": 150.00}','SUCCESS',NULL),(169,'2026-04-30 13:51:29',NULL,'INSERT','claims',69,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 18, \"total_amount\": 420.00}','SUCCESS',NULL),(170,'2026-04-30 13:51:29',NULL,'INSERT','claims',70,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 10, \"total_amount\": 25.00}','SUCCESS',NULL),(171,'2026-04-30 13:51:29',NULL,'INSERT','claims',71,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 3, \"total_amount\": 210.00}','SUCCESS',NULL),(172,'2026-04-30 13:51:29',NULL,'INSERT','claims',72,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 7, \"total_amount\": 95.00}','SUCCESS',NULL),(173,'2026-04-30 13:51:29',NULL,'INSERT','claims',73,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 21, \"total_amount\": 245.00}','SUCCESS',NULL),(174,'2026-04-30 13:51:29',NULL,'INSERT','claims',74,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 16, \"total_amount\": 40.00}','SUCCESS',NULL),(175,'2026-04-30 13:51:29',NULL,'INSERT','claims',75,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 11, \"total_amount\": 165.00}','SUCCESS',NULL),(176,'2026-04-30 13:51:29',NULL,'INSERT','claims',76,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 4, \"total_amount\": 150.00}','SUCCESS',NULL),(177,'2026-04-30 13:51:29',NULL,'INSERT','claims',77,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 8, \"total_amount\": 140.00}','SUCCESS',NULL),(178,'2026-04-30 13:51:29',NULL,'INSERT','claims',78,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 22, \"total_amount\": 135.00}','SUCCESS',NULL),(179,'2026-04-30 13:51:29',NULL,'INSERT','claims',79,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 17, \"total_amount\": 120.00}','SUCCESS',NULL),(180,'2026-04-30 13:51:29',NULL,'INSERT','claims',80,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 12, \"total_amount\": 1250.00}','SUCCESS',NULL),(181,'2026-04-30 13:51:29',NULL,'INSERT','claims',81,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 13, \"total_amount\": 170.00}','SUCCESS',NULL),(182,'2026-04-30 13:51:29',NULL,'INSERT','claims',82,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 14, \"total_amount\": 290.00}','SUCCESS',NULL),(183,'2026-04-30 13:51:29',NULL,'INSERT','claims',83,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 15, \"total_amount\": 410.00}','SUCCESS',NULL),(184,'2026-04-30 13:51:29',NULL,'INSERT','claims',84,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 23, \"total_amount\": 25.00}','SUCCESS',NULL),(185,'2026-04-30 13:51:29',NULL,'INSERT','claims',85,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 24, \"total_amount\": 180.00}','SUCCESS',NULL),(186,'2026-04-30 13:51:29',NULL,'INSERT','claims',86,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 25, \"total_amount\": 320.00}','SUCCESS',NULL),(187,'2026-04-30 13:51:29',NULL,'INSERT','claims',87,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 26, \"total_amount\": 20.00}','SUCCESS',NULL),(188,'2026-04-30 13:51:29',NULL,'INSERT','claims',88,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 27, \"total_amount\": 175.00}','SUCCESS',NULL),(189,'2026-04-30 13:51:29',NULL,'INSERT','claims',89,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 28, \"total_amount\": 165.00}','SUCCESS',NULL),(190,'2026-04-30 13:51:29',NULL,'INSERT','claims',90,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 29, \"total_amount\": 700.00}','SUCCESS',NULL),(191,'2026-04-30 13:51:29',NULL,'INSERT','claims',91,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 30, \"total_amount\": 140.00}','SUCCESS',NULL),(192,'2026-04-30 13:51:29',NULL,'INSERT','claims',92,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Submitted\", \"insurance_id\": 1, \"total_amount\": 180.00}','SUCCESS',NULL),(193,'2026-04-30 13:51:29',NULL,'INSERT','claims',93,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 5, \"total_amount\": 120.00}','SUCCESS',NULL),(194,'2026-04-30 13:51:29',NULL,'INSERT','claims',94,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 19, \"total_amount\": 230.00}','SUCCESS',NULL),(195,'2026-04-30 13:51:29',NULL,'INSERT','claims',95,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 9, \"total_amount\": 40.00}','SUCCESS',NULL),(196,'2026-04-30 13:51:29',NULL,'INSERT','claims',96,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 2, \"total_amount\": 650.00}','SUCCESS',NULL),(197,'2026-04-30 13:51:29',NULL,'INSERT','claims',97,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 6, \"total_amount\": 380.00}','SUCCESS',NULL),(198,'2026-04-30 13:51:29',NULL,'INSERT','claims',98,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Denied\", \"insurance_id\": 20, \"total_amount\": 155.00}','SUCCESS',NULL),(199,'2026-04-30 13:51:29',NULL,'INSERT','claims',99,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Accepted\", \"insurance_id\": 18, \"total_amount\": 135.00}','SUCCESS',NULL),(200,'2026-04-30 13:51:29',NULL,'INSERT','claims',100,'claim_status,total_amount,insurance_id',NULL,'{\"claim_status\": \"Paid\", \"insurance_id\": 10, \"total_amount\": 150.00}','SUCCESS',NULL),(201,'2026-04-30 13:51:29',NULL,'INSERT','payments',1,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 50.00, \"claim_id\": 1, \"patient_id\": 1, \"payment_method\": \"Credit Card\"}','SUCCESS',NULL),(202,'2026-04-30 13:51:29',NULL,'INSERT','payments',2,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 180.00, \"claim_id\": 2, \"patient_id\": 2, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(203,'2026-04-30 13:51:29',NULL,'INSERT','payments',3,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 950.00, \"claim_id\": 3, \"patient_id\": 3, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(204,'2026-04-30 13:51:29',NULL,'INSERT','payments',4,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 20.00, \"claim_id\": 4, \"patient_id\": 4, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(205,'2026-04-30 13:51:29',NULL,'INSERT','payments',5,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 165.00, \"claim_id\": 5, \"patient_id\": 5, \"payment_method\": \"Credit Card\"}','SUCCESS',NULL),(206,'2026-04-30 13:51:29',NULL,'INSERT','payments',6,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 425.00, \"claim_id\": 6, \"patient_id\": 6, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(207,'2026-04-30 13:51:29',NULL,'INSERT','payments',7,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 4200.00, \"claim_id\": 7, \"patient_id\": 7, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(208,'2026-04-30 13:51:29',NULL,'INSERT','payments',8,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 850.00, \"claim_id\": 8, \"patient_id\": 8, \"payment_method\": \"Credit Card\"}','SUCCESS',NULL),(209,'2026-04-30 13:51:29',NULL,'INSERT','payments',9,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 25.00, \"claim_id\": 9, \"patient_id\": 9, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(210,'2026-04-30 13:51:29',NULL,'INSERT','payments',10,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 380.00, \"claim_id\": 10, \"patient_id\": 10, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(211,'2026-04-30 13:51:29',NULL,'INSERT','payments',11,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 650.00, \"claim_id\": 11, \"patient_id\": 11, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(212,'2026-04-30 13:51:29',NULL,'INSERT','payments',12,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 45.00, \"claim_id\": 12, \"patient_id\": 12, \"payment_method\": \"Credit Card\"}','SUCCESS',NULL),(213,'2026-04-30 13:51:29',NULL,'INSERT','payments',13,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 420.00, \"claim_id\": 13, \"patient_id\": 13, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(214,'2026-04-30 13:51:29',NULL,'INSERT','payments',14,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 30.00, \"claim_id\": 14, \"patient_id\": 14, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(215,'2026-04-30 13:51:29',NULL,'INSERT','payments',15,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 40.00, \"claim_id\": 15, \"patient_id\": 15, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(216,'2026-04-30 13:51:29',NULL,'INSERT','payments',16,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 55.00, \"claim_id\": 16, \"patient_id\": 16, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(217,'2026-04-30 13:51:29',NULL,'INSERT','payments',17,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 95.00, \"claim_id\": 17, \"patient_id\": 17, \"payment_method\": \"Credit Card\"}','SUCCESS',NULL),(218,'2026-04-30 13:51:29',NULL,'INSERT','payments',18,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 35.00, \"claim_id\": 18, \"patient_id\": 18, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(219,'2026-04-30 13:51:29',NULL,'INSERT','payments',19,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 150.00, \"claim_id\": 19, \"patient_id\": 19, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(220,'2026-04-30 13:51:29',NULL,'INSERT','payments',20,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 50.00, \"claim_id\": 20, \"patient_id\": 20, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(221,'2026-04-30 13:51:29',NULL,'INSERT','payments',21,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 140.00, \"claim_id\": 21, \"patient_id\": 21, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(222,'2026-04-30 13:51:29',NULL,'INSERT','payments',22,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 520.00, \"claim_id\": 22, \"patient_id\": 22, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(223,'2026-04-30 13:51:29',NULL,'INSERT','payments',23,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 320.00, \"claim_id\": 23, \"patient_id\": 23, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(224,'2026-04-30 13:51:29',NULL,'INSERT','payments',24,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 100.00, \"claim_id\": 24, \"patient_id\": 24, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(225,'2026-04-30 13:51:29',NULL,'INSERT','payments',25,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 160.00, \"claim_id\": 25, \"patient_id\": 25, \"payment_method\": \"Credit Card\"}','SUCCESS',NULL),(226,'2026-04-30 13:51:29',NULL,'INSERT','payments',26,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 155.00, \"claim_id\": 26, \"patient_id\": 26, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(227,'2026-04-30 13:51:29',NULL,'INSERT','payments',27,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 260.00, \"claim_id\": 27, \"patient_id\": 27, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(228,'2026-04-30 13:51:29',NULL,'INSERT','payments',28,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 780.00, \"claim_id\": 28, \"patient_id\": 28, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(229,'2026-04-30 13:51:29',NULL,'INSERT','payments',29,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 210.00, \"claim_id\": 29, \"patient_id\": 29, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(230,'2026-04-30 13:51:29',NULL,'INSERT','payments',30,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 175.00, \"claim_id\": 30, \"patient_id\": 30, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(231,'2026-04-30 13:51:29',NULL,'INSERT','payments',31,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 460.00, \"claim_id\": 31, \"patient_id\": 31, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(232,'2026-04-30 13:51:29',NULL,'INSERT','payments',32,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 40.00, \"claim_id\": 32, \"patient_id\": 32, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(233,'2026-04-30 13:51:29',NULL,'INSERT','payments',33,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 170.00, \"claim_id\": 33, \"patient_id\": 33, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(234,'2026-04-30 13:51:29',NULL,'INSERT','payments',34,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 760.00, \"claim_id\": 34, \"patient_id\": 34, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(235,'2026-04-30 13:51:29',NULL,'INSERT','payments',35,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 1450.00, \"claim_id\": 35, \"patient_id\": 35, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(236,'2026-04-30 13:51:29',NULL,'INSERT','payments',36,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 60.00, \"claim_id\": 36, \"patient_id\": 36, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(237,'2026-04-30 13:51:29',NULL,'INSERT','payments',37,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 120.00, \"claim_id\": 37, \"patient_id\": 37, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(238,'2026-04-30 13:51:29',NULL,'INSERT','payments',38,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 20.00, \"claim_id\": 38, \"patient_id\": 38, \"payment_method\": \"Credit Card\"}','SUCCESS',NULL),(239,'2026-04-30 13:51:29',NULL,'INSERT','payments',39,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 25.00, \"claim_id\": 39, \"patient_id\": 39, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(240,'2026-04-30 13:51:29',NULL,'INSERT','payments',40,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 180.00, \"claim_id\": 40, \"patient_id\": 40, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(241,'2026-04-30 13:51:29',NULL,'INSERT','payments',41,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 310.00, \"claim_id\": 41, \"patient_id\": 41, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(242,'2026-04-30 13:51:29',NULL,'INSERT','payments',42,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 140.00, \"claim_id\": 42, \"patient_id\": 42, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(243,'2026-04-30 13:51:29',NULL,'INSERT','payments',43,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 210.00, \"claim_id\": 43, \"patient_id\": 43, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(244,'2026-04-30 13:51:29',NULL,'INSERT','payments',44,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 80.00, \"claim_id\": 44, \"patient_id\": 44, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(245,'2026-04-30 13:51:29',NULL,'INSERT','payments',45,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 245.00, \"claim_id\": 45, \"patient_id\": 45, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(246,'2026-04-30 13:51:29',NULL,'INSERT','payments',46,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 35.00, \"claim_id\": 46, \"patient_id\": 46, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(247,'2026-04-30 13:51:29',NULL,'INSERT','payments',47,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 165.00, \"claim_id\": 47, \"patient_id\": 47, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(248,'2026-04-30 13:51:29',NULL,'INSERT','payments',48,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 340.00, \"claim_id\": 48, \"patient_id\": 48, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(249,'2026-04-30 13:51:29',NULL,'INSERT','payments',49,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 140.00, \"claim_id\": 49, \"patient_id\": 49, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(250,'2026-04-30 13:51:29',NULL,'INSERT','payments',50,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 180.00, \"claim_id\": 50, \"patient_id\": 50, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(251,'2026-04-30 13:51:29',NULL,'INSERT','payments',51,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 75.00, \"claim_id\": 51, \"patient_id\": 51, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(252,'2026-04-30 13:51:29',NULL,'INSERT','payments',52,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 1250.00, \"claim_id\": 52, \"patient_id\": 52, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(253,'2026-04-30 13:51:29',NULL,'INSERT','payments',53,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 170.00, \"claim_id\": 53, \"patient_id\": 53, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(254,'2026-04-30 13:51:29',NULL,'INSERT','payments',54,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 290.00, \"claim_id\": 54, \"patient_id\": 54, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(255,'2026-04-30 13:51:29',NULL,'INSERT','payments',55,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 60.00, \"claim_id\": 55, \"patient_id\": 55, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(256,'2026-04-30 13:51:29',NULL,'INSERT','payments',56,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 25.00, \"claim_id\": 56, \"patient_id\": 56, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(257,'2026-04-30 13:51:29',NULL,'INSERT','payments',57,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 135.00, \"claim_id\": 57, \"patient_id\": 57, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(258,'2026-04-30 13:51:29',NULL,'INSERT','payments',58,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 120.00, \"claim_id\": 58, \"patient_id\": 58, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(259,'2026-04-30 13:51:29',NULL,'INSERT','payments',59,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 35.00, \"claim_id\": 59, \"patient_id\": 59, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(260,'2026-04-30 13:51:29',NULL,'INSERT','payments',60,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 35.00, \"claim_id\": 60, \"patient_id\": 60, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(261,'2026-04-30 13:51:29',NULL,'INSERT','payments',61,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 650.00, \"claim_id\": 61, \"patient_id\": 61, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(262,'2026-04-30 13:51:29',NULL,'INSERT','payments',62,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 700.00, \"claim_id\": 62, \"patient_id\": 62, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(263,'2026-04-30 13:51:29',NULL,'INSERT','payments',63,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 140.00, \"claim_id\": 63, \"patient_id\": 63, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(264,'2026-04-30 13:51:29',NULL,'INSERT','payments',64,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 180.00, \"claim_id\": 64, \"patient_id\": 64, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(265,'2026-04-30 13:51:29',NULL,'INSERT','payments',65,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 320.00, \"claim_id\": 65, \"patient_id\": 65, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(266,'2026-04-30 13:51:29',NULL,'INSERT','payments',66,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 20.00, \"claim_id\": 66, \"patient_id\": 66, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(267,'2026-04-30 13:51:29',NULL,'INSERT','payments',67,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 175.00, \"claim_id\": 67, \"patient_id\": 67, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(268,'2026-04-30 13:51:29',NULL,'INSERT','payments',68,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 150.00, \"claim_id\": 68, \"patient_id\": 68, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(269,'2026-04-30 13:51:29',NULL,'INSERT','payments',69,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 420.00, \"claim_id\": 69, \"patient_id\": 69, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(270,'2026-04-30 13:51:29',NULL,'INSERT','payments',70,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 25.00, \"claim_id\": 70, \"patient_id\": 70, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(271,'2026-04-30 13:51:29',NULL,'INSERT','payments',71,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 210.00, \"claim_id\": 71, \"patient_id\": 71, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(272,'2026-04-30 13:51:29',NULL,'INSERT','payments',72,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 95.00, \"claim_id\": 72, \"patient_id\": 72, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(273,'2026-04-30 13:51:29',NULL,'INSERT','payments',73,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 245.00, \"claim_id\": 73, \"patient_id\": 73, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(274,'2026-04-30 13:51:29',NULL,'INSERT','payments',74,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 40.00, \"claim_id\": 74, \"patient_id\": 74, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(275,'2026-04-30 13:51:29',NULL,'INSERT','payments',75,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 165.00, \"claim_id\": 75, \"patient_id\": 75, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(276,'2026-04-30 13:51:29',NULL,'INSERT','payments',76,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 45.00, \"claim_id\": 76, \"patient_id\": 76, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(277,'2026-04-30 13:51:29',NULL,'INSERT','payments',77,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 140.00, \"claim_id\": 77, \"patient_id\": 77, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(278,'2026-04-30 13:51:29',NULL,'INSERT','payments',78,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 135.00, \"claim_id\": 78, \"patient_id\": 78, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(279,'2026-04-30 13:51:29',NULL,'INSERT','payments',79,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 120.00, \"claim_id\": 79, \"patient_id\": 79, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(280,'2026-04-30 13:51:29',NULL,'INSERT','payments',80,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 1250.00, \"claim_id\": 80, \"patient_id\": 80, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(281,'2026-04-30 13:51:29',NULL,'INSERT','payments',81,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 170.00, \"claim_id\": 81, \"patient_id\": 81, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(282,'2026-04-30 13:51:29',NULL,'INSERT','payments',82,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 290.00, \"claim_id\": 82, \"patient_id\": 82, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(283,'2026-04-30 13:51:29',NULL,'INSERT','payments',83,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 410.00, \"claim_id\": 83, \"patient_id\": 83, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(284,'2026-04-30 13:51:29',NULL,'INSERT','payments',84,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 25.00, \"claim_id\": 84, \"patient_id\": 84, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(285,'2026-04-30 13:51:29',NULL,'INSERT','payments',85,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 180.00, \"claim_id\": 85, \"patient_id\": 85, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(286,'2026-04-30 13:51:29',NULL,'INSERT','payments',86,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 320.00, \"claim_id\": 86, \"patient_id\": 86, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(287,'2026-04-30 13:51:29',NULL,'INSERT','payments',87,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 20.00, \"claim_id\": 87, \"patient_id\": 87, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(288,'2026-04-30 13:51:29',NULL,'INSERT','payments',88,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 175.00, \"claim_id\": 88, \"patient_id\": 88, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(289,'2026-04-30 13:51:29',NULL,'INSERT','payments',89,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 35.00, \"claim_id\": 89, \"patient_id\": 89, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(290,'2026-04-30 13:51:29',NULL,'INSERT','payments',90,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 700.00, \"claim_id\": 90, \"patient_id\": 90, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(291,'2026-04-30 13:51:29',NULL,'INSERT','payments',91,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 140.00, \"claim_id\": 91, \"patient_id\": 91, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(292,'2026-04-30 13:51:29',NULL,'INSERT','payments',92,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 180.00, \"claim_id\": 92, \"patient_id\": 92, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(293,'2026-04-30 13:51:29',NULL,'INSERT','payments',93,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 120.00, \"claim_id\": 93, \"patient_id\": 93, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(294,'2026-04-30 13:51:29',NULL,'INSERT','payments',94,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 230.00, \"claim_id\": 94, \"patient_id\": 94, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(295,'2026-04-30 13:51:29',NULL,'INSERT','payments',95,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 40.00, \"claim_id\": 95, \"patient_id\": 95, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(296,'2026-04-30 13:51:29',NULL,'INSERT','payments',96,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 650.00, \"claim_id\": 96, \"patient_id\": 96, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(297,'2026-04-30 13:51:29',NULL,'INSERT','payments',97,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 380.00, \"claim_id\": 97, \"patient_id\": 97, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(298,'2026-04-30 13:51:29',NULL,'INSERT','payments',98,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 60.00, \"claim_id\": 98, \"patient_id\": 98, \"payment_method\": \"Cash\"}','SUCCESS',NULL),(299,'2026-04-30 13:51:29',NULL,'INSERT','payments',99,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 135.00, \"claim_id\": 99, \"patient_id\": 99, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(300,'2026-04-30 13:51:29',NULL,'INSERT','payments',100,'claim_id,patient_id,payment_method,amount',NULL,'{\"amount\": 150.00, \"claim_id\": 100, \"patient_id\": 100, \"payment_method\": \"ACH\"}','SUCCESS',NULL),(301,'2026-04-30 13:51:29',NULL,'INSERT','users',1,'username,account_status,email',NULL,'{\"email\": \"jwilson@hospital.org\", \"username\": \"jwilson\", \"account_status\": \"Active\"}','SUCCESS',NULL),(302,'2026-04-30 13:51:29',NULL,'INSERT','users',2,'username,account_status,email',NULL,'{\"email\": \"smartinez@hospital.org\", \"username\": \"smartinez\", \"account_status\": \"Active\"}','SUCCESS',NULL),(303,'2026-04-30 13:51:29',NULL,'INSERT','users',3,'username,account_status,email',NULL,'{\"email\": \"mbrown@hospital.org\", \"username\": \"mbrown\", \"account_status\": \"Active\"}','SUCCESS',NULL),(304,'2026-04-30 13:51:29',NULL,'INSERT','users',4,'username,account_status,email',NULL,'{\"email\": \"ejohnson@hospital.org\", \"username\": \"ejohnson\", \"account_status\": \"Active\"}','SUCCESS',NULL),(305,'2026-04-30 13:51:29',NULL,'INSERT','users',5,'username,account_status,email',NULL,'{\"email\": \"odavis@hospital.org\", \"username\": \"odavis\", \"account_status\": \"Active\"}','SUCCESS',NULL),(306,'2026-04-30 13:51:29',NULL,'INSERT','users',6,'username,account_status,email',NULL,'{\"email\": \"lgarcia@hospital.org\", \"username\": \"lgarcia\", \"account_status\": \"Active\"}','SUCCESS',NULL),(307,'2026-04-30 13:51:29',NULL,'INSERT','users',7,'username,account_status,email',NULL,'{\"email\": \"nmiller@hospital.org\", \"username\": \"nmiller\", \"account_status\": \"Active\"}','SUCCESS',NULL),(308,'2026-04-30 13:51:29',NULL,'INSERT','users',8,'username,account_status,email',NULL,'{\"email\": \"arodriguez@hospital.org\", \"username\": \"arodriguez\", \"account_status\": \"Active\"}','SUCCESS',NULL),(309,'2026-04-30 13:51:29',NULL,'INSERT','users',9,'username,account_status,email',NULL,'{\"email\": \"elopez@hospital.org\", \"username\": \"elopez\", \"account_status\": \"Active\"}','SUCCESS',NULL),(310,'2026-04-30 13:51:29',NULL,'INSERT','users',10,'username,account_status,email',NULL,'{\"email\": \"gmitchell@hospital.org\", \"username\": \"gmitchell\", \"account_status\": \"Active\"}','SUCCESS',NULL),(311,'2026-04-30 13:51:29',NULL,'INSERT','users',11,'username,account_status,email',NULL,'{\"email\": \"nparker@hospital.org\", \"username\": \"nparker\", \"account_status\": \"Active\"}','SUCCESS',NULL),(312,'2026-04-30 13:51:29',NULL,'INSERT','users',12,'username,account_status,email',NULL,'{\"email\": \"vcoleman@hospital.org\", \"username\": \"vcoleman\", \"account_status\": \"Active\"}','SUCCESS',NULL),(313,'2026-04-30 13:51:29',NULL,'INSERT','users',13,'username,account_status,email',NULL,'{\"email\": \"mbryant@hospital.org\", \"username\": \"mbryant\", \"account_status\": \"Active\"}','SUCCESS',NULL),(314,'2026-04-30 13:51:29',NULL,'INSERT','users',14,'username,account_status,email',NULL,'{\"email\": \"bmorris@hospital.org\", \"username\": \"bmorris\", \"account_status\": \"Active\"}','SUCCESS',NULL),(315,'2026-04-30 13:51:29',NULL,'INSERT','users',15,'username,account_status,email',NULL,'{\"email\": \"jthomas@hospital.org\", \"username\": \"jthomas\", \"account_status\": \"Active\"}','SUCCESS',NULL),(316,'2026-04-30 13:51:29',NULL,'INSERT','users',16,'username,account_status,email',NULL,'{\"email\": \"rwhite@hospital.org\", \"username\": \"rwhite\", \"account_status\": \"Active\"}','SUCCESS',NULL),(317,'2026-04-30 13:51:29',NULL,'INSERT','users',17,'username,account_status,email',NULL,'{\"email\": \"kjackson@hospital.org\", \"username\": \"kjackson\", \"account_status\": \"Active\"}','SUCCESS',NULL),(318,'2026-04-30 13:51:29',NULL,'INSERT','users',18,'username,account_status,email',NULL,'{\"email\": \"lmartin@hospital.org\", \"username\": \"lmartin\", \"account_status\": \"Active\"}','SUCCESS',NULL),(319,'2026-04-30 13:51:29',NULL,'INSERT','users',19,'username,account_status,email',NULL,'{\"email\": \"pclark@hospital.org\", \"username\": \"pclark\", \"account_status\": \"Active\"}','SUCCESS',NULL),(320,'2026-04-30 13:51:29',NULL,'INSERT','users',20,'username,account_status,email',NULL,'{\"email\": \"hlee@hospital.org\", \"username\": \"hlee\", \"account_status\": \"Active\"}','SUCCESS',NULL),(321,'2026-04-30 13:51:29',NULL,'INSERT','users',21,'username,account_status,email',NULL,'{\"email\": \"awalker@hospital.org\", \"username\": \"awalker\", \"account_status\": \"Active\"}','SUCCESS',NULL),(322,'2026-04-30 13:51:29',NULL,'INSERT','users',22,'username,account_status,email',NULL,'{\"email\": \"dallen@hospital.org\", \"username\": \"dallen\", \"account_status\": \"Active\"}','SUCCESS',NULL),(323,'2026-04-30 13:51:29',NULL,'INSERT','users',23,'username,account_status,email',NULL,'{\"email\": \"syoung@hospital.org\", \"username\": \"syoung\", \"account_status\": \"Active\"}','SUCCESS',NULL),(324,'2026-04-30 13:51:29',NULL,'INSERT','users',24,'username,account_status,email',NULL,'{\"email\": \"king@hospital.org\", \"username\": \"king\", \"account_status\": \"Active\"}','SUCCESS',NULL),(325,'2026-04-30 13:51:29',NULL,'INSERT','users',25,'username,account_status,email',NULL,'{\"email\": \"wright@hospital.org\", \"username\": \"wright\", \"account_status\": \"Active\"}','SUCCESS',NULL),(326,'2026-04-30 13:51:29',NULL,'INSERT','users',26,'username,account_status,email',NULL,'{\"email\": \"scott@hospital.org\", \"username\": \"scott\", \"account_status\": \"Active\"}','SUCCESS',NULL),(327,'2026-04-30 13:51:29',NULL,'INSERT','users',27,'username,account_status,email',NULL,'{\"email\": \"green@hospital.org\", \"username\": \"green\", \"account_status\": \"Active\"}','SUCCESS',NULL),(328,'2026-04-30 13:51:29',NULL,'INSERT','users',28,'username,account_status,email',NULL,'{\"email\": \"baker@hospital.org\", \"username\": \"baker\", \"account_status\": \"Active\"}','SUCCESS',NULL),(329,'2026-04-30 13:51:29',NULL,'INSERT','users',29,'username,account_status,email',NULL,'{\"email\": \"adams@hospital.org\", \"username\": \"adams\", \"account_status\": \"Locked\"}','SUCCESS',NULL),(330,'2026-04-30 13:51:29',NULL,'INSERT','users',30,'username,account_status,email',NULL,'{\"email\": \"nelson@hospital.org\", \"username\": \"nelson\", \"account_status\": \"Active\"}','SUCCESS',NULL),(331,'2026-04-30 13:51:29',NULL,'INSERT','users',31,'username,account_status,email',NULL,'{\"email\": \"carter@hospital.org\", \"username\": \"carter\", \"account_status\": \"Active\"}','SUCCESS',NULL),(332,'2026-04-30 13:51:29',NULL,'INSERT','users',32,'username,account_status,email',NULL,'{\"email\": \"mitchell2@hospital.org\", \"username\": \"mitchell2\", \"account_status\": \"Active\"}','SUCCESS',NULL),(333,'2026-04-30 13:51:29',NULL,'INSERT','users',33,'username,account_status,email',NULL,'{\"email\": \"roberts@hospital.org\", \"username\": \"roberts\", \"account_status\": \"Active\"}','SUCCESS',NULL),(334,'2026-04-30 13:51:29',NULL,'INSERT','users',34,'username,account_status,email',NULL,'{\"email\": \"turner@hospital.org\", \"username\": \"turner\", \"account_status\": \"Active\"}','SUCCESS',NULL),(335,'2026-04-30 13:51:29',NULL,'INSERT','users',35,'username,account_status,email',NULL,'{\"email\": \"phillips@hospital.org\", \"username\": \"phillips\", \"account_status\": \"Active\"}','SUCCESS',NULL),(336,'2026-04-30 13:51:29',NULL,'INSERT','users',36,'username,account_status,email',NULL,'{\"email\": \"campbell@hospital.org\", \"username\": \"campbell\", \"account_status\": \"Active\"}','SUCCESS',NULL),(337,'2026-04-30 13:51:29',NULL,'INSERT','users',37,'username,account_status,email',NULL,'{\"email\": \"parker2@hospital.org\", \"username\": \"parker2\", \"account_status\": \"Active\"}','SUCCESS',NULL),(338,'2026-04-30 13:51:29',NULL,'INSERT','users',38,'username,account_status,email',NULL,'{\"email\": \"evans@hospital.org\", \"username\": \"evans\", \"account_status\": \"Active\"}','SUCCESS',NULL),(339,'2026-04-30 13:51:29',NULL,'INSERT','users',39,'username,account_status,email',NULL,'{\"email\": \"edwards@hospital.org\", \"username\": \"edwards\", \"account_status\": \"Active\"}','SUCCESS',NULL),(340,'2026-04-30 13:51:29',NULL,'INSERT','users',40,'username,account_status,email',NULL,'{\"email\": \"collins@hospital.org\", \"username\": \"collins\", \"account_status\": \"Active\"}','SUCCESS',NULL),(341,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',1,'username,account_status,email',NULL,'{\"email\": \"john.doe@email.com\", \"username\": \"john.doe\", \"account_status\": \"Active\"}','SUCCESS',NULL),(342,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',2,'username,account_status,email',NULL,'{\"email\": \"jane.smith@email.com\", \"username\": \"jane.smith\", \"account_status\": \"Active\"}','SUCCESS',NULL),(343,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',3,'username,account_status,email',NULL,'{\"email\": \"david.lee@email.com\", \"username\": \"david.lee\", \"account_status\": \"Active\"}','SUCCESS',NULL),(344,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',4,'username,account_status,email',NULL,'{\"email\": \"maria.garcia@email.com\", \"username\": \"maria.garcia\", \"account_status\": \"Active\"}','SUCCESS',NULL),(345,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',5,'username,account_status,email',NULL,'{\"email\": \"chris.taylor@email.com\", \"username\": \"chris.taylor\", \"account_status\": \"Active\"}','SUCCESS',NULL),(346,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',6,'username,account_status,email',NULL,'{\"email\": \"alex.brown@email.com\", \"username\": \"alex.brown\", \"account_status\": \"Active\"}','SUCCESS',NULL),(347,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',7,'username,account_status,email',NULL,'{\"email\": \"linda.white@email.com\", \"username\": \"linda.white\", \"account_status\": \"Active\"}','SUCCESS',NULL),(348,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',8,'username,account_status,email',NULL,'{\"email\": \"kevin.hall@email.com\", \"username\": \"kevin.hall\", \"account_status\": \"Active\"}','SUCCESS',NULL),(349,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',9,'username,account_status,email',NULL,'{\"email\": \"susan.king@email.com\", \"username\": \"susan.king\", \"account_status\": \"Active\"}','SUCCESS',NULL),(350,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',10,'username,account_status,email',NULL,'{\"email\": \"paul.green@email.com\", \"username\": \"paul.green\", \"account_status\": \"Active\"}','SUCCESS',NULL),(351,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',11,'username,account_status,email',NULL,'{\"email\": \"amy.adams@email.com\", \"username\": \"amy.adams\", \"account_status\": \"Active\"}','SUCCESS',NULL),(352,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',12,'username,account_status,email',NULL,'{\"email\": \"jason.scott@email.com\", \"username\": \"jason.scott\", \"account_status\": \"Active\"}','SUCCESS',NULL),(353,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',13,'username,account_status,email',NULL,'{\"email\": \"rachel.evans@email.com\", \"username\": \"rachel.evans\", \"account_status\": \"Active\"}','SUCCESS',NULL),(354,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',14,'username,account_status,email',NULL,'{\"email\": \"brian.turner@email.com\", \"username\": \"brian.turner\", \"account_status\": \"Active\"}','SUCCESS',NULL),(355,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',15,'username,account_status,email',NULL,'{\"email\": \"laura.parker@email.com\", \"username\": \"laura.parker\", \"account_status\": \"Active\"}','SUCCESS',NULL),(356,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',16,'username,account_status,email',NULL,'{\"email\": \"steve.carter@email.com\", \"username\": \"steve.carter\", \"account_status\": \"Active\"}','SUCCESS',NULL),(357,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',17,'username,account_status,email',NULL,'{\"email\": \"angela.phillips@email.com\", \"username\": \"angela.phillips\", \"account_status\": \"Active\"}','SUCCESS',NULL),(358,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',18,'username,account_status,email',NULL,'{\"email\": \"mark.campbell@email.com\", \"username\": \"mark.campbell\", \"account_status\": \"Active\"}','SUCCESS',NULL),(359,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',19,'username,account_status,email',NULL,'{\"email\": \"helen.roberts@email.com\", \"username\": \"helen.roberts\", \"account_status\": \"Active\"}','SUCCESS',NULL),(360,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',20,'username,account_status,email',NULL,'{\"email\": \"george.mitchell@email.com\", \"username\": \"george.mitchell\", \"account_status\": \"Active\"}','SUCCESS',NULL),(361,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',21,'username,account_status,email',NULL,'{\"email\": \"nancy.collins@email.com\", \"username\": \"nancy.collins\", \"account_status\": \"Active\"}','SUCCESS',NULL),(362,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',22,'username,account_status,email',NULL,'{\"email\": \"frank.stewart@email.com\", \"username\": \"frank.stewart\", \"account_status\": \"Active\"}','SUCCESS',NULL),(363,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',23,'username,account_status,email',NULL,'{\"email\": \"emma.sanchez@email.com\", \"username\": \"emma.sanchez\", \"account_status\": \"Active\"}','SUCCESS',NULL),(364,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',24,'username,account_status,email',NULL,'{\"email\": \"daniel.morris@email.com\", \"username\": \"daniel.morris\", \"account_status\": \"Active\"}','SUCCESS',NULL),(365,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',25,'username,account_status,email',NULL,'{\"email\": \"oliver.rogers@email.com\", \"username\": \"oliver.rogers\", \"account_status\": \"Active\"}','SUCCESS',NULL),(366,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',26,'username,account_status,email',NULL,'{\"email\": \"mia.reed@email.com\", \"username\": \"mia.reed\", \"account_status\": \"Active\"}','SUCCESS',NULL),(367,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',27,'username,account_status,email',NULL,'{\"email\": \"noah.cook@email.com\", \"username\": \"noah.cook\", \"account_status\": \"Active\"}','SUCCESS',NULL),(368,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',28,'username,account_status,email',NULL,'{\"email\": \"ava.bell@email.com\", \"username\": \"ava.bell\", \"account_status\": \"Active\"}','SUCCESS',NULL),(369,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',29,'username,account_status,email',NULL,'{\"email\": \"liam.bailey@email.com\", \"username\": \"liam.bailey\", \"account_status\": \"Locked\"}','SUCCESS',NULL),(370,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',30,'username,account_status,email',NULL,'{\"email\": \"zoe.rivera@email.com\", \"username\": \"zoe.rivera\", \"account_status\": \"Active\"}','SUCCESS',NULL),(371,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',31,'username,account_status,email',NULL,'{\"email\": \"ethan.cooper@email.com\", \"username\": \"ethan.cooper\", \"account_status\": \"Active\"}','SUCCESS',NULL),(372,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',32,'username,account_status,email',NULL,'{\"email\": \"ella.richardson@email.com\", \"username\": \"ella.richardson\", \"account_status\": \"Active\"}','SUCCESS',NULL),(373,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',33,'username,account_status,email',NULL,'{\"email\": \"jack.cox@email.com\", \"username\": \"jack.cox\", \"account_status\": \"Active\"}','SUCCESS',NULL),(374,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',34,'username,account_status,email',NULL,'{\"email\": \"lily.howard@email.com\", \"username\": \"lily.howard\", \"account_status\": \"Active\"}','SUCCESS',NULL),(375,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',35,'username,account_status,email',NULL,'{\"email\": \"logan.ward@email.com\", \"username\": \"logan.ward\", \"account_status\": \"Inactive\"}','SUCCESS',NULL),(376,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',36,'username,account_status,email',NULL,'{\"email\": \"scarlett.torres@email.com\", \"username\": \"scarlett.torres\", \"account_status\": \"Active\"}','SUCCESS',NULL),(377,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',37,'username,account_status,email',NULL,'{\"email\": \"aiden.peterson@email.com\", \"username\": \"aiden.peterson\", \"account_status\": \"Active\"}','SUCCESS',NULL),(378,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',38,'username,account_status,email',NULL,'{\"email\": \"grace.gray@email.com\", \"username\": \"grace.gray\", \"account_status\": \"Active\"}','SUCCESS',NULL),(379,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',39,'username,account_status,email',NULL,'{\"email\": \"lucas.ramirez@email.com\", \"username\": \"lucas.ramirez\", \"account_status\": \"Active\"}','SUCCESS',NULL),(380,'2026-04-30 13:51:29',NULL,'INSERT','patient_accounts',40,'username,account_status,email',NULL,'{\"email\": \"chloe.james@email.com\", \"username\": \"chloe.james\", \"account_status\": \"Active\"}','SUCCESS',NULL);
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beds`
--

DROP TABLE IF EXISTS `beds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beds` (
  `bed_id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `bed_label` varchar(20) NOT NULL,
  `status` enum('Available','Occupied','Maintenance') NOT NULL DEFAULT 'Available',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`bed_id`),
  KEY `idx_beds_room_id` (`room_id`),
  CONSTRAINT `fk_beds_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beds`
--

LOCK TABLES `beds` WRITE;
/*!40000 ALTER TABLE `beds` DISABLE KEYS */;
INSERT INTO `beds` VALUES (1,7,'A','Occupied',NULL),(2,9,'A','Available',NULL),(3,17,'A','Occupied',NULL),(4,18,'A','Available',NULL),(5,19,'A','Occupied',NULL),(6,20,'A','Available',NULL),(7,22,'A','Available',NULL),(8,23,'A','Occupied',NULL),(9,25,'A','Occupied',NULL),(10,26,'A','Available',NULL),(11,28,'A','Occupied',NULL),(12,30,'A','Occupied',NULL),(13,31,'A','Available',NULL),(14,32,'A','Occupied',NULL),(15,33,'A','Available',NULL);
/*!40000 ALTER TABLE `beds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charges`
--

DROP TABLE IF EXISTS `charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charges` (
  `charge_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `charge_type` enum('Procedure','Lab','Medication','Room') NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `charge_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `procedure_id` int DEFAULT NULL,
  `lab_order_id` int DEFAULT NULL,
  `med_order_id` int DEFAULT NULL,
  `source_room_id` int DEFAULT NULL,
  PRIMARY KEY (`charge_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `idx_charges_procedure_id` (`procedure_id`),
  KEY `idx_charges_lab_order_id` (`lab_order_id`),
  KEY `idx_charges_med_order_id` (`med_order_id`),
  KEY `idx_charges_source_room_id` (`source_room_id`),
  CONSTRAINT `charges_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_charges_lab_order` FOREIGN KEY (`lab_order_id`) REFERENCES `lab_orders` (`lab_order_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_charges_med_order` FOREIGN KEY (`med_order_id`) REFERENCES `medication_orders` (`med_order_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_charges_procedure` FOREIGN KEY (`procedure_id`) REFERENCES `procedures` (`procedure_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_charges_source_room` FOREIGN KEY (`source_room_id`) REFERENCES `rooms` (`room_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charges`
--

LOCK TABLES `charges` WRITE;
/*!40000 ALTER TABLE `charges` DISABLE KEYS */;
INSERT INTO `charges` VALUES (1,3,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,17),(2,7,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,30),(3,14,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,31),(4,17,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,19),(5,21,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,32),(6,24,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,20),(7,28,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,30),(8,31,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,17),(9,35,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,31),(10,38,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,18),(11,42,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,30),(12,45,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,19),(13,49,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,31),(14,52,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,20),(15,56,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,30),(16,59,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,17),(17,63,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,30),(18,66,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,18),(19,70,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,31),(20,73,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,19),(21,77,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,30),(22,80,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,20),(23,84,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,31),(24,87,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,17),(25,91,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,30),(26,94,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,18),(27,98,'Room','ROOM-INPATIENT','Initial inpatient room charge',500.00,'2026-04-30 13:51:29',NULL,NULL,NULL,31),(28,1,'Procedure','71045','Chest X-ray single view',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(29,2,'Procedure','93000','Electrocardiogram',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(30,3,'Procedure','99223','Initial hospital care',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(31,4,'Procedure','99213','Established patient outpatient visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(32,5,'Procedure','73562','Knee X-ray',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(33,6,'Procedure','71250','CT chest',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(34,7,'Procedure','92928','Coronary stent placement',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(35,8,'Procedure','43235','Upper GI endoscopy',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(36,9,'Procedure','80053','Comprehensive metabolic panel',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(37,10,'Procedure','70450','CT head',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(38,11,'Procedure','72148','MRI lumbar spine',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(39,12,'Procedure','83036','Hemoglobin A1C',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(40,13,'Procedure','95816','EEG',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(41,14,'Procedure','99212','Follow-up visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(42,15,'Procedure','87804','Influenza test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(43,16,'Procedure','80061','Lipid panel',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(44,17,'Procedure','93010','EKG interpretation',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(45,18,'Procedure','85025','Complete blood count',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(46,19,'Procedure','73560','Joint X-ray',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(47,20,'Procedure','70551','MRI brain',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(48,21,'Procedure','94010','Pulmonary function test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(49,22,'Procedure','74177','CT abdomen and pelvis',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(50,23,'Procedure','93306','Echocardiogram',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(51,24,'Procedure','19301','Breast lumpectomy',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(52,25,'Procedure','99391','Pediatric preventive visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(53,26,'Procedure','73030','Shoulder X-ray',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(54,27,'Procedure','96116','Neurobehavioral status exam',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(55,28,'Procedure','70496','CT angiography head',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(56,29,'Procedure','99281','Emergency department visit, low severity',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(57,30,'Procedure','71020','Chest X-ray 2 views',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(58,31,'Procedure','71260','CT chest with contrast',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(59,32,'Procedure','99392','Pediatric preventive visit established',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(60,33,'Procedure','73502','Hip X-ray unilateral',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(61,34,'Procedure','70553','MRI brain with and without contrast',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(62,35,'Procedure','94060','Bronchodilation responsiveness test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(63,36,'Procedure','80048','Basic metabolic panel',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(64,37,'Procedure','93000','Electrocardiogram',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(65,38,'Procedure','36415','Collection of venous blood',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(66,39,'Procedure','90471','Immunization administration',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(67,40,'Procedure','73564','Knee X-ray complete',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(68,41,'Procedure','95957','Digital EEG analysis',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(69,42,'Procedure','94010','Spirometry',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(70,43,'Procedure','99214','Office visit, established patient',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(71,44,'Procedure','93005','Electrocardiogram tracing',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(72,45,'Procedure','77067','Screening mammography bilateral',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(73,46,'Procedure','87880','Rapid strep test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(74,47,'Procedure','72100','Lumbar spine X-ray',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(75,48,'Procedure','99283','Emergency department visit, moderate severity',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(76,49,'Procedure','94010','Pulmonary function test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(77,50,'Procedure','99213','Established patient outpatient visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(78,51,'Procedure','80053','Comprehensive metabolic panel',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(79,52,'Procedure','96413','Chemotherapy infusion',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(80,53,'Procedure','99393','Pediatric preventive visit age 5-11',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(81,54,'Procedure','20610','Joint injection major joint',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(82,55,'Procedure','95913','Nerve conduction studies',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(83,56,'Procedure','94760','Pulse oximetry',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(84,57,'Procedure','99212','Follow-up visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(85,58,'Procedure','93000','Electrocardiogram',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(86,59,'Procedure','85025','Complete blood count',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(87,60,'Procedure','87880','Rapid strep test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(88,61,'Procedure','72148','MRI lumbar spine',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(89,62,'Procedure','70551','MRI brain',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(90,63,'Procedure','94010','Pulmonary function test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(91,64,'Procedure','99213','Established patient outpatient visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(92,65,'Procedure','93306','Echocardiogram',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(93,66,'Procedure','36415','Collection of venous blood',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(94,67,'Procedure','99394','Adolescent preventive visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(95,68,'Procedure','73560','Joint X-ray',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(96,69,'Procedure','95816','EEG',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(97,70,'Procedure','94760','Pulse oximetry',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(98,71,'Procedure','99214','Office visit, established patient',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(99,72,'Procedure','93010','EKG interpretation',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(100,73,'Procedure','77067','Screening mammography bilateral',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(101,74,'Procedure','87804','Influenza test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(102,75,'Procedure','72100','Lumbar spine X-ray',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(103,76,'Procedure','71045','Chest X-ray single view',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(104,77,'Procedure','94010','Pulmonary function test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(105,78,'Procedure','99212','Follow-up visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(106,79,'Procedure','93000','Electrocardiogram',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(107,80,'Procedure','96413','Chemotherapy infusion',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(108,81,'Procedure','99393','Pediatric preventive visit age 5-11',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(109,82,'Procedure','20610','Joint injection major joint',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(110,83,'Procedure','95913','Nerve conduction studies',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(111,84,'Procedure','94760','Pulse oximetry',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(112,85,'Procedure','99213','Established patient outpatient visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(113,86,'Procedure','93306','Echocardiogram',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(114,87,'Procedure','36415','Collection of venous blood',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(115,88,'Procedure','99394','Adolescent preventive visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(116,89,'Procedure','73562','Knee X-ray',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(117,90,'Procedure','70551','MRI brain',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(118,91,'Procedure','94010','Pulmonary function test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(119,92,'Procedure','99213','Routine follow-up visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(120,93,'Procedure','93000','Electrocardiogram',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(121,94,'Procedure','77065','Diagnostic mammography unilateral',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(122,95,'Procedure','87804','Influenza test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(123,96,'Procedure','72148','MRI lumbar spine',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(124,97,'Procedure','70450','CT head without contrast',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(125,98,'Procedure','94060','Bronchodilation responsiveness test',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(126,99,'Procedure','99212','Follow-up visit',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(127,100,'Procedure','71045','Chest X-ray single view',200.00,'2026-04-30 13:51:29',NULL,NULL,NULL,NULL),(128,1,'Lab','LAB-1','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,1,NULL,NULL),(129,1,'Lab','LAB-2','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,1,NULL,NULL),(130,2,'Lab','LAB-3','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,2,NULL,NULL),(131,2,'Lab','LAB-4','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,2,NULL,NULL),(132,3,'Lab','LAB-5','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,3,NULL,NULL),(133,3,'Lab','LAB-6','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,3,NULL,NULL),(134,4,'Lab','LAB-7','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,4,NULL,NULL),(135,4,'Lab','LAB-8','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,4,NULL,NULL),(136,5,'Lab','LAB-9','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,5,NULL,NULL),(137,5,'Lab','LAB-10','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,5,NULL,NULL),(138,6,'Lab','LAB-11','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,6,NULL,NULL),(139,6,'Lab','LAB-12','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,6,NULL,NULL),(140,7,'Lab','LAB-13','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,7,NULL,NULL),(141,7,'Lab','LAB-14','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,7,NULL,NULL),(142,8,'Lab','LAB-15','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,8,NULL,NULL),(143,8,'Lab','LAB-16','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,8,NULL,NULL),(144,9,'Lab','LAB-17','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,9,NULL,NULL),(145,9,'Lab','LAB-18','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,9,NULL,NULL),(146,10,'Lab','LAB-19','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,10,NULL,NULL),(147,10,'Lab','LAB-20','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,10,NULL,NULL),(148,11,'Lab','LAB-21','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,11,NULL,NULL),(149,11,'Lab','LAB-22','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,11,NULL,NULL),(150,12,'Lab','LAB-23','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,12,NULL,NULL),(151,12,'Lab','LAB-24','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,12,NULL,NULL),(152,13,'Lab','LAB-25','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,13,NULL,NULL),(153,13,'Lab','LAB-26','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,13,NULL,NULL),(154,14,'Lab','LAB-27','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,14,NULL,NULL),(155,14,'Lab','LAB-28','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,14,NULL,NULL),(156,15,'Lab','LAB-29','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,15,NULL,NULL),(157,15,'Lab','LAB-30','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,15,NULL,NULL),(158,16,'Lab','LAB-31','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,16,NULL,NULL),(159,16,'Lab','LAB-32','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,16,NULL,NULL),(160,17,'Lab','LAB-33','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,17,NULL,NULL),(161,17,'Lab','LAB-34','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,17,NULL,NULL),(162,18,'Lab','LAB-35','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,18,NULL,NULL),(163,18,'Lab','LAB-36','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,18,NULL,NULL),(164,19,'Lab','LAB-37','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,19,NULL,NULL),(165,19,'Lab','LAB-38','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,19,NULL,NULL),(166,20,'Lab','LAB-39','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,20,NULL,NULL),(167,20,'Lab','LAB-40','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,20,NULL,NULL),(168,21,'Lab','LAB-41','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,21,NULL,NULL),(169,21,'Lab','LAB-42','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,21,NULL,NULL),(170,22,'Lab','LAB-43','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,22,NULL,NULL),(171,22,'Lab','LAB-44','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,22,NULL,NULL),(172,23,'Lab','LAB-45','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,23,NULL,NULL),(173,23,'Lab','LAB-46','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,23,NULL,NULL),(174,24,'Lab','LAB-47','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,24,NULL,NULL),(175,24,'Lab','LAB-48','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,24,NULL,NULL),(176,25,'Lab','LAB-49','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,25,NULL,NULL),(177,25,'Lab','LAB-50','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,25,NULL,NULL),(178,26,'Lab','LAB-51','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,26,NULL,NULL),(179,26,'Lab','LAB-52','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,26,NULL,NULL),(180,27,'Lab','LAB-53','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,27,NULL,NULL),(181,27,'Lab','LAB-54','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,27,NULL,NULL),(182,28,'Lab','LAB-55','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,28,NULL,NULL),(183,28,'Lab','LAB-56','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,28,NULL,NULL),(184,29,'Lab','LAB-57','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,29,NULL,NULL),(185,29,'Lab','LAB-58','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,29,NULL,NULL),(186,30,'Lab','LAB-59','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,30,NULL,NULL),(187,30,'Lab','LAB-60','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,30,NULL,NULL),(188,31,'Lab','LAB-61','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,31,NULL,NULL),(189,31,'Lab','LAB-62','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,31,NULL,NULL),(190,32,'Lab','LAB-63','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,32,NULL,NULL),(191,32,'Lab','LAB-64','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,32,NULL,NULL),(192,33,'Lab','LAB-65','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,33,NULL,NULL),(193,33,'Lab','LAB-66','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,33,NULL,NULL),(194,34,'Lab','LAB-67','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,34,NULL,NULL),(195,34,'Lab','LAB-68','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,34,NULL,NULL),(196,35,'Lab','LAB-69','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,35,NULL,NULL),(197,35,'Lab','LAB-70','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,35,NULL,NULL),(198,36,'Lab','LAB-71','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,36,NULL,NULL),(199,36,'Lab','LAB-72','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,36,NULL,NULL),(200,37,'Lab','LAB-73','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,37,NULL,NULL),(201,37,'Lab','LAB-74','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,37,NULL,NULL),(202,38,'Lab','LAB-75','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,38,NULL,NULL),(203,38,'Lab','LAB-76','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,38,NULL,NULL),(204,39,'Lab','LAB-77','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,39,NULL,NULL),(205,39,'Lab','LAB-78','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,39,NULL,NULL),(206,40,'Lab','LAB-79','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,40,NULL,NULL),(207,40,'Lab','LAB-80','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,40,NULL,NULL),(208,41,'Lab','LAB-81','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,41,NULL,NULL),(209,41,'Lab','LAB-82','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,41,NULL,NULL),(210,42,'Lab','LAB-83','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,42,NULL,NULL),(211,42,'Lab','LAB-84','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,42,NULL,NULL),(212,43,'Lab','LAB-85','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,43,NULL,NULL),(213,43,'Lab','LAB-86','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,43,NULL,NULL),(214,44,'Lab','LAB-87','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,44,NULL,NULL),(215,44,'Lab','LAB-88','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,44,NULL,NULL),(216,45,'Lab','LAB-89','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,45,NULL,NULL),(217,45,'Lab','LAB-90','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,45,NULL,NULL),(218,46,'Lab','LAB-91','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,46,NULL,NULL),(219,46,'Lab','LAB-92','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,46,NULL,NULL),(220,47,'Lab','LAB-93','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,47,NULL,NULL),(221,47,'Lab','LAB-94','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,47,NULL,NULL),(222,48,'Lab','LAB-95','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,48,NULL,NULL),(223,48,'Lab','LAB-96','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,48,NULL,NULL),(224,49,'Lab','LAB-97','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,49,NULL,NULL),(225,49,'Lab','LAB-98','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,49,NULL,NULL),(226,50,'Lab','LAB-99','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,50,NULL,NULL),(227,50,'Lab','LAB-100','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,50,NULL,NULL),(228,51,'Lab','LAB-1','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,51,NULL,NULL),(229,51,'Lab','LAB-2','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,51,NULL,NULL),(230,52,'Lab','LAB-3','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,52,NULL,NULL),(231,52,'Lab','LAB-4','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,52,NULL,NULL),(232,53,'Lab','LAB-5','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,53,NULL,NULL),(233,53,'Lab','LAB-6','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,53,NULL,NULL),(234,54,'Lab','LAB-7','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,54,NULL,NULL),(235,54,'Lab','LAB-8','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,54,NULL,NULL),(236,55,'Lab','LAB-9','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,55,NULL,NULL),(237,55,'Lab','LAB-10','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,55,NULL,NULL),(238,56,'Lab','LAB-11','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,56,NULL,NULL),(239,56,'Lab','LAB-12','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,56,NULL,NULL),(240,57,'Lab','LAB-13','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,57,NULL,NULL),(241,57,'Lab','LAB-14','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,57,NULL,NULL),(242,58,'Lab','LAB-15','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,58,NULL,NULL),(243,58,'Lab','LAB-16','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,58,NULL,NULL),(244,59,'Lab','LAB-17','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,59,NULL,NULL),(245,59,'Lab','LAB-18','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,59,NULL,NULL),(246,60,'Lab','LAB-19','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,60,NULL,NULL),(247,60,'Lab','LAB-20','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,60,NULL,NULL),(248,61,'Lab','LAB-21','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,61,NULL,NULL),(249,61,'Lab','LAB-22','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,61,NULL,NULL),(250,62,'Lab','LAB-23','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,62,NULL,NULL),(251,62,'Lab','LAB-24','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,62,NULL,NULL),(252,63,'Lab','LAB-25','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,63,NULL,NULL),(253,63,'Lab','LAB-26','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,63,NULL,NULL),(254,64,'Lab','LAB-27','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,64,NULL,NULL),(255,64,'Lab','LAB-28','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,64,NULL,NULL),(256,65,'Lab','LAB-29','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,65,NULL,NULL),(257,65,'Lab','LAB-30','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,65,NULL,NULL),(258,66,'Lab','LAB-31','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,66,NULL,NULL),(259,66,'Lab','LAB-32','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,66,NULL,NULL),(260,67,'Lab','LAB-33','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,67,NULL,NULL),(261,67,'Lab','LAB-34','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,67,NULL,NULL),(262,68,'Lab','LAB-35','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,68,NULL,NULL),(263,68,'Lab','LAB-36','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,68,NULL,NULL),(264,69,'Lab','LAB-37','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,69,NULL,NULL),(265,69,'Lab','LAB-38','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,69,NULL,NULL),(266,70,'Lab','LAB-39','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,70,NULL,NULL),(267,70,'Lab','LAB-40','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,70,NULL,NULL),(268,71,'Lab','LAB-41','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,71,NULL,NULL),(269,71,'Lab','LAB-42','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,71,NULL,NULL),(270,72,'Lab','LAB-43','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,72,NULL,NULL),(271,72,'Lab','LAB-44','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,72,NULL,NULL),(272,73,'Lab','LAB-45','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,73,NULL,NULL),(273,73,'Lab','LAB-46','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,73,NULL,NULL),(274,74,'Lab','LAB-47','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,74,NULL,NULL),(275,74,'Lab','LAB-48','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,74,NULL,NULL),(276,75,'Lab','LAB-49','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,75,NULL,NULL),(277,75,'Lab','LAB-50','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,75,NULL,NULL),(278,76,'Lab','LAB-51','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,76,NULL,NULL),(279,76,'Lab','LAB-52','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,76,NULL,NULL),(280,77,'Lab','LAB-53','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,77,NULL,NULL),(281,77,'Lab','LAB-54','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,77,NULL,NULL),(282,78,'Lab','LAB-55','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,78,NULL,NULL),(283,78,'Lab','LAB-56','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,78,NULL,NULL),(284,79,'Lab','LAB-57','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,79,NULL,NULL),(285,79,'Lab','LAB-58','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,79,NULL,NULL),(286,80,'Lab','LAB-59','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,80,NULL,NULL),(287,80,'Lab','LAB-60','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,80,NULL,NULL),(288,81,'Lab','LAB-61','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,81,NULL,NULL),(289,81,'Lab','LAB-62','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,81,NULL,NULL),(290,82,'Lab','LAB-63','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,82,NULL,NULL),(291,82,'Lab','LAB-64','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,82,NULL,NULL),(292,83,'Lab','LAB-65','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,83,NULL,NULL),(293,83,'Lab','LAB-66','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,83,NULL,NULL),(294,84,'Lab','LAB-67','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,84,NULL,NULL),(295,84,'Lab','LAB-68','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,84,NULL,NULL),(296,85,'Lab','LAB-69','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,85,NULL,NULL),(297,85,'Lab','LAB-70','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,85,NULL,NULL),(298,86,'Lab','LAB-71','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,86,NULL,NULL),(299,86,'Lab','LAB-72','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,86,NULL,NULL),(300,87,'Lab','LAB-73','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,87,NULL,NULL),(301,87,'Lab','LAB-74','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,87,NULL,NULL),(302,88,'Lab','LAB-75','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,88,NULL,NULL),(303,88,'Lab','LAB-76','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,88,NULL,NULL),(304,89,'Lab','LAB-77','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,89,NULL,NULL),(305,89,'Lab','LAB-78','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,89,NULL,NULL),(306,90,'Lab','LAB-79','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,90,NULL,NULL),(307,90,'Lab','LAB-80','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,90,NULL,NULL),(308,91,'Lab','LAB-81','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,91,NULL,NULL),(309,91,'Lab','LAB-82','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,91,NULL,NULL),(310,92,'Lab','LAB-83','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,92,NULL,NULL),(311,92,'Lab','LAB-84','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,92,NULL,NULL),(312,93,'Lab','LAB-85','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,93,NULL,NULL),(313,93,'Lab','LAB-86','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,93,NULL,NULL),(314,94,'Lab','LAB-87','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,94,NULL,NULL),(315,94,'Lab','LAB-88','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,94,NULL,NULL),(316,95,'Lab','LAB-89','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,95,NULL,NULL),(317,95,'Lab','LAB-90','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,95,NULL,NULL),(318,96,'Lab','LAB-91','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,96,NULL,NULL),(319,96,'Lab','LAB-92','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,96,NULL,NULL),(320,97,'Lab','LAB-93','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,97,NULL,NULL),(321,97,'Lab','LAB-94','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,97,NULL,NULL),(322,98,'Lab','LAB-95','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,98,NULL,NULL),(323,98,'Lab','LAB-96','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,98,NULL,NULL),(324,99,'Lab','LAB-97','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,99,NULL,NULL),(325,99,'Lab','LAB-98','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,99,NULL,NULL),(326,100,'Lab','LAB-99','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,100,NULL,NULL),(327,100,'Lab','LAB-100','Lab result charge',75.00,'2026-04-30 13:51:29',NULL,100,NULL,NULL),(328,1,'Medication','MED-1','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,1,NULL),(329,2,'Medication','MED-7','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,2,NULL),(330,3,'Medication','MED-30','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,3,NULL),(331,4,'Medication','MED-4','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,4,NULL),(332,5,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,5,NULL),(333,6,'Medication','MED-18','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,6,NULL),(334,7,'Medication','MED-12','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,7,NULL),(335,8,'Medication','MED-23','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,8,NULL),(336,9,'Medication','MED-14','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,9,NULL),(337,10,'Medication','MED-31','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,10,NULL),(338,11,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,11,NULL),(339,12,'Medication','MED-15','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,12,NULL),(340,13,'Medication','MED-35','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,13,NULL),(341,14,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,14,NULL),(342,15,'Medication','MED-1','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,15,NULL),(343,16,'Medication','MED-8','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,16,NULL),(344,17,'Medication','MED-11','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,17,NULL),(345,18,'Medication','MED-5','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,18,NULL),(346,19,'Medication','MED-3','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,19,NULL),(347,20,'Medication','MED-4','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,20,NULL),(348,21,'Medication','MED-19','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,21,NULL),(349,22,'Medication','MED-30','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,22,NULL),(350,23,'Medication','MED-7','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,23,NULL),(351,24,'Medication','MED-29','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,24,NULL),(352,25,'Medication','MED-1','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,25,NULL),(353,26,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,26,NULL),(354,27,'Medication','MED-34','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,27,NULL),(355,28,'Medication','MED-35','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,28,NULL),(356,29,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,29,NULL),(357,30,'Medication','MED-7','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,30,NULL),(358,31,'Medication','MED-29','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,31,NULL),(359,32,'Medication','MED-1','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,32,NULL),(360,33,'Medication','MED-3','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,33,NULL),(361,34,'Medication','MED-4','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,34,NULL),(362,35,'Medication','MED-18','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,35,NULL),(363,36,'Medication','MED-24','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,36,NULL),(364,37,'Medication','MED-7','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,37,NULL),(365,38,'Medication','MED-29','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,38,NULL),(366,39,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,39,NULL),(367,40,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,40,NULL),(368,41,'Medication','MED-35','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,41,NULL),(369,42,'Medication','MED-18','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,42,NULL),(370,43,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,43,NULL),(371,44,'Medication','MED-11','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,44,NULL),(372,45,'Medication','MED-29','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,45,NULL),(373,46,'Medication','MED-27','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,46,NULL),(374,47,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,47,NULL),(375,48,'Medication','MED-34','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,48,NULL),(376,49,'Medication','MED-18','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,49,NULL),(377,50,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,50,NULL),(378,51,'Medication','MED-8','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,51,NULL),(379,52,'Medication','MED-29','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,52,NULL),(380,53,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,53,NULL),(381,54,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,54,NULL),(382,55,'Medication','MED-35','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,55,NULL),(383,56,'Medication','MED-18','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,56,NULL),(384,57,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,57,NULL),(385,58,'Medication','MED-11','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,58,NULL),(386,59,'Medication','MED-29','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,59,NULL),(387,60,'Medication','MED-27','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,60,NULL),(388,61,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,61,NULL),(389,62,'Medication','MED-34','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,62,NULL),(390,63,'Medication','MED-18','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,63,NULL),(391,64,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,64,NULL),(392,65,'Medication','MED-7','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,65,NULL),(393,66,'Medication','MED-29','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,66,NULL),(394,67,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,67,NULL),(395,68,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,68,NULL),(396,69,'Medication','MED-35','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,69,NULL),(397,70,'Medication','MED-18','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,70,NULL),(398,71,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,71,NULL),(399,72,'Medication','MED-11','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,72,NULL),(400,73,'Medication','MED-29','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,73,NULL),(401,74,'Medication','MED-27','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,74,NULL),(402,75,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,75,NULL),(403,76,'Medication','MED-18','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,76,NULL),(404,77,'Medication','MED-7','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,77,NULL),(405,78,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,78,NULL),(406,79,'Medication','MED-11','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,79,NULL),(407,80,'Medication','MED-29','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,80,NULL),(408,81,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,81,NULL),(409,82,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,82,NULL),(410,83,'Medication','MED-35','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,83,NULL),(411,84,'Medication','MED-18','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,84,NULL),(412,85,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,85,NULL),(413,86,'Medication','MED-7','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,86,NULL),(414,87,'Medication','MED-29','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,87,NULL),(415,88,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,88,NULL),(416,89,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,89,NULL),(417,90,'Medication','MED-4','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,90,NULL),(418,91,'Medication','MED-18','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,91,NULL),(419,92,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,92,NULL),(420,93,'Medication','MED-11','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,93,NULL),(421,94,'Medication','MED-29','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,94,NULL),(422,95,'Medication','MED-27','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,95,NULL),(423,96,'Medication','MED-2','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,96,NULL),(424,97,'Medication','MED-4','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,97,NULL),(425,98,'Medication','MED-18','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,98,NULL),(426,99,'Medication','MED-42','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,99,NULL),(427,100,'Medication','MED-7','Medication order charge',50.00,'2026-04-30 13:51:29',NULL,NULL,100,NULL),(428,1,'Procedure','71045','Chest X-ray single view',150.00,'2026-04-01 10:35:00',NULL,NULL,NULL,NULL),(429,2,'Procedure','93000','Electrocardiogram',120.00,'2026-04-01 11:05:00',NULL,NULL,NULL,NULL),(430,3,'Room','RM-ONC-501','Oncology inpatient room charge',950.00,'2026-04-01 18:00:00',NULL,NULL,NULL,17),(431,4,'Procedure','99213','Established patient outpatient visit',180.00,'2026-04-01 12:05:00',NULL,NULL,NULL,NULL),(432,5,'Procedure','73562','Knee X-ray',165.00,'2026-04-01 12:35:00',NULL,NULL,NULL,NULL),(433,6,'Procedure','71250','CT chest',425.00,'2026-04-01 13:05:00',NULL,NULL,NULL,NULL),(434,7,'Procedure','92928','Coronary stent placement',4200.00,'2026-04-01 13:35:00',NULL,NULL,NULL,NULL),(435,8,'Procedure','43235','Upper GI endoscopy',850.00,'2026-04-01 14:05:00',NULL,NULL,NULL,NULL),(436,9,'Lab','80053','Comprehensive metabolic panel',75.00,'2026-04-01 14:35:00',NULL,NULL,NULL,NULL),(437,10,'Procedure','70450','CT head',380.00,'2026-04-01 15:05:00',NULL,NULL,NULL,NULL),(438,11,'Procedure','72148','MRI lumbar spine',650.00,'2026-04-01 15:35:00',NULL,NULL,NULL,NULL),(439,12,'Lab','83036','Hemoglobin A1C',45.00,'2026-04-01 16:05:00',NULL,NULL,NULL,NULL),(440,13,'Procedure','95816','EEG',420.00,'2026-04-02 09:35:00',NULL,NULL,NULL,NULL),(441,14,'Procedure','99212','Follow-up visit',135.00,'2026-04-02 10:05:00',NULL,NULL,NULL,NULL),(442,15,'Lab','87804','Influenza test',40.00,'2026-04-02 10:35:00',NULL,NULL,NULL,NULL),(443,16,'Lab','80061','Lipid panel',55.00,'2026-04-02 11:05:00',NULL,NULL,NULL,NULL),(444,17,'Procedure','93010','EKG interpretation',95.00,'2026-04-02 11:35:00',NULL,NULL,NULL,NULL),(445,18,'Lab','85025','Complete blood count',35.00,'2026-04-02 12:05:00',NULL,NULL,NULL,NULL),(446,19,'Procedure','73560','Joint X-ray',150.00,'2026-04-02 12:35:00',NULL,NULL,NULL,NULL),(447,20,'Procedure','70551','MRI brain',700.00,'2026-04-02 13:05:00',NULL,NULL,NULL,NULL),(448,21,'Procedure','94010','Pulmonary function test',140.00,'2026-04-02 13:35:00',NULL,NULL,NULL,NULL),(449,22,'Procedure','74177','CT abdomen and pelvis',520.00,'2026-04-02 14:05:00',NULL,NULL,NULL,NULL),(450,23,'Procedure','93306','Echocardiogram',320.00,'2026-04-02 14:35:00',NULL,NULL,NULL,NULL),(451,24,'Procedure','19301','Breast lumpectomy',3500.00,'2026-04-02 15:05:00',NULL,NULL,NULL,NULL),(452,25,'Procedure','99391','Pediatric preventive visit',160.00,'2026-04-03 09:35:00',NULL,NULL,NULL,NULL),(453,26,'Procedure','73030','Shoulder X-ray',155.00,'2026-04-03 10:05:00',NULL,NULL,NULL,NULL),(454,27,'Procedure','96116','Neurobehavioral status exam',260.00,'2026-04-03 10:35:00',NULL,NULL,NULL,NULL),(455,28,'Procedure','70496','CT angiography head',780.00,'2026-04-03 11:05:00',NULL,NULL,NULL,NULL),(456,29,'Procedure','99281','Emergency department visit, low severity',210.00,'2026-04-03 11:35:00',NULL,NULL,NULL,NULL),(457,30,'Procedure','71020','Chest X-ray 2 views',175.00,'2026-04-03 12:05:00',NULL,NULL,NULL,NULL),(458,31,'Procedure','71260','CT chest with contrast',460.00,'2026-04-03 12:35:00',NULL,NULL,NULL,NULL),(459,32,'Procedure','99392','Pediatric preventive visit established',165.00,'2026-04-03 13:05:00',NULL,NULL,NULL,NULL),(460,33,'Procedure','73502','Hip X-ray unilateral',170.00,'2026-04-03 13:35:00',NULL,NULL,NULL,NULL),(461,34,'Procedure','70553','MRI brain with and without contrast',760.00,'2026-04-03 14:05:00',NULL,NULL,NULL,NULL),(462,35,'Room','RM-ICU-901','ICU room charge',1450.00,'2026-04-03 18:30:00',NULL,NULL,NULL,31),(463,36,'Lab','80048','Basic metabolic panel',60.00,'2026-04-03 15:05:00',NULL,NULL,NULL,NULL),(464,37,'Procedure','93000','Electrocardiogram',120.00,'2026-04-04 09:35:00',NULL,NULL,NULL,NULL),(465,38,'Lab','36415','Collection of venous blood',20.00,'2026-04-04 10:05:00',NULL,NULL,NULL,NULL),(466,39,'Procedure','90471','Immunization administration',85.00,'2026-04-04 10:35:00',NULL,NULL,NULL,NULL),(467,40,'Procedure','73564','Knee X-ray complete',180.00,'2026-04-04 11:05:00',NULL,NULL,NULL,NULL),(468,41,'Procedure','95957','Digital EEG analysis',310.00,'2026-04-04 11:35:00',NULL,NULL,NULL,NULL),(469,42,'Procedure','94010','Spirometry',140.00,'2026-04-04 12:05:00',NULL,NULL,NULL,NULL),(470,43,'Procedure','99214','Office visit, established patient',210.00,'2026-04-04 12:35:00',NULL,NULL,NULL,NULL),(471,44,'Procedure','93005','Electrocardiogram tracing',80.00,'2026-04-04 13:05:00',NULL,NULL,NULL,NULL),(472,45,'Procedure','77067','Screening mammography bilateral',245.00,'2026-04-04 13:35:00',NULL,NULL,NULL,NULL),(473,46,'Lab','87880','Rapid strep test',35.00,'2026-04-04 14:05:00',NULL,NULL,NULL,NULL),(474,47,'Procedure','72100','Lumbar spine X-ray',165.00,'2026-04-04 14:35:00',NULL,NULL,NULL,NULL),(475,48,'Procedure','99283','Emergency department visit, moderate severity',340.00,'2026-04-04 15:05:00',NULL,NULL,NULL,NULL),(476,49,'Procedure','94010','Pulmonary function test',140.00,'2026-04-05 09:35:00',NULL,NULL,NULL,NULL),(477,50,'Procedure','99213','Established patient outpatient visit',180.00,'2026-04-05 10:05:00',NULL,NULL,NULL,NULL),(478,51,'Lab','80053','Comprehensive metabolic panel',75.00,'2026-04-05 10:35:00',NULL,NULL,NULL,NULL),(479,52,'Procedure','96413','Chemotherapy infusion',1250.00,'2026-04-05 11:05:00',NULL,NULL,NULL,NULL),(480,53,'Procedure','99393','Pediatric preventive visit age 5-11',170.00,'2026-04-05 11:35:00',NULL,NULL,NULL,NULL),(481,54,'Procedure','20610','Joint injection major joint',290.00,'2026-04-05 12:05:00',NULL,NULL,NULL,NULL),(482,55,'Procedure','95913','Nerve conduction studies',410.00,'2026-04-05 12:35:00',NULL,NULL,NULL,NULL),(483,56,'Procedure','94760','Pulse oximetry',25.00,'2026-04-05 13:05:00',NULL,NULL,NULL,NULL),(484,57,'Procedure','99212','Follow-up visit',135.00,'2026-04-05 13:35:00',NULL,NULL,NULL,NULL),(485,58,'Procedure','93000','Electrocardiogram',120.00,'2026-04-05 14:05:00',NULL,NULL,NULL,NULL),(486,59,'Lab','85025','Complete blood count',35.00,'2026-04-05 14:35:00',NULL,NULL,NULL,NULL),(487,60,'Lab','87880','Rapid strep test',35.00,'2026-04-05 15:05:00',NULL,NULL,NULL,NULL),(488,61,'Procedure','72148','MRI lumbar spine',650.00,'2026-04-06 09:35:00',NULL,NULL,NULL,NULL),(489,62,'Procedure','70551','MRI brain',700.00,'2026-04-06 10:05:00',NULL,NULL,NULL,NULL),(490,63,'Procedure','94010','Pulmonary function test',140.00,'2026-04-06 10:35:00',NULL,NULL,NULL,NULL),(491,64,'Procedure','99213','Established patient outpatient visit',180.00,'2026-04-06 11:05:00',NULL,NULL,NULL,NULL),(492,65,'Procedure','93306','Echocardiogram',320.00,'2026-04-06 11:35:00',NULL,NULL,NULL,NULL),(493,66,'Lab','36415','Collection of venous blood',20.00,'2026-04-06 12:05:00',NULL,NULL,NULL,NULL),(494,67,'Procedure','99394','Adolescent preventive visit',175.00,'2026-04-06 12:35:00',NULL,NULL,NULL,NULL),(495,68,'Procedure','73560','Joint X-ray',150.00,'2026-04-06 13:05:00',NULL,NULL,NULL,NULL),(496,69,'Procedure','95816','EEG',420.00,'2026-04-06 13:35:00',NULL,NULL,NULL,NULL),(497,70,'Procedure','94760','Pulse oximetry',25.00,'2026-04-06 14:05:00',NULL,NULL,NULL,NULL),(498,71,'Procedure','99214','Office visit, established patient',210.00,'2026-04-06 14:35:00',NULL,NULL,NULL,NULL),(499,72,'Procedure','93010','EKG interpretation',95.00,'2026-04-06 15:05:00',NULL,NULL,NULL,NULL),(500,73,'Procedure','77067','Screening mammography bilateral',245.00,'2026-04-07 09:35:00',NULL,NULL,NULL,NULL),(501,74,'Lab','87804','Influenza test',40.00,'2026-04-07 10:05:00',NULL,NULL,NULL,NULL),(502,75,'Procedure','72100','Lumbar spine X-ray',165.00,'2026-04-07 10:35:00',NULL,NULL,NULL,NULL),(503,76,'Procedure','71045','Chest X-ray single view',150.00,'2026-04-07 11:05:00',NULL,NULL,NULL,NULL),(504,77,'Procedure','94010','Pulmonary function test',140.00,'2026-04-07 11:35:00',NULL,NULL,NULL,NULL),(505,78,'Procedure','99212','Follow-up visit',135.00,'2026-04-07 12:05:00',NULL,NULL,NULL,NULL),(506,79,'Procedure','93000','Electrocardiogram',120.00,'2026-04-07 12:35:00',NULL,NULL,NULL,NULL),(507,80,'Procedure','96413','Chemotherapy infusion',1250.00,'2026-04-07 13:05:00',NULL,NULL,NULL,NULL),(508,81,'Procedure','99393','Pediatric preventive visit age 5-11',170.00,'2026-04-07 13:35:00',NULL,NULL,NULL,NULL),(509,82,'Procedure','20610','Joint injection major joint',290.00,'2026-04-07 14:05:00',NULL,NULL,NULL,NULL),(510,83,'Procedure','95913','Nerve conduction studies',410.00,'2026-04-07 14:35:00',NULL,NULL,NULL,NULL),(511,84,'Procedure','94760','Pulse oximetry',25.00,'2026-04-07 15:05:00',NULL,NULL,NULL,NULL),(512,85,'Procedure','99213','Established patient outpatient visit',180.00,'2026-04-08 09:35:00',NULL,NULL,NULL,NULL),(513,86,'Procedure','93306','Echocardiogram',320.00,'2026-04-08 10:05:00',NULL,NULL,NULL,NULL),(514,87,'Lab','36415','Collection of venous blood',20.00,'2026-04-08 10:35:00',NULL,NULL,NULL,NULL),(515,88,'Procedure','99394','Adolescent preventive visit',175.00,'2026-04-08 11:05:00',NULL,NULL,NULL,NULL),(516,89,'Procedure','73562','Knee X-ray',165.00,'2026-04-08 11:35:00',NULL,NULL,NULL,NULL),(517,90,'Procedure','70551','MRI brain',700.00,'2026-04-08 12:05:00',NULL,NULL,NULL,NULL),(518,91,'Procedure','94010','Pulmonary function test',140.00,'2026-04-08 12:35:00',NULL,NULL,NULL,NULL),(519,92,'Procedure','99213','Routine follow-up visit',180.00,'2026-04-08 13:05:00',NULL,NULL,NULL,NULL),(520,93,'Procedure','93000','Electrocardiogram',120.00,'2026-04-08 13:35:00',NULL,NULL,NULL,NULL),(521,94,'Procedure','77065','Diagnostic mammography unilateral',230.00,'2026-04-08 14:05:00',NULL,NULL,NULL,NULL),(522,95,'Lab','87804','Influenza test',40.00,'2026-04-08 14:35:00',NULL,NULL,NULL,NULL),(523,96,'Procedure','72148','MRI lumbar spine',650.00,'2026-04-08 15:05:00',NULL,NULL,NULL,NULL),(524,97,'Procedure','70450','CT head without contrast',380.00,'2026-04-09 09:35:00',NULL,NULL,NULL,NULL),(525,98,'Procedure','94060','Bronchodilation responsiveness test',155.00,'2026-04-09 10:05:00',NULL,NULL,NULL,NULL),(526,99,'Procedure','99212','Follow-up visit',135.00,'2026-04-09 10:35:00',NULL,NULL,NULL,NULL),(527,100,'Procedure','71045','Chest X-ray single view',150.00,'2026-04-09 11:05:00',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_ins`
--

DROP TABLE IF EXISTS `check_ins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_ins` (
  `checkin_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `appointment_id` int DEFAULT NULL,
  `checkin_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `method` enum('Kiosk','Mobile','FrontDesk') NOT NULL,
  `status` varchar(50) DEFAULT 'Checked In',
  `triage_level` enum('High','Medium','Low') DEFAULT NULL,
  `symptoms` text,
  `ai_notes` text,
  PRIMARY KEY (`checkin_id`),
  KEY `patient_id` (`patient_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `check_ins_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `check_ins_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_ins`
--

LOCK TABLES `check_ins` WRITE;
/*!40000 ALTER TABLE `check_ins` DISABLE KEYS */;
INSERT INTO `check_ins` VALUES (1,1,1,'2026-04-01 07:50:00','FrontDesk','Checked In','Medium','Fever and cough','Possible flu'),(2,2,2,'2026-04-01 08:20:00','Kiosk','Checked In','Low','Routine follow-up','Stable'),(3,3,3,'2026-04-01 08:50:00','FrontDesk','Checked In','High','Severe fatigue','Needs evaluation'),(4,4,4,'2026-04-01 09:20:00','FrontDesk','Checked In','Medium','Headache','Neurology review'),(5,5,5,'2026-04-01 09:50:00','Kiosk','Checked In','Low','Joint pain','Orthopedic follow-up'),(6,6,6,'2026-04-01 10:20:00','FrontDesk','Checked In','High','Shortness of breath','Respiratory concern'),(7,7,7,'2026-04-01 10:50:00','FrontDesk','Checked In','High','Chest pain','Possible cardiac issue'),(8,8,8,'2026-04-01 11:20:00','Kiosk','Checked In','Medium','Abdominal pain','Needs examination'),(9,9,9,'2026-04-01 12:50:00','FrontDesk','Checked In','Low','Medication refill','Routine medication visit'),(10,10,10,'2026-04-01 13:20:00','FrontDesk','Checked In','Medium','Dizziness','Monitor symptoms'),(11,11,11,'2026-04-01 13:50:00','Kiosk','Checked In','Low','Routine check','Stable'),(12,12,12,'2026-04-01 14:20:00','FrontDesk','Checked In','Medium','Back pain','Orthopedic evaluation'),(13,13,13,'2026-04-02 07:50:00','FrontDesk','Checked In','High','Seizure history','Urgent neuro review'),(14,14,14,'2026-04-02 08:20:00','Kiosk','Checked In','Low','Routine follow-up','Stable'),(15,15,15,'2026-04-02 08:50:00','FrontDesk','Checked In','Medium','Fever','Possible infection'),(16,16,16,'2026-04-02 09:20:00','FrontDesk','Checked In','Low','Blood pressure check','Routine cardiology'),(17,17,17,'2026-04-02 09:50:00','Kiosk','Checked In','Medium','Palpitations','Cardiac follow-up'),(18,18,18,'2026-04-02 10:20:00','FrontDesk','Checked In','High','Weakness and nausea','Needs workup'),(19,19,19,'2026-04-02 10:50:00','FrontDesk','Checked In','Medium','Knee pain','Mobility assessment'),(20,20,20,'2026-04-02 11:20:00','Kiosk','Checked In','Low','Migraine follow-up','Stable condition'),(21,21,21,'2026-04-02 12:50:00','FrontDesk','Checked In','High','Breathing difficulty','Immediate observation'),(22,22,22,'2026-04-02 13:20:00','FrontDesk','Checked In','Medium','Abdominal cramps','Further testing needed'),(23,23,23,'2026-04-02 13:50:00','Kiosk','Checked In','Low','Routine heart follow-up','Stable'),(24,24,24,'2026-04-02 14:20:00','FrontDesk','Checked In','Medium','Cancer treatment follow-up','Oncology reassessment'),(25,25,25,'2026-04-03 07:50:00','FrontDesk','Checked In','Low','Pediatric wellness visit','Routine exam'),(26,26,26,'2026-04-03 08:20:00','Kiosk','Checked In','Medium','Shoulder pain','Needs imaging'),(27,27,27,'2026-04-03 08:50:00','FrontDesk','Checked In','Medium','Memory issues','Neurology screening'),(28,28,28,'2026-04-03 09:20:00','FrontDesk','Checked In','High','Severe headache','Urgent evaluation'),(29,29,29,'2026-04-03 09:50:00','Kiosk','Checked In','Low','ER follow-up','Recovery progressing'),(30,30,30,'2026-04-03 10:20:00','FrontDesk','Checked In','Medium','Chest discomfort','Needs exam'),(31,31,31,'2026-04-03 10:50:00','FrontDesk','Checked In','Medium','Chemotherapy follow-up','Monitor labs'),(32,32,32,'2026-04-03 11:20:00','Kiosk','Checked In','Low','Routine pediatric follow-up','Stable'),(33,33,33,'2026-04-03 12:50:00','FrontDesk','Checked In','Medium','Hip pain','Orthopedic consult'),(34,34,34,'2026-04-03 13:20:00','FrontDesk','Checked In','Low','Migraine check','Stable'),(35,35,35,'2026-04-03 13:50:00','Kiosk','Checked In','High','Oxygen concerns','Possible ICU review'),(36,36,36,'2026-04-03 14:20:00','FrontDesk','Checked In','Medium','Abdominal pain','General assessment'),(37,37,37,'2026-04-04 07:50:00','FrontDesk','Checked In','Low','Heart follow-up','Stable'),(38,38,38,'2026-04-04 08:20:00','Kiosk','Checked In','Medium','Cancer screening follow-up','Needs imaging'),(39,39,39,'2026-04-04 08:50:00','FrontDesk','Checked In','Low','Vaccination follow-up','Routine pediatric visit'),(40,40,40,'2026-04-04 09:20:00','FrontDesk','Checked In','Medium','Joint stiffness','Mobility concern'),(41,41,41,'2026-04-04 09:50:00','Kiosk','Checked In','Medium','Numbness','Neurology review'),(42,42,42,'2026-04-04 10:20:00','FrontDesk','Checked In','High','Severe breathing issue','Urgent ICU-level assessment'),(43,43,43,'2026-04-04 10:50:00','FrontDesk','Checked In','Low','Routine exam','Stable'),(44,44,44,'2026-04-04 11:20:00','Kiosk','Checked In','Medium','Palpitations','Further cardiology review'),(45,45,45,'2026-04-04 12:50:00','FrontDesk','Checked In','Medium','Oncology medication issue','Provider follow-up'),(46,46,46,'2026-04-04 13:20:00','FrontDesk','Checked In','Low','Pediatric cough','Routine treatment'),(47,47,47,'2026-04-04 13:50:00','Kiosk','Checked In','Medium','Back and leg pain','Needs reassessment'),(48,48,48,'2026-04-04 14:20:00','FrontDesk','Checked In','Medium','Persistent headache','Neurology observation'),(49,49,49,'2026-04-05 07:50:00','FrontDesk','Checked In','High','Oxygen saturation concern','Immediate monitoring'),(50,50,50,'2026-04-05 08:20:00','Kiosk','Checked In','Low','Routine ER follow-up','Stable recovery'),(51,51,51,'2026-04-05 08:50:00','FrontDesk','Checked In','Medium','Blood pressure concern','Cardiology review'),(52,52,52,'2026-04-05 09:20:00','FrontDesk','Checked In','Medium','Treatment fatigue','Oncology follow-up'),(53,53,53,'2026-04-05 09:50:00','Kiosk','Checked In','Low','Well child visit','Routine'),(54,54,54,'2026-04-05 10:20:00','FrontDesk','Checked In','Medium','Knee swelling','Orthopedic review'),(55,55,55,'2026-04-05 10:50:00','FrontDesk','Checked In','Medium','Tingling sensations','Neurology evaluation'),(56,56,56,'2026-04-05 11:20:00','Kiosk','Checked In','High','Breathing tightness','Needs urgent review'),(57,57,57,'2026-04-05 12:50:00','FrontDesk','Checked In','Low','Routine follow-up','Stable'),(58,58,58,'2026-04-05 13:20:00','FrontDesk','Checked In','Medium','Chest pressure','Cardiology workup'),(59,59,59,'2026-04-05 13:50:00','Kiosk','Checked In','Medium','Follow-up on treatment','Oncology reassessment'),(60,60,60,'2026-04-05 14:20:00','FrontDesk','Checked In','Low','Pediatric rash','Routine care'),(61,61,61,'2026-04-06 07:50:00','FrontDesk','Checked In','Medium','Shoulder pain','Orthopedic evaluation'),(62,62,62,'2026-04-06 08:20:00','Kiosk','Checked In','Medium','Migraine symptoms','Neurology consult'),(63,63,63,'2026-04-06 08:50:00','FrontDesk','Checked In','High','Shortness of breath','ICU review may be needed'),(64,64,64,'2026-04-06 09:20:00','FrontDesk','Checked In','Low','Routine general check','Stable'),(65,65,65,'2026-04-06 09:50:00','Kiosk','Checked In','Medium','Irregular heartbeat','Cardiology follow-up'),(66,66,66,'2026-04-06 10:20:00','FrontDesk','Checked In','Medium','Cancer care follow-up','Lab review suggested'),(67,67,67,'2026-04-06 10:50:00','FrontDesk','Checked In','Low','Pediatric follow-up','Stable'),(68,68,68,'2026-04-06 11:20:00','Kiosk','Checked In','Medium','Lower back pain','Orthopedic reassessment'),(69,69,69,'2026-04-06 12:50:00','FrontDesk','Checked In','Medium','Dizziness','Monitor neurological symptoms'),(70,70,70,'2026-04-06 13:20:00','FrontDesk','Checked In','High','Respiratory distress','Urgent observation'),(71,71,71,'2026-04-06 13:50:00','Kiosk','Checked In','Low','Routine exam','Stable'),(72,72,72,'2026-04-06 14:20:00','FrontDesk','Checked In','Medium','Follow-up for chest symptoms','Further testing'),(73,73,73,'2026-04-07 07:50:00','FrontDesk','Checked In','Medium','Cancer medication side effects','Needs provider review'),(74,74,74,'2026-04-07 08:20:00','Kiosk','Checked In','Low','Child wellness visit','Routine'),(75,75,75,'2026-04-07 08:50:00','FrontDesk','Checked In','Medium','Joint pain and swelling','Orthopedic consult'),(76,76,76,'2026-04-07 09:20:00','FrontDesk','Checked In','Medium','Chronic headache','Neurology review'),(77,77,77,'2026-04-07 09:50:00','Kiosk','Checked In','High','Low oxygen complaint','Urgent respiratory review'),(78,78,78,'2026-04-07 10:20:00','FrontDesk','Checked In','Low','ER re-evaluation','Stable'),(79,79,79,'2026-04-07 10:50:00','FrontDesk','Checked In','Medium','Chest discomfort','Possible cardiac follow-up'),(80,80,80,'2026-04-07 11:20:00','Kiosk','Checked In','Medium','Oncology follow-up fatigue','Needs lab work'),(81,81,81,'2026-04-07 12:50:00','FrontDesk','Checked In','Low','Routine pediatric visit','Stable'),(82,82,82,'2026-04-07 13:20:00','FrontDesk','Checked In','Medium','Ankle pain','Orthopedic check'),(83,83,83,'2026-04-07 13:50:00','Kiosk','Checked In','Medium','Nerve pain','Neurology follow-up'),(84,84,84,'2026-04-07 14:20:00','FrontDesk','Checked In','High','Difficulty breathing','Urgent ICU consideration'),(85,85,85,'2026-04-08 07:50:00','FrontDesk','Checked In','Low','Routine follow-up','Stable'),(86,86,86,'2026-04-08 08:20:00','Kiosk','Checked In','Medium','Blood pressure fluctuations','Cardiology monitoring'),(87,87,87,'2026-04-08 08:50:00','FrontDesk','Checked In','Medium','Oncology treatment review','Monitor symptoms'),(88,88,88,'2026-04-08 09:20:00','FrontDesk','Checked In','Low','Pediatric sore throat','Routine'),(89,89,89,'2026-04-08 09:50:00','Kiosk','Checked In','Medium','Hip discomfort','Orthopedic follow-up'),(90,90,90,'2026-04-08 10:20:00','FrontDesk','Checked In','Medium','Migraine and nausea','Neurology review'),(91,91,91,'2026-04-08 10:50:00','FrontDesk','Checked In','High','Breathing concerns','Urgent assessment'),(92,92,92,'2026-04-08 11:20:00','Kiosk','Checked In','Low','General follow-up','Stable'),(93,93,93,'2026-04-08 12:50:00','FrontDesk','Checked In','Medium','Palpitations and fatigue','Cardiology reassessment'),(94,94,94,'2026-04-08 13:20:00','FrontDesk','Checked In','Medium','Cancer pain management','Needs provider review'),(95,95,95,'2026-04-08 13:50:00','Kiosk','Checked In','Low','Child recheck','Stable'),(96,96,96,'2026-04-08 14:20:00','FrontDesk','Checked In','Medium','Back pain','Orthopedic review'),(97,97,97,'2026-04-09 07:50:00','Kiosk','Checked In','Low','Routine neuro follow-up','Stable'),(98,98,98,'2026-04-09 08:20:00','FrontDesk','Checked In','Medium','ICU step-down review','Needs evaluation'),(99,99,99,'2026-04-09 08:50:00','FrontDesk','Checked In','Low','Routine ER follow-up','Recovery stable'),(100,100,100,'2026-04-09 09:20:00','Kiosk','Checked In','Medium','Cardiology follow-up','Monitor symptoms');
/*!40000 ALTER TABLE `check_ins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claim_insurances`
--

DROP TABLE IF EXISTS `claim_insurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claim_insurances` (
  `claim_id` int NOT NULL,
  `insurance_id` int NOT NULL,
  `sequence` int NOT NULL DEFAULT '1' COMMENT '1=primary, 2=secondary',
  `billed_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `allowed_amount` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `adjustment_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('Submitted','Accepted','Denied','Paid','Adjusted') NOT NULL DEFAULT 'Submitted',
  PRIMARY KEY (`claim_id`,`insurance_id`),
  UNIQUE KEY `uq_claim_sequence` (`claim_id`,`sequence`),
  KEY `idx_ci_insurance_id` (`insurance_id`),
  CONSTRAINT `fk_ci_claim` FOREIGN KEY (`claim_id`) REFERENCES `claims` (`claim_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ci_insurance` FOREIGN KEY (`insurance_id`) REFERENCES `insurance_plans` (`insurance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claim_insurances`
--

LOCK TABLES `claim_insurances` WRITE;
/*!40000 ALTER TABLE `claim_insurances` DISABLE KEYS */;
INSERT INTO `claim_insurances` VALUES (1,1,1,200.00,NULL,NULL,NULL,'Submitted'),(2,5,1,180.00,NULL,NULL,NULL,'Accepted'),(3,19,1,950.00,NULL,NULL,NULL,'Paid'),(4,17,1,180.00,NULL,NULL,NULL,'Denied'),(5,9,1,165.00,NULL,NULL,NULL,'Accepted'),(6,2,1,425.00,NULL,NULL,NULL,'Submitted'),(7,6,1,4200.00,NULL,NULL,NULL,'Paid'),(8,20,1,850.00,NULL,NULL,NULL,'Accepted'),(9,18,1,75.00,NULL,NULL,NULL,'Denied'),(10,10,1,380.00,NULL,NULL,NULL,'Submitted'),(11,3,1,650.00,NULL,NULL,NULL,'Accepted'),(12,7,1,45.00,NULL,NULL,NULL,'Paid'),(13,21,1,420.00,NULL,NULL,NULL,'Accepted'),(14,16,1,135.00,NULL,NULL,NULL,'Denied'),(15,11,1,40.00,NULL,NULL,NULL,'Paid'),(16,4,1,55.00,NULL,NULL,NULL,'Submitted'),(17,8,1,95.00,NULL,NULL,NULL,'Accepted'),(18,22,1,35.00,NULL,NULL,NULL,'Paid'),(19,17,1,150.00,NULL,NULL,NULL,'Accepted'),(20,12,1,700.00,NULL,NULL,NULL,'Denied'),(21,13,1,140.00,NULL,NULL,NULL,'Submitted'),(22,14,1,520.00,NULL,NULL,NULL,'Accepted'),(23,15,1,320.00,NULL,NULL,NULL,'Paid'),(24,23,1,3500.00,NULL,NULL,NULL,'Denied'),(25,24,1,160.00,NULL,NULL,NULL,'Accepted'),(26,25,1,155.00,NULL,NULL,NULL,'Paid'),(27,26,1,260.00,NULL,NULL,NULL,'Accepted'),(28,27,1,780.00,NULL,NULL,NULL,'Submitted'),(29,28,1,210.00,NULL,NULL,NULL,'Accepted'),(30,29,1,175.00,NULL,NULL,NULL,'Paid'),(31,30,1,460.00,NULL,NULL,NULL,'Accepted'),(32,1,1,165.00,NULL,NULL,NULL,'Denied'),(33,5,1,170.00,NULL,NULL,NULL,'Paid'),(34,19,1,760.00,NULL,NULL,NULL,'Accepted'),(35,9,1,1450.00,NULL,NULL,NULL,'Submitted'),(36,2,1,60.00,NULL,NULL,NULL,'Accepted'),(37,6,1,120.00,NULL,NULL,NULL,'Paid'),(38,20,1,20.00,NULL,NULL,NULL,'Accepted'),(39,18,1,85.00,NULL,NULL,NULL,'Denied'),(40,10,1,180.00,NULL,NULL,NULL,'Paid'),(41,3,1,310.00,NULL,NULL,NULL,'Accepted'),(42,7,1,140.00,NULL,NULL,NULL,'Submitted'),(43,21,1,210.00,NULL,NULL,NULL,'Paid'),(44,16,1,80.00,NULL,NULL,NULL,'Accepted'),(45,11,1,245.00,NULL,NULL,NULL,'Paid'),(46,4,1,35.00,NULL,NULL,NULL,'Denied'),(47,8,1,165.00,NULL,NULL,NULL,'Accepted'),(48,22,1,340.00,NULL,NULL,NULL,'Paid'),(49,17,1,140.00,NULL,NULL,NULL,'Accepted'),(50,12,1,180.00,NULL,NULL,NULL,'Submitted'),(51,13,1,75.00,NULL,NULL,NULL,'Paid'),(52,14,1,1250.00,NULL,NULL,NULL,'Accepted'),(53,15,1,170.00,NULL,NULL,NULL,'Paid'),(54,23,1,290.00,NULL,NULL,NULL,'Accepted'),(55,24,1,410.00,NULL,NULL,NULL,'Denied'),(56,25,1,25.00,NULL,NULL,NULL,'Paid'),(57,26,1,135.00,NULL,NULL,NULL,'Accepted'),(58,27,1,120.00,NULL,NULL,NULL,'Paid'),(59,28,1,35.00,NULL,NULL,NULL,'Accepted'),(60,29,1,35.00,NULL,NULL,NULL,'Submitted'),(61,30,1,650.00,NULL,NULL,NULL,'Paid'),(62,1,1,700.00,NULL,NULL,NULL,'Accepted'),(63,5,1,140.00,NULL,NULL,NULL,'Submitted'),(64,19,1,180.00,NULL,NULL,NULL,'Paid'),(65,9,1,320.00,NULL,NULL,NULL,'Accepted'),(66,2,1,20.00,NULL,NULL,NULL,'Denied'),(67,6,1,175.00,NULL,NULL,NULL,'Paid'),(68,20,1,150.00,NULL,NULL,NULL,'Accepted'),(69,18,1,420.00,NULL,NULL,NULL,'Paid'),(70,10,1,25.00,NULL,NULL,NULL,'Accepted'),(71,3,1,210.00,NULL,NULL,NULL,'Submitted'),(72,7,1,95.00,NULL,NULL,NULL,'Paid'),(73,21,1,245.00,NULL,NULL,NULL,'Accepted'),(74,16,1,40.00,NULL,NULL,NULL,'Paid'),(75,11,1,165.00,NULL,NULL,NULL,'Accepted'),(76,4,1,150.00,NULL,NULL,NULL,'Denied'),(77,8,1,140.00,NULL,NULL,NULL,'Paid'),(78,22,1,135.00,NULL,NULL,NULL,'Accepted'),(79,17,1,120.00,NULL,NULL,NULL,'Submitted'),(80,12,1,1250.00,NULL,NULL,NULL,'Paid'),(81,13,1,170.00,NULL,NULL,NULL,'Accepted'),(82,14,1,290.00,NULL,NULL,NULL,'Paid'),(83,15,1,410.00,NULL,NULL,NULL,'Accepted'),(84,23,1,25.00,NULL,NULL,NULL,'Submitted'),(85,24,1,180.00,NULL,NULL,NULL,'Paid'),(86,25,1,320.00,NULL,NULL,NULL,'Accepted'),(87,26,1,20.00,NULL,NULL,NULL,'Paid'),(88,27,1,175.00,NULL,NULL,NULL,'Accepted'),(89,28,1,165.00,NULL,NULL,NULL,'Denied'),(90,29,1,700.00,NULL,NULL,NULL,'Paid'),(91,30,1,140.00,NULL,NULL,NULL,'Accepted'),(92,1,1,180.00,NULL,NULL,NULL,'Submitted'),(93,5,1,120.00,NULL,NULL,NULL,'Paid'),(94,19,1,230.00,NULL,NULL,NULL,'Accepted'),(95,9,1,40.00,NULL,NULL,NULL,'Paid'),(96,2,1,650.00,NULL,NULL,NULL,'Accepted'),(97,6,1,380.00,NULL,NULL,NULL,'Paid'),(98,20,1,155.00,NULL,NULL,NULL,'Denied'),(99,18,1,135.00,NULL,NULL,NULL,'Accepted'),(100,10,1,150.00,NULL,NULL,NULL,'Paid');
/*!40000 ALTER TABLE `claim_insurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `claim_payment_summary_view`
--

DROP TABLE IF EXISTS `claim_payment_summary_view`;
/*!50001 DROP VIEW IF EXISTS `claim_payment_summary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `claim_payment_summary_view` AS SELECT 
 1 AS `claim_id`,
 1 AS `encounter_id`,
 1 AS `patient_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `claim_status`,
 1 AS `total_amount`,
 1 AS `total_paid`,
 1 AS `balance_due`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `claims`
--

DROP TABLE IF EXISTS `claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claims` (
  `claim_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `insurance_id` int DEFAULT NULL,
  `claim_status` enum('Draft','Submitted','In Review','Accepted','Denied','Partially Paid','Paid','Appealed','Closed') DEFAULT 'Submitted',
  `denial_code` varchar(50) DEFAULT NULL,
  `denial_reason` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `submitted_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `reviewed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`claim_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `insurance_id` (`insurance_id`),
  KEY `idx_claim_status` (`claim_status`),
  KEY `idx_claims_submitted_datetime` (`submitted_datetime`),
  CONSTRAINT `claims_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `claims_ibfk_2` FOREIGN KEY (`insurance_id`) REFERENCES `insurance_plans` (`insurance_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claims`
--

LOCK TABLES `claims` WRITE;
/*!40000 ALTER TABLE `claims` DISABLE KEYS */;
INSERT INTO `claims` VALUES (1,1,1,'Submitted',NULL,NULL,200.00,'2026-04-01 13:00:00',NULL),(2,2,5,'Accepted',NULL,NULL,180.00,'2026-04-01 13:30:00','2026-04-02 09:00:00'),(3,3,19,'Paid',NULL,NULL,950.00,'2026-04-01 14:00:00','2026-04-02 10:00:00'),(4,4,17,'Denied','D001','Missing prior authorization',180.00,'2026-04-01 14:30:00','2026-04-02 11:00:00'),(5,5,9,'Accepted',NULL,NULL,165.00,'2026-04-01 15:00:00','2026-04-02 12:00:00'),(6,6,2,'Submitted',NULL,NULL,425.00,'2026-04-01 15:30:00',NULL),(7,7,6,'Paid',NULL,NULL,4200.00,'2026-04-01 16:00:00','2026-04-02 13:00:00'),(8,8,20,'Accepted',NULL,NULL,850.00,'2026-04-01 16:30:00','2026-04-02 14:00:00'),(9,9,18,'Denied','D002','Coverage terminated',75.00,'2026-04-01 17:00:00','2026-04-02 15:00:00'),(10,10,10,'Submitted',NULL,NULL,380.00,'2026-04-01 17:30:00',NULL),(11,11,3,'Accepted',NULL,NULL,650.00,'2026-04-02 09:30:00','2026-04-03 09:00:00'),(12,12,7,'Paid',NULL,NULL,45.00,'2026-04-02 10:00:00','2026-04-03 10:00:00'),(13,13,21,'Accepted',NULL,NULL,420.00,'2026-04-02 10:30:00','2026-04-03 11:00:00'),(14,14,16,'Denied','D003','Invalid member ID',135.00,'2026-04-02 11:00:00','2026-04-03 12:00:00'),(15,15,11,'Paid',NULL,NULL,40.00,'2026-04-02 11:30:00','2026-04-03 13:00:00'),(16,16,4,'Submitted',NULL,NULL,55.00,'2026-04-02 12:00:00',NULL),(17,17,8,'Accepted',NULL,NULL,95.00,'2026-04-02 12:30:00','2026-04-03 14:00:00'),(18,18,22,'Paid',NULL,NULL,35.00,'2026-04-02 13:00:00','2026-04-03 15:00:00'),(19,19,17,'Accepted',NULL,NULL,150.00,'2026-04-02 13:30:00','2026-04-03 16:00:00'),(20,20,12,'Denied','D004','Service not covered',700.00,'2026-04-02 14:00:00','2026-04-04 09:00:00'),(21,21,13,'Submitted',NULL,NULL,140.00,'2026-04-02 14:30:00',NULL),(22,22,14,'Accepted',NULL,NULL,520.00,'2026-04-02 15:00:00','2026-04-04 10:00:00'),(23,23,15,'Paid',NULL,NULL,320.00,'2026-04-02 15:30:00','2026-04-04 11:00:00'),(24,24,23,'Denied','D005','Timely filing exceeded',3500.00,'2026-04-02 16:00:00','2026-04-04 12:00:00'),(25,25,24,'Accepted',NULL,NULL,160.00,'2026-04-03 10:00:00','2026-04-04 13:00:00'),(26,26,25,'Paid',NULL,NULL,155.00,'2026-04-03 10:30:00','2026-04-04 14:00:00'),(27,27,26,'Accepted',NULL,NULL,260.00,'2026-04-03 11:00:00','2026-04-04 15:00:00'),(28,28,27,'Submitted',NULL,NULL,780.00,'2026-04-03 11:30:00',NULL),(29,29,28,'Accepted',NULL,NULL,210.00,'2026-04-03 12:00:00','2026-04-04 16:00:00'),(30,30,29,'Paid',NULL,NULL,175.00,'2026-04-03 12:30:00','2026-04-05 09:00:00'),(31,31,30,'Accepted',NULL,NULL,460.00,'2026-04-03 13:00:00','2026-04-05 10:00:00'),(32,32,1,'Denied','D006','Duplicate claim',165.00,'2026-04-03 13:30:00','2026-04-05 11:00:00'),(33,33,5,'Paid',NULL,NULL,170.00,'2026-04-03 14:00:00','2026-04-05 12:00:00'),(34,34,19,'Accepted',NULL,NULL,760.00,'2026-04-03 14:30:00','2026-04-05 13:00:00'),(35,35,9,'Submitted',NULL,NULL,1450.00,'2026-04-03 15:00:00',NULL),(36,36,2,'Accepted',NULL,NULL,60.00,'2026-04-03 15:30:00','2026-04-05 14:00:00'),(37,37,6,'Paid',NULL,NULL,120.00,'2026-04-04 10:00:00','2026-04-05 15:00:00'),(38,38,20,'Accepted',NULL,NULL,20.00,'2026-04-04 10:30:00','2026-04-05 16:00:00'),(39,39,18,'Denied','D007','Non-covered preventive service',85.00,'2026-04-04 11:00:00','2026-04-06 09:00:00'),(40,40,10,'Paid',NULL,NULL,180.00,'2026-04-04 11:30:00','2026-04-06 10:00:00'),(41,41,3,'Accepted',NULL,NULL,310.00,'2026-04-04 12:00:00','2026-04-06 11:00:00'),(42,42,7,'Submitted',NULL,NULL,140.00,'2026-04-04 12:30:00',NULL),(43,43,21,'Paid',NULL,NULL,210.00,'2026-04-04 13:00:00','2026-04-06 12:00:00'),(44,44,16,'Accepted',NULL,NULL,80.00,'2026-04-04 13:30:00','2026-04-06 13:00:00'),(45,45,11,'Paid',NULL,NULL,245.00,'2026-04-04 14:00:00','2026-04-06 14:00:00'),(46,46,4,'Denied','D008','Authorization required',35.00,'2026-04-04 14:30:00','2026-04-06 15:00:00'),(47,47,8,'Accepted',NULL,NULL,165.00,'2026-04-04 15:00:00','2026-04-06 16:00:00'),(48,48,22,'Paid',NULL,NULL,340.00,'2026-04-04 15:30:00','2026-04-07 09:00:00'),(49,49,17,'Accepted',NULL,NULL,140.00,'2026-04-05 10:00:00','2026-04-07 10:00:00'),(50,50,12,'Submitted',NULL,NULL,180.00,'2026-04-05 10:30:00',NULL),(51,51,13,'Paid',NULL,NULL,75.00,'2026-04-05 11:00:00','2026-04-07 11:00:00'),(52,52,14,'Accepted',NULL,NULL,1250.00,'2026-04-05 11:30:00','2026-04-07 12:00:00'),(53,53,15,'Paid',NULL,NULL,170.00,'2026-04-05 12:00:00','2026-04-07 13:00:00'),(54,54,23,'Accepted',NULL,NULL,290.00,'2026-04-05 12:30:00','2026-04-07 14:00:00'),(55,55,24,'Denied','D009','Experimental/investigational service',410.00,'2026-04-05 13:00:00','2026-04-07 15:00:00'),(56,56,25,'Paid',NULL,NULL,25.00,'2026-04-05 13:30:00','2026-04-07 16:00:00'),(57,57,26,'Accepted',NULL,NULL,135.00,'2026-04-05 14:00:00','2026-04-08 09:00:00'),(58,58,27,'Paid',NULL,NULL,120.00,'2026-04-05 14:30:00','2026-04-08 10:00:00'),(59,59,28,'Accepted',NULL,NULL,35.00,'2026-04-05 15:00:00','2026-04-08 11:00:00'),(60,60,29,'Submitted',NULL,NULL,35.00,'2026-04-05 15:30:00',NULL),(61,61,30,'Paid',NULL,NULL,650.00,'2026-04-06 10:00:00','2026-04-08 12:00:00'),(62,62,1,'Accepted',NULL,NULL,700.00,'2026-04-06 10:30:00','2026-04-08 13:00:00'),(63,63,5,'Submitted',NULL,NULL,140.00,'2026-04-06 11:00:00',NULL),(64,64,19,'Paid',NULL,NULL,180.00,'2026-04-06 11:30:00','2026-04-08 14:00:00'),(65,65,9,'Accepted',NULL,NULL,320.00,'2026-04-06 12:00:00','2026-04-08 15:00:00'),(66,66,2,'Denied','D010','Patient not eligible on date of service',20.00,'2026-04-06 12:30:00','2026-04-08 16:00:00'),(67,67,6,'Paid',NULL,NULL,175.00,'2026-04-06 13:00:00','2026-04-09 09:00:00'),(68,68,20,'Accepted',NULL,NULL,150.00,'2026-04-06 13:30:00','2026-04-09 10:00:00'),(69,69,18,'Paid',NULL,NULL,420.00,'2026-04-06 14:00:00','2026-04-09 11:00:00'),(70,70,10,'Accepted',NULL,NULL,25.00,'2026-04-06 14:30:00','2026-04-09 12:00:00'),(71,71,3,'Submitted',NULL,NULL,210.00,'2026-04-06 15:00:00',NULL),(72,72,7,'Paid',NULL,NULL,95.00,'2026-04-06 15:30:00','2026-04-09 13:00:00'),(73,73,21,'Accepted',NULL,NULL,245.00,'2026-04-07 10:00:00','2026-04-09 14:00:00'),(74,74,16,'Paid',NULL,NULL,40.00,'2026-04-07 10:30:00','2026-04-09 15:00:00'),(75,75,11,'Accepted',NULL,NULL,165.00,'2026-04-07 11:00:00','2026-04-09 16:00:00'),(76,76,4,'Denied','D011','Documentation insufficient',150.00,'2026-04-07 11:30:00','2026-04-10 09:00:00'),(77,77,8,'Paid',NULL,NULL,140.00,'2026-04-07 12:00:00','2026-04-10 10:00:00'),(78,78,22,'Accepted',NULL,NULL,135.00,'2026-04-07 12:30:00','2026-04-10 11:00:00'),(79,79,17,'Submitted',NULL,NULL,120.00,'2026-04-07 13:00:00',NULL),(80,80,12,'Paid',NULL,NULL,1250.00,'2026-04-07 13:30:00','2026-04-10 12:00:00'),(81,81,13,'Accepted',NULL,NULL,170.00,'2026-04-07 14:00:00','2026-04-10 13:00:00'),(82,82,14,'Paid',NULL,NULL,290.00,'2026-04-07 14:30:00','2026-04-10 14:00:00'),(83,83,15,'Accepted',NULL,NULL,410.00,'2026-04-07 15:00:00','2026-04-10 15:00:00'),(84,84,23,'Submitted',NULL,NULL,25.00,'2026-04-07 15:30:00',NULL),(85,85,24,'Paid',NULL,NULL,180.00,'2026-04-08 10:00:00','2026-04-10 16:00:00'),(86,86,25,'Accepted',NULL,NULL,320.00,'2026-04-08 10:30:00','2026-04-11 09:00:00'),(87,87,26,'Paid',NULL,NULL,20.00,'2026-04-08 11:00:00','2026-04-11 10:00:00'),(88,88,27,'Accepted',NULL,NULL,175.00,'2026-04-08 11:30:00','2026-04-11 11:00:00'),(89,89,28,'Denied','D012','Coordination of benefits issue',165.00,'2026-04-08 12:00:00','2026-04-11 12:00:00'),(90,90,29,'Paid',NULL,NULL,700.00,'2026-04-08 12:30:00','2026-04-11 13:00:00'),(91,91,30,'Accepted',NULL,NULL,140.00,'2026-04-08 13:00:00','2026-04-11 14:00:00'),(92,92,1,'Submitted',NULL,NULL,180.00,'2026-04-08 13:30:00',NULL),(93,93,5,'Paid',NULL,NULL,120.00,'2026-04-08 14:00:00','2026-04-11 15:00:00'),(94,94,19,'Accepted',NULL,NULL,230.00,'2026-04-08 14:30:00','2026-04-11 16:00:00'),(95,95,9,'Paid',NULL,NULL,40.00,'2026-04-08 15:00:00','2026-04-12 09:00:00'),(96,96,2,'Accepted',NULL,NULL,650.00,'2026-04-08 15:30:00','2026-04-12 10:00:00'),(97,97,6,'Paid',NULL,NULL,380.00,'2026-04-09 10:00:00','2026-04-12 11:00:00'),(98,98,20,'Denied','D013','Invalid diagnosis pointer',155.00,'2026-04-09 10:30:00','2026-04-12 12:00:00'),(99,99,18,'Accepted',NULL,NULL,135.00,'2026-04-09 11:00:00','2026-04-12 13:00:00'),(100,100,10,'Paid',NULL,NULL,150.00,'2026-04-09 11:30:00','2026-04-12 14:00:00');
/*!40000 ALTER TABLE `claims` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `claim_audit_trigger` AFTER INSERT ON `claims` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        event_time,
        actor_user_id,
        action_type,
        entity_name,
        entity_pk,
        changed_columns,
        old_values_json,
        new_values_json,
        status
    )
    VALUES (
        NOW(),
        NULL,
        'INSERT',
        'claims',
        NEW.claim_id,
        'claim_status,total_amount,insurance_id',
        NULL,
        JSON_OBJECT(
            'claim_status', NEW.claim_status,
            'total_amount', NEW.total_amount,
            'insurance_id', NEW.insurance_id
        ),
        'SUCCESS'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clinical_note_amendments`
--

DROP TABLE IF EXISTS `clinical_note_amendments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_note_amendments` (
  `amendment_id` int NOT NULL AUTO_INCREMENT,
  `note_id` int NOT NULL,
  `amended_by_provider_id` int NOT NULL,
  `amended_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` varchar(255) NOT NULL,
  `previous_text` text NOT NULL,
  `new_text` text NOT NULL,
  PRIMARY KEY (`amendment_id`),
  KEY `idx_cna_note_id` (`note_id`),
  KEY `idx_cna_provider_id` (`amended_by_provider_id`),
  CONSTRAINT `fk_cna_note` FOREIGN KEY (`note_id`) REFERENCES `clinical_notes` (`note_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cna_provider` FOREIGN KEY (`amended_by_provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_note_amendments`
--

LOCK TABLES `clinical_note_amendments` WRITE;
/*!40000 ALTER TABLE `clinical_note_amendments` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinical_note_amendments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_notes`
--

DROP TABLE IF EXISTS `clinical_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_notes` (
  `note_id` int NOT NULL AUTO_INCREMENT,
  `provider_id` int NOT NULL,
  `encounter_id` int NOT NULL,
  `note_type_id` int NOT NULL,
  `note_title` varchar(150) DEFAULT NULL,
  `note_text` text NOT NULL,
  `note_status` enum('Draft','Signed','Final') DEFAULT 'Draft',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `signed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `provider_id` (`provider_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `note_type_id` (`note_type_id`),
  CONSTRAINT `clinical_notes_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clinical_notes_ibfk_2` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clinical_notes_ibfk_3` FOREIGN KEY (`note_type_id`) REFERENCES `note_types` (`note_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_notes`
--

LOCK TABLES `clinical_notes` WRITE;
/*!40000 ALTER TABLE `clinical_notes` DISABLE KEYS */;
INSERT INTO `clinical_notes` VALUES (1,1,1,2,'ER Assessment','Patient presented with fever and cough. Evaluated in the emergency department and treated supportively. Symptoms improved before discharge.','Final','2026-04-01 09:30:00','2026-04-01 09:45:00'),(2,2,2,4,'Cardiology Progress Note','Chest discomfort improved during visit. Cardiac status stable and outpatient follow-up recommended.','Final','2026-04-01 10:45:00','2026-04-01 11:00:00'),(3,3,3,3,'Oncology Admission Note','Patient admitted for fatigue and oncology-related workup. Initial labs and imaging were ordered on admission.','Final','2026-04-01 11:30:00','2026-04-01 11:45:00'),(4,4,4,4,'Neurology Progress Note','Headache and dizziness reviewed. Neurologic exam stable and outpatient management continued.','Final','2026-04-01 12:00:00','2026-04-01 12:15:00'),(5,5,5,4,'Orthopedic Progress Note','Patient evaluated for knee pain. Range of motion limited but stable, and imaging was recommended.','Final','2026-04-01 12:30:00','2026-04-01 12:45:00'),(6,6,6,2,'ER Respiratory Note','Patient presented with shortness of breath. Oxygen support provided and respiratory status improved before discharge.','Final','2026-04-01 13:00:00','2026-04-01 13:15:00'),(7,7,7,2,'ER Cardiac Note','Patient evaluated for acute chest pain. Cardiac monitoring and urgent intervention were initiated.','Final','2026-04-01 13:30:00','2026-04-01 13:45:00'),(8,8,8,4,'GI Progress Note','Abdominal pain assessed and symptoms were controlled with medication. Return precautions reviewed.','Final','2026-04-01 14:00:00','2026-04-01 14:15:00'),(9,9,9,7,'Follow-Up Note','Routine follow-up completed without acute complaints. Current management plan remains appropriate.','Final','2026-04-01 14:30:00','2026-04-01 14:45:00'),(10,10,10,4,'General Progress Note','Patient reported dizziness but remained stable during the encounter. Hydration and monitoring were advised.','Final','2026-04-01 15:00:00','2026-04-01 15:15:00'),(11,11,11,4,'Back Pain Progress Note','Patient continues to report chronic back pain. Conservative management and outpatient follow-up were discussed.','Final','2026-04-01 15:30:00','2026-04-01 15:45:00'),(12,12,12,4,'Diabetes Progress Note','Diabetes reviewed during encounter. Patient counseled on medication adherence and follow-up testing.','Final','2026-04-01 16:00:00','2026-04-01 16:15:00'),(13,13,13,2,'ER Neuro Note','Patient with seizure history evaluated in the emergency setting. No active seizure observed during visit.','Final','2026-04-02 09:00:00','2026-04-02 09:15:00'),(14,14,14,7,'Follow-Up Examination','Routine follow-up completed. No new neurologic complaints were reported today.','Final','2026-04-02 09:30:00','2026-04-02 09:45:00'),(15,15,15,4,'Fever Progress Note','Patient seen for persistent fever. Supportive treatment started and infectious precautions reviewed.','Final','2026-04-02 10:00:00','2026-04-02 10:15:00'),(16,1,16,4,'Hypertension Progress Note','Blood pressure reviewed during visit. Readings improved with current therapy and no medication changes made.','Final','2026-04-02 10:30:00','2026-04-02 10:45:00'),(17,2,17,4,'Cardiology Rhythm Note','Irregular rhythm noted and reviewed with patient. Additional cardiac evaluation planned.','Final','2026-04-02 11:00:00','2026-04-02 11:15:00'),(18,3,18,3,'Admission Note','Patient admitted for weakness and further inpatient evaluation. Initial treatment plan was discussed with the care team.','Final','2026-04-02 11:30:00','2026-04-02 11:45:00'),(19,4,19,4,'Joint Pain Progress Note','Joint pain evaluated with reduced mobility on exam. Outpatient rehabilitation was recommended.','Final','2026-04-02 12:00:00','2026-04-02 12:15:00'),(20,5,20,4,'Migraine Progress Note','Migraine symptoms improved after treatment. Patient instructed on trigger avoidance and follow-up.','Final','2026-04-02 12:30:00','2026-04-02 12:45:00'),(21,6,21,11,'Critical Care Note','Patient required close respiratory monitoring due to severe breathing difficulty. Critical care support was provided.','Final','2026-04-02 13:00:00','2026-04-02 13:15:00'),(22,7,22,4,'Abdominal Pain Note','Patient evaluated for abdominal cramping. Symptoms improved and imaging/lab results were reviewed.','Final','2026-04-02 13:30:00','2026-04-02 13:45:00'),(23,8,23,7,'Follow-Up Cardiology Note','Cardiac follow-up completed. No active chest pain reported at this encounter.','Final','2026-04-02 14:00:00','2026-04-02 14:15:00'),(24,9,24,4,'Oncology Progress Note','Oncology follow-up completed with discussion of current symptoms and treatment response.','Final','2026-04-02 14:30:00','2026-04-02 14:45:00'),(25,10,25,7,'Pediatric Preventive Note','Preventive pediatric visit completed. Growth, development, and anticipatory guidance reviewed.','Final','2026-04-03 09:00:00','2026-04-03 09:15:00'),(26,11,26,4,'Shoulder Pain Note','Patient seen for shoulder pain. Imaging ordered and pain management plan discussed.','Final','2026-04-03 09:30:00','2026-04-03 09:45:00'),(27,12,27,10,'Consult Note','Neurology-related cognitive concerns reviewed. Further outpatient testing recommended.','Final','2026-04-03 10:00:00','2026-04-03 10:15:00'),(28,13,28,2,'ER Headache Note','Patient presented with severe headache requiring urgent evaluation. Imaging reviewed during encounter.','Final','2026-04-03 10:30:00','2026-04-03 10:45:00'),(29,14,29,7,'Emergency Follow-Up Note','Post-emergency visit follow-up completed. Patient recovering appropriately.','Final','2026-04-03 11:00:00','2026-04-03 11:15:00'),(30,15,30,4,'Chest Pain Progress Note','Chest discomfort reviewed during follow-up encounter. No worsening symptoms reported.','Final','2026-04-03 11:30:00','2026-04-03 11:45:00'),(31,1,31,3,'Oncology Admission Note','Patient admitted for ongoing cancer-related evaluation and management. Multidisciplinary plan initiated.','Final','2026-04-03 12:00:00','2026-04-03 12:15:00'),(32,2,32,7,'Pediatric Follow-Up Note','Child seen for routine follow-up. Clinical status stable and no acute issues identified.','Final','2026-04-03 12:30:00','2026-04-03 12:45:00'),(33,3,33,4,'Hip Pain Progress Note','Hip pain discussed and imaging findings reviewed. Conservative treatment recommended.','Final','2026-04-03 13:00:00','2026-04-03 13:15:00'),(34,4,34,4,'Migraine Follow-Up Note','Migraine symptoms reassessed. Patient reported partial improvement with current regimen.','Final','2026-04-03 13:30:00','2026-04-03 13:45:00'),(35,5,35,11,'Critical Care Respiratory Note','Patient monitored for respiratory compromise. ICU-level observation continued due to clinical severity.','Final','2026-04-03 14:00:00','2026-04-03 14:15:00'),(36,6,36,4,'Gastritis Progress Note','Abdominal symptoms improved with treatment. Diet recommendations and return precautions reviewed.','Final','2026-04-03 14:30:00','2026-04-03 14:45:00'),(37,7,37,4,'Cardiology Progress Note','Angina symptoms reviewed and risk factors discussed. Follow-up cardiac care planned.','Final','2026-04-04 09:00:00','2026-04-04 09:15:00'),(38,8,38,4,'Oncology Monitoring Note','Cancer-related concerns reviewed during ongoing treatment monitoring. Labs pending review.','Final','2026-04-04 09:30:00','2026-04-04 09:45:00'),(39,9,39,7,'Immunization Follow-Up Note','Vaccination encounter completed successfully. Patient tolerated visit without complications.','Final','2026-04-04 10:00:00','2026-04-04 10:15:00'),(40,10,40,4,'Orthopedic Progress Note','Knee discomfort reviewed. Mobility status stable and follow-up advised.','Final','2026-04-04 10:30:00','2026-04-04 10:45:00'),(41,11,41,4,'Neuropathy Progress Note','Neuropathy symptoms reviewed. Sensory complaints persist but are stable.','Final','2026-04-04 11:00:00','2026-04-04 11:15:00'),(42,12,42,11,'Critical Respiratory Note','Severe respiratory symptoms required close monitoring and urgent intervention.','Final','2026-04-04 11:30:00','2026-04-04 11:45:00'),(43,13,43,7,'Routine Exam Note','Routine adult evaluation completed. No acute findings today.','Final','2026-04-04 12:00:00','2026-04-04 12:15:00'),(44,14,44,4,'Arrhythmia Progress Note','Arrhythmia discussed with patient and rhythm monitoring reviewed.','Final','2026-04-04 12:30:00','2026-04-04 12:45:00'),(45,15,45,4,'Breast Oncology Note','Breast cancer follow-up completed. Ongoing treatment plan reviewed with patient.','Final','2026-04-04 13:00:00','2026-04-04 13:15:00'),(46,1,46,4,'Cough Progress Note','Patient evaluated for cough. Infectious symptoms reviewed and supportive treatment recommended.','Final','2026-04-04 13:30:00','2026-04-04 13:45:00'),(47,2,47,4,'Back Pain Follow-Up Note','Back pain remains present but manageable. Outpatient care plan continued.','Final','2026-04-04 14:00:00','2026-04-04 14:15:00'),(48,3,48,2,'ER Headache Note','Patient evaluated for acute headache in emergency setting. Symptoms improved after treatment.','Final','2026-04-04 14:30:00','2026-04-04 14:45:00'),(49,4,49,11,'Critical Respiratory Progress','Patient remained under close observation for respiratory instability. Oxygen requirement reviewed.','Final','2026-04-05 09:00:00','2026-04-05 09:15:00'),(50,5,50,7,'Follow-Up Note','Routine follow-up completed after prior acute visit. Recovery is progressing well.','Final','2026-04-05 09:30:00','2026-04-05 09:45:00'),(51,6,51,4,'Hypertension Progress Note','Blood pressure remains elevated but improved. Medication adherence reinforced.','Final','2026-04-05 10:00:00','2026-04-05 10:15:00'),(52,7,52,4,'Oncology Progress Note','Cancer treatment follow-up completed. Current symptoms and tolerance reviewed.','Final','2026-04-05 10:30:00','2026-04-05 10:45:00'),(53,8,53,7,'Pediatric Routine Note','Routine child visit completed without acute concerns.','Final','2026-04-05 11:00:00','2026-04-05 11:15:00'),(54,9,54,4,'Joint Injection Follow-Up','Joint pain and mobility were reviewed following treatment.','Final','2026-04-05 11:30:00','2026-04-05 11:45:00'),(55,10,55,4,'Neuropathy Progress Note','Neurologic symptoms reviewed with patient. Stable overall since last visit.','Final','2026-04-05 12:00:00','2026-04-05 12:15:00'),(56,11,56,11,'Critical Respiratory Note','Patient required respiratory monitoring and escalation of care.','Final','2026-04-05 12:30:00','2026-04-05 12:45:00'),(57,12,57,7,'Routine Follow-Up Note','Routine outpatient follow-up completed. No new complaints noted.','Final','2026-04-05 13:00:00','2026-04-05 13:15:00'),(58,13,58,4,'Cardiology Progress Note','Cardiac symptoms discussed and EKG reviewed during encounter.','Final','2026-04-05 13:30:00','2026-04-05 13:45:00'),(59,14,59,4,'Oncology Monitoring Note','Ongoing cancer monitoring completed. Lab findings and symptoms discussed.','Final','2026-04-05 14:00:00','2026-04-05 14:15:00'),(60,15,60,4,'Respiratory Follow-Up Note','Patient seen for cough-related follow-up. Symptoms improving overall.','Final','2026-04-05 14:30:00','2026-04-05 14:45:00'),(61,1,61,4,'Back Pain Progress Note','Low back pain reassessed. Conservative management remains appropriate.','Final','2026-04-06 09:00:00','2026-04-06 09:15:00'),(62,2,62,4,'Headache Progress Note','Tension headache reviewed. Patient reported partial relief with therapy.','Final','2026-04-06 09:30:00','2026-04-06 09:45:00'),(63,3,63,11,'Critical Respiratory Note','Patient monitored closely for worsening respiratory status.','Final','2026-04-06 10:00:00','2026-04-06 10:15:00'),(64,4,64,7,'Routine Exam Note','General health follow-up completed with no acute issues.','Final','2026-04-06 10:30:00','2026-04-06 10:45:00'),(65,5,65,4,'Angina Progress Note','Patient’s angina symptoms reviewed. No active chest pain during visit.','Final','2026-04-06 11:00:00','2026-04-06 11:15:00'),(66,6,66,4,'Oncology Progress Note','Cancer treatment course reviewed. Symptoms and tolerance discussed with patient.','Final','2026-04-06 11:30:00','2026-04-06 11:45:00'),(67,7,67,7,'Pediatric Preventive Note','Child seen for preventive care. Development and health maintenance reviewed.','Final','2026-04-06 12:00:00','2026-04-06 12:15:00'),(68,8,68,4,'Orthopedic Progress Note','Knee symptoms reviewed and mobility assessed.','Final','2026-04-06 12:30:00','2026-04-06 12:45:00'),(69,9,69,4,'Neuropathy Follow-Up','Persistent neuropathic complaints reviewed. Stable overall.','Final','2026-04-06 13:00:00','2026-04-06 13:15:00'),(70,10,70,11,'Critical Respiratory Progress','Patient remained under respiratory monitoring due to severity of symptoms.','Final','2026-04-06 13:30:00','2026-04-06 13:45:00'),(71,11,71,7,'Routine Follow-Up Note','Routine follow-up completed and current treatment plan continued.','Final','2026-04-06 14:00:00','2026-04-06 14:15:00'),(72,12,72,4,'Arrhythmia Note','Arrhythmia monitoring reviewed with patient. No acute deterioration noted.','Final','2026-04-06 14:30:00','2026-04-06 14:45:00'),(73,13,73,4,'Breast Oncology Note','Cancer-related progress reviewed during scheduled follow-up.','Final','2026-04-07 09:00:00','2026-04-07 09:15:00'),(74,14,74,4,'Respiratory Progress Note','Patient evaluated for ongoing cough. Symptoms improving with treatment.','Final','2026-04-07 09:30:00','2026-04-07 09:45:00'),(75,15,75,4,'Back Pain Progress Note','Low back pain persists but is controlled. Home care instructions reinforced.','Final','2026-04-07 10:00:00','2026-04-07 10:15:00'),(76,1,76,2,'ER Pneumonia Note','Patient treated for pneumonia-related symptoms in emergency setting.','Final','2026-04-07 10:30:00','2026-04-07 10:45:00'),(77,2,77,11,'Critical Respiratory Note','Patient evaluated for respiratory failure and required close monitoring.','Final','2026-04-07 11:00:00','2026-04-07 11:15:00'),(78,3,78,7,'Follow-Up Note','Post-acute follow-up completed with stable findings.','Final','2026-04-07 11:30:00','2026-04-07 11:45:00'),(79,4,79,4,'Chest Pain Progress Note','Chest pain reviewed and currently stable. Emergency return precautions were discussed.','Final','2026-04-07 12:00:00','2026-04-07 12:15:00'),(80,5,80,4,'Oncology Progress Note','Cancer care follow-up completed. Current treatment plan continued.','Final','2026-04-07 12:30:00','2026-04-07 12:45:00'),(81,6,81,7,'Pediatric Follow-Up Note','Routine pediatric visit completed successfully.','Final','2026-04-07 13:00:00','2026-04-07 13:15:00'),(82,7,82,4,'Orthopedic Progress Note','Joint symptoms reviewed. Physical exam remains stable.','Final','2026-04-07 13:30:00','2026-04-07 13:45:00'),(83,8,83,4,'Neuropathy Progress Note','Patient continues to have neuropathic symptoms without new deficits.','Final','2026-04-07 14:00:00','2026-04-07 14:15:00'),(84,9,84,11,'Critical Respiratory Note','Severe respiratory symptoms required extended observation.','Final','2026-04-07 14:30:00','2026-04-07 14:45:00'),(85,10,85,7,'Routine Follow-Up Note','Routine outpatient review completed with stable exam findings.','Final','2026-04-08 09:00:00','2026-04-08 09:15:00'),(86,11,86,4,'Cardiology Progress Note','Angina and blood pressure reviewed. Patient remains hemodynamically stable.','Final','2026-04-08 09:30:00','2026-04-08 09:45:00'),(87,12,87,4,'Oncology Progress Note','Cancer-related symptoms reviewed and supportive management continued.','Final','2026-04-08 10:00:00','2026-04-08 10:15:00'),(88,13,88,7,'Pediatric Preventive Note','Preventive pediatric care completed with counseling provided.','Final','2026-04-08 10:30:00','2026-04-08 10:45:00'),(89,14,89,4,'Orthopedic Note','Knee pain reviewed during follow-up. Imaging and therapy recommendations discussed.','Final','2026-04-08 11:00:00','2026-04-08 11:15:00'),(90,15,90,4,'Headache Progress Note','Headache symptoms reassessed and outpatient plan continued.','Final','2026-04-08 11:30:00','2026-04-08 11:45:00'),(91,1,91,11,'Critical Respiratory Note','Patient stabilized after respiratory treatment and monitoring.','Final','2026-04-08 12:00:00','2026-04-08 12:15:00'),(92,2,92,7,'Routine Follow-Up Note','Routine follow-up completed with no acute complaints.','Final','2026-04-08 12:30:00','2026-04-08 12:45:00'),(93,3,93,4,'Cardiology Progress Note','Arrhythmia reviewed and patient remained stable throughout encounter.','Final','2026-04-08 13:00:00','2026-04-08 13:15:00'),(94,4,94,4,'Oncology Progress Note','Oncology visit completed with continued treatment discussion.','Final','2026-04-08 13:30:00','2026-04-08 13:45:00'),(95,5,95,4,'Respiratory Progress Note','Cough symptoms addressed and supportive therapy continued.','Final','2026-04-08 14:00:00','2026-04-08 14:15:00'),(96,6,96,4,'Back Pain Progress Note','Back pain improving but persistent. Continue current management and follow-up.','Final','2026-04-08 14:30:00','2026-04-08 14:45:00'),(97,7,97,4,'Neurology Progress Note','Headache symptoms stable at follow-up. No focal deficits reported.','Final','2026-04-09 09:00:00','2026-04-09 09:15:00'),(98,8,98,3,'Admission Respiratory Note','Patient admitted for respiratory management and observation.','Final','2026-04-09 09:30:00','2026-04-09 09:45:00'),(99,9,99,7,'Post-ER Follow-Up Note','Patient seen after prior acute visit and is recovering appropriately.','Final','2026-04-09 10:00:00','2026-04-09 10:15:00'),(100,10,100,4,'Cardiology Progress Note','Chest pain reviewed at follow-up and patient remained clinically stable.','Final','2026-04-09 10:30:00','2026-04-09 10:45:00');
/*!40000 ALTER TABLE `clinical_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deductions`
--

DROP TABLE IF EXISTS `deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deductions` (
  `deduction_id` int NOT NULL AUTO_INCREMENT,
  `deduction_name` varchar(100) NOT NULL,
  `deduction_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deduction_id`),
  UNIQUE KEY `deduction_name` (`deduction_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deductions`
--

LOCK TABLES `deductions` WRITE;
/*!40000 ALTER TABLE `deductions` DISABLE KEYS */;
INSERT INTO `deductions` VALUES (1,'Federal Tax','Federal payroll tax deduction'),(2,'State Tax','State payroll tax deduction'),(3,'Local Tax','Local or municipal payroll tax deduction'),(4,'Social Security','Employee social security contribution'),(5,'Medicare','Employee Medicare contribution'),(6,'Health Insurance','Employee health insurance contribution'),(7,'Dental Insurance','Employee dental insurance contribution'),(8,'Vision Insurance','Employee vision insurance contribution'),(9,'Life Insurance','Employee life insurance contribution'),(10,'Retirement 401k','Employee 401(k) retirement contribution'),(11,'Pension Contribution','Employee pension plan contribution'),(12,'Union Dues','Union membership deduction'),(13,'Parking Fee','Employee parking deduction'),(14,'Loan Repayment','Payroll deduction for employee loan repayment'),(15,'Wage Garnishment','Court-ordered wage garnishment'),(16,'Child Support','Payroll deduction for child support'),(17,'Charitable Contribution','Voluntary charitable donation deduction'),(18,'Uniform Deduction','Deduction for uniforms or replacements'),(19,'Cafeteria Plan','Pre-tax cafeteria/benefits plan deduction'),(20,'Flexible Spending Account','FSA payroll deduction');
/*!40000 ALTER TABLE `deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) NOT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Anesthesiology'),(12,'Behavioral Health'),(33,'Blood Bank'),(25,'Case Management'),(41,'Clinical Trials'),(29,'CT Scan'),(2,'Dermatology'),(27,'Dietary and Nutrition '),(4,'Endocrinology'),(3,'Gastroenterology'),(17,'General Surgery'),(38,'Health Information Management'),(10,'Hematology'),(42,'Infection Control'),(8,'Infectious Diseases'),(24,'Inpatient Services'),(36,'IT Services'),(37,'Medical Records'),(30,'MRI'),(5,'Nephrology'),(20,'Neurosurgery'),(15,'Occupational Therapy'),(23,'Outpatient Clinic'),(32,'Pathology'),(14,'Physical Therapy'),(18,'Plastic Surgery'),(11,'Psychiatry'),(7,'Pulmonology'),(34,'Quality Assurance'),(13,'Rehabilitation'),(40,'Research'),(28,'Respiratory Therapy'),(9,'Rheumatology'),(35,'Risk Management'),(26,'Social Services'),(16,'Speech Therapy'),(39,'Telemedicine'),(21,'Trauma'),(31,'Ultrasound'),(22,'Urgent Care'),(6,'Urology'),(19,'Vascular Surgery');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnoses`
--

DROP TABLE IF EXISTS `diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnoses` (
  `diagnosis_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `icd10_code` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `diagnosis_type` enum('Admitting','Working','Final','Discharge') NOT NULL DEFAULT 'Working',
  `diagnosed_by_provider_id` int DEFAULT NULL,
  `diagnosed_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`diagnosis_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `idx_diagnoses_provider` (`diagnosed_by_provider_id`),
  KEY `idx_diagnoses_icd10` (`icd10_code`),
  KEY `idx_diagnoses_diagnosed_datetime` (`diagnosed_datetime`),
  CONSTRAINT `diagnoses_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_diagnoses_icd10` FOREIGN KEY (`icd10_code`) REFERENCES `icd10_codes` (`icd10_code`) ON UPDATE CASCADE,
  CONSTRAINT `fk_diagnoses_provider` FOREIGN KEY (`diagnosed_by_provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnoses`
--

LOCK TABLES `diagnoses` WRITE;
/*!40000 ALTER TABLE `diagnoses` DISABLE KEYS */;
INSERT INTO `diagnoses` VALUES (1,1,'J10.1','Influenza with respiratory manifestations','Working',1,'2026-04-01 10:00:00'),(2,2,'I20.9','Angina pectoris, unspecified','Working',2,'2026-04-01 10:45:00'),(3,3,'C80.1','Malignant neoplasm, unspecified','Working',3,'2026-04-01 11:30:00'),(4,4,'G43.909','Migraine, unspecified','Working',4,'2026-04-01 11:45:00'),(5,5,'M25.561','Pain in right knee','Working',5,'2026-04-01 12:15:00'),(6,6,'J18.9','Pneumonia, unspecified organism','Working',6,'2026-04-01 12:45:00'),(7,7,'I21.3','ST elevation myocardial infarction','Working',7,'2026-04-01 13:15:00'),(8,8,'K21.9','Gastro-esophageal reflux disease','Working',8,'2026-04-01 13:45:00'),(9,9,'Z00.00','General adult exam','Working',9,'2026-04-01 14:15:00'),(10,10,'R42','Dizziness and giddiness','Working',10,'2026-04-01 14:45:00'),(11,11,'M54.5','Low back pain','Working',11,'2026-04-01 15:15:00'),(12,12,'E11.9','Type 2 diabetes mellitus','Working',12,'2026-04-01 15:45:00'),(13,13,'G40.909','Epilepsy, unspecified','Working',13,'2026-04-02 09:15:00'),(14,14,'Z09','Follow-up examination','Working',14,'2026-04-02 09:45:00'),(15,15,'R50.9','Fever, unspecified','Working',15,'2026-04-02 10:15:00'),(16,16,'I10','Essential hypertension','Working',1,'2026-04-02 10:45:00'),(17,17,'I49.9','Cardiac arrhythmia','Working',2,'2026-04-02 11:15:00'),(18,18,'R53.1','Weakness','Working',3,'2026-04-02 11:45:00'),(19,19,'M25.569','Joint pain','Working',4,'2026-04-02 12:15:00'),(20,20,'G43.109','Migraine with aura','Working',5,'2026-04-02 12:45:00'),(21,21,'J96.00','Acute respiratory failure','Working',6,'2026-04-02 13:15:00'),(22,22,'K52.9','Gastroenteritis','Working',7,'2026-04-02 13:45:00'),(23,23,'I25.10','Atherosclerotic heart disease','Working',8,'2026-04-02 14:15:00'),(24,24,'C50.919','Breast cancer','Working',9,'2026-04-02 14:45:00'),(25,25,'Z00.129','Child health exam','Working',10,'2026-04-03 09:15:00'),(26,26,'M75.101','Shoulder lesion','Working',11,'2026-04-03 09:45:00'),(27,27,'G31.84','Mild cognitive impairment','Working',12,'2026-04-03 10:15:00'),(28,28,'G44.1','Vascular headache','Working',13,'2026-04-03 10:45:00'),(29,29,'Z09','ER follow-up','Working',14,'2026-04-03 11:15:00'),(30,30,'R07.9','Chest pain','Working',15,'2026-04-03 11:45:00'),(31,31,'C34.90','Lung cancer','Working',1,'2026-04-03 12:15:00'),(32,32,'Z00.121','Routine pediatric exam','Working',2,'2026-04-03 12:45:00'),(33,33,'M16.9','Hip osteoarthritis','Working',3,'2026-04-03 13:15:00'),(34,34,'G43.909','Migraine','Working',4,'2026-04-03 13:45:00'),(35,35,'J96.90','Respiratory failure','Working',5,'2026-04-03 14:15:00'),(36,36,'K29.70','Gastritis','Working',6,'2026-04-03 14:45:00'),(37,37,'I20.9','Angina','Working',7,'2026-04-04 09:15:00'),(38,38,'C80.1','Cancer unspecified','Working',8,'2026-04-04 09:45:00'),(39,39,'Z23','Immunization encounter','Working',9,'2026-04-04 10:15:00'),(40,40,'M25.561','Knee pain','Working',10,'2026-04-04 10:45:00'),(41,41,'G62.9','Neuropathy','Working',11,'2026-04-04 11:15:00'),(42,42,'J96.00','Respiratory failure','Working',12,'2026-04-04 11:45:00'),(43,43,'Z00.00','Routine exam','Working',13,'2026-04-04 12:15:00'),(44,44,'I49.9','Arrhythmia','Working',14,'2026-04-04 12:45:00'),(45,45,'C50.919','Breast cancer','Working',15,'2026-04-04 13:15:00'),(46,46,'R05','Cough','Working',1,'2026-04-04 13:45:00'),(47,47,'M54.5','Back pain','Working',2,'2026-04-04 14:15:00'),(48,48,'G44.209','Tension headache','Working',3,'2026-04-04 14:45:00'),(49,49,'J96.90','Respiratory failure','Working',4,'2026-04-05 09:15:00'),(50,50,'Z09','Follow-up','Working',5,'2026-04-05 09:45:00'),(51,51,'I10','Hypertension','Working',6,'2026-04-05 10:15:00'),(52,52,'C80.1','Cancer unspecified','Working',7,'2026-04-05 10:45:00'),(53,53,'Z00.129','Child exam','Working',8,'2026-04-05 11:15:00'),(54,54,'M25.561','Knee pain','Working',9,'2026-04-05 11:45:00'),(55,55,'G62.9','Neuropathy','Working',10,'2026-04-05 12:15:00'),(56,56,'J96.00','Respiratory failure','Working',11,'2026-04-05 12:45:00'),(57,57,'Z00.00','Routine exam','Working',12,'2026-04-05 13:15:00'),(58,58,'I49.9','Arrhythmia','Working',13,'2026-04-05 13:45:00'),(59,59,'C50.919','Breast cancer','Working',14,'2026-04-05 14:15:00'),(60,60,'R05','Cough','Working',15,'2026-04-05 14:45:00'),(61,61,'M54.5','Back pain','Working',1,'2026-04-06 09:15:00'),(62,62,'G44.209','Tension headache','Working',2,'2026-04-06 09:45:00'),(63,63,'J96.90','Respiratory failure','Working',3,'2026-04-06 10:15:00'),(64,64,'Z00.00','Routine exam','Working',4,'2026-04-06 10:45:00'),(65,65,'I20.9','Angina','Working',5,'2026-04-06 11:15:00'),(66,66,'C80.1','Cancer unspecified','Working',6,'2026-04-06 11:45:00'),(67,67,'Z00.129','Child exam','Working',7,'2026-04-06 12:15:00'),(68,68,'M25.561','Knee pain','Working',8,'2026-04-06 12:45:00'),(69,69,'G62.9','Neuropathy','Working',9,'2026-04-06 13:15:00'),(70,70,'J96.00','Respiratory failure','Working',10,'2026-04-06 13:45:00'),(71,71,'Z00.00','Routine exam','Working',11,'2026-04-06 14:15:00'),(72,72,'I49.9','Arrhythmia','Working',12,'2026-04-06 14:45:00'),(73,73,'C50.919','Breast cancer','Working',13,'2026-04-07 09:15:00'),(74,74,'R05','Cough','Working',14,'2026-04-07 09:45:00'),(75,75,'M54.5','Back pain','Working',15,'2026-04-07 10:15:00'),(76,76,'J18.9','Pneumonia','Working',1,'2026-04-07 10:45:00'),(77,77,'J96.00','Respiratory failure','Working',2,'2026-04-07 11:15:00'),(78,78,'Z09','Follow-up','Working',3,'2026-04-07 11:45:00'),(79,79,'R07.9','Chest pain','Working',4,'2026-04-07 12:15:00'),(80,80,'C80.1','Cancer unspecified','Working',5,'2026-04-07 12:45:00'),(81,81,'Z00.00','Routine exam','Working',6,'2026-04-07 13:15:00'),(82,82,'I49.9','Arrhythmia','Working',7,'2026-04-07 13:45:00'),(83,83,'G62.9','Neuropathy','Working',8,'2026-04-07 14:15:00'),(84,84,'J96.00','Respiratory failure','Working',9,'2026-04-07 14:45:00'),(85,85,'Z00.00','Routine exam','Working',10,'2026-04-08 09:15:00'),(86,86,'I20.9','Angina','Working',11,'2026-04-08 09:45:00'),(87,87,'C80.1','Cancer unspecified','Working',12,'2026-04-08 10:15:00'),(88,88,'Z00.129','Child exam','Working',13,'2026-04-08 10:45:00'),(89,89,'M25.561','Knee pain','Working',14,'2026-04-08 11:15:00'),(90,90,'G44.209','Tension headache','Working',15,'2026-04-08 11:45:00'),(91,91,'J96.00','Respiratory failure','Working',1,'2026-04-08 12:15:00'),(92,92,'Z00.00','Routine exam','Working',2,'2026-04-08 12:45:00'),(93,93,'I49.9','Arrhythmia','Working',3,'2026-04-08 13:15:00'),(94,94,'C50.919','Breast cancer','Working',4,'2026-04-08 13:45:00'),(95,95,'R05','Cough','Working',5,'2026-04-08 14:15:00'),(96,96,'M54.5','Back pain','Working',6,'2026-04-08 14:45:00'),(97,97,'G44.209','Tension headache','Working',7,'2026-04-09 09:15:00'),(98,98,'J96.00','Respiratory failure','Working',8,'2026-04-09 09:45:00'),(99,99,'Z09','Follow-up','Working',9,'2026-04-09 10:15:00'),(100,100,'R07.9','Chest pain','Working',10,'2026-04-09 10:45:00');
/*!40000 ALTER TABLE `diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discharge_note_medications`
--

DROP TABLE IF EXISTS `discharge_note_medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discharge_note_medications` (
  `discharge_note_id` int NOT NULL,
  `prescription_id` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`discharge_note_id`,`prescription_id`),
  KEY `idx_dnm_prescription_id` (`prescription_id`),
  CONSTRAINT `fk_dnm_discharge_note` FOREIGN KEY (`discharge_note_id`) REFERENCES `discharge_notes` (`discharge_note_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dnm_prescription` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`prescription_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discharge_note_medications`
--

LOCK TABLES `discharge_note_medications` WRITE;
/*!40000 ALTER TABLE `discharge_note_medications` DISABLE KEYS */;
/*!40000 ALTER TABLE `discharge_note_medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discharge_notes`
--

DROP TABLE IF EXISTS `discharge_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discharge_notes` (
  `discharge_note_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `discharge_diagnosis` varchar(255) DEFAULT NULL,
  `instructions` text NOT NULL,
  `medications_on_discharge` text,
  `follow_up_date` date DEFAULT NULL,
  `follow_up_location` varchar(150) DEFAULT NULL,
  `return_precautions` text,
  `discharge_status` enum('Draft','Final','Delivered') DEFAULT 'Draft',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `signed_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`discharge_note_id`),
  UNIQUE KEY `encounter_id` (`encounter_id`),
  KEY `patient_id` (`patient_id`),
  KEY `provider_id` (`provider_id`),
  KEY `idx_discharge_notes_encounter` (`encounter_id`),
  CONSTRAINT `discharge_notes_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discharge_notes_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discharge_notes_ibfk_3` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discharge_notes`
--

LOCK TABLES `discharge_notes` WRITE;
/*!40000 ALTER TABLE `discharge_notes` DISABLE KEYS */;
INSERT INTO `discharge_notes` VALUES (1,1,1,1,'Influenza with respiratory symptoms','Rest, hydrate, and monitor fever.','Acetaminophen 500 mg as needed','2026-04-08','Primary Care Clinic','Return for shortness of breath, chest pain, or persistent high fever.','Delivered','2026-04-01 11:30:00','2026-04-01 11:45:00','2026-04-01 12:00:00'),(2,2,2,2,'Stable angina','Take medications as prescribed and avoid strenuous activity.','Aspirin 81 mg daily','2026-04-10','Cardiology Clinic','Return for worsening chest pain, fainting, or shortness of breath.','Delivered','2026-04-01 12:00:00','2026-04-01 12:10:00','2026-04-01 12:20:00'),(3,3,3,3,'Cancer evaluation','Continue oncology follow-up and complete ordered tests.','Pain medication as prescribed','2026-04-15','Oncology Center','Return for uncontrolled pain, fever, or inability to eat/drink.','Delivered','2026-04-01 12:30:00','2026-04-01 12:45:00','2026-04-01 13:00:00'),(4,4,4,4,'Migraine','Avoid triggers, rest in a dark room, and stay hydrated.','Sumatriptan as prescribed','2026-04-12','Neurology Clinic','Return for severe neurological symptoms, confusion, or persistent vomiting.','Delivered','2026-04-01 13:00:00','2026-04-01 13:15:00','2026-04-01 13:30:00'),(5,5,5,5,'Right knee pain','Rest, ice, elevate, and limit heavy activity.','Ibuprofen 400 mg as needed','2026-04-12','Orthopedic Clinic','Return for worsening swelling, redness, or inability to bear weight.','Delivered','2026-04-01 13:30:00','2026-04-01 13:45:00','2026-04-01 14:00:00'),(6,6,6,6,'Respiratory distress','Use inhaler as directed and avoid irritants.','Albuterol inhaler','2026-04-09','Pulmonary Clinic','Return if breathing worsens or inhaler is not helping.','Delivered','2026-04-01 14:00:00','2026-04-01 14:15:00','2026-04-01 14:30:00'),(7,7,7,7,'Cardiac event follow-up','Follow cardiac medication plan and activity restrictions.','Beta blocker as prescribed','2026-04-10','Cardiology Clinic','Return immediately for chest pain, shortness of breath, or fainting.','Delivered','2026-04-01 14:30:00','2026-04-01 14:45:00','2026-04-01 15:00:00'),(8,8,8,8,'Gastroesophageal reflux disease','Avoid spicy foods and do not lie down after meals.','Omeprazole 20 mg daily','2026-04-11','GI Clinic','Return for vomiting blood, black stools, or severe abdominal pain.','Delivered','2026-04-01 15:00:00','2026-04-01 15:15:00','2026-04-01 15:30:00'),(9,9,9,9,'Routine adult examination','Maintain healthy diet, exercise, and routine follow-up.','None','2026-05-01','Primary Care Clinic','Return for any new concerning symptoms.','Delivered','2026-04-01 15:30:00','2026-04-01 15:45:00','2026-04-01 16:00:00'),(10,10,10,10,'Dizziness','Hydrate, avoid sudden position changes, and rest.','Meclizine as needed','2026-04-12','General Medicine Clinic','Return for fainting, weakness, or worsening dizziness.','Delivered','2026-04-01 16:00:00','2026-04-01 16:15:00','2026-04-01 16:30:00'),(11,11,11,11,'Low back pain','Avoid heavy lifting and use heat or stretching as tolerated.','NSAID as needed','2026-04-14','Orthopedic Clinic','Return for leg weakness, numbness, or bowel/bladder changes.','Delivered','2026-04-01 16:30:00','2026-04-01 16:45:00','2026-04-01 17:00:00'),(12,12,12,12,'Type 2 diabetes mellitus','Continue diabetic diet, monitor sugars, and take medications regularly.','Metformin as prescribed','2026-04-14','Endocrine Follow-Up','Return for severe high sugars, vomiting, or confusion.','Delivered','2026-04-01 17:00:00','2026-04-01 17:15:00','2026-04-01 17:30:00'),(13,13,13,13,'Seizure disorder','Take anti-seizure medication consistently and avoid driving until cleared.','Levetiracetam as prescribed','2026-04-16','Neurology Clinic','Return for recurrent seizures or prolonged confusion.','Delivered','2026-04-02 09:30:00','2026-04-02 09:45:00','2026-04-02 10:00:00'),(14,14,14,14,'Routine follow-up','Continue current treatment plan and routine monitoring.','None','2026-04-16','Primary Care Clinic','Return for new or worsening symptoms.','Delivered','2026-04-02 10:00:00','2026-04-02 10:15:00','2026-04-02 10:30:00'),(15,15,15,15,'Fever, unspecified','Rest, drink fluids, and monitor temperature.','Acetaminophen as needed','2026-04-16','Primary Care Clinic','Return for persistent fever, rash, or breathing difficulty.','Delivered','2026-04-02 10:30:00','2026-04-02 10:45:00','2026-04-02 11:00:00'),(16,16,16,1,'Hypertension','Continue home blood pressure monitoring and prescribed medication.','Lisinopril as prescribed','2026-04-17','Cardiology Clinic','Return for severe headache, chest pain, or vision changes.','Delivered','2026-04-02 11:00:00','2026-04-02 11:15:00','2026-04-02 11:30:00'),(17,17,17,2,'Cardiac arrhythmia','Limit stimulants and continue medication regimen.','Metoprolol as prescribed','2026-04-17','Cardiology Clinic','Return for palpitations, fainting, or chest pain.','Delivered','2026-04-02 11:30:00','2026-04-02 11:45:00','2026-04-02 12:00:00'),(18,18,18,3,'Generalized weakness','Maintain hydration, nutrition, and complete lab follow-up.','Multivitamin and supportive meds','2026-04-18','Internal Medicine Clinic','Return for worsening weakness or inability to walk.','Delivered','2026-04-02 12:00:00','2026-04-02 12:15:00','2026-04-02 12:30:00'),(19,19,19,4,'Joint pain','Use supportive care and avoid overuse of affected joint.','Ibuprofen as needed','2026-04-18','Orthopedic Clinic','Return for redness, swelling, or worsening pain.','Delivered','2026-04-02 12:30:00','2026-04-02 12:45:00','2026-04-02 13:00:00'),(20,20,20,5,'Migraine with aura','Avoid known triggers and use medication early in symptom onset.','Sumatriptan as prescribed','2026-04-18','Neurology Clinic','Return for severe symptoms or neurological deficits.','Delivered','2026-04-02 13:00:00','2026-04-02 13:15:00','2026-04-02 13:30:00'),(21,21,21,6,'Acute respiratory failure','Use respiratory medications as directed and keep follow-up.','Inhaler and oxygen therapy as ordered','2026-04-19','Pulmonary Clinic','Return immediately for worsening breathing or blue lips.','Delivered','2026-04-02 13:30:00','2026-04-02 13:45:00','2026-04-02 14:00:00'),(22,22,22,7,'Gastroenteritis','Hydrate well and advance diet slowly as tolerated.','Ondansetron as needed','2026-04-19','Primary Care Clinic','Return for dehydration, fever, or severe abdominal pain.','Delivered','2026-04-02 14:00:00','2026-04-02 14:15:00','2026-04-02 14:30:00'),(23,23,23,8,'Coronary artery disease','Continue medications and heart-healthy lifestyle changes.','Aspirin and statin as prescribed','2026-04-20','Cardiology Clinic','Return for chest pain or worsening exercise tolerance.','Delivered','2026-04-02 14:30:00','2026-04-02 14:45:00','2026-04-02 15:00:00'),(24,24,24,9,'Breast cancer follow-up','Continue oncology treatment plan and scheduled testing.','Cancer treatment medications','2026-04-20','Oncology Center','Return for fever, severe pain, or medication side effects.','Delivered','2026-04-02 15:00:00','2026-04-02 15:15:00','2026-04-02 15:30:00'),(25,25,25,10,'Child wellness exam','Continue routine care, nutrition, and vaccinations as advised.','None','2026-05-03','Pediatrics Clinic','Return for fever, poor intake, or breathing issues.','Delivered','2026-04-03 09:30:00','2026-04-03 09:45:00','2026-04-03 10:00:00'),(26,26,26,11,'Shoulder pain','Rest the shoulder and begin exercises as instructed.','NSAID as needed','2026-04-20','Orthopedic Clinic','Return for numbness, weakness, or worsening pain.','Delivered','2026-04-03 10:00:00','2026-04-03 10:15:00','2026-04-03 10:30:00'),(27,27,27,12,'Mild cognitive concerns','Keep neurology follow-up and avoid missed medications.','Supportive medication as prescribed','2026-04-21','Neurology Clinic','Return for confusion, falls, or worsening memory problems.','Delivered','2026-04-03 10:30:00','2026-04-03 10:45:00','2026-04-03 11:00:00'),(28,28,28,13,'Severe headache','Rest, avoid triggers, and complete ordered imaging follow-up.','Pain medication as prescribed','2026-04-21','Neurology Clinic','Return for vision changes, weakness, or severe vomiting.','Delivered','2026-04-03 11:00:00','2026-04-03 11:15:00','2026-04-03 11:30:00'),(29,29,29,14,'Post-ER review','Continue home care instructions and complete follow-up if symptoms persist.','None','2026-04-21','Primary Care Clinic','Return for recurrent acute symptoms.','Delivered','2026-04-03 11:30:00','2026-04-03 11:45:00','2026-04-03 12:00:00'),(30,30,30,15,'Chest pain follow-up','Avoid exertion and continue prescribed cardiac medications.','Nitroglycerin and aspirin as directed','2026-04-22','Cardiology Clinic','Return immediately for recurrent chest pain.','Delivered','2026-04-03 12:00:00','2026-04-03 12:15:00','2026-04-03 12:30:00'),(31,31,31,1,'Lung cancer follow-up','Continue oncology appointments and medications as directed.','Cancer treatment medications','2026-04-22','Oncology Center','Return for worsening breathing or severe pain.','Delivered','2026-04-03 12:30:00','2026-04-03 12:45:00','2026-04-03 13:00:00'),(32,32,32,2,'Pediatric routine follow-up','Continue routine child care and monitoring.','None','2026-05-05','Pediatrics Clinic','Return for fever, dehydration, or breathing issues.','Delivered','2026-04-03 13:00:00','2026-04-03 13:15:00','2026-04-03 13:30:00'),(33,33,33,3,'Hip osteoarthritis','Continue physical therapy and pain management plan.','NSAID as prescribed','2026-04-22','Orthopedic Clinic','Return for worsening mobility or severe pain.','Delivered','2026-04-03 13:30:00','2026-04-03 13:45:00','2026-04-03 14:00:00'),(34,34,34,4,'Migraine follow-up','Use migraine medication as directed and avoid triggers.','Sumatriptan PRN','2026-04-23','Neurology Clinic','Return for severe headache or new neurological symptoms.','Delivered','2026-04-03 14:00:00','2026-04-03 14:15:00','2026-04-03 14:30:00'),(35,35,35,5,'Respiratory failure follow-up','Continue respiratory medications and oxygen support if ordered.','Inhaler and oxygen therapy','2026-04-23','Pulmonary Clinic','Return for worsening shortness of breath.','Delivered','2026-04-03 14:30:00','2026-04-03 14:45:00','2026-04-03 15:00:00'),(36,36,36,6,'Gastritis','Eat bland foods and avoid irritants.','Proton pump inhibitor','2026-04-23','GI Clinic','Return for vomiting blood or severe abdominal pain.','Delivered','2026-04-03 15:00:00','2026-04-03 15:15:00','2026-04-03 15:30:00'),(37,37,37,7,'Angina','Continue heart medications and cardiac precautions.','Aspirin and antianginal medication','2026-04-24','Cardiology Clinic','Return for chest pain or fainting.','Delivered','2026-04-04 09:30:00','2026-04-04 09:45:00','2026-04-04 10:00:00'),(38,38,38,8,'Cancer monitoring','Continue oncology-directed care plan.','Cancer treatment meds','2026-04-24','Oncology Center','Return for fever or severe weakness.','Delivered','2026-04-04 10:00:00','2026-04-04 10:15:00','2026-04-04 10:30:00'),(39,39,39,9,'Immunization follow-up','Continue standard preventive care.','None','2026-05-10','Pediatrics Clinic','Return for vaccine-related concerns or fever.','Delivered','2026-04-04 10:30:00','2026-04-04 10:45:00','2026-04-04 11:00:00'),(40,40,40,10,'Knee pain','Rest, ice, and follow up with orthopedics as needed.','NSAID as needed','2026-04-24','Orthopedic Clinic','Return for swelling, redness, or worsening pain.','Delivered','2026-04-04 11:00:00','2026-04-04 11:15:00','2026-04-04 11:30:00'),(41,41,41,11,'Neuropathy','Continue current medications and neuropathy precautions.','Neuropathic pain medication','2026-04-24','Neurology Clinic','Return for weakness or new sensory loss.','Delivered','2026-04-04 11:30:00','2026-04-04 11:45:00','2026-04-04 12:00:00'),(42,42,42,12,'Respiratory distress','Use prescribed respiratory treatment plan and monitor closely.','Inhaler and steroids','2026-04-25','Pulmonary Clinic','Return immediately for breathing difficulty.','Delivered','2026-04-04 12:00:00','2026-04-04 12:15:00','2026-04-04 12:30:00'),(43,43,43,13,'Routine examination','Maintain preventive care and healthy lifestyle habits.','None','2026-05-10','Primary Care Clinic','Return for any new symptoms.','Delivered','2026-04-04 12:30:00','2026-04-04 12:45:00','2026-04-04 13:00:00'),(44,44,44,14,'Arrhythmia follow-up','Continue cardiac medications and monitoring.','Antiarrhythmic medication','2026-04-25','Cardiology Clinic','Return for dizziness, syncope, or palpitations.','Delivered','2026-04-04 13:00:00','2026-04-04 13:15:00','2026-04-04 13:30:00'),(45,45,45,15,'Breast cancer','Continue oncology treatment and follow-up visits.','Cancer treatment medications','2026-04-25','Oncology Center','Return for severe pain, fever, or medication side effects.','Delivered','2026-04-04 13:30:00','2026-04-04 13:45:00','2026-04-04 14:00:00'),(46,46,46,1,'Cough','Hydrate, rest, and use supportive medications as prescribed.','Cough syrup as needed','2026-04-25','Primary Care Clinic','Return for fever, shortness of breath, or worsening symptoms.','Delivered','2026-04-04 14:00:00','2026-04-04 14:15:00','2026-04-04 14:30:00'),(47,47,47,2,'Low back pain','Avoid strain and continue home exercise program.','NSAID as needed','2026-04-26','Orthopedic Clinic','Return for weakness, numbness, or worsening pain.','Delivered','2026-04-04 14:30:00','2026-04-04 14:45:00','2026-04-04 15:00:00'),(48,48,48,3,'Headache','Continue headache management plan and hydration.','Pain reliever as prescribed','2026-04-26','Neurology Clinic','Return for new neuro symptoms or severe headache.','Delivered','2026-04-04 15:00:00','2026-04-04 15:15:00','2026-04-04 15:30:00'),(49,49,49,4,'Respiratory failure','Continue respiratory support plan and meds.','Inhaler and oxygen therapy','2026-04-26','Pulmonary Clinic','Return for worsening breathing or chest tightness.','Delivered','2026-04-05 09:30:00','2026-04-05 09:45:00','2026-04-05 10:00:00'),(50,50,50,5,'Routine follow-up','Continue current plan and follow up as scheduled.','None','2026-04-26','Primary Care Clinic','Return for any worsening symptoms.','Delivered','2026-04-05 10:00:00','2026-04-05 10:15:00','2026-04-05 10:30:00'),(51,51,51,6,'Hypertension','Monitor blood pressure daily and continue medications.','Lisinopril as prescribed','2026-04-27','Cardiology Clinic','Return for headache, chest pain, or vision changes.','Delivered','2026-04-05 10:30:00','2026-04-05 10:45:00','2026-04-05 11:00:00'),(52,52,52,7,'Cancer follow-up','Continue oncology plan and hydration support.','Cancer treatment medications','2026-04-27','Oncology Center','Return for fever, severe pain, or weakness.','Delivered','2026-04-05 11:00:00','2026-04-05 11:15:00','2026-04-05 11:30:00'),(53,53,53,8,'Child preventive care','Continue routine wellness care.','None','2026-05-12','Pediatrics Clinic','Return for fever or poor intake.','Delivered','2026-04-05 11:30:00','2026-04-05 11:45:00','2026-04-05 12:00:00'),(54,54,54,9,'Joint pain','Limit overuse and continue pain control measures.','NSAID as needed','2026-04-27','Orthopedic Clinic','Return for worsening swelling or pain.','Delivered','2026-04-05 12:00:00','2026-04-05 12:15:00','2026-04-05 12:30:00'),(55,55,55,10,'Neuropathy','Continue medication and foot care precautions.','Gabapentin as prescribed','2026-04-27','Neurology Clinic','Return for worsening numbness or weakness.','Delivered','2026-04-05 12:30:00','2026-04-05 12:45:00','2026-04-05 13:00:00'),(56,56,56,11,'Respiratory failure','Follow respiratory treatment plan closely.','Inhaler and steroids','2026-04-28','Pulmonary Clinic','Return immediately for breathing distress.','Delivered','2026-04-05 13:00:00','2026-04-05 13:15:00','2026-04-05 13:30:00'),(57,57,57,12,'Routine follow-up','Continue routine care with no medication changes.','None','2026-04-28','Primary Care Clinic','Return for new symptoms.','Delivered','2026-04-05 13:30:00','2026-04-05 13:45:00','2026-04-05 14:00:00'),(58,58,58,13,'Arrhythmia','Monitor pulse and continue prescribed heart medications.','Beta blocker as prescribed','2026-04-28','Cardiology Clinic','Return for palpitations or fainting.','Delivered','2026-04-05 14:00:00','2026-04-05 14:15:00','2026-04-05 14:30:00'),(59,59,59,14,'Cancer monitoring','Continue cancer care and scheduled visits.','Cancer treatment medications','2026-04-28','Oncology Center','Return for severe weakness or fever.','Delivered','2026-04-05 14:30:00','2026-04-05 14:45:00','2026-04-05 15:00:00'),(60,60,60,15,'Cough','Continue supportive care and hydration.','Cough suppressant as needed','2026-04-28','Primary Care Clinic','Return for worsening cough or fever.','Delivered','2026-04-05 15:00:00','2026-04-05 15:15:00','2026-04-05 15:30:00'),(61,61,61,1,'Back pain','Continue stretching and activity modification.','NSAID as needed','2026-04-29','Orthopedic Clinic','Return for worsening symptoms or weakness.','Delivered','2026-04-06 09:30:00','2026-04-06 09:45:00','2026-04-06 10:00:00'),(62,62,62,2,'Headache','Continue headache management and hydration.','Pain reliever as prescribed','2026-04-29','Neurology Clinic','Return for severe headache or vomiting.','Delivered','2026-04-06 10:00:00','2026-04-06 10:15:00','2026-04-06 10:30:00'),(63,63,63,3,'Respiratory failure','Continue pulmonary follow-up and respiratory therapy.','Oxygen and inhaler','2026-04-29','Pulmonary Clinic','Return immediately for breathing difficulty.','Delivered','2026-04-06 10:30:00','2026-04-06 10:45:00','2026-04-06 11:00:00'),(64,64,64,4,'Routine exam','Routine exam completed; continue preventive care.','None','2026-05-15','Primary Care Clinic','Return for any new symptoms.','Delivered','2026-04-06 11:00:00','2026-04-06 11:15:00','2026-04-06 11:30:00'),(65,65,65,5,'Angina','Continue antianginal medication and activity precautions.','Aspirin and nitroglycerin as directed','2026-04-29','Cardiology Clinic','Return for chest pain or shortness of breath.','Delivered','2026-04-06 11:30:00','2026-04-06 11:45:00','2026-04-06 12:00:00'),(66,66,66,6,'Cancer follow-up','Continue oncology-directed care and supportive treatment.','Cancer treatment medications','2026-04-30','Oncology Center','Return for fever or uncontrolled pain.','Delivered','2026-04-06 12:00:00','2026-04-06 12:15:00','2026-04-06 12:30:00'),(67,67,67,7,'Child preventive care','Continue preventive care and scheduled immunizations.','None','2026-05-15','Pediatrics Clinic','Return for new illness or poor intake.','Delivered','2026-04-06 12:30:00','2026-04-06 12:45:00','2026-04-06 13:00:00'),(68,68,68,8,'Knee pain','Rest joint and use pain control as needed.','NSAID as needed','2026-04-30','Orthopedic Clinic','Return for swelling, redness, or inability to walk.','Delivered','2026-04-06 13:00:00','2026-04-06 13:15:00','2026-04-06 13:30:00'),(69,69,69,9,'Neuropathy','Continue neuropathy medication and safety precautions.','Gabapentin as prescribed','2026-04-30','Neurology Clinic','Return for worsening weakness or falls.','Delivered','2026-04-06 13:30:00','2026-04-06 13:45:00','2026-04-06 14:00:00'),(70,70,70,10,'Respiratory failure','Continue close respiratory follow-up after discharge.','Inhaler and steroid therapy','2026-04-30','Pulmonary Clinic','Return for worsening breathing difficulty.','Delivered','2026-04-06 14:00:00','2026-04-06 14:15:00','2026-04-06 14:30:00'),(71,71,71,11,'Routine follow-up','Continue current medications and follow routine care.','None','2026-05-01','Primary Care Clinic','Return for new or worsening symptoms.','Delivered','2026-04-06 14:30:00','2026-04-06 14:45:00','2026-04-06 15:00:00'),(72,72,72,12,'Arrhythmia','Continue heart rate monitoring and prescribed therapy.','Antiarrhythmic medication','2026-05-01','Cardiology Clinic','Return for palpitations, dizziness, or syncope.','Delivered','2026-04-06 15:00:00','2026-04-06 15:15:00','2026-04-06 15:30:00'),(73,73,73,13,'Breast cancer follow-up','Continue scheduled oncology care and imaging follow-up.','Cancer treatment medications','2026-05-01','Oncology Center','Return for fever, pain, or concerning symptoms.','Delivered','2026-04-07 09:30:00','2026-04-07 09:45:00','2026-04-07 10:00:00'),(74,74,74,14,'Respiratory infection','Rest, fluids, and medication adherence advised.','Cough medication and supportive care','2026-05-01','Primary Care Clinic','Return for fever, SOB, or worsening cough.','Delivered','2026-04-07 10:00:00','2026-04-07 10:15:00','2026-04-07 10:30:00'),(75,75,75,15,'Back pain','Continue home exercises and pain control.','NSAID as needed','2026-05-02','Orthopedic Clinic','Return for severe pain or weakness.','Delivered','2026-04-07 10:30:00','2026-04-07 10:45:00','2026-04-07 11:00:00'),(76,76,76,1,'Pneumonia','Complete prescribed therapy and rest.','Antibiotics as prescribed','2026-05-02','Primary Care Clinic','Return for worsening SOB or fever.','Delivered','2026-04-07 11:00:00','2026-04-07 11:15:00','2026-04-07 11:30:00'),(77,77,77,2,'Respiratory failure','Continue respiratory medications and oxygen if prescribed.','Inhaler and oxygen therapy','2026-05-02','Pulmonary Clinic','Return immediately for respiratory distress.','Delivered','2026-04-07 11:30:00','2026-04-07 11:45:00','2026-04-07 12:00:00'),(78,78,78,3,'Follow-up visit','Continue current treatment plan.','None','2026-05-02','Primary Care Clinic','Return for worsening symptoms.','Delivered','2026-04-07 12:00:00','2026-04-07 12:15:00','2026-04-07 12:30:00'),(79,79,79,4,'Chest pain','Continue cardiac medications and seek care if symptoms recur.','Aspirin and nitroglycerin','2026-05-02','Cardiology Clinic','Return immediately for chest pain.','Delivered','2026-04-07 12:30:00','2026-04-07 12:45:00','2026-04-07 13:00:00'),(80,80,80,5,'Cancer follow-up','Continue oncology treatment and hydration.','Cancer treatment medications','2026-05-03','Oncology Center','Return for fever, severe pain, or weakness.','Delivered','2026-04-07 13:00:00','2026-04-07 13:15:00','2026-04-07 13:30:00'),(81,81,81,6,'Pediatric routine visit','Continue regular wellness care and monitoring.','None','2026-05-03','Pediatrics Clinic','Return for new symptoms or fever.','Delivered','2026-04-07 13:30:00','2026-04-07 13:45:00','2026-04-07 14:00:00'),(82,82,82,7,'Joint pain','Continue exercises and pain control measures.','NSAID as needed','2026-05-03','Orthopedic Clinic','Return for worsening pain or swelling.','Delivered','2026-04-07 14:00:00','2026-04-07 14:15:00','2026-04-07 14:30:00'),(83,83,83,8,'Neuropathy','Maintain current medication and monitor symptoms.','Gabapentin as prescribed','2026-05-03','Neurology Clinic','Return for weakness or worsening numbness.','Delivered','2026-04-07 14:30:00','2026-04-07 14:45:00','2026-04-07 15:00:00'),(84,84,84,9,'Respiratory failure','Continue pulmonary care plan after discharge.','Inhaler and oxygen if needed','2026-05-04','Pulmonary Clinic','Return immediately for trouble breathing.','Delivered','2026-04-07 15:00:00','2026-04-07 15:15:00','2026-04-07 15:30:00'),(85,85,85,10,'Routine follow-up','Continue healthy lifestyle and current medications.','None','2026-05-04','Primary Care Clinic','Return for new concerns.','Delivered','2026-04-08 09:30:00','2026-04-08 09:45:00','2026-04-08 10:00:00'),(86,86,86,11,'Angina','Continue antianginal therapy and follow up with cardiology.','Aspirin and antianginal medication','2026-05-04','Cardiology Clinic','Return for chest pain or SOB.','Delivered','2026-04-08 10:00:00','2026-04-08 10:15:00','2026-04-08 10:30:00'),(87,87,87,12,'Cancer follow-up','Continue oncology treatment and symptom monitoring.','Cancer treatment medications','2026-05-04','Oncology Center','Return for fever, pain, or weakness.','Delivered','2026-04-08 10:30:00','2026-04-08 10:45:00','2026-04-08 11:00:00'),(88,88,88,13,'Pediatric preventive care','Continue normal diet, hydration, and routine follow-up.','None','2026-05-05','Pediatrics Clinic','Return for fever or poor intake.','Delivered','2026-04-08 11:00:00','2026-04-08 11:15:00','2026-04-08 11:30:00'),(89,89,89,14,'Knee pain','Rest, ice, and use medications as prescribed.','NSAID as needed','2026-05-05','Orthopedic Clinic','Return for swelling or inability to bear weight.','Delivered','2026-04-08 11:30:00','2026-04-08 11:45:00','2026-04-08 12:00:00'),(90,90,90,15,'Headache','Continue hydration and headache treatment plan.','Pain reliever as prescribed','2026-05-05','Neurology Clinic','Return for severe or worsening headache.','Delivered','2026-04-08 12:00:00','2026-04-08 12:15:00','2026-04-08 12:30:00'),(91,91,91,1,'Respiratory failure','Continue inhalers and close pulmonary follow-up.','Inhaler and oxygen therapy','2026-05-05','Pulmonary Clinic','Return for worsening shortness of breath.','Delivered','2026-04-08 12:30:00','2026-04-08 12:45:00','2026-04-08 13:00:00'),(92,92,92,2,'Routine follow-up','Continue present medications and keep scheduled appointments.','None','2026-05-06','Primary Care Clinic','Return for new symptoms.','Delivered','2026-04-08 13:00:00','2026-04-08 13:15:00','2026-04-08 13:30:00'),(93,93,93,3,'Arrhythmia','Continue rhythm monitoring and medications.','Antiarrhythmic medication','2026-05-06','Cardiology Clinic','Return for syncope or worsening palpitations.','Delivered','2026-04-08 13:30:00','2026-04-08 13:45:00','2026-04-08 14:00:00'),(94,94,94,4,'Cancer follow-up','Continue oncology treatment and symptom monitoring.','Cancer treatment medications','2026-05-06','Oncology Center','Return for fever, weakness, or uncontrolled pain.','Delivered','2026-04-08 14:00:00','2026-04-08 14:15:00','2026-04-08 14:30:00'),(95,95,95,5,'Cough','Supportive treatment and rest recommended.','Cough syrup as needed','2026-05-06','Primary Care Clinic','Return for fever or worsening breathing.','Delivered','2026-04-08 14:30:00','2026-04-08 14:45:00','2026-04-08 15:00:00'),(96,96,96,6,'Back pain','Continue physical therapy and pain management.','NSAID as needed','2026-05-07','Orthopedic Clinic','Return for worsening pain or numbness.','Delivered','2026-04-08 15:00:00','2026-04-08 15:15:00','2026-04-08 15:30:00'),(97,97,97,7,'Headache follow-up','Continue headache precautions and medication plan.','Pain medication as needed','2026-05-07','Neurology Clinic','Return for severe headache or neuro symptoms.','Delivered','2026-04-09 09:30:00','2026-04-09 09:45:00','2026-04-09 10:00:00'),(98,98,98,8,'Respiratory admission follow-up','Continue pulmonary medications and close follow-up.','Inhaler as prescribed','2026-05-07','Pulmonary Clinic','Return immediately for breathing difficulty.','Delivered','2026-04-09 10:00:00','2026-04-09 10:15:00','2026-04-09 10:30:00'),(99,99,99,9,'Post-acute follow-up','Recovery is progressing; continue outpatient care.','None','2026-05-07','Primary Care Clinic','Return for recurrent symptoms.','Delivered','2026-04-09 10:30:00','2026-04-09 10:45:00','2026-04-09 11:00:00'),(100,100,100,10,'Chest pain follow-up','Continue cardiac meds and follow up as planned.','Aspirin as prescribed','2026-05-08','Cardiology Clinic','Return immediately for chest pain or fainting.','Delivered','2026-04-09 11:00:00','2026-04-09 11:15:00','2026-04-09 11:30:00');
/*!40000 ALTER TABLE `discharge_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_addresses`
--

DROP TABLE IF EXISTS `employee_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_addresses` (
  `employee_address_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `line1` varchar(150) NOT NULL,
  `line2` varchar(150) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(100) DEFAULT 'USA',
  `address_type` varchar(100) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`employee_address_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_addresses_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_addresses`
--

LOCK TABLES `employee_addresses` WRITE;
/*!40000 ALTER TABLE `employee_addresses` DISABLE KEYS */;
INSERT INTO `employee_addresses` VALUES (1,1,'410 Hennepin Ave',NULL,'Minneapolis','MN','55401','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(2,2,'922 Nicollet Mall','Apt 302','Minneapolis','MN','55402','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(3,3,'1180 Grand Ave',NULL,'Saint Paul','MN','55105','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(4,4,'245 Summit Ave','Unit 4B','Saint Paul','MN','55102','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(5,5,'7600 France Ave S',NULL,'Edina','MN','55435','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(6,6,'5440 Vernon Ave S','Apt 12','Edina','MN','55436','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(7,7,'13810 Pioneer Trail',NULL,'Eden Prairie','MN','55347','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(8,8,'8890 Excelsior Blvd','Apt 210','Hopkins','MN','55343','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(9,9,'1024 Mainstreet',NULL,'Hopkins','MN','55343','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(10,10,'300 Washington Ave SE','Apt 5','Minneapolis','MN','55414','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(11,11,'1560 University Ave W',NULL,'Saint Paul','MN','55104','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(12,12,'743 Cleveland Ave S','Unit 8','Saint Paul','MN','55116','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(13,13,'900 Lake St W',NULL,'Minneapolis','MN','55408','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(14,14,'3325 Lyndale Ave S','Apt 6','Minneapolis','MN','55408','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(15,15,'4750 Chicago Ave',NULL,'Minneapolis','MN','55407','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(16,16,'6200 Penn Ave S','Apt 104','Richfield','MN','55423','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(17,17,'7645 Lyndale Ave S',NULL,'Richfield','MN','55423','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(18,18,'8600 Bloomington Ave S','Unit 3','Bloomington','MN','55425','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(19,19,'7900 Xerxes Ave S',NULL,'Bloomington','MN','55431','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(20,20,'8421 Portland Ave S','Apt 17','Bloomington','MN','55420','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(21,21,'12300 Singletree Ln',NULL,'Eden Prairie','MN','55344','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(22,22,'7025 Valley View Rd','Unit 11','Edina','MN','55439','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(23,23,'5100 W 98th St',NULL,'Bloomington','MN','55437','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(24,24,'9400 Old Cedar Ave S','Apt 204','Bloomington','MN','55425','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(25,25,'14200 Burnhaven Dr',NULL,'Burnsville','MN','55306','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(26,26,'12900 Nicollet Ave','Apt 9','Burnsville','MN','55337','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(27,27,'1500 McAndrews Rd W',NULL,'Burnsville','MN','55337','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(28,28,'4300 Rahn Rd','Unit 15','Eagan','MN','55122','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(29,29,'1985 Diffley Rd',NULL,'Eagan','MN','55122','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(30,30,'3400 Pilot Knob Rd','Apt 22','Eagan','MN','55121','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(31,31,'12800 Portland Ave',NULL,'Burnsville','MN','55337','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(32,32,'2010 County Road 42 W','Apt 310','Burnsville','MN','55337','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(33,33,'7750 150th St W',NULL,'Apple Valley','MN','55124','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(34,34,'14990 Glazier Ave','Unit 2','Apple Valley','MN','55124','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(35,35,'16000 Cedar Ave S',NULL,'Rosemount','MN','55068','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(36,36,'14500 Dodd Blvd','Apt 7','Rosemount','MN','55068','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(37,37,'20700 Holyoke Ave',NULL,'Lakeville','MN','55044','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(38,38,'17685 Glasgow Ave','Unit 14','Lakeville','MN','55044','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(39,39,'20300 Kenrick Ave',NULL,'Lakeville','MN','55044','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(40,40,'18550 Joplin Ave','Apt 19','Lakeville','MN','55044','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(41,41,'1000 Highway 13 E',NULL,'Savage','MN','55378','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(42,42,'5800 Egan Dr','Apt 5','Savage','MN','55378','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(43,43,'1200 Vierling Dr E',NULL,'Shakopee','MN','55379','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(44,44,'705 Marschall Rd','Unit 8','Shakopee','MN','55379','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(45,45,'16731 Highway 13 S',NULL,'Prior Lake','MN','55372','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(46,46,'4700 Tower St SE','Apt 10','Prior Lake','MN','55372','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(47,47,'1010 1st Ave E',NULL,'Shakopee','MN','55379','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(48,48,'5300 Hyland Greens Dr','Unit 21','Bloomington','MN','55437','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(49,49,'6700 Normandale Rd',NULL,'Edina','MN','55436','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(50,50,'3940 W 50th St','Apt 301','Edina','MN','55424','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(51,51,'7100 Brooklyn Blvd',NULL,'Brooklyn Center','MN','55429','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(52,52,'6040 Earle Brown Dr','Apt 18','Brooklyn Center','MN','55430','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(53,53,'8500 Zane Ave N',NULL,'Brooklyn Park','MN','55443','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(54,54,'6100 85th Ave N','Unit 12','Brooklyn Park','MN','55443','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(55,55,'12900 Arbor Lakes Pkwy',NULL,'Maple Grove','MN','55369','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(56,56,'9300 Garland Ln N','Apt 6','Maple Grove','MN','55311','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(57,57,'7200 Hemlock Ln N',NULL,'Maple Grove','MN','55369','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(58,58,'11500 Bass Lake Rd','Unit 2','Plymouth','MN','55442','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(59,59,'3500 Vicksburg Ln N',NULL,'Plymouth','MN','55447','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(60,60,'16875 County Road 24','Apt 202','Plymouth','MN','55447','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(61,61,'2100 Snelling Ave N',NULL,'Roseville','MN','55113','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(62,62,'2700 Rice St','Apt 4','Little Canada','MN','55113','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(63,63,'3900 Lexington Ave N',NULL,'Shoreview','MN','55126','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(64,64,'5800 Hodgson Rd','Unit 9','Shoreview','MN','55126','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(65,65,'1100 County Road E',NULL,'Vadnais Heights','MN','55110','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(66,66,'3500 Centerville Rd','Apt 16','Vadnais Heights','MN','55127','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(67,67,'4730 White Bear Pkwy',NULL,'White Bear Lake','MN','55110','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(68,68,'2160 4th St','Unit 3','White Bear Lake','MN','55110','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(69,69,'1700 Beam Ave',NULL,'Maplewood','MN','55109','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(70,70,'3000 White Bear Ave N','Apt 101','Maplewood','MN','55109','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(71,71,'7200 Valley Creek Rd',NULL,'Woodbury','MN','55125','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(72,72,'10150 City Walk Dr','Apt 214','Woodbury','MN','55129','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(73,73,'8300 Tamarack Village',NULL,'Woodbury','MN','55125','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(74,74,'5800 Neal Ave N','Unit 7','Stillwater','MN','55082','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(75,75,'200 Chestnut St E',NULL,'Stillwater','MN','55082','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(76,76,'14600 60th St N','Apt 11','Oak Park Heights','MN','55082','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(77,77,'9000 Hudson Blvd N',NULL,'Lake Elmo','MN','55042','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(78,78,'11200 Stillwater Blvd N','Unit 5','Lake Elmo','MN','55042','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(79,79,'1500 County Road B2 W',NULL,'Roseville','MN','55113','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(80,80,'2480 Fairview Ave N','Apt 20','Roseville','MN','55113','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(81,81,'1201 Madison Ave',NULL,'Mankato','MN','56001','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(82,82,'201 Riverfront Dr','Apt 6','Mankato','MN','56001','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(83,83,'1850 Adams St',NULL,'Mankato','MN','56001','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(84,84,'150 St Andrews Dr','Unit 9','Mankato','MN','56001','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(85,85,'500 S Front St',NULL,'Mankato','MN','56001','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(86,86,'1600 Warren St','Apt 15','Mankato','MN','56001','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(87,87,'300 Belgrade Ave',NULL,'North Mankato','MN','56003','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(88,88,'1750 Commerce Dr','Unit 2','North Mankato','MN','56003','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(89,89,'2200 Lookout Dr',NULL,'North Mankato','MN','56003','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(90,90,'1240 Range St','Apt 12','Mankato','MN','56001','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(91,91,'100 7th Ave S',NULL,'Saint Cloud','MN','56301','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(92,92,'2550 Division St W','Apt 18','Saint Cloud','MN','56301','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(93,93,'400 2nd St S',NULL,'Waite Park','MN','56387','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(94,94,'17 2nd Ave N','Unit 4','Sauk Rapids','MN','56379','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(95,95,'900 Cooper Ave S',NULL,'Saint Cloud','MN','56301','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(96,96,'3200 W St Germain St','Apt 208','Saint Cloud','MN','56301','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(97,97,'1250 32nd Ave N',NULL,'Saint Cloud','MN','56303','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(98,98,'650 Highway 10 S','Unit 10','Saint Cloud','MN','56304','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(99,99,'205 Pinecone Rd N',NULL,'Sartell','MN','56377','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(100,100,'1733 Pinecone Rd S','Apt 5','Sartell','MN','56377','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1);
/*!40000 ALTER TABLE `employee_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_allowances`
--

DROP TABLE IF EXISTS `employee_allowances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_allowances` (
  `employee_id` int NOT NULL,
  `allowance_id` int NOT NULL,
  `calc_type` enum('Fixed','Percentage') NOT NULL DEFAULT 'Fixed',
  `amount` decimal(10,2) NOT NULL,
  `effective_date` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`,`allowance_id`),
  KEY `allowance_id` (`allowance_id`),
  CONSTRAINT `employee_allowances_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_allowances_ibfk_2` FOREIGN KEY (`allowance_id`) REFERENCES `allowances` (`allowance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_allowances`
--

LOCK TABLES `employee_allowances` WRITE;
/*!40000 ALTER TABLE `employee_allowances` DISABLE KEYS */;
INSERT INTO `employee_allowances` VALUES (1,3,'Fixed',1200.00,'2026-01-01','2026-04-30 13:51:29'),(1,11,'Fixed',150.00,'2026-01-01','2026-04-30 13:51:29'),(2,3,'Fixed',1100.00,'2026-01-01','2026-04-30 13:51:29'),(2,4,'Fixed',200.00,'2026-01-01','2026-04-30 13:51:29'),(3,3,'Fixed',1000.00,'2026-01-01','2026-04-30 13:51:29'),(3,8,'Fixed',300.00,'2026-01-01','2026-04-30 13:51:29'),(4,3,'Fixed',950.00,'2026-01-01','2026-04-30 13:51:29'),(4,5,'Percentage',10.00,'2026-01-01','2026-04-30 13:51:29'),(5,3,'Fixed',900.00,'2026-01-01','2026-04-30 13:51:29'),(5,9,'Fixed',250.00,'2026-01-01','2026-04-30 13:51:29'),(6,1,'Fixed',75.00,'2026-04-01','2026-04-30 13:51:29'),(6,4,'Fixed',120.00,'2026-04-01','2026-04-30 13:51:29'),(6,7,'Percentage',5.00,'2026-04-01','2026-04-30 13:51:29'),(7,2,'Fixed',75.00,'2026-04-01','2026-04-30 13:51:29'),(7,4,'Fixed',120.00,'2026-04-01','2026-04-30 13:51:29'),(7,7,'Percentage',5.00,'2026-04-01','2026-04-30 13:51:29'),(8,1,'Fixed',80.00,'2026-04-01','2026-04-30 13:51:29'),(8,4,'Fixed',150.00,'2026-04-01','2026-04-30 13:51:29'),(9,1,'Fixed',85.00,'2026-04-01','2026-04-30 13:51:29'),(9,5,'Percentage',8.00,'2026-04-01','2026-04-30 13:51:29'),(10,8,'Fixed',300.00,'2026-01-01','2026-04-30 13:51:29'),(10,14,'Fixed',300.00,'2026-01-01','2026-04-30 13:51:29'),(10,16,'Percentage',12.00,'2026-01-01','2026-04-30 13:51:29'),(11,2,'Fixed',70.00,'2026-01-01','2026-04-30 13:51:29'),(11,9,'Fixed',200.00,'2026-01-01','2026-04-30 13:51:29'),(11,15,'Fixed',200.00,'2026-01-01','2026-04-30 13:51:29'),(12,2,'Fixed',70.00,'2026-01-01','2026-04-30 13:51:29'),(12,9,'Fixed',180.00,'2026-01-01','2026-04-30 13:51:29'),(12,15,'Fixed',180.00,'2026-01-01','2026-04-30 13:51:29'),(13,6,'Fixed',250.00,'2026-01-01','2026-04-30 13:51:29'),(13,14,'Fixed',250.00,'2026-01-01','2026-04-30 13:51:29'),(13,16,'Percentage',10.00,'2026-01-01','2026-04-30 13:51:29'),(14,1,'Fixed',60.00,'2026-01-01','2026-04-30 13:51:29'),(14,6,'Fixed',200.00,'2026-01-01','2026-04-30 13:51:29'),(14,10,'Fixed',120.00,'2026-01-01','2026-04-30 13:51:29'),(15,1,'Fixed',65.00,'2026-01-01','2026-04-30 13:51:29'),(15,3,'Fixed',800.00,'2026-01-01','2026-04-30 13:51:29'),(15,12,'Fixed',500.00,'2026-01-01','2026-04-30 13:51:29'),(16,1,'Fixed',65.00,'2026-01-01','2026-04-30 13:51:29'),(16,3,'Fixed',750.00,'2026-01-01','2026-04-30 13:51:29'),(16,12,'Fixed',450.00,'2026-01-01','2026-04-30 13:51:29'),(17,5,'Percentage',10.00,'2026-01-01','2026-04-30 13:51:29'),(17,6,'Fixed',250.00,'2026-01-01','2026-04-30 13:51:29'),(17,8,'Fixed',350.00,'2026-01-01','2026-04-30 13:51:29'),(18,5,'Percentage',9.00,'2026-01-01','2026-04-30 13:51:29'),(18,6,'Fixed',200.00,'2026-01-01','2026-04-30 13:51:29'),(18,8,'Fixed',300.00,'2026-01-01','2026-04-30 13:51:29'),(19,1,'Fixed',70.00,'2026-01-01','2026-04-30 13:51:29'),(19,2,'Fixed',75.00,'2026-01-01','2026-04-30 13:51:29'),(19,7,'Percentage',5.00,'2026-01-01','2026-04-30 13:51:29'),(20,1,'Fixed',70.00,'2026-01-01','2026-04-30 13:51:29'),(20,2,'Fixed',75.00,'2026-01-01','2026-04-30 13:51:29'),(20,7,'Percentage',5.00,'2026-01-01','2026-04-30 13:51:29'),(21,1,'Fixed',60.00,'2026-01-01','2026-04-30 13:51:29'),(21,10,'Fixed',100.00,'2026-01-01','2026-04-30 13:51:29'),(21,15,'Fixed',150.00,'2026-01-01','2026-04-30 13:51:29'),(22,1,'Fixed',60.00,'2026-01-01','2026-04-30 13:51:29'),(22,10,'Fixed',100.00,'2026-01-01','2026-04-30 13:51:29'),(22,15,'Fixed',140.00,'2026-01-01','2026-04-30 13:51:29'),(23,1,'Fixed',65.00,'2026-01-01','2026-04-30 13:51:29'),(23,11,'Fixed',150.00,'2026-01-01','2026-04-30 13:51:29'),(23,18,'Fixed',200.00,'2026-01-01','2026-04-30 13:51:29'),(24,1,'Fixed',70.00,'2026-01-01','2026-04-30 13:51:29'),(24,11,'Fixed',150.00,'2026-01-01','2026-04-30 13:51:29'),(24,19,'Fixed',250.00,'2026-01-01','2026-04-30 13:51:29'),(25,1,'Fixed',75.00,'2026-01-01','2026-04-30 13:51:29'),(25,12,'Fixed',400.00,'2026-01-01','2026-04-30 13:51:29'),(25,16,'Percentage',10.00,'2026-01-01','2026-04-30 13:51:29'),(26,1,'Fixed',65.00,'2026-01-01','2026-04-30 13:51:29'),(26,17,'Fixed',220.00,'2026-01-01','2026-04-30 13:51:29'),(27,1,'Fixed',65.00,'2026-01-01','2026-04-30 13:51:29'),(27,17,'Fixed',200.00,'2026-01-01','2026-04-30 13:51:29'),(28,1,'Fixed',70.00,'2026-01-01','2026-04-30 13:51:29'),(28,18,'Fixed',210.00,'2026-01-01','2026-04-30 13:51:29'),(29,1,'Fixed',55.00,'2026-01-01','2026-04-30 13:51:29'),(29,15,'Fixed',130.00,'2026-01-01','2026-04-30 13:51:29'),(30,1,'Fixed',60.00,'2026-01-01','2026-04-30 13:51:29'),(30,15,'Fixed',120.00,'2026-01-01','2026-04-30 13:51:29');
/*!40000 ALTER TABLE `employee_allowances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_deductions`
--

DROP TABLE IF EXISTS `employee_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_deductions` (
  `employee_id` int NOT NULL,
  `deduction_id` int NOT NULL,
  `calc_type` enum('Fixed','Percentage') NOT NULL DEFAULT 'Fixed',
  `amount` decimal(10,2) NOT NULL,
  `effective_date` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`,`deduction_id`),
  KEY `deduction_id` (`deduction_id`),
  CONSTRAINT `employee_deductions_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_deductions_ibfk_2` FOREIGN KEY (`deduction_id`) REFERENCES `deductions` (`deduction_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_deductions`
--

LOCK TABLES `employee_deductions` WRITE;
/*!40000 ALTER TABLE `employee_deductions` DISABLE KEYS */;
INSERT INTO `employee_deductions` VALUES (1,1,'Percentage',12.00,'2026-01-01','2026-04-30 13:51:29'),(1,5,'Percentage',6.20,'2026-01-01','2026-04-30 13:51:29'),(2,1,'Percentage',12.00,'2026-01-01','2026-04-30 13:51:29'),(2,6,'Percentage',1.45,'2026-01-01','2026-04-30 13:51:29'),(3,1,'Percentage',12.00,'2026-01-01','2026-04-30 13:51:29'),(3,7,'Fixed',120.00,'2026-01-01','2026-04-30 13:51:29'),(4,2,'Percentage',5.00,'2026-01-01','2026-04-30 13:51:29'),(4,8,'Fixed',50.00,'2026-01-01','2026-04-30 13:51:29'),(5,3,'Percentage',3.00,'2026-01-01','2026-04-30 13:51:29'),(5,9,'Fixed',40.00,'2026-01-01','2026-04-30 13:51:29'),(6,1,'Fixed',50.00,'2026-04-01','2026-04-30 13:51:29'),(6,5,'Percentage',6.20,'2026-04-01','2026-04-30 13:51:29'),(6,14,'Fixed',100.00,'2026-04-01','2026-04-30 13:51:29'),(7,2,'Fixed',45.00,'2026-04-01','2026-04-30 13:51:29'),(7,6,'Percentage',1.45,'2026-04-01','2026-04-30 13:51:29'),(7,15,'Fixed',80.00,'2026-04-01','2026-04-30 13:51:29'),(8,1,'Fixed',55.00,'2026-04-01','2026-04-30 13:51:29'),(8,7,'Fixed',100.00,'2026-04-01','2026-04-30 13:51:29'),(8,16,'Fixed',90.00,'2026-04-01','2026-04-30 13:51:29'),(9,1,'Fixed',60.00,'2026-04-01','2026-04-30 13:51:29'),(9,10,'Fixed',75.00,'2026-04-01','2026-04-30 13:51:29'),(9,17,'Fixed',110.00,'2026-04-01','2026-04-30 13:51:29'),(10,1,'Percentage',10.00,'2026-01-01','2026-04-30 13:51:29'),(10,11,'Percentage',5.00,'2026-01-01','2026-04-30 13:51:29'),(10,18,'Fixed',120.00,'2026-04-01','2026-04-30 13:51:29'),(11,5,'Percentage',6.20,'2026-01-01','2026-04-30 13:51:29'),(11,12,'Fixed',150.00,'2026-01-01','2026-04-30 13:51:29'),(11,19,'Fixed',95.00,'2026-04-01','2026-04-30 13:51:29'),(12,6,'Percentage',1.45,'2026-01-01','2026-04-30 13:51:29'),(12,13,'Fixed',100.00,'2026-01-01','2026-04-30 13:51:29'),(12,20,'Fixed',85.00,'2026-04-01','2026-04-30 13:51:29'),(13,1,'Percentage',12.00,'2026-01-01','2026-04-30 13:51:29'),(13,12,'Fixed',130.00,'2026-04-01','2026-04-30 13:51:29'),(13,14,'Fixed',200.00,'2026-01-01','2026-04-30 13:51:29'),(14,2,'Percentage',5.00,'2026-01-01','2026-04-30 13:51:29'),(14,13,'Fixed',90.00,'2026-04-01','2026-04-30 13:51:29'),(14,15,'Fixed',80.00,'2026-01-01','2026-04-30 13:51:29'),(15,3,'Percentage',3.00,'2026-01-01','2026-04-30 13:51:29'),(15,14,'Fixed',150.00,'2026-04-01','2026-04-30 13:51:29'),(15,16,'Fixed',60.00,'2026-01-01','2026-04-30 13:51:29'),(16,5,'Percentage',6.20,'2026-01-01','2026-04-30 13:51:29'),(16,15,'Fixed',80.00,'2026-04-01','2026-04-30 13:51:29'),(16,17,'Fixed',120.00,'2026-01-01','2026-04-30 13:51:29'),(17,6,'Percentage',1.45,'2026-01-01','2026-04-30 13:51:29'),(17,16,'Fixed',100.00,'2026-04-01','2026-04-30 13:51:29'),(17,18,'Fixed',90.00,'2026-01-01','2026-04-30 13:51:29'),(18,1,'Percentage',12.00,'2026-01-01','2026-04-30 13:51:29'),(18,17,'Fixed',110.00,'2026-04-01','2026-04-30 13:51:29'),(18,19,'Fixed',110.00,'2026-01-01','2026-04-30 13:51:29'),(19,2,'Percentage',5.00,'2026-01-01','2026-04-30 13:51:29'),(19,18,'Fixed',120.00,'2026-04-01','2026-04-30 13:51:29'),(19,20,'Fixed',70.00,'2026-01-01','2026-04-30 13:51:29'),(20,3,'Percentage',3.00,'2026-01-01','2026-04-30 13:51:29'),(20,12,'Fixed',130.00,'2026-01-01','2026-04-30 13:51:29'),(20,19,'Fixed',95.00,'2026-04-01','2026-04-30 13:51:29'),(21,1,'Percentage',10.00,'2026-01-01','2026-04-30 13:51:29'),(21,13,'Fixed',90.00,'2026-01-01','2026-04-30 13:51:29'),(21,20,'Fixed',85.00,'2026-04-01','2026-04-30 13:51:29'),(22,5,'Percentage',6.20,'2026-01-01','2026-04-30 13:51:29'),(22,12,'Fixed',130.00,'2026-04-01','2026-04-30 13:51:29'),(22,14,'Fixed',150.00,'2026-01-01','2026-04-30 13:51:29'),(23,6,'Percentage',1.45,'2026-01-01','2026-04-30 13:51:29'),(23,13,'Fixed',90.00,'2026-04-01','2026-04-30 13:51:29'),(23,15,'Fixed',80.00,'2026-01-01','2026-04-30 13:51:29'),(24,1,'Percentage',12.00,'2026-01-01','2026-04-30 13:51:29'),(24,14,'Fixed',150.00,'2026-04-01','2026-04-30 13:51:29'),(24,16,'Fixed',100.00,'2026-01-01','2026-04-30 13:51:29'),(25,2,'Percentage',5.00,'2026-01-01','2026-04-30 13:51:29'),(25,15,'Fixed',80.00,'2026-04-01','2026-04-30 13:51:29'),(25,17,'Fixed',110.00,'2026-01-01','2026-04-30 13:51:29'),(26,3,'Percentage',3.00,'2026-01-01','2026-04-30 13:51:29'),(26,18,'Fixed',120.00,'2026-01-01','2026-04-30 13:51:29'),(27,5,'Percentage',6.20,'2026-01-01','2026-04-30 13:51:29'),(27,19,'Fixed',95.00,'2026-01-01','2026-04-30 13:51:29'),(28,6,'Percentage',1.45,'2026-01-01','2026-04-30 13:51:29'),(28,20,'Fixed',85.00,'2026-01-01','2026-04-30 13:51:29'),(29,1,'Percentage',12.00,'2026-01-01','2026-04-30 13:51:29'),(29,12,'Fixed',130.00,'2026-01-01','2026-04-30 13:51:29'),(30,2,'Percentage',5.00,'2026-01-01','2026-04-30 13:51:29'),(30,13,'Fixed',90.00,'2026-01-01','2026-04-30 13:51:29');
/*!40000 ALTER TABLE `employee_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_licenses`
--

DROP TABLE IF EXISTS `employee_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_licenses` (
  `license_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `license_type` varchar(100) NOT NULL,
  `license_number` varchar(100) NOT NULL,
  `issuing_state` varchar(50) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expiration_date` date NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '1',
  `verified_at` datetime DEFAULT NULL,
  `verified_by_user_id` int DEFAULT NULL,
  `status` enum('Active','Expired','Suspended','Revoked') NOT NULL DEFAULT 'Active',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`license_id`),
  KEY `idx_el_employee_id` (`employee_id`),
  KEY `idx_el_verified_by` (`verified_by_user_id`),
  CONSTRAINT `fk_el_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_el_verifier` FOREIGN KEY (`verified_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_licenses`
--

LOCK TABLES `employee_licenses` WRITE;
/*!40000 ALTER TABLE `employee_licenses` DISABLE KEYS */;
INSERT INTO `employee_licenses` VALUES (1,1,'MD','MD1001',NULL,NULL,'2027-01-10',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(2,2,'MD','MD1002',NULL,NULL,'2027-03-15',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(3,3,'MD','MD1003',NULL,NULL,'2027-06-20',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(4,4,'MD','MD1004',NULL,NULL,'2027-02-10',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(5,5,'MD','MD1005',NULL,NULL,'2027-05-12',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(6,6,'MD','MD1006',NULL,NULL,'2027-09-10',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(7,7,'MD','MD1007',NULL,NULL,'2027-11-12',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(8,8,'MD','MD1008',NULL,NULL,'2027-01-20',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(9,9,'MD','MD1009',NULL,NULL,'2027-03-08',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(10,10,'RN','RN2001',NULL,NULL,'2027-07-01',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(11,11,'RN','RN2002',NULL,NULL,'2027-08-15',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(12,12,'RN','RN2003',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(13,13,'RN','RN2004',NULL,NULL,'2027-12-01',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(14,14,'RN','RN2005',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(15,15,'RN','RN2006',NULL,NULL,'2027-04-11',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(16,16,'LPN','LPN3001',NULL,NULL,'2027-02-14',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(17,17,'LPN','LPN3002',NULL,NULL,'2027-03-18',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(18,18,'LPN','LPN3003',NULL,NULL,'2027-04-10',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(19,19,'APRN','NP4001',NULL,NULL,'2027-05-05',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(20,20,'APRN','NP4002',NULL,NULL,'2027-06-06',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(21,21,'APRN','NP4003',NULL,NULL,'2027-07-07',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(22,22,'PA-C','PA5001',NULL,NULL,'2027-08-08',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(23,23,'PA-C','PA5002',NULL,NULL,'2027-09-09',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(24,24,'PA-C','PA5003',NULL,NULL,'2027-10-10',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(25,32,'RRT','RRT6001',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(26,33,'RRT','RRT6002',NULL,NULL,'2027-07-19',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(27,34,'PT','PT7001',NULL,NULL,'2027-08-20',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(28,35,'OTR','OT8001',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(29,36,'SLP','SLP9001',NULL,NULL,'2027-10-22',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(30,41,'MD','PATH1001',NULL,NULL,'2027-03-27',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(31,45,'MD','RAD1101',NULL,NULL,'2027-07-03',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(32,49,'PharmD','PH5001',NULL,NULL,'2027-11-07',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(33,50,'PharmD','PH5002',NULL,NULL,'2027-12-08',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(34,51,'CPhT','CPHT1201',NULL,NULL,'2027-01-09',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(35,59,'RD','RD1301',NULL,NULL,'2027-09-17',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(36,77,'RN','RN2007',NULL,NULL,'2027-11-29',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(37,78,'RN','RN2008',NULL,NULL,'2028-01-30',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(38,81,'RN','RN2009',NULL,NULL,'2028-04-01',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(39,82,'RN','RN2010',NULL,NULL,'2028-04-02',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(40,85,'PA-C','PA5004',NULL,NULL,'2028-04-05',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(41,86,'APRN','NP4004',NULL,NULL,'2028-04-06',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(42,91,'PharmD','PH5003',NULL,NULL,'2028-04-11',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(43,92,'CPhT','CPHT1202',NULL,NULL,'2028-04-12',1,NULL,NULL,'Active','2026-05-16 16:41:52'),(64,1,'MD','MD1001',NULL,NULL,'2027-01-10',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(65,2,'MD','MD1002',NULL,NULL,'2027-03-15',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(66,3,'MD','MD1003',NULL,NULL,'2027-06-20',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(67,4,'MD','MD1004',NULL,NULL,'2027-02-10',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(68,5,'MD','MD1005',NULL,NULL,'2027-05-12',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(69,6,'MD','MD1006',NULL,NULL,'2027-09-10',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(70,7,'MD','MD1007',NULL,NULL,'2027-11-12',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(71,8,'MD','MD1008',NULL,NULL,'2027-01-20',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(72,9,'MD','MD1009',NULL,NULL,'2027-03-08',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(73,10,'RN','RN2001',NULL,NULL,'2027-07-01',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(74,11,'RN','RN2002',NULL,NULL,'2027-08-15',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(75,12,'RN','RN2003',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(76,13,'RN','RN2004',NULL,NULL,'2027-12-01',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(77,14,'RN','RN2005',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(78,15,'RN','RN2006',NULL,NULL,'2027-04-11',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(79,16,'LPN','LPN3001',NULL,NULL,'2027-02-14',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(80,17,'LPN','LPN3002',NULL,NULL,'2027-03-18',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(81,18,'LPN','LPN3003',NULL,NULL,'2027-04-10',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(82,19,'APRN','NP4001',NULL,NULL,'2027-05-05',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(83,20,'APRN','NP4002',NULL,NULL,'2027-06-06',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(84,21,'APRN','NP4003',NULL,NULL,'2027-07-07',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(85,22,'PA-C','PA5001',NULL,NULL,'2027-08-08',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(86,23,'PA-C','PA5002',NULL,NULL,'2027-09-09',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(87,24,'PA-C','PA5003',NULL,NULL,'2027-10-10',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(88,32,'RRT','RRT6001',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(89,33,'RRT','RRT6002',NULL,NULL,'2027-07-19',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(90,34,'PT','PT7001',NULL,NULL,'2027-08-20',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(91,35,'OTR','OT8001',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(92,36,'SLP','SLP9001',NULL,NULL,'2027-10-22',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(93,41,'MD','PATH1001',NULL,NULL,'2027-03-27',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(94,45,'MD','RAD1101',NULL,NULL,'2027-07-03',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(95,49,'PharmD','PH5001',NULL,NULL,'2027-11-07',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(96,50,'PharmD','PH5002',NULL,NULL,'2027-12-08',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(97,51,'CPhT','CPHT1201',NULL,NULL,'2027-01-09',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(98,59,'RD','RD1301',NULL,NULL,'2027-09-17',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(99,77,'RN','RN2007',NULL,NULL,'2027-11-29',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(100,78,'RN','RN2008',NULL,NULL,'2028-01-30',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(101,81,'RN','RN2009',NULL,NULL,'2028-04-01',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(102,82,'RN','RN2010',NULL,NULL,'2028-04-02',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(103,85,'PA-C','PA5004',NULL,NULL,'2028-04-05',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(104,86,'APRN','NP4004',NULL,NULL,'2028-04-06',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(105,91,'PharmD','PH5003',NULL,NULL,'2028-04-11',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(106,92,'CPhT','CPHT1202',NULL,NULL,'2028-04-12',1,NULL,NULL,'Active','2026-05-16 16:44:10'),(127,1,'MD','MD1001',NULL,NULL,'2027-01-10',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(128,2,'MD','MD1002',NULL,NULL,'2027-03-15',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(129,3,'MD','MD1003',NULL,NULL,'2027-06-20',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(130,4,'MD','MD1004',NULL,NULL,'2027-02-10',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(131,5,'MD','MD1005',NULL,NULL,'2027-05-12',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(132,6,'MD','MD1006',NULL,NULL,'2027-09-10',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(133,7,'MD','MD1007',NULL,NULL,'2027-11-12',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(134,8,'MD','MD1008',NULL,NULL,'2027-01-20',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(135,9,'MD','MD1009',NULL,NULL,'2027-03-08',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(136,10,'RN','RN2001',NULL,NULL,'2027-07-01',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(137,11,'RN','RN2002',NULL,NULL,'2027-08-15',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(138,12,'RN','RN2003',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(139,13,'RN','RN2004',NULL,NULL,'2027-12-01',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(140,14,'RN','RN2005',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(141,15,'RN','RN2006',NULL,NULL,'2027-04-11',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(142,16,'LPN','LPN3001',NULL,NULL,'2027-02-14',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(143,17,'LPN','LPN3002',NULL,NULL,'2027-03-18',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(144,18,'LPN','LPN3003',NULL,NULL,'2027-04-10',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(145,19,'APRN','NP4001',NULL,NULL,'2027-05-05',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(146,20,'APRN','NP4002',NULL,NULL,'2027-06-06',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(147,21,'APRN','NP4003',NULL,NULL,'2027-07-07',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(148,22,'PA-C','PA5001',NULL,NULL,'2027-08-08',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(149,23,'PA-C','PA5002',NULL,NULL,'2027-09-09',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(150,24,'PA-C','PA5003',NULL,NULL,'2027-10-10',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(151,32,'RRT','RRT6001',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(152,33,'RRT','RRT6002',NULL,NULL,'2027-07-19',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(153,34,'PT','PT7001',NULL,NULL,'2027-08-20',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(154,35,'OTR','OT8001',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(155,36,'SLP','SLP9001',NULL,NULL,'2027-10-22',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(156,41,'MD','PATH1001',NULL,NULL,'2027-03-27',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(157,45,'MD','RAD1101',NULL,NULL,'2027-07-03',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(158,49,'PharmD','PH5001',NULL,NULL,'2027-11-07',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(159,50,'PharmD','PH5002',NULL,NULL,'2027-12-08',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(160,51,'CPhT','CPHT1201',NULL,NULL,'2027-01-09',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(161,59,'RD','RD1301',NULL,NULL,'2027-09-17',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(162,77,'RN','RN2007',NULL,NULL,'2027-11-29',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(163,78,'RN','RN2008',NULL,NULL,'2028-01-30',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(164,81,'RN','RN2009',NULL,NULL,'2028-04-01',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(165,82,'RN','RN2010',NULL,NULL,'2028-04-02',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(166,85,'PA-C','PA5004',NULL,NULL,'2028-04-05',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(167,86,'APRN','NP4004',NULL,NULL,'2028-04-06',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(168,91,'PharmD','PH5003',NULL,NULL,'2028-04-11',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(169,92,'CPhT','CPHT1202',NULL,NULL,'2028-04-12',1,NULL,NULL,'Active','2026-05-16 16:49:41'),(190,1,'MD','MD1001',NULL,NULL,'2027-01-10',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(191,2,'MD','MD1002',NULL,NULL,'2027-03-15',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(192,3,'MD','MD1003',NULL,NULL,'2027-06-20',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(193,4,'MD','MD1004',NULL,NULL,'2027-02-10',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(194,5,'MD','MD1005',NULL,NULL,'2027-05-12',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(195,6,'MD','MD1006',NULL,NULL,'2027-09-10',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(196,7,'MD','MD1007',NULL,NULL,'2027-11-12',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(197,8,'MD','MD1008',NULL,NULL,'2027-01-20',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(198,9,'MD','MD1009',NULL,NULL,'2027-03-08',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(199,10,'RN','RN2001',NULL,NULL,'2027-07-01',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(200,11,'RN','RN2002',NULL,NULL,'2027-08-15',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(201,12,'RN','RN2003',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(202,13,'RN','RN2004',NULL,NULL,'2027-12-01',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(203,14,'RN','RN2005',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(204,15,'RN','RN2006',NULL,NULL,'2027-04-11',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(205,16,'LPN','LPN3001',NULL,NULL,'2027-02-14',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(206,17,'LPN','LPN3002',NULL,NULL,'2027-03-18',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(207,18,'LPN','LPN3003',NULL,NULL,'2027-04-10',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(208,19,'APRN','NP4001',NULL,NULL,'2027-05-05',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(209,20,'APRN','NP4002',NULL,NULL,'2027-06-06',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(210,21,'APRN','NP4003',NULL,NULL,'2027-07-07',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(211,22,'PA-C','PA5001',NULL,NULL,'2027-08-08',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(212,23,'PA-C','PA5002',NULL,NULL,'2027-09-09',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(213,24,'PA-C','PA5003',NULL,NULL,'2027-10-10',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(214,32,'RRT','RRT6001',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(215,33,'RRT','RRT6002',NULL,NULL,'2027-07-19',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(216,34,'PT','PT7001',NULL,NULL,'2027-08-20',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(217,35,'OTR','OT8001',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(218,36,'SLP','SLP9001',NULL,NULL,'2027-10-22',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(219,41,'MD','PATH1001',NULL,NULL,'2027-03-27',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(220,45,'MD','RAD1101',NULL,NULL,'2027-07-03',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(221,49,'PharmD','PH5001',NULL,NULL,'2027-11-07',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(222,50,'PharmD','PH5002',NULL,NULL,'2027-12-08',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(223,51,'CPhT','CPHT1201',NULL,NULL,'2027-01-09',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(224,59,'RD','RD1301',NULL,NULL,'2027-09-17',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(225,77,'RN','RN2007',NULL,NULL,'2027-11-29',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(226,78,'RN','RN2008',NULL,NULL,'2028-01-30',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(227,81,'RN','RN2009',NULL,NULL,'2028-04-01',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(228,82,'RN','RN2010',NULL,NULL,'2028-04-02',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(229,85,'PA-C','PA5004',NULL,NULL,'2028-04-05',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(230,86,'APRN','NP4004',NULL,NULL,'2028-04-06',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(231,91,'PharmD','PH5003',NULL,NULL,'2028-04-11',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(232,92,'CPhT','CPHT1202',NULL,NULL,'2028-04-12',1,NULL,NULL,'Active','2026-05-16 16:51:07'),(253,1,'MD','MD1001',NULL,NULL,'2027-01-10',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(254,2,'MD','MD1002',NULL,NULL,'2027-03-15',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(255,3,'MD','MD1003',NULL,NULL,'2027-06-20',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(256,4,'MD','MD1004',NULL,NULL,'2027-02-10',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(257,5,'MD','MD1005',NULL,NULL,'2027-05-12',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(258,6,'MD','MD1006',NULL,NULL,'2027-09-10',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(259,7,'MD','MD1007',NULL,NULL,'2027-11-12',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(260,8,'MD','MD1008',NULL,NULL,'2027-01-20',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(261,9,'MD','MD1009',NULL,NULL,'2027-03-08',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(262,10,'RN','RN2001',NULL,NULL,'2027-07-01',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(263,11,'RN','RN2002',NULL,NULL,'2027-08-15',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(264,12,'RN','RN2003',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(265,13,'RN','RN2004',NULL,NULL,'2027-12-01',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(266,14,'RN','RN2005',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(267,15,'RN','RN2006',NULL,NULL,'2027-04-11',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(268,16,'LPN','LPN3001',NULL,NULL,'2027-02-14',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(269,17,'LPN','LPN3002',NULL,NULL,'2027-03-18',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(270,18,'LPN','LPN3003',NULL,NULL,'2027-04-10',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(271,19,'APRN','NP4001',NULL,NULL,'2027-05-05',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(272,20,'APRN','NP4002',NULL,NULL,'2027-06-06',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(273,21,'APRN','NP4003',NULL,NULL,'2027-07-07',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(274,22,'PA-C','PA5001',NULL,NULL,'2027-08-08',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(275,23,'PA-C','PA5002',NULL,NULL,'2027-09-09',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(276,24,'PA-C','PA5003',NULL,NULL,'2027-10-10',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(277,32,'RRT','RRT6001',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(278,33,'RRT','RRT6002',NULL,NULL,'2027-07-19',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(279,34,'PT','PT7001',NULL,NULL,'2027-08-20',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(280,35,'OTR','OT8001',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(281,36,'SLP','SLP9001',NULL,NULL,'2027-10-22',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(282,41,'MD','PATH1001',NULL,NULL,'2027-03-27',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(283,45,'MD','RAD1101',NULL,NULL,'2027-07-03',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(284,49,'PharmD','PH5001',NULL,NULL,'2027-11-07',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(285,50,'PharmD','PH5002',NULL,NULL,'2027-12-08',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(286,51,'CPhT','CPHT1201',NULL,NULL,'2027-01-09',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(287,59,'RD','RD1301',NULL,NULL,'2027-09-17',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(288,77,'RN','RN2007',NULL,NULL,'2027-11-29',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(289,78,'RN','RN2008',NULL,NULL,'2028-01-30',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(290,81,'RN','RN2009',NULL,NULL,'2028-04-01',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(291,82,'RN','RN2010',NULL,NULL,'2028-04-02',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(292,85,'PA-C','PA5004',NULL,NULL,'2028-04-05',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(293,86,'APRN','NP4004',NULL,NULL,'2028-04-06',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(294,91,'PharmD','PH5003',NULL,NULL,'2028-04-11',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(295,92,'CPhT','CPHT1202',NULL,NULL,'2028-04-12',1,NULL,NULL,'Active','2026-05-16 16:53:00'),(316,1,'MD','MD1001',NULL,NULL,'2027-01-10',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(317,2,'MD','MD1002',NULL,NULL,'2027-03-15',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(318,3,'MD','MD1003',NULL,NULL,'2027-06-20',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(319,4,'MD','MD1004',NULL,NULL,'2027-02-10',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(320,5,'MD','MD1005',NULL,NULL,'2027-05-12',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(321,6,'MD','MD1006',NULL,NULL,'2027-09-10',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(322,7,'MD','MD1007',NULL,NULL,'2027-11-12',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(323,8,'MD','MD1008',NULL,NULL,'2027-01-20',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(324,9,'MD','MD1009',NULL,NULL,'2027-03-08',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(325,10,'RN','RN2001',NULL,NULL,'2027-07-01',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(326,11,'RN','RN2002',NULL,NULL,'2027-08-15',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(327,12,'RN','RN2003',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(328,13,'RN','RN2004',NULL,NULL,'2027-12-01',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(329,14,'RN','RN2005',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(330,15,'RN','RN2006',NULL,NULL,'2027-04-11',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(331,16,'LPN','LPN3001',NULL,NULL,'2027-02-14',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(332,17,'LPN','LPN3002',NULL,NULL,'2027-03-18',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(333,18,'LPN','LPN3003',NULL,NULL,'2027-04-10',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(334,19,'APRN','NP4001',NULL,NULL,'2027-05-05',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(335,20,'APRN','NP4002',NULL,NULL,'2027-06-06',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(336,21,'APRN','NP4003',NULL,NULL,'2027-07-07',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(337,22,'PA-C','PA5001',NULL,NULL,'2027-08-08',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(338,23,'PA-C','PA5002',NULL,NULL,'2027-09-09',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(339,24,'PA-C','PA5003',NULL,NULL,'2027-10-10',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(340,32,'RRT','RRT6001',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(341,33,'RRT','RRT6002',NULL,NULL,'2027-07-19',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(342,34,'PT','PT7001',NULL,NULL,'2027-08-20',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(343,35,'OTR','OT8001',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(344,36,'SLP','SLP9001',NULL,NULL,'2027-10-22',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(345,41,'MD','PATH1001',NULL,NULL,'2027-03-27',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(346,45,'MD','RAD1101',NULL,NULL,'2027-07-03',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(347,49,'PharmD','PH5001',NULL,NULL,'2027-11-07',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(348,50,'PharmD','PH5002',NULL,NULL,'2027-12-08',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(349,51,'CPhT','CPHT1201',NULL,NULL,'2027-01-09',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(350,59,'RD','RD1301',NULL,NULL,'2027-09-17',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(351,77,'RN','RN2007',NULL,NULL,'2027-11-29',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(352,78,'RN','RN2008',NULL,NULL,'2028-01-30',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(353,81,'RN','RN2009',NULL,NULL,'2028-04-01',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(354,82,'RN','RN2010',NULL,NULL,'2028-04-02',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(355,85,'PA-C','PA5004',NULL,NULL,'2028-04-05',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(356,86,'APRN','NP4004',NULL,NULL,'2028-04-06',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(357,91,'PharmD','PH5003',NULL,NULL,'2028-04-11',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(358,92,'CPhT','CPHT1202',NULL,NULL,'2028-04-12',1,NULL,NULL,'Active','2026-05-16 16:57:45'),(379,1,'MD','MD1001',NULL,NULL,'2027-01-10',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(380,2,'MD','MD1002',NULL,NULL,'2027-03-15',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(381,3,'MD','MD1003',NULL,NULL,'2027-06-20',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(382,4,'MD','MD1004',NULL,NULL,'2027-02-10',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(383,5,'MD','MD1005',NULL,NULL,'2027-05-12',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(384,6,'MD','MD1006',NULL,NULL,'2027-09-10',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(385,7,'MD','MD1007',NULL,NULL,'2027-11-12',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(386,8,'MD','MD1008',NULL,NULL,'2027-01-20',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(387,9,'MD','MD1009',NULL,NULL,'2027-03-08',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(388,10,'RN','RN2001',NULL,NULL,'2027-07-01',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(389,11,'RN','RN2002',NULL,NULL,'2027-08-15',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(390,12,'RN','RN2003',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(391,13,'RN','RN2004',NULL,NULL,'2027-12-01',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(392,14,'RN','RN2005',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(393,15,'RN','RN2006',NULL,NULL,'2027-04-11',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(394,16,'LPN','LPN3001',NULL,NULL,'2027-02-14',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(395,17,'LPN','LPN3002',NULL,NULL,'2027-03-18',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(396,18,'LPN','LPN3003',NULL,NULL,'2027-04-10',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(397,19,'APRN','NP4001',NULL,NULL,'2027-05-05',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(398,20,'APRN','NP4002',NULL,NULL,'2027-06-06',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(399,21,'APRN','NP4003',NULL,NULL,'2027-07-07',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(400,22,'PA-C','PA5001',NULL,NULL,'2027-08-08',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(401,23,'PA-C','PA5002',NULL,NULL,'2027-09-09',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(402,24,'PA-C','PA5003',NULL,NULL,'2027-10-10',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(403,32,'RRT','RRT6001',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(404,33,'RRT','RRT6002',NULL,NULL,'2027-07-19',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(405,34,'PT','PT7001',NULL,NULL,'2027-08-20',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(406,35,'OTR','OT8001',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(407,36,'SLP','SLP9001',NULL,NULL,'2027-10-22',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(408,41,'MD','PATH1001',NULL,NULL,'2027-03-27',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(409,45,'MD','RAD1101',NULL,NULL,'2027-07-03',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(410,49,'PharmD','PH5001',NULL,NULL,'2027-11-07',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(411,50,'PharmD','PH5002',NULL,NULL,'2027-12-08',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(412,51,'CPhT','CPHT1201',NULL,NULL,'2027-01-09',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(413,59,'RD','RD1301',NULL,NULL,'2027-09-17',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(414,77,'RN','RN2007',NULL,NULL,'2027-11-29',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(415,78,'RN','RN2008',NULL,NULL,'2028-01-30',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(416,81,'RN','RN2009',NULL,NULL,'2028-04-01',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(417,82,'RN','RN2010',NULL,NULL,'2028-04-02',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(418,85,'PA-C','PA5004',NULL,NULL,'2028-04-05',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(419,86,'APRN','NP4004',NULL,NULL,'2028-04-06',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(420,91,'PharmD','PH5003',NULL,NULL,'2028-04-11',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(421,92,'CPhT','CPHT1202',NULL,NULL,'2028-04-12',1,NULL,NULL,'Active','2026-05-16 17:03:29'),(442,1,'MD','MD1001',NULL,NULL,'2027-01-10',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(443,2,'MD','MD1002',NULL,NULL,'2027-03-15',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(444,3,'MD','MD1003',NULL,NULL,'2027-06-20',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(445,4,'MD','MD1004',NULL,NULL,'2027-02-10',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(446,5,'MD','MD1005',NULL,NULL,'2027-05-12',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(447,6,'MD','MD1006',NULL,NULL,'2027-09-10',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(448,7,'MD','MD1007',NULL,NULL,'2027-11-12',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(449,8,'MD','MD1008',NULL,NULL,'2027-01-20',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(450,9,'MD','MD1009',NULL,NULL,'2027-03-08',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(451,10,'RN','RN2001',NULL,NULL,'2027-07-01',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(452,11,'RN','RN2002',NULL,NULL,'2027-08-15',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(453,12,'RN','RN2003',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(454,13,'RN','RN2004',NULL,NULL,'2027-12-01',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(455,14,'RN','RN2005',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(456,15,'RN','RN2006',NULL,NULL,'2027-04-11',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(457,16,'LPN','LPN3001',NULL,NULL,'2027-02-14',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(458,17,'LPN','LPN3002',NULL,NULL,'2027-03-18',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(459,18,'LPN','LPN3003',NULL,NULL,'2027-04-10',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(460,19,'APRN','NP4001',NULL,NULL,'2027-05-05',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(461,20,'APRN','NP4002',NULL,NULL,'2027-06-06',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(462,21,'APRN','NP4003',NULL,NULL,'2027-07-07',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(463,22,'PA-C','PA5001',NULL,NULL,'2027-08-08',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(464,23,'PA-C','PA5002',NULL,NULL,'2027-09-09',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(465,24,'PA-C','PA5003',NULL,NULL,'2027-10-10',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(466,32,'RRT','RRT6001',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(467,33,'RRT','RRT6002',NULL,NULL,'2027-07-19',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(468,34,'PT','PT7001',NULL,NULL,'2027-08-20',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(469,35,'OTR','OT8001',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(470,36,'SLP','SLP9001',NULL,NULL,'2027-10-22',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(471,41,'MD','PATH1001',NULL,NULL,'2027-03-27',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(472,45,'MD','RAD1101',NULL,NULL,'2027-07-03',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(473,49,'PharmD','PH5001',NULL,NULL,'2027-11-07',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(474,50,'PharmD','PH5002',NULL,NULL,'2027-12-08',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(475,51,'CPhT','CPHT1201',NULL,NULL,'2027-01-09',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(476,59,'RD','RD1301',NULL,NULL,'2027-09-17',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(477,77,'RN','RN2007',NULL,NULL,'2027-11-29',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(478,78,'RN','RN2008',NULL,NULL,'2028-01-30',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(479,81,'RN','RN2009',NULL,NULL,'2028-04-01',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(480,82,'RN','RN2010',NULL,NULL,'2028-04-02',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(481,85,'PA-C','PA5004',NULL,NULL,'2028-04-05',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(482,86,'APRN','NP4004',NULL,NULL,'2028-04-06',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(483,91,'PharmD','PH5003',NULL,NULL,'2028-04-11',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(484,92,'CPhT','CPHT1202',NULL,NULL,'2028-04-12',1,NULL,NULL,'Active','2026-05-16 17:05:24'),(505,1,'MD','MD1001',NULL,NULL,'2027-01-10',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(506,2,'MD','MD1002',NULL,NULL,'2027-03-15',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(507,3,'MD','MD1003',NULL,NULL,'2027-06-20',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(508,4,'MD','MD1004',NULL,NULL,'2027-02-10',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(509,5,'MD','MD1005',NULL,NULL,'2027-05-12',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(510,6,'MD','MD1006',NULL,NULL,'2027-09-10',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(511,7,'MD','MD1007',NULL,NULL,'2027-11-12',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(512,8,'MD','MD1008',NULL,NULL,'2027-01-20',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(513,9,'MD','MD1009',NULL,NULL,'2027-03-08',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(514,10,'RN','RN2001',NULL,NULL,'2027-07-01',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(515,11,'RN','RN2002',NULL,NULL,'2027-08-15',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(516,12,'RN','RN2003',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(517,13,'RN','RN2004',NULL,NULL,'2027-12-01',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(518,14,'RN','RN2005',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(519,15,'RN','RN2006',NULL,NULL,'2027-04-11',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(520,16,'LPN','LPN3001',NULL,NULL,'2027-02-14',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(521,17,'LPN','LPN3002',NULL,NULL,'2027-03-18',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(522,18,'LPN','LPN3003',NULL,NULL,'2027-04-10',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(523,19,'APRN','NP4001',NULL,NULL,'2027-05-05',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(524,20,'APRN','NP4002',NULL,NULL,'2027-06-06',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(525,21,'APRN','NP4003',NULL,NULL,'2027-07-07',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(526,22,'PA-C','PA5001',NULL,NULL,'2027-08-08',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(527,23,'PA-C','PA5002',NULL,NULL,'2027-09-09',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(528,24,'PA-C','PA5003',NULL,NULL,'2027-10-10',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(529,32,'RRT','RRT6001',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(530,33,'RRT','RRT6002',NULL,NULL,'2027-07-19',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(531,34,'PT','PT7001',NULL,NULL,'2027-08-20',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(532,35,'OTR','OT8001',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(533,36,'SLP','SLP9001',NULL,NULL,'2027-10-22',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(534,41,'MD','PATH1001',NULL,NULL,'2027-03-27',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(535,45,'MD','RAD1101',NULL,NULL,'2027-07-03',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(536,49,'PharmD','PH5001',NULL,NULL,'2027-11-07',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(537,50,'PharmD','PH5002',NULL,NULL,'2027-12-08',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(538,51,'CPhT','CPHT1201',NULL,NULL,'2027-01-09',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(539,59,'RD','RD1301',NULL,NULL,'2027-09-17',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(540,77,'RN','RN2007',NULL,NULL,'2027-11-29',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(541,78,'RN','RN2008',NULL,NULL,'2028-01-30',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(542,81,'RN','RN2009',NULL,NULL,'2028-04-01',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(543,82,'RN','RN2010',NULL,NULL,'2028-04-02',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(544,85,'PA-C','PA5004',NULL,NULL,'2028-04-05',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(545,86,'APRN','NP4004',NULL,NULL,'2028-04-06',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(546,91,'PharmD','PH5003',NULL,NULL,'2028-04-11',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(547,92,'CPhT','CPHT1202',NULL,NULL,'2028-04-12',1,NULL,NULL,'Active','2026-05-16 17:09:27'),(568,1,'MD','MD1001',NULL,NULL,'2027-01-10',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(569,2,'MD','MD1002',NULL,NULL,'2027-03-15',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(570,3,'MD','MD1003',NULL,NULL,'2027-06-20',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(571,4,'MD','MD1004',NULL,NULL,'2027-02-10',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(572,5,'MD','MD1005',NULL,NULL,'2027-05-12',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(573,6,'MD','MD1006',NULL,NULL,'2027-09-10',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(574,7,'MD','MD1007',NULL,NULL,'2027-11-12',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(575,8,'MD','MD1008',NULL,NULL,'2027-01-20',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(576,9,'MD','MD1009',NULL,NULL,'2027-03-08',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(577,10,'RN','RN2001',NULL,NULL,'2027-07-01',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(578,11,'RN','RN2002',NULL,NULL,'2027-08-15',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(579,12,'RN','RN2003',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(580,13,'RN','RN2004',NULL,NULL,'2027-12-01',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(581,14,'RN','RN2005',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(582,15,'RN','RN2006',NULL,NULL,'2027-04-11',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(583,16,'LPN','LPN3001',NULL,NULL,'2027-02-14',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(584,17,'LPN','LPN3002',NULL,NULL,'2027-03-18',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(585,18,'LPN','LPN3003',NULL,NULL,'2027-04-10',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(586,19,'APRN','NP4001',NULL,NULL,'2027-05-05',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(587,20,'APRN','NP4002',NULL,NULL,'2027-06-06',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(588,21,'APRN','NP4003',NULL,NULL,'2027-07-07',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(589,22,'PA-C','PA5001',NULL,NULL,'2027-08-08',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(590,23,'PA-C','PA5002',NULL,NULL,'2027-09-09',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(591,24,'PA-C','PA5003',NULL,NULL,'2027-10-10',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(592,32,'RRT','RRT6001',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(593,33,'RRT','RRT6002',NULL,NULL,'2027-07-19',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(594,34,'PT','PT7001',NULL,NULL,'2027-08-20',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(595,35,'OTR','OT8001',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(596,36,'SLP','SLP9001',NULL,NULL,'2027-10-22',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(597,41,'MD','PATH1001',NULL,NULL,'2027-03-27',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(598,45,'MD','RAD1101',NULL,NULL,'2027-07-03',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(599,49,'PharmD','PH5001',NULL,NULL,'2027-11-07',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(600,50,'PharmD','PH5002',NULL,NULL,'2027-12-08',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(601,51,'CPhT','CPHT1201',NULL,NULL,'2027-01-09',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(602,59,'RD','RD1301',NULL,NULL,'2027-09-17',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(603,77,'RN','RN2007',NULL,NULL,'2027-11-29',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(604,78,'RN','RN2008',NULL,NULL,'2028-01-30',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(605,81,'RN','RN2009',NULL,NULL,'2028-04-01',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(606,82,'RN','RN2010',NULL,NULL,'2028-04-02',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(607,85,'PA-C','PA5004',NULL,NULL,'2028-04-05',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(608,86,'APRN','NP4004',NULL,NULL,'2028-04-06',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(609,91,'PharmD','PH5003',NULL,NULL,'2028-04-11',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(610,92,'CPhT','CPHT1202',NULL,NULL,'2028-04-12',1,NULL,NULL,'Active','2026-05-16 17:10:36'),(631,1,'MD','MD1001',NULL,NULL,'2027-01-10',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(632,2,'MD','MD1002',NULL,NULL,'2027-03-15',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(633,3,'MD','MD1003',NULL,NULL,'2027-06-20',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(634,4,'MD','MD1004',NULL,NULL,'2027-02-10',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(635,5,'MD','MD1005',NULL,NULL,'2027-05-12',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(636,6,'MD','MD1006',NULL,NULL,'2027-09-10',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(637,7,'MD','MD1007',NULL,NULL,'2027-11-12',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(638,8,'MD','MD1008',NULL,NULL,'2027-01-20',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(639,9,'MD','MD1009',NULL,NULL,'2027-03-08',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(640,10,'RN','RN2001',NULL,NULL,'2027-07-01',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(641,11,'RN','RN2002',NULL,NULL,'2027-08-15',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(642,12,'RN','RN2003',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(643,13,'RN','RN2004',NULL,NULL,'2027-12-01',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(644,14,'RN','RN2005',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(645,15,'RN','RN2006',NULL,NULL,'2027-04-11',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(646,16,'LPN','LPN3001',NULL,NULL,'2027-02-14',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(647,17,'LPN','LPN3002',NULL,NULL,'2027-03-18',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(648,18,'LPN','LPN3003',NULL,NULL,'2027-04-10',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(649,19,'APRN','NP4001',NULL,NULL,'2027-05-05',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(650,20,'APRN','NP4002',NULL,NULL,'2027-06-06',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(651,21,'APRN','NP4003',NULL,NULL,'2027-07-07',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(652,22,'PA-C','PA5001',NULL,NULL,'2027-08-08',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(653,23,'PA-C','PA5002',NULL,NULL,'2027-09-09',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(654,24,'PA-C','PA5003',NULL,NULL,'2027-10-10',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(655,32,'RRT','RRT6001',NULL,NULL,'2027-06-18',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(656,33,'RRT','RRT6002',NULL,NULL,'2027-07-19',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(657,34,'PT','PT7001',NULL,NULL,'2027-08-20',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(658,35,'OTR','OT8001',NULL,NULL,'2027-09-21',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(659,36,'SLP','SLP9001',NULL,NULL,'2027-10-22',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(660,41,'MD','PATH1001',NULL,NULL,'2027-03-27',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(661,45,'MD','RAD1101',NULL,NULL,'2027-07-03',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(662,49,'PharmD','PH5001',NULL,NULL,'2027-11-07',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(663,50,'PharmD','PH5002',NULL,NULL,'2027-12-08',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(664,51,'CPhT','CPHT1201',NULL,NULL,'2027-01-09',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(665,59,'RD','RD1301',NULL,NULL,'2027-09-17',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(666,77,'RN','RN2007',NULL,NULL,'2027-11-29',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(667,78,'RN','RN2008',NULL,NULL,'2028-01-30',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(668,81,'RN','RN2009',NULL,NULL,'2028-04-01',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(669,82,'RN','RN2010',NULL,NULL,'2028-04-02',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(670,85,'PA-C','PA5004',NULL,NULL,'2028-04-05',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(671,86,'APRN','NP4004',NULL,NULL,'2028-04-06',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(672,91,'PharmD','PH5003',NULL,NULL,'2028-04-11',1,NULL,NULL,'Active','2026-05-16 17:16:24'),(673,92,'CPhT','CPHT1202',NULL,NULL,'2028-04-12',1,NULL,NULL,'Active','2026-05-16 17:16:24');
/*!40000 ALTER TABLE `employee_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_no` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `hire_date` date NOT NULL,
  `employment_type` enum('FT','PT','PRN','Contract') NOT NULL,
  `pay_type` enum('Hourly','Salary') NOT NULL,
  `pay_rate` decimal(10,2) DEFAULT NULL,
  `base_salary` decimal(10,2) DEFAULT NULL,
  `license_type` varchar(50) DEFAULT NULL COMMENT 'DEPRECATED: use employee_licenses',
  `license_number` varchar(50) DEFAULT NULL COMMENT 'DEPRECATED: use employee_licenses',
  `license_expiration` date DEFAULT NULL COMMENT 'DEPRECATED: use employee_licenses',
  `department_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_no` (`employee_no`),
  KEY `position_id` (`position_id`),
  KEY `idx_employee_department` (`department_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_employee_compensation` CHECK ((((`pay_type` = _utf8mb4'Hourly') and (`pay_rate` is not null) and (`base_salary` is null)) or ((`pay_type` = _utf8mb4'Salary') and (`base_salary` is not null) and (`pay_rate` is null))))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'E001','James',NULL,'Wilson','2018-01-10','FT','Salary',NULL,16800.00,'MD','MD1001','2027-01-10',9,1,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(2,'E002','Sophia',NULL,'Martinez','2019-03-15','FT','Salary',NULL,17200.00,'MD','MD1002','2027-03-15',1,2,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(3,'E003','Michael',NULL,'Brown','2020-06-20','FT','Salary',NULL,17500.00,'MD','MD1003','2027-06-20',2,3,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(4,'E004','Emma',NULL,'Johnson','2021-02-10','FT','Salary',NULL,17100.00,'MD','MD1004','2027-02-10',5,4,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(5,'E005','Olivia',NULL,'Davis','2022-05-12','FT','Salary',NULL,16900.00,'MD','MD1005','2027-05-12',8,5,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(6,'E006','Daniel',NULL,'Harris','2017-09-10','FT','Salary',NULL,16600.00,'MD','MD1006','2027-09-10',6,6,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(7,'E007','Isabella',NULL,'Clark','2018-11-12','FT','Salary',NULL,16200.00,'MD','MD1007','2027-11-12',9,7,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(8,'E008','William',NULL,'Lewis','2019-01-20','FT','Salary',NULL,17800.00,'MD','MD1008','2027-01-20',7,8,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(9,'E009','Mason',NULL,'Walker','2020-03-08','FT','Salary',NULL,18200.00,'MD','MD1009','2027-03-08',7,9,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(10,'E010','Ava',NULL,'Rodriguez','2020-07-01','FT','Hourly',38.00,NULL,'RN','RN2001','2027-07-01',1,10,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(11,'E011','Noah',NULL,'Miller','2021-08-15','FT','Hourly',36.50,NULL,'RN','RN2002','2027-08-15',2,10,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(12,'E012','Mia',NULL,'Garcia','2022-09-21','FT','Hourly',35.75,NULL,'RN','RN2003','2027-09-21',5,10,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(13,'E013','Liam',NULL,'Lopez','2020-12-01','FT','Hourly',34.50,NULL,'RN','RN2004','2027-12-01',6,10,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(14,'E014','Charlotte',NULL,'Hall','2021-06-18','FT','Hourly',37.25,NULL,'RN','RN2005','2027-06-18',8,10,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(15,'E015','Lucas',NULL,'Allen','2022-04-11','FT','Hourly',39.00,NULL,'RN','RN2006','2027-04-11',9,10,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(16,'E016','Harper',NULL,'Young','2021-02-14','FT','Hourly',29.50,NULL,'LPN','LPN3001','2027-02-14',6,11,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(17,'E017','Evelyn',NULL,'King','2022-03-18','FT','Hourly',28.75,NULL,'LPN','LPN3002','2027-03-18',9,11,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(18,'E018','Elijah',NULL,'Scott','2023-04-10','FT','Hourly',28.25,NULL,'LPN','LPN3003','2027-04-10',7,11,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(19,'E019','Amelia',NULL,'Green','2020-05-05','FT','Salary',NULL,11200.00,'APRN','NP4001','2027-05-05',1,12,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(20,'E020','Henry',NULL,'Baker','2021-06-06','FT','Salary',NULL,11400.00,'APRN','NP4002','2027-06-06',2,12,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(21,'E021','Abigail',NULL,'Nelson','2022-07-07','FT','Salary',NULL,11050.00,'APRN','NP4003','2027-07-07',5,12,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(22,'E022','Logan',NULL,'Carter','2020-08-08','FT','Salary',NULL,10800.00,'PA-C','PA5001','2027-08-08',1,13,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(23,'E023','Ella',NULL,'Mitchell','2021-09-09','FT','Salary',NULL,10950.00,'PA-C','PA5002','2027-09-09',7,13,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(24,'E024','Benjamin',NULL,'Perez','2022-10-10','FT','Salary',NULL,10700.00,'PA-C','PA5003','2027-10-10',8,13,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(25,'E025','Scarlett',NULL,'Roberts','2021-11-11','FT','Hourly',23.50,NULL,NULL,NULL,NULL,14,14,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(26,'E026','Jack',NULL,'Turner','2020-12-12','FT','Hourly',22.75,NULL,NULL,NULL,NULL,2,14,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(27,'E027','Grace',NULL,'Phillips','2022-01-13','FT','Hourly',23.00,NULL,NULL,NULL,NULL,6,14,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(28,'E028','Owen',NULL,'Campbell','2023-02-14','FT','Hourly',22.50,NULL,NULL,NULL,NULL,8,14,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(29,'E029','Chloe',NULL,'Parker','2021-03-15','FT','Hourly',21.50,NULL,NULL,NULL,NULL,1,15,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(30,'E030','Levi',NULL,'Evans','2022-04-16','FT','Hourly',21.00,NULL,NULL,NULL,NULL,5,15,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(31,'E031','Zoey',NULL,'Edwards','2023-05-17','FT','Hourly',21.75,NULL,NULL,NULL,NULL,9,15,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(32,'E032','Sebastian',NULL,'Collins','2020-06-18','FT','Hourly',31.50,NULL,'RRT','RRT6001','2027-06-18',1,16,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(33,'E033','Lily',NULL,'Stewart','2021-07-19','FT','Hourly',32.00,NULL,'RRT','RRT6002','2027-07-19',9,16,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(34,'E034','Joseph',NULL,'Sanchez','2020-08-20','FT','Salary',NULL,8200.00,'PT','PT7001','2027-08-20',7,17,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(35,'E035','Hannah',NULL,'Morris','2021-09-21','FT','Salary',NULL,8100.00,'OTR','OT8001','2027-09-21',7,18,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(36,'E036','David',NULL,'Rogers','2022-10-22','FT','Salary',NULL,8000.00,'SLP','SLP9001','2027-10-22',6,19,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(37,'E037','Aria',NULL,'Reed','2020-11-23','FT','Hourly',30.00,NULL,NULL,NULL,NULL,4,20,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(38,'E038','Matthew',NULL,'Cook','2021-12-24','FT','Hourly',29.50,NULL,NULL,NULL,NULL,4,20,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(39,'E039','Nora',NULL,'Morgan','2022-01-25','FT','Hourly',24.50,NULL,NULL,NULL,NULL,4,21,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(40,'E040','Samuel',NULL,'Bell','2023-02-26','FT','Hourly',24.00,NULL,NULL,NULL,NULL,4,21,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(41,'E041','Victoria',NULL,'Murphy','2019-03-27','FT','Salary',NULL,14800.00,'MD','PATH1001','2027-03-27',4,22,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(42,'E042','Gabriel',NULL,'Bailey','2020-04-28','FT','Salary',NULL,8900.00,NULL,NULL,NULL,4,23,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(43,'E043','Riley',NULL,'Rivera','2021-05-01','FT','Hourly',31.00,NULL,NULL,NULL,NULL,3,24,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(44,'E044','Julian',NULL,'Cooper','2022-06-02','FT','Hourly',30.75,NULL,NULL,NULL,NULL,3,24,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(45,'E045','Penelope',NULL,'Richardson','2018-07-03','FT','Salary',NULL,15200.00,'MD','RAD1101','2027-07-03',3,25,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(46,'E046','Nathan',NULL,'Cox','2020-08-04','FT','Hourly',33.00,NULL,NULL,NULL,NULL,3,26,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(47,'E047','Lucy',NULL,'Howard','2021-09-05','FT','Hourly',33.50,NULL,NULL,NULL,NULL,3,27,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(48,'E048','Isaac',NULL,'Ward','2022-10-06','FT','Hourly',32.25,NULL,NULL,NULL,NULL,3,28,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(49,'E049','Brooklyn',NULL,'Torres','2020-11-07','FT','Salary',NULL,9400.00,'PharmD','PH5001','2027-11-07',10,29,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(50,'E050','Caleb',NULL,'Peterson','2021-12-08','FT','Salary',NULL,9100.00,'PharmD','PH5002','2027-12-08',10,29,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(51,'E051','Layla',NULL,'Gray','2022-01-09','FT','Hourly',25.00,NULL,'CPhT','CPHT1201','2027-01-09',10,30,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(52,'E052','Aaron',NULL,'Ramirez','2021-02-10','FT','Salary',NULL,6500.00,NULL,NULL,NULL,11,31,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(53,'E053','Stella',NULL,'James','2022-03-11','FT','Salary',NULL,6400.00,NULL,NULL,NULL,11,31,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(54,'E054','Andrew',NULL,'Watson','2020-04-12','FT','Salary',NULL,6200.00,NULL,NULL,NULL,11,32,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(55,'E055','Hazel',NULL,'Brooks','2021-05-13','FT','Salary',NULL,6300.00,NULL,NULL,NULL,11,33,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(56,'E056','Christopher',NULL,'Kelly','2022-06-14','FT','Salary',NULL,6100.00,NULL,NULL,NULL,11,34,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(57,'E057','Violet',NULL,'Sanders','2020-07-15','FT','Salary',NULL,7000.00,NULL,NULL,NULL,13,35,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(58,'E058','Dylan',NULL,'Price','2021-08-16','FT','Salary',NULL,6800.00,NULL,NULL,NULL,13,36,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(59,'E059','Aurora',NULL,'Barnes','2022-09-17','FT','Salary',NULL,6900.00,'RD','RD1301','2027-09-17',13,37,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(60,'E060','Brianna',NULL,'Morris','2022-04-10','FT','Hourly',24.00,NULL,NULL,NULL,NULL,14,38,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(61,'E061','Tyler',NULL,'Hughes','2023-02-16','FT','Hourly',23.50,NULL,NULL,NULL,NULL,14,38,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(62,'E062','Madison',NULL,'Flores','2021-10-18','FT','Hourly',22.75,NULL,NULL,NULL,NULL,14,39,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(63,'E063','Ryan',NULL,'Long','2022-11-19','FT','Hourly',22.50,NULL,NULL,NULL,NULL,14,39,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(64,'E064','Savannah',NULL,'Patterson','2020-12-20','FT','Hourly',21.50,NULL,NULL,NULL,NULL,9,40,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(65,'E065','Nathaniel',NULL,'Hughes','2021-01-21','FT','Hourly',21.75,NULL,NULL,NULL,NULL,1,40,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(66,'E066','Claire',NULL,'Washington','2020-02-22','FT','Salary',NULL,5200.00,NULL,NULL,NULL,13,41,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(67,'E067','Jonathan',NULL,'Butler','2021-03-23','FT','Salary',NULL,5600.00,NULL,NULL,NULL,13,42,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(68,'E068','Marcus',NULL,'Bryant','2019-12-02','FT','Salary',NULL,11200.00,NULL,NULL,NULL,13,43,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(69,'E069','Vanessa',NULL,'Coleman','2020-03-11','FT','Salary',NULL,6800.00,NULL,NULL,NULL,12,44,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(70,'E070','Jordan',NULL,'Simmons','2020-04-24','FT','Salary',NULL,7900.00,NULL,NULL,NULL,13,45,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(71,'E071','Katherine',NULL,'Fisher','2019-05-25','FT','Salary',NULL,8400.00,NULL,NULL,NULL,13,46,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(72,'E072','Brandon',NULL,'Ellis','2021-06-26','FT','Salary',NULL,7800.00,NULL,NULL,NULL,13,47,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(73,'E073','Darnell',NULL,'Price','2021-11-08','FT','Hourly',26.00,NULL,NULL,NULL,NULL,13,48,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(74,'E074','Monica',NULL,'Hughes','2022-08-22','FT','Hourly',19.50,NULL,NULL,NULL,NULL,13,49,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(75,'E075','Cole',NULL,'Jenkins','2023-09-27','FT','Hourly',18.75,NULL,NULL,NULL,NULL,13,50,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(76,'E076','Tristan',NULL,'Foster','2021-10-28','FT','Hourly',27.50,NULL,NULL,NULL,NULL,7,51,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(77,'E077','Faith',NULL,'Powell','2022-11-29','FT','Hourly',36.25,NULL,'RN','RN2007','2027-11-29',1,10,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(78,'E078','Xavier',NULL,'Perry','2023-01-30','FT','Hourly',35.50,NULL,'RN','RN2008','2028-01-30',2,10,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(79,'E079','Naomi',NULL,'Russell','2022-02-14','FT','Hourly',21.25,NULL,NULL,NULL,NULL,7,15,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(80,'E080','Eli',NULL,'Griffin','2023-03-15','FT','Hourly',24.25,NULL,NULL,NULL,NULL,10,30,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(81,'E081','Aiden',NULL,'Ward','2023-04-01','FT','Hourly',34.50,NULL,'RN','RN2009','2028-04-01',1,10,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(82,'E082','Layla',NULL,'Simmons','2023-04-02','FT','Hourly',33.75,NULL,'RN','RN2010','2028-04-02',2,10,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(83,'E083','Grayson',NULL,'Foster','2023-04-03','FT','Hourly',22.00,NULL,NULL,NULL,NULL,7,15,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(84,'E084','Zoe',NULL,'Bryant','2023-04-04','FT','Hourly',22.50,NULL,NULL,NULL,NULL,9,15,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(85,'E085','Isaiah',NULL,'Alexander','2023-04-05','FT','Salary',NULL,10500.00,'PA-C','PA5004','2028-04-05',1,13,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(86,'E086','Mila',NULL,'Russell','2023-04-06','FT','Salary',NULL,11000.00,'APRN','NP4004','2028-04-06',5,12,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(87,'E087','Julian',NULL,'Griffin','2023-04-07','FT','Hourly',29.50,NULL,NULL,NULL,NULL,4,20,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(88,'E088','Ella',NULL,'Diaz','2023-04-08','FT','Hourly',30.25,NULL,NULL,NULL,NULL,4,20,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(89,'E089','Leo',NULL,'Hayes','2023-04-09','FT','Hourly',31.50,NULL,NULL,NULL,NULL,3,24,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(90,'E090','Scarlett',NULL,'Myers','2023-04-10','FT','Hourly',32.00,NULL,NULL,NULL,NULL,3,24,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(91,'E091','Hudson',NULL,'Ford','2023-04-11','FT','Salary',NULL,9200.00,'PharmD','PH5003','2028-04-11',10,29,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(92,'E092','Luna',NULL,'Hamilton','2023-04-12','FT','Hourly',24.50,NULL,'CPhT','CPHT1202','2028-04-12',10,30,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(93,'E093','Ezra',NULL,'Graham','2023-04-13','FT','Salary',NULL,6400.00,NULL,NULL,NULL,11,31,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(94,'E094','Chloe',NULL,'Sullivan','2023-04-14','FT','Salary',NULL,6300.00,NULL,NULL,NULL,11,34,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(95,'E095','Nathan',NULL,'Wallace','2023-04-15','FT','Salary',NULL,7000.00,NULL,NULL,NULL,13,35,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(96,'E096','Aria',NULL,'Woods','2023-04-16','FT','Salary',NULL,6800.00,NULL,NULL,NULL,13,36,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(97,'E097','Ethan',NULL,'Cole','2023-04-17','FT','Hourly',23.00,NULL,NULL,NULL,NULL,14,38,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(98,'E098','Harper',NULL,'West','2023-04-18','FT','Hourly',22.75,NULL,NULL,NULL,NULL,14,39,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(99,'E099','Mason',NULL,'Jordan','2023-04-19','FT','Salary',NULL,8000.00,NULL,NULL,NULL,13,47,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29'),(100,'E100','Avery',NULL,'Owens','2023-04-20','FT','Hourly',19.00,NULL,NULL,NULL,NULL,13,49,'Active','2026-04-30 13:51:29','2026-04-30 13:51:29');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_events`
--

DROP TABLE IF EXISTS `encounter_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encounter_events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `performed_by_user_id` int DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `performed_by_user_id` (`performed_by_user_id`),
  KEY `idx_encounter_events_encounter` (`encounter_id`),
  CONSTRAINT `encounter_events_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `encounter_events_ibfk_2` FOREIGN KEY (`performed_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_events`
--

LOCK TABLES `encounter_events` WRITE;
/*!40000 ALTER TABLE `encounter_events` DISABLE KEYS */;
INSERT INTO `encounter_events` VALUES (1,1,'Check-In Completed','2026-04-30 13:51:29',1,'Patient checked in at front desk'),(2,1,'Triage Completed','2026-04-30 13:51:29',6,'Patient triaged with medium priority'),(3,1,'Vitals Recorded','2026-04-30 13:51:29',6,'Vitals entered for ER visit'),(4,1,'Provider Assigned','2026-04-30 13:51:29',1,'Emergency physician assigned'),(5,1,'Diagnosis Entered','2026-04-30 13:51:29',1,'Influenza suspected'),(6,1,'Procedure Completed','2026-04-30 13:51:29',1,'Chest X-ray performed'),(7,1,'Discharge Completed','2026-04-30 13:51:29',1,'Discharge instructions delivered'),(8,2,'Check-In Completed','2026-04-30 13:51:29',2,'Patient arrived for cardiology visit'),(9,2,'Vitals Recorded','2026-04-30 13:51:29',7,'Vitals recorded for cardiology'),(10,2,'EKG Completed','2026-04-30 13:51:29',2,'Cardiology workup finished'),(11,2,'Diagnosis Entered','2026-04-30 13:51:29',2,'Stable angina diagnosed'),(12,2,'Follow-Up Scheduled','2026-04-30 13:51:29',2,'Follow-up appointment created'),(13,2,'Discharge Completed','2026-04-30 13:51:29',2,'Patient discharged after consult'),(14,3,'Check-In Completed','2026-04-30 13:51:29',3,'Patient checked in for oncology'),(15,3,'Vitals Recorded','2026-04-30 13:51:29',8,'Vitals recorded for oncology'),(16,3,'Provider Assigned','2026-04-30 13:51:29',3,'Oncologist assigned'),(17,3,'Admission Completed','2026-04-30 13:51:29',1,'Patient admitted to oncology inpatient room'),(18,3,'Lab Ordered','2026-04-30 13:51:29',3,'CBC and tumor markers ordered'),(19,3,'Medication Administered','2026-04-30 13:51:29',8,'Pain medication given'),(20,4,'Check-In Completed','2026-04-30 13:51:29',4,'Patient arrived for neurology consult'),(21,4,'Vitals Recorded','2026-04-30 13:51:29',9,'Vitals recorded for neurology'),(22,4,'Provider Assigned','2026-04-30 13:51:29',4,'Neurologist assigned'),(23,4,'Diagnosis Entered','2026-04-30 13:51:29',4,'Migraine diagnosed'),(24,4,'Procedure Completed','2026-04-30 13:51:29',4,'Neurological exam completed'),(25,4,'Discharge Completed','2026-04-30 13:51:29',4,'Outpatient discharge'),(26,5,'Check-In Completed','2026-04-30 13:51:29',5,'Patient checked in for pediatrics'),(27,5,'Vitals Recorded','2026-04-30 13:51:29',6,'Vitals recorded'),(28,5,'Provider Assigned','2026-04-30 13:51:29',5,'Pediatrician assigned'),(29,5,'Diagnosis Entered','2026-04-30 13:51:29',5,'Routine checkup'),(30,5,'Discharge Completed','2026-04-30 13:51:29',5,'Visit completed'),(31,6,'Check-In Completed','2026-04-30 13:51:29',6,'Walk-in patient check-in'),(32,6,'Triage Completed','2026-04-30 13:51:29',7,'Low priority case'),(33,6,'Vitals Recorded','2026-04-30 13:51:29',7,'Vitals recorded'),(34,6,'Provider Assigned','2026-04-30 13:51:29',1,'General physician assigned'),(35,6,'Discharge Completed','2026-04-30 13:51:29',1,'Patient discharged'),(36,7,'Check-In Completed','2026-04-30 13:51:29',7,'Patient checked in'),(37,7,'Vitals Recorded','2026-04-30 13:51:29',6,'Vitals recorded'),(38,7,'Lab Ordered','2026-04-30 13:51:29',2,'Blood test ordered'),(39,7,'Lab Result Reviewed','2026-04-30 13:51:29',2,'Results reviewed'),(40,7,'Discharge Completed','2026-04-30 13:51:29',2,'Patient discharged'),(41,8,'Check-In Completed','2026-04-30 13:51:29',8,'Patient check-in'),(42,8,'Vitals Recorded','2026-04-30 13:51:29',8,'Vitals recorded'),(43,8,'Procedure Completed','2026-04-30 13:51:29',3,'Minor procedure done'),(44,8,'Discharge Completed','2026-04-30 13:51:29',3,'Patient discharged'),(45,9,'Check-In Completed','2026-04-30 13:51:29',9,'Patient check-in'),(46,9,'Vitals Recorded','2026-04-30 13:51:29',9,'Vitals recorded'),(47,9,'Diagnosis Entered','2026-04-30 13:51:29',4,'Headache assessed'),(48,9,'Discharge Completed','2026-04-30 13:51:29',4,'Patient discharged'),(49,10,'Check-In Completed','2026-04-30 13:51:29',10,'Patient check-in'),(50,10,'Vitals Recorded','2026-04-30 13:51:29',6,'Vitals recorded'),(51,10,'Medication Administered','2026-04-30 13:51:29',6,'Medication given'),(52,10,'Discharge Completed','2026-04-30 13:51:29',1,'Patient discharged');
/*!40000 ALTER TABLE `encounter_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `encounter_provider_view`
--

DROP TABLE IF EXISTS `encounter_provider_view`;
/*!50001 DROP VIEW IF EXISTS `encounter_provider_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `encounter_provider_view` AS SELECT 
 1 AS `encounter_id`,
 1 AS `patient_id`,
 1 AS `patient_first_name`,
 1 AS `patient_last_name`,
 1 AS `encounter_type`,
 1 AS `admit_datetime`,
 1 AS `discharge_datetime`,
 1 AS `status`,
 1 AS `provider_id`,
 1 AS `provider_first_name`,
 1 AS `provider_last_name`,
 1 AS `specialty`,
 1 AS `department_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `encounters`
--

DROP TABLE IF EXISTS `encounters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encounters` (
  `encounter_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `attending_provider_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `checkin_id` int DEFAULT NULL,
  `encounter_type` enum('Outpatient','Inpatient','ER') DEFAULT NULL,
  `admit_datetime` datetime DEFAULT NULL,
  `discharge_datetime` datetime DEFAULT NULL,
  `discharge_disposition` varchar(100) DEFAULT NULL COMMENT 'Home|Transferred|AMA|Expired|SNF|Rehab|Hospice',
  `status` enum('Open','Closed') DEFAULT 'Open',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`encounter_id`),
  KEY `department_id` (`department_id`),
  KEY `attending_provider_id` (`attending_provider_id`),
  KEY `room_id` (`room_id`),
  KEY `checkin_id` (`checkin_id`),
  KEY `idx_encounter_patient` (`patient_id`),
  KEY `idx_encounters_admit_datetime` (`admit_datetime`),
  KEY `idx_encounters_status` (`status`),
  CONSTRAINT `encounters_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `encounters_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `encounters_ibfk_3` FOREIGN KEY (`attending_provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `encounters_ibfk_4` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `encounters_ibfk_5` FOREIGN KEY (`checkin_id`) REFERENCES `check_ins` (`checkin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounters`
--

LOCK TABLES `encounters` WRITE;
/*!40000 ALTER TABLE `encounters` DISABLE KEYS */;
INSERT INTO `encounters` VALUES (1,1,1,1,1,1,'ER','2026-04-01 09:00:00','2026-04-01 11:00:00',NULL,'Closed',NULL),(2,2,2,2,6,2,'Outpatient','2026-04-01 09:30:00','2026-04-01 10:30:00',NULL,'Closed',NULL),(3,3,5,3,17,3,'Inpatient','2026-04-01 10:00:00',NULL,NULL,'Open',NULL),(4,4,6,4,21,4,'Outpatient','2026-04-01 10:30:00','2026-04-01 11:30:00',NULL,'Closed',NULL),(5,5,7,5,24,5,'Outpatient','2026-04-01 11:00:00','2026-04-01 12:00:00',NULL,'Closed',NULL),(6,6,8,6,27,6,'ER','2026-04-01 11:30:00','2026-04-01 13:00:00',NULL,'Closed',NULL),(7,7,9,7,30,7,'Inpatient','2026-04-01 12:00:00',NULL,NULL,'Open',NULL),(8,8,1,8,2,8,'Outpatient','2026-04-01 12:30:00','2026-04-01 13:30:00',NULL,'Closed',NULL),(9,9,2,9,7,9,'Outpatient','2026-04-01 13:00:00','2026-04-01 14:00:00',NULL,'Closed',NULL),(10,10,5,10,18,10,'Outpatient','2026-04-01 13:30:00','2026-04-01 14:30:00',NULL,'Closed',NULL),(11,11,6,11,22,11,'Outpatient','2026-04-01 14:00:00','2026-04-01 15:00:00',NULL,'Closed',NULL),(12,12,7,12,25,12,'Outpatient','2026-04-01 14:30:00','2026-04-01 15:30:00',NULL,'Closed',NULL),(13,13,8,13,28,13,'ER','2026-04-02 08:00:00','2026-04-02 10:00:00',NULL,'Closed',NULL),(14,14,9,14,31,14,'Inpatient','2026-04-02 08:30:00',NULL,NULL,'Open',NULL),(15,15,1,15,3,15,'Outpatient','2026-04-02 09:00:00','2026-04-02 10:00:00',NULL,'Closed',NULL),(16,16,2,1,8,16,'Outpatient','2026-04-02 09:30:00','2026-04-02 10:30:00',NULL,'Closed',NULL),(17,17,5,2,19,17,'Inpatient','2026-04-02 10:00:00',NULL,NULL,'Open',NULL),(18,18,6,3,23,18,'Outpatient','2026-04-02 10:30:00','2026-04-02 11:30:00',NULL,'Closed',NULL),(19,19,7,4,26,19,'Outpatient','2026-04-02 11:00:00','2026-04-02 12:00:00',NULL,'Closed',NULL),(20,20,8,5,29,20,'ER','2026-04-02 11:30:00','2026-04-02 13:00:00',NULL,'Closed',NULL),(21,21,9,6,32,21,'Inpatient','2026-04-02 12:00:00',NULL,NULL,'Open',NULL),(22,22,1,7,4,22,'Outpatient','2026-04-02 12:30:00','2026-04-02 13:30:00',NULL,'Closed',NULL),(23,23,2,8,9,23,'Outpatient','2026-04-02 13:00:00','2026-04-02 14:00:00',NULL,'Closed',NULL),(24,24,5,9,20,24,'Inpatient','2026-04-02 13:30:00',NULL,NULL,'Open',NULL),(25,25,6,10,21,25,'Outpatient','2026-04-03 08:00:00','2026-04-03 09:00:00',NULL,'Closed',NULL),(26,26,7,11,24,26,'Outpatient','2026-04-03 08:30:00','2026-04-03 09:30:00',NULL,'Closed',NULL),(27,27,8,12,27,27,'ER','2026-04-03 09:00:00','2026-04-03 10:30:00',NULL,'Closed',NULL),(28,28,9,13,30,28,'Inpatient','2026-04-03 09:30:00',NULL,NULL,'Open',NULL),(29,29,1,14,5,29,'Outpatient','2026-04-03 10:00:00','2026-04-03 11:00:00',NULL,'Closed',NULL),(30,30,2,15,10,30,'Outpatient','2026-04-03 10:30:00','2026-04-03 11:30:00',NULL,'Closed',NULL),(31,31,5,1,17,31,'Inpatient','2026-04-03 11:00:00',NULL,NULL,'Open',NULL),(32,32,6,2,22,32,'Outpatient','2026-04-03 11:30:00','2026-04-03 12:30:00',NULL,'Closed',NULL),(33,33,7,3,25,33,'Outpatient','2026-04-03 13:00:00','2026-04-03 14:00:00',NULL,'Closed',NULL),(34,34,8,4,28,34,'ER','2026-04-03 13:30:00','2026-04-03 15:00:00',NULL,'Closed',NULL),(35,35,9,5,31,35,'Inpatient','2026-04-03 14:00:00',NULL,NULL,'Open',NULL),(36,36,1,6,1,36,'Outpatient','2026-04-03 14:30:00','2026-04-03 15:30:00',NULL,'Closed',NULL),(37,37,2,7,6,37,'Outpatient','2026-04-04 08:00:00','2026-04-04 09:00:00',NULL,'Closed',NULL),(38,38,5,8,18,38,'Inpatient','2026-04-04 08:30:00',NULL,NULL,'Open',NULL),(39,39,6,9,21,39,'Outpatient','2026-04-04 09:00:00','2026-04-04 10:00:00',NULL,'Closed',NULL),(40,40,7,10,24,40,'Outpatient','2026-04-04 09:30:00','2026-04-04 10:30:00',NULL,'Closed',NULL),(41,41,8,11,27,41,'ER','2026-04-04 10:00:00','2026-04-04 11:30:00',NULL,'Closed',NULL),(42,42,9,12,30,42,'Inpatient','2026-04-04 10:30:00',NULL,NULL,'Open',NULL),(43,43,1,13,2,43,'Outpatient','2026-04-04 11:00:00','2026-04-04 12:00:00',NULL,'Closed',NULL),(44,44,2,14,7,44,'Outpatient','2026-04-04 11:30:00','2026-04-04 12:30:00',NULL,'Closed',NULL),(45,45,5,15,19,45,'Inpatient','2026-04-04 13:00:00',NULL,NULL,'Open',NULL),(46,46,6,1,22,46,'Outpatient','2026-04-04 13:30:00','2026-04-04 14:30:00',NULL,'Closed',NULL),(47,47,7,2,25,47,'Outpatient','2026-04-04 14:00:00','2026-04-04 15:00:00',NULL,'Closed',NULL),(48,48,8,3,28,48,'ER','2026-04-04 14:30:00','2026-04-04 16:00:00',NULL,'Closed',NULL),(49,49,9,4,31,49,'Inpatient','2026-04-05 08:00:00',NULL,NULL,'Open',NULL),(50,50,1,5,3,50,'Outpatient','2026-04-05 08:30:00','2026-04-05 09:30:00',NULL,'Closed',NULL),(51,51,2,6,8,51,'Outpatient','2026-04-05 09:00:00','2026-04-05 10:00:00',NULL,'Closed',NULL),(52,52,5,7,20,52,'Inpatient','2026-04-05 09:30:00',NULL,NULL,'Open',NULL),(53,53,6,8,21,53,'Outpatient','2026-04-05 10:00:00','2026-04-05 11:00:00',NULL,'Closed',NULL),(54,54,7,9,24,54,'Outpatient','2026-04-05 10:30:00','2026-04-05 11:30:00',NULL,'Closed',NULL),(55,55,8,10,27,55,'ER','2026-04-05 11:00:00','2026-04-05 12:30:00',NULL,'Closed',NULL),(56,56,9,11,30,56,'Inpatient','2026-04-05 11:30:00',NULL,NULL,'Open',NULL),(57,57,1,12,4,57,'Outpatient','2026-04-05 13:00:00','2026-04-05 14:00:00',NULL,'Closed',NULL),(58,58,2,13,9,58,'Outpatient','2026-04-05 13:30:00','2026-04-05 14:30:00',NULL,'Closed',NULL),(59,59,5,14,17,59,'Inpatient','2026-04-05 14:00:00',NULL,NULL,'Open',NULL),(60,60,6,15,23,60,'Outpatient','2026-04-05 14:30:00','2026-04-05 15:30:00',NULL,'Closed',NULL),(61,61,7,1,24,61,'Outpatient','2026-04-06 08:00:00','2026-04-06 09:00:00',NULL,'Closed',NULL),(62,62,8,2,27,62,'ER','2026-04-06 08:30:00','2026-04-06 10:00:00',NULL,'Closed',NULL),(63,63,9,3,30,63,'Inpatient','2026-04-06 09:00:00',NULL,NULL,'Open',NULL),(64,64,1,4,5,64,'Outpatient','2026-04-06 09:30:00','2026-04-06 10:30:00',NULL,'Closed',NULL),(65,65,2,5,10,65,'Outpatient','2026-04-06 10:00:00','2026-04-06 11:00:00',NULL,'Closed',NULL),(66,66,5,6,18,66,'Inpatient','2026-04-06 10:30:00',NULL,NULL,'Open',NULL),(67,67,6,7,22,67,'Outpatient','2026-04-06 11:00:00','2026-04-06 12:00:00',NULL,'Closed',NULL),(68,68,7,8,25,68,'Outpatient','2026-04-06 11:30:00','2026-04-06 12:30:00',NULL,'Closed',NULL),(69,69,8,9,28,69,'ER','2026-04-06 13:00:00','2026-04-06 14:30:00',NULL,'Closed',NULL),(70,70,9,10,31,70,'Inpatient','2026-04-06 13:30:00',NULL,NULL,'Open',NULL),(71,71,1,11,1,71,'Outpatient','2026-04-06 14:00:00','2026-04-06 15:00:00',NULL,'Closed',NULL),(72,72,2,12,6,72,'Outpatient','2026-04-06 14:30:00','2026-04-06 15:30:00',NULL,'Closed',NULL),(73,73,5,13,19,73,'Inpatient','2026-04-07 08:00:00',NULL,NULL,'Open',NULL),(74,74,6,14,21,74,'Outpatient','2026-04-07 08:30:00','2026-04-07 09:30:00',NULL,'Closed',NULL),(75,75,7,15,24,75,'Outpatient','2026-04-07 09:00:00','2026-04-07 10:00:00',NULL,'Closed',NULL),(76,76,8,1,27,76,'ER','2026-04-07 09:30:00','2026-04-07 11:00:00',NULL,'Closed',NULL),(77,77,9,2,30,77,'Inpatient','2026-04-07 10:00:00',NULL,NULL,'Open',NULL),(78,78,1,3,2,78,'Outpatient','2026-04-07 10:30:00','2026-04-07 11:30:00',NULL,'Closed',NULL),(79,79,2,4,7,79,'Outpatient','2026-04-07 11:00:00','2026-04-07 12:00:00',NULL,'Closed',NULL),(80,80,5,5,20,80,'Inpatient','2026-04-07 11:30:00',NULL,NULL,'Open',NULL),(81,81,6,6,22,81,'Outpatient','2026-04-07 13:00:00','2026-04-07 14:00:00',NULL,'Closed',NULL),(82,82,7,7,25,82,'Outpatient','2026-04-07 13:30:00','2026-04-07 14:30:00',NULL,'Closed',NULL),(83,83,8,8,28,83,'ER','2026-04-07 14:00:00','2026-04-07 15:30:00',NULL,'Closed',NULL),(84,84,9,9,31,84,'Inpatient','2026-04-07 14:30:00',NULL,NULL,'Open',NULL),(85,85,1,10,3,85,'Outpatient','2026-04-08 08:00:00','2026-04-08 09:00:00',NULL,'Closed',NULL),(86,86,2,11,8,86,'Outpatient','2026-04-08 08:30:00','2026-04-08 09:30:00',NULL,'Closed',NULL),(87,87,5,12,17,87,'Inpatient','2026-04-08 09:00:00',NULL,NULL,'Open',NULL),(88,88,6,13,23,88,'Outpatient','2026-04-08 09:30:00','2026-04-08 10:30:00',NULL,'Closed',NULL),(89,89,7,14,24,89,'Outpatient','2026-04-08 10:00:00','2026-04-08 11:00:00',NULL,'Closed',NULL),(90,90,8,15,27,90,'ER','2026-04-08 10:30:00','2026-04-08 12:00:00',NULL,'Closed',NULL),(91,91,9,1,30,91,'Inpatient','2026-04-08 11:00:00',NULL,NULL,'Open',NULL),(92,92,1,2,4,92,'Outpatient','2026-04-08 11:30:00','2026-04-08 12:30:00',NULL,'Closed',NULL),(93,93,2,3,9,93,'Outpatient','2026-04-08 13:00:00','2026-04-08 14:00:00',NULL,'Closed',NULL),(94,94,5,4,18,94,'Inpatient','2026-04-08 13:30:00',NULL,NULL,'Open',NULL),(95,95,6,5,21,95,'Outpatient','2026-04-08 14:00:00','2026-04-08 15:00:00',NULL,'Closed',NULL),(96,96,7,6,24,96,'Outpatient','2026-04-08 14:30:00','2026-04-08 15:30:00',NULL,'Closed',NULL),(97,97,8,7,28,97,'ER','2026-04-09 08:00:00','2026-04-09 09:30:00',NULL,'Closed',NULL),(98,98,9,8,31,98,'Inpatient','2026-04-09 08:30:00',NULL,NULL,'Open',NULL),(99,99,1,9,1,99,'Outpatient','2026-04-09 09:00:00','2026-04-09 10:00:00',NULL,'Closed',NULL),(100,100,2,10,6,100,'Outpatient','2026-04-09 09:30:00','2026-04-09 10:30:00',NULL,'Closed',NULL);
/*!40000 ALTER TABLE `encounters` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inpatient_room_charge_trigger` AFTER INSERT ON `encounters` FOR EACH ROW BEGIN
    IF NEW.encounter_type = 'Inpatient' THEN
        INSERT INTO charges (
            encounter_id,
            charge_type,
            code,
            description,
            amount,
            charge_datetime
        )
        VALUES (
            NEW.encounter_id,
            'Room',
            'ROOM-INPATIENT',
            'Initial inpatient room charge',
            500.00,
            NOW()
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `encounter_close_discharge_trigger` BEFORE UPDATE ON `encounters` FOR EACH ROW BEGIN
    IF NEW.status = 'Closed'
       AND OLD.status <> 'Closed'
       AND NEW.discharge_datetime IS NULL THEN
        SET NEW.discharge_datetime = NOW();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `icd10_codes`
--

DROP TABLE IF EXISTS `icd10_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icd10_codes` (
  `icd10_code` varchar(20) NOT NULL,
  `description` varchar(300) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`icd10_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icd10_codes`
--

LOCK TABLES `icd10_codes` WRITE;
/*!40000 ALTER TABLE `icd10_codes` DISABLE KEYS */;
INSERT INTO `icd10_codes` VALUES ('C34.90','Lung cancer',NULL),('C50.919','Breast cancer',NULL),('C80.1','Malignant neoplasm, unspecified',NULL),('E11.9','Type 2 diabetes mellitus',NULL),('G31.84','Mild cognitive impairment',NULL),('G40.909','Epilepsy, unspecified',NULL),('G43.109','Migraine with aura',NULL),('G43.909','Migraine, unspecified',NULL),('G44.1','Vascular headache',NULL),('G44.209','Tension headache',NULL),('G62.9','Neuropathy',NULL),('I10','Essential hypertension',NULL),('I20.9','Angina pectoris, unspecified',NULL),('I21.3','ST elevation myocardial infarction',NULL),('I25.10','Atherosclerotic heart disease',NULL),('I49.9','Cardiac arrhythmia',NULL),('J10.1','Influenza with respiratory manifestations',NULL),('J18.9','Pneumonia, unspecified organism',NULL),('J96.00','Acute respiratory failure',NULL),('J96.90','Respiratory failure',NULL),('K21.9','Gastro-esophageal reflux disease',NULL),('K29.70','Gastritis',NULL),('K52.9','Gastroenteritis',NULL),('M16.9','Hip osteoarthritis',NULL),('M25.561','Pain in right knee',NULL),('M25.569','Joint pain',NULL),('M54.5','Low back pain',NULL),('M75.101','Shoulder lesion',NULL),('R05','Cough',NULL),('R07.9','Chest pain',NULL),('R42','Dizziness and giddiness',NULL),('R50.9','Fever, unspecified',NULL),('R53.1','Weakness',NULL),('Z00.00','General adult exam',NULL),('Z00.121','Routine pediatric exam',NULL),('Z00.129','Child health exam',NULL),('Z09','Follow-up examination',NULL),('Z23','Immunization encounter',NULL);
/*!40000 ALTER TABLE `icd10_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_plans`
--

DROP TABLE IF EXISTS `insurance_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_plans` (
  `insurance_id` int NOT NULL AUTO_INCREMENT,
  `payer_name` varchar(100) NOT NULL,
  `plan_name` varchar(100) NOT NULL,
  PRIMARY KEY (`insurance_id`),
  UNIQUE KEY `payer_name` (`payer_name`,`plan_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_plans`
--

LOCK TABLES `insurance_plans` WRITE;
/*!40000 ALTER TABLE `insurance_plans` DISABLE KEYS */;
INSERT INTO `insurance_plans` VALUES (12,'Aetna','EPO Advantage'),(11,'Aetna','HMO Value'),(9,'Aetna','Open Access'),(10,'Aetna','Open Access Plus'),(4,'Blue Cross Blue Shield','HMO Advantage'),(3,'Blue Cross Blue Shield','HMO Standard'),(1,'Blue Cross Blue Shield','PPO Basic'),(2,'Blue Cross Blue Shield','PPO Premium'),(15,'Cigna','EPO Core'),(14,'Cigna','LocalPlus HMO'),(13,'Cigna','Open Access Plus'),(28,'Humana','Choice PPO'),(27,'Humana','Gold Plus HMO'),(26,'Kaiser Permanente','HMO Premium'),(25,'Kaiser Permanente','HMO Standard'),(16,'Medica','Essential Care'),(17,'Medica','Prime Solution'),(18,'Medica','Value Plan'),(23,'Medicaid','State Medicaid Basic'),(24,'Medicaid','State Medicaid Expanded'),(19,'Medicare','Part A'),(20,'Medicare','Part B'),(21,'Medicare','Part C (Medicare Advantage)'),(22,'Medicare','Part D (Prescription Drug)'),(29,'Tricare','Prime'),(30,'Tricare','Select'),(5,'UnitedHealthcare','Choice Plus'),(6,'UnitedHealthcare','Choice Plus Advanced'),(8,'UnitedHealthcare','EPO Saver'),(7,'UnitedHealthcare','HMO Select');
/*!40000 ALTER TABLE `insurance_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_order_items`
--

DROP TABLE IF EXISTS `lab_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_order_items` (
  `lab_order_id` int NOT NULL,
  `lab_test_id` int NOT NULL,
  PRIMARY KEY (`lab_order_id`,`lab_test_id`),
  KEY `lab_test_id` (`lab_test_id`),
  CONSTRAINT `lab_order_items_ibfk_1` FOREIGN KEY (`lab_order_id`) REFERENCES `lab_orders` (`lab_order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lab_order_items_ibfk_2` FOREIGN KEY (`lab_test_id`) REFERENCES `lab_tests` (`lab_test_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_order_items`
--

LOCK TABLES `lab_order_items` WRITE;
/*!40000 ALTER TABLE `lab_order_items` DISABLE KEYS */;
INSERT INTO `lab_order_items` VALUES (1,1),(51,1),(1,2),(51,2),(2,3),(52,3),(2,4),(52,4),(3,5),(53,5),(3,6),(53,6),(4,7),(54,7),(4,8),(54,8),(5,9),(55,9),(5,10),(55,10),(6,11),(56,11),(6,12),(56,12),(7,13),(57,13),(7,14),(57,14),(8,15),(58,15),(8,16),(58,16),(9,17),(59,17),(9,18),(59,18),(10,19),(60,19),(10,20),(60,20),(11,21),(61,21),(11,22),(61,22),(12,23),(62,23),(12,24),(62,24),(13,25),(63,25),(13,26),(63,26),(14,27),(64,27),(14,28),(64,28),(15,29),(65,29),(15,30),(65,30),(16,31),(66,31),(16,32),(66,32),(17,33),(67,33),(17,34),(67,34),(18,35),(68,35),(18,36),(68,36),(19,37),(69,37),(19,38),(69,38),(20,39),(70,39),(20,40),(70,40),(21,41),(71,41),(21,42),(71,42),(22,43),(72,43),(22,44),(72,44),(23,45),(73,45),(23,46),(73,46),(24,47),(74,47),(24,48),(74,48),(25,49),(75,49),(25,50),(75,50),(26,51),(76,51),(26,52),(76,52),(27,53),(77,53),(27,54),(77,54),(28,55),(78,55),(28,56),(78,56),(29,57),(79,57),(29,58),(79,58),(30,59),(80,59),(30,60),(80,60),(31,61),(81,61),(31,62),(81,62),(32,63),(82,63),(32,64),(82,64),(33,65),(83,65),(33,66),(83,66),(34,67),(84,67),(34,68),(84,68),(35,69),(85,69),(35,70),(85,70),(36,71),(86,71),(36,72),(86,72),(37,73),(87,73),(37,74),(87,74),(38,75),(88,75),(38,76),(88,76),(39,77),(89,77),(39,78),(89,78),(40,79),(90,79),(40,80),(90,80),(41,81),(91,81),(41,82),(91,82),(42,83),(92,83),(42,84),(92,84),(43,85),(93,85),(43,86),(93,86),(44,87),(94,87),(44,88),(94,88),(45,89),(95,89),(45,90),(95,90),(46,91),(96,91),(46,92),(96,92),(47,93),(97,93),(47,94),(97,94),(48,95),(98,95),(48,96),(98,96),(49,97),(99,97),(49,98),(99,98),(50,99),(100,99),(50,100),(100,100);
/*!40000 ALTER TABLE `lab_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_orders`
--

DROP TABLE IF EXISTS `lab_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_orders` (
  `lab_order_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `ordered_by_provider_id` int NOT NULL,
  `order_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Ordered','Collected','Resulted','Cancelled') NOT NULL DEFAULT 'Pending',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lab_order_id`),
  KEY `ordered_by_provider_id` (`ordered_by_provider_id`),
  KEY `idx_lab_order_encounter` (`encounter_id`),
  CONSTRAINT `lab_orders_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lab_orders_ibfk_2` FOREIGN KEY (`ordered_by_provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_orders`
--

LOCK TABLES `lab_orders` WRITE;
/*!40000 ALTER TABLE `lab_orders` DISABLE KEYS */;
INSERT INTO `lab_orders` VALUES (1,1,1,'2026-04-01 09:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(2,2,1,'2026-04-01 10:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(3,3,1,'2026-04-01 10:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(4,4,1,'2026-04-01 11:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(5,5,1,'2026-04-01 11:30:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(6,6,1,'2026-04-01 12:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(7,7,1,'2026-04-01 12:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(8,8,1,'2026-04-01 13:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(9,9,1,'2026-04-01 13:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(10,10,1,'2026-04-01 14:00:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(11,11,1,'2026-04-01 14:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(12,12,1,'2026-04-01 15:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(13,13,1,'2026-04-01 15:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(14,14,1,'2026-04-01 16:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(15,15,1,'2026-04-01 16:30:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(16,16,1,'2026-04-01 17:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(17,17,1,'2026-04-01 17:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(18,18,1,'2026-04-01 18:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(19,19,1,'2026-04-01 18:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(20,20,1,'2026-04-01 19:00:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(21,21,1,'2026-04-01 19:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(22,22,1,'2026-04-01 20:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(23,23,1,'2026-04-01 20:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(24,24,1,'2026-04-01 21:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(25,25,1,'2026-04-01 21:30:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(26,26,1,'2026-04-01 22:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(27,27,1,'2026-04-01 22:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(28,28,1,'2026-04-01 23:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(29,29,1,'2026-04-01 23:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(30,30,1,'2026-04-02 00:00:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(31,31,1,'2026-04-02 00:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(32,32,1,'2026-04-02 01:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(33,33,1,'2026-04-02 01:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(34,34,1,'2026-04-02 02:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(35,35,1,'2026-04-02 02:30:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(36,36,1,'2026-04-02 03:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(37,37,1,'2026-04-02 03:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(38,38,1,'2026-04-02 04:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(39,39,1,'2026-04-02 04:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(40,40,1,'2026-04-02 05:00:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(41,41,1,'2026-04-02 05:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(42,42,1,'2026-04-02 06:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(43,43,1,'2026-04-02 06:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(44,44,1,'2026-04-02 07:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(45,45,1,'2026-04-02 07:30:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(46,46,1,'2026-04-02 08:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(47,47,1,'2026-04-02 08:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(48,48,1,'2026-04-02 09:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(49,49,1,'2026-04-02 09:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(50,50,1,'2026-04-02 10:00:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(51,51,1,'2026-04-02 10:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(52,52,1,'2026-04-02 11:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(53,53,1,'2026-04-02 11:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(54,54,1,'2026-04-02 12:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(55,55,1,'2026-04-02 12:30:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(56,56,1,'2026-04-02 13:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(57,57,1,'2026-04-02 13:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(58,58,1,'2026-04-02 14:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(59,59,1,'2026-04-02 14:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(60,60,1,'2026-04-02 15:00:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(61,61,1,'2026-04-02 15:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(62,62,1,'2026-04-02 16:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(63,63,1,'2026-04-02 16:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(64,64,1,'2026-04-02 17:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(65,65,1,'2026-04-02 17:30:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(66,66,1,'2026-04-02 18:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(67,67,1,'2026-04-02 18:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(68,68,1,'2026-04-02 19:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(69,69,1,'2026-04-02 19:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(70,70,1,'2026-04-02 20:00:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(71,71,1,'2026-04-02 20:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(72,72,1,'2026-04-02 21:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(73,73,1,'2026-04-02 21:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(74,74,1,'2026-04-02 22:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(75,75,1,'2026-04-02 22:30:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(76,76,1,'2026-04-02 23:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(77,77,1,'2026-04-02 23:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(78,78,1,'2026-04-03 00:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(79,79,1,'2026-04-03 00:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(80,80,1,'2026-04-03 01:00:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(81,81,1,'2026-04-03 01:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(82,82,1,'2026-04-03 02:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(83,83,1,'2026-04-03 02:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(84,84,1,'2026-04-03 03:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(85,85,1,'2026-04-03 03:30:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(86,86,1,'2026-04-03 04:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(87,87,1,'2026-04-03 04:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(88,88,1,'2026-04-03 05:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(89,89,1,'2026-04-03 05:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(90,90,1,'2026-04-03 06:00:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(91,91,1,'2026-04-03 06:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(92,92,1,'2026-04-03 07:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(93,93,1,'2026-04-03 07:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(94,94,1,'2026-04-03 08:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(95,95,1,'2026-04-03 08:30:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29'),(96,96,1,'2026-04-03 09:00:00','Collected','2026-04-30 13:51:29','2026-04-30 13:51:29'),(97,97,1,'2026-04-03 09:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(98,98,1,'2026-04-03 10:00:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(99,99,1,'2026-04-03 10:30:00','Resulted','2026-04-30 13:51:29','2026-04-30 13:51:29'),(100,100,1,'2026-04-03 11:00:00','Pending','2026-04-30 13:51:29','2026-04-30 13:51:29');
/*!40000 ALTER TABLE `lab_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lab_order_audit_trigger` AFTER INSERT ON `lab_orders` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        event_time,
        actor_user_id,
        action_type,
        entity_name,
        entity_pk,
        changed_columns,
        old_values_json,
        new_values_json,
        status
    )
    VALUES (
        NOW(),
        NULL,
        'INSERT',
        'lab_orders',
        NEW.lab_order_id,
        'encounter_id,ordered_by_provider_id,status',
        NULL,
        JSON_OBJECT(
            'encounter_id', NEW.encounter_id,
            'ordered_by_provider_id', NEW.ordered_by_provider_id,
            'status', NEW.status
        ),
        'SUCCESS'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lab_results`
--

DROP TABLE IF EXISTS `lab_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_results` (
  `lab_result_id` int NOT NULL AUTO_INCREMENT,
  `lab_order_id` int NOT NULL,
  `lab_test_id` int NOT NULL,
  `result_value` varchar(50) DEFAULT NULL,
  `result_datetime` datetime DEFAULT NULL,
  `flag` enum('Normal','High','Low') DEFAULT NULL,
  PRIMARY KEY (`lab_result_id`),
  KEY `lab_order_id` (`lab_order_id`,`lab_test_id`),
  KEY `idx_lab_results_result_datetime` (`result_datetime`),
  KEY `idx_lab_results_flag` (`flag`),
  CONSTRAINT `lab_results_ibfk_1` FOREIGN KEY (`lab_order_id`, `lab_test_id`) REFERENCES `lab_order_items` (`lab_order_id`, `lab_test_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_results`
--

LOCK TABLES `lab_results` WRITE;
/*!40000 ALTER TABLE `lab_results` DISABLE KEYS */;
INSERT INTO `lab_results` VALUES (1,1,1,'2.2','2026-04-01 10:00:00','Normal'),(2,1,2,'2.3','2026-04-01 10:00:00','Normal'),(3,2,3,'2.5','2026-04-01 10:30:00','Normal'),(4,2,4,'2.7','2026-04-01 10:30:00','Normal'),(5,3,5,'2.9','2026-04-01 11:00:00','Normal'),(6,3,6,'3.0','2026-04-01 11:00:00','Normal'),(7,4,7,'3.2','2026-04-01 11:30:00','Normal'),(8,4,8,'3.4','2026-04-01 11:30:00','Normal'),(9,5,9,'3.5','2026-04-01 12:00:00','Normal'),(10,5,10,'3.7','2026-04-01 12:00:00','Normal'),(11,6,11,'3.9','2026-04-01 12:30:00','Normal'),(12,6,12,'4.0','2026-04-01 12:30:00','Normal'),(13,7,13,'4.2','2026-04-01 13:00:00','Normal'),(14,7,14,'4.4','2026-04-01 13:00:00','Normal'),(15,8,15,'4.6','2026-04-01 13:30:00','Normal'),(16,8,16,'4.7','2026-04-01 13:30:00','Normal'),(17,9,17,'4.9','2026-04-01 14:00:00','High'),(18,9,18,'5.1','2026-04-01 14:00:00','Normal'),(19,10,19,'5.2','2026-04-01 14:30:00','Normal'),(20,10,20,'5.4','2026-04-01 14:30:00','Normal'),(21,11,21,'5.6','2026-04-01 15:00:00','Normal'),(22,11,22,'5.7','2026-04-01 15:00:00','Normal'),(23,12,23,'5.9','2026-04-01 15:30:00','Low'),(24,12,24,'6.1','2026-04-01 15:30:00','Normal'),(25,13,25,'6.3','2026-04-01 16:00:00','Normal'),(26,13,26,'6.4','2026-04-01 16:00:00','Normal'),(27,14,27,'6.6','2026-04-01 16:30:00','Normal'),(28,14,28,'6.8','2026-04-01 16:30:00','Normal'),(29,15,29,'6.9','2026-04-01 17:00:00','Normal'),(30,15,30,'7.1','2026-04-01 17:00:00','Normal'),(31,16,31,'7.3','2026-04-01 17:30:00','Normal'),(32,16,32,'7.4','2026-04-01 17:30:00','Normal'),(33,17,33,'7.6','2026-04-01 18:00:00','Normal'),(34,17,34,'7.8','2026-04-01 18:00:00','High'),(35,18,35,'8.0','2026-04-01 18:30:00','Normal'),(36,18,36,'8.1','2026-04-01 18:30:00','Normal'),(37,19,37,'8.3','2026-04-01 19:00:00','Normal'),(38,19,38,'8.5','2026-04-01 19:00:00','Normal'),(39,20,39,'8.6','2026-04-01 19:30:00','Normal'),(40,20,40,'8.8','2026-04-01 19:30:00','Normal'),(41,21,41,'9.0','2026-04-01 20:00:00','Normal'),(42,21,42,'9.1','2026-04-01 20:00:00','Normal'),(43,22,43,'9.3','2026-04-01 20:30:00','Normal'),(44,22,44,'9.5','2026-04-01 20:30:00','Normal'),(45,23,45,'9.7','2026-04-01 21:00:00','Normal'),(46,23,46,'9.8','2026-04-01 21:00:00','Low'),(47,24,47,'10.0','2026-04-01 21:30:00','Normal'),(48,24,48,'10.2','2026-04-01 21:30:00','Normal'),(49,25,49,'10.3','2026-04-01 22:00:00','Normal'),(50,25,50,'10.5','2026-04-01 22:00:00','Normal'),(51,26,51,'10.7','2026-04-01 22:30:00','High'),(52,26,52,'10.8','2026-04-01 22:30:00','Normal'),(53,27,53,'11.0','2026-04-01 23:00:00','Normal'),(54,27,54,'11.2','2026-04-01 23:00:00','Normal'),(55,28,55,'11.4','2026-04-01 23:30:00','Normal'),(56,28,56,'11.5','2026-04-01 23:30:00','Normal'),(57,29,57,'11.7','2026-04-02 00:00:00','Normal'),(58,29,58,'11.9','2026-04-02 00:00:00','Normal'),(59,30,59,'12.0','2026-04-02 00:30:00','Normal'),(60,30,60,'12.2','2026-04-02 00:30:00','Normal'),(61,31,61,'12.4','2026-04-02 01:00:00','Normal'),(62,31,62,'12.5','2026-04-02 01:00:00','Normal'),(63,32,63,'12.7','2026-04-02 01:30:00','Normal'),(64,32,64,'12.9','2026-04-02 01:30:00','Normal'),(65,33,65,'13.1','2026-04-02 02:00:00','Normal'),(66,33,66,'13.2','2026-04-02 02:00:00','Normal'),(67,34,67,'13.4','2026-04-02 02:30:00','Normal'),(68,34,68,'13.6','2026-04-02 02:30:00','High'),(69,35,69,'13.7','2026-04-02 03:00:00','Low'),(70,35,70,'13.9','2026-04-02 03:00:00','Normal'),(71,36,71,'14.1','2026-04-02 03:30:00','Normal'),(72,36,72,'14.2','2026-04-02 03:30:00','Normal'),(73,37,73,'14.4','2026-04-02 04:00:00','Normal'),(74,37,74,'14.6','2026-04-02 04:00:00','Normal'),(75,38,75,'14.8','2026-04-02 04:30:00','Normal'),(76,38,76,'14.9','2026-04-02 04:30:00','Normal'),(77,39,77,'15.1','2026-04-02 05:00:00','Normal'),(78,39,78,'15.3','2026-04-02 05:00:00','Normal'),(79,40,79,'15.4','2026-04-02 05:30:00','Normal'),(80,40,80,'15.6','2026-04-02 05:30:00','Normal'),(81,41,81,'15.8','2026-04-02 06:00:00','Normal'),(82,41,82,'15.9','2026-04-02 06:00:00','Normal'),(83,42,83,'16.1','2026-04-02 06:30:00','Normal'),(84,42,84,'16.3','2026-04-02 06:30:00','Normal'),(85,43,85,'16.5','2026-04-02 07:00:00','High'),(86,43,86,'16.6','2026-04-02 07:00:00','Normal'),(87,44,87,'16.8','2026-04-02 07:30:00','Normal'),(88,44,88,'17.0','2026-04-02 07:30:00','Normal'),(89,45,89,'17.1','2026-04-02 08:00:00','Normal'),(90,45,90,'17.3','2026-04-02 08:00:00','Normal'),(91,46,91,'17.5','2026-04-02 08:30:00','Normal'),(92,46,92,'17.6','2026-04-02 08:30:00','Low'),(93,47,93,'17.8','2026-04-02 09:00:00','Normal'),(94,47,94,'18.0','2026-04-02 09:00:00','Normal'),(95,48,95,'18.2','2026-04-02 09:30:00','Normal'),(96,48,96,'18.3','2026-04-02 09:30:00','Normal'),(97,49,97,'18.5','2026-04-02 10:00:00','Normal'),(98,49,98,'18.7','2026-04-02 10:00:00','Normal'),(99,50,99,'18.8','2026-04-02 10:30:00','Normal'),(100,50,100,'19.0','2026-04-02 10:30:00','Normal'),(101,51,1,'2.2','2026-04-02 11:00:00','Normal'),(102,51,2,'2.3','2026-04-02 11:00:00','Normal'),(103,52,3,'2.5','2026-04-02 11:30:00','Normal'),(104,52,4,'2.7','2026-04-02 11:30:00','Normal'),(105,53,5,'2.9','2026-04-02 12:00:00','Normal'),(106,53,6,'3.0','2026-04-02 12:00:00','Normal'),(107,54,7,'3.2','2026-04-02 12:30:00','Normal'),(108,54,8,'3.4','2026-04-02 12:30:00','Normal'),(109,55,9,'3.5','2026-04-02 13:00:00','Normal'),(110,55,10,'3.7','2026-04-02 13:00:00','Normal'),(111,56,11,'3.9','2026-04-02 13:30:00','Normal'),(112,56,12,'4.0','2026-04-02 13:30:00','Normal'),(113,57,13,'4.2','2026-04-02 14:00:00','Normal'),(114,57,14,'4.4','2026-04-02 14:00:00','Normal'),(115,58,15,'4.6','2026-04-02 14:30:00','Normal'),(116,58,16,'4.7','2026-04-02 14:30:00','Normal'),(117,59,17,'4.9','2026-04-02 15:00:00','High'),(118,59,18,'5.1','2026-04-02 15:00:00','Normal'),(119,60,19,'5.2','2026-04-02 15:30:00','Normal'),(120,60,20,'5.4','2026-04-02 15:30:00','Normal'),(121,61,21,'5.6','2026-04-02 16:00:00','Normal'),(122,61,22,'5.7','2026-04-02 16:00:00','Normal'),(123,62,23,'5.9','2026-04-02 16:30:00','Low'),(124,62,24,'6.1','2026-04-02 16:30:00','Normal'),(125,63,25,'6.3','2026-04-02 17:00:00','Normal'),(126,63,26,'6.4','2026-04-02 17:00:00','Normal'),(127,64,27,'6.6','2026-04-02 17:30:00','Normal'),(128,64,28,'6.8','2026-04-02 17:30:00','Normal'),(129,65,29,'6.9','2026-04-02 18:00:00','Normal'),(130,65,30,'7.1','2026-04-02 18:00:00','Normal'),(131,66,31,'7.3','2026-04-02 18:30:00','Normal'),(132,66,32,'7.4','2026-04-02 18:30:00','Normal'),(133,67,33,'7.6','2026-04-02 19:00:00','Normal'),(134,67,34,'7.8','2026-04-02 19:00:00','High'),(135,68,35,'8.0','2026-04-02 19:30:00','Normal'),(136,68,36,'8.1','2026-04-02 19:30:00','Normal'),(137,69,37,'8.3','2026-04-02 20:00:00','Normal'),(138,69,38,'8.5','2026-04-02 20:00:00','Normal'),(139,70,39,'8.6','2026-04-02 20:30:00','Normal'),(140,70,40,'8.8','2026-04-02 20:30:00','Normal'),(141,71,41,'9.0','2026-04-02 21:00:00','Normal'),(142,71,42,'9.1','2026-04-02 21:00:00','Normal'),(143,72,43,'9.3','2026-04-02 21:30:00','Normal'),(144,72,44,'9.5','2026-04-02 21:30:00','Normal'),(145,73,45,'9.7','2026-04-02 22:00:00','Normal'),(146,73,46,'9.8','2026-04-02 22:00:00','Low'),(147,74,47,'10.0','2026-04-02 22:30:00','Normal'),(148,74,48,'10.2','2026-04-02 22:30:00','Normal'),(149,75,49,'10.3','2026-04-02 23:00:00','Normal'),(150,75,50,'10.5','2026-04-02 23:00:00','Normal'),(151,76,51,'10.7','2026-04-02 23:30:00','High'),(152,76,52,'10.8','2026-04-02 23:30:00','Normal'),(153,77,53,'11.0','2026-04-03 00:00:00','Normal'),(154,77,54,'11.2','2026-04-03 00:00:00','Normal'),(155,78,55,'11.4','2026-04-03 00:30:00','Normal'),(156,78,56,'11.5','2026-04-03 00:30:00','Normal'),(157,79,57,'11.7','2026-04-03 01:00:00','Normal'),(158,79,58,'11.9','2026-04-03 01:00:00','Normal'),(159,80,59,'12.0','2026-04-03 01:30:00','Normal'),(160,80,60,'12.2','2026-04-03 01:30:00','Normal'),(161,81,61,'12.4','2026-04-03 02:00:00','Normal'),(162,81,62,'12.5','2026-04-03 02:00:00','Normal'),(163,82,63,'12.7','2026-04-03 02:30:00','Normal'),(164,82,64,'12.9','2026-04-03 02:30:00','Normal'),(165,83,65,'13.1','2026-04-03 03:00:00','Normal'),(166,83,66,'13.2','2026-04-03 03:00:00','Normal'),(167,84,67,'13.4','2026-04-03 03:30:00','Normal'),(168,84,68,'13.6','2026-04-03 03:30:00','High'),(169,85,69,'13.7','2026-04-03 04:00:00','Low'),(170,85,70,'13.9','2026-04-03 04:00:00','Normal'),(171,86,71,'14.1','2026-04-03 04:30:00','Normal'),(172,86,72,'14.2','2026-04-03 04:30:00','Normal'),(173,87,73,'14.4','2026-04-03 05:00:00','Normal'),(174,87,74,'14.6','2026-04-03 05:00:00','Normal'),(175,88,75,'14.8','2026-04-03 05:30:00','Normal'),(176,88,76,'14.9','2026-04-03 05:30:00','Normal'),(177,89,77,'15.1','2026-04-03 06:00:00','Normal'),(178,89,78,'15.3','2026-04-03 06:00:00','Normal'),(179,90,79,'15.4','2026-04-03 06:30:00','Normal'),(180,90,80,'15.6','2026-04-03 06:30:00','Normal'),(181,91,81,'15.8','2026-04-03 07:00:00','Normal'),(182,91,82,'15.9','2026-04-03 07:00:00','Normal'),(183,92,83,'16.1','2026-04-03 07:30:00','Normal'),(184,92,84,'16.3','2026-04-03 07:30:00','Normal'),(185,93,85,'16.5','2026-04-03 08:00:00','High'),(186,93,86,'16.6','2026-04-03 08:00:00','Normal'),(187,94,87,'16.8','2026-04-03 08:30:00','Normal'),(188,94,88,'17.0','2026-04-03 08:30:00','Normal'),(189,95,89,'17.1','2026-04-03 09:00:00','Normal'),(190,95,90,'17.3','2026-04-03 09:00:00','Normal'),(191,96,91,'17.5','2026-04-03 09:30:00','Normal'),(192,96,92,'17.6','2026-04-03 09:30:00','Low'),(193,97,93,'17.8','2026-04-03 10:00:00','Normal'),(194,97,94,'18.0','2026-04-03 10:00:00','Normal'),(195,98,95,'18.2','2026-04-03 10:30:00','Normal'),(196,98,96,'18.3','2026-04-03 10:30:00','Normal'),(197,99,97,'18.5','2026-04-03 11:00:00','Normal'),(198,99,98,'18.7','2026-04-03 11:00:00','Normal'),(199,100,99,'18.8','2026-04-03 11:30:00','Normal'),(200,100,100,'19.0','2026-04-03 11:30:00','Normal');
/*!40000 ALTER TABLE `lab_results` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lab_result_charge_trigger` AFTER INSERT ON `lab_results` FOR EACH ROW BEGIN
    DECLARE v_encounter_id INT;

    SELECT lo.encounter_id
    INTO v_encounter_id
    FROM lab_orders lo
    WHERE lo.lab_order_id = NEW.lab_order_id
    LIMIT 1;

    INSERT INTO charges (
        encounter_id,
        charge_type,
        code,
        description,
        amount,
        charge_datetime
    )
    VALUES (
        v_encounter_id,
        'Lab',
        CONCAT('LAB-', NEW.lab_test_id),
        'Lab result charge',
        75.00,
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `lab_results_report_view`
--

DROP TABLE IF EXISTS `lab_results_report_view`;
/*!50001 DROP VIEW IF EXISTS `lab_results_report_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lab_results_report_view` AS SELECT 
 1 AS `patient_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `encounter_id`,
 1 AS `lab_order_id`,
 1 AS `test_name`,
 1 AS `result_value`,
 1 AS `unit`,
 1 AS `reference_range`,
 1 AS `flag`,
 1 AS `result_datetime`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lab_tests`
--

DROP TABLE IF EXISTS `lab_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_tests` (
  `lab_test_id` int NOT NULL AUTO_INCREMENT,
  `test_name` varchar(100) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `reference_range` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lab_test_id`),
  UNIQUE KEY `test_name` (`test_name`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_tests`
--

LOCK TABLES `lab_tests` WRITE;
/*!40000 ALTER TABLE `lab_tests` DISABLE KEYS */;
INSERT INTO `lab_tests` VALUES (1,'Complete Blood Count','x10^3/uL','4.5-11.0'),(2,'White Blood Cell Count','x10^3/uL','4.5-11.0'),(3,'Red Blood Cell Count','x10^6/uL','4.2-5.9'),(4,'Hemoglobin','g/dL','12.0-17.5'),(5,'Hematocrit','%','36-53'),(6,'Platelet Count','x10^3/uL','150-450'),(7,'Mean Corpuscular Volume','fL','80-100'),(8,'Mean Corpuscular Hemoglobin','pg','27-33'),(9,'Mean Corpuscular Hemoglobin Concentration','g/dL','32-36'),(10,'Red Cell Distribution Width','%','11.5-14.5'),(11,'Neutrophils','%','40-70'),(12,'Lymphocytes','%','20-40'),(13,'Monocytes','%','2-8'),(14,'Eosinophils','%','1-4'),(15,'Basophils','%','0-1'),(16,'Reticulocyte Count','%','0.5-2.5'),(17,'ESR','mm/hr','0-20'),(18,'Glucose','mg/dL','70-99'),(19,'Hemoglobin A1C','%','4.0-5.6'),(20,'Blood Urea Nitrogen','mg/dL','7-20'),(21,'Creatinine','mg/dL','0.6-1.3'),(22,'eGFR','mL/min/1.73m2','>=60'),(23,'Sodium','mmol/L','135-145'),(24,'Potassium','mmol/L','3.5-5.1'),(25,'Chloride','mmol/L','98-107'),(26,'Carbon Dioxide','mmol/L','22-29'),(27,'Calcium','mg/dL','8.6-10.2'),(28,'Ionized Calcium','mmol/L','1.12-1.32'),(29,'Magnesium','mg/dL','1.7-2.2'),(30,'Phosphorus','mg/dL','2.5-4.5'),(31,'Albumin','g/dL','3.5-5.0'),(32,'Total Protein','g/dL','6.0-8.3'),(33,'Anion Gap','mmol/L','8-16'),(34,'Osmolality','mOsm/kg','275-295'),(35,'Uric Acid','mg/dL','3.5-7.2'),(36,'Lactic Acid','mmol/L','0.5-2.2'),(37,'AST','U/L','10-40'),(38,'ALT','U/L','7-56'),(39,'Alkaline Phosphatase','U/L','44-147'),(40,'Total Bilirubin','mg/dL','0.1-1.2'),(41,'Direct Bilirubin','mg/dL','0.0-0.3'),(42,'Indirect Bilirubin','mg/dL','0.2-0.9'),(43,'GGT','U/L','9-48'),(44,'Ammonia','umol/L','15-45'),(45,'Lipase','U/L','0-160'),(46,'Amylase','U/L','30-110'),(47,'Troponin I','ng/mL','0.00-0.04'),(48,'Troponin T','ng/mL','0.00-0.01'),(49,'CK','U/L','30-200'),(50,'CK-MB','ng/mL','0.0-5.0'),(51,'BNP','pg/mL','0-100'),(52,'NT-proBNP','pg/mL','0-125'),(53,'Prothrombin Time','sec','11-13.5'),(54,'INR','','0.8-1.1'),(55,'aPTT','sec','25-35'),(56,'Fibrinogen','mg/dL','200-400'),(57,'D-Dimer','ng/mL','0-500'),(58,'Total Cholesterol','mg/dL','<200'),(59,'HDL Cholesterol','mg/dL','40-60'),(60,'LDL Cholesterol','mg/dL','<100'),(61,'Triglycerides','mg/dL','<150'),(62,'VLDL Cholesterol','mg/dL','5-40'),(63,'TSH','uIU/mL','0.4-4.0'),(64,'Free T4','ng/dL','0.8-1.8'),(65,'Free T3','pg/mL','2.3-4.2'),(66,'Cortisol','ug/dL','6-23'),(67,'Insulin','uIU/mL','2-25'),(68,'Parathyroid Hormone','pg/mL','10-65'),(69,'Vitamin D 25-Hydroxy','ng/mL','30-100'),(70,'Iron','mcg/dL','60-170'),(71,'Ferritin','ng/mL','12-300'),(72,'TIBC','mcg/dL','240-450'),(73,'Transferrin Saturation','%','20-50'),(74,'Vitamin B12','pg/mL','200-900'),(75,'Folate','ng/mL','2.7-17.0'),(76,'Prealbumin','mg/dL','15-36'),(77,'C-Reactive Protein','mg/L','0.0-10.0'),(78,'Procalcitonin','ng/mL','0.00-0.10'),(79,'Rheumatoid Factor','IU/mL','<14'),(80,'ANA','','Negative'),(81,'Arterial Blood Gas - pH','','7.35-7.45'),(82,'Arterial Blood Gas - pCO2','mmHg','35-45'),(83,'Arterial Blood Gas - pO2','mmHg','80-100'),(84,'Arterial Blood Gas - HCO3','mmol/L','22-26'),(85,'Arterial Blood Gas - O2 Saturation','%','95-100'),(86,'Urinalysis - pH','','4.5-8.0'),(87,'Urinalysis - Specific Gravity','','1.005-1.030'),(88,'Urinalysis - Protein','','Negative'),(89,'Urinalysis - Glucose','','Negative'),(90,'Urinalysis - Ketones','','Negative'),(91,'Urinalysis - Blood','','Negative'),(92,'Urinalysis - Nitrite','','Negative'),(93,'Urinalysis - Leukocyte Esterase','','Negative'),(94,'Urinalysis - WBC','/HPF','0-5'),(95,'Urinalysis - RBC','/HPF','0-2'),(96,'Urinalysis - Bacteria','','None Seen'),(97,'Blood Culture','','No Growth'),(98,'Urine Culture','','No Growth'),(99,'Sputum Culture','','No Growth'),(100,'Wound Culture','','No Growth'),(101,'COVID-19 PCR','','Negative'),(102,'Influenza A/B','','Negative'),(103,'RSV','','Negative'),(104,'Rapid Strep','','Negative'),(105,'Mononucleosis Screen','','Negative'),(106,'Hepatitis B Surface Antigen','','Negative'),(107,'Hepatitis C Antibody','','Negative'),(108,'HIV 1/2 Antigen/Antibody','','Negative'),(109,'Pregnancy Test hCG','mIU/mL','Negative'),(110,'Quantitative hCG','mIU/mL','0-5'),(111,'PSA','ng/mL','0.0-4.0'),(112,'Ethanol Level','mg/dL','0'),(113,'Acetaminophen Level','mcg/mL','10-30'),(114,'Salicylate Level','mg/dL','10-30'),(115,'Urine Drug Screen','','Negative'),(116,'CEA','ng/mL','0.0-3.0'),(117,'CA-125','U/mL','0-35'),(118,'CA 19-9','U/mL','0-37'),(119,'AFP','ng/mL','0-10');
/*!40000 ALTER TABLE `lab_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication_orders`
--

DROP TABLE IF EXISTS `medication_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication_orders` (
  `med_order_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `ordered_by_provider_id` int DEFAULT NULL,
  `medication_id` int NOT NULL,
  `dose` varchar(50) DEFAULT NULL,
  `route` varchar(50) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `status` enum('Active','Stopped','Completed','OnHold') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`med_order_id`),
  KEY `ordered_by_provider_id` (`ordered_by_provider_id`),
  KEY `medication_id` (`medication_id`),
  KEY `idx_med_order_encounter` (`encounter_id`),
  KEY `idx_med_orders_status` (`status`),
  CONSTRAINT `medication_orders_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `medication_orders_ibfk_2` FOREIGN KEY (`ordered_by_provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `medication_orders_ibfk_3` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`medication_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_orders`
--

LOCK TABLES `medication_orders` WRITE;
/*!40000 ALTER TABLE `medication_orders` DISABLE KEYS */;
INSERT INTO `medication_orders` VALUES (1,1,1,1,'500 mg','PO','Q6H PRN','2026-04-01 10:00:00','2026-04-05 10:00:00','Completed'),(2,2,2,7,'81 mg','PO','Daily','2026-04-01 10:30:00',NULL,'Active'),(3,3,3,30,'4 mg','PO','Q8H PRN','2026-04-01 11:00:00',NULL,'Active'),(4,4,4,4,'50 mg','PO','PRN migraine','2026-04-01 11:30:00','2026-04-10 11:30:00','Active'),(5,5,5,2,'400 mg','PO','Q8H PRN','2026-04-01 12:00:00','2026-04-07 12:00:00','Completed'),(6,6,6,18,'2 puffs','Inhalation','Q4H PRN','2026-04-01 12:30:00','2026-04-06 12:30:00','Active'),(7,7,7,12,'50 mg','PO','BID','2026-04-01 13:00:00',NULL,'Active'),(8,8,8,23,'20 mg','PO','Daily','2026-04-01 13:30:00','2026-04-15 13:30:00','Active'),(9,9,9,14,'500 mg','PO','BID','2026-04-01 14:00:00',NULL,'Active'),(10,10,10,31,'10 mg','PO','Daily','2026-04-01 14:30:00',NULL,'Active'),(11,11,11,2,'400 mg','PO','Q8H PRN','2026-04-01 15:00:00','2026-04-10 15:00:00','Completed'),(12,12,12,15,'10 units','SubQ','Nightly','2026-04-01 15:30:00',NULL,'Active'),(13,13,13,35,'5 mg','PO','BID','2026-04-02 09:00:00',NULL,'Active'),(14,14,14,42,'10 mg','PO','Daily','2026-04-02 09:30:00','2026-04-12 09:30:00','Completed'),(15,15,15,1,'500 mg','PO','Q6H PRN','2026-04-02 10:00:00','2026-04-06 10:00:00','Completed'),(16,16,1,8,'10 mg','PO','Daily','2026-04-02 10:30:00',NULL,'Active'),(17,17,2,11,'50 mg','PO','BID','2026-04-02 11:00:00',NULL,'Active'),(18,18,3,5,'1 mg','IV','Q4H PRN','2026-04-02 11:30:00','2026-04-05 11:30:00','Completed'),(19,19,4,3,'250 mg','PO','BID PRN','2026-04-02 12:00:00','2026-04-09 12:00:00','Completed'),(20,20,5,4,'50 mg','PO','PRN migraine','2026-04-02 12:30:00','2026-04-12 12:30:00','Active'),(21,21,6,19,'1 vial','Neb','Q6H','2026-04-02 13:00:00','2026-04-07 13:00:00','Completed'),(22,22,7,30,'4 mg','PO','Q8H PRN','2026-04-02 13:30:00','2026-04-05 13:30:00','Completed'),(23,23,8,7,'81 mg','PO','Daily','2026-04-02 14:00:00',NULL,'Active'),(24,24,9,29,'1 g','IV','Q24H','2026-04-02 14:30:00','2026-04-09 14:30:00','Completed'),(25,25,10,1,'500 mg','PO','Q6H PRN','2026-04-03 09:00:00','2026-04-06 09:00:00','Completed'),(26,26,11,2,'400 mg','PO','Q8H PRN','2026-04-03 09:30:00','2026-04-10 09:30:00','Completed'),(27,27,12,34,'1 mg','PO','Q8H PRN','2026-04-03 10:00:00','2026-04-07 10:00:00','Completed'),(28,28,13,35,'5 mg','PO','BID','2026-04-03 10:30:00',NULL,'Active'),(29,29,14,42,'10 mg','PO','Daily','2026-04-03 11:00:00',NULL,'Active'),(30,30,15,7,'81 mg','PO','Daily','2026-04-03 11:30:00',NULL,'Active'),(31,31,1,29,'1 g','IV','Q24H','2026-04-03 12:00:00','2026-04-10 12:00:00','Completed'),(32,32,2,1,'500 mg','PO','Q6H PRN','2026-04-03 12:30:00','2026-04-06 12:30:00','Completed'),(33,33,3,3,'250 mg','PO','BID PRN','2026-04-03 13:00:00','2026-04-10 13:00:00','Completed'),(34,34,4,4,'50 mg','PO','PRN migraine','2026-04-03 13:30:00',NULL,'Active'),(35,35,5,18,'2 puffs','Inhalation','Q4H PRN','2026-04-03 14:00:00',NULL,'Active'),(36,36,6,24,'40 mg','PO','Daily','2026-04-03 14:30:00','2026-04-13 14:30:00','Active'),(37,37,7,7,'81 mg','PO','Daily','2026-04-04 09:00:00',NULL,'Active'),(38,38,8,29,'1 g','IV','Q24H','2026-04-04 09:30:00','2026-04-11 09:30:00','Completed'),(39,39,9,42,'10 mg','PO','Daily','2026-04-04 10:00:00','2026-04-14 10:00:00','Completed'),(40,40,10,2,'400 mg','PO','Q8H PRN','2026-04-04 10:30:00','2026-04-09 10:30:00','Completed'),(41,41,11,35,'5 mg','PO','BID','2026-04-04 11:00:00',NULL,'Active'),(42,42,12,18,'2 puffs','Inhalation','Q4H PRN','2026-04-04 11:30:00','2026-04-09 11:30:00','Completed'),(43,43,13,42,'10 mg','PO','Daily','2026-04-04 12:00:00',NULL,'Active'),(44,44,14,11,'50 mg','PO','BID','2026-04-04 12:30:00',NULL,'Active'),(45,45,15,29,'1 g','IV','Q24H','2026-04-04 13:00:00','2026-04-12 13:00:00','Completed'),(46,46,1,27,'250 mg','PO','Daily x5 days','2026-04-04 13:30:00','2026-04-09 13:30:00','Completed'),(47,47,2,2,'400 mg','PO','Q8H PRN','2026-04-04 14:00:00','2026-04-11 14:00:00','Completed'),(48,48,3,34,'1 mg','PO','Q8H PRN','2026-04-04 14:30:00','2026-04-08 14:30:00','Completed'),(49,49,4,18,'2 puffs','Inhalation','Q4H PRN','2026-04-05 09:00:00',NULL,'Active'),(50,50,5,42,'10 mg','PO','Daily','2026-04-05 09:30:00',NULL,'Active'),(51,51,6,8,'10 mg','PO','Daily','2026-04-05 10:00:00',NULL,'Active'),(52,52,7,29,'1 g','IV','Q24H','2026-04-05 10:30:00','2026-04-13 10:30:00','Completed'),(53,53,8,42,'10 mg','PO','Daily','2026-04-05 11:00:00',NULL,'Active'),(54,54,9,2,'400 mg','PO','Q8H PRN','2026-04-05 11:30:00','2026-04-12 11:30:00','Completed'),(55,55,10,35,'5 mg','PO','BID','2026-04-05 12:00:00',NULL,'Active'),(56,56,11,18,'2 puffs','Inhalation','Q4H PRN','2026-04-05 12:30:00','2026-04-11 12:30:00','Completed'),(57,57,12,42,'10 mg','PO','Daily','2026-04-05 13:00:00',NULL,'Active'),(58,58,13,11,'50 mg','PO','BID','2026-04-05 13:30:00',NULL,'Active'),(59,59,14,29,'1 g','IV','Q24H','2026-04-05 14:00:00','2026-04-12 14:00:00','Completed'),(60,60,15,27,'250 mg','PO','Daily x5 days','2026-04-05 14:30:00','2026-04-10 14:30:00','Completed'),(61,61,1,2,'400 mg','PO','Q8H PRN','2026-04-06 09:00:00','2026-04-13 09:00:00','Completed'),(62,62,2,34,'1 mg','PO','Q8H PRN','2026-04-06 09:30:00','2026-04-10 09:30:00','Completed'),(63,63,3,18,'2 puffs','Inhalation','Q4H PRN','2026-04-06 10:00:00',NULL,'Active'),(64,64,4,42,'10 mg','PO','Daily','2026-04-06 10:30:00',NULL,'Active'),(65,65,5,7,'81 mg','PO','Daily','2026-04-06 11:00:00',NULL,'Active'),(66,66,6,29,'1 g','IV','Q24H','2026-04-06 11:30:00','2026-04-13 11:30:00','Completed'),(67,67,7,42,'10 mg','PO','Daily','2026-04-06 12:00:00',NULL,'Active'),(68,68,8,2,'400 mg','PO','Q8H PRN','2026-04-06 12:30:00','2026-04-13 12:30:00','Completed'),(69,69,9,35,'5 mg','PO','BID','2026-04-06 13:00:00',NULL,'Active'),(70,70,10,18,'2 puffs','Inhalation','Q4H PRN','2026-04-06 13:30:00','2026-04-12 13:30:00','Completed'),(71,71,11,42,'10 mg','PO','Daily','2026-04-06 14:00:00',NULL,'Active'),(72,72,12,11,'50 mg','PO','BID','2026-04-06 14:30:00',NULL,'Active'),(73,73,13,29,'1 g','IV','Q24H','2026-04-07 09:00:00','2026-04-14 09:00:00','Completed'),(74,74,14,27,'250 mg','PO','Daily x5 days','2026-04-07 09:30:00','2026-04-12 09:30:00','Completed'),(75,75,15,2,'400 mg','PO','Q8H PRN','2026-04-07 10:00:00','2026-04-14 10:00:00','Completed'),(76,76,1,18,'2 puffs','Inhalation','Q4H PRN','2026-04-07 10:30:00',NULL,'Active'),(77,77,2,7,'81 mg','PO','Daily','2026-04-07 11:00:00',NULL,'Active'),(78,78,3,42,'10 mg','PO','Daily','2026-04-07 11:30:00',NULL,'Active'),(79,79,4,11,'50 mg','PO','BID','2026-04-07 12:00:00',NULL,'Active'),(80,80,5,29,'1 g','IV','Q24H','2026-04-07 12:30:00','2026-04-14 12:30:00','Completed'),(81,81,6,42,'10 mg','PO','Daily','2026-04-07 13:00:00',NULL,'Active'),(82,82,7,2,'400 mg','PO','Q8H PRN','2026-04-07 13:30:00','2026-04-14 13:30:00','Completed'),(83,83,8,35,'5 mg','PO','BID','2026-04-07 14:00:00',NULL,'Active'),(84,84,9,18,'2 puffs','Inhalation','Q4H PRN','2026-04-07 14:30:00',NULL,'Active'),(85,85,10,42,'10 mg','PO','Daily','2026-04-08 09:00:00',NULL,'Active'),(86,86,11,7,'81 mg','PO','Daily','2026-04-08 09:30:00',NULL,'Active'),(87,87,12,29,'1 g','IV','Q24H','2026-04-08 10:00:00','2026-04-15 10:00:00','Completed'),(88,88,13,42,'10 mg','PO','Daily','2026-04-08 10:30:00',NULL,'Active'),(89,89,14,2,'400 mg','PO','Q8H PRN','2026-04-08 11:00:00','2026-04-15 11:00:00','Completed'),(90,90,15,4,'50 mg','PO','PRN migraine','2026-04-08 11:30:00',NULL,'Active'),(91,91,1,18,'2 puffs','Inhalation','Q4H PRN','2026-04-08 12:00:00',NULL,'Active'),(92,92,2,42,'10 mg','PO','Daily','2026-04-08 12:30:00',NULL,'Active'),(93,93,3,11,'50 mg','PO','BID','2026-04-08 13:00:00',NULL,'Active'),(94,94,4,29,'1 g','IV','Q24H','2026-04-08 13:30:00','2026-04-15 13:30:00','Completed'),(95,95,5,27,'250 mg','PO','Daily x5 days','2026-04-08 14:00:00','2026-04-13 14:00:00','Completed'),(96,96,6,2,'400 mg','PO','Q8H PRN','2026-04-08 14:30:00','2026-04-15 14:30:00','Completed'),(97,97,7,4,'50 mg','PO','PRN migraine','2026-04-09 09:00:00',NULL,'Active'),(98,98,8,18,'2 puffs','Inhalation','Q4H PRN','2026-04-09 09:30:00',NULL,'Active'),(99,99,9,42,'10 mg','PO','Daily','2026-04-09 10:00:00',NULL,'Active'),(100,100,10,7,'81 mg','PO','Daily','2026-04-09 10:30:00',NULL,'Active');
/*!40000 ALTER TABLE `medication_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `medication_order_charge_trigger` AFTER INSERT ON `medication_orders` FOR EACH ROW BEGIN
    INSERT INTO charges (
        encounter_id,
        charge_type,
        code,
        description,
        amount,
        charge_datetime
    )
    VALUES (
        NEW.encounter_id,
        'Medication',
        CONCAT('MED-', NEW.medication_id),
        'Medication order charge',
        50.00,
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `medication_id` int NOT NULL AUTO_INCREMENT,
  `med_name` varchar(100) NOT NULL,
  `strength` varchar(50) DEFAULT NULL,
  `form` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`medication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (1,'Acetaminophen','500 mg','Tablet'),(2,'Ibuprofen','400 mg','Tablet'),(3,'Naproxen','250 mg','Tablet'),(4,'Morphine','2 mg/mL','Injection'),(5,'Hydromorphone','1 mg/mL','Injection'),(6,'Oxycodone','5 mg','Tablet'),(7,'Aspirin','81 mg','Tablet'),(8,'Lisinopril','10 mg','Tablet'),(9,'Losartan','50 mg','Tablet'),(10,'Amlodipine','5 mg','Tablet'),(11,'Metoprolol','50 mg','Tablet'),(12,'Atorvastatin','20 mg','Tablet'),(13,'Nitroglycerin','0.4 mg','Sublingual'),(14,'Metformin','500 mg','Tablet'),(15,'Insulin Glargine','100 units/mL','Injection'),(16,'Insulin Lispro','100 units/mL','Injection'),(17,'Glipizide','5 mg','Tablet'),(18,'Albuterol','90 mcg','Inhaler'),(19,'Ipratropium','0.02%','Nebulizer'),(20,'Fluticasone','110 mcg','Inhaler'),(21,'Prednisone','20 mg','Tablet'),(22,'Omeprazole','20 mg','Capsule'),(23,'Pantoprazole','40 mg','Tablet'),(24,'Ondansetron','4 mg','Tablet'),(25,'Metoclopramide','10 mg','Tablet'),(26,'Loperamide','2 mg','Capsule'),(27,'Amoxicillin','500 mg','Capsule'),(28,'Azithromycin','250 mg','Tablet'),(29,'Ciprofloxacin','500 mg','Tablet'),(30,'Ceftriaxone','1 g','Injection'),(31,'Vancomycin','1 g','Injection'),(32,'Doxycycline','100 mg','Capsule'),(33,'Sertraline','50 mg','Tablet'),(34,'Fluoxetine','20 mg','Capsule'),(35,'Diazepam','5 mg','Tablet'),(36,'Lorazepam','1 mg','Tablet'),(37,'Gabapentin','300 mg','Capsule'),(38,'Levothyroxine','50 mcg','Tablet'),(39,'Hydrocortisone','100 mg','Injection'),(40,'Diphenhydramine','25 mg','Capsule'),(41,'Loratadine','10 mg','Tablet'),(42,'Heparin','5000 units/mL','Injection'),(43,'Warfarin','5 mg','Tablet'),(44,'Enoxaparin','40 mg','Injection'),(45,'Potassium Chloride','20 mEq','Tablet'),(46,'Sodium Chloride','0.9%','IV Solution'),(47,'Magnesium Sulfate','1 g','Injection'),(48,'Epinephrine','1 mg/mL','Injection'),(49,'Naloxone','0.4 mg/mL','Injection'),(50,'Atropine','1 mg','Injection'),(51,'Furosemide','40 mg','Tablet'),(52,'Spironolactone','25 mg','Tablet'),(53,'Allopurinol','100 mg','Tablet'),(54,'Tamsulosin','0.4 mg','Capsule'),(55,'Sildenafil','50 mg','Tablet');
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_types`
--

DROP TABLE IF EXISTS `note_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note_types` (
  `note_type_id` int NOT NULL AUTO_INCREMENT,
  `note_type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`note_type_id`),
  UNIQUE KEY `note_type_name` (`note_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_types`
--

LOCK TABLES `note_types` WRITE;
/*!40000 ALTER TABLE `note_types` DISABLE KEYS */;
INSERT INTO `note_types` VALUES (3,'Admission'),(17,'Behavioral Health'),(19,'Care Plan'),(15,'Case Management'),(10,'Consult'),(21,'Critical Care'),(5,'Discharge'),(2,'ER'),(7,'Follow-Up'),(13,'Lab'),(8,'Nursing'),(11,'Operative'),(14,'Pharmacy'),(6,'Procedure'),(4,'Progress'),(12,'Radiology'),(1,'SOAP'),(16,'Social Work'),(18,'Telehealth'),(20,'Transfer'),(9,'Triage');
/*!40000 ALTER TABLE `note_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `open_encounters_view`
--

DROP TABLE IF EXISTS `open_encounters_view`;
/*!50001 DROP VIEW IF EXISTS `open_encounters_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `open_encounters_view` AS SELECT 
 1 AS `encounter_id`,
 1 AS `patient_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `department_name`,
 1 AS `encounter_type`,
 1 AS `admit_datetime`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patient_accounts`
--

DROP TABLE IF EXISTS `patient_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_accounts` (
  `patient_account_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `account_status` enum('Active','Locked','Inactive') NOT NULL DEFAULT 'Active',
  `email` varchar(150) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`patient_account_id`),
  UNIQUE KEY `patient_id` (`patient_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `patient_accounts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_accounts`
--

LOCK TABLES `patient_accounts` WRITE;
/*!40000 ALTER TABLE `patient_accounts` DISABLE KEYS */;
INSERT INTO `patient_accounts` VALUES (1,1,'john.doe','$2y$10$phash1','Active','john.doe@email.com','2026-04-30 13:51:29'),(2,2,'jane.smith','$2y$10$phash2','Active','jane.smith@email.com','2026-04-30 13:51:29'),(3,3,'david.lee','$2y$10$phash3','Active','david.lee@email.com','2026-04-30 13:51:29'),(4,4,'maria.garcia','$2y$10$phash4','Active','maria.garcia@email.com','2026-04-30 13:51:29'),(5,5,'chris.taylor','$2y$10$phash5','Active','chris.taylor@email.com','2026-04-30 13:51:29'),(6,6,'alex.brown','$2y$10$phash6','Active','alex.brown@email.com','2026-04-30 13:51:29'),(7,7,'linda.white','$2y$10$phash7','Active','linda.white@email.com','2026-04-30 13:51:29'),(8,8,'kevin.hall','$2y$10$phash8','Active','kevin.hall@email.com','2026-04-30 13:51:29'),(9,9,'susan.king','$2y$10$phash9','Active','susan.king@email.com','2026-04-30 13:51:29'),(10,10,'paul.green','$2y$10$phash10','Active','paul.green@email.com','2026-04-30 13:51:29'),(11,11,'amy.adams','$2y$10$phash11','Active','amy.adams@email.com','2026-04-30 13:51:29'),(12,12,'jason.scott','$2y$10$phash12','Active','jason.scott@email.com','2026-04-30 13:51:29'),(13,13,'rachel.evans','$2y$10$phash13','Active','rachel.evans@email.com','2026-04-30 13:51:29'),(14,14,'brian.turner','$2y$10$phash14','Active','brian.turner@email.com','2026-04-30 13:51:29'),(15,15,'laura.parker','$2y$10$phash15','Active','laura.parker@email.com','2026-04-30 13:51:29'),(16,16,'steve.carter','$2y$10$phash16','Active','steve.carter@email.com','2026-04-30 13:51:29'),(17,17,'angela.phillips','$2y$10$phash17','Active','angela.phillips@email.com','2026-04-30 13:51:29'),(18,18,'mark.campbell','$2y$10$phash18','Active','mark.campbell@email.com','2026-04-30 13:51:29'),(19,19,'helen.roberts','$2y$10$phash19','Active','helen.roberts@email.com','2026-04-30 13:51:29'),(20,20,'george.mitchell','$2y$10$phash20','Active','george.mitchell@email.com','2026-04-30 13:51:29'),(21,21,'nancy.collins','$2y$10$phash21','Active','nancy.collins@email.com','2026-04-30 13:51:29'),(22,22,'frank.stewart','$2y$10$phash22','Active','frank.stewart@email.com','2026-04-30 13:51:29'),(23,23,'emma.sanchez','$2y$10$phash23','Active','emma.sanchez@email.com','2026-04-30 13:51:29'),(24,24,'daniel.morris','$2y$10$phash24','Active','daniel.morris@email.com','2026-04-30 13:51:29'),(25,25,'oliver.rogers','$2y$10$phash25','Active','oliver.rogers@email.com','2026-04-30 13:51:29'),(26,26,'mia.reed','$2y$10$phash26','Active','mia.reed@email.com','2026-04-30 13:51:29'),(27,27,'noah.cook','$2y$10$phash27','Active','noah.cook@email.com','2026-04-30 13:51:29'),(28,28,'ava.bell','$2y$10$phash28','Active','ava.bell@email.com','2026-04-30 13:51:29'),(29,29,'liam.bailey','$2y$10$phash29','Locked','liam.bailey@email.com','2026-04-30 13:51:29'),(30,30,'zoe.rivera','$2y$10$phash30','Active','zoe.rivera@email.com','2026-04-30 13:51:29'),(31,31,'ethan.cooper','$2y$10$phash31','Active','ethan.cooper@email.com','2026-04-30 13:51:29'),(32,32,'ella.richardson','$2y$10$phash32','Active','ella.richardson@email.com','2026-04-30 13:51:29'),(33,33,'jack.cox','$2y$10$phash33','Active','jack.cox@email.com','2026-04-30 13:51:29'),(34,34,'lily.howard','$2y$10$phash34','Active','lily.howard@email.com','2026-04-30 13:51:29'),(35,35,'logan.ward','$2y$10$phash35','Inactive','logan.ward@email.com','2026-04-30 13:51:29'),(36,36,'scarlett.torres','$2y$10$phash36','Active','scarlett.torres@email.com','2026-04-30 13:51:29'),(37,37,'aiden.peterson','$2y$10$phash37','Active','aiden.peterson@email.com','2026-04-30 13:51:29'),(38,38,'grace.gray','$2y$10$phash38','Active','grace.gray@email.com','2026-04-30 13:51:29'),(39,39,'lucas.ramirez','$2y$10$phash39','Active','lucas.ramirez@email.com','2026-04-30 13:51:29'),(40,40,'chloe.james','$2y$10$phash40','Active','chloe.james@email.com','2026-04-30 13:51:29');
/*!40000 ALTER TABLE `patient_accounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `patient_account_audit_trigger` AFTER INSERT ON `patient_accounts` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        event_time,
        actor_user_id,
        action_type,
        entity_name,
        entity_pk,
        changed_columns,
        old_values_json,
        new_values_json,
        status
    )
    VALUES (
        NOW(),
        NULL,
        'INSERT',
        'patient_accounts',
        NEW.patient_account_id,
        'username,account_status,email',
        NULL,
        JSON_OBJECT(
            'username', NEW.username,
            'account_status', NEW.account_status,
            'email', NEW.email
        ),
        'SUCCESS'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patient_addresses`
--

DROP TABLE IF EXISTS `patient_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_addresses` (
  `patient_address_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `line1` varchar(150) NOT NULL,
  `line2` varchar(150) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(100) DEFAULT 'USA',
  `address_type` varchar(100) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`patient_address_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `patient_addresses_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_addresses`
--

LOCK TABLES `patient_addresses` WRITE;
/*!40000 ALTER TABLE `patient_addresses` DISABLE KEYS */;
INSERT INTO `patient_addresses` VALUES (1,1,'200 Main St',NULL,'Minneapolis','MN','55401','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(2,2,'201 Main St','Apt 1','Saint Paul','MN','55101','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(3,3,'202 Oak St',NULL,'Duluth','MN','55801','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(4,4,'203 Pine St',NULL,'Rochester','MN','55901','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(5,5,'204 Cedar Ave','Apt 2','Bloomington','MN','55420','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(6,6,'205 Birch Rd',NULL,'Eagan','MN','55121','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(7,7,'206 Maple Dr',NULL,'St Cloud','MN','56301','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(8,8,'207 Elm St','Suite 1','Mankato','MN','56001','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(9,9,'208 Walnut St',NULL,'Woodbury','MN','55125','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(10,10,'209 Chestnut Ave',NULL,'Maple Grove','MN','55311','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(11,11,'210 Lake St',NULL,'Burnsville','MN','55306','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(12,12,'211 River Rd','Apt 3','Plymouth','MN','55441','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(13,13,'212 Hill St',NULL,'Eden Prairie','MN','55344','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(14,14,'213 Valley Rd',NULL,'Lakeville','MN','55044','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(15,15,'214 Forest Dr','Suite 2','Brooklyn Park','MN','55443','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(16,16,'215 Sunset Blvd',NULL,'Blaine','MN','55434','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(17,17,'216 Sunrise Ave',NULL,'Apple Valley','MN','55124','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(18,18,'217 Park Ave',NULL,'Edina','MN','55439','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(19,19,'218 Spring St',NULL,'Shakopee','MN','55379','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(20,20,'219 Summer St','Apt 4','Prior Lake','MN','55372','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(21,21,'220 Main St',NULL,'Minneapolis','MN','55402','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(22,22,'221 Main St','Apt 5','Saint Paul','MN','55102','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(23,23,'222 Oak St',NULL,'Duluth','MN','55802','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(24,24,'223 Pine St',NULL,'Rochester','MN','55902','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(25,25,'224 Cedar Ave','Apt 6','Bloomington','MN','55421','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(26,26,'225 Birch Rd',NULL,'Eagan','MN','55122','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(27,27,'226 Maple Dr',NULL,'St Cloud','MN','56302','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(28,28,'227 Elm St','Suite 3','Mankato','MN','56002','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(29,29,'228 Walnut St',NULL,'Woodbury','MN','55126','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(30,30,'229 Chestnut Ave',NULL,'Maple Grove','MN','55312','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(31,31,'230 Lake St',NULL,'Burnsville','MN','55307','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(32,32,'231 River Rd','Apt 7','Plymouth','MN','55442','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(33,33,'232 Hill St',NULL,'Eden Prairie','MN','55345','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(34,34,'233 Valley Rd',NULL,'Lakeville','MN','55045','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(35,35,'234 Forest Dr','Suite 4','Brooklyn Park','MN','55444','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(36,36,'235 Sunset Blvd',NULL,'Blaine','MN','55435','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(37,37,'236 Sunrise Ave',NULL,'Apple Valley','MN','55125','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(38,38,'237 Park Ave',NULL,'Edina','MN','55440','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(39,39,'238 Spring St',NULL,'Shakopee','MN','55380','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(40,40,'239 Summer St','Apt 8','Prior Lake','MN','55373','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(41,41,'240 Main St',NULL,'Minneapolis','MN','55403','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(42,42,'241 Main St','Apt 9','Saint Paul','MN','55103','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(43,43,'242 Oak St',NULL,'Duluth','MN','55803','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(44,44,'243 Pine St',NULL,'Rochester','MN','55903','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(45,45,'244 Cedar Ave','Apt 10','Bloomington','MN','55422','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(46,46,'245 Birch Rd',NULL,'Eagan','MN','55123','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(47,47,'246 Maple Dr',NULL,'St Cloud','MN','56303','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(48,48,'247 Elm St','Suite 5','Mankato','MN','56003','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(49,49,'248 Walnut St',NULL,'Woodbury','MN','55127','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(50,50,'249 Chestnut Ave',NULL,'Maple Grove','MN','55313','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(51,51,'250 Lake St',NULL,'Burnsville','MN','55308','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(52,52,'251 River Rd','Apt 11','Plymouth','MN','55443','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(53,53,'252 Hill St',NULL,'Eden Prairie','MN','55346','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(54,54,'253 Valley Rd',NULL,'Lakeville','MN','55046','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(55,55,'254 Forest Dr','Suite 6','Brooklyn Park','MN','55445','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(56,56,'255 Sunset Blvd',NULL,'Blaine','MN','55436','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(57,57,'256 Sunrise Ave',NULL,'Apple Valley','MN','55126','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(58,58,'257 Park Ave',NULL,'Edina','MN','55441','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(59,59,'258 Spring St',NULL,'Shakopee','MN','55381','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(60,60,'259 Summer St','Apt 12','Prior Lake','MN','55374','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(61,61,'260 Main St',NULL,'Minneapolis','MN','55404','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(62,62,'261 Main St','Apt 13','Saint Paul','MN','55104','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(63,63,'262 Oak St',NULL,'Duluth','MN','55804','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(64,64,'263 Pine St',NULL,'Rochester','MN','55904','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(65,65,'264 Cedar Ave','Apt 14','Bloomington','MN','55423','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(66,66,'265 Birch Rd',NULL,'Eagan','MN','55124','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(67,67,'266 Maple Dr',NULL,'St Cloud','MN','56304','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(68,68,'267 Elm St','Suite 7','Mankato','MN','56004','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(69,69,'268 Walnut St',NULL,'Woodbury','MN','55128','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(70,70,'269 Chestnut Ave',NULL,'Maple Grove','MN','55314','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(71,71,'270 Lake St',NULL,'Burnsville','MN','55309','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(72,72,'271 River Rd','Apt 15','Plymouth','MN','55444','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(73,73,'272 Hill St',NULL,'Eden Prairie','MN','55347','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(74,74,'273 Valley Rd',NULL,'Lakeville','MN','55047','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(75,75,'274 Forest Dr','Suite 8','Brooklyn Park','MN','55446','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(76,76,'275 Sunset Blvd',NULL,'Blaine','MN','55437','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(77,77,'276 Sunrise Ave',NULL,'Apple Valley','MN','55127','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(78,78,'277 Park Ave',NULL,'Edina','MN','55442','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(79,79,'278 Spring St',NULL,'Shakopee','MN','55382','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(80,80,'279 Summer St','Apt 16','Prior Lake','MN','55375','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(81,81,'280 Main St',NULL,'Minneapolis','MN','55405','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(82,82,'281 Main St','Apt 17','Saint Paul','MN','55105','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(83,83,'282 Oak St',NULL,'Duluth','MN','55805','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(84,84,'283 Pine St',NULL,'Rochester','MN','55905','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(85,85,'284 Cedar Ave','Apt 18','Bloomington','MN','55424','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(86,86,'285 Birch Rd',NULL,'Eagan','MN','55125','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(87,87,'286 Maple Dr',NULL,'St Cloud','MN','56305','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(88,88,'287 Elm St','Suite 9','Mankato','MN','56005','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(89,89,'288 Walnut St',NULL,'Woodbury','MN','55129','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(90,90,'289 Chestnut Ave',NULL,'Maple Grove','MN','55315','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(91,91,'290 Lake St',NULL,'Burnsville','MN','55310','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(92,92,'291 River Rd','Apt 19','Plymouth','MN','55445','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(93,93,'292 Hill St',NULL,'Eden Prairie','MN','55348','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(94,94,'293 Valley Rd',NULL,'Lakeville','MN','55048','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(95,95,'294 Forest Dr','Suite 10','Brooklyn Park','MN','55447','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(96,96,'295 Sunset Blvd',NULL,'Blaine','MN','55438','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(97,97,'296 Sunrise Ave',NULL,'Apple Valley','MN','55128','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(98,98,'297 Park Ave',NULL,'Edina','MN','55443','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(99,99,'298 Spring St',NULL,'Shakopee','MN','55383','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1),(100,100,'299 Summer St','Apt 20','Prior Lake','MN','55376','USA','Home',1,'2026-04-30 13:51:29','2026-04-30 13:51:29',1);
/*!40000 ALTER TABLE `patient_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_allergies`
--

DROP TABLE IF EXISTS `patient_allergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_allergies` (
  `patient_allergy_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `allergy_id` int NOT NULL,
  `recorded_by_provider_id` int DEFAULT NULL,
  `reaction` varchar(255) DEFAULT NULL,
  `severity` enum('Mild','Moderate','Severe') DEFAULT 'Mild',
  `noted_date` date DEFAULT NULL,
  `status` enum('Active','Inactive','Resolved') DEFAULT 'Active',
  PRIMARY KEY (`patient_allergy_id`),
  UNIQUE KEY `patient_id` (`patient_id`,`allergy_id`),
  KEY `allergy_id` (`allergy_id`),
  KEY `recorded_by_provider_id` (`recorded_by_provider_id`),
  KEY `idx_patient_allergies_patient` (`patient_id`),
  CONSTRAINT `patient_allergies_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_allergies_ibfk_2` FOREIGN KEY (`allergy_id`) REFERENCES `allergies` (`allergy_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_allergies_ibfk_3` FOREIGN KEY (`recorded_by_provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_allergies`
--

LOCK TABLES `patient_allergies` WRITE;
/*!40000 ALTER TABLE `patient_allergies` DISABLE KEYS */;
INSERT INTO `patient_allergies` VALUES (1,1,1,1,'Rash','Moderate','2026-04-01','Active'),(2,2,3,2,'Skin irritation','Mild','2026-04-02','Active'),(3,3,9,3,'Anaphylaxis','Severe','2026-04-02','Active'),(4,4,2,4,'Swelling','Severe','2026-04-04','Active'),(5,5,10,5,'Hives','Moderate','2026-04-04','Active'),(6,6,17,6,'Contact rash','Mild','2026-04-05','Active'),(7,7,4,7,'Stomach pain','Moderate','2026-04-05','Active'),(8,8,11,8,'Nausea','Moderate','2026-04-05','Active'),(9,9,18,9,'Sneezing','Mild','2026-04-06','Active'),(10,10,6,10,'Drowsiness','Moderate','2026-04-06','Active'),(11,11,7,11,'Respiratory depression','Severe','2026-04-06','Active'),(12,12,12,12,'Swelling','Moderate','2026-04-06','Active'),(13,13,19,13,'Coughing','Mild','2026-04-07','Active'),(14,14,8,14,'Hypoglycemia reaction','Severe','2026-04-07','Active'),(15,15,13,15,'Rash','Moderate','2026-04-07','Active'),(16,16,20,1,'Eye irritation','Mild','2026-04-07','Active'),(17,17,14,2,'Hives','Moderate','2026-04-07','Active'),(18,18,21,3,'Sneezing','Mild','2026-04-08','Active'),(19,19,15,4,'Swelling','Moderate','2026-04-08','Active'),(20,20,22,5,'Anaphylaxis','Severe','2026-04-08','Active'),(21,21,16,6,'Bloating','Mild','2026-04-08','Active'),(22,22,23,7,'Shortness of breath','Severe','2026-04-08','Active'),(23,23,5,8,'Rash','Moderate','2026-04-09','Active'),(24,24,1,9,'Hives','Moderate','2026-04-09','Active'),(25,25,9,10,'Lip swelling','Severe','2026-04-09','Active'),(26,26,17,11,'Itching','Mild','2026-04-09','Active'),(27,27,3,12,'Stomach upset','Mild','2026-04-09','Active'),(28,28,18,13,'Watery eyes','Mild','2026-04-10','Active'),(29,29,11,14,'Vomiting','Moderate','2026-04-10','Active'),(30,30,4,15,'Rash','Moderate','2026-04-10','Active'),(31,31,2,1,'Facial swelling','Severe','2026-04-10','Active'),(32,32,14,2,'Rash','Moderate','2026-04-10','Active'),(33,33,20,3,'Sinus irritation','Mild','2026-04-10','Active'),(34,34,6,4,'Nausea','Moderate','2026-04-11','Active'),(35,35,12,5,'Hives','Moderate','2026-04-11','Active'),(36,36,7,6,'Difficulty breathing','Severe','2026-04-11','Active'),(37,37,21,7,'Sneezing','Mild','2026-04-11','Active'),(38,38,10,8,'Throat itching','Moderate','2026-04-11','Active'),(39,39,15,9,'Rash','Mild','2026-04-12','Active'),(40,40,23,10,'Nausea and flushing','Moderate','2026-04-12','Active'),(41,41,1,11,'Rash','Moderate','2026-04-12','Active'),(42,42,3,12,'Skin irritation','Mild','2026-04-12','Active'),(43,43,9,13,'Anaphylaxis','Severe','2026-04-12','Active'),(44,44,2,14,'Swelling','Severe','2026-04-12','Active'),(45,45,10,15,'Hives','Moderate','2026-04-13','Active'),(46,46,17,1,'Contact rash','Mild','2026-04-13','Active'),(47,47,4,2,'Stomach pain','Moderate','2026-04-13','Active'),(48,48,11,3,'Nausea','Moderate','2026-04-13','Active'),(49,49,18,4,'Sneezing','Mild','2026-04-13','Active'),(50,50,6,5,'Drowsiness','Moderate','2026-04-13','Active'),(51,51,7,6,'Respiratory depression','Severe','2026-04-14','Active'),(52,52,12,7,'Swelling','Moderate','2026-04-14','Active'),(53,53,19,8,'Coughing','Mild','2026-04-14','Active'),(54,54,8,9,'Hypoglycemia reaction','Severe','2026-04-14','Active'),(55,55,13,10,'Rash','Moderate','2026-04-14','Active'),(56,56,20,11,'Eye irritation','Mild','2026-04-14','Active'),(57,57,14,12,'Hives','Moderate','2026-04-15','Active'),(58,58,21,13,'Sneezing','Mild','2026-04-15','Active'),(59,59,15,14,'Swelling','Moderate','2026-04-15','Active'),(60,60,22,15,'Large local swelling','Moderate','2026-04-15','Active'),(61,61,16,1,'Abdominal discomfort','Mild','2026-04-15','Active'),(62,62,23,2,'Shortness of breath','Severe','2026-04-15','Active'),(63,63,5,3,'Rash','Moderate','2026-04-16','Active'),(64,64,1,4,'Hives','Moderate','2026-04-16','Active'),(65,65,9,5,'Lip swelling','Severe','2026-04-16','Active'),(66,66,17,6,'Itching','Mild','2026-04-16','Active'),(67,67,3,7,'Stomach upset','Mild','2026-04-16','Active'),(68,68,18,8,'Watery eyes','Mild','2026-04-16','Active'),(69,69,11,9,'Vomiting','Moderate','2026-04-17','Active'),(70,70,4,10,'Rash','Moderate','2026-04-17','Active'),(71,71,2,11,'Facial swelling','Severe','2026-04-17','Active'),(72,72,14,12,'Rash','Moderate','2026-04-17','Active'),(73,73,20,13,'Sinus irritation','Mild','2026-04-17','Active'),(74,74,6,14,'Nausea','Moderate','2026-04-17','Active'),(75,75,12,15,'Hives','Moderate','2026-04-18','Active'),(76,76,7,1,'Difficulty breathing','Severe','2026-04-18','Active'),(77,77,21,2,'Sneezing','Mild','2026-04-18','Active'),(78,78,10,3,'Throat itching','Moderate','2026-04-18','Active'),(79,79,15,4,'Rash','Mild','2026-04-18','Active'),(80,80,23,5,'Nausea and flushing','Moderate','2026-04-18','Active'),(81,81,1,6,'Rash','Moderate','2026-04-19','Active'),(82,81,9,6,'Anaphylaxis','Severe','2026-04-19','Active'),(83,82,3,7,'Skin irritation','Mild','2026-04-19','Active'),(84,82,17,7,'Contact rash','Mild','2026-04-19','Active'),(85,83,2,8,'Swelling','Severe','2026-04-19','Active'),(86,83,10,8,'Hives','Moderate','2026-04-19','Active'),(87,84,4,9,'Stomach pain','Moderate','2026-04-19','Active'),(88,84,18,9,'Sneezing','Mild','2026-04-19','Active'),(89,85,6,10,'Drowsiness','Moderate','2026-04-20','Active'),(90,85,19,10,'Coughing','Mild','2026-04-20','Active'),(91,86,7,11,'Respiratory depression','Severe','2026-04-20','Active'),(92,86,21,11,'Sneezing','Mild','2026-04-20','Active'),(93,87,8,12,'Hypoglycemia reaction','Severe','2026-04-20','Active'),(94,87,22,12,'Large local swelling','Moderate','2026-04-20','Active'),(95,88,11,13,'Nausea','Moderate','2026-04-20','Active'),(96,88,20,13,'Eye irritation','Mild','2026-04-20','Active'),(97,89,12,14,'Swelling','Moderate','2026-04-21','Active'),(98,89,14,14,'Hives','Moderate','2026-04-21','Active'),(99,90,13,15,'Rash','Moderate','2026-04-21','Active'),(100,90,15,15,'Swelling','Moderate','2026-04-21','Active'),(101,91,1,1,'Rash','Moderate','2026-04-21','Active'),(102,91,17,1,'Itching','Mild','2026-04-21','Active'),(103,92,3,2,'Skin irritation','Mild','2026-04-21','Active'),(104,92,23,2,'Shortness of breath','Severe','2026-04-21','Active'),(105,93,9,3,'Anaphylaxis','Severe','2026-04-22','Active'),(106,93,10,3,'Hives','Moderate','2026-04-22','Active'),(107,94,2,4,'Swelling','Severe','2026-04-22','Active'),(108,94,20,4,'Mold exposure reaction','Mild','2026-04-22','Active'),(109,95,10,5,'Hives','Moderate','2026-04-22','Active'),(110,95,18,5,'Pollen reaction','Mild','2026-04-22','Active'),(111,96,17,6,'Contact rash','Mild','2026-04-22','Active'),(112,96,21,6,'Animal dander sneezing','Mild','2026-04-22','Active'),(113,97,4,7,'Stomach pain','Moderate','2026-04-23','Active'),(114,97,11,7,'Nausea','Moderate','2026-04-23','Active'),(115,98,11,8,'Nausea','Moderate','2026-04-23','Active'),(116,98,22,8,'Insect sting swelling','Severe','2026-04-23','Active'),(117,99,18,9,'Sneezing','Mild','2026-04-23','Active'),(118,99,19,9,'Dust cough','Mild','2026-04-23','Active'),(119,100,6,10,'Drowsiness','Moderate','2026-04-23','Active'),(120,100,14,10,'Hives','Moderate','2026-04-23','Active');
/*!40000 ALTER TABLE `patient_allergies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_consents`
--

DROP TABLE IF EXISTS `patient_consents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_consents` (
  `consent_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `encounter_id` int DEFAULT NULL,
  `consent_type` varchar(150) NOT NULL COMMENT 'Treatment | HIPAA | Procedure-specific',
  `consented_by` varchar(150) NOT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  `consented_at` datetime NOT NULL,
  `witnessed_by_user_id` int DEFAULT NULL,
  `is_withdrawn` tinyint(1) NOT NULL DEFAULT '0',
  `withdrawn_at` datetime DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`consent_id`),
  KEY `idx_pc_patient_id` (`patient_id`),
  KEY `idx_pc_encounter_id` (`encounter_id`),
  KEY `idx_pc_witnessed_by` (`witnessed_by_user_id`),
  CONSTRAINT `fk_pc_encounter` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_pc_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pc_witness` FOREIGN KEY (`witnessed_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_consents`
--

LOCK TABLES `patient_consents` WRITE;
/*!40000 ALTER TABLE `patient_consents` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_consents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_emergency_contacts`
--

DROP TABLE IF EXISTS `patient_emergency_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_emergency_contacts` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `contact_name` varchar(150) NOT NULL,
  `relationship_to_patient` varchar(50) DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `alternate_phone` varchar(50) DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contact_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `patient_emergency_contacts_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_emergency_contacts`
--

LOCK TABLES `patient_emergency_contacts` WRITE;
/*!40000 ALTER TABLE `patient_emergency_contacts` DISABLE KEYS */;
INSERT INTO `patient_emergency_contacts` VALUES (1,1,'Mary Doe','Spouse','555-2001','555-3001',0),(2,2,'Robert Smith','Brother','555-2002',NULL,0),(3,3,'Angela Lee','Spouse','555-2003',NULL,0),(4,4,'Sofia Garcia','Mother','555-2004',NULL,0),(5,5,'Michael Taylor','Father','555-2005',NULL,0),(6,6,'Laura Brown','Spouse','555-2006',NULL,0),(7,7,'Kevin Davis','Father','555-2007',NULL,0),(8,8,'Rachel Wilson','Spouse','555-2008',NULL,0),(9,9,'Carlos Martinez','Brother','555-2009',NULL,0),(10,10,'Diana Anderson','Mother','555-2010',NULL,0),(11,11,'Peter Thomas','Spouse','555-2011',NULL,0),(12,12,'Linda Jackson','Wife','555-2012',NULL,0),(13,13,'Emma White','Mother','555-2013',NULL,0),(14,14,'George Harris','Father','555-2014',NULL,0),(15,15,'Sophia Martin','Sister','555-2015',NULL,0),(16,16,'James Thompson','Brother','555-2016',NULL,0),(17,17,'Ana Garcia','Mother','555-2017',NULL,0),(18,18,'Miguel Martinez','Father','555-2018',NULL,0),(19,19,'Olivia Robinson','Sister','555-2019',NULL,0),(20,20,'Daniel Clark','Brother','555-2020',NULL,0),(21,21,'Maria Rodriguez','Mother','555-2021',NULL,0),(22,22,'Thomas Lewis','Father','555-2022',NULL,0),(23,23,'Grace Lee','Sister','555-2023',NULL,0),(24,24,'Ethan Walker','Brother','555-2024',NULL,0),(25,25,'Sophia Hall','Mother','555-2025',NULL,0),(26,26,'Matthew Allen','Father','555-2026',NULL,0),(27,27,'Chloe Young','Sister','555-2027',NULL,0),(28,28,'Joseph King','Father','555-2028',NULL,0),(29,29,'Grace Scott','Mother','555-2029',NULL,0),(30,30,'Samuel Green','Brother','555-2030',NULL,0),(31,31,'Victoria Adams','Mother','555-2031',NULL,0),(32,32,'David Baker','Father','555-2032',NULL,0),(33,33,'Lily Nelson','Sister','555-2033',NULL,0),(34,34,'Andrew Carter','Brother','555-2034',NULL,0),(35,35,'Chloe Mitchell','Mother','555-2035',NULL,0),(36,36,'Joshua Perez','Brother','555-2036',NULL,0),(37,37,'Zoe Roberts','Sister','555-2037',NULL,0),(38,38,'Christopher Turner','Father','555-2038',NULL,0),(39,39,'Hannah Phillips','Mother','555-2039',NULL,0),(40,40,'Anthony Campbell','Brother','555-2040',NULL,0),(41,41,'Laura Flores','Spouse','555-2041',NULL,0),(42,42,'James Morris','Father','555-2042',NULL,0),(43,43,'Ella Ward','Sister','555-2043',NULL,0),(44,44,'Ava Cox','Mother','555-2044',NULL,0),(45,45,'Henry Howard','Brother','555-2045',NULL,0),(46,46,'Nora Ward','Mother','555-2046',NULL,0),(47,47,'Leo Reed','Father','555-2047',NULL,0),(48,48,'Ella Watson','Sister','555-2048',NULL,0),(49,49,'Owen Brooks','Brother','555-2049',NULL,0),(50,50,'Luna Kelly','Mother','555-2050',NULL,0),(51,51,'Aiden Sanders','Father','555-2051',NULL,0),(52,52,'Maya Price','Mother','555-2052',NULL,0),(53,53,'Ethan Barnes','Brother','555-2053',NULL,0),(54,54,'Sofia Powell','Sister','555-2054',NULL,0),(55,55,'Caleb Long','Father','555-2055',NULL,0),(56,56,'Avery Patterson','Mother','555-2056',NULL,0),(57,57,'Wyatt Hughes','Brother','555-2057',NULL,0),(58,58,'Ella Flores','Sister','555-2058',NULL,0),(59,59,'Jack Washington','Father','555-2059',NULL,0),(60,60,'Zoey Butler','Mother','555-2060',NULL,0),(61,61,'Luke Simmons','Brother','555-2061',NULL,0),(62,62,'Chloe Fisher','Sister','555-2062',NULL,0),(63,63,'Ryan Ellis','Father','555-2063',NULL,0),(64,64,'Nina Gray','Mother','555-2064',NULL,0),(65,65,'Mason West','Brother','555-2065',NULL,0),(66,66,'Zara Cole','Mother','555-2066',NULL,0),(67,67,'Evan Stone','Father','555-2067',NULL,0),(68,68,'Mila Knight','Sister','555-2068',NULL,0),(69,69,'Leo Cross','Brother','555-2069',NULL,0),(70,70,'Ariana Fox','Mother','555-2070',NULL,0),(71,71,'Jacob Ross','Father','555-2071',NULL,0),(72,72,'Lily Diaz','Mother','555-2072',NULL,0),(73,73,'Noah Reyes','Brother','555-2073',NULL,0),(74,74,'Emma Reid','Sister','555-2074',NULL,0),(75,75,'Daniel Lane','Father','555-2075',NULL,0),(76,76,'Scarlett Wells','Mother','555-2076',NULL,0),(77,77,'Eli Bryant','Brother','555-2077',NULL,0),(78,78,'Isla Grant','Sister','555-2078',NULL,0),(79,79,'Landon Coleman','Father','555-2079',NULL,0),(80,80,'Aurora Fleming','Mother','555-2080',NULL,0),(81,81,'Owen Shaw','Brother','555-2081',NULL,0),(82,82,'Nova Burke','Sister','555-2082',NULL,0),(83,83,'Isaiah Stone','Father','555-2083',NULL,0),(84,84,'Bella Vargas','Mother','555-2084',NULL,0),(85,85,'Hunter Reese','Brother','555-2085',NULL,0),(86,86,'Claire Holt','Mother','555-2086',NULL,0),(87,87,'Aaron Page','Father','555-2087',NULL,0),(88,88,'Lucy Carson','Sister','555-2088',NULL,0),(89,89,'Jason Bishop','Brother','555-2089',NULL,0),(90,90,'Stella Arnold','Mother','555-2090',NULL,0),(91,91,'Connor Wallace','Father','555-2091',NULL,0),(92,92,'Anna Warren','Mother','555-2092',NULL,0),(93,93,'Brayden Hicks','Brother','555-2093',NULL,0),(94,94,'Leah Pierce','Sister','555-2094',NULL,0),(95,95,'Justin Burns','Father','555-2095',NULL,0),(96,96,'Paisley Meyer','Mother','555-2096',NULL,0),(97,97,'Tyler Boyd','Brother','555-2097',NULL,0),(98,98,'Naomi Dunn','Sister','555-2098',NULL,0),(99,99,'Kevin Carr','Father','555-2099',NULL,0),(100,100,'Sadie Phelps','Mother','555-2100',NULL,0);
/*!40000 ALTER TABLE `patient_emergency_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_insurance`
--

DROP TABLE IF EXISTS `patient_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_insurance` (
  `patient_insurance_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `insurance_id` int NOT NULL,
  `policy_number` varchar(100) NOT NULL,
  `group_number` varchar(100) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`patient_insurance_id`),
  UNIQUE KEY `uq_patient_insurance` (`patient_id`,`insurance_id`,`effective_date`),
  KEY `patient_insurance_ibfk_2` (`insurance_id`),
  CONSTRAINT `patient_insurance_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_insurance_ibfk_2` FOREIGN KEY (`insurance_id`) REFERENCES `insurance_plans` (`insurance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_insurance`
--

LOCK TABLES `patient_insurance` WRITE;
/*!40000 ALTER TABLE `patient_insurance` DISABLE KEYS */;
INSERT INTO `patient_insurance` VALUES (1,1,1,'BCBS-10001',NULL,NULL,NULL,0,NULL),(2,2,5,'UHC-10002',NULL,NULL,NULL,0,NULL),(3,3,19,'MED-10003',NULL,NULL,NULL,0,NULL),(4,4,17,'MEDICA-10004',NULL,NULL,NULL,0,NULL),(5,5,9,'AETNA-10005',NULL,NULL,NULL,0,NULL),(6,6,2,'BCBS-10006',NULL,NULL,NULL,0,NULL),(7,7,6,'UHC-10007',NULL,NULL,NULL,0,NULL),(8,8,20,'MED-10008',NULL,NULL,NULL,0,NULL),(9,9,18,'MEDICA-10009',NULL,NULL,NULL,0,NULL),(10,10,10,'AETNA-10010',NULL,NULL,NULL,0,NULL),(11,11,3,'BCBS-10011',NULL,NULL,NULL,0,NULL),(12,12,7,'UHC-10012',NULL,NULL,NULL,0,NULL),(13,13,21,'MED-10013',NULL,NULL,NULL,0,NULL),(14,14,16,'MEDICA-10014',NULL,NULL,NULL,0,NULL),(15,15,11,'AETNA-10015',NULL,NULL,NULL,0,NULL),(16,16,4,'BCBS-10016',NULL,NULL,NULL,0,NULL),(17,17,8,'UHC-10017',NULL,NULL,NULL,0,NULL),(18,18,22,'MED-10018',NULL,NULL,NULL,0,NULL),(19,19,17,'MEDICA-10019',NULL,NULL,NULL,0,NULL),(20,20,12,'AETNA-10020',NULL,NULL,NULL,0,NULL),(21,21,13,'CIG-10021',NULL,NULL,NULL,0,NULL),(22,22,14,'CIG-10022',NULL,NULL,NULL,0,NULL),(23,23,15,'CIG-10023',NULL,NULL,NULL,0,NULL),(24,24,23,'MCAID-10024',NULL,NULL,NULL,0,NULL),(25,25,24,'MCAID-10025',NULL,NULL,NULL,0,NULL),(26,26,25,'KAIS-10026',NULL,NULL,NULL,0,NULL),(27,27,26,'KAIS-10027',NULL,NULL,NULL,0,NULL),(28,28,27,'HUM-10028',NULL,NULL,NULL,0,NULL),(29,29,28,'HUM-10029',NULL,NULL,NULL,0,NULL),(30,30,29,'TRI-10030',NULL,NULL,NULL,0,NULL),(31,31,30,'TRI-10031',NULL,NULL,NULL,0,NULL),(32,32,1,'BCBS-10032',NULL,NULL,NULL,0,NULL),(33,33,5,'UHC-10033',NULL,NULL,NULL,0,NULL),(34,34,19,'MED-10034',NULL,NULL,NULL,0,NULL),(35,35,9,'AETNA-10035',NULL,NULL,NULL,0,NULL),(36,36,2,'BCBS-10036',NULL,NULL,NULL,0,NULL),(37,37,6,'UHC-10037',NULL,NULL,NULL,0,NULL),(38,38,20,'MED-10038',NULL,NULL,NULL,0,NULL),(39,39,18,'MEDICA-10039',NULL,NULL,NULL,0,NULL),(40,40,10,'AETNA-10040',NULL,NULL,NULL,0,NULL),(41,41,3,'BCBS-10041',NULL,NULL,NULL,0,NULL),(42,42,7,'UHC-10042',NULL,NULL,NULL,0,NULL),(43,43,21,'MED-10043',NULL,NULL,NULL,0,NULL),(44,44,16,'MEDICA-10044',NULL,NULL,NULL,0,NULL),(45,45,11,'AETNA-10045',NULL,NULL,NULL,0,NULL),(46,46,4,'BCBS-10046',NULL,NULL,NULL,0,NULL),(47,47,8,'UHC-10047',NULL,NULL,NULL,0,NULL),(48,48,22,'MED-10048',NULL,NULL,NULL,0,NULL),(49,49,17,'MEDICA-10049',NULL,NULL,NULL,0,NULL),(50,50,12,'AETNA-10050',NULL,NULL,NULL,0,NULL),(51,51,13,'CIG-10051',NULL,NULL,NULL,0,NULL),(52,52,14,'CIG-10052',NULL,NULL,NULL,0,NULL),(53,53,15,'CIG-10053',NULL,NULL,NULL,0,NULL),(54,54,23,'MCAID-10054',NULL,NULL,NULL,0,NULL),(55,55,24,'MCAID-10055',NULL,NULL,NULL,0,NULL),(56,56,25,'KAIS-10056',NULL,NULL,NULL,0,NULL),(57,57,26,'KAIS-10057',NULL,NULL,NULL,0,NULL),(58,58,27,'HUM-10058',NULL,NULL,NULL,0,NULL),(59,59,28,'HUM-10059',NULL,NULL,NULL,0,NULL),(60,60,29,'TRI-10060',NULL,NULL,NULL,0,NULL),(61,61,30,'TRI-10061',NULL,NULL,NULL,0,NULL),(62,62,1,'BCBS-10062',NULL,NULL,NULL,0,NULL),(63,63,5,'UHC-10063',NULL,NULL,NULL,0,NULL),(64,64,19,'MED-10064',NULL,NULL,NULL,0,NULL),(65,65,9,'AETNA-10065',NULL,NULL,NULL,0,NULL),(66,66,2,'BCBS-10066',NULL,NULL,NULL,0,NULL),(67,67,6,'UHC-10067',NULL,NULL,NULL,0,NULL),(68,68,20,'MED-10068',NULL,NULL,NULL,0,NULL),(69,69,18,'MEDICA-10069',NULL,NULL,NULL,0,NULL),(70,70,10,'AETNA-10070',NULL,NULL,NULL,0,NULL),(71,71,3,'BCBS-10071',NULL,NULL,NULL,0,NULL),(72,72,7,'UHC-10072',NULL,NULL,NULL,0,NULL),(73,73,21,'MED-10073',NULL,NULL,NULL,0,NULL),(74,74,16,'MEDICA-10074',NULL,NULL,NULL,0,NULL),(75,75,11,'AETNA-10075',NULL,NULL,NULL,0,NULL),(76,76,4,'BCBS-10076',NULL,NULL,NULL,0,NULL),(77,77,8,'UHC-10077',NULL,NULL,NULL,0,NULL),(78,78,22,'MED-10078',NULL,NULL,NULL,0,NULL),(79,79,17,'MEDICA-10079',NULL,NULL,NULL,0,NULL),(80,80,12,'AETNA-10080',NULL,NULL,NULL,0,NULL),(81,81,13,'CIG-10081',NULL,NULL,NULL,0,NULL),(82,82,14,'CIG-10082',NULL,NULL,NULL,0,NULL),(83,83,15,'CIG-10083',NULL,NULL,NULL,0,NULL),(84,84,23,'MCAID-10084',NULL,NULL,NULL,0,NULL),(85,85,24,'MCAID-10085',NULL,NULL,NULL,0,NULL),(86,86,25,'KAIS-10086',NULL,NULL,NULL,0,NULL),(87,87,26,'KAIS-10087',NULL,NULL,NULL,0,NULL),(88,88,27,'HUM-10088',NULL,NULL,NULL,0,NULL),(89,89,28,'HUM-10089',NULL,NULL,NULL,0,NULL),(90,90,29,'TRI-10090',NULL,NULL,NULL,0,NULL),(91,91,30,'TRI-10091',NULL,NULL,NULL,0,NULL),(92,92,1,'BCBS-10092',NULL,NULL,NULL,0,NULL),(93,93,5,'UHC-10093',NULL,NULL,NULL,0,NULL),(94,94,19,'MED-10094',NULL,NULL,NULL,0,NULL),(95,95,9,'AETNA-10095',NULL,NULL,NULL,0,NULL),(96,96,2,'BCBS-10096',NULL,NULL,NULL,0,NULL),(97,97,6,'UHC-10097',NULL,NULL,NULL,0,NULL),(98,98,20,'MED-10098',NULL,NULL,NULL,0,NULL),(99,99,18,'MEDICA-10099',NULL,NULL,NULL,0,NULL),(100,100,10,'AETNA-10100',NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `patient_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_insurance_view`
--

DROP TABLE IF EXISTS `patient_insurance_view`;
/*!50001 DROP VIEW IF EXISTS `patient_insurance_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_insurance_view` AS SELECT 
 1 AS `patient_id`,
 1 AS `mrn`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `policy_number`,
 1 AS `is_primary`,
 1 AS `insurance_id`,
 1 AS `payer_name`,
 1 AS `plan_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patient_sessions`
--

DROP TABLE IF EXISTS `patient_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `patient_account_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `expires_at` datetime NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `patient_account_id` (`patient_account_id`),
  CONSTRAINT `patient_sessions_ibfk_1` FOREIGN KEY (`patient_account_id`) REFERENCES `patient_accounts` (`patient_account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_sessions`
--

LOCK TABLES `patient_sessions` WRITE;
/*!40000 ALTER TABLE `patient_sessions` DISABLE KEYS */;
INSERT INTO `patient_sessions` VALUES (1,1,'2026-04-30 13:51:29','2026-04-22 18:30:00'),(2,2,'2026-04-30 13:51:29','2026-04-22 19:00:00'),(3,3,'2026-04-30 13:51:29','2026-04-22 20:15:00'),(4,4,'2026-04-30 13:51:29','2026-04-22 21:00:00'),(5,5,'2026-04-30 13:51:29','2026-04-22 22:45:00'),(6,6,'2026-04-30 13:51:29','2026-04-23 09:30:00'),(7,7,'2026-04-30 13:51:29','2026-04-23 10:15:00'),(8,8,'2026-04-30 13:51:29','2026-04-23 11:00:00'),(9,9,'2026-04-30 13:51:29','2026-04-23 12:30:00'),(10,10,'2026-04-30 13:51:29','2026-04-23 13:00:00'),(11,11,'2026-04-30 13:51:29','2026-04-23 14:45:00'),(12,12,'2026-04-30 13:51:29','2026-04-23 15:30:00'),(13,13,'2026-04-30 13:51:29','2026-04-23 16:15:00'),(14,14,'2026-04-30 13:51:29','2026-04-23 17:00:00'),(15,15,'2026-04-30 13:51:29','2026-04-23 18:30:00'),(16,16,'2026-04-30 13:51:29','2026-04-24 09:00:00'),(17,17,'2026-04-30 13:51:29','2026-04-24 10:00:00'),(18,18,'2026-04-30 13:51:29','2026-04-24 11:30:00'),(19,19,'2026-04-30 13:51:29','2026-04-24 12:45:00'),(20,20,'2026-04-30 13:51:29','2026-04-24 13:15:00'),(21,21,'2026-04-30 13:51:29','2026-04-24 14:00:00'),(22,22,'2026-04-30 13:51:29','2026-04-24 15:30:00'),(23,23,'2026-04-30 13:51:29','2026-04-24 16:45:00'),(24,24,'2026-04-30 13:51:29','2026-04-24 17:30:00'),(25,25,'2026-04-30 13:51:29','2026-04-24 18:00:00'),(26,26,'2026-04-30 13:51:29','2026-04-25 09:15:00'),(27,27,'2026-04-30 13:51:29','2026-04-25 10:45:00'),(28,28,'2026-04-30 13:51:29','2026-04-25 11:30:00'),(29,29,'2026-04-30 13:51:29','2026-04-25 12:15:00'),(30,30,'2026-04-30 13:51:29','2026-04-25 13:00:00'),(31,31,'2026-04-30 13:51:29','2026-04-25 14:30:00'),(32,32,'2026-04-30 13:51:29','2026-04-25 15:45:00'),(33,33,'2026-04-30 13:51:29','2026-04-25 16:30:00'),(34,34,'2026-04-30 13:51:29','2026-04-25 17:15:00'),(35,35,'2026-04-30 13:51:29','2026-04-25 18:00:00'),(36,36,'2026-04-30 13:51:29','2026-04-26 09:00:00'),(37,37,'2026-04-30 13:51:29','2026-04-26 10:30:00'),(38,38,'2026-04-30 13:51:29','2026-04-26 11:45:00'),(39,39,'2026-04-30 13:51:29','2026-04-26 12:30:00'),(40,40,'2026-04-30 13:51:29','2026-04-26 13:15:00');
/*!40000 ALTER TABLE `patient_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `mrn` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `preferred_name` varchar(100) DEFAULT NULL COMMENT 'Name patient goes by',
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `sex` enum('M','F','Other') DEFAULT NULL,
  `gender_identity` varchar(100) DEFAULT NULL COMMENT 'Self-reported',
  `pronouns` varchar(50) DEFAULT NULL,
  `race` varchar(100) DEFAULT NULL COMMENT 'USCDI required',
  `ethnicity` varchar(100) DEFAULT NULL COMMENT 'USCDI required',
  `preferred_language` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `mrn` (`mrn`),
  KEY `idx_patient_lastname` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'MRN001','John',NULL,NULL,'Doe','1990-01-01','M',NULL,NULL,NULL,NULL,NULL,'555-1001','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(2,'MRN002','Jane',NULL,NULL,'Smith','1985-05-12','F',NULL,NULL,NULL,NULL,NULL,'555-1002','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(3,'MRN003','David',NULL,NULL,'Lee','1978-07-20','M',NULL,NULL,NULL,NULL,NULL,'555-1003','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(4,'MRN004','Maria',NULL,NULL,'Garcia','2000-09-15','F',NULL,NULL,NULL,NULL,NULL,'555-1004','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(5,'MRN005','Chris',NULL,NULL,'Taylor','1995-03-10','M',NULL,NULL,NULL,NULL,NULL,'555-1005','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(6,'MRN006','Michael',NULL,NULL,'Brown','1988-02-14','M',NULL,NULL,NULL,NULL,NULL,'555-1006','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(7,'MRN007','Emily',NULL,NULL,'Davis','1992-03-22','F',NULL,NULL,NULL,NULL,NULL,'555-1007','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(8,'MRN008','Daniel',NULL,NULL,'Wilson','1975-11-11','M',NULL,NULL,NULL,NULL,NULL,'555-1008','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(9,'MRN009','Sophia',NULL,NULL,'Martinez','1999-06-05','F',NULL,NULL,NULL,NULL,NULL,'555-1009','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(10,'MRN010','James',NULL,NULL,'Anderson','1983-08-30','M',NULL,NULL,NULL,NULL,NULL,'555-1010','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(11,'MRN011','Olivia',NULL,NULL,'Thomas','1991-04-19','F',NULL,NULL,NULL,NULL,NULL,'555-1011','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(12,'MRN012','William',NULL,NULL,'Jackson','1970-07-07','M',NULL,NULL,NULL,NULL,NULL,'555-1012','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(13,'MRN013','Ava',NULL,NULL,'White','2002-12-25','F',NULL,NULL,NULL,NULL,NULL,'555-1013','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(14,'MRN014','Benjamin',NULL,NULL,'Harris','1986-09-14','M',NULL,NULL,NULL,NULL,NULL,'555-1014','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(15,'MRN015','Mia',NULL,NULL,'Martin','1997-05-09','F',NULL,NULL,NULL,NULL,NULL,'555-1015','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(16,'MRN016','Lucas',NULL,NULL,'Thompson','1984-10-01','M',NULL,NULL,NULL,NULL,NULL,'555-1016','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(17,'MRN017','Charlotte',NULL,NULL,'Garcia','1993-11-20','F',NULL,NULL,NULL,NULL,NULL,'555-1017','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(18,'MRN018','Henry',NULL,NULL,'Martinez','1979-01-30','M',NULL,NULL,NULL,NULL,NULL,'555-1018','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(19,'MRN019','Amelia',NULL,NULL,'Robinson','2001-02-11','F',NULL,NULL,NULL,NULL,NULL,'555-1019','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(20,'MRN020','Alexander',NULL,NULL,'Clark','1982-03-03','M',NULL,NULL,NULL,NULL,NULL,'555-1020','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(21,'MRN021','Evelyn',NULL,NULL,'Rodriguez','1996-07-17','F',NULL,NULL,NULL,NULL,NULL,'555-1021','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(22,'MRN022','Michael',NULL,NULL,'Lewis','1974-08-08','M',NULL,NULL,NULL,NULL,NULL,'555-1022','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(23,'MRN023','Harper',NULL,NULL,'Lee','2003-09-09','F',NULL,NULL,NULL,NULL,NULL,'555-1023','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(24,'MRN024','Daniel',NULL,NULL,'Walker','1987-06-06','M',NULL,NULL,NULL,NULL,NULL,'555-1024','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(25,'MRN025','Ella',NULL,NULL,'Hall','1998-05-05','F',NULL,NULL,NULL,NULL,NULL,'555-1025','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(26,'MRN026','Matthew',NULL,NULL,'Allen','1981-04-04','M',NULL,NULL,NULL,NULL,NULL,'555-1026','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(27,'MRN027','Scarlett',NULL,NULL,'Young','1994-03-03','F',NULL,NULL,NULL,NULL,NULL,'555-1027','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(28,'MRN028','Joseph',NULL,NULL,'King','1976-02-02','M',NULL,NULL,NULL,NULL,NULL,'555-1028','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(29,'MRN029','Grace',NULL,NULL,'Scott','2000-01-01','F',NULL,NULL,NULL,NULL,NULL,'555-1029','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(30,'MRN030','Samuel',NULL,NULL,'Green','1989-12-12','M',NULL,NULL,NULL,NULL,NULL,'555-1030','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(31,'MRN031','Victoria',NULL,NULL,'Adams','1995-11-11','F',NULL,NULL,NULL,NULL,NULL,'555-1031','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(32,'MRN032','David',NULL,NULL,'Baker','1973-10-10','M',NULL,NULL,NULL,NULL,NULL,'555-1032','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(33,'MRN033','Lily',NULL,NULL,'Nelson','2004-09-09','F',NULL,NULL,NULL,NULL,NULL,'555-1033','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(34,'MRN034','Andrew',NULL,NULL,'Carter','1980-08-08','M',NULL,NULL,NULL,NULL,NULL,'555-1034','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(35,'MRN035','Chloe',NULL,NULL,'Mitchell','1992-07-07','F',NULL,NULL,NULL,NULL,NULL,'555-1035','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(36,'MRN036','Joshua',NULL,NULL,'Perez','1985-06-06','M',NULL,NULL,NULL,NULL,NULL,'555-1036','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(37,'MRN037','Zoe',NULL,NULL,'Roberts','1999-05-05','F',NULL,NULL,NULL,NULL,NULL,'555-1037','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(38,'MRN038','Christopher',NULL,NULL,'Turner','1977-04-04','M',NULL,NULL,NULL,NULL,NULL,'555-1038','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(39,'MRN039','Hannah',NULL,NULL,'Phillips','2001-03-03','F',NULL,NULL,NULL,NULL,NULL,'555-1039','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(40,'MRN040','Anthony',NULL,NULL,'Campbell','1988-02-02','M',NULL,NULL,NULL,NULL,NULL,'555-1040','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(41,'MRN041','Logan',NULL,NULL,'Flores','1993-01-01','M',NULL,NULL,NULL,NULL,NULL,'555-1041','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(42,'MRN042','Layla',NULL,NULL,'Morris','1994-02-02','F',NULL,NULL,NULL,NULL,NULL,'555-1042','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(43,'MRN043','Isaac',NULL,NULL,'Ward','1985-03-03','M',NULL,NULL,NULL,NULL,NULL,'555-1043','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(44,'MRN044','Aria',NULL,NULL,'Cox','1996-04-04','F',NULL,NULL,NULL,NULL,NULL,'555-1044','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(45,'MRN045','Eli',NULL,NULL,'Howard','1978-05-05','M',NULL,NULL,NULL,NULL,NULL,'555-1045','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(46,'MRN046','Nora',NULL,NULL,'Ward','2000-06-06','F',NULL,NULL,NULL,NULL,NULL,'555-1046','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(47,'MRN047','Leo',NULL,NULL,'Reed','1991-07-07','M',NULL,NULL,NULL,NULL,NULL,'555-1047','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(48,'MRN048','Ella',NULL,NULL,'Watson','1997-08-08','F',NULL,NULL,NULL,NULL,NULL,'555-1048','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(49,'MRN049','Owen',NULL,NULL,'Brooks','1983-09-09','M',NULL,NULL,NULL,NULL,NULL,'555-1049','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(50,'MRN050','Luna',NULL,NULL,'Kelly','2002-10-10','F',NULL,NULL,NULL,NULL,NULL,'555-1050','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(51,'MRN051','Aiden',NULL,NULL,'Sanders','1990-11-11','M',NULL,NULL,NULL,NULL,NULL,'555-1051','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(52,'MRN052','Maya',NULL,NULL,'Price','1995-12-12','F',NULL,NULL,NULL,NULL,NULL,'555-1052','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(53,'MRN053','Ethan',NULL,NULL,'Barnes','1986-01-13','M',NULL,NULL,NULL,NULL,NULL,'555-1053','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(54,'MRN054','Sofia',NULL,NULL,'Powell','1998-02-14','F',NULL,NULL,NULL,NULL,NULL,'555-1054','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(55,'MRN055','Caleb',NULL,NULL,'Long','1979-03-15','M',NULL,NULL,NULL,NULL,NULL,'555-1055','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(56,'MRN056','Avery',NULL,NULL,'Patterson','2001-04-16','F',NULL,NULL,NULL,NULL,NULL,'555-1056','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(57,'MRN057','Wyatt',NULL,NULL,'Hughes','1992-05-17','M',NULL,NULL,NULL,NULL,NULL,'555-1057','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(58,'MRN058','Ella',NULL,NULL,'Flores','1996-06-18','F',NULL,NULL,NULL,NULL,NULL,'555-1058','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(59,'MRN059','Jack',NULL,NULL,'Washington','1984-07-19','M',NULL,NULL,NULL,NULL,NULL,'555-1059','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(60,'MRN060','Zoey',NULL,NULL,'Butler','2003-08-20','F',NULL,NULL,NULL,NULL,NULL,'555-1060','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(61,'MRN061','Luke',NULL,NULL,'Simmons','1987-09-21','M',NULL,NULL,NULL,NULL,NULL,'555-1061','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(62,'MRN062','Chloe',NULL,NULL,'Fisher','1993-10-22','F',NULL,NULL,NULL,NULL,NULL,'555-1062','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(63,'MRN063','Ryan',NULL,NULL,'Ellis','1975-11-23','M',NULL,NULL,NULL,NULL,NULL,'555-1063','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(64,'MRN064','Nina',NULL,NULL,'Gray','1999-12-24','F',NULL,NULL,NULL,NULL,NULL,'555-1064','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(65,'MRN065','Mason',NULL,NULL,'West','1982-01-25','M',NULL,NULL,NULL,NULL,NULL,'555-1065','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(66,'MRN066','Zara',NULL,NULL,'Cole','2000-02-26','F',NULL,NULL,NULL,NULL,NULL,'555-1066','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(67,'MRN067','Evan',NULL,NULL,'Stone','1991-03-27','M',NULL,NULL,NULL,NULL,NULL,'555-1067','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(68,'MRN068','Mila',NULL,NULL,'Knight','1997-04-28','F',NULL,NULL,NULL,NULL,NULL,'555-1068','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(69,'MRN069','Leo',NULL,NULL,'Cross','1983-05-29','M',NULL,NULL,NULL,NULL,NULL,'555-1069','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(70,'MRN070','Ariana',NULL,NULL,'Fox','2002-06-30','F',NULL,NULL,NULL,NULL,NULL,'555-1070','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(71,'MRN071','Jacob',NULL,NULL,'Ross','1989-07-01','M',NULL,NULL,NULL,NULL,NULL,'555-1071','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(72,'MRN072','Lily',NULL,NULL,'Diaz','1994-08-02','F',NULL,NULL,NULL,NULL,NULL,'555-1072','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(73,'MRN073','Noah',NULL,NULL,'Reyes','1976-09-03','M',NULL,NULL,NULL,NULL,NULL,'555-1073','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(74,'MRN074','Emma',NULL,NULL,'Reid','1998-10-04','F',NULL,NULL,NULL,NULL,NULL,'555-1074','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(75,'MRN075','Daniel',NULL,NULL,'Lane','1981-11-05','M',NULL,NULL,NULL,NULL,NULL,'555-1075','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(76,'MRN076','Scarlett',NULL,NULL,'Wells','2001-12-06','F',NULL,NULL,NULL,NULL,NULL,'555-1076','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(77,'MRN077','Eli',NULL,NULL,'Bryant','1992-01-07','M',NULL,NULL,NULL,NULL,NULL,'555-1077','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(78,'MRN078','Isla',NULL,NULL,'Grant','1996-02-08','F',NULL,NULL,NULL,NULL,NULL,'555-1078','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(79,'MRN079','Landon',NULL,NULL,'Coleman','1985-03-09','M',NULL,NULL,NULL,NULL,NULL,'555-1079','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(80,'MRN080','Aurora',NULL,NULL,'Fleming','2003-04-10','F',NULL,NULL,NULL,NULL,NULL,'555-1080','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(81,'MRN081','Owen',NULL,NULL,'Shaw','1990-05-11','M',NULL,NULL,NULL,NULL,NULL,'555-1081','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(82,'MRN082','Nova',NULL,NULL,'Burke','1995-06-12','F',NULL,NULL,NULL,NULL,NULL,'555-1082','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(83,'MRN083','Isaiah',NULL,NULL,'Stone','1977-07-13','M',NULL,NULL,NULL,NULL,NULL,'555-1083','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(84,'MRN084','Bella',NULL,NULL,'Vargas','1999-08-14','F',NULL,NULL,NULL,NULL,NULL,'555-1084','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(85,'MRN085','Hunter',NULL,NULL,'Reese','1984-09-15','M',NULL,NULL,NULL,NULL,NULL,'555-1085','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(86,'MRN086','Claire',NULL,NULL,'Holt','2002-10-16','F',NULL,NULL,NULL,NULL,NULL,'555-1086','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(87,'MRN087','Aaron',NULL,NULL,'Page','1987-11-17','M',NULL,NULL,NULL,NULL,NULL,'555-1087','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(88,'MRN088','Lucy',NULL,NULL,'Carson','1993-12-18','F',NULL,NULL,NULL,NULL,NULL,'555-1088','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(89,'MRN089','Jason',NULL,NULL,'Bishop','1978-01-19','M',NULL,NULL,NULL,NULL,NULL,'555-1089','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(90,'MRN090','Stella',NULL,NULL,'Arnold','2001-02-20','F',NULL,NULL,NULL,NULL,NULL,'555-1090','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(91,'MRN091','Connor',NULL,NULL,'Wallace','1986-03-21','M',NULL,NULL,NULL,NULL,NULL,'555-1091','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(92,'MRN092','Anna',NULL,NULL,'Warren','1994-04-22','F',NULL,NULL,NULL,NULL,NULL,'555-1092','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(93,'MRN093','Brayden',NULL,NULL,'Hicks','1979-05-23','M',NULL,NULL,NULL,NULL,NULL,'555-1093','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(94,'MRN094','Leah',NULL,NULL,'Pierce','1998-06-24','F',NULL,NULL,NULL,NULL,NULL,'555-1094','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(95,'MRN095','Justin',NULL,NULL,'Burns','1983-07-25','M',NULL,NULL,NULL,NULL,NULL,'555-1095','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(96,'MRN096','Paisley',NULL,NULL,'Meyer','2000-08-26','F',NULL,NULL,NULL,NULL,NULL,'555-1096','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(97,'MRN097','Tyler',NULL,NULL,'Boyd','1991-09-27','M',NULL,NULL,NULL,NULL,NULL,'555-1097','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(98,'MRN098','Naomi',NULL,NULL,'Dunn','1996-10-28','F',NULL,NULL,NULL,NULL,NULL,'555-1098','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(99,'MRN099','Kevin',NULL,NULL,'Carr','1985-11-29','M',NULL,NULL,NULL,NULL,NULL,'555-1099','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL),(100,'MRN100','Sadie',NULL,NULL,'Phelps','2003-12-30','F',NULL,NULL,NULL,NULL,NULL,'555-1100','2026-04-30 13:51:29','2026-05-16 17:10:55',NULL);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `claim_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `payment_method` enum('Cash','Credit Card','Debit Card','ACH','Check','Insurance Transfer') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('Pending','Completed','Failed','Refunded','Voided') NOT NULL DEFAULT 'Pending',
  `reversal_payment_id` int DEFAULT NULL COMMENT 'Points to the reversing payment row',
  `payment_source` enum('Patient','Insurance') NOT NULL,
  `transaction_reference` varchar(100) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `payment_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `transaction_reference` (`transaction_reference`),
  KEY `claim_id` (`claim_id`),
  KEY `patient_id` (`patient_id`),
  KEY `idx_payments_reversal` (`reversal_payment_id`),
  KEY `idx_payments_payment_datetime` (`payment_datetime`),
  CONSTRAINT `fk_payments_reversal` FOREIGN KEY (`reversal_payment_id`) REFERENCES `payments` (`payment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`claim_id`) REFERENCES `claims` (`claim_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,1,'Credit Card',50.00,'Completed',NULL,'Patient','TXN-1001','Copay','2026-04-01 12:10:00'),(2,2,2,'ACH',180.00,'Completed',NULL,'Insurance','TXN-1002','Insurance payment','2026-04-02 10:00:00'),(3,3,3,'ACH',950.00,'Completed',NULL,'Insurance','TXN-1003','Insurance payment','2026-04-02 11:00:00'),(4,4,4,'Cash',20.00,'Pending',NULL,'Patient','TXN-1004','Denied claim partial','2026-04-02 12:00:00'),(5,5,5,'Credit Card',165.00,'Completed',NULL,'Insurance','TXN-1005','Insurance payment','2026-04-02 13:00:00'),(6,6,6,'ACH',425.00,'Pending',NULL,'Insurance','TXN-1006','Awaiting processing','2026-04-02 14:00:00'),(7,7,7,'ACH',4200.00,'Completed',NULL,'Insurance','TXN-1007','Paid in full','2026-04-02 15:00:00'),(8,8,8,'Credit Card',850.00,'Completed',NULL,'Insurance','TXN-1008','Insurance payment','2026-04-02 16:00:00'),(9,9,9,'Cash',25.00,'Completed',NULL,'Patient','TXN-1009','Denied coverage payment','2026-04-02 17:00:00'),(10,10,10,'ACH',380.00,'Pending',NULL,'Insurance','TXN-1010','Processing','2026-04-02 18:00:00'),(11,11,11,'ACH',650.00,'Completed',NULL,'Insurance','TXN-1011','Paid','2026-04-03 09:00:00'),(12,12,12,'Credit Card',45.00,'Completed',NULL,'Patient','TXN-1012','Lab copay','2026-04-03 10:00:00'),(13,13,13,'ACH',420.00,'Completed',NULL,'Insurance','TXN-1013','Paid','2026-04-03 11:00:00'),(14,14,14,'Cash',30.00,'Pending',NULL,'Patient','TXN-1014','Denied partial','2026-04-03 12:00:00'),(15,15,15,'ACH',40.00,'Completed',NULL,'Insurance','TXN-1015','Paid','2026-04-03 13:00:00'),(16,16,16,'ACH',55.00,'Pending',NULL,'Insurance','TXN-1016','Processing','2026-04-03 14:00:00'),(17,17,17,'Credit Card',95.00,'Completed',NULL,'Insurance','TXN-1017','Paid','2026-04-03 15:00:00'),(18,18,18,'ACH',35.00,'Completed',NULL,'Insurance','TXN-1018','Paid','2026-04-03 16:00:00'),(19,19,19,'ACH',150.00,'Completed',NULL,'Insurance','TXN-1019','Paid','2026-04-03 17:00:00'),(20,20,20,'Cash',50.00,'Pending',NULL,'Patient','TXN-1020','Denied review','2026-04-03 18:00:00'),(21,21,21,'ACH',140.00,'Pending',NULL,'Insurance','TXN-1021','Processing','2026-04-04 09:00:00'),(22,22,22,'ACH',520.00,'Completed',NULL,'Insurance','TXN-1022','Paid','2026-04-04 10:00:00'),(23,23,23,'ACH',320.00,'Completed',NULL,'Insurance','TXN-1023','Paid','2026-04-04 11:00:00'),(24,24,24,'Cash',100.00,'Pending',NULL,'Patient','TXN-1024','Denied claim','2026-04-04 12:00:00'),(25,25,25,'Credit Card',160.00,'Completed',NULL,'Insurance','TXN-1025','Paid','2026-04-04 13:00:00'),(26,26,26,'ACH',155.00,'Completed',NULL,'Insurance','TXN-1026','Paid','2026-04-04 14:00:00'),(27,27,27,'ACH',260.00,'Completed',NULL,'Insurance','TXN-1027','Paid','2026-04-04 15:00:00'),(28,28,28,'ACH',780.00,'Pending',NULL,'Insurance','TXN-1028','Processing','2026-04-04 16:00:00'),(29,29,29,'ACH',210.00,'Completed',NULL,'Insurance','TXN-1029','Paid','2026-04-04 17:00:00'),(30,30,30,'ACH',175.00,'Completed',NULL,'Insurance','TXN-1030','Paid','2026-04-04 18:00:00'),(31,31,31,'ACH',460.00,'Completed',NULL,'Insurance','TXN-1031','Paid','2026-04-05 09:00:00'),(32,32,32,'Cash',40.00,'Completed',NULL,'Patient','TXN-1032','Duplicate claim payment','2026-04-05 10:00:00'),(33,33,33,'ACH',170.00,'Completed',NULL,'Insurance','TXN-1033','Paid','2026-04-05 11:00:00'),(34,34,34,'ACH',760.00,'Completed',NULL,'Insurance','TXN-1034','Paid','2026-04-05 12:00:00'),(35,35,35,'ACH',1450.00,'Pending',NULL,'Insurance','TXN-1035','Processing','2026-04-05 13:00:00'),(36,36,36,'ACH',60.00,'Completed',NULL,'Insurance','TXN-1036','Paid','2026-04-05 14:00:00'),(37,37,37,'ACH',120.00,'Completed',NULL,'Insurance','TXN-1037','Paid','2026-04-05 15:00:00'),(38,38,38,'Credit Card',20.00,'Completed',NULL,'Patient','TXN-1038','Lab fee','2026-04-05 16:00:00'),(39,39,39,'Cash',25.00,'Pending',NULL,'Patient','TXN-1039','Denied service','2026-04-05 17:00:00'),(40,40,40,'ACH',180.00,'Completed',NULL,'Insurance','TXN-1040','Paid','2026-04-05 18:00:00'),(41,41,41,'ACH',310.00,'Completed',NULL,'Insurance','TXN-1041','Paid','2026-04-06 09:00:00'),(42,42,42,'ACH',140.00,'Pending',NULL,'Insurance','TXN-1042','Processing','2026-04-06 10:00:00'),(43,43,43,'ACH',210.00,'Completed',NULL,'Insurance','TXN-1043','Paid','2026-04-06 11:00:00'),(44,44,44,'ACH',80.00,'Completed',NULL,'Insurance','TXN-1044','Paid','2026-04-06 12:00:00'),(45,45,45,'ACH',245.00,'Completed',NULL,'Insurance','TXN-1045','Paid','2026-04-06 13:00:00'),(46,46,46,'Cash',35.00,'Pending',NULL,'Patient','TXN-1046','Authorization issue','2026-04-06 14:00:00'),(47,47,47,'ACH',165.00,'Completed',NULL,'Insurance','TXN-1047','Paid','2026-04-06 15:00:00'),(48,48,48,'ACH',340.00,'Completed',NULL,'Insurance','TXN-1048','Paid','2026-04-06 16:00:00'),(49,49,49,'ACH',140.00,'Completed',NULL,'Insurance','TXN-1049','Paid','2026-04-07 09:00:00'),(50,50,50,'ACH',180.00,'Pending',NULL,'Insurance','TXN-1050','Processing','2026-04-07 10:00:00'),(51,51,51,'ACH',75.00,'Completed',NULL,'Insurance','TXN-1051','Paid','2026-04-07 11:00:00'),(52,52,52,'ACH',1250.00,'Completed',NULL,'Insurance','TXN-1052','Paid','2026-04-07 12:00:00'),(53,53,53,'ACH',170.00,'Completed',NULL,'Insurance','TXN-1053','Paid','2026-04-07 13:00:00'),(54,54,54,'ACH',290.00,'Completed',NULL,'Insurance','TXN-1054','Paid','2026-04-07 14:00:00'),(55,55,55,'Cash',60.00,'Pending',NULL,'Patient','TXN-1055','Experimental denial','2026-04-07 15:00:00'),(56,56,56,'ACH',25.00,'Completed',NULL,'Insurance','TXN-1056','Paid','2026-04-07 16:00:00'),(57,57,57,'ACH',135.00,'Completed',NULL,'Insurance','TXN-1057','Paid','2026-04-08 09:00:00'),(58,58,58,'ACH',120.00,'Completed',NULL,'Insurance','TXN-1058','Paid','2026-04-08 10:00:00'),(59,59,59,'ACH',35.00,'Completed',NULL,'Insurance','TXN-1059','Paid','2026-04-08 11:00:00'),(60,60,60,'ACH',35.00,'Pending',NULL,'Insurance','TXN-1060','Processing','2026-04-08 12:00:00'),(61,61,61,'ACH',650.00,'Completed',NULL,'Insurance','TXN-1061','Paid','2026-04-08 13:00:00'),(62,62,62,'ACH',700.00,'Completed',NULL,'Insurance','TXN-1062','Paid','2026-04-08 14:00:00'),(63,63,63,'ACH',140.00,'Pending',NULL,'Insurance','TXN-1063','Processing','2026-04-08 15:00:00'),(64,64,64,'ACH',180.00,'Completed',NULL,'Insurance','TXN-1064','Paid','2026-04-08 16:00:00'),(65,65,65,'ACH',320.00,'Completed',NULL,'Insurance','TXN-1065','Paid','2026-04-09 09:00:00'),(66,66,66,'Cash',20.00,'Pending',NULL,'Patient','TXN-1066','Eligibility issue','2026-04-09 10:00:00'),(67,67,67,'ACH',175.00,'Completed',NULL,'Insurance','TXN-1067','Paid','2026-04-09 11:00:00'),(68,68,68,'ACH',150.00,'Completed',NULL,'Insurance','TXN-1068','Paid','2026-04-09 12:00:00'),(69,69,69,'ACH',420.00,'Completed',NULL,'Insurance','TXN-1069','Paid','2026-04-09 13:00:00'),(70,70,70,'ACH',25.00,'Completed',NULL,'Insurance','TXN-1070','Paid','2026-04-09 14:00:00'),(71,71,71,'ACH',210.00,'Pending',NULL,'Insurance','TXN-1071','Processing','2026-04-09 15:00:00'),(72,72,72,'ACH',95.00,'Completed',NULL,'Insurance','TXN-1072','Paid','2026-04-09 16:00:00'),(73,73,73,'ACH',245.00,'Completed',NULL,'Insurance','TXN-1073','Paid','2026-04-10 09:00:00'),(74,74,74,'ACH',40.00,'Completed',NULL,'Insurance','TXN-1074','Paid','2026-04-10 10:00:00'),(75,75,75,'ACH',165.00,'Completed',NULL,'Insurance','TXN-1075','Paid','2026-04-10 11:00:00'),(76,76,76,'Cash',45.00,'Pending',NULL,'Patient','TXN-1076','Documentation issue','2026-04-10 12:00:00'),(77,77,77,'ACH',140.00,'Completed',NULL,'Insurance','TXN-1077','Paid','2026-04-10 13:00:00'),(78,78,78,'ACH',135.00,'Completed',NULL,'Insurance','TXN-1078','Paid','2026-04-10 14:00:00'),(79,79,79,'ACH',120.00,'Pending',NULL,'Insurance','TXN-1079','Processing','2026-04-10 15:00:00'),(80,80,80,'ACH',1250.00,'Completed',NULL,'Insurance','TXN-1080','Paid','2026-04-10 16:00:00'),(81,81,81,'ACH',170.00,'Completed',NULL,'Insurance','TXN-1081','Paid','2026-04-11 09:00:00'),(82,82,82,'ACH',290.00,'Completed',NULL,'Insurance','TXN-1082','Paid','2026-04-11 10:00:00'),(83,83,83,'ACH',410.00,'Completed',NULL,'Insurance','TXN-1083','Paid','2026-04-11 11:00:00'),(84,84,84,'ACH',25.00,'Pending',NULL,'Insurance','TXN-1084','Processing','2026-04-11 12:00:00'),(85,85,85,'ACH',180.00,'Completed',NULL,'Insurance','TXN-1085','Paid','2026-04-11 13:00:00'),(86,86,86,'ACH',320.00,'Completed',NULL,'Insurance','TXN-1086','Paid','2026-04-11 14:00:00'),(87,87,87,'ACH',20.00,'Completed',NULL,'Insurance','TXN-1087','Paid','2026-04-11 15:00:00'),(88,88,88,'ACH',175.00,'Completed',NULL,'Insurance','TXN-1088','Paid','2026-04-11 16:00:00'),(89,89,89,'Cash',35.00,'Pending',NULL,'Patient','TXN-1089','COB issue','2026-04-11 17:00:00'),(90,90,90,'ACH',700.00,'Completed',NULL,'Insurance','TXN-1090','Paid','2026-04-11 18:00:00'),(91,91,91,'ACH',140.00,'Completed',NULL,'Insurance','TXN-1091','Paid','2026-04-12 09:00:00'),(92,92,92,'ACH',180.00,'Pending',NULL,'Insurance','TXN-1092','Processing','2026-04-12 10:00:00'),(93,93,93,'ACH',120.00,'Completed',NULL,'Insurance','TXN-1093','Paid','2026-04-12 11:00:00'),(94,94,94,'ACH',230.00,'Completed',NULL,'Insurance','TXN-1094','Paid','2026-04-12 12:00:00'),(95,95,95,'ACH',40.00,'Completed',NULL,'Insurance','TXN-1095','Paid','2026-04-12 13:00:00'),(96,96,96,'ACH',650.00,'Completed',NULL,'Insurance','TXN-1096','Paid','2026-04-12 14:00:00'),(97,97,97,'ACH',380.00,'Completed',NULL,'Insurance','TXN-1097','Paid','2026-04-12 15:00:00'),(98,98,98,'Cash',60.00,'Pending',NULL,'Patient','TXN-1098','Denied review','2026-04-12 16:00:00'),(99,99,99,'ACH',135.00,'Completed',NULL,'Insurance','TXN-1099','Paid','2026-04-12 17:00:00'),(100,100,100,'ACH',150.00,'Completed',NULL,'Insurance','TXN-1100','Paid','2026-04-12 18:00:00');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `payment_audit_trigger` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        event_time,
        actor_user_id,
        action_type,
        entity_name,
        entity_pk,
        changed_columns,
        old_values_json,
        new_values_json,
        status
    )
    VALUES (
        NOW(),
        NULL,
        'INSERT',
        'payments',
        NEW.payment_id,
        'claim_id,patient_id,payment_method,amount',
        NULL,
        JSON_OBJECT(
            'claim_id', NEW.claim_id,
            'patient_id', NEW.patient_id,
            'payment_method', NEW.payment_method,
            'amount', NEW.amount
        ),
        'SUCCESS'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `payroll_id` int NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(50) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `pay_type` enum('Weekly','Biweekly','Monthly','Adjustment') NOT NULL,
  `status` enum('Draft','Processed','Paid','Void','Cancelled') NOT NULL DEFAULT 'Draft',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payroll_id`),
  UNIQUE KEY `ref_no` (`ref_no`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (1,'PR-2025-001','2025-01-01','2025-01-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(2,'PR-2025-002','2025-01-16','2025-01-31','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(3,'PR-2025-003','2025-02-01','2025-02-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(4,'PR-2025-004','2025-02-16','2025-02-28','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(5,'PR-2025-005','2025-03-01','2025-03-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(6,'PR-2025-006','2025-03-16','2025-03-31','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(7,'PR-2025-007','2025-04-01','2025-04-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(8,'PR-2025-008','2025-04-16','2025-04-30','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(9,'PR-2025-009','2025-05-01','2025-05-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(10,'PR-2025-010','2025-05-16','2025-05-31','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(11,'PR-2025-011','2025-06-01','2025-06-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(12,'PR-2025-012','2025-06-16','2025-06-30','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(13,'PR-2025-013','2025-07-01','2025-07-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(14,'PR-2025-014','2025-07-16','2025-07-31','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(15,'PR-2025-015','2025-08-01','2025-08-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(16,'PR-2025-016','2025-08-16','2025-08-31','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(17,'PR-2025-017','2025-09-01','2025-09-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(18,'PR-2025-018','2025-09-16','2025-09-30','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(19,'PR-2025-019','2025-10-01','2025-10-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(20,'PR-2025-020','2025-10-16','2025-10-31','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(21,'PR-2025-021','2025-11-01','2025-11-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(22,'PR-2025-022','2025-11-16','2025-11-30','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(23,'PR-2025-023','2025-12-01','2025-12-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(24,'PR-2025-024','2025-12-16','2025-12-31','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(25,'PR-2026-001','2026-01-01','2026-01-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(26,'PR-2026-002','2026-01-16','2026-01-31','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(27,'PR-2026-003','2026-02-01','2026-02-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(28,'PR-2026-004','2026-02-16','2026-02-28','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(29,'PR-2026-005','2026-03-01','2026-03-15','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(30,'PR-2026-006','2026-03-16','2026-03-31','Biweekly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(31,'PR-2026-007','2026-04-01','2026-04-15','Biweekly','Processed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(32,'PR-2026-008','2026-04-16','2026-04-30','Biweekly','Draft','2026-04-30 13:51:29','2026-04-30 13:51:29'),(33,'PR-2025-M01','2025-01-01','2025-01-31','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(34,'PR-2025-M02','2025-02-01','2025-02-28','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(35,'PR-2025-M03','2025-03-01','2025-03-31','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(36,'PR-2025-M04','2025-04-01','2025-04-30','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(37,'PR-2025-M05','2025-05-01','2025-05-31','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(38,'PR-2025-M06','2025-06-01','2025-06-30','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(39,'PR-2025-M07','2025-07-01','2025-07-31','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(40,'PR-2025-M08','2025-08-01','2025-08-31','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(41,'PR-2025-M09','2025-09-01','2025-09-30','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(42,'PR-2025-M10','2025-10-01','2025-10-31','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(43,'PR-2025-M11','2025-11-01','2025-11-30','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(44,'PR-2025-M12','2025-12-01','2025-12-31','Monthly','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(45,'PR-2026-A01','2026-02-10','2026-02-10','Adjustment','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(46,'PR-2026-A02','2026-03-20','2026-03-20','Adjustment','Paid','2026-04-30 13:51:29','2026-04-30 13:51:29'),(47,'PR-2026-A03','2026-04-10','2026-04-10','Adjustment','Processed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(48,'PR-2026-A04','2026-04-20','2026-04-20','Adjustment','Draft','2026-04-30 13:51:29','2026-04-30 13:51:29'),(49,'PR-2026-009','2026-05-01','2026-05-15','Biweekly','Draft','2026-04-30 13:51:29','2026-04-30 13:51:29'),(50,'PR-2026-010','2026-05-16','2026-05-31','Biweekly','Draft','2026-04-30 13:51:29','2026-04-30 13:51:29');
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_item_allowances`
--

DROP TABLE IF EXISTS `payroll_item_allowances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_item_allowances` (
  `payroll_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `allowance_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`payroll_id`,`employee_id`,`allowance_id`),
  KEY `allowance_id` (`allowance_id`),
  CONSTRAINT `payroll_item_allowances_ibfk_1` FOREIGN KEY (`payroll_id`, `employee_id`) REFERENCES `payroll_items` (`payroll_id`, `employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payroll_item_allowances_ibfk_2` FOREIGN KEY (`allowance_id`) REFERENCES `allowances` (`allowance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_item_allowances`
--

LOCK TABLES `payroll_item_allowances` WRITE;
/*!40000 ALTER TABLE `payroll_item_allowances` DISABLE KEYS */;
INSERT INTO `payroll_item_allowances` VALUES (1,1,3,1200.00),(1,1,11,150.00),(1,2,3,1100.00),(1,2,4,200.00),(1,3,3,1000.00),(1,3,8,300.00),(1,4,3,950.00),(1,4,5,155.00),(1,5,3,900.00),(1,5,9,250.00),(1,6,1,75.00),(1,6,7,150.00),(1,7,2,75.00),(1,7,7,140.00),(1,8,1,80.00),(1,8,4,150.00),(1,9,1,85.00),(1,9,5,200.00),(1,10,14,300.00),(1,10,16,400.00),(2,6,1,75.00),(2,7,2,75.00),(2,8,1,80.00),(2,9,1,85.00),(2,10,14,300.00),(2,11,2,70.00),(2,12,2,70.00),(2,13,16,350.00),(2,14,1,60.00),(2,15,1,65.00),(3,16,1,65.00),(3,17,8,350.00),(3,18,8,300.00),(3,19,1,70.00),(3,20,1,70.00),(3,21,1,60.00),(3,22,1,60.00),(3,23,1,65.00),(3,24,1,70.00),(3,25,1,75.00),(4,6,4,120.00),(4,7,4,120.00),(4,8,5,180.00),(4,9,5,175.00),(4,10,8,300.00),(4,26,1,65.00),(4,27,1,65.00),(4,28,1,70.00),(4,29,1,55.00),(4,30,1,60.00),(5,11,9,200.00),(5,12,9,180.00),(5,13,6,250.00),(5,14,6,200.00),(5,15,3,800.00),(5,16,3,750.00),(5,17,5,200.00),(5,18,5,190.00),(5,19,2,75.00),(5,20,2,75.00),(6,21,10,100.00),(6,22,10,100.00),(6,23,11,150.00),(6,24,11,150.00),(6,25,12,400.00),(6,26,17,220.00),(6,27,17,200.00),(6,28,18,210.00),(6,29,15,130.00),(6,30,15,120.00),(7,6,1,75.00),(7,7,2,75.00),(7,8,1,80.00),(7,9,1,85.00),(7,10,14,300.00),(7,11,2,70.00),(7,12,2,70.00),(7,13,16,350.00),(7,14,1,60.00),(7,15,1,65.00),(8,16,1,65.00),(8,17,8,350.00),(8,18,8,300.00),(8,19,1,70.00),(8,20,1,70.00),(8,21,1,60.00),(8,22,1,60.00),(8,23,1,65.00),(8,24,1,70.00),(8,25,1,75.00),(9,6,4,120.00),(9,7,4,120.00),(9,8,5,180.00),(9,9,5,175.00),(9,10,8,300.00),(9,26,1,65.00),(9,27,1,65.00),(9,28,1,70.00),(9,29,1,55.00),(9,30,1,60.00),(10,11,9,200.00),(10,12,9,180.00),(10,13,6,250.00),(10,14,6,200.00),(10,15,3,800.00),(10,16,3,750.00),(10,17,5,200.00),(10,18,5,190.00),(10,19,2,75.00),(10,20,2,75.00);
/*!40000 ALTER TABLE `payroll_item_allowances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_item_deductions`
--

DROP TABLE IF EXISTS `payroll_item_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_item_deductions` (
  `payroll_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `deduction_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`payroll_id`,`employee_id`,`deduction_id`),
  KEY `deduction_id` (`deduction_id`),
  CONSTRAINT `payroll_item_deductions_ibfk_1` FOREIGN KEY (`payroll_id`, `employee_id`) REFERENCES `payroll_items` (`payroll_id`, `employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payroll_item_deductions_ibfk_2` FOREIGN KEY (`deduction_id`) REFERENCES `deductions` (`deduction_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_item_deductions`
--

LOCK TABLES `payroll_item_deductions` WRITE;
/*!40000 ALTER TABLE `payroll_item_deductions` DISABLE KEYS */;
INSERT INTO `payroll_item_deductions` VALUES (1,1,1,2016.00),(1,1,5,1041.60),(1,2,1,1944.00),(1,2,6,234.90),(1,3,1,1908.00),(1,3,7,120.00),(1,4,2,775.00),(1,4,8,50.00),(1,5,3,453.00),(1,5,9,40.00),(1,6,1,50.00),(1,6,5,188.48),(1,7,2,45.00),(1,7,6,41.76),(1,8,1,55.00),(1,8,7,100.00),(1,9,1,60.00),(1,9,10,75.00),(1,10,1,940.00),(1,10,11,470.00),(2,6,1,50.00),(2,7,2,45.00),(2,8,1,55.00),(2,9,1,60.00),(2,10,1,940.00),(2,11,5,403.00),(2,12,6,98.60),(2,13,1,1344.00),(2,14,2,208.00),(2,15,3,156.00),(3,16,5,316.20),(3,17,6,126.15),(3,18,1,996.00),(3,19,2,235.00),(3,20,3,135.00),(3,21,1,440.00),(3,22,5,266.60),(3,23,6,69.60),(3,24,1,624.00),(3,25,2,280.00),(4,6,5,188.48),(4,7,6,41.76),(4,8,7,100.00),(4,9,10,75.00),(4,10,11,470.00),(4,26,3,147.00),(4,27,5,291.40),(4,28,6,71.05),(4,29,1,468.00),(4,30,2,205.00),(5,11,12,150.00),(5,12,13,100.00),(5,13,14,200.00),(5,14,15,80.00),(5,15,16,60.00),(5,16,17,120.00),(5,17,18,90.00),(5,18,19,110.00),(5,19,20,70.00),(5,20,12,130.00),(6,21,13,90.00),(6,22,14,150.00),(6,23,15,80.00),(6,24,16,100.00),(6,25,17,110.00),(6,26,18,120.00),(6,27,19,95.00),(6,28,20,85.00),(6,29,12,130.00),(6,30,13,90.00),(7,6,1,50.00),(7,7,2,45.00),(7,8,1,55.00),(7,9,1,60.00),(7,10,1,940.00),(7,11,5,403.00),(7,12,6,98.60),(7,13,1,1344.00),(7,14,2,208.00),(7,15,3,156.00),(8,16,5,316.20),(8,17,6,126.15),(8,18,1,996.00),(8,19,2,235.00),(8,20,3,135.00),(8,21,1,440.00),(8,22,5,266.60),(8,23,6,69.60),(8,24,1,624.00),(8,25,2,280.00),(9,6,5,188.48),(9,7,6,41.76),(9,8,7,100.00),(9,9,10,75.00),(9,10,11,470.00),(9,26,3,147.00),(9,27,5,291.40),(9,28,6,71.05),(9,29,1,468.00),(9,30,2,205.00),(10,11,12,150.00),(10,12,13,100.00),(10,13,14,200.00),(10,14,15,80.00),(10,15,16,60.00),(10,16,17,120.00),(10,17,18,90.00),(10,18,19,110.00),(10,19,20,70.00),(10,20,12,130.00);
/*!40000 ALTER TABLE `payroll_item_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_items`
--

DROP TABLE IF EXISTS `payroll_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_items` (
  `payroll_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `present_days` int DEFAULT '0',
  `absent_days` int DEFAULT '0',
  `late_minutes` int DEFAULT '0',
  `base_salary` decimal(10,2) DEFAULT '0.00',
  `allowances_total` decimal(10,2) DEFAULT '0.00',
  `deductions_total` decimal(10,2) DEFAULT '0.00',
  `net_pay` decimal(10,2) DEFAULT '0.00',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payroll_id`,`employee_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `payroll_items_ibfk_1` FOREIGN KEY (`payroll_id`) REFERENCES `payroll` (`payroll_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payroll_items_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_items`
--

LOCK TABLES `payroll_items` WRITE;
/*!40000 ALTER TABLE `payroll_items` DISABLE KEYS */;
INSERT INTO `payroll_items` VALUES (1,1,10,0,0,16800.00,450.00,1250.00,16000.00,'2026-04-30 13:51:29'),(1,2,10,0,4,16200.00,420.00,1200.00,15420.00,'2026-04-30 13:51:29'),(1,3,9,1,12,15900.00,400.00,1400.00,14900.00,'2026-04-30 13:51:29'),(1,4,10,0,0,15500.00,380.00,1180.00,14700.00,'2026-04-30 13:51:29'),(1,5,10,0,6,15100.00,375.00,1150.00,14325.00,'2026-04-30 13:51:29'),(1,6,10,0,5,3040.00,150.00,100.00,3090.00,'2026-04-30 13:51:29'),(1,7,10,0,0,2880.00,150.00,95.00,2935.00,'2026-04-30 13:51:29'),(1,8,9,1,10,2800.00,140.00,120.00,2820.00,'2026-04-30 13:51:29'),(1,9,10,0,3,2720.00,145.00,110.00,2755.00,'2026-04-30 13:51:29'),(1,10,10,0,0,9400.00,320.00,720.00,9000.00,'2026-04-30 13:51:29'),(1,11,10,0,2,6500.00,250.00,420.00,6330.00,'2026-04-30 13:51:29'),(1,12,9,1,14,6800.00,260.00,500.00,6560.00,'2026-04-30 13:51:29'),(1,13,10,0,0,11200.00,350.00,900.00,10650.00,'2026-04-30 13:51:29'),(1,14,10,0,8,4160.00,180.00,160.00,4180.00,'2026-04-30 13:51:29'),(1,15,10,0,0,5200.00,210.00,330.00,5080.00,'2026-04-30 13:51:29'),(1,16,10,0,5,5100.00,205.00,325.00,4980.00,'2026-04-30 13:51:29'),(1,17,9,1,18,8700.00,290.00,650.00,8340.00,'2026-04-30 13:51:29'),(1,18,10,0,0,8300.00,280.00,610.00,7970.00,'2026-04-30 13:51:29'),(1,19,10,0,7,4700.00,175.00,250.00,4625.00,'2026-04-30 13:51:29'),(1,20,10,0,0,4500.00,170.00,230.00,4440.00,'2026-04-30 13:51:29'),(1,21,10,0,3,4400.00,165.00,220.00,4345.00,'2026-04-30 13:51:29'),(1,22,9,1,10,4300.00,160.00,260.00,4200.00,'2026-04-30 13:51:29'),(1,23,10,0,0,4800.00,185.00,255.00,4730.00,'2026-04-30 13:51:29'),(1,24,10,0,6,5200.00,210.00,300.00,5110.00,'2026-04-30 13:51:29'),(1,25,10,0,0,5600.00,225.00,340.00,5485.00,'2026-04-30 13:51:29'),(1,26,10,0,4,4900.00,190.00,275.00,4815.00,'2026-04-30 13:51:29'),(1,27,9,1,15,4700.00,180.00,330.00,4550.00,'2026-04-30 13:51:29'),(1,28,10,0,0,5300.00,215.00,310.00,5205.00,'2026-04-30 13:51:29'),(1,29,10,0,9,3900.00,145.00,210.00,3835.00,'2026-04-30 13:51:29'),(1,30,10,0,0,4100.00,155.00,215.00,4040.00,'2026-04-30 13:51:29'),(2,1,10,0,3,16800.00,450.00,1260.00,15990.00,'2026-04-30 13:51:29'),(2,2,9,1,10,16200.00,420.00,1380.00,15240.00,'2026-04-30 13:51:29'),(2,3,10,0,0,15900.00,405.00,1195.00,15110.00,'2026-04-30 13:51:29'),(2,4,10,0,5,15500.00,380.00,1190.00,14690.00,'2026-04-30 13:51:29'),(2,5,9,1,16,15100.00,365.00,1320.00,14145.00,'2026-04-30 13:51:29'),(2,6,10,0,2,3040.00,150.00,100.00,3090.00,'2026-04-30 13:51:29'),(2,7,9,1,12,2880.00,145.00,120.00,2905.00,'2026-04-30 13:51:29'),(2,8,10,0,0,2800.00,140.00,105.00,2835.00,'2026-04-30 13:51:29'),(2,9,10,0,6,2720.00,145.00,115.00,2750.00,'2026-04-30 13:51:29'),(2,10,10,0,0,9400.00,325.00,720.00,9005.00,'2026-04-30 13:51:29'),(2,11,10,0,0,6500.00,250.00,420.00,6330.00,'2026-04-30 13:51:29'),(2,12,10,0,4,6800.00,260.00,430.00,6630.00,'2026-04-30 13:51:29'),(2,13,9,1,11,11200.00,345.00,980.00,10565.00,'2026-04-30 13:51:29'),(2,14,10,0,0,4160.00,180.00,160.00,4180.00,'2026-04-30 13:51:29'),(2,15,10,0,7,5200.00,210.00,335.00,5075.00,'2026-04-30 13:51:29'),(2,16,9,1,14,5100.00,200.00,390.00,4910.00,'2026-04-30 13:51:29'),(2,17,10,0,0,8700.00,290.00,640.00,8350.00,'2026-04-30 13:51:29'),(2,18,10,0,5,8300.00,280.00,620.00,7960.00,'2026-04-30 13:51:29'),(2,19,10,0,0,4700.00,175.00,245.00,4630.00,'2026-04-30 13:51:29'),(2,20,9,1,18,4500.00,165.00,310.00,4355.00,'2026-04-30 13:51:29'),(2,21,10,0,4,4400.00,165.00,225.00,4340.00,'2026-04-30 13:51:29'),(2,22,10,0,0,4300.00,160.00,215.00,4245.00,'2026-04-30 13:51:29'),(2,23,10,0,8,4800.00,185.00,260.00,4725.00,'2026-04-30 13:51:29'),(2,24,9,1,13,5200.00,205.00,355.00,5050.00,'2026-04-30 13:51:29'),(2,25,10,0,0,5600.00,225.00,340.00,5485.00,'2026-04-30 13:51:29'),(2,26,10,0,6,4900.00,190.00,280.00,4810.00,'2026-04-30 13:51:29'),(2,27,10,0,0,4700.00,180.00,250.00,4630.00,'2026-04-30 13:51:29'),(2,28,9,1,12,5300.00,210.00,370.00,5140.00,'2026-04-30 13:51:29'),(2,29,10,0,3,3900.00,145.00,205.00,3840.00,'2026-04-30 13:51:29'),(2,30,10,0,0,4100.00,155.00,215.00,4040.00,'2026-04-30 13:51:29'),(3,1,9,1,12,16800.00,445.00,1390.00,15855.00,'2026-04-30 13:51:29'),(3,2,10,0,0,16200.00,420.00,1200.00,15420.00,'2026-04-30 13:51:29'),(3,3,10,0,6,15900.00,400.00,1210.00,15090.00,'2026-04-30 13:51:29'),(3,4,9,1,15,15500.00,375.00,1320.00,14555.00,'2026-04-30 13:51:29'),(3,5,10,0,0,15100.00,375.00,1150.00,14325.00,'2026-04-30 13:51:29'),(3,6,10,0,0,3040.00,150.00,100.00,3090.00,'2026-04-30 13:51:29'),(3,7,10,0,5,2880.00,150.00,100.00,2930.00,'2026-04-30 13:51:29'),(3,8,9,1,14,2800.00,140.00,125.00,2815.00,'2026-04-30 13:51:29'),(3,9,10,0,0,2720.00,145.00,110.00,2755.00,'2026-04-30 13:51:29'),(3,10,10,0,2,9400.00,320.00,725.00,8995.00,'2026-04-30 13:51:29'),(3,11,9,1,10,6500.00,245.00,500.00,6245.00,'2026-04-30 13:51:29'),(3,12,10,0,0,6800.00,260.00,420.00,6640.00,'2026-04-30 13:51:29'),(3,13,10,0,4,11200.00,350.00,905.00,10645.00,'2026-04-30 13:51:29'),(3,14,10,0,0,4160.00,180.00,160.00,4180.00,'2026-04-30 13:51:29'),(3,15,9,1,17,5200.00,205.00,410.00,4995.00,'2026-04-30 13:51:29'),(3,16,10,0,0,5100.00,205.00,325.00,4980.00,'2026-04-30 13:51:29'),(3,17,10,0,7,8700.00,290.00,650.00,8340.00,'2026-04-30 13:51:29'),(3,18,9,1,11,8300.00,275.00,760.00,7815.00,'2026-04-30 13:51:29'),(3,19,10,0,0,4700.00,175.00,245.00,4630.00,'2026-04-30 13:51:29'),(3,20,10,0,5,4500.00,170.00,235.00,4435.00,'2026-04-30 13:51:29'),(3,21,9,1,12,4400.00,160.00,295.00,4265.00,'2026-04-30 13:51:29'),(3,22,10,0,0,4300.00,160.00,215.00,4245.00,'2026-04-30 13:51:29'),(3,23,10,0,4,4800.00,185.00,260.00,4725.00,'2026-04-30 13:51:29'),(3,24,10,0,0,5200.00,210.00,300.00,5110.00,'2026-04-30 13:51:29'),(3,25,9,1,16,5600.00,220.00,430.00,5390.00,'2026-04-30 13:51:29'),(3,26,10,0,0,4900.00,190.00,275.00,4815.00,'2026-04-30 13:51:29'),(3,27,10,0,6,4700.00,180.00,260.00,4620.00,'2026-04-30 13:51:29'),(3,28,9,1,13,5300.00,210.00,365.00,5145.00,'2026-04-30 13:51:29'),(3,29,10,0,0,3900.00,145.00,210.00,3835.00,'2026-04-30 13:51:29'),(3,30,10,0,3,4100.00,155.00,220.00,4035.00,'2026-04-30 13:51:29'),(4,1,10,0,0,16800.00,450.00,1250.00,16000.00,'2026-04-30 13:51:29'),(4,2,10,0,5,16200.00,420.00,1210.00,15410.00,'2026-04-30 13:51:29'),(4,3,9,1,18,15900.00,395.00,1425.00,14870.00,'2026-04-30 13:51:29'),(4,4,10,0,0,15500.00,380.00,1180.00,14700.00,'2026-04-30 13:51:29'),(4,5,10,0,4,15100.00,375.00,1160.00,14315.00,'2026-04-30 13:51:29'),(4,6,9,1,12,3040.00,145.00,135.00,3050.00,'2026-04-30 13:51:29'),(4,7,10,0,0,2880.00,150.00,95.00,2935.00,'2026-04-30 13:51:29'),(4,8,10,0,6,2800.00,140.00,110.00,2830.00,'2026-04-30 13:51:29'),(4,9,9,1,11,2720.00,140.00,150.00,2710.00,'2026-04-30 13:51:29'),(4,10,10,0,0,9400.00,320.00,720.00,9000.00,'2026-04-30 13:51:29'),(4,11,10,0,3,6500.00,250.00,425.00,6325.00,'2026-04-30 13:51:29'),(4,12,9,1,16,6800.00,255.00,520.00,6535.00,'2026-04-30 13:51:29'),(4,13,10,0,0,11200.00,350.00,900.00,10650.00,'2026-04-30 13:51:29'),(4,14,10,0,7,4160.00,180.00,165.00,4175.00,'2026-04-30 13:51:29'),(4,15,10,0,0,5200.00,210.00,330.00,5080.00,'2026-04-30 13:51:29'),(4,16,9,1,14,5100.00,200.00,395.00,4905.00,'2026-04-30 13:51:29'),(4,17,10,0,5,8700.00,290.00,645.00,8345.00,'2026-04-30 13:51:29'),(4,18,10,0,0,8300.00,280.00,610.00,7970.00,'2026-04-30 13:51:29'),(4,19,9,1,13,4700.00,170.00,320.00,4550.00,'2026-04-30 13:51:29'),(4,20,10,0,0,4500.00,170.00,230.00,4440.00,'2026-04-30 13:51:29'),(4,21,10,0,4,4400.00,165.00,225.00,4340.00,'2026-04-30 13:51:29'),(4,22,9,1,12,4300.00,155.00,285.00,4170.00,'2026-04-30 13:51:29'),(4,23,10,0,0,4800.00,185.00,255.00,4730.00,'2026-04-30 13:51:29'),(4,24,10,0,6,5200.00,210.00,305.00,5105.00,'2026-04-30 13:51:29'),(4,25,9,1,10,5600.00,220.00,410.00,5410.00,'2026-04-30 13:51:29'),(4,26,10,0,0,4900.00,190.00,275.00,4815.00,'2026-04-30 13:51:29'),(4,27,10,0,5,4700.00,180.00,255.00,4625.00,'2026-04-30 13:51:29'),(4,28,10,0,0,5300.00,215.00,310.00,5205.00,'2026-04-30 13:51:29'),(4,29,9,1,15,3900.00,140.00,265.00,3775.00,'2026-04-30 13:51:29'),(4,30,10,0,0,4100.00,155.00,215.00,4040.00,'2026-04-30 13:51:29'),(5,1,10,0,4,16800.00,450.00,1260.00,15990.00,'2026-04-30 13:51:29'),(5,2,9,1,14,16200.00,415.00,1390.00,15225.00,'2026-04-30 13:51:29'),(5,3,10,0,0,15900.00,400.00,1200.00,15100.00,'2026-04-30 13:51:29'),(5,4,10,0,5,15500.00,380.00,1190.00,14690.00,'2026-04-30 13:51:29'),(5,5,9,1,12,15100.00,365.00,1335.00,14130.00,'2026-04-30 13:51:29'),(5,6,10,0,0,3040.00,150.00,100.00,3090.00,'2026-04-30 13:51:29'),(5,7,10,0,6,2880.00,150.00,100.00,2930.00,'2026-04-30 13:51:29'),(5,8,9,1,10,2800.00,140.00,120.00,2820.00,'2026-04-30 13:51:29'),(5,9,10,0,0,2720.00,145.00,110.00,2755.00,'2026-04-30 13:51:29'),(5,10,10,0,0,9400.00,325.00,720.00,9005.00,'2026-04-30 13:51:29'),(5,11,10,0,2,6500.00,250.00,420.00,6330.00,'2026-04-30 13:51:29'),(5,12,10,0,0,6800.00,260.00,420.00,6640.00,'2026-04-30 13:51:29'),(5,13,9,1,18,11200.00,345.00,995.00,10550.00,'2026-04-30 13:51:29'),(5,14,10,0,0,4160.00,180.00,160.00,4180.00,'2026-04-30 13:51:29'),(5,15,10,0,4,5200.00,210.00,335.00,5075.00,'2026-04-30 13:51:29'),(5,16,9,1,12,5100.00,200.00,385.00,4915.00,'2026-04-30 13:51:29'),(5,17,10,0,0,8700.00,290.00,640.00,8350.00,'2026-04-30 13:51:29'),(5,18,10,0,7,8300.00,280.00,625.00,7955.00,'2026-04-30 13:51:29'),(5,19,10,0,0,4700.00,175.00,245.00,4630.00,'2026-04-30 13:51:29'),(5,20,9,1,15,4500.00,165.00,305.00,4360.00,'2026-04-30 13:51:29'),(5,21,10,0,0,4400.00,165.00,220.00,4345.00,'2026-04-30 13:51:29'),(5,22,10,0,6,4300.00,160.00,225.00,4235.00,'2026-04-30 13:51:29'),(5,23,9,1,11,4800.00,180.00,325.00,4655.00,'2026-04-30 13:51:29'),(5,24,10,0,0,5200.00,210.00,300.00,5110.00,'2026-04-30 13:51:29'),(5,25,10,0,5,5600.00,225.00,345.00,5480.00,'2026-04-30 13:51:29'),(5,26,9,1,14,4900.00,185.00,355.00,4730.00,'2026-04-30 13:51:29'),(5,27,10,0,0,4700.00,180.00,250.00,4630.00,'2026-04-30 13:51:29'),(5,28,10,0,4,5300.00,215.00,315.00,5200.00,'2026-04-30 13:51:29'),(5,29,9,1,10,3900.00,140.00,255.00,3785.00,'2026-04-30 13:51:29'),(5,30,10,0,0,4100.00,155.00,215.00,4040.00,'2026-04-30 13:51:29'),(6,1,9,1,10,16800.00,445.00,1385.00,15860.00,'2026-04-30 13:51:29'),(6,2,10,0,0,16200.00,420.00,1200.00,15420.00,'2026-04-30 13:51:29'),(6,3,10,0,5,15900.00,400.00,1210.00,15090.00,'2026-04-30 13:51:29'),(6,4,9,1,16,15500.00,375.00,1330.00,14545.00,'2026-04-30 13:51:29'),(6,5,10,0,0,15100.00,375.00,1150.00,14325.00,'2026-04-30 13:51:29'),(6,6,10,0,3,3040.00,150.00,100.00,3090.00,'2026-04-30 13:51:29'),(6,7,9,1,11,2880.00,145.00,125.00,2900.00,'2026-04-30 13:51:29'),(6,8,10,0,0,2800.00,140.00,105.00,2835.00,'2026-04-30 13:51:29'),(6,9,10,0,6,2720.00,145.00,115.00,2750.00,'2026-04-30 13:51:29'),(6,10,10,0,0,9400.00,320.00,720.00,9000.00,'2026-04-30 13:51:29'),(6,11,9,1,14,6500.00,245.00,495.00,6250.00,'2026-04-30 13:51:29'),(6,12,10,0,0,6800.00,260.00,420.00,6640.00,'2026-04-30 13:51:29'),(6,13,10,0,4,11200.00,350.00,905.00,10645.00,'2026-04-30 13:51:29'),(6,14,10,0,0,4160.00,180.00,160.00,4180.00,'2026-04-30 13:51:29'),(6,15,9,1,12,5200.00,205.00,405.00,5000.00,'2026-04-30 13:51:29'),(6,16,10,0,0,5100.00,205.00,325.00,4980.00,'2026-04-30 13:51:29'),(6,17,10,0,7,8700.00,290.00,650.00,8340.00,'2026-04-30 13:51:29'),(6,18,9,1,10,8300.00,275.00,750.00,7825.00,'2026-04-30 13:51:29'),(6,19,10,0,0,4700.00,175.00,245.00,4630.00,'2026-04-30 13:51:29'),(6,20,10,0,5,4500.00,170.00,235.00,4435.00,'2026-04-30 13:51:29'),(6,21,9,1,13,4400.00,160.00,300.00,4260.00,'2026-04-30 13:51:29'),(6,22,10,0,0,4300.00,160.00,215.00,4245.00,'2026-04-30 13:51:29'),(6,23,10,0,4,4800.00,185.00,260.00,4725.00,'2026-04-30 13:51:29'),(6,24,10,0,0,5200.00,210.00,300.00,5110.00,'2026-04-30 13:51:29'),(6,25,9,1,15,5600.00,220.00,425.00,5395.00,'2026-04-30 13:51:29'),(6,26,10,0,0,4900.00,190.00,275.00,4815.00,'2026-04-30 13:51:29'),(6,27,10,0,6,4700.00,180.00,260.00,4620.00,'2026-04-30 13:51:29'),(6,28,9,1,11,5300.00,210.00,360.00,5150.00,'2026-04-30 13:51:29'),(6,29,10,0,0,3900.00,145.00,210.00,3835.00,'2026-04-30 13:51:29'),(6,30,10,0,3,4100.00,155.00,220.00,4035.00,'2026-04-30 13:51:29'),(7,1,10,0,0,16800.00,450.00,1250.00,16000.00,'2026-04-30 13:51:29'),(7,2,10,0,6,16200.00,420.00,1210.00,15410.00,'2026-04-30 13:51:29'),(7,3,9,1,14,15900.00,395.00,1410.00,14885.00,'2026-04-30 13:51:29'),(7,4,10,0,0,15500.00,380.00,1180.00,14700.00,'2026-04-30 13:51:29'),(7,5,10,0,5,15100.00,375.00,1160.00,14315.00,'2026-04-30 13:51:29'),(7,6,9,1,12,3040.00,145.00,135.00,3050.00,'2026-04-30 13:51:29'),(7,7,10,0,0,2880.00,150.00,95.00,2935.00,'2026-04-30 13:51:29'),(7,8,10,0,4,2800.00,140.00,110.00,2830.00,'2026-04-30 13:51:29'),(7,9,9,1,10,2720.00,140.00,145.00,2715.00,'2026-04-30 13:51:29'),(7,10,10,0,0,9400.00,320.00,720.00,9000.00,'2026-04-30 13:51:29'),(7,11,10,0,0,6500.00,250.00,420.00,6330.00,'2026-04-30 13:51:29'),(7,12,9,1,18,6800.00,255.00,530.00,6525.00,'2026-04-30 13:51:29'),(7,13,10,0,0,11200.00,350.00,900.00,10650.00,'2026-04-30 13:51:29'),(7,14,10,0,7,4160.00,180.00,165.00,4175.00,'2026-04-30 13:51:29'),(7,15,10,0,0,5200.00,210.00,330.00,5080.00,'2026-04-30 13:51:29'),(7,16,9,1,13,5100.00,200.00,390.00,4910.00,'2026-04-30 13:51:29'),(7,17,10,0,5,8700.00,290.00,645.00,8345.00,'2026-04-30 13:51:29'),(7,18,10,0,0,8300.00,280.00,610.00,7970.00,'2026-04-30 13:51:29'),(7,19,9,1,12,4700.00,170.00,315.00,4555.00,'2026-04-30 13:51:29'),(7,20,10,0,0,4500.00,170.00,230.00,4440.00,'2026-04-30 13:51:29'),(7,21,10,0,4,4400.00,165.00,225.00,4340.00,'2026-04-30 13:51:29'),(7,22,9,1,11,4300.00,155.00,280.00,4175.00,'2026-04-30 13:51:29'),(7,23,10,0,0,4800.00,185.00,255.00,4730.00,'2026-04-30 13:51:29'),(7,24,10,0,6,5200.00,210.00,305.00,5105.00,'2026-04-30 13:51:29'),(7,25,9,1,16,5600.00,220.00,430.00,5390.00,'2026-04-30 13:51:29'),(7,26,10,0,0,4900.00,190.00,275.00,4815.00,'2026-04-30 13:51:29'),(7,27,10,0,5,4700.00,180.00,255.00,4625.00,'2026-04-30 13:51:29'),(7,28,10,0,0,5300.00,215.00,310.00,5205.00,'2026-04-30 13:51:29'),(7,29,9,1,14,3900.00,140.00,260.00,3780.00,'2026-04-30 13:51:29'),(7,30,10,0,0,4100.00,155.00,215.00,4040.00,'2026-04-30 13:51:29'),(8,1,10,0,4,16800.00,450.00,1260.00,15990.00,'2026-04-30 13:51:29'),(8,2,9,1,12,16200.00,415.00,1385.00,15230.00,'2026-04-30 13:51:29'),(8,3,10,0,0,15900.00,400.00,1200.00,15100.00,'2026-04-30 13:51:29'),(8,4,10,0,5,15500.00,380.00,1190.00,14690.00,'2026-04-30 13:51:29'),(8,5,9,1,15,15100.00,365.00,1340.00,14125.00,'2026-04-30 13:51:29'),(8,6,10,0,0,3040.00,150.00,100.00,3090.00,'2026-04-30 13:51:29'),(8,7,10,0,6,2880.00,150.00,100.00,2930.00,'2026-04-30 13:51:29'),(8,8,9,1,11,2800.00,140.00,122.00,2818.00,'2026-04-30 13:51:29'),(8,9,10,0,0,2720.00,145.00,110.00,2755.00,'2026-04-30 13:51:29'),(8,10,10,0,0,9400.00,325.00,720.00,9005.00,'2026-04-30 13:51:29'),(8,11,10,0,2,6500.00,250.00,420.00,6330.00,'2026-04-30 13:51:29'),(8,12,10,0,0,6800.00,260.00,420.00,6640.00,'2026-04-30 13:51:29'),(8,13,9,1,17,11200.00,345.00,990.00,10555.00,'2026-04-30 13:51:29'),(8,14,10,0,0,4160.00,180.00,160.00,4180.00,'2026-04-30 13:51:29'),(8,15,10,0,4,5200.00,210.00,335.00,5075.00,'2026-04-30 13:51:29'),(8,16,9,1,14,5100.00,200.00,395.00,4905.00,'2026-04-30 13:51:29'),(8,17,10,0,0,8700.00,290.00,640.00,8350.00,'2026-04-30 13:51:29'),(8,18,10,0,7,8300.00,280.00,625.00,7955.00,'2026-04-30 13:51:29'),(8,19,10,0,0,4700.00,175.00,245.00,4630.00,'2026-04-30 13:51:29'),(8,20,9,1,13,4500.00,165.00,300.00,4365.00,'2026-04-30 13:51:29'),(8,21,10,0,0,4400.00,165.00,220.00,4345.00,'2026-04-30 13:51:29'),(8,22,10,0,6,4300.00,160.00,225.00,4235.00,'2026-04-30 13:51:29'),(8,23,9,1,10,4800.00,180.00,320.00,4660.00,'2026-04-30 13:51:29'),(8,24,10,0,0,5200.00,210.00,300.00,5110.00,'2026-04-30 13:51:29'),(8,25,10,0,5,5600.00,225.00,345.00,5480.00,'2026-04-30 13:51:29'),(8,26,9,1,12,4900.00,185.00,350.00,4735.00,'2026-04-30 13:51:29'),(8,27,10,0,0,4700.00,180.00,250.00,4630.00,'2026-04-30 13:51:29'),(8,28,10,0,4,5300.00,215.00,315.00,5200.00,'2026-04-30 13:51:29'),(8,29,9,1,15,3900.00,140.00,265.00,3775.00,'2026-04-30 13:51:29'),(8,30,10,0,0,4100.00,155.00,215.00,4040.00,'2026-04-30 13:51:29'),(9,1,9,1,11,16800.00,445.00,1380.00,15865.00,'2026-04-30 13:51:29'),(9,2,10,0,0,16200.00,420.00,1200.00,15420.00,'2026-04-30 13:51:29'),(9,3,10,0,5,15900.00,400.00,1210.00,15090.00,'2026-04-30 13:51:29'),(9,4,9,1,16,15500.00,375.00,1330.00,14545.00,'2026-04-30 13:51:29'),(9,5,10,0,0,15100.00,375.00,1150.00,14325.00,'2026-04-30 13:51:29'),(9,6,10,0,3,3040.00,150.00,100.00,3090.00,'2026-04-30 13:51:29'),(9,7,9,1,12,2880.00,145.00,125.00,2900.00,'2026-04-30 13:51:29'),(9,8,10,0,0,2800.00,140.00,105.00,2835.00,'2026-04-30 13:51:29'),(9,9,10,0,6,2720.00,145.00,115.00,2750.00,'2026-04-30 13:51:29'),(9,10,10,0,0,9400.00,320.00,720.00,9000.00,'2026-04-30 13:51:29'),(9,11,9,1,14,6500.00,245.00,495.00,6250.00,'2026-04-30 13:51:29'),(9,12,10,0,0,6800.00,260.00,420.00,6640.00,'2026-04-30 13:51:29'),(9,13,10,0,4,11200.00,350.00,905.00,10645.00,'2026-04-30 13:51:29'),(9,14,10,0,0,4160.00,180.00,160.00,4180.00,'2026-04-30 13:51:29'),(9,15,9,1,13,5200.00,205.00,410.00,4995.00,'2026-04-30 13:51:29'),(9,16,10,0,0,5100.00,205.00,325.00,4980.00,'2026-04-30 13:51:29'),(9,17,10,0,7,8700.00,290.00,650.00,8340.00,'2026-04-30 13:51:29'),(9,18,9,1,10,8300.00,275.00,750.00,7825.00,'2026-04-30 13:51:29'),(9,19,10,0,0,4700.00,175.00,245.00,4630.00,'2026-04-30 13:51:29'),(9,20,10,0,5,4500.00,170.00,235.00,4435.00,'2026-04-30 13:51:29'),(9,21,9,1,12,4400.00,160.00,295.00,4265.00,'2026-04-30 13:51:29'),(9,22,10,0,0,4300.00,160.00,215.00,4245.00,'2026-04-30 13:51:29'),(9,23,10,0,4,4800.00,185.00,260.00,4725.00,'2026-04-30 13:51:29'),(9,24,10,0,0,5200.00,210.00,300.00,5110.00,'2026-04-30 13:51:29'),(9,25,9,1,15,5600.00,220.00,425.00,5395.00,'2026-04-30 13:51:29'),(9,26,10,0,0,4900.00,190.00,275.00,4815.00,'2026-04-30 13:51:29'),(9,27,10,0,6,4700.00,180.00,260.00,4620.00,'2026-04-30 13:51:29'),(9,28,9,1,11,5300.00,210.00,360.00,5150.00,'2026-04-30 13:51:29'),(9,29,10,0,0,3900.00,145.00,210.00,3835.00,'2026-04-30 13:51:29'),(9,30,10,0,3,4100.00,155.00,220.00,4035.00,'2026-04-30 13:51:29'),(10,1,10,0,0,16800.00,450.00,1250.00,16000.00,'2026-04-30 13:51:29'),(10,2,10,0,5,16200.00,420.00,1210.00,15410.00,'2026-04-30 13:51:29'),(10,3,9,1,14,15900.00,395.00,1410.00,14885.00,'2026-04-30 13:51:29'),(10,4,10,0,0,15500.00,380.00,1180.00,14700.00,'2026-04-30 13:51:29'),(10,5,10,0,4,15100.00,375.00,1160.00,14315.00,'2026-04-30 13:51:29'),(10,6,9,1,12,3040.00,145.00,135.00,3050.00,'2026-04-30 13:51:29'),(10,7,10,0,0,2880.00,150.00,95.00,2935.00,'2026-04-30 13:51:29'),(10,8,10,0,4,2800.00,140.00,110.00,2830.00,'2026-04-30 13:51:29'),(10,9,9,1,10,2720.00,140.00,145.00,2715.00,'2026-04-30 13:51:29'),(10,10,10,0,0,9400.00,320.00,720.00,9000.00,'2026-04-30 13:51:29'),(10,11,10,0,0,6500.00,250.00,420.00,6330.00,'2026-04-30 13:51:29'),(10,12,9,1,18,6800.00,255.00,530.00,6525.00,'2026-04-30 13:51:29'),(10,13,10,0,0,11200.00,350.00,900.00,10650.00,'2026-04-30 13:51:29'),(10,14,10,0,7,4160.00,180.00,165.00,4175.00,'2026-04-30 13:51:29'),(10,15,10,0,0,5200.00,210.00,330.00,5080.00,'2026-04-30 13:51:29'),(10,16,9,1,13,5100.00,200.00,390.00,4910.00,'2026-04-30 13:51:29'),(10,17,10,0,5,8700.00,290.00,645.00,8345.00,'2026-04-30 13:51:29'),(10,18,10,0,0,8300.00,280.00,610.00,7970.00,'2026-04-30 13:51:29'),(10,19,9,1,12,4700.00,170.00,315.00,4555.00,'2026-04-30 13:51:29'),(10,20,10,0,0,4500.00,170.00,230.00,4440.00,'2026-04-30 13:51:29'),(10,21,10,0,4,4400.00,165.00,225.00,4340.00,'2026-04-30 13:51:29'),(10,22,9,1,11,4300.00,155.00,280.00,4175.00,'2026-04-30 13:51:29'),(10,23,10,0,0,4800.00,185.00,255.00,4730.00,'2026-04-30 13:51:29'),(10,24,10,0,6,5200.00,210.00,305.00,5105.00,'2026-04-30 13:51:29'),(10,25,9,1,16,5600.00,220.00,430.00,5390.00,'2026-04-30 13:51:29'),(10,26,10,0,0,4900.00,190.00,275.00,4815.00,'2026-04-30 13:51:29'),(10,27,10,0,5,4700.00,180.00,255.00,4625.00,'2026-04-30 13:51:29'),(10,28,10,0,0,5300.00,215.00,310.00,5205.00,'2026-04-30 13:51:29'),(10,29,9,1,14,3900.00,140.00,260.00,3780.00,'2026-04-30 13:51:29'),(10,30,10,0,0,4100.00,155.00,215.00,4040.00,'2026-04-30 13:51:29');
/*!40000 ALTER TABLE `payroll_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `payroll_summary`
--

DROP TABLE IF EXISTS `payroll_summary`;
/*!50001 DROP VIEW IF EXISTS `payroll_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `payroll_summary` AS SELECT 
 1 AS `payroll_id`,
 1 AS `employee_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `base_salary`,
 1 AS `allowances_total`,
 1 AS `deductions_total`,
 1 AS `net_pay`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(100) NOT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `permission_name` (`permission_name`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (46,'access_admin_panel'),(23,'add_diagnoses'),(25,'add_procedures'),(41,'approve_timesheets'),(5,'assign_roles'),(13,'cancel_appointments'),(17,'close_encounters'),(11,'create_appointments'),(32,'create_charges'),(19,'create_clinical_notes'),(15,'create_encounters'),(7,'create_patients'),(1,'create_users'),(9,'delete_patients'),(4,'delete_users'),(31,'dispense_medications'),(12,'edit_appointments'),(20,'edit_clinical_notes'),(16,'edit_encounters'),(8,'edit_patients'),(3,'edit_users'),(45,'export_reports'),(44,'generate_reports'),(48,'manage_permissions'),(47,'manage_roles'),(42,'manage_schedules'),(26,'order_labs'),(29,'prescribe_medications'),(36,'process_payments'),(39,'process_payroll'),(21,'sign_clinical_notes'),(34,'submit_claims'),(28,'update_lab_results'),(10,'view_appointments'),(49,'view_audit_logs'),(33,'view_charges'),(35,'view_claims'),(18,'view_clinical_notes'),(22,'view_diagnoses'),(14,'view_encounters'),(27,'view_lab_results'),(30,'view_medications'),(6,'view_patients'),(37,'view_payments'),(38,'view_payroll'),(24,'view_procedures'),(43,'view_reports'),(40,'view_timesheets'),(2,'view_users');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(100) NOT NULL,
  `position_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`position_id`),
  UNIQUE KEY `position_name` (`position_name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Physician','Medical doctor responsible for diagnosis and treatment'),(2,'Emergency Physician','Specialist in emergeFncy medicine'),(3,'Cardiologist','Heart specialist'),(4,'Oncologist','Cancer specialist'),(5,'Neurologist','Brain and nervous system specialist'),(6,'Pediatrician','Child healthcare specialist'),(7,'Hospitalist','Manages inpatient care'),(8,'Surgeon','Performs surgical procedures'),(9,'Anesthesiologist','Administers anesthesia during procedures'),(10,'Registered Nurse (RN)','Provides direct patient care'),(11,'Licensed Practical Nurse (LPN)','Supports patient care'),(12,'Nurse Practitioner (NP)','Advanced practice nurse'),(13,'Physician Assistant (PA)','Supports physician care'),(14,'Medical Assistant','Clinical support'),(15,'Patient Care Technician','Basic patient care'),(16,'Respiratory Therapist','Manages breathing treatments'),(17,'Physical Therapist','Rehabilitation therapy'),(18,'Occupational Therapist','Daily living therapy'),(19,'Speech Therapist','Speech and swallowing therapy'),(20,'Lab Technician','Handles specimen processing and testing'),(21,'Phlebotomist','Draws blood specimens'),(22,'Pathologist','Analyzes lab samples and diagnoses disease'),(23,'Lab Supervisor','Oversees laboratory operations'),(24,'Radiology Tech','Performs imaging studies'),(25,'Radiologist','Interprets medical imaging'),(26,'CT Technologist','Performs CT imaging'),(27,'MRI Technologist','Performs MRI imaging'),(28,'Ultrasound Technician','Performs ultrasound imaging'),(29,'Pharmacist','Manages medication dispensing'),(30,'Pharmacy Technician','Assists pharmacists'),(31,'Billing Specialist','Processes claims and payments'),(32,'Medical Coder','Assigns diagnosis and procedure codes'),(33,'Insurance Coordinator','Handles insurance approvals'),(34,'Medical Biller','Processes patient billing'),(35,'Case Manager','Coordinates patient care'),(36,'Social Worker','Supports patient needs'),(37,'Dietitian','Manages patient nutrition'),(38,'Receptionist','Handles patient registration and check-in'),(39,'Patient Access Representative','Handles patient intake and registration'),(40,'Unit Clerk','Supports nursing station operations'),(41,'Medical Records Clerk','Maintains patient records'),(42,'Health Information Technician','Manages medical records'),(43,'Administrator','Oversees hospital operations'),(44,'HR Specialist','Supports staffing and employee records'),(45,'IT Specialist','Maintains hospital systems'),(46,'Database Administrator','Manages hospital database'),(47,'Systems Analyst','Improves workflows and systems'),(48,'Security Officer','Ensures safety and security'),(49,'Housekeeping','Maintains cleanliness'),(50,'Transporter','Moves patients within hospital'),(51,'Surgical Technologist','Assists during surgeries');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `prescription_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `medication_id` int NOT NULL,
  `dose` varchar(50) DEFAULT NULL,
  `route` varchar(50) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `refills` int DEFAULT '0',
  `prescribed_date` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `instructions` text,
  `status` enum('Active','Completed','Cancelled','Stopped') DEFAULT 'Active',
  PRIMARY KEY (`prescription_id`),
  KEY `provider_id` (`provider_id`),
  KEY `medication_id` (`medication_id`),
  KEY `idx_prescriptions_patient` (`patient_id`),
  KEY `idx_prescriptions_encounter` (`encounter_id`),
  KEY `idx_prescriptions_status` (`status`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prescriptions_ibfk_3` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prescriptions_ibfk_4` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`medication_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,1,1,1,1,'500 mg','PO','Q6H PRN','20 tablets',0,'2026-04-01 11:00:00','2026-04-01','2026-04-05','Take for fever or pain as needed.','Completed'),(2,2,2,2,7,'81 mg','PO','Daily','30 tablets',2,'2026-04-01 11:15:00','2026-04-01',NULL,'Take once daily with food.','Active'),(3,3,3,3,30,'4 mg','PO','Q8H PRN','15 tablets',0,'2026-04-01 11:30:00','2026-04-01','2026-04-07','Take for nausea as needed.','Active'),(4,4,4,4,4,'50 mg','PO','PRN migraine','9 tablets',1,'2026-04-01 12:00:00','2026-04-01','2026-04-15','Take at onset of migraine.','Active'),(5,5,5,5,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-01 12:30:00','2026-04-01','2026-04-08','Take with food as needed for pain.','Completed'),(6,6,6,6,18,'2 puffs','Inhalation','Q4H PRN','1 inhaler',1,'2026-04-01 13:00:00','2026-04-01','2026-04-20','Use for wheezing or shortness of breath.','Active'),(7,7,7,7,12,'50 mg','PO','BID','60 tablets',1,'2026-04-01 13:30:00','2026-04-01',NULL,'Take twice daily.','Active'),(8,8,8,8,23,'20 mg','PO','Daily','30 capsules',1,'2026-04-01 14:00:00','2026-04-01','2026-05-01','Take before breakfast.','Active'),(9,9,9,9,14,'500 mg','PO','BID','60 tablets',2,'2026-04-01 14:30:00','2026-04-01',NULL,'Take with meals.','Active'),(10,10,10,10,31,'10 mg','PO','Daily','30 tablets',1,'2026-04-01 15:00:00','2026-04-01',NULL,'Take once daily.','Active'),(11,11,11,11,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-01 15:30:00','2026-04-01','2026-04-10','Take as needed for pain.','Completed'),(12,12,12,12,15,'10 units','SubQ','Nightly','1 vial',2,'2026-04-01 16:00:00','2026-04-01',NULL,'Inject nightly as directed.','Active'),(13,13,13,13,35,'5 mg','PO','BID','60 tablets',1,'2026-04-02 09:30:00','2026-04-02',NULL,'Take twice daily for anxiety.','Active'),(14,14,14,14,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-02 10:00:00','2026-04-02','2026-05-02','Take once daily for allergies.','Completed'),(15,15,15,15,1,'500 mg','PO','Q6H PRN','20 tablets',0,'2026-04-02 10:30:00','2026-04-02','2026-04-06','Use for fever or discomfort.','Completed'),(16,16,16,1,8,'10 mg','PO','Daily','30 tablets',2,'2026-04-02 11:00:00','2026-04-02',NULL,'Take once daily for blood pressure.','Active'),(17,17,17,2,11,'50 mg','PO','BID','60 tablets',2,'2026-04-02 11:30:00','2026-04-02',NULL,'Take morning and evening.','Active'),(18,18,18,3,5,'1 mg','PO','Q6H PRN','12 tablets',0,'2026-04-02 12:00:00','2026-04-02','2026-04-06','Take as needed for severe pain.','Completed'),(19,19,19,4,3,'250 mg','PO','BID PRN','14 tablets',0,'2026-04-02 12:30:00','2026-04-02','2026-04-09','Take as needed with food.','Completed'),(20,20,20,5,4,'50 mg','PO','PRN migraine','9 tablets',1,'2026-04-02 13:00:00','2026-04-02','2026-04-16','Take at first sign of migraine.','Active'),(21,21,21,6,19,'1 vial','Neb','Q6H','20 nebules',0,'2026-04-02 13:30:00','2026-04-02','2026-04-08','Use with nebulizer every 6 hours.','Completed'),(22,22,22,7,30,'4 mg','PO','Q8H PRN','15 tablets',0,'2026-04-02 14:00:00','2026-04-02','2026-04-06','Take for nausea as needed.','Completed'),(23,23,23,8,7,'81 mg','PO','Daily','30 tablets',2,'2026-04-02 14:30:00','2026-04-02',NULL,'Take daily with food.','Active'),(24,24,24,9,29,'1 g','PO','Daily','7 tablets',0,'2026-04-02 15:00:00','2026-04-02','2026-04-09','Take entire antibiotic course.','Completed'),(25,25,25,10,1,'500 mg','PO','Q6H PRN','20 tablets',0,'2026-04-03 09:30:00','2026-04-03','2026-04-07','Use as needed for pain/fever.','Completed'),(26,26,26,11,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-03 10:00:00','2026-04-03','2026-04-10','Take with food.','Completed'),(27,27,27,12,34,'1 mg','PO','Q8H PRN','10 tablets',0,'2026-04-03 10:30:00','2026-04-03','2026-04-07','Use as needed for anxiety.','Completed'),(28,28,28,13,35,'5 mg','PO','BID','60 tablets',1,'2026-04-03 11:00:00','2026-04-03',NULL,'Take twice daily.','Active'),(29,29,29,14,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-03 11:30:00','2026-04-03',NULL,'Take daily for allergy symptoms.','Active'),(30,30,30,15,7,'81 mg','PO','Daily','30 tablets',2,'2026-04-03 12:00:00','2026-04-03',NULL,'Take once daily.','Active'),(31,31,31,1,29,'1 g','PO','Daily','7 tablets',0,'2026-04-03 12:30:00','2026-04-03','2026-04-10','Finish all antibiotic tablets.','Completed'),(32,32,32,2,1,'500 mg','PO','Q6H PRN','20 tablets',0,'2026-04-03 13:00:00','2026-04-03','2026-04-06','Use as needed.','Completed'),(33,33,33,3,3,'250 mg','PO','BID PRN','14 tablets',0,'2026-04-03 13:30:00','2026-04-03','2026-04-10','Take as needed with meals.','Completed'),(34,34,34,4,4,'50 mg','PO','PRN migraine','9 tablets',1,'2026-04-03 14:00:00','2026-04-03','2026-04-17','Take at onset of symptoms.','Active'),(35,35,35,5,18,'2 puffs','Inhalation','Q4H PRN','1 inhaler',1,'2026-04-03 14:30:00','2026-04-03',NULL,'Use for wheezing or SOB.','Active'),(36,36,36,6,24,'40 mg','PO','Daily','30 tablets',1,'2026-04-03 15:00:00','2026-04-03','2026-05-03','Take before breakfast.','Active'),(37,37,37,7,7,'81 mg','PO','Daily','30 tablets',2,'2026-04-04 09:30:00','2026-04-04',NULL,'Take once daily.','Active'),(38,38,38,8,29,'1 g','PO','Daily','7 tablets',0,'2026-04-04 10:00:00','2026-04-04','2026-04-11','Complete antibiotic course.','Completed'),(39,39,39,9,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-04 10:30:00','2026-04-04','2026-05-04','Take daily.','Completed'),(40,40,40,10,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-04 11:00:00','2026-04-04','2026-04-09','Take as needed for pain.','Completed'),(41,41,41,11,35,'5 mg','PO','BID','60 tablets',1,'2026-04-04 11:30:00','2026-04-04',NULL,'Take twice daily.','Active'),(42,42,42,12,18,'2 puffs','Inhalation','Q4H PRN','1 inhaler',1,'2026-04-04 12:00:00','2026-04-04','2026-04-10','Use as needed.','Completed'),(43,43,43,13,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-04 12:30:00','2026-04-04',NULL,'Take daily.','Active'),(44,44,44,14,11,'50 mg','PO','BID','60 tablets',2,'2026-04-04 13:00:00','2026-04-04',NULL,'Take twice daily.','Active'),(45,45,45,15,29,'1 g','PO','Daily','7 tablets',0,'2026-04-04 13:30:00','2026-04-04','2026-04-12','Complete treatment course.','Completed'),(46,46,46,1,27,'250 mg','PO','Daily x5 days','5 tablets',0,'2026-04-04 14:00:00','2026-04-04','2026-04-09','Take one tablet daily.','Completed'),(47,47,47,2,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-04 14:30:00','2026-04-04','2026-04-11','Take as needed.','Completed'),(48,48,48,3,34,'1 mg','PO','Q8H PRN','10 tablets',0,'2026-04-04 15:00:00','2026-04-04','2026-04-08','Use as needed.','Completed'),(49,49,49,4,18,'2 puffs','Inhalation','Q4H PRN','1 inhaler',1,'2026-04-05 09:30:00','2026-04-05',NULL,'Use as needed for breathing symptoms.','Active'),(50,50,50,5,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-05 10:00:00','2026-04-05',NULL,'Take once daily.','Active'),(51,51,51,6,8,'10 mg','PO','Daily','30 tablets',2,'2026-04-05 10:30:00','2026-04-05',NULL,'Take daily for BP.','Active'),(52,52,52,7,29,'1 g','PO','Daily','7 tablets',0,'2026-04-05 11:00:00','2026-04-05','2026-04-13','Complete full course.','Completed'),(53,53,53,8,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-05 11:30:00','2026-04-05',NULL,'Take daily.','Active'),(54,54,54,9,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-05 12:00:00','2026-04-05','2026-04-12','Take with food.','Completed'),(55,55,55,10,35,'5 mg','PO','BID','60 tablets',1,'2026-04-05 12:30:00','2026-04-05',NULL,'Take twice daily.','Active'),(56,56,56,11,18,'2 puffs','Inhalation','Q4H PRN','1 inhaler',1,'2026-04-05 13:00:00','2026-04-05','2026-04-11','Use for respiratory symptoms.','Completed'),(57,57,57,12,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-05 13:30:00','2026-04-05',NULL,'Take once daily.','Active'),(58,58,58,13,11,'50 mg','PO','BID','60 tablets',2,'2026-04-05 14:00:00','2026-04-05',NULL,'Take twice daily.','Active'),(59,59,59,14,29,'1 g','PO','Daily','7 tablets',0,'2026-04-05 14:30:00','2026-04-05','2026-04-12','Finish antibiotic therapy.','Completed'),(60,60,60,15,27,'250 mg','PO','Daily x5 days','5 tablets',0,'2026-04-05 15:00:00','2026-04-05','2026-04-10','Take daily until gone.','Completed'),(61,61,61,1,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-06 09:30:00','2026-04-06','2026-04-13','Take as needed for pain.','Completed'),(62,62,62,2,34,'1 mg','PO','Q8H PRN','10 tablets',0,'2026-04-06 10:00:00','2026-04-06','2026-04-10','Use as needed.','Completed'),(63,63,63,3,18,'2 puffs','Inhalation','Q4H PRN','1 inhaler',1,'2026-04-06 10:30:00','2026-04-06',NULL,'Use as needed.','Active'),(64,64,64,4,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-06 11:00:00','2026-04-06',NULL,'Take daily.','Active'),(65,65,65,5,7,'81 mg','PO','Daily','30 tablets',2,'2026-04-06 11:30:00','2026-04-06',NULL,'Take daily with food.','Active'),(66,66,66,6,29,'1 g','PO','Daily','7 tablets',0,'2026-04-06 12:00:00','2026-04-06','2026-04-13','Complete antibiotic course.','Completed'),(67,67,67,7,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-06 12:30:00','2026-04-06',NULL,'Take daily.','Active'),(68,68,68,8,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-06 13:00:00','2026-04-06','2026-04-13','Take with food.','Completed'),(69,69,69,9,35,'5 mg','PO','BID','60 tablets',1,'2026-04-06 13:30:00','2026-04-06',NULL,'Take twice daily.','Active'),(70,70,70,10,18,'2 puffs','Inhalation','Q4H PRN','1 inhaler',1,'2026-04-06 14:00:00','2026-04-06','2026-04-12','Use as needed for breathing symptoms.','Completed'),(71,71,71,11,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-06 14:30:00','2026-04-06',NULL,'Take daily.','Active'),(72,72,72,12,11,'50 mg','PO','BID','60 tablets',2,'2026-04-06 15:00:00','2026-04-06',NULL,'Take twice daily.','Active'),(73,73,73,13,29,'1 g','PO','Daily','7 tablets',0,'2026-04-07 09:30:00','2026-04-07','2026-04-14','Complete antibiotic therapy.','Completed'),(74,74,74,14,27,'250 mg','PO','Daily x5 days','5 tablets',0,'2026-04-07 10:00:00','2026-04-07','2026-04-12','Take one tablet each day.','Completed'),(75,75,75,15,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-07 10:30:00','2026-04-07','2026-04-14','Take as needed with food.','Completed'),(76,76,76,1,18,'2 puffs','Inhalation','Q4H PRN','1 inhaler',1,'2026-04-07 11:00:00','2026-04-07',NULL,'Use for wheezing/SOB.','Active'),(77,77,77,2,7,'81 mg','PO','Daily','30 tablets',2,'2026-04-07 11:30:00','2026-04-07',NULL,'Take daily.','Active'),(78,78,78,3,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-07 12:00:00','2026-04-07',NULL,'Take once daily.','Active'),(79,79,79,4,11,'50 mg','PO','BID','60 tablets',2,'2026-04-07 12:30:00','2026-04-07',NULL,'Take twice daily.','Active'),(80,80,80,5,29,'1 g','PO','Daily','7 tablets',0,'2026-04-07 13:00:00','2026-04-07','2026-04-14','Finish all tablets.','Completed'),(81,81,81,6,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-07 13:30:00','2026-04-07',NULL,'Take daily.','Active'),(82,82,82,7,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-07 14:00:00','2026-04-07','2026-04-14','Take as needed for pain.','Completed'),(83,83,83,8,35,'5 mg','PO','BID','60 tablets',1,'2026-04-07 14:30:00','2026-04-07',NULL,'Take twice daily.','Active'),(84,84,84,9,18,'2 puffs','Inhalation','Q4H PRN','1 inhaler',1,'2026-04-07 15:00:00','2026-04-07',NULL,'Use as needed.','Active'),(85,85,85,10,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-08 09:30:00','2026-04-08',NULL,'Take daily.','Active'),(86,86,86,11,7,'81 mg','PO','Daily','30 tablets',2,'2026-04-08 10:00:00','2026-04-08',NULL,'Take with food.','Active'),(87,87,87,12,29,'1 g','PO','Daily','7 tablets',0,'2026-04-08 10:30:00','2026-04-08','2026-04-15','Complete antibiotic course.','Completed'),(88,88,88,13,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-08 11:00:00','2026-04-08',NULL,'Take once daily.','Active'),(89,89,89,14,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-08 11:30:00','2026-04-08','2026-04-15','Take with meals.','Completed'),(90,90,90,15,4,'50 mg','PO','PRN migraine','9 tablets',1,'2026-04-08 12:00:00','2026-04-08','2026-04-22','Take at headache onset.','Active'),(91,91,91,1,18,'2 puffs','Inhalation','Q4H PRN','1 inhaler',1,'2026-04-08 12:30:00','2026-04-08',NULL,'Use for respiratory symptoms.','Active'),(92,92,92,2,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-08 13:00:00','2026-04-08',NULL,'Take daily.','Active'),(93,93,93,3,11,'50 mg','PO','BID','60 tablets',2,'2026-04-08 13:30:00','2026-04-08',NULL,'Take twice daily.','Active'),(94,94,94,4,29,'1 g','PO','Daily','7 tablets',0,'2026-04-08 14:00:00','2026-04-08','2026-04-15','Complete entire course.','Completed'),(95,95,95,5,27,'250 mg','PO','Daily x5 days','5 tablets',0,'2026-04-08 14:30:00','2026-04-08','2026-04-13','Take daily until finished.','Completed'),(96,96,96,6,2,'400 mg','PO','Q8H PRN','21 tablets',0,'2026-04-08 15:00:00','2026-04-08','2026-04-15','Take as needed for pain.','Completed'),(97,97,97,7,4,'50 mg','PO','PRN migraine','9 tablets',1,'2026-04-09 09:30:00','2026-04-09','2026-04-23','Take at first sign of migraine.','Active'),(98,98,98,8,18,'2 puffs','Inhalation','Q4H PRN','1 inhaler',1,'2026-04-09 10:00:00','2026-04-09',NULL,'Use as needed.','Active'),(99,99,99,9,42,'10 mg','PO','Daily','30 tablets',1,'2026-04-09 10:30:00','2026-04-09',NULL,'Take daily.','Active'),(100,100,100,10,7,'81 mg','PO','Daily','30 tablets',2,'2026-04-09 11:00:00','2026-04-09',NULL,'Take once daily with food.','Active');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedures`
--

DROP TABLE IF EXISTS `procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedures` (
  `procedure_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `performed_by_provider_id` int DEFAULT NULL COMMENT 'Provider who performed this procedure',
  `cpt_code` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `procedure_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`procedure_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `idx_procedures_provider_id` (`performed_by_provider_id`),
  CONSTRAINT `fk_procedures_provider` FOREIGN KEY (`performed_by_provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `procedures_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedures`
--

LOCK TABLES `procedures` WRITE;
/*!40000 ALTER TABLE `procedures` DISABLE KEYS */;
INSERT INTO `procedures` VALUES (1,1,1,'71045','Chest X-ray single view','2026-04-01 10:30:00'),(2,2,2,'93000','Electrocardiogram','2026-04-01 11:00:00'),(3,3,3,'99223','Initial hospital care','2026-04-01 11:45:00'),(4,4,4,'99213','Established patient outpatient visit','2026-04-01 12:00:00'),(5,5,5,'73562','Knee X-ray','2026-04-01 12:30:00'),(6,6,6,'71250','CT chest','2026-04-01 13:00:00'),(7,7,7,'92928','Coronary stent placement','2026-04-01 13:30:00'),(8,8,8,'43235','Upper GI endoscopy','2026-04-01 14:00:00'),(9,9,9,'80053','Comprehensive metabolic panel','2026-04-01 14:30:00'),(10,10,10,'70450','CT head','2026-04-01 15:00:00'),(11,11,11,'72148','MRI lumbar spine','2026-04-01 15:30:00'),(12,12,12,'83036','Hemoglobin A1C','2026-04-01 16:00:00'),(13,13,13,'95816','EEG','2026-04-02 09:30:00'),(14,14,14,'99212','Follow-up visit','2026-04-02 10:00:00'),(15,15,15,'87804','Influenza test','2026-04-02 10:30:00'),(16,16,1,'80061','Lipid panel','2026-04-02 11:00:00'),(17,17,2,'93010','EKG interpretation','2026-04-02 11:30:00'),(18,18,3,'85025','Complete blood count','2026-04-02 12:00:00'),(19,19,4,'73560','Joint X-ray','2026-04-02 12:30:00'),(20,20,5,'70551','MRI brain','2026-04-02 13:00:00'),(21,21,6,'94010','Pulmonary function test','2026-04-02 13:30:00'),(22,22,7,'74177','CT abdomen and pelvis','2026-04-02 14:00:00'),(23,23,8,'93306','Echocardiogram','2026-04-02 14:30:00'),(24,24,9,'19301','Breast lumpectomy','2026-04-02 15:00:00'),(25,25,10,'99391','Pediatric preventive visit','2026-04-03 09:30:00'),(26,26,11,'73030','Shoulder X-ray','2026-04-03 10:00:00'),(27,27,12,'96116','Neurobehavioral status exam','2026-04-03 10:30:00'),(28,28,13,'70496','CT angiography head','2026-04-03 11:00:00'),(29,29,14,'99281','Emergency department visit, low severity','2026-04-03 11:30:00'),(30,30,15,'71020','Chest X-ray 2 views','2026-04-03 12:00:00'),(31,31,1,'71260','CT chest with contrast','2026-04-03 12:30:00'),(32,32,2,'99392','Pediatric preventive visit established','2026-04-03 13:00:00'),(33,33,3,'73502','Hip X-ray unilateral','2026-04-03 13:30:00'),(34,34,4,'70553','MRI brain with and without contrast','2026-04-03 14:00:00'),(35,35,5,'94060','Bronchodilation responsiveness test','2026-04-03 14:30:00'),(36,36,6,'80048','Basic metabolic panel','2026-04-03 15:00:00'),(37,37,7,'93000','Electrocardiogram','2026-04-04 09:30:00'),(38,38,8,'36415','Collection of venous blood','2026-04-04 10:00:00'),(39,39,9,'90471','Immunization administration','2026-04-04 10:30:00'),(40,40,10,'73564','Knee X-ray complete','2026-04-04 11:00:00'),(41,41,11,'95957','Digital EEG analysis','2026-04-04 11:30:00'),(42,42,12,'94010','Spirometry','2026-04-04 12:00:00'),(43,43,13,'99214','Office visit, established patient','2026-04-04 12:30:00'),(44,44,14,'93005','Electrocardiogram tracing','2026-04-04 13:00:00'),(45,45,15,'77067','Screening mammography bilateral','2026-04-04 13:30:00'),(46,46,1,'87880','Rapid strep test','2026-04-04 14:00:00'),(47,47,2,'72100','Lumbar spine X-ray','2026-04-04 14:30:00'),(48,48,3,'99283','Emergency department visit, moderate severity','2026-04-04 15:00:00'),(49,49,4,'94010','Pulmonary function test','2026-04-05 09:30:00'),(50,50,5,'99213','Established patient outpatient visit','2026-04-05 10:00:00'),(51,51,6,'80053','Comprehensive metabolic panel','2026-04-05 10:30:00'),(52,52,7,'96413','Chemotherapy infusion','2026-04-05 11:00:00'),(53,53,8,'99393','Pediatric preventive visit age 5-11','2026-04-05 11:30:00'),(54,54,9,'20610','Joint injection major joint','2026-04-05 12:00:00'),(55,55,10,'95913','Nerve conduction studies','2026-04-05 12:30:00'),(56,56,11,'94760','Pulse oximetry','2026-04-05 13:00:00'),(57,57,12,'99212','Follow-up visit','2026-04-05 13:30:00'),(58,58,13,'93000','Electrocardiogram','2026-04-05 14:00:00'),(59,59,14,'85025','Complete blood count','2026-04-05 14:30:00'),(60,60,15,'87880','Rapid strep test','2026-04-05 15:00:00'),(61,61,1,'72148','MRI lumbar spine','2026-04-06 09:30:00'),(62,62,2,'70551','MRI brain','2026-04-06 10:00:00'),(63,63,3,'94010','Pulmonary function test','2026-04-06 10:30:00'),(64,64,4,'99213','Established patient outpatient visit','2026-04-06 11:00:00'),(65,65,5,'93306','Echocardiogram','2026-04-06 11:30:00'),(66,66,6,'36415','Collection of venous blood','2026-04-06 12:00:00'),(67,67,7,'99394','Adolescent preventive visit','2026-04-06 12:30:00'),(68,68,8,'73560','Joint X-ray','2026-04-06 13:00:00'),(69,69,9,'95816','EEG','2026-04-06 13:30:00'),(70,70,10,'94760','Pulse oximetry','2026-04-06 14:00:00'),(71,71,11,'99214','Office visit, established patient','2026-04-06 14:30:00'),(72,72,12,'93010','EKG interpretation','2026-04-06 15:00:00'),(73,73,13,'77067','Screening mammography bilateral','2026-04-07 09:30:00'),(74,74,14,'87804','Influenza test','2026-04-07 10:00:00'),(75,75,15,'72100','Lumbar spine X-ray','2026-04-07 10:30:00'),(76,76,1,'71045','Chest X-ray single view','2026-04-07 11:00:00'),(77,77,2,'94010','Pulmonary function test','2026-04-07 11:30:00'),(78,78,3,'99212','Follow-up visit','2026-04-07 12:00:00'),(79,79,4,'93000','Electrocardiogram','2026-04-07 12:30:00'),(80,80,5,'96413','Chemotherapy infusion','2026-04-07 13:00:00'),(81,81,6,'99393','Pediatric preventive visit age 5-11','2026-04-07 13:30:00'),(82,82,7,'20610','Joint injection major joint','2026-04-07 14:00:00'),(83,83,8,'95913','Nerve conduction studies','2026-04-07 14:30:00'),(84,84,9,'94760','Pulse oximetry','2026-04-07 15:00:00'),(85,85,10,'99213','Established patient outpatient visit','2026-04-08 09:30:00'),(86,86,11,'93306','Echocardiogram','2026-04-08 10:00:00'),(87,87,12,'36415','Collection of venous blood','2026-04-08 10:30:00'),(88,88,13,'99394','Adolescent preventive visit','2026-04-08 11:00:00'),(89,89,14,'73562','Knee X-ray','2026-04-08 11:30:00'),(90,90,15,'70551','MRI brain','2026-04-08 12:00:00'),(91,91,1,'94010','Pulmonary function test','2026-04-08 12:30:00'),(92,92,2,'99213','Routine follow-up visit','2026-04-08 13:00:00'),(93,93,3,'93000','Electrocardiogram','2026-04-08 13:30:00'),(94,94,4,'77065','Diagnostic mammography unilateral','2026-04-08 14:00:00'),(95,95,5,'87804','Influenza test','2026-04-08 14:30:00'),(96,96,6,'72148','MRI lumbar spine','2026-04-08 15:00:00'),(97,97,7,'70450','CT head without contrast','2026-04-09 09:30:00'),(98,98,8,'94060','Bronchodilation responsiveness test','2026-04-09 10:00:00'),(99,99,9,'99212','Follow-up visit','2026-04-09 10:30:00'),(100,100,10,'71045','Chest X-ray single view','2026-04-09 11:00:00');
/*!40000 ALTER TABLE `procedures` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `procedure_charge_trigger` AFTER INSERT ON `procedures` FOR EACH ROW BEGIN
    INSERT INTO charges (
        encounter_id,
        charge_type,
        code,
        description,
        amount,
        charge_datetime
    )
    VALUES (
        NEW.encounter_id,
        'Procedure',
        NEW.cpt_code,
        NEW.description,
        200.00,
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `provider_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `specialty` varchar(100) DEFAULT NULL,
  `npi_number` varchar(50) DEFAULT NULL,
  `dea_number` varchar(20) DEFAULT NULL COMMENT 'Required for controlled substances',
  `credentialed_until` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  UNIQUE KEY `npi_number` (`npi_number`),
  CONSTRAINT `providers_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,1,'General Medicine','NPI1001',NULL,NULL,1,NULL),(2,2,'Emergency Medicine','NPI1002',NULL,NULL,1,NULL),(3,3,'Cardiology','NPI1003',NULL,NULL,1,NULL),(4,4,'Oncology','NPI1004',NULL,NULL,1,NULL),(5,5,'Neurology','NPI1005',NULL,NULL,1,NULL),(6,6,'Pediatrics','NPI1006',NULL,NULL,1,NULL),(7,7,'Internal Medicine','NPI1007',NULL,NULL,1,NULL),(8,8,'Orthopedic Surgery','NPI1008',NULL,NULL,1,NULL),(9,9,'General Surgery','NPI1009',NULL,NULL,1,NULL),(10,19,'Family Practice','NPI2001',NULL,NULL,1,NULL),(11,20,'Cardiology','NPI2002',NULL,NULL,1,NULL),(12,21,'Oncology','NPI2003',NULL,NULL,1,NULL),(13,22,'Emergency Medicine','NPI3001',NULL,NULL,1,NULL),(14,23,'Surgery','NPI3002',NULL,NULL,1,NULL),(15,24,'Neurology','NPI3003',NULL,NULL,1,NULL),(16,41,'Pathology','NPI4001',NULL,NULL,1,NULL),(17,45,'Radiology','NPI4002',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referrals` (
  `referral_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `referring_provider_id` int NOT NULL,
  `referred_to_provider_id` int DEFAULT NULL COMMENT 'Internal provider',
  `referred_to_organization` varchar(200) DEFAULT NULL COMMENT 'External org name',
  `referred_to_specialty` varchar(150) DEFAULT NULL,
  `reason` text NOT NULL,
  `referral_date` date NOT NULL,
  `priority` enum('Routine','Urgent','STAT') NOT NULL DEFAULT 'Routine',
  `status` enum('Pending','Accepted','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `completed_date` date DEFAULT NULL,
  `notes` text,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`referral_id`),
  KEY `idx_ref_encounter_id` (`encounter_id`),
  KEY `idx_ref_referring_provider_id` (`referring_provider_id`),
  KEY `idx_ref_referred_to_provider_id` (`referred_to_provider_id`),
  CONSTRAINT `fk_ref_encounter` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ref_referred_to` FOREIGN KEY (`referred_to_provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ref_referring` FOREIGN KEY (`referring_provider_id`) REFERENCES `providers` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `permission_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(2,3),(3,3),(4,3),(29,3),(30,3),(6,4),(7,4),(8,4),(14,4),(15,4),(16,4),(18,4),(19,4),(22,4),(23,4),(25,4),(6,6),(7,6),(14,6),(18,6),(22,6),(6,7),(7,7),(8,7),(14,7),(15,7),(18,7),(22,7),(6,8),(7,8),(14,8),(18,8),(22,8),(26,10),(27,10),(28,10),(30,11),(31,11),(32,11),(33,18),(34,18),(35,18),(36,18),(34,19),(35,19),(37,21),(38,21),(39,21),(40,21),(41,21),(37,23),(38,23),(39,23),(40,23),(42,28),(43,28),(44,28),(29,31),(30,31),(43,31),(6,32),(10,32),(22,32),(44,33),(45,33),(44,34),(45,34),(46,34),(6,35),(10,35),(22,35);
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (33,'Auditor'),(21,'Billing Specialist'),(23,'Claims Processor'),(34,'Compliance Officer'),(31,'Database Administrator'),(27,'Department Manager'),(29,'Health Information Technician'),(28,'Hospital Administrator'),(19,'Housekeeping'),(24,'HR Manager'),(25,'HR Staff'),(22,'Insurance Coordinator'),(3,'IT Support'),(10,'Lab Technician'),(13,'Medical Assistant'),(30,'Medical Coder'),(6,'Nurse'),(7,'Nurse Practitioner'),(32,'Patient'),(17,'Patient Access'),(14,'Patient Care Technician'),(26,'Payroll Specialist'),(12,'Pharmacist'),(15,'Phlebotomist'),(4,'Physician'),(8,'Physician Assistant'),(11,'Radiology Technician'),(16,'Receptionist'),(35,'Research Staff'),(20,'Security'),(2,'Super Admin'),(5,'Surgeon'),(1,'System Admin'),(9,'Therapist'),(18,'Transport Staff');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `department_id` int DEFAULT NULL,
  `room_number` varchar(20) DEFAULT NULL,
  `room_type` enum('Exam','ICU','OR','Inpatient','Support','Office','ER') NOT NULL,
  `status` enum('Available','Occupied','Maintenance') DEFAULT 'Available',
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `room_number` (`room_number`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,'ER-101','Exam','Available'),(2,1,'ER-102','Exam','Occupied'),(3,1,'ER-103','Exam','Available'),(4,1,'ER-104','Exam','Available'),(5,1,'ER-105','Exam','Occupied'),(6,2,'CAR-201','Exam','Available'),(7,2,'CAR-202','ICU','Occupied'),(8,2,'CAR-203','Exam','Available'),(9,2,'CAR-204','ICU','Available'),(10,3,'RAD-301','Exam','Available'),(11,3,'RAD-302','Support','Available'),(12,3,'RAD-303','Exam','Available'),(13,3,'RAD-304','Exam','Available'),(14,4,'LAB-401','Support','Available'),(15,4,'LAB-402','Support','Available'),(16,4,'LAB-403','Support','Available'),(17,5,'ONC-501','Inpatient','Occupied'),(18,5,'ONC-502','Inpatient','Available'),(19,5,'ONC-503','Inpatient','Occupied'),(20,5,'ONC-504','ICU','Available'),(21,6,'PED-601','Exam','Available'),(22,6,'PED-602','Inpatient','Available'),(23,6,'PED-603','Inpatient','Occupied'),(24,7,'ORT-701','Exam','Available'),(25,7,'ORT-702','OR','Occupied'),(26,7,'ORT-703','OR','Available'),(27,8,'NEU-801','Exam','Available'),(28,8,'NEU-802','ICU','Occupied'),(29,8,'NEU-803','Exam','Available'),(30,9,'ICU-901','ICU','Occupied'),(31,9,'ICU-902','ICU','Available'),(32,9,'ICU-903','ICU','Occupied'),(33,9,'ICU-904','ICU','Available'),(34,10,'PHA-1001','Support','Available'),(35,10,'PHA-1002','Support','Available'),(36,11,'BIL-1101','Office','Available'),(37,11,'BIL-1102','Office','Available'),(38,12,'HR-1201','Office','Available'),(39,12,'HR-1202','Office','Available'),(40,13,'ADM-1301','Office','Available'),(41,13,'ADM-1302','Office','Available'),(42,14,'PAT-1401','Office','Available'),(43,14,'PAT-1402','Office','Available');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `shift_id` int NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(100) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,'Day Shift','07:00:00','15:00:00'),(2,'Evening Shift','15:00:00','23:00:00'),(3,'Night Shift','23:00:00','07:00:00'),(4,'12hr Day Shift','07:00:00','19:00:00'),(5,'12hr Night Shift','19:00:00','07:00:00'),(6,'ER Day Shift','06:00:00','14:00:00'),(7,'ER Evening Shift','14:00:00','22:00:00'),(8,'ER Night Shift','22:00:00','06:00:00'),(9,'ICU Day Shift','07:00:00','19:00:00'),(10,'ICU Night Shift','19:00:00','07:00:00'),(11,'Admin Day','08:00:00','16:00:00'),(12,'Billing Shift','09:00:00','17:00:00'),(13,'HR Shift','08:30:00','16:30:00'),(14,'Part-Time Morning','08:00:00','12:00:00'),(15,'Part-Time Evening','16:00:00','20:00:00'),(16,'Weekend Day','08:00:00','20:00:00'),(17,'Weekend Night','20:00:00','08:00:00'),(18,'On-Call','00:00:00','23:59:59'),(19,'Float Shift','10:00:00','18:00:00');
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_schedule`
--

DROP TABLE IF EXISTS `staff_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `department_id` int NOT NULL,
  `shift_id` int NOT NULL,
  `shift_date` date NOT NULL,
  `status` enum('Scheduled','Completed','Swapped','CalledOff','Cancelled','NoShow') NOT NULL DEFAULT 'Scheduled',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`schedule_id`),
  KEY `employee_id` (`employee_id`),
  KEY `department_id` (`department_id`),
  KEY `shift_id` (`shift_id`),
  CONSTRAINT `staff_schedule_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_schedule_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_schedule_ibfk_3` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`shift_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_schedule`
--

LOCK TABLES `staff_schedule` WRITE;
/*!40000 ALTER TABLE `staff_schedule` DISABLE KEYS */;
INSERT INTO `staff_schedule` VALUES (1,6,1,1,'2026-04-01','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(2,7,2,1,'2026-04-01','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(3,8,5,2,'2026-04-01','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(4,9,8,3,'2026-04-01','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(5,10,10,1,'2026-04-01','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(6,11,11,1,'2026-04-01','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(7,12,12,1,'2026-04-01','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(8,13,13,1,'2026-04-01','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(9,14,14,1,'2026-04-01','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(10,6,1,2,'2026-04-02','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(11,7,2,2,'2026-04-02','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(12,8,5,3,'2026-04-02','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(13,9,8,1,'2026-04-02','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(14,10,10,2,'2026-04-02','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(15,11,11,1,'2026-04-02','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(16,12,12,1,'2026-04-02','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(17,13,13,1,'2026-04-02','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(18,14,14,1,'2026-04-02','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(19,6,1,3,'2026-04-03','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(20,7,2,1,'2026-04-03','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(21,8,5,1,'2026-04-03','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(22,9,8,2,'2026-04-03','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(23,10,10,1,'2026-04-03','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(24,11,11,1,'2026-04-03','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(25,12,12,1,'2026-04-03','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(26,13,13,1,'2026-04-03','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(27,14,14,1,'2026-04-03','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(28,6,1,1,'2026-04-04','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(29,7,2,2,'2026-04-04','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(30,8,5,2,'2026-04-04','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(31,9,8,3,'2026-04-04','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(32,10,10,1,'2026-04-04','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(33,11,11,1,'2026-04-04','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(34,12,12,1,'2026-04-04','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(35,13,13,1,'2026-04-04','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(36,14,14,1,'2026-04-04','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(37,6,1,2,'2026-04-05','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(38,7,2,3,'2026-04-05','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(39,8,5,1,'2026-04-05','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(40,9,8,1,'2026-04-05','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(41,10,10,2,'2026-04-05','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(42,11,11,1,'2026-04-05','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(43,12,12,1,'2026-04-05','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(44,13,13,1,'2026-04-05','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(45,14,14,1,'2026-04-05','Completed','2026-04-30 13:51:29','2026-04-30 13:51:29'),(46,6,1,1,'2026-04-06','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(47,7,2,1,'2026-04-06','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(48,8,5,2,'2026-04-06','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(49,9,8,3,'2026-04-06','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(50,10,10,1,'2026-04-06','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(51,11,11,1,'2026-04-06','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(52,12,12,1,'2026-04-06','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(53,13,13,1,'2026-04-06','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(54,14,14,1,'2026-04-06','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(55,6,1,2,'2026-04-07','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(56,7,2,2,'2026-04-07','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(57,8,5,3,'2026-04-07','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(58,9,8,1,'2026-04-07','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(59,10,10,2,'2026-04-07','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(60,11,11,1,'2026-04-07','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(61,12,12,1,'2026-04-07','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(62,13,13,1,'2026-04-07','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(63,14,14,1,'2026-04-07','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(64,6,1,3,'2026-04-08','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(65,7,2,1,'2026-04-08','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(66,8,5,1,'2026-04-08','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(67,9,8,2,'2026-04-08','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(68,10,10,1,'2026-04-08','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(69,11,11,1,'2026-04-08','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(70,12,12,1,'2026-04-08','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(71,13,13,1,'2026-04-08','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(72,14,14,1,'2026-04-08','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(73,6,1,1,'2026-04-09','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(74,7,2,2,'2026-04-09','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(75,8,5,2,'2026-04-09','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(76,9,8,3,'2026-04-09','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(77,10,10,1,'2026-04-09','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(78,11,11,1,'2026-04-09','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(79,12,12,1,'2026-04-09','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(80,13,13,1,'2026-04-09','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(81,14,14,1,'2026-04-09','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(82,6,1,2,'2026-04-10','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(83,7,2,3,'2026-04-10','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(84,8,5,1,'2026-04-10','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(85,9,8,1,'2026-04-10','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(86,10,10,2,'2026-04-10','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(87,11,11,1,'2026-04-10','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(88,12,12,1,'2026-04-10','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(89,13,13,1,'2026-04-10','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29'),(90,14,14,1,'2026-04-10','Scheduled','2026-04-30 13:51:29','2026-04-30 13:51:29');
/*!40000 ALTER TABLE `staff_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheets`
--

DROP TABLE IF EXISTS `timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheets` (
  `timesheet_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `schedule_id` int DEFAULT NULL,
  `work_date` date NOT NULL,
  `clock_in` datetime DEFAULT NULL,
  `clock_out` datetime DEFAULT NULL,
  `regular_minutes` int DEFAULT '0',
  `overtime_minutes` int DEFAULT '0',
  `approval_status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `approved_by_employee_id` int DEFAULT NULL,
  `approved_by_user_id` int DEFAULT NULL COMMENT 'References users (not employees directly)',
  `approved_at` datetime DEFAULT NULL,
  PRIMARY KEY (`timesheet_id`),
  KEY `employee_id` (`employee_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `approved_by_employee_id` (`approved_by_employee_id`),
  KEY `idx_timesheets_approved_by_user` (`approved_by_user_id`),
  CONSTRAINT `fk_timesheets_approver_user` FOREIGN KEY (`approved_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `timesheets_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timesheets_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `staff_schedule` (`schedule_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `timesheets_ibfk_3` FOREIGN KEY (`approved_by_employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheets`
--

LOCK TABLES `timesheets` WRITE;
/*!40000 ALTER TABLE `timesheets` DISABLE KEYS */;
INSERT INTO `timesheets` VALUES (1,6,1,'2026-04-01','2026-04-01 06:55:00','2026-04-01 15:05:00',480,10,'Approved',13,13,'2026-04-01 15:05:00'),(2,7,2,'2026-04-01','2026-04-01 06:58:00','2026-04-01 15:02:00',480,4,'Approved',13,13,'2026-04-01 15:02:00'),(3,8,3,'2026-04-01','2026-04-01 14:55:00','2026-04-01 23:10:00',480,15,'Approved',13,13,'2026-04-01 23:10:00'),(4,9,4,'2026-04-01','2026-04-01 22:50:00','2026-04-02 07:05:00',480,15,'Approved',13,13,'2026-04-02 07:05:00'),(5,10,5,'2026-04-01','2026-04-01 07:00:00','2026-04-01 15:00:00',480,0,'Approved',13,13,'2026-04-01 15:00:00'),(6,6,6,'2026-04-02','2026-04-02 06:57:00','2026-04-02 15:03:00',480,6,'Approved',13,13,'2026-04-02 15:03:00'),(7,7,7,'2026-04-02','2026-04-02 07:02:00','2026-04-02 15:01:00',480,1,'Approved',13,13,'2026-04-02 15:01:00'),(8,8,8,'2026-04-02','2026-04-02 15:00:00','2026-04-02 23:05:00',480,5,'Approved',13,13,'2026-04-02 23:05:00'),(9,9,9,'2026-04-02','2026-04-02 23:00:00','2026-04-03 07:10:00',480,10,'Approved',13,13,'2026-04-03 07:10:00'),(10,10,10,'2026-04-02','2026-04-02 07:01:00','2026-04-02 15:00:00',480,0,'Approved',13,13,'2026-04-02 15:00:00'),(11,6,11,'2026-04-03','2026-04-03 06:59:00','2026-04-03 15:04:00',480,5,'Approved',13,13,'2026-04-03 15:04:00'),(12,7,12,'2026-04-03','2026-04-03 07:00:00','2026-04-03 15:00:00',480,0,'Approved',13,13,'2026-04-03 15:00:00'),(13,8,13,'2026-04-03','2026-04-03 15:02:00','2026-04-03 23:08:00',480,6,'Approved',13,13,'2026-04-03 23:08:00'),(14,9,14,'2026-04-03','2026-04-03 22:55:00','2026-04-04 07:03:00',480,8,'Approved',13,13,'2026-04-04 07:03:00'),(15,10,15,'2026-04-03','2026-04-03 07:00:00','2026-04-03 15:00:00',480,0,'Approved',13,13,'2026-04-03 15:00:00'),(16,6,16,'2026-04-04','2026-04-04 07:01:00','2026-04-04 15:02:00',480,1,'Approved',13,13,'2026-04-04 15:02:00'),(17,7,17,'2026-04-04','2026-04-04 06:59:00','2026-04-04 15:01:00',480,2,'Approved',13,13,'2026-04-04 15:01:00'),(18,8,18,'2026-04-04','2026-04-04 15:00:00','2026-04-04 23:05:00',480,5,'Approved',13,13,'2026-04-04 23:05:00'),(19,9,19,'2026-04-04','2026-04-04 23:02:00','2026-04-05 07:06:00',480,4,'Approved',13,13,'2026-04-05 07:06:00'),(20,10,20,'2026-04-04','2026-04-04 07:00:00','2026-04-04 15:00:00',480,0,'Approved',13,13,'2026-04-04 15:00:00'),(21,6,21,'2026-04-05','2026-04-05 07:00:00','2026-04-05 15:00:00',480,0,'Approved',13,13,'2026-04-05 15:00:00'),(22,7,22,'2026-04-05','2026-04-05 07:03:00','2026-04-05 15:02:00',480,2,'Approved',13,13,'2026-04-05 15:02:00'),(23,8,23,'2026-04-05','2026-04-05 15:01:00','2026-04-05 23:07:00',480,6,'Approved',13,13,'2026-04-05 23:07:00'),(24,9,24,'2026-04-05','2026-04-05 23:00:00','2026-04-06 07:05:00',480,5,'Approved',13,13,'2026-04-06 07:05:00'),(25,10,25,'2026-04-05','2026-04-05 07:00:00','2026-04-05 15:00:00',480,0,'Approved',13,13,'2026-04-05 15:00:00'),(26,11,26,'2026-04-01','2026-04-01 08:00:00','2026-04-01 16:00:00',480,0,'Approved',13,13,'2026-04-01 16:00:00'),(27,12,27,'2026-04-01','2026-04-01 08:10:00','2026-04-01 16:05:00',480,5,'Approved',13,13,'2026-04-01 16:05:00'),(28,13,28,'2026-04-01','2026-04-01 08:00:00','2026-04-01 16:00:00',480,0,'Approved',13,13,'2026-04-01 16:00:00'),(29,14,29,'2026-04-01','2026-04-01 08:05:00','2026-04-01 16:10:00',480,10,'Approved',13,13,'2026-04-01 16:10:00'),(30,15,30,'2026-04-01','2026-04-01 08:00:00','2026-04-01 16:00:00',480,0,'Approved',13,13,'2026-04-01 16:00:00'),(31,11,31,'2026-04-02','2026-04-02 08:00:00','2026-04-02 16:00:00',480,0,'Approved',13,13,'2026-04-02 16:00:00'),(32,12,32,'2026-04-02','2026-04-02 08:03:00','2026-04-02 16:08:00',480,5,'Approved',13,13,'2026-04-02 16:08:00'),(33,13,33,'2026-04-02','2026-04-02 08:00:00','2026-04-02 16:00:00',480,0,'Approved',13,13,'2026-04-02 16:00:00'),(34,14,34,'2026-04-02','2026-04-02 08:06:00','2026-04-02 16:10:00',480,4,'Approved',13,13,'2026-04-02 16:10:00'),(35,15,35,'2026-04-02','2026-04-02 08:00:00','2026-04-02 16:00:00',480,0,'Approved',13,13,'2026-04-02 16:00:00'),(36,16,36,'2026-04-03','2026-04-03 08:05:00','2026-04-03 16:10:00',480,5,'Approved',13,13,'2026-04-03 16:10:00'),(37,17,37,'2026-04-03','2026-04-03 08:00:00','2026-04-03 16:00:00',480,0,'Approved',13,13,'2026-04-03 16:00:00'),(38,18,38,'2026-04-03','2026-04-03 08:07:00','2026-04-03 16:12:00',480,5,'Approved',13,13,'2026-04-03 16:12:00'),(39,19,39,'2026-04-03','2026-04-03 08:00:00','2026-04-03 16:00:00',480,0,'Approved',13,13,'2026-04-03 16:00:00'),(40,20,40,'2026-04-03','2026-04-03 08:03:00','2026-04-03 16:08:00',480,5,'Approved',13,13,'2026-04-03 16:08:00'),(41,16,41,'2026-04-04','2026-04-04 08:05:00','2026-04-04 16:10:00',480,5,'Approved',13,13,'2026-04-04 16:10:00'),(42,17,42,'2026-04-04','2026-04-04 08:00:00','2026-04-04 16:00:00',480,0,'Approved',13,13,'2026-04-04 16:00:00'),(43,18,43,'2026-04-04','2026-04-04 08:07:00','2026-04-04 16:12:00',480,5,'Approved',13,13,'2026-04-04 16:12:00'),(44,19,44,'2026-04-04','2026-04-04 08:00:00','2026-04-04 16:00:00',480,0,'Approved',13,13,'2026-04-04 16:00:00'),(45,20,45,'2026-04-04','2026-04-04 08:03:00','2026-04-04 16:08:00',480,5,'Approved',13,13,'2026-04-04 16:08:00'),(46,16,46,'2026-04-05','2026-04-05 08:05:00','2026-04-05 16:10:00',480,5,'Approved',13,13,'2026-04-05 16:10:00'),(47,17,47,'2026-04-05','2026-04-05 08:00:00','2026-04-05 16:00:00',480,0,'Approved',13,13,'2026-04-05 16:00:00'),(48,18,48,'2026-04-05','2026-04-05 08:07:00','2026-04-05 16:12:00',480,5,'Approved',13,13,'2026-04-05 16:12:00'),(49,19,49,'2026-04-05','2026-04-05 08:00:00','2026-04-05 16:00:00',480,0,'Approved',13,13,'2026-04-05 16:00:00'),(50,20,50,'2026-04-05','2026-04-05 08:03:00','2026-04-05 16:08:00',480,5,'Approved',13,13,'2026-04-05 16:08:00');
/*!40000 ALTER TABLE `timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (4,1),(4,2),(4,3),(4,4),(4,5),(6,6),(6,7),(6,8),(6,9),(11,10),(18,11),(23,12),(28,13),(15,14),(13,15),(14,16),(7,17),(8,18),(9,19),(10,20),(17,21),(18,22),(19,23),(20,24),(21,25),(26,26),(27,27),(29,28),(30,29),(31,30),(1,31),(2,32),(3,33),(32,34),(32,35),(33,36),(34,37),(35,38),(6,39),(4,40);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sessions` (
  `session_id` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `expires_at` datetime NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `device_info` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`session_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sessions`
--

LOCK TABLES `user_sessions` WRITE;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
INSERT INTO `user_sessions` VALUES ('sess-user-001',1,'2026-04-30 13:51:29','2026-04-22 18:30:00','10.0.0.10','Chrome on Windows',1),('sess-user-002',2,'2026-04-30 13:51:29','2026-04-22 19:00:00','10.0.0.11','Edge on Windows',1),('sess-user-003',3,'2026-04-30 13:51:29','2026-04-22 20:15:00','10.0.0.12','Firefox on Linux',1),('sess-user-004',4,'2026-04-30 13:51:29','2026-04-22 21:00:00','10.0.0.13','Safari on Mac',1),('sess-user-005',5,'2026-04-30 13:51:29','2026-04-22 22:45:00','10.0.0.14','Chrome on Android',0),('sess-user-006',6,'2026-04-30 13:51:29','2026-04-23 09:30:00','10.0.0.15','Chrome on Windows',1),('sess-user-007',7,'2026-04-30 13:51:29','2026-04-23 10:15:00','10.0.0.16','Edge on Windows',1),('sess-user-008',8,'2026-04-30 13:51:29','2026-04-23 11:00:00','10.0.0.17','Firefox on Linux',1),('sess-user-009',9,'2026-04-30 13:51:29','2026-04-23 12:30:00','10.0.0.18','Safari on Mac',0),('sess-user-010',10,'2026-04-30 13:51:29','2026-04-23 13:00:00','10.0.0.19','Chrome on iPhone',1),('sess-user-011',11,'2026-04-30 13:51:29','2026-04-23 14:45:00','10.0.0.20','Chrome on Windows',1),('sess-user-012',12,'2026-04-30 13:51:29','2026-04-23 15:30:00','10.0.0.21','Edge on Windows',1),('sess-user-013',13,'2026-04-30 13:51:29','2026-04-23 16:15:00','10.0.0.22','Firefox on Linux',1),('sess-user-014',14,'2026-04-30 13:51:29','2026-04-23 17:00:00','10.0.0.23','Safari on Mac',0),('sess-user-015',15,'2026-04-30 13:51:29','2026-04-23 18:30:00','10.0.0.24','Chrome on Android',1),('sess-user-016',16,'2026-04-30 13:51:29','2026-04-24 09:00:00','10.0.0.25','Chrome on Windows',1),('sess-user-017',17,'2026-04-30 13:51:29','2026-04-24 10:00:00','10.0.0.26','Edge on Windows',1),('sess-user-018',18,'2026-04-30 13:51:29','2026-04-24 11:30:00','10.0.0.27','Firefox on Linux',1),('sess-user-019',19,'2026-04-30 13:51:29','2026-04-24 12:45:00','10.0.0.28','Safari on Mac',0),('sess-user-020',20,'2026-04-30 13:51:29','2026-04-24 13:15:00','10.0.0.29','Chrome on iPhone',1),('sess-user-021',21,'2026-04-30 13:51:29','2026-04-24 14:00:00','10.0.0.30','Chrome on Windows',1),('sess-user-022',22,'2026-04-30 13:51:29','2026-04-24 15:30:00','10.0.0.31','Edge on Windows',1),('sess-user-023',23,'2026-04-30 13:51:29','2026-04-24 16:45:00','10.0.0.32','Firefox on Linux',1),('sess-user-024',24,'2026-04-30 13:51:29','2026-04-24 17:30:00','10.0.0.33','Safari on Mac',0),('sess-user-025',25,'2026-04-30 13:51:29','2026-04-24 18:00:00','10.0.0.34','Chrome on Android',1),('sess-user-026',26,'2026-04-30 13:51:29','2026-04-25 09:15:00','10.0.0.35','Chrome on Windows',1),('sess-user-027',27,'2026-04-30 13:51:29','2026-04-25 10:45:00','10.0.0.36','Edge on Windows',1),('sess-user-028',28,'2026-04-30 13:51:29','2026-04-25 11:30:00','10.0.0.37','Firefox on Linux',1),('sess-user-029',29,'2026-04-30 13:51:29','2026-04-25 12:15:00','10.0.0.38','Safari on Mac',0),('sess-user-030',30,'2026-04-30 13:51:29','2026-04-25 13:00:00','10.0.0.39','Chrome on iPhone',1),('sess-user-031',31,'2026-04-30 13:51:29','2026-04-25 14:30:00','10.0.0.40','Chrome on Windows',1),('sess-user-032',32,'2026-04-30 13:51:29','2026-04-25 15:45:00','10.0.0.41','Edge on Windows',1),('sess-user-033',33,'2026-04-30 13:51:29','2026-04-25 16:30:00','10.0.0.42','Firefox on Linux',1),('sess-user-034',34,'2026-04-30 13:51:29','2026-04-25 17:15:00','10.0.0.43','Safari on Mac',0),('sess-user-035',35,'2026-04-30 13:51:29','2026-04-25 18:00:00','10.0.0.44','Chrome on Android',1),('sess-user-036',36,'2026-04-30 13:51:29','2026-04-26 09:00:00','10.0.0.45','Chrome on Windows',1),('sess-user-037',37,'2026-04-30 13:51:29','2026-04-26 10:30:00','10.0.0.46','Edge on Windows',1),('sess-user-038',38,'2026-04-30 13:51:29','2026-04-26 11:45:00','10.0.0.47','Firefox on Linux',1),('sess-user-039',39,'2026-04-30 13:51:29','2026-04-26 12:30:00','10.0.0.48','Safari on Mac',0),('sess-user-040',40,'2026-04-30 13:51:29','2026-04-26 13:15:00','10.0.0.49','Chrome on iPhone',1);
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL COMMENT 'Set for patient portal logins; NULL for staff',
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `account_status` enum('Active','Locked','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `employee_id` (`employee_id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_users_patient_id` (`patient_id`),
  CONSTRAINT `fk_users_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,NULL,'jwilson','$2y$10$hash1','Active','2026-04-30 13:51:29','jwilson@hospital.org'),(2,2,NULL,'smartinez','$2y$10$hash2','Active','2026-04-30 13:51:29','smartinez@hospital.org'),(3,3,NULL,'mbrown','$2y$10$hash3','Active','2026-04-30 13:51:29','mbrown@hospital.org'),(4,4,NULL,'ejohnson','$2y$10$hash4','Active','2026-04-30 13:51:29','ejohnson@hospital.org'),(5,5,NULL,'odavis','$2y$10$hash5','Active','2026-04-30 13:51:29','odavis@hospital.org'),(6,6,NULL,'lgarcia','$2y$10$hash6','Active','2026-04-30 13:51:29','lgarcia@hospital.org'),(7,7,NULL,'nmiller','$2y$10$hash7','Active','2026-04-30 13:51:29','nmiller@hospital.org'),(8,8,NULL,'arodriguez','$2y$10$hash8','Active','2026-04-30 13:51:29','arodriguez@hospital.org'),(9,9,NULL,'elopez','$2y$10$hash9','Active','2026-04-30 13:51:29','elopez@hospital.org'),(10,10,NULL,'gmitchell','$2y$10$hash10','Active','2026-04-30 13:51:29','gmitchell@hospital.org'),(11,11,NULL,'nparker','$2y$10$hash11','Active','2026-04-30 13:51:29','nparker@hospital.org'),(12,12,NULL,'vcoleman','$2y$10$hash12','Active','2026-04-30 13:51:29','vcoleman@hospital.org'),(13,13,NULL,'mbryant','$2y$10$hash13','Active','2026-04-30 13:51:29','mbryant@hospital.org'),(14,14,NULL,'bmorris','$2y$10$hash14','Active','2026-04-30 13:51:29','bmorris@hospital.org'),(15,15,NULL,'jthomas','$2y$10$hash15','Active','2026-04-30 13:51:29','jthomas@hospital.org'),(16,16,NULL,'rwhite','$2y$10$hash16','Active','2026-04-30 13:51:29','rwhite@hospital.org'),(17,17,NULL,'kjackson','$2y$10$hash17','Active','2026-04-30 13:51:29','kjackson@hospital.org'),(18,18,NULL,'lmartin','$2y$10$hash18','Active','2026-04-30 13:51:29','lmartin@hospital.org'),(19,19,NULL,'pclark','$2y$10$hash19','Active','2026-04-30 13:51:29','pclark@hospital.org'),(20,20,NULL,'hlee','$2y$10$hash20','Active','2026-04-30 13:51:29','hlee@hospital.org'),(21,21,NULL,'awalker','$2y$10$hash21','Active','2026-04-30 13:51:29','awalker@hospital.org'),(22,22,NULL,'dallen','$2y$10$hash22','Active','2026-04-30 13:51:29','dallen@hospital.org'),(23,23,NULL,'syoung','$2y$10$hash23','Active','2026-04-30 13:51:29','syoung@hospital.org'),(24,24,NULL,'king','$2y$10$hash24','Active','2026-04-30 13:51:29','king@hospital.org'),(25,25,NULL,'wright','$2y$10$hash25','Active','2026-04-30 13:51:29','wright@hospital.org'),(26,26,NULL,'scott','$2y$10$hash26','Active','2026-04-30 13:51:29','scott@hospital.org'),(27,27,NULL,'green','$2y$10$hash27','Active','2026-04-30 13:51:29','green@hospital.org'),(28,28,NULL,'baker','$2y$10$hash28','Active','2026-04-30 13:51:29','baker@hospital.org'),(29,29,NULL,'adams','$2y$10$hash29','Locked','2026-04-30 13:51:29','adams@hospital.org'),(30,30,NULL,'nelson','$2y$10$hash30','Active','2026-04-30 13:51:29','nelson@hospital.org'),(31,31,NULL,'carter','$2y$10$hash31','Active','2026-04-30 13:51:29','carter@hospital.org'),(32,32,NULL,'mitchell2','$2y$10$hash32','Active','2026-04-30 13:51:29','mitchell2@hospital.org'),(33,33,NULL,'roberts','$2y$10$hash33','Active','2026-04-30 13:51:29','roberts@hospital.org'),(34,34,NULL,'turner','$2y$10$hash34','Active','2026-04-30 13:51:29','turner@hospital.org'),(35,35,NULL,'phillips','$2y$10$hash35','Active','2026-04-30 13:51:29','phillips@hospital.org'),(36,36,NULL,'campbell','$2y$10$hash36','Active','2026-04-30 13:51:29','campbell@hospital.org'),(37,37,NULL,'parker2','$2y$10$hash37','Active','2026-04-30 13:51:29','parker2@hospital.org'),(38,38,NULL,'evans','$2y$10$hash38','Active','2026-04-30 13:51:29','evans@hospital.org'),(39,39,NULL,'edwards','$2y$10$hash39','Active','2026-04-30 13:51:29','edwards@hospital.org'),(40,40,NULL,'collins','$2y$10$hash40','Active','2026-04-30 13:51:29','collins@hospital.org');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_account_audit_trigger` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO audit_logs (
        event_time,
        actor_user_id,
        action_type,
        entity_name,
        entity_pk,
        changed_columns,
        old_values_json,
        new_values_json,
        status
    )
    VALUES (
        NOW(),
        NULL,
        'INSERT',
        'users',
        NEW.user_id,
        'username,account_status,email',
        NULL,
        JSON_OBJECT(
            'username', NEW.username,
            'account_status', NEW.account_status,
            'email', NEW.email
        ),
        'SUCCESS'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vital_signs`
--

DROP TABLE IF EXISTS `vital_signs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vital_signs` (
  `vital_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int DEFAULT NULL COMMENT 'NULL allowed for check-in triage vitals',
  `checkin_id` int DEFAULT NULL,
  `recorded_by_employee_id` int DEFAULT NULL,
  `temperature` decimal(4,1) DEFAULT NULL,
  `heart_rate` int DEFAULT NULL,
  `respiratory_rate` int DEFAULT NULL,
  `systolic_bp` int DEFAULT NULL,
  `diastolic_bp` int DEFAULT NULL,
  `oxygen_saturation` decimal(5,2) DEFAULT NULL,
  `weight_kg` decimal(6,2) DEFAULT NULL,
  `height_cm` decimal(6,2) DEFAULT NULL,
  `bmi` decimal(5,2) DEFAULT NULL,
  `recorded_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`vital_id`),
  KEY `checkin_id` (`checkin_id`),
  KEY `recorded_by_employee_id` (`recorded_by_employee_id`),
  KEY `idx_vital_signs_encounter` (`encounter_id`),
  CONSTRAINT `vital_signs_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounters` (`encounter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vital_signs_ibfk_2` FOREIGN KEY (`checkin_id`) REFERENCES `check_ins` (`checkin_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `vital_signs_ibfk_3` FOREIGN KEY (`recorded_by_employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vital_signs`
--

LOCK TABLES `vital_signs` WRITE;
/*!40000 ALTER TABLE `vital_signs` DISABLE KEYS */;
INSERT INTO `vital_signs` VALUES (1,1,1,6,38.2,102,22,128,82,97.00,78.00,178.00,24.60,'2026-04-01 09:05:00'),(2,2,2,7,36.8,84,18,132,86,99.00,71.00,170.00,24.60,'2026-04-01 09:35:00'),(3,3,3,8,37.9,96,20,118,74,98.00,69.00,175.00,22.50,'2026-04-01 10:05:00'),(4,4,4,9,37.1,88,17,124,80,99.00,63.00,165.00,23.10,'2026-04-01 10:35:00'),(5,5,5,6,36.7,76,16,120,78,99.00,82.00,180.00,25.30,'2026-04-01 11:05:00'),(6,6,6,7,38.5,110,24,140,90,95.00,90.00,182.00,27.20,'2026-04-01 11:35:00'),(7,7,7,8,39.0,120,26,150,95,93.00,88.00,175.00,28.70,'2026-04-01 12:05:00'),(8,8,8,9,37.3,85,18,122,80,98.00,70.00,168.00,24.80,'2026-04-01 12:35:00'),(9,9,9,6,36.5,72,16,118,76,99.00,75.00,172.00,25.30,'2026-04-01 13:05:00'),(10,10,10,7,37.8,92,20,126,82,98.00,80.00,176.00,25.80,'2026-04-01 13:35:00'),(11,11,11,8,36.9,80,17,130,85,99.00,68.00,167.00,24.40,'2026-04-01 14:05:00'),(12,12,12,9,37.4,86,18,128,84,98.00,72.00,169.00,25.20,'2026-04-01 14:35:00'),(13,13,13,6,38.6,108,24,142,92,94.00,85.00,180.00,26.20,'2026-04-02 08:05:00'),(14,14,14,7,36.7,78,16,122,80,99.00,65.00,160.00,25.40,'2026-04-02 08:35:00'),(15,15,15,8,37.5,90,19,130,84,98.00,74.00,175.00,24.10,'2026-04-02 09:05:00'),(16,16,16,9,36.6,75,16,120,78,99.00,69.00,168.00,24.50,'2026-04-02 09:35:00'),(17,17,17,6,37.9,95,20,135,88,97.00,77.00,172.00,26.00,'2026-04-02 10:05:00'),(18,18,18,7,38.8,112,25,145,94,94.00,82.00,178.00,25.90,'2026-04-02 10:35:00'),(19,19,19,8,37.2,88,18,126,82,98.00,79.00,176.00,25.50,'2026-04-02 11:05:00'),(20,20,20,9,36.8,82,17,124,80,99.00,73.00,170.00,25.30,'2026-04-02 11:35:00'),(21,21,21,6,39.2,125,28,155,98,92.00,91.00,182.00,27.50,'2026-04-02 12:05:00'),(22,22,22,7,37.6,89,18,128,84,98.00,70.00,168.00,24.80,'2026-04-02 12:35:00'),(23,23,23,8,36.7,76,16,122,80,99.00,66.00,165.00,24.20,'2026-04-02 13:05:00'),(24,24,24,9,38.3,104,22,138,90,96.00,83.00,178.00,26.20,'2026-04-02 13:35:00'),(25,25,25,6,36.5,72,15,118,76,99.00,60.00,160.00,23.40,'2026-04-03 08:05:00'),(26,26,26,7,37.1,82,17,124,80,99.00,85.00,182.00,25.70,'2026-04-03 08:35:00'),(27,27,27,8,38.0,98,20,130,86,97.00,78.00,175.00,25.50,'2026-04-03 09:05:00'),(28,28,28,9,39.1,118,26,150,96,93.00,88.00,180.00,27.20,'2026-04-03 09:35:00'),(29,29,29,6,36.6,74,16,120,78,99.00,72.00,170.00,24.90,'2026-04-03 10:05:00'),(30,30,30,7,37.7,92,19,128,84,98.00,75.00,172.00,25.30,'2026-04-03 10:35:00'),(31,31,31,8,36.9,80,17,130,85,99.00,68.00,167.00,24.40,'2026-04-03 11:05:00'),(32,32,32,9,37.4,86,18,128,84,98.00,72.00,169.00,25.20,'2026-04-03 11:35:00'),(33,33,33,6,38.2,102,22,128,82,97.00,78.00,178.00,24.60,'2026-04-03 13:05:00'),(34,34,34,7,36.8,84,18,132,86,99.00,71.00,170.00,24.60,'2026-04-03 13:35:00'),(35,35,35,8,37.9,96,20,118,74,98.00,69.00,175.00,22.50,'2026-04-03 14:05:00'),(36,36,36,9,37.1,88,17,124,80,99.00,63.00,165.00,23.10,'2026-04-03 14:35:00'),(37,37,37,6,36.7,76,16,120,78,99.00,82.00,180.00,25.30,'2026-04-04 08:05:00'),(38,38,38,7,38.5,110,24,140,90,95.00,90.00,182.00,27.20,'2026-04-04 08:35:00'),(39,39,39,8,39.0,120,26,150,95,93.00,88.00,175.00,28.70,'2026-04-04 09:05:00'),(40,40,40,9,37.3,85,18,122,80,98.00,70.00,168.00,24.80,'2026-04-04 09:35:00'),(41,41,41,6,36.5,72,16,118,76,99.00,75.00,172.00,25.30,'2026-04-04 10:05:00'),(42,42,42,7,37.8,92,20,126,82,98.00,80.00,176.00,25.80,'2026-04-04 10:35:00'),(43,43,43,8,36.9,80,17,130,85,99.00,68.00,167.00,24.40,'2026-04-04 11:05:00'),(44,44,44,9,37.4,86,18,128,84,98.00,72.00,169.00,25.20,'2026-04-04 11:35:00'),(45,45,45,6,38.6,108,24,142,92,94.00,85.00,180.00,26.20,'2026-04-04 13:05:00'),(46,46,46,7,36.7,78,16,122,80,99.00,65.00,160.00,25.40,'2026-04-04 13:35:00'),(47,47,47,8,37.5,90,19,130,84,98.00,74.00,175.00,24.10,'2026-04-04 14:05:00'),(48,48,48,9,36.6,75,16,120,78,99.00,69.00,168.00,24.50,'2026-04-04 14:35:00'),(49,49,49,6,37.9,95,20,135,88,97.00,77.00,172.00,26.00,'2026-04-05 08:05:00'),(50,50,50,7,38.8,112,25,145,94,94.00,82.00,178.00,25.90,'2026-04-05 08:35:00'),(51,51,51,6,36.8,82,17,124,80,99.00,70.00,168.00,24.80,'2026-04-05 09:05:00'),(52,52,52,7,37.2,88,18,126,82,98.00,74.00,170.00,25.60,'2026-04-05 09:35:00'),(53,53,53,8,38.1,98,21,132,86,97.00,79.00,176.00,25.50,'2026-04-05 10:05:00'),(54,54,54,9,36.9,80,17,120,78,99.00,68.00,167.00,24.40,'2026-04-05 10:35:00'),(55,55,55,6,39.0,118,26,148,94,94.00,88.00,178.00,27.80,'2026-04-05 11:05:00'),(56,56,56,7,38.7,110,24,140,90,95.00,85.00,175.00,27.80,'2026-04-05 11:35:00'),(57,57,57,8,36.6,74,16,118,76,99.00,72.00,170.00,24.90,'2026-04-05 13:05:00'),(58,58,58,9,37.5,92,19,130,84,98.00,76.00,172.00,25.70,'2026-04-05 13:35:00'),(59,59,59,6,38.3,104,22,136,88,96.00,82.00,178.00,25.90,'2026-04-05 14:05:00'),(60,60,60,7,36.7,78,16,122,80,99.00,69.00,168.00,24.50,'2026-04-05 14:35:00'),(61,61,61,6,37.0,82,18,124,82,99.00,74.00,172.00,25.00,'2026-04-06 08:05:00'),(62,62,62,7,37.8,94,20,130,86,98.00,80.00,176.00,25.80,'2026-04-06 08:35:00'),(63,63,63,8,39.1,120,26,150,96,93.00,88.00,180.00,27.20,'2026-04-06 09:05:00'),(64,64,64,9,36.6,75,16,118,76,99.00,65.00,165.00,23.90,'2026-04-06 09:35:00'),(65,65,65,6,37.4,88,18,126,82,98.00,78.00,175.00,25.50,'2026-04-06 10:05:00'),(66,66,66,7,38.5,108,24,140,90,95.00,85.00,180.00,26.20,'2026-04-06 10:35:00'),(67,67,67,8,36.7,76,16,120,78,99.00,70.00,170.00,24.20,'2026-04-06 11:05:00'),(68,68,68,9,37.2,84,18,124,80,99.00,73.00,172.00,24.70,'2026-04-06 11:35:00'),(69,69,69,6,38.8,112,25,145,94,94.00,82.00,178.00,25.90,'2026-04-06 13:05:00'),(70,70,70,7,39.2,125,28,155,98,92.00,90.00,182.00,27.20,'2026-04-06 13:35:00'),(71,71,71,6,36.9,80,17,122,80,99.00,68.00,167.00,24.40,'2026-04-06 14:05:00'),(72,72,72,7,37.5,90,19,128,84,98.00,75.00,172.00,25.30,'2026-04-06 14:35:00'),(73,73,73,8,38.3,104,22,136,88,96.00,82.00,178.00,25.90,'2026-04-07 08:05:00'),(74,74,74,9,36.6,74,16,118,76,99.00,70.00,168.00,24.80,'2026-04-07 08:35:00'),(75,75,75,6,37.1,82,18,124,80,99.00,78.00,175.00,25.50,'2026-04-07 09:05:00'),(76,76,76,7,38.5,110,24,140,90,95.00,85.00,180.00,26.20,'2026-04-07 09:35:00'),(77,77,77,8,39.0,120,26,150,95,93.00,88.00,175.00,28.70,'2026-04-07 10:05:00'),(78,78,78,9,36.8,82,17,122,80,99.00,72.00,170.00,24.90,'2026-04-07 10:35:00'),(79,79,79,6,37.7,92,19,128,84,98.00,75.00,172.00,25.30,'2026-04-07 11:05:00'),(80,80,80,7,38.2,102,22,130,86,97.00,80.00,176.00,25.80,'2026-04-07 11:35:00'),(81,81,81,6,36.7,76,16,120,78,99.00,70.00,168.00,24.80,'2026-04-07 13:05:00'),(82,82,82,7,37.3,88,18,126,82,98.00,74.00,170.00,25.60,'2026-04-07 13:35:00'),(83,83,83,8,38.0,98,20,130,86,97.00,78.00,175.00,25.50,'2026-04-07 14:05:00'),(84,84,84,9,39.1,118,26,150,96,93.00,88.00,180.00,27.20,'2026-04-07 14:35:00'),(85,85,85,6,36.5,72,15,118,76,99.00,68.00,167.00,24.40,'2026-04-08 08:05:00'),(86,86,86,7,37.8,95,20,130,86,97.00,75.00,172.00,25.30,'2026-04-08 08:35:00'),(87,87,87,8,38.5,105,22,140,90,95.00,82.00,178.00,25.90,'2026-04-08 09:05:00'),(88,88,88,9,36.6,74,16,118,76,99.00,70.00,168.00,24.80,'2026-04-08 09:35:00'),(89,89,89,6,37.2,84,18,124,80,99.00,76.00,172.00,25.70,'2026-04-08 10:05:00'),(90,90,90,7,38.0,98,20,132,86,97.00,80.00,176.00,25.80,'2026-04-08 10:35:00'),(91,91,91,6,39.0,120,26,150,95,93.00,88.00,175.00,28.70,'2026-04-08 11:05:00'),(92,92,92,7,36.7,78,16,122,80,99.00,65.00,160.00,25.40,'2026-04-08 11:35:00'),(93,93,93,8,37.8,95,20,130,86,97.00,74.00,172.00,25.00,'2026-04-08 13:05:00'),(94,94,94,9,38.5,105,22,140,90,95.00,85.00,180.00,26.20,'2026-04-08 13:35:00'),(95,95,95,6,36.6,74,16,120,78,99.00,60.00,160.00,23.40,'2026-04-08 14:05:00'),(96,96,96,7,37.4,88,18,126,82,98.00,78.00,176.00,25.20,'2026-04-08 14:35:00'),(97,97,97,8,36.9,80,17,130,85,99.00,68.00,167.00,24.40,'2026-04-09 08:05:00'),(98,98,98,9,38.8,112,24,145,94,94.00,82.00,178.00,25.90,'2026-04-09 08:35:00'),(99,99,99,6,36.5,72,15,118,76,99.00,75.00,172.00,25.30,'2026-04-09 09:05:00'),(100,100,100,7,37.6,90,18,128,84,98.00,80.00,176.00,25.80,'2026-04-09 09:35:00');
/*!40000 ALTER TABLE `vital_signs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_subscription`
--

DROP TABLE IF EXISTS `webhook_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_subscription` (
  `webhook_id` int NOT NULL AUTO_INCREMENT,
  `api_key_id` int NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `target_url` varchar(500) NOT NULL,
  `secret_hash` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_triggered_at` datetime DEFAULT NULL,
  `last_status_code` int DEFAULT NULL,
  `failure_count` int NOT NULL DEFAULT '0',
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`webhook_id`),
  KEY `api_key_id` (`api_key_id`),
  CONSTRAINT `webhook_subscription_ibfk_1` FOREIGN KEY (`api_key_id`) REFERENCES `api_keys` (`api_key_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_subscription`
--

LOCK TABLES `webhook_subscription` WRITE;
/*!40000 ALTER TABLE `webhook_subscription` DISABLE KEYS */;
INSERT INTO `webhook_subscription` VALUES (1,1,'claim.updated','https://example.org/webhook/claims','secret-hash-001',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(2,2,'appointment.created','https://mobile.app/webhook/appointments','secret-hash-002',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(3,3,'payment.completed','https://billing.system/webhook/payments','secret-hash-003',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(4,4,'lab.result_ready','https://lab.system/webhook/results','secret-hash-004',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(5,5,'medication.prescribed','https://pharmacy.system/webhook/meds','secret-hash-005',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(6,6,'claim.submitted','https://insurance.gateway/webhook/claims','secret-hash-006',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(7,7,'employee.created','https://hr.portal/webhook/employees','secret-hash-007',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(8,8,'payroll.processed','https://payroll.system/webhook/payroll','secret-hash-008',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(9,9,'report.generated','https://dashboard/webhook/reports','secret-hash-009',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(10,10,'user.login','https://admin.console/webhook/logins','secret-hash-010',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(11,11,'audit.log_created','https://audit.system/webhook/logs','secret-hash-011',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(12,12,'compliance.alert','https://compliance/webhook/alerts','secret-hash-012',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(13,13,'research.data_accessed','https://research/webhook/data','secret-hash-013',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(14,14,'transport.assigned','https://transport/webhook/tasks','secret-hash-014',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(15,15,'facility.issue_reported','https://facility/webhook/issues','secret-hash-015',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(16,16,'claim.updated','https://legacy.system/webhook/claims','secret-hash-016',0,'2026-04-30 13:51:29',NULL,NULL,0,0),(17,17,'appointment.cancelled','https://old.mobile/webhook/appts','secret-hash-017',0,'2026-04-30 13:51:29',NULL,NULL,0,0),(18,18,'test.event','https://sandbox/webhook/test','secret-hash-018',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(19,19,'analytics.updated','https://analytics/webhook/events','secret-hash-019',1,'2026-04-30 13:51:29',NULL,NULL,0,0),(20,20,'backup.completed','https://backup/webhook/status','secret-hash-020',1,'2026-04-30 13:51:29',NULL,NULL,0,0);
/*!40000 ALTER TABLE `webhook_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hospital_information_system'
--

--
-- Dumping routines for database 'hospital_information_system'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_claim_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_claim_balance`(p_claim_id INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE balance DECIMAL(10,2);

    SELECT c.total_amount - IFNULL(SUM(pay.amount), 0.00)
    INTO balance
    FROM claims c
    LEFT JOIN payments pay ON c.claim_id = pay.claim_id
    WHERE c.claim_id = p_claim_id
    GROUP BY c.claim_id, c.total_amount;

    RETURN IFNULL(balance, 0.00);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_employee_full_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_employee_full_name`(p_employee_id INT) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE full_name VARCHAR(255);

    SELECT CONCAT(first_name, ' ', last_name)
    INTO full_name
    FROM employees
    WHERE employee_id = p_employee_id
    LIMIT 1;

    RETURN full_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_open_encounter_count_by_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_open_encounter_count_by_patient`(p_patient_id INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE encounter_count INT;

    SELECT COUNT(*)
    INTO encounter_count
    FROM encounters
    WHERE patient_id = p_patient_id
      AND status = 'Open';

    RETURN encounter_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_patient_age` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_patient_age`(p_dob DATE) RETURNS int
    DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, p_dob, CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_patient_full_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_patient_full_name`(p_patient_id INT) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE full_name VARCHAR(255);

    SELECT CONCAT(first_name, ' ', last_name)
    INTO full_name
    FROM patients
    WHERE patient_id = p_patient_id
    LIMIT 1;

    RETURN full_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_encounter_charges` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_encounter_charges`(p_encounter_id INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE total_charges DECIMAL(10,2);

    SELECT IFNULL(SUM(amount), 0.00)
    INTO total_charges
    FROM charges
    WHERE encounter_id = p_encounter_id;

    RETURN total_charges;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_patient_payments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_patient_payments`(p_patient_id INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE total_paid DECIMAL(10,2);

    SELECT IFNULL(SUM(amount), 0.00)
    INTO total_paid
    FROM payments
    WHERE patient_id = p_patient_id;

    RETURN total_paid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `claim_summary_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `claim_summary_report`(IN p_patient_id INT)
BEGIN
    SELECT 
        p.patient_id,
        p.first_name,
        p.last_name,
        c.claim_id,
        c.claim_status,
        c.total_amount,
        c.submitted_datetime,
        pay.payment_id,
        pay.payment_method,
        pay.amount AS payment_amount,
        pay.payment_datetime
    FROM patients p
    JOIN encounters e ON p.patient_id = e.patient_id
    JOIN claims c ON e.encounter_id = c.encounter_id
    LEFT JOIN payments pay ON c.claim_id = pay.claim_id
    WHERE p.patient_id = p_patient_id
    ORDER BY c.submitted_datetime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `patient_appointment_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `patient_appointment_history`(IN p_patient_id INT)
BEGIN
    SELECT 
        a.appointment_id,
        a.appt_datetime,
        a.status,
        d.department_name,
        pr.specialty
    FROM appointments a
    LEFT JOIN departments d ON a.department_id = d.department_id
    LEFT JOIN providers pr ON a.provider_id = pr.provider_id
    WHERE a.patient_id = p_patient_id
    ORDER BY a.appt_datetime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `patient_clinical_notes_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `patient_clinical_notes_history`(IN p_patient_id INT)
BEGIN
    SELECT 
        p.patient_id,
        p.first_name,
        p.last_name,
        e.encounter_id,
        cn.note_id,
        nt.note_type_name,
        cn.note_title,
        cn.note_status,
        cn.created_at,
        cn.signed_at
    FROM patients p
    JOIN encounters e ON p.patient_id = e.patient_id
    JOIN clinical_notes cn ON e.encounter_id = cn.encounter_id
    JOIN note_types nt ON cn.note_type_id = nt.note_type_id
    WHERE p.patient_id = p_patient_id
    ORDER BY cn.created_at;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `patient_lab_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `patient_lab_history`(IN p_patient_id INT)
BEGIN
    SELECT 
        p.patient_id,
        p.first_name,
        p.last_name,
        e.encounter_id,
        lo.lab_order_id,
        lt.test_name,
        lr.result_value,
        lt.unit,
        lr.flag,
        lr.result_datetime
    FROM patients p
    JOIN encounters e ON p.patient_id = e.patient_id
    JOIN lab_orders lo ON e.encounter_id = lo.encounter_id
    JOIN lab_results lr ON lo.lab_order_id = lr.lab_order_id
    JOIN lab_tests lt ON lr.lab_test_id = lt.lab_test_id
    WHERE p.patient_id = p_patient_id
    ORDER BY lr.result_datetime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `patient_visit_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `patient_visit_report`(IN p_patient_id INT)
BEGIN
    SELECT 
        p.patient_id,
        p.first_name,
        p.last_name,
        e.encounter_id,
        e.encounter_type,
        e.admit_datetime,
        e.discharge_datetime,
        d.icd10_code,
        d.description AS diagnosis_description
    FROM patients p
    JOIN encounters e ON p.patient_id = e.patient_id
    LEFT JOIN diagnoses d ON e.encounter_id = d.encounter_id
    WHERE p.patient_id = p_patient_id
    ORDER BY e.admit_datetime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `appointment_checkin_view`
--

/*!50001 DROP VIEW IF EXISTS `appointment_checkin_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `appointment_checkin_view` AS select `a`.`appointment_id` AS `appointment_id`,`p`.`patient_id` AS `patient_id`,`p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`a`.`appt_datetime` AS `appt_datetime`,`a`.`status` AS `appointment_status`,`c`.`checkin_id` AS `checkin_id`,`c`.`checkin_time` AS `checkin_time`,`c`.`method` AS `method`,`c`.`status` AS `checkin_status` from ((`appointments` `a` join `patients` `p` on((`a`.`patient_id` = `p`.`patient_id`))) left join `check_ins` `c` on((`a`.`appointment_id` = `c`.`appointment_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `claim_payment_summary_view`
--

/*!50001 DROP VIEW IF EXISTS `claim_payment_summary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `claim_payment_summary_view` AS select `c`.`claim_id` AS `claim_id`,`e`.`encounter_id` AS `encounter_id`,`p`.`patient_id` AS `patient_id`,`p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`c`.`claim_status` AS `claim_status`,`c`.`total_amount` AS `total_amount`,ifnull(sum(`pay`.`amount`),0.00) AS `total_paid`,(`c`.`total_amount` - ifnull(sum(`pay`.`amount`),0.00)) AS `balance_due` from (((`claims` `c` join `encounters` `e` on((`c`.`encounter_id` = `e`.`encounter_id`))) join `patients` `p` on((`e`.`patient_id` = `p`.`patient_id`))) left join `payments` `pay` on((`c`.`claim_id` = `pay`.`claim_id`))) group by `c`.`claim_id`,`e`.`encounter_id`,`p`.`patient_id`,`p`.`first_name`,`p`.`last_name`,`c`.`claim_status`,`c`.`total_amount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `encounter_provider_view`
--

/*!50001 DROP VIEW IF EXISTS `encounter_provider_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `encounter_provider_view` AS select `e`.`encounter_id` AS `encounter_id`,`p`.`patient_id` AS `patient_id`,`p`.`first_name` AS `patient_first_name`,`p`.`last_name` AS `patient_last_name`,`e`.`encounter_type` AS `encounter_type`,`e`.`admit_datetime` AS `admit_datetime`,`e`.`discharge_datetime` AS `discharge_datetime`,`e`.`status` AS `status`,`pr`.`provider_id` AS `provider_id`,`emp`.`first_name` AS `provider_first_name`,`emp`.`last_name` AS `provider_last_name`,`pr`.`specialty` AS `specialty`,`d`.`department_name` AS `department_name` from ((((`encounters` `e` join `patients` `p` on((`e`.`patient_id` = `p`.`patient_id`))) left join `providers` `pr` on((`e`.`attending_provider_id` = `pr`.`provider_id`))) left join `employees` `emp` on((`pr`.`employee_id` = `emp`.`employee_id`))) left join `departments` `d` on((`e`.`department_id` = `d`.`department_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lab_results_report_view`
--

/*!50001 DROP VIEW IF EXISTS `lab_results_report_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lab_results_report_view` AS select `p`.`patient_id` AS `patient_id`,`p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`e`.`encounter_id` AS `encounter_id`,`lo`.`lab_order_id` AS `lab_order_id`,`lt`.`test_name` AS `test_name`,`lr`.`result_value` AS `result_value`,`lt`.`unit` AS `unit`,`lt`.`reference_range` AS `reference_range`,`lr`.`flag` AS `flag`,`lr`.`result_datetime` AS `result_datetime` from ((((`patients` `p` join `encounters` `e` on((`p`.`patient_id` = `e`.`patient_id`))) join `lab_orders` `lo` on((`e`.`encounter_id` = `lo`.`encounter_id`))) join `lab_results` `lr` on((`lo`.`lab_order_id` = `lr`.`lab_order_id`))) join `lab_tests` `lt` on((`lr`.`lab_test_id` = `lt`.`lab_test_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `open_encounters_view`
--

/*!50001 DROP VIEW IF EXISTS `open_encounters_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `open_encounters_view` AS select `e`.`encounter_id` AS `encounter_id`,`p`.`patient_id` AS `patient_id`,`p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`d`.`department_name` AS `department_name`,`e`.`encounter_type` AS `encounter_type`,`e`.`admit_datetime` AS `admit_datetime`,`e`.`status` AS `status` from ((`encounters` `e` join `patients` `p` on((`e`.`patient_id` = `p`.`patient_id`))) left join `departments` `d` on((`e`.`department_id` = `d`.`department_id`))) where (`e`.`status` = 'Open') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_insurance_view`
--

/*!50001 DROP VIEW IF EXISTS `patient_insurance_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_insurance_view` AS select `p`.`patient_id` AS `patient_id`,`p`.`mrn` AS `mrn`,`p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`pi`.`policy_number` AS `policy_number`,`pi`.`is_primary` AS `is_primary`,`ip`.`insurance_id` AS `insurance_id`,`ip`.`payer_name` AS `payer_name`,`ip`.`plan_name` AS `plan_name` from ((`patients` `p` join `patient_insurance` `pi` on((`p`.`patient_id` = `pi`.`patient_id`))) join `insurance_plans` `ip` on((`pi`.`insurance_id` = `ip`.`insurance_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `payroll_summary`
--

/*!50001 DROP VIEW IF EXISTS `payroll_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `payroll_summary` AS select `pi`.`payroll_id` AS `payroll_id`,`pi`.`employee_id` AS `employee_id`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`pi`.`base_salary` AS `base_salary`,`pi`.`allowances_total` AS `allowances_total`,`pi`.`deductions_total` AS `deductions_total`,`pi`.`net_pay` AS `net_pay` from (`payroll_items` `pi` join `employees` `e` on((`pi`.`employee_id` = `e`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-16 17:17:42
