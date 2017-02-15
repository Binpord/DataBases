--Выбрать информацию (код покупателя, код товара, даты заказов) о случаях, 
--	когда один и тот же покупатель заказывал один и тот же товар с интервалом менее недели.

select distinct a.customer_id, a.product_id, a.order_date
	from 
		--Making 2 exact same tables
		(select customer_id, product_id, order_date, SALES_ORDER.order_id
			from SALES_ORDER join ITEM on SALES_ORDER.order_id = ITEM.order_id) a
			join
		(select customer_id, product_id, order_date, SALES_ORDER.order_id
			from SALES_ORDER join ITEM on SALES_ORDER.order_id = ITEM.order_id) b
			on a.customer_id = b.customer_id and a.product_id = b.product_id
		--Joinig them so that corteges contain two orders from one customer and aimed on one
		--	product. Then choosing only different purchases with datediff less then week.
	where a.order_id != b.order_id and abs( datediff(d, a.order_date, b.order_date)) < 7