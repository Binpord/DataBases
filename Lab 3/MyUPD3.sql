--Updating tables when customer wants to change his tariff

UPDATE CONNECTION
SET tariff_id = (SELECT tariff_id FROM TARIFF WHERE name = 'Все за 300'),
	--bill the customer for (used_minutes - TARIFF.minutes) * TARIFF.minute_price
	used_minutes = 0,
	--bill the customer for (used_messages - TARIFF.messages) * TARIFF.minute_price
	used_messages = 0,
	--bill the customer for (used_internet - TARIFF.internet_h) * TARIFF.internet_price
	used_internet = 0
	WHERE phone_number = 9168581111;