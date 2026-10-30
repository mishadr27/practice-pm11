PRAGMA foreign_keys=ON;
CREATE TABLE client(id INTEGER PRIMARY KEY,name TEXT NOT NULL);
CREATE TABLE orders(id INTEGER PRIMARY KEY,client_id INTEGER NOT NULL REFERENCES client(id) ON DELETE CASCADE);
INSERT INTO client VALUES(1,'Иванов'),(2,'Петров'); INSERT INTO orders VALUES(1,1),(2,1);
-- INSERT INTO orders VALUES(3,999); -- FOREIGN KEY constraint failed.
DELETE FROM client WHERE id=1; -- оба заказа клиента 1 удалятся.

CREATE TABLE orders_restrict(id INTEGER PRIMARY KEY,client_id INTEGER NOT NULL REFERENCES client(id) ON DELETE RESTRICT);
-- Удаление клиента с заказами теперь запрещено.
CREATE TABLE category(id INTEGER PRIMARY KEY,name TEXT);
CREATE TABLE product(id INTEGER PRIMARY KEY,name TEXT,category_id INTEGER REFERENCES category(id) ON DELETE SET NULL);
CREATE TABLE order_product(order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,product_id INTEGER REFERENCES product(id),quantity INTEGER CHECK(quantity>0),PRIMARY KEY(order_id,product_id));
-- Повтор пары order_id/product_id нарушает составной PK.
CREATE TABLE employee(id INTEGER PRIMARY KEY,name TEXT,manager_id INTEGER REFERENCES employee(id)); -- иерархия руководителей.
-- При PRAGMA foreign_keys=OFF проверка FK отключена, поэтому client_id=999 вставится.
-- CASCADE: удаление клиента 1 удаляет заказы 1 и 2.
