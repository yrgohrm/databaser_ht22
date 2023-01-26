CREATE DATABASE lektion16;
GO

USE lektion16;
GO

CREATE TABLE account
(
    id INT PRIMARY KEY,
    balance MONEY NOT NULL
);
GO

INSERT INTO account
VALUES
    (1, 0),
    (2, 0);
GO

UPDATE account SET balance = balance + 5000 WHERE id = 2;
UPDATE account SET balance = balance - 5000 WHERE id = 1 AND balance >= 5000;
GO

SELECT * FROM account;
GO

BEGIN TRANSACTION;
-- Starta en transaktion

UPDATE account SET balance = balance + 5000 WHERE id = 2;
UPDATE account SET balance = balance - 5000 WHERE id = 1 AND balance >= 5000;

IF @@ROWCOUNT <> 1
    BEGIN
        PRINT 'rollback'
        ROLLBACK TRANSACTION; -- Gör hela transaktionen ogjord
    END
ELSE
    BEGIN
        PRINT 'commit'
        COMMIT TRANSACTION;  -- Spara resultatet på riktigt
    END
GO


CREATE DATABASE rowVerDb;
GO

ALTER DATABASE rowVerDb SET ALLOW_SNAPSHOT_ISOLATION ON; 
ALTER DATABASE rowVerDb SET READ_COMMITTED_SNAPSHOT ON;
GO


USE pubs;
GO

DELETE FROM authors WHERE au_id = '999-99-9999';
GO

SET XACT_ABORT ON;
BEGIN TRAN;
    INSERT INTO authors VALUES ('999-99-9999', 'nisse', 'nilsson', '0765-432100', 'Storgatan', 'Los Angeles', 'CA', '90210', 0);
    INSERT INTO pub_info VALUES ('9999', NULL, 'Sample text');
COMMIT TRAN;
GO

SELECT * FROM authors WHERE au_id = '999-99-9999';
GO
