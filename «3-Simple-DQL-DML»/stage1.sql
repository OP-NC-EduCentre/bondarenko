-- 1.4 ������������ �������� ������� �������� ���� = 'dd/mm/yyyy'
ALTER SESSION SET NLS_DATE_FORMAT = 'dd/mm/yyyy';
-- ������� ������ ����

-- 1.1 �������� ����� � ������� "Services"
INSERT INTO Services (Serv_id, Serv_name) VALUES (1,'Manicure');
INSERT INTO Services (Serv_id, Serv_name) VALUES (2,'Haircut');
INSERT INTO Services (Serv_id, Serv_name) VALUES (3,'Massage');
-- ��������� ������� "Services" �������

-- 1.1 �������� ����� � ������� "Implementers"
INSERT INTO Implementers (Implem_Id, Implem_name, Salary) 
    VALUES (1,'Maria', 7500.00);
INSERT INTO Implementers (Implem_Id, Implem_name, Salary) 
    VALUES (2,'Masha', 8000.00);
INSERT INTO Implementers (Implem_Id, Implem_name, Salary) 
    VALUES (3,'Sasha', 7800.00);
INSERT INTO Implementers (Implem_Id, Implem_name, Salary) 
    VALUES (4,'Alina', 8000.00);
-- ��������� ������� "Implementers" �������

-- 1.1 �������� ����� � ������� "List_Of_Services"
INSERT INTO List_Of_Services 
    (List_id, Service_name, Service_price, Service_implementer) 
    VALUES (1, 2, 500.00, 3);
INSERT INTO List_Of_Services 
    (List_id, Service_name, Service_price, Service_implementer) 
    VALUES (2, 3, 700.00, 1);
INSERT INTO List_Of_Services 
    (List_id, Service_name, Service_price, Service_implementer) 
    VALUES (3, 1, 350.00, 2);
-- ��������� ������� "List_Of_Services" �������

-- 1.2 ��������� ���� ������� Reg_Date - ���� ������
ALTER TABLE Registration ADD Reg_Date date;
-- �������� ���� �������

-- 1.1 �������� ����� � ������� "Registration" ��
-- 1.5 �������� ����� � ����������� ����
INSERT INTO Registration 
    (Reg_id, Reg_Client, Service_for_registration, Reg_Date) 
    VALUES (1, 'Anna Bond', 1, '10/07/2022');
INSERT INTO Registration 
    (Reg_id, Reg_Client, Service_for_registration, Reg_Date) 
    VALUES (2, 'Katerina Koval', 3, '1/07/2022');
INSERT INTO Registration 
    (Reg_id, Reg_Client, Service_for_registration, Reg_Date) 
    VALUES (3, 'Vasil Chyb', 2, '8/07/2022');
-- ��������� ������� "Registration" �������

-- 1.3 ��� ������� �������� ������� �� �������� ������ �����, ��� � ������������
-- ��������� ������� ���� date.
INSERT INTO Registration 
    (Reg_id, Reg_Client, Service_for_registration, Reg_Date) 
    VALUES (4, 'Ivan Kulov', 2, null);
-- ������ ������� � ������������ ��������� ������� ���� date.

--1.6 ��� ���� � �������, �� ������ ��������� �������� ������������ 
-- �����, ���������������� ��������� ������ ����� � ��������� �������, �� ������ 
-- �� ���������. ��������� ������� ���� �� ���� ����.
INSERT INTO Services (Serv_id, Serv_name) VALUES (4);
-- Error report -
-- SQL Error: ORA-00947: �� ������� �������� ��� ������
-- 00947. 00000 -  "not enough values"


-- 1.7 ��� ���� � �������, �� ������ ��������� �������� ���������� �����,
-- �������� ������� ��������� ������ ����� � ��������� ������� ���������� 
-- �����, ���� ������� � ������� ���������� ����� �������� �������. 
-- ��������� ������� ���� �� ������ ���������, ��� ������ ��������� 
-- �������� ���������� �����.
INSERT INTO List_Of_Services 
    (List_id, Service_name, Service_price, Service_implementer) 
    VALUES (4, 19, 950.00, 67);
-- Error report - ORA-02291: �������� ����������� ����������� 
-- (BONDARENKO.SERVICE_IMPLEMENTER_FK) - �������� ���� �� ������





    
