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


-- What animals belong to Melody Pond?
SELECT
  animals.name
FROM
  animals
  INNER JOIN owners ON animals.owner_id = owners.id
WHERE
  owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT
  animals.name
FROM
  animals
  INNER JOIN species ON animals.species_id = species.id
WHERE
  species.species_name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT
  owners.full_name,
  animals.name
FROM
  owners
  LEFT JOIN animals ON animals.owner_id = owners.id;

-- How many animals are there per species?
SELECT
  COUNT(*) AS "No of animals",
  species.species_name
FROM
  animals
  INNER JOIN species ON animals.species_id = species.id
GROUP BY
  species.species_name;

-- List all Digimon owned by Jennifer Orwell.
SELECT
  animals.id,
  animals.name,
  species.species_name,
  owners.full_name
FROM
  animals
  INNER JOIN species ON animals.species_id = species.id
  INNER JOIN owners ON animals.owner_id = owners.id
WHERE
  owners.full_name = 'Jennifer Orwell'
  AND species.species_name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT
  animals.id,
  animals.name,
  owners.full_name
FROM
  animals
  INNER JOIN owners ON animals.owner_id = owners.id
WHERE animals.escape_attemps = 0
AND owners.full_name = 'Dean Winchester';

-- Who owns the most animals?
SELECT
  owners.full_name,
  COUNT(*) AS "No of animals"
FROM
  owners
  LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY
  owners.full_name;



SELECT vets.name AS vet_name, animals.name AS animals_name, visits.date_of_visit AS date_of_visit FROM vets
JOIN visits
ON vets.id = visits.vet_id
JOIN animals
ON animals.id = visits.animal_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT vets.name AS vet_name, COUNT(DISTINCT visits.animal_id) AS number_of_animals FROM vets
JOIN visits
ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;

SELECT vets.name AS vet_name, species.species_name AS specialities FROM vets
LEFT JOIN specializations
ON vets.id = specializations.vet_id
LEFT JOIN species
ON specializations.species_id = species.id;


SELECT vets.name AS vet_name, animals.name AS animal_name, visits.date_of_visit AS date_of_visit FROM vets
JOIN visits
ON vets.id = visits.vet_id
JOIN animals
ON visits.animal_id = animals.id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name AS animal_name, COUNT(animals.id) AS number_of_visits FROM visits
JOIN animals
ON visits.animal_id = animals.id
GROUP BY animals.name
ORDER BY COUNT(animals.id) DESC
LIMIT 1;

SELECT vets.name AS vet_name, visits.date_of_visit AS date_of_visit FROM vets
JOIN visits
ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit
LIMIT 1;


SELECT animals.name AS "NAME",
animals.date_of_birth AS "BIRTHDATE",
animals.escape_attempts AS "ESCAPE ATTEMPTS",
animals.neutered AS "NEUTERED",
animals.weight_kg AS "WEIGHT",
species.species_name AS "TYPE",
vets.name AS "VET NAME",
vets.age AS "VET AGE",
vets.date_of_graduation AS "DATE OF GRAD",
visits.date_of_visit AS "DATE OF VISIT" FROM visits
JOIN animals
ON visits.animal_id = animals.id
JOIN species
ON animals.species_id = species.id
JOIN vets
ON visits.vet_id = vets.id
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT animals.name AS "ANIMAL NAME",
COUNT(visits.animal_id) AS "NUMBER OF VISITS",
vets.name AS "VET NAME",
specializations.species_id AS "SPECIALTIES" FROM visits
JOIN animals
ON animals.id = visits.animal_id
FULL JOIN specializations
ON visits.vet_id = specializations.vet_id
JOIN vets
ON visits.vet_id = vets.id
GROUP BY visits.animal_id, visits.vet_id, animals.name,
specializations.species_id, vets.name
ORDER BY COUNT(visits.animal_id) DESC
LIMIT 1;

SELECT species.species_name AS "SPECIES TYPE",
COUNT(visits.animal_id) AS "NUMBER OF VISITS",
vets.name AS "VET NAME" FROM visits
JOIN vets
ON visits.vet_id = vets.id
JOIN animals
ON visits.animal_id = animals.id
JOIN species
ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY vets.name, animals.species_id, species.species_name
ORDER BY animals.species_id DESC
LIMIT 1;