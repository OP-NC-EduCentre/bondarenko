/*2.1 ��� ���� � ������� �������� ������� ��������� ���������� ������� ������� 
� ������������ ������� ������� � ������ ������, ����� � �����. ��� �������� 
�� ����� ��������� ��� ������� ������� ���� ����� ���������.
*/
SELECT INITCAP(Implem_name) AS Name
FROM Implementers;
/*
NAME
----------
Lila
Maria
Masha
Sasha
Alina
*/

/*2.2. ������������ ������ ������������ ��������, ��������� ������� ��������� 
�������� ������� ������� � �������. 
*/
UPDATE Implementers SET Implem_name = INITCAP(Implem_name);
/*
5 rows updated.
*/

/*2.3 ��� ���� � ���������� ������� ���� � ������� �������� ������� ���������
��������, �������� �� ����������� ������ �����.
*/
-- ��������� �������� ������� ����� �������
SELECT MIN(LENGTH(Serv_name)) AS Min_of_serv_name
FROM Services;
/*
MIN_OF_SERV_NAME
----------------
               6
*/

-- ��������� ����������� ������� ����� �������
SELECT MAX(LENGTH(Serv_name)) AS Max_of_serv_name
FROM Services;
/*
MAX_OF_SERV_NAME
----------------
               8
*/

-- ��������� ����������� ������� ����� �������
SELECT AVG(LENGTH(Serv_name)) AS Avarage_of_serv_name
FROM Services;
/*
AVARAGE_OF_SERV_NAME
--------------------
                   7
*/

/*2.4 ��� ������� ���� date ���� � ������� �������� ������� ���, ����� �� 
������, �� ������� �� �������. 
*/ 
SELECT months_between(SYSDATE, Reg_Date) AS Months,
    (SYSDATE - Reg_Date)/7 AS Weeks,
    SYSDATE - Reg_Date AS Days 
    FROM Registration;
 /*
     MONTHS      WEEKS       DAYS
---------- ---------- ----------
3.30870856  14.509995 101.569965
3.59903114 15.7957093 110.569965
4.37322469 19.0814236 133.569965

.082902106 .367137897 2.56996528
1.59903114 6.93856647 48.5699653

6 rows selected.
*/
   
   
   
   
   