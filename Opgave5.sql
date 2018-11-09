use B_DB02_2018

if OBJECT_ID('SEMINAR_CUSTOMER','U') is not null
drop table SEMINAR_CUSTOMER
go

if OBJECT_ID('SEMINAR','U') is not null
drop table SEMINAR
go

if OBJECT_ID('CUSTOMER','U') is not null
drop table CUSTOMER
go

if OBJECT_ID('ZIP_CITY','U') is not null
drop table ZIP_CITY
go


create table SEMINAR
(
	SeminarID int not null,
	SeminarDate date not null,
	Location_Seminar varchar not null,
	SeminarTitle varchar not null,
	constraint SEMINAR_PK primary key(SeminarID)
)
go

create table ZIP_CITY
(
	Zip int not null,
	City varchar not null,
	constraint ZIP_CITY_PK primary key(Zip)
)
go

create table CUSTOMER
(
	CustomerID int not null,
	FirstName varchar not null,
	LastName varchar not null,
	Street varchar not null,
	Zip int not null,
	constraint CUSTOMER_PK primary key(CustomerID),
	constraint ZIP_CITY_FK foreign key(Zip)
						references ZIP_CITY (Zip)
						on update cascade
						on delete no action
)
go


create table SEMINAR_CUSTOMER
(
	SeminarID int not null,
	CustomerID int not null,
	constraint SEMINAR_CUSTOMER_PK primary key(SeminarId,CustomerID),
	constraint SEMINAR_FK foreign key(SeminarID)
						references SEMINAR (SeminarID)
						on update cascade
						on delete no action,
	constraint CUSTOMER_FK foreign key (CustomerID)
						references CUSTOMER (CustomerID)
						on update cascade
						on delete no action,				
)
			