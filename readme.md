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
- which region gave more profit per sales? which country has the most sales?


## Visual Insights

### Analysis of the customer base

<img src="png/Customer analysis.png" width="900"/><br>

**1.** _The customer base is pretty fairly distributed among **APAC, EU, LATAM, US, EMEA and AFRICA**. While the market in **CANADA** is yet to develop. Conducting a new marketing program can be beneficial for the company._

**2.** _Also another report shows that the customer retention **increased** over the year while the transactions of new customers has been **decreasing**. This highlights a marketing issue of the company, signaling that a restructural change in its marketing is needed._

**3.** _The customer segmentation report or RFM report reveals that a majority a customer group falls under the category of "Potential Loyalist"._

RFM stands for -
- **Recency** - _how recently a customer made a transaction (calculated as the difference between the customer latest transaction date and the latest transaction date of the dataset)._
- **Frequency** - _how often a customer do transactions._
- **Monetary** - _how much a customer has spent in total value._

<img src="png/RFM logic.png" width="800"/><br>

- _As per the RFM chart, the customer segment of **"Potential Loyalist"** has been the majority of customers through out the years, covering over **37%** of total customers. This customers purchase in every **60 to 90 days**, with **3+** transactions, showing a decent engagement.
Later follows the **Loyal** segment, covering over **32%** of total customers, who purchase frequently (every 60 days) and has more transactions (7+ orders)._

**💡Insight**: _Both segments maintain a **2-3 month purchase cycles**, highlighting **decent retention** over the time. However, with only **1,016** Champions (approx. 21% of total customer base), there's significant opportunity to upgrade these customers.

**Major actions to consider:**
    - Introducing personalized offers, **loyalty point programs** or **coupons** to increase their purchase frequency.
    - Launching **VIP access** or **Premium Memberships** to retain **loyal** group of customers and convert them to **champion** category as well.
    
**4.** _the customer growth reports shows a significant growth in every regions over the year, indicating a smooth reputation build-up, while the **African** region has maintained a linear growth of customer base over the year._

### Delivery Timing analysis

<img src="png/Delivery time analysis.png" width="900"/><br>

**1.** _From the average delivery report, **south sudan** from the market of Africa has seen the **highest** average deliver timing(approx. 6 days), while **chad**, which is also from the market of Africa has the **shortest** average delivery timing between their delivery day(2 days)._

**2.** _Otherwise, The business has maintained an **average delivery timing(approx. 4 days)** over the years in all regions and market._


### Product analysis

<img src="png/Product analysis part 1.png" width="900"/><br>

<img src="png/Product analysis part 2.png" width="900"/><br>

**💡 Key insights**

**1.** _The Top 10 Profitable Products Report highlights key revenue-driving items across customer segments._

_**Canon imageClass 2200 Advanced Copier** generated the **highest overall profit**, earning approximately **$13,000** from **Consumer** grade customers and **$8,000** from **Corporate** grade customers. It ranks as the **top-performing** product for both these segments, signalling its high demand and profit making ability among corporate level workspaces._

_On the other hand, the **Motorola Smartphone(Full Size)** got the most revenue generated out of the **Home Office** grade customers, which is the **top segment** in the customer group._

**2.** _The total Sales by sub-category report has revealed that **Phones**, **Copiers** and **Chairs** has sold the most among all other sub-categories, signalling a strong **Technology Dominated market** for the business. These 3 sub-categories combined contributed to **37.3%** Sales value to the total sales value._

**3.** _Staples has the **most quantity(876) sold** among all other products._

**4.** _**Apple Smart Phone(Full Size)** was sold the most over the years, making **$6000** in profit for the company, which ranks at **5th** position of profit making in the Top 10 product by sales and profit chart. On the other hand, **Samsung Smart Phone (cordless)** has made close to **$0 profit** for the company, which raises major concern for the brand._

The **Apple Smartphone (Full Size)** generated approximately **$87,000** in total sales, with the majority of this revenue coming from the **African** region. Quite Interestingly, Africa has contributed only **6.2%** of the total sales value and has shown weak, linear customer growth over the years, while gaining the top spot for **Apple Smartphone (Full Size)** sales. It may highlight a shift towards customer's preferrence or a niche trend._



### Sales & profit analysis

<img src="png/sales analysis.png" width="600"/><br>

**1.** _The company has seen the most profit and sales in the **Q4** of 2014. Throughout the years, the business has achieved a steady growth in profits and sales, Showing its smooth market adaption and dominance._


**2.** _The sales and profit analysis from 2011 to 2014 highlights the **United States** as the company’s **top-performing** country. It generated approximately **$2.3 million** in sales and contributed around **$286,000** in profit during the time. The **United States** has contributed **18%** of sales value and **19.5%** of overall profit gain to the company total, revealing the underlying strategic importance of its market and overall business performance._

**3.** _From Region wise sales and profit report, the **Central** region has gained the top spot for its contribution of **22.32%** to the company's total sales and **21.22%** of overall profit value. It has shown a dominating market presence and effective sales strategy._ 

_On the other hand, the region of both **Canada** and **carribea** had a quite struggle in their marketing. indicating for a strategic restructuring in marketing efforts and customer engagement practices._



# 🏁 Final Takeaways
- This README only highlights a key selection of dashboards and chart from the main dashboard. To explore the main dashboard, download the **"global superstore.pbix"** file from the **"dashboards"** file and it in the POWER BI desktop.


## 🔨 Tools used
1. Pandas - for cleaning.
2. SQL(postgreSQL) - for queries.
3. PowerBI - for visual dashboards.
4. VScode - for documentation.
5. Github - For publishing the project.


Thank you for exploring this project. Any feedbacks would be appreciated :)

