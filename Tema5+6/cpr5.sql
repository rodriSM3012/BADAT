DECLARE
    vCont NUMBER(2) := 1;

BEGIN
    WHILE vCont <= 11 LOOP 
        INSERT INTO TEMPORAL VALUES (vCont);    
        -- carga el numero en la tabla de temporal
        vCont := vCont + 1;
    END LOOP;
END;

SELECT * FROM TEMPORAL;