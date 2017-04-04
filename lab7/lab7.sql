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
PRINT 'experienced error trying to select from EMPLOYEE';
PRINT  ERROR_NUMBER();
END CATCH;

REVERT;
ROLLBACK;

REVOKE SELECT, INSERT, UPDATE ON JOB TO test;

--SELECT and UPDATE of chosen columns
GRANT SELECT, UPDATE(job_id) ON EMPLOYEE TO test;

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
PRINT 'experienced error trying to update manager_id:';
PRINT  ERROR_NUMBER();
END CATCH;

REVERT;
ROLLBACK;

REVOKE SELECT, UPDATE(job_id) ON EMPLOYEE TO test;

GRANT SELECT(job_id), UPDATE(job_id) ON EMPLOYEE TO test;

BEGIN TRANSACTION;
EXECUTE AS USER = 'test';

SELECT job_id FROM EMPLOYEE;

BEGIN TRY
SELECT * FROM EMPLOYEE;
END TRY
BEGIN CATCH
PRINT 'experienced error trying to select * from EMPLOYEE:';
PRINT ERROR_NUMBER();
END CATCH;

UPDATE EMPLOYEE
	SET job_id = 400;

BEGIN TRY
UPDATE EMPLOYEE
	SET job_id = 400
	WHERE last_name = N'Егоров' AND first_name = N'Владислав';
END TRY
BEGIN CATCH
PRINT 'experienced error trying to update job_id with select:';
PRINT  ERROR_NUMBER();
END CATCH;

REVERT;
ROLLBACK;