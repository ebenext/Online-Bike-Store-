SELECT *
FROM sales_working

------What are the total sales over time, and how do they vary by month or year
SELECT Year, SUM(REVENUE) AS TOTAL_SALE
FROM sales_working
GROUP BY Year
ORDER BY Year

---------
SELECT Month, SUM(REVENUE) AS TOTAL_SALE
FROM sales_working
GROUP BY Month
ORDER BY Month

--------What are the top-selling bike models or accessory categories?

SELECT Sub_Category, Product, COUNT(Product) as top_selling_model
from sales_working
where Product_Category  like '%bike%'
group by Sub_Category, Product
ORDER BY top_selling_model desc

------ accessories 
SELECT Sub_Category, Product, COUNT(Product) as top_selling_model
from sales_working
where Product_Category  like '%accessories%'
group by Sub_Category, Product
ORDER BY top_selling_model desc

----What are the top-selling bike models or accessory categories?
SELECT top 20 Product_Category, Sub_Category, Product, COUNT(Product) as top_selling_model
from sales_working
--where Product_Category  like '%clothing%'
group by Sub_Category, Product,Product_Category
ORDER BY top_selling_model desc

----------------What is the average price of bikes and accessories?
SELECT Product_Category, AVG(Cost) avg_price
FROM sales_working
group by Product_Category

--------------What regions or countries generate the most sales?
SELECT Country, State, SUM(Revenue) as total_sales
FROM sales_working
group by Country,State
order by total_sales desc

---------------What are the profit margins for different product categories?
SELECT Product_Category, sum(profit) as profit_margin
FROM sales_working
group by Product_Category
order by profit_margin desc

------Which products or categories contribute the most to the store's profit
SELECT top 5 Product, sum(profit) as profit_margin
FROM sales_working
group by Product
order by profit_margin desc

----------------- which age group is buying brought most
SELECT Age_Group, Count(Order_Quantity) as total_sold
FROM sales_working
group by Age_Group
order by total_sold desc


-----------------what product or product categories are being bought by certain age_group
SELECT top 10 Age_Group, Product, Sub_Category, COUNT(order_quantity) as total_sold
FROM sales_working
group by Age_Group,Product,Sub_Category
order by total_sold desc