-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: bre_cc
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `audit_id` char(36) NOT NULL,
  `entity_type_set` varchar(64) NOT NULL DEFAULT 'EntityType',
  `entity_type_id` smallint NOT NULL,
  `entity_id` char(36) NOT NULL,
  `action_type_set` varchar(64) NOT NULL DEFAULT 'ActionType',
  `action_type_id` smallint NOT NULL,
  `actor_user_id` char(36) DEFAULT NULL,
  `actor_display_name` varchar(200) DEFAULT NULL,
  `details_json` json DEFAULT NULL,
  `severity_set` varchar(64) NOT NULL DEFAULT 'Severity',
  `severity_id` smallint NOT NULL,
  `source_system_set` varchar(64) NOT NULL DEFAULT 'SourceSystem',
  `source_system_id` smallint NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  PRIMARY KEY (`audit_id`),
  KEY `idx_audit_entity` (`entity_type_id`,`entity_id`),
  KEY `fk_audit_entity_type` (`entity_type_set`,`entity_type_id`),
  KEY `fk_audit_action_type` (`action_type_set`,`action_type_id`),
  KEY `fk_audit_severity` (`severity_set`,`severity_id`),
  KEY `fk_audit_source` (`source_system_set`,`source_system_id`),
  CONSTRAINT `fk_audit_action_type` FOREIGN KEY (`action_type_set`, `action_type_id`) REFERENCES `ref_codes` (`code_set`, `code_id`),
  CONSTRAINT `fk_audit_entity_type` FOREIGN KEY (`entity_type_set`, `entity_type_id`) REFERENCES `ref_codes` (`code_set`, `code_id`),
  CONSTRAINT `fk_audit_severity` FOREIGN KEY (`severity_set`, `severity_id`) REFERENCES `ref_codes` (`code_set`, `code_id`),
  CONSTRAINT `fk_audit_source` FOREIGN KEY (`source_system_set`, `source_system_id`) REFERENCES `ref_codes` (`code_set`, `code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credit_card_holders`
--

DROP TABLE IF EXISTS `credit_card_holders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card_holders` (
  `card_holder_id` char(36) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `card_number` varchar(64) NOT NULL,
  `dept_set` varchar(64) NOT NULL DEFAULT 'DepartmentCostCenter',
  `dept_id` smallint NOT NULL,
  `job_title` varchar(120) DEFAULT NULL,
  `mobile_phone` varchar(40) DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  PRIMARY KEY (`card_holder_id`),
  UNIQUE KEY `uq_cch_email` (`email`),
  UNIQUE KEY `uq_cch_card` (`card_number`),
  KEY `fk_cch_dept` (`dept_set`,`dept_id`),
  CONSTRAINT `fk_cch_dept` FOREIGN KEY (`dept_set`, `dept_id`) REFERENCES `ref_codes` (`code_set`, `code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gl_codes`
--

DROP TABLE IF EXISTS `gl_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gl_codes` (
  `gl_code_id` char(36) NOT NULL,
  `gl_code` varchar(64) NOT NULL,
  `gl_account_name` varchar(200) NOT NULL,
  `gl_category_set` varchar(64) NOT NULL DEFAULT 'GLCategory',
  `gl_category_id` smallint NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  PRIMARY KEY (`gl_code_id`),
  UNIQUE KEY `uq_gl_code` (`gl_code`),
  UNIQUE KEY `uq_gl_name` (`gl_account_name`),
  KEY `fk_gl_cat` (`gl_category_set`,`gl_category_id`),
  CONSTRAINT `fk_gl_cat` FOREIGN KEY (`gl_category_set`, `gl_category_id`) REFERENCES `ref_codes` (`code_set`, `code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ml_training_data`
--

DROP TABLE IF EXISTS `ml_training_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ml_training_data` (
  `training_row_id` char(36) NOT NULL,
  `transaction_id` char(36) DEFAULT NULL,
  `gl_code_id` char(36) DEFAULT NULL,
  `source_set` varchar(64) NOT NULL DEFAULT 'TrainingSource',
  `source_id` smallint NOT NULL,
  `features_json` json DEFAULT NULL,
  `label_confidence` double DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  PRIMARY KEY (`training_row_id`),
  KEY `fk_mlt_txn` (`transaction_id`),
  KEY `fk_mlt_gl` (`gl_code_id`),
  KEY `fk_mlt_source` (`source_set`,`source_id`),
  CONSTRAINT `fk_mlt_gl` FOREIGN KEY (`gl_code_id`) REFERENCES `gl_codes` (`gl_code_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mlt_source` FOREIGN KEY (`source_set`, `source_id`) REFERENCES `ref_codes` (`code_set`, `code_id`),
  CONSTRAINT `fk_mlt_txn` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `receipt_line_items`
--

DROP TABLE IF EXISTS `receipt_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt_line_items` (
  `line_item_id` char(36) NOT NULL,
  `receipt_id` char(36) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `qty` decimal(18,4) DEFAULT NULL,
  `unit_price` decimal(19,4) DEFAULT NULL,
  `tax_treatment_set` varchar(64) NOT NULL DEFAULT 'TaxTreatment',
  `tax_treatment_id` smallint NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  PRIMARY KEY (`line_item_id`),
  KEY `idx_rli_receipt` (`receipt_id`),
  KEY `fk_rli_tax` (`tax_treatment_set`,`tax_treatment_id`),
  CONSTRAINT `fk_rli_receipt` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`receipt_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rli_tax` FOREIGN KEY (`tax_treatment_set`, `tax_treatment_id`) REFERENCES `ref_codes` (`code_set`, `code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipts` (
  `receipt_id` char(36) NOT NULL,
  `card_holder_id` char(36) DEFAULT NULL,
  `receipt_number` varchar(80) NOT NULL,
  `merchant_name` varchar(200) DEFAULT NULL,
  `merchant_category_set` varchar(64) NOT NULL DEFAULT 'MerchantCategory',
  `merchant_category_id` smallint NOT NULL,
  `receipt_date` datetime(6) NOT NULL,
  `total_amount` decimal(19,2) NOT NULL,
  `file_url` varchar(500) DEFAULT NULL,
  `file_type_set` varchar(64) NOT NULL DEFAULT 'FileType',
  `file_type_id` smallint NOT NULL,
  `payment_method_set` varchar(64) NOT NULL DEFAULT 'PaymentMethod',
  `payment_method_id` smallint NOT NULL,
  `status_set` varchar(64) NOT NULL DEFAULT 'ReceiptStatus',
  `status_id` smallint NOT NULL,
  `uploaded_by_user_id` char(36) DEFAULT NULL,
  `verified_by_user_id` char(36) DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  PRIMARY KEY (`receipt_id`),
  KEY `idx_receipts_holder_date` (`card_holder_id`,`receipt_date`),
  KEY `fk_receipts_ft` (`file_type_set`,`file_type_id`),
  KEY `fk_receipts_pm` (`payment_method_set`,`payment_method_id`),
  KEY `fk_receipts_status` (`status_set`,`status_id`),
  KEY `fk_receipts_mcat` (`merchant_category_set`,`merchant_category_id`),
  CONSTRAINT `fk_receipts_ft` FOREIGN KEY (`file_type_set`, `file_type_id`) REFERENCES `ref_codes` (`code_set`, `code_id`),
  CONSTRAINT `fk_receipts_holder` FOREIGN KEY (`card_holder_id`) REFERENCES `credit_card_holders` (`card_holder_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_receipts_mcat` FOREIGN KEY (`merchant_category_set`, `merchant_category_id`) REFERENCES `ref_codes` (`code_set`, `code_id`),
  CONSTRAINT `fk_receipts_pm` FOREIGN KEY (`payment_method_set`, `payment_method_id`) REFERENCES `ref_codes` (`code_set`, `code_id`),
  CONSTRAINT `fk_receipts_status` FOREIGN KEY (`status_set`, `status_id`) REFERENCES `ref_codes` (`code_set`, `code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reconciliation`
--

DROP TABLE IF EXISTS `reconciliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reconciliation` (
  `reconciliation_id` char(36) NOT NULL,
  `reconciliation_number` varchar(80) NOT NULL,
  `transaction_id` char(36) NOT NULL,
  `receipt_id` char(36) DEFAULT NULL,
  `line_item_id` char(36) DEFAULT NULL,
  `match_type_set` varchar(64) NOT NULL DEFAULT 'MatchType',
  `match_type_id` smallint NOT NULL,
  `reconciliation_status_set` varchar(64) NOT NULL DEFAULT 'ReconciliationStatus',
  `reconciliation_status_id` smallint NOT NULL,
  `gl_code_id` char(36) DEFAULT NULL,
  `gl_coded_by_user_id` char(36) DEFAULT NULL,
  `notes` text,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  PRIMARY KEY (`reconciliation_id`),
  KEY `idx_rec_txn_status` (`transaction_id`,`reconciliation_status_id`),
  KEY `fk_rec_receipt` (`receipt_id`),
  KEY `fk_rec_line` (`line_item_id`),
  KEY `fk_rec_gl` (`gl_code_id`),
  KEY `fk_rec_match_type` (`match_type_set`,`match_type_id`),
  KEY `fk_rec_status` (`reconciliation_status_set`,`reconciliation_status_id`),
  CONSTRAINT `fk_rec_gl` FOREIGN KEY (`gl_code_id`) REFERENCES `gl_codes` (`gl_code_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rec_line` FOREIGN KEY (`line_item_id`) REFERENCES `receipt_line_items` (`line_item_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rec_match_type` FOREIGN KEY (`match_type_set`, `match_type_id`) REFERENCES `ref_codes` (`code_set`, `code_id`),
  CONSTRAINT `fk_rec_receipt` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`receipt_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rec_status` FOREIGN KEY (`reconciliation_status_set`, `reconciliation_status_id`) REFERENCES `ref_codes` (`code_set`, `code_id`),
  CONSTRAINT `fk_rec_txn` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_codes`
--

DROP TABLE IF EXISTS `ref_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_codes` (
  `code_set` varchar(64) NOT NULL,
  `code_id` smallint NOT NULL,
  `code_label` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` smallint DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  PRIMARY KEY (`code_set`,`code_id`),
  UNIQUE KEY `uq_ref_set_label` (`code_set`,`code_label`),
  KEY `idx_ref_codes_set` (`code_set`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statements`
--

DROP TABLE IF EXISTS `statements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statements` (
  `statement_id` char(36) NOT NULL,
  `statement_number` varchar(80) NOT NULL,
  `period_start` date NOT NULL,
  `period_end` date NOT NULL,
  `statement_month_set` varchar(64) NOT NULL DEFAULT 'Months',
  `statement_month_id` smallint NOT NULL,
  `total_amount` decimal(19,2) NOT NULL DEFAULT '0.00',
  `uploaded_by_user_id` char(36) DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  PRIMARY KEY (`statement_id`),
  KEY `fk_stmt_month` (`statement_month_set`,`statement_month_id`),
  CONSTRAINT `fk_stmt_month` FOREIGN KEY (`statement_month_set`, `statement_month_id`) REFERENCES `ref_codes` (`code_set`, `code_id`),
  CONSTRAINT `statements_chk_1` CHECK ((`period_end` > `period_start`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` char(36) NOT NULL,
  `card_holder_id` char(36) DEFAULT NULL,
  `statement_id` char(36) DEFAULT NULL,
  `transaction_number` varchar(80) NOT NULL,
  `transaction_date` datetime(6) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `merchant_name` varchar(200) DEFAULT NULL,
  `txn_type_set` varchar(64) NOT NULL DEFAULT 'TransactionType',
  `txn_type_id` smallint NOT NULL,
  `txn_status_set` varchar(64) NOT NULL DEFAULT 'TransactionStatus',
  `txn_status_id` smallint NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `idx_txn_date` (`transaction_date`),
  KEY `idx_txn_holder` (`card_holder_id`),
  KEY `idx_txn_stmt` (`statement_id`),
  KEY `fk_txn_type` (`txn_type_set`,`txn_type_id`),
  KEY `fk_txn_status` (`txn_status_set`,`txn_status_id`),
  CONSTRAINT `fk_transactions_statements` FOREIGN KEY (`statement_id`) REFERENCES `statements` (`statement_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_txn_holder` FOREIGN KEY (`card_holder_id`) REFERENCES `credit_card_holders` (`card_holder_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_txn_status` FOREIGN KEY (`txn_status_set`, `txn_status_id`) REFERENCES `ref_codes` (`code_set`, `code_id`),
  CONSTRAINT `fk_txn_stmt` FOREIGN KEY (`statement_id`) REFERENCES `statements` (`statement_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_txn_type` FOREIGN KEY (`txn_type_set`, `txn_type_id`) REFERENCES `ref_codes` (`code_set`, `code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-05 15:54:56
