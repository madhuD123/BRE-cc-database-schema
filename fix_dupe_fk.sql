-- fix_dupe_fk.sql
USE bre_cc;

-- Drop the duplicate FK if it exists (safe to run)
ALTER TABLE transactions
  DROP FOREIGN KEY fk_transactions_statements;
