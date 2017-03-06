--Selecting person who works on the inquiries more time than others

WITH TimeOnInquiry(manager_id, worked) AS (
		SELECT manager_id, DATEDIFF(hour, tsk_given, close_date)
			FROM SUPPORT JOIN SUPPORT_STAFF ON SUPPORT.inquiry_id = SUPPORT_STAFF.inquiry_id
			WHERE close_date IS NOT NULL
		UNION ALL
		SELECT manager_id, DATEDIFF(hour, tsk_given, SYSDATETIME())
			FROM SUPPORT JOIN SUPPORT_STAFF ON SUPPORT.inquiry_id = SUPPORT_STAFF.inquiry_id
		WHERE close_date IS NULL
	),
	AverageTimeOnInq(manager_id, worked) AS (
		SELECT manager_id, AVG(worked)
			FROM TimeOnInquiry
			GROUP BY manager_id
	)
SELECT last_name, first_name, hire_date, salary
	FROM EMPLOYEE JOIN AverageTimeOnInq ON EMPLOYEE.employee_id = AverageTimeOnInq.manager_id
	WHERE employee_id
		in (SELECT manager_id FROM AverageTimeOnInq
			WHERE worked
				in (SELECT MAX(worked) FROM AverageTimeOnInq));