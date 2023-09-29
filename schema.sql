/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;
CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth date,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL 
 );


ALTER TABLE animals
ADD COLUMN species varchar(100);


CREATE TABLE owners (
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(100) NOT NULL,
age INT NOT NULL);

CREATE TABLE species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100));

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_animals_owner FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100) NOT NULL,
age INT NOT NULL,
date_of_graduation DATE);

CREATE TABLE specializations(
vets_id INT NOT NULL,
species_id INT NOT NULL,
PRIMARY KEY(vets_id, species_id),
CONSTRAINT fk_specializatino_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
CONSTRAINT fk_specialization_species FOREIGN KEY(species_id) REFERENCES species(id));

CREATE TABLE visits (
animal_id INT NOT NULL,
vet_id INT NOT NULL,
date_of_visitation DATE,
PRIMARY KEY (animal_id, vet_id, date_of_visitation),
CONSTRAINT fk_visit_animal FOREIGN KEY(animal_id) REFERENCES animals(id),
CONSTRAINT fk_visit_vet FOREIGN KEY(vet_id) REFERENCES vets(id));
