use B_DB02_2018;
--Opgave 4
--3.24
SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerEmail LIKE '%somewhere.com'
--3.26
SELECT PetName, PetBreed
FROM PET
ORDER BY PetName
--3.29
SELECT COUNT(DISTINCT PetBreed) AS NumberOfBreeds
FROM PET
--3.31
SELECT MIN(PetWeight) as MinDogWeight,
       MAX(PetWeight) as MaxDogWeight,
       AVG(PetWeight) as AvgDogWeight
FROM PET
WHERE PetType = 'Dog'
--3.32
SELECT PetBreed, AVG(PetWeight) as AvgWeight
FROM PET
group BY PetBreed
--3.33
SELECT PetBreed, AVG(PetWeight) as AvgWeight
FROM PET
GROUP BY PetBreed
HAVING Count(*) > 1
--3.34
SELECT PetBreed, AVG(PetWeight) as AvgWeight
FROM PET
WHERE PetBreed != 'Unknown'
GROUP BY PetBreed
HAVING Count(*) > 1 

-- Opgave 6

--3.35
SELECT OwnerFirstName, OwnerLastName, OwnerEmail
FROM PET_OWNER
WHERE OwnerPK in (select OwnerPK from PET where PetType = 'Cat')

--3.36

SELECT OwnerFirstName, OwnerLastName, OwnerEmail
FROM PET_OWNER
WHERE OwnerPK in (select OwnerPK from PET where PetType = 'Cat' and PetName = 'Teddy')

--3.37

select OwnerLastName, OwnerFirstName, OwnerEmail
from PET_OWNER
where OwnerPK in (select OwnerPK from PET where PetBreed in (select BreedName from BREED where AverageLifeExpectancy > 15))

--3.38

Select distinct OwnerFirstName, OwnerLastName, OwnerEmail
FROM PET_OWNER join PET on PET_OWNER.OwnerPK = PET.OwnerPK
WHERE PetType = 'Cat'

--3.39

Select distinct OwnerFirstName, OwnerLastName, OwnerEmail
FROM PET_OWNER join PET on PET_OWNER.OwnerPK = PET.OwnerPK
WHERE PetType = 'Cat' and PetName = 'Teddy'

--3.40 

select OwnerLastName, OwnerFirstName, OwnerEmail
from PET_OWNER join PET on PET_OWNER.OwnerPK = PET.OwnerPK join BREED on PET.PetBreed = BREED.BreedName
where AverageLifeExpectancy > 15

--3.41

select OwnerLastName, OwnerFirstName, PetName, PetType, PetBreed, AverageLifeExpectancy
from PET_OWNER join PET on PET_OWNER.OwnerPK = PET.OwnerPK join BREED on PET.PetBreed = BREED.BreedName
where BreedName != 'Unknown'












