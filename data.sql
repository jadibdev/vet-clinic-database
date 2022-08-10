insert into animals (name, date_of_birth, weight_kg, neutered, escape_attemps) values('Agumon', '2020-02-03', 10.23, True, 0);
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attemps) values('Gabumon', '2018-11-15', 8, True,2);
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attemps) values('Pikachu', '2021-01-07', 15.04, False,1);
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attemps) values('Devimon', '2017-05-12', 11, True,5);
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attemps) values('Charmanders', '2020-02-20', 11, False,0);
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attemps) values('Plantmon', '2021-11-15', 5.7, True,2);
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attemps) values('Squirtle', '1993-04-15',12.13, False,3);
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attemps) values('Angemon', '2005-12-06',45, True,1);
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attemps) values('Borman', '2005-06-07',20.4, True,7);
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attemps) values('Blossom', '1998-10-13','17', True,3);
insert into animals (name, date_of_birth, weight_kg, neutered, escape_attemps) values('Ditto', '2022-05-14','22', True,4);


insert into owners(full_name, age) values('Sam Smith', 34);
insert into owners(full_name, age) values('Jennifer Orwell', 19);
insert into owners(full_name, age) values('Bob', 45);
insert into owners(full_name, age) values('Melody Pond', 77);
insert into owners(full_name, age) values('Dean Winchester', 14);
insert into owners(full_name, age) values('Jodie Whittaker', 38);

insert into species(species_name) values('Pokemon');
insert into species(species_name) values('Digimon');


UPDATE animals
SET species_id = 2 WHERE name like '%mon';

UPDATE animals
SET species_id = 1 WHERE name not like '%mon';

UPDATE animals
SET owner_id = 1 WHERE id = 19;

UPDATE animals
SET owner_id = 2 WHERE id = 20;

UPDATE animals
SET owner_id = 2 WHERE id = 21;

UPDATE animals 
SET owner_id = 3 WHERE id = 22;

UPDATE animals 
SET owner_id = 3 WHERE id = 24;

UPDATE animals 
SET owner_id = 4 WHERE id = 23;

UPDATE animals 
SET owner_id = 4 WHERE id = 25;

UPDATE animals 
SET owner_id = 5 WHERE id = 26;

UPDATE animals 
SET owner_id = 5 WHERE id = 27;

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