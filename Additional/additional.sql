-- Example of bulk insert (from file)

BEGIN TRANSACTION;

SELECT * FROM LOCATION;

BULK INSERT 
	CELLULAR.dbo.LOCATION
	FROM 'E:\Additional\locs.txt'
	WITH
	(
		-- BATCHSIZE = 1,
		CHECK_CONSTRAINTS,
		-- CODEPAGE = 'OEM',
		DATAFILETYPE = 'char',
		-- ERRORFILE = 'E:\Additional\err.txt',
		-- FIRSTROW = 1,
		FIRE_TRIGGERS,
		KEEPIDENTITY,
		-- KEEPNULLS,
		-- LASTROW = 0,
		-- MAXERRORS = 10,
		TABLOCK,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n'
	);

SELECT * FROM LOCATION;

ROLLBACK;