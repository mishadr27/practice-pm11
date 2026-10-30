PRAGMA foreign_keys=ON;
DROP TABLE IF EXISTS shipment; DROP TABLE IF EXISTS supplier; DROP TABLE IF EXISTS product; DROP TABLE IF EXISTS category;
CREATE TABLE category(id INTEGER PRIMARY KEY, name TEXT NOT NULL UNIQUE);
CREATE TABLE product(id INTEGER PRIMARY KEY, name TEXT NOT NULL, price REAL NOT NULL CHECK(price>0), category_id INTEGER REFERENCES category(id));
CREATE TABLE supplier(id INTEGER PRIMARY KEY, name TEXT NOT NULL, phone TEXT UNIQUE, email TEXT UNIQUE);
CREATE TABLE shipment(id INTEGER PRIMARY KEY, product_id INTEGER NOT NULL REFERENCES product(id), supplier_id INTEGER NOT NULL REFERENCES supplier(id), quantity INTEGER NOT NULL CHECK(quantity>0), date TEXT DEFAULT CURRENT_DATE CHECK(date>='2020-01-01'), UNIQUE(product_id,supplier_id));
INSERT INTO category VALUES(1,'Еда'),(2,'Быт');
INSERT INTO product VALUES(1,'Хлеб',40,1),(2,'Мыло',80,2);
INSERT INTO supplier VALUES(1,'Поставка','111','a@a.ru'),(2,'Опт','222','b@b.ru');
INSERT INTO shipment(id,product_id,supplier_id,quantity) VALUES(1,1,1,10),(2,2,2,5);
-- Цена 0 нарушает CHECK. Категория 1 принимается, category_id=99 отклоняется при foreign_keys=ON.
