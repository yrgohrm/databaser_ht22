CREATE DATABASE [dbTest1];
GO

USE dbTest1;
GO

CREATE TABLE tblCompany (
    fldId INT IDENTITY(1,1) PRIMARY KEY,
    fldCompanyName VARCHAR(255) NOT NULL,
    fldEmail VARCHAR(255)
);
GO

INSERT INTO tblCompany (fldCompanyName, fldEmail) VALUES 
    ('Bosse Nisse AB', 'info@bossenisse.se'),
    ('Lena Lamm Ltd.', 'info@llltd.co.uk'),
    ('Acme Emca Industries', 'questions@aeind.com');
GO

SELECT * from tblCompany ORDER BY fldCompanyName ASC;
GO

SELECT name, database_id, compatibility_level 
FROM sys.databases;
GO

SELECT * FROM sys.databases;
GO

SELECT db.name, mf.physical_name
FROM sys.databases AS db
    JOIN sys.master_files AS mf
    ON mf.database_id = db.database_id;
GO

sp_helpdb dbTest1;
GO


CREATE TABLE Game (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50)
);
GO

CREATE TABLE Player (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50)
);
GO

CREATE TABLE Highscore (
    gameId INT NOT NULL,
    playerId INT NOT NULL,
    score INT NOT NULL,
    date DATETIME2 NOT NULL,
    difficulty CHAR(1),
    PRIMARY KEY (playerId, date),
    FOREIGN KEY (gameId) REFERENCES Game(id),
    FOREIGN KEY (playerId) REFERENCES Player(id)
);
GO

INSERT INTO Game VALUES
    ('Klappjakten');

INSERT INTO Player VALUES
    ('Bosse Bredsladd'),
    ('Lena Lamm');

GO

INSERT INTO Highscore VALUES
    (1, 1, 22, SYSUTCDATETIME(), 'E');
GO

SELECT * FROM Highscore;