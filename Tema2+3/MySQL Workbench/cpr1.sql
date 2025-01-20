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
    edad int,
    primary key(numMat),
    -- al usar este metodo se pueden crear claves compuestas
    constraint ck_Edad check(
        edad between 18
        and 35
    ) -- between si ambos extremos son inclusive   
    -- se puede poner (edad >= 18 and edad <= 35) 
);

create table modulos(
    codigo varchar(5),
    nombre varchar(25),
    curso varchar(2),
    ciclo varchar(20) default 'DAW',
    horas int(3),
    primary key(codigo)
);

create table matricular(
    numMat varchar(7),
    codigo varchar(5),
    nota decimal(5, 2),
    -- 5 = total	2 = decimales
    primary key(numMat, codigo),
    -- constraint = crear una regla
    constraint fk_AlumMat foreign key(numMat) references alumnos(numMat),
    constraint fk_ModMat foreign key(codigo) references modulos(codigo)
);

create table profesores(
    id varchar(7),
    nombre varchar(20),
    apellidos varchar(50),
    sueldo decimal(7, 2),
    primary key(id)
);

create table impartir(
    codigo varchar(5),
    id varchar(7),
    horas decimal(2, 0),
    constraint pk_Imp primary key(codigo, id),
    -- por separado son fk
    constraint fk_ImpMod foreign key(codigo) references modulos(codigo),
    constraint fk_ImpProf foreign key(id) references profesores(id)
);

-- si quieres borrarlo por una equivocacion
alter table
    impartir drop foreign key fk_ImpProf;

-- para añadir un constraint una vez la tabla ya esta creada
alter table
    impartir
add
    constraint fk_ImpProf foreign key(id) references profesores(id);

-- para borrar una tabla
-- da error por que las pk de esta tabla ya son fk en otras tablas
drop table alumnos;

-- al ejecutar esto ya deja ejecutar la de arriba
alter table
    matricular drop foreign key fk_AlumMat;

-- para cambiar el nombre de una tabla
rename table profesores to tutores;

-- al cambiarle el nombre ya no se puede referir a la misma tabla con el nombre anterior
-- para añadir una columna a una tabla ya existente
alter table
    alumnos
add
    column cp char(5);

-- para borrar una columna
alter table
    alumnos drop column cp;

-- para modificar el tipo de dato de una columna
alter table
    alumnos
modify
    cp varchar(5);

-- para cambiar el nombre de una columna
-- hay que poner el tipo de dato aunque no cambie
alter table
    alumnos change column cp codPostal char(5);

-- mostrar informacion sobre los privilegios necesarios para ejecutar ciertas cosas
show privileges;