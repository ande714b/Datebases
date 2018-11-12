use B_DB02_2018

insert into PET_Owner (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail) values
	    ('Downs', 'Marsha', '555 537 8765', 'Marsha.Downs@somewhere.com'),
		('James', 'Richard', '555 537 7654', 'Richard.James@somewhere.som'),
		('Frier', 'Liz', '555 537 6543', 'Liz.Frier@somewhere.com'),
		('Trent', 'Miles',null, 'Miles.Trent@somewhere.com')
go

insert into PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerPK) values 
	   ('King', 'Dog', 'Std. Poodle', '2011-02-21', 25.5, 1),
       ('Teddy', 'Cat', 'Cashmere', '2012-02-01', 10.5, 2),
       ('Fido', 'Dog', 'Std. Poodle', '2010-07-17', 28.5, 1),
       ('AJ', 'Dog', 'Collie Mix', '2011-05-05', 20.0, 3),
       ('Cedro', 'Cat', 'Unknown', '2009-06-06', 9.5, 2),
       ('Wooley', 'Cat', 'Unknown',null, 9.5, 2),      
	  ('Buster', 'Dog', 'Border Collie', '2008-12-11', 25.0, 4)
go
