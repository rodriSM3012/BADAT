-- 1. mostrar numero de departamentos en la bbdd
DECLARE
    vNum NUMBER(2);
BEGIN
    SELECT COUNT (*) INTO vNum FROM DEPARTAMENTOS;
    DBMS_OUTPUT.put_line ('Resultado: ' || vNum);
END;

-- 2. 
DECLARE
    Num1 NUMBER (8,2) := 0;
    Num2 NUMBER (8,2) NOT NULL DEFAULT 0;
    Num3 NUMBER (8,2) NOT NULL;
    Precio, Descuento NUMBER (6) ;
    -- Num4 Num1%ROWTYPE;
    Dto CONSTANT NUMBER (4, 2) ;


-- 3. Escribir un bloque que reciba dos números de dos cifras a través de 
--    parámetros de sustitución y visualice en pantalla su suma.
DECLARE
    vNum1 NUMBER(2);
    vNum2 NUMBER(2);
BEGIN
    vNum1 := &vNum1;
    vNum2 := &vNum2;
    DBMS_OUTPUT.put_line (vNum1 || ' + ' || vNum2 || ' = ' || (vNum1 + vNum2));
END;

-- 4. Escribir un bloque que lea una fecha en formato dd/mm/yy y visualice 
--    el mes en letra correspondiente a esa fecha. TOCHAR()
/*
DECLARE
    vNumMonth NUMBER(2);
    vDate DATE := TO_DATE('&vDate', 'DD/MM/YY');
    vNumMonth := TO_NUMBER(TO_CHAR(vDate, 'MM'));
    vMonth VARCHAR2(20);
BEGIN
    CASE 
        WHEN vNumMonth = 1 THEN vMonth := 'enero';
        WHEN vNumMonth = 2 THEN vMonth := 'febrero';
        WHEN vNumMonth = 3 THEN vMonth := 'marzo';
        WHEN vNumMonth = 4 THEN vMonth := 'abril';
        WHEN vNumMonth = 5 THEN vMonth := 'mayo';
        WHEN vNumMonth = 6 THEN vMonth := 'junio';
        WHEN vNumMonth = 7 THEN vMonth := 'julio';
        WHEN vNumMonth = 8 THEN vMonth := 'agosto';
        WHEN vNumMonth = 9 THEN vMonth := 'septiembre';
        WHEN vNumMonth = 10 THEN vMonth := 'octubre';
        WHEN vNumMonth = 11 THEN vMonth := 'noviembre';
        WHEN vNumMonth = 12 THEN vMonth := 'diciembre';
        ELSE vMonth := 'ERROR';
    END CASE;
    DBMS_OUTPUT.put_line('El mes es: ' || vMonth);
END;
*/

DECLARE 
    vFecha DATE;
    vMes VARCHAR2 (20);
BEGIN 
    vFecha := '&vFecha'; -- leer por teclado
    vMes := TO_CHAR(vFecha, 'Month'); -- guardar
    DBMS_OUTPUT.put_line('Fecha: ' || vDate); -- imprimir
END;


-- 5. Escribir un bloque que visualice el númeri de trienios completos 
--    que hay entre dos fechas que se introducirán como parámetros 
--    de sustitución
DECLARE 
    vFecha DATE;
    vFecha2 DATE;
    vYear NUMBER(3);
    vTrienio NUMBER(3);

BEGIN 
    vFecha := '&vFecha';
    vFecha2 := '&vFecha2';
    vYear := TRUNC (ABS (MONTHS_BETWEEN (vFecha, vFecha2)/12));
    vTrienio := vYear / 3;

    DBMS_OUTPUT.put_line('Han pasado ' || vTrienio || ' entre ');
END;

-- 6. Escribir un bloque que reciba una cadena y la visualice al revés. 
--    Puedes usar la función SUBSTR para ir extrayendo carácter a carácter.
DECLARE 
    vCadOriginal VARCHAR2(20);
    vCadInv VARCHAR2(20);
BEGIN 
    vCadOriginal := '&vCadOriginal';
    
    FOR i IN REVERSE 1..length (vCadOriginal) LOOP 
        vCadInv := vCadInv || SUBSTR(vCadOriginal, i, 1); -- SUBSTR([cadena], [posicion], [cantidad])
    END LOOP;

    DBMS_OUTPUT.put_line('Cadena original: ' || vCadOriginal);
    DBMS_OUTPUT.put_line('Cadena invertida: ' || vCadInv);
END;

-- 7. Escribir un bloque que modifique el presupuesto de un departamento. Se leerán
--    como parámetros de sustitución el número de departamento y el nuevo
--    presupuesto. Si el departamento no existe se mostrará un mensaje indicándolo.
DECLARE
    vNumDep CreaEpsa.DEPARTAMENTOS.NUMDEP % TYPE;
    vNuevoPres CreaEpsa.DEPARTAMENTOS.PRESUP % TYPE;
    vCont NUMBER(4);
    vComentario VARCHAR2(40);
BEGIN 
    -- no hay que poner '' porque son numeros ↓↓↓
    vNumDep := &vNumDep;
    vNuevoPres := &vNuevoPres;

    SELECT COUNT(*) 
    INTO vCont
    FROM DEPARTAMENTOS
    WHERE NUMDEP = vNumDep;

    IF vCont = 0 THEN vComentario := ('No hay departamentos con el número ' || vNumDep ||'.');
    ELSE
        UPDATE DEPARTAMENTOS
        SET PRESUP := vNuevoPres
        WHERE NUMDEP = vNumDep;

        vComentario := 'Presupuesto actualizado.';
    END IF;

    DBMS_OUTPUT.put_line(vComentario);
END;
