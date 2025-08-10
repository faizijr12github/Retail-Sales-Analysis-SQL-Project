# 🛒 Retail Sales Analysis – SQL Project

## 📌 Project Overview

This project focuses on **analyzing retail sales data** to uncover business insights that can help decision-makers improve sales strategies, customer engagement, and inventory management. Using **PostgreSQL**, I performed **data cleaning, exploration, and in-depth analysis** to answer key business questions.

The dataset includes **transaction details, customer demographics, product categories, and sales figures**. The analysis covers **sales performance, customer behavior, and category trends**.

---

## 🎯 Objectives

1. **Clean** and prepare the dataset for analysis.
2. **Explore** the data to understand structure and distribution.
3. **Analyze** sales patterns to identify top-performing categories, customer segments, and trends.
4. **Answer** real-world business questions to support decision-making.

---

## 🗂 Dataset Details

| Column Name       | Description                   |
| ----------------- | ----------------------------- |
| `transactions_id` | Unique transaction identifier |
| `sale_date`       | Date of sale                  |
| `sale_time`       | Time of sale                  |
| `customer_id`     | Unique customer identifier    |
| `gender`          | Gender of customer            |
| `age`             | Age of customer               |
| `category`        | Product category              |
| `quantity`        | Quantity sold                 |
| `price_per_unit`  | Price of a single unit        |
| `cogs`            | Cost of goods sold            |
| `total_sale`      | Total sales amount            |

---

## 🛠 Process

### 1️⃣ **Database & Table Creation**

* Created database `retail_sales_analysis`.
* Defined `reatail_sales` table with relevant fields.
* Corrected column names for consistency (`quantiy` → `quantity`).

### 2️⃣ **Data Cleaning**

* Checked for and removed rows with **NULL values**.

### 3️⃣ **Data Exploration**

* Counted total sales, unique customers, and product categories.
* Listed unique categories for reference.

### 4️⃣ **Business Analysis Queries**

* **Daily Sales Check** – Retrieve all sales for a specific date.
* **Category & Quantity Filters** – Find clothing sales with quantity > 3 in Nov 2022.
* **Category Sales Performance** – Total sales and total orders per category.
* **Customer Demographics** – Average age of beauty product buyers.
* **High-Value Sales** – Transactions above 1000 in sales.
* **Gender & Category Analysis** – Orders per gender-category combination.
* **Seasonality Trends** – Best average selling month per year.
* **Top Customers** – Based on total sales amount.
* **Category-wise Customer Reach** – Unique customer count per category.
* **Time-based Sales Shifts** – Morning, Afternoon, and Evening orders.

---

## 📊 Key Insights

* **Total Sales & Orders** by category reveal the most profitable segments.
* **Beauty category** attracts younger customers on average.
* **Evening shift** records the highest number of transactions.
* **Top 5 customers** contribute significantly to revenue.
* Certain **months show higher average sales**, indicating seasonal demand.

---

## 🖥 Example SQL Queries

**1. Find the total sales for each category**

```sql
SELECT category, SUM(total_sale) AS total_sales
FROM reatail_sales
GROUP BY category
ORDER BY total_sales DESC;
```

**2. Create shifts based on sale time**

```sql
SELECT
CASE
    WHEN EXTRACT(hour FROM sale_time) < 12 THEN 'Morning'
    WHEN EXTRACT(hour FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
END AS shifts,
COUNT(*) AS orders
FROM reatail_sales
GROUP BY shifts
ORDER BY orders DESC;
```

---

## 📌 Tools Used

* **PostgreSQL** – Data storage, cleaning, and analysis.
* **SQL** – Querying and extracting insights.
* **pgAdmin** – Database management.

---

## 🚀 How to Use This Project

1. Clone this repository.
2. Create the database in PostgreSQL.
3. Run the provided SQL script to set up tables and queries.
4. Load your dataset and execute queries to explore and analyze.

---

## 📢 Conclusion

This project demonstrates how **SQL can be leveraged to clean, explore, and analyze retail sales data** for actionable business insights. The queries answer practical business questions, making it valuable for **retail performance tracking, trend analysis, and customer segmentation**.
