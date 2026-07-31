-- =====================================================
-- Data Validation
-- =====================================================

-- Total Records
SELECT COUNT(*) AS total_records
FROM superstore;

-- Missing Sales
SELECT COUNT(*)
FROM superstore
WHERE Sales IS NULL;

-- Missing Profit
SELECT COUNT(*)
FROM superstore
WHERE Profit IS NULL;

-- Missing Customer IDs
SELECT COUNT(*)
FROM superstore
WHERE "Customer ID" IS NULL;

-- Duplicate Orders
SELECT "Order ID",
COUNT(*) AS duplicate_count
FROM superstore
GROUP BY "Order ID"
HAVING COUNT(*) > 1;

-- Negative Profit
SELECT *
FROM superstore
WHERE Profit < 0;

-- Negative Sales
SELECT *
FROM superstore
WHERE Sales < 0;

-- Invalid Discounts
SELECT *
FROM superstore
WHERE Discount < 0
OR Discount > 1;