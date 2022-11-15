/*1. Створіть запит, який отримає рядки таблиці з урахуванням присутності в раніше
вказаній колонці поєднання будь-яких двох підряд розташованих цифр, або трьох підряд
розташованих букв.*/
SELECT Reg_id, Reg_Client, Client_Passport
	FROM Registration 
WHERE 
     regexp_like(Client_Passport, '\d{2}|[a-zA-Z]{3}');
/*
    REG_ID REG_CLIENT                               CLIENT_PASSPORT
---------- ---------------------------------------- --------------------
         7 Katrena Mila                             FTW25140
         1 Anna Bond                                FPY84102
         2 Katerina Koval                           OK036987
         3 Vasil Chyb                               LK901475
         4 Ivan Kulov                               SW852341
        33 Sergei Tryn                              QA159637
         5 Katarina Melnyk                          FRU90990
         6 Petro Pila                               PL999909

8 rows selected.
*/

/*2. Одна з колонок таблиць повинна містити строкове значення з двома однаковими
буквами, що повторюються підряд. Створіть запит, який отримає рядки таблиці з таким значенням
колонки.*/    
SELECT Reg_id, Reg_Client, Client_Passport
	FROM Registration 
WHERE REGEXP_LIKE(Client_Passport, '([[:alpha:]])\1');
/*
    REG_ID REG_CLIENT                               CLIENT_PASSPORT
---------- ---------------------------------------- --------------------
         3 Vasil Chyb                               LL901475
         6 Petro Pila                               PP999909
*/

/*3.Одна з колонок таблиць повинна містити строкове значення з двома однаковими
словами, що повторюються підряд. Створіть запит, який отримає рядки таблиці з 
таким значенням колонки.*/
SELECT Reg_id, Reg_Client
	FROM Registration 
WHERE REGEXP_LIKE(Reg_Client, '(([[:alpha:]])+) \1');
/*
    REG_ID REG_CLIENT
---------- ----------------------------------------
        15 Name Name
        18 Test Test
*/

/*4. Одна з колонок таблиць повинна містити строкове значення з номером мобільного
телефону у форматі +XX(XXX)XXX-XX-XX, де X – цифра. Створіть запит, який отримає 
рядки таблиці з таким значенням колонки.*/
SELECT Implem_name, phone FROM Implementers
WHERE regexp_like(phone, '^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$');
/*
IMPLEM_NAME                              PHONE
---------------------------------------- --------------------
Alina                                    +38(066)789-74-15
Maria                                    +38(050)025-98-34
Masha                                    +38(095)499-10-32
Sasha                                    +38(066)556-96-74
Alina                                    +38(066)775-28-67
Uliana                                   +38(095)030-47-16
Lila                                     +38(095)855-74-01

7 rows selected.
*/

/*5. Одна з колонок таблиць має містити строкове значення з електронною поштовою
адресою у форматі EEE@EEE.EEE.UA, де E – будь-яка латинська буква. Створіть запит, який
отримає рядки таблиці з таким значенням колонки.*/
SELECT Implem_name, email 
    FROM Implementers 
    WHERE email LIKE '%@%.%.ua';
/*
IMPLEM_NAME                              EMAIL
---------------------------------------- --------------------
Alina                                    alina@gmail.com.ua
Maria                                    maria@gmail.com.ua
Sasha                                    sasha@gmail.com.ua
Uliana                                   uliana@gmail.com.ua
Lila                                     lila@gmail.com.ua
*/
