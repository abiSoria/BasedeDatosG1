--Crear base de cdatos empresa patito
CREATE DATABASE empresapatito;
GO

--Usar la base de datos
USE empresapatito;
GO

--Crear una tabla empleados
CREATE TABLE empleados(
Idempleado INT not null,
Nombre VARCHAR (100) not null,
Puesto VARCHAR(50) null,
FechaIngreso DAte null,
Salario DECIMAL(10, 2) null,
CONSTRAINT pk_empleados
PRIMARY KEY(Idempleado)
);
GO

-- Agregar una columna en la tabla emplpeados 
ALTER TABLE empleados
ADD CorreoElectronico VARCHAR(100);
GO


--Modificar el tipo de dato de un campo
ALTER TABLE empleados
ALTER COLUMN Salario money not null;

SELECT * FROM empleados;

--Renombrar un campo
EXEC sp_rename 'empleados.CorreoElectronico',
               'Email', 'COLUMN';
GO

-- Crear tabla departamentos
CREATE TABLE departamentos(
IdDepartamento INT not null identity(1,1) primary key,
NombreDpto VARCHAR (100)

);
GO

--Agrgar un campo a la tabla empleados
--para que sea un foreign key
ALTER TABLE empleados
ADD IdDepartamento INT not null;

--agregar llave foranea 
ALTER TABLE empleados 
ADD CONSTRAINT fk_empleados_departamento
FOREIGN KEY (IdDepartamento)
REFERENCES departamentos(IdDepartamento);
GO

--Eliminar la clave primaria de empleados
ALTER TABLE empleados
DROP CONSTRAINT pk_empleados;
GO

--Eliminar FK de la tabla empleados 
ALTER TABLE empleados
DROP CONSTRAINT fk_empleados_departamento;
GO

ALTER TABLE departamentos
DROP CONSTRAINT PK__departam__787A433D316D6081;
GO

--Crear un constraint de verificacion
--en salario
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK (Salario>0.0);
GO


CREATE TABLE Categoria(
id INT not null primary key DEFAULT -1,
Nombre VARCHAR(20),
estatus CHAR (1) DEFAULT 'A'
);
GO

DROP TABLE CATEGORIA

INSERT INTO CATEGORIA
VALUES(default , 'Carnes', 'D');
GO

INSERT INTO Categoria
VALUES(default , 'Carnes', DEFAULT);
GO

SELECT * FROM Categoria;

--eliminar la columna email
ALTER TABLE empleados 
DROP COLUMN email;
GO
ALTER TABLE empleados
ADD CONSTRAINT pk_empleados
PRIMARY KEY (Idempleado );
go

ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos
PRIMARY KEY (IdDepartamento);
go



DROP TABLE empleados;
go

DROP TABLE departamentos;
go

DROP TABLE Categoria;
go

use master
go

--eliminar BD
DROP DATABASE empresapatito;
go