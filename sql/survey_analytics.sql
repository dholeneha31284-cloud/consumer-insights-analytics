-- ============================================================
-- Survey Analytics Queries
-- Consumer Insights Analytics
-- Sprint 2
-- ============================================================

---------------------------------------------------------------
-- 1. Average Customer Satisfaction
---------------------------------------------------------------

SELECT
    ROUND(AVG(Customer_Satisfaction),2) AS Avg_Customer_Satisfaction
FROM survey_responses;

---------------------------------------------------------------
-- 2. Average Product Quality Rating
---------------------------------------------------------------

SELECT
    ROUND(AVG(Product_Quality),2) AS Avg_Product_Quality
FROM survey_responses;

---------------------------------------------------------------
-- 3. Average Service Quality Rating
---------------------------------------------------------------

SELECT
    ROUND(AVG(Service_Quality),2) AS Avg_Service_Quality
FROM survey_responses;

---------------------------------------------------------------
-- 4. Average Value for Money Rating
---------------------------------------------------------------

SELECT
    ROUND(AVG(Value_for_Money),2) AS Avg_Value_For_Money
FROM survey_responses;

---------------------------------------------------------------
-- 5. Average Recommendation Score (NPS)
---------------------------------------------------------------

SELECT
    ROUND(AVG(Recommend_Brand),2) AS Avg_NPS
FROM survey_responses;

---------------------------------------------------------------
-- 6. Brand Awareness Distribution
---------------------------------------------------------------

SELECT
    Brand_Awareness,
    COUNT(*) AS Respondents
FROM survey_responses
GROUP BY Brand_Awareness;

---------------------------------------------------------------
-- 7. Brand Preference Distribution
---------------------------------------------------------------

SELECT
    Brand_Preference,
    COUNT(*) AS Customers
FROM survey_responses
GROUP BY Brand_Preference
ORDER BY Customers DESC;

---------------------------------------------------------------
-- 8. Brand Recall Distribution
---------------------------------------------------------------

SELECT
    Brand_Recall,
    COUNT(*) AS Customers
FROM survey_responses
GROUP BY Brand_Recall
ORDER BY Customers DESC;

---------------------------------------------------------------
-- 9. Purchase Intent Distribution
---------------------------------------------------------------

SELECT
    Purchase_Intent,
    COUNT(*) AS Customers
FROM survey_responses
GROUP BY Purchase_Intent
ORDER BY Customers DESC;

---------------------------------------------------------------
-- 10. Satisfaction Category
---------------------------------------------------------------

SELECT
CASE
    WHEN Customer_Satisfaction >= 4 THEN 'Satisfied'
    WHEN Customer_Satisfaction = 3 THEN 'Neutral'
    ELSE 'Dissatisfied'
END AS Satisfaction_Level,
COUNT(*) AS Customers
FROM survey_responses
GROUP BY Satisfaction_Level
ORDER BY Customers DESC;