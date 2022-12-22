/*1.1. Виберіть таблицю бази даних, що містить стовпець типу date. Оголосіть 
змінні, що відповідають стовпцям цієї таблиці, використовуючи посилальні типи 
даних. Надайте змінним значення, використовуйте SQL-функції для формування 
значень послідовності, перетворення дати до вибраного стилю. Виведіть на екран*/
DECLARE
	v_REG_ID REGISTRATION.REG_ID%TYPE := 26; 
	v_REG_CLIENT REGISTRATION.REG_CLIENT%TYPE := 'Anton Schevcov'; 
	v_SERVICE_FOR_REGISTRATION 
    REGISTRATION.SERVICE_FOR_REGISTRATION%TYPE := 4; 
	v_REG_DATE REGISTRATION.REG_DATE%TYPE := TO_DATE('15/10/2022','DD/MM/YYYY'); 
	v_CLIENT_PASSPORT REGISTRATION.CLIENT_PASSPORT%TYPE := 'LM039935'; 
BEGIN
	DBMS_OUTPUT.PUT_LINE('REG_ID - ' || v_REG_ID);
	DBMS_OUTPUT.PUT_LINE('REG_CLIENT - ' || v_REG_CLIENT);
    DBMS_OUTPUT.PUT_LINE('ERVICE_FOR_REGISTRATION - ' || v_SERVICE_FOR_REGISTRATION);
	DBMS_OUTPUT.PUT_LINE('REG_DATE - ' || v_REG_DATE);
    DBMS_OUTPUT.PUT_LINE('CLIENT_PASSPORT - ' || v_CLIENT_PASSPORT);
END;
/*
REG_ID - 26
REG_CLIENT - Anton Schevcov
ERVICE_FOR_REGISTRATION - 4
REG_DATE - 15.10.22
CLIENT_PASSPORT - LM039935
*/

/*1.2. Додати інформацію до однієї з таблиць, обрану у попередньому завданні.
Використовувати формування нового значення послідовності та перетворення формату 
дати.*/
DECLARE
	v_reg REGISTRATION%ROWTYPE; 
BEGIN
	v_reg.REG_ID := 27;
	v_reg.REG_CLIENT := 'Lisa Petrova'; 
	v_reg.SERVICE_FOR_REGISTRATION := 5; 
	v_reg.REG_DATE := TO_DATE('20/12/2022','DD/MM/YYYY'); 
	v_reg.CLIENT_PASSPORT := 'PR749935'; 
	DBMS_OUTPUT.PUT_LINE('REG_ID - ' || v_reg.REG_ID);
    DBMS_OUTPUT.PUT_LINE('REG_CLIENT - ' || v_reg.REG_CLIENT);
    DBMS_OUTPUT.PUT_LINE('SERVICE_FOR_REGISTRATION - ' 
    || v_reg.SERVICE_FOR_REGISTRATION);
    DBMS_OUTPUT.PUT_LINE('REG_DATE - ' || v_reg.REG_DATE);
    DBMS_OUTPUT.PUT_LINE('CLIENT_PASSPORT - ' || v_reg.CLIENT_PASSPORT);
END;
/*
REG_ID - 27
REG_CLIENT - Lisa Petrova
SERVICE_FOR_REGISTRATION - 5
REG_DATE - 20.12.22
CLIENT_PASSPORT - PR749935
*/

/*1.3. Для однієї з таблиць створити команду отримання середнього значення 
однієї з цілих колонок, використовуючи умову вибірки за заданим значенням іншої 
колонки. Результат присвоїти змінній і вивести на екран.*/
DECLARE
	v_AVG_SAL IMPLEMENTERS.SALARY%TYPE;
	v_MANAGER NUMBER NOT NULL := 6;
BEGIN
	SELECT AVG(SALARY) INTO v_AVG_SAL
	FROM IMPLEMENTERS
	WHERE MANAGER = v_MANAGER;
	DBMS_OUTPUT.PUT_LINE('Average salary =' || v_AVG_SAL);
END;
/*
Average salary =7600
*/

/*1.4. Виконайте введення 5 рядків у таблицю бази даних, використовуючи цикл з
параметрами. Значення первинного ключа генеруються автоматично, решта даних 
дублюється.*/
DECLARE
	v_REG_ID REGISTRATION.REG_ID%TYPE;
    i NUMBER(2) := 0;
BEGIN
	v_REG_ID := REG_ID.NEXTVAL;
    IF i < 5 THEN
	INSERT INTO REGISTRATION(REG_ID, REG_CLIENT, SERVICE_FOR_REGISTRATION,
    REG_DATE, CLIENT_PASSPORT)
	VALUES(v_REG_ID, 'Olya Kyluba', 10,
			to_date('17/01/2022','DD/MM/YYYY'), 'IM009966');
    i := i + 1;
    END IF;
END;
/*
PL/SQL procedure successfully completed.
*/