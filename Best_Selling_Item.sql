/*----------------------------------------------------------------------
(Amazon-> Hard)
Best Selling Item

Find the best selling item for each month (no need to separate months by year) 
where the biggest total invoice was paid. 
The best selling item is calculated using the formula (unitprice * quantity). 
Output the month, the description of the item along with the amount paid.
-------------------------------------------------------------------------*/

SELECT MONTH,
       description,
       total_paid
FROM
  (SELECT date_part('month', invoicedate) AS MONTH,
          description,
          sum(unitprice * quantity) AS total_paid,
          rank() OVER (PARTITION BY date_part('month', invoicedate)
                       ORDER BY sum(unitprice * quantity) DESC) AS rnk
   FROM online_retail
   GROUP BY MONTH,
            description) tmp
WHERE rnk = 1




