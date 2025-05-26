select * from superstore;
-- top segments of customers by profitability.
select
	segment,
	sum(sales) as total_sales,
	round(sum(profit)::decimal, 2) as total_profit,
	round(sum(profit)::decimal * 100.0 / sum(sales), 2) as profit_margin
from superstore
group by segment
order by profit_margin desc;

-- Task 1 : Top performing category by profitability.
select
	category,
	round(sum(profit)::decimal, 2) as total_profit,
	sum(sales) as total_sale,
	round(sum(profit)::decimal * 100.0 / sum(sales), 2) as profit_margin
from superstore
group by category
order by profit_margin desc;

-- Task 2 : Top Performing Countries by Profitability.
select
	country,
	round(sum(profit)::decimal, 2) as total_profit,
	sum(sales) as total_sale,
	round(sum(profit)::decimal * 100.0 / sum(sales), 2) as profit_margin,
	round(avg(extract(day from (ship_date - order_date))), 2) as avg_shipping_time
from superstore
group by country
order by profit_margin desc;

/*🧠 Question 2: SQL Interview Style
Title: 📦 Second Highest Sales in a Region

Prompt:
Write a query to find the second-highest total sales amount across all orders in the "West" region.*/

select
	order_id,
	sum(sales) as total_sales_amount
	region
from superstore
where region = 'West'
group by order_id, region
order by total_sales_amount desc;

-- Task 3 : Title: 🚚 Shipping Speed Efficiency by Country.
-- top 10 most delayed country and top 10 fastest country.
select
	country,
	round(avg(extract(day from (ship_date - order_date))), 2) as avg_shipping_delay
from superstore
group by country
order by avg_shipping_delay desc
limit 10; -- top 10 most delayed country.

select
	country,
	round(avg(extract(day from (ship_date - order_date))), 2) as avg_shipping_delay
from superstore
group by country
order by avg_shipping_delay
limit 10; -- top 10 most fastest country.

-- Task 4 : Title: 📈 Sales Trend Over Time.
select * from superstore;

select 
	year,
	sum(sales) as total_sales,
	lag(sum(sales)) over(order by year) as prev_year_total_sales,
	round((sum(sales) - lag(sum(sales)) over(order by year)) * 100.0 / lag(sum(sales)) over(order by year), 2) as YoY_growth
from superstore
group by year;

/*🧠 Question 5: SQL Interview Style
Title: 🧮 Order Count by Customer Rank

Prompt:
Find the top 5 customers who have placed the most orders.*/

select * from superstore;

select
	customer_id,
	customer_name,
	country,
	region,
	count(*) as total_orders
from superstore
group by customer_id, customer_name, country, region
order by total_orders desc
limit 5;

-- Task 5 : high volume, low profit products.

select
	product_name,
	count(*) as total_quantity,
	sum(sales) as total_sales,
	round(sum(profit)::decimal, 2) as total_profit
from superstore
group by product_name
order by total_quantity desc; -- sold in high volume, but low on profit.

select
	product_name,
	count(*) as total_quantity,
	sum(sales) as total_sales,
	round(sum(profit)::decimal, 2) as total_profit
from superstore
group by product_name
having sum(profit) < 0
order by total_quantity desc; -- sold in high volume but profit took loss.


select
	product_name,
	count(*) as total_quantity,
	sum(sales) as total_sales,
	round(sum(profit)::decimal, 2) as total_profit
from superstore
group by product_name
having count(*) < 10
order by total_profit desc; -- sold low in volume, but profit is high.

-- this are basically outliers in the dataset.


-- Task 6 : Title: 🏆 Top Performing Sub-Categories in Each Category.

select
	category,
	sub_category,
	round(sum(profit)::decimal, 2) as total_profit
from superstore
group by
	category,
	sub_category
order by category, total_profit desc;


/*🧠 Question 8: SQL Interview Style
Title: 🎯 Orders with Maximum Discount Per Customer

Prompt:
Find each customer’s single highest-discounted order.*/

select
	customer_id,
	customer_name,
	order_id,
	discount
from superstore
order by discount desc;

-- Task 7 : Title: 📉 Loss-Making Orders.

select
	order_id,
	count(*) as quantity,
	sum(sales) as total_sales,
	round(sum(profit)::decimal, 2) as total_profit, 
	round(sum(profit)::decimal * 100 / sum(sales), 2) as profit_margin
from superstore
group by order_id
having sum(profit) < 0
order by profit_margin;

-- Task 8 : Title: 🌍 Top Regions by Profit per Order.

select
	country,
	count(*) as total_order_count,
	round(sum(profit)::decimal, 2) as total_profit,
	round(sum(profit)::decimal / count(*), 2) as AOV
from superstore
group by country
order by AOV desc; -- top countries per order value.

select
	region,
	count(*) as total_order_count,
	round(sum(profit)::decimal, 2) as total_profit,
	round(sum(profit)::decimal / count(*), 2) as AOV
from superstore
group by region
order by AOV desc; -- top regions per order value.

/*🧠 Question 11: SQL Interview Style
Title: 🔁 Repeat Customers

Prompt:
Find all customers who have placed more than one distinct order. */

select
	customer_id,
	customer_name,
	count(distinct order_id) as total_order_count
from superstore
group by customer_id, customer_name
having count(distinct order_id) >= 2
order by total_order_count desc;

-- Task 9 : Title: 🧾 High Revenue, Low Discount Products.
select
	product_id,
	product_name,
	sum(sales) as total_sales,
	round(avg(discount)::decimal, 2) as avg_discount
from superstore
group by product_id, product_name
having avg(discount) < 0.10
order by total_sales desc
limit 10; -- high revenue, low discount per product_id and product_name.

-- It would be better too if we get the same for categories and their subcategories.

select
	category,
	sub_category,
	sum(sales) as total_sales,
	round(avg(discount)::decimal, 2) as avg_discount,
	rank() over(partition by category order by avg(discount)) as ranking_per_sub_category
from superstore
group by category, sub_category
having avg(discount) <= 0.2;

-- Task 10 : Cumulative Sales by Month.

select
	to_char(order_date, 'YYYY-mm') as date,
	count(order_id) as total_orders,
	sum(sales) as total_sales
from superstore
group by date
order by date; -- cumulative sales per month.

-- Task 11 : quarterly sales comparison.

with cte as (
	select
		extract(quarter from order_date) as quarter,
		extract(year from order_date) as years,
		count(*) as order_count,
		sum(sales) as total_Sales
	from superstore
	group by quarter, years
),

final_cte as (
	select
		quarter,
		years,
		order_count,
		total_sales,
		lag(total_sales) over(order by years, quarter) as prev_quarter_total,
		round((total_sales - lag(total_sales) over(order by years, quarter)) * 100.0 
		/ lag(total_sales) over(order by years, quarter), 2) as QoQ_growth
	from cte
)

select * from final_cte order by years, quarter;


-- Task 12 : ⏱ Average Shipping Delay by Ship Mode.

select
	ship_mode,
	round(avg(extract(day from (ship_date - order_date))), 2) as avg_of_gapdays,
	count(order_id) as order_count,
	count(order_id) * 100 / (select count(*) from superstore) as order_percentage_to_total,
	round(sum(profit)::decimal * 100.0 / sum(sales), 2) as profit_margin
from superstore
group by ship_mode;

-- Task 13(optional) : RFM for each customers.(recency, frequency, monetary).

with max_date as (
	select
		max(order_date) as max_date
	from superstore
)
select
	customer_id,
	customer_name,
	(select max_date from max_date) - max(order_date) as recency,
	count(distinct order_id) as frequency,
	round(sum(sales)::decimal, 2) as monetary
from superstore
group by 
	customer_id,
	customer_name
order by
	monetary desc;

-- Task 14 : High Revenue but Low Profit Products.
select
	product_id,
	product_name,
	count(order_id) as order_count,
	round(sum(profit)::decimal, 2) as total_profit,
	round(sum(profit)::decimal * 100.0 / sum(sales), 2) as profit_margin,
	case
		when round(sum(profit)::decimal * 100.0 / sum(sales), 2) < 0 then 'loss making'
		when round(sum(profit)::decimal * 100.0 / sum(sales), 2) between 0 and 10 then 'low profit'
		else 'good profit'
	end as profitability_flag
from superstore
group by
	product_id,
	product_name;

-- which country holds the most order percentage?

with cte as (
	select
		count(order_id) as order_count
	from superstore
)
select
	country,
	count(order_id) as total_order,
	round(count(order_id) * 100.0 / (select order_count from cte), 2) as order_share_country
from superstore
group by country
order by order_share_country desc;

-- Task 15 : 📦 Task 17: Products Frequently Sold Together (Bundling Insight)
-- Find pairs of products that are frequently ordered together (same order_id).
-- Return top 10 such product pairs.
select
	a.product_name,
	b.product_name,
	count(a.order_id) as times_ordered_together
from superstore as a
join superstore as b
	on a.order_id = b.order_id
		where a.product_name < b.product_name
group by a.product_name, b.product_name
order by times_ordered_together desc;

--  Task 18: Products Commonly Bought by the Same Customer.

select
	a.product_name,
	b.product_name,
	count(distinct a.customer_id) as pairs_bought_by_customers
from superstore as a
join superstore as b
	on a.customer_id = b.customer_id
		and a.product_name < b.product_name
group by a.product_name,
	b.product_name
order by pairs_bought_by_customers desc; -- pairs of products bought by count of customers.

select
	a.product_name,
	count(a.customer_id) as pairs_bought_by_customers
from superstore as a
join superstore as b
	on a.customer_id = b.customer_id
group by a.product_name,
	b.product_name
order by pairs_bought_by_customers desc;

-- 📍 Task 19: Top Product Combinations by Region.
with cte as (
	select
		a.region,
		a.product_name,
		b.product_name,
		count(a.order_id) as times_ordered_together,
		row_number() over(partition by a.region order by count(a.order_id) desc) as rnk
	from superstore as a
	join superstore as b
		on a.order_id = b.order_id
		and a.product_name < b.product_name
		and a.region = b.region
	group by
		a.region,
		a.product_name,
		b.product_name
	order by times_ordered_together desc
)

select * from cte where rnk <= 3;

-- ⏱ Task 20: Fastest Repeat Purchases
-- Find customers who reordered the same product again within the shortest time gap.

with cte as (
	select
		a.customer_name,
		a.product_name,
		a.order_date,
		lag(a.order_date) over(partition by a.customer_name order by a.order_date) as prev_day,
		extract(day from(a.order_date - lag(a.order_date) over(partition by a.customer_name order by a.order_date))) as gap_days
	from superstore as a
	join superstore as b
		on a.product_name = b.product_name
		and a.customer_name = b.customer_name
)
select
	*
from cte
where gap_days is not null and gap_days != 0;

-- Task 21: Customer Lifetime Value (LTV).

select
	customer_id,
	customer_name,
	count(distinct order_id) as order_count,
	sum(sales) as total_sales
from superstore
group by customer_id, customer_name
order by total_sales desc;

-- Task 22: Customer Churn Risk Flag.
-- max order_date = 2014-12-31.
-- We are checking if they have ordered in last 6 months or not.

with cte as (
	select
		customer_id,
		customer_name,
		max(order_date) as last_day
	from superstore
	group by customer_id, customer_name
	)
select
	case
		when last_day < '2014-07-01' then 'at risk'
		else 'safe'
	end as segment,
	count(distinct customer_id) as customer_count,
	round(count(distinct customer_id) * 100.0 / (select count(distinct customer_id) from superstore), 2) as customer_share_rate
from cte
group by segment;


-- country and its regions segment.
select
	region,
	count(*) as total_orders,
	sum(sales) as total_sales,
	round(sum(profit)::decimal * 100.0 / sum(sales), 2) as profit_margin
from superstore
group by region
order by profit_margin desc;

-- Task 23: Time to First Category Purchase.

with f_cte as (
select
	customer_id,
	customer_name,
	min(order_date) as first_date_order
from superstore
group by customer_id, customer_name
),

s_cte as (
	select
		customer_id,
		customer_name,
		min(order_date) filter(where category = 'Technology') as first_date_order_category
	from superstore
	group by customer_id, customer_name
)

select
	f.customer_id,
	f.customer_name,
	extract(day from (first_date_order_category - first_date_order)) as gap_days
from f_cte as f
join s_cte as s on s.customer_id = f.customer_id
where extract(day from (first_date_order_category - first_date_order)) is not null;


-- which category got orders the most percentage?
select
	category,
	round(count(*) * 100.0 / (select count(*) from superstore), 2) as order_rate
from superstore
group by category; -- category.

select
	sub_category,
	round(count(*) * 100.0 / (select count(*) from superstore), 2) as order_rate
from superstore
group by sub_category; -- sub_category.


-- YoY growth SQL.

with cte as (
	select
		extract(year from order_date) as years,
		sum(sales) as total_sales,
		lag(sum(sales)) over(order by extract(year from order_date)) as prev_year_sales
	from superstore
	group by years
)
select
	years,
	round((total_sales - prev_year_sales) * 100 / prev_year_sales, 2) as YoY_growth
from cte;


-- changing the date type in the database.
alter table superstore
alter column order_date type text;

update superstore
set order_date = to_char(to_date(order_date, 'YYYY-mm-dd'), 'YYYY-mm-dd');

alter table superstore
alter column order_date type DATE
using to_date(order_date, 'YYYY-mm-dd');

select
	customer_id,
	customer_name,
	(max(order_date) - min(order_date)) as days_gap
from superstore
group by
	customer_id,
	customer_name;
