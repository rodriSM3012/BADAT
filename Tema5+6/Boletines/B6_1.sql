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

