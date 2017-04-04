--������� �������� � ������ ��� �������, ������� ���������� ����� ���� � ������������ 
--	�� ������ (TX)

select MAX(DEPARTMENT.[name]) as '�������� ������', [regional_group] as '�����' from
	((CUSTOMER join EMPLOYEE on EMPLOYEE.employee_id = CUSTOMER.salesperson_id) join 
		DEPARTMENT on EMPLOYEE.department_id = DEPARTMENT.department_id) join
			LOCATION on LOCATION.location_id = DEPARTMENT.location_id
	where state = 'TX' group by DEPARTMENT.department_id, [regional_group];