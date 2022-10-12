-- 5.1 ��� ���� � �������, �� ������ ��������� �������� ���������� �����, 
-- �������� ������� ���� �������� ������� ���������� ����� �� ��������, ��� 
-- ������ � ������� ���������� ����� �������� �������. ��������� ������� 
-- ���� �� ���� ����.
UPDATE List_Of_Services
SET Service_implementer = 75
WHERE 
    List_id = 1;
/*
ERROR at line 1:
ORA-02291: integrity constraint (BONDARENKO.SERVICE_IMPLEMENTER_FK) violated -
parent key not found
*/

-- 5.2 ��������� ������ �������� 5.1, ��� ����, �� �� ���������� �� ��������� 
-- �������� ���������� �����.
UPDATE List_Of_Services
SET Service_implementer = 2
WHERE 
    List_id = 1;
/*
1 row updated.
*/

-- 5.3 ��� ���� � �������, �� ������ ��������� �������� ���������� �����, 
--���'����� � �������� ���������� ����� ���� �������, �������� ���� ������� 
--��������� ����� � ��������� ������� ���������� �����, �� � � ������� 
--���������� ����� ���� �������. ��������� ������� ���� ���������.
DELETE FROM Implementers
WHERE 
    Implem_id = 58;
/*
ERROR at line 1:
ORA-02292: integrity constraint (BONDARENKO.SERVICE_IMPLEMENTER_FK) violated -
child record found
*/

-- 5.4 ��������� ������ �������� 5.3, ��� ����, �� �� ���������� �� ��������� 
-- �������� ���������� �����.
DELETE FROM Implementers
WHERE 
    Implem_id = 4;
/*
1 rows deleted.
*/

-- 5.5 ��� ���� � �������, �� ������ ��������� �������� ���������� �����, 
--�������� ������� ���� �������� ������� ���������� ����� �� ��������, ��� 
--������� � ������� ���������� ����� �������� �������. ��������� ������� 
--���� �� ���� ����.
UPDATE Implementers
SET Implem_Id = 2
WHERE 
    Implem_Id = 4;
/*
   ERROR at line 1:
ORA-00001: unique constraint (BONDARENKO.IMPLEM_ID_PK) violated
*/

--5.6 ��������� ������ �������� 5.5, ��� ����, �� �� ���������� �� ��������� 
--�������� ���������� �����, ����� �������� ������� ���� �������� ������� 
--���������� ����� �� ��������, ��� ��� �� ������� � ������� ���������� ����� 
--�������� �������.
UPDATE Implementers
SET Implem_Id = 6
WHERE 
    Implem_Id = 4;
/*
1 row updated.
*/
    