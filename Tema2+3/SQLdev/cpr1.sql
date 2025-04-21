CREATE TABLE Clientes
(
    codigo number (3),
    nombre varchar(20),
    apellidos varchar(20),
    constraint pk_cli primary key (codigo)
);

CREATE TABLE Articulos
(
    codigo number (5),
    nombre varchar(20),
    seccion varchar(20),
    precio decimal(6, 2),
    constraint pk_art primary key (codigo)
);

CREATE TABLE Ventas
(
    codigo_C number (3),
    codigo_A number (5),
    cantidad number (2),
    pvp decimal(6, 2),
    comision decimal(6, 2),
    constraint pk_ven primary key (codigo_C, codigo_A),
    constraint pk_CliVen foreign key (codigo_C) references Clientes (codigo),
    constraint fk_CliArt foreign key (codigo_A) references Articulos (codigo)
);

INSERT INTO
    Clientes
    (codigo, nombre, apellidos)
VALUES
    (1, 'Ana', 'Arias Lopez'),
    (2, 'Juan', 'Diaz Diaz'),
    (3, 'Javier', 'Diaz Suarez');

INSERT INTO
    Articulos
VALUES
    (1, 'Folios', 'Papelería', 3.50),
    (2, 'Libretas', 'Papelería', 1.75),
    (3, 'Ratón', 'Informática', 5.60);

INSERT INTO
    Ventas
VALUES
    (1, 1, 2, 9, 1),
    (1, 2, 5, 10.75, 2);

INSERT INTO
    Ventas
    (codigo_C, codigo_A, cantidad, pvp)
VALUES
    (2, 3, 2, 13.20),
    (2, 2, 1, 3.75);

SELECT
    *
FROM
    Clientes;

SELECT
    *
FROM
    Articulos;

SELECT *
FROM Ventas;

-- mostrar nombres, apellidos y precios de ventas que superen 10€
SELECT
    Clientes.nombre,
    Clientes.apellidos,
    Ventas.pvp
FROM
    Clientes,
    Ventas
WHERE
    Clientes.codigo = Ventas.codigo_C
    AND pvp > 10;

-- ordena alfabeticamente o de menor a mayor
SELECT
    Clientes.nombre,
    Clientes.apellidos
FROM
    Clientes
ORDER BY
    -- poner DESC despues de 'apellidos' para invertir el orden
    -- 'nombre' sirve para usarlo para ordenar solo si hay una igualdad en el apellido
    apellidos,
    nombre;

-- Esta consulta SQL cuenta el número de registros en la tabla 'Ventas' donde el campo 'comision' es NULL.
-- Utiliza la función COUNT para contar las filas que cumplen con la condición especificada en la cláusula WHERE.
SELECT
    COUNT(comision)
FROM
    Ventas
WHERE
    -- IS NOT NULL para lo contrario
    comision IS NULL;

-- nombres de clientes que hayan comprado folios o libretas
SELECT
    Clientes.nombre
FROM
    Clientes,
    Articulos,
    Ventas
WHERE
    (Clientes.codigo = Ventas.codigo_C)
    AND (Articulos.codigo = Ventas.codigo_A)
    AND (Articulos.nombre IN ('Folios', 'Libretas'));

-- mostrar nombre de clientes con ciudad Gijon/Aviles
SELECT
    nombre
FROM
    Clientes
WHERE
    (ciudad in ('GIJON', 'AVILES'));

-- mostrar nombre y apellidos de los clientes ordenados alfabeticamente por el nombre y en caso de igualdad por los apellidos
SELECT
    nombre,
    apellidos
FROM
    Clientes
ORDER BY
    1 DESC,
    2 DESC;

-- mostrar nombre y apellidos de los clientes cuyo nombre empieza por 'l'
SELECT
    nombre,
    apellidos
FROM
    Clientes
WHERE
    (nombre LIKE 'L%');

-- mostrar nombre y apellidos de los clientes cuyo segundo apellido sea 'López'
SELECT
    nombre,
    apellidos
FROM
    Clientes
WHERE
    (apellidos LIKE '%López');

-- mostrar nombre y apellidos de los clientes cuyo nombre empiece y termina por 'a'
SELECT
    nombre,
    apellidos
FROM
    Clientes
WHERE
    (nombre LIKE 'A%a');

-- mostrar nombre y apellidos de los clientes cuyo nombre empiece y termina por 'a' y sea de 3 caracteres
SELECT
    nombre,
    apellidos
FROM
    Clientes
WHERE
    (nombre LIKE 'A_a');

-- mostrar nombre y apellidos de los clientes cuyo nombre tenga mas de 5 caracteres
SELECT
    nombre,
    apellidos
FROM
    Clientes
WHERE
    LENGTH (nombre) > 5;

-- suma de los precios de los articulos por departamento
SELECT
    SUM(precio),
    seccion
--sum , avg, max, min
FROM
    Articulos
GROUP BY
    seccion;

-- mostrar precios de los articulos incrementados en un 5%
SELECT
    precio * 1.05 AS precio
FROM
    Articulos;

-- calcular media precio de los articulos
SELECT
    AVG(precio) AS media
FROM
    Articulos;

-- calcular media precio de los articulos de papelelria
SELECT
    AVG(precio) AS media
FROM
    Articulos
WHERE
    (seccion = 'Papelería');

-- articulo mas caro
SELECT
    max(precio) "Articulo mas caro"
FROM
    Articulos;

-- articulo mas barato
SELECT
    min(precio) "Articulo mas barato"
FROM
    Articulos;

-- pruebas
SELECT
    ROUND(12.5874, 2)
-- redondear   
FROM
    dual;

SELECT
    TRUNC (127.4567, 2)
-- truncar
FROM
    dual;

SELECT
    CEIL(17.4)
FROM
    dual;

SELECT
    ABS(-17)
-- valor absoluto
FROM
    dual;

SELECT
    SIGN (17)
FROM
    DUAL;

-- -------------------
-- FUNCIONES DE CADENA
-- -------------------
-- concatenar
SELECT
    CONCAT ('Buenos', 'días') AS "Saludo"
FROM
    DUAL;

-- todo a mayusculas (lower para minusculas)
SELECT
    UPPER(nombre)
FROM
    Clientes;

-- poner inicial en mayusc
SELECT
    INITCAP ('hola') AS "initMayus"
FROM
    DUAL;

-- separa una cadena y rellena por la izq con * tantas posiciones como se indique
SELECT
    LPAD ('M', 5, '*') AS "tapado"
FROM
    DUAL;

-- reemplazar
SELECT
    REPLACE ('corro@gmail.es', 'es', 'com')
FROM
    DUAL;

-- sacar trozo de una cadena
SELECT
    SUBSTR ('1234567', 3, 4)
-- ❗ el puntero empieza en 1 no en 0
FROM
    DUAL;

-- indica posicion donde se encuentra el caracter indicado
SELECT
    INSTR ('usuarios', 'u')
-- no match = 0
FROM
    DUAL;

-- ------------------
-- FUNCIONES DE FECHA
-- ------------------
-- sacar fecha del sistema
SELECT
    SYSDATE
FROM
    DUAL;

-- añade a la fecga el numero de meses indicado
SELECT
    ADD_MONTHS ('24/02/25', 2)
FROM
    DUAL;

--visualiza el numero de meses entre 2 fechas
SELECT
    ABS(MONTHS_BETWEEN ('24/02/25', '24/12/25'))
-- ABS porque puede salir negativo
FROM
    DUAL;

-- ver ultimo dia del mes al que pretenece una fecha
SELECT
    LAST_DAY ('24/02/25')
FROM
    DUAL;

-- extraer dia/mes/año de una fecha
SELECT
    EXTRACT(
        MONTH -- DAY/MOTNH/YEAR
        FROM
            SYSDATE
    )
FROM
    DUAL;

-- mostrar nombres articulos cuyo importe este comprendido entre 3 y 10€
SELECT nombre
FROM Articulos
WHERE (precio BETWEEN 3 AND 10);
-- WHERE (precio > 3) AND (precio < 10);

-- media del precio y de los articulos
SELECT AVG (precio) AS media
FROM Articulos;

-- mostrar los precios con una subida del 25% redondeada con 2 decimales y 
-- solo de los articulos que sean de la seccion de papeleria
SELECT ROUND(precio * 1.25, 2) "Precio +25%"
FROM Articulos
WHERE (seccion LIKE 'Papelería');