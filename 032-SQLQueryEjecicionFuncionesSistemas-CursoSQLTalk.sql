-- ## ### #####################################################################
-- ## FUNCIONES DE CONFIGURACION
-- ## ### #####################################################################
 

-- obtendrás la versión de SQL Server en la ventana de resultados. 
-- La función @@VERSION devuelve una cadena de texto que incluye 
-- información detallada sobre la versión de SQL Server
---(218)


SELECT @@VERSION AS SQLServerVersion;


-- obtendrás el número máximo de conexiones permitidas en SQL Server 
-- en la columna MaxConnections en la ventana de resultados.
---(219)

SELECT max_workers_count AS MaxConnections
FROM sys.dm_os_sys_info;

-- obtendrás el lenguaje actual configurado en SQL Server 
-- en la ventana de resultados. La función @@LANGUAGE devuelve 
-- una cadena de texto que representa el lenguaje actual 
-- utilizado por SQL Server.
---(220)

SELECT @@LANGUAGE AS CurrentLanguage;

--  obtendrás el valor configurado para el primer día de la semana 
--  en SQL Server en la ventana de resultados. 
--  La función @@DATEFIRST 
--  devuelve un número entero que representa el valor 
--  configurado para el primer día de la semana, 
--  donde 1 corresponde a domingo, 2 corresponde a lunes y 
--  así sucesivamente.
---(221)

SELECT @@DATEFIRST AS DateFirstValue;


-- En este caso, establecemos el valor 2 para configurar el primer día de la semana en lunes. 
-- Puedes utilizar los siguientes valores:
/*
1 para domingo.
2 para lunes.
3 para martes.
4 para miércoles.
5 para jueves.
6 para viernes.
7 para sábado.
*/
--- (222)

SET DATEFIRST 2;


-- obtendrás el valor de tiempo de espera de bloqueo configurado 
-- en SQL Server en la ventana de resultados. La función 
-- @@LOCK_TIMEOUT devuelve un número entero 
-- que representa el tiempo de espera de bloqueo configurado 
--- en milisegundos.
---(217)  --- NO VA PARA EL CURSO
SELECT @@LOCK_TIMEOUT AS LockTimeoutValue;
