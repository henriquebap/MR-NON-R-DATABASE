drop TABLE ALUNO;

Create table ALUNO(
    RM NUMBER (10),
    Nome VARCHAR2(50),
    CONSTRAINT ALUNO_PK PRIMARY KEY(RM)
);

Insert into ALUNO (RM, Nome) VALUES (11, 'Henrique');

Insert into ALUNO (RM, Nome) VALUES (22, 'Gabriel');

Insert into ALUNO (RM, Nome) VALUES (33, 'Pedro');
---
SELECT * FROM ALUNO;
---
update ALUNO
set Nome = 'Henrique Baptista'
where RM = 11;

--

Insert into aluno (RM, Nome) VALUES (444444, 'Jose')

--

DELETE FROM ALUNO where RM = 33;

---

SELECT * FROM ALUNO;


SET SERVEROUTPUT ON
DECLARE
    V_RM NUMBER(10) := 11;
    V_NOME VARCHAR2(50);
BEGIN
    SELECT Nome
        INTO V_NOME
        FROM ALUNO
    WHERE RM = V_RM;

    DBMS_OUTPUT.PUT_LINE('O Nome do aluno com rm: ' || V_RM || ' é: ' ||V_NOME);
    

END;


SET SERVEROUTPUT ON
DECLARE
    V_RM NUMBER(10) := 56;
    V_NOME VARCHAR2(50) := 'Ricardo';
BEGIN

INSERT INTO ALUNO(RM,Nome) VALUES (V_RM, V_NOME);

    DBMS_OUTPUT.PUT_LINE('O Aluno com rm: ' || V_RM || ' é: ' ||V_NOME|| ' Incluindo com sucesso.');
    
    COMMIT;


END;

SELECT * FROM ALUNO;

SET SERVEROUTPUT ON
DECLARE
    V_RM NUMBER(10) := 56;
    V_NOME VARCHAR2(50) := 'Ricardo';
BEGIN

UPDATE ALUNO
    SET Nome = 'Alex'
    Where RM = V_RM;

    DBMS_OUTPUT.PUT_LINE('O Aluno com rm: ' || V_RM || ' Com o nome:  ' ||V_NOME|| 'Foi alterado com sucesso');
    
    COMMIT;


END;



SET SERVEROUTPUT ON
DECLARE
    V_RM NUMBER(10) := 56;
BEGIN

DELETE FROM ALUNO WHERE RM = V_RM;

    DBMS_OUTPUT.PUT_LINE('O Aluno com rm: ' || V_RM || ' Deletado com sucesso.');
    
    COMMIT;


END;



SET SERVEROUTPUT ON
DECLARE
    
    V_NUMERO NUMBER(3) := 1;
    V_FIM V_NUMERO%TYPE := &DIGITE_UM_NUMERO;
    
BEGIN

    LOOP
        --iNSTRUCOES
        DBMS_OUTPUT.PUT_LINE(V_NUMERO);
        V_NUMERO := V_NUMERO + 1;
    Exit WHEN (V_NUMERO > V_FIM);
    END LOOP;

END;


SET SERVEROUTPUT ON
DECLARE
    
    V_NUMERO NUMBER(4) := 1;
    V_NOME VARCHAR2(50);
    
BEGIN
    SELECT Nome INTO V_NOME FROM ALUNO WHERE RM LIKE V_NUMERO || '%';

    LOOP
        --iNSTRUCOES
        DBMS_OUTPUT.PUT_LINE(V_NOME);
        V_NUMERO := V_NUMERO +1;
    Exit WHEN (V_NUMERO > 4);
    END LOOP;

END;
