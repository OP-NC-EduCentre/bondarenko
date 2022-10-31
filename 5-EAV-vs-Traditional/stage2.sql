--2.1. Створити таблицю описів атрибутних типів.
CREATE TABLE ATTRTYPE (
    ATTR_ID      		NUMBER(25),
    OBJECT_TYPE_ID 		NUMBER(25),
	OBJECT_TYPE_ID_REF 	NUMBER(25),
    CODE         		VARCHAR2(25),
    NAME         		VARCHAR2(40)
);
/*
Table created.
*/

ALTER TABLE ATTRTYPE ADD CONSTRAINT ATTRTYPE_PK
	PRIMARY KEY (ATTR_ID);
ALTER TABLE ATTRTYPE ADD CONSTRAINT ATTRTYPE_OBJECT_TYPE_ID_FK
	FOREIGN KEY (OBJECT_TYPE_ID) REFERENCES OBJTYPE (OBJECT_TYPE_ID);
ALTER TABLE ATTRTYPE ADD CONSTRAINT ATTRTYPE_OBJECT_TYPE_ID_REF_FK
	FOREIGN KEY (OBJECT_TYPE_ID_REF) REFERENCES OBJTYPE (OBJECT_TYPE_ID);
/*
Table altered.
*/

--2.2 Для раніше використаних класів UML-діаграми заповнити описи атрибутних типів.
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) 
	VALUES (1,1,NULL,'Serv_id','Номер_послуги');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) 
	VALUES (2,1,NULL,'Serv_name','Назва_послуги');
    
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) 
	VALUES (3,2,NULL,'List_id','Номер_послуги_із_списку'); 
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) 
	VALUES (4,2,1,'Service_name','Назва_послуги_із_списку');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) 
	VALUES (5,2,NULL,'Service_price','Вартість');  
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) 
	VALUES (6,2,NULL,'Service_implementer','Номер_викон._співроб.');

INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) 
	VALUES (7,3,NULL,'Reg_id','Номер_запису');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) 
	VALUES (8,3,NULL,'Reg_Client','Записаний_клієнт');
INSERT INTO ATTRTYPE (ATTR_ID,OBJECT_TYPE_ID,OBJECT_TYPE_ID_REF,CODE,NAME) 
	VALUES (9,3,NULL,'Service_for_registration','Послуга_із_запису');
    

--2.3 Отримати інформацію про атрибутні типи.
SELECT O.CODE,A.ATTR_ID,A.CODE,A.NAME
	FROM OBJTYPE O, ATTRTYPE A
	WHERE O.OBJECT_TYPE_ID = A.OBJECT_TYPE_ID
	ORDER BY A.OBJECT_TYPE_ID,A.ATTR_ID;
    
/*
CODE        ATTR_ID CODE       NAME
---------- -------- ---------- --------------------
Services          1 Serv_id    Номер_послуги

Services          2 Serv_name  Назва_послуги

List_Of_Se        3 List_id    Номер_послуги_із_спи
rvices                         ску

List_Of_Se        4 Service_na Назва_послуги_із_спи
rvices              me         ску

List_Of_Se        5 Service_pr Вартість
rvices              ice

List_Of_Se        6 Service_im Номер_викон._співроб.
rvices              plementer  

Registrati        7 Reg_id     Номер_запису
on

Registratio       8 Reg_Client Записаний_клієнт
on

Registratio       9 Service_fo Послуга_із_запису
on                  r_registra
                    tion
*/

--2.4 Отримати інформацію про атрибутні типи та можливі зв'язки між ними типу 
-- «іменована асоціація».
SELECT O.CODE,
    A.ATTR_ID,
    A.CODE,
    A.NAME, 
    O_REF.CODE O_REF
	FROM OBJTYPE O, 
    ATTRTYPE A 
    LEFT JOIN OBJTYPE O_REF ON 
    (A.OBJECT_TYPE_ID_REF = O_REF.OBJECT_TYPE_ID)
	WHERE O.OBJECT_TYPE_ID = A.OBJECT_TYPE_ID
	ORDER BY A.OBJECT_TYPE_ID,A.ATTR_ID;

/*
CODE        ATTR_ID CODE       NAME                 O_REF
---------- -------- ---------- -------------------- --------------------
Services          1 Serv_id    Номер_послуги

Services          2 Serv_name  Назва_послуги

List_Of_Se        3 List_id    Номер_послуги_із_спи
rvices                         ску

List_Of_Se        4 Service_na Назва_послуги_із_спи Services
rvices              me         ску

List_Of_Se        5 Service_pr Вартість
rvices              ice

List_Of_Se        6 Service_im Номер_викон._співроб.
rvices              plementer  

Registrati        7 Reg_id     Номер_запису
on

Registratio       8 Reg_Client Записаний_клієнт
on

Registratio       9 Service_fo Послуга_із_запису
on                  r_registra
                    tion
*/
