SHOW DATABASES;

CREATE DATABASE dbLecture2;

CrEATe DaTAbasE apansson;

USE dbLecture2;


CREATE TABLE tblCustomer 
(
    fldCustomerNo INT PRIMARY KEY,
    fldFirstName VARCHAR(30),
    fldLastName VARCHAR(30),
    fldPhone VARCHAR(15)
);

INSERT INTO tblCustomer VALUES 
    (1, "Bosse", "Bredsladd", "0702123456"),
    (2, "Lena", "Lamm", "0733476542");
    
SELECT * FROM tblCustomer;

SELECT fldFirstName FROM tblCustomer;

ALTER TABLE tblCustomer RENAME apansson;

ALTER TABLE apansson RENAME tblCustomer;
    