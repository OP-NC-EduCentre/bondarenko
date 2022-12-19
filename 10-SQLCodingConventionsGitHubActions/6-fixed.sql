/*2.1 Створити віртуальну таблицю, структура та вміст якої відповідає рішенню
завдання 2.3 з лабораторної роботи No5, але враховує опцію «WITH READ ONLY»:
отримати інформацію про атрибутні типи. Отримати вміст таблиці.*/
CREATE OR REPLACE VIEW objttype_attr(object_code, attr_id, attr_code, attr_name)
AS
SELECT
    objtype.code,
    attrtype.attr_id,
    attrtype.code,
    attrtype.name
FROM objtype,
    attrtype
WHERE objtype.object_type_id = attrtype.object_type_id
ORDER BY attrtype.object_type_id, attrtype.attr_id;

SELECT
    object_code,
    attr_id,
    attr_code,
    attr_name
FROM objecttype_attr;

/*
CODE        ATTR_ID CODE       NAME
---------- -------- ---------- --------------------
Services          1 Serv_id    Номер_послуги

Services          2 Serv_name  Назва_послуги

List_Of_Se        3 List_id    Номер_послуги_із_спи
rvices                         ску

List_Of_Se        4 Service_na Назва_послуги_із_спи
rvices              me         ску

List_Of_Se        5 Service_pr Вартість
rvices              ice

List_Of_Se        6 Service_im Номер_викон._співроб.
rvices              plementer

Registrati        7 Reg_id     Номер_запису
on

Registratio       8 Reg_Client Записаний_клієнт
on

Registratio       9 Service_fo Послуга_із_запису
on                  r_registration
*/

/*2.2 Виконати видалення одного рядка з віртуальної таблиці,
створеної у попередньому завданні. Прокоментувати реакцію СУБД.*/
DELETE FROM objecttype_attr
WHERE objecttype_attr.attr_id = 4;
/*
ERROR at line 1:
ORA-42399: cannot perform a DML operation on a read-only view
Видалити рядок не можна так як view працює лише у режимі для читання
*/

/*2.3 Створити віртуальну таблицю, що містить дві колонки:
назва класу, кількість екземплярів об'єктів класу.
Отримати вміст таблиці.*/
CREATE OR REPLACE VIEW object_count
    (object_type, objects_count)
    AS
    SELECT
        objtype.name,
        COUNT(objects.object_id) AS countobj
    FROM objtype,
        objects
    WHERE objects.object_type_id = objtype.object_type_id
    GROUP BY objtype.name;

SELECT
        object_type,
        objects_count
FROM object_count;

/*
OBJECT_TYPE   OBJECTS_COUNT
------------- -------------
Список_послуг 2
Послуги       2
*/

/*2.4 Перевірити можливість виконання операції зміни даних,
створеної у попередньому завданні.
Прокоментувати реакцію СУБД.*/
UPDATE object_count
SET objects_count = 3
WHERE object_count.object_type = 'Виконані_послуги';
/*
ORA-01732: data manipulation operation not legal on this view
Ця таблиця є результатом функції агрегації,
тому не дає можливість змінювати зміст колонки*/
