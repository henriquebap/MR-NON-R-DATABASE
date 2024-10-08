CREATE TABLE TABELA_VENDAS (
    ID NUMBER,
    CLIENTE NUMBER,
    ENDERECO VARCHAR2(30)
)
    SELECT
        *
    FROM
        TABELA_VENDAS CREATE
        OR REPLACE PACKAGE PKG_EXEMPLO AS V_COUNT NUMBER :=0;

--variavel publica
FUNCTION FUN_VALIDA_NOME2(p_nome IN VARCHAR2) RETURN BOOLEAN; --Funcao publica

CURSOR cursos_vendas_publi IS select * from tabela_vendas; --cursor publico

PROCEDURE PRC_INSERE_PRODUTOS_NOVOS; --procedire sem parametros

PROCEDURE PRC_INSERE_PEDIDO (P_COD_PEDIDO PEDIDO.COD_PEDIDO%TYPE,
P_COD_PEDIDO_RELACIONADO PEDIDO.COD_PEDIDO%TYPE,
P_COD_PEDIDO_RELACIONADO PEDIDO.COD_PEDIDO%TYPE,
P_COD_CLIENTE PEDIDO.COD_CLIENTE%TYPE,
P_COD_USUARIO PEDIDO.COD_USUARIO%TYPE,
P_COD_VENDEDOR PEDIDO.COD_VENDEDOR%TYPE,
P_DAT_PEDIDO PEDIDO.DAT_PEDIDO%TYPE,
P_DAT_CANCELAMENTO PEDIDO.DAT_CANCELAMENTO%TYPE,
P_DAT_ENTREGA PEDIDO.DAT_ENTREGA%TYPE,
P_VAL_TOTAL_PEDIDO PEDIDO.VAL_TOTAL_PEDIDO%TYPE,
P_VAL_DESCONTO PEDIDO.VAL_DESCONTO%TYPE,

P_SEQ_ENDERECO_CLIENTE   PEDIDO.SEQ_ENDERECO_CLIENTE%TYPE);  -- procedimento publico

END PKG_EXEMPLO;

CREATE OR REPLACE PACKAGE BODY PKG_EXEMPLO AS
    CURSOR CURSOR_VENDAS IS
    SELECT
        *
    FROM
        TABELA_VENDAS; -- cursor privado
    FUNCTION FUN_VALIDA_NOME2(
        P_NOME IN VARCHAR2
    ) RETURN BOOLEAN IS
    BEGIN
        IF LENGTH(P_NOME) > 3 AND NOT REGEXP_LIKE(P_NOME, '[0-9]') THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END FUN_VALIDA_NOME2;

    PROCEDURE PRC_INSERE_PRODUTOS_NOVOS AS
    BEGIN
        FOR X IN CURSOR_VENDAS LOOP
            INSERT INTO PRODUTOS_NOVOS (
                ORDERNUMBER,
                QUANTITYORDERED,
                PRICEEACH,
                ORDERLINENUMBER,
                SALES,
                ORDERDATE,
                STATUS,
                QTR_ID,
                MONTH_ID,
                YEAR_ID,
                PRODUCTLINE,
                MSRP,
                PRODUCTCODE,
                CUSTOMERNAME,
                PHONE,
                ADDRESSLINE1,
                ADDRESSLINE2,
                CITY,
                STATE,
                POSTALCODE,
                COUNTRY,
                TERRITORY,
                CONTACTLASTNAME,
                CONTACTFIRSTNAME,
                DEALSIZE
            ) VALUES (
                X.ORDERNUMBER,
                X.QUANTITYORDERED,
                X.PRICEEACH,
                X.ORDERLINENUMBER,
                X.SALES,
                X.ORDERDATE,
                X.STATUS,
                X.QTR_ID,
                X.MONTH_ID,
                X.YEAR_ID,
                X.PRODUCTLINE,
                X.MSRP,
                X.PRODUCTCODE,
                X.CUSTOMERNAME,
                X.PHONE,
                X.ADDRESSLINE1,
                X.ADDRESSLINE2,
                X.CITY,
                X.STATE,
                X.POSTALCODE,
                X.COUNTRY,
                X.TERRITORY,
                X.CONTACTLASTNAME,
                X.CONTACTFIRSTNAME,
                X.DEALSIZE
            );
            COMMIT;
        END LOOP;
    END PRC_INSERE_PRODUTOS_NOVOS;

    PROCEDURE PRC_INSERE_PEDIDO(
        P_COD_PEDIDO PEDIDO.COD_PEDIDO%TYPE,
        P_COD_PEDIDO_RELACIONADO PEDIDO.COD_PEDIDO%TYPE,
        P_COD_CLIENTE PEDIDO.COD_CLIENTE%TYPE,
        P_COD_USUARIO PEDIDO.COD_USUARIO%TYPE,
        P_COD_VENDEDOR PEDIDO.COD_VENDEDOR%TYPE,
        P_DAT_PEDIDO PEDIDO.DAT_PEDIDO%TYPE,
        P_DAT_CANCELAMENTO PEDIDO.DAT_CANCELAMENTO%TYPE,
        P_DAT_ENTREGA PEDIDO.DAT_ENTREGA%TYPE,
        P_VAL_TOTAL_PEDIDO PEDIDO.VAL_TOTAL_PEDIDO%TYPE,
        P_VAL_DESCONTO PEDIDO.VAL_DESCONTO%TYPE,
        P_SEQ_ENDERECO_CLIENTE PEDIDO.SEQ_ENDERECO_CLIENTE%TYPE
    ) IS
    BEGIN
        INSERT INTO PEDIDO_NOVOS (
            COD_PEDIDO,
            COD_PEDIDO_RELACIONADO,
            COD_CLIENTE,
            COD_USUARIO,
            COD_VENDEDOR,
            DAT_PEDIDO,
            DAT_CANCELAMENTO,
            DAT_ENTREGA,
            VAL_TOTAL_PEDIDO,
            VAL_DESCONTO,
            SEQ_ENDERECO_CLIENTE
        ) VALUES (
            P_COD_PEDIDO,
            P_COD_PEDIDO_RELACIONADO,
            P_COD_CLIENTE,
            P_COD_USUARIO,
            P_COD_VENDEDOR,
            P_DAT_PEDIDO,
            P_DAT_CANCELAMENTO,
            P_DAT_ENTREGA,
            P_VAL_TOTAL_PEDIDO,
            P_VAL_DESCONTO,
            P_SEQ_ENDERECO_CLIENTE
        );
        COMMIT;
    END PRC_INSERE_PEDIDO;
END PKG_EXEMPLO;
/

CALL PKG_EXEMPLO.PRC_INSERE_PRODUTOS_NOVOS()
SELECT * FROM PRODUTOS_NOVOS
TRUNCATE TABLE PRODUTOS_NOVOS
CALL PKG_EXEMPLO.PRC_INSERE_PEDIDO(10010, 5555, 55888, 5555, 6658, SYSDATE, SYSDATE+10, SYSDATE+1, 20000, 5, 55544);

SELECT
    *
FROM
    PEDIDO_NOVOS