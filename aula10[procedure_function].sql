SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE calculadora (
    num1 IN NUMBER,
    num2 IN NUMBER,
    operacao IN VARCHAR2,
    resultado OUT NUMBER
)
AS
BEGIN
    CASE operacao
        WHEN '+' THEN
            resultado := num1 + num2;
        WHEN '-' THEN
            resultado := num1 - num2;
        WHEN '*' THEN
            resultado := num1 * num2;
        WHEN '/' THEN
            IF num2 != 0 THEN
                resultado := num1 / num2;
            ELSE
                DBMS_OUTPUT.PUT_LINE('Erro: Divisão por zero.');
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Operação inválida.');
    END CASE;
END;

DECLARE
    resultado_operacao NUMBER;
BEGIN
 
    calculadora(10, 5, '+', resultado_operacao);
    DBMS_OUTPUT.PUT_LINE('Resultado da adição: ' || resultado_operacao);


    calculadora(10, 5, '-', resultado_operacao);
    DBMS_OUTPUT.PUT_LINE('Resultado da subtração: ' || resultado_operacao);

   
    calculadora(10, 5, '*', resultado_operacao);
    DBMS_OUTPUT.PUT_LINE('Resultado da multiplicação: ' || resultado_operacao);

   
    calculadora(10, 5, '/', resultado_operacao);
    DBMS_OUTPUT.PUT_LINE('Resultado da divisão: ' || resultado_operacao);
END;


CREATE OR REPLACE FUNCTION calculadora (
    num1 IN NUMBER,
    num2 IN NUMBER,
    operacao IN VARCHAR2
) RETURN NUMBER
AS
    resultado NUMBER;
BEGIN
    CASE operacao
        WHEN '+' THEN
            resultado := num1 + num2;
        WHEN '-' THEN
            resultado := num1 - num2;
        WHEN '*' THEN
            resultado := num1 * num2;
        WHEN '/' THEN
            IF num2 != 0 THEN
                resultado := num1 / num2;
            ELSE
                RAISE_APPLICATION_ERROR(-20001, 'Erro: Divisão por zero.');
            END IF;
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'Operação inválida.');
    END CASE;

    RETURN resultado;
END;


-- Bloco PL/SQL para utilizar a função
DECLARE
    resultado_operacao NUMBER;
BEGIN

    resultado_operacao := calculadora(10, 5, '+');
    DBMS_OUTPUT.PUT_LINE('Resultado da adição: ' || resultado_operacao);


    resultado_operacao := calculadora(10, 5, '-');
    DBMS_OUTPUT.PUT_LINE('Resultado da subtração: ' || resultado_operacao);


    resultado_operacao := calculadora(10, 5, '*');
    DBMS_OUTPUT.PUT_LINE('Resultado da multiplicação: ' || resultado_operacao);

 
    resultado_operacao := calculadora(10, 5, '/');
    DBMS_OUTPUT.PUT_LINE('Resultado da divisão: ' || resultado_operacao);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;



SELECT calculadora(10, 5, '+') AS resultado_adicao,
       calculadora(10, 5, '-') AS resultado_subtracao,
       calculadora(10, 5, '*') AS resultado_multiplicacao,
       calculadora(10, 5, '/') AS resultado_divisao
FROM dual;








