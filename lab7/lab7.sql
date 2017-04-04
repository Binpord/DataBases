USE CELLULAR;

DROP LOGIN test;
DROP USER test;

CREATE LOGIN test WITH PASSWORD = '111';
CREATE USER test FOR LOGIN test;

--FULL SELECT, INSERT and UPDATE rights
GRANT SELECT, INSERT, UPDATE ON JOB TO test;

BEGIN TRANSACTION;
EXECUTE AS USER = 'test';

SELECT * FROM JOB;

INSERT INTO JOB
	values(410, N'машинист');

UPDATE JOB
	SET job_id = 420
	WHERE [function] = N'машинист';

BEGIN TRY
SELECT * FROM EMPLOYEE;
END TRY
BEGIN CATCH
PRINT 'experienced error: ';
PRINT  ERROR_NUMBER();
END CATCH;

REVERT;
ROLLBACK;

--SELECT and UPDATE of chosen columns
GRANT SELECT, UPDATE (job_id) ON EMPLOYEE TO test;

BEGIN TRANSACTION;
EXECUTE AS USER = 'test';

SELECT * FROM EMPLOYEE;

UPDATE EMPLOYEE
	SET job_id = 400
	WHERE last_name = N'Егоров' AND first_name = N'Владислав';

BEGIN TRY
UPDATE EMPLOYEE
	SET manager_id = 507
	WHERE last_name = N'Егоров' AND first_name = N'Владислав';
END TRY
BEGIN CATCH
PRINT 'experienced error: ';
PRINT  ERROR_NUMBER();
END CATCH;

REVERT;
ROLLBACK;