--Выбрать названия и города тех отделов, которым приходится вести дела с покупателями 
--	из Техаса (TX)

select MAX(DEPARTMENT.[name]) as 'Название отдела', [regional_group] as 'Город' from
	((CUSTOMER join EMPLOYEE on EMPLOYEE.employee_id = CUSTOMER.salesperson_id) join 
		DEPARTMENT on EMPLOYEE.department_id = DEPARTMENT.department_id) join
			LOCATION on LOCATION.location_id = DEPARTMENT.location_id
	where state = 'TX' group by DEPARTMENT.department_id, [regional_group];