USE exdb;
SHOW TABLES;

SELECT * from orders;
SELECT * FROM customers;


-- inner join 테이블 2개
SELECT o.OrderID, c.CustomerID, c.CustomerName 고객이름, o.OrderDate
FROM orders AS o
INNER JOIN customers AS c
	ON o.CustomerID = c.CustomerID;

SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM shippers;

-- inner join 테이블 3개
SELECT
	o.OrderID, c.CustomerID, c.CustomerName, s.ShipperID, s.ShipperName
FROM orders AS o
INNER JOIN customers AS c
	ON o.CustomerID = c.CustomerID
INNER JOIN shippers AS s
	ON o.ShipperID = s.ShipperID;

-- Left join 테이블 2개
SELECT c.CustomerID, c.CustomerName, o.OrderID
FROM customers c
LEFT JOIN orders o
	ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID;

SELECT * FROM orders;
SELECT * FROM employees;

-- Right join 테이블 2개
SELECT o.OrderID, e.EmployeeID, e.FirstName
FROM orders o
RIGHT JOIN employees e
	ON o.EmployeeID = e.EmployeeID
ORDER BY o.EmployeeID;

SELECT * FROM customers;
SELECT * FROM orders;

-- Cross join 테이블 2개
SELECT c.CustomerID, c.CustomerName, o.OrderID
FROM customers c
CROSS JOIN orders o
WHERE c.CustomerID = o.CustomerID;

SELECT * FROM customers;
	
-- Self join 테이블 1개
SELECT c1.CustomerID, c1.CustomerName AS c1고객이름, c1.City c1도시,
		 c2.CustomerID, c2.CustomerName AS c2고객이름,  c2.City c2도시
FROM customers c1, customers c2
WHERE c1.CustomerID <> c2.CustomerID
	AND c1.City = c2.City
ORDER BY c1.City;

-- union
SELECT * FROM customers;
SELECT * FROM suppliers;

SELECT City FROM customers
UNION
SELECT City FROM suppliers
ORDER BY City;

SELECT city, country FROM customers
WHERE country = 'Germany'
UNION
SELECT city, country FROM Suppliers
WHERE country = 'Germany'
ORDER BY city;

SELECT * FROM customers;

SELECT 'Customer' AS Type, Contactname, City, Country
FROM Customers
UNION	
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;








