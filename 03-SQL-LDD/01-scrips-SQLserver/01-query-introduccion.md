```sql

-- Lenguaje SQL-LDD (create, alter, drop)

--Crear la Base de Datos empresa
CREATE DATABASE empresa;
GO 
-- Utilizar la base de datos creada
USE empresa;
GO
--crear la tabla empleados
CREATE TABLE Empleados( 
 IdEmpleado int not null, 
 Nombre varchar(100) not null,
 Puesto varchar(50) not null,
 FechaIngreso date,
 Salario money not null,
 CONSTRAINT pk_empleados
 PRIMARY KEY (IdEmpleado)
);
GO
CREATE TABLE Productos(
ProductoId int primary key,
NombreProducto nvarchar(50) not null,
Existencia int not null,
PrecioUnitario money not null,
);
GO

CREATE TABLE Productos2(
ProductoId int not null identity(1,1),
NombreProducto nvarchar(50) not null,
Existencia int not null,
Precio money not null,
CONSTRAINT pk_productos2
PRIMARY KEY(ProductoId ),
CONSTRAINT unique_nombreproducto
UNIQUE(NombreProducto),
CONSTRAINT chk_existencia
CHECK (Existencia>0 AND Existencia<=1000),
CONSTRAINT chk_precio
CHECK(Precio>0.0 )
);
GO

--insertar un producto en productos sin identity
INSERT INTO Productos(ProductoId,NombreProducto,Existencia,PrecioUnitario)
VALUES(1,'Burritos de Frijoles', 65, 20.99);
GO

INSERT INTO Productos(ProductoId,NombreProducto,Existencia,PrecioUnitario)
VALUES(2,'', 65, 20.99);
GO

SELECT * FROM Productos;
GO

--Insertar en la tabla productos2 con identity

INSERT INTO Productos2(NombreProducto,Existencia,Precio)
VALUES('Burritos de Chorizo Verde', 100, 21.0);
GO

INSERT INTO Productos2(NombreProducto,Existencia,Precio)
VALUES('Burritos de Chorizo Grueso', 450, 459.12);
GO

INSERT INTO Productos2(NombreProducto,Existencia,Precio)
VALUES('Burritos de Chorizo Grueso2', 450, 459.12);
GO

INSERT INTO Productos2(NombreProducto,Existencia,Precio)
VALUES('Burritos frijol', 999, 60);
GO

SELECT * FROM Productos2;
GO

--Crear dos tablas con razon de cardinalidad de 1-N con participacion total, esto quiere decir que la FK es not null
CREATE TABLE categoria(
 CategoriaId int not null identity(1,1),
 NombreCategoria nvarchar(20) not null,
 CONSTRAINT pk_categoria
 PRIMARY KEY(CategoriaId),
 CONSTRAINT unique_nombrecategoria
 UNIQUE(NombreCategoria)
);
GO

CREATE TABLE productos3(
 ProductoId int not null identity(1,1),
 NombreProducto nvarchar(20) not null,
 Existencia int not null,
 PrecioUnitario money not null,
 CategoriaId int not null,
 CONSTRAINT pk_productos3
 PRIMARY KEY(ProductoId),
 CONSTRAINT chk_existencia3
 CHECK(existencia >0 and Existencia <=1000),
 CONSTRAINT chk_precioUnitario
 CHECK(PrecioUnitario >0.0 ),
 CONSTRAINT unique_nombreProducto3
 UNIQUE(NombreProducto),
 CONSTRAINT fk_productos3_categoria
 FOREIGN KEY(CategoriaId)
 REFERENCES categoria(CategoriaId)
);
GO


CREATE TABLE categoria2(
 Id int not null identity(1,1),
 NombreCategoria2 nvarchar(20) not null,
 CONSTRAINT pk_categoria2
 PRIMARY KEY(Id),
 CONSTRAINT unique_nombrecategoria2
 UNIQUE(NombreCategoria2)
);
GO

CREATE TABLE productos4(
 ProductoId int not null identity(1,1),
 NombreProducto nvarchar(20) not null,
 Existencia int not null,
 PrecioUnitario money not null,
 CategoriaId int not null,
 CONSTRAINT pk_productos4
 PRIMARY KEY(ProductoId),
 CONSTRAINT chk_existencia4
 CHECK(existencia >0 and Existencia <=1000),
 CONSTRAINT chk_precioUnitario4
 CHECK(PrecioUnitario >0.0 ),
 CONSTRAINT unique_nombreProducto4
 UNIQUE(NombreProducto),
 CONSTRAINT fk_productos4_categoria2
 FOREIGN KEY(CategoriaId)
 REFERENCES categoria2(Id)
);
GO

CREATE TABLE tabla1(
tablaId int not null identity(1,1),
tablaId2 int not null,
nombre nvarchar(20) not null,
CONSTRAINT pk_tabla1
PRIMARY KEY(tablaId, tablaId2)

);
GO

CREATE TABLE tabla2(
tabla2Id int not null identity(1,1),
nombre nvarchar(20) not null,
tablaId INT,
tablaId2 INT,
CONSTRAINT pk_tabla2
PRIMARY KEY (tablaId2),
CONSTRAINT fk_tabla2_tabla1
FOREIGN KEY(tablaId, tablaId2)
REFERENCES tabla1(tablaId, tablaId2)
);
GO

--crear tablas con razon de cardinalidad de 1-1
CREATE TABLE employee(
id int not null identity(1,1),
nombre nvarchar(20)not null,
ap1 nvarchar(20)not null,
ap2 nvarchar(20)not null,
sexo char(1) not null,
salario money not null,
CONSTRAINT pk_employee
PRIMaRY KEY(id)
);
GO

CREATE TABLE deparment(
employeeid int not null identity(1,1),
nombre nvarchar(20)not null,
ubicacion nvarchar(30)not null,
employee int not null,
CONSTRAINT pk_deparment_employee
PRIMARY KEY(employeeid),
FOREIGN KEY (employeeid)
REFERENCES employee(id),
CONSTRAINT unique_employeeid
UNIQUE(employeeid)
);
GO





```