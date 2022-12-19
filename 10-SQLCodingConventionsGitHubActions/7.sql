/*1. Виберіть таблицю вашої БД, до якої потрібно додати нову колонку, яка стане FK-
колонкою для PK-колонки цієї таблиці та буде використана для зберігання ієрархії.
Використовується команда ALTER TABLE таблиця ADD колонка тип_даних;
Заповніть дані для створеної колонки, виконавши серію команд UPDATE.
2. Використовуючи створену колонку, отримайте дані з таблиці через ієрархічний зв'язок
типу «зверху-вниз».
3. Згенеруйте унікальну послідовність чисел, використовуючи рекурсивний запит, в
діапазоні від 1 до 100. На основі отриманого результату створіть запит, що виводить на екран
список ще не внесених значень однієї з PK-колонок однієї з таблиць БД за прикладом на рисунку
11.*/

/*Створена нова колонка "Manager" - як керуюча особа над працівником*/
SELECT Implem_Id, Implem_name, Salary, Manager  FROM Implementers;
/*
 IMPLEM_ID IMPLEM_NAM     SALARY    MANAGER
---------- ---------- ---------- ----------
        10 Alina            7700          1
         1 Maria            7500          6
         2 Masha            7500          6
         3 Sasha            7800          6
         6 Alina            8000          3
         8 Uliana           8300          3
         7 Lila             7900          1

7 rows selected.
*/

/*Виправлено: 
L036	29 / 1	Select targets should be on a new line unless there is only one select target.
L014	29 / 8	Unquoted identifiers must be consistently upper case.
L014	29 / 19	Unquoted identifiers must be consistently upper case.
L025	31 / 1	Alias 'START' is never used in SELECT statement.
L029	31 / 1	Keywords should not be used as identifiers.
L031	31 / 1	Avoid aliases in from clauses and join conditions.
PRS	31 / 7	Line 31, Position 7: Found unparsable section: 'WITH Manager = 1 CONNECT BY PRIOR Imple...'
*/
SELECT Implem_Id, Implem_name, Salary, Manager
FROM Implementers 
START WITH Manager = 1 
CONNECT BY PRIOR Implem_Id = Manager;
/*
 IMPLEM_ID IMPLEM_NAME                                  SALARY    MANAGER
---------- ---------------------------------------- ---------- ----------
         7 Lila                                           7900          1
        10 Alina                                          7700          1
*/

/* Згенеруйте унікальну послідовність чисел, використовуючи рекурсивний запит, в
діапазоні від 1 до 100.*/
/*Виправлено: 
L025	43 / 1	Alias 'CONNECT' is never used in SELECT statement.
L029	43 / 1	Keywords should not be used as identifiers.
L031	43 / 1	Avoid aliases in from clauses and join conditions.
PRS	43 / 9	Line 43, Position 9: Found unparsable section: 'BY LEVEL <= 100'
L001	48 / 17	Unnecessary trailing whitespace.
L014	49 / 13	Unquoted identifiers must be consistently upper case.
L028	49 / 13	Unqualified reference 'Service_implementer' found in single table select.
L028	51 / 11	Qualified reference 'Implementers.Implem_Id' found in single table select which is inconsistent with previous references.
L014	51 / 24	Unquoted identifiers must be consistently upper case.
*/
SELECT Implem_Id FROM Implementers
CONNECT BY LEVEL <= 100;

/*Вибрати номери співробітниців, які пропущені у таблиці ListOfServices.*/
SELECT Implem_Id, Implem_name
FROM Implementers
WHERE NOT EXISTS 
    (SELECT Service_implementer 
    FROM List_Of_Services 
    WHERE Implementers.Implem_Id = List_Of_Services.Service_implementer) 
ORDER BY Implem_Id;
/*
 IMPLEM_ID IMPLEM_NAME
---------- ----------------------------------------
        10 Alina
        15 Max
*/
