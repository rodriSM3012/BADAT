-- Active: 1738853769087@@127.0.0.1@3306@escuela
-- 1
DROP SCHEMA Escuela;

CREATE SCHEMA Escuela;

USE Escuela;

-- 2
CREATE TABLE PROFESORES (
    DNIProf CHAR(10),
    nombreProf VARCHAR(40),
    apeProf VARCHAR(60),
    despachoProf CHAR(8),
    CONSTRAINT pk_Prof PRIMARY KEY (DNIProf)
);

CREATE TABLE RECURSOS (
    recurso CHAR(4),
    descripRec VARCHAR(20),
    CONSTRAINT pk_Rec PRIMARY KEY (recurso)
);

CREATE TABLE UTILIZACIONES (
    DNIProf CHAR(10),
    recurso CHAR(4),
    fechaInicio DATE,
    fechaFin DATE,
    CONSTRAINT pk_Uti PRIMARY KEY (DNIProf, recurso, fechaInicio),
    CONSTRAINT fk_dniProf FOREIGN KEY (DNIProf) REFERENCES PROFESORES (DNIProf),
    CONSTRAINT fk_Rec FOREIGN KEY (recurso) REFERENCES RECURSOS (recurso)
);

-- 3
INSERT INTO
    PROFESORES (DNIProf, nombreProf, apeProf, despachoProf)
VALUES
    (11223344, 'Elvira', 'Castro Nuño', '2.2.B23'),
    (33456456, 'Paula', 'Martínez López', '2.2.B05'),
    (44556689, 'Luis', 'Moreno Ruiz', '2.2.A10'),
    (99771122, 'Dionisio', 'Cuadra Laredo', '2.1.B23'),
    (99887766, 'Fernando', 'Calle Asensio', '2.1.C11');

INSERT INTO
    RECURSOS (recurso, descripRec)
VALUES
    ('R100', 'Impresora'),
    ('R122', 'Tablet PC'),
    ('R200', 'Portátil'),
    ('R300', 'Scanner');

INSERT INTO
    UTILIZACIONES (DNIProf, recurso, fechaInicio, fechaFin)
VALUES
    ('11223344', 'R122', '2019-01-16', '2019-01-31'),
    ('33456456', 'R122', '2019-01-01', '2019-01-15'),
    ('33456456', 'R122', '2019-02-01', '2019-02-06'),
    ('33456456', 'R200', '2019-01-12', '2019-01-22'),
    ('33456456', 'R300', '2019-01-01', '2019-01-15'),
    ('44556689', 'R100', '2019-01-01', '2019-01-15'),
    ('99771122', 'R200', '2019-01-23', '2019-01-26'),
    ('99887766', 'R300', '2019-02-01', '2019-02-06');

-- 4
INSERT INTO
    PROFESORES (DNIProf, nombreProf)
VALUES
    (55667788, 'Carmen');

-- 5
SELECT
    *
FROM
    PROFESORES;

SELECT
    *
FROM
    RECURSOS;

SELECT
    *
FROM
    UTILIZACIONES;

-- 9
-- hace falta borrar los datos del ejercicio 4 porque despachoProf ya no puede estar vacio
DELETE FROM
    PROFESORES
WHERE
    (DNIProf = 55667788);

ALTER TABLE
    PROFESORES CHANGE COLUMN despachoProf despachoProf CHAR(10) NOT NULL;

-- 10
CREATE VIEW Tablets AS
SELECT
    UTILIZACIONES.DNIProf,
    UTILIZACIONES.recurso,
    UTILIZACIONES.fechaInicio,
    UTILIZACIONES.fechaFin
FROM
    UTILIZACIONES,
    RECURSOS
WHERE
    (RECURSOS.descripRec = 'Tablet PC');

/*
 CREATE VIEW UtilizacionesTablets AS
 SELECT
 u.DNIProf,
 u.recurso,
 u.fechaInicio,
 u.fechaFin
 FROM
 UTILIZACIONES u
 JOIN RECURSOS r ON u.recurso = r.recurso
 WHERE
 r.descripRec = 'Tablet PC';
 */