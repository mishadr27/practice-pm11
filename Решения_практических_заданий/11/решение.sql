SELECT p.name,c.name AS category FROM product p INNER JOIN category c ON p.category_id=c.id;
SELECT c.name,p.name FROM category c LEFT JOIN product p ON p.category_id=c.id;
SELECT p.* FROM product p LEFT JOIN category c ON p.category_id=c.id WHERE c.id IS NULL;
SELECT c.id,c.name,COUNT(p.id) amount FROM category c LEFT JOIN product p ON p.category_id=c.id GROUP BY c.id,c.name;
SELECT p.name,c.name FROM product p FULL JOIN category c ON p.category_id=c.id;
SELECT c.* FROM category c LEFT JOIN product p ON p.category_id=c.id WHERE p.id IS NULL;
SELECT p.name,c.name AS category,s.name AS supplier FROM product p JOIN category c ON p.category_id=c.id JOIN supplier s ON p.supplier_id=s.id;
SELECT p.* FROM product p JOIN category c ON p.category_id=c.id WHERE c.name LIKE 'Е%';
SELECT a.name,b.name FROM product a JOIN product b ON a.category_id=b.category_id AND a.id<b.id;
-- Ошибка исходного JOIN: нет ON, поэтому получается декартово произведение.
-- Предсказание LEFT JOIN: «Хлеб | Еда» и «Сыр | NULL».
-- RIGHT JOIN через LEFT JOIN:
SELECT p.name,c.name FROM category c LEFT JOIN product p ON p.category_id=c.id;
