DROP TABLE ALUNO
CREATE TABLE ALUNO(
    RA INT PRIMARY KEY,
    NOME VARCHAR2(50)
)

---- INSERT

DECLARE
    V_RA INT := 2254;
    V_NOME VARCHAR2(50) := 'Joao Lima';
BEGIN
    INSERT INTO ALUNO (RA,NOME) VALUES (V_RA,V_NOME);
END;

--- SELECT

SELECT * FROM ALUNO;

---- UPDATE

DECLARE
	V_RA INT := 2254;
	V_NOME VARCHAR2(50) := 'Lucas Lima';
BEGIN
	UPDATE ALUNO SET NOME=V_NOME WHERE RA=V_RA;
END;

---- DELETE 

DECLARE
	V_RA INT:= 2254;
	V_NOME VARCHAR2(50) := 'Lucas Lima';
BEGIN
	DELETE FROM ALUNO WHERE RA=V_RA;
END;

--- SELECT

SET SERVEROUTPUT ON;
DECLARE
	V_RA INT := 2254;
	V_NOME VARCHAR2(50);
BEGIN
	SELECT NOME INTO V_NOME FROM ALUNO WHERE RA=V_RA;
	DBMS_OUTPUT.PUT_LINE('o nome do aluno é : ' ||V_NOME);
END;



