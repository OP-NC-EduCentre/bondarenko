/*2.1 Створіть один схожий запит(використання багатотабличного внесення даних), 
виконавши одночасне внесення до двох таблиць вашої БД.
*/
SELECT MAX(List_id)FROM List_Of_Services; -- 10
SELECT MAX(Reg_id)FROM Registration; -- 6

CREATE SEQUENCE List_id_s START WITH 11 INCREMENT BY 1;
/*Sequence created.*/
CREATE SEQUENCE Reg_id_s START WITH 7 INCREMENT BY 1;
/*Sequence created.*/

INSERT ALL
    INTO List_Of_Services(List_id, Service_name, Service_price, 
    Service_implementer)
        VALUES (List_id_s.NEXTVAL, 5, 990.00, 2)
    INTO Registration(Reg_id, Reg_Client, Service_for_registration)
        VALUES (Reg_id_s.NEXTVAL, 'Sergei Tryn', List_id_s.CURRVAL)
SELECT L.List_id, L.Service_name, L.Service_price, 
    R.Reg_id, R.Reg_Client, R.Service_for_registration
FROM List_Of_Services L, Registration R
WHERE  R.Reg_Client = 'Ivan Kulov'
    AND L.List_id = R.Service_for_registration;
/* 2 rows created. */

SELECT * FROM List_Of_Services;
/*
   LIST_ID SERVICE_NAME SERVICE_PRICE SERVICE_IMPLEMENTER
---------- ------------ ------------- -------------------
        10            4           770                   6
         1            2           500                   3
         2            3           700                   1
         3            1           350                   2
         5            1           650                   7
         6            3           650                   8
        31            5           990                   2
        11            5           990                   2
         4            3           650                   3
*/

SELECT * FROM Registration;
/*
    REG_ID REG_CLIENT           SERVICE_FOR_REGISTRATION REG_DATE
---------- -------------------- ------------------------ ---------
         1 Anna Bond                                   1 10-JUL-22
         2 Katerina Koval                              3 01-JUL-22
         3 Vasil Chyb                                  2 08-JUN-22
         4 Ivan Kulov                                  2
        33 Sergei Tryn                                31
         7 Sergei Tryn                                11
         8 Sergei Tryn                                12
         5 Katarina Melnyk                             2 17-OCT-22
         6 Petro Pila                                  4 01-SEP-22

9 rows selected.
*/

/*2.2 Створіть один схожий запит на зміну двох колонок однієї таблиці вашої БД,
використовуючи багатостовпцевий підзапит.

Оновлення даних вартості процедури №1 (Manicure) та виуонавця, 
на дані з процедури №2 (Haircut)*/
UPDATE  List_Of_Services
  SET  (Service_price, Service_implementer) = 
				  (SELECT Service_price, Service_implementer
                          FROM    List_Of_Services
                          WHERE   Service_name = 2)
  WHERE   Service_name = 1;
/* 2 rows updated.*/

SELECT * FROM List_Of_Services;
/*
   LIST_ID SERVICE_NAME SERVICE_PRICE SERVICE_IMPLEMENTER
---------- ------------ ------------- -------------------
        10            4           770                   6
         1            2           500                   3
         2            3           700                   1
         3            1           500                   3
         5            1           500                   3
         6            3           650                   8
        31            5           990                   2
        11            5           990                   2
        12            5           990                   2
         4            3           650                   3
*/

/*2.3 Створіть один схожий запит на видалення рядків таблиці за допомогою EXISTS або
NOT EXISTS.

Видалення всіх записів де процедурою є 'Haircut'*/
DELETE FROM	(
			SELECT * FROM Registration 
			WHERE Service_for_registration = 
				(SELECT Serv_id FROM Services
					WHERE Serv_name = 'Haircut')
			);
/* 3 rows deleted. */

SELECT * FROM Registration;
/*
    REG_ID REG_CLIENT           SERVICE_FOR_REGISTRATION REG_DATE
---------- -------------------- ------------------------ ---------
         1 Anna Bond                                   1 10-JUL-22
         2 Katerina Koval                              3 01-JUL-22
        33 Sergei Tryn                                31
         7 Sergei Tryn                                11
         8 Sergei Tryn                                12
         6 Petro Pila                                  4 01-SEP-22

6 rows selected.
*/

/*2.4 Створіть один схожий запит(використання оператора MERGE.) на видалення, 
використовуючи одну або дві таблиці вашої бази даних.*/

--Створила копію таблиці Registration
CREATE TABLE Registration_ALL AS
	SELECT * FROM Registration;
/*Table created.*/
	
--Змінити коди підрозділів усіх співробітників та
UPDATE Registration SET Service_for_registration = 10;
/*7 rows updated.*/

--Видалила клієнтів, перша літера імені яких починається з K
DELETE FROM Registration
	WHERE Reg_Client like 'K%';
/*2 rows deleted.*/

--Відновила вихідні коди, а також відновити видалених клієнтів
MERGE INTO Registration A
	USING Registration_ALL B
		ON (A.Reg_id = B.Reg_id)
	WHEN MATCHED THEN
		UPDATE SET A.Service_for_registration = B.Service_for_registration
	WHEN NOT MATCHED THEN
		INSERT (Reg_id, Reg_Client, Service_for_registration, Reg_date)
			VALUES (B.Reg_id, B.Reg_Client, B.Service_for_registration, B.Reg_date);
/*7 rows merged.*/

SELECT * FROM Registration;
/*
    REG_ID REG_CLIENT           SERVICE_FOR_REGISTRATION REG_DATE
---------- -------------------- ------------------------ ---------
         1 Anna Bond                                   1 10-JUL-22
         3 Vasil Chyb                                  2 08-JUN-22
         4 Ivan Kulov                                  2
         2 Katerina Koval                              3 01-JUL-22
         5 Katarina Melnyk                             2 17-OCT-22
        33 Sergei Tryn                                31
         6 Petro Pila                                  4 01-SEP-22

7 rows selected.
*/