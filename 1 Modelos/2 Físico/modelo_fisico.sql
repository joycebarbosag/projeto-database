CREATE SCHEMA escolas_schema;

CREATE TABLE escolas_schema.estado (
id_estado INTEGER PRIMARY KEY,
nome_estado VARCHAR(50),
sigla_estado VARCHAR(2));

CREATE TABLE escolas_schema.diferenciamento(
id_diferenciamento integer PRIMARY KEY,
tipo_diferenciamento varchar(25));

CREATE TABLE escolas_schema.orgao(
id_orgao integer PRIMARY KEY,
nome_orgao varchar(30));

CREATE TABLE escolas_schema.espaco(
id_espaco serial PRIMARY KEY);

CREATE TABLE escolas_schema.biblioteca (
id_biblioteca SERIAL PRIMARY KEY,
quantidade_bibliotecarios INTEGER,
fk_id_espaco INTEGER, FOREIGN KEY (fk_id_espaco)
REFERENCES escolas_schema.espaco (id_espaco));

create table escolas_schema.tipos_salas (
id_tipo_sala SERIAL PRIMARY KEY,
nome_tipo_sala varchar(60));

CREATE TABLE escolas_schema.sala (
id_sala SERIAL PRIMARY KEY,
fk_id_tipo_sala INTEGER,
fk_id_espaco INTEGER,
FOREIGN KEY (fk_id_tipo_sala)
REFERENCES escolas_schema.tipos_sala(id_tipo_sala),
FOREIGN KEY (fk_id_espaco)
REFERENCES escolas_schema.espaco(id_espaco));

CREATE TABLE escolas_schema.tipo_escola (
id_tipo_escola SERIAL PRIMARY KEY,
nome_tipo_escola VARCHAR(50));

CREATE TABLE escolas_schema.tipo_localizacao (
id_tipo_localizacao SERIAL PRIMARY KEY,
tipo_localizacao VARCHAR(10));

CREATE TABLE escolas_schema.cidade (
id_cidade SERIAL PRIMARY KEY,
nome_cidade VARCHAR(50),
sigla_cidade VARCHAR(3),
fk_id_estado INTEGER,
FOREIGN KEY (fk_id_estado)
REFERENCES escolas_schema.estado(id_estado));

CREATE TABLE escolas_schema.escola (
id_escola SERIAL PRIMARY KEY,
nome_escola VARCHAR(50),
status_escola CHAR(1),
nivel_escola VARCHAR(50),
quantidade_alunos INTEGER,
fk_id_estado INTEGER,
fk_id_cidade INTEGER,
fk_id_tipo_escola INTEGER,
fk_id_orgao INTEGER,
fk_id_tipo_localizacao INTEGER,
fk_id_diferenciamento INTEGER,
fk_id_espaco INTEGER UNIQUE,
fk_id_escola_referenciada INTEGER,
FOREIGN KEY (fk_id_estado) REFERENCES escolas_schema.estado(id_estado),
FOREIGN KEY (fk_id_diferenciamento) REFERENCES
escolas_schema.diferenciamento(id_diferenciamento),
FOREIGN KEY (fk_id_orgao) REFERENCES escolas_schema.orgao (id_orgao),FOREIGN KEY (fk_id_cidade) REFERENCES escolas_schema.cidade(id_cidade),
FOREIGN KEY (fk_id_tipo_escola) REFERENCES
escolas_schema.tipo_escola(id_tipo_escola),
FOREIGN KEY (fk_id_tipo_localizacao) REFERENCES
escolas_schema.tipo_localizacao(id_tipo_localizacao),
FOREIGN KEY (fk_id_espaco) REFERENCES escolas_schema.espaco(id_espaco),
FOREIGN KEY (fk_id_escola_referenciada) REFERENCES
escolas_schema.escola(id_escola));