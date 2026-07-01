-- ============================================================
-- Advanced SQL Queries
-- Consumer Insights Analytics
-- Sprint 2
-- ============================================================

---------------------------------------------------------------
-- 1. Top 5 Oldest Customers
---------------------------------------------------------------

SELECT
    Customer_ID,
    Age,
    ROW_NUMBER() OVER (ORDER BY Age DESC) AS Row_Num
FROM customers
LIMIT 5;

---------------------------------------------------------------
-- 2. Rank Regions by Average Customer Satisfaction
---------------------------------------------------------------

SELECT
    Region,
    Avg_Satisfaction,
    RANK() OVER (ORDER BY Avg_Satisfaction DESC) AS Region_Rank
FROM
(
    SELECT
        c.Region,
        ROUND(AVG(s.Customer_Satisfaction),2) AS Avg_Satisfaction
    FROM customers c
    INNER JOIN survey_responses s
        ON c.Customer_ID = s.Customer_ID
    GROUP BY c.Region
);

---------------------------------------------------------------
-- 3. Dense Rank Cities by Average Satisfaction
---------------------------------------------------------------

SELECT
    City,
    Avg_Satisfaction,
    DENSE_RANK() OVER (ORDER BY Avg_Satisfaction DESC) AS City_Rank
FROM
(
    SELECT
        c.City,
        ROUND(AVG(s.Customer_Satisfaction),2) AS Avg_Satisfaction
    FROM customers c
    JOIN survey_responses s
      ON c.Customer_ID = s.Customer_ID
    GROUP BY c.City
);

---------------------------------------------------------------
-- 4. Running Average of Satisfaction
---------------------------------------------------------------

SELECT
    Survey_Date,
    Customer_Satisfaction,
    ROUND(
        AVG(Customer_Satisfaction)
        OVER (
            ORDER BY Survey_Date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),2
    ) AS Running_Avg_Satisfaction
FROM survey_responses;

---------------------------------------------------------------
-- 5. Previous Customer Satisfaction (LAG)
---------------------------------------------------------------

SELECT
    Customer_ID,
    Survey_Date,
    Customer_Satisfaction,
    LAG(Customer_Satisfaction)
    OVER (
        PARTITION BY Customer_ID
        ORDER BY Survey_Date
    ) AS Previous_Satisfaction
FROM survey_responses;

---------------------------------------------------------------
-- 6. Next Customer Satisfaction (LEAD)
---------------------------------------------------------------

SELECT
    Customer_ID,
    Survey_Date,
    Customer_Satisfaction,
    LEAD(Customer_Satisfaction)
    OVER (
        PARTITION BY Customer_ID
        ORDER BY Survey_Date
    ) AS Next_Satisfaction
FROM survey_responses;

---------------------------------------------------------------
-- 7. Common Table Expression (CTE)
---------------------------------------------------------------

WITH RegionSummary AS
(
    SELECT
        c.Region,
        ROUND(AVG(s.Customer_Satisfaction),2) AS Avg_Satisfaction
    FROM customers c
    JOIN survey_responses s
      ON c.Customer_ID = s.Customer_ID
    GROUP BY c.Region
)

SELECT *
FROM RegionSummary
ORDER BY Avg_Satisfaction DESC;

---------------------------------------------------------------
-- 8. High Satisfaction Customers
---------------------------------------------------------------

SELECT
    Customer_ID,
    Customer_Satisfaction
FROM survey_responses
WHERE Customer_Satisfaction =
(
    SELECT MAX(Customer_Satisfaction)
    FROM survey_responses
);

---------------------------------------------------------------
-- 9. Customer Classification
---------------------------------------------------------------

SELECT
    Customer_ID,
    Customer_Satisfaction,
    CASE
        WHEN Customer_Satisfaction >= 4 THEN 'Satisfied'
        WHEN Customer_Satisfaction = 3 THEN 'Neutral'
        ELSE 'Dissatisfied'
    END AS Customer_Category
FROM survey_responses;

---------------------------------------------------------------
-- 10. Top 10 Customers by Recommendation Score
---------------------------------------------------------------

SELECT
    Customer_ID,
    Recommend_Brand
FROM survey_responses
ORDER BY Recommend_Brand DESC
LIMIT 10;