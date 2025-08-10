-- created database
create database retail_sales_analysis
-- creating table
drop table if exists reatail_sales;
create table reatail_sales (
	transactions_id int primary key,
	sale_date date,
	sale_time time,
	customer_id int,
	gender varchar(10),
	age int,
	category varchar(20), 
	quantiy int,
	price_per_unit float,
	cogs float,
	total_sale float
)

-- first 5 rows of data
select * from reatail_sales limit 5;
-- How many rows we have?
select count(*) from reatail_sales;
-- Data Cleaning
-- corrected column name
ALTER TABLE reatail_sales
RENAME COLUMN quantiy TO quantity;
-- checking null values in any column
select * from reatail_sales where 
transactions_id is null or
sale_date is null or
sale_time is null or
customer_id is null or
gender is null or
age is null or 
category is null or
quantity is null or
price_per_unit is null or
cogs is null or
total_sale is null;
-- deleting all null values rows
delete from reatail_sales
where
transactions_id is null or
sale_date is null or
sale_time is null or
customer_id is null or
gender is null or
age is null or 
category is null or
quantity is null or
price_per_unit is null or
cogs is null or
total_sale is null;
-- Data Exploration
-- How many sales we have?
select count(*) as Total_sales from reatail_sales
-- How many unique customers we have?
select count(distinct customer_id) as Total_Customers from reatail_sales
-- How many unique categories we have?
select count(distinct category) as unique_category from reatail_sales
-- Show unique categories
select distinct category from reatail_sales
-- Data Analysis & Business key problems
-- Retrieve all columns for sales made on '2022-11-05'
select * from reatail_sales where sale_date='2022-11-05'
-- Retrieve all transactions where category is Clothing and quantity sold is more than 3 in month of nov 22
select * from reatail_sales where category='Clothing' and quantity > 3 and
TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
-- calculate the total sales (total_sale) for each category
select category, sum(total_sale) as total_sales from reatail_sales
group by category 
order by total_sales desc
-- calculate the total orders for each category
select category, count(*) as total_orders from reatail_sales
group by category 
order by total_orders desc
-- find the average age of customers who purchased items from the 'Beauty' category
select round(avg(age),2) as avg_age from reatail_sales where category='Beauty'
-- find all transactions where the total_sale is greater than 1000
select * from reatail_sales where total_sale > 1000
-- find the total number of transactions (transaction_id) made by each gender in each category
select count(*) as Total_Transactions, gender, category from reatail_sales
group by gender, category
order by Total_Transactions desc;
-- Find out best average selling month in each year
select 
extract(year from sale_date) as sale_year,
extract(month from sale_date) as sale_month,
avg(total_sale) as avg_sales
from reatail_sales 
group by sale_year, sale_month
order by avg_sales desc
limit 2

-- find the top 5 customers based on the highest total sales
select customer_id,age, gender, category, sum(total_sale) as highest_sales
from reatail_sales
group by customer_id,age,gender,category
order by highest_sales desc
limit 5

-- find the number of unique customers who purchased items from each category

select count(distinct customer_id) as customer_count, category
from reatail_sales
group by category
order by customer_count desc

-- create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
select
case
when extract(hour from sale_time) < 12 then 'Morning' 
when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
else 'Evening'
end as shifts,
count(*) as orders
from reatail_sales
group by shifts
order by orders desc





