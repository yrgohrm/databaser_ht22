CREATE DATABASE dbLektion7;

USE dbLektion7;

CREATE TABLE tblPassport (
    fldPassNo INT AUTO_INCREMENT PRIMARY KEY,
    fldIssued DATE,
    fldCountry VARCHAR(100)
);

CREATE TABLE tblPerson (
    fldPersNo CHAR(12) PRIMARY KEY,
    fldPassNo INT UNIQUE,
    FOREIGN KEY (fldPassNo) REFERENCES tblPassport(fldPassNo)
);

INSERT INTO tblPassport VALUES (0, CURRENT_DATE(), 'Sverige');

SELECT * FROM tblPassport;
SELECT * FROM tblPerson;

INSERT INTO tblPerson VALUES ('197110104712', 1);

INSERT INTO tblPerson VALUES ('194110104709', 2);

INSERT INTO tblPerson VALUES ('194110104709', NULL);
INSERT INTO tblPerson VALUES ('194210104709', NULL);

INSERT INTO tblPassport VALUES (0, CURRENT_DATE(), 'Svea');

UPDATE tblPerson SET fldPassNo = 2 WHERE fldPersNo = '194210104709';


CREATE TABLE tblPerson2 (
    fldPersNo CHAR(12) PRIMARY KEY,
    fldAddress VARCHAR(50)
);

CREATE TABLE tblPassport2 (
    fldPassNo INT AUTO_INCREMENT PRIMARY KEY,
    fldIssued DATE,
    fldCountry VARCHAR(100),
    fldPersNo CHAR(12) NOT NULL UNIQUE,
    FOREIGN KEY (fldPersNo) REFERENCES tblPerson2(fldPersNo)
);

INSERT INTO tblPerson2 VALUES ('194210104709', 'Storgatan 2');

INSERT INTO tblPassport2 VALUES (DEFAULT, current_date(), 'Sverige', '194210104709');


CREATE TABLE tblAuthor
(
    fldId INT AUTO_INCREMENT PRIMARY KEY,
    fldName VARCHAR(100)
);

CREATE TABLE tblBook
(
    fldIsbn CHAR(13) PRIMARY KEY,
    fldTitle VARCHAR(100)
);

CREATE TABLE tblBookAuthor
(
    
)





