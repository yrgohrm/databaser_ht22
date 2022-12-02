CREATE DATABASE dbLektion12;
USE dbLektion12;

SELECT * 
  FROM tblCarSale AS cs1 
       JOIN tblCarSale AS cs2 
       ON cs1.fldRegNo = cs2.fldRegNo 
          AND cs1.fldSellDate < cs2.fldSellDate 
          AND cs1.fldPrice < cs2.fldPrice;
          
SELECT *
  FROM tblCarSale AS cs1 
       RIGHT JOIN tblCarSale AS cs2 
       ON cs1.fldRegNo = cs2.fldPrice; 

SELECT COUNT(*)
  FROM tblCarSale
  CROSS JOIN tblOwner;
  
  
SELECT *
  FROM tblCarSale
 WHERE fldPrice < (SELECT AVG(fldPrice) FROM tblCarSale);
 
 
INSERT INTO tblOwner VALUES
    (0, 'Anna Andersson', 'Storvägen 3', '41832');

SELECT COUNT(fldRegNo)
  FROM tblCarSale 
 WHERE fldOwner IN (SELECT fldId FROM tblOwner WHERE fldZip = 41832);
 
SELECT COUNT(fldRegNo)
  FROM tblCarSale AS cs
  JOIN tblOwner AS o
    ON cs.fldOwner = o.fldId
 WHERE fldZip = 41832;
 
 SELECT *
  FROM (SELECT fldOwner, fldPrice
          FROM tblCarSale
         ORDER BY fldPrice
         LIMIT 3) AS ls
  JOIN tblOwner AS o
    ON o.fldId = ls.fldOwner;
    
    
SELECT tblOwner.fldName,
       tblCarSale.fldRegNo,
       tblCar.fldMake,
       tblCar.fldModel
  FROM tblOwner
       INNER JOIN tblCarSale ON tblOwner.fldId = tblCarSale.fldOwner
       INNER JOIN tblCar ON tblCarSale.fldRegNo = tblCar.fldRegNo
 WHERE tblCarSale.fldRegNo IN 
       (SELECT fldRegNo
          FROM tblCarSale
         WHERE fldMeterCount = 
               (SELECT MAX(fldMeterCount)
                  FROM tblCarSale));
                  
                  
-- övningar

-- ex1

SELECT fldId
  FROM tblOrder 
 WHERE fldChildren = (SELECT MAX(fldChildren) FROM tblOrder);

-- ex2

SELECT DISTINCT fldName
  FROM tblOrder AS o
  JOIN tblEmployee AS e
    ON o.fldSoldBy = e.fldId
 WHERE fldChildren = (SELECT MAX(fldChildren) FROM tblOrder);


SELECT fldName
  FROM tblEmployee
 WHERE fldId IN (SELECT fldSoldBy
                   FROM tblOrder 
                  WHERE fldChildren = (SELECT MAX(fldChildren) 
                                         FROM tblOrder));
