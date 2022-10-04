ALTER TABLE Services ADD CONSTRAINT Serv_id_pk
    PRIMARY KEY (Serv_id);
ALTER TABLE Services ADD CONSTRAINT Serv_name_unique 
    UNIQUE (Serv_name);
ALTER TABLE Services MODIFY (Serv_name NOT NULL);

ALTER TABLE Implementers ADD CONSTRAINT Implem_id_pk
    PRIMARY KEY (Implem_id);
ALTER TABLE Implementers MODIFY (Implem_name NOT NULL);
ALTER TABLE Implementers ADD CONSTRAINT Salary_not_null
    CHECK (Salary > 0);
    
ALTER TABLE ListOfServices ADD CONSTRAINT List_id_pk
    PRIMARY KEY (List_id);
ALTER TABLE ListOfServices ADD CONSTRAINT Service_name_fk
	FOREIGN KEY (Service_name) 
          REFERENCES Services (Serv_id);
ALTER TABLE ListOfServices MODIFY (Service_name NOT NULL);
ALTER TABLE ListOfServices ADD CONSTRAINT Service_price_not_null
    CHECK (Service_price > 0);
ALTER TABLE ListOfServices ADD CONSTRAINT Service_implementer_fk
	FOREIGN KEY (Service_implementer) 
          REFERENCES Implementers (Implem_id);
ALTER TABLE ListOfServices MODIFY (Service_implementer NOT NULL);

ALTER TABLE Registration ADD CONSTRAINT Reg_id_pk
    PRIMARY KEY (Reg_id);
ALTER TABLE Registration MODIFY (Reg_Client NOT NULL);
ALTER TABLE Registration ADD CONSTRAINT Service_for_registration_fk
	FOREIGN KEY (Service_for_registration)
          REFERENCES ListOfServices (List_id);


