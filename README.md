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

