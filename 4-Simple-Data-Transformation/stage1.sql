/*1.1. ��� ��� ������� ���� �� �������� ���������� �����������, ��� 
����������� ����������� ��������� ����� ������� �������, �� ������� � ��������� 
����. ��������� �������� ����� � ��������. �������� ������� �������� ������ 
����� �� ����� �������
*/
-- ��������� ��������� ������������� �������� PK Serv_id
SELECT MAX(Serv_id)+1 FROM Services; -- ������� = 5
-- ��������� ��������� ������������� �������� PK Implem_Id
SELECT MAX(Implem_Id)+1 FROM Implementers; -- ������� = 8
-- ��������� ��������� ������������� �������� PK List_id
SELECT MAX(List_id)+1 FROM List_Of_Services; -- ������� = 5
-- ��������� ��������� ������������� �������� PK Reg_id
SELECT MAX(Reg_id)+1 FROM Registration; -- ������� = 7

DROP SEQUENCE Serv_id;
DROP SEQUENCE Implem_Id;
DROP SEQUENCE List_id;
DROP SEQUENCE Reg_id;

-- ��������� ����������
CREATE SEQUENCE Serv_id START WITH 5;
CREATE SEQUENCE Implem_Id START WITH 8;
CREATE SEQUENCE List_id START WITH 5;
CREATE SEQUENCE Reg_id START WITH 7;
/*
Sequence created.
*/

--������� �������� ������ ����� � ������� Services
INSERT INTO Services(Serv_id, Serv_name) 
    VALUES (Serv_id.nextval, 'Hair_Styling');
/*
   1 row created.
*/
--������� �������� ������ ����� � ������� Implementers
INSERT INTO Implementers (Implem_Id, Implem_name, Salary) 
    VALUES (Implem_Id.nextval, 'Uliana', 8300.00);
/*
   1 row created.
*/
--������� �������� ������ ����� � ������� List_Of_Services
INSERT INTO List_Of_Services 
    (List_id, Service_name, Service_price, Service_implementer) 
    VALUES (List_id.nextval, 1, 650.00, 7);
/*
   1 row created.
*/
--������� �������� ������ ����� � ������� Registration 
INSERT INTO Registration 
    (Reg_id, Reg_Client, Service_for_registration, Reg_Date) 
    VALUES (Reg_id.nextval, 'Katarina Melnyk', 2, '01/01/2022');
/*
   1 row created.
*/
  
    
/*1.2 ��� ��� ��� ��������'������ ������� �������� ����������, �� ��������� 
�� INSERT-������� �������� ����� � �� ������� ����� ���� � ����������� 
��'���� �� PK-�������� ����� ������� � FK-�������� 2-� ������� ���� � 
������������� ������������� NEXTVAL � CURRVAL.
*/
INSERT INTO Registration 
    (Reg_id, Reg_Client, Service_for_registration, Reg_Date) 
    VALUES (Reg_id.nextval, 'Petro Pila', Serv_id.currval, '01/10/2022');
/*
   1 row created.
*/

INSERT INTO List_Of_Services 
    (List_id, Service_name, Service_price, Service_implementer) 
    VALUES (List_id.nextval, 3, 650.00, Implem_Id.currval);
/*
   1 row created.
*/   

/*1.3 �������� ���������� ��� ������� ���������� �������������,
�������������� �������� ������� ���� Oracle.
*/    
-- ��������� ��������� ��� �������� ����, ��� ������� �� ��������� ���������� 
-- ����������� � ������� Services
SELECT 
    Serv_id,
	Serv_name 
FROM Services;
/*
   SERV_ID SERV_NAME
---------- ---------------
         5 Hair_Styling
         2 Haircut
         4 Makeup
         1 Manicure
         3 Massage
*/

-- ��������� ��������� ��� �������� ����, ��� ������� �� ��������� ���������� 
-- ����������� � ������� Implementers
SELECT * FROM Implementers;
/*
 IMPLEM_ID IMPLEM_NAME                                  SALARY
---------- ---------------------------------------- ----------
         1 Maria                                          7500
         2 Masha                                          8000
         3 Sasha                                          7800
         6 Alina                                          8000
         8 Uliana                                         8300
         7 Lila                                           7900

6 rows selected.
*/

-- ��������� ��������� ��� �������� ����, ��� ������� �� ��������� ���������� 
-- ����������� � ������� List_Of_Services
SELECT * FROM List_Of_Services;
/*
   LIST_ID SERVICE_NAME SERVICE_PRICE SERVICE_IMPLEMENTER
---------- ------------ ------------- -------------------
         1            2           500                   3
         2            3           700                   1
         3            1           350                   2
         5            1           650                   7
         6            3           650                   8
         4            3           650                   3

6 rows selected.
*/

-- ��������� ��������� ��� �������� ����, ��� ������� �� ��������� ���������� 
-- ����������� � ������� Registration
SELECT * FROM Registration;
/*
    REG_ID REG_CLIENT                               SERVICE_FOR_REGISTRATION
---------- ---------------------------------------- ------------------------
REG_DATE
---------
         1 Anna Bond                                                       1
10-JUL-22

         2 Katerina Koval                                                  3
01-JUL-22

         3 Vasil Chyb                                                      2
08-JUL-22

         4 Ivan Kulov                                                      2


         5 Katarina Melnyk                                                 2
17-OCT-22

         6 Petro Pila                                                      4
01-OCT-22


6 rows selected.
*/

/*1.4 �������������� ���� Oracle >= 12 ��� ���� � ������� �������� ��������� 
��������� ������� PK-������� ����� DEFAULT-��������. �������� ������� �������� 
������ ����� �� �������.
*/    
ALTER TABLE Services MODIFY 
	(Serv_id number DEFAULT Serv_id.nextval NOT NULL);
/*
Table SERVICES altered.
*/

INSERT INTO Services (Serv_name) VALUES ('TEST');
/*
1 row created.
*/

SELECT * FROM Services;
/*
   SERV_ID SERV_NAME
---------- ---------------
         5 Hair_Styling
         2 Haircut
         4 Makeup
         1 Manicure
         3 Massage
        25 TEST
*/
