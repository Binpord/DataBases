--Cleaning tables

delete from CONNECTION;
delete from CUSTOMER;
delete from DEPARTMENT;
delete from EMPLOYEE;
delete from JOB;
delete from LOCATION;
delete from SUPPORT;
delete from SUPPORT_STAFF;
delete from TARIFF;

--Filling tables

--LOCATION
-- Use sys.identity_columns to see if there was a last known identity value
-- for the Table. If there was one, the Table is not new and needs a reset
if exists (select * from sys.identity_columns where object_name(object_id) = 'LOCATION' and last_value is not null) 
    dbcc checkident (LOCATION, reseed, 99);
insert into LOCATION (location)
	values('������');
insert into LOCATION (location)
	values('�����-���������');
insert into LOCATION (location)
	values('������������');

--CUSTOMER
if exists (select * from sys.identity_columns where object_name(object_id) = 'CUSTOMER' and last_value is not null) 
    dbcc checkident (CUSTOMER, reseed, 199);
insert into CUSTOMER (name, location_id, address, passport, credit, comments) 
	values('������ ����', 102, '�����, ���, ��������', 0000000000, 4000, 'no comments');
insert into CUSTOMER (name, location_id, address, passport, credit, comments) 
	values('������ ����', 100, '�����, ���, ��������', 1111111111, 1000, 'no comments');
insert into CUSTOMER (name, location_id, address, passport, credit, comments)
	values('������ ����', 101, '�����, ���, ��������', 2222222222, 2000, 'no comments');
insert into CUSTOMER (name, location_id, address, passport, credit, comments)
	values('������� �����', 102, '�����, ���, ��������', 3333333333, 100, 'no comments');
insert into CUSTOMER (name, location_id, address, passport, credit, comments)
	values('������ �����', 100, '�����, ���, ��������', 4444444444, 1300, 'no comments');
insert into CUSTOMER (name, location_id, address, passport, credit, comments)
	values('����������� ���������', 100, '�����, ���, ��������', 5555555555, 27, 'no comments');
insert into CUSTOMER (name, location_id, address, passport, credit, comments)
	values('������� �����', 101, '�����, ���, ��������', 6666666666, 1000, 'no comments');
insert into CUSTOMER (name, location_id, address, passport, credit, comments)
	values('�������� �������', 102, '�����, ���, ��������', 7777777777, 46, 'no comments');
insert into CUSTOMER (name, location_id, address, passport, credit, comments)
	values('�������� �������', 101, '�����, ���, ��������', 8888888888, 1200, 'no comments');
insert into CUSTOMER (name, location_id, address, passport, credit, comments)
	values('�������� �������', 102, '�����, ���, ��������', 9999999999, 1455, 'no comments');

--DEPARTMENT
if exists (select * from sys.identity_columns where object_name(object_id) = 'DEPARTMENT' and last_value is not null) 
    dbcc checkident (DEPARTMENT, reseed, 299);
insert into DEPARTMENT (name, location_id)
	values('�������', 100);
insert into DEPARTMENT (name, location_id)
	values('�������', 101);
insert into DEPARTMENT (name, location_id)
	values('�������', 102);

--JOB
if exists (select * from sys.identity_columns where object_name(object_id) = 'JOB' and last_value is not null) 
    dbcc checkident (JOB, reseed, 399);
insert into JOB ([function])
	values('��������');
insert into JOB ([function])
	values('����������');
insert into JOB ([function])
	values('��������');

--EMPLOYEE
if exists (select * from sys.identity_columns where object_name(object_id) = 'EMPLOYEE' and last_value is not null) 
    dbcc checkident (EMPLOYEE, reseed, 499);
insert into EMPLOYEE (last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values('������', '���������', '12/2/2009', null, 70000, 402, 300);
insert into EMPLOYEE (last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values('��������', '�������', '21/4/2007', 500, 50000, 400, 300);
insert into EMPLOYEE (last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values('��������', '�����', '25/9/2013', 500, 40000, 401, 300);
insert into EMPLOYEE (last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values('������', '�������', '30/7/2006', null, 80000, 402, 301);
insert into EMPLOYEE (last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values('������', '����', '27/9/2014', 503, 40000, 400, 301);
insert into EMPLOYEE (last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values('�������', '�������', '25/1/2015', 503, 55000, 401, 301);
insert into EMPLOYEE (last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values('������', '�����', '18/2/2009', 503, 47000, 401, 301);
insert into EMPLOYEE (last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values('������', '����', '5/3/2008', null, 75000, 400, 302);
insert into EMPLOYEE (last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values('������', '�����', '3/8/2014', 507, 50000, 401, 302);
insert into EMPLOYEE (last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values('������', '���������', '8/9/2015', 507, 46000, 402, 302);

--TARIFF
if exists (select * from sys.identity_columns where object_name(object_id) = 'TARIFF' and last_value is not null) 
    dbcc checkident (TARIFF, reseed, 599);
insert into TARIFF (name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, customers_rate, comments)
	values('��� �� 100', 300, 100, 200, 100, 1, 2, 10, 4, 'no comments');
insert into TARIFF (name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, customers_rate, comments)
	values('��� �� 200', 600, 200, 400, 200, 1, 2, 10, 5, 'no comments');
insert into TARIFF (name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, customers_rate, comments)
	values('��� �� 300', 900, 300, 600, 300, 1, 2, 10, 3, 'no comments');
insert into TARIFF (name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, customers_rate, comments)
	values('������ �� 0', 0, 0, 0, 0, 2, 4, 20, 2, 'no comments');
insert into TARIFF (name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, customers_rate, comments)
	values('������ �� 100', 0, 0, 0, 100, 1, 2, 10, 4, 'no comments');
insert into TARIFF (name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, customers_rate, comments)
	values('������', 100, 40, 100, 50, 2, 4, 20, 5, 'no comments');

--CONNECTION: customer_id in range(200, 209), tariff_id in range(600, 605)
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(200, 601, 9168581111, 317, 35, 123);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(200, 600, 9168581112, 199, 24, 144);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(201, 602, 9168581113, 135, 233, 16);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(202, 603, 9168581114, 500, 455, 345);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(202, 604, 9168581115, 563, 214, 456);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(202, 605, 9168581116, 532, 222, 123);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(203, 602, 9168581117, 341, 146, 34);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(204, 605, 9168581118, 342, 123, 341);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(204, 602, 9168581119, 13, 13, 334);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(205, 603, 9168581121, 15, 611, 442);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(206, 601, 9168581122, 231, 341, 333);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(207, 605, 9168581123, 463, 41, 42);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(208, 602, 9168581124, 513, 434, 664);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(209, 604, 9168581125,112, 232, 321);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(206, 601, 9168581126, 453, 22, 333);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(206, 600, 9168581127, 462, 616, 442);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(206, 600, 9168581128, 65, 452, 776);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(206, 601, 9168581129, 51, 521, 444);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(206, 603, 9168581131, 553, 10, 2);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet)
	values(206, 604, 9168581132, 456, 55, 14);

--SUPPORT: customer_id in range(200, 209)
if exists (select * from sys.identity_columns where object_name(object_id) = 'SUPPORT' and last_value is not null) 
    dbcc checkident (SUPPORT, reseed, 699);
insert into SUPPORT (customer_id, inquiry_date, close_date, comments)
	values(200, '21/3/2015 17:21:20', '23/5/2015 10:37:00', 'no comments');
insert into SUPPORT (customer_id, inquiry_date, close_date, comments)
	values(201, '7/7/2015 12:23:13', '7/8/2015 15:53:30', 'no comments');
insert into SUPPORT (customer_id, inquiry_date, close_date, comments)
	values(201, '19/8/2015 9:45:37', '21/8/2015 07:36:48', 'no comments');
insert into SUPPORT (customer_id, inquiry_date, close_date, comments)
	values(204, '03/9/2015 7:29:32', null, 'no comments');
insert into SUPPORT (customer_id, inquiry_date, close_date, comments)
	values(204, '7/9/2015 16:28:21', '7/12/2015 13:20:21', 'no comments');
insert into SUPPORT (customer_id, inquiry_date, close_date, comments)
	values(204, '9/2/2016 19:11:12', '10/2/2016 10:29:21', 'no comments');
insert into SUPPORT (customer_id, inquiry_date, close_date, comments)
	values(205, '14/2/2016 9:50:31', '14/2/2016 13:32:22', 'no comments');
insert into SUPPORT (customer_id, inquiry_date, close_date, comments)
	values(207, '15/6/2016 13:00:08', '15/6/2016 17:07:56', 'no comments');
insert into SUPPORT (customer_id, inquiry_date, close_date, comments)
	values(209, '16/6/2016 9:31:12', '16/6/2016 12:21:12', 'no comments');
insert into SUPPORT (customer_id, inquiry_date, close_date, comments)
	values(202, '3/12/2016 23:02:15', '14/01/2017 16:36:32', 'no comments');

--SUPPORT_STAFF: inquiry_id in range(700, 709), employee_id in {501, 504, 507}
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(700, 501, '21/3/2015 17:21:20', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(701, 504, '7/7/2015 12:23:13', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(702, 507, '19/8/2015 9:45:37', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(703, 501, '03/9/2015 7:29:32', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(704, 504, '7/9/2015 16:28:21', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(705, 507, '9/2/2016 19:11:12', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(706, 501, '14/2/2016 9:50:31', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(707, 504, '15/6/2016 13:00:08', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(708, 507, '16/6/2016 9:31:12', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(709, 501, '3/12/2016 23:02:15', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(700, 504, '21/4/2015 14:12:44', 501, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(703, 504, '12/12/2015 10:44:40', 501, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(703, 504, '6/6/2016 15:37:26', 504, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(701, 507, '20/7/2015 9:46:33', 504, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(700, 507, '22/05/2015 14:37:45', 501, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(709, 507, '27/12/2016 14:36:37', 501, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(709, 504, '10/01/2017 10:16:06', 501, 'no comments');