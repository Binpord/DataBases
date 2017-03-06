--Selecting the most transmitting support inquiry

WITH NumOfTransmit(inquiry_id, num) AS (
	SELECT inquiry_id, COUNT(inquiry_id) FROM SUPPORT_STAFF
		GROUP BY inquiry_id
	)
SELECT inquiry_id, inquiry_date, close_date, comments
	FROM SUPPORT
	WHERE inquiry_id in 
		(SELECT inquiry_id FROM NumOfTransmit 
			WHERE num in (SELECT MAX(num) FROM NumOfTransmit));