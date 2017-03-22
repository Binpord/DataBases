--Creating view: customer, number of connections, most popular tariff

IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'MP_TARIFF' AND
		schema_id = SCHEMA_ID('dbo'))
	DROP VIEW MP_TARIFF;

GO
CREATE VIEW  MP_TARIFF AS
	(SELECT C.[name] AS customer,
			COUNT(phone_number) AS amount,
			(SELECT TOP(1) tariff_name FROM
				(SELECT TARIFF.[name] AS tariff_name, COUNT(phone_number) AS amount
					FROM TARIFF JOIN CONNECTION ON TARIFF.tariff_id = CONNECTION.tariff_id
					WHERE CONNECTION.customer_id = C.customer_id
					GROUP BY TARIFF.[name]) AM
				ORDER BY amount DESC
			) AS pop
			FROM CUSTOMER C
				JOIN CONNECTION ON C.customer_id = CONNECTION.customer_id
			GROUP BY C.[name], C.customer_id
	)
GO

SELECT * FROM MP_TARIFF;