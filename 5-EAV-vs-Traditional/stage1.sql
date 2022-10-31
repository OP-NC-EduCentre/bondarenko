--1.1. Створити таблицю опису об'єктних типів.
CREATE TABLE OBJTYPE (
	OBJECT_TYPE_ID NUMBER(20),
	PARENT_ID      NUMBER(20),
	CODE           VARCHAR2(20),
	NAME           VARCHAR2(200),
	DESCRIPTION    VARCHAR2(1000)
);
/*
Table created.
*/

ALTER TABLE OBJTYPE ADD CONSTRAINT OBJTYPE_PK
	PRIMARY KEY (OBJECT_TYPE_ID);
ALTER TABLE OBJTYPE ADD CONSTRAINT OBJTYPE_CODE_UNIQUE
	UNIQUE (CODE);
ALTER TABLE OBJTYPE 
	MODIFY (CODE NOT NULL);
ALTER TABLE OBJTYPE ADD CONSTRAINT OBJTYPE_FK
	FOREIGN KEY (PARENT_ID) REFERENCES OBJTYPE(OBJECT_TYPE_ID);
/*
Table altered.
*/
    
--1.2 Нехай у лабораторній роботі No1 було створено UML-діаграму концептуальних 
--класів. Для трьох класів з UML-діаграми, пов'язаних між собою, бажано зв'язком 
--«узагальнення», «агрегатна асоціація» та «іменована асоціація», заповнити опис 
--об'єктних типів.
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) 
	VALUES (1,NULL,'Services','Послуги', NULL);
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) 
	VALUES (2,1,'List_Of_Services','Список_послуг', NULL);
INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) 
	VALUES (3,2,'Registration','Регістрація', NULL);
/*
3 rows created.
*/

--встановлення параметрів форматування колонок для SQLPlus
COL OBJECT_TYPE_ID FORMAT 9999999
COL PARENT_ID FORMAT 9999999
COL CODE FORMAT A10
COL NAME FORMAT A20
COL ATTR_ID FORMAT 9999999
COL OBJECT_ID FORMAT 9999999
COL LIST_VALUE_ID FORMAT 9999999
COL DESCRIPTION FORMAT A20
COL VALUE FORMAT A20

--1.3 Отримати інформацію про об'єктні типи.
SELECT OBJECT_TYPE_ID,
    PARENT_ID,
    CODE,
    NAME
    FROM OBJTYPE;
/*
OBJECT_TYPE_ID PARENT_ID CODE       NAME                 
-------------- --------- ---------- --------------------
             1           Services   Послуги
             2         1 List_Of_Se Список_послуг
                         rvices

             3         2 Registrati Рег?страц?я
                         on
*/   

--1.4 Отримати інформацію про об'єктні типи та можливі зв'язки між ними типу 
--«узагальнення», «агрегатна асоціація».
SELECT P.OBJECT_TYPE_ID,P.CODE,
    C.OBJECT_TYPE_ID OBJ_T_ID_LINK, C.CODE CODE_LINK
	FROM OBJTYPE C, OBJTYPE P
	WHERE P.OBJECT_TYPE_ID = C.PARENT_ID(+);  
/*
OBJECT_TYPE_ID CODE       OBJ_T_ID_LINK CODE_LINK
-------------- ---------- ------------- --------------------
             1 Services               2 List_Of_Services
             2 List_Of_Se             3 Registration
               rvices

             3 Registrati
               on
*/