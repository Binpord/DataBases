--Creating view: customer, amount of inquiries

IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'CUSTOMER_TROUBLES' AND
		schema_id = SCHEMA_ID('dbo'))
	DROP VIEW CUSTOMER_TROUBLES;

GO
CREATE VIEW CUSTOMER_TROUBLES AS
	(
	SELECT CUSTOMER.[name], COUNT(inquiry_id) AS inquiries
		FROM SUPPORT JOIN CUSTOMER ON CUSTOMER.customer_id = SUPPORT.customer_id
		GROUP BY CUSTOMER.[name]
	UNION
	SELECT CUSTOMER.[name], 0 AS inquiries
		FROM CUSTOMER
		WHERE customer_id NOT IN (SELECT customer_id FROM SUPPORT)
	);
GO

SELECT * FROM CUSTOMER_TROUBLES;