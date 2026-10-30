CREATE TEMP TABLE import_product(name TEXT,price TEXT,category_id TEXT,date TEXT);
-- В DB Browser импортировать товары.csv в import_product.
INSERT INTO product(name,price,category_id)
SELECT TRIM(name),CAST(price AS REAL),CAST(category_id AS INTEGER) FROM import_product;
SELECT * FROM product; SELECT COUNT(*) FROM import_product;
SELECT LOWER(TRIM(name)) AS clean_name FROM import_product;
SELECT substr(date,7,4)||'-'||substr(date,4,2)||'-'||substr(date,1,2) AS iso_date FROM import_product;
SELECT * FROM import_product WHERE price IS NULL OR TRIM(price)='' OR CAST(price AS REAL)<0;
DROP TABLE import_product;
-- 100 вместо 50: импорт запустили дважды либо импортировали в непустую таблицу.
-- Две строки примера CSV импортируются: name как TEXT, price преобразуется в REAL.
