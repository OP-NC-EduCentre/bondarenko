--3.1 �������� ������� ����� �������� �������.
CREATE TABLE LISTS (
	ATTR_ID NUMBER(10),
	LIST_VALUE_ID NUMBER(10),
	VALUE VARCHAR(4000)
);
/*
Table created.
*/

ALTER TABLE LISTS ADD CONSTRAINT LISTS_PK
	PRIMARY KEY (LIST_VALUE_ID);
ALTER TABLE LISTS ADD CONSTRAINT LISTS_ATTR_ID_FK
	FOREIGN KEY (ATTR_ID) REFERENCES ATTRTYPE(ATTR_ID);
/*
Table altered.
*/    

--3.2 ��� ������ � ���������� ����, ���� ���� ������ ������ ������� �������� 
-- �������, ��������� ����� �������� �������.
INSERT INTO LISTS(ATTR_ID, LIST_VALUE_ID, VALUE) 
	VALUES(6, 1, 'Petro Lypin');
INSERT INTO LISTS(ATTR_ID, LIST_VALUE_ID, VALUE) 
	VALUES(6, 2, 'Marina Kyleba');
INSERT INTO LISTS(ATTR_ID, LIST_VALUE_ID, VALUE) 
	VALUES(6, 3, 'Karina Petrova');


--3.3 �������� ���������� ��� ������ ��������.
SELECT O.CODE,A.ATTR_ID,A.CODE,A.NAME,L.LIST_VALUE_ID, L.VALUE
	FROM OBJTYPE O, ATTRTYPE A, LISTS L
	WHERE 	O.OBJECT_TYPE_ID = A.OBJECT_TYPE_ID 
			AND A.ATTR_ID = L.ATTR_ID
	ORDER BY A.OBJECT_TYPE_ID,A.ATTR_ID;
    
/*
CODE        ATTR_ID CODE       NAME                 LIST_VALUE_ID VALUE
---------- -------- ---------- -------------------- ------------- --------------------
List_Of_Se        6 Service_im �����_�����._������             1    Petro Lypin
rvices              plementer  .

List_Of_Se        6 Service_im �����_�����._������             3    Karina Petrova
rvices              plementer  .

List_Of_Se        6 Service_im �����_�����._������             2   Marina Kyleba
rvices              plementer  .
*/