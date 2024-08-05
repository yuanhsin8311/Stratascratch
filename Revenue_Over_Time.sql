/*---------------------------------------------------------------
(Amazon -> Hard)
Find the 3-month rolling average of total revenue from purchases given a table with users, their purchase amount, and date purchased. 
Do not include returns which are represented by negative purchase values. 
Output the year-month (YYYY-MM) and 3-month rolling average of revenue, sorted from earliest month to latest month.


A 3-month rolling average is defined by calculating the average total revenue from all user purchases for the current month and previous two months. The first two months will not be a true 3-month rolling average since we are not given data from last year. Assume each month has at least one purchase.

Table: amazon_purchases
----------------------------------------------------------------*/

SELECT t.MONTH,
AVG(t.monthly_revenue) OVER(order by t.month rows between 2 preceding and current row  ) AS avg_revenue

FROM (
SELECT to_char(created_at::date,'YYYY-MM') AS MONTH,
       SUM(purchase_amt) as monthly_revenue
FROM amazon_purchases
WHERE purchase_amt>0
GROUP BY 1
ORDER BY 1
) t









ORDER BY t.month ASC
