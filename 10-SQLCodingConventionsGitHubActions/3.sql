--4.1 Для однієї з таблиць створити команду отримання значень всіх колонок (явно
-- перерахувати) за окремими рядками з урахуванням умови: цілочисельне значення 
-- однієї з колонок має бути більшим за якесь константне значення.
/* Виправила:
L014	9 / 6   Unquoted identifiers must be consistently capitalised.
*/
SELECT
    List_id,
    Service_name,
    Service_price,
    Service_implementer
FROM List_of_services
WHERE
    Service_price >= 500;
/*
   LIST_ID SERVICE_NAME SERVICE_PRICE SERVICE_IMPLEMENTER
---------- ------------ ------------- -------------------
         1            2           500                   3
         2            3           700                   1
*/

--4.2 Для однієї з таблиць створити команду отримання значень всіх колонок (явно
-- перерахувати) за окремими рядками з урахуванням умови: символьне значення 
-- однієї з колонок має співпадати з якимось константним значенням.
/* Виправила:
L014	23 / 5	Unquoted identifiers must be consistently capitalised.
L014	27 / 7	Unquoted identifiers must be consistently capitalised.
*/
SELECT
    Implem_id,
    Implem_name,
    Salary
FROM Implementers
WHERE Implem_name = 'Masha';
/*
 IMPLEM_ID IMPLEM_NAME  SALARY
---------- ------------ ----------
         2 Masha        8000
*/

--4.3 Для однієї з таблиць створити команду отримання значень всіх колонок (явно
-- перерахувати) за окремими рядками з урахуванням умови: символьне значення 
-- однієї з колонок повинно містити в першому та третьому знакомісті якісь 
-- надані вами символи.
/* Виправила:
L014	39 / 5	Unquoted identifiers must be consistently capitalised.
L014	43 / 7	Unquoted identifiers must be consistently capitalised.
*/
SELECT
    Implem_id,
    Implem_name,
    Salary
FROM Implementers
WHERE Implem_name LIKE 'S_s%';
/*
IMPLEM_ID IMPLEM_NAME   SALARY
---------- ------------ ----------
         3 Sasha        7800
*/

--4.4 У завданні 1.2 було додано колонку типу date. Створити команду отримання 
-- значень всіх колонок (явно перерахувати) за окремими рядками з урахуванням 
-- умови: значення доданої колонки містить невизначене значення.
/* Виправила:
L014	55 / 5	Unquoted identifiers must be consistently capitalised.
L014	57 / 5	Unquoted identifiers must be consistently capitalised.
L014	59 / 7	Unquoted identifiers must be consistently capitalised.
*/
SELECT
    Reg_id,
    Reg_client,
    Service_for_registration,
    Reg_date
FROM Registration
WHERE Reg_date IS NULL;
/*
 REG_ID REG_CLIENT    SERVICE_FOR_REGISTRATION REG_DATE
------- ------------- ------------------------ ---------
     4  Ivan Kulov                           2
*/

-- 4.5 Створити команду отримання значень всіх колонок (явно перерахувати) 
-- за окремими рядками з урахуванням умови, що поєднує умови з рішень завдань 
-- 4.1 та 4.2
/* Виправила:
L014	70 / 5	Unquoted identifiers must be consistently capitalised.
L014	74 / 7	Unquoted identifiers must be consistently capitalised.
*/
SELECT
    Implem_id,
    Implem_name,
    Salary
FROM Implementers
WHERE Implem_name = 'Masha' AND Salary > 5000;
/*
 IMPLEM_ID IMPLEM_NAME  SALARY
---------- ------------ ----------
         2 Masha        8000
*/

-- 4.6 Створити команду отримання значень всіх колонок (явно перерахувати) за 
-- окремими рядками з урахуванням умови, що інвертує результат рішення 4.5
/* Виправила:
L013	85 / 5	Column expression without alias. Use explicit `AS` clause.
*/
SELECT
    Implem_id,
    Salary,
    REVERSE(Implem_name)
FROM Implementers
WHERE Implem_name = 'Masha' AND Salary > 5000;
-- Так як інвертувати тип "int" не можна, то інвертую значення поля ім'я
/*
 IMPLEM_ID IMPLEM_NAME  SALARY
---------- ------------ ----------
         2 ahsaM        8000
*/
