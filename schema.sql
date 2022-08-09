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