use amazon_project;

#1. Which SKUs, Categories, and Sizes Generate the Most Net Sales?
SELECT SKU,SUM(Amount) AS Total_Sales,SUM(Qty) AS Total_Quantity
FROM amazon_data
GROUP BY SKU ORDER BY Total_Sales DESC;

SELECT Category, SUM(Amount) AS Sales_Amount, SUM(Qty) AS Total_Quantity
FROM amazon_data GROUP BY Category
ORDER BY Sales_Amount DESC;

SELECT Size, SUM(Amount) AS Sales_Amount, SUM(Qty) AS Total_Quantity
FROM amazon_data GROUP BY Size
ORDER BY Sales_Amount DESC;

#2.Top 5 States Based on Total Order Amount
SELECT `ship-state`,SUM(Amount) AS Total_Revenue
FROM amazon_data GROUP BY `ship-state`
ORDER BY Total_Revenue DESC LIMIT 5;

#3.Top 5 Cities Based on Total Order Amount
SELECT `ship-city`,SUM(Amount) AS Total_Revenue
FROM amazon_data GROUP BY `ship-city`
ORDER BY Total_Revenue DESC LIMIT 5;

#4.Number of Orders by Product Category
SELECT Category,COUNT(*) AS Total_Orders
FROM amazon_data GROUP BY Category
ORDER BY Total_Orders DESC;

#5.Number of Orders by Ship City and Ship State
SELECT `ship-state`,`ship-city`,COUNT(*) AS Total_Orders
FROM amazon_data GROUP BY `ship-state`, `ship-city`
ORDER BY Total_Orders DESC;

#6. Revenue Trend Over Time
SELECT Date,SUM(Amount) AS Revenue
FROM amazon_data GROUP BY Date
ORDER BY Date;

SELECT YEAR(`Date`) AS Year,WEEK(`Date`) AS Week_No,SUM(Amount) AS Revenue
FROM amazon_data GROUP BY YEAR(`Date`), WEEK(`Date`)
ORDER BY Year, Week_No;

SELECT YEAR(`Date`) AS Year,MONTH(`Date`) AS Month_No,SUM(Amount) AS Revenue
FROM amazon_data GROUP BY YEAR(`Date`), MONTH(`Date`)
ORDER BY Year, Month_No;

#7.Most Profitable Fulfilment Channel
SELECT Fulfilment, SUM(Amount) AS Revenue, AVG(Amount) AS Avg_Order_Value
FROM amazon_data GROUP BY Fulfilment
ORDER BY Revenue DESC;

#8.Relationship Between Ship-Service and Order Amount
SELECT `ship-service-level`, COUNT(*) AS Orders_Count, AVG(Amount) AS Avg_Order_Value, SUM(Amount) AS Revenue
FROM amazon_data GROUP BY `ship-service-level`;

#9.Relationship Between Quantity and Amount by Category
SELECT Category, SUM(Qty) AS Total_Quantity, SUM(Amount) AS Revenue, AVG(Amount) AS Avg_Order_Value
FROM amazon_data GROUP BY Category
ORDER BY Revenue DESC;

#10.Relationship Between Ship-Service and Product Category
SELECT `ship-service-level`, Category, COUNT(*) AS Orders_Count
FROM amazon_data GROUP BY `ship-service-level`, Category
ORDER BY Orders_Count DESC;

#11.Cancellation Rates by Category and Size
SELECT Category, COUNT(*) AS Cancelled_Orders
FROM amazon_data WHERE Status LIKE '%Cancelled%'
GROUP BY Category ORDER BY Cancelled_Orders DESC;

SELECT Category,
       ROUND(
           100 * SUM(CASE WHEN Status LIKE '%Cancelled%' THEN 1 ELSE 0 END) / COUNT(*), 2
       ) AS Cancellation_Rate
FROM amazon_data GROUP BY Category
ORDER BY Cancellation_Rate DESC;

SELECT Size,
       ROUND(
           100 * SUM(CASE WHEN Status LIKE '%Cancelled%' THEN 1 ELSE 0 END) / COUNT(*), 2
       ) AS Cancellation_Rate
FROM amazon_data GROUP BY Size
ORDER BY Cancellation_Rate DESC;

#12.Relationship Between Promotion Type and Order Amount
SELECT `promotion-ids`, COUNT(*) AS Orders_Count, AVG(Amount) AS Avg_Order_Value, SUM(Amount) AS Revenue
FROM amazon_data GROUP BY `promotion-ids`
ORDER BY Revenue DESC;

#13. Category Distribution
SELECT Category, COUNT(*) AS Orders_Count,
       ROUND(
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM amazon_data), 2
       ) AS Percentage
FROM amazon_data GROUP BY Category
ORDER BY Orders_Count DESC;

#14. Product Size Distribution
SELECT Size, COUNT(*) AS Orders_Count,
       ROUND(
           COUNT(*) * 100.0 / (SELECT COUNT(*) FROM amazon_data), 2
       ) AS Percentage
FROM amazon_data GROUP BY Size
ORDER BY Orders_Count DESC;

#15.Style Distribution
SELECT Style, COUNT(*) AS Orders_Count
FROM amazon_data GROUP BY Style
ORDER BY Orders_Count DESC;

#16.Percentage of Sales from Top 10 Products/Categories
SELECT Category, SUM(Amount) AS Revenue
FROM amazon_data GROUP BY Category
ORDER BY Revenue DESC
LIMIT 10;

SELECT Category, SUM(Amount) AS Revenue,
    ROUND(
        SUM(Amount) * 100 / (SELECT SUM(Amount) FROM amazon_data), 2
    ) AS Sales_Percentage
FROM amazon_data GROUP BY Category
ORDER BY Revenue DESC
LIMIT 10;

#17. Revenue Concentration Analysis
SELECT SKU, SUM(Amount) AS Revenue
FROM amazon_data GROUP BY sku
ORDER BY Revenue DESC;

SELECT SKU, SUM(Amount) AS Revenue,
    ROUND(
        SUM(Amount) * 100 / (SELECT SUM(Amount) FROM amazon_data), 2
    ) AS Revenue_Percentage
FROM amazon_data GROUP BY SKU
ORDER BY Revenue DESC
LIMIT 20;