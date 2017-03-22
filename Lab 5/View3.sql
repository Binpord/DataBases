--Creating view: customer, month, amount of inquiries

IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'ACTIVITY' AND
		schema_id = SCHEMA_ID('dbo'))
	DROP VIEW ACTIVITY;

GO
CREATE VIEW ACTIVITY AS
	(SELECT
		DATENAME(YYYY, SUPPORT.inquiry_date) AS 'Year',
		DATENAME(MM, SUPPORT.inquiry_date) AS 'Month',
		COUNT(SUPPORT.inquiry_id) AS 'Amount',
		CUSTOMER.[name]
		FROM SUPPORT JOIN CUSTOMER ON SUPPORT.customer_id = CUSTOMER.customer_id
		GROUP BY DATENAME(YYYY, SUPPORT.inquiry_date), DATENAME(MM, SUPPORT.inquiry_date),
			CUSTOMER.[name])
GO

SELECT * FROM ACTIVITY;