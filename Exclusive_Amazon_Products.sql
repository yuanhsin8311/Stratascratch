/*----------------------------------------------------------------------------
(Amazon->Hard)
Exclusive Amazon Products

Find products which are exclusive to only Amazon and therefore not sold at Top Shop and Macy's. 
Your output should include the product name, brand name, price, and rating.

Two products are considered equal if they have the same product name and same maximum retail price (mrp column).
---------------------------------------------------------------------------*/

SELECT product_name,brand_name,price,rating
FROM innerwear_amazon_com
WHERE product_name||mrp
not in 
(
   SELECT product_name||mrp
   FROM innerwear_macys_com
   UNION ALL
   SELECT product_name||mrp
   FROM innerwear_topshop_com

)






