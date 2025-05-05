CREATE FUNCTION PonderacionNota(vNota NUMBER)
    RETURN NUMBER AS vPond NUMBER(5,2);
BEGIN 
    vPond := vNota * 0.6;
    RETURN vPond;
END;