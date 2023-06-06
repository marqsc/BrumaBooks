-- -----------------------------------------------------
-- Schema BrumaBooks
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS BrumaBooks;
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

INSERT INTO Autor(idAutor, nome)
VALUES
	(100, 	  'Jorge Amado'),
	(default, 'João Ubaldo Ribeiro'),
	(default, 'Gregório de Matos'),
    (default, 'JK Rowling'), 
    (default, 'Machado de Assis'),
    (default, 'John Green'),
    (default, 'Nicholas Spark'),
    (default, 'Rubem Paiva'),
    (default, 'Alex Michaelis');

INSERT INTO Livro(titulo_original, titulo_principal, Pais_idPais, Genero_idGenero)
VALUES
    (NULL, 'Harry Potter and the Deathly Hallows', 1, 1),
    ('Harry Potter and the Deathly Hallows', 'Harry Potter e as Relíquias da Morte', 1, 1),
    ('Harry Potter and the Half-Blood Prince', 'Harry Potter e o Enigma do Príncipe', 1, 1),
    ('Harry Potter and the Order of the Phoenix', 'Harry Potter e a Ordem da Fênix', 1, 1),
    ('Harry Potter and the Goblet of Fire', 'Harry Potter e o Cálice de Fogo', 1, 1),
    ('Harry Potter and the Prisoner of Azkaban', 'Harry Potter e o Prisioneiro de Azkaban', 1, 1),
    ('Harry Potter and the Chamber of the Secrets', 'Harry Potter e a Câmara Secreta', 1, 1),
    (NULL, 'A Paciente Silenciosa', 4, 4),
    (NULL, 'Capitães de Areia', 2, 3),
    (NULL, 'Tieta do Agreste', 2, 3),
    (NULL, 'Tenda dos Milagres', 2, 3);

INSERT INTO Autoria(Livro_idLivro, Autor_idAutor)
VALUES
    (1, 103), 
    (2, 103),
    (3, 103),
    (4, 103), 
    (5, 103),
    (6, 103), 
    (8, 100);