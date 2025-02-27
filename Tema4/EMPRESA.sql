/* Creaci�n de las tablas */

CREATE TABLE OFICINAS
(
	NUMOFIC number(2) PRIMARY KEY,
	NOMCEN varchar2(30),
	DIRECEN varchar2(30)
);

CREATE TABLE DEPARTAMENTOS
(
	NUMDEP number(3) PRIMARY KEY,
	NUMOFIC number(2) NOT NULL REFERENCES OFICINAS(NUMOFIC),
	DIRECTOR number(3) NOT NULL,
	TIPODIR char(1) CHECK (UPPER(TIPODIR) IN ('F','T')),
	PRESUP number(3),
	DEPDEP number(3) REFERENCES DEPARTAMENTOS(NUMDEP),
	NOMDEP varchar2(20)
);

CREATE TABLE EMPLEADOS
(
	NUMEMP number(3) PRIMARY KEY,
	NUMDEP number(3) NOT NULL REFERENCES DEPARTAMENTOS(NUMDEP),
	EXTENSION varchar2(3),
	FECHANAC date,
	FECHAING date,
	SALARIO number(6,2),
	COMISION number(5,2),
	NUMHIJOS number(2),
	NOMEMP varchar2(40)
);


INSERT INTO OFICINAS
VALUES(10, 'SEDE CENTRAL', 'C/URIA, 20, OVIEDO');
INSERT INTO OFICINAS
VALUES
	(20, 'REL. CLIENTES', 'C/MOROS, 5, GIJ�N');

INSERT INTO DEPARTAMENTOS
VALUES(100, 10, 260, 'F', 12.00, NULL, 'DIRECCION GENERAL');
INSERT INTO DEPARTAMENTOS
VALUES(110, 20, 180, 'F', 15.00, 100, 'DIRECCION COMERCIAL');
INSERT INTO DEPARTAMENTOS
VALUES(111, 20, 180, 'T', 11.00, 110, 'SECTOR INDUSTRIAL');
INSERT INTO DEPARTAMENTOS
VALUES(112, 20, 270, 'F', 9.00, 110, 'SECTOR SERVICIOS');
INSERT INTO DEPARTAMENTOS
VALUES(120, 10, 150, 'T', 3.00, 100, 'ORGANIZACION');
INSERT INTO DEPARTAMENTOS
VALUES(121, 10, 150, 'F', 2.00, 120, 'PERSONAL');
INSERT INTO DEPARTAMENTOS
VALUES(122, 10, 350, 'F', 6.00, 120, 'PROCESO DE DATOS');
INSERT INTO DEPARTAMENTOS
VALUES(130, 10, 310, 'F', 2.00, 100, 'FINANZAS');

INSERT INTO EMPLEADOS
VALUES(110, 121, 350, '10/11/1959', '15/2/1980', 1310, NULL, 3, 'Alvarez D�az, C�sar');
INSERT INTO EMPLEADOS
VALUES(120, 112, 840, '9/6/1960', '1/10/1988', 1350, 110, 1, 'Garc�a Hurtado, Mario');
INSERT INTO EMPLEADOS
VALUES(130, 112, 810, '9/9/1965', '1/2/1989', 1290, 110, 2, 'P�rez Terol, Lucia');
INSERT INTO EMPLEADOS
VALUES(150, 121, 340, '10/8/1960', '15/1/1978', 2440, NULL, 0, 'Fern�ndez Inguanzo, Julio');
INSERT INTO EMPLEADOS
VALUES(160, 111, 740, '9/7/1965', '11/11/1988', 1310, 110, 2, 'Ramos Aguirre, Esperanza');
INSERT INTO EMPLEADOS
VALUES(180, 110, 508, '18/10/1964', '18/3/1986', 2480, 150, 2, 'Alonso P�rez, Marcos');
INSERT INTO EMPLEADOS
VALUES(190, 121, 350, '12/5/1962', '11/2/1982', 1300, NULL, 4, 'Villa Vega, Julia');
INSERT INTO EMPLEADOS
VALUES(210, 100, 200, '28/9/1970', '22/1/2000', 1380, NULL, 2, 'G�mez Fonseca, Pilar');
INSERT INTO EMPLEADOS
VALUES(240, 111, 760, '26/2/1962', '24/2/1996', 2280, 100, 3, 'L�pez Sanz, Laura');
INSERT INTO EMPLEADOS
VALUES(250, 100, 250, '27/10/1966', '01/3/1987', 1450, NULL, 0, 'Gonz�lez Alvarez, Adriana');
INSERT INTO EMPLEADOS
VALUES(260, 100, 220, '03/12/1963', '12/7/1998', 2720, NULL, 6, 'L�pez Zarabojo, Antonio');
INSERT INTO EMPLEADOS
VALUES(270, 112, 800, '21/5/1965', '10/9/1986', 2380, 180, 3, 'Garc�a Abril, Laura');
INSERT INTO EMPLEADOS
VALUES(280, 130, 410, '11/1/1968', '8/10/1991', 1290, NULL, 5, 'Ferm�n Canalejas, Flor');
INSERT INTO EMPLEADOS
VALUES(285, 122, 620, '25/10/1969', '15/2/2002', 1380, NULL, 0, 'Ramos Polo, Carmen');
INSERT INTO EMPLEADOS
VALUES(290, 120, 910, '30/11/1967', '14/2/1988', 1270, NULL, 3, 'Gil Robles, Gloria');
INSERT INTO EMPLEADOS
VALUES(310, 130, 480, '21/11/1976', '15/1/2000', 2420, NULL, 0, 'Alguer� Garc�a, Augusto');
INSERT INTO EMPLEADOS
VALUES(320, 122, 620, '25/12/1977', '5/2/2005', 2405, NULL, 2, 'Intrialgo P�rez, Estela');
INSERT INTO EMPLEADOS
VALUES(330, 112, 850, '19/8/1978', '1/3/2002', 1280, 190, 0, 'Alonso Ruiz, Amelia');
INSERT INTO EMPLEADOS
VALUES(350, 122, 610, '13/4/1979', '10/9/2010', 2450, NULL, 1, 'Campos Fern�ndez, Arturo');
INSERT INTO EMPLEADOS
VALUES(360, 111, 750, '29/10/1978', '10/10/2004', 1250, 100, 2, 'Vaamonde Vilavedra, Lara');
INSERT INTO EMPLEADOS
VALUES(370, 121, 360, '22/6/1967', '20/1/2000', 2190, NULL, 1, 'Meana Ruiz, Vanesa');
INSERT INTO EMPLEADOS
VALUES(380, 112, 880, '30/3/1968', '1/1/1988', 1180, NULL, 0, 'Mart�nez Oriol, V�ctor');
INSERT INTO EMPLEADOS
VALUES(390, 110, 500, '19/2/1976', '8/10/2006', 2215, NULL, 1, 'Mor�n Mu�iz, Carmen');
INSERT INTO EMPLEADOS
VALUES(400, 111, 780, '18/8/1979', '1/11/1999', 1185, NULL, 0, 'Campos Fern�ndez, Javier');
INSERT INTO EMPLEADOS
VALUES(410, 122, 660, '14/7/1988', '13/10/2010', 1175, NULL, 0, 'Molina Mu�oz, Angela');
INSERT INTO EMPLEADOS
VALUES(420, 130, 450, '22/10/1976', '19/11/1998', 2400, NULL, 0, 'Su�rez Fierro, Claudia');
INSERT INTO EMPLEADOS
VALUES(430, 122, 650, '26/2/1967', '19/11/2000', 1210, NULL, 1, 'Mora Beltr�n, Noa');
INSERT INTO EMPLEADOS
VALUES(440, 111, 760, '26/9/1966', '28/2/1988', 2210, 100, 0, 'Estefan Dur�n, Rub�n');
INSERT INTO EMPLEADOS
VALUES(450, 112, 880, '21/10/1966', '28/2/1986', 1200, 100, 0, 'P�rez R�os, Alejandra');
INSERT INTO EMPLEADOS
VALUES(480, 111, 760, '4/4/1965', '28/2/1986', 1210, 100, 1, 'Pino Barroso, Luis');
INSERT INTO EMPLEADOS
VALUES(490, 112, 880, '6/6/1964', '1/1/1988', 2180, 100, 0, 'Torres Barcia, Rodrigo');
INSERT INTO EMPLEADOS
VALUES(500, 112, 750, '8/10/1965', '1/1/1987', 1200, 100, 0, 'V�zquez Wert, Abril');
INSERT INTO EMPLEADOS
VALUES(510, 110, 550, '4/5/1966', '1/11/1986', 2200, NULL, 1, 'Zabala Campos , Ricardo');
INSERT INTO EMPLEADOS
VALUES(550, 111, 780, '10/1/1970', '21/1/1988', 1100, 120, 0, 'Riestra Carbajal, Santiago');

COMMIT;

ALTER TABLE DEPARTAMENTOS
ADD FOREIGN KEY(DIRECTOR) REFERENCES EMPLEADOS(NUMEMP);

-- A. Los nombres de todos los centros de trabajo de la empresa clasificados por orden alfabético.
SELECT OFICINAS.NOMCEN
FROM OFICINAS
ORDER BY 1;

-- B. Los nombres de los empleados que trabajan en el departamento 121.
SELECT NOMEMP, NUMDEP
FROM EMPLEADOS
WHERE (NUMDEP = 121);

-- C. Los nombres y sueldos de los empleados con más de tres hijos en orden alfabético.
SELECT NOMEMP, SALARIO
FROM EMPLEADOS
WHERE (NUMHIJOS > 3)
ORDER BY 1;

-- D. La comisión, el número de departamento y nombre, de los empleados cuyo salario es inferior a 1900€, 
-- clasificándolos por departamento en orden creciente, y por comisión en orden decreciente. 
-- Obtener sólo los datos de aquellos que tienen comisión.
SELECT COMISION, NUMDEP, NOMEMP
FROM EMPLEADOS
WHERE (SALARIO < 1900) AND (COMISION IS NOT NULL)
ORDER BY 2, 1 DESC;

-- E. Obtener por orden alfabetico los nombres de los departamentos cuyo
-- presupuesto sea superior a 10.000.000€.
SELECT NOMDEP
FROM DEPARTAMENTOS
WHERE (PRESUP > 10)
ORDER BY 1;

-- F. Obtener los números de los departamentos donde trabajan empleados cuyo
-- salario sea inferior a 1250€.
SELECT NUMDEP
FROM EMPLEADOS
WHERE (SALARIO < 1250);

-- G. Obtener los valores diferentes de comisiones que hay en el departamento 110.
SELECT DISTINCT COMISION
FROM EMPLEADOS
WHERE (NUMDEP = 110);

-- H. Obtener un listín telefónico de los empleados del departamento 121,
-- incluyendo nombre de empleado, nº de empleado y extensión telefónica. Por
-- orden alfabético.
SELECT NOMEMP, NUMEMP, EXTENSION
FROM EMPLEADOS
WHERE (NUMDEP = 121)
ORDER BY 1;

-- I. Obtener salario y nombre de los empleados sin hijos, por orden decreciente de
-- salario y por orden alfabético dentro de salario.
SELECT SALARIO, NOMEMP
FROM EMPLEADOS
WHERE (NUMHIJOS = 0)
ORDER BY 1 DESC, 2;

-- J. Obtener los nombres y sueldos anuales (se suponen 14 pagas), de los
-- empleados del departamento 100. Presentarlos por orden decreciente de
-- sueldos.
SELECT NOMEMP, SALARIO * 14 SALARIO_ANUAL
FROM EMPLEADOS
WHERE (NUMDEP = 100)
ORDER BY 2 DESC;

-- K. Obtener los sueldos de los empleados cuya comisión es superior o igual al 10%
-- de su salario, por orden alfabético.
SELECT NOMEMP, SALARIO
FROM EMPLEADOS
WHERE (COMISION >= (SALARIO *0.1))
ORDER BY 1;

-- L. En una campaña de ayuda familiar se ha decidido dar a los empleados una paga
-- extra de 100€ por hijo, a partir del tercero inclusive, Obtener por orden
-- alfabético para estos empleados: nombre, salario, paga y salario total que van a
-- cobrar, incluyendo esta paga extra.
SELECT NOMEMP, SALARIO, ((NUMHIJOS - 2) * 100) AS "PAGA", (SALARIO + NUMHIJOS * 100) AS "SALARIO TOTAL"
FROM EMPLEADOS
WHERE (NUMHIJOS >= 3)
ORDER BY 1;

-- M. Hallar, por orden alfabético, los nombres de los empleados tales que si se les da
-- una gratificación de 100€ por hijo, el total de esta gratificación no supera a la
-- décima parte del salario.
SELECT NOMEMP
FROM EMPLEADOS
WHERE (NUMHIJOS * 100) < (EMPLEADOS.SALARIO * 0.1) AND (NUMHIJOS > 0)
ORDER BY 1;

-- N. Para los empleados del departamento 112, obtener el nombre y el salario total
-- de cada uno (salario más comisión), por orden de salario total decreciente, y
-- por orden alfabético dentro de salario total.
SELECT NOMEMP, (SALARIO + COMISION) AS "SALARIO TOTAL"
FROM EMPLEADOS
WHERE (NUMDEP = 112)
ORDER BY 2 DESC, 1;

-- O. Hallar por orden de número de empleado el nombre y salario total (salario más
-- comisión) de los empleados cuyo salario total supera a 2300€ mensuales.
SELECT NOMEMP, (SALARIO + COMISION) AS "SALARIO TOTAL"
FROM EMPLEADOS
WHERE (SALARIO + COMISION) > 2300
ORDER BY NUMEMP;

-- P. Obtener los números de los departamentos en los que haya algún empleado
-- cuya comisión supere el 10% de su salario.
SELECT NUMDEP
FROM EMPLEADOS
WHERE (COMISION > (SALARIO * 0.1));

-- Q. Obtener por orden alfabético los nombres de los empleados cuyo salario está
-- entre 2000 y 2500€.
SELECT NOMEMP
FROM EMPLEADOS
WHERE ((SALARIO < 2000) AND (SALARIO > 2500))
ORDER BY 1;

-- R. Obtener por orden alfabético los nombres de los empleados cuyo primer
-- apellido comienza por Al.
SELECT NOMEMP	
FROM EMPLEADOS
WHERE (NOMEMP LIKE 'Al%')
ORDER BY 1;

-- S. Obtener los nombres de los empleados cuyo nombre de pila empieza por L.
SELECT NOMEMP
FROM EMPLEADOS
WHERE (NOMEMP LIKE '%, L%')

-- T. Obtener por orden alfabético los nombres de empleados que tengan un primer
-- apellido de siete letras.
SELECT NOMEMP
FROM EMPLEADOS
WHERE (NOMEMP LIKE '_______ %')
ORDER BY 1;

-- U. Obtener por orden alfabético los nombres de empleados que tengan algún
-- apellido de seis o más letras.
SELECT NOMEMP
FROM EMPLEADOS
WHERE ((NOMEMP LIKE ('______%')) OR (NOMEMP LIKE ('% ______%')))
ORDER BY 1;

-- V. Obtener por orden alfabético los nombres de empleados cuyo segundo apellido
-- tenga cuatro letras o menos.
SELECT NOMEMP
FROM EMPLEADOS
WHERE (NOMEMP LIKE '')

-- W. Obtener por orden alfabético los nombres de empleados cuyo nombre de pila
-- termina en 'o'.
SELECT NOMEMP
FROM EMPLEADOS
WHERE (NOMEMP LIKE '%o')
ORDER BY 1;

-- X. Obtener los nombres, salarios y fechas de ingreso de los empleados que, o bien
-- ingresaron después del 1 de Enero de 1988, o bien tienen un salario inferior a
-- 1500€. Clasificarlos por fecha y nombre.
SELECT NOMEMP, SALARIO, FECHAING
FROM EMPLEADOS
WHERE (FECHAING > '01/01/1988') OR (SALARIO < 1500);

-- Y. Obtener por orden alfabético los nombres de los departamentos que no sean
-- de Dirección ni de Sectores.
SELECT NOMDEP
FROM DEPARTAMENTOS
WHERE (TIPODIR NOT LIKE 'DIRECCION%') OR (TIPODIR NOT LIKE 'SECTOR%')
ORDER BY 1;
