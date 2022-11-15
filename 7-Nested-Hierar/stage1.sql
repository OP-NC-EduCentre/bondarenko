/*1.1 Створіть схожий запит (простих однорядкових підзапитів з екві-з'єднанням або 
тета-з'єднанням.), використовуючи одну або дві таблиці вашої бази даних.

Список працівників у який заробітня плата більше за 7700
*/
SELECT Implem_name
    FROM Implementers
    WHERE Salary > 
        (
        SELECT Salary 
        FROM Implementers
        WHERE Salary = 7700
        );
/*
IMPLEM_NAME
----------------------------------------
Sasha
Alina
Uliana
Lila
*/

/**1.2 Створіть схожий запит(використання агрегатних функцій у підзапитах.), 
використовуючи одну або дві таблиці вашої бази даних.

Виводжу сервісякий є найдешевшим, вартість та його виконавця 
*/
SELECT Service_name AS Service_Id, 
    Service_price AS Cost, 
    Service_implementer AS Implementer
FROM List_Of_Services
WHERE Service_price =
			(SELECT MIN(Service_price) FROM List_Of_Services);
/*
SERVICE_ID       COST IMPLEMENTER
---------- ---------- -----------
         1        350           2
*/

/*1.3 Створіть схожий запит(використання пропозиції HAVING у підзапиті),
використовуючи одну або дві таблиці вашої бази даних.

Виводжу список виконавців процедури, які виконують процедуврв,
вартість якої більше за середню.
*/
SELECT Service_implementer, AVG(Service_price)
FROM List_Of_Services
GROUP BY Service_implementer
HAVING AVG(Service_price) >
				(SELECT AVG(Service_price) FROM List_Of_Services);
/*
SERVICE_IMPLEMENTER AVG(SERVICE_PRICE)
------------------- ------------------
                  6                770
                  1                700
                  7                650
                  8                650
*/

/*1.4 Створіть схожий запит(використання операторів ALL, ANY у багаторядкових
підзапитах), використовуючи одну або дві таблиці вашої бази даних. */

/*Вивести деталі(номер процедури та її вартість) про процедуру, 
яку виконує працвник з ім'ям "Аліна"  */
SELECT Service_name, Service_price
FROM List_Of_Services
WHERE Service_implementer = ANY (SELECT Implem_Id FROM Implementers WHERE Implem_name = 'Alina');
/*
SERVICE_NAME SERVICE_PRICE
------------ -------------
           4           770
*/

/* Виводжу номер працівника та процедуру, яку він виконує. 
Відсортовано за вартістю процедури порівнюючи іх середньою ціною*/    
SELECT Service_implementer AS Implementer, 
    Service_name AS Services
    FROM List_Of_Services
    WHERE Service_price > ALL 
        (SELECT AVG(Service_price)
        FROM List_Of_Services );
/*
IMPLEMENTER   SERVICES
----------- ----------
          6          4
          1          3
          7          1
          8          3
          3          3
*/

/*1.5 Створіть схожий запит(приклад використання підзапитів в операторі WITH.),
використовуючи одну або дві таблиці вашої бази даних.

Вивести процедури, вартість яких більша за середню згрупованих за працівниками.
*/
WITH 
AVG_Price AS
	(
		SELECT Service_implementer, AVG(Service_price) PRAVG
		FROM List_Of_Services
		GROUP BY Service_implementer
	)
SELECT A.Service_name, A.Service_price, B.PRAVG
FROM List_Of_Services A, AVG_Price B
	WHERE 	A.Service_implementer = B.Service_implementer
			AND A.Service_price > B.PRAVG;
/*
SERVICE_NAME SERVICE_PRICE      PRAVG
------------ ------------- ----------
           3           650        575
*/

/*1.6 Створіть схожий запит(використання кореляційних підзапитів з оператором
EXISTS.),використовуючи одну або дві таблиці вашої бази даних.

Вивести заробітні плати працвників,я кі на даний момент виконують процедури*/
SELECT I.Salary
	FROM Implementers I
	WHERE EXISTS (
			SELECT L.Service_implementer 
			FROM List_Of_Services L
			WHERE L.Service_implementer = I.Implem_Id);
/*
    SALARY
----------
      8000
      7800
      7500
      7500
      7900
      8300
*/