--2.1 ��� ���� � ������� �������� ������� ��������� ������� ��� ������� (����
-- ������������) � ��� ������.
SELECT 
    Serv_id,
	Serv_name 
FROM Services;
/*
   SERV_ID SERV_NAME      
---------- -----------
         2 Haircut        
         1 Manicure       
         3 Massage  
*/

--2.2 ��� ���� � ������� �������� ������� ��������� ������ ����� ������� �
-- ������������� ����-��� ����������� ��������. ��� �������� �� �����
-- ��������� ��� ��������� ������� ���� ����� ���������.
SELECT 
    Salary, 
	12*Salary AS Yeahr_Salary
FROM Implementers;
/* 
     SALARY YEAHR_SALARY
----------- ------------
      7500        90000
      8000        96000
      7800        93600
*/

-- 2.3 ��� ���� � �������, �� ������ ������� ���������� ����� �������� 
-- ������� ��������� �������� ������� ��� ���������� �������.
SELECT DISTINCT 
    Service_name 
FROM List_Of_Services;
/*
SERVICE_NAME
------------
           1
           2
           3
*/

-- 2.4 ��� ���� � ������� �������� ������� ��������� ���������� ������������ 
--������� ����-���� ���� �������. ��� �������� �� ������� ����� ��������� 
--������ ������ �UNION=�.
SELECT 
   'UNION = ' || Implem_name || ' has salary = ' || Salary
FROM Implementers;
-- ���������: ����������� ��� ����������� �� ��� �������� ����� ��
/*
UNION = Maria has salary = 7500
UNION = Masha has salary = 8000
UNION = Sasha has salary = 7800
*/

--2.5 ������������ ������ �������� 2.2, ��������� � ������� ��������� ��������
--���������.
SELECT 
    Salary, 
	12*Salary AS Yeahr_Salary
FROM Implementers
ORDER BY Yeahr_Salary ASC;
-- ���������: ����������� ������� �� ����� "Yeahr_Salary"
/*
    SALARY YEAHR_SALARY
---------- ------------
      7500        90000
      7800        93600
      8000        96000
*/

--2.6 ��� ���� � ������� �������� ������� ��������� �������� ���� �������, 
-- �������� ���� ���������� � ������� ��������� (��� ����� �������) �� � 
-- ������� ��������� (����� �������).
SELECT 
    Implem_id, 
	12*Salary AS Yeahr_Salary
FROM Implementers
ORDER BY Implem_id ASC, Yeahr_Salary DESC;
/*
 IMPLEM_ID YEAHR_SALARY
---------- ------------
         1        96000
         2        93600
         3        90000
*/
