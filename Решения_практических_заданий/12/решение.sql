SELECT * FROM product WHERE price>(SELECT AVG(price) FROM product);
SELECT * FROM product WHERE category_id=(SELECT id FROM category WHERE name='Еда');
SELECT * FROM category c WHERE EXISTS(SELECT 1 FROM product p WHERE p.category_id=c.id);
SELECT * FROM category c WHERE NOT EXISTS(SELECT 1 FROM product p WHERE p.category_id=c.id);
SELECT * FROM product WHERE price=(SELECT MAX(price) FROM product);
SELECT * FROM product p WHERE price>(SELECT AVG(price) FROM product x WHERE x.category_id=p.category_id);
SELECT * FROM product WHERE price>(SELECT MAX(price) FROM product WHERE category_id=2);
SELECT * FROM category c WHERE (SELECT AVG(price) FROM product p WHERE p.category_id=c.id)>100;
-- Ошибка: скалярный подзапрос может вернуть много цен. Нужны MAX/AVG либо IN/ALL.
-- Предсказание NOT EXISTS: вернётся категория 2.
WITH averages AS (SELECT category_id,AVG(price) avg_price FROM product GROUP BY category_id),
maximums AS (SELECT category_id,MAX(price) max_price FROM product GROUP BY category_id)
SELECT c.id,c.name,a.avg_price,m.max_price FROM category c LEFT JOIN averages a ON a.category_id=c.id LEFT JOIN maximums m ON m.category_id=c.id;
