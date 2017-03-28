USE CELLULAR;

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

BEGIN TRAN;

SELECT * FROM JOB;

UPDATE JOB SET
	job_id = job_id + 5
	WHERE [function] = N'менеджер';
	
WAITFOR DELAY '00:00:05';

COMMIT;

WAITFOR DELAY '00:00:05';

SELECT * FROM JOB;