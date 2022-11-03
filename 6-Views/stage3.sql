/*3.1 �������� ������ �����������, ��'� ����� = �����_�������_����������+'EAV',
���������, blazhko_eav, � �������, ��������� ��� ��������� �� ���������� ������� �� EAV.*/
CREATE USER BONDARENKO_EAV IDENTIFIED BY oracle2022;
/*User created.*/
GRANT CONNECT TO BONDARENKO_EAV;
/*Grant succeeded.*/

/*3.2 �������� ������� �� EAV �� ��������� ������� ��'������ ���� �� ���������� ����,
������ ������ � ����������� ������ No5.*/
CREATE OR REPLACE VIEW BONDARENKO_EAV_OBJECT
    (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME)
    AS
    SELECT OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME
	FROM OBJECTS;
/*View created.*/

CREATE OR REPLACE VIEW BONDARENKO_EAV_ATTRIBUTE
    (ATTR_ID, OBJECT_ID, VALUE)
    AS
    SELECT ATTR_ID, OBJECT_ID, VALUE
	FROM ATTRIBUTES;
/* View created.*/

/*3.3 �������� ��������� ����������� ������� OBJECTS �� EAV, ������������� ����
���������� ��������� � ����������� ��� ���������� �������.*/
SELECT MAX(object_id) FROM BONDARENKO_EAV_OBJECT; --4
SELECT MAX(object_id) FROM BONDARENKO_EAV_ATTRIBUTE; --3
CREATE SEQUENCE OBJECTS_OBJECT_ID START WITH 5;
/*Sequence created.*/
CREATE SEQUENCE ATTRIBUTES_ATTR_ID START WITH 4;
/*Sequence created.*/

/*3.4 ����������� ����� ������� ������ ����������� �� ������� ����� ����� �� ���������
��������� �� ���� ��������� ������, �������� � ����������� ����� No2.*/
GRANT SELECT ON Services TO BONDARENKO_EAV;
/*Grant succeeded.*/
GRANT SELECT ON Implementers TO BONDARENKO_EAV;
/*Grant succeeded.*/
GRANT SELECT ON List_Of_Services TO BONDARENKO_EAV;
/*Grant succeeded.*/
GRANT SELECT ON Registration TO BONDARENKO_EAV;
/*Grant succeeded.*/

/*3.5 �������� ������� ������ ���� INSERT INTO ... SELECT, �� ����������� ���������
������� OBJECTS, ������ ������ ��� � ��������� ���� ����� ���� ��������� ������.*/
INSERT
INTO objects (object_id, parent_id, object_type_id, name)
SELECT objects_object_id.nextval, NULL, ot.object_type_id, s.name
FROM objtype ot,
     Services s
WHERE ot.code = 'Services';

SELECT object_id, parent_id, object_type_id, name FROM objects;

/*
OBJECT_ID PARENT_ID OBJECT_TYPE_ID NAME
--------- --------- -------------- --------------------
        1                        1 Pedicure
        2                        1 Highlighting
        3         1              2 Registration 1
        4         2              2 Registration 2
*/