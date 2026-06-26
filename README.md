# 📊 Amazon Order Performance Dashboard

An end-to-end **Data Analytics Project** that analyzes Amazon order data using **Python, SQL, Excel, and Power BI** to generate meaningful business insights. The project focuses on data cleaning, exploratory data analysis (EDA), SQL-based business queries, interactive dashboards, and strategic recommendations for decision-making.

---

## 📌 Project Overview

The objective of this project is to analyze Amazon order data and identify:

- Sales performance
- Revenue trends
- Customer purchasing behavior
- Geographic distribution of orders
- Fulfillment performance
- Product category analysis
- Business insights and recommendations

The project follows a complete data analytics workflow from raw data to business reporting.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Python** | Data Cleaning, Preprocessing, EDA |
| **SQL (MySQL)** | Business Queries & Data Aggregation |
| **Excel** | Pivot Tables, Charts & Initial Analysis |
| **Power BI** | Interactive Dashboard & KPIs |

### Python Libraries

- Pandas
- NumPy
- Matplotlib
- Seaborn
- OpenPyXL

---

## 📂 Dataset

- **Dataset:** Amazon Orders Dataset
- **Records:** ~125,000 Orders
- **Categories:** 9
- **States:** 47
- **Product Sizes:** 11

### Dataset Features

- Order ID
- Order Date
- Status
- Fulfillment
- SKU
- Category
- Size
- Quantity
- Amount
- Ship City
- Ship State
- Courier Status
- Promotion
- B2B

---

# 📈 Project Workflow

```
Raw Dataset
      │
      ▼
Python Data Cleaning
      │
      ▼
Exploratory Data Analysis (EDA)
      │
      ▼
SQL Business Queries
      │
      ▼
Excel Pivot Tables & Charts
      │
      ▼
Power BI Dashboard
      │
      ▼
Insights & Strategy Report
```

---

# 📁 Project Structure

```
Amazon-Order-Performance-Dashboard
│
├── data
│   ├── Amazon dataset.csv
│   └── cleaned Amazon dataset.csv
│
├── python
│   └── Data_Cleaning.py
│
├── sql
│   └── Queries.sql
│
├── excel
│   └── amazon eda.xlsx
│
├── powerbi
│   └── Amazon_Dashboard.pbix
│
├── reports
│   ├── Insights_Report.pdf
│   └── Amazon_Project_Presentation.pptx
│
├── Preview-Images
│   ├── Dashboard.png
│   ├── orders_analysis.png
│   └── revenue_analysis.png
│
├── README.md
├── .gitignore
└── LICENSE
```

---

# 🧹 Data Cleaning

The following preprocessing steps were performed using Python:

- Removed duplicate records
- Handled missing values
- Removed unnecessary columns
- Standardized categorical values
- Converted Date columns
- Created Month, Year, and Day columns
- Treated outliers using IQR
- Exported cleaned dataset

---

# 📊 Exploratory Data Analysis (EDA)

Performed using Python and Excel.

Analysis includes:

- Product Category Distribution
- Product Size Distribution
- Order Status Distribution
- Top Cities by Orders
- Top States by Orders
- Monthly Revenue Trend
- Category vs Size Analysis
- Correlation Analysis

---

# 🗄️ SQL Analysis

Business questions answered:

- Top Revenue Categories
- Top Revenue States
- Top Revenue Cities
- Orders by Category
- Orders by State
- Revenue Trend
- Fulfillment Analysis
- Promotion Analysis
- Cancellation Analysis
- Product Size Distribution

---

# 📈 Power BI Dashboard

Dashboard Pages

### Executive Overview

- Total Orders
- Total Revenue
- Average Order Value
- Category Distribution
- Status Distribution
- Revenue by Category

### Orders Analysis

- Orders by Category
- Orders by Size
- Top States
- Top Cities
- Fulfillment Distribution

### Revenue Analysis

- Monthly Revenue Trend
- Revenue by Category
- Revenue by State
- Revenue by City

### Operational Insights

- Cancellation Analysis
- Promotion Analysis
- Ship Service Analysis
- Category vs Size

### Detailed Orders Explorer

- Interactive Order Table
- Dynamic Filters
- Drill-down Analysis

---

# 📌 Key KPIs

| KPI | Value |
|------|-------|
| Total Orders | 125K |
| Total Revenue | ₹77.40 Million |
| Average Order Value | ₹620.26 |
| Product Categories | 9 |
| States Covered | 47 |
| Product Sizes | 11 |

---

# 📌 Key Business Insights

- Set category generated the highest revenue.
- Kurta category recorded the highest number of orders.
- Maharashtra generated the highest sales.
- Bengaluru was the top-performing city.
- Amazon Fulfillment handled nearly 70% of all orders.
- Most orders were successfully shipped.
- Revenue peaked during April.

---

# 💡 Strategic Recommendations

- Increase inventory for high-performing categories.
- Expand marketing campaigns in top-performing states.
- Reduce cancellation rates through better inventory planning.
- Continue using Amazon Fulfillment for operational efficiency.
- Improve promotional strategies using historical sales data.
