select * from ALUNO where RM = &DIGITE_O_RM_DO_ALUNO


SELECT * FROM ALUNO WHERE upper(NOME) = upper ('&DIGITAR_NOME') 



SET SERVEROUTPUT ON;
DECLARE
--Variaveis
    V_SAL_ATUAL NUMBER(10,2) := 1412.00;
    V_SAL_REAJ NUMBER(10,2);
BEGIN
--Programa
    V_SAL_REAJ := V_SAL_ATUAL * 1.25;
    --Imprimir resultado na t
    DBMS_OUTPUT.PUT_LINE('SALARIO ATUAL - R$: ' ||V_SAL_ATUAL);
    DBMS_OUTPUT.PUT_LINE('SALARIO REAJUSTADO - R$: ' || V_SAL_REAJ);

END;



SET SERVEROUTPUT ON;
DECLARE
    V_DOLARES NUMBER(10,2) := &DIGITE_A_COTACAO;
    V_REAIS V_DOLARES%TYPE;
    V_ENTRADA_VALOR_DOLAR V_DOLARES%TYPE := &DIGITE_UM_VALOR_EM_DOLAR;
BEGIN
    V_REAIS := V_DOLARES * V_ENTRADA_VALOR_DOLAR;
    DBMS_OUTPUT.PUT_LINE('A Cotacao de Dolar Hoje e de $: '||V_DOLARES);
    DBMS_OUTPUT.PUT_LINE('O valor de $: '||V_ENTRADA_VALOR_DOLAR ||' em reais e de R$: '||V_REAIS);
END;


SET SERVEROUTPUT ON;
DECLARE
    QNT_PARCELAS NUMBER(2) := 10;
    V_DA_COMPRA NUMBER(10,2) := &valor_do_carro;
    V_TAXA_JUROS V_DA_COMPRA%TYPE; -- 3% interest rate
BEGIN
    V_TAXA_JUROS := (V_DA_COMPRA * 1.03)/ QNT_PARCELAS; -- 1.03 is the tax of
    DBMS_OUTPUT.PUT_LINE('Valor da compra : R$:'||V_DA_COMPRA );
    DBMS_OUTPUT.PUT_LINE('Parcelado em : '||QNT_PARCELAS||'x');
    DBMS_OUTPUT.PUT_LINE('Sem juros o total a pagar era R$:'||V_DA_COMPRA/QNT_PARCELAS);
    DBMS_OUTPUT.PUT_LINE('Com juros o total a ser pago sera R$:'||V_DA_COMPRA+(V_DA_COMPRA/QNT_PARCELAS)*V_TAXA_JUROS);
END;