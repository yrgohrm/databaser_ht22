CREATE DATABASE dbLektion10;
USE dbLektion10;

DROP TABLE IF EXISTS tblCarSale;

CREATE TABLE tblCarSale (
    fldId INT AUTO_INCREMENT PRIMARY KEY,
    fldRegNo CHAR(7) NOT NULL,
    fldSellDate DATE NOT NULL,
    fldMake VARCHAR(20),
    fldModel VARCHAR(20),
    fldMeterCount INT, -- in km
    fldPrice INT
);

INSERT INTO tblCarSale VALUES
    (0, 'ABC 123', '2018-08-20', 'Volvo', 'XC90', 12063, 58000);

INSERT INTO tblCarSale VALUES
    (0, 'ABC 123', '2008-08-20', 'Volvo', 'V70', 12063, 58000),
    (0, 'CDA 123', '2008-08-23', 'Volvo', 'S40', 127852, 160000),
    (0, 'ABC 123', '2008-08-26', 'Volvo', 'V70', 12890, 56000),
    (0, 'CBA 322', '2018-09-06', 'Volvo', 'V70', 890, 356000),
    (0, 'CBA 322', '2020-09-06', 'Volvo', 'V70', 7890, 250000),
    (0, 'MYP 977', '2010-09-06', 'Volvo', '240', 27890, 5000),
    (0, 'CDE 456', '2008-08-21', 'Nissan', 'Micra', 89508, 20000),
    (0, 'EDC 657', '2018-02-01', 'Nissan', 'Micra', 508, 199000),
    (0, 'BCD 789', '2008-08-26', 'Honda', 'Jazz', 296000, 120000),
    (0, 'FCD 989', '2017-08-26', 'Honda', 'CR-V', 9000, 220000),
    (0, 'FCD 989', '2019-08-26', 'Honda', 'CR-V', 12000, 185000),
    (0, 'GCD 289', '2020-08-26', 'Honda', 'CR-V', 2000, 255000),
    (0, 'ABC 123', '2010-09-23', 'Volvo', 'V70', 12378, 12345);


SELECT fldRegNo, COUNT(fldRegNo) FROM tblCarSale GROUP BY fldRegNo;


SELECT fldRegNo, COUNT(fldRegNo) FROM tblCarSale GROUP BY fldRegNo HAVING COUNT(fldRegNo) > 1;

SELECT fldRegNo, COUNT(fldRegNo) AS owners FROM tblCarSale GROUP BY fldRegNo HAVING owners > 1;


SELECT fldRegNo, fldModel, COUNT(fldRegNo) FROM tblCarSale GROUP BY fldRegNo, fldModel;

SELECT fldRegNo, AVG(fldSellDate) FROM tblCarSale GROUP BY fldRegNo;


SELECT fldRegNo,COUNT(*) FROM tblCarSale GROUP BY fldRegNo HAVING COUNT(fldRegNo) > 1;

SELECT fldMake, COUNT(DISTINCT fldModel) FROM tblCarSale GROUP BY fldMake;

SELECT YEAR(fldSellDate) AS year, COUNT(fldSellDate) AS count 
    FROM tblCarSale 
    GROUP BY year 
    ORDER BY count DESC 
    LIMIT 1;


-- below need the film database
SELECT * FROM film LIMIT 1;





CREATE TABLE tblUser
(
    fldId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fldEmail VARCHAR(70) UNIQUE NOT NULL CHECK (fldEmail LIKE '%@%.%'),
    name VARCHAR(50) NOT NULL,
    nickname VARCHAR(20) NOT NULL,
    passwordHash VARCHAR(80) NOT NULL
);

CREATE TABLE tblChannel
(
    fldId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fldName VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE tblPost
(
    fldId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fldDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    fldText VARCHAR(340) NOT NULL,
    fldUrl VARCHAR(2048),
    fldUser INT UNSIGNED NOT NULL,
    fldChannel INT UNSIGNED NOT NULL,
    FOREIGN KEY (fldUser) REFERENCES tblUser(fldId),
    FOREIGN KEY (fldChannel) REFERENCES tblChannel(fldId)
);

CREATE TABLE tblMember
(
    fldUser INT UNSIGNED,
    fldChannel INT UNSIGNED,
    PRIMARY KEY (fldUser, fldChannel),
    FOREIGN KEY (fldUser) REFERENCES tblUser(fldId),
    FOREIGN KEY (fldChannel) REFERENCES tblChannel(fldId)
);


