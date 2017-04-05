USE CELLULAR;

--create view
DROP LOGIN q_test;
DROP USER q_test;

CREATE LOGIN q_test WITH PASSWORD = '111';
CREATE USER q_test FOR LOGIN q_test;

GRANT ALTER ON SCHEMA::dbo TO q_test;
GRANT CREATE VIEW TO q_test;

BEGIN TRANSACTION;
EXECUTE AS USER = 'q_test';

DROP VIEW dbo.test_view;
GO
CREATE VIEW dbo.test_view AS
	SELECT * FROM SUPPORT;
GO

REVERT;
ROLLBACK;

--min rights to see all
EXEC sp_who2;

ALTER ROLE db_accessadmin ADD MEMBER q_test;

USE master;

GRANT VIEW SERVER STATE TO q_test;

USE CELLULAR;

BEGIN TRANSACTION;
EXECUTE AS LOGIN = 'q_test';

EXEC sp_who2;

REVERT;
ROLLBACK;