UPDATE CONNECTION
	SET rate = 6
	WHERE customer_id
		IN (SELECT customer_id FROM CUSTOMER WHERE name = 'Вадимов Вадим')
		AND tariff_id
		IN (SELECT tariff_id FROM TARIFF WHERE name = 'Ничего за 0');