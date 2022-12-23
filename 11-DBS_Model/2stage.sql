/*2.1. ��������� ��������� �������� 3 ����� 1, ������������ �������� ��������� 
����� � ������ �� ����� �� ������������� �������.*/
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

/*2.2. ��������� ��������� �������� 3 ����� 1, ������������ �������� ���������
������������� ������ �� �����.*/
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

/*2.3. ��������� ��������� �������� 3 ����� 1, ������������ �������� �� ���������
��������� �������.*/
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