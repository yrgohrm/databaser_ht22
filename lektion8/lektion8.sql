DROP DATABASE IF EXISTS dbLektion8;
CREATE DATABASE dbLektion8;
USE dbLektion8;

CREATE TABLE tblUser (
    fldId INT PRIMARY KEY,
    fldEmail VARCHAR(70),
    fldName VARCHAR(70)
);

INSERT INTO tblUser VALUES (0, 'bo@orm.se', 'Bo A Orm');

INSERT INTO tblUser VALUES (1, '', '');

INSERT INTO tblUser (fldId) VALUES (2);

SELECT * FROM tblUser;

SELECT COUNT(fldEmail) FROM tblUser;

-- UNIQUE

CREATE TABLE tblPerson (
    fldId INT PRIMARY KEY, 
    fldPersNo CHAR(12) UNIQUE, 
    fldName VARCHAR(100),
    fldEmail VARCHAR(100)
);

INSERT INTO tblPerson VALUES (1, '198001011111', 'Lena', 'lena@lamm.se');
INSERT INTO tblPerson VALUES (2, '198001011111', 'Lars', 'lars@lamm.se');

CREATE TABLE tblCarRegistration (
    fldVinNr CHAR(17) PRIMARY KEY,
    fldRegNo VARCHAR(10),
    fldCountry CHAR(2),
    UNIQUE(fldRegNo, fldCountry)
);

INSERT INTO tblCarRegistration VALUES ('11111111111111111', 'ABC123', 'SE');
INSERT INTO tblCarRegistration VALUES ('11111111111111112', 'ABC123', 'NO');
INSERT INTO tblCarRegistration VALUES ('11111111111111113', 'ABC123', 'NO');

-- CHECK

CREATE TABLE tblSpeedLimit (
    fldStreetSectionId INT PRIMARY KEY,
    fldLimit INT CHECK (fldLimit > 0 AND fldLimit <= 120),
    fldTimeStart TIME,
    fldTimeEnd TIME,
    CHECK(fldTimeStart <> fldTimeEnd)
);


INSERT INTO tblSpeedLimit VALUES (1, 160, '00:00:00', '01:00:00');
INSERT INTO tblSpeedLimit VALUES (1, 120, '00:00:00', '12:00:00');
INSERT INTO tblSpeedLimit VALUES (2, NULL, '00:00:00', '12:00:00');
INSERT INTO tblSpeedLimit VALUES (3, NULL, NULL, NULL);


-- DEFAULT

CREATE TABLE tblAudit (
    fldTraceId CHAR(32) PRIMARY KEY,
    fldTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    fldLogText VARCHAR(200)
);

INSERT INTO tblAudit (fldTraceId, fldLogText) 
VALUES ('123e4567e89b12d3a456426614174000', 'My litte error');

INSERT INTO tblAudit 
VALUES ('123e4567e89b12d3a456426614174001', '2020-01-01 00:00:00', 'My litte error');

INSERT INTO tblAudit 
VALUES ('123e4567e89b12d3a456426614174002', DEFAULT, 'My litte error');

-- ooops, we can still insert null if the column allows it
INSERT INTO tblAudit 
VALUES ('123e4567e89b12d3a456426614174003', NULL, 'My litte error');

SELECT * FROM tblAudit;

-- FK
CREATE TABLE tblCarOwner (
    fldId INT PRIMARY KEY,
    fldName VARCHAR(100)
);

CREATE TABLE tblCar (
    fldRegNo CHAR(6) PRIMARY KEY,
    fldModel VARCHAR(50),
    fldOwner INT,
    FOREIGN KEY (fldOwner) REFERENCES tblCarOwner(fldId)
);

INSERT INTO tblCarOwner VALUES (0, "Bosse Bredsladd");

INSERT INTO tblCar VALUES ('ANK313', 'Ford', 0);
INSERT INTO tblCar VALUES ('ANK131', 'Ford', 1); -- Error in FK. No such owner!





-- ovn 1

CREATE TABLE tblNewsletter
(
    fldEmail VARCHAR(30) PRIMARY KEY CHECK (fldEmail LIKE '%@%'),
    fldNewsletter BOOLEAN DEFAULT FALSE NOT NULL
);

INSERT INTO tblNewsletter VALUES ('apa@example.com', FALSE);
INSERT INTO tblNewsletter VALUES ('apaexample.com', FALSE);
INSERT INTO tblNewsletter VALUES ('apa2@example.com', NULL);
INSERT INTO tblNewsletter VALUES ('ap@example.com', DEFAULT);

SELECT * FROM tblNewsletter;

-- ovn 2

CREATE TABLE tblBook
(
    fldIsbn CHAR(13) PRIMARY KEY,
    fldTitle VARCHAR(100) NOT NULL,
    fldAuthor VARCHAR(100) NOT NULL,
    fldPublished YEAR,
    fldRating TINYINT CHECK (fldRating >= 1 AND fldRating <= 5)
);

INSERT INTO tblBook VALUES ('1111111111111', 'The Best Book', 'Bosse Bredsladd', '1985', 2);
INSERT INTO tblBook VALUES ('1111111111112', 'The Very Best Book', 'Bosse Bredsladd', '1985', 6);