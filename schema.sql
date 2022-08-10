CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100),
  age INT
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  species_name VARCHAR(100)
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100), 
    date_of_birth DATE, 
    escape_attemps INT, 
    neutered BOOLEAN, 
    weight_kg DECIMAL,
    species_id INT REFERENCES species(id),
    owner_id INT REFERENCES owners(id)
);


