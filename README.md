# BRE Credit Card – MySQL Database Schema

This repository contains the database schema and setup instructions for the BRE Credit Card Web Application.

---

## 📦 Files Included

| File | Purpose |
|------|---------|
| **bre_cc_schema.sql** | Creates all tables, primary keys, foreign keys, and indexes |
| **ref_codes_seed.sql** | Inserts 19 dropdown / lookup code sets (idempotent safe re-run) |
| **fix_dupe_fk.sql** | Removes duplicate FK from transactions → statements (export artifact) |
| **create_app_user.sql** | Creates MySQL application user with limited privileges (optional) |

---

## ✅ Setup Instructions (for PHP Web App Development)

### **1) Create the Schema**
Open MySQL Workbench and run:

1) Create Database Schema (Tables Only)

Open MySQL Workbench, connect to your MySQL server, then run:

bre_cc_schema.sql


This will create the following tables:

Table Name	Purpose
credit_card_holders	Stores card holder details (name, email, department)
receipts	Records uploaded receipts
receipt_line_items	Line-by-line breakdown of receipt contents
statements	Monthly billing statements
transactions	Bank transactions imported from statements
reconciliation	Matching between receipts and transactions
gl_codes	GL account code mapping
ml_training_data	Training dataset used for machine learning prediction
audit_log	Audit history for all user and system actions
ref_codes	Lookup table containing all dropdown / category values

✅ No sample data is included in this step — only structure.

2) Insert Dropdown / Lookup Values (19 code sets)

After the tables are created, run:

ref_codes_seed.sql


This will insert required dropdown values such as:

DepartmentCostCenter

MerchantCategory

TaxTreatment

FileType

PaymentMethod

ReceiptStatus

TransactionType

TransactionStatus

ReconciliationStatus

MatchType

GLCategory

Months

And others…

✅ Safe to run multiple times — duplicates will not be created.

3) Fix Export FK Issue (Required Only Once)

During export, MySQL added two FKs on transactions.statement_id.
To correct this, run:

fix_dupe_fk.sql


This removes the duplicate FK and keeps the correct one.

4) (Optional) Create Application User

If using a dedicated MySQL user for the PHP backend:

Run:

create_app_user.sql


Then optionally update password:

ALTER USER 'bre_app'@'localhost' IDENTIFIED BY 'NewStrongPassword!123';
FLUSH PRIVILEGES;

