/*

--drop table df_orders;

*/


/*
create table df_orders(
[order_id] int primary key
,[order_date] date
,[ship_mode] varchar(20)
,[segment] varchar(20)
,[country] varchar(20)
,[city] varchar(20)
,[state] varchar(20)
,[postal_code] varchar(20)
,[region] varchar(20)
,[category] varchar(20)
,[sub_category] varchar(20)
,[product_id] varchar(50)
,[quantity] int
,[discount] decimal(7,2)
,[sale_price] decimal(7,2)
,[profit] decimal(7,2)
)

*/

select * from df_orders;


-- find top 10 highest revenue generating products

select product_id, sum(sale_price) as sales
from df_orders
group by product_id
order by sales desc                      -- first we need to find the sales against all the product_id
											-- and after running the initial query we can add top 10 


select top 10 product_id, sum(sale_price) as sales
from df_orders
group by product_id
order by sales desc                        -- this statement gives us the top 10 highest revenue generating products



-- find top 5 highest selling products in each region

with cte as (
select region, product_id, sum(sale_price) as sales
from df_orders
group by region, product_id)
select * from (
select *
, ROW_NUMBER() over(partition by region order by sales desc) as rn
from cte) A
where rn<= 5


-- find month over month growth for year 2022 and 2023 sales : jan 2022 vs jan 2023

select distinct year(order_date) from df_orders;

with cte as (
select year(order_date) as order_year, month(order_date) as order_month,
sum(sale_price) as sales
from df_orders
group by year(order_date), month(order_date)
--order by year(order_date), month(order_date)
)											    --order by is invalid inside cte
select order_month --order_year                   -- after we agregated the case statements we don't need order year
,sum(case when order_year=2022 then sales else 0 end) as sales_2022        --case 1: one column will generate against this case statement
,sum(case when order_year=2023 then sales else 0 end) as sales_2023        -- case 2: second column of sales_2023 will be generated against this case statement
from cte
group by order_month
order by order_month


-- for each category which month had highest sales

with cte as (
select category, format(order_date, 'yyyyMM') as order_year_month, sum(sale_price) as sales
from df_orders
group by category, format(order_date, 'yyyyMM')
--order by category, format(order_date, 'yyyyMM')
)
select * from (
select *,
ROW_NUMBER() over (partition by category order by sales desc) as rn
from cte
) a
where rn = 1


--which sub category had the highest growth by profit in 2023 compare to 2022

select sub_category 
from df_orders;


with cte as (
select sub_category, year(order_date) as order_year,
sum(sale_price) as sales
from df_orders
group by sub_category, year(order_date)
--order by year(order_date), month(order_date)              --order by is invalid inside cte
)
, cte2 as (                                              
select sub_category --order_year                   -- after we agregated the case statements we don't need order year
,sum(case when order_year=2022 then sales else 0 end) as sales_2022        --case 1: one column will generate against this case statement
,sum(case when order_year=2023 then sales else 0 end) as sales_2023        -- case 2: second column of sales_2023 will be generated against this case statement
from cte
group by sub_category
)
select top 1 *
, (sales_2023-sales_2022)*100/sales_2022 as growth
from cte2
order by (sales_2023-sales_2022)*100/sales_2022 desc