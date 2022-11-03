/*1.1 �������� ��������� �������, ��������� �� ���� ��� ������� ������ ��������
4.2 � ����������� ������ No3: ��� ���� � ������� �������� ������� ��������� ������� ���
������� (���� ������������) �� �������� ������� � ����������� �����, � ��� �������
�������� ���� � ������� �� ��������� � ������� ����������� ���������. �������� ����
�������.*/
CREATE OR REPLACE VIEW Implementers_Masha 
    (Implem_Id, Implem_name, Salary)
    AS
    SELECT
    Implem_Id, 
    Implem_name, 
    Salary
    FROM Implementers
    WHERE Implem_name = 'Masha';
/*
View created.
*/
    
SELECT Implem_Id, 
    Implem_name, 
    Salary
    FROM Implementers_Masha;
/*
 IMPLEM_ID IMPLEM_NAME  SALARY
---------- ------------ ----------
         2 Masha        8000
*/

/*1.2 �������� ������� ���� �������� ������� �������� ��������� ������� ��
��������, ��� ������� � ����� ������ ����� �� ������ ������������ ��������, ��� ����� ����
�������� �� ���������� �� ���������.*/
UPDATE Implementers_Masha
    SET salary = 7500
    WHERE Implem_name = 'Masha';
/*
1 row updated.
*/

SELECT Implem_Id, 
    Implem_name, 
    Salary
    FROM Implementers_Masha;
/*
 IMPLEM_ID IMPLEM_NAME  SALARY
---------- ------------ ----------
         2 Masha        7500
*/

/*1.3 �������� ��������� �������, ��������� �� ���� ��� ������� ������ ��������
3.2 � ����������� ������ No4: ��� ���� �������, ���'������ ����� PK-������� �� FK-�������,
�������� ������� ��������� ���� ������� ����� �� ����� ������� � ������������� ���-
���������� �������. �������� ���� �������.*/
CREATE OR REPLACE VIEW Registrated_implementer
    (Implem_name, Salary, Service_name, Service_price)
    AS 
    SELECT I.Implem_name, I.Salary, L.Service_name, L.Service_price
    FROM Implementers I
    INNER JOIN List_Of_Services L 
    ON (I.Implem_Id=L.Service_implementer);
/*
View created.
*/

SELECT
    Implem_name, Salary, Service_name, Service_price
    FROM Registrated_implementer;
/*
IMPLEM_NAME                                  SALARY SERVICE_NAME SERVICE_PRICE
---------------------------------------- ---------- ------------ -------------
Sasha                                          7800            2           500
Maria                                          7500            3           700
Masha                                          7500            1           350
Lila                                           7900            1           650
Uliana                                         8300            3           650
Sasha                                          7800            3           650

6 rows selected.
*/


/*1.4 �������� ������� ��������� ������ ����� �� ���� � �������, �� ������� �� ������
� ������������ ��������.*/
INSERT INTO List_Of_Services 
    VALUES (10, 4, 770, 6);
/*
1 row created.
*/

SELECT Implem_name, 
    Salary, 
    Service_name, 
    Service_price
    FROM Registrated_implementer;
/*
IMPLEM_NAME                                  SALARY SERVICE_NAME SERVICE_PRICE
---------------------------------------- ---------- ------------ -------------
Alina                                          8000            4           770
Sasha                                          7800            2           500
Maria                                          7500            3           700
Masha                                          7500            1           350
Lila                                           7900            1           650
Uliana                                         8300            3           650
Sasha                                          7800            3           650

7 rows selected.
*/

