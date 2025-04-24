DECLARE vDato NUMBER(2);

vFechaNac DATE;

BEGIN vDato := &vDato;

vFechaNac := &vFechaNac;

DBMS_OUTPUT.put_line ('Valor de la variable: ' || vDato);

DBMS_OUTPUT.put_line ('Fecha de nacimiento: ' || vFechaNac);

END;