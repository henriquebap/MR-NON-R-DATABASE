CREATE OR REPLACE FUNCTION calculator (
    num1 IN NUMBER,
    num2 IN NUMBER,
    operacao IN VARCHAR2,
    resultado OUT NUMBER
)RETURN NUMBER
AS
    resultador NUMBER;
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
                DBMS_OUTPUT.PUT_LINE('Erro: Divisao por zero');
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('operacao Invalida');
    END CASE; 

    RETURN resultado;
END;


DECLARE
    resultado_operacao NUMBER;
BEGIN

    resultado_operacao := calculator(10,5,'+');
    DBMS_OUTPUT.PUT_LINE('Resultado da Adição: ' || resultado_operacao);

    resultado_operacao := calculator(10,5,'-');
    DBMS_OUTPUT.PUT_LINE('Resultado da subtração: ' || resultado_operacao);
    
    resultado_operacao := calculator(10,5,'*');
    DBMS_OUTPUT.PUT_LINE('Resultado da multiplicacão:' || resultado_operacao);
    
    resultado_operacao := calculator(10,5,'/');
    DBMS_OUTPUT.PUT_LINE('Resultado da divisão: ' || resultado_operacao);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: ' || SQLERROR);
END;


SELECT calculadora(10, 5, '+') As resultado adicao,
        calculadora(10,5, '-')AS resultado subtracao,
        calculadora(10, 5, '*')AS resultado_multiplicacao,
        calculadora(10, 5,'/') AS resultado_divisao
FROMdual;





