SELECT * FROM tblDog;

SELECT * FROM tblDog WHERE fldId = 8;

SELECT fldName, fldCount FROM tblDog WHERE fldCount > 100000;

INSERT INTO tblDog (fldName, fldCount, fldSize) 
VALUES
    ('Långhårig Collie', 4538, 'Mellan'),
    ('Malinois', 2329, 'Mellan');
    
UPDATE tblDog SET fldCount = 2330 WHERE fldName = 'Malinois';

UPDATE tblDog SET fldCount = fldCount + 3 WHERE fldName = 'Malinois';

SELECT DISTINCT fldSize FROM tblDog;

SELECT * FROM tblDog WHERE fldSize = 'Mellan' AND fldCount > 100000;

SELECT * FROM tblDog WHERE NOT fldSize = 'Mellan' AND (fldCount > 100000 OR fldCount < 20100);

SELECT * FROM tblDog WHERE fldSize = 'Stor' ORDER BY fldName DESC;

SELECT fldName FROM tblDog WHERE fldSize = 'Liten' ORDER BY fldCount DESC LIMIT 3;

SELECT AVG(fldCount) AS 'medel' FROM tblDog WHERE fldSize = 'Mellan';

SELECT * FROM tblDog WHERE fldName LIKE '%terrier';

SELECT * FROM tblDog WHERE fldName LIKE '%x%';

SELECT SUM(fldCount) FROM tblDog;

SELECT fldName, (fldCount / 990000) * 100 AS ProcentAndel FROM tblDog ORDER BY ProcentAndel;


SELECT * FROM tblDog WHERE fldSize = 'Stor';
SELECT COUNT(*) FROM tblDog WHERE fldSize = 'Stor';

-- nedan fråga är felaktig. limit körs sist
SELECT SUM(fldCount) FROM tblDog WHERE fldSize = 'Liten' ORDER BY fldCount DESC LIMIT 3;

INSERT INTO tblDog VALUES
    (DEFAULT, 'Cane corso', 2012, 'Stor'),
    (DEFAULT, 'Lagotto', 1223, 'Liten');
    
SELECT fldId FROM tblDog WHERE fldName = 'Lagotto';

DELETE FROM tblDog WHERE fldId = 35;
SELECT * FROM tblDog WHERE fldId = 35;