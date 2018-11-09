USE B_DB02_2018

if OBJECT_ID('dbo.PET', 'U') is not null
drop table dbo.PET
go

if OBJECT_ID('dbo.PET_Owner','U') is not null
drop table dbo.PET_Owner
go


Create table PET_Owner
(	
	OwnerID			int				NOT NULL,
	OwnerLastName	varchar(50)		NOT NULL,
	OwnerFirstName	varchar(20)		NOT NULL,		
	OwnerPhone		char(20)		NULL,
	OwnerEmail		varchar(20)		NOT NULL,
	constraint		Owner_PK		primary key(OwnerID)
);
go

Create table PET
(
	PetID			int				NOT NULL,
	PetName			varchar(20)		NOT NULL,
	PetType			varchar(20)		NOT NULL,
	PetBreed		varchar(20)		NOT NULL default 'Unknown',
	PetDOB			date			NULL,
	PetWeight		float			NOT NULL,
	Owner_id		int				NOT NULL,
	constraint		PET_PK			primary key(PetID),
	constraint		PET_Owner_FK	foreign key(Owner_id)
								References PET_Owner(OwnerID)
									on delete no action
									on update cascade
);
go