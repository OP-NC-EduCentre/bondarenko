CREATE TABLE Services(
    Serv_id NUMBER(6), -- номер услуги
    Serv_name VARCHAR(15) -- название услуги
);

/*
L014	7 / 2	Unquoted identifiers must be consistently capitalised.
L008	9 / 17	Commas should be followed by a single whitespace.
*/
CREATE TABLE Implementers(
    Implem_id NUMBER(6), -- номер сотрудника
    Implem_name VARCHAR(10), -- имя сотрудника
    Salary NUMBER(7, 2) --зарплата сотрудника
);

/*
L014	12 / 14	 Unquoted identifiers must be consistently capitalised.
*/
CREATE TABLE List_of_services(
    List_id NUMBER(6), -- номер списка услуг 
    Service_name NUMBER(6), -- название услуги
    Service_price NUMBER(4), -- цена услуги
    Service_implementer NUMBER(6) -- номер исполняющего сотрудника
);

/*
L014	21 / 2	Unquoted identifiers must be consistently capitalised.
L014	23 / 2	Unquoted identifiers must be consistently capitalised.
*/
CREATE TABLE Registration(
    Reg_id NUMBER(6), -- номер записи
    Reg_client VARCHAR(25), -- номер клиента
    Service_for_registration NUMBER(6), -- название услуги
    Reg_date DATE -- дата выполнения услуги
);
