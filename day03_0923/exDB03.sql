USE exdb;

SHOW TABLES;
select * from customers

describe customers;
DESC customer;

-- 테이블 조회 --

SELECT * FROM customers;
SELECT COUNT (*) FROM customers;

SELECT customerID, Address
FROM customers;

-- WHERE 는 조건문 --

SELECT *
FROM customers
WHERE country = 'Mexico';

SELECT *
FROM customers
WHERE customerid = 1;

SELECT *
FROM customers
WHERE country = 'Germany' AND city = 'Berlin';

SELECT *
FROM customers

-- 테이블 레코드 (한줄)삽입 방법 --

INSERT INTO customers (CustomerID, CustomerName , ContactName, Address, City, PostalCode, Country

VALUES ( 'Cardinal' , 'Tom B. Erichsen' , 'Skagen 21' , ' Stavanger' , '4006' , 'Norway' );

SELECT * FROM customers;

SELECT *
FROM customers
WHERE customerID IS NULL;

SELECT *
FROM customers
WHERE customerid IS NOT NULL

-- 테이블 내용 업데이트(수정) --

UPDATE  customers
SET contactName = 'Alfred Schmidt', city = 'Frankfurt'
WHERE customerID = 1;

SELECT * FROM customers;

UPDATE customers
SET postalcode = '00000'

WHERE country = 'Mexico'

DELETE FROM customers
WHERE CustomerName = 'Alfreds Futterkiste';

-- LIMIT 설정 --
-- SELECT * FROM customers; 이건 전체를 보여주는 코드

SELECT * FROM customers LIMIT 3;

SELECT * FROM customers LIMIT 3 OFFSET 3;

SELECT * FROM customers
WHERE country = 'Germany' LIMIT 3;

SELECT * FROM customers
ORDER BY country LIMIT 3;

SELECT * FROM customers
ORDER BY country DESC;

-- a,b,c,d 순서는 (ASC)오름차순 / z, y, x, w (DESC)내림차순

SELECT * FROM products;

SELECT MIN(price) AS 가장낮은은가격
FROM products;

SELECT MAX(price) AS 가장높은가격
FROM products;

SELECT COUNT(*) from products;
SELECT COUNT(productid) FROM products;

SELECT AVG(price) 평균가격
FROM products;

DESCRIBE  orderdetails;

SELECT * FROM orderdetails;
SELECT SUM(quantity) 합계
FROM orderdetails;

SELECT * FROM customers;

SELECT * FROM customers
WHERE customerName LIKE 'a%';

SELECT * FROM customers
WHERE customerName LIKE '%a';

SELECT * FROM customers
WHERE customerName LIKE '%or%';

SELECT * FROM customers
WHERE customerName LIKE '_r%';

SELECT * FROM customers
WHERE customerName LIKE 'a__%';

SELECT * FROM customers
WHERE ContactName LIKE 'a%o';

SELECT * FROM customers
WHERE customerName Not LIKE 'a%';

SELECT * FROM customers
WHERE city LIKE 'ber%';

SELECT * FROM customers
WHERE city LIKE '%es%';

SELECT * FROM customers
WHERE city LIKE '_ondon';

SELECT * FROM customers
WHERE city LIKE 'L_n_on';

SELECT * FROM customers
WHERE country IN ('Germany', 'France', 'UK');

SELECT * FROM customers
WHERE country not IN ('Germany', 'France', 'UK');

SELECT * FROM suppliers;
SELECT country FROM suppliers;

SELECT * FROM customers
WHERE country IN (SELECT country FROM suppliers);

SELECT * FROM customers
WHERE country not IN (SELECT country FROM suppliers);

SELECT * FROM products

SELECT * FROM products
WHERE price BETWEEN 10 AND 20;

SELECT * FROM products
WHERE price not BETWEEN 10 AND 20;

SELECT * FROM products
WHERE price not BETWEEN 10 AND 20
AND categoryID NOT IN (1,2,3);

SELECT * FROM products
WHERE ProductName 
	BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT * FROM products
WHERE ProductName 
	BETWEEN "Carnarvon Tigers" AND "Chef Anton's Cajun Seasoning"
ORDER BY ProductName;

SELECT * FROM products
WHERE ProductName 
	not BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT * FROM orders
WHERE orderdate BETWEEN '1996-07-01' AND '1996-07-31';

SELECT customerid AS id, customername AS customer
FROM customers;

SELECT customerName AS 고객, contactName AS 연락처
FROM customers;

SELECT customerName AS 고객, contactName AS "연락처 ()"
FROM customers;

SELECT * FROM customers;

SELECT customerName, 
	CONCAT_WS(', ', Address, PostalCode, City, Country) AS 주소
FROM customers;

SELECT *
FROM customers AS c;

SELECT *
FROM orders AS o;

SELECT c.CustomerID
FROM customers AS c, orders AS o;

-- ---<특정 고객이 주문한 정보를 검색>---
-- SELECT 결과로 보여질 필드를 선택
-- FROM 사용하는 테이블을 선택
-- WHERE (조건) c.CustomerName = 'Around the Horn'
-- 	AND c.CustomerID=o.CustomerID;

SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM customers AS c, orders AS o
WHERE c.CustomerName = 'Around the Horn'
	AND c.CustomerID=o.CustomerID;
	
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM customers AS c, orders AS o
WHERE c.CustomerName = o.CustomerID

-- ----------------------------------------------
-- join 의 개념
-- 
-- 고객테이블(고객id)
-- 고객id, 고객name, 고객tel, 고객oddr

-- (관계??)테이블
-- **주문**테이블(주문id)
-- 주문id, 주문name(제품name), 주문date, 고객id

-- 제품테이블(제품id)
-- 제품id, 제품name, 제품price
-- ----------------------------------------------









