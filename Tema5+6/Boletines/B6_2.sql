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