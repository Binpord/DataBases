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
insert into LOCATION (location_id, location)
	values(100, N'Москва');
insert into LOCATION (location_id, location)
	values(101, N'Санкт-Петербург');
insert into LOCATION (location_id, location)
	values(102, N'Екатеринбург');

--CUSTOMER
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments) 
	values(200, N'Егоров Егор', 102, N'улица, дом, квартира', 0000000000, 4000, N'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments) 
	values(201, N'Иванов Иван', 100, N'улица, дом, квартира', 1111111111, 1000, N'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(202, N'Петров Петр', 101, N'улица, дом, квартира', 2222222222, 2000, N'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(203, N'Артемов Артем', 102, N'улица, дом, квартира', 3333333333, 100, N'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(204, N'Павлов Павел', 100, N'улица, дом, квартира', 4444444444, 1300, N'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(205, N'Владиславов Владислав', 100, N'улица, дом, квартира', 5555555555, 27, N'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(206, N'Вадимов Вадим', 101, N'улица, дом, квартира', 6666666666, 1000, N'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(207, N'Евгеньев Евгений', 102, N'улица, дом, квартира', 7777777777, 46, N'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(208, N'Арсеньев Арсений', 101, N'улица, дом, квартира', 8888888888, 1200, N'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(209, N'Николаев Николай', 102, N'улица, дом, квартира', 9999999999, 1455, N'no comments');

--DEPARTMENT
insert into DEPARTMENT (department_id, name, location_id)
	values(300, N'Василек', 100);
insert into DEPARTMENT (department_id, name, location_id)
	values(301, N'Ромашка', 101);
insert into DEPARTMENT (department_id, name, location_id)
	values(302, N'Розочка', 102);

--JOB
insert into JOB (job_id, [function])
	values(400, N'менеджер');
insert into JOB (job_id, [function])
	values(401, N'телефонист');
insert into JOB (job_id, [function])
	values(402, N'директор');

--EMPLOYEE
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(500, N'Егоров', N'Владислав', '12/2/2009', null, 70000, 402, 300);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(501, N'Николаев', N'Арсений', '21/4/2007', 500, 50000, 400, 300);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(502, N'Арсеньев', N'Артем', '25/9/2013', 500, 40000, 401, 300);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(503, N'Павлов', N'Николай', '30/7/2006', null, 80000, 402, 301);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(504, N'Иванов', N'Петр', '27/9/2014', 503, 40000, 400, 301);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(505, N'Вадимов', N'Николай', '25/1/2015', 503, 55000, 401, 301);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(506, N'Павлов', N'Вадим', '18/2/2009', 503, 47000, 401, 301);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(507, N'Егоров', N'Иван', '5/3/2008', null, 75000, 400, 302);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(508, N'Петров', N'Вадим', '3/8/2014', 507, 50000, 401, 302);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(509, N'Игорев', N'Александр', '8/9/2015', 507, 46000, 402, 302);

--TARIFF
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(600, N'Все за 100', 300, 100, 200, 100, 1, 2, 10, N'no comments');
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(601, N'Все за 200', 600, 200, 400, 200, 1, 2, 10, N'no comments');
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(602, N'Все за 300', 900, 300, 600, 300, 1, 2, 10, N'no comments');
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(603, N'Ничего за 0', 0, 0, 0, 0, 2, 4, 20, N'no comments');
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(604, N'Ничего за 100', 0, 0, 0, 100, 1, 2, 10, N'no comments');
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(605, N'Гибрид', 100, 40, 100, 50, 2, 4, 20, N'no comments');

--CONNECTION: customer_id in range(200, 209), tariff_id in range(600, 605)
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(200, 601, 9168581111, 317, 35, 123, 3);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(200, 600, 9168581112, 199, 24, 144, 4);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(201, 602, 9168581113, 135, 233, 16, 1);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(202, 603, 9168581114, 500, 455, 345, 5);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(202, 604, 9168581115, 563, 214, 456, 3);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(202, 605, 9168581116, 532, 222, 123, 2);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(203, 602, 9168581117, 341, 146, 34, 1);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(204, 605, 9168581118, 342, 123, 341, 5);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(204, 602, 9168581119, 13, 13, 334, 3);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(205, 603, 9168581121, 15, 611, 442, 4);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(206, 601, 9168581122, 231, 341, 333, 1);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(207, 605, 9168581123, 463, 41, 42, 3);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(208, 602, 9168581124, 513, 434, 664, 4);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(209, 604, 9168581125,112, 232, 321, 2);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(206, 601, 9168581126, 453, 22, 333, 5);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(206, 600, 9168581127, 462, 616, 442, 2);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(206, 600, 9168581128, 65, 452, 776, 1);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(206, 601, 9168581129, 51, 521, 444, 3);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(206, 603, 9168581131, 553, 10, 2, 3);
insert into CONNECTION (customer_id, tariff_id, phone_number, used_minutes, used_messages, used_internet, rate)
	values(206, 604, 9168581132, 456, 55, 14, 5);

--SUPPORT: customer_id in range(200, 209)
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(700, 200, '21/3/2015 17:21:20', '23/5/2015 10:37:00', N'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(701, 201, '7/7/2015 12:23:13', '7/8/2015 15:53:30', N'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(702, 201, '19/8/2015 9:45:37', '21/8/2015 07:36:48', N'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(703, 204, '03/9/2015 7:29:32', null, N'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(704, 204, '7/9/2015 16:28:21', '7/12/2015 13:20:21', N'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(705, 204, '9/2/2016 19:11:12', '10/2/2016 10:29:21', N'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(706, 205, '14/2/2016 9:50:31', '14/2/2016 13:32:22', N'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(707, 207, '15/6/2016 13:00:08', '15/6/2016 17:07:56', N'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(708, 209, '16/6/2016 9:31:12', '16/6/2016 12:21:12', N'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(709, 202, '3/12/2016 23:02:15', '14/01/2017 16:36:32', N'no comments');

--SUPPORT_STAFF: inquiry_id in range(700, 709), employee_id in {501, 504, 507}
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(700, 501, '21/3/2015 17:21:20', null, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(701, 504, '7/7/2015 12:23:13', null, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(702, 507, '19/8/2015 9:45:37', null, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(703, 501, '03/9/2015 7:29:32', null, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(704, 504, '7/9/2015 16:28:21', null, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(705, 507, '9/2/2016 19:11:12', null, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(706, 501, '14/2/2016 9:50:31', null, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(707, 504, '15/6/2016 13:00:08', null, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(708, 507, '16/6/2016 9:31:12', null, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(709, 501, '3/12/2016 23:02:15', null, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(700, 504, '21/4/2015 14:12:44', 501, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(703, 504, '12/12/2015 10:44:40', 501, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(703, 504, '6/6/2016 15:37:26', 504, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(701, 507, '20/7/2015 9:46:33', 504, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(700, 507, '22/05/2015 14:37:45', 501, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(709, 507, '27/12/2016 14:36:37', 501, N'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(709, 504, '10/01/2017 10:16:06', 501, N'no comments');