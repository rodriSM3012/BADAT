DECLARE 

vDir DEPARTAMENTOS.DIRECTOR % type;
vComentario VARCHAR2(50);
vOpcion CHAR := 'A';

BEGIN
SELECT
    DIRECTOR INTO vDir
FROM
    DEPARTAMENTOS
WHERE
    NOMDEP = 'FINANZAS';

DBMS_OUTPUT.put_line ('Código del director: ' || vDir);

-- ejemplo IF
IF vDir > 400 THEN vComentario := 'Fuera de rango.';
ELSIF vDir < 50 THEN vComentario := 'No asignado.';
ELSE vComentario := 'Codigos asignados';
END IF;

DBMS_OUTPUT.put_line (
    'El registro del director ha resultado: ' || vComentario
);

-- ejemplo CASE
CASE
    WHEN vDir = 310 THEN vComentario := 'Director de finanzas';
    WHEN vDir = 260 THEN vComentario := 'Director general';
    WHEN (vDir > 400 AND vDir < 50) THEN vComentario := 'No asignado';
    ELSE vComentario := 'Error';
END CASE;
DBMS_OUTPUT.put_line ('Resultado del filtrado: ' || vComentario);

CASE vOpcion
    WHEN 'A' THEN vComentario := 'Excelente';
    WHEN 'B' THEN vComentario := 'Muy bien';
    WHEN 'C' THEN vComentario := 'Bien';
    ELSE vComentario := 'No existe ese grado';
END CASE;
DBMS_OUTPUT.put_line ('Resultado del filtrado: ' || vComentario);

END;