--- ### ## ###############################################
--- ### ##  FUNCION DE SEGURIDAD
--- ### ## ###############################################
--- ### ## ###############################################

--- ### ## #####################################################
--- ### ## devuelve el nombre de inicio de sesión del usuario 
--- ### ## en la base de datos, no el nombre de usuario del 
--- ### ## sistema operativo. Si deseas obtener el nombre de 
--- ### ## usuario del sistema operativo, puedes considerar 
--- ### ## el uso de funciones 
--- ### ## #####################################################
--- ### ## #####################################################
---(186)
USE AdventureWorks2016_EXT

SELECT USER_NAME() AS UserName;

/*
    SQL Server devuelve el nombre de inicio de sesión del usuario actual 
    que está ejecutando la consulta. Proporciona información sobre la identidad 
    del usuario que está realizando la operación en ese momento.
*/

---(187)
SELECT CURRENT_USER AS CurrentUser;

/*
    Devuelve el nombre de usuario de la sesión actual que está ejecutando la consulta. 
    Proporciona información sobre la identidad del usuario asociado a la conexión actual.
*/

---(188)
SELECT SESSION_USER AS SessionUser;

--- ### ## ###############################################
--- ### ## USUARIO CON LA SE ENTRO A LA BASE DATOS
--- ### ## ###############################################

/*
    devuelve el nombre de inicio de sesión original que se utilizó para establecer 
    la conexión con la base de datos. Esto es útil cuando existe una cadena de cambios 
    de contexto de seguridad, como cuando un usuario se conecta a través de una cuenta 
    de Windows y luego se autentica en la base de datos utilizando un nombre de usuario 
    y contraseña diferentes.
*/
---(189)
SELECT ORIGINAL_LOGIN() AS UserNameDB;

/*
    devuelve el nombre de inicio de sesión asociado con la identidad actualmente conectada 
    a la base de datos. Proporciona información sobre el nombre de inicio de sesión del 
    usuario que está ejecutando la consulta.
*/
---(190)
SELECT SUSER_SNAME() AS UserNameDB;

--- ### ## ################################################################
--- ### ## si deseas verificar si el usuario "MiUsuario" === > Horus  
--- ### ## es miembro del rol de servidor "sysadmin",
--- ### ## ################################################################
---(191)
SELECT IS_SRVROLEMEMBER('sysadmin', 'Horus') AS IsMember;

--- ### ## ####################################################################
--- ### ## Devuelve el número de paquetes de entrada leídos de la red por SQL 
--- ### ## Server desde que se inició por última vez.
--- ### ## ####################################################################
/*
En SQL, un "paquete" se refiere a un conjunto de instrucciones 
SQL que se agrupan y se envían al servidor de bases de datos 
para su procesamiento. Los paquetes pueden ser utilizados en 
diferentes contextos, como procedimientos almacenados, funciones 
,paquetes de integración de servicios de SQL Server (SSIS), 
instrucciones sql.
*/
---(192)
SELECT @@PACK_RECEIVED AS 'Packets Received';
