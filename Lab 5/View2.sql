--Creating view: customer, tariff, number of connections

IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'CONNS_AM' AND
		schema_id = SCHEMA_ID('dbo'))
	DROP VIEW CONNS_AM;

GO
CREATE VIEW CONNS_AM AS
	(SELECT CUSTOMER.[name] AS customer, TARIFF.[name] AS tariff, COUNT(phone_number) AS amount
		FROM CUSTOMER JOIN CONNECTION ON CUSTOMER.customer_id = CONNECTION.customer_id
			JOIN TARIFF ON CONNECTION.tariff_id = TARIFF.tariff_id
		GROUP BY CUSTOMER.[name], TARIFF.[name]
	);
GO

SELECT * FROM CONNS_AM;