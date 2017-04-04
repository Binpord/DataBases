--Selecting debts for each tarrif

with min_dbt(tariff_id, min_debt) as (
	--Minutes debts
	select TARIFF.tariff_id, ((used_minutes - minutes) * minute_price)
		from TARIFF join CONNECTION on TARIFF.tariff_id = CONNECTION.tariff_id
		where used_minutes > minutes
		),
	msg_dbt(tariff_id, msg_debt) as (
	--Messages debts
	select TARIFF.tariff_id, ((used_messages - messages) * message_price)
		from TARIFF join CONNECTION on TARIFF.tariff_id = CONNECTION.tariff_id
		where used_messages > messages
		),
	int_dbt(tariff_id, int_debt) as (
--Internet debts
select TARIFF.tariff_id, ((used_internet - internet_h) * internet_price)
	from TARIFF join CONNECTION on TARIFF.tariff_id = CONNECTION.tariff_id
	where used_internet > internet_h
	),
	debts(tariff_id, name, debt) as (
select TARIFF.tariff_id, TARIFF.name, (sum(min_debt) + sum(msg_debt) + sum(int_debt))
	from TARIFF join msg_dbt on TARIFF.tariff_id = msg_dbt.tariff_id
		join min_dbt on msg_dbt.tariff_id = min_dbt.tariff_id
		join int_dbt on int_dbt.tariff_id = min_dbt.tariff_id
	group by TARIFF.name, TARIFF.tariff_id
	)

	select name, debt from debts
	union
	select TARIFF.name, 0 from TARIFF
	where tariff_id not in (select tariff_id from debts);