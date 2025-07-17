
CREATE DATABASE Biblioteca;
GO

USE Biblioteca;
GO

CREATE TABLE Lectores (
    numlector INT NOT NULL PRIMARY KEY,
    nombre NVARCHAR(30) NOT NULL,
    apellidopaterno NVARCHAR(30) NOT NULL,
    apellidomaterno NVARCHAR(30) NOT NULL,
    nummembresia INT NOT NULL
);
GO

CREATE TABLE Libros (
    numlibro INT NOT NULL PRIMARY KEY,
    numISBN INT NOT NULL,
    cantidad INT NOT NULL,
    titulo NVARCHAR(50) NOT NULL,
    autor NVARCHAR(40) 
);
GO


CREATE TABLE Presta (
    numlector INT NOT NULL,
    numlibro INT NOT NULL,
    CONSTRAINT pk_presta
	PRIMARY KEY (numlector, numlibro),
    CONSTRAINT fk_presta_lectores 
	FOREIGN KEY (numlector)
	REFERENCES Lectores(numlector),
    CONSTRAINT fk_presta_libros
	FOREIGN KEY (numlibro)
	REFERENCES Libros(numlibro)
);
GO
