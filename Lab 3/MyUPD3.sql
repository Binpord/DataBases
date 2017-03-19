--Updating tables when customer wants to change his tariff

BEGIN TRAN

SELECT TARIFF.name
	FROM TARIFF JOIN CONNECTION ON TARIFF.tariff_id = CONNECTION.tariff_id
	WHERE phone_number = 9168581111;

UPDATE CONNECTION
SET --bill the customer for (used_minutes - TARIFF.minutes) * TARIFF.minute_price
	used_minutes = 0,
	--bill the customer for (used_messages - TARIFF.messages) * TARIFF.minute_price
	used_messages = 0,
	--bill the customer for (used_internet - TARIFF.internet_h) * TARIFF.internet_price
	used_internet = 0,
	tariff_id = dbo.trfid_from_name('Все за 300')
	WHERE phone_number = 9168581111;

SELECT TARIFF.name
	FROM TARIFF JOIN CONNECTION ON TARIFF.tariff_id = CONNECTION.tariff_id
	WHERE phone_number = 9168581111;

ROLLBACK;