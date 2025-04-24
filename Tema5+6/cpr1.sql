-- sql dev → ver → salida DBMS
-- panel de abajo dar al +🟩  y poner la conexion
-- bloque basico que siempre hace falta (como el public class noseke de java):
-- DECLARE es opcional y hace falta cuando haya que declarar variables, cursores o excepciones
DECLARE
-- las variables suelen empezar por v
-- el numero es la cantidad de digitos maxima
vNum NUMBER(2);

-- := para asignar valor / = para comparar valores
vCiudad VARCHAR2(15) := 'Gijón';

-- si se pone NOT NULL hay que inicializar siempre con :=
vComision NUMBER(7, 2) NOT NULL := 0;

vEstado BOOLEAN := true;

vIVA NUMBER(5, 2) DEFAULT 8;

vDimension CONSTANT NUMBER(3) := 100;

-- tipos de variables
-- cadenas de caracteres de longitud fija
-- CHAR();
-- caracter individual
-- CHAR;
-- cadenas de longitud variable
-- VARCHAR2();
--
-- BOOLEAN;
-- DATE; (dd-mm-yyyy)
--
-- NUMBER(p,e);
-- PLS_INTEGER;  +rapido, lanza excepcion si excede el rango
-- BINARY_INTEGER;      
-- BEGIN obligatorio
BEGIN
--EXCEPTION -- opcional
-- en pl/sql no se pueden modificar las tablas, hay que volcarlo en una variable y operar con ella, por eso el INTO
SELECT
    COUNT(*) INTO vNum
FROM
    OFICINAS;

DBMS_OUTPUT.put_line ('Resultado: ' || vNum);

END;