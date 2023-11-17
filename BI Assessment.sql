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

