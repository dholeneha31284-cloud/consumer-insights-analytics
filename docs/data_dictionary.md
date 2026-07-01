# Data Dictionary

## customers.csv

| Column           | Data Type | Description                |
| ---------------- | --------- | -------------------------- |
| Customer_ID      | String    | Unique customer identifier |
| Age              | Integer   | Customer age in years      |
| Gender           | String    | Customer gender            |
| City             | String    | Customer city              |
| Region           | String    | Geographic region          |
| Education        | String    | Highest education level    |
| Occupation       | String    | Customer occupation        |
| Income_Bracket   | String    | Income category            |
| Customer_Segment | String    | Customer classification    |

---

## survey_responses.csv

| Column                | Data Type | Description                   |
| --------------------- | --------- | ----------------------------- |
| Survey_ID             | String    | Unique survey identifier      |
| Customer_ID           | String    | Customer identifier           |
| Survey_Date           | Date      | Survey completion date        |
| Brand_Awareness       | String    | Awareness of the brand        |
| Brand_Recall          | String    | Brand recalled by customer    |
| Brand_Preference      | String    | Preferred brand               |
| Product_Quality       | Integer   | Rating from 1 to 5            |
| Service_Quality       | Integer   | Rating from 1 to 5            |
| Value_for_Money       | Integer   | Rating from 1 to 5            |
| Customer_Satisfaction | Integer   | Overall satisfaction rating   |
| Recommend_Brand       | Integer   | Recommendation score (0–10)   |
| Purchase_Intent       | String    | Likelihood of future purchase |

---

## campaigns.csv

| Column        | Data Type | Description         |
| ------------- | --------- | ------------------- |
| Campaign_ID   | String    | Campaign identifier |
| Campaign_Name | String    | Campaign name       |
| Channel       | String    | Marketing channel   |

---

## campaign_exposure.csv

| Column            | Data Type | Description                          |
| ----------------- | --------- | ------------------------------------ |
| Exposure_ID       | String    | Exposure identifier                  |
| Customer_ID       | String    | Customer identifier                  |
| Campaign_ID       | String    | Campaign identifier                  |
| Campaign_Exposure | String    | Whether customer viewed the campaign |
| Campaign_Response | String    | Customer response after exposure     |
