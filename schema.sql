/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100), 
    date_of_birth DATE, 
    escape_attemps INT, 
    neutered BOOLEAN, 
    weight_kg DECIMAL,
    species VARCHAR(100)
    );
    
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
