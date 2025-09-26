USE exdb;

SELECT CustomerName, City, Country
FROM Customers
WHERE Country IN ('Germany', 'USA')
ORDER BY City ASC
LIMIT 10;

SELECT ProductName, Price
FROM products
WHERE ProductName LIKE 'C%';

SELECT c.CustomerName, COUNT(o.OrderID) AS order_cnt
FROM Customers c
LEFT JOIN Orders o
	ON o.CustomerID = c.CustomerID
	GROUP BY c.CustomerID
	ORDER BY order_cnt DESC;
	
SELECT DISTINCT c.CustomerName
FROM customers c
INNER JOIN orders o
	ON o.CustomerID = c.CustomerID;
	
SELECT c.CustomerName, 
	COALESCE(c.PostalCode, '우편번호없음')
	AS PostalCode
FROM customers c
ORDER BY c.CustomerName