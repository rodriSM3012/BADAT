drop schema EMPRESAS;

create schema EMPRESAS;

use EMPRESAS;

create table EMPLEADOS(
    CEMPL int,
    NOMBRE varchar(15),
    CARGO varchar(15),
    JEFE int,
    FALTA date,
    SALARIO decimal(7, 2),
    COMISION decimal(7, 2),
    DEPT int,
    primary key(CEMPL)
);

create table DEPARTAMENTOS(
    DEPT int,
    NOMBRE varchar(15),
    CIUDAD varchar(15),
    primary key(DEPT)
)