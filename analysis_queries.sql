-- Retail Sales Analysis Project
-- Database example: MySQL 8+
-- Import retail_sales.csv into a table named retail_sales first.

-- 1. Check the data
SELECT * FROM retail_sales LIMIT 10;

-- 2. Total revenue, cost, profit, and orders
SELECT
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(SUM(Cost), 2) AS total_cost,
    ROUND(SUM(Profit), 2) AS total_profit,
    COUNT(DISTINCT OrderID) AS total_orders
FROM retail_sales;

-- 3. Monthly revenue and profit
SELECT
    DATE_FORMAT(OrderDate, '%Y-%m') AS sales_month,
    ROUND(SUM(Revenue), 2) AS monthly_revenue,
    ROUND(SUM(Profit), 2) AS monthly_profit
FROM retail_sales
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY sales_month;

-- 4. Best-selling product by quantity
SELECT
    ProductName,
    SUM(Quantity) AS units_sold
FROM retail_sales
GROUP BY ProductName
ORDER BY units_sold DESC;

-- 5. Revenue by category
SELECT
    Category,
    ROUND(SUM(Revenue), 2) AS category_revenue
FROM retail_sales
GROUP BY Category
ORDER BY category_revenue DESC;

-- 6. Revenue by city
SELECT
    City,
    ROUND(SUM(Revenue), 2) AS city_revenue
FROM retail_sales
GROUP BY City
ORDER BY city_revenue DESC;

-- 7. Sales channel comparison
SELECT
    SalesChannel,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit
FROM retail_sales
GROUP BY SalesChannel
ORDER BY total_revenue DESC;

-- 8. Products with negative profit (if any)
SELECT
    ProductName,
    ROUND(SUM(Revenue), 2) AS revenue,
    ROUND(SUM(Profit), 2) AS profit
FROM retail_sales
GROUP BY ProductName
HAVING SUM(Profit) < 0
ORDER BY profit;
