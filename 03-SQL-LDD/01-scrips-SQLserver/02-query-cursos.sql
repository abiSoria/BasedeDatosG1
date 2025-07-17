
CREATE DATABASE Cursos;
GO


USE Cursos;
GO


CREATE TABLE Estudiante (
    numestudiante INT NOT NULL PRIMARY KEY,
    matricula INT NOT NULL,
    nombre NVARCHAR(50) NOT NULL,
    apellidopaterno NVARCHAR(50) NOT NULL,
    apellidomaterno NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Curso (
    numcurso INT NOT NULL PRIMARY KEY,
    codigo INT NOT NULL,
    nombre NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Inscripcion (
    numestudiante INT NOT NULL,
    numcurso INT NOT NULL,
    fechaInscripcion DATE NOT NULL,
    CONSTRAINT pk_inscripcion
	PRIMARY KEY (numestudiante, numcurso),
    CONSTRAINT fk_inscripcion_estudiante
	FOREIGN KEY (numestudiante)
    REFERENCES Estudiante (numestudiante),
    CONSTRAINT fk_inscripcion_curso 
	FOREIGN KEY (numcurso)
        REFERENCES Curso (numcurso)
);
GO
