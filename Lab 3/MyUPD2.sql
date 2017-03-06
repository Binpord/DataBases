--Deleting support inquiries that were closed year ago

DELETE FROM SUPPORT
	WHERE DATEDIFF(day, close_date, SYSDATETIME()) > 365;

--Here should be script to delete connected lines in SUPPORT_STAFF table, but
--there is no need due to cascade deleting and updating of FK.