UPDATE CONNECTION
	SET rate = 6
	WHERE customer_id
		IN (SELECT customer_id FROM CUSTOMER WHERE name = '������� �����')
		AND tariff_id
		IN (SELECT tariff_id FROM TARIFF WHERE name = '������ �� 0');