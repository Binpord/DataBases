--Creating view: connection, tariff, debt

IF EXISTS(
	SELECT * FROM sys.views
	WHERE [name] = 'DEBT' AND
		schema_id = SCHEMA_ID('dbo'))
	DROP VIEW DEBT;

GO
CREATE VIEW DEBT AS
	(SELECT CONNECTION.phone_number, TARIFF.[name], 
			(SUM(min_debt) + SUM(msg_debt) + SUM(int_debt)) AS debt
		FROM CONNECTION 
			JOIN TARIFF ON CONNECTION.tariff_id = TARIFF.tariff_id
			JOIN --debts
				(SELECT TARIFF.tariff_id, CONNECTION.phone_number, 
						CASE
							WHEN used_minutes > minutes 
								THEN ((used_minutes - minutes) * minute_price) 
							ELSE 0
						END AS min_debt,
						CASE
							WHEN used_messages > messages 
								THEN ((used_messages - messages) * message_price) 
							ELSE 0
						END AS msg_debt,
						CASE
							WHEN used_internet > internet_h
								THEN ((used_internet - internet_h) * internet_price)
							ELSE 0
						END AS int_debt
					from TARIFF join CONNECTION on TARIFF.tariff_id = CONNECTION.tariff_id) DBT 
						ON CONNECTION.phone_number = DBT.phone_number
		GROUP BY CONNECTION.phone_number, TARIFF.[name]);
GO

SELECT * FROM DEBT;