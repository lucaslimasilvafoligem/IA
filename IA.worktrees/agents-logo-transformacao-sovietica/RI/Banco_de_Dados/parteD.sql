--Parte D

--QUESTÃO 1:

SELECT to_tsvector('portuguese', 'pato');
/*
-------------
 'pat':1
(1 row)
*/

SELECT to_tsvector('portuguese', 'cafe');
/*
-------------
 'caf':1
(1 row)
*/

SELECT to_tsvector('english', 'red dead redemption');
/*      
------------------------------
 'dead':2 'red':1 'redempt':3
(1 row)
*/

SELECT to_tsvector('english', 'crazy men');
/*
-------------------
 'crazi':1 'men':2
(1 row)
*/

SELECT to_tsvector('portuguese', 'pão e circo para o povo');
/*
-------------------------
 'circ':3 'pov':6 'pã':1
(1 row)
*/

SELECT to_tsvector('portuguese', 'o boi foi para a fazenda, em itaipu');
/*    
-------------------------------
 'boi':2 'fazend':6 'itaipu':8
(1 row)
*/

SELECT to_tsvector('portuguese', 'elite é bala, pois Saci quem manda');
/*               
--------------------------------------------------
 'bal':3 'elit':1 'mand':7 'pois':4 'sac':5 'é':2
(1 row)
*/

SELECT to_tsvector('portuguese', 'elite e bala, pois Saci quem manda');
/*   
--------------------------------------------
 'bal':3 'elit':1 'mand':7 'pois':4 'sac':5
(1 row)
*/

SELECT to_tsvector('english', 'elite e bala, pois Saci quem manda');
/*                   
-------------------------------------------------------------
 'bala':3 'e':2 'elit':1 'manda':7 'poi':4 'quem':6 'saci':5
(1 row)
*/

SELECT to_tsvector('english', 'elite e bala, pois Saci quem manda');
/*                      
-------------------------------------------------------------
 'bala':3 'e':2 'elit':1 'manda':7 'poi':4 'quem':6 'saci':5
(1 row)
*/

--QUESTÃO 2:

SELECT title 
FROM best_films 
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'family & drama');
/*  
Resultado:
----------------------
 Belfast
 CODA
 The Power of the Dog
(3 rows)

Sim, todos possuem esse fragmento
*/

--QUESTÃO 3:
SELECT title 
FROM best_films 
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'family <-> drama');
/*
Resultado:
-------
 CODA
(1 row)
*/

--QUESTÃO 4:
SELECT to_tsvector('english', 'this is a family drama') @@ to_tsquery('english', 'drama & of & a & family');
/*
Resposta: true. Ele ignora as conjuções, portanto acaba por ser verdade. 
----------
 t
(1 row)
*/

--QUESTÃO 5:
SELECT title 
FROM best_films 
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'fame <-> about <-> fortunes');
/*  
--------------------
 Being the Ricardos
(1 row)

Resposta: Sim. Possui similaridade.

Resposta: Sim. Ele ignora as conjunções e foca nas palavras chave.
*/


--QUESTÃO 6:

--6.1:
SELECT title 
FROM best_films 
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'fame <1> about <1> fortunes');
/* 
--------------------
 Being the Ricardos
(1 row)
*/

--QUESTÃO 6.2:

SELECT title 
FROM best_films 
WHERE to_tsvector('english', description) @@ to_tsquery('english','villalobos <1> eugenio <3> auditioning');
/*
-------
 CODA
(1 row)
*/

--QUESTÃO 7:
SELECT phraseto_tsquery('english', 'normal <2> relationship');
-------------------------------------
/*
 'normal' <-> '2' <-> 'relationship'
(1 row)

Resposta: a função destrincha "normal <2> relationship" em componentes 'normal' <-> '2' <-> 'relationship'
*/


--Questão 8:

--QUESTÃO 8.1:
ALTER TABLE best_films 
ADD COLUMN description_ts tsvector 
GENERATED ALWAYS AS (to_tsvector('english', description)) STORED;

--QUESTÃO 8.2:
CREATE INDEX description_ts_idx 
ON best_films 
USING GIN (description_ts);

--QUESTÃO 8.3:
SELECT title
FROM best_films
WHERE description_ts @@ to_tsquery('english', 'drama');
/*        
----------------------
 Belfast
 CODA
 Being the Ricardos
 Drive My Car
 The Power of the Dog
(5 rows)
*/

--QUESTÃO 9:

SELECT title 
FROM best_films 
WHERE description_ts @@ to_tsquery('english', 'family & drama')
ORDER BY ts_rank(description_ts, to_tsquery('english', 'family & drama')) DESC;
/*
 CODA
 The Power of the Dog
 Belfast
(3 rows)
*/

SELECT title, ts_rank(description_ts, to_tsquery('english', 'family & drama')) AS rank_value 
FROM best_films 
WHERE description_ts @@ to_tsquery('english', 'family & drama')
ORDER BY rank_value DESC;
/*
        title         | rank_value 
----------------------+------------
 CODA                 | 0.09910413
 The Power of the Dog | 0.09524299
 Belfast              |      1e-16
(3 rows)

Resposta: Esta função avalia a relevância de um documento em relação à consulta especificada. O score é calculado com base na proximidade dos termos da consulta no documento e na frequência com que esses termos aparecem.
*/


