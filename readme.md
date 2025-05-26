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
- Which category has the most sales? which sub category of product sold the most? which product sold in higher quantity?
- relation between profit and discount over the years? Does giving more discount benefits the business?


## Some visual insights

### Analysis of the customer base

<img src="png/Customer analysis.png" width="600"/><br>

**1.** _The customer base is pretty fairly distributed among APAC, EU, LATAM, US, EMEA and AFRICA. While the market in CANADA is still yet to develop. Conducting a new marketing program can be beneficial for the company._

**2.** _Also another report shows that the customer retention increased over the year while the transactions of new customers has been decreasing. This highlights a marketing issue of the company, signaling that a restructural change in its marketing is needed._

**3.** _The customer segmentation report or RFM report reveals that a majority a customer group falls under the category of "Potential Loyalist"._

RFM stands for -
- **Recency** - _how recently a customer made a transaction (calculated as the difference between the customer latest transaction date and the latest transaction date of the dataset)._
- **Frequency** - _how often a customer do transactions._
- **Monetary** - _how much a customer has spent in total value._

<img src="png/RFM logic.png" width="300"/><br>

- _approximately 2.9k customers falls in "potential loyalist" category. There purchase history shows a pretty fair transaction gap but they aren't close to being loyal._
- _approximately 2.8k customers falls in "at risk" category. This base of customer has a gap of transaction over 120 days, highlighting a potential churn risk._

**💡Insight**: _Both of the customer category is dominating the customer base but it also suggests a large portion of the customer base has an mid-to-high inactivity gaps. This is a critical area for engagement and major fixes, indicating the business should:_
    - Nurture potential loyalists with offers and loyalty programs,
    - Running more marketing campaigns.For example, giving coupons to at-risk customers.

**4.** _the customer growth reports shows a significant growth in every regions over the year, indicating a smooth reputation build-up. African regions has maintained a linear growth of customer base over the year._

### Product Analysis

<img src="png/Product analysis part 1.png" width="600"/></br>

<img src="png/Product analysis part 2.png" width="600"/><br>


