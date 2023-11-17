USE bi;

-- Exercise 1

SELECT country, MONTH(i.created_at) AS month, COUNT(s.sale_id) AS count
FROM sales AS s
JOIN invoices AS i
	ON s.sale_id = i.sale_id
WHERE YEAR(i.created_at) = 2020
GROUP BY country, month
HAVING count > 1150
ORDER BY Count DESC;

-- Exercise 2

SELECT DISTINCT(no_id)
FROM sales_products AS sp
JOIN users AS u
	ON sp.user_id = u.user_id
JOIN invoices as i
	ON sp.sale_id = i.sale_id
WHERE YEAR(i.created_at) = 2020 AND sp.type = 'Lentes de Contacto';

-- Exercise 3

SELECT COUNT(DISTINCT(s.user_id))
FROM sales_products AS sp
JOIN sales AS s
	ON s.sale_id = sp.sale_id
WHERE 
	DATE(s.created_at) >= '2019-10-01' AND 
    DATE(s.created_at) <= '2020-01-31' AND
    type != 'Lentes de Contacto' AND
    country = 'CO';

-- Exercise 4

WITH RankedProducts AS (
	SELECT 
		MONTH(s.created_at) AS month, 
        sp.name, 
        SUM(sp.qty) AS quantity,
        ROW_NUMBER() OVER (PARTITION BY MONTH(s.created_at) ORDER BY SUM(sp.qty) DESC) AS ranking
	FROM sales_products AS sp
	JOIN sales AS s
		ON s.sale_id = sp.sale_id
	GROUP BY month, sp.name
	)
SELECT month, name, quantity
FROM RankedProducts
WHERE ranking <= 10
ORDER BY month ASC, ranking;

-- Exercise 5

SELECT s.sale_id, SUM(sp.value * sp.qty) AS product_total_value, s.value AS sale_value
FROM sales_products AS sp
JOIN sales AS s
	ON s.sale_id = sp.sale_id
GROUP BY s.sale_id
HAVING product_total_value != sale_value
ORDER BY s.sale_id ASC;

-- Exercise 6

SELECT COUNT(u.user_id)
FROM users AS u
LEFT JOIN sales AS s
	ON s.user_id = u.user_id
WHERE s.sale_id IS NULL
ORDER BY u.user_id ASC;

-- Exercise 7

CREATE VIEW 201901_product_sales AS
SELECT sp.name AS product, SUM(s.value) AS 201901_sales
FROM sales_products AS sp
JOIN sales AS s
	ON s.sale_id = sp.sale_id
WHERE YEAR(s.created_at) = 2019 AND MONTH(s.created_at) = 1
GROUP BY sp.name;

SELECT * FROM 201901_product_sales;

CREATE VIEW 202001_product_sales AS
SELECT sp.name AS product, SUM(s.value) AS 202001_sales
FROM sales_products AS sp
JOIN sales AS s
	ON s.sale_id = sp.sale_id
WHERE YEAR(s.created_at) = 2020 AND MONTH(s.created_at) = 1
GROUP BY sp.name;

SELECT * FROM 202001_product_sales;

SELECT a.product, 201901_sales, 202001_sales
FROM 201901_product_sales AS a
JOIN 202001_product_sales AS b
	ON a.product = b.product
WHERE 202001_sales < 201901_sales;

-- Exercise 8

CREATE VIEW 2020_product_sales AS
SELECT sp.name AS product, SUM(s.value) AS 2020_sales
FROM sales_products AS sp
JOIN sales AS s
	ON s.sale_id = sp.sale_id
WHERE YEAR(s.created_at) = 2020
GROUP BY sp.name;

SELECT * FROM 2020_product_sales;

CREATE VIEW 2021_product_sales AS
SELECT sp.name AS product, SUM(s.value) AS 2021_sales
FROM sales_products AS sp
JOIN sales AS s
	ON s.sale_id = sp.sale_id
WHERE YEAR(s.created_at) = 2021
GROUP BY sp.name;

SELECT * FROM 2021_product_sales;

SELECT 
	a.product, 
    2020_sales, 
    2021_sales, 
    ((2021_sales - 2020_sales)/2020_sales)*100 AS var_perc
FROM 2020_product_sales AS a
JOIN 2021_product_sales AS b
	ON a.product = b.product
ORDER BY var_perc DESC;
