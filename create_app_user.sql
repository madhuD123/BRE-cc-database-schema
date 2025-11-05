-- create_app_user.sql
-- Adjust host as needed: 'localhost', '%', or the PHP server host.
CREATE USER IF NOT EXISTS 'bre_app'@'localhost' IDENTIFIED BY 'ChangeMe!StrongPW123';

GRANT SELECT, INSERT, UPDATE, DELETE
ON bre_cc.* TO 'bre_app'@'localhost';

FLUSH PRIVILEGES;
