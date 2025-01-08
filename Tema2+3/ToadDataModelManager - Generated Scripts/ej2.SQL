/*
Created: 18/12/2010
Modified: 18/12/2010
Model: Oracle 11g Release 2
Database: Oracle 11g Release 2
*/


-- Create tables section -------------------------------------------------

-- Table CLIENTE

CREATE TABLE CLIENTE(
  codCliente Char(20 ) NOT NULL,
  nombre Char(20 ) NOT NULL,
  apellidos Char(20 ) NOT NULL,
  DNI Char(20 ) NOT NULL,
  fechaNac Char(20 ),
  direccion Char(20 ) NOT NULL
)
/

-- Add keys for table CLIENTE

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE PRIMARY KEY (codCliente)
/

ALTER TABLE CLIENTE ADD CONSTRAINT DNI UNIQUE (DNI)
/

-- Table PRODUCTO

CREATE TABLE PRODUCTO(
  codProducto Char(20 ) NOT NULL,
  nombre Char(20 ) NOT NULL,
  precioUnit Number(10,0) NOT NULL,
  NIF Char(20 ) NOT NULL
)
/

-- Create indexes for table PRODUCTO

CREATE INDEX IX_Relationship1 ON PRODUCTO (NIF)
/

-- Add keys for table PRODUCTO

ALTER TABLE PRODUCTO ADD CONSTRAINT PK_PRODUCTO PRIMARY KEY (codProducto)
/

-- Table PROVEEDOR

CREATE TABLE PROVEEDOR(
  NIF Char(20 ) NOT NULL,
  nombre Char(20 ) NOT NULL,
  direccion Char(20 ) NOT NULL
)
/

-- Add keys for table PROVEEDOR

ALTER TABLE PROVEEDOR ADD CONSTRAINT PK_PROVEEDOR PRIMARY KEY (NIF)
/

-- Table Comprar

CREATE TABLE Comprar(
  codCliente Char(20 ) NOT NULL,
  codProducto Char(20 ) NOT NULL
)
/

-- Add keys for table Comprar

ALTER TABLE Comprar ADD CONSTRAINT PK_Comprar PRIMARY KEY (codCliente,codProducto)
/




-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE PRODUCTO ADD CONSTRAINT Relationship1 FOREIGN KEY (NIF) REFERENCES PROVEEDOR (NIF)
/



ALTER TABLE Comprar ADD CONSTRAINT Relationship2 FOREIGN KEY (codCliente) REFERENCES CLIENTE (codCliente)
/



ALTER TABLE Comprar ADD CONSTRAINT Relationship3 FOREIGN KEY (codProducto) REFERENCES PRODUCTO (codProducto)
/




