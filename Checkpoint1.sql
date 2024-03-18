SET SERVEROUTPUT ON;
DECLARE

    salario_inicial number(10,2) := (&DIGITE_SALARIO);
    salario_liquido number(10,2);

BEGIN
    if salario_inicial <= 1514.69 THEN
        DBMS_OUTPUT.PUT_LINE('Nao ha desconto do imposto de Renda, Salario total: '||salario_inicial);
    ELSIF salario_inicial > 1514.69 or salario_inicial < 2725.12 THEN
        salario_liquido := salario_inicial * 0.16;
        salario_liquido := salario_inicial - salario_liquido;
        DBMS_OUTPUT.PUT_LINE(' O SALARIO final fica de: ' ||salario_liquido);
    ElSIF salario_inicial > 2725.12 THEN 
        salario_liquido :=  salario_inicial *0.28;
        salario_liquido := salario_inicial - salario_liquido; 
        DBMS_OUTPUT.PUT_LINE('O salario reajustado e de: '|| salario_liquido);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Digite um numero');
    end if;
end;

--------


DROP TABLE ALUNO;
CREATE TABLE ALUNO(
    RM NUMBER(10),
    NOME VARCHAR2(50),
    NOTA NUMBER(2),
    MEDIA NUMBER(2,2),
    SITUACAO VARCHAR(50),
    CONSTRAINT ALUNO_PK PRIMARY KEY (RM)
);

INSERT INTO ALUNO(RM,NOME,NOTA) VALUES (11, 'Henrique', 3);
INSERT INTO ALUNO(RM,NOME,NOTA) VALUES (12, 'Gustavo', 10);
INSERT INTO ALUNO(RM,NOME,NOTA) VALUES (10, 'Vinicius', 9);

SELECT * FROM ALUNO;

-- MEDIA = SOMA DE N / N 
SET SERVEROUTPUT ON;
DECLARE
    V_RM NUMBER(2):= &DIGITE_O_RM;
    V_NOTA NUMBER(2);
    A_SITUACAO VARCHAR2(50):='Aprovado';
    R_SITUACAO VARCHAR2(50):='Reprovado'; 
BEGIN
    Select NOTA INTO V_NOTA FROM ALUNO WHERE RM LIKE V_RM;
    if V_NOTA > 6 THEN
        UPDATE ALUNO SET SITUACAO = A_SITUACAO WHERE RM = V_RM;
    ELSIF V_NOTA < 6 or V_NOTA = 6 THEN
        UPDATE ALUNO SET SITUACAO = R_SITUACAO WHERE RM = V_RM;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Coloque um RM Existente');
    END IF;
end;

SELECT * FROM ALUNO;

-- Henrique Oliveira Baptista
-- RM 97796
