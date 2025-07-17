
CREATE DATABASE Biblioteca;
USE Biblioteca;


CREATE TABLE Lectores (
    numlector INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellidopaterno VARCHAR(30) NOT NULL,
    apellidomaterno VARCHAR(30) NOT NULL,
    nummembresia INT NOT NULL
);


CREATE TABLE Libros (
    numlibro INT NOT NULL PRIMARY KEY,
    numISBN INT NOT NULL,
    cantidad INT NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    autor VARCHAR(40) NOT NULL
);


CREATE TABLE Presta (
    numlector INT NOT NULL,
    numlibro INT NOT NULL,
    PRIMARY KEY (numlector, numlibro),
    FOREIGN KEY (numlector)
    REFERENCES Lectores(numlector),
    FOREIGN KEY (numlibro) 
    REFERENCES Libros(numlibro)
);
