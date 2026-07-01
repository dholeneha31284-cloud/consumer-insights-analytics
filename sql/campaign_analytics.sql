-- ============================================================
-- Campaign Analytics Queries
-- Consumer Insights Analytics
-- Sprint 2
-- ============================================================

---------------------------------------------------------------
-- 1. Total Customers Exposed to Campaigns
---------------------------------------------------------------

SELECT
    Campaign_Exposure,
    COUNT(*) AS Customer_Count
FROM campaign_exposure
GROUP BY Campaign_Exposure;

---------------------------------------------------------------
-- 2. Campaign Response Distribution
---------------------------------------------------------------

SELECT
    Campaign_Response,
    COUNT(*) AS Customer_Count
FROM campaign_exposure
GROUP BY Campaign_Response
ORDER BY Customer_Count DESC;

---------------------------------------------------------------
-- 3. Campaign Performance
---------------------------------------------------------------

SELECT
    c.Campaign_Name,
    COUNT(*) AS Total_Customers
FROM campaign_exposure ce
INNER JOIN campaigns c
ON ce.Campaign_ID = c.Campaign_ID
GROUP BY c.Campaign_Name
ORDER BY Total_Customers DESC;

---------------------------------------------------------------
-- 4. Positive Responses by Campaign
---------------------------------------------------------------

SELECT
    c.Campaign_Name,
    COUNT(*) AS Positive_Response
FROM campaign_exposure ce
INNER JOIN campaigns c
ON ce.Campaign_ID = c.Campaign_ID
WHERE Campaign_Response='Positive'
GROUP BY c.Campaign_Name
ORDER BY Positive_Response DESC;

---------------------------------------------------------------
-- 5. Negative Responses by Campaign
---------------------------------------------------------------

SELECT
    c.Campaign_Name,
    COUNT(*) AS Negative_Response
FROM campaign_exposure ce
INNER JOIN campaigns c
ON ce.Campaign_ID = c.Campaign_ID
WHERE Campaign_Response='Negative'
GROUP BY c.Campaign_Name
ORDER BY Negative_Response DESC;

---------------------------------------------------------------
-- 6. Campaign Performance by Channel
---------------------------------------------------------------

SELECT
    c.Channel,
    COUNT(*) AS Customers_Reached
FROM campaign_exposure ce
INNER JOIN campaigns c
ON ce.Campaign_ID=c.Campaign_ID
GROUP BY c.Channel
ORDER BY Customers_Reached DESC;

---------------------------------------------------------------
-- 7. Positive Response Percentage
---------------------------------------------------------------

SELECT

ROUND(

100.0 *

SUM(
CASE
WHEN Campaign_Response='Positive'
THEN 1
ELSE 0
END
)

/

COUNT(*)

,2)

AS Positive_Response_Percentage

FROM campaign_exposure;

---------------------------------------------------------------
-- 8. Campaign Ranking
---------------------------------------------------------------

SELECT

Campaign_Name,

Customers,

RANK() OVER
(
ORDER BY Customers DESC
)

AS Campaign_Rank

FROM

(
SELECT

c.Campaign_Name,

COUNT(*) AS Customers

FROM campaign_exposure ce

INNER JOIN campaigns c

ON ce.Campaign_ID=c.Campaign_ID

GROUP BY c.Campaign_Name

);