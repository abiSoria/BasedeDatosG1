-- Lenguaje SQL-LMD
--CONSULTAS SIMPLES

Use NORTHWND;
GO

--Seleccionar todos los clientes
SELECT * 
FROM Customers;

--Seleccionar todos los clientes pero solamente mostrando la clave, el nombre del cliente, la ciudad y el pais(Proyeccion)

SELECT CustomerID, CompanyName, City, Country
FROM Customers;

--Alias de columna
SELECT CustomerID AS NumeroCliente, CompanyName AS 'Nombre Cliente', City Ciudad, Country AS [Ciudad Gei]
FROM Customers;


--CAMPOS CALCULADOS
--SELECCIONAR LAS ORDENES DE COMPRA MOSTRANDO LOS PRODUCTOS, LA CANTIDAD VENDIDA
--PRECIO DE VENTA, DESCUENTO Y TOTAL


Select ProductID AS [Nombre Producto], UnitPrice AS [Precio],
	Quantity AS [Cantidad], Discount AS [Descuento],
	(UnitPrice * Quantity) AS [Importe Sin Descuento],
	(UnitPrice * Quantity * (1 - Discount)) AS [Importe]
FROM [Order Details];

--SELECCIONAR ORDENES DE COMPRA MOSTRANDO EL CLIENTE AL QUE SE LE VENDIO EL EMPLEADO
--QUE LA REALIZO, LA FECHA DE LA ORDEN, EL TRANSPORTISTA Y LA FECHA DE LA ORDEN DIVIDIRLA
-- EN AÑO, MES, DIA, TRIMESTRE

SELECT OrderID AS [Numero de Orden], 
OrderDate AS [Fecha de Orden],
CustomerID AS [Cliente], 
EmployeeID AS [Empleado],
ShipVia AS [Transportista],
DATEPART (YEAR, OrderDate) AS [Año de la compra],
DATEPART (mm, OrderDate) AS [Mes de la compra],
DATEPART (d, OrderDate) AS [Dia de la compra],
DATEPART (qq, OrderDate) AS [Trimestre],
DATEPART (wk, OrderDate) AS [Semana],
DATEPART (WEEKDAY, OrderDate) AS [Dia de la semana],
DATENAME (WEEKDAY, ORDERDATE) AS [Nombre Día]
FROM Orders
Order by 9;

--SELECCIONAR TODOS LOS PRODUCTOS QUE SU PRECIO SEA MAYOR A 40.3
--(mostrar el numero del producto, nombre del producto, y el precio unitario)

SELECT ProductID AS [Nombre de Producto], 
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice > 40.3;

SELECT ProductID AS [Nombre de Producto], 
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice >= 40.3;

SELECT ProductID AS [Nombre de Producto], 
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName = 'Carnarvon Tigers';


SELECT ProductID AS [Nombre de Producto], 
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName <> 'Carnarvon Tigers';


SELECT ProductID AS [Nombre de Producto], 
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName != 'Carnarvon Tigers';

--SELECCIONAR TODAS LAS ORDENES QUE SEAN DE BRAZIL - RIO DE JANERIO
--MOSTRANDO SOLO EL NUMERO DE ORDEN, LA FECHA DE ORDEN, PAIS DE ENVIO
--CIUDAD Y TRANSPORTISTA

SELECT OrderID AS [Numero de Orden],
OrderDate AS [Fecha de Orden],
ShipCountry AS [Pais de Envio],
ShipCity AS [Ciudad],
ShipVia AS [Transportista]

FROM Orders
WHERE ShipCity = 'Rio de Janeiro' and ShipCountry='Brazil';


--Inner Join (interseccion)

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCountry AS [Pais de Envio],
o.ShipCity AS [Ciudad],
s.ShipperID AS [Num. Transportista],
s.CompanyName AS [Transportista]
FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE ShipCity = 'Rio de Janeiro';

--SELECCIONAR TODAS LAS ORDENES MOSTRANDO LO MISMO QUE LA CONSULTA ANTERIOR
--PERO TODAS AQUELLAS QUE NO TENGAN REGION DE ENVIO



--SELECCIONAR TODAS LAS ORDENES ENVIADAS A BRAZIL, ALEMANIA Y MEXICO, QUE TENGAN REGION,
--ORDENAR DE FORMA DESCENDENTE POR EL SHIPCOUNTRY

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCountry AS [Pais de Envio],
o.ShipCity AS [Ciudad],
s.ShipperID AS [Num. Transportista],
s.CompanyName AS [Transportista]
FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia
WHERE (ShipCity = 'Mexico' or
ShipCity = 'Germany' or 
ShipCity = 'Brazil' and
ShipRegion is not  null,
or Order by ShipRegion Desc;
FROM Orders
Order by 9;

--Order by -> Ordenar los datos de forma ascendente y descendente
--Seleccionar los empleador ordenados por su pais

SELECT(TitleOfCourtesy + ' ' + FirstName + ' ' + LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees;

--ASCENDETE
SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
Order by Country ASC;

--DESCENDENTE
SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
Order by Country DESC;

--POR POCISION DE CAMPO
SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], 
City AS [Ciudad]
FROM Employees
Order by 2 DESC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], 
City AS [Ciudad]
FROM Employees
Order by CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName);


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], 
City AS [Ciudad]
FROM Employees
Order by [Nombre Completo] DESC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], 
City AS [Ciudad]
FROM Employees
Order by Country, City;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], 
City AS [Ciudad]
FROM Employees
Order by Country DESC, City;

SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], 
City AS [Ciudad]
FROM Employees
Order by Country DESC, City DESC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], 
City AS [Ciudad]
FROM Employees
Order by Country ASC, City DESC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], 
City AS [Ciudad]
FROM Employees
Order by Country ASC, City ASC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], 
City AS [Ciudad]
FROM Employees
Order by 2 ASC, 3 ASC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
Country AS [Pais], 
City AS [Ciudad]
FROM Employees
Order by 1 ASC, Country DESC, 3 DESC;

--Seleccionar todos los productos que su precio sea mayor a 40.3 (mostrar num del producto y nombre del producto)

USE BDEJEMPLO2;
GO


--SELECCIONAR CUANTOS PUESTOS DIFERENTES TIENEN LOS REPRESENTANTES
SELECT DISTINCT Puesto
FROM Representantes;


Use NORTHWND;
GO

--Seleccionar todos los paises diferentes de mis clientes
SELECT  distinct Country, City
FROM Customers;

SELECT Country, City, CompanyName
FROM Customers
ORDER BY 1 ASC;


SELECT Country, City, CompanyName
FROM Customers
WHERE City = 'Buenos Aires';

SELECT DISTINCT CATEGORYID
FROM Products;



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
       (Jefe IS NULL AND Fecha_Contrato >='1988-06-01') OR 
	   (Ventas >Cuota AND  Ventas <= 600000);
        


 SELECT *
 FROM Oficinas

 