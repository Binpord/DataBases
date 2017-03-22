--Creating view: inquiry, amount of managers (solving)

IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'INQ' AND
		schema_id = SCHEMA_ID('dbo'))
	DROP VIEW INQ;

GO
CREATE VIEW INQ AS
	(SELECT SUPPORT_STAFF.inquiry_id, SUPPORT.comments, COUNT(manager_id) AS managers
		FROM SUPPORT JOIN SUPPORT_STAFF ON SUPPORT.inquiry_id = SUPPORT_STAFF.inquiry_id
		GROUP BY SUPPORT_STAFF.inquiry_id, SUPPORT.comments);
GO

SELECT * FROM INQ;