--Customers from 1 special location agreed to switch to better tariff (with less debt)

BEGIN TRAN

WITH cstrs_on_loc(customer_id) AS (
		SELECT customer_id FROM CUSTOMER
			WHERE location_id in (SELECT location_id FROM LOCATION WHERE name = 'Москва')
	),
	min_better(customer_id, tariff_id) AS (
		SELECT customer_id, tariff_id 
			FROM cstrs_on_loc JOIN CONNECTION ON cstrs_on_loc.customer_id = CONNECTION.customer_id
				JOIN 
	),
	 
UPDATE CONNECTION
	SET --bill the customer for (used_minutes - TARIFF.minutes) * TARIFF.minute_price
	used_minutes = 0,
	--bill the customer for (used_messages - TARIFF.messages) * TARIFF.minute_price
	used_messages = 0,
	--bill the customer for (used_internet - TARIFF.internet_h) * TARIFF.internet_price
	used_internet = 0,
	tariff_id = 
	WHERE ;

ROLLBACK;