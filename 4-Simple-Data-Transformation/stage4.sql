/*4.1 Повторити рішення завдання 3.1*/
SELECT 
    Serv_name, 
    Reg_Date
FROM 
    Services,
    Registration;
/*
SERV_NAME       REG_DATE
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

/*4.2 Повторити рішення завдання 3.2*/
SELECT 
    Implementers.Implem_name,  
    Implementers.Salary,
	List_Of_Services.Service_name, 
    List_Of_Services.Service_price
FROM 
    Implementers,
    List_Of_Services 
WHERE 
    Implementers.Implem_Id=List_Of_Services.Service_implementer;
/*
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

/*4.3 Повторити рішення завдання 3.4*/
SELECT 
    Implementers.Implem_name,  
    Implementers.Salary,
	List_Of_Services.Service_name, 
    List_Of_Services.Service_price
FROM 
    Implementers,
    List_Of_Services 
WHERE 
    Implementers.Implem_Id=List_Of_Services.Service_implementer(+);
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