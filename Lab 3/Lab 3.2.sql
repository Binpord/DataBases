--Count amount of phone numbers per customer

SELECT name, COUNT(phone_number)
	FROM CUSTOMER JOIN CONNECTION ON CUSTOMER.customer_id = CONNECTION.customer_id
	group by name;