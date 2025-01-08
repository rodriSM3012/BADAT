/*
Created: 04/12/2010
Modified: 05/12/2010
Model: Oracle 11g Release 2
Database: Oracle 11g Release 2
*/


-- Create tables section -------------------------------------------------

-- Table EMPLEADOS

CREATE TABLE EMPLEADOS(
  codEmp Number(4,0) NOT NULL,
  nombre Varchar2(50 ) NOT NULL,
  fechaIngreso Date NOT NULL,
  codDep Number(3,0) NOT NULL,
  FK_codEmp Number(4,0) NOT NULL
)
/

-- Create indexes for table EMPLEADOS

CREATE INDEX IX_Relationship7 ON EMPLEADOS (codDep)
/

CREATE INDEX IX_Relationship10 ON EMPLEADOS (FK_codEmp)
/

-- Add keys for table EMPLEADOS

ALTER TABLE EMPLEADOS ADD CONSTRAINT PK_EMPLEADOS PRIMARY KEY (codEmp)
/

-- Table DEPARTAMENTOS

CREATE TABLE DEPARTAMENTOS(
  codDep Number(3,0) NOT NULL,
  nombre Varchar2(30 ) NOT NULL,
  ciudad Varchar2(20 ) NOT NULL,
  codEmp Number(4,0)
)
/

-- Create indexes for table DEPARTAMENTOS

CREATE INDEX IX_Relationship5 ON DEPARTAMENTOS (codEmp)
/

CREATE INDEX IX_Relationship6 ON DEPARTAMENTOS (codEmp)
/

-- Add keys for table DEPARTAMENTOS

ALTER TABLE DEPARTAMENTOS ADD CONSTRAINT PK_DEPARTAMENTOS PRIMARY KEY (codDep)
/

-- Table PROYECTOS

CREATE TABLE PROYECTOS(
  codProy Char(5 ) NOT NULL,
  nombre Varchar2(50 ) NOT NULL,
  codDep Number(3,0) NOT NULL
)
/

-- Create indexes for table PROYECTOS

CREATE INDEX IX_Relationship12 ON PROYECTOS (codDep)
/

-- Add keys for table PROYECTOS

ALTER TABLE PROYECTOS ADD CONSTRAINT PK_PROYECTOS PRIMARY KEY (codProy)
/

-- Table Trabajar

CREATE TABLE Trabajar(
  codEmp Number(4,0) NOT NULL,
  codProy Char(5 ) NOT NULL,
  nHoras Number(5,2) NOT NULL
)
/

-- Add keys for table Trabajar

ALTER TABLE Trabajar ADD CONSTRAINT PK_Trabajar PRIMARY KEY (codEmp,codProy)
/




-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE Trabajar ADD CONSTRAINT Relationship1 FOREIGN KEY (codEmp) REFERENCES EMPLEADOS (codEmp)
/



ALTER TABLE Trabajar ADD CONSTRAINT Relationship2 FOREIGN KEY (codProy) REFERENCES PROYECTOS (codProy)
/



ALTER TABLE DEPARTAMENTOS ADD CONSTRAINT Relationship5 FOREIGN KEY (codEmp) REFERENCES EMPLEADOS (codEmp)
/



ALTER TABLE DEPARTAMENTOS ADD CONSTRAINT Relationship6 FOREIGN KEY (codEmp) REFERENCES EMPLEADOS (codEmp)
/



ALTER TABLE EMPLEADOS ADD CONSTRAINT Relationship7 FOREIGN KEY (codDep) REFERENCES DEPARTAMENTOS (codDep)
/



ALTER TABLE EMPLEADOS ADD CONSTRAINT Relationship10 FOREIGN KEY (FK_codEmp) REFERENCES EMPLEADOS (codEmp)
/



ALTER TABLE PROYECTOS ADD CONSTRAINT Relationship12 FOREIGN KEY (codDep) REFERENCES DEPARTAMENTOS (codDep)
/




