INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
('Agumon', '2020-02-03', 0, TRUE, 10.23),
('Gabumon', '2018-11-15',2, TRUE, 8),
('Pikachu', '2021-01-07', 1, FALSE, 15.04),
('Devimon', '2017-05-12', 5, TRUE, 11);

---------------------------------------------------------------------

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
('Charmander', '2020-02-08', 0, TRUE, -11),
('Plantmon', '2021-11-15', 2, FALSE, -5.7),
('Squirtle', '1993-04-02', 3, FALSE, -12.13),
('Angemon', '2005-06-12', 1, TRUE, -45),
('Boarmon', '2005-06-07', 7, TRUE, 20.4),
('Blossmon', '1998-10-13', 3, TRUE, 17),
('Ditto', '2022-05-14', 4, TRUE, 22);

---------------------------------------------------------------------
-- INSERT SAMPLE DATA INSIDE OWNERS TABLE.
INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- INSERT SAMPLE DATA INSIDE SPECIES TABLE.
INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');


UPDATE animals
SET species_id = 2
WHERE animals.name LIKE '%mon';


UPDATE animals
SET species_id = 1
WHERE animals.name NOT LIKE '%mon';
SELECT * FROM animals;

-- updating animals with corresponding owners
UPDATE animals
SET owners_id= 1 WHERE name ='Agumon';
UPDATE animals
SET owners_id= 2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals
SET owners_id= 3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals
SET owners_id= 4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals
SET owners_id= 5 WHERE name IN ('Angemon','Boarmon');
SELECT * FROM animals;
