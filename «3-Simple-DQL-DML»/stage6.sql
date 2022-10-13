-- 6.1 Для однієї з таблиць створити команду отримання кількості рядків таблиці.
SELECT 
    COUNT(Implem_Id)
FROM Implementers;
/*
COUNT(IMPLEM_ID)
----------------
               4
*/

-- 6.2 Для однієї з таблиць створити команду отримання суми значень однієї з 
-- цілих колонок.
SELECT 
    SUM(Salary)
FROM Implementers;
/*
SUM(SALARY)
-----------
      29300
*/

-- 6.3 Для однієї з таблиць створити команду отримання статистики появи значень 
--однієї з колонок у таблиці
SELECT 
    COUNT(Implem_Id) AS Amount_of_implementers
FROM Implementers
GROUP BY Salary;
/*
AMOUNT_OF_IMPLEMENTERS
----------------------
                     2
                     1
                     1
*/

-- 6.4 Модифікувати рішення попереднього завдання так, щоб у відповіді були
-- відфільтровані рядки з урахуванням заданої умови, що включає використану 
-- функцію агрегації.
SELECT 
    Salary,
    COUNT(Implem_Id) AS Amount_of_implementers
FROM Implementers
GROUP BY Salary;
/*
    SALARY AMOUNT_OF_IMPLEMENTERS
---------- ----------------------
      8000                      2
      7800                      1
      7500                      1
*/