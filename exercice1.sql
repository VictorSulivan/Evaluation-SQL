Requete1:
--1--
SELECT * 
FROM film 
WHERE film.date_sortie>= '1960-01-01'

--2--
SELECT film.titre 
FROM film 
WHERE film.date_sortie< '1960-01-01'

Requete2:

UPDATE `film` 
SET `description`='Le film Dune le remake est mieux que la version original'
WHERE film.id=35; 

Requete3:

INSERT INTO `film` (`id`, `titre`, `slug`, `image`, `prix`, `description`, `date_sortie`) 
VALUES (NULL, 'Harry Potter ', 'harry-potter', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cinefil.com%2Ffilm%2Fharry-potter-a-l-ecole-des-sorciers&psig=AOvVaw06gu3vChLllzg2A4jYBjdF&ust=1667898967464000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCODfmv3dm_sCFQAAAAAdAAAAABAE', '11111', 'Un gamin miskin il a pas de chance zeubi', '2001-12-05');

INSERT INTO `films_categs` (`id_film`, `id_categorie`) 
VALUES ('43', '51'), ('43', '52'), ('43', '53');

Requete4:

SELECT * 

FROM commentaire 
INNER JOIN film 
ON commentaire.id_film=film.id 
INNER JOIN user 
ON commentaire.id_user=user.id 
WHERE film.id=43

Requete5:

DELETE 
FROM film 
WHERE slug Like('t%')

Requete6:

SELECT DISTINCT * 
FROM user 
INNER JOIN commentaire 
ON commentaire.id_user = user.id;


Requete7:

SELECT * 
FROM film 
INNER JOIN categorie 
WHERE categorie.id=51;

Requete8:

SELECT AVG(commentaire.note) 
FROM commentaire;

Requete9:

SELECT * 
FROM film 
WHERE film.date_sortie = ('%-06-%');

Requete10:

SELECT DISTINCT user.* 
FROM user 
INNER JOIN commentaire 
ON commentaire.id_user=user.id 
WHERE user.role=1