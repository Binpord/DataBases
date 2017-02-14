--������� ���������� (��� ����������, ��� ������, ���� �������) � �������, 
--	����� ���� � ��� �� ���������� ��������� ���� � ��� �� ����� � ���������� ����� ������.

select distinct a.customer_id, a.product_id, a.order_date
	from 
		--Making 2 same tables
		(select customer_id, product_id, order_date, SALES_ORDER.order_id
			from SALES_ORDER, ITEM where SALES_ORDER.order_id = ITEM.order_id) a,
		(select customer_id, product_id, order_date, SALES_ORDER.order_id
			from SALES_ORDER, ITEM where SALES_ORDER.order_id = ITEM.order_id) b
		--Joinig them so that corteges contain two orders from one customer and aimed on one
		--	product. Then choosing only different purchases with datediff less then week.
	where a.customer_id = b.customer_id and a.product_id = b.product_id and 
		a.order_id != b.order_id and abs( datediff(d, a.order_date, b.order_date)) < 7