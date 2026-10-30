SELECT * FROM product WHERE price>100;
SELECT * FROM product WHERE price BETWEEN 50 AND 200;
SELECT * FROM product WHERE name LIKE 'Х%';
SELECT * FROM product WHERE category_id IS NULL;
SELECT * FROM product ORDER BY price DESC;
SELECT * FROM product LIMIT 3;
SELECT * FROM product WHERE CAST(price AS INTEGER)%10=0;
SELECT * FROM product WHERE LOWER(name) LIKE '%о%';
SELECT * FROM product WHERE price>(SELECT AVG(price) FROM product) AND category_id IS NOT NULL ORDER BY price DESC LIMIT 5;
-- Если требовалось применить category_id=1 к обеим ценовым веткам: WHERE (price>100 OR price<50) AND category_id=1.
-- Для данных из задания результат LIKE 'М%': Морковь 30, Молоко 60.
SELECT * FROM product WHERE LOWER(name) LIKE 'м%';
