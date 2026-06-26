import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#importing Dataset
df=pd.read_csv("D:\Agileology Notes\DA\Final Project\Amazon dataset.csv",encoding="latin1",low_memory=False)
#print(df)
#print(df.to_string())
#print(df.info())
#print(df.columns)
#print(df.head())

#Remove columns
df.drop(columns=['Unnamed: 22'], inplace=True)
df.drop(columns=['index'], inplace=True)
#print(df.isnull().sum())
#print(df.info())

#Filling missing values
med=df['Amount'].median()
df.fillna({"Amount":med},inplace=True)
#print(df.info())
text_columns = ['Courier Status', 'ship-city', 'ship-state', 'ship-postal-code', 'ship-country', 'fulfilled-by']

for col in text_columns:
    if col in df.columns:
        df[col] = df[col].fillna(df[col].mode()[0])

df.dropna(subset=['SKU','Category','Size','ASIN','Qty','B2B'],inplace=True)
df.fillna({"promotion-ids":"No Promotion"},inplace=True)
df.fillna({"currency":"INR"},inplace=True)

#Removing duplicates
df.drop_duplicates(inplace=True)

#Standardization
df['Category']=df['Category'].str.title()
df['Size']=df['Size'].str.upper()

text_cols = ['Category', 'Size', 'Status', 'ship-city', 'ship-state']

for col in text_cols:
    if col in df.columns:
        df[col] = df[col].astype(str).str.strip().str.lower()
#print(df.info())
#print(df.isnull().sum())

#Date Conversion
df["Date"] = pd.to_datetime(df["Date"],format="%m-%d-%y",errors="coerce")

#Derived Columns
df['Month'] = df['Date'].dt.month
df['Month_Name'] = df['Date'].dt.month_name()
df['Year'] = df['Date'].dt.year
df['Day'] = df['Date'].dt.day

#Handling Outliers
Q1 = df['Amount'].quantile(0.25)
Q3 = df['Amount'].quantile(0.75)

IQR = Q3 - Q1

lower_limit = Q1 - 1.5 * IQR
upper_limit = Q3 + 1.5 * IQR

df = df[(df['Amount'] >= lower_limit) &
        (df['Amount'] <= upper_limit)]
#print(df.info())
#print(df['currency'].value_counts(dropna=False))
#print(df['ship-country'].value_counts(dropna=False))
#print(df['fulfilled-by'].value_counts(dropna=False))
df.drop(columns=['ship-country'], inplace=True)
df.drop(columns=['currency'], inplace=True)
df.drop(columns=['fulfilled-by'], inplace=True)
#print(df.info())

#Export Cleaned Dataset
df.to_csv("D:/Agileology Notes/DA/Final Project/cleaned Amazon dataset.csv")

#EDA Visualizations
'''
sns.set(style="whitegrid")

#1. CATEGORY DISTRIBUTION
plt.figure(figsize=(10,6))
sns.countplot(data=df, y='Category',order=df['Category'].value_counts().index)
plt.title("Product Category Distribution")
plt.xlabel("Count")
plt.ylabel("Category")
plt.show()


#2.PRODUCT SIZE DISTRIBUTION
plt.figure(figsize=(10,6))
sns.countplot(data=df, x='Size',order=df['Size'].value_counts().index)
plt.title("Product Size Distribution")
plt.xticks(rotation=45)
plt.show()

#3.ORDER STATUS DISTRIBUTION
plt.figure(figsize=(12,6))
sns.countplot(data=df, x='Status',order=df['Status'].value_counts().index)
plt.title("Order Status Distribution")
plt.xticks(rotation=90)
plt.show()

#4.TOP 10 SHIP CITIES
top_cities = df['ship-city'].value_counts().head(10)
plt.figure(figsize=(12,6))
sns.barplot(x=top_cities.index, y=top_cities.values)
plt.title("Top 10 Ship Cities")
plt.xticks(rotation=45)
plt.ylabel("Order Count")
plt.show()

#5.TOP 10 STATES
top_states = df['ship-state'].value_counts().head(10)
plt.figure(figsize=(12,6))
sns.barplot(x=top_states.index, y=top_states.values)
plt.title("Top 10 Ship States")
plt.xticks(rotation=45)
plt.ylabel("Order Count")
plt.show()

#6.CATEGORY VS SIZE
plt.figure(figsize=(12,8))
sns.countplot(data=df,x='Category',hue='Size')
plt.title("Category vs Size")
plt.xticks(rotation=45)
plt.show()

#7.MONTHLY SALES TREND
monthly_sales = df.groupby('Month_Name')['Amount'].sum()
plt.figure(figsize=(12,6))
monthly_sales.plot(marker='o')
plt.title("Monthly Revenue Trend")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.grid(True)
plt.show()

#8.HEATMAP CORRELATION
numeric_df = df[['Qty', 'Amount']]
plt.figure(figsize=(6,4))
sns.heatmap(numeric_df.corr(),annot=True,cmap='coolwarm')
plt.title("Correlation Heatmap")
plt.show()
'''
