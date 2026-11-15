SELECT *
FROM retails.sales.brightcoffee;


SELECT
    transaction_id,
      unit_price,
    CAST(REPLACE(unit_price,',','.')AS DECIMAL ) AS unit_price
FROM retails.sales.brightcoffee;


SELECT
     DATE_FORMAT(transaction_time,'HH:mm:ss') AS trans_time,
     CAST(transaction_time AS TIME) AS trans_time
FROM retails.sales.brightcoffee;


SELECT
    COUNT(*) AS total_records
FROM retails.sales.brightcoffee;


SELECT *,
   COUNT(*) AS duplicate_count
FROM retails.sales.brightcoffee
GROUP BY ALL
HAVING COUNT(*) > 1;


SELECT *
FROM retails.sales.brightcoffee
WHERE (transaction_id,
                transaction_date,
                   transaction_time,
                       transaction_qty,
                          store_id,
                             store_location,
                                   product_id,
                                 unit_price,
                    product_category,
               product_type,
product_detail) IS NULL;


SELECT
    SUM(transaction_qty * CAST(REPLACE(unit_price,',','.') AS DECIMAL(10,2) )) AS Total_Revenue
FROM retails.sales.brightcoffee ;


SELECT 
   product_category,
      SUM(transaction_qty * CAST(REPLACE(unit_price,',','.') AS DECIMAL(10,2))) AS Total_Revenue
FROM retails.sales.brightcoffee
GROUP BY ALL;

SELECT
    product_category,
       product_detail,
        SUM(transaction_qty * CAST(REPLACE(unit_price,',','.') AS DECIMAL(10,2))) AS Total_Revenue
FROM retails.sales.brightcoffee
GROUP BY product_category,product_detail;


SELECT
     product_category,
        product_detail,
           SUM(transaction_qty * CAST(REPLACE(unit_price,',','.') AS DECIMAL(10,2))) AS Total_Revenue
FROM retails.sales.brightcoffee
GROUP BY ALL
ORDER BY product_category;

SELECT
      product_type,
        SUM(transaction_qty * CAST(REPLACE(unit_price,',','.') AS DECIMAL(10,2))) AS Total_Revenue
FROM retails.sales.brightcoffee
GROUP BY ALL;


SELECT
   SUM(transaction_qty) AS Total_units_sold
FROM retails.sales.brightcoffee;



SELECT
     product_category,
       SUM(transaction_qty) AS Total_units_sold
FROM retails.sales.brightcoffee
GROUP BY ALL;


SELECT
      product_category,
        SUM(transaction_qty) AS total_units_sold,
          SUM(transaction_qty * CAST(REPLACE(unit_price,',','.') AS DECIMAL(10,2))) AS Total_Revenue
FROM retails.sales.brightcoffee
GROUP BY ALL;


SELECT
     store_location,
       SUM(transaction_qty * CAST(REPLACE(unit_price,',','.')AS DECIMAL(10,2))) AS Total_Revenue
FROM retails.sales.brightcoffee
GROUP BY store_location
ORDER BY Total_Revenue DESC;


SELECT
      
    CASE 
           WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
                  WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
                      WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'Evening'
                          ELSE 'Night'
                          END AS time_bucket,
                              SUM(transaction_qty * CAST(REPLACE(unit_price,',','.')AS DECIMAL(10,2))) AS Total_Revenue
FROM retails.sales.brightcoffee
GROUP BY ALL;


SELECT 
     CASE
        WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
           WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
             WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'Evening'
               ELSE 'Night'
                 END AS time_bucket,
                   COUNT(transaction_id) AS total_transactions
FROM retails.sales.brightcoffee
GROUP BY ALL;



SELECT
     transaction_date,
       MONTHNAME(transaction_date) AS month_name,
          MONTH(transaction_date) AS month_number,
          DATE_FORMAT(transaction_date,'yyyy-MMM') AS month_id,
          DAYNAME(transaction_date) AS day_name,
          DAYOFWEEK(transaction_date) AS day_number
FROM retails.sales.brightcoffee; 


SELECT
   HOUR(transaction_time) AS peak_hour,
     SUM(transaction_qty * CAST(REPLACE(unit_price,',','.') AS DECIMAL(10,2))) AS Total_revenue,
       SUM(transaction_qty) AS total_item_sold
FROM retails.sales.brightcoffee
GROUP BY HOUR(transaction_time)
ORDER BY Total_revenue DESC;


SELECT
    MONTHNAME(transaction_date) AS sales_month,
    SUM(transaction_qty * CAST(REPLACE(unit_price,',','.')AS DECIMAL(10,2))) AS Total_Revenue
FROM retails.sales.brightcoffee
GROUP BY ALL
ORDER BY Total_Revenue DESC;





SELECT
    product_type,
       SUM(transaction_qty) AS total_items_sold,
         SUM(transaction_qty * CAST(REPLACE(unit_price,',','.')AS DECIMAL(10,2))) AS total_revenue
FROM retails.sales.brightcoffee
GROUP BY ALL
ORDER BY total_revenue DESC;
     


SELECT
     product_type,
       SUM(transaction_qty) AS total_items_sold,
         SUM(transaction_qty * CAST(REPLACE(unit_price,',','.')AS DECIMAL(10,2))) AS total_revenue
FROM retails.sales.brightcoffee
GROUP BY ALL
ORDER BY total_revenue ASC;