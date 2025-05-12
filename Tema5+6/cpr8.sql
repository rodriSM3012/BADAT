-- hacer una funcion a la que hay que pasar un precio y un iva y que nos calcules el pvp
CREATE FUNCTION PVP (vPrecio, vIVA NUMBER) -- cf tab
    RETURN NUMBER AS
        vPVP NUMBER(8, 2);

    BEGIN
        vPVP := vPrecio + (vPrecio * vIVA / 100);
        RETURN vPVP;
    END; 

-- ejemplo uso funcion
DECLARE
    vPrecio NUMER;
    vIVA NUMBER;
BEGIN 
    vPrecio := &vPrecio;
    vIVA := &vIVA;
    DBMS_OUTPUT.put_line('PVP = ' || PVP (vPrecio, vIVA));
END;