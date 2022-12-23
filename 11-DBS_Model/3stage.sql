/*3.1. Виконайте DELETE-запит із попередніх рішень, додавши аналіз даних із 
неявного курсору. Наприклад, кількість віддалених рядків*/
BEGIN
	DELETE FROM REGISTRATION;
	DBMS_OUTPUT.PUT_LINE('Total deleted rows = ' || SQL%ROWCOUNT);
END;
/*
Total deleted rows = 10
*/

/*3.2. Повторіть виконання завдання 3 етапу 1 з використанням явного курсору.*/
DECLARE
    CURSOR IMPLEMENTERS_LIST IS 
        SELECT  IMPLEM_ID, IMPLEM_NAME  FROM IMPLEMENTERS;
	v_AVG_SAL IMPLEMENTERS.SALARY%TYPE;
	v_MANAGER NUMBER NOT NULL;
    IMPLEMENTERS_REC IMPLEMENTERS_LIST%ROWTYPE;
BEGIN
    OPEN IMPLEMENTERS_LIST;
    FETCH IMPLEMENTERS_LIST INTO IMPLEMENTERS_REC;
    WHILE IMPLEMENTERS_LIST%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(IMPLEMENTERS_REC.IMPLEM_ID) 
        || IMPLEMENTERS_REC.IMPLEM_NAME);
		FETCH IMPLEMENTERS_LIST INTO IMPLEMENTERS_REC;
	END LOOP;
	CLOSE IMPLEMENTERS_LIST;
END;
/*
10             Alina
1              Maria
2              Masha
3              Sasha
6              Alina
8              Uliana
7              Lila
15             Max
*/


/*3.3 З урахуванням вашої предметної області створити анонімний PL/SQL-блок, 
який викликатиме один із варіантів подібних SQL-запитів залежно від значення 
версії СУБД.
При вирішенні використовувати:
- значення змінної DBMS_DB_VERSION.VERSION;
- явний курсор із параметричним циклом.*/
DECLARE
CURSOR IMPLEMENTERS_LIST(v_IMPLEM_ID NUMBER) IS
    SELECT IMPLEM_ID, IMPLEM_NAME FROM IMPLEMENTERS
    WHERE IMPLEM_ID = v_IMPLEM_ID;
IMPLEMENTERS_REC IMPLEMENTERS_LIST%ROWTYPE; 
BEGIN	
IF DBMS_DB_VERSION.VERSION >= 12 THEN
FOR IMPLEMENTERS_REC IN IMPLEMENTERS_LIST(v_IMPLEM_ID) 
	LOOP
SELECT IMPLEM_ID, IMPLEM_NAME 
    FROM IMPLEMENTERS_SORT 
    WHERE Rown <= 5
		DBMS_OUTPUT.PUT_LINE(IMPLEMENTERS_REC.IMPLEM_ID
								|| IMPLEMENTERS_REC.IMPLEM_NAME);
 DBMS_OUTPUT.PUT_LINE(IMPLEMENTERS_REC.IMPLEM_ID 
        || IMPLEMENTERS_REC.IMPLEM_NAME);
        END LOOP;
ELSE
FOR IMPLEMENTERS_REC IN IMPLEMENTERS_LIST(v_IMPLEM_ID) 
	LOOP
    WITH IMPLEMENTERS_SORT_ID AS(
    SELECT IMPLEM_ID, IMPLEM_NAME 
    FROM IMPLEMENTERS
    ORDER BY IMPLEM_ID DESC),
    IMPLEMENTERS_SORT AS(
        SELECT 
        ROWNUM AS Rown, IMPLEM_ID, IMPLEM_NAME 
        FROM IMPLEMENTERS_SORT_ID
    )
    SELECT IMPLEM_ID, IMPLEM_NAME 
    FROM IMPLEMENTERS_SORT 
    WHERE Rown <= 5
		DBMS_OUTPUT.PUT_LINE(IMPLEMENTERS_REC.IMPLEM_ID
								|| IMPLEMENTERS_REC.IMPLEM_NAME);
END LOOP;
END IF;
END;
/*
 IMPLEM_ID IMPLEM_NAME
---------- --------------
        15 Max
        10 Alina
         8 Uliana
         7 Lila
         6 Alina
*/



        