USE CELLULAR;

GO

IF OBJECT_ID ('dbo.CONNECTIONS_TRACK','TR') IS NOT NULL
   DROP TRIGGER dbo.CONNECTIONS_TRACK;

GO

-- Creating trigger, that defines policy that every customer should have at least one connection
CREATE TRIGGER CONNECTIONS_TRACK
	ON CONNECTION
	AFTER DELETE
	AS
	BEGIN
		DECLARE @num_of_conns SMALLINT;

		DECLARE @deleted_count SMALLINT;	-- counter
		SET @deleted_count = 0;
		
		DECLARE @max_count SMALLINT;		-- length of deleted
		SET @max_count = (SELECT COUNT(*) FROM deleted);
		
		DECLARE @cur_customer SMALLINT;		-- iterator

		-- copy of the deleted table as we need to delete from that table
		DECLARE @cp_deleted TABLE
		(
			customer_id SMALLINT, 
			tariff_id SMALLINT, 
			phone_number DECIMAL(10, 0), 
			used_minutes SMALLINT, 
			used_messages SMALLINT, 
			used_internet SMALLINT, 
			rate SMALLINT
		);
		INSERT INTO @cp_deleted
			SELECT * FROM deleted;

		-- "For each customer in deleted" implementation
		WHILE(@deleted_count < @max_count)
		BEGIN
			SET @cur_customer = (SELECT TOP(1) customer_id FROM @cp_deleted);

			SET @num_of_conns = (SELECT COUNT(*) FROM CONNECTION WHERE customer_id = @cur_customer);

			-- If delete is incorrect - insert deleted
			IF @num_of_conns = 0 AND EXISTS (SELECT * FROM CUSTOMER WHERE customer_id = @cur_customer)
			BEGIN
				INSERT INTO CONNECTION
					SELECT * FROM @cp_deleted
						WHERE customer_id = @cur_customer;
			END

			-- counter is incremented by the length of part, being deleted from @cp_deleted
			SET @deleted_count += (SELECT COUNT(*) FROM @cp_deleted WHERE customer_id = @cur_customer);

			DELETE FROM @cp_deleted
				WHERE customer_id = @cur_customer;
		END
	END

GO

BEGIN TRANSACTION;

SELECT CONNECTION.customer_id, name, COUNT(*) FROM CONNECTION JOIN CUSTOMER ON CONNECTION.customer_id = CUSTOMER.customer_id
	GROUP BY CONNECTION.customer_id, name;

SELECT COUNT(*) FROM CONNECTION;

SELECT 'Иванов Иван' AS name, phone_number FROM CONNECTION
	WHERE customer_id = dbo.cstrid_from_name('Иванов Иван');

-- 'Вадимов Вадим' 's phone_number
DELETE FROM CONNECTION
	WHERE phone_number = 9168581126;

SELECT COUNT(*) FROM CONNECTION;

-- One of them is another 'Вадимов Вадим' 's phone_number and the other one is 'Иванов Иван' 's phone_number
DELETE FROM CONNECTION
	WHERE phone_number IN (9168581122, 9168581113);
	
SELECT COUNT(*) FROM CONNECTION;

-- Now how to delete last customer's connection (CONNECTION.customer_id -> CUSTOMER.customer_id [FK], on delete cascade)
SELECT COUNT(*) FROM CUSTOMER;

DELETE FROM CUSTOMER
	WHERE customer_id = dbo.cstrid_from_name('Иванов Иван');

SELECT COUNT(*) FROM CONNECTION;
SELECT COUNT(*) FROM CUSTOMER;

ROLLBACK TRANSACTION;