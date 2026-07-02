# Sprint 2 – SQL Analytics

**Project:** Consumer Insights Analytics

**Sprint Duration:** Sprint 2

**Status:** Completed

---

# 1. Sprint Overview

Sprint 2 focuses on transforming the raw survey datasets into a structured relational database and performing analytical SQL to answer business questions related to customers, surveys, brands, and marketing campaigns.

The objective of this sprint is to create a reusable SQL layer that supports exploratory data analysis, statistical analysis, predictive modeling, and dashboard development in the subsequent sprints.

---

# 2. Business Background

NovaMart Retail conducts customer surveys across multiple cities to understand customer perception, brand performance, product quality, service quality, and campaign effectiveness.

Although survey responses are collected regularly, the business lacks a structured analytical environment that enables stakeholders to generate actionable insights.

This sprint establishes the SQL analytics foundation required for data-driven decision-making.

---

# 3. Sprint Objectives

The objectives of Sprint 2 are:

- Create a relational SQLite database.
- Load all project datasets into database tables.
- Perform customer analytics using SQL.
- Analyze survey responses.
- Evaluate marketing campaign performance.
- Generate executive-level summary metrics.
- Prepare structured data for Python analytics and Power BI reporting.

---

# 4. Database Architecture

The project uses SQLite as the analytical database.

Reasons for selecting SQLite include:

- Lightweight and portable.
- Easy integration with Python.
- Simple setup without server configuration.
- Suitable for analytics projects and portfolio demonstrations.

Database Name

consumer_insights.db

---

# 5. Database Schema

The database contains four relational tables.

customers

↓

survey_responses

↓

campaign_exposure

↓

campaigns

Customer_ID is used as the primary relationship between customer and survey datasets.

Campaign_ID links campaign exposure records to campaign master data.

---

# 6. Tables Created

## customers

Contains customer demographic information.

Important attributes include:

- Customer_ID
- Age
- Gender
- City
- Region
- Education
- Occupation
- Income_Bracket
- Customer_Segment

---

## survey_responses

Contains customer survey information.

Attributes include:

- Survey_ID
- Customer_ID
- Survey_Date
- Brand_Awareness
- Brand_Recall
- Brand_Preference
- Product_Quality
- Service_Quality
- Value_for_Money
- Customer_Satisfaction
- Recommend_Brand
- Purchase_Intent

---

## campaigns

Contains campaign master information.

Attributes:

- Campaign_ID
- Campaign_Name
- Channel

---

## campaign_exposure

Contains customer exposure and campaign response.

Attributes:

- Exposure_ID
- Customer_ID
- Campaign_ID
- Campaign_Exposure
- Campaign_Response

---

# 7. SQL Files Developed

The SQL implementation was organized into multiple files to improve readability and maintainability.

customer_analytics.sql

Purpose:

Customer demographics and segmentation analysis.

survey_analytics.sql

Purpose:

Customer satisfaction and survey response analysis.

campaign_analytics.sql

Purpose:

Campaign reach and effectiveness analysis.

advanced_sql.sql

Purpose:

Advanced analytical SQL using window functions and CTEs.

executive_summary.sql

Purpose:

Executive-level KPIs.

---

# 8. SQL Implementation

The SQL implementation includes the following analytical categories.

## Customer Analytics

Examples:

- Customer distribution
- Region-wise customer count
- Gender distribution
- Occupation analysis
- Income analysis
- Customer segment analysis

---

## Survey Analytics

Examples:

- Average customer satisfaction
- Average recommendation score
- Brand awareness
- Brand recall
- Brand preference
- Purchase intent distribution
- Product quality
- Service quality
- Value for money

---

## Campaign Analytics

Examples:

- Campaign reach
- Campaign response
- Positive responses
- Negative responses
- Channel performance
- Campaign ranking

---

## Advanced SQL

Implemented analytical SQL includes:

- CASE expressions
- Aggregate functions
- Subqueries
- Common Table Expressions (CTEs)
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LAG()
- LEAD()
- Running averages

---

# 9. Executive Summary

Executive summary queries were created to provide high-level business metrics, including:

- Total customers
- Average customer satisfaction
- Average recommendation score
- Positive campaign responses
- Negative campaign responses
- Total campaigns

---

# 10. Business Value

The SQL layer developed during this sprint enables stakeholders to:

- Understand customer demographics.
- Measure customer satisfaction.
- Evaluate campaign performance.
- Identify customer segments.
- Understand brand perception.
- Monitor executive KPIs.

---

# 11. Challenges

The primary challenges during this sprint included:

- Designing realistic analytical queries.
- Organizing SQL into logical business modules.
- Building reusable SQL scripts.
- Maintaining consistency across datasets.

---

# 12. Deliverables

Files completed during Sprint 2:

scripts/

- create_database.py

sql/

- customer_analytics.sql
- survey_analytics.sql
- campaign_analytics.sql
- advanced_sql.sql
- executive_summary.sql

Database

consumer_insights.db

---

# 13. Sprint Outcome

Sprint 2 successfully established the analytical SQL foundation for the Consumer Insights Analytics project.

The structured database and SQL queries created during this sprint will support all subsequent activities, including exploratory data analysis, statistical testing, predictive modeling, and dashboard development.

---

# 14. Next Sprint

Sprint 3 will focus on Exploratory Data Analysis (EDA), where the SQL outputs and database created in this sprint will be used to examine data quality, understand variable distributions, identify patterns, and generate initial business insights.