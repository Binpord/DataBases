--Select most popular tariff for every customer

WITH TMP(customer, connection, tariff) as (
SELECT CUSTOMER.name, COUNT(CONNECTION.tariff_id), TARIFF.name
	FROM CUSTOMER JOIN CONNECTION ON CUSTOMER.customer_id = CONNECTION.customer_id
	JOIN TARIFF ON CONNECTION.tariff_id = TARIFF.tariff_id
	group by CUSTOMER.name, CONNECTION.tariff_id, TARIFF.name
	)
SELECT TOP(1) customer, tariff FROM TMP
	GROUP BY customer, tariff;