# Global Superstore sales analysis

## Project Overview
This projects analyzes the global superstore dataset using Sql(PostgreSQL), Pandas(python library), excel and Mostly powerBI to extract meaningful business insights to drive profit making decision making.


## Dataset Summary
This dataset has 51290 rows and 25 columns of data.

Key columns are - 
1. category: The category of products sold in the superstore.
2. country: The country in which the superstore is located.
3. customer_id: A unique identifier for each customer.
4. customer_name: The name of the customer who placed the order.
5. discount: The discount applied to the order.
6. market: The market or region where the superstore operates.
7. order_date: The date when the order was placed.
8. profit: The profit generated from the order.
9. quantity: The quantity of products ordered.
10. region: The region where the order was placed.
11. sales: The total sales amount for the order.
12. sub_category: The sub-category of products within the main category.


## Data Cleaning (Using pandas)
- It had **0** null values.
- It had two columns named "row_id" and "记录数", which presented no real value to our analysis, so it was better to get rid of it.
- Extracted the "time-part" from both "order_date" and "ship_date" column, which also presented no real insights.

## 🔍 Key business metrics
- Which market has the most customers? How is the customer retention?
- how is delivery timing to orders? which country has the least delivery timing?
 