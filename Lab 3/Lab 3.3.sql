--Select most popular tariff for every customer

WITH TARIFF_PER_CUSTOMER(customer_id, customer, connection, tariff) AS (
	SELECT CUSTOMER.customer_id, CUSTOMER.name, COUNT(CONNECTION.tariff_id), TARIFF.name
		FROM CUSTOMER JOIN CONNECTION ON CUSTOMER.customer_id = CONNECTION.customer_id
		JOIN TARIFF ON CONNECTION.tariff_id = TARIFF.tariff_id
		group by CUSTOMER.customer_id, CUSTOMER.name, CONNECTION.tariff_id, TARIFF.name
	),
	MAX_TARIFF(customer_id, connection) AS (
	SELECT customer_id, MAX(connection) FROM TARIFF_PER_CUSTOMER
		GROUP BY customer_id
	)
SELECT TARIFF_PER_CUSTOMER.customer, tariff
	FROM MAX_TARIFF LEFT JOIN TARIFF_PER_CUSTOMER 
	ON MAX_TARIFF.customer_id = TARIFF_PER_CUSTOMER.customer_id 
	AND TARIFF_PER_CUSTOMER.connection = MAX_TARIFF.connection;