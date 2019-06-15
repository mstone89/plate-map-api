-- Table Creation
CREATE TABLE plates (id SERIAL, name VARCHAR(50), samples INT, replicates INT, dilutions INT);

-- Seed Lists
INSERT INTO plates (name, samples, replicates, dilutions) VALUES ('Plate 1', 12, 3, 2);
INSERT INTO plates (name, samples, replicates, dilutions) VALUES ('Plate 2', 10, 2, 4);
INSERT INTO plates (name, samples, replicates, dilutions) VALUES ('Plate 3', 8, 2, 5);
