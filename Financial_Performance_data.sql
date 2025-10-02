use Finance_data;

-- A) KPI

-- 1. Total Net Sales
SELECT CAST(SUM(Sales) AS DECIMAL(18,2)) AS total_net_sales
FROM finance_data;

-- 2. Total Profit
SELECT CAST(SUM(Profit) AS DECIMAL(18,2)) AS total_profit
FROM finance_data;

-- 3. Profit Margin %
SELECT 
    CAST(SUM(Profit) * 100.0 / SUM(Sales) AS DECIMAL(5,2)) AS profit_margin_percentage
FROM finance_data;

-- 4. Total Discounts
SELECT CAST(SUM(Discounts) AS DECIMAL(18,2)) AS total_discounts
FROM finance_data;

-- 5. COGS to Sales %
SELECT 
    CAST(SUM(COGS) * 100.0 / SUM(Sales) AS DECIMAL(5,2)) AS cogs_to_sales_percentage
FROM finance_data;

-- 6. Total Units
SELECT CAST(SUM(Units_Sold) AS DECIMAL(18,2)) AS total_units
FROM finance_data;


-- B) Total Sales by Country
SELECT Country, CAST(SUM(Sales) AS DECIMAL(18,2)) AS total_sales
FROM finance_data
GROUP BY Country
ORDER BY total_sales DESC;

-- C) Profit Margin by Country
SELECT 
    Country,
    CAST(SUM(Profit) * 100.0 / SUM(Sales) AS DECIMAL(5,2)) AS profit_margin_percentage
FROM finance_data
GROUP BY Country
ORDER BY profit_margin_percentage DESC;

-- D) Percentage of Sales by Country
SELECT 
    Country,
    CAST(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM finance_data) AS DECIMAL(5,2)) AS Sales_Percentage
FROM finance_data
GROUP BY Country
ORDER BY Sales_Percentage DESC;

-- E) Total Sales and Profit by Country
SELECT 
    Country,
    CAST(SUM(Sales) AS DECIMAL(18,2)) AS total_sales,
    CAST(SUM(Profit) AS DECIMAL(18,2)) AS total_profit
FROM finance_data
GROUP BY Country
ORDER BY total_sales DESC;

-- F) Total Sales by Year
SELECT Year, CAST(SUM(Sales) AS DECIMAL(18,2)) AS total_sales
FROM finance_data
GROUP BY Year
ORDER BY Year;

--- Product & Segment Performance

-- 1. Total Profit by Product
SELECT Product, CAST(SUM(Profit) AS DECIMAL(18,2)) AS total_profit
FROM finance_data
GROUP BY Product
ORDER BY total_profit DESC;

-- 2. Total Sales and COGS % by Product
SELECT 
    Product,
    CAST(SUM(Sales) AS DECIMAL(18,2)) AS total_sales,
    CAST(SUM(COGS) * 100.0 / SUM(Sales) AS DECIMAL(5,2)) AS cogs_to_sales_percentage
FROM finance_data
GROUP BY Product
ORDER BY total_sales DESC;

-- 3. Product-wise Sales & Profit %
SELECT 
    Product,
    CAST(SUM(Sales) AS DECIMAL(18,2)) AS total_sales,
    CAST(SUM(Profit) * 100.0 / SUM(Sales) AS DECIMAL(5,2)) AS profit_margin_percentage
FROM finance_data
GROUP BY Product
ORDER BY total_sales DESC;

-- 4. Total Sales & Profit by Segment
SELECT 
    Segment,
    CAST(SUM(Sales) AS DECIMAL(18,2)) AS total_sales,
    CAST(SUM(Profit) AS DECIMAL(18,2)) AS total_profit
FROM finance_data
GROUP BY Segment
ORDER BY total_sales DESC;

-- 5. Profit Margin by Segment

SELECT 
    Segment,
    CAST(SUM(Profit) AS DECIMAL(18,2)) AS total_profit,
    CAST(SUM(Profit) * 100.0 / SUM(Sales) AS DECIMAL(5,2)) AS profit_margin_percentage
FROM finance_data
GROUP BY Segment
ORDER BY profit_margin_percentage DESC;

-- 6. Discount Effectiveness
SELECT 
    CASE 
        WHEN Discounts = 0 THEN 'None'
        WHEN Discounts < 0.1 THEN 'Low'
        WHEN Discounts < 0.2 THEN 'Medium'
        ELSE 'High'
    END AS discount_bucket,
    CAST(SUM(Sales) AS DECIMAL(18,2)) AS total_sales,
    CAST(SUM(Profit) * 100.0 / SUM(Sales) AS DECIMAL(5,2)) AS profit_margin_pct
FROM finance_data
GROUP BY CASE 
        WHEN Discounts = 0 THEN 'None'
        WHEN Discounts < 0.1 THEN 'Low'
        WHEN Discounts < 0.2 THEN 'Medium'
        ELSE 'High'
    END
ORDER BY total_sales DESC;









