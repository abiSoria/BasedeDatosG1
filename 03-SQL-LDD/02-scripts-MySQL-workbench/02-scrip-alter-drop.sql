# Crear base de cdatos empresa patito
CREATE DATABASE empresapatito;


# Usar la base de datos
USE empresapatito;


# Crear una tabla empleados
CREATE TABLE empleados(
Idempleado INT not null,
Nombre VARCHAR (100) not null,
Puesto VARCHAR(50) null,
FechaIngreso DAte null,
Salario DECIMAL(10, 2) null,
CONSTRAINT pk_empleados
PRIMARY KEY(Idempleado)
);


-- Agregar una columna en la tabla emplpeados 
ALTER TABLE empleados
ADD COLUMN
CorreoElectronico VARCHAR(100);



# Modificar el tipo de dato de un campo
ALTER TABLE empleados
MODIFY COLUMN Salario
DECIMAL(12, 2) not null;

# Renombrar un campo 
ALTER TABLE empleados
RENAME COLUMN CorreoElectronico to email;


SELECT * FROM empleados;



# Crear tabla departamentos
CREATE TABLE departamentos(
IdDepartamento INT not null auto_increment primary key,
NombreDpto VARCHAR (100)
);

# Agrgar un campo a la tabla empleados
# para que sea un foreign key
ALTER TABLE empleados
ADD COLUMN IdDepartamento INT not null;

# agregar llave foranea 
ALTER TABLE empleados 
ADD CONSTRAINT fk_empleados_departamento
FOREIGN KEY (IdDepartamento)
REFERENCES departamentos(IdDepartamento);


# Eliminar la clave primaria de empleados
ALTER TABLE empleados
DROP PRIMARY KEY ;


# Eliminar FK de la tabla empleados 
ALTER TABLE empleados
DROP foreign key
fk_empleados_departamento;

# Eliminar el auto_increment
ALTER TABLE departamentos
MODIFY COLUMN IdDepartamento INT NOT NULL;

# Eliminar la PK de departamento 
ALTER TABLE departamentos
DROP primary key; 


#Crear un constraint de verificacion
#en salario
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK (Salario>0.0);



CREATE TABLE Categoria(
id INT not null primary key DEFAULT -1,
Nombre VARCHAR(20),
estatus CHAR (1) DEFAULT 'A'
);




INSERT INTO CATEGORIA
VALUES(default , 'Carnes', 'D');


INSERT INTO Categoria
VALUES(default , 'Carnes', DEFAULT);


SELECT * FROM Categoria;

#eliminar la columna email
ALTER TABLE empleados 
DROP COLUMN email;

ALTER TABLE empleados
ADD CONSTRAINT pk_empleados
PRIMARY KEY (Idempleado );


ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos
PRIMARY KEY (IdDepartamento);




DROP TABLE empleados;


DROP TABLE departamentos;


DROP TABLE Categoria;



#eliminar BD
DROP DATABASE empresapatito;
