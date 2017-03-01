--Deleting DB
drop table CONNECTION;
drop table SUPPORT_STAFF;
drop table SUPPORT;
drop table EMPLOYEE;
drop table JOB;
drop table TARIFF;
drop table CUSTOMER;
drop table DEPARTMENT;
drop table LOCATION;

--Creating DB
set dateformat dmy

create table CONNECTION (
	customer_id smallint not null,
	tariff_id smallint not null,
	phone_number decimal(10, 0) unique,
	used_minutes smallint,
	used_messages smallint,
	used_internet smallint
);

create table CUSTOMER (
	customer_id smallint not null primary key identity(200, 1),
	[name] nvarchar(50),
	location_id smallint,
	[address] nvarchar(40),
	passport decimal(10, 0),
	credit smallmoney,
	comments nvarchar(500)
);

create table DEPARTMENT (
	department_id smallint not null primary key identity(300, 1),
	[name] nvarchar(15),
	location_id smallint
);

create table EMPLOYEE (
	employee_id smallint not null primary key identity(500, 1),
	last_name nvarchar(15),
	first_name nvarchar(15),
	hire_date date,
	manager_id smallint,
	salary smallmoney,
	job_id smallint,
	department_id smallint
);

create table JOB (
	job_id smallint not null primary key identity(400, 1),
	[function] nvarchar(30)
);

create table LOCATION (
	location_id smallint not null primary key identity(100, 1),
	[location] nvarchar(20)
);

create table SUPPORT (
	inquiry_id smallint not null primary key identity(700, 1),
	customer_id smallint,
	inquiry_date datetime,
	close_date datetime,
	comments nvarchar(500)
);

create table SUPPORT_STAFF (
	inquiry_id smallint not null,
	manager_id smallint not null,
	tsk_given datetime,
	tsk_by smallint,
	comments nvarchar(500)
);

create table TARIFF (
	tariff_id smallint not null primary key identity(600, 1),
	[name] nvarchar(50),
	[minutes] smallint,
	[messages] smallint,
	internet_h smallint,
	month_pay smallmoney,
	minute_price smallmoney,
	message_price smallmoney,
	internet_price smallmoney,
	customers_rate smallmoney,
	comments nvarchar(500)
);

--Adding foreign keys
alter table CONNECTION add
	foreign key (customer_id)
	references CUSTOMER (customer_id)
	on delete cascade
	on update cascade,
	foreign key (tariff_id)
	references TARIFF (tariff_id)
	on delete cascade
	on update cascade;

alter table DEPARTMENT add
	foreign key (location_id)
	references LOCATION (location_id)
	on delete cascade
	on update cascade;

alter table EMPLOYEE add
	foreign key (manager_id)
	references EMPLOYEE (employee_id)
	on delete no action
	on update no action,
	foreign key (job_id)
	references JOB (job_id)
	on delete cascade
	on update cascade,
	foreign key (department_id)
	references DEPARTMENT (department_id)
	on delete cascade
	on update cascade;

alter table SUPPORT add
	foreign key (customer_id)
	references CUSTOMER (customer_id)
	on delete cascade
	on update cascade;

alter table SUPPORT_STAFF add
	foreign key (inquiry_id)
	references SUPPORT (inquiry_id)
	on delete cascade
	on update cascade,
	foreign key (manager_id)
	references EMPLOYEE (employee_id)
	on delete cascade
	on update cascade,
	foreign key (tsk_by)
	references EMPLOYEE (employee_id)
	on delete no action
	on update no action;

alter table CUSTOMER add
	foreign key (location_id)
	references LOCATION (location_id)
	on delete no action
	on update no action;