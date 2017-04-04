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
	values(100, 'Москва');
insert into LOCATION (location_id, location)
	values(101, 'Санкт-Петербург');
insert into LOCATION (location_id, location)
	values(102, 'Екатеринбург');

--CUSTOMER
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments) 
	values(200, 'Егоров Егор', 102, 'улица, дом, квартира', 0000000000, 4000, 'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments) 
	values(201, 'Иванов Иван', 100, 'улица, дом, квартира', 1111111111, 1000, 'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(202, 'Петров Петр', 101, 'улица, дом, квартира', 2222222222, 2000, 'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(203, 'Артемов Артем', 102, 'улица, дом, квартира', 3333333333, 100, 'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(204, 'Павлов Павел', 100, 'улица, дом, квартира', 4444444444, 1300, 'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(205, 'Владиславов Владислав', 100, 'улица, дом, квартира', 5555555555, 27, 'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(206, 'Вадимов Вадим', 101, 'улица, дом, квартира', 6666666666, 1000, 'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(207, 'Евгеньев Евгений', 102, 'улица, дом, квартира', 7777777777, 46, 'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(208, 'Арсеньев Арсений', 101, 'улица, дом, квартира', 8888888888, 1200, 'no comments');
insert into CUSTOMER (customer_id, name, location_id, address, passport, credit, comments)
	values(209, 'Николаев Николай', 102, 'улица, дом, квартира', 9999999999, 1455, 'no comments');

--DEPARTMENT
insert into DEPARTMENT (department_id, name, location_id)
	values(300, 'Василек', 100);
insert into DEPARTMENT (department_id, name, location_id)
	values(301, 'Ромашка', 101);
insert into DEPARTMENT (department_id, name, location_id)
	values(302, 'Розочка', 102);

--JOB
insert into JOB (job_id, [function])
	values(400, 'менеджер');
insert into JOB (job_id, [function])
	values(401, 'телефонист');
insert into JOB (job_id, [function])
	values(402, 'директор');

--EMPLOYEE
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(500, 'Егоров', 'Владислав', '20090212', null, 70000, 402, 300);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(501, 'Николаев', 'Арсений', '20070421', 500, 50000, 400, 300);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(502, 'Арсеньев', 'Артем', '20130925', 500, 40000, 401, 300);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(503, 'Павлов', 'Николай', '20060730', null, 80000, 402, 301);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(504, 'Иванов', 'Петр', '20140927', 503, 40000, 400, 301);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(505, 'Вадимов', 'Николай', '20150125', 503, 55000, 401, 301);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(506, 'Павлов', 'Вадим', '20090218', 503, 47000, 401, 301);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(507, 'Егоров', 'Иван', '20080305', null, 75000, 400, 302);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(508, 'Петров', 'Вадим', '20140308', 507, 50000, 401, 302);
insert into EMPLOYEE (employee_id, last_name, first_name, hire_date, manager_id, salary, job_id, department_id)
	values(509, 'Игорев', 'Александр', '20150908', 507, 46000, 402, 302);

--TARIFF
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(600, 'Все за 100', 300, 100, 200, 100, 1, 2, 10, 'no comments');
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(601, 'Все за 200', 600, 200, 400, 200, 1, 2, 10, 'no comments');
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(602, 'Все за 300', 900, 300, 600, 300, 1, 2, 10, 'no comments');
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(603, 'Ничего за 0', 0, 0, 0, 0, 2, 4, 20, 'no comments');
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(604, 'Ничего за 100', 0, 0, 0, 100, 1, 2, 10, 'no comments');
insert into TARIFF (tariff_id, name, minutes, messages, internet_h, month_pay, minute_price, 
	message_price, internet_price, comments)
	values(605, 'Гибрид', 100, 40, 100, 50, 2, 4, 20, 'no comments');

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
	values(700, 200, '2015-03-21T17:21:20', '2015-05-23T10:37:00', 'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(701, 201, '2015-07-07T12:23:13', '2015-08-07T15:53:30', 'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(702, 201, '2015-08-19T09:45:37', '2015-08-21T07:36:48', 'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(703, 204, '2015-09-03T07:29:32', null, 'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(704, 204, '2015-09-07T16:28:21', '2015-12-07T13:20:21', 'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(705, 204, '2016-02-09T19:11:12', '2016-02-10T10:29:21', 'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(706, 205, '2016-02-14T09:50:31', '2016-02-14T13:32:22', 'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(707, 207, '2016-06-15T13:00:08', '2016-06-15T17:07:56', 'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(708, 209, '2016-06-16T09:31:12', '2016-06-16T12:21:12', 'no comments');
insert into SUPPORT (inquiry_id, customer_id, inquiry_date, close_date, comments)
	values(709, 202, '2016-12-03T23:02:15', '2017-01-14T16:36:32', 'no comments');

--SUPPORT_STAFF: inquiry_id in range(700, 709), employee_id in {501, 504, 507}
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(700, 501, '2015-03-21T17:21:20', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(701, 504, '2015-07-07T12:23:13', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(702, 507, '2015-08-19T09:45:37', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(703, 501, '2015-09-03T07:29:32', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(704, 504, '2015-09-07T16:28:21', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(705, 507, '2016-02-09T19:11:12', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(706, 501, '2016-02-14T09:50:31', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(707, 504, '2016-06-15T13:00:08', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(708, 507, '2016-06-16T09:31:12', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(709, 501, '2016-12-03T23:02:15', null, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(700, 504, '2015-04-21T14:12:44', 501, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(703, 504, '2015-12-12T10:44:40', 501, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(703, 504, '2016-06-06T15:37:26', 504, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(701, 507, '2015-07-20T09:46:33', 504, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(700, 507, '2015-05-22T14:37:45', 501, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(709, 507, '2016-12-27T14:36:37', 501, 'no comments');
insert into SUPPORT_STAFF (inquiry_id, manager_id, tsk_given, tsk_by, comments)
	values(709, 504, '2017-01-10T10:16:06', 501, 'no comments');