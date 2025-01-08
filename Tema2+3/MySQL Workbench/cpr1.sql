drop schema cpr1;

-- drop es para que no de error
create schema cpr1;

use cpr1;

create table alumnos(
    numMat varchar(7),
    -- se podria poner numMat varchar(7) primary key,
    nombre varchar(25),
    apellidos varchar(50),
    fechaNac date,
    dir varchar(50),
    telf varchar(9),
    
    primary key(numMat)
    -- al usar este metodo se pueden crear claves compuestas
);

create table modulos(
	codigo varchar(5),
    nombre varchar(25),
    curso varchar(2),
    ciclo varchar(5),
    horas int(3),
    primary key(codigo)
);

create table matricular(
	numMat varchar(7),
    codigo varchar(5),
    nota decimal(5,2),
    -- 5 = total	2 = decimales
    primary key(numMat, codigo),
    constraint pk
    -- constraint = crear una regla
    -- el nombre de la regla no se puede repetir
    -- pk(primary key), fk(foreign key) y ck(check) son mnemotecnicos para las reglas
    -- fkMatAlum = foreign key que relaciona la tabla matricula y alumnos
);