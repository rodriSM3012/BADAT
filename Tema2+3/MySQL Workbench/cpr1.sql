drop schema cpr1;

-- drop es para que no de error
create schema cpr1;

use cpr1;

CREATE TABLE alumnos (
    numMat VARCHAR(7),
    nombre VARCHAR(25),
    apellidos VARCHAR(50),
    fechaNac DATE,
    dir VARCHAR(50),
    telf VARCHAR(9) COMMENT 'Móvil',
    edad INT,
    PRIMARY KEY (numMat),
    CONSTRAINT ck_Edad CHECK (edad BETWEEN 18 AND 35)
)  COMMENT 'Tabla alumnos';

CREATE TABLE modulos (
    codigo VARCHAR(5),
    nombre VARCHAR(25),
    curso VARCHAR(2),
    ciclo VARCHAR(20) DEFAULT 'DAW',
    horas INT(3),
    PRIMARY KEY (codigo)
);

CREATE TABLE matricular (
    numMat VARCHAR(7),
    codigo VARCHAR(5),
    nota DECIMAL(5 , 2 ),
    PRIMARY KEY (numMat , codigo),
    CONSTRAINT fk_AlumMat FOREIGN KEY (numMat)
        REFERENCES alumnos (numMat),
    CONSTRAINT fk_ModMat FOREIGN KEY (codigo)
        REFERENCES modulos (codigo)
);

CREATE TABLE profesores (
    id VARCHAR(7),
    nombre VARCHAR(20),
    apellidos VARCHAR(50),
    sueldo DECIMAL(7 , 2 ),
    PRIMARY KEY (id)
);

CREATE TABLE impartir (
    codigo VARCHAR(5),
    id VARCHAR(7),
    horas DECIMAL(2 , 0 ),
    CONSTRAINT pk_Imp PRIMARY KEY (codigo , id),
    CONSTRAINT fk_ImpMod FOREIGN KEY (codigo)
        REFERENCES modulos (codigo),
    CONSTRAINT fk_ImpProf FOREIGN KEY (id)
        REFERENCES profesores (id)
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
/*
 drop table alumnos;
 
 -- al ejecutar esto ya deja ejecutar la de arriba
 alter table
 matricular drop foreign key fk_AlumMat;
 */
-- para cambiar el nombre de una tabla
rename table profesores to tutores;

-- al cambiarle el nombre ya no se puede referir a la misma tabla con el nombre anterior
-- para añadir una columna a una tabla ya existente
alter table
    alumnos
add
    column cp char(5);
/*
-- para borrar una columna
alter table
    alumnos drop column cp;
*/
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
-- show privileges;

create user 'alumno' @'%' identified by 'alumno';
drop user 'alumno' @'%';

insert into alumnos values ('2024001', 'JUAN', 'ARIAS GARCÍA', '2000-01-27', 'LOPE DE VEGA', '123121212', '25', '33204');
insert into modulos values ('BADAT', 'BASES DE DATOS', 1, 'DAW', 5);
insert into modulos values ('PROGR', 'PROGRAMACION', 1, 'DAW', 7);
insert into modulos values ('LMSGI', 'LENGUAJE MARCAS', 1, 'DAW', 3);
SELECT 
    *
FROM
    modulos;

insert into matricular values ('2024001', 'BADAT', 7);
insert into matricular values ('2024002', 'BADAT', 6);
insert into matricular values ('2024001', 'LMSGI', 4);
insert into matricular values ('2024003', 'PROGR', 4);
insert into matricular values ('2024003', 'BADAT', 8);

insert into alumnos values ('2024002', 'ANA', 'ARIAS GARCÍA', '2000-01-27', 'LOPE DE VEGA', '123121212', '25', '33204');
insert into alumnos values ('2024003', 'LUIS', 'GARCÍA HERNÁNDEZ', '2000-01-27', 'LOPE DE VEGA', '123121212', '25', '33204');

DELETE FROM alumnos 
WHERE
    (numMat = '2024002');
-- alter table alumnos drop column Mov; -- para borrar una fila entera y todos los datos que hubiese dentro

describe alumnos;

-- muestra los campos de datos y los tipos de datos
alter table
    alumnos
add
    constraint ck_Alumn check(Nombre = lower(Nombre));

describe tutores;
alter table tutores add column dir varchar(50);
-- para seleccionar ciertos campos en concreto (solo se pueden ignorar campos que no sean no nulos)
insert into tutores (id, nombre, apellidos, sueldo) values ('001', 'LUIS', 'GONZÁLEZ DÍAZ', 1200.50);
SELECT 
    *
FROM
    tutores;

insert into tutores (id, nombre, apellidos) values ('002', 'CARMEN', 'FERNÁNDEZ LÓPEZ');
-- borrar los registros de la tabla profesores
truncate table tutores;
alter table impartir drop foreign key fk_ImpProf;

-- select siempre va seguido de from
-- para hacer una consulta ya tienen que estar creadas las tablas
SELECT 
    *
FROM
    information_schema.table_constraints
WHERE
    Table_name = 'alumnos';

SELECT 
    nombre, apellidos
FROM
    alumnos
WHERE
    nombre = 'JUAN';
CREATE VIEW aprobados AS
    SELECT 
        alumnos.nombre, alumnos.apellidos
    FROM
        alumnos,
        matricular
    WHERE
        (matricular.nota >= 5)
            AND (alumnos.numMat = matricular.numMat);
-- pueden haber varios alumnos con mas de un 5

SELECT 
    *
FROM
    aprobados;

-- mostrar nombre, apellidos, nombre modulos de alumnos que suspendieron
CREATE VIEW suspensos AS
    SELECT 
        alumnos.nombre, alumnos.apellidos, modulos.nombre
    FROM
        alumnos,
        modulos,
        matricular
    WHERE
        (matricular.nota < 5)
            AND (alumnos.numMat = matricular.numMat);

SELECT 
    *
FROM
    suspensos;
    
drop view suspensos;
	
UPDATE modulos 
SET 
    horas = horas + 1
WHERE
    codigo = 'PROGR'