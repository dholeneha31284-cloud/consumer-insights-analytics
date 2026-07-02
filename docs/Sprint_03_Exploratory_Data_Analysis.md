Sprint 3 – Exploratory Data Analysis
Project

Consumer Insights Analytics

Sprint Objective

The objective of Sprint 3 is to perform Exploratory Data Analysis (EDA) on the customer survey dataset. EDA helps analysts understand the quality, structure, and characteristics of the data before moving to SQL analytics, dashboarding, machine learning, or predictive modeling.

The analysis focuses on:

Understanding dataset structure
Verifying data quality
Identifying missing and duplicate records
Exploring customer demographics
Understanding customer satisfaction
Finding relationships between variables
Detecting unusual observations (outliers)
Generating initial business insights
Notebook
notebooks/
└── 01_Exploratory_Data_Analysis.ipynb
Section 1 – Import Libraries
Purpose

This section imports all Python libraries required for performing exploratory analysis and data visualization.

Code
import sqlite3
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
Explanation

sqlite3

Connects Python with the SQLite database.
Allows SQL queries to retrieve data from the project database.

Without this library, Python cannot access the database tables.

NumPy

Used for numerical computation.

Examples:

Statistical calculations
Numerical arrays
Mathematical operations

NumPy is the foundation of most Python data science libraries.

Pandas

Pandas provides the DataFrame object used throughout the notebook.

Responsibilities:

Reading SQL tables
Data manipulation
Filtering
Grouping
Aggregation
Missing value analysis

Nearly every EDA task uses Pandas.

Matplotlib

Used for creating visualizations.

Examples:

Histograms
Scatter plots
Bar charts
Box plots

Visualization helps analysts understand patterns much faster than raw tables.

Display Options
pd.set_option(...)

Purpose:

Improve notebook readability by displaying more rows and columns.

Without these settings, Pandas truncates large outputs.

Section 2 – Load Dataset
Purpose

This section connects to the SQLite database and loads all project tables into Pandas DataFrames.

Database Connection
conn = sqlite3.connect(DATABASE)

Explanation:

Creates a connection between Python and the SQLite database.

The connection remains active while the notebook executes SQL queries.

Load Customers Table
customers = pd.read_sql(...)

Purpose

Loads customer demographic information.

Business information includes:

Age
Gender
City
Region
Occupation
Income Bracket
Customer Segment

This table represents customer master data.

Load Survey Responses

Purpose

Loads customer survey results.

Business metrics include:

Brand Awareness
Brand Recall
Product Quality
Service Quality
Customer Satisfaction
Purchase Intent

This is the primary analytical dataset.

Load Campaign Exposure

Purpose

Stores campaign participation information.

Contains:

Campaign Exposure
Campaign Response

Useful for marketing effectiveness analysis.

Load Campaign Master

Purpose

Stores campaign metadata.

Examples:

Campaign Name
Marketing Channel

Useful for joining campaign details later.

Section 3 – Basic Data Inspection
Purpose

Before analyzing the data, analysts verify that the tables were loaded correctly.

Dataset Shape
customers.shape

Returns

(rows, columns)

Example

5000 rows
9 columns

Business importance

Confirms expected dataset size.

Unexpected row counts usually indicate ETL problems.

First Five Records
customers.head()

Purpose

Displays sample records.

Analysts verify:

Column names
Data values
Formatting
Unexpected NULLs

This is the first visual inspection of the dataset.

Section 4 – Data Quality Assessment
Purpose

Understand the schema before analysis.

info()
customers.info()

Provides:

Total records
Non-null counts
Data types
Memory usage

Business importance

Immediately reveals:

Missing values
Incorrect datatypes
Import issues
dtypes

Shows each column's datatype.

Examples

Age → Integer

Gender → Object

Survey_Date → Datetime

Customer_Satisfaction → Float

Correct data types are essential because:

Numeric columns support calculations
Dates enable time-series analysis
Strings support grouping and filtering
Section 5 – Missing Value Analysis
Purpose

Determine whether important business information is missing.

Missing values can affect:

Reports
Dashboards
Machine Learning models

We calculate both:

Number of missing values
Percentage of missing values

This helps determine whether cleaning or imputation is required.

Section 6 – Duplicate Record Analysis
Purpose

Identify duplicate observations.

Duplicate records can:

Inflate KPIs
Distort averages
Mislead customer counts

Using:

duplicated().sum()

ensures that each customer or survey response is counted only once.

Section 7 – Univariate Analysis
Purpose

Study one variable at a time to understand its distribution.

Age Distribution

Histogram shows:

Younger vs older customers
Central tendency
Spread
Skewness

Business value:

Helps identify the dominant customer age group.

Gender Distribution

Bar chart displays the number of customers by gender.

Business value:

Evaluates whether customer demographics are balanced.

Region Distribution

Shows customer concentration across regions.

Business value:

Supports regional marketing and sales planning.

Income Bracket

Displays the distribution of customers across income categories.

Business value:

Helps understand purchasing power and supports customer segmentation.

Customer Satisfaction

Histogram shows how satisfaction scores are distributed.

Business value:

Identifies whether customers are generally satisfied or dissatisfied.

Section 8 – Bivariate Analysis
Purpose

Study relationships between two variables.

Merge Operation

Customer and survey tables are merged using:

Customer_ID

This creates a single analytical dataset for combined analysis.

Age vs Customer Satisfaction

Scatter plot examines whether customer age influences satisfaction.

Business value:

Identifies age-related satisfaction trends.

Gender vs Satisfaction

Calculates average satisfaction for each gender.

Business value:

Highlights any demographic differences in customer experience.

Income Bracket vs Satisfaction

Compares satisfaction across income groups.

Business value:

Shows whether different income segments perceive the brand differently.

Section 9 – Correlation Analysis
Purpose

Measure the strength of linear relationships among numerical variables.

Correlation values range from:

+1: Perfect positive relationship
0: No linear relationship
−1: Perfect negative relationship

The heatmap provides a quick visual summary of these relationships.

Business value:

Helps identify variables that move together and informs feature selection for predictive models.

Section 10 – Outlier Detection
Purpose

Identify unusually high or low values using box plots.

Outliers may represent:

Data entry errors
Exceptional customers
Genuine business anomalies

Business value:

Ensures that unusual observations are investigated before analysis or modeling.

Section 11 – Business Insights
Purpose

Translate technical findings into business observations.

Examples:

Customer data quality is good.
Satisfaction is generally high.
Customer distribution varies by region.
Income segments show slight differences in satisfaction.

These insights guide business decisions and future analyses.

Section 12 – EDA Summary
Purpose

Summarize the key outcomes of the exploratory analysis.

The summary confirms whether the dataset is suitable for:

SQL analytics
Dashboard development
Customer segmentation
Machine learning
Predictive modeling

It also highlights any data quality issues that should be addressed in later sprints.

Sprint Outcome

At the end of Sprint 3, the project has:

Verified the integrity of the datasets.
Assessed data quality.
Explored customer demographics and survey responses.
Identified missing values, duplicates, and outliers.
Generated initial business insights.
Confirmed that the dataset is ready for advanced analytics in the next sprint.