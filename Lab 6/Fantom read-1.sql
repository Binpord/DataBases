USE CELLULAR;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

BEGIN TRANSACTION;

SELECT * FROM JOB;

WAITFOR DELAY '00:00:05';

SELECT * FROM JOB;

COMMIT;