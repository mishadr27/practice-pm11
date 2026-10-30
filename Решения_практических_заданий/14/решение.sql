CREATE TABLE product(id INTEGER PRIMARY KEY,name TEXT NOT NULL UNIQUE,price REAL NOT NULL DEFAULT 0 CHECK(price>=0),discount REAL,category_id INTEGER);
SELECT name,CASE WHEN price>100 THEN 'дорого' ELSE 'дёшево' END AS label FROM product;
SELECT name,COALESCE(category_id,0) AS category_id FROM product;
SELECT name,1000/NULLIF(price,0) AS ratio FROM product;
SELECT name,CASE WHEN price<50 THEN 'дёшево' WHEN price<=100 THEN 'средне' ELSE 'дорого' END AS label FROM product;
SELECT name,COALESCE(price,0)+COALESCE(discount,0) AS total FROM product;
SELECT * FROM product ORDER BY CASE WHEN price>100 THEN 1 WHEN price>=50 THEN 2 ELSE 3 END;
UPDATE product SET price=CASE WHEN price<0 THEN 0 ELSE price END;
-- В ошибочном CASE отсутствует END (и желательно ELSE).
SELECT COALESCE(NULL,NULL,5); -- результат 5.
