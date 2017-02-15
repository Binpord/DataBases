--Выбрать информацию (код покупателя, код товара, даты заказов) о случаях, 
--	когда один и тот же покупатель заказывал один и тот же товар с интервалом менее недели.

--Using with as we need 2 exact same tables
with tmp_table(customer_id, product_id, order_date, order_id) as
	(select customer_id, product_id, order_date, SALES_ORDER.order_id
			from SALES_ORDER join ITEM on SALES_ORDER.order_id = ITEM.order_id)

select distinct t1.customer_id, t1.product_id, t1.order_date
	from 
		tmp_table t1 join tmp_table t2
			on t1.customer_id = t2.customer_id and t1.product_id = t2.product_id
		--Joinig them so that corteges contain two orders from one customer and aimed on one
		--	product. Then choosing only different purchases with datediff less then week.
	where t1.order_id != t2.order_id and abs( datediff(d, t1.order_date, t2.order_date)) < 7