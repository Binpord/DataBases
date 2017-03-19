--Deleting support inquiries that were closed more than a year ago

BEGIN TRAN

SELECT * FROM SUPPORT;
SELECT * FROM SUPPORT_STAFF;

DELETE FROM SUPPORT
	WHERE DATEDIFF(day, close_date, SYSDATETIME()) > 365;

--Here should be script to delete connected lines in SUPPORT_STAFF table, but
--there is no need due to cascade deleting and updating of FK.

SELECT * FROM SUPPORT;
SELECT * FROM SUPPORT_STAFF;

ROLLBACK;