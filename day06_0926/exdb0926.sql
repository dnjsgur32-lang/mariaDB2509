-- ---<
SHOW DATABASES;
USE exdb;

SHOW TABLES;

SELECT * FROM products;
SELECT * FROM orderdetails;

SELECT productName
FROM products
WHERE productID = 3;


SELECT productName
FROM products
WHERE productID = ANY
(SELECT productID
FROM orderdetails
WHERE Quantity = 10);

SELECT productID, Quantity
FROM orderdetails
WHERE Quantity = 10;

SELECT productID
FROM orderdetails
WHERE quantity > 99;

SELECT productname
FROM products
WHERE productID = 35

SELECT productname
FROM products
WHERE productID = ANY
 (SELECT productID
 FROM orderdetails
 WHERE Quantity > 99);
 
 SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 1000;
  
  SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 1000);
  
SELECT ALL ProductName
FROM Products
WHERE TRUE;

SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10;
  
SELECT ProductName
FROM Products
WHERE ProductID = ALL
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10);
  
-- 고객--91명
SELECT * FROM customers;

-- 공급업체--29개
SELECT * FROM suppliers;

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;
-- 문법틀림
-- SELECT * FROM Customers
-- WHERE CustomerID = 'null';
-- 문법맞음
SELECT * FROM customers
WHERE customerID IS NULL;

INSERT INTO Customers
	(CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT
	SupplierName, ContactName, Address, City, PostalCode, Country
FROM Suppliers;

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country
FROM suppliers
WHERE country = 'Germany';

-- 고객--91명 + 29 ===> 120명 + 29 ===> 149명 + 3명 ===> 152명
SELECT * FROM customers;

-- 공급업체--29개
SELECT * FROM suppliers;

-- ==========================================
--공급업체 - 2,155개
SELECT * FROM orderdetails;

SELECT orderID, Quantity,
CASE
    WHEN Quantity > 30 THEN '30 보다 큼'
    WHEN Quantity = 30 THEN '30 과 같음'
    ELSE '30 보다 작음'
END AS 수량표현
FROM orderdetails;

-- SELECT CustomerName, City, Country
-- FROM Customers
-- ORDER BY
-- (case 
-- 	when city IS NULL then country
-- 	ELSE city
-- END);
-- FROM orderdetails;

SELECT * FROM customers;

-- IFNULL
SELECT customerid, IFNULL(contactName, '널이야~') 'contactName'
FROM customers;

-- COALESCE
SELECT customerid, COALESCE(address, '주소는 ^^널') 'address'
FROM customers;

-- 테이블 생성 ------ create table
-- 테이블 삭제 ------ drop table
-- 테이블 변경 ------ alter table


-- 레코드 추가 ------ insert into
-- 레코드 삭제 ------ delete
-- 레코드(필드)수정-- update

CREATE TABLE Persons (
	PersonID INT,
	LastName VARCHAR(255),
	FirstName VARCHAR(255),
	Address VARCHAR(255),
	City VARCHAR(255)	
);

SELECT * FROM persons;

CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;

CREATE TABLE TestTable2 AS
SELECT customername, contactname
FROM customers;

SELECT * FROM TestTable;
SELECT * FROM TestTable2;

-- 테이블 삭제되서 없음--
DROP TABLE TestTable;
SELECT * FROM TestTable;

-- 레코드 삭제(테이블은 남음) : **테이블 초기화**
TRUNCATE TABLE TestTable2;
SELECT * FROM TestTable2;

--
SELECT * FROM persons;
DESC persons;

-- 열 추가
ALTER TABLE customers
ADD Email VARCHAR(255);

-- 열 추가 및 삭제 확인
SELECT * FROM customers;
DESC customers;

-- 열 삭제
ALTER TABLE customers
DROP COLUMN Email;

-- 열 타입 수정
ALTER TABLE customers
MODIFY COLUMN Email VARCHAR(320);
DESC customers;

--
SELECT * FROM persons;
DESC persons;

ALTER TABLE persons
ADD DateOfBirth DATE;
DESC persons;

ALTER TABLE persons
MODIFY COLUMN DateOfBirth YEAR;
DESC persons;

ALTER TABLE persons
DROP COLUMN DateOfBirth;
DESC persons;





