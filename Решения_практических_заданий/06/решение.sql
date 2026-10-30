-- Простые изменения:
ALTER TABLE product ADD COLUMN description TEXT;
ALTER TABLE product RENAME COLUMN name TO title;
ALTER TABLE product DROP COLUMN description;
ALTER TABLE category RENAME TO categories;
ALTER TABLE product ADD COLUMN created TEXT;
UPDATE product SET created=date('now') WHERE created IS NULL;

-- Пересоздание с изменением типа и новым CHECK, с сохранением данных:
BEGIN;
CREATE TABLE product_new(id INTEGER PRIMARY KEY, title TEXT NOT NULL, price REAL CHECK(price>0), category_id INTEGER REFERENCES categories(id), created TEXT DEFAULT (date('now')));
INSERT INTO product_new(id,title,price,category_id,created) SELECT id,title,CAST(price AS REAL),category_id,created FROM product;
DROP TABLE product;
ALTER TABLE product_new RENAME TO product;
COMMIT;
-- При необходимости удалить: DROP TABLE product;
-- ALTER COLUMN ... TYPE не поддерживается SQLite: таблицу пересоздают.
-- Выражение DEFAULT (date('now')) также нельзя добавить к непустой таблице через ADD COLUMN; оно задано при пересоздании.
-- ADD COLUMN сохраняет 5 строк, поэтому COUNT(*) останется 5; новое поле будет NULL.
