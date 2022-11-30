CREATE DATABASE dbLektion11;
USE dbLektion11;

SELECT * FROM tblCarSale;
SELECT * FROM tblCar;

SELECT cs.fldRegNo, fldMake, fldSellDate
    FROM tblCarSale AS cs
    INNER JOIN tblCar AS c
    ON c.fldRegNo = cs.fldRegNo;

SELECT *
    FROM tblCarSale AS cs
        JOIN tblCar AS c
          ON c.fldRegNo = cs.fldRegNo
        JOIN tblOwner AS o
          ON o.fldId = cs.fldOwner;
        
SELECT 
    *
FROM
    tblCarSale AS cs
        JOIN
    tblOwner AS o ON cs.fldId = o.fldId;

SELECT c.fldMake, COUNT(DISTINCT cs.fldRegNo) AS cars, COUNT(DISTINCT o.fldId)
    FROM tblCarSale AS cs
         JOIN tblCar AS c
           ON c.fldRegNo = cs.fldRegNo
         JOIN tblOwner AS o
           ON o.fldId = cs.fldOwner
   WHERE cs.fldPrice > 10000
   GROUP BY c.fldMake
   ORDER BY cars;
   
SELECT *, cs2.fldPrice - cs1.fldPrice
    FROM tblCarSale AS cs1
         JOIN tblCarSale AS cs2
           ON cs1.fldRegNo = cs2.fldRegNo
          AND cs1.fldSellDate < cs2.fldSellDate
          AND cs1.fldPrice < cs2.fldPrice;

SELECT *
    FROM tblCarSale AS cs
        RIGHT JOIN tblOwner AS o
        ON o.fldId = cs.fldOwner;
          
SELECT o.fldName
    FROM tblCarSale AS cs
        RIGHT JOIN tblOwner AS o
        ON o.fldId = cs.fldOwner
    WHERE cs.fldOwner IS NULL;



-- exercises

-- ex 1

SELECT o.fldDate, o.fldFrom, o.fldTo, c.fldName
FROM tblOrder AS o
JOIN tblCustomer AS c
  ON o.fldCustomer = c.fldId;

-- ex2

SELECT o.fldId, o.fldDate, ap1.fldName AS 'From', ap2.fldName As 'To', c.fldName
FROM tblOrder AS o
JOIN tblCustomer AS c
  ON o.fldCustomer = c.fldId
JOIN tblAirport AS ap1
  ON ap1.fldIcao = o.fldFrom
JOIN tblAirport AS ap2
  ON ap2.fldIcao = o.fldTo;

-- ex 3

SELECT emp.fldName AS personal, boss.fldName AS supervisor
  FROM tblEmployee AS emp
  LEFT JOIN tblEmployee AS boss
    ON emp.fldSupervisor = boss.fldId;

-- ex 5

SELECT e.fldId, e.fldName, COUNT(o.fldId)
  FROM tblOrder AS o
  JOIN tblEmployee AS e
    ON o.fldSoldBy = e.fldId
 GROUP BY e.fldId;