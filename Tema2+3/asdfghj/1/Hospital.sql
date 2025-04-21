-- Active: 1739172477455@@127.0.0.1@3306@hospital
-- 1 Crea una base de datos llamada "Hospital".
DROP SCHEMA Hospital;

CREATE SCHEMA Hospital;

USE Hospital;

CREATE TABLE PACIENTES(
    idPaciente INT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fechaNacimiento DATE,
    CONSTRAINT pk_Pac PRIMARY KEY (idPaciente)
);

CREATE TABLE DOCTORES(
    idDoctor INT,
    nombre VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Doc PRIMARY KEY (idDoctor)
);

CREATE TABLE CITAS(
    idCita INT,
    idPaciente INT,
    idDoctor INT,
    fechaCita DATE NOT NULL,
    CONSTRAINT pk_Cit PRIMARY KEY (idCita, idPaciente, idDoctor),
    CONSTRAINT fk_CitPac FOREIGN KEY (idPaciente) REFERENCES PACIENTES (idPaciente),
    CONSTRAINT fk_CitDoc FOREIGN KEY (idDoctor) REFERENCES DOCTORES (idDoctor)
);

INSERT INTO
    PACIENTES
VALUES
    (1, 'Luis', 'Gómez', '1985-07-02'),
    (2, 'Ana', 'Martínez', '1992-05-20');

INSERT INTO
    DOCTORES
VALUES
    (101, 'Carlos', 'Pediatría'),
    (102, 'María', 'Cardiología');

INSERT INTO
    CITAS
VALUES
    (1001, 1, 101, '2025-03-10'),
    (1002, 2, 102, '2025-04-05');

ALTER TABLE
    PACIENTES
ADD
    COLUMN telefono VARCHAR(15);

ALTER TABLE
    DOCTORES CHANGE COLUMN especialidad especialidad VARCHAR(100);

RENAME TABLE CITAS TO CONSULTAS;

CREATE VIEW Citas_Pacientes AS
SELECT
    CONSULTAS.idCita,
    PACIENTES.nombre,
    DOCTORES.especialidad
FROM
    CONSULTAS,
    PACIENTES,
    DOCTORES;

