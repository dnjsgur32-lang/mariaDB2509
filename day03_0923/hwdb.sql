SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM orderitems;
SELECT * FROM customers LIMIT 5;

SELECT * FROM customers   LIMIT 3;
SELECT * FROM products    LIMIT 3;
SELECT * FROM orders      LIMIT 3;
SELECT * FROM orderitems  LIMIT 3;

SELECT COUNT(*) FROM orders o
LEFT JOIN customers c ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

SELECT COUNT(*) FROM orderitems i
LEFT JOIN orders   o ON o.order_id   = i.order_id
LEFT JOIN products p ON p.product_id = i.product_id
WHERE o.order_id IS NULL OR p.product_id IS NULL;

SELECT o.order_id, o.order_date, c.customer_name,
       SUM(i.qty * i.unit_price) AS order_total
FROM orders o
JOIN customers c  ON c.customer_id = o.customer_id
JOIN orderitems i ON i.order_id    = o.order_id
GROUP BY o.order_id, o.order_date, c.customer_name
ORDER BY o.order_id;

SELECT customer_id, customer_name
FROM customers
ORDER BY customer_name
LIMIT 5;

SELECT customer_id, customer_name, city
FROM customers
WHERE city = 'Seoul';

SELECT * FROM customers
WHERE customer_name LIKE '%김%';

SELECT customer_name, city
FROM customers
WHERE city IN ('Seoul','Busan');

SELECT product_name, price
FROM products
WHERE price BETWEEN 10000 AND 70000
ORDER BY price;

INSERT INTO customers (customer_id, customer_name, tel, addr, city, country)
VALUES (7, '최수민', '010-2323-4545', '대전 중앙로 10', 'Daejeon', 'Korea');

UPDATE customers
SET city = 'Seoul'
WHERE customer_id = 7;

DELETE FROM customers
WHERE customer_id = 7;

SELECT order_id,
       SUM(qty * unit_price) AS order_total
FROM orderitems
GROUP BY order_id
ORDER BY order_id;

SELECT COUNT(*) FROM customers; 

SELECT * FROM products LIMIT 3;