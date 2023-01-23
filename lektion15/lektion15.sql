CREATE DATABASE lektion15;
GO

USE lektion15;
GO

CREATE TABLE testit
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    value INT
);
GO

INSERT INTO testit
VALUES
    (FLOOR(RAND()*10000));
GO
100

SELECT COUNT(*)
FROM testit;

USE Northwind;
GO

SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.Alphabetical list of products'))
GO

EXEC sp_helptext 'dbo.Alphabetical list of products'
GO

SELECT *
FROM [Alphabetical list of products]
WHERE unitPrice < 5;
GO


DROP VIEW dbo.EmployeeAndTerritories;
GO

CREATE VIEW dbo.EmployeeAndTerritories
WITH
    SCHEMABINDING
AS
    SELECT e.EmployeeID, e.FirstName, e.LastName, t.TerritoryID, t.TerritoryDescription
    FROM dbo.Employees AS e
        JOIN dbo.EmployeeTerritories AS et
        ON e.EmployeeID = et.EmployeeID
        JOIN dbo.Territories AS t
        ON t.TerritoryID = et.TerritoryID;
GO

ALTER TABLE Employees DROP COLUMN LastName;
GO

EXEC sp_helptext 'dbo.EmployeeAndTerritories';
GO

SELECT [FirstName]
FROM [EmployeeAndTerritories]
WHERE [TerritoryDescription] = 'Wilton';
GO

SELECT *
FROM EmployeeAndTerritories
WHERE TerritoryID = '01581';
SELECT *
FROM Employees
WHERE LastName = 'Fuller';

UPDATE EmployeeAndTerritories SET FirstName = 'Ankan' WHERE TerritoryID = '01581';


USE lektion15;
GO

CREATE TABLE names
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    stuff INT
);
GO

INSERT INTO names
VALUES
    ('nisse', 1),
    ('bosse', 2);
GO

DROP VIEW someNames;
GO

CREATE VIEW someNames
WITH
    ENCRYPTION,
    SCHEMABINDING
AS
    SELECT name
    FROM dbo.names
    WHERE name LIKE 'n%'
    WITH CHECK OPTION;
GO



SELECT *
FROM someNames;

INSERT INTO someNames
VALUES
    ('niklas');

UPDATE someNames SET name = 'vils' WHERE name = 'nils';

DELETE FROM someNames WHERE name = 'niklas';
GO

-- ex 2

CREATE VIEW ProductAndCategories
AS
    SELECT ProductName, CategoryName
    FROM Products AS p
        JOIN Categories AS c
        ON p.categoryid = c.categoryid;
GO

SELECT *
FROM ProductAndCategories;

-- ex3

SELECT *
FROM ProductAndCategories
WHERE CategoryName = 'Condiments'
ORDER BY ProductName;

-- somewhat simliar to:

SELECT * FROM (SELECT ProductName, CategoryName
    FROM Products AS p
        JOIN Categories AS c
        ON p.categoryid = c.categoryid) AS t
WHERE CategoryName = 'Condiments'
ORDER BY ProductName;

