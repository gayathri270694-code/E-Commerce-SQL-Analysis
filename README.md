# E-Commerce Business Analysis Using SQL

## 1. Project Overview

This project focuses on analysing an E-Commerce company's business data using MySQL. The objective is to derive meaningful business insights from customer behaviour, product performance, sales trends and inventory demand.

The analysis uses SQL queries to explore business performance and support data-driven decision-making.

## 2. Business Objectives

- Identify key customer markets based on geographical distribution.
- Analyze customer purchasing frequency and engagement.
- Evaluate product performance and category-wise customer reach.
- Examine monthly sales trends and average order value.
- Identify high-demand and underperforming products.
- Analyze new customer acquisition trends.
- Identify peak sales periods to support inventory planning.

## 3. Database Structure

The project uses four relational tables:

| Table        | Description                                    |
| ------------ | ---------------------------------------------- |
| Customers    | Customer details and locations                 |
| Products     | Product names, categories and prices           |
| Orders       | Order dates, customer IDs and total amounts    |
| OrderDetails | Products purchased, quantities and unit prices |

### Dataset Information

| Dataset      | Records |
| ------------ | ------: |
| Customers    |     100 |
| Products     |       8 |
| Orders       |     200 |
| OrderDetails |     519 |

## 4. Tools and Technologies

- MySQL
- MySQL Workbench
- SQL

## 5. SQL Concepts Used

- SELECT, WHERE and ORDER BY
- GROUP BY and HAVING
- Aggregate Functions: COUNT, SUM, AVG
- INNER JOIN
- Subqueries
- COUNT(DISTINCT)
- Date Functions and DATE_FORMAT
- Window Functions: LAG()
- Percentage Change Calculations

## 6. Analysis Performed

### Customer Insights

- Identified the top three cities based on customer count.
- Analyzed customer purchasing frequency.
- Evaluated customer engagement patterns.

### Product Analysis

- Identified products with an average purchase quantity of two and compared their revenue.
- Calculated unique customers purchasing from each product category.
- Identified products with purchase rates below 40% of the customer base.

### Sales Analysis

- Analyzed month-on-month changes in total sales.
- Examined changes in average order value.
- Identified months with the highest sales.

### Inventory Analysis

- Identified products appearing in the highest number of distinct orders to assess demand patterns.customer
- Examined underperforming products.
- Identified peak sales periods for inventory planning.

## 7. Key Business Findings

- Delhi, Chennai and Jaipur were identified as the top three cities by customer count.
- Electronics had the highest category-wise customer reach, with 79 unique customers.
- Product 1 generated the highest revenue among products with an average purchase quantity of two.
- Product 7 had the highest sales frequency based on distinct orders.
- February 2024 recorded the largest monthly sales decline.
- September, December and July were the three highest-sales months in the analysed dataset.
- New customer acquisition showed a generally declining pattern across the analysed months.

## 8. Project Files

- [Ecommerce_SQL_Case_Study1.sql](./Ecommerce_SQL_Case_Study1.sql)` – SQL coding solutions and business interpretation questions.
- [customers.csv](./customers.csv) – Customer dataset.
- [products.csv](./products.csv) – Product dataset.
- [orders.csv](./orders.csv)` – Orders dataset.
- [orderdetails.csv](./orderdetails.csv) – Order details dataset.

## 9. Learning Outcomes

- Developed practical experience in querying relational databases using MySQL.
- Applied joins, subqueries, aggregations and window functions to solve business problems.
- Analyzed customer purchasing behavior and product performance.
- Used SQL to identify sales trends and generate business insights.
- Strengthened analytical thinking and problem-solving skills.
