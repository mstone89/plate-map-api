-- Table Creation
CREATE TABLE plates (id SERIAL, name VARCHAR(50), samples INT, sc_reps INT, replicates INT, dilutions INT, cellcount INT);

-- Seed Lists
INSERT INTO plates (name, samples, sc_reps, replicates, dilutions, cellcount) VALUES ('Plate 1', 12, 3, 2, 3);
INSERT INTO plates (name, samples, sc_reps, replicates, dilutions, cellcount) VALUES ('Plate 2', 8, 3, 3, 3);
INSERT INTO plates (name, samples, sc_reps, replicates, dilutions, cellcount) VALUES ('Plate 3', 9, 3, 4, 2);
