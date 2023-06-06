# Questão 1

-- -----------------------------------------------------
-- Schema BrumaBooks
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS BrumaBooks;
USE BrumaBooks;

-- -----------------------------------------------------
-- Tabela BrumaBooks.Autor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Autor (
    idAutor     INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(45) NOT NULL
);

-- -----------------------------------------------------
-- Tabela BrumaBooks.Genero
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Genero (
    idGenero    INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(45) NOT NULL
);

-- -----------------------------------------------------
-- Tabela BrumaBooks.Editora
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Editora (
    idEditora       INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_fantasia   VARCHAR(45) NOT NULL
);

-- -----------------------------------------------------
-- Tabela BrumaBooks.Pais
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pais (
    idPais      INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(45) NOT NULL
);
    
-- -----------------------------------------------------
-- Tabela BrumaBooks.Livro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Livro (
    idLivro             INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo_original     VARCHAR(45) NULL,
    titulo_principal    VARCHAR(45) NOT NULL,
    Genero_idGenero     INT NOT NULL,
    Pais_idPais         INT NOT NULL,  
    FOREIGN KEY (Genero_idGenero) REFERENCES Genero(idGenero), 
    FOREIGN KEY (Pais_idPais) REFERENCES Pais(idPais)  
);

-- -----------------------------------------------------
-- Tabela BrumaBooks.Endereco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Endereco (
    idEndereco          INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    logradouro          VARCHAR(45) NOT NULL,
    numero              VARCHAR(5)  NOT NULL,
    bairro              VARCHAR(45) NOT NULL,
    complemento         VARCHAR(45) NULL,
    cidade              VARCHAR(45) NOT NULL,
    estado              VARCHAR(45) NOT NULL,
    Editora_idEditora   INT         NOT NULL,  
    FOREIGN KEY (Editora_idEditora) REFERENCES Editora (idEditora)
);

-- -----------------------------------------------------
-- Tabela BrumaBooks.Edicao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Edicao (
    Livro_idLivro       INT         NOT NULL,
    Editora_idEditora   INT         NOT NULL,
    numero              TINYINT     NOT NULL,
    ano_lancamento      YEAR        NOT NULL,
    isbn                VARCHAR(13) NOT NULL,
    preco               FLOAT       NOT NULL,
    FOREIGN KEY (Livro_idLivro) REFERENCES Livro (idLivro),    
    FOREIGN KEY (Editora_idEditora) REFERENCES Editora (idEditora)
);

-- -----------------------------------------------------
-- Tabela BrumaBooks.Autoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Autoria (
    Autor_idAutor   INT NOT NULL,
    Livro_idLivro   INT NOT NULL,
    FOREIGN KEY (Autor_idAutor) REFERENCES Autor (idAutor),    
    FOREIGN KEY (Livro_idLivro) REFERENCES Livro (idLivro)
);

# Questão 2

INSERT INTO Pais
VALUES
    (default, 'Reino Unido'), 
    (default, 'Brasil'), 
    (default, 'Portugal'), 
    (default, 'Estados Unidos'),
    (default, 'Canadá');

INSERT INTO Genero
VALUES
    (default, 'Fantasia'), 
    (default, 'Romance'), 
    (default, 'Literatura Brasileira'), 
    (default, 'Ficção');

INSERT INTO Autor(nome)
VALUES
    ('JK Rowling'), 
    ('Machado de Assis'),
    ('John Green'),
    ('Nicholas Spark'),
    ('Jorge Odiado'),
    ('Alex Michaelis');

INSERT INTO Livro(titulo_original, titulo_principal, Pais_idPais, Genero_idGenero)
VALUES 
    (NULL, 'Harry Potter and the Deathly Hallows', 1, 1),
    ('Harry Potter e as Relíquias da Morte', 'Harry Potter and the Deathly Hallows', 1, 1),
    (NULL, 'A Paciente Silenciosa', 4, 4),
    (NULL, 'Capitães de Areia', 2, 3);

INSERT INTO Autoria
VALUES
    (1, 1), 
    (2, 1);


# Questão 3

SELECT * FROM Pais;
SELECT * FROM Genero;
SELECT * FROM Autor;
SELECT * FROM Livro;
SELECT * FROM Autoria;


## JOINS

-- Junção das tabelas Livro + Pais e Livro + Genero (relacionamentos 1:N)
-- Mostrando o gênero e o país de um livro cadastrado no banco.
SELECT 
	l.titulo_principal, 
    l.titulo_original, 
    p.nome AS 'Pais', 
    g.nome AS 'Genero_Literario'
FROM Livro l
INNER JOIN Pais p
ON l.Pais_idPais = p.idPais
INNER JOIN Genero g
ON l.Genero_idGenero = g.idGenero;

-- Junção das tabelas Autor + Autoria + Livro (relacionamento N:M)
-- Mostrando os autores de um livro.
SELECT
	l.titulo_principal AS 'Livro_Titulo',
    a.nome AS 'Autor_Nome',
    p.nome AS 'Pais'
FROM Livro l 
INNER JOIN Autoria au
ON l.idLivro = au.Livro_idLivro
INNER JOIN Autor a
ON a.idAutor = au.Autor_idAutor
INNER JOIN Pais p
ON p.idPais = l.Pais_idPais;











