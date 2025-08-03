Select order_date, str_to_date(order_date, '%m/%d/%Y')
from pizza_sales;

update pizza_sales
set order_date = str_to_date(order_date, '%m/%d/%Y');

select *
from pizza_sales;

Alter table pizza_sales
modify order_date date;

SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);

CREATE TABLE `pizza_sales2` (
  `pizza_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `pizza_name_id` text,
  `quantity` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_time` text,
  `unit_price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `pizza_size` text,
  `pizza_category` text,
  `pizza_ingredients` text,
  `pizza_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into pizza_sales2
Select *
from pizza_sales;

Select *
from pizza_sales2; 

-- ----------------------------------------------------
-- Solving the problem statements
-- 1. Total Revenue
Select Cast(Sum(total_price) AS decimal (10,2)) AS Total_Revenue
from pizza_sales2;

-- 2. Average order value
Select *
from pizza_sales2;

Select Sum(total_price) / count(distinct order_id) Average_order_value
from pizza_sales2;

-- 3. Total Pizza sold
Select sum(quantity) AS Total_Pizza_sold
from pizza_sales2;

-- 4. Total Orders placed
Select COUNT(distinct order_id) AS Total_orders
from pizza_sales2;

-- 5. Average Pizzas per order
Select CAST(CAST(sum(quantity) AS DECIMAL(10,2)) / CAST(COUNT(distinct order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Average_Pizzas_per_order
from pizza_sales2;

-- CHARTS SECTION
-- 1. Daily Trend for Total orders
-- Select DATENAME(dw, order_date) as order_day, count(distinct order_id)
-- from pizza_sales2
-- GROUP BY DATENAME(dw, order_date;

SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales2
GROUP BY DAYNAME(order_date);

-- 2. Monthly Trend for Total Orders
Select monthname(order_date) AS Month_Name, COUNT(DISTINCT order_id) AS total_orders
from pizza_sales2
Group by monthname(order_date)
order by 2 desc;

-- Select DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS total_orders
-- from pizza_sales2
-- Group by DATENAME(MONTH, order_date);

-- 3. Percentage of sales by pizza category
Select pizza_category, 
ROUND(sum(total_price) * 100  / (Select sum(total_price) from pizza_sales2),2) AS Percentage_sales
from pizza_sales2
Group by pizza_category;

-- my practice (lets say you want to filter for a particular month (e.g january)
select pizza_category, sum(total_price) As Total_sales, Round(sum(total_price)  * 100  / 
(select sum(total_price) from pizza_sales2 where month(order_date) = 1), 2) AS PCT -- using the 2nd "select" statement, it must have a "from" statement as well
from pizza_sales2 
where month(order_date) = 1
group by pizza_category; -- we apply the the 'WHERE' clause to the subquery as well for it to run correctly

-- 4. Percentage of sales by pizza size
Select pizza_size, cast(sum(total_price) AS Decimal(10,2)) AS total_price, Cast(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales2) AS Decimal (10,2)) AS PCT
from pizza_sales2
Group by pizza_size
order by 3 desc;

-- 5. Top 5 best sellers by Revenue, total Quantity and Total orders
Select pizza_name, sum(total_price) Top_5_sellers, sum(quantity) AS Total_Quanity, count(distinct order_id) Total_orders
from pizza_sales2
Group by pizza_name
order by 2 desc
limit 5;

-- 6. Bottom 5 Worst sellers by revenue, total quantity and total orders
Select pizza_name, sum(total_price) Top_5_sellers, sum(quantity) AS Total_Quanity, count(distinct order_id) Total_orders
from pizza_sales2
Group by pizza_name
order by 2 asc
limit 5;



SELECT User, Host FROM mysql.user;
