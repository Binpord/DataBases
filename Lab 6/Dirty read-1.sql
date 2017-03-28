USE CELLULAR;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;

SELECT * FROM JOB
	WHERE [function] = N'менеджер';

WAITFOR DELAY '00:00:05';

SELECT * FROM JOB
	WHERE [function] = N'менеджер';
	
WAITFOR DELAY '00:00:05';

SELECT * FROM JOB
	WHERE [function] = N'менеджер';

COMMIT;