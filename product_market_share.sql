/*-------------------------------------------------------------------
(Amazon->Hard)
Product Market Share

Write a query to find the Market Share at the Product Brand level for each Territory, for Time Period Q4-2021. 
Market Share is the number of Products of a certain Product Brand brand sold in a territory, divided by the total number of Products sold in this Territory.
Output the ID of the Territory, name of the Product Brand and the corresponding Market Share in percentages. 
Only include these Product Brands that had at least one sale in a given territory.

Tables: fct_customer_sales, map_customer_territory, dim_product
----------------------------------------------------------------------*/

WITH sales_per_brand_territory AS
  (SELECT prod_brand,
          territory_id,
          count(*) n_sales
   FROM fct_customer_sales s
   JOIN map_customer_territory t ON s.cust_id = t.cust_id
   JOIN dim_product p ON s.prod_sku_id = p.prod_sku_id
   WHERE EXTRACT (YEAR
                  FROM order_date) = 2021
     AND EXTRACT (QUARTER
                  FROM order_date) = 4
   GROUP BY prod_brand,
            territory_id)

SELECT territory_id,
       prod_brand,
       n_sales / SUM(n_sales) OVER(PARTITION BY territory_id) * 100 AS market_share
FROM sales_per_brand_territory




