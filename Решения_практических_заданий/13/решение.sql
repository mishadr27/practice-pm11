CREATE INDEX idx_product_price ON product(price);
CREATE INDEX idx_product_name ON product(name);
CREATE INDEX idx_product_cat_price ON product(category_id,price);
EXPLAIN QUERY PLAN SELECT * FROM product WHERE price>100;
DROP INDEX idx_product_name;
CREATE UNIQUE INDEX idx_product_name_unique ON product(name);
CREATE INDEX idx_product_name_cat ON product(name,category_id);
CREATE INDEX idx_product_lower_name ON product(LOWER(name));
EXPLAIN QUERY PLAN SELECT * FROM product WHERE LOWER(name)='хлеб';
-- Для сравнения времени выполнить запрос до и после индекса на большой таблице; на малой разница незаметна.
-- Индекс на id лишний: PRIMARY KEY уже индексируется.
-- План обычно содержит SEARCH product USING INDEX idx_product_price (price>?).
