SELECT COUNT(*) FROM product;
SELECT AVG(price) FROM product;
SELECT category_id,COUNT(*) FROM product GROUP BY category_id;
SELECT category_id,SUM(price) FROM product GROUP BY category_id;
SELECT category_id FROM product GROUP BY category_id HAVING COUNT(*)>2;
SELECT MAX(price),MIN(price) FROM product;
SELECT category_id FROM product GROUP BY category_id HAVING AVG(price)>100;
SELECT * FROM product WHERE price>(SELECT AVG(price) FROM product);
SELECT category_id,COUNT(*) AS amount,AVG(price) AS average,MAX(price) AS maximum FROM product GROUP BY category_id ORDER BY average;
SELECT COUNT(DISTINCT category_id) FROM product;
-- name не входит в GROUP BY и не агрегирован: в строгих СУБД это ошибка; SQLite выберет произвольное имя группы.
-- В предсказании результат: category_id=1, COUNT(*)=3.
