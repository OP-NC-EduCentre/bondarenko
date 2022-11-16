/*1. Одна з колонок таблиць повинна містити строкове значення з двома словами,
розділеними пробілом. Виконайте команду UPDATE, помінявши місцями ці два слова.*/
UPDATE Registration 
    SET Reg_Client = regexp_replace(Reg_Client, '([[:alpha:]]+)[[:space:]]([[:alpha:]]+)','\2 \1');
/*10 rows updated.*/
    
SELECT Reg_Client FROM Registration;

/*
REG_CLIENT
-----------------
Mila Katrena
Bond Anna
Koval Katerina
Chyb Vasil
Kulov Ivan
Tryn Sergei
Name Name
Test Test
Melnyk Katarina
Pila Petro

10 rows selected.
*/

/*2. Одна з колонок таблиць має містити строкове значення з електронною поштовою
адресою у форматі EEE@EEE.EEE.UA, де E – будь-яка латинська буква. Створіть запит,
вилучення логіна користувача з електронної адреси (підстрока перед символом @).*/
SELECT 
    regexp_replace(email, '^(([[:alpha:]]+)\@[[:alpha:]]{5}\.com\.[[:alpha:]]{2})$', '\2') AS Login
    FROM Implementers;
/*
LOGIN
--------
alina
maria
masha
sasha
alina
uliana
lila
max

8 rows selected.
*/

/*3. Одна з колонок таблиць повинна містити строкове значення з номером мобільного
телефону у форматі +XX(XXX)XXX-XX-XX, де X – цифра. Виконайте команду UPDATE,
додавши перед номером телефону фразу «Mobile:».*/
UPDATE Implementers
    SET phone = regexp_replace(phone, '^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])$', 'Mobile:\1');
/*8 rows updated.*/
    
SELECT Implem_name, Phone 
    FROM Implementers;  
/*
IMPLEM_NAME                              PHONE
---------------------------------------- --------------------------
Alina                                    Mobile:+38(066)789-74-15
Maria                                    Mobile:+38(050)025-98-34
Masha                                    Mobile:+38(095)499-10-32
Sasha                                    Mobile:+38(066)556-96-74
Alina                                    Mobile:+38(066)775-28-67
Uliana                                   Mobile:+38(095)030-47-16
Lila                                     Mobile:+38(095)855-74-01
Max                                      Mobile:+38(050)741-58-32

8 rows selected.
*/

/*4. Додайте до колонки з електронною адресою обмеження цілісності, що забороняє
вносити дані, відмінні від формату електронної адреси, використовуючи команду ALTER TABLE
таблиця ADD CONSTRAINT обмеження CHECK (умова). Перевірте роботу обмеження на двох
прикладах UPDATE-запитів із правильними та неправильними значеннями колонки.*/
ALTER TABLE Implementers
    ADD CONSTRAINT EMAIL_CHECK
    CHECK (regexp_like (email, '^(([[:alpha:]]+)\@gmail.com.ua)$'));

INSERT INTO Implementers (Implem_Id, Implem_name, email)
    VALUES(16, 'Ryslan', 'ryslan@gmail.com.ua');
/*1 row created.*/

INSERT INTO Implementers (Implem_Id, Implem_name, email)
    VALUES(17, 'Artem', 'artem@gmail.com');
/*ORA-02290: check  constraint (BONDARENKO.EMAIL_CHECK) violated*/
    
    
/*5. Видаліть зайві дані з колонки з номером мобільного телефону, залишивши тільки номер
телефону в заданому форматі.*/
UPDATE Implementers
    SET phone = regexp_replace(phone, '(Mobile:)([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])$', '\2');
/*8 rows updated.*/
    
SELECT Implem_name, Phone 
    FROM Implementers;  
/*
IMPLEM_NAME                              PHONE
---------------------------------------- ------------------------------
Alina                                    +38(066)789-74-15
Maria                                    +38(050)025-98-34
Masha                                    +38(095)499-10-32
Sasha                                    +38(066)556-96-74
Alina                                    +38(066)775-28-67
Uliana                                   +38(095)030-47-16
Lila                                     +38(095)855-74-01
Max                                      +38(050)741-58-32

8 rows selected.
*/

/*6. Додайте в колонку з мобільним телефоном обмеження цілісності, що забороняє вносити
дані, відмінні від формату, записаного в завданні 3. Перевірте роботу обмеження на двох
прикладах UPDATE-запитів із правильними та неправильними значеннями колонки.*/
ALTER TABLE Implementers
    ADD CONSTRAINT PHONE_CHECK
    CHECK (regexp_like (phone, '^(([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])$'));
    
INSERT INTO Implementers (Implem_Id, Implem_name, email)
    VALUES(18, 'Olya', '+38(050)987-10-25');
/*1 row created.*/

INSERT INTO Implementers (Implem_Id, Implem_name, phone)
    VALUES(19, 'Hanna', '+38(050)9871025');
/*ORA-02290: check  constraint (BONDARENKO.PHONE_CHECK) violated*/   

