USE Northwind;
GO

SELECT *
FROM employees;

SELECT employeeid, firstname, lastname
FROM employees
WHERE lastname = 'Fuller';
GO

USE lektion13;
GO

CREATE INDEX name_idx ON Player(name);
GO

SELECT *
FROM Player
WHERE name = 'Lena Lamm';
SELECT *
FROM Player
WHERE name LIKE 'L%';
SELECT *
FROM Player
WHERE name LIKE '%amm';


SELECT DB_NAME(database_id),
    MAX(user_scans) AS max,
    AVG(user_scans) AS average
FROM sys.dm_db_index_usage_stats
GROUP BY db_name(database_id)
ORDER BY average DESC;
GO


SELECT OBJECT_NAME(idx.object_id) AS [table],
    idx.name AS [index], user_scans, user_seeks,
    CASE ustat.index_id
    WHEN 1 THEN 'CLUSTERED'
    ELSE 'NONCLUSTERED'
    END AS type
FROM sys.dm_db_index_usage_stats AS ustat
    JOIN sys.indexes idx
    ON  idx.object_id=ustat.object_id
        AND idx.index_id=ustat.index_id
        AND database_id=DB_ID('lektion13')
ORDER BY user_scans DESC;
go

-- INSERT INTO Player VALUES
--     ('User Usersson'),
--     ('Player Playersson'),
--     ('Boaty McBoatface'),
--     ('Playy McPlayface');

-- GO

-- INSERT INTO Highscore VALUES
--     (1, 1, FLOOR(22*RAND()), DATEADD(day, - FLOOR(RAND()*100), SYSUTCDATETIME()), 'E'),
--     (1, 2, FLOOR(212*RAND()), DATEADD(day, - FLOOR(RAND()*100), SYSUTCDATETIME()), 'H'),
--     (1, 3, FLOOR(122*RAND()), DATEADD(day, - FLOOR(RAND()*100), SYSUTCDATETIME()), 'M'),
--     (1, 4, FLOOR(RAND()*1212), DATEADD(day, - FLOOR(RAND()*100), SYSUTCDATETIME()), 'E'),
--     (1, 5, FLOOR(RAND()*223), DATEADD(day, - FLOOR(RAND()*100), SYSUTCDATETIME()), 'H'),
--     (1, 6, FLOOR(RAND()*2122), DATEADD(day, - FLOOR(RAND()*100), SYSUTCDATETIME()), 'E'),
--     (1, 3, FLOOR(RAND()*1221), DATEADD(day, - FLOOR(RAND()*100), SYSUTCDATETIME()), 'H'),
--     (1, 4, FLOOR(RAND()*12121), DATEADD(day, - FLOOR(RAND()*100), SYSUTCDATETIME()), 'H'),
--     (1, 5, FLOOR(RAND()*123), DATEADD(day, - FLOOR(RAND()*100), SYSUTCDATETIME()), 'E');
-- GO 5000


SELECT COUNT(*)
FROM Highscore;

SELECT TOP(10)
    playerId, score, date
FROM Highscore
ORDER BY score DESC, date ASC;
SELECT TOP(10)
    score, date
FROM Highscore
ORDER BY score DESC, date ASC;
SELECT TOP(10)
    playerId, score, date
FROM Highscore
ORDER BY date ASC, score DESC;

SELECT TOP(10)
    difficulty, score, date
FROM Highscore
ORDER BY score DESC, date ASC;

SELECT score, playerId
FROM Highscore
WHERE score < 100;

CREATE INDEX highscore_idx ON Highscore(score DESC);

CREATE INDEX highscore_idx ON highscore(score DESC, date ASC);

CREATE INDEX highscore_idx ON highscore(score DESC, date ASC, difficulty);

-- DROP INDEX highscore.highscore_idx;

USE Northwind;
SELECT et.employeeId, e.FirstName, e.LastName, t.territoryDescription, r.regionDescription
FROM Employees AS e
    INNER JOIN [EmployeeTerritories] AS et
    ON (e.employeeId = et.employeeId)
    INNER JOIN [Territories] AS t
    ON (et.territoryId = t.territoryId)
    INNER JOIN [Region] AS r
    ON (t.RegionID = r.RegionID)
ORDER BY et.employeeId;

EXEC sp_helpindex [Categories];

CREATE TABLE SomeData
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(70) NOT NULL UNIQUE,
    pnr CHAR(12) NOT NULL UNIQUE
);

EXEC sp_helpindex SomeData;

CREATE TABLE SomeData2
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(70) NOT NULL,
    pnr CHAR(12) NOT NULL,
    UNIQUE(email, pnr)
);

EXEC sp_helpindex SomeData2;


SELECT TOP(10)
    e.firstName, e.lastName, o.orderdate, s.companyName
FROM orders AS o
    JOIN employees AS e
    ON o.employeeId = e.employeeId
    JOIN shippers AS s
    ON o.shipvia = s.shipperId
ORDER BY orderdate DESC;