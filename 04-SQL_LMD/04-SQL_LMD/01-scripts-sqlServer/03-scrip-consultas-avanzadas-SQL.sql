USE BDEJEMPLO2;
GO

--CUANTOS PUESTOS DIFERENTES TIENEN LOS RESPRESENTANTES
--FUNCIONES DE AGREGADO

SELECT COUNT(DISTINCT PUESTO) AS [Numero de Puestos]
From Representantes;


--Seleccionar el precio minimo de los productos
Select min(Precio) as [Precio Minimo]
From Productos;

SELECT *
FROM Productos
Order by precio asc;


--Listas las oficinas cuyas ventas estan por debajo del 80% de sus objetivos

SELECT* FROM Oficinas;



SELECT Ciudad, Ventas, Objetivo,(0.8 * Objetivo) AS [80% del objetivo]
FROM Oficinas
WHERE ventas < (0.8 * Objetivo);


--SELECCIONAR LOS PRIMEROS 5 REGISTROS DE LOS PEDIDOS
SELECT TOP 5 Num_Pedido, Fecha_Pedido, Producto, Cantidad, Importe
FROM Pedidos

-- 5 PEDIDOS CON EL IMPORTE MÁS CARO
SELECT TOP 5 Num_Pedido, Fecha_Pedido, Producto, Cantidad, Importe
FROM Pedidos
ORDER BY 5 DESC;


--TEST DE RANGO (BETWEEN)
--Hallar los pedidos del ultimo trimestre de 1989

SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE Fecha_Pedido BETWEEN '1989-10-01' AND '1989-12-31'
Order by Fecha_Pedido DESC;


SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE Fecha_Pedido >= '1989-10-01' AND Fecha_Pedido <='1989-12-31'
Order by Fecha_Pedido DESC;


SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE datepart(quarter, Fecha_Pedido) = 4
Order by Fecha_Pedido DESC;


--Hallar los pedidos que tiene un importe entre 30000 y 39999.99
SELECT Num_Pedido, Fecha_Pedido, FAB, Producto, Importe
FROM Pedidos
WHERE Importe >= '30000' AND Importe <='39999.99'
Order by Importe;

SELECT Num_Pedido, Fecha_Pedido, FAB, Producto, Importe
FROM Pedidos
WHERE Importe >= 30000 AND Importe <= 39999.99;


--Listar los representantes cuyas ventas no se encuentran entre 80 y el 120 de su cuota
SELECT Num_Empl, Nombre, Puesto, Cuota, Ventas
FROM Representantes
Where Ventas not between (Cuota *.8) AND (Cuota * 1.2);



--TEST DE PERTENENCIA A CONJUNTOS(IN)
--HALLAR LOS PEDIDOS DE CUATRO REPRESENTANTES EN CONCRETO

SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROM Pedidos
WHERE REP IN (107, 109, 101, 103);

SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROM Pedidos
WHERE REP = 107 OR
      REP = 109 OR
	  REP = 101 OR
	  REP = 103;


SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROM Pedidos
WHERE NOT (REP = 107 OR
      REP = 109 OR
	  REP = 101 OR
	  REP = 103);


 --TEST DE ENCAJE DE PATRONES (LIKE)

 SELECT *
 FROM Clientes
 WHERE Empresa LIKE '%Ac%';

 SELECT *
 FROM Clientes
 WHERE Empresa LIKE '%er%';

 SELECT * 
 FROM Clientes
 WHERE Empresa LIKE '[^ADf]%';

 --Halar todos los representantes que o bien : 
 --a) trabajan en daimiel, Navarra o Castellon; o bien 
 --b) no tienen jefe y estan contratados desde junio en 1988; o
 --c) Superan su cuota pero tienen ventas de 600000 o menos

 SELECT Nombre, Fecha_Contrato, Puesto
 FROM Representantes
 WHERE (o.ciudad IN (11,12,22)) OR 
       (Jefe IS NULL AND Fecha_Contrato >='1988-06-01') OR 
	   (Ventas >Cuota AND  Ventas <= 600000);
       
 SELECT r.Num_Empl AS [Numero Empleado],
        r.Nombre AS [Nombre Empleado],
		r.Fecha_Contrato AS [Fecha de Contrato],
		r.Cuota AS [Cuota de Ventas],
		r.Ventas AS [Ventas Totales],
		o.Ciudad AS [Ciudad de la Oficina], 
		r.Jefe AS [Numero de Jefe]
 FROM Representantes AS r
 INNER JOIN Oficinas AS o 
 ON o.Oficina = r.Oficina_Rep
 WHERE (o.ciudad IN ('Damiel','Navarro','Castellano')) OR 
       (r.Jefe IS NULL AND r.Fecha_Contrato >='1988-06-01') OR 
	   (r.Ventas >Cuota AND  r.Ventas <= 600000);
        


 SELECT *
 FROM Oficinas

 --Listar todos los pedidos, mostrando el numero de pedido, 
 --su importe y el nombre de credito del cliente 

SELECT p.Num_Pedido, p.Importe, c.Empresa, c.Limite_Credito
FROM Pedidos AS p
INNER JOIN Clientes AS c
ON c.Num_Cli = p.Cliente;

-- Listar las oficinas con un objetivo superior a 600000
--mostrando el nombre de la ciudad, nombre del representante y su puesto

SELECT o.Ciudad AS [Oficina],
       r.Nombre AS [Representante],
	   r.Puesto AS [Puesto], o.Objetivo AS [Objetivo de Ventas]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON o.Jef = r.Num_Empl
WHERE o.Objetivo > 600000
;

--listar todos los pedidos, mostrando el numero de pedido, el importe
-- el nombre y limite de credito del cliente 

SELECT pe.Num_Pedido AS [Numero Pedido],
       pe.Importe AS [Importe],
	   c.Empresa AS [Cliente],
	   c.Limite_Credito AS [Limite de Credito]
FROM Pedidos AS pe
INNER JOIN Clientes AS c
ON pe.Cliente = c.Num_Cli;

--Listar cada representante mostrando su nombre, la ciudad
-- y la region en que trabajan 

SELECT r.Nombre AS [Nombre de Representante],
       o.Ciudad AS [Ciudad],
	   o.Oficina AS [Oficinas]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Oficina_Rep = o.Oficina
;

--Listar las oficinas (ciudad) , nombres y puestos de sus jefes

SELECT o.Oficina AS [Numero de Oficina],
       o.Ciudad AS [Ciudad],
	   r.Nombre AS [Nombre],
	   r.Puesto AS [Puesto]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON r.Num_Empl = o.Jef;


--Listar los pedidos molstrando, mostrando el numero de
--pedido, el importe y la cantidad de cada producto

SELECT p.Num_Pedido AS [Numero de Pedido],
       p.Importe AS [Importe],
	   pr.Descripcion AS [Descripcion],
	   pr.Stock AS [Cantidad]
FROM Pedidos AS p
INNER JOIN Productos AS pr
ON pr.Id_fab = p.Fab 
AND pr.Id_producto = p.Producto;

--Listar los nombres de los empleados y los nombres de sus jefes
--Consulta recursiva
SELECT empl.Nombre AS [Empleado],
       jefs.Nombre AS [Jefes]
FROM Representantes AS jefs
INNER JOIN Representantes AS empl
ON jefs.Num_Empl = empl.Jefe;

--Listar los pedidos con un importe superior a 25,000
--incluyendo el nombre del representante que tomo nota del pedido, numero de pedido, el importe,
-- y el nombre del cliente

SELECT p.Num_Pedido AS [Pedidos],
       p.Importe AS [Importe],
	   r.Nombre AS [Nombre Cliente],
	   c.Empresa AS [Nombre Representante]
FROM Pedidos AS p
INNER JOIN Representantes AS r
ON r.Num_Empl = p.Rep 
INNER JOIN Clientes AS c
ON c.Num_Cli = p.Cliente
WHERE p.Importe > 25000;

--Listar los pedidos superiores a 25,000 mostrando el numero de pedido,
--el nombre del cliente que lo encargo y el nombre del representante 
--asignado al cliente y el importe

