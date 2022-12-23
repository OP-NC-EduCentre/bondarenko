/*4.1. Виконайте введення 5 рядків у таблицю бази даних із динамічною генерацією
команди. Значення первинного ключа генеруються автоматично, решта даних дублюється.*/
DECLARE
    v_REG_ID REGISTRATION.REG_ID%TYPE := 26; 
	v_REG_CLIENT REGISTRATION.REG_CLIENT%TYPE; 
	v_SERVICE_FOR_REGISTRATION 
    REGISTRATION.SERVICE_FOR_REGISTRATION%TYPE; 
	v_REG_DATE REGISTRATION.REG_DATE%TYPE; 
	v_CLIENT_PASSPORT REGISTRATION.CLIENT_PASSPORT%TYPE; 
	sql_str VARCHAR2(500);
BEGIN
	sql_str := 'INSERT INTO REGISTRATION(REG_ID, REG_CLIENT, 
    SERVICE_FOR_REGISTRATION, REG_DATE, CLIENT_PASSPORT)' 
					|| ' VALUES(:1,:2,:3,:4,:5)';
	FOR i IN 1..5 LOOP
		v_REG_ID := REG_ID.NEXTVAL;
		v_REG_CLIENT := 'Anton Schevcov';
		v_SERVICE_FOR_REGISTRATION := 4;
		v_REG_DATE := TO_DATE('15/10/2022','DD/MM/YYYY');
		v_CLIENT_PASSPORT := 'LM039935';
		EXECUTE IMMEDIATE sql_str 
			USING v_REG_ID, v_REG_CLIENT, v_SERVICE_FOR_REGISTRATION, 
					v_REG_DATE, v_CLIENT_PASSPORT;
	END LOOP;	
END;
/*
PL/SQL procedure successfully completed.
*/

/*4.2. Скласти динамічний запит створення таблиці, іменами колонок якої будуть 
значення будь-якої символьної колонки. Попередньо виконати перевірку існування 
таблиці з її видаленням.*/
DECLARE 
	create_str VARCHAR2(99);
	v_count NUMBER;
	CURSOR c1 IS
		SELECT REG_CLIENT FROM REGISTRATION;
BEGIN
	BEGIN
		EXECUTE IMMEDIATE 'DROP TABLE REGISTRATION_new';
	EXCEPTION
		WHEN OTHERS THEN
			NULL;
	END;
	create_str := 'CREATE TABLE REGISTRATION_new (';
	FOR REGISTRATION IN c1 LOOP
		create_str := create_str || REGISTRATION.REG_CLIENT || ' VARCHAR2(99),';
	END LOOP;
	create_str := RTRIM(create_str,',') || ')';
	EXECUTE IMMEDIATE create_str;
END;
/*
PL/SQL procedure successfully completed.
*/

/*4.3. Команда ALTER SEQUENCE може змінювати початкове значення генератора
починаючи з СУБД версії 12. Для ранніх версій доводиться виконувати дві команди: 
видалення генератора та створення генератора з новим початковим значенням.
З урахуванням вашої предметної області створити анонімний PL/SQL-блок, який
викликатиме один із варіантів SQL-запитів зміни початкового значення генератора 
залежно від значення версії СУБД.*/
DECLARE 
    sequen_count NUMBER(3) := 1; 
    sequen_start_with NUMBER(3) := 1; 
    sequen_increment_by NUMBER(3) := 1; 
    sequen_name VARCHAR(20) := 'sequen_test'; 
BEGIN 
    SELECT COUNT (*) INTO sequen_count FROM all_sequences 
    WHERE sequence_name = sequen_name; 
        DBMS_OUTPUT.PUT_LINE('Current DB verion is: ' || DBMS_DB_VERSION.VERSION); 
        IF (DBMS_DB_VERSION.VERSION > 12) THEN 
            EXECUTE IMMEDIATE 'ALTER SEQUENCE ' ||  sequen_name || 'sequen_1'; 
            DBMS_OUTPUT.PUT_LINE('Sequence ' || sequen_name || ' altered.'); 
        ELSE 
            EXECUTE IMMEDIATE 'DROP SEQUENCE' ||  sequen_name; 
            DBMS_OUTPUT.PUT_LINE('Sequence ' || sequen_name || ' droped.'); 
            EXECUTE IMMEDIATE 'CREATE SEQUENCE ' ||  sequen_name
                    || 'START WITH' || sequen_start_with 
                    || 'INCREMENT BY' || sequen_increment_by; 
            DBMS_OUTPUT.PUT_LINE('Sequence ' || sequen_name || ' created.'); 
        END IF;  
END; 
/*
Sequence sequen_test altered.
*/
	
