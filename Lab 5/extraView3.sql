--Creating view: employee, amount of support inauiries, he helped with

IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'TROUBLESHOOTING' AND
		schema_id = SCHEMA_ID('dbo'))
	DROP VIEW TROUBLESHOOTING;

GO
CREATE VIEW TROUBLESHOOTING AS
	(
	SELECT	EMPLOYEE.first_name, EMPLOYEE.last_name, COUNT(inquiry_id) AS inquiries
		FROM EMPLOYEE JOIN SUPPORT_STAFF ON EMPLOYEE.employee_id = SUPPORT_STAFF.manager_id
		GROUP BY EMPLOYEE.employee_id, EMPLOYEE.first_name, EMPLOYEE.last_name
	UNION
	SELECT EMPLOYEE.first_name, EMPLOYEE.last_name, 0 AS inquiries
		FROM EMPLOYEE
		WHERE employee_id NOT IN (SELECT manager_id FROM SUPPORT_STAFF)
	);
GO

SELECT * FROM TROUBLESHOOTING;