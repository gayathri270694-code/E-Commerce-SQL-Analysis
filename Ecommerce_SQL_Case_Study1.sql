create database ecommerce;
use ecommerce;
-- ======================================================
-- E-commerce company case study
-- ========================================================
-- question 1: You can analyze all the tables by describing their contents.
-- Task: Describe the Tables: Customers, Products, Orders, OrderDetails

Describe customers;
Describe Products;
Describe Orders;
Describe OrderDetails;

-- question 2
-- Identify the top 3 cities with the highest number of customers to determine key markets for targeted marketing and logistic optimization.
select location, count(*) as number_of_customers from customers
group by location
order by number_of_customers desc
limit 3;

-- question 3 
-- As per the last query's result, Which of the cities must be focused as a part of marketing strategies?
-- ans: Delhi,chennai,jaipur

-- question 4 
-- Determine how many customers fall into each order frequency category based on the number of orders they have placed.
-- Using the Orders table, calculate the number of customers who placed 1 order, 2 orders, 3 orders, etc.
select numberoforders, count(*)as customercount
from
(
select customer_id, count(*)as numberoforders from orders
group by customer_id
)as t
group by numberoforders
order by numberoforders;

-- question 5
-- As per the Engagement Depth Analysis question, What is the trend of the number of customers v/s number of orders?
-- ans: As the number of orders increases, the customer count decreases

-- question 6
-- As per the Engagement Depth Analysis question, Which customers category does the company experiences the most?
-- ans: occasional shoppers

-- question 7
-- Identify products where the average purchase quantity per order is 2 but with a high total revenue, suggesting premium product trends.
select product_id, avg(quantity)as AvgQuantity,
sum(quantity*price_per_unit)as TotalRevenue
From orderdetails
group by product_id
having avg(quantity)=2
order by TotalRevenue desc;

-- question 8
-- Among products with an average purchase quantity of two, which ones exhibit the highest total revenue?
-- ans: product 1

-- question 9
-- For each product category, calculate the unique number of customers purchasing from it. This will help understand which categories have wider appeal across the customer base.
select p.category,count(distinct o.customer_id) as unique_customers 
From Products p 
inner join orderdetails od 
on p.product_id=od.product_id
inner join orders o 
on od.order_id=o.order_id
group by p.category
order by unique_customers desc;

-- question 10
-- As per the last question, Which product category needs more focus as it is in high demand among the customers?
-- ans: Electronics

-- question 11
-- Analyze the month-on-month percentage change in total sales to identify growth trends.
select Month, TotalSales, round(((TotalSales-prev)/prev)*100,2) as PercentChange
From
(
select date_format(order_date,'%Y-%m')as month, sum(total_amount)as TotalSales,
lag(sum(total_amount))over(order by date_format(order_date,'%Y-%m')) as prev
From orders
group by date_format(order_date,'%Y-%m')
)as t;

-- question 12
-- As per Sales Trend Analysis question, During which month did the sales experience the largest decline?
-- Answer: Feb 2024


-- question 13
-- As per Sales Trend Analysis question, What could be inferred about the sales trend from March to August?
-- Answer: sales fluctuated with no clear trend

-- question 14
-- Examine how the average order value changes month-on-month. Insights can guide pricing and promotional strategies to enhance order value.
select Month,AvgOrderValue, AvgOrderValue-prev as ChangeInValue 
from
(
select date_format(order_date,'%Y-%m')as Month,round(avg(total_amount),2) as AvgOrderValue,
lag(round(avg(total_amount),2)) over(order by date_format(order_date,'%Y-%m')) as prev
 from orders
group by date_format(order_date,'%Y-%m')
)as t 
order by ChangeInValue desc;

-- question 15
-- As per last question, Which month has the highest change in the average order value?
-- Decemeber

-- question 16
-- Based on sales data, identify products with the fastest turnover rates, suggesting high demand and the need for frequent restocking.
select product_id, COUNT(distinct order_id) as salesFrequency From orderDetails
group by product_id
order by salesFrequency desc
limit 5;

-- question 17
-- As per last question, Which product_id has the highest turnover rates and needs to be restocked frequently?
-- answer: 7

-- question 18
-- List products purchased by less than 40% of the customer base, indicating potential mismatches between inventory and customer interest.
select p.product_id,p.Name, count(distinct o.customer_id)as UniqueCustomerCount From products p 
inner join orderDetails od
on p.product_id=od.product_id
inner join orders o 
on od.order_id=o.order_id
group by p.product_id,p.Name
having count(distinct o.customer_id)<(select count(*) from customers)*0.4;

-- question 19
-- Why might certain products have purchase rates below 40% of the total customer base?
-- Poor visibility on the platform

-- question 20
-- After running an analysis to identify products purchased by less than 40% of the customer base, it was found that a few products have lower purchase rates than expected.
-- what could be a strategic action to improve the sales of these underperforming products?	
-- answer: Implement targeted marketing campaigns to raise awarness and interest

-- question 21
-- Evaluate the month-on-month growth rate in the customer base to understand the effectiveness of marketing campaigns and market expansion efforts.
select date_format(first_Date,'%Y-%m') as FirstPurchaseMonth, count(customer_id)as TotalNewCustomers
From
(
select customer_id, min(order_date)as first_Date From orders
group by customer_id
)as t
group by date_format(first_Date,'%Y-%m')
order by FirstPurchaseMonth asc;

-- question 22
-- As per last question, What can be inferred about the growth trend in the customer base from the result table?
-- answer: It is downward trend which implies the marketing campaign are not much effective

-- question 23
-- Identify the months with the highest sales volume, aiding in planning for stock levels, marketing efforts, and staffing in anticipation of peak demand periods.
select date_format(order_Date,'%Y-%m')as Month, Sum(total_amount) as Totalsales From orders
group by date_format(order_Date,'%Y-%m')
order by totalsales desc
limit 3;

-- question 24
-- As per last question, Which months will require major restocking of product and increased staffs?
-- september, december















