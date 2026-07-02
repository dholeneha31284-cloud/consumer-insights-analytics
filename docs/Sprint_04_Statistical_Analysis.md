# Sprint 4 – Statistical Analysis

## Project

Consumer Insights Analytics

---

# Sprint Objective

The objective of Sprint 4 is to perform descriptive statistical analysis on the customer survey dataset after completing Exploratory Data Analysis (EDA).

While Sprint 3 focused on understanding the structure and quality of the data, Sprint 4 focuses on extracting measurable business insights through statistical techniques.

The analysis helps answer questions such as:

- What is the average customer satisfaction?
- Which customer groups are most satisfied?
- How do product quality and service quality influence customer satisfaction?
- Which customer segments contribute the most to the business?
- How effective are marketing campaigns?

The outputs generated in this sprint will be used in the next sprint for SQL analytics and dashboard development.

---

# Project Structure

```
consumer-insights-analytics/
│
├── notebooks/
│   └── 02_Statistical_Analysis.ipynb
│
├── docs/
│   └── Sprint_04_Statistical_Analysis.md
```

---

# Notebook Overview

The notebook is divided into twelve logical sections.

| Section | Description |
|---------|-------------|
| 1 | Import Libraries |
| 2 | Load Database |
| 3 | Merge Datasets |
| 4 | Descriptive Statistics |
| 5 | Distribution Analysis |
| 6 | Categorical Analysis |
| 7 | Customer Satisfaction Analysis |
| 8 | Campaign Analysis |
| 9 | Correlation Analysis |
|10 | Business KPIs |
|11 | Business Insights |
|12 | Sprint Summary |

---

# Section 1 – Import Libraries

## Objective

The first step in every analytics notebook is importing the required Python libraries.

These libraries provide functionality for:

- Database connectivity
- Numerical computations
- Data manipulation
- Statistical analysis
- Data visualization

Without these libraries, no analytical operations can be performed.

---

## Cell 1

```python
import sqlite3
```

### Purpose

Imports Python's built-in SQLite library.

### Why is it required?

The project stores all datasets inside an SQLite database.

This library allows Python to:

- Connect to the database
- Execute SQL queries
- Read tables into DataFrames

Without sqlite3, Python cannot access the project database.

---

## Cell 2

```python
import numpy as np
```

### Purpose

Imports NumPy.

### Why is it required?

NumPy provides efficient numerical computation.

It supports:

- Mathematical calculations
- Numerical arrays
- Statistical computations
- Scientific computing

Many Pandas operations internally rely on NumPy.

---

## Cell 3

```python
import pandas as pd
```

### Purpose

Imports Pandas.

### Why is it required?

Pandas is the primary data analysis library used throughout the project.

Responsibilities include:

- Reading SQL tables
- Creating DataFrames
- Data filtering
- Grouping
- Aggregation
- Statistical calculations

Almost every notebook cell uses Pandas.

---

## Cell 4

```python
import matplotlib.pyplot as plt
```

### Purpose

Imports Matplotlib.

### Why is it required?

Matplotlib creates visualizations.

Examples include:

- Histograms
- Bar Charts
- Scatter Plots
- Correlation Heatmaps

Visualizations help identify patterns that are difficult to observe in raw tables.

---

## Cell 5

```python
from pathlib import Path
```

### Purpose

Imports Path.

### Why is it required?

Instead of hardcoding file paths, Path creates operating-system-independent paths.

Benefits:

- Better portability
- Cleaner code
- Easier project maintenance

---

## Cell 6

```python
plt.style.use("default")
```

### Purpose

Applies the default plotting style.

### Why?

Ensures that all charts in the notebook use a consistent appearance.

---

## Cell 7

```python
pd.set_option(...)
```

### Purpose

Configures Pandas display settings.

### Benefits

- Displays all columns
- Displays more rows
- Improves notebook readability
- Prevents important columns from being hidden

---

# Section 2 – Load Database

## Objective

Before statistical analysis can begin, Python must establish a connection to the SQLite database and load all required tables.

---

## Cell 1

```python
PROJECT_ROOT = Path.cwd().parent
```

### Purpose

Identifies the root directory of the project.

### Why?

Allows the notebook to locate project resources without hardcoding paths.

---

## Cell 2

```python
DATABASE = PROJECT_ROOT / "data" / "database" / "consumer_insights.db"
```

### Purpose

Creates the complete database path.

### Why?

Makes the notebook portable across different systems.

---

## Cell 3

```python
conn = sqlite3.connect(DATABASE)
```

### Purpose

Creates a connection between Python and SQLite.

### Business Importance

This connection allows Python to execute SQL queries directly on the project database.

---

## Cell 4

```python
customers = pd.read_sql(...)
```

### Purpose

Loads the Customers table.

### Information Available

- Customer ID
- Age
- Gender
- Region
- Education
- Occupation
- Income Bracket
- Customer Segment

This table contains customer demographic information.

---

## Cell 5

```python
survey = pd.read_sql(...)
```

### Purpose

Loads customer survey responses.

Contains:

- Brand Awareness
- Brand Recall
- Product Quality
- Service Quality
- Customer Satisfaction
- Purchase Intent

This is the primary analytical table.

---

## Cell 6

```python
campaign = pd.read_sql(...)
```

### Purpose

Loads campaign exposure information.

Business use:

Allows analysis of customer exposure and campaign response.

---

## Cell 7

```python
campaigns = pd.read_sql(...)
```

### Purpose

Loads campaign master data.

Contains:

- Campaign Name
- Marketing Channel

Used later for campaign performance analysis.

---

# Section 3 – Merge Dataset

## Objective

Customer information and survey responses are stored in separate tables.

Statistical analysis requires both datasets to be combined.

---

## Cell 1

```python
df = customers.merge(
    survey,
    on="Customer_ID"
)
```

### Purpose

Merges the customer master table with survey responses.

### Join Key

Customer_ID

### Result

Creates one consolidated analytical dataset.

Business analysts now have access to:

- Customer demographics
- Survey responses
- Customer satisfaction
- Product ratings

within a single DataFrame.

---

## Cell 2

```python
df.head()
```

### Purpose

Displays the first five records.

### Why?

Verifies:

- Merge success
- Data accuracy
- Column names
- Data formatting

This is the first validation step after merging.

---

## Cell 3

```python
df.shape
```

### Purpose

Displays the number of rows and columns.

### Business Importance

Confirms that no records were lost during the merge operation.

---

## Cell 4

```python
df.columns
```

### Purpose

Lists every column available for analysis.

### Why?

Helps analysts identify available business attributes before statistical calculations.

---

## Cell 5

```python
df.info()
```

### Purpose

Displays:

- Number of records
- Data types
- Missing values
- Memory usage

### Business Importance

Confirms that the merged dataset is suitable for statistical analysis before moving to descriptive statistics.