CREATE DATABASE RentaVehiculos;
GO

USE RentaVehiculos;
GO

CREATE TABLE Clients (
    idCliente int not null,
    Ap_Paterno nvarchar(50) not null,
    Ap_Materno nvarchar(50) not null,
    nombre nvarchar(20) not null,
    telefono int not null,
    curp nvarchar(16) not null,
    calle nvarchar(20) not null,
    num int not null,
    ciudad nvarchar(20) not null,

    CONSTRAINT pk_Client
    PRIMARY KEY (idCliente)
);

CREATE TABLE Vehiculos (
    NumVehiculo int not null,
    Placa nvarchar(8) not null,
    modelo nvarchar(25) not null,
    afio date not null,
    Marca nvarchar(20) not null,

    CONSTRAINT pk_Vehiculo
    PRIMARY KEY (NumVehiculo)
);

CREATE TABLE Sucursal (
    idSucursal int not null,
    nombre nvarchar(25) not null,
    direccion nvarchar(25) not null,
    idVehiculo int not null,

    CONSTRAINT pk_Sucursal
    PRIMARY KEY (idSucursal),

    CONSTRAINT fk_Sucursal_Vehiculo
    FOREIGN KEY (idVehiculo)
    REFERENCES Vehiculos(NumVehiculo)
);

CREATE TABLE Renta (
    idRenta int not null,
    idCliente int not null,
    idVehiculo int not null,
    fechaInicio date not null,
    fechaFin date not null,

    CONSTRAINT pk_Renta
    PRIMARY KEY (idRenta),

    CONSTRAINT fk_Renta_Client
    FOREIGN KEY (idCliente)
    REFERENCES Clients(idCliente),

    CONSTRAINT fk_Renta_Vehiculo
    FOREIGN KEY (idVehiculo)
    REFERENCES Vehiculos(NumVehiculo)
);