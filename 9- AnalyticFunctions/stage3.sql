/*1. Класифікуйте значення однієї з колонок на 3 категорії залежно від загальної суми
значень у будь-якій числовій колонці.*/
SELECT 
	NTILE(3) OVER (ORDER BY Salary) AS salntile, 
	Implem_name, 
	Salary 
FROM Implementers;
/*  
  SALNTILE IMPLEM_NAME                                  SALARY
---------- ---------------------------------------- ----------
         1 Maria                                          7500
         1 Masha                                          7500
         1 Alina                                          7700
         2 Sasha                                          7800
         2 Lila                                           7900
         2 Alina                                          8000
         3 Max                                            8000
         3 Uliana                                         8300

8 rows selected.
*/


/*2. Складіть запит, який поверне списки лідерів у підгрупах, отриманих у першому
завданні етапу 1.*/
SELECT 
    Services.Serv_name service,
	AVG(List_Of_Services.Service_price)  OVER (
               PARTITION BY Services.Serv_name
               ORDER BY List_Of_Services.Service_price DESC
       ) avg_price 
FROM List_Of_Services
INNER JOIN Services ON List_Of_Services.Service_name = Services.Serv_id; 
/*
SERVICE          AVG_PRICE
--------------- ----------
Hair_Styling           990
Haircut                500
Makeup                 770
Manicure               650
Manicure               500
Massage                700
Massage         666.666667
Massage         666.666667

8 rows selected.
*/


/*3. Модифікуйте рішення попереднього завдання, повернувши по 2 лідери у кожній
підгрупі.*/
WITH 
List_Of_Services_Col AS (
SELECT 
    Service_name,
	Service_price, ROW_NUMBER() OVER (
               PARTITION BY Service_name
               ORDER BY Service_price DESC
       ) avg_price 
FROM List_Of_Services)
SELECT 
    Service_name,
	Service_price
FROM List_Of_Services_Col
WHERE 
    avg_price <= 2;
/*
SERVICE_NAME SERVICE_PRICE
------------ -------------
           1           650
           1           350
           2           500
           3           700
           3           650
           4           770
           5           990

7 rows selected.
*/

/*4. Складіть запит, який повертає рейтинг будь-якого з перерахованих значень
відповідно до вашої предметноїобласті: товарів/послуг/співробітників/клієнтів тощо.*/
WITH 
List_Of_Services_Col AS (
SELECT 
    Service_name,
	Service_price, FIRST_VALUE(Service_price) OVER (
                             ORDER BY Service_price  
				             rows 
							     between unbounded preceding 
							     and unbounded following
						 ) as max_price
FROM List_Of_Services)
SELECT 
    Service_name,
	Service_price
FROM List_Of_Services_Col
WHERE 
    max_price != 0;
/*
SERVICE_NAME SERVICE_PRICE
------------ -------------
           1           350
           2           500
           3           650
           1           650
           3           650
           3           700
           4           770
           5           990

8 rows selected.
*/

/*5. Одна з колонок таблиці повинна містити значення, що повторюються, для
виділення підгруп, інша колонка повинна мати числові значення. Створіть запит, який
отримає перше значення у кожній підгрупі.*/
WITH 
List_Of_Services_Col AS (
SELECT 
    Service_name,
	Service_price, FIRST_VALUE(Service_price) OVER (
		                     PARTITION BY Service_name 
                             ORDER BY Service_price DESC 
				             rows 
							     between unbounded preceding 
							     and unbounded following
						 ) as max_price
FROM List_Of_Services)
SELECT 
    Service_name,
	Service_price
FROM List_Of_Services_Col
WHERE 
    max_price != 0;
/*
SERVICE_NAME SERVICE_PRICE
------------ -------------
           1           650
           1           350
           2           500
           3           700
           3           650
           3           650
           4           770
           5           990

8 rows selected.
*/