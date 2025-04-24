 CREATE TABLE Temporal(
    codNum NUMBER(2)
 );

DECLARE
    vCont NUMBER(2) := 1;
BEGIN
    LOOP 
        INSERT INTO Temporal VALUES(vCont);
        vCont := vCont + 1;
        EXIT WHEN vCont > 10;
    END LOOP;    
END;

SELECT * FROM Temporal;