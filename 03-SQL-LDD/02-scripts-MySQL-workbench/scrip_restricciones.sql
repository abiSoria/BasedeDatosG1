--Crear base de datos
CREATE DATABASE restriccionesbdg1;

-- Utilizar la base de datos
USE restriccionesbdg1;
--Crear la tabla categoria
CREATE TABLE categoria(
id INT, 
nombre nvarchar(30)
);

--DROP TABLE categoria;

INSERT INTO categoria
VALUES(1,'Carnes Frias');

INSERT INTO categoria
VALUES(1,'Vinos y Licores');

INSERT INTO categoria
VALUES(null,'Ropa');

Select * FROM categoria;


DROP TABLE categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombre varchar(30),
constraint pk_categoria
primary key (categoriaid)
);

INSERT INTO categoria
VALUES(1,'Carnes Frias');

INSERT INTO categoria
VALUES(2,'Vinos y Licores');

INSERT INTO categoria
VALUES(3,'Ropa');

INSERT INTO categoria
VALUES(4,'Ropa');

Select * FROM categoria;

DROP TABLE categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombre varchar(30)not null,
constraint pk_categoria
primary key (categoriaid),
constraint unique_nombre
unique(nombre)
);

INSERT INTO categoria
VALUES(1,'Carnes Frias');

INSERT INTO categoria
VALUES(2,'Carnes Calientes');

INSERT INTO categoria
VALUES(8,'Ropa China');

Select * FROM categoria;



CREATE TABLE categoria(
categoriaid int not null,
nombre varchar(30)not null,
constraint pk_categoria
primary key (categoriaid),
constraint unique_nombre
unique(nombre)
);

DROP TABLE producto;

create table producto (
productoid int not  null,
nombreprod nvarchar(20) not null,
precio money not null,
existencia numeric(10, 2) not null,
categoria int 
constraint pk_producto
primary key(productoid),
constraint unique_nombreprod
unique(nombreprod),
constraint chk_precio
check(precio>0 and precio<=4000),
constraint chk_existencia
check(existencia>=0),
constraint fk_producto_categoria
foreign key (categoria)
references categoria (categoriaid)
);
INSERT INTO categoria
VALUES(1,'Carnes Frias');

INSERT INTO categoria
VALUES(2,'Carnes Calientes');

INSERT INTO producto
VALUES (1, 'Tonayan' , 4000, 4, 2);

INSERT INTO producto
VALUES (2, 'Tonayan2' , 1250.6, 40, 2);

INSERT INTO producto
VALUES (3, 'Bucañas' , 200, 8, 2);

INSERT INTO producto
VALUES (4, 'Calzon Chino' , 6.3, 890, 8);

select * 
from producto as p
INNER JOIN categoria as c
ON c.categoriaid = p.categoria;