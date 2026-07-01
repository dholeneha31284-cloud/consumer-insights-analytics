-- ============================================================
-- Customer Analytics Queries
-- Consumer Insights Analytics
-- Sprint 2
-- ============================================================

---------------------------------------------------------------
-- 1. Total Customers
---------------------------------------------------------------

SELECT COUNT(*) AS Total_Customers
FROM customers;

---------------------------------------------------------------
-- 2. Customers by Region
---------------------------------------------------------------

SELECT
    Region,
    COUNT(*) AS Customer_Count
FROM customers
GROUP BY Region
ORDER BY Customer_Count DESC;

---------------------------------------------------------------
-- 3. Customers by Gender
---------------------------------------------------------------

SELECT
    Gender,
    COUNT(*) AS Customer_Count
FROM customers
GROUP BY Gender
ORDER BY Customer_Count DESC;

---------------------------------------------------------------
-- 4. Customers by Education
---------------------------------------------------------------

SELECT
    Education,
    COUNT(*) AS Customer_Count
FROM customers
GROUP BY Education
ORDER BY Customer_Count DESC;

---------------------------------------------------------------
-- 5. Customers by Occupation
---------------------------------------------------------------

SELECT
    Occupation,
    COUNT(*) AS Customer_Count
FROM customers
GROUP BY Occupation
ORDER BY Customer_Count DESC;

---------------------------------------------------------------
-- 6. Customers by Income Bracket
---------------------------------------------------------------

SELECT
    Income_Bracket,
    COUNT(*) AS Customer_Count
FROM customers
GROUP BY Income_Bracket
ORDER BY Customer_Count DESC;

---------------------------------------------------------------
-- 7. Customers by Customer Segment
---------------------------------------------------------------

SELECT
    Customer_Segment,
    COUNT(*) AS Customer_Count
FROM customers
GROUP BY Customer_Segment
ORDER BY Customer_Count DESC;

---------------------------------------------------------------
-- 8. Average Age by Customer Segment
---------------------------------------------------------------

SELECT
    Customer_Segment,
    ROUND(AVG(Age),2) AS Average_Age
FROM customers
GROUP BY Customer_Segment
ORDER BY Average_Age DESC;