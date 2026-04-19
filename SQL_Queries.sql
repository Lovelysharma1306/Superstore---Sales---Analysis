-- =========================================
-- BASIC DATA EXPLORATION
-- =========================================

-- Total Number of Records
SELECT COUNT(*) AS Total_Records
FROM SampleSuperstore;

-- Preview First 10 Rows
SELECT *
FROM SampleSuperstore
LIMIT 10;


-- =========================================
-- SALES & PROFIT OVERVIEW
-- =========================================

-- Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM SampleSuperstore;

-- Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM SampleSuperstore;


-- =========================================
-- CATEGORY ANALYSIS
-- =========================================

-- Sales by Category
SELECT Category, SUM(Sales) AS Total_Sales
FROM SampleSuperstore
GROUP BY Category;

-- Profit by Sub-Category
SELECT Sub_Category, SUM(Profit) AS Total_Profit
FROM SampleSuperstore
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;

-- Average Discount by Category
SELECT Category, AVG(Discount) AS Avg_Discount
FROM SampleSuperstore
GROUP BY Category;


-- =========================================
-- REGIONAL ANALYSIS
-- =========================================

-- Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM SampleSuperstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Profit by Region
SELECT Region, SUM(Profit) AS Total_Profit
FROM SampleSuperstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Top 2 Regions by Profit
SELECT Region, SUM(Profit) AS Total_Profit
FROM SampleSuperstore
GROUP BY Region
ORDER BY Total_Profit DESC
LIMIT 2;


-- =========================================
-- GEOGRAPHIC ANALYSIS
-- =========================================

-- Top 10 States by Sales
SELECT State, SUM(Sales) AS Total_Sales
FROM SampleSuperstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;


-- =========================================
-- CUSTOMER ANALYSIS
-- =========================================

-- Top 5 Customers by Sales
SELECT Customer_Name, SUM(Sales) AS Total_Sales
FROM SampleSuperstore
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 5;

-- Customers with Sales Above Average
SELECT Customer_Name, SUM(Sales) AS Total_Sales
FROM SampleSuperstore
GROUP BY Customer_Name
HAVING Total_Sales > (
    SELECT AVG(Sales) FROM SampleSuperstore
);


-- =========================================
-- SHIPPING ANALYSIS
-- =========================================

-- Sales by Shipping Mode
SELECT Ship_Mode, SUM(Sales) AS Total_Sales
FROM SampleSuperstore
GROUP BY Ship_Mode
ORDER BY Total_Sales DESC;


-- =========================================
-- TIME-BASED ANALYSIS
-- =========================================

-- Year-wise Sales Trend
SELECT strftime('%Y', Order_Date) AS Year, SUM(Sales) AS Total_Sales
FROM SampleSuperstore
GROUP BY Year
ORDER BY Year;


-- =========================================
-- ADVANCED ANALYSIS
-- =========================================

-- Orders Above Category Average Sales
SELECT *
FROM SampleSuperstore s
WHERE Sales > (
    SELECT AVG(Sales)
    FROM SampleSuperstore
    WHERE Category = s.Category
);

-- Profit Ratio by Category
SELECT Category,
       SUM(Profit) / SUM(Sales) AS Profit_Ratio
FROM SampleSuperstore
GROUP BY Category;