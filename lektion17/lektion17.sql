BEGIN TRANSACTION; -- Starta en transaktion

UPDATE account SET balance = balance + 5000 WHERE id = 2;

IF @@ROWCOUNT <> 1
    ROLLBACK TRANSACTION; -- Gör hela transaktionen ogjord
ELSE
    BEGIN
        UPDATE account SET balance = balance - 5000 WHERE id = 1 AND balance >= 5000;

        IF @@ROWCOUNT <> 1
            ROLLBACK TRANSACTION; -- Gör hela transaktionen ogjord
        ELSE
            COMMIT TRANSACTION;  -- Spara resultatet på riktigt
    END



SELECT * FROM apan;


USE Northwind;
GO

DROP PROCEDURE dbo.stockWithPriceLessThan;
GO

CREATE PROCEDURE dbo.stockWithPriceLessThan
    @Price AS MONEY
AS
BEGIN
    SET NOCOUNT ON
    SELECT ProductID, ProductName, UnitPrice 
    FROM Products 
    WHERE UnitPrice < @Price AND UnitsInStock > 0;
END
GO

EXEC dbo.stockWithPriceLessThan 10.0;
EXEC dbo.stockWithPriceLessThan 5.0;

GO

DROP PROCEDURE dbo.highestPriceLessThan;
GO

CREATE PROCEDURE dbo.highestPriceLessThan
    @Price AS MONEY,
    @HighestPrice AS MONEY OUTPUT,
    @HighestID AS INT OUTPUT
AS
    SET NOCOUNT ON
    SELECT TOP(1) @HighestID = ProductID, @HighestPrice = UnitPrice 
    FROM Products 
    WHERE UnitPrice < @Price AND UnitsInStock > 0
    ORDER BY UnitPrice DESC;
GO

DECLARE @HP AS MONEY
DECLARE @HID AS INT
EXEC dbo.highestPriceLessThan 20, @HighestPrice = @HP OUTPUT, @HighestID = @HID OUTPUT;
SELECT @HID AS id, @HP AS price;

GO

CREATE PROCEDURE dbo.increasePrice
    @ProductID INT
AS
    DECLARE @UnitPrice AS MONEY

    SELECT @UnitPrice = UnitPrice FROM Products
    WHERE ProductID = @ProductID

    IF @UnitPrice < 50
        UPDATE Products 
        SET UnitPrice = ROUND(UnitPrice * 1.1, 1, 1)
        WHERE ProductID = @ProductID;
    ELSE
        UPDATE Products 
        SET UnitPrice = ROUND(UnitPrice * 1.03, 1, 1)
        WHERE ProductID = @ProductID;
GO


EXEC dbo.increasePrice 9;

SELECT * FROM Products WHERE UnitPrice > 50;
GO


CREATE PROCEDURE dbo.transactionStuff
AS
    BEGIN TRANSACTION;
    SELECT * FROM Products;
    COMMIT TRANSACTION;
GO


-- aj aj aj
-- BEGIN TRANS;
--     EXEC dbo.transactionStuff;
--     INSERT ...
--     UPDATE ...
-- COMMIT TRANS;


-- 

GO

ALTER PROCEDURE dbo.testStuff2
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Products;
    SELECT * FROM Categories;
    SELECT * FROM Customers;
END
GO

EXEC dbo.testStuff2;

GO

ALTER PROCEDURE dbo.changeStuff
AS
BEGIN
DECLARE @PID AS INT
DECLARE @Units AS SMALLINT
SELECT TOP(1) @PID = ProductID, @Units = UnitsInStock FROM Products ORDER BY UnitPrice ASC;
PRINT @PID
IF @Units > 100
    UPDATE Products SET UnitPrice = UnitPrice * 0.7 WHERE ProductID = @PID;
ELSE IF @Units < 30
    UPDATE Products SET UnitPrice = UnitPrice * 1.3 WHERE ProductID = @PID;
END;
GO

SELECT TOP(1) ProductID, UnitsInStock, UnitPrice FROM Products ORDER BY UnitPrice ASC;
GO

UPDATE Products SET UnitsInStock = 10 WHERE ProductID = 33;
GO

EXEC dbo.changeStuff;
GO