USE CELLULAR;

DROP VIEW view_tariff;
GO
CREATE VIEW  view_tariff AS
	SELECT tariff_id, name, minutes, messages, internet_h FROM TARIFF;
GO

SELECT * FROM view_tariff;