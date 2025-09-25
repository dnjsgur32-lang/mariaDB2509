USE exdb;
SHOW TABLES;
DESC customers;
DESC orders;
DESC orderdetails;
DESC products;
DESC categories;
DESC shippers;
DESC suppliers;
DESC employees;


-- 과제1
SELECT CustomerName, City, Country
from customers
ORDER BY city;

-- 과제2
SELECT CustomerName, City
FROM customers
WHERE City LIKE 's%'
	AND country IS NOT NULL;
	
-- 과제3
SELECT ProductName, Price
FROM products
ORDER BY price DESC, productName ASC
LIMIT 5;

-- 과제4
SELECT c.CategoryName,
			ROUND(AVG(p.Price), 2) AS avg_price
FROM categories c
JOIN products p ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName
HAVING AVG(p.Price) >= 20
ORDER BY avg_price DESC;

-- 과제5
SELECT o.OrderID, o.OrderDate, c.CustomerName, c.Country
FROM orders o
JOIN customers c ON c.CustomerID = o.CustomerID
ORDER BY o.OrderDate DESC
LIMIT 10;

-- 과제6
SELECT o.OrderID,
       ROUND(SUM(p.Price * od.Quantity), 2) AS total_amount
FROM orders o
JOIN orderdetails od ON od.OrderID  = o.OrderID
JOIN products     p  ON p.ProductID = od.ProductID
GROUP BY o.OrderID
ORDER BY total_amount DESC;

-- 과제7
SELECT DATE_FORMAT(o.OrderDate, '%y-%m') AS month_key,
			ROUND(SUM(p.Price * od.Quantity), 2) AS revenue
FROM orders o
JOIN orderdetails od ON od.OrderID = o.OrderID
JOIN products p ON p.ProductID = od.ProductID
GROUP BY month_key
ORDER BY month_key;

-- 과제8
SELECT c.CustomerID, c.CustomerName,
		ROUND(SUM(p.Price * od.Quantity), 2) AS total_spent
FROM customers c
JOIN orders o ON o.CustomerID = c.CustomerID
JOIN orderdetails od ON od.OrderID = o.OrderID
JOIN products p ON p.ProductID = od.ProductID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY total_spent DESC
LIMIT 5;

-- 과제9
SELECT p.ProductName, p.Price, c.CategoryName
FROM products p
JOIN categories c ON c.CategoryID = p.CategoryID
WHERE p.Price = (SELECT MAX(price) FROM products);

-- 과제10
SELECT c.CategoryName, p.ProductName, p.Price,
		DENSE_RANK() OVER (PARTITION BY c.CategoryID
		ORDER BY p.Price DESC) AS price_rank
FROM products p
JOIN categories c ON c.CategoryID = p.CategoryID
ORDER BY c.CategoryName, price_rank, p.ProductName;

-- 과제11
CREATE OR REPLACE VIEW v_order_totals AS
SELECT o.OrderID,
		ROUND(SUM(p.Price * od.Quantity), 2) AS total_amount
FROM orders o
JOIN orderdetails od ON od.OrderID = o.OrderID
JOIN products p ON p.ProductID = od.ProductID
GROUP BY o.OrderID;

SELECT * FROM v_order_totals
WHERE total_amount >= 1000
ORDER BY total_amount DESC;










