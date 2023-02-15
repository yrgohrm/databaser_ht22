CREATE LOGIN TestUser 
    WITH PASSWORD = 'someP4ssword',
    CHECK_EXPIRATION = OFF;
GO

USE Northwind;

CREATE USER TestUser FOR LOGIN TestUser WITH DEFAULT_SCHEMA = dbo;
GO

CREATE ROLE some_role;
GO

ALTER ROLE some_role ADD MEMBER TestUser;
GO

GRANT SELECT, INSERT, UPDATE 
ON OBJECT :: dbo.Products TO some_role;
GO

REVOKE INSERT, UPDATE 
ON OBJECT :: dbo.Products FROM some_role;
GO


CREATE SCHEMA stuff;
GO

GRANT SELECT ON SCHEMA :: stuff TO some_role;
GO

CREATE VIEW stuff.Stuff 
AS
    SELECT DISTINCT CompanyName, City FROM dbo.Customers;
GO