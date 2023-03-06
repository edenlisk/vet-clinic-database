CREATE TABLE animals (
id BIGSERIAL NOT NULL,
name VARCHAR(50),
date_of_birth DATE,
escape_attempts INT,
neutered BOOLEAN,
weight_kg DECIMAL
);

---------------------------------------------------------------------

ALTER TABLE animals
ADD species VARCHAR(50);


---------------------------------------------------------------------

-- Create owners table
CREATE TABLE owners (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
full_name VARCHAR(50),
age INT);


-- Create species table
CREATE TABLE species (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(50));

-- DROP SPECIES COLUMN FROM animals table
ALTER animals
DROP COLUMN species;


-- Create species_id column
ALTER TABLE animals
ADD species_id INT;

-- Create owners_id column
ALTER TABLE animals
ADD owners_id INT;

-- Add foreign key constraint on species_id referencing species table
ALTER TABLE animals
ADD CONSTRAINT species_fk
FOREIGN KEY(species_id)
REFERENCES species(id)
ON DELETE CASCADE;

-- Add foreign key constraint on owners_id referencing owners table
ALTER TABLE animals
ADD CONSTRAINT owners_fk
FOREIGN KEY(owners_id)
REFERENCES owners(id)
ON DELETE CASCADE;


--------------------------------------------------------------------------
-- CREATE VETS TABLE
CREATE TABLE vets (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(50),
age INT,
date_of_graduation DATE);


-- CREATE SPECIALIZATIONS TABLE
CREATE TABLE specializations (
species_id INT REFERENCES species (id),
vets_id INT REFERENCES vets (id));


-- CREATE VISITS TABLE
CREATE TABLE visits (
vets_id INT REFERENCES vets (id),
animals_id INT REFERENCES animals (id),
date_of_visit DATE);


--------------------------------------------------------------------------------

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- create index ON animals_id to decrease execution time
CREATE INDEX visitedAnimals_index ON visits (animals_id);

-- create index on vets_id to decrease execution time
CREATE INDEX animals_vets_index ON visits (vets_id);

-- create index on owners to decrease execution time
CREATE INDEX owners_id_index ON owners (email);