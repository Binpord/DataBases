--ќпределить количество покупателей, исчезнувших в 1990г, то есть тех, 
--	которые делали покупки до 1990 года и не делали позже.

select count(customers) as ' оличество исчезнувших людей' from
--Table of people, who didn't buy anything after 1990
((select CUSTOMER.customer_id as customers from
	(CUSTOMER join SALES_ORDER on CUSTOMER.customer_id = SALES_ORDER.customer_id)
	group by CUSTOMER.customer_id
except
select CUSTOMER.customer_id from 
	(CUSTOMER join SALES_ORDER on CUSTOMER.customer_id = SALES_ORDER.customer_id)
	where order_date >= '1990-01-01')
--Intersecting with table of people, who have bought something before 1990
intersect
select CUSTOMER.customer_id from 
	(CUSTOMER join SALES_ORDER on CUSTOMER.customer_id = SALES_ORDER.customer_id)
	where order_date < '1990-01-01') t1