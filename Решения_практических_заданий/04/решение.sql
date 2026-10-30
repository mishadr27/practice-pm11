DROP TABLE IF EXISTS document;
DROP TABLE IF EXISTS event_log;
DROP TABLE IF EXISTS teacher;
DROP TABLE IF EXISTS student;

CREATE TABLE student(id INTEGER PRIMARY KEY AUTOINCREMENT, fio TEXT NOT NULL, birth_date TEXT, average_grade REAL);
INSERT INTO student(fio,birth_date,average_grade) VALUES
('Иванов И.И.','2006-02-11',4.5),('Петров П.П.','2005-10-03',3.9),('Сидоров С.С.','2006-07-20',4.8);
SELECT * FROM student;

CREATE TABLE teacher(id INTEGER PRIMARY KEY AUTOINCREMENT, fio TEXT NOT NULL, subject TEXT NOT NULL, experience INTEGER NOT NULL);
INSERT INTO teacher(fio,subject,experience) VALUES
('Петров А.А.','Математика',10),('Смирнова Е.В.','Физика',4),('Орлов И.Н.','SQL',8),('Ким О.П.','История',3),('Волкова М.С.','Химия',12);
SELECT * FROM teacher WHERE experience > 5;

CREATE TABLE document(id INTEGER PRIMARY KEY, name TEXT, content BLOB); -- BLOB хранит двоичные файлы.
CREATE TABLE event_log(id INTEGER PRIMARY KEY, message TEXT, created TEXT DEFAULT (date('now')));
INSERT INTO event_log(message) VALUES('Проверка DEFAULT');
SELECT * FROM event_log;
SELECT sqlite_version(); -- версия установленного SQLite.
-- В ошибочном примере id не растёт, поскольку нет INTEGER PRIMARY KEY/AUTOINCREMENT.
