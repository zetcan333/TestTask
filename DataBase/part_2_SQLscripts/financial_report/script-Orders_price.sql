Select o.order_id, o.day_start, o.day_end, (o.day_end - o.day_start) AS day_count, (o.day_end - o.day_start) * c.price_per_day AS order_cost 
FROM "Orders" AS o
full JOIN "Cars" AS c ON o.car_id = c.car_id
WHERE o.status = 'закрыт' AND o.day_start > '2023-10-01' AND o.day_end < '2023-10-31'
ORDER BY o.order_id
