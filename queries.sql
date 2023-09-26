/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';   
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


                    -- DAY TWo --

-- Vet clinic database: query and update animals table (1)
BEGIN; -- Begin transaction
UPDATE animals SET species = 'unspecified'; -- Update the species to unspecified value
SELECT * FROM animals; --verify the the chnages
ROLLBACK;          --Rollback the transaction 
SELECT * FROM animals; --Verify that the species columns went back to the state before the transaction.
