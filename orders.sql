use retail_db;
-- Creating the table
create table orders(
order_id INT PRIMARY KEY
,order_date DATE
,ship_mode VARCHAR(20)
,segment VARCHAR(20)
,country VARCHAR(20)
,city VARCHAR(20)
,state VARCHAR(20)
,postal_code VARCHAR(20)
,region VARCHAR(20)
,category VARCHAR(20)
,sub_category VARCHAR(20)
,product_id VARCHAR(50)
,quantity INT
,discount DECIMAL(7,2)
,sale_price DECIMAL(7,2)
,profit DECIMAL(7,2));

-- Find top 10 highest revenue generating products
select product_id,category,sub_category, sum(sale_price) as sales
from orders
group by product_id,category,sub_category
order by sales desc
limit 10

-- Find top 5 highest selling product in each region
with sales_cte as (
select region,product_id,category,sub_category,sum(sale_price) as sales
from orders
group by region,product_id,category,sub_category),
rank_cte as(
select * , row_number() over(partition by region order by sales desc) as rn 
from sales_cte)
select * from rank_cte where rn <=5

-- Find month over month comparison for 2022 and 2023 sales
with cte as(
select year(order_date) as order_year,month(order_date) as order_month,sum(sale_price) as sales
from orders
group by order_year,order_month
)
select order_month,
sum(case when order_year = 2022 then sales else 0 end) as sales_2022,
sum(case when order_year = 2023 then sales else 0 end) as sales_2023
from cte 
group by order_month
order by order_month

-- For each category which month had highest sale
with sales_cte as(
select category,date_format(order_date,'%y-%M') as order_year_month,sum(sale_price) as sales
from orders
group by category,order_year_month
),
rank_cte as(
select * ,
row_number() over(partition by category order by sales desc) as rn 
from sales_cte
)
select category,order_year_month,sales from rank_cte where rn=1

-- Which sub category had highest growth by profit in 2023 compare to 2022
with cte_1 as(
select sub_category,year(order_date) as order_year,sum(sale_price) as sales
from orders
group by sub_category,order_year
),
cte_2 as(
select sub_category,
sum(case when order_year = 2022 then sales else 0 end) as sales_2022,
sum(case when order_year = 2023 then sales else 0 end) as sales_2023
from cte_1
group by sub_category
)
select *,(sales_2023-sales_2022)*100/sales_2022 as growth_percentage
from cte_2
group by sub_category
order by growth_percentage desc
