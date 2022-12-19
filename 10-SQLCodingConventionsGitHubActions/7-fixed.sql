/*1. Виберіть таблицю вашої БД, до якої потрібно додати нову колонку,
яка стане FK-колонкою для PK-колонки цієї таблиці та буде використана для
зберігання ієрархії. Використовується команда ALTER TABLE таблиця ADD колонка
тип_даних; Заповніть дані для створеної колонки, виконавши серію команд UPDATE.
2. Використовуючи створену колонку, отримайте дані з таблиці через ієрархічний
зв'язок типу «зверху-вниз».
3. Згенеруйте унікальну послідовність чисел, використовуючи рекурсивний запит, в
діапазоні від 1 до 100. На основі отриманого результату створіть запит, що
виводить на екран список ще не внесених значень однієї з PK-колонок однієї з
таблиць БД за прикладом на рисунку
11.*/

/*Створена нова колонка "Manager" - як керуюча особа над працівником*/
SELECT
    IMPLEM_ID,
    IMPLEM_NAME,
    SALARY,
    MANAGER
FROM IMPLEMENTERS;
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

SELECT
    IMPLEM_ID,
    IMPLEM_NAME,
    SALARY,
    MANAGER
FROM IMPLEMENTERS
START WITH MANAGER = 1 
CONNECT BY PRIOR IMPLEM_ID = MANAGER;
/*
 IMPLEM_ID IMPLEM_NAME  SALARY    MANAGER
---------- ------------ ---------- ----------
         7 Lila         7900          1
        10 Alina        7700          1
*/

/* Згенеруйте унікальну послідовність чисел, використовуючи рекурсивний запит, в
діапазоні від 1 до 100.*/
SELECT IMPLEMENTERS.IMPLEM_ID FROM IMPLEMENTERS
WHERE IMPLEMENTERS.LEVEL <= 100;

/*Вибрати номери співробітниців, які пропущені у таблиці ListOfServices.*/
SELECT
    IMPLEMENTERS.IMPLEM_ID,
    IMPLEMENTERS.IMPLEM_NAME
FROM IMPLEMENTERS
WHERE NOT EXISTS
    (SELECT LIST_OF_SERVICES.SERVICE_IMPLEMENTER
        FROM LIST_OF_SERVICES
        WHERE IMPLEMENTERS.IMPLEM_ID = LIST_OF_SERVICES.SERVICE_IMPLEMENTER)
ORDER BY IMPLEMENTERS.IMPLEM_ID;
/*
 IMPLEM_ID IMPLEM_NAME
---------- ------------
        10 Alina
        15 Max
*/
