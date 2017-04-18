USE CELLULAR;

GO

IF OBJECT_ID ('dbo.CONNECTIONS_TRACK','TR') IS NOT NULL
   DROP TRIGGER dbo.CONNECTIONS_TRACK;

GO

--Creating trigger, that defines policy that every customer should have at least one connection
CREATE TRIGGER CONNECTIONS_TRACK
	ON CONNECTION
	AFTER DELETE
	AS
	BEGIN
		DECLARE @num_of_conns SMALLINT;
		
		-- "For each customer in deleted" implementation
		DECLARE @deleted_count SMALLINT;
		DECLARE @max_count SMALLINT;
		DECLARE @cur_customer SMALLINT;

		SET @max_count = (SELECT COUNT(*) FROM deleted);
		SET @deleted_count = 0;

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

		WHILE(@deleted_count < @max_count)
		BEGIN
			SET @cur_customer = (SELECT TOP(1) customer_id FROM @cp_deleted);

			SET @num_of_conns = (SELECT COUNT(*) FROM CONNECTION WHERE customer_id = @cur_customer);

			IF @num_of_conns = 0 AND EXISTS (SELECT * FROM CUSTOMER WHERE customer_id = @cur_customer)
			BEGIN
				PRINT 'Не удалось выполнить DELETE, так как для одного или нескольких пользователей соединение является последним.';
				PRINT 'Перед удалением такого подключения удалите пользователя.';
				ROLLBACK TRANSACTION;
				RETURN;
			END
			ELSE
				PRINT 'Удаление успешно.'

			DELETE FROM @cp_deleted
				WHERE customer_id = @cur_customer;

			SET @deleted_count += 1;
		END
	END

GO

BEGIN TRANSACTION;

SELECT CONNECTION.customer_id, name, COUNT(*) FROM CONNECTION JOIN CUSTOMER ON CONNECTION.customer_id = CUSTOMER.customer_id
	GROUP BY CONNECTION.customer_id, name;

SELECT 'Вадим Вадимов' AS name, phone_number FROM CONNECTION
	WHERE customer_id = dbo.cstrid_from_name('Вадимов Вадим');

SELECT 'Иванов Иван' AS name, phone_number FROM CONNECTION
	WHERE customer_id = dbo.cstrid_from_name('Иванов Иван');

DELETE FROM CONNECTION
	WHERE phone_number = 9168581126;

DELETE FROM CONNECTION
	WHERE phone_number IN (9168581122, 9168581113);

ROLLBACK TRANSACTION;