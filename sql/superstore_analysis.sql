-- =====================================================
-- Retail Sales Performance Analytics
-- Advanced SQL Analysis
-- =====================================================

---------------------------------------------------------
-- 1. Category Sales using CTE
---------------------------------------------------------
WITH category_sales AS (
    SELECT
        Category,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY Category
)
SELECT *
FROM category_sales
ORDER BY Total_Sales DESC;

---------------------------------------------------------
-- 2. Top 10 Products using RANK()
---------------------------------------------------------
SELECT
    "Product Name",
    ROUND(SUM(Sales),2) AS Total_Sales,
    RANK() OVER (
        ORDER BY SUM(Sales) DESC
    ) AS Sales_Rank
FROM superstore
GROUP BY "Product Name"
LIMIT 10;

---------------------------------------------------------
-- 3. Top Customers using DENSE_RANK()
---------------------------------------------------------
SELECT
    "Customer Name",
    ROUND(SUM(Sales),2) AS Total_Sales,
    DENSE_RANK() OVER (
        ORDER BY SUM(Sales) DESC
    ) AS Customer_Rank
FROM superstore
GROUP BY "Customer Name"
LIMIT 10;

---------------------------------------------------------
-- 4. Row Number by Sales
---------------------------------------------------------
SELECT
    "Product Name",
    SUM(Sales) AS Total_Sales,
    ROW_NUMBER() OVER (
        ORDER BY SUM(Sales) DESC
    ) AS Row_Num
FROM superstore
GROUP BY "Product Name";

---------------------------------------------------------
-- 5. Running Sales Total
---------------------------------------------------------
SELECT
    "Order Date",
    ROUND(SUM(Sales),2) AS Daily_Sales,
    ROUND(
        SUM(SUM(Sales)) OVER (
            ORDER BY "Order Date"
        ),
        2
    ) AS Running_Total
FROM superstore
GROUP BY "Order Date";

---------------------------------------------------------
-- 6. Monthly Running Profit
---------------------------------------------------------
SELECT
    strftime('%Y-%m',"Order Date") AS Month,
    ROUND(SUM(Profit),2) AS Monthly_Profit,
    ROUND(
        SUM(SUM(Profit)) OVER(
            ORDER BY strftime('%Y-%m',"Order Date")
        ),
        2
    ) AS Running_Profit
FROM superstore
GROUP BY Month;

---------------------------------------------------------
-- 7. Profit Margin by Category
---------------------------------------------------------
SELECT
    Category,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit,
    ROUND(
        SUM(Profit)*100.0/SUM(Sales),
        2
    ) AS Profit_Margin
FROM superstore
GROUP BY Category
ORDER BY Profit_Margin DESC;

---------------------------------------------------------
-- 8. Percentage Contribution of Each Region
---------------------------------------------------------
SELECT
    Region,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(
        SUM(Sales)*100.0/
        (SELECT SUM(Sales) FROM superstore),
        2
    ) AS Sales_Percentage
FROM superstore
GROUP BY Region
ORDER BY Sales DESC;

---------------------------------------------------------
-- 9. Top Product in Each Category
---------------------------------------------------------
WITH ranked_products AS (
    SELECT
        Category,
        "Product Name",
        SUM(Sales) AS Total_Sales,
        ROW_NUMBER() OVER(
            PARTITION BY Category
            ORDER BY SUM(Sales) DESC
        ) AS rn
    FROM superstore
    GROUP BY Category, "Product Name"
)
SELECT
    Category,
    "Product Name",
    ROUND(Total_Sales,2) AS Total_Sales
FROM ranked_products
WHERE rn = 1;

---------------------------------------------------------
-- 10. Bottom Product in Each Category
---------------------------------------------------------
WITH ranked_products AS (
    SELECT
        Category,
        "Product Name",
        SUM(Sales) AS Total_Sales,
        ROW_NUMBER() OVER(
            PARTITION BY Category
            ORDER BY SUM(Sales)
        ) AS rn
    FROM superstore
    GROUP BY Category, "Product Name"
)
SELECT
    Category,
    "Product Name",
    ROUND(Total_Sales,2) AS Total_Sales
FROM ranked_products
WHERE rn = 1;

---------------------------------------------------------
-- 11. Average Sales by Region
---------------------------------------------------------
SELECT
    Region,
    ROUND(AVG(Sales),2) AS Average_Sales
FROM superstore
GROUP BY Region
ORDER BY Average_Sales DESC;

---------------------------------------------------------
-- 12. Orders Above Average Sales
---------------------------------------------------------
SELECT
    "Order ID",
    Sales
FROM superstore
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM superstore
);

---------------------------------------------------------
-- 13. Customer Lifetime Sales
---------------------------------------------------------
SELECT
    "Customer Name",
    ROUND(SUM(Sales),2) AS Lifetime_Sales
FROM superstore
GROUP BY "Customer Name"
ORDER BY Lifetime_Sales DESC;

---------------------------------------------------------
-- 14. Product Quantity Sold
---------------------------------------------------------
SELECT
    "Product Name",
    SUM(Quantity) AS Quantity_Sold
FROM superstore
GROUP BY "Product Name"
ORDER BY Quantity_Sold DESC
LIMIT 10;

---------------------------------------------------------
-- 15. Discount Impact on Profit
---------------------------------------------------------
SELECT
    Discount,
    ROUND(AVG(Profit),2) AS Average_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

---------------------------------------------------------
-- 16. Sales Quartiles using NTILE()
---------------------------------------------------------
SELECT
    "Product Name",
    Sales,
    NTILE(4) OVER(
        ORDER BY Sales DESC
    ) AS Sales_Quartile
FROM superstore;

---------------------------------------------------------
-- 17. Region-wise Profit Ranking
---------------------------------------------------------
SELECT
    Region,
    ROUND(SUM(Profit),2) AS Total_Profit,
    RANK() OVER(
        ORDER BY SUM(Profit) DESC
    ) AS Profit_Rank
FROM superstore
GROUP BY Region;

---------------------------------------------------------
-- 18. Most Frequently Ordered Products
---------------------------------------------------------
SELECT
    "Product Name",
    COUNT(*) AS Order_Count
FROM superstore
GROUP BY "Product Name"
ORDER BY Order_Count DESC
LIMIT 10;

---------------------------------------------------------
-- 19. Customer Purchase Frequency
---------------------------------------------------------
SELECT
    "Customer Name",
    COUNT(DISTINCT "Order ID") AS Purchase_Count
FROM superstore
GROUP BY "Customer Name"
ORDER BY Purchase_Count DESC;

---------------------------------------------------------
-- 20. Regional Profitability
---------------------------------------------------------
SELECT
    Region,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit,
    ROUND(
        SUM(Profit)*100.0/SUM(Sales),
        2
    ) AS Profit_Margin
FROM superstore
GROUP BY Region
ORDER BY Profit_Margin DESC;