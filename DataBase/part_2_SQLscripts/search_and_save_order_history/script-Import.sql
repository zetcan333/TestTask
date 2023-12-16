COPY (SELECT * FROM "Orders" WHERE status = 'закрыт' GROUP BY order_id) 
TO 'D:\DB\Scripts\res.csv'CSV HEADER
