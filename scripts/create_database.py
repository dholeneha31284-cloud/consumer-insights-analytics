"""
Consumer Insights Analytics
Sprint 2

Create SQLite Database from CSV Files
"""

from pathlib import Path
import sqlite3
import pandas as pd

# -------------------------------------------------------
# Project Paths
# -------------------------------------------------------

PROJECT_ROOT = Path(__file__).resolve().parent.parent

RAW_DATA = PROJECT_ROOT / "data" / "raw"

DATABASE_FOLDER = PROJECT_ROOT / "data" / "database"
DATABASE_FOLDER.mkdir(exist_ok=True)

DATABASE = DATABASE_FOLDER / "consumer_insights.db"

# -------------------------------------------------------
# Connect Database
# -------------------------------------------------------

conn = sqlite3.connect(DATABASE)

print("=" * 60)
print("Creating Consumer Insights Database")
print("=" * 60)

# -------------------------------------------------------
# Load CSV Files
# -------------------------------------------------------

customers = pd.read_csv(RAW_DATA / "customers.csv")
survey = pd.read_csv(RAW_DATA / "survey_responses.csv")
campaigns = pd.read_csv(RAW_DATA / "campaigns.csv")
exposure = pd.read_csv(RAW_DATA / "campaign_exposure.csv")

# -------------------------------------------------------
# Write Tables
# -------------------------------------------------------

customers.to_sql(
    "customers",
    conn,
    if_exists="replace",
    index=False
)

survey.to_sql(
    "survey_responses",
    conn,
    if_exists="replace",
    index=False
)

campaigns.to_sql(
    "campaigns",
    conn,
    if_exists="replace",
    index=False
)

exposure.to_sql(
    "campaign_exposure",
    conn,
    if_exists="replace",
    index=False
)

# -------------------------------------------------------
# Verify Tables
# -------------------------------------------------------

tables = [
    "customers",
    "survey_responses",
    "campaigns",
    "campaign_exposure"
]

print()

for table in tables:

    count = pd.read_sql(
        f"SELECT COUNT(*) AS Total FROM {table}",
        conn
    )

    print(f"{table:<25}{count.iloc[0,0]:>10,}")

conn.close()

print()
print("Database Created Successfully")
print(DATABASE)
