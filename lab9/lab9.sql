USE CELLULAR;

GO
--Creating trigger, that defines policy that every customer should have at least one connection

CREATE TRIGGER CONNECTIONS_TRACK
	ON CONNECTION
	AFTER DELETE
	AS
	BEGIN
		DECLARE @num_of_conns SMALLINT;

		SET @num_of_conns = (SELECT COUNT(*) FROM CONNECTION WHERE customer_id = (SELECT customer_id FROM deleted));

		IF @num_of_conns = 0
		BEGIN
			PRINT '�� ������� ������� �����������, ��� ��� ��� ������������ ���������� ������� ������������.';
			PRINT '����� ��������� ����������� ������� ������������.';
			ROLLBACK TRANSACTION;
		END
		ELSE
			PRINT '�������� �������.'
	END
GO