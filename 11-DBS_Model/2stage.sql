/*2.1. Повторити виконання завдання 3 етапу 1, забезпечивши контроль відсутності 
даних у відповіді на запит із використанням винятку.*/
DECLARE
	v_AVG_SAL IMPLEMENTERS.SALARY%TYPE;
	v_MANAGER NUMBER NOT NULL := 6;
BEGIN
	SELECT AVG(SALARY) INTO v_AVG_SAL
	FROM IMPLEMENTERS
	WHERE MANAGER = v_MANAGER;
	DBMS_OUTPUT.PUT_LINE('Average salary =' || v_AVG_SAL);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('There is no data.');
END;
/*
NO_DATA _FOUND
*/

/*2.2. Повторити виконання завдання 3 етапу 1, забезпечивши контроль отримання
багаторядкової відповіді на запит.*/
DECLARE
	v_AVG_SAL IMPLEMENTERS.SALARY%TYPE;
	v_MANAGER NUMBER NOT NULL := 6;
BEGIN
	SELECT AVG(SALARY) INTO v_AVG_SAL
	FROM IMPLEMENTERS
	WHERE MANAGER = v_MANAGER;
	DBMS_OUTPUT.PUT_LINE('Average salary =' || v_AVG_SAL);
EXCEPTION
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('Only one value is expected.');
END;
/*
NO_DATA _FOUND
*/

/*2.3. Повторити виконання завдання 3 етапу 1, забезпечивши контроль за внесенням
унікальних значень.*/
DECLARE
	v_AVG_SAL IMPLEMENTERS.SALARY%TYPE;
	v_MANAGER NUMBER NOT NULL := 6;
BEGIN
	SELECT AVG(SALARY) INTO v_AVG_SAL
	FROM IMPLEMENTERS
	WHERE MANAGER = v_MANAGER;
	DBMS_OUTPUT.PUT_LINE('Average salary =' || v_AVG_SAL);
EXCEPTION
	WHEN DUP_VAL_ON_INDEX  THEN
		DBMS_OUTPUT.PUT_LINE('This value is already exists!');
END;
/*
Average salary =7600
*/