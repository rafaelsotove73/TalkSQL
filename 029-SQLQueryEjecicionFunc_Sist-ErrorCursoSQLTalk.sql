

--- ########################################################
--- ###  @@ROWCOUNT DEVUELVE FILAS AFECTADAS EN LA ULTIMA
--- ###  TRASACCION DE SQL
--- ########################################################
---(175)

USE AdventureWorks2016_EXT;

SELECT TOP(5) p.Name, sod.UnitPrice , sod.LineTotal
FROM Sales.SalesOrderDetail sod
RIGHT JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE sod.SalesOrderID IS NULL
ORDER BY p.Name;

SELECT @@ROWCOUNT AS Columnas_Afectadas ;
/*
--- ########################################################
--- ###  Cuando insertas una fila en una tabla que tiene una 
--- ### columna de identidad, SQL Server asigna automáticamente 
--- ### un valor único a esa columna. Después de realizar la inserción, 
--- ### puedes utilizar la función @@IDENTITY para obtener el último valor 
--- ### de identidad generado en esa conexión de base de datos.
--- ########################################################
*/
---(176)

DROP TABLE MiTabla;

CREATE TABLE MiTabla (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Nombre VARCHAR(50)
);

INSERT INTO MiTabla (Nombre) VALUES ('Ejemplo');

SELECT @@IDENTITY AS IdentityValue;

/*
  La función SCOPE_IDENTITY() devuelve el último valor de identidad 
  generado en el ámbito actual y es especialmente útil cuando se realizan 
  inserciones en tablas que tienen disparadores (triggers) que podrían realizar 
  inserciones adicionales en otras tablas.
  La función SCOPE_IDENTITY() es más segura de utilizar
*/
---(177)

SELECT SCOPE_IDENTITY() AS IdentityValue01;

/*
  la función IDENT_CURRENT('MiTabla') devuelve el último valor 
  de identidad generado en la tabla "MiTabla". El nombre de la tabla 
  se pasa como argumento a la función IDENT_CURRENT().

  Es importante destacar que IDENT_CURRENT() no está relacionada con el 
  ámbito de la conexión o la transacción actual. Devuelve el valor más 
  reciente de identidad generado en la tabla especificada, 
  independientemente de dónde se haya generado o qué conexión lo haya insertado.

*/
---(178)

SELECT IDENT_CURRENT('MiTabla') AS IdentityValue02;

--- ########################################################
--- ###  @@ERROR = SI EXISTE UN ERROR EN SENTECIA SQL ESTA
--- ###  FUNCION  CAPTURA DE ERROR
--- ########################################################
---(179)

--- LISTA DE ERRORES SQL
--- ########################################################

---// Error 2601:  Violación de restricción de clave única.
---// Error 2627:  Violación de restricción de clave duplicada.
---// Error 547:   Violación de restricción de clave externa.
---// Error 102:   Sintaxis incorrecta cerca de... Se produce 
---//              cuando hay un error de sintaxis en una consulta o instrucción SQL.
---// Error 8152:  Desbordamiento de columna.
---// Error 50000: Error personalizado. Puedes utilizar este número de error 
---//              para crear tus propios mensajes de error personalizados dentro de 
---//              procedimientos almacenados, funciones o desencadenadores.
---// Error 8134:  División por cero.
---// Error 1205:  Deadlock detectado.
---// Error 208:   Nombre de objeto no válido.
---// Error 4060:  Error de inicio de sesión.
---// Error 18456: Error de inicio de sesión debido a credenciales incorrectas.
---// Error 229:   Permiso denegado en el objeto.
---// Error 823:   Error de E/S. Se produce cuando hay un problema de lectura 
---//              o escritura en el nivel físico de los archivos de la base de datos.
---// Error 4060:  Base de datos no encontrada. Se produce cuando se intenta acceder a 
---//              una base de datos que no existe en el servidor.
---//

DECLARE @ErrorVar INTEGER

SELECT 1/0; -- División por cero para generar un error
SELECT @ErrorVar = (SELECT @@ERROR);
PRINT(@ErrorVar)

IF @ErrorVar = 8134
   PRINT('División por cero.') 


--- ###########################################
----  VARIANTE 
--- ###########################################
---(180)

SELECT 1/0; -- División por cero para generar un error
SELECT @@ERROR AS LastError;

/*
###########################################################################
  La función ERROR_NUMBER() es útil cuando necesitas obtener el código de 
  error específico para identificar y manejar diferentes tipos de errores 
  de manera personalizada. Puedes utilizar este número de error en estructuras 
  de control de flujo, como condicionales IF, para realizar acciones específicas 
  según el tipo de error capturado.
##########################################################################
*/
---(181)

BEGIN TRY
    -- Tu consulta o instrucción aquí
    DECLARE @Result INT;
    SET @Result = 1/0; -- Genera un error de división entre cero
    SELECT @Result;
END TRY
BEGIN CATCH
    -- Captura el código de error con ERROR_NUMBER()
    SELECT 'Código de error: ' + CAST(ERROR_NUMBER() AS VARCHAR(10)) AS Error;
END CATCH;


--- ############################################
/*

  ERROR_STATE(): La función ERROR_STATE() devuelve el estado de error asociado con 
  la última excepción capturada. Proporciona un número entero que indica el estado 
  específico del error. El estado de error es una información adicional que puede 
  proporcionar detalles sobre el tipo de error que se ha producido. 
  Puede ser útil para realizar acciones específicas basadas en el estado del error capturado.

  ERROR_SEVERITY(): La función ERROR_SEVERITY() devuelve el nivel de gravedad del último error 
  capturado. Proporciona un número entero que representa el nivel de severidad del error. 
  Los niveles de severidad van de 0 a 25, donde 0 indica un mensaje informativo y 25 indica un 
  error grave que termina la ejecución del lote. Puedes utilizar esta función para determinar 
  el nivel de gravedad del error capturado y tomar acciones apropiadas en consecuencia.

  %%%%%%%%%%%
  LISTA
   ===>  Nivel 0: Mensaje informativo. Estos errores proporcionan información útil o mensajes de estado 
         sobre la ejecución de una consulta o instrucción. No se consideran errores graves y no interrumpen 
         la ejecución del lote.

   ===> Niveles de 1 a 9: Estos niveles se utilizan para mensajes informativos y advertencias. 
        Indican problemas o condiciones inusuales, pero no se consideran errores graves. 
        No interrumpen la ejecución del lote y pueden ser útiles para proporcionar detalles 
        adicionales sobre el proceso.

   ===> Niveles de 10 a 18: Estos niveles se utilizan para errores leves y errores de usuario. 
        Indican condiciones de error que generalmente pueden ser manejadas por la aplicación o el 
        código T-SQL. No interrumpen la ejecución del lote, pero pueden requerir acciones correctivas 
        o manejo especial.

   ===> Niveles de 19 a 25: Estos niveles se utilizan para errores graves y errores del sistema. 
        Indican condiciones de error graves que requieren intervención inmediata. Interrumpen 
        la ejecución del lote y generan una excepción que puede ser capturada y manejada 
        utilizando bloques TRY-CATCH u otros mecanismos de manejo de errores. Los errores de nivel 
        20 o superior son considerados como errores fatales y pueden causar la terminación del 
        proceso o la conexión.

  ERROR_PROCEDURE(): La función ERROR_PROCEDURE() devuelve el nombre del procedimiento almacenado, 
  la función o el desencadenador que generó el último error capturado. Si el error no está 
  relacionado con un procedimiento almacenado, función o desencadenador, esta función devuelve NULL. 
  Es útil para identificar qué objeto de base de datos causó el error, lo que puede ser útil 
  para depurar y solucionar problemas en tu código.

  ERROR_LINE(): La función ERROR_LINE() devuelve el número de línea en el que ocurrió el último 
  error capturado. Proporciona un número entero que indica la línea exacta del código T-SQL 
  donde se generó el error. Esta función es útil para localizar rápidamente el origen del 
  error en tu código y realizar las correcciones necesarias.

  ERROR_MESSAGE(): La función ERROR_MESSAGE() devuelve el mensaje de error completo del último 
  error capturado. Proporciona información detallada sobre el error, incluyendo una descripción 
  del problema y a menudo información adicional como nombres de columnas o valores involucrados. 
  Puedes utilizar esta función para obtener el mensaje de error completo y mostrarlo, 
  almacenarlo en una tabla de registro de errores o realizar acciones basadas en el contenido 
  del mensaje de error.

*/

USE AdventureWorks2016_EXT
GO
-- Basic example of TRY...CATCH
 
BEGIN TRY
-- Generate a divide-by-zero error  
  SELECT
    1 / 0 AS Error;
END TRY
BEGIN CATCH
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

--- ####################################################################
--- ###  @@TRANCOUNT DEVUELVE EL NUMERO DE TRASACCIONES ACTIVAS
--- ###  PARA LA SESION ACTUAL + COMMIT
--- ### En SQL Server, la instrucción COMMIT se utiliza para confirmar 
--- ### y finalizar una transacción. Una transacción es una secuencia 
--- ### lógica de operaciones de bases de datos que se ejecutan como una 
--- ### unidad indivisible. Al utilizar la instrucción COMMIT, se asegura 
--- ### que los cambios realizados en una transacción sean permanentes y 
--- ### se guarden de manera definitiva en la base de datos.
--- ####################################################################
---(182)

BEGIN TRANSACTION;

    SELECT @@TRANCOUNT AS TransactionCount;

    COMMIT;


--- ########################################################
--- ###  @@TRANCOUNT DEVUELVE EL NUMERO DE TRASACCIONES ACTIVAS
--- ###  PARA LA SESION ACTUAL
--- ########################################################
---(183)

DECLARE @NTRA AS INTEGER
BEGIN TRANSACTION;
  SELECT  @NTRA = (SELECT @@TRANCOUNT AS TransactionCount);
  
  IF @NTRA = 0
    BEGIN
        PRINT('ROLLBACK')
        ROLLBACK
    END
  ELSE
    BEGIN
        PRINT('COMMIT')
        COMMIT
    END

--- ########################################################
--- ###  DB_NAME() Esta consulta utiliza la función DB_NAME() 
--- ###  para obtener el nombre de la base de datos actual y 
--- ###  lo muestra en una columna llamada "DatabaseName".
--- ########################################################
---(184)

SELECT DB_NAME() AS DatabaseName;

--- ########################################################
--- ###  Esta consulta utiliza la función OBJECT_ID() para 
--- ###  obtener el identificador numérico del objeto 
--- ###  especificado y lo muestra en una columna llamada "ObjectID".
--- ###  Por ejemplo, si deseas obtener el identificador de 
--- ###  una tabla llamada "MiTabla"
--- ########################################################
---(185)

SELECT OBJECT_ID('MiTabla') AS ObjectID;
