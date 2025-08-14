CREATE DATABASE sqllmdbd;

USE sqllmdbd;

CREATE TABLE Clientes (
    IdCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Genero CHAR(1),
    Correo VARCHAR(100) UNIQUE,
    FechaRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHECK (Genero IN ('M', 'F')))
    CHARACTER SET utf8mb4;

#Insertar registros
INSERT INTO Clientes (Nombre, FechaNacimiento, Genero, Correo, FechaRegistro)
VALUES ('Ana Torres', '1995-07-22', 'F', 'ana@example.com', DEFAULT);

INSERT INTO Clientes (Nombre, FechaNacimiento, Genero, Correo, FechaRegistro)
VALUES ('Ana Torres2', '1995-07-23', 'F', 'ana2@example.com', '2023-01-01');

INSERT INTO Clientes (Nombre, FechaNacimiento, Genero, Correo)
VALUES ('Juan Pérez', '1990-05-15', 'M', 'juan@example.com');

INSERT INTO Clientes (Nombre, FechaNacimiento, Genero)
VALUES ('María López', '2000-08-10', 'F');

INSERT INTO Clientes (Nombre, FechaNacimiento, Genero, Correo)
VALUES 
('Carlos Méndez', '1988-11-03', 'M', 'carlos@example.com'),
('Lucía Romero', '1992-03-29', 'F', 'lucia@example.com'),
('Luis Cano', '2023-03-11', 'M', 'correo@ejemplo.com');

#Insertar con género válido y correo único
INSERT INTO Clientes (Nombre, FechaNacimiento, Genero, Correo)
VALUES ('Luis Cano', '1991-12-30', 'M', 'frt@correo.com');

#Actualizaciones
UPDATE Clientes  
SET Nombre = 'Juan Pablo Perez'
WHERE IdCliente = 3;

UPDATE Clientes
SET Nombre = 'Ana Laura Torres',  
    Correo = 'ana.lauratorres@example.com'
WHERE Nombre = 'Ana Torres';

UPDATE Clientes
SET Genero = 'M'
WHERE Genero = 'F' AND Nombre = 'Luis Cano';

#Eliminaciones
DELETE FROM Clientes
WHERE IdCliente = 1;

DELETE FROM Clientes
WHERE Correo IS NULL;

DELETE FROM Clientes
WHERE FechaNacimiento >= '1992-01-01';

DELETE FROM Clientes
WHERE YEAR(FechaNacimiento) >= 1992;

#Vaciar la tabla sin eliminarla
TRUNCATE TABLE Clientes;

#Nuevas inserciones
INSERT INTO Clientes (Nombre, FechaNacimiento, Genero, Correo, FechaRegistro)
VALUES ('Luis Gallardo', '1942-06-04', 'M', 'gallardo@correo.com', DEFAULT);

INSERT INTO Clientes (Nombre, FechaNacimiento, Genero)
VALUES ('Soyla Vaca', '1952-06-04', 'F');

#Consulta final
SELECT * FROM Clientes;

#Consulta por ID
SELECT * FROM Clientes
WHERE IdCliente = 1;


