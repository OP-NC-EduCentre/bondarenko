--4.1 ��� ���� � ������� �������� ������� ��������� ������� ��� ������� (����
-- ������������) �� �������� ������� � ����������� �����: ������������ �������� 
-- ���� � ������� �� ���� ������ �� ����� ���������� ��������.
SELECT 
    List_id, 
	Service_name,
    Service_price,
    Service_implementer
FROM List_Of_Services 
WHERE 
    Service_price >= 500;
/*
   LIST_ID SERVICE_NAME SERVICE_PRICE SERVICE_IMPLEMENTER
---------- ------------ ------------- -------------------
         1            2           500                   3
         2            3           700                   1
*/

--4.2 ��� ���� � ������� �������� ������� ��������� ������� ��� ������� (����
-- ������������) �� �������� ������� � ����������� �����: ��������� �������� 
-- ���� � ������� �� ��������� � ������� ����������� ���������.
SELECT 
    Implem_Id,
    Implem_name,
    Salary
FROM Implementers
WHERE implem_name = 'Masha';
/*
 IMPLEM_ID IMPLEM_NAME  SALARY
---------- ------------ ----------
         2 Masha        8000
*/

--4.3 ��� ���� � ������� �������� ������� ��������� ������� ��� ������� (����
-- ������������) �� �������� ������� � ����������� �����: ��������� �������� 
-- ���� � ������� ������� ������ � ������� �� �������� �������� ���� 
-- ����� ���� �������.
SELECT 
    Implem_Id,
    Implem_name,
    Salary
FROM Implementers
WHERE implem_name LIKE 'S_s%';
/*
IMPLEM_ID IMPLEM_NAME   SALARY
---------- ------------ ----------
         3 Sasha        7800
*/

--4.4 � ������� 1.2 ���� ������ ������� ���� date. �������� ������� ��������� 
-- ������� ��� ������� (���� ������������) �� �������� ������� � ����������� 
-- �����: �������� ������ ������� ������ ����������� ��������.
SELECT 
    Reg_id,
    Reg_Client,
    Service_for_registration,
    Reg_Date
FROM Registration
WHERE Reg_Date IS NULL;
/*
 REG_ID REG_CLIENT    SERVICE_FOR_REGISTRATION REG_DATE
------- ------------- ------------------------ ---------
     4  Ivan Kulov                           2 
*/

-- 4.5 �������� ������� ��������� ������� ��� ������� (���� ������������) 
-- �� �������� ������� � ����������� �����, �� ����� ����� � ����� ������� 
-- 4.1 �� 4.2
SELECT 
    Implem_Id,
    Implem_name,
    Salary
FROM Implementers
WHERE implem_name = 'Masha' AND Salary > 5000;
/*
 IMPLEM_ID IMPLEM_NAME  SALARY
---------- ------------ ----------
         2 Masha        8000
*/

-- 4.6 �������� ������� ��������� ������� ��� ������� (���� ������������) �� 
-- �������� ������� � ����������� �����, �� ������� ��������� ������ 4.5
SELECT 
    Implem_Id,
    REVERSE(Implem_name),
    Salary
FROM Implementers
WHERE implem_name = 'Masha' AND Salary > 5000;
-- ��� �� ����������� ��� "int" �� �����, �� �������� �������� ���� ��'�
/*
 IMPLEM_ID IMPLEM_NAME  SALARY
---------- ------------ ----------
         2 ahsaM        8000
*/
                                                             
