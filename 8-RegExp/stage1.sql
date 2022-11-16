/*1. ���� � ������� ������� ������� ������ �������� �������� � ������ ������ ������� �
������ �������. ������� �����, ���� ������ ��� ����� ������� � ����������� ����� ����,
�������������� �������� LIKE.*/
SELECT Reg_id, Reg_Client, Service_for_registration FROM Registration 
WHERE 
    Reg_Client LIKE 'K%' OR Reg_Client LIKE 'S%' OR Reg_Client LIKE 'A%';
/*
    REG_ID REG_CLIENT                               SERVICE_FOR_REGISTRATION
---------- ---------------------------------------- ------------------------
         7 Katrena Mila                                                   10
         1 Anna Bond                                                       1
         2 Katerina Koval                                                  3
        33 Sergei Tryn                                                    31
         5 Katarina Melnyk                                                 2
*/

/*2. �������� �������� 1, �������������� �������� ������ � ��������������� ���������.*/
SELECT Reg_id, Reg_Client, Service_for_registration FROM Registration 
WHERE 
     regexp_like(Reg_Client, 'K|S|A');
/*
    REG_ID REG_CLIENT                               SERVICE_FOR_REGISTRATION
---------- ---------------------------------------- ------------------------
         7 Katrena Mila                                                   10
         1 Anna Bond                                                       1
         2 Katerina Koval                                                  3
         4 Ivan Kulov                                                      2
        33 Sergei Tryn                                                    31
         5 Katarina Melnyk                                                 2

6 rows selected.
*/

/*3. ���� � ������� ������� ������� ������ �������� �������� � ������� �� 3 �� 8 �
����-��� �������. ������� �����, ���� ������ ����� ������� � ����������� ���������� �
������� ������� ����-��� ����� �� 3 �� 8.*/
SELECT Reg_id, Reg_Client, Client_Passport
	FROM Registration
	WHERE regexp_like(Client_Passport, '[3-8]');
/*
    REG_ID REG_CLIENT                               CLIENT_PASSPORT
---------- ---------------------------------------- --------------------
         7 Katrena Mila                             FT251403
         1 Anna Bond                                FP841028
         2 Katerina Koval                           OK036987
         3 Vasil Chyb                               LK901475
         4 Ivan Kulov                               SW852341
        33 Sergei Tryn                              QA159637
*/

/*4. ������� �����, ���� ������ ����� ������� � ����������� ��������� � ���������
������� ����-��� ����� �� 3 �� 8.*/
SELECT Reg_id, Reg_Client, Client_Passport
	FROM Registration
	WHERE regexp_like(Client_Passport, '[^3-8]$');
/*    
    REG_ID REG_CLIENT                               CLIENT_PASSPORT
---------- ---------------------------------------- --------------------
         4 Ivan Kulov                               SW852341
         5 Katarina Melnyk                          FR909900
         6 Petro Pila                               PL999909
*/

/*5. ������� �����, ���� ������ ����� ������� � ����������� ���������� � ����� �������
������� �������� ����-���� ����� ���� ��������� ����� �� 3 �� 8.*/
SELECT Reg_id, Reg_Client, Client_Passport
	FROM Registration
	WHERE regexp_like(Client_Passport, '[3-8]{3}');
/*
    REG_ID REG_CLIENT                               CLIENT_PASSPORT
---------- ---------------------------------------- --------------------
         3 Vasil Chyb                               LK901475
        33 Sergei Tryn                              QA159637
*/
