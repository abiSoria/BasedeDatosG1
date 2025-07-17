CREATE DATABASE EmpresaExamen;
USE EmpresaExamen;

# Tabla Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100),
    Description VARCHAR(255)
);

# Tabla Suppliers
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    Region VARCHAR(100),
    HomePage VARCHAR(255)
);

# Tabla ContactSupplier (N:1 con Suppliers)
CREATE TABLE ContactSupplier (
    ContactSupplierID INT PRIMARY KEY,
    ContactName VARCHAR(100),
    Phone VARCHAR(50),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

# Tabla Products (N:1 con Suppliers, N:1 con Categories)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    QuantityPerUnit VARCHAR(50),
    CategoryID INT,
    SupplierID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

# Tabla Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    ContactName VARCHAR(100),
    City VARCHAR(100),
    Region VARCHAR(100)
);

# Tabla ContactCustomer (1:N con Customers)
CREATE TABLE ContactCustomer (
    ContactID INT PRIMARY KEY,
    CustomerID INT,
    Phone VARCHAR(50),
    Email VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

# Tabla Shippers
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    CompanyName VARCHAR(100)
);

# Tabla PhonesShipper (1:N con Shippers)
CREATE TABLE PhonesShipper (
    PhoneID INT PRIMARY KEY,
    ShipperID INT,
    Phone VARCHAR(50),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);

# Tabla Employees (relación recursiva y 1:N con Orders)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    City VARCHAR(100),
    ReportsTo INT,
    FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);

# Tabla Orders (N:1 con Customers, Shippers, Employees / 1:N con Details)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    RequiredDate DATE,
    CustomerID INT,
    ShipperID INT,
    EmployeeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

# Tabla Details (1:N desde Products, 1:N desde Orders)
CREATE TABLE Details (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Discount FLOAT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);