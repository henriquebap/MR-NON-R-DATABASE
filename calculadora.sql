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
                DBMS_OUTPUT.PUT_LINE('Erro: Divisao por zero');
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('operacao Invalida');
    END CASE; 
END;




DECLARE
    resultado_operacao NUMBER;
BEGIN

    calculadora(10,5,'+', resultado_operacao);
    DBMS_OUTPUT.PUT_LINE('Resultado da Adição: ' || resultado_operacao);

    calculadora(10,5,'-', resultado_operacao);
    DBMS_OUTPUT.PUT_LINE('Resultado da subtração: ' || resultado_operacao);
    
    calculadora(10,5,'*', resultado_operacao);
    DBMS_OUTPUT.PUT_LINE('Resultado da multiplicacão: ' || resultado_operacao);
    
    calculadora(10,5,'/', resultado_operacao);
    DBMS_OUTPUT.PUT_LINE('Resultado da divisão: ' || resultado_operacao);
END;





