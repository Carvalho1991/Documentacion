CREATE TABLE zonas_dep(number_id  number(3) primary key, nombre_zona varchar2(25),
usuario_creador varchar2(10), fecha_creado date, usuario_mod varchar2(10), fecha_mod date);


CREATE TABLE departamentos(id_number  number(3) primary key, nombre varchar2(25),
usuario_creador varchar2(10), fecha_creado date, usuario_mod varchar2(10), fecha_mod date);

ALTER TABLE departamentos
ADD ( CONSTRAINT (id_number_pk
      PRIMARY KEY (id_number),
      CONSTRAINT (number_id_fk
         FOREIGN KEY (number_id)
        	  REFERENCES zonas_dep(number_id)) ;

create TABLE municipios(id_municipio  number(3), nombre_municipio varchar2(25),
usuario_creador varchar2(10),numberid  number(3),id_number  varchar2(10), fecha_creado date, usuario_mod varchar2(10), fecha_mod date);
    
    
    ALTER TABLE municipios
ADD ( CONSTRAINT id_municipio_pk
      PRIMARY KEY (id_municipio),
      CONSTRAINT numberid_fk
         FOREIGN KEY (numberid)
        	  REFERENCES zonas_dep(number_id),
      CONSTRAINT id_number_fk
         FOREIGN KEY (id_number)
        	  REFERENCES departamentos(id_number)) ;

create TABLE BARRIOS_COLONIAS(id_barriocol  number(3), nombre_barrio varchar2(25),
usuario_creador varchar2(10),number_idd  number(3),idnum  varchar2(10),idmuni  number(3),
fecha_creado date, usuario_mod varchar2(10), fecha_mod date);


ALTER TABLE BARRIOS_COLONIAS
ADD ( CONSTRAINT id_barriocol_pk
      PRIMARY KEY (id_barriocol),
      CONSTRAINT number_idd_fk
         FOREIGN KEY (number_idd)
        	  REFERENCES zonas_dep(number_id),
      CONSTRAINT idnum_fk
         FOREIGN KEY (idnum)
        	  REFERENCES departamentos(id_number),  
         CONSTRAINT idmuni_fk
         FOREIGN KEY (idmuni)
        	  REFERENCES municipios(id_municipio));


CREATE TABLE pacientes(dui  number(10) primary key, nombre varchar2(50),genero varchar2(1),fecha_Nac date,email varchar2(50),direccion varchar2(50),
telefono number(9),profesion varchar2(25),estado number(2),
usuario_creador varchar2(10), fecha_creado date, usuario_mod varchar2(10), fecha_mod date);


CREATE TABLE MEDICAMENTOS
( COD_BARRA number(11) primary key, Descripcion varchar2(50),usuario_creador varchar2(10), fecha_creado date, usuario_mod varchar2(10), fecha_mod date);


CREATE TABLE CITA_MEDICAMENTOS
( ID_CITAMEDICAMENTO number(5) primary Key,OMBRE_MEDICAMENTO varchar2(50),FECHA_VENCIMIENTO DATE,lABORATORIO varchar2(50),usuario_creador varchar2(10), 
fecha_creado date, usuario_mod varchar2(10), fecha_mod date);

CREATE TABLE CITA_DETALLES
( ID_CITADETALLE number(11), SINTOMAS varchar2(50),usuario_creador varchar2(10),id_citamedicamento number (5), fecha_creado date, usuario_mod varchar2(10), fecha_mod date);

ALTER TABLE cita_detalles
ADD ( CONSTRAINT (id_citadetalle_pk
      PRIMARY KEY (id_citadetalle),
      CONSTRAINT (id_citamedicamento_fk
         FOREIGN KEY (id_citamedicamento)
        	  REFERENCES cita_medicamentos(id_citamedicamento)) ;

CREATE TABLE RECETA
( ID_RECETA number(11) primary Key,SINTOMAS_ASUNTO varchar2(250), HORAINI datetime, HORAFIN datetime,
  usuario_creador varchar2(10),id_citamedicamento number (5), fecha_creado date, usuario_mod varchar2(10), fecha_mod date);


CREATE TABLE ENFERMEDADES
( ID_ENFERMEDAD number(11) primary key, NOMBRE_ENFERMEDAD varchar2(50),SINTOMA varchar2(150),
  usuario_creador varchar2(10),id_citamedicamento number (5), fecha_creado date, usuario_mod varchar2(10), fecha_mod date);


CREATE TABLE Especialidades
( ID_Especialidad number(11) primary key, NOMBRE_Especialidad varchar2(50),numero_especialidades varchar2(150),
  usuario_creador varchar2(10),id_citamedicamento number (5), fecha_creado date, usuario_mod varchar2(10), fecha_mod date);

CREATE TABLE especialidadxmedico
( ID_especialidad number(11) primary Key, NOMBRE varchar2(50), numerojrv varchar2(150),usuario_creador varchar2(10),id_citamedicamento number (5),
 fecha_creado date, usuario_mod varchar2(10), fecha_mod date);


CREATE TABLE usuarios
( ID number(11) primary Key, NOMBRE varchar2(50),password varchar2(150), email varchar2(150),role number(2),
 usuario_creador varchar2(10),id_citamedicamento number (5), fecha_creado date, usuario_mod varchar2(10), fecha_mod date);


/*-----------------------agregando Comments a la tabla y a los campos de las tablas ----------------*/
COMMENT ON TABLE DEPARTAMENTOS IS 'Tabla que almacena el catalago de los departamentos';
COMMENT ON COLUMN departamentos.id_number IS 'Llave primaria de la tabla departamentos';
COMMENT ON COLUMN departamentos.nombre IS 'Descripcion o nombre en la tabla departamentos';
COMMENT ON COLUMN departamentos.usuario_creador IS 'Indica el usuario que creo el registro select * from all_tables;';
COMMENT ON COLUMN departamentos.fecha_creado IS 'Fecha de la creacion del registro en tabla departamentos';
COMMENT ON COLUMN departamentos.usuario_mod IS 'Usuario que modifico por ultima vez el registro en tabla departamentos';
COMMENT ON COLUMN departamentos.fecha_mod IS 'Fecha de modificacion del registro en tabla departamentos';

COMMENT ON TABLE barrios_colonias IS 'Tabla que almacena el catalago de los barrios y colonias';
COMMENT ON COLUMN barrios_colonias.id_barriocol IS 'Llave primaria de la tabla barrio_colonias';
COMMENT ON COLUMN barrios_colonias.nombre_barrio IS 'Descripcion o nombre_barrio de la tabla barrios_colonias';
COMMENT ON COLUMN barrios_colonias.usuario_creador IS 'Indica el usuario que creo el registro select * from all_tables;';
COMMENT ON COLUMN barrios_colonias.number_idd IS 'Indica el number_idd y llave foranea;';
COMMENT ON COLUMN barrios_colonias.idnum IS 'Indica la llave foranea';
COMMENT ON COLUMN barrios_colonias.idmuni IS 'Indica la llave foranea de la tabla municipio';
COMMENT ON COLUMN barrios_colonias.fecha_creado IS 'Indica la fecha que fue creado';
COMMENT ON COLUMN barrios_colonias.usuario_mod IS 'Usuario que modifico por ultima vez el registro en tabla departamentos';
COMMENT ON COLUMN barrios_colonias.fecha_mod IS 'Fecha de modificacion del registro en tabla departamentos';

COMMENT ON TABLE cita_detalles IS 'Tabla que almacena el catalago cita_detalles';
COMMENT ON COLUMN cita_detalles.id_citadetalle IS 'Llave primaria de la tabla citadetalle';
COMMENT ON COLUMN cita_detalles.sintomas IS 'sintoma o padecimiento del paciente en la consulta';
COMMENT ON COLUMN cita_detalles.usuario_creador IS 'Indica el usuario que creo el registro select * from all_tables;';
COMMENT ON COLUMN cita_detalles.id_citamedicamento is'Llave foranea de tabla cita medicamento';
COMMENT ON COLUMN cita_detalles.fecha_creado IS 'Indica la fecha que fue creado';
COMMENT ON COLUMN cita_detalles.usuario_mod IS 'Usuario que modifico por ultima vez el registro en tabla cita_detalles';
COMMENT ON COLUMN cita_detalles.fecha_mod IS 'Fecha de modificacion del registro en tabla cita_detalles';

COMMENT ON TABLE CITA_MEDICAMENTOS IS 'Tabla que almacena los medicamentos dados en la cita';
COMMENT ON COLUMN CITA_MEDICAMENTOS.ID_CITAMEDICAMENTO IS 'Llave primaria de la tabla CITA_MEDICAMENTOS';
COMMENT ON COLUMN CITA_MEDICAMENTOS.NOMBRE_MEDICAMENTO IS 'Almacena el nombre de los medicamentos';
COMMENT ON COLUMN CITA_MEDICAMENTOS.FECHA_VENCIMIENTO IS 'fecha de vencimiento de el medicamento dado';
COMMENT ON COLUMN CITA_MEDICAMENTOS.LABORATORIO IS 'Describe el laboratorio al que pertenece el medicamento';
COMMENT ON COLUMN CITA_MEDICAMENTOS.USUARIO_CREADOR IS 'Indica el usuario que creo el registro en tabla CITA_MEDICAMENTOS;';
COMMENT ON COLUMN CITA_MEDICAMENTOS.FECHA_CREADO IS 'Fecha de la creacion del registro en tabla CITA_MEDICAMENTOS';
COMMENT ON COLUMN CITA_MEDICAMENTOS.USUARIO_MOD IS 'Usuario que modifico por ultima vez el registro en tabla CITA_MEDICAMENTOS';
COMMENT ON COLUMN CITA_MEDICAMENTOS.FECHA_MOD IS 'Fecha de modificacion del registro en tabla CITA_MEDICAMENTOS';

COMMENT ON TABLE ENFERMEDADES IS 'Tabla que almacena los datos de las enfermedades';
COMMENT ON COLUMN ENFERMEDADES.ID_ENFERMEDAD IS 'Llave primaria de la tabla enfermedades';
COMMENT ON COLUMN ENFERMEDADES.NOMBRE_ENFERMEDAD IS 'Almacena elnombre de la enfermedad';
COMMENT ON COLUMN ENFERMEDADES.SINTOMA IS 'campo que almacena el sintoma que presenta el paciente';
COMMENT ON COLUMN ENFERMEDADES.USUARIO_CREADOR IS 'Indica el usuario que creo el registro en tabla';
COMMENT ON COLUMN ENFERMEDADES.ID_CITAMEDICAMENTO IS 'llave foranea de la tabla CITA_MEDICAMENTOS;';
COMMENT ON COLUMN ENFERMEDADES.FECHA_CREADO IS 'Fecha de la creacion del registro en tabla ENFERMEDADES';
COMMENT ON COLUMN ENFERMEDADES.USUARIO_MOD IS 'Usuario que modifico por ultima vez el registro en tabla ENFERMEDADES';
COMMENT ON COLUMN ENFERMEDADES.FECHA_MOD IS 'Fecha de modificacion del registro en tabla ENFERMEDADES';

COMMENT ON TABLE ESPECIALIDADES IS 'Tabla que almacena las especialidades de los medicos';
COMMENT ON COLUMN ESPECIALIDADES.ID_ESPECIALIDAD IS 'Llave primaria de la tabla especialidades';
COMMENT ON COLUMN ESPECIALIDADES.NOMBRE_ESPECIALIDAD IS 'nombre de la especialidad';
COMMENT ON COLUMN ESPECIALIDADES.NUMERO_ESPECIALIDADES IS 'numero de especialidades ';
COMMENT ON COLUMN ESPECIALIDADES.USUARIO_CREADOR IS 'indica el usuario que creo el registro de en la tabla';
COMMENT ON COLUMN ESPECIALIDADES.ID_CITAMEDICAMENTO IS 'llave foranea de la tabla CITA_MEDICAMENTOS;';
COMMENT ON COLUMN ESPECIALIDADES.FECHA_CREADO IS 'Fecha de la creacion del registro en tabla ESPECIALIDADES';
COMMENT ON COLUMN ESPECIALIDADES.USUARIO_MOD IS 'Usuario que modifico por ultima vez el registro en tabla ESPECIALIDADES';
COMMENT ON COLUMN ESPECIALIDADES.FECHA_MOD IS 'Fecha de modificacion del registro en tabla ESPECIALIDADES';

COMMENT ON TABLE ESPECIALIDADXMEDICO IS 'Tabla que almacena la especialidad de cada medico';
COMMENT ON COLUMN ESPECIALIDADXMEDICO.ID_ESPECIALIDAD IS 'Llave primaria de la tabla especialidadxmedico';
COMMENT ON COLUMN ESPECIALIDADXMEDICO.NOMBRE IS 'Almacena el nombre de la especialidad';
COMMENT ON COLUMN ESPECIALIDADXMEDICO.NUMEROJRV IS 'almacena el numero de junta de Vigilancia de Medico';
COMMENT ON COLUMN ESPECIALIDADXMEDICO.USUARIO_CREADOR IS 'usuario que crea el registro en la tabla';
COMMENT ON COLUMN ESPECIALIDADXMEDICO.ID_CITAMEDICAMENTO IS 'llave foranea de la tabla citamedicamento';
COMMENT ON COLUMN ESPECIALIDADXMEDICO.FECHA_CREADO IS 'Fecha de la creacion del registro en tabla especialidadxmedico';
COMMENT ON COLUMN ESPECIALIDADXMEDICO.USUARIO_MOD IS 'Usuario que modifico por ultima vez el registro en tabla especialidadxmedico';
COMMENT ON COLUMN ESPECIALIDADXMEDICO.FECHA_MOD IS 'Fecha de modificacion del registro en tabla especialidadxmedico';

COMMENT ON TABLE MEDICAMENTOS IS 'Tabla que almacena los datos de la tabla medicamentos';
COMMENT ON COLUMN MEDICAMENTOS.COD_BARRA IS 'Llave primaria de la tabla medicamentos';
COMMENT ON COLUMN MEDICAMENTOS.DESCRIPCION IS 'Almacena la descripcion de la tabla medicamentos';
COMMENT ON COLUMN MEDICAMENTOS.USUARIO_CREADOR IS 'Usuario que crea un registro en la tabla medicamentos';
COMMENT ON COLUMN MEDICAMENTOS.FECHA_CREADO IS 'Fecha de la creacion del registro en tabla medicamentos';
COMMENT ON COLUMN MEDICAMENTOS.USUARIO_MOD IS 'Usuario que modifico por ultima vez el registro en tabla medicamentos';
COMMENT ON COLUMN MEDICAMENTOS.FECHA_MOD IS 'Fecha de modificacion del registro en tabla medicamentos';

COMMENT ON TABLE MUNICIPIOS IS 'Tabla que almacena los municipios';
COMMENT ON COLUMN MUNICIPIOS.ID_MUNICIPIO IS 'Llave primaria de la tabla municipios';
COMMENT ON COLUMN MUNICIPIOS.NOMBRE_MUNICIPIO IS 'Almacena los nombres de los municipios';
COMMENT ON COLUMN MUNICIPIOS.USUARIO_CREADOR IS 'usuario creador de el registro de la tabla municipios';
COMMENT ON COLUMN MUNICIPIOS.NUMBERID IS 'llave foranea de Departamentos';
COMMENT ON COLUMN MUNICIPIOS.ID_NUMBER IS 'llave foranea de la tabla zonas_dep';
COMMENT ON COLUMN MUNICIPIOS.USUARIO_MOD IS 'Usuario que modifico por ultima vez el registro en tabla municipios';
COMMENT ON COLUMN MUNICIPIOS.FECHA_MOD IS 'Fecha de modificacion del registro en tabla municipios';

COMMENT ON TABLE PACIENTES IS 'Tabla que almacena los pacientes';
COMMENT ON COLUMN PACIENTES.DUI IS 'Llave primaria de la tabla pacientes';
COMMENT ON COLUMN PACIENTES.NOMBRE IS 'almacena el nombre del paciente';
COMMENT ON COLUMN PACIENTES.GENERO IS 'genero del paciente';
COMMENT ON COLUMN PACIENTES.FECHA_NAC IS 'fecha de nacimiento de los pacientes';
COMMENT ON COLUMN PACIENTES.EMAIL IS 'correos de el paciente';
COMMENT ON COLUMN PACIENTES.DIRECCION IS 'Direccion del pacientes';
COMMENT ON COLUMN PACIENTES.TELEFONO IS 'Telefono del paciente';
COMMENT ON COLUMN PACIENTES.PROFESION IS 'Describe la profesion del paciente';
COMMENT ON COLUMN PACIENTES.ESTADO IS 'Describe el estado actual del pacientes';
COMMENT ON COLUMN PACIENTES.USUARIO_CREADOR IS 'usuario que creo el registro en la tabla pacientes';
COMMENT ON COLUMN PACIENTES.USUARIO_MOD IS 'Usuario que modifico por ultima vez el registro en tabla pacientes';
COMMENT ON COLUMN PACIENTES.FECHA_MOD IS 'Fecha de modificacion del registro en tabla pacientes';

COMMENT ON TABLE RECETA IS 'Tabla que almacena las recetas de los usuarios';
COMMENT ON COLUMN RECETA.ID_RECETA IS 'Llave primaria de la tabla receta';
COMMENT ON COLUMN RECETA.SINTOMAS_ASUNTO IS 'Almacena los sintomas espuestos por el paciente';
COMMENT ON COLUMN RECETA.HORAINI IS 'hora inicio de la consulta';
COMMENT ON COLUMN RECETA.HORAFIN IS 'Hora final de la consulta';
COMMENT ON COLUMN RECETA.USUARIO_CREADOR IS 'Usuario que crea un registro en la tabla receta';
COMMENT ON COLUMN RECETA.ID_CITAMEDICAMENTO IS 'Fecha de la creacion del registro en tabla receta';
COMMENT ON COLUMN RECETA.FECHA_CREADO IS 'Fecha de la creacion del registro en tabla receta';
COMMENT ON COLUMN RECETA.USUARIO_MOD IS 'Usuario que modifico por ultima vez el registro en tabla receta';
COMMENT ON COLUMN RECETA.FECHA_MOD IS 'Fecha de modificacion del registro en tabla receta';

COMMENT ON TABLE USUARIOS IS 'Tabla que almacena los usuarios';
COMMENT ON COLUMN USUARIOS.ID IS 'Llave primaria de la tabla usuarios';
COMMENT ON COLUMN USUARIOS.NOMBRE IS 'Almacena el nombre del usuario';
COMMENT ON COLUMN USUARIOS.PASSWORD IS 'almacena la contraseña del usuario';
COMMENT ON COLUMN USUARIOS.EMAIL IS 'almacena el correo de los usuarios';
COMMENT ON COLUMN USUARIOS.USUARIO_CREADOR IS 'Describe el estado actual del usuarios';
COMMENT ON COLUMN USUARIOS.ROLE IS 'especifica el rol que tienen los usuarios';
COMMENT ON COLUMN USUARIOS.ID_CITAMEDICAMENTO IS 'llave foranea de la tabla CITA_MEDICAMENTOS';
COMMENT ON COLUMN USUARIOS.FECHA_CREADO IS 'Fecha de la creacion del registro en tabla usuarios';
COMMENT ON COLUMN USUARIOS.USUARIO_MOD IS 'Usuario que modifico por ultima vez el registro en tabla usuarios';
COMMENT ON COLUMN USUARIOS.FECHA_MOD IS 'Fecha de modificacion del registro en tabla usuarios';


COMMENT ON TABLE ZONAS_DEP IS 'Tabla que almacena las zonas_dep de los usuarios';
COMMENT ON COLUMN ZONAS_DEP.NUMBER_ID IS 'Llave primaria de la tabla zonas_dep';
COMMENT ON COLUMN ZONAS_DEP.NOMBRE_ZONA IS 'Almacena el nombre de las zonas_dep';
COMMENT ON COLUMN ZONAS_DEP.USUARIO_CREADOR IS 'usuario que crea los registros zonas_dep';
COMMENT ON COLUMN ZONAS_DEP.FECHA_CREADO IS 'Fecha de la creacion del registro en tabla zonas_dep';
COMMENT ON COLUMN ZONAS_DEP.USUARIO_MOD IS 'Usuario que modifico por ultima vez el registro en tabla zonas_dep';
COMMENT ON COLUMN ZONAS_DEP.FECHA_MOD IS 'Fecha de modificacion del registro en tabla zonas_dep';

************************************** Crear Usuario **************************************/
-- Usuario sin derecho a guardar o crear
CREATE USER lector_db IDENTIFIED BY 654321;
GRANT CONNECT to lector_db;
-- Eliminar Usuario 
DROP USER lector_db CASCADE;

-- Usuario con acceso a todo
CREATE USER admin_db IDENTIFIED BY 654321
DEFAULT TABLESPACE SYSTEM  
       TEMPORARY TABLESPACE temp
       QUOTA UNLIMITED ON SYSTEM;

-- Permisos de conexion y demas       
GRANT CONNECT to admin_db;
GRANT CREATE SESSION TO admin_db;
GRANT CREATE SEQUENCE TO admin_db;
GRANT CREATE TRIGGER TO admin_db;
GRANT CREATE VIEW TO admin_db;
GRANT CREATE TABLE TO admin_db;

/************************************** CREACION DE ROLES **************************************/
CREATE ROLE rol_administrador;
DROP ROLE rol_administrador;
--Asignando permisos.

CREATE ROLE rol_administrador;
GRANT select,insert,update,delete ON barrios_colonias TO rol_administrador;
GRANT select,insert,update,delete ON cita_detalles TO rol_administrador;
GRANT select,insert,update,delete ON cita_medicamentos TO rol_administrador;
GRANT select,insert,update,delete ON departamentos TO rol_administrador;
GRANT select,insert,update,delete ON enfermedades TO rol_administrador;
GRANT select,insert,update,delete ON especialidades TO rol_administrador;
GRANT select,insert,update,delete ON especialidadxmedico TO rol_administrador;
GRANT select,insert,update,delete ON medicamentos TO rol_administrador;
GRANT select,insert,update,delete ON municipios TO rol_administrador;
GRANT select,insert,update,delete ON pacientes TO rol_administrador;
GRANT select,insert,update,delete ON receta TO rol_administrador;
GRANT select,insert,update,delete ON usuarios TO rol_administrador;
GRANT select,insert,update,delete ON zonas_dep TO rol_administrador;

CREATE ROLE rol_lectura;
GRANT SELECT ON barrios_colonias TO rol_lectura;
GRANT SELECT ON cita_detalles TO rol_lectura;
GRANT SELECT ON cita_medicamentos TO rol_lectura;
GRANT SELECT ON departamentos TO rol_lectura;
GRANT SELECT ON enfermedades TO rol_lectura;
GRANT SELECT ON especialidades TO rol_lectura;
GRANT SELECT ON especialidadxmedico TO rol_lectura;
GRANT SELECT ON medicamentos TO rol_lectura;
GRANT SELECT ON municipios TO rol_lectura;
GRANT SELECT ON pacientes TO rol_lectura;
GRANT SELECT ON receta TO rol_lectura;
GRANT SELECT ON usuarios TO rol_lectura;
GRANT SELECT ON zonas_dep TO rol_lectura;

 -- Asignacion de rol al usuario
GRANT rol_administrador TO admin_bd;

/************************************** Perfiles de usuarios **************************************/
CREATE PROFILE app_user LIMIT 
  SESSIONS_PER_USER                 2   --
  CPU_PER_SESSION               10000   -- decimas de segundo
  CPU_PER_CALL                      1   -- decimas de segundo
  CONNECT_TIME              UNLIMITED   -- minutos
  IDLE_TIME                        30   -- minutos - tiempo que puede estar una sesión sin hacer nada antes de ser cerrada.
  LOGICAL_READS_PER_SESSION   DEFAULT   -- DB BLOCKS
  LOGICAL_READS_PER_CALL      DEFAULT   -- DB BLOCKS
  -- COMPOSITE_LIMIT          DEFAULT   -- 
  PRIVATE_SGA                     20M   -- 
  FAILED_LOGIN_ATTEMPTS             3   --
  PASSWORD_LIFE_TIME               30   -- dias
  PASSWORD_REUSE_TIME              12   --
  PASSWORD_REUSE_MAX        UNLIMITED   -- 
  PASSWORD_LOCK_TIME          DEFAULT   -- dias
  PASSWORD_GRACE_TIME               2   -- dias
  PASSWORD_VERIFY_FUNCTION       NULL;
  
-- Asinar perfil a usuario
ALTER USER admin_bd PROFILE app_user;

-- Mostrar Listado de usuarios creados   
SELECT * FROM dba_users WHERE created>='27-MAR-19';

/************************************** Mostrar Diccionario **************************************/
SELECT TABLE_NAME TABLA, COMMENTS COMENTARIO 
FROM USER_TAB_COMMENTS
WHERE 
TABLE_NAME NOT LIKE '%$%' 
AND TABLE_NAME NOT LIKE 'SCHED%'
AND TABLE_NAME NOT LIKE 'MVIEW%'
AND COMMENTS IS NOT NULL
ORDER BY TABLA;

-- Detalles de directorios y campos 
SELECT 
X.TABLE_NAME NOMBRE_TABLA, X.COLUMN_ID POSICION, 
LLAVE,
X.COLUMN_NAME NOMBRE_COLUMNA, 
DATA_TYPE TIPO_DATO, DATA_LENGTH LONGITUD, COMMENTS COMENTARIO
FROM
(
    SELECT A.TABLE_NAME, A.COLUMN_ID, A.COLUMN_NAME,
    A.DATA_TYPE, A.DATA_LENGTH, 
    B.COMMENTS

    FROM USER_TAB_COLUMNS A
    LEFT JOIN USER_COL_COMMENTS B
    ON A.TABLE_NAME = B.TABLE_NAME
    AND A.COLUMN_NAME=B.COLUMN_NAME
    WHERE 
    A.TABLE_NAME NOT LIKE '%$%' 
    AND A.TABLE_NAME NOT LIKE 'SCHED%'
    AND A.TABLE_NAME NOT LIKE 'MVIEW%'
    AND B.COMMENTS IS NOT NULL
) X 
LEFT JOIN
(
    SELECT UC.TABLE_NAME, COLUMN_NAME, 
    CASE CONSTRAINT_TYPE 
        WHEN 'P' THEN 'PK' 
        WHEN 'R' THEN 'FK'
    END LLAVE
    FROM USER_CONSTRAINTS UC
    LEFT JOIN USER_CONS_COLUMNS UCC
    ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
    WHERE UC.CONSTRAINT_TYPE='P'
    OR UC.CONSTRAINT_TYPE='R'
) Y
ON X.TABLE_NAME=Y.TABLE_NAME 
AND X.COLUMN_NAME = Y.COLUMN_NAME
ORDER BY X.TABLE_NAME, X.COLUMN_ID;



---------------------------- TRIGGERS-----------------------------------
create or replace 
trigger insert_CITAMED
before insert on CITA_MEDICAMENTOS
for each row
begin select sysdate,user into :new.fecha_creado,:new.usuario_creador from dual;
end;

create or replace 
trigger insert_dep
before insert on departamentos
for each row
begin select sysdate,user into :new.fecha_creado,:new.usuario_creador from dual;
end;

create or replace 
trigger UPDATE_CITAMED
before UPDATE on CITA_MEDICAMENTOS
for each row
begin SELECT sysdate,user into :new.fecha_MOD,:new.usuario_MOD from dual;
end;

create or replace 
trigger UPDATE_dep
before UPDATE on departamentos
for each row
begin SELECT sysdate,user into :new.fecha_MOD,:new.usuario_MOD from dual;
end;

create or replace 
trigger UPDATE_MED
before UPDATE on MEDICAMENTOS
for each row
begin SELECT sysdate,user into :new.fecha_MOD,:new.usuario_MOD from dual;
end;


-------------------------------------------------------------
---------------------PROCEDIMIENTOS--------------------------------------------

create or replace 
PROCEDURE ADD_CITAMEDICAMENTO
(  
   ID_CITA cita_medicamentos.id_citamedicamento%TYPE,
   COD cita_medicamentos.cod_barra%TYPE,
   FECHAVE cita_medicamentos.fecha_vencimiento%TYPE,
   LAB cita_medicamentos.laboratorio%TYPE)
as

   v_id NUMBER;
   v_COD_BARRA number;
  
  
 begin
   v_id := 0;
   v_COD_BARRA :=0;
    
sELECT count (ID_CITAMEDICAMENTO) INTO v_id FROM cita_medicamentos  WHERE id_citamedicamento = ID_CITA;
SELECT count (COD_BARRA) INTO v_COD_BARRA FROM medicamentos WHERE COD_BARRA = COD;

    
      iF(v_id =0 and v_COD_BARRA =1 )then
--consulta para saber si existen registros con el parámetro enviado en la tabla. 
INSERT INTO cita_medicamentos (id_citamedicamento,COD_BARRA,fecha_vencimiento,laboratorio)VALUES (id_cita,cod,fechave,lab);
commit;

         
       else
      DBMS_OUTPUT.PUT_LINE('EL REGISTRO NO HA SIDO ENCONTRADO PARA SER ACTUALIZADO.' );
     end if;
end; 
-------------------------------------------------------------------------------------------------


create or replace 
PROCEDURE ADD_MEDICAMENTOS
(  
   cod_bar MEDICAMENTOS.COD_BARRA%TYPE,
   descri MEDICAMENTOS.DESCRIPCION%TYPE)
as

   v_id NUMBER;
   v_descripcion number;
  
 begin
   v_id := 0;
   v_descripcion :=0;
    
sELECT count (cod_barra) INTO v_id FROM medicamentos  WHERE cod_barra = cod_bar;
SELECT count (descripcion) INTO v_descripcion FROM medicamentos WHERE descripcion = descri;

    
      iF(v_id =0 and v_descripcion =0)then
--consulta para saber si existen registros con el parámetro enviado en la tabla. 
INSERT INTO medicamentos (cod_barra,descripcion)VALUES (cod_bar,descri);
commit;

         
       else
      DBMS_OUTPUT.PUT_LINE('EL REGISTRO NO HA SIDO ENCONTRADO PARA SER ACTUALIZADO.' );
     end if;
end; 


create or replace 
PROCEDURE update_CITAMEDICAMENTO
(
id_cita cita_medicamentos.id_citamedicamento%type,
lab cita_medicamentos.laboratorio%type)
as

   v_cita number;
    
 begin
   v_cita := 0;
      
sELECT count (ID_CITAMEDICAMENTO) INTO v_cita FROM cita_medicamentos  WHERE id_citamedicamento = ID_CITA;

    
      iF( v_cita=1 )then
--consulta para saber si existen registros con el parámetro enviado en la tabla. 
update cita_medicamentos set laboratorio=lab where id_citamedicamento=id_cita;
commit;

         
       else
      DBMS_OUTPUT.PUT_LINE('EL REGISTRO NO HA SIDO ENCONTRADO PARA SER ACTUALIZADO.' );
     end if;
end; 


----------------------------------------------------------------------------------------------------

create or replace 
PROCEDURE UPDATE_MEDICAMENTOS
(  
   cod_bar MEDICAMENTOS.COD_BARRA%TYPE,
   descri MEDICAMENTOS.DESCRIPCION%TYPE)
as

   v_id NUMBER;
  
 begin
   v_id := 0;
    
sELECT count (cod_barra) INTO v_id FROM medicamentos  WHERE cod_barra = cod_bar;

    
      iF(v_id =1)then
--consulta para saber si existen registros con el parámetro enviado en la tabla. 
UPDATE  medicamentos  SET descripcion=descri WHERE COD_BARRA=COD_BAR;
commit;

         
       else
      DBMS_OUTPUT.PUT_LINE('EL REGISTRO NO HA SIDO ENCONTRADO PARA SER ACTUALIZADO.' );
     end if;
end;