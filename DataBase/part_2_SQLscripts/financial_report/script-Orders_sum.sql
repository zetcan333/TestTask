SELECT SUM((o.day_end - o.day_start) * c.price_per_day)
FROM "Orders" AS o
LEFT JOIN "Cars" AS c ON o.car_id = c.car_id
WHERE o.status = 'закрыт' AND o.day_start > '2023-10-01' AND o.day_end < '2023-10-31'
