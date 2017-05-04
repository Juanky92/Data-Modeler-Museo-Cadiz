-- Generado por Oracle SQL Developer Data Modeler 3.1.3.709
--   en:        2017-05-04 21:05:56 CEST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE ARTISTAS 
    ( 
     idArt INTEGER  NOT NULL , 
     Nombre VARCHAR2 (50)  NOT NULL , 
     Apellidos VARCHAR2 (60) , 
     Lugar VARCHAR2 (70) , 
     fNacimiento DATE 
    ) 
;



ALTER TABLE ARTISTAS 
    ADD CONSTRAINT "ARTISTAS PK" PRIMARY KEY ( idArt ) ;



CREATE TABLE CATALOGO 
    ( 
     idCa INTEGER  NOT NULL , 
     Propietario VARCHAR2 (50)  NOT NULL , 
     Objeto VARCHAR2 (50)  NOT NULL , 
     idCat INTEGER  NOT NULL 
    ) 
;



ALTER TABLE CATALOGO 
    ADD CONSTRAINT "CATALOGO PK" PRIMARY KEY ( idCa ) ;



CREATE TABLE CONSERVACIONES 
    ( 
     idCon INTEGER  NOT NULL , 
     Nombre VARCHAR2 (50)  NOT NULL , 
     idOb INTEGER  NOT NULL 
    ) 
;



ALTER TABLE CONSERVACIONES 
    ADD CONSTRAINT "CONSERVACIONES PK" PRIMARY KEY ( idCon ) ;



CREATE TABLE DESCRIPCION 
    ( 
     idDes INTEGER  NOT NULL , 
     Descripcion VARCHAR2 (60) , 
     Iconografia VARCHAR2 (50)  NOT NULL 
    ) 
;



ALTER TABLE DESCRIPCION 
    ADD CONSTRAINT "DESCRIPCION PK" PRIMARY KEY ( idDes ) ;



CREATE TABLE ESTILOS 
    ( 
     idEst INTEGER  NOT NULL , 
     Nombre VARCHAR2 (50)  NOT NULL , 
     Tecnica VARCHAR2 (50) , 
     Dimension NUMBER , 
     Material VARCHAR2 (70)  NOT NULL , 
     Peso NUMBER , 
     Cultura VARCHAR2 (60)  NOT NULL , 
     Tipo VARCHAR2 (60) 
    ) 
;



ALTER TABLE ESTILOS 
    ADD CONSTRAINT "ESTILOS PK" PRIMARY KEY ( idEst ) ;



CREATE TABLE ETNIAS 
    ( 
     idEt INTEGER  NOT NULL , 
     Nombre VARCHAR2 (50)  NOT NULL , 
     Adquisicion VARCHAR2 (50)  NOT NULL , 
     Entrada NUMBER , 
     Libro NUMBER , 
     Yacimiento VARCHAR2 (60)  NOT NULL , 
     idEst INTEGER  NOT NULL , 
     idCon INTEGER  NOT NULL , 
     idCa INTEGER  NOT NULL , 
     idFe INTEGER  NOT NULL 
    ) 
;



ALTER TABLE ETNIAS 
    ADD CONSTRAINT "ETNIAS PK" PRIMARY KEY ( idEt ) ;



CREATE TABLE FECHAS 
    ( 
     idFe INTEGER  NOT NULL , 
     fCreacion DATE , 
     fIngreso DATE , 
     fInscripcion DATE , 
     fAdquisicion DATE 
    ) 
;



ALTER TABLE FECHAS 
    ADD CONSTRAINT "FECHAS PK" PRIMARY KEY ( idFe ) ;



CREATE TABLE MOVIMIENTO 
    ( 
     idMv INTEGER  NOT NULL , 
     Lugar VARCHAR2 (60)  NOT NULL , 
     idUb INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX MOVIMIENTO__IDX ON MOVIMIENTO 
    ( 
     idUb ASC 
    ) 
;

ALTER TABLE MOVIMIENTO 
    ADD CONSTRAINT "MOVIMIENTO PK" PRIMARY KEY ( idMv ) ;



CREATE TABLE MUSEO 
    ( 
     idCat INTEGER  NOT NULL , 
     Nombre VARCHAR2 (50)  NOT NULL 
    ) 
;



ALTER TABLE MUSEO 
    ADD CONSTRAINT "MUSEO PK" PRIMARY KEY ( idCat ) ;



CREATE TABLE OBRAS 
    ( 
     idba INTEGER  NOT NULL , 
     Nombre VARCHAR2 (50)  NOT NULL , 
     idArt INTEGER  NOT NULL , 
     Adquisicion VARCHAR2 (40)  NOT NULL , 
     idEst INTEGER  NOT NULL , 
     idDes INTEGER  NOT NULL , 
     idUb INTEGER  NOT NULL , 
     idCa INTEGER  NOT NULL , 
     idMv INTEGER  NOT NULL , 
     idCon INTEGER  NOT NULL , 
     idFe INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX OBRAS__IDX ON OBRAS 
    ( 
     idArt ASC 
    ) 
;

ALTER TABLE OBRAS 
    ADD CONSTRAINT "OBRAS PK" PRIMARY KEY ( idba ) ;



CREATE TABLE OBSERVACIONES 
    ( 
     idOb INTEGER  NOT NULL , 
     Comentario VARCHAR2 (70) 
    ) 
;



ALTER TABLE OBSERVACIONES 
    ADD CONSTRAINT "OBSERVACIONES PK" PRIMARY KEY ( idOb ) ;



CREATE TABLE PIEZAS 
    ( 
     idPie INTEGER  NOT NULL , 
     Nombre VARCHAR2 (50)  NOT NULL , 
     Datos VARCHAR2 (70) , 
     idEst INTEGER  NOT NULL , 
     idCon INTEGER  NOT NULL , 
     idPr INTEGER  NOT NULL , 
     idCa INTEGER  NOT NULL , 
     idFe INTEGER  NOT NULL 
    ) 
;



ALTER TABLE PIEZAS 
    ADD CONSTRAINT "PIEZAS PK" PRIMARY KEY ( idPie ) ;



CREATE TABLE PROCEDENCIA 
    ( 
     idPr INTEGER  NOT NULL , 
     Yacimiento VARCHAR2 (50)  NOT NULL , 
     Municipio VARCHAR2 (60)  NOT NULL , 
     Hallazgo VARCHAR2 (70)  NOT NULL 
    ) 
;



ALTER TABLE PROCEDENCIA 
    ADD CONSTRAINT "PROCEDENCIA PK" PRIMARY KEY ( idPr ) ;



CREATE TABLE UBICACIONES 
    ( 
     idUb INTEGER  NOT NULL , 
     Nombre VARCHAR2 (60)  NOT NULL 
    ) 
;



ALTER TABLE UBICACIONES 
    ADD CONSTRAINT "UBICACIONES PK" PRIMARY KEY ( idUb ) ;




ALTER TABLE CATALOGO 
    ADD CONSTRAINT Relation_12 FOREIGN KEY 
    ( 
     idCat
    ) 
    REFERENCES MUSEO 
    ( 
     idCat
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE OBRAS 
    ADD CONSTRAINT Relation_13 FOREIGN KEY 
    ( 
     idCa
    ) 
    REFERENCES CATALOGO 
    ( 
     idCa
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE PIEZAS 
    ADD CONSTRAINT Relation_14 FOREIGN KEY 
    ( 
     idCa
    ) 
    REFERENCES CATALOGO 
    ( 
     idCa
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ETNIAS 
    ADD CONSTRAINT Relation_16 FOREIGN KEY 
    ( 
     idCa
    ) 
    REFERENCES CATALOGO 
    ( 
     idCa
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE PIEZAS 
    ADD CONSTRAINT Relation_17 FOREIGN KEY 
    ( 
     idPr
    ) 
    REFERENCES PROCEDENCIA 
    ( 
     idPr
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE MOVIMIENTO 
    ADD CONSTRAINT Relation_18 FOREIGN KEY 
    ( 
     idUb
    ) 
    REFERENCES UBICACIONES 
    ( 
     idUb
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE OBRAS 
    ADD CONSTRAINT Relation_19 FOREIGN KEY 
    ( 
     idMv
    ) 
    REFERENCES MOVIMIENTO 
    ( 
     idMv
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE OBRAS 
    ADD CONSTRAINT Relation_20 FOREIGN KEY 
    ( 
     idUb
    ) 
    REFERENCES UBICACIONES 
    ( 
     idUb
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE OBRAS 
    ADD CONSTRAINT Relation_21 FOREIGN KEY 
    ( 
     idArt
    ) 
    REFERENCES ARTISTAS 
    ( 
     idArt
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE OBRAS 
    ADD CONSTRAINT Relation_22 FOREIGN KEY 
    ( 
     idFe
    ) 
    REFERENCES FECHAS 
    ( 
     idFe
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE PIEZAS 
    ADD CONSTRAINT Relation_23 FOREIGN KEY 
    ( 
     idFe
    ) 
    REFERENCES FECHAS 
    ( 
     idFe
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE OBRAS 
    ADD CONSTRAINT Relation_23 FOREIGN KEY 
    ( 
     idEst
    ) 
    REFERENCES ESTILOS 
    ( 
     idEst
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE PIEZAS 
    ADD CONSTRAINT Relation_24 FOREIGN KEY 
    ( 
     idEst
    ) 
    REFERENCES ESTILOS 
    ( 
     idEst
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ETNIAS 
    ADD CONSTRAINT Relation_24 FOREIGN KEY 
    ( 
     idFe
    ) 
    REFERENCES FECHAS 
    ( 
     idFe
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ETNIAS 
    ADD CONSTRAINT Relation_26 FOREIGN KEY 
    ( 
     idEst
    ) 
    REFERENCES ESTILOS 
    ( 
     idEst
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE OBRAS 
    ADD CONSTRAINT Relation_27 FOREIGN KEY 
    ( 
     idDes
    ) 
    REFERENCES DESCRIPCION 
    ( 
     idDes
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE CONSERVACIONES 
    ADD CONSTRAINT Relation_28 FOREIGN KEY 
    ( 
     idOb
    ) 
    REFERENCES OBSERVACIONES 
    ( 
     idOb
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE PIEZAS 
    ADD CONSTRAINT Relation_30 FOREIGN KEY 
    ( 
     idCon
    ) 
    REFERENCES CONSERVACIONES 
    ( 
     idCon
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE OBRAS 
    ADD CONSTRAINT Relation_31 FOREIGN KEY 
    ( 
     idCon
    ) 
    REFERENCES CONSERVACIONES 
    ( 
     idCon
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ETNIAS 
    ADD CONSTRAINT Relation_32 FOREIGN KEY 
    ( 
     idCon
    ) 
    REFERENCES CONSERVACIONES 
    ( 
     idCon
    ) 
    ON DELETE CASCADE 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             2
-- ALTER TABLE                             34
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE STRUCTURED TYPE                   0
-- CREATE COLLECTION TYPE                   0
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
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
