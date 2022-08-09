ALTER TABLE animals
ADD Species varchar(255);

BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name like '%mon'
COMMIT;

BEGIN;
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
COMMIT;

BEGIN;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK;

BEGIN;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;


select * from animals where name like '%mon';
select date_of_birth from animals where name ='Agumon' or name = 'Pikachu';
select * from animals where neutered = True;
select * from animals where not name = 'Gabumon';
select name, escape_attemps from animals where weight_kg >10.5;
select name from animals where neutered = True and escape_attemps < 3;
select * from animals where weight_kg between 10.4 and 17.3;
select name from animals where  extract(year from date_of_birth) between 2016 and 2019;

SELECT COUNT(name) FROM animals;
SELECT COUNT(escape_attemps) FROM animals
WHERE escape_attemps = 0;
SELECT AVG(weight_kg)
FROM animals;
SELECT neutered, SUM(escape_attemps) FROM animals 
GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg)  FROM animals 
GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN 'January 1, 1990' AND 'December 31, 2000'
GROUP BY species;
