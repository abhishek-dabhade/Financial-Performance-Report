# 📊 Financial Performance Dashboard

## 📌 Project Overview  
- Built an interactive **Power BI dashboard** to analyze company financial performance.  
- Dataset: `financial_data.csv` (Sales, Profit, Discounts, Units, Segments, Countries, Products).  
- SQL Server used for **data validation** with queries (`Financial_Performance_data.sql`).  
- Focused on analyzing **Sales, Profit, Margins, Discounts, and Units** across dimensions:  
  - 🌍 Country  
  - 📦 Product & Segment  
  - 📆 Year (2013 vs 2014)  
- Delivered key insights into:  
  - Top-performing countries and products  
  - Profit margins across regions and products  
  - Segment-wise sales & profit contribution  
  - Discount effectiveness on profit margins  
- 📈 Final output: Power BI dashboards + SQL validation + supporting documentation.  

---

---

## ✨ Features & Highlights  
- 📈 **Sales & Profit Trends** across years (2013 & 2014)  
- 🌍 **Country-wise Performance** with sales distribution and profit margins  
- 🏷️ **Discount Effectiveness** analysis on profit margins  
- 🛒 **Product & Segment Profitability**  
- 📊 **COGS to Sales %** for efficiency tracking  
- ✅ **SQL Validation Queries** included for accuracy  

---

## 💡 Impact  
- Helps identify **top-performing markets & products**  
- Reveals **drivers of profit margin**  
- Highlights **discount strategies** that improve profitability  
- Enables **data-backed decision making** for executives  

---


---

## 🛠 Tools & Technologies  
- **SQL Server Management Studio (SSMS)** – For data validation queries  
- **Microsoft Power BI** – For interactive dashboard design  
- **CSV / Excel** – Data source  
- **GitHub** – Project version control and documentation  

---

## 🔑 Key Insights  
- **USA & Canada** lead in sales (~$25M each).  
- **Germany** has the highest **profit margin %** (~15.66%).  
- **Government segment** dominates with **$53M sales & $11M profit**.  
- **Paseo product** contributes the most profit (~$4.8M).  
- **Low discounts** perform better in maintaining profit margins than high discounts.  
- Sales grew from **$26M in 2013 → $92M in 2014**, showing **strong growth momentum**.  

---

## 📜 SQL Validation Queries  

```sql
-- Total Net Sales
SELECT SUM(Sales) AS Total_Net_Sales 
FROM financial_data;

-- Total Profit
SELECT SUM(Profit) AS Total_Profit 
FROM financial_data;

-- Profit Margin %
SELECT (SUM(Profit) * 100.0) / SUM(Sales) AS Profit_Margin_Percentage 
FROM financial_data;

-- Sales by Country
SELECT Country, SUM(Sales) AS Total_Sales 
FROM financial_data
GROUP BY Country
ORDER BY Total_Sales DESC;

-- Profit Margin by Country
SELECT Country, (SUM(Profit) * 100.0) / SUM(Sales) AS Profit_Margin_Percentage 
FROM financial_data
GROUP BY Country
ORDER BY Profit_Margin_Percentage DESC;

-- Total Sales by Year
SELECT Year, SUM(Sales) AS Total_Sales 
FROM financial_data
GROUP BY Year
ORDER BY Year;
