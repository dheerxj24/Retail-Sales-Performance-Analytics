-- =====================================================
-- Retail Sales Performance Analytics
-- SQL Views
-- =====================================================

---------------------------------------------------------
-- 1. Sales & Profit by Region
---------------------------------------------------------
CREATE VIEW sales_by_region AS
SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM superstore
GROUP BY Region;

---------------------------------------------------------
-- 2. Category Summary
---------------------------------------------------------
CREATE VIEW category_summary AS
SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(AVG(Discount),2) AS Average_Discount
FROM superstore
GROUP BY Category;

---------------------------------------------------------
-- 3. Customer Summary
---------------------------------------------------------
CREATE VIEW customer_summary AS
SELECT
    "Customer ID",
    "Customer Name",
    Segment,
    COUNT(DISTINCT "Order ID") AS Orders,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY
    "Customer ID",
    "Customer Name",
    Segment;

---------------------------------------------------------
-- 4. Product Performance
---------------------------------------------------------
CREATE VIEW product_performance AS
SELECT
    "Product Name",
    Category,
    "Sub-Category",
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM superstore
GROUP BY
    "Product Name",
    Category,
    "Sub-Category";

---------------------------------------------------------
-- 5. State Performance
---------------------------------------------------------
CREATE VIEW state_performance AS
SELECT
    State,
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY
    State,
    Region;

---------------------------------------------------------
-- 6. Monthly Sales
---------------------------------------------------------
CREATE VIEW monthly_sales AS
SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Orders
FROM superstore
GROUP BY Month;

---------------------------------------------------------
-- 7. Ship Mode Analysis
---------------------------------------------------------
CREATE VIEW ship_mode_summary AS
SELECT
    "Ship Mode",
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY "Ship Mode";

---------------------------------------------------------
-- 8. Segment Performance
---------------------------------------------------------
CREATE VIEW segment_summary AS
SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    COUNT(DISTINCT "Customer ID") AS Customers
FROM superstore
GROUP BY Segment;