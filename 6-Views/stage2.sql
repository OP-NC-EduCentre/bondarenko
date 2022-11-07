/*2.1 �������� ��������� �������, ��������� �� ���� ��� ������� ������ 
�������� 2.3 � ����������� ������ No5, ��� ������� ����� �WITH READ ONLY�: 
�������� ���������� ��� �������� ����. �������� ���� �������.*/
CREATE OR REPLACE VIEW objecttype_attr
            (object_code,
             attr_id,
             attr_code,
             attr_name)
AS
SELECT O.CODE,A.ATTR_ID,A.CODE,A.NAME
FROM objtype o,
     attrtype a
WHERE o.object_type_id = a.object_type_id
ORDER BY a.object_type_id, a.attr_id
WITH READ ONLY;

SELECT object_code,
       attr_id,
       attr_code,
       attr_name
FROM objecttype_attr;
/*
CODE        ATTR_ID CODE       NAME
---------- -------- ---------- --------------------
Services          1 Serv_id    �����_�������

Services          2 Serv_name  �����_�������

List_Of_Se        3 List_id    �����_�������_��_���
rvices                         ���

List_Of_Se        4 Service_na �����_�������_��_���
rvices              me         ���

List_Of_Se        5 Service_pr �������
rvices              ice

List_Of_Se        6 Service_im �����_�����._������.
rvices              plementer  

Registrati        7 Reg_id     �����_������
on

Registratio       8 Reg_Client ���������_�볺��
on

Registratio       9 Service_fo �������_��_������
on                  r_registra
                    tion
*/

/*2.2 �������� ��������� ������ ����� � ��������� �������, �������� � ������������
�������. �������������� ������� ����.*/
DELETE FROM objecttype_attr WHERE objecttype_attr.attr_id = 4;
/*
ERROR at line 1:
ORA-42399: cannot perform a DML operation on a read-only view

�������� ����� �� ����� ��� �� view ������ ���� � ����� ��� �������
*/

/*2.3 �������� ��������� �������, �� ������ �� �������:
����� �����, ������� ���������� ��'���� �����. �������� ���� �������.*/
CREATE OR REPLACE VIEW object_count
    (object_type, objects_count)
AS
SELECT objtype.name,
       COUNT(objects.object_id)
FROM objtype,
     objects
WHERE objects.object_type_id = objtype.object_type_id
GROUP BY objtype.name;

SELECT object_type, objects_count FROM object_count;

/*
OBJECT_TYPE   OBJECTS_COUNT
------------- -------------
������_������ 2
�������       2          
*/

/*2.4 ��������� ��������� ��������� �������� ���� ����� � ��������� �������,
�������� � ������������ �������. �������������� ������� ����.*/
UPDATE object_count
SET objects_count = 3
WHERE object_count.object_type = '�������_�������';
/*
ORA-01732: data manipulation operation not legal on this view
�� ������� � ����������� ������� ���������, ���� �� �� ��������� �������� ���� �������*/