SELECT * FROM tblOrder;

INSERT INTO tblOrder VALUES (7, '2020-10-01 00:00:00', '2023-01-01', 1);

SELECT * FROM tblOrder WHERE DATE_FORMAT(fldDate, '%m')=10;

SELECT * FROM tblOrder WHERE DATE_FORMAT(fldDate, '%D')=12;

SELECT DAYNAME(fldDate) FROM tblOrder;

INSERT INTO tblOrder VALUES (0, NOW(), DATE_ADD(NOW(), INTERVAL 2 DAY), 1);

SELECT CHAR_LENGTH(fldName) FROM tblCustomer;

SELECT * FROM tblCustomer WHERE CHAR_LENGTH(fldName) > 5;

SELECT CONCAT('Dear ', fldName) FROM tblCustomer;

SELECT LEFT(fldName, LOCATE(" ", fldName)) FROM tblCustomer;

SELECT UCASE(fldName) FROM tblCustomer;

SELECT
    CASE DATE_FORMAT(fldDate, '%m')
        WHEN 12 THEN 'Dec-em-brrr'
        WHEN 11 THEN 'Nooooo-vember'
        WHEN 10 THEN 'Octo-brrrr'
        ELSE 'Who cares?'
    END AS col, fldDate
FROM tblOrder;

SELECT IF(CHAR_LENGTH(fldName)>5, 'OK', 'NOT OK'), fldName FROM tblCustomer;

CREATE TABLE t1 (x INT, y INT, z INT);

INSERT INTO t1 VALUES
    (1, 2, 3), (NULL, 2, 3), (NULL, NULL, 3);
    
SELECT AVG(IFNULL(x, 0)) FROM t1;

DELIMITER $$
CREATE FUNCTION rebate(purchaseSize DECIMAL(10,2))
RETURNS DECIMAL(3, 2)
DETERMINISTIC
BEGIN
    IF purchaseSize > 10000 THEN
        RETURN 0.25;
    ELSEIF purchaseSize > 1000 THEN
        RETURN 0.05;
    END IF;
   
    RETURN 0.0;
END$$
DELIMITER ;


SELECT COUNT(rating) FROM film WHERE rating = 'PG-13';

SELECT ROUND(AVG(viewer_rating)) FROM film WHERE rating = 'PG-13';

SELECT CONCAT(title, ': ', description) AS movies FROM film WHERE title LIKE 'w%';

SELECT title, char_length(description) AS dl FROM film ORDER BY dl ASC LIMIT 1; 
SELECT title, char_length(description) AS dl FROM film ORDER BY dl DESC LIMIT 1; 

