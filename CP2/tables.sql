DROP TABLE T_RC_AUTENTICA CASCADE CONSTRAINTS;
DROP TABLE T_RC_CLIENTE CASCADE CONSTRAINTS;

--- Henrique Oliveira Baptista
--- RM 97796



CREATE TABLE T_RC_AUTENTICA (
  id_autentica           INTEGER PRIMARY KEY,
  email                  VARCHAR2(150) NOT NULL,
  senha                   VARCHAR2(30) NOT NULL,
  st_autentica           VARCHAR2(1) NOT NULL,
  T_RC_CLIENTE_id_cliente INTEGER NOT NULL,
  CONSTRAINT T_RC_AUTENTICA_PK
    PRIMARY KEY (id_autentica),
  CONSTRAINT T_RC_AUTENTICA_UN
    UNIQUE (email),
  CONSTRAINT T_RC_AUTENTICA_T_RC_CLIENTE_FK
    FOREIGN KEY (T_RC_CLIENTE_id_cliente)
    REFERENCES T_RC_CLIENTE(id_cliente),
  CONSTRAINT T_RC_AUTENTICA_IDX
    INDEX (T_RC_CLIENTE_id_cliente)
);


CREATE TABLE T_RC_CLIENTE (
  id_cliente INTEGER PRIMARY KEY,
  nm_cliente VARCHAR2(90) NOT NULL,
  nr_rg VARCHAR2(18),
  nr_cpf VARCHAR2(14) NOT NULL,
  dt_nascimento DATE NOT NULL,
  sx_cliente VARCHAR2(1),
  gr_ensino VARCHAR2(20),
  es_civil VARCHAR2(20),
  T_RC_CLIENTE_PK (id_cliente)
    PRIMARY KEY (id_cliente),
  T_RC_CLIENTE_UN (nr_cpf)
    UNIQUE (nr_cpf),
  T_RC_CLIENTE_IDX1
    INDEX (dt_nascimento),
  T_RC_CLIENTE_IDX2
    INDEX (sx_cliente)
);

CREATE TABLE T_RC_ENDERECO (
  id_endereco INTEGER PRIMARY KEY,
  nm_logradouro VARCHAR2(90) NOT NULL,
  nr_logradouro INTEGER,
  cep VARCHAR2(10) NOT NULL,
  bairro VARCHAR2(90) NOT NULL,
  cidade VARCHAR2(90) NOT NULL,
  estado VARCHAR2(2) NOT NULL,
  ds_complemento VARCHAR2(90),
  T_RC_CLIENTE_id_cliente INTEGER NOT NULL,
  CONSTRAINT T_RC_ENDERECO_PK
    PRIMARY KEY (id_endereco),
  CONSTRAINT T_RC_ENDERECO_T_RC_CLIENTE_FK
    FOREIGN KEY (T_RC_CLIENTE_id_cliente)
    REFERENCES T_RC_CLIENTE(id_cliente),
  CONSTRAINT T_RC_ENDERECO_IDX1
    INDEX (T_RC_CLIENTE_id_cliente),
  CONSTRAINT T_RC_ENDERECO_IDX2
    INDEX (cep)
);

CREATE TABLE T_RC_CHECK_IN (
  id_check_in                         INTEGER PRIMARY KEY,
  nv_combustivel                     NUMBER(5,2) NOT NULL,
  km_atual                           INTEGER NOT NULL,
  dt_hr_check_in                       DATE NOT NULL,
  T_RC_RESERVA_id_reserva               INTEGER NOT NULL,
  st_veiculo                         VARCHAR2(1) NOT NULL,
  CONSTRAINT T_RC_CHECK_IN_PK
    PRIMARY KEY (id_check_in),
  CONSTRAINT T_RC_CHECK_IN_T_RC_RESERVA_FK
    FOREIGN KEY (T_RC_RESERVA_id_reserva)
    REFERENCES T_RC_RESERVA(id_reserva),
  CONSTRAINT T_RC_CHECK_IN_IDX1
    INDEX (T_RC_RESERVA_id_reserva)
);

CREATE TABLE T_CHECK_OUT (
  id_check_out                         INTEGER PRIMARY KEY,
  T_RC_CHECK_IN_id_check_in          INTEGER NOT NULL,
  nv_combustivel                     NUMBER(5,2) NOT NULL,
  km_atual                           INTEGER,
  dt_hr_check_out                       DATE NOT NULL,
  st_veiculo                         VARCHAR2(1) NOT NULL,
  CONSTRAINT T_CHECK_OUT_PK
    PRIMARY KEY (id_check_out),
  CONSTRAINT T_CHECK_OUT_T_RC_CHECK_IN_FK
    FOREIGN KEY (T_RC_CHECK_IN_id_check_in)
    REFERENCES T_RC_CHECK_IN(id_check_in),
  CONSTRAINT T_CHECK_OUT_IDX1
    INDEX (T_RC_CHECK_IN_id_check_in)
);

CREATE TABLE T_RC_SERVICO_RESERVA (
  id_servico_reserva                   INTEGER PRIMARY KEY,
  T_RC_SERVICO_id_servico              INTEGER NOT NULL,
  T_RC_RESERVA_id_reserva              INTEGER NOT NULL,
  CONSTRAINT T_RC_SERVICO_RESERVA_PK
    PRIMARY KEY (id_servico_reserva),
  CONSTRAINT T_RC_SERVICO_RESERVA_T_RC_SERVICO_FK
    FOREIGN KEY (T_RC_SERVICO_id_servico)
    REFERENCES T_RC_SERVICO(id_servico),
  CONSTRAINT T_RC_SERVICO_RESERVA_T_RC_RESERVA_FK
    FOREIGN KEY (T_RC_RESERVA_id_reserva)
    REFERENCES T_RC_RESERVA(id_reserva),
  CONSTRAINT T_RC_SERVICO_RESERVA_IDX1
    INDEX (T_RC_SERVICO_id_servico),
  CONSTRAINT T_RC_SERVICO_RESERVA_IDX2
    INDEX (T_RC_RESERVA_id_reserva)
);

CREATE TABLE T_RC_RESERVA (
  id_reserva                            INTEGER PRIMARY KEY,
  dt_reserva                             DATE NOT NULL,
  dt_retirada                            DATE NOT NULL,
  dt_devolucao                           DATE NOT NULL,
  T_RC_CLIENTE_id_cliente              INTEGER NOT NULL,
  tp_veiculo                            VARCHAR2(2) NOT NULL,
  st_reserva                             VARCHAR2(1) NOT NULL,
  vr_total                              NUMBER(5,2) NOT NULL,
  CONSTRAINT T_RC_RESERVA_PK
    PRIMARY KEY (id_reserva),
  CONSTRAINT FT_RC_RESERVA_T_RC_CLIENTE_FK
    FOREIGN KEY (T_RC_CLIENTE_id_cliente)
    REFERENCES T_RC_CLIENTE(id_cliente),
  CONSTRAINT T_RC_RESERVA_IDX1
    INDEX (T_RC_CLIENTE_id_cliente),
  CONSTRAINT T_RC_RESERVA_IDX2
    INDEX (dt_retirada),
  CONSTRAINT T_RC_RESERVA_IDX3
    INDEX (dt_devolucao)
);

CREATE TABLE T_PAGAMENTO (
  id_pagamento                           INTEGER PRIMARY KEY,
  dt_pagamento                           DATE NOT NULL,
  tp_pagamento                           VARCHAR2(2) NOT NULL,
  nr_cartao                             VARCHAR2(20),
  nr_parcelas                          INTEGER NOT NULL,
  vl_parcela                             NUMBER(5,2) NOT NULL,
  vl_total                              NUMBER(5,2) NOT NULL,
  T_RC_RESERVA_id_reserva              INTEGER NOT NULL,
  CONSTRAINT T_PAGAMENTO_PK
    PRIMARY KEY (id_pagamento),
  CONSTRAINT T_PAGAMENTO_FT_RC_RESERVA_FK
    FOREIGN KEY (T_RC_RESERVA_id_reserva)
    REFERENCES T_RC_RESERVA(id_reserva),
  CONSTRAINT T_PAGAMENTO_IDX1
    INDEX (T_RC_RESERVA_id_reserva)
);

CREATE TABLE T_RC_VEICULO (
  ID_VEICULO INTEGER PRIMARY KEY NOT NULL,
  RENAVAM INTEGER UNIQUE NOT NULL,
  MARCA VARCHAR2(50) NOT NULL,
  MODELO VARCHAR2(50) NOT NULL,
  PLACA_VEICULO VARCHAR2(10) UNIQUE NOT NULL,
  TP_VEICULO VARCHAR2(10) NOT NULL,
  CAMBIO VARCHAR2(10),
  T_RC_PRECO_VEICULO_ID_PRECO INTEGER,
  FOREIGN KEY (T_RC_PRECO_VEICULO_ID_PRECO) REFERENCES T_RC_PRECO_VEICULO(ID_PRECO)
);


CREATE TABLE T_RC_SERVICO (
  id_servico INT NOT NULL AUTO_INCREMENT,
  tp_servico VARCHAR(2) NOT NULL,
  tx_servico VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_servico),
  UNIQUE KEY tp_servico_UNIQUE (tp_servico)
);

CREATE TABLE T_RC_PRECO_VEICULO (
  ID_PRECO INTEGER PRIMARY KEY NOT NULL,
  VALOR_PRECO DECIMAL(10,2) NOT NULL,
  DATA_PRECO DATE NOT NULL,
  ID_VEICULO INTEGER NOT NULL,
  FOREIGN KEY (ID_VEICULO) REFERENCES T_RC_VEICULO(ID_VEICULO)
);

