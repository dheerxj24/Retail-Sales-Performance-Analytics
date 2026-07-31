-- =====================================================
-- Retail Sales Performance Analytics
-- Database Creation & Schema Verification
-- =====================================================

-- Main table used in the project
SELECT name
FROM sqlite_master
WHERE type = 'table';

-- View complete schema
PRAGMA table_info(superstore);

-- Total records loaded into database
SELECT COUNT(*) AS total_records
FROM superstore;