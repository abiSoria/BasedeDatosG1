-- SQL-LDD
#Crea una base de datos
CREATE DATABASE bdpruebag1;

#Crear una tabla
CREATE TABLE categoria(
idcategoria int not null identity(1,1),
categorianombre nvarchar(20)not null,
primary key(idcategoria)
);

CREATE TABLE producto(
idproducto int not null,
nombreproducto varchar(20) not null,
description varchar(100) null,
existencia int not null,
precio numeric (10,2),
idcategoria int not null,
constraint pk_producto
primary key(idproducto),
constraint fk_producto_categotia
foreign key(idcategoria)
references categoria(idcategoria)
);