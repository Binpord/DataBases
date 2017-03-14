--произведение, пронумеровать без спец функций

declare @TestTable as table(A int)

insert into @TestTable(A) values (1), (3), (5), (0)

--select * from @TestTable

--произведение
select 
	case
		--if 0
		when exists (select A from @TestTable where A = 0)
			then count(A) - count(A)
		--if less then 0 
		when (cast((select count(A) from @TestTable where A < 0) as int) / 2) * 2 != 
				cast((select count(A) from @TestTable where A < 0) as int)
			then  (-1.0)*exp( sum( log(case when A<> 0 then ABS(A) end)))
		--if normal
		else exp( sum( log( ABS(case when A <> 0 then abs(A) end)))) 
		end 'Mul'
	from @TestTable

select t1.a, count(t2.A)
from @TestTable t1 
  inner join @TestTable t2 on t1.A >= t2.A
  group by t1.A 