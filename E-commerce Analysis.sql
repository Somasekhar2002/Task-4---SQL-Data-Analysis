create database Ecommerce;
show databases;
use Ecommerce;
desc Custproddata;
select * from Custproddata;
select * from Custproddata limit 100;
alter table Custproddata change column ï»¿customer_id customer_id text;

select order_id, customer_id, country, product_id, quantity, unit_price, (quantity * unit_price) as total_price from Custproddata where country = 'India' ;

select country, sum(quantity * unit_price) as total_revenue, sum(quantity) as units_sold from Custproddata group by country having total_revenue>1000 order by total_revenue desc;

select c.order_id, c.product_id, c.product_name, c.quantity, c.unit_price, (c.quantity * c.unit_price) as line_total, concat(c.first_name,' ',c.last_name) as customer_name from Custproddata c ;

select product_id, product_name,avg(rating) as avg_rating from Custproddata group by product_id, product_name having avg(rating) > (select avg(rating) from Custproddata);

select category, sum(quantity*unit_price) as total_revenue, sum(quantity) as total_units, avg(rating ) as avg_rating, count(distinct customer_id) as unique_customers from Custproddata group by category order by total_revenue desc;

select customer_id, concat(first_name,' ' ,last_name) as customer_name, sum(quantity*unit_price) as total_spend, count(distinct order_id) as orders_count from Custproddata group by customer_id, first_name, last_name order by total_spend desc limit 10;

create or replace view product_sales_summary as select product_id, product_name, category, sum(quantity) as total_quantity_sold, sum(quantity*unit_price) as total_revenue, avg(rating) as avg_rating, count(*) as orders_count from Custproddata group by product_id, product_name, category;

select * from product_sales_summary order by total_revenue desc limit 20;

create index idx_ecom_customer_id on Custproddata(customer_id(50));
create index idx_ecom_product_id on Custproddata(product_id(50));
create index idx_ecom_country on Custproddata(country(50));

show indexes from Custproddata;
