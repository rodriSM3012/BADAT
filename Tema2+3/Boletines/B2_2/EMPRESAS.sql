drop schema EMPRESAS;

create schema EMPRESAS;

use EMPRESAS;

create table EMPLEADOS (
    CEMPL decimal(4, 0),
    NOMBRE varchar(15) not null,
    CARGO varchar(15) not null,
    JEFE decimal(4, 0) not null,
    FALTA date,
    SALARIO decimal(7, 2) not null,
    COMISION decimal(7, 2) not null,
    DEPT decimal(2, 0) not null,
    primary key (CEMPL)
);

create table DEPARTAMENTOS (
    DEPT int,
    NOMBRE varchar(15),
    CIUDAD varchar(15),
    primary key (DEPT)
);

-- para meter datos en la tabla
-- 8 datos por las 8 columnas y hay que ponerlos por orden
insert into EMPLEADOS values (7369, 'JUAN', 'EMPLEADO', 7902, '1980-12-17', 800, 0, 20);
insert into EMPLEADOS values (7499, 'LUIS', 'COMERCIAL', 7698, '1981-02-20', 1600, 300, 30);
insert into EMPLEADOS values (7521, 'ANA', 'COMERCIAL', 7698, '1981-02-22', 1250, 500, 30);
insert into EMPLEADOS values (7566, 'MARTA', 'GERENTE', 7839, '1981-04-02', 2975, 0, 20);
insert into EMPLEADOS values (7654, 'MARTIN', 'COMERCIAL', 7698, '1981-09-28', 1250, 1400, 30);
insert into EMPLEADOS values (7698, 'JORGE', 'GERENTE', 7839, '1981-05-01', 2850, 0, 30);
insert into EMPLEADOS values (7782, 'GEMMA', 'GERENTE', 7839, '1981-06-09', 2450, 0, 10);
insert into EMPLEADOS values (7788, 'CARLOS', 'ANALISTA', 7566, '1982-12-09', 3000, 0, 20);
insert into EMPLEADOS values (7839, 'MERCEDES', 'PRESIDENTE', 7839, '1981-11-17', 5000, 0, 10);
insert into EMPLEADOS values (7844, 'JAVIER', 'COMERCIAL', 7698, '1981-09-08', 1500, 700, 30);
insert into EMPLEADOS values (7876, 'SUSANA', 'EMPLEADO', 7788, '1983-01-12', 1100, 0, 20);
insert into EMPLEADOS values (7900, 'SANTIAGO', 'EMPLEADO', 7698, '1982-12-03', 950, 0, 30);
insert into EMPLEADOS values (7902, 'BORJA', 'ANALISTA', 7566, '1982-12-03', 3000, 0, 20);
insert into EMPLEADOS values (7934, 'ALBA', 'EMPLEADO', 7782, '1982-01-23', 1300, 0, 10);

insert into DEPARTAMENTOS values (10, 'CONTABILIDAD', 'OVIEDO');
insert into DEPARTAMENTOS values (20, 'INVESTIGACION', 'GIJON');
insert into DEPARTAMENTOS values (30, 'COMERCIAL', 'AVILES');
insert into DEPARTAMENTOS values (40, 'LOGISTICA', 'POLA DE SIERO');

-- para crear consulta
select * from DEPARTAMENTOS;