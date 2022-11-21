/*1. Одна з колонок таблиці повинна містити значення, що повторюються, для
виділення підгруп, інша колонка повинна мати числові значення. Створіть запит, який
отримає усереднені (avg) значення другої колонки кожного рядка в кожній підгрупі.*/
SELECT 
    Services.Serv_name service,
	AVG(List_Of_Services.Service_price)  OVER (
               PARTITION BY Services.Serv_name 
       ) avg_price 
FROM List_Of_Services
INNER JOIN Services ON List_Of_Services.Service_name = Services.Serv_id; 

/*
SERVICE          AVG_PRICE
--------------- ----------
Hair_Styling           990
Haircut                500
Makeup                 770
Manicure               500
Manicure               500
Massage         666.666667
Massage         666.666667
Massage         666.666667

8 rows selected.
*/

/*2. Одна з колонок таблиці повинна містити значення, що повторюються, для
виділення підгруп, інша колонка повинна мати числові значення. Створіть запит, який
отримає накопичувальні підсумки другої колонки.*/
SELECT 
    Services.Serv_name service,
    List_Of_Services.Service_price,
	SUM(List_Of_Services.Service_price)  OVER (
               ORDER BY List_Of_Services.Service_price
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

/*3. Виконайте попереднє завдання, отримавши накопичувальні підсумки в кожній
підгрупі окремо.*/
SELECT 
    Services.Serv_name service,
    List_Of_Services.Service_price,
	SUM(List_Of_Services.Service_price)  OVER (
               PARTITION BY Services.Serv_name 
               ORDER BY List_Of_Services.Service_price
       ) sum_price 
FROM List_Of_Services
INNER JOIN Services ON List_Of_Services.Service_name = Services.Serv_id; 

/*
SERVICE         SERVICE_PRICE  SUM_PRICE
--------------- ------------- ----------
Hair_Styling              990        990
Haircut                   500        500
Makeup                    770        770
Manicure                  350        350
Manicure                  650       1000
Massage                   650       1300
Massage                   650       1300
Massage                   700       2000

8 rows selected.
*/