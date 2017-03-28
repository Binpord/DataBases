USE CELLULAR;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

BEGIN TRANSACTION;

UPDATE JOB SET
	job_id = 420
	WHERE [function] = N'менеджер';

COMMIT;

WAITFOR DELAY '00:00:05';

UPDATE JOB SET
	job_id = 400
	WHERE [function] = N'менеджер';