
"""
Consumer Insights Analytics
Sprint 1 - Synthetic Dataset Generator
"""

from pathlib import Path
from datetime import datetime, timedelta
import random
import numpy as np
import pandas as pd

RANDOM_SEED = 42
NUM_CUSTOMERS = 15000

random.seed(RANDOM_SEED)
np.random.seed(RANDOM_SEED)

PROJECT_ROOT = Path(__file__).resolve().parent.parent
RAW = PROJECT_ROOT / "data" / "raw"
RAW.mkdir(parents=True, exist_ok=True)

CITY_REGION = {
    "Mumbai":"West","Pune":"West","Ahmedabad":"West","Surat":"West",
    "Bengaluru":"South","Hyderabad":"South","Chennai":"South","Kochi":"South",
    "Delhi":"North","Jaipur":"North","Lucknow":"North","Chandigarh":"North",
    "Kolkata":"East","Bhubaneswar":"East","Patna":"East","Guwahati":"East"
}

EDUCATION=["High School","Diploma","Bachelor","Master","Doctorate"]
OCCUPATIONS=["Student","Private Employee","Government Employee","Business Owner",
             "Self-Employed","Healthcare Professional","Teacher",
             "Engineer","IT Professional","Retired"]
INCOME=["Low","Medium","High"]
SEGMENTS=["New","Regular","Premium"]
GENDERS=["Male","Female","Other"]
BRANDS=["NovaMart","UrbanCart","ValueHub","ShopEase","MegaMart"]
CHANNELS=["Email","SMS","Social Media","Television","Digital Ads"]
INTENTS=["Very Low","Low","Medium","High","Very High"]

def generate_customers():
    rows=[]
    cities=list(CITY_REGION.keys())
    for i in range(1,NUM_CUSTOMERS+1):
        city=random.choice(cities)
        rows.append({
            "Customer_ID":f"CUST{i:05d}",
            "Age":random.randint(18,65),
            "Gender":random.choices(GENDERS,[49,49,2])[0],
            "City":city,
            "Region":CITY_REGION[city],
            "Education":random.choices(EDUCATION,[15,20,35,25,5])[0],
            "Occupation":random.choice(OCCUPATIONS),
            "Income_Bracket":random.choices(INCOME,[35,45,20])[0],
            "Customer_Segment":random.choices(SEGMENTS,[30,50,20])[0]
        })
    df=pd.DataFrame(rows)
    df.to_csv(RAW/"customers.csv",index=False)
    return df

def generate_campaigns():
    df=pd.DataFrame([
        ["C001","Summer Savings","Social Media"],
        ["C002","Festive Offers","Email"],
        ["C003","Cashback Campaign","Television"],
        ["C004","Loyalty Rewards","SMS"],
        ["C005","Referral Drive","Digital Ads"],
    ],columns=["Campaign_ID","Campaign_Name","Channel"])
    df.to_csv(RAW/"campaigns.csv",index=False)
    return df

def generate_surveys(customers):
    rows=[]
    start=datetime(2025,1,1)
    for idx,c in customers.iterrows():
        pq=np.clip(int(np.random.normal(3.8,0.9)),1,5)
        sq=np.clip(int(np.random.normal(pq,0.8)),1,5)
        vm=np.clip(int(np.random.normal((pq+sq)/2,0.8)),1,5)
        cs=max(1,min(5,round((pq+sq+vm)/3)))
        nps=max(0,min(10,int(cs*2+np.random.randint(-1,2))))
        rows.append({
            "Survey_ID":f"SURV{idx+1:05d}",
            "Customer_ID":c.Customer_ID,
            "Survey_Date":(start+timedelta(days=random.randint(0,365))).date(),
            "Brand_Awareness":random.choices(["Yes","No"],[85,15])[0],
            "Brand_Recall":random.choice(BRANDS),
            "Brand_Preference":random.choice(BRANDS),
            "Product_Quality":pq,
            "Service_Quality":sq,
            "Value_for_Money":vm,
            "Customer_Satisfaction":cs,
            "Recommend_Brand":nps,
            "Purchase_Intent":INTENTS[min(cs-1,4)]
        })
    df=pd.DataFrame(rows)
    df.to_csv(RAW/"survey_responses.csv",index=False)
    return df

def generate_exposure(customers):
    rows=[]
    for idx,c in customers.iterrows():
        exposed=random.choices(["Yes","No"],[70,30])[0]
        rows.append({
            "Exposure_ID":f"EXP{idx+1:05d}",
            "Customer_ID":c.Customer_ID,
            "Campaign_ID":f"C00{random.randint(1,5)}",
            "Campaign_Exposure":exposed,
            "Campaign_Response":random.choices(
                ["Positive","Neutral","Negative"],
                [55,30,15] if exposed=="Yes" else [20,50,30]
            )[0]
        })
    df=pd.DataFrame(rows)
    df.to_csv(RAW/"campaign_exposure.csv",index=False)
    return df

if __name__=="__main__":
    print("Generating datasets...")
    c=generate_customers()
    generate_campaigns()
    generate_surveys(c)
    generate_exposure(c)
    print("Done.")
    print(RAW)
