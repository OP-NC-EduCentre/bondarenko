-- 6.1 ��� ���� � ������� �������� ������� ��������� ������� ����� �������.
SELECT 
    COUNT(Implem_Id)
FROM Implementers;
/*
COUNT(IMPLEM_ID)
----------------
               4
*/

-- 6.2 ��� ���� � ������� �������� ������� ��������� ���� ������� ���� � 
-- ����� �������.
SELECT 
    SUM(Salary)
FROM Implementers;
/*
SUM(SALARY)
-----------
      29300
*/

-- 6.3 ��� ���� � ������� �������� ������� ��������� ���������� ����� ������� 
--���� � ������� � �������
SELECT 
    COUNT(Implem_Id) AS Amount_of_implementers
FROM Implementers
GROUP BY Salary;
/*
AMOUNT_OF_IMPLEMENTERS
----------------------
                     2
                     1
                     1
*/

-- 6.4 ������������ ������ ������������ �������� ���, ��� � ������ ����
-- ������������ ����� � ����������� ������ �����, �� ������ ����������� 
-- ������� ���������.
SELECT 
    Salary,
    COUNT(Implem_Id) AS Amount_of_implementers
FROM Implementers
GROUP BY Salary;
/*
    SALARY AMOUNT_OF_IMPLEMENTERS
---------- ----------------------
      8000                      2
      7800                      1
      7500                      1
*/