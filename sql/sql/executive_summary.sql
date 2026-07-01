-- ============================================================
-- Executive Summary
-- Consumer Insights Analytics
-- Sprint 2
-- ============================================================

SELECT
    (SELECT COUNT(*) FROM customers) AS Total_Customers,

    (SELECT ROUND(AVG(Customer_Satisfaction),2)
     FROM survey_responses) AS Avg_Customer_Satisfaction,

    (SELECT ROUND(AVG(Recommend_Brand),2)
     FROM survey_responses) AS Avg_NPS,

    (SELECT COUNT(*)
     FROM campaign_exposure
     WHERE Campaign_Response='Positive') AS Positive_Responses,

    (SELECT COUNT(*)
     FROM campaign_exposure
     WHERE Campaign_Response='Negative') AS Negative_Responses,

    (SELECT COUNT(*)
     FROM campaigns) AS Total_Campaigns;