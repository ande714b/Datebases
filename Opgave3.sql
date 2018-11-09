use B_DB02_2018

if OBJECT_ID('LINE_ITEM', 'U') is not null
drop table LINE_ITEM
go

if OBJECT_ID('INVOICE','U') is not null
drop table INVOICE
go

if OBJECT_ID('PRODUCT','U') is not null
drop table PRODUCT
go

create table INVOICE
(
	InvoiceNumber int not null,
	InvoiceDate date not null,
	SubTotal float not null,
	TaxPct float not null,
	Total float not null,
	constraint Invoice_PK primary key(InvoiceNumber)
)
go

create table PRODUCT
(
	ProductNumber int not null,
	ProductType varchar not null,
	ProductDescription varchar not null,
	UnitPrice float not null,
	constraint product_PK primary key(ProductNumber)
)
go

create table LINE_ITEM
(
	InvoiceNumber int not null,
	LineNumber int not null,
	ProductNumber int not null,
	Quantity int not null,
	UnitPrice float not null,
	Total float not null
	constraint Line_Item_PK primary key(InvoiceNumber,LineNumber)
	constraint Line_Item_FK foreign key(InvoiceNumber)
						references INVOICE (InvoiceNumber)
						on delete no action
						on update cascade,						
	constraint product_FK foreign key(ProductNumber)
						references PRODUCT(ProductNumber)
						on update cascade
						on delete no action
)
go

