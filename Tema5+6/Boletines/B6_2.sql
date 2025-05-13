-- 1. Crea una tabla TABLA_NUMEROS con un campo VALOR de tipo NUMBER(2), en el
--    esquema del usuario EMPRESA.
--    A continuación, crea un bloque PL/SQL que inserte los números del 1 al 50 en la
--    tabla creada previamente, utilizando un bucle.
CREATE TABLE TABLA_NUMEROS (
    VALOR NUMBER(2)
)

BEGIN 
    FOR i IN 1..50 LOOP
        INSERT INTO TABLA_NUMEROS VALUES(i); 
    END LOOP;
    COMMIT;
END;

SELECT * FROM TABLA_NUMEROS;

-- 2. Borra el contenido de la tabla TABLA_NUMEROS utilizando la sentencia DELETE. A
--    continuación, crea un bloque PL/SQL que inserte 8 elementos en la tabla con
--    valores del 1 al 10, excepto el 4 y el 5.
DELETE FROM TABLA_NUMEROS;

BEGIN 
    FOR i IN 1..10 LOOP 
        IF NOT(i = 4 OR i = 5) THEN 
            INSERT INTO TABLA_NUMEROS VALUES(i);
        END IF;
    END LOOP;
    COMMIT;
END;

-- 3.
CREATE TABLE TABLA_ARTICULOS (
    CODIGO VARCHAR2(20),
    NOMBRE VARCHAR2(30),
    PRECIO NUMBER(5, 2),
    IVA NUMBER(5, 2)
)

INSERT INTO TABLA_ARTICULOS VALUES ('A001', 'LAPIZ', 13, 8);
INSERT INTO TABLA_ARTICULOS VALUES ('A002', 'BOLIGRAFO', 20, 8);
INSERT INTO TABLA_ARTICULOS VALUES ('A003', 'LIBRETA', 5, 8);
INSERT INTO TABLA_ARTICULOS VALUES ('A004', 'PLUMA', 63, 17);
INSERT INTO TABLA_ARTICULOS VALUES ('A005', 'SACAPUNTAS', 5, 17);

-- A). Construye un bloque PL/SQL que compruebe si el precio con IVA del artículo
--     cuyo código es 'A001' es mayor de 10 euros y en caso afirmativo imprima el
--     nombre y el precio del artículo por pantalla. Si es menor de 10€ imprimirá un
--     mensaje indicándolo. Si no existe el artículo imprimirá también un mensaje
--     indicándolo.

DECLARE 
    vNom TABLA_ARTICULOS.NOMBRE % TYPE;
    vPrecio TABLA_ARTICULOS.PRECIO % TYPE;
    vPVP NUMBER(8, 2);
BEGIN
    SELECT PRECIO + IVA, NOMBRE, PRECIO 
    INTO vPVP, vNom, vPrecio
    FROM TABLA_ARTICULOS
    WHERE CODIGO = 'A001';
    
    IF (vPVP >= 10) THEN 
        DBMS_OUTPUT.put_line('El articulo ' || vNom || ' tiene un precio de ' || vPrecio); 
    ELSIF (vPVP < 10) THEN 
        DBMS_OUTPUT.put_line('Precio es menor que 10');
    ELSE 
        DBMS_OUTPUT.put_line('No existe');
    END IF;
END;

-- B). Construye un bloque que seleccione el artículo de mayor precio que estés
--    almacenado en la tabla, guarde su nombre en una variable y luego lo muestre.

DECLARE 
    vNom TABLA_ARTICULOS.NOMBRE % TYPE;
    vAux TABLA_ARTICULOS.PRECIO % TYPE := 0;
BEGIN
    FOR i IN (SELECT PRECIO, NOMBRE FROM TABLA_ARTICULOS) LOOP 
        IF PRECIO > vAux THEN
            vAux := PRECIO;
            vNom := NOMBRE;
        END IF;
    END LOOP; 
    DBMS_OUTPUT.put_line('El objeto con nombre "' || vNom || '" tiene el mayor precio con valor de ' || vAux || '.');
END;

SELECT MAX(PRECIO)