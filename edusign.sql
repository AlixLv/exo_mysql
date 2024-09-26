CREATE TABLE users
(
    user_id INT PRIMARY KEY NOT NULL,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(255)
)


CREATE TABLE edusign
(
    user_id INT PRIMARY KEY NOT NULL,
)

ALTER TABLE edusign ADD COLUMN user_ID INT NOT NULL;
ALTER TABLE edusign ADD COLUMN date_signature DATETIME; 

INSERT INTO users (user_id, nom, prenom, email) VALUES ('1', 'Ada', 'Lovelace', 'ada@test.fr');
INSERT INTO users (user_id, nom, prenom, email) VALUES ('2', 'Beatrice', 'Worsley', 'bea@test.fr');
INSERT INTO users (user_id, nom, prenom, email) VALUES ('3', 'Bella', 'Guerin', 'bella@test.fr');
INSERT INTO users (user_id, nom, prenom, email) VALUES ('4', 'Barbara', 'Chase', 'barbara@test.fr');

-- renommer une colonne
ALTER TABLE users
RENAME COLUMN prenom to name;

-- NIVEAU FACILE
-- Sélectionner toutes les lignes de la table users
SELECT * FROM users;
-- Sélectionner uniquement la ligne où le prénom est Ada dans la table users
SELECT user_id, firstname, name, email FROM users WHERE firstname = 'Ada';
-- Sélectionner les lignes dont la première lettre du prénom est un B dans la table users
SELECT user_id, firstname, name, email FROM users WHERE SUBSTRING(firstname, 1, 1) = 'B';
-- Compter le nombre de ligne qu’il y a dans la table users
SELECT COUNT(*) FROM users;
-- Compter le nombre de ligne dont la première lettre du prénom est un B dans la table users
SELECT COUNT(*) FROM users WHERE SUBSTRING(firstname, 1, 1) = 'B';
-- Afficher uniquement la colonne contenant le prénom de la table users. 
SELECT firstname FROM users;

-- NIVEAU MOYEN
-- Insérer une ligne dans la table edusign qui correspond à la user Ada avec comme date de signature le 2024-05-30 09:30:00
INSERT INTO edusign (user_id, date_signature) VALUES ('1', '2024-05-30 09:30:00');
-- Insérer une ligne dans la table edusign qui correspond à la user Bella avec comme date de signature le 2024-05-30 09:30:00
INSERT INTO edusign (user_id, date_signature) VALUES ('3', '2024-05-30 09:30:00');
-- Insérer toutes les lignes de la table users dans la table edusign avec pour date de signature le 2024-09-01 09:30:00
INSERT INTO edusign (user_id, date_signature) VALUES ('1', '2024-09-01 09:30:00'),
('4', '2024-09-01 09:30:00'), ('2', '2024-09-01 09:30:00'), ('3', '2024-09-01 09:30:00');
-- autre façon possible
INSERT INTO edusign (user_id, date_signature)
SELECT user_id, '2024-09-01 09:30:00'
FROM users
-- Sélectionner toutes les lignes de la table edusign ordonnées par date de signature de la plus récente à la plus ancienne et par user_id ascendant
SELECT * FROM edusign ORDER BY user_id; 
SELECT * FROM edusign ORDER BY date_signature, user_id; 

-- BONUS
-- Dans la table edusign, afficher le nombre d’apprenantes par date.
SELECT date_signature, COUNT(user_ID) AS result FROM edusign GROUP BY date_signature;
-- Compter le nombre de ligne au sein de la table edusign dont le prénom est Bella, le nom de la colonne finale doit être volume
-- ajout d'une colonne volume dans edusign
ALTER TABLE edusign ADD COLUMN volume INT; 
-- comptage du nombre de fois qu'apparaît l'ID de Bella
SELECT user_ID,  COUNT(user_ID) AS result FROM edusign WHERE user_ID = '1';

-- comptage du nombre de fois qu'apparaît l'id de Bella en faisant une jointure avec la table users.
SELECT user_id,  COUNT(user_id) AS volume FROM edusign INNER JOIN users ON edusign.user_id = users.id WHERE firstname = 'Bella';





