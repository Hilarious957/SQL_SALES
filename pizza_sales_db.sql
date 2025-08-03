select *
from pizza_sales;
CREATE TABLE `pizza_sales2` (
  `pizza_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `pizza_name_id` text,
  `quantity` int DEFAULT NULL,
  `order_date` text,
  `order_time` text,
  `unit_price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `pizza_size` text,
  `pizza_category` text,
  `pizza_ingredients` text,
  `pizza_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Select *
from pizza_sales2;

insert into pizza_sales2
select *
from pizza_sales;


-- Solving the problem statements
-- 1. Total Revenue
Select Sum(total_price) AS Total_Revenue
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
