--Updating customer's rate of his connection. Won't go as there is "check"
--for rate to be between 1 and 5

BEGIN TRAN

UPDATE CONNECTION
	SET rate = 6
	WHERE customer_id = dbo.cstrid_from_name('Вадимов Вадим')
		AND tariff_id = dbo.trfid_from_name('Ничего за 0')

ROLLBACK;