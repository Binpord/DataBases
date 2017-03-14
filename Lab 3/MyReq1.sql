--Choosing the most troublecausing customer

WITH NumOfInquiryes(name, num) AS (
		SELECT CUSTOMER.name, COUNT(DISTINCT inquiry_id)
			FROM CUSTOMER JOIN SUPPORT ON CUSTOMER.customer_id = SUPPORT.customer_id
			GROUP BY CUSTOMER.name
	),
	MaxInquiryes(name) AS (
		SELECT name FROM NumOfInquiryes
			WHERE num in (SELECT MAX(num) FROM NumOfInquiryes)
	)
SELECT CUSTOMER.name FROM CUSTOMER
	WHERE CUSTOMER.name in (SELECT * FROM MaxInquiryes);