/*1. Одна з колонок таблиць повинна містити строкове значення з трьома різними буквами у
першій позиції. Створіть запит, який отримає три рядки таблиці з урахуванням трьох букв,
використовуючи оператор LIKE.*/
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

/*2. Повторіть завдання 1, використовуючи регулярні вирази з альтернативними варіантами.*/
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

/*3. Одна з колонок таблиць повинна містити строкове значення з цифрами від 3 до 8 у
будь-якій позиції. Створіть запит, який отримає рядки таблиці з урахуванням присутності у
вказаній колонці будь-якої цифри від 3 до 8.*/
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

/*4. Створіть запит, який отримає рядки таблиці з урахуванням відсутності в зазначеній
колонці будь-якої цифри від 3 до 8.*/
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

/*5. Створіть запит, який отримає рядки таблиці з урахуванням присутності в раніше вказаній
колонці поєднання будь-яких трьох цифр розміщених підряд від 3 до 8.*/
SELECT Reg_id, Reg_Client, Client_Passport
	FROM Registration
	WHERE regexp_like(Client_Passport, '[3-8]{3}');
/*
    REG_ID REG_CLIENT                               CLIENT_PASSPORT
---------- ---------------------------------------- --------------------
         3 Vasil Chyb                               LK901475
        33 Sergei Tryn                              QA159637
*/
