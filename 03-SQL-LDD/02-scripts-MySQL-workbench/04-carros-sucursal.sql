-- Crear la base de datos
CREATE DATABASE RentaVehiculos;
USE RentaVehiculos;

-- Tabla Clients
CREATE TABLE Clients (
    idCliente INT NOT NULL,
    Ap_Paterno VARCHAR(50) NOT NULL,
    Ap_Materno VARCHAR(50) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    telefono BIGINT NOT NULL,
    curp VARCHAR(16) NOT NULL,
    calle VARCHAR(20) NOT NULL,
    num INT NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    PRIMARY KEY (idCliente)
);

-- Tabla Vehiculos
CREATE TABLE Vehiculos (
    NumVehiculo INT NOT NULL,
    Placa VARCHAR(8) NOT NULL,
    modelo VARCHAR(25) NOT NULL,
    afio DATE NOT NULL,
    Marca VARCHAR(20) NOT NULL,
    PRIMARY KEY (NumVehiculo)
);

-- Tabla Sucursal
CREATE TABLE Sucursal (
    idSucursal INT NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    direccion VARCHAR(25) NOT NULL,
    idVehiculo INT NOT NULL,
    PRIMARY KEY (idSucursal),
    FOREIGN KEY (idVehiculo) REFERENCES Vehiculos(NumVehiculo)
);

-- Tabla Renta
CREATE TABLE Renta (
    idRenta INT NOT NULL,
    idCliente INT NOT NULL,
    idVehiculo INT NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    PRIMARY KEY (idRenta),
    FOREIGN KEY (idCliente) REFERENCES Clients(idCliente),
    FOREIGN KEY (idVehiculo) REFERENCES Vehiculos(NumVehiculo)
);
