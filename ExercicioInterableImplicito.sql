CREATE TABLE FUNCIONARIO(cd_fun number(2) PRIMARY KEY,
                            nm_fun VARCHAR2(20),
                            salario NUMBER(10,2),
                            dt_adm date);

BEGIN
    insert into FUNCIONARIO values (5, 'Joao', 10000, TO_DATE('17/04/2002', 'dd/mm/yyyy'));
    insert into FUNCIONARIO values (2, 'Pedro', 16000, TO_DATE('15/05/2000','dd/mm/yyyy'));
    insert into FUNCIONARIO values (3, 'Kauan', 5500, TO_DATE('10/07/2010','dd/mm/yyyy'));
    insert into FUNCIONARIO values (4, 'Joaquim', 20000, TO_DATE('08/12/1999','dd/mm/yyyy'));
    insert into FUNCIONARIO values (1, 'Valeria', 700, TO_DATE('11/11/2015','dd/mm/yyyy'));
    commit;
END;                       
 
Select * FROM FUNCIONARIO

DECLARE
    CURSOR c_exibe IS select nm_fun, salario FROM FUNCIONARIO;
BEGIN
    FOR v_exibe IN c_exibe LOOP
        DBMS_OUTPUT.PUT_LINE('Nome: '||v_exibe.nm_fun||' -Salario: '||v_exibe.salario);
    end loop;
end;

--DECLARE
 --  Cursor c_exibe is select nm_fun, salario from funcionario;
 --   v_exibe c_exibe %ROWTYPE;
--BEGIN
 --   open c_exibe;
 --   loop
 --       fetch c_exibe into v_exibe;
 --   exit when c_exibe%notfound;
--    dbms_OUTPUT.put_line('Nome' ||)


alter table FUNCIONARIO
ADD tempo number(4);

DECLARE
    CURSOR c_tempo is select nm_fun ,tempo FROM FUNCIONARIO;
BEGIN

    FOR v_tempo in c_tempo LOOP
        c_tempo.tempo := v_adm - sysdate;
        DBMS_OUTPUT.PUT_LINE('Nome: '|| v_tempo.nm_fun||' TEMPO TRABALHADO: '|| v_tempo.tempo);
    end loop;
end;



