SELECT * FROM animals
WHERE name LIKE '%mon';


SELECT name FROM animals
WHERE date_of_birth
BETWEEN '2016-01-01' AND '2019-12-31';


SELECT name FROM animals
WHERE neutered=TRUE AND escape_attempts < 3;


SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');


SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;


SELECT * FROM animals
WHERE neutered=TRUE;


SELECT * FROM animals
WHERE name NOT IN ('Gabumon');


SELECT * FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;


---------------------------------------------------------------------


BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals


ROLLBACK;
SELECT * FROM animals;


BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;


BEGIN;
DELETE FROM animals;
SELECT * FROM animals;


ROLLBACK;
SELECT * FROM animals;


BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT DELETED_BORN_AFTER_2022;
UPDATE animals
SET weight_kg = weight_kg * (-1);
ROLLBACK TO DELETED_BORN_AFTER_2022;
UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;


---------------------------------------------------------------------
SELECT COUNT(id) FROM animals;
-- 10 animals


SELECT COUNT(escape_attempts) FROM animals
WHERE escape_attempts = 0;
-- 2 animals


SELECT AVG(weight_kg) FROM animals;
-- 15.55kg


SELECT neutered, MAX(escape_attempts) as escape_attempts
FROM animals
GROUP BY neutered;


SELECT species, MAX(weight_kg) as maximum_weight, MIN(weight_kg) as minimum_weight
FROM animals
GROUP BY species;


SELECT species, AVG(escape_attempts) as escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
