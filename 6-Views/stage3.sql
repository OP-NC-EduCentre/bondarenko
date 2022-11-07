/*3.1 Створити нового користувача, ім'я якого = «ваше_прізвище_латиницею»+'EAV',
наприклад, blazhko_eav, з правами, достатніми для створення та заповнення таблиць БД EAV.*/
CREATE USER BONDARENKO_EAV IDENTIFIED BY oracle2022;
/*User created.*/
GRANT CONNECT TO BONDARENKO_EAV;
/*Grant succeeded.*/

/*3.2 Створити таблиці БД EAV та заповнити таблиці об'єктних типів та атрибутних типів,
взявши рішення з лабораторної роботи No5.*/
CREATE OR REPLACE VIEW BONDARENKO_EAV_OBJECT
    (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME)
    AS
    SELECT OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME
	FROM OBJECTS;
/*View created.*/

CREATE OR REPLACE VIEW BONDARENKO_EAV_ATTRIBUTE
    (ATTR_ID, OBJECT_ID, VALUE)
    AS
    SELECT ATTR_ID, OBJECT_ID, VALUE
	FROM ATTRIBUTES;
/* View created.*/

/*3.3 Створити генератор послідовності таблиці OBJECTS БД EAV, ініціалізувавши його
початковим значенням з урахуванням вже заповнених значень.*/
SELECT MAX(object_id) FROM BONDARENKO_EAV_OBJECT; --4
SELECT MAX(object_id) FROM BONDARENKO_EAV_ATTRIBUTE; --3
CREATE SEQUENCE OBJECTS_OBJECT_ID START WITH 5;
/*Sequence created.*/
CREATE SEQUENCE ATTRIBUTES_ATTR_ID START WITH 4;
/*Sequence created.*/

/*3.4 Налаштувати права доступу нового користувача до таблиць схеми даних із таблицями
реляційної БД вашої предметної області, створеної в лабораторній роботі No2.*/
GRANT SELECT ON Services TO BONDARENKO_EAV;
/*Grant succeeded.*/
GRANT SELECT ON Implementers TO BONDARENKO_EAV;
/*Grant succeeded.*/
GRANT SELECT ON List_Of_Services TO BONDARENKO_EAV;
/*Grant succeeded.*/
GRANT SELECT ON Registration TO BONDARENKO_EAV;
/*Grant succeeded.*/

/*3.5 Створити множину запитів типу INSERT INTO ... SELECT, які автоматично заповнять
таблицю OBJECTS, взявши потрібні дані з реляційної бази даних вашої предметної області.*/
INSERT
INTO objects (object_id, parent_id, object_type_id, name)
SELECT objects_object_id.nextval, NULL, ot.object_type_id, s.name
FROM objtype ot,
     Services s
WHERE ot.code = 'Services';

SELECT object_id, parent_id, object_type_id, name FROM objects;

/*
OBJECT_ID PARENT_ID OBJECT_TYPE_ID NAME
--------- --------- -------------- --------------------
        1                        1 Pedicure
        2                        1 Highlighting
        3         1              2 Registration 1
        4         2              2 Registration 2
*/