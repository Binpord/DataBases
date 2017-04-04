--Selecting list of customers with debt for 1 special tariff is higher than 3000

with min_dbt(tariff_id, name, min_debt) as (
		--Minutes debts
		select TARIFF.tariff_id, CUSTOMER.name, ((used_minutes - minutes) * minute_price)
			from TARIFF join CONNECTION on TARIFF.tariff_id = CONNECTION.tariff_id
			JOIN CUSTOMER ON CONNECTION.customer_id = CUSTOMER.customer_id
			where used_minutes > minutes
		),
	msg_dbt(tariff_id, name, msg_debt) as (
		--Messages debts
		select TARIFF.tariff_id,  CUSTOMER.name, ((used_messages - messages) * message_price)
			from TARIFF join CONNECTION on TARIFF.tariff_id = CONNECTION.tariff_id
			JOIN CUSTOMER ON CONNECTION.customer_id = CUSTOMER.customer_id
			where used_messages > messages
		),
	int_dbt(tariff_id, name, int_debt) as (
		--Internet debts
		select TARIFF.tariff_id, CUSTOMER.name, ((used_internet - internet_h) * internet_price)
			from TARIFF join CONNECTION on TARIFF.tariff_id = CONNECTION.tariff_id
			JOIN CUSTOMER ON CONNECTION.customer_id = CUSTOMER.customer_id
			where used_internet > internet_h
	),
	--Overall debt per customer per tariff
	debts(name, tariff_id, debt) as (
		select msg_dbt.name, msg_dbt.tariff_id, (sum(min_debt) + sum(msg_debt) + sum(int_debt))
			from msg_dbt join min_dbt on msg_dbt.tariff_id = min_dbt.tariff_id
				join int_dbt on int_dbt.tariff_id = min_dbt.tariff_id
			group by msg_dbt.name, msg_dbt.tariff_id
	)

SELECT name, debt
	FROM debts
	WHERE tariff_id = dbo.trfid_from_name('Ничего за 0')
	AND debt > 3000;

WITH dbt(tariff_id, name, min_debt, msg_debt, int_debt) AS (
	SELECT TARIFF.tariff_id, CUSTOMER.name, ((used_minutes - minutes) * minute_price), 
											((used_messages - messages) * message_price), 
											((used_internet - internet_h) * internet_price)
		FROM TARIFF JOIN CONNECTION ON TARIFF.tariff_id = CONNECTION.tariff_id
			JOIN CUSTOMER ON CONNECTION.customer_id = CUSTOMER.customer_id
		WHERE used_messages > messages OR used_minutes > minutes OR used_internet > internet_h
	),
	debts(name, tariff_id, debt) as (
		SELECT dbt.name, dbt.tariff_id, (sum(min_debt) + sum(msg_debt) + sum(int_debt))
			FROM dbt
			GROUP BY name, tariff_id
			HAVING min_debt > 0 