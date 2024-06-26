-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2024-03-15 21:57:13 BRT
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c



DROP TABLE t_sgv_categoria_produto CASCADE CONSTRAINTS;

DROP TABLE t_sgv_produto CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_sgv_categoria_produto (
    cd_categoria        NUMBER(5) GENERATED ALWAYS AS IDENTITY,
    ds_categoria        VARCHAR2(100) NOT NULL,
    nm_categoria        VARCHAR2(30) NOT NULL,
    sg_status_categoria CHAR(1) NOT NULL,
    dt_inicio           DATE NOT NULL,
    dt_termino          DATE
)
LOGGING;

COMMENT ON TABLE t_sgv_categoria_produto IS
    'Tabela da categoria de produtos.';

COMMENT ON COLUMN t_sgv_categoria_produto.cd_categoria IS
    'Coluna estrangeiro do codigo da categoria. Deve ser unico e gerado por Identity.';

COMMENT ON COLUMN t_sgv_categoria_produto.ds_categoria IS
    'Coluna da descricao da categoria do produto.';

COMMENT ON COLUMN t_sgv_categoria_produto.nm_categoria IS
    'Coluna do nome da categoria de produto.';

COMMENT ON COLUMN t_sgv_categoria_produto.sg_status_categoria IS
    'Coluna do Status da Categoria do Produto. Deve ser I para Status Inativo e A para Status Ativo.';

COMMENT ON COLUMN t_sgv_categoria_produto.dt_inicio IS
    'Coluna para a data de inicio do produto.';

COMMENT ON COLUMN t_sgv_categoria_produto.dt_termino IS
    'Coluna para a data de termino do produto. Algoritmo do sistema deve altomatizar para, em caso de preenchimento deste campo, 
tornar o status da categoria inativo.';

ALTER TABLE t_sgv_categoria_produto ADD CONSTRAINT ck_sgv_dt_termino CHECK ( dt_termino >= dt_inicio );

ALTER TABLE t_sgv_categoria_produto
    ADD CONSTRAINT ck_sgv_sg_status_categoria CHECK ( sg_status_categoria IN ( 'A', 'I' ) );

ALTER TABLE t_sgv_categoria_produto ADD CONSTRAINT pk_sgv_categoria_produto PRIMARY KEY ( cd_categoria );

ALTER TABLE t_sgv_categoria_produto ADD CONSTRAINT un_sgv_cat_prod_ds_categoria UNIQUE ( ds_categoria );

CREATE TABLE t_sgv_produto (
    cd_produto   NUMBER(5) GENERATED ALWAYS AS IDENTITY,
    ds_normal    VARCHAR2(100) NOT NULL,
    cd_categoria NUMBER(5) NOT NULL,
    ds_completa  VARCHAR2(600) NOT NULL,
    sg_status    CHAR(1) NOT NULL,
    vl_unitario  NUMBER(7, 2) NOT NULL,
    cd_barras    NUMBER(13)
)
LOGGING;

COMMENT ON TABLE t_sgv_produto IS
    'Entidade dos produtos';

COMMENT ON COLUMN t_sgv_produto.cd_produto IS
    'Coluna do codigo do produto. Deve ser unico e gerado por um Identity.';

COMMENT ON COLUMN t_sgv_produto.ds_normal IS
    'Coluna da descricao normal do Produto.';

COMMENT ON COLUMN t_sgv_produto.cd_categoria IS
    'Coluna estrangeiro do codigo da categoria. Deve ser unico e gerado por Identity.  Chave estrangeira.';

COMMENT ON COLUMN t_sgv_produto.ds_completa IS
    'Coluna da descricao completa do produto.';

COMMENT ON COLUMN t_sgv_produto.sg_status IS
    'Coluna de Status do produto. Deve ser I para produto inativo e A para produto ativo.';

COMMENT ON COLUMN t_sgv_produto.vl_unitario IS
    'Coluna para o valor do produto aceitando ate duas casas decimais.';

COMMENT ON COLUMN t_sgv_produto.cd_barras IS
    'Coluna do codigo de barras do produto. Em padrao EAN13.';

ALTER TABLE t_sgv_produto
    ADD CONSTRAINT ck_sg_status_produto CHECK ( sg_status IN ( 'A', 'I' ) );

ALTER TABLE t_sgv_produto ADD CONSTRAINT pk_sgv_produto PRIMARY KEY ( cd_produto );

ALTER TABLE t_sgv_produto ADD CONSTRAINT un_sgv_produto_ds_normal UNIQUE ( ds_normal );

ALTER TABLE t_sgv_produto
    ADD CONSTRAINT fk_sgv_categoria_produto FOREIGN KEY ( cd_categoria )
        REFERENCES t_sgv_categoria_produto ( cd_categoria )
    NOT DEFERRABLE;








-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             2
-- CREATE INDEX                             0
-- ALTER TABLE                             10
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
