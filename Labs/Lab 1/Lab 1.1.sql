--Выбрать названия должностей, которые представлены в отделах г.Далласа (DALLAS)

select [function] as 'Должность' from
		((DEPARTMENT join LOCATION on DEPARTMENT.location_id = LOCATION.location_id) join 
			EMPLOYEE on DEPARTMENT.department_id = EMPLOYEE.department_id) join
				JOB on EMPLOYEE.job_id = JOB.job_id
		where regional_group = 'DALLAS' group by [function];