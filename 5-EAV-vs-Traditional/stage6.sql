--6.1 �������� ������� ����� ��'���� "��������� ���������" �� ������������ ��'����.
CREATE TABLE OBJREFERENCE (
	ATTR_ID   NUMBER(20),
	REFERENCE NUMBER(20),
	OBJECT_ID NUMBER(20)
); 

ALTER TABLE OBJREFERENCE ADD CONSTRAINT OBJREFERENCE_PK
	PRIMARY KEY (ATTR_ID,REFERENCE,OBJECT_ID);
ALTER TABLE OBJREFERENCE ADD CONSTRAINT OBJREFERENCE_REFERENCE_FK
	FOREIGN KEY(REFERENCE) REFERENCES OBJECTS(OBJECT_ID);
ALTER TABLE OBJREFERENCE ADD CONSTRAINT OBJREFERENCE_OBJECT_ID_FK
	FOREIGN KEY (OBJECT_ID) REFERENCES OBJECTS(OBJECT_ID);
ALTER TABLE OBJREFERENCE ADD CONSTRAINT OBJREFERENCE_ATTR_ID_FK
	FOREIGN KEY (ATTR_ID) REFERENCES ATTRTYPE (ATTR_ID);

--6.2 ��������� ������� ��'���� � ����������� �������� ��'���� ���������� ���������� 
-- �� ����� ���������� ������������ ��'���� �����.
/*
��������� ��'���� "Services" - "Massage" (OBJECT_ID = 3)
��'������ � ����������� ��'���� "Registration 2" ( OBJECT_ID = 2 )
���������� ��'����� "FILL" (ATTR_ID = 7) �� �������� "������ �� ������"
*/
INSERT INTO OBJREFERENCE (ATTR_ID,OBJECT_ID,REFERENCE) 
	VALUES (7,3,2);
/*
1 row created.
*/