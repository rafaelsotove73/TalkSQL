--- ### ### ##################################################################
--- ### ### CAMBIO DE NOMBRE DE BASE DE DATOS PROCESO: QUE 
--- ### ### INCLUYE CAMBIO USO DE BASE DE DATOS SINGLE_USER
--- ### ### (UN SOLO USUARIO) CAMBIO DE NOMBRE BASE DE DATOS Y
--- ### ###  NUEVAMENTE CAMBIO DE USO A MULTI USUARIO
--- ### ### ##################################################################


-- (243)
USE master;  
GO  
ALTER DATABASE GestorContrasennas_Demo 
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
ALTER DATABASE GestorContrasennas_Demo 
MODIFY NAME = GestorContrasennas;
GO  
ALTER DATABASE GestorContrasennas SET MULTI_USER;
GO

-- ### ### ##################################################################
--- ### ###  ESTA EXPRESION SIRVE PARA SOLUCIONAR PROBLEMAS CUANDO UNA BASE 
--- ### ###  DE DATOS SE CUELGA POR ASI DECIRLO EN MODO MONO USUARIO
--- ### ### 
--- ### ### ##################################################################
-- (244)
ALTER DATABASE GestorContrasennas SET MULTI_USER;
GO
