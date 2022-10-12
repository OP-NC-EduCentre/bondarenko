-- 1.4 встановлення бажаного формату ввесення дати = 'dd/mm/yyyy'
ALTER SESSION SET NLS_DATE_FORMAT = 'dd/mm/yyyy';
-- змінений формат дати

-- 1.1 внесення даних в таблицю "Services"
INSERT INTO Services (Serv_id, Serv_name) VALUES (1,'Manicure');
INSERT INTO Services (Serv_id, Serv_name) VALUES (2,'Haircut');
INSERT INTO Services (Serv_id, Serv_name) VALUES (3,'Massage');
-- заповнена таблиця "Services" данними

-- 1.1 внесення даних в таблицю "Implementers"
INSERT INTO Implementers (Implem_Id, Implem_name, Salary) 
    VALUES (1,'Maria', 7500.00);
INSERT INTO Implementers (Implem_Id, Implem_name, Salary) 
    VALUES (2,'Masha', 8000.00);
INSERT INTO Implementers (Implem_Id, Implem_name, Salary) 
    VALUES (3,'Sasha', 7800.00);
INSERT INTO Implementers (Implem_Id, Implem_name, Salary) 
    VALUES (4,'Alina', 8000.00);
-- заповнена таблиця "Implementers" данними

-- 1.1 внесення даних в таблицю "List_Of_Services"
INSERT INTO List_Of_Services 
    (List_id, Service_name, Service_price, Service_implementer) 
    VALUES (1, 2, 500.00, 3);
INSERT INTO List_Of_Services 
    (List_id, Service_name, Service_price, Service_implementer) 
    VALUES (2, 3, 700.00, 1);
INSERT INTO List_Of_Services 
    (List_id, Service_name, Service_price, Service_implementer) 
    VALUES (3, 1, 350.00, 2);
-- заповнена таблиця "List_Of_Services" данними

-- 1.2 додавання нової колонки Reg_Date - дата запису
ALTER TABLE Registration ADD Reg_Date date;
-- створена нова колонка

-- 1.1 внесення даних в таблицю "Registration" та
-- 1.5 внесення даних з урахуванням дати
INSERT INTO Registration 
    (Reg_id, Reg_Client, Service_for_registration, Reg_Date) 
    VALUES (1, 'Anna Bond', 1, '10/07/2022');
INSERT INTO Registration 
    (Reg_id, Reg_Client, Service_for_registration, Reg_Date) 
    VALUES (2, 'Katerina Koval', 3, '1/07/2022');
INSERT INTO Registration 
    (Reg_id, Reg_Client, Service_for_registration, Reg_Date) 
    VALUES (3, 'Vasil Chyb', 2, '8/07/2022');
-- заповнена таблиця "Registration" данними

-- 1.3 Для таблиці створити команду на внесення одного рядка, але з невизначеним
-- значенням колонки типу date.
INSERT INTO Registration 
    (Reg_id, Reg_Client, Service_for_registration, Reg_Date) 
    VALUES (4, 'Ivan Kulov', 2, null);
-- додана колонка з невизначеним значенням колонки типу date.

--1.6 Для однієї з таблиць, що містить обмеження цілісності потенційного 
-- ключа, виконатиткоманду додавання нового рядка зі значенням колонки, що порушує 
-- це обмеження. Перевірити реакцію СКБД на таку зміну.
INSERT INTO Services (Serv_id, Serv_name) VALUES (4);
-- Error report -
-- SQL Error: ORA-00947: не хватает значений для данных
-- 00947. 00000 -  "not enough values"


-- 1.7 Для однієї з таблиць, що містить обмеження цілісності зовнішнього ключа,
-- виконати команду додавання нового рядка зі значенням колонки зовнішнього 
-- ключа, який відсутній у колонці первинного ключа відповідної таблиці. 
-- Перевірити реакцію СКБД на подібне додавання, яке порушує обмеження 
-- цілісності зовнішнього ключа.
INSERT INTO List_Of_Services 
    (List_id, Service_name, Service_price, Service_implementer) 
    VALUES (4, 19, 950.00, 67);
-- Error report - ORA-02291: нарушено ограничение целостности 
-- (BONDARENKO.SERVICE_IMPLEMENTER_FK) - исходный ключ не найден





    
