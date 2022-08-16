insert into animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attemps
  )
values('Agumon', '2020-02-03', 10.23, True, 0);
insert into animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attemps
  )
values('Gabumon', '2018-11-15', 8, True, 2);
insert into animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attemps
  )
values('Pikachu', '2021-01-07', 15.04, False, 1);
insert into animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attemps
  )
values('Devimon', '2017-05-12', 11, True, 5);
insert into animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attemps
  )
values('Charmanders', '2020-02-20', 11, False, 0);
insert into animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attemps
  )
values('Plantmon', '2021-11-15', 5.7, True, 2);
insert into animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attemps
  )
values('Squirtle', '1993-04-15', 12.13, False, 3);
insert into animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attemps
  )
values('Angemon', '2005-12-06', 45, True, 1);
insert into animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attemps
  )
values('Borman', '2005-06-07', 20.4, True, 7);
insert into animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attemps
  )
values('Blossom', '1998-10-13', '17', True, 3);
insert into animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attemps
  )
values('Ditto', '2022-05-14', '22', True, 4);
insert into owners(full_name, age)
values('Sam Smith', 34);
insert into owners(full_name, age)
values('Jennifer Orwell', 19);
insert into owners(full_name, age)
values('Bob', 45);
insert into owners(full_name, age)
values('Melody Pond', 77);
insert into owners(full_name, age)
values('Dean Winchester', 14);
insert into owners(full_name, age)
values('Jodie Whittaker', 38);
insert into species(species_name)
values('Pokemon');
insert into species(species_name)
values('Digimon');
UPDATE animals
SET species_id = 2
WHERE name like '%mon';
UPDATE animals
SET species_id = 1
WHERE name not like '%mon';
UPDATE animals
SET owner_id = 1
WHERE id = 19;
UPDATE animals
SET owner_id = 2
WHERE id = 20;
UPDATE animals
SET owner_id = 2
WHERE id = 21;
UPDATE animals
SET owner_id = 3
WHERE id = 22;
UPDATE animals
SET owner_id = 3
WHERE id = 24;
UPDATE animals
SET owner_id = 4
WHERE id = 23;
UPDATE animals
SET owner_id = 4
WHERE id = 25;
UPDATE animals
SET owner_id = 5
WHERE id = 26;
UPDATE animals
SET owner_id = 5
WHERE id = 27;
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, DATE '2000-04-23'),
  ('Maisy Smith', 26, DATE '2019-01-17'),
  ('Stephanie Mendez', 64, DATE '1981-05-04'),
  ('Jack Harkness', 38, DATE '2008-06-08');
INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1),
  (3, 2),
  (3, 1),
  (4, 2);
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (1, 1, DATE '2020-05-24'),
  (1, 3, DATE '2020-07-22'),
  (2, 4, DATE '2021-02-02'),
  (3, 2, DATE '2020-01-05'),
  (3, 2, DATE '2020-03-08'),
  (3, 2, DATE '2020-05-14'),
  (4, 3, DATE '2021-05-04'),
  (5, 4, DATE '2021-02-24'),
  (6, 2, DATE '2019-12-21'),
  (6, 1, DATE '2020-08-10'),
  (6, 2, DATE '2021-04-07'),
  (7, 3, DATE '2019-09-29'),
  (8, 4, DATE '2020-10-03'),
  (8, 4, DATE '2020-11-04'),
  (9, 2, DATE '2019-01-24'),
  (9, 2, DATE '2019-05-15'),
  (9, 2, DATE '2020-02-27'),
  (9, 2, DATE '2020-08-03'),
  (10, 3, DATE '2020-05-24'),
  (10, 1, DATE '2021-01-11');
-- Add an email column to your owners table
ALTER TABLE owners
ADD COLUMN email VARCHAR(120);
INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT *
FROM (
    SELECT id
    FROM animals
  ) animal_ids,
  (
    SELECT id
    FROM vets
  ) vets_ids,
  generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email)
select 'Owner ' || generate_series(1, 2500000),
  'owner_' || generate_series(1, 2500000) || '@mail.com';