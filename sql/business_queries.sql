-- =====================================================
-- Retail Sales Performance Analytics
-- Business Queries
-- =====================================================

---------------------------------------------------------
-- 1. Total Sales
---------------------------------------------------------
SELECT
ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore;

---------------------------------------------------------
-- 2. Total Profit
---------------------------------------------------------
SELECT
ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore;

---------------------------------------------------------
-- 3. Total Orders
---------------------------------------------------------
SELECT
COUNT(DISTINCT "Order ID") AS Total_Orders
FROM superstore;

---------------------------------------------------------
-- 4. Total Customers
---------------------------------------------------------
SELECT
COUNT(DISTINCT "Customer ID") AS Total_Customers
FROM superstore;

---------------------------------------------------------
-- 5. Average Order Value
---------------------------------------------------------
SELECT
ROUND(SUM(Sales) / COUNT(DISTINCT "Order ID"),2) AS Average_Order_Value
FROM superstore;

---------------------------------------------------------
-- 6. Sales by Region
---------------------------------------------------------
SELECT
Region,
ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY Region
ORDER BY Sales DESC;

---------------------------------------------------------
-- 7. Profit by Region
---------------------------------------------------------
SELECT
Region,
ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Region
ORDER BY Profit DESC;

---------------------------------------------------------
-- 8. Sales by Category
---------------------------------------------------------
SELECT
Category,
ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY Category
ORDER BY Sales DESC;

---------------------------------------------------------
-- 9. Profit by Category
---------------------------------------------------------
SELECT
Category,
ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Category
ORDER BY Profit DESC;

---------------------------------------------------------
-- 10. Sales by Sub-Category
---------------------------------------------------------
SELECT
"Sub-Category",
ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Sales DESC;

---------------------------------------------------------
-- 11. Profit by Sub-Category
---------------------------------------------------------
SELECT
"Sub-Category",
ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Profit DESC;

---------------------------------------------------------
-- 12. Sales by Customer Segment
---------------------------------------------------------
SELECT
Segment,
ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY Segment
ORDER BY Sales DESC;

---------------------------------------------------------
-- 13. Top 10 Products by Sales
---------------------------------------------------------
SELECT
"Product Name",
ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY "Product Name"
ORDER BY Sales DESC
LIMIT 10;

---------------------------------------------------------
-- 14. Bottom 10 Products by Sales
---------------------------------------------------------
SELECT
"Product Name",
ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY "Product Name"
ORDER BY Sales ASC
LIMIT 10;

---------------------------------------------------------
-- 15. Top 10 Most Profitable Products
---------------------------------------------------------
SELECT
"Product Name",
ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY "Product Name"
ORDER BY Profit DESC
LIMIT 10;

---------------------------------------------------------
-- 16. Top 10 Customers by Sales
---------------------------------------------------------
SELECT
"Customer Name",
ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY "Customer Name"
ORDER BY Sales DESC
LIMIT 10;

---------------------------------------------------------
-- 17. Top 10 Customers by Profit
---------------------------------------------------------
SELECT
"Customer Name",
ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY "Customer Name"
ORDER BY Profit DESC
LIMIT 10;

---------------------------------------------------------
-- 18. Sales by State
---------------------------------------------------------
SELECT
State,
ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY State
ORDER BY Sales DESC;

---------------------------------------------------------
-- 19. Profit by State
---------------------------------------------------------
SELECT
State,
ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY State
ORDER BY Profit DESC;

---------------------------------------------------------
-- 20. Sales by Ship Mode
---------------------------------------------------------
SELECT
"Ship Mode",
ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY "Ship Mode"
ORDER BY Sales DESC;

---------------------------------------------------------
-- 21. Average Discount by Category
---------------------------------------------------------
SELECT
Category,
ROUND(AVG(Discount),2) AS Average_Discount
FROM superstore
GROUP BY Category
ORDER BY Average_Discount DESC;

---------------------------------------------------------
-- 22. Highest Single Order Value
---------------------------------------------------------
SELECT
"Order ID",
ROUND(SUM(Sales),2) AS Order_Value
FROM superstore
GROUP BY "Order ID"
ORDER BY Order_Value DESC
LIMIT 10;

---------------------------------------------------------
-- 23. Monthly Sales Trend
---------------------------------------------------------
SELECT
strftime('%Y-%m',"Order Date") AS Month,
ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY Month
ORDER BY Month;

---------------------------------------------------------
-- 24. Monthly Profit Trend
---------------------------------------------------------
SELECT
strftime('%Y-%m',"Order Date") AS Month,
ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Month
ORDER BY Month;

---------------------------------------------------------
-- 25. Top 10 Loss Making Products
---------------------------------------------------------
SELECT
"Product Name",
ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY "Product Name"
ORDER BY Profit ASC
LIMIT 10;

---------------------------------------------------------
-- 26. Category Contribution to Total Sales
---------------------------------------------------------
SELECT
Category,
ROUND(SUM(Sales),2) AS Sales,
ROUND(
SUM(Sales)*100.0/
(SELECT SUM(Sales) FROM superstore),2
) AS Percentage_Contribution
FROM superstore
GROUP BY Category
ORDER BY Sales DESC;

---------------------------------------------------------
-- 27. Region Contribution to Total Profit
---------------------------------------------------------
SELECT
Region,
ROUND(SUM(Profit),2) AS Profit,
ROUND(
SUM(Profit)*100.0/
(SELECT SUM(Profit) FROM superstore),2
) AS Percentage_Contribution
FROM superstore
GROUP BY Region
ORDER BY Profit DESC;

---------------------------------------------------------
-- 28. Top 10 Cities by Sales
---------------------------------------------------------
SELECT
City,
ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY City
ORDER BY Sales DESC
LIMIT 10;

---------------------------------------------------------
-- 29. Top 10 Cities by Profit
---------------------------------------------------------
SELECT
City,
ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY City
ORDER BY Profit DESC
LIMIT 10;

---------------------------------------------------------
-- 30. Overall Profit Margin
---------------------------------------------------------
SELECT
ROUND(
SUM(Profit)*100.0/SUM(Sales),2
) AS Profit_Margin
FROM superstore;