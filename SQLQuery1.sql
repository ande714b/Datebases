USE B_DB02_2018

drop table if exists PET

drop table if exists PET_Owner

Create table PET_Owner
(	
	OwnerPK			int				identity NOT NULL,
	OwnerLastName	varchar(50)			NOT NULL,
	OwnerFirstName	varchar(50)			NOT NULL,		
	OwnerPhone		varchar(50)			,
	OwnerEmail		nvarchar(50)		NOT NULL,
	constraint		Owner_PK		primary key(OwnerPK)
);
go

Create table PET
(
	PetID			int				identity NOT NULL,
	PetName			varchar(50)			NOT NULL,
	PetType			varchar(50)			NOT NULL,
	PetBreed		varchar(50)			NOT NULL default 'Unknown',
	PetDOB			datetime2			NULL,
	PetWeight		float			check (PetWeight <= 250) NOT NULL,
	OwnerPK			int				NOT NULL,
	constraint		PET_PK			primary key(PetID),
	constraint		PET_Owner_FK	foreign key(OwnerPK)
								References PET_Owner(OwnerPK)
									on delete no action
									on update cascade
	
);
go