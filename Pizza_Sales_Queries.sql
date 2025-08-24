CREATE DATABASE Dominos;
USE Dominos;


select * from pizza_sales;

# Total Revenue
SELECT SUM(total_price) AS "Total_Revenue"
FROM pizza_sales;

# Total Avg Order Value
SELECT SUM(total_price)/COUNT(DISTINCT(order_id)) AS "Avg_Order_Value" 
FROM pizza_sales;

# Total Pizza Sold
SELECT SUM(quantity) AS "Total_Pizza_Sold" 
FROM pizza_sales;

# Total Orders
SELECT COUNT(DISTINCT(order_id)) AS "Total_orders" 
FROM pizza_sales;

# Average Pizza Sold 
SELECT ROUND(SUM(quantity)/COUNT(DISTINCT(order_id)),2) AS "Avg_Pizzas_Per_Order"
FROM pizza_sales;

SELECT * FROM pizza_sales;

# Daily Trend for Total Order 
SELECT sub.order_day,sub.total_orders
FROM (SELECT 
DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day,
DAYOFWEEK(STR_TO_DATE(order_date, '%d-%m-%Y')) AS day_num,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
WHERE order_date IS NOT NULL
GROUP BY order_day, day_num
) AS sub
ORDER BY sub.day_num;

#Monthly Trend For Orders
SELECT MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Month_Name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')),Month_Name
ORDER BY MONTH(STR_TO_DATE(order_date, '%d-%m-%Y'));


SELECT pizza_category, ROUND(SUM(total_price),2) AS total_revenue,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_size ,ROUND(SUM(total_price),2) AS total_sales,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS pct
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pct desc;

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(STR_TO_DATE(order_date,'%d-%m-%Y')) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC LIMIT 5;

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC LIMIT 5;














