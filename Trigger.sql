CREATE TABLE PEDIDO_NOVOS AS
    SELECT
        *
    FROM
        PEDIDO;

ALTER TABLE PEDIDO_NOVOS
    ADD STATUS VARCHAR2(
        30
    );

SELECT
    *
FROM
    PEDIDO_NOVOS;

---

DECLARE
    V_NUM_PEDIDO INT := 120;
    V_PR_ENTREGA INT := 20;
    V_COD_CLIE   INT := 830;
    V_COD_VEN    INT :=250;
BEGIN
    INSERT INTO PEDIDO_NOVOS (
        NUM_PEDIDO,
        PR_ENTREGA,
        COD_CLIE,
        COD_VEN
    ) VALUES (
        V_NUM_PEDIDO,
        V_PR_ENTREGA,
        V_COD_CLIE,
        V_COD_VEN
    );
END;
 

----
CREATE OR REPLACE TRIGGER PEDIDO BEFORE INSERT ON PEDIDO_NOVOS FOR EACH ROW BEGIN IF :NEW.STATUS IS NULL THEN :NEW.STATUS := 'Novo Pedido';
END IF;
END;
 
----
CREATE TABLE TB_AUDITORIA ( ID NUMBER GENERATED ALWAYS AS IDENTITY, TABELA VARCHAR2(30), OPERACAO VARCHAR2(30), DATA DATE, USUARIO VARCHAR2(30) )
 ---
CREATE OR REPLACE TRIGGER TRG_AUDITORIA AFTER INSERT OR UPDATE OR DELETE ON PEDIDO_NOVOS FOR EACH ROW DECLARE OPERACAO VARCHAR2(
    30
);
NOME_USUARIO VARCHAR2(100);
BEGIN
 
    -- DETERMINA A OPERACAO REALIZADA (INSERT, UPDDATE, DELETE)
    IF INSERTING THEN
        OPERACAO := 'INSERT';
    ELSIF UPDATING THEN
        OPERACAO := 'UPDATE';
    ELSIF DELETING THEN
        OPERACAO := 'DELETE';
    END IF;
 

    -- Obetem o nome de usuario da sessao atual
    NOME_USUARIO := SYS_CONTEXT('USERENV', 'SESSION_USER');
 
    -- REGISTRA a auditoria na tabela de trg_auditoria
    INSERT INTO TB_AUDITORIA (
        TABELA,
        OPERACAO,
        DATA,
        USUARIO
    ) VALUES (
        'PEDIDO_NOVOS',
        OPERACAO,
        SYSDATE,
        NOME_USUARIO
    );
END;