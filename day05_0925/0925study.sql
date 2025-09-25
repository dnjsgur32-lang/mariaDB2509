-- ---<UNION 결합>---
USE exdb;

SELECT * FROM customers;
SELECT * FROM suppliers;

SELECT city FROM customers
UNION
SELECT city FROM suppliers
ORDER BY city;

SELECT city, country FROM customers
WHERE country = 'Germany'
UNION
SELECT city, country FROM suppliers
WHERE country = 'Germany'
ORDER BY city;

SELECT 'Customer'AS TYPE, contactName, city, country
FROM customers
UNION	
SELECT 'Supplier'AS TYPE, contactName, city, country
FROM suppliers
ORDER BY contactName;

SELECT country
FROM customers
order BY country;

SELECT COUNT(customerID) AS conutryCnt, country
FROM customers
GROUP BY country;

SELECT COUNT(customerID) AS conutryCnt, country
FROM customers
GROUP BY country
ORDER BY COUNT(customerID) desc;

SELECT * FROM orders;
SELECT * FROM shippers;

SELECT s.ShipperName, COUNT(o.OrderID)AS NumberOfOders
FROM orders AS o
LEFT JOIN shippers AS s ON o.ShipperID = s.ShipperID
GROUP BY shipperName;

SELECT COUNT(customerID), country
FROM customers
GROUP BY country
HAVING COUNT(customerID) > 5
ORDER BY COUNT(customerID) DESC;

SELECT * FROM orders;
SELECT * FROM employees;

SELECT e.LastName, COUNT(o.OrderID) AS numberOfOrders
FROM orders AS o
INNER JOIN employees AS e 
	ON o.EmployeeID = e.EmployeeID
GROUP BY lastName
HAVING COUNT(o.OrderID) > 100
ORDER BY COUNT(orderID) DESC;

SELECT e.LastName, COUNT(o.OrderID) cntOrder
FROM orders o
INNER JOIN employees e ON o.EmployeeID = e.EmployeeID
WHERE lastName = 'Davolio' OR lastName = 'Fuller'
GROUP BY lastName
HAVING COUNT(o.OrderID) > 25;


SELECT * FROM suppliers;
SELECT * FROM products;

SELECT SupplierName
FROM suppliers s
WHERE EXISTS (
	SELECT ProductName
	FROM products p
	WHERE p.SupplierID = s.SupplierID  AND Price < 20
	);

SELECT ProductName, Price, SupplierID
FROM products
WHERE price < 20;

SELECT SupplierName
FROM suppliers s
WHERE EXISTS (
	SELECT ProductName
	FROM products p
	WHERE p.SupplierID = s.SupplierID AND price = 22
);

SELECT ProductName, price
FROM products p
WHERE price = 22
















