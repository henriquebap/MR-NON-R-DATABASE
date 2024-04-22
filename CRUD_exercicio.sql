CREATE OR REPLACE PROCEDURE CRIAR_PRODUTO (
    p_id_produto IN INTEGER,
    p_desc_produto IN VARCHAR2,
    p_valor_produto IN NUMBER
)
IS
BEGIN
    INSERT INTO produto (id_produto, desc_produto, valor_produto)
    VALUES (p_id_produto, p_desc_produto, p_valor_produto);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'Erro ao criar produto: ' || SQLERRM);
END CRIAR_PRODUTO;


BEGIN
    create_produto(21,'Manga 50g', 100.00);
END;



CREATE OR REPLACE FUNCTION get_produto (
    p_id_produto IN INTEGER
)
RETURN produto%ROWTYPE
IS
    v_produto produto%ROWTYPE;
BEGIN
    SELECT * INTO valor_produto
    FROM PRODUTO
    WHERE id_produto = p_id_produto;

    RETURN v_produto;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Produto não encontrado');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro ao buscar produto: ' || SQLERRM);
END get_produto;

DECLARE
    v_produto produto%ROWTYPE;
BEGIN
    v_produto:=get_produto(21);
    DBMS.OUTPUT.PUT_LINE('ID: ' || v_produto.id_produto()
                                || ' Desc : ' || v_produto.desc_produto());
END;




CREATE OR REPLACE PROCEDURE update_valor_produto (
    p_id_produto IN INTEGER,
    p_novo_valor IN NUMBER
)
IS
BEGIN
    UPDATE PRODUTO
    SET valor_produto = p_novo_valor
    WHERE id_produto = p_id_produto;
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-2002, 'Produto não encontrado');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-2001, 'Error ao atualizar valor do produto: ' || SQLERRM);
END update_valor_produto;

