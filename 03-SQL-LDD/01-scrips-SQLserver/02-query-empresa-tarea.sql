
--Crear la Base de Datos empresa
CREATE DATABASE empresaTarea;
GO 

-- Utilizar la base de datos creada
USE empresaTarea;
GO



-- Crear la tabla Categoria
CREATE TABLE Categoria (
    CategoriaId INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Cate VARCHAR(255)
);
GO

-- Crear la tabla Cliente
CREATE TABLE Cliente (
    ClienteId INT IDENTITY(1,1) PRIMARY KEY,
    NombreCliente VARCHAR(255),
    Direccion VARCHAR(255)
);
GO

-- Crear la tabla Cliente
CREATE TABLE Producto (
    ProductoId INT IDENTITY(1,1) PRIMARY KEY,
    NombreProd VARCHAR(255),
    Existencia INT,
    PrecioUnitario DECIMAL(10, 2),
    CategoriaId INT, 
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (CategoriaId) REFERENCES Categoria(CategoriaId)
);
GO

-- Crear la tabla Pedido
CREATE TABLE Pedido (
    PedidoId INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,
    ClienteId INT, 
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (ClienteId) REFERENCES Cliente(ClienteId)
);
GO

-- Crear la tabla DETALLEPEDIDO
CREATE TABLE DETALLEPEDIDO (
    DetallePedidoId INT IDENTITY(1,1) PRIMARY KEY, 
    PedidoId INT, 
    ProductoId INT, 
    PrecioVenta DECIMAL(10, 2),
    CantidadVendida INT,
    CONSTRAINT FK_DetallePedido_Pedido FOREIGN KEY (PedidoId) REFERENCES Pedido(PedidoId),
    CONSTRAINT FK_DetallePedido_Producto FOREIGN KEY (ProductoId) REFERENCES Producto(ProductoId)
);
GO

--------------------------------------------------------------------------------------------------------

CREATE TABLE Tabla1 (
Id INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(255)
 );
 GO

CREATE TABLE Tabla2 (
Id INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(255)
);
GO