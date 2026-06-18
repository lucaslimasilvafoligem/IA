/*
Dados texto:
    
    1 - Tinytext/255
    2 - Text/65.535
    3 - char /255 Fixo
    4 - varchar/65.535 variável

Dados Numéricos:

    1 - Float(p,e)
    2 - Double(p,e)
    3 - Decimal(p,e)
    4 - Inte|Integer

Dados Temporais:

    1 - Date AAAA-MM-DD
    2 - Datetime AAAA-MM-DD HH:MI:SS
    3 - Year AAAA
    4 - Time HH:MM:MI:SS
*/

/*CRIAR*/
/*Criar banco de dados*/
CREATE DATABASE testeL;

/*Criando tabela:*/
CREATE TABLE amigo(
	i_amigo_amigo SERIAL PRIMARY KEY NOT NULL, 
	s_nome_amigo VARCHAR(200) NOT NULL, 
	d_nasc_amigo DATE
);
/*VARCHAR aloca dinâmicamente até o X caractere, CHAR aloca de forma fixa os X caracteres*/

CREATE TABLE exemplo (
    data_exemplo DATE,
    hora_exemplo TIME,
    data_hora_exemplo TIMESTAMP,
    data_hora_fuso_exemplo TIMESTAMP WITH TIME ZONE,
    data_hora_sem_fuso_exemplo TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE contato (
    id_contato SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);


/*ALTERAR*/

ALTER TABLE amigo COLUMN
-- Alterar o tipo da coluna
ALTER TABLE amigo T EMPTY;
ALTER COLUMN s_nome_amigo TYPE VARCHAR(500);

-- Adicionar restrições NOT NULL e NOT EMPTY
ALTER TABLE amigo 
ALTER COLUMN s_nome_amigo SET NOT NULL,
ALTER COLUMN s_nome_amigo SET DEFAULT 'Mano',
ADD CONSTRAINT s_nome_amigo_not_empty CHECK (s_nome_amigo <> '');

ALTER TABLE amigo
ADD s_tipo_amigo VARCHAR(100)
DEFAULT 'Novo';

ALTER TABLE amigo
DROP COLUMN s_tipo_amigo;

ALTER TABLE contato
ADD COLUMN id_amig_contato

ALTER TABLE contato
ADD CONSTRAINT fk_amigo_contato FOREIGN KEY (id_amigo_contato) REFERENCES amigo (i_amigo_amigo);


/*APAGAR*/

DROP DATABASE testeL;

DROP TABLE testeL;

/*Insert Into*/
INSERT INTO <tabel> (colunas) VALUES (valores)