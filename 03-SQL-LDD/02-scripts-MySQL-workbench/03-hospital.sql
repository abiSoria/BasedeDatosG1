-- Crear la base de datos
CREATE DATABASE Hospital;
USE Hospital;

-- Tabla Doctor
CREATE TABLE Doctor (
    IdDoctor INT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Ap_Paterno VARCHAR(45) NOT NULL,
    Ap_Materno VARCHAR(45) NOT NULL,
    area VARCHAR(45) NOT NULL,
    PRIMARY KEY (IdDoctor)
);

-- Tabla Paciente
CREATE TABLE Paciente (
    IdPaciente INT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Ap_Paterno VARCHAR(45) NOT NULL,
    Ap_Materno VARCHAR(45) NOT NULL,
    PRIMARY KEY (IdPaciente)
);

-- Tabla Atencion
CREATE TABLE Atencion (
    IdAtencion INT NOT NULL,
    IdDoctor INT NOT NULL,
    IdPaciente INT NOT NULL,
    Fecha DATE NOT NULL,
    Diagnostico VARCHAR(45),
    PRIMARY KEY (IdAtencion),
    FOREIGN KEY (IdDoctor) REFERENCES Doctor(IdDoctor),
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(IdPaciente)
);
