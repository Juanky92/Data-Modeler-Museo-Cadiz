-- Generado por Oracle SQL Developer Data Modeler 3.1.3.709
--   en:        2017-05-03 03:22:35 CEST
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



CREATE TABLE CONSERVACIONES 
    ( 
     idCon INTEGER  NOT NULL , 
     Nombre VARCHAR2 (50)  NOT NULL , 
     idOb INTEGER  NOT NULL 
    ) 
;



ALTER TABLE CONSERVACIONES 
    ADD CONSTRAINT "CONSERVACIONES PK" PRIMARY KEY ( idCon ) ;



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
     fAdquisicion DATE  NOT NULL , 
     fIngreso DATE  NOT NULL , 
     Entrada NUMBER , 
     Libro NUMBER , 
     Yacimiento VARCHAR2 (60)  NOT NULL , 
     idCat INTEGER  NOT NULL , 
     idEst INTEGER  NOT NULL , 
     idCon INTEGER  NOT NULL 
    ) 
;



ALTER TABLE ETNIAS 
    ADD CONSTRAINT "ETNIAS PK" PRIMARY KEY ( idEt ) ;



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
     fCreacion DATE  NOT NULL , 
     idUb INTEGER  NOT NULL , 
     idCat INTEGER  NOT NULL , 
     idArt INTEGER  NOT NULL , 
     idEst INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX OBRAS__IDX ON OBRAS 
    ( 
     idUb ASC 
    ) 
;
CREATE UNIQUE INDEX OBRAS__IDXv1 ON OBRAS 
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
     Yacimiento VARCHAR2 (60)  NOT NULL , 
     Datos VARCHAR2 (70) , 
     fIngreso DATE  NOT NULL , 
     fInscripcion DATE  NOT NULL , 
     idCat INTEGER  NOT NULL , 
     idEst INTEGER  NOT NULL , 
     idCon INTEGER  NOT NULL 
    ) 
;



ALTER TABLE PIEZAS 
    ADD CONSTRAINT "PIEZAS PK" PRIMARY KEY ( idPie ) ;



CREATE TABLE UBICACIONES 
    ( 
     idUb INTEGER  NOT NULL , 
     Nombre VARCHAR2 (60)  NOT NULL 
    ) 
;



ALTER TABLE UBICACIONES 
    ADD CONSTRAINT "UBICACIONES PK" PRIMARY KEY ( idUb ) ;




ALTER TABLE OBRAS 
    ADD CONSTRAINT Relation_1 FOREIGN KEY 
    ( 
     idUb
    ) 
    REFERENCES UBICACIONES 
    ( 
     idUb
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ETNIAS 
    ADD CONSTRAINT Relation_10 FOREIGN KEY 
    ( 
     idEst
    ) 
    REFERENCES ESTILOS 
    ( 
     idEst
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE CONSERVACIONES 
    ADD CONSTRAINT Relation_11 FOREIGN KEY 
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
    ADD CONSTRAINT Relation_12 FOREIGN KEY 
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
    ADD CONSTRAINT Relation_13 FOREIGN KEY 
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
    ADD CONSTRAINT Relation_2 FOREIGN KEY 
    ( 
     idCat
    ) 
    REFERENCES MUSEO 
    ( 
     idCat
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE PIEZAS 
    ADD CONSTRAINT Relation_4 FOREIGN KEY 
    ( 
     idCat
    ) 
    REFERENCES MUSEO 
    ( 
     idCat
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ETNIAS 
    ADD CONSTRAINT Relation_5 FOREIGN KEY 
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
    ADD CONSTRAINT Relation_7 FOREIGN KEY 
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
    ADD CONSTRAINT Relation_8 FOREIGN KEY 
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
    ADD CONSTRAINT Relation_9 FOREIGN KEY 
    ( 
     idEst
    ) 
    REFERENCES ESTILOS 
    ( 
     idEst
    ) 
    ON DELETE CASCADE 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             2
-- ALTER TABLE                             20
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
