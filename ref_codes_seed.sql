USE bre_cc;

-- 1 DepartmentCostCenter (1–4)
INSERT IGNORE INTO ref_codes VALUES
('DepartmentCostCenter',1,'Workshop',TRUE,1,NOW(6),NOW(6)),
('DepartmentCostCenter',2,'Sales',TRUE,2,NOW(6),NOW(6)),
('DepartmentCostCenter',3,'Administration',TRUE,3,NOW(6),NOW(6)),
('DepartmentCostCenter',4,'Management',TRUE,4,NOW(6),NOW(6));

-- 2 ReceiptStatus (1–4)
INSERT IGNORE INTO ref_codes VALUES
('ReceiptStatus',1,'Uploaded',TRUE,1,NOW(6),NOW(6)),
('ReceiptStatus',2,'AI Processed',TRUE,2,NOW(6),NOW(6)),
('ReceiptStatus',3,'Matched',TRUE,3,NOW(6),NOW(6)),
('ReceiptStatus',4,'Unmatched',TRUE,4,NOW(6),NOW(6));

-- 3 PaymentMethod (1–2)
INSERT IGNORE INTO ref_codes VALUES
('PaymentMethod',1,'Credit Card',TRUE,1,NOW(6),NOW(6)),
('PaymentMethod',2,'Cash',TRUE,2,NOW(6),NOW(6));

-- 4 MerchantCategory (1–5)
INSERT IGNORE INTO ref_codes VALUES
('MerchantCategory',1,'Fuel',TRUE,1,NOW(6),NOW(6)),
('MerchantCategory',2,'Hardware',TRUE,2,NOW(6),NOW(6)),
('MerchantCategory',3,'Office Supplies',TRUE,3,NOW(6),NOW(6)),
('MerchantCategory',4,'Travel',TRUE,4,NOW(6),NOW(6)),
('MerchantCategory',5,'Other',TRUE,5,NOW(6),NOW(6));

-- 5 TransactionType (1–3)
INSERT IGNORE INTO ref_codes VALUES
('TransactionType',1,'Purchase',TRUE,1,NOW(6),NOW(6)),
('TransactionType',2,'Refund',TRUE,2,NOW(6),NOW(6)),
('TransactionType',3,'Reversal',TRUE,3,NOW(6),NOW(6));

-- 6 TransactionStatus (1–5)
INSERT IGNORE INTO ref_codes VALUES
('TransactionStatus',1,'Imported',TRUE,1,NOW(6),NOW(6)),
('TransactionStatus',2,'Matched',TRUE,2,NOW(6),NOW(6)),
('TransactionStatus',3,'Unmatched',TRUE,3,NOW(6),NOW(6)),
('TransactionStatus',4,'User Verified',TRUE,4,NOW(6),NOW(6)),
('TransactionStatus',5,'Coded',TRUE,5,NOW(6),NOW(6));

-- 7 FileType (1–3)
INSERT IGNORE INTO ref_codes VALUES
('FileType',1,'CSV',TRUE,1,NOW(6),NOW(6)),
('FileType',2,'PDF',TRUE,2,NOW(6),NOW(6)),
('FileType',3,'XLSX',TRUE,3,NOW(6),NOW(6));

-- 8 ProcessingStatus (1–4)
INSERT IGNORE INTO ref_codes VALUES
('ProcessingStatus',1,'Uploaded',TRUE,1,NOW(6),NOW(6)),
('ProcessingStatus',2,'Processing',TRUE,2,NOW(6),NOW(6)),
('ProcessingStatus',3,'Completed',TRUE,3,NOW(6),NOW(6)),
('ProcessingStatus',4,'Failed',TRUE,4,NOW(6),NOW(6));

-- 9 MatchType (1–3)
INSERT IGNORE INTO ref_codes VALUES
('MatchType',1,'AI Auto-Matched',TRUE,1,NOW(6),NOW(6)),
('MatchType',2,'User Matched',TRUE,2,NOW(6),NOW(6)),
('MatchType',3,'Manual Override',TRUE,3,NOW(6),NOW(6));

-- 10 ReconciliationStatus (1–5)
INSERT IGNORE INTO ref_codes VALUES
('ReconciliationStatus',1,'Matched',TRUE,1,NOW(6),NOW(6)),
('ReconciliationStatus',2,'Verified',TRUE,2,NOW(6),NOW(6)),
('ReconciliationStatus',3,'Coded',TRUE,3,NOW(6),NOW(6)),
('ReconciliationStatus',4,'Exported',TRUE,4,NOW(6),NOW(6)),
('ReconciliationStatus',5,'Approved',TRUE,5,NOW(6),NOW(6));

-- 11 GLCategory (1–6)
INSERT IGNORE INTO ref_codes VALUES
('GLCategory',1,'Materials',TRUE,1,NOW(6),NOW(6)),
('GLCategory',2,'Fuel',TRUE,2,NOW(6),NOW(6)),
('GLCategory',3,'Travel',TRUE,3,NOW(6),NOW(6)),
('GLCategory',4,'Office',TRUE,4,NOW(6),NOW(6)),
('GLCategory',5,'Equipment',TRUE,5,NOW(6),NOW(6)),
('GLCategory',6,'Other',TRUE,6,NOW(6),NOW(6));

-- 12 TaxTreatment (1–3)
INSERT IGNORE INTO ref_codes VALUES
('TaxTreatment',1,'GST Inclusive',TRUE,1,NOW(6),NOW(6)),
('TaxTreatment',2,'GST Exclusive',TRUE,2,NOW(6),NOW(6)),
('TaxTreatment',3,'GST Free',TRUE,3,NOW(6),NOW(6));

-- 13 TrainingSource (1–3)
INSERT IGNORE INTO ref_codes VALUES
('TrainingSource',1,'Manual Entry',TRUE,1,NOW(6),NOW(6)),
('TrainingSource',2,'Historical Data',TRUE,2,NOW(6),NOW(6)),
('TrainingSource',3,'User Feedback',TRUE,3,NOW(6),NOW(6));

-- 14 EntityType (1–8)
INSERT IGNORE INTO ref_codes VALUES
('EntityType',1,'Receipt',TRUE,1,NOW(6),NOW(6)),
('EntityType',2,'Transaction',TRUE,2,NOW(6),NOW(6)),
('EntityType',3,'Reconciliation',TRUE,3,NOW(6),NOW(6)),
('EntityType',4,'Statement',TRUE,4,NOW(6),NOW(6)),
('EntityType',5,'GLCode',TRUE,5,NOW(6),NOW(6)),
('EntityType',6,'MLTrainingData',TRUE,6,NOW(6),NOW(6)),
('EntityType',7,'CreditCardHolder',TRUE,7,NOW(6),NOW(6)),
('EntityType',8,'Other',TRUE,8,NOW(6),NOW(6));

-- 15 ActionType (1–7)
INSERT IGNORE INTO ref_codes VALUES
('ActionType',1,'Create',TRUE,1,NOW(6),NOW(6)),
('ActionType',2,'Update',TRUE,2,NOW(6),NOW(6)),
('ActionType',3,'Delete',TRUE,3,NOW(6),NOW(6)),
('ActionType',4,'Export',TRUE,4,NOW(6),NOW(6)),
('ActionType',5,'Match',TRUE,5,NOW(6),NOW(6)),
('ActionType',6,'Verify',TRUE,6,NOW(6),NOW(6)),
('ActionType',7,'Approve',TRUE,7,NOW(6),NOW(6));

-- 16 UserRole (1–5)
INSERT IGNORE INTO ref_codes VALUES
('UserRole',1,'Cardholder',TRUE,1,NOW(6),NOW(6)),
('UserRole',2,'Finance Team',TRUE,2,NOW(6),NOW(6)),
('UserRole',3,'Manager',TRUE,3,NOW(6),NOW(6)),
('UserRole',4,'Admin',TRUE,4,NOW(6),NOW(6)),
('UserRole',5,'System',TRUE,5,NOW(6),NOW(6));

-- 17 SourceSystem (1–5)
INSERT IGNORE INTO ref_codes VALUES
('SourceSystem',1,'Mobile App',TRUE,1,NOW(6),NOW(6)),
('SourceSystem',2,'Web Portal',TRUE,2,NOW(6),NOW(6)),
('SourceSystem',3,'Power Automate',TRUE,3,NOW(6),NOW(6)),
('SourceSystem',4,'API',TRUE,4,NOW(6),NOW(6)),
('SourceSystem',5,'System',TRUE,5,NOW(6),NOW(6));

-- 18 Severity (1–4)
INSERT IGNORE INTO ref_codes VALUES
('Severity',1,'Info',TRUE,1,NOW(6),NOW(6)),
('Severity',2,'Warning',TRUE,2,NOW(6),NOW(6)),
('Severity',3,'Error',TRUE,3,NOW(6),NOW(6)),
('Severity',4,'Critical',TRUE,4,NOW(6),NOW(6));

-- 19 Months (1–12)
INSERT IGNORE INTO ref_codes VALUES
('Months',1,'January',TRUE,1,NOW(6),NOW(6)),
('Months',2,'February',TRUE,2,NOW(6),NOW(6)),
('Months',3,'March',TRUE,3,NOW(6),NOW(6)),
('Months',4,'April',TRUE,4,NOW(6),NOW(6)),
('Months',5,'May',TRUE,5,NOW(6),NOW(6)),
('Months',6,'June',TRUE,6,NOW(6),NOW(6)),
('Months',7,'July',TRUE,7,NOW(6),NOW(6)),
('Months',8,'August',TRUE,8,NOW(6),NOW(6)),
('Months',9,'September',TRUE,9,NOW(6),NOW(6)),
('Months',10,'October',TRUE,10,NOW(6),NOW(6)),
('Months',11,'November',TRUE,11,NOW(6),NOW(6)),
('Months',12,'December',TRUE,12,NOW(6),NOW(6));
