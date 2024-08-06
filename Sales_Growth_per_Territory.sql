/*-------------------------------------------------------------------------
Sales Growth per Territory

Write a query to return Territory and corresponding Sales Growth. 
Compare growth between periods Q4-2021 vs Q3-2021.
If Territory (say T123) has Sales worth $100 in Q3-2021 and Sales worth $110 in Q4-2021, 
then the Sales Growth will be 10% [ i.e. = ((110 - 100)/100) * 100 ]
Output the ID of the Territory and the Sales Growth. 
Only output these territories that had any sales in both quarters.
---------------------------------------------------------------------------*/

WITH sales_by_quarter_territory AS
  (SELECT territory_id,
          EXTRACT (QUARTER FROM order_date) AS QUARTER,
          SUM(order_value) AS total_order_value
   FROM fct_customer_sales s
   JOIN map_customer_territory t 
   ON s.cust_id = t.cust_id
   WHERE 
     EXTRACT (YEAR FROM order_date) = 2021
     AND EXTRACT (QUARTER FROM order_date) IN (3, 4)
   GROUP BY 1, 2)

SELECT a.territory_id,
       ((b.total_order_value - a.total_order_value) / a.total_order_value) * 100 AS sales_growth
FROM sales_by_quarter_territory a
JOIN sales_by_quarter_territory b 
ON a.territory_id = b.territory_id
AND a.quarter < b.quarter






