/*3.1 Для будь-яких двох таблиць створити команду отримання декартового добутку.
*/
SELECT
    Services.Serv_name,
    Services.Reg_date
FROM Services CROSS JOIN Registration;
/*SERV_NAME       REG_DATE
--------------- ---------
Hair_Styling    10-JUL-22
Haircut         10-JUL-22
Makeup          10-JUL-22
Manicure        10-JUL-22
Massage         10-JUL-22
Hair_Styling    01-JUL-22
Haircut         01-JUL-22
Makeup          01-JUL-22
Manicure        01-JUL-22
Massage         01-JUL-22
Hair_Styling    08-JUN-22
Haircut         08-JUN-22
Makeup          08-JUN-22
Manicure        08-JUN-22
Massage         08-JUN-22
Hair_Styling
Haircut
Makeup
Manicure
Massage
Hair_Styling    17-OCT-22
Haircut         17-OCT-22
Makeup          17-OCT-22
Manicure        17-OCT-22
Massage         17-OCT-22
Hair_Styling    01-SEP-22
Haircut         01-SEP-22
Makeup          01-SEP-22
Manicure        01-SEP-22
Massage         01-SEP-22

30 rows selected.
*/

/*3.2 Для двох таблиць, пов'язаних через PK-колонку та FK-колонку, створити
команду отримання двох колонок першої та другої таблиць з використанням
екві-з’єднання таблиць. Використовувати префікси.
*/
/*Виправила:
L008	12 / 30	Commas should be followed by a single whitespace.
L014	14 / 2	Unquoted identifiers must be consistently capitalised.
L001	14 / 32	Unnecessary trailing whitespace.
L003	16 / 5  Expected 0 indentations, found 1 [compared to line 11]
L051	16 / 23	Join clauses should be fully qualified.
L003	17 / 5	Expected 2 indentations, found 1 [compared to line 15]
*/
SELECT
    Implementers.Implem_name,
    Implementers.Salary,
    List_of_services.Service_name,
    List_of_services.Service_price
FROM Implementers INNER JOIN List_of_services ON
        (Implementers.Implem_id = List_of_services.Service_implementer);
/*
IMPLEM_NAME                                  SALARY SERVICE_NAME SERVICE_PRICE
---------------------------------------- ---------- ------------ -------------
Sasha                                          7800            2           500
Maria                                          7500            3           700
Masha                                          8000            1           350
Lila                                           7900            1           650
Uliana                                         8300            3           650
Sasha                                          7800            3           650

6 rows selected.
*/

/*3.3 Повторити рішення попереднього завдання, застосувавши автоматичне 
визначення умов екві-з’єднання.
*/
/*Виправила:
L003	28 / 5	Expected 0 indentations, found 1 [compared to line 23]
L003	29 / 5	Expected 2 indentations, found 1 [compared to line 27]
L014	29 / 29	Unquoted identifiers must be consistently capitalised.
L003	30 / 5	Expected 0 indentations, found 1 [compared to line 23]
*/
SELECT
    Implementers.Implem_name,
    Implementers.Salary,
    List_of_services.Service_name,
    List_of_services.Service_price
FROM Implementers INNER JOIN List_of_services ON
        (Implementers.Implem_id = List_of_services.Service_implementer)
WHERE Implementers.Salary >= 7900;
/*
IMPLEM_NAME                                  SALARY SERVICE_NAME SERVICE_PRICE
---------------------------------------- ---------- ------------ -------------
Masha                                          8000            1           350
Lila                                           7900            1           650
Uliana                                         8300            3           650
*/

/*3.4 Повторити рішення завдання 3.2, замінивши еквіз'єднання на зовнішнє
(лівостороннє або правостороннє), яке дозволить побачити рядки таблиці з
PK-колонкою, не пов'язані з FK-колонкою.
*/
/*Виправила:
L003	48 / 5	Expected 0 indentations, found 1 [compared to line 43]
L003	49 / 5	Expected 2 indentations, found 1 [compared to line 47]
L014	49 / 19	Unquoted identifiers must be consistently capitalised.
L014	49 / 29	Unquoted identifiers must be consistently capitalised.
*/
SELECT
    Implementers.Implem_name,
    Implementers.Salary,
    List_of_services.Service_name,
    List_of_services.Service_price
FROM Implementers LEFT JOIN List_of_services ON
        (Implementers.Implem_id = List_of_services.Service_implementer);
/*
IMPLEM_NAME                                  SALARY SERVICE_NAME SERVICE_PRICE
---------------------------------------- ---------- ------------ -------------
Sasha                                          7800            2           500
Maria                                          7500            3           700
Masha                                          8000            1           350
Lila                                           7900            1           650
Uliana                                         8300            3           650
Sasha                                          7800            3           650
Alina                                          8000

7 rows selected.
*/
