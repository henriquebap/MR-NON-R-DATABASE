DROP TABLE T_RC_AUTENTICA CASCADE CONSTRAINTS;
DROP TABLE T_RC_CLIENTE CASCADE CONSTRAINTS;

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
  nr_rg VARCHAR2(18) NOT NULL,
  Unr_cpf VARCHAR2(14) NOT NULL,

  dt_nascimento DATE NOT NULL,
  sx_cliente VARCHAR2(1) NOT NULL,
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
  nr_logradouro INTEGER NOT NULL,
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
  FT_RC_RESERVA_id_reserva               INTEGER NOT NULL,
  st_veiculo                         VARCHAR2(1) NOT NULL,
  CONSTRAINT T_RC_CHECK_IN_PK
    PRIMARY KEY (id_check_in),
  CONSTRAINT T_RC_CHECK_IN_T_RC_RESERVA_FK
    FOREIGN KEY (FT_RC_RESERVA_id_reserva)
    REFERENCES FT_RC_RESERVA(id_reserva),
  CONSTRAINT T_RC_CHECK_IN_IDX1
    INDEX (FT_RC_RESERVA_id_reserva)
);
