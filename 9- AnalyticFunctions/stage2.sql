/*1. Одна з колонок таблиці повинна містити значення, що повторюються, для
виділення підгруп, інша колонка повинна мати числові значення.
Створіть запит, який отримає накопичувальні підсумки другої колонки від початку
вікна до поточного рядка.*/
SELECT 
    Services.Serv_name service,
    List_Of_Services.Service_price,
	SUM(List_Of_Services.Service_price)  OVER (
               ORDER BY List_Of_Services.Service_price
               ROWS BETWEEN UNBOUNDED PRECEDING 
				 AND CURRENT ROW
       ) sum_price 
FROM List_Of_Services
INNER JOIN Services ON List_Of_Services.Service_name = Services.Serv_id;
/*
SERVICE         SERVICE_PRICE  SUM_PRICE
--------------- ------------- ----------
Manicure                  350        350
Haircut                   500        850
Massage                   650       1500
Manicure                  650       2150
Massage                   650       2800
Massage                   700       3500
Makeup                    770       4270
Hair_Styling              990       5260

8 rows selected.
*/

/*2. Одна з колонок таблиці повинна містити значення, що повторюються, для
виділення підгруп, інша колонка повинна мати числові значення.
Створіть запит, який отримає накопичувальні підсумки другої колонки
попереднього та поточного рядка (ковзаюче вікно розміром 2 рядки).*/
SELECT 
    Services.Serv_name service,
    List_Of_Services.Service_price,
	SUM(List_Of_Services.Service_price)  OVER (
               ORDER BY List_Of_Services.Service_price
               ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
       ) sum_price 
FROM List_Of_Services
INNER JOIN Services ON List_Of_Services.Service_name = Services.Serv_id;
/*
SERVICE         SERVICE_PRICE  SUM_PRICE
--------------- ------------- ----------
Manicure                  350        350
Haircut                   500        850
Massage                   650       1150
Manicure                  650       1300
Massage                   650       1300
Massage                   700       1350
Makeup                    770       1470
Hair_Styling              990       1760

8 rows selected.
*/

/*3. Одна з колонок таблиці повинна містити значення, що повторюються, для
виділення підгруп, інша колонка повинна мати числові значення.
Створіть запит, який отримає:
 накопичувальні підсумки другої колонки від початку вікна до поточного
рядка для кожного вікна цілком
 накопичувальний результат порядково (для демонстрації відмінностей
роботи типу RANG від ROWS).*/

/*1*/
SELECT 
    Services.Serv_name service,
    List_Of_Services.Service_price,
	SUM(List_Of_Services.Service_price)  OVER (
               ORDER BY List_Of_Services.Service_price
               ROWS BETWEEN UNBOUNDED PRECEDING 
				 AND UNBOUNDED FOLLOWING
       ) sum_price 
FROM List_Of_Services
INNER JOIN Services ON List_Of_Services.Service_name = Services.Serv_id;
/*
SERVICE         SERVICE_PRICE  SUM_PRICE
--------------- ------------- ----------
Manicure                  350       5260
Haircut                   500       5260
Massage                   650       5260
Manicure                  650       5260
Massage                   650       5260
Massage                   700       5260
Makeup                    770       5260
Hair_Styling              990       5260

8 rows selected.
*/
SELECT 
    Services.Serv_name service,
    List_Of_Services.Service_price,
	SUM(List_Of_Services.Service_price)  OVER (
               ORDER BY List_Of_Services.Service_price
              RANGE UNBOUNDED PRECEDING
       ) sum_price 
FROM List_Of_Services
INNER JOIN Services ON List_Of_Services.Service_name = Services.Serv_id;
/*
SERVICE         SERVICE_PRICE  SUM_PRICE
--------------- ------------- ----------
Manicure                  350        350
Haircut                   500        850
Massage                   650       2800
Manicure                  650       2800
Massage                   650       2800
Massage                   700       3500
Makeup                    770       4270
Hair_Styling              990       5260

8 rows selected.
*/
