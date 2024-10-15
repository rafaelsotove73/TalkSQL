
--- ## ### ############################################################
--- ## ###  TEST JSON QUERY AdventureWorks2016_EXT DATA BASE  
--- ## ###  JSON_QUERY
--- ## ### ############################################################
 
-------------------------------------
--- despliege de json de campo info
--- en columnas individuales
-------------------------------------
/*
JSON_QUERY() para extraer fragmentos específicos del JSON almacenado en la columna Info. 
A continuación, se explica cada parte de la instrucción:
SELECT SalesOrderNumber, OrderDate, ...: Selecciona las columnas SalesOrderNumber y OrderDate 
de la tabla. JSON_QUERY(Info, '$.ShippingInfo') ShippingInfo: 
Utiliza la función JSON_QUERY() para extraer el fragmento JSON de la columna Info que 
corresponde a la clave '$.ShippingInfo'. El resultado se asigna a la columna ShippingInfo. 
Esto implica que se selecciona el contenido del fragmento JSON de Info correspondiente a la clave 
'ShippingInfo'. JSON_QUERY(Info, '$.BillingInfo') BillingInfo: Similar al caso anterior, se utiliza 
JSON_QUERY() para extraer el fragmento JSON correspondiente a la clave '$.BillingInfo' de la columna 
Info. El resultado se asigna a la columna BillingInfo. JSON_QUERY(OrderItems, '$') 
OrderItems: Utiliza JSON_QUERY() para extraer el fragmento JSON completo de la columna OrderItems. 
El resultado se asigna a la columna OrderItems. FROM [AdventureWorks2016_EXT].
[Sales].[SalesOrder_json] [SOr_j]: Especifica la tabla [AdventureWorks2016_EXT].
[Sales].[SalesOrder_json] y la aliasa como [SOr_j]. WHERE ISJSON(Info) > 0: Filtra las 
filas donde el contenido de la columna Info sea un JSON válido. 
La función ISJSON() se utiliza para verificar si un valor es un JSON válido y devuelve 1 si 
es verdadero.En resumen, esta instrucción selecciona las columnas SalesOrderNumber y 
OrderDate junto con los fragmentos JSON de Info relacionados con 'ShippingInfo', 
'BillingInfo' y OrderItems. También filtra las filas donde Info contiene un JSON válido.
*/

---(230)
 USE AdventureWorks2016_EXT
 SELECT 
    SalesOrderNumber                             ---> Colum 0
    ,OrderDate,                                  ---> Colum 1
    INFO,
 JSON_QUERY(Info,'$.ShippingInfo') ShippingInfo, ---> Colum 2 
 JSON_QUERY(Info,'$.BillingInfo') BillingInfo,   ---> Colum 3
 JSON_QUERY(Info,'$.SalesPerson') SalesPerson,   ---> Colum 4
 JSON_QUERY(OrderItems,'$') OrderItems           ---> Colum 5
FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
WHERE ISJSON(Info) > 0;


---> Colum 2
---######################################
/*
{
    "Address": "42525 Austell Road",
    "City": "Austell",
    "PostalCode": "30106",
    "Province": "Georgia",
    "TerritoryID": 5,
    "Method": "CARGO TRANSPORT 5",
    "ShipBase": 8.99,
    "ShipRate": 1.49
}
*/
---> Colum 3
---######################################
/*
{
    "Address": "42525 Austell Road",
    "City": "Austell",
    "PostalCode": "30106"
}
*/

---> Colum 4
---######################################
/*
{
    "Name": "Tsvi Reiter",
    "ID": 279
}
*/

--- ### ### ####################################################
--- ### ### PROCESO LARGO PARA TRATAMIENTO DE CAMPOS JSON (INFO)
--- ### ### DESGLOSE DE PARTE DE CAMPO INFO. COMO LO MUESTRA SELECT
--- ### ### Y COMENTARIO  ANTERIOR
--- ### ### ####################################################
---(231)

SELECT 
    SalesOrderNumber                               ---> Colum 0
    ,OrderDate,                                    ---> Colum 1
 JSON_QUERY(Info,'$.ShippingInfo') ShippingInfo,   ---> Colum 2 
 JSON_QUERY(Info,'$.BillingInfo') BillingInfo,     ---> Colum 3
 JSON_QUERY(Info,'$.SalesPerson') SalesPersonInfo, ---> Colum 4
 JSON_QUERY(OrderItems,'$') OrderItems             ---> Colum 5
FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
WHERE [SOr_j].[SalesOrderID] = '43659';

---(232)

DECLARE @NSale_Order AS INTEGER = 43659
DECLARE @ShippingInf AS NVARCHAR(MAX) =(SELECT 
                                           JSON_QUERY(Info,'$.ShippingInfo') ShippingInfo
                                        FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
                                        WHERE [SOr_j].[SalesOrderID] = @NSale_Order )
DECLARE @BillingInf AS NVARCHAR(MAX) =(SELECT 
                                           JSON_QUERY(Info,'$.BillingInfo') BillingInfo
                                       FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
                                       WHERE [SOr_j].[SalesOrderID] = @NSale_Order )
DECLARE @SalesPersonInf AS NVARCHAR(MAX) =(SELECT 
                                            JSON_QUERY(Info,'$.SalesPerson') SalesPersonInfo
                                           FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
                                           WHERE [SOr_j].[SalesOrderID] = @NSale_Order )

--- ### #### COMPROBACION DE RESULTADOS --- BEGIN

PRINT('----------------')
PRINT(@NSale_Order)
PRINT('----------------')
PRINT(@ShippingInf)
PRINT('----------------')
PRINT(@BillingInf)
PRINT('----------------')
PRINT(@SalesPersonInf)
PRINT('----------------')

--- ### #### COMPROBACION DE RESULTADOS --- FINISH

USE AdventureWorks2016_EXT
SELECT      
   @NSale_Order SalesOrderNumber
   -------------------- *** @SalesPersonInf ***
   ,JSON_VALUE(@SalesPersonInf, '$.Name') AS [Name]
   ,JSON_VALUE(@SalesPersonInf, '$.ID') AS [ID]
   --------------------  *** @BillingInf ***
   ,JSON_VALUE(@BillingInf, '$.Address') AS [Address]
   ,JSON_VALUE(@BillingInf, '$.City') AS [City]
   ,JSON_VALUE(@BillingInf, '$.PostalCode') AS [PostalCode]
   -------------------- *** @ShippingInf ***
   ,JSON_VALUE(@ShippingInf, '$.Province') AS [Province]
   ,JSON_VALUE(@ShippingInf, '$.Method') AS [Method]
   ,JSON_VALUE(@ShippingInf, '$.ShipBase') AS [ShipBase]
   ,JSON_VALUE(@ShippingInf, '$.ShipRate') AS [ShipRate];
   ---------------------


--- ### ### #################################################################
--- ### ### VARIANTE PARA SELECT ANTERIOR MOFIFICANDO EL JSON  Y MOSTRANDO
--- ### ### RESULTADO
--- ### ### #################################################################

---(233)

DECLARE @NSale_Orde AS INTEGER = 43659
DECLARE @ShippingIn AS NVARCHAR(MAX) =(SELECT 
                                           JSON_QUERY(Info,'$.ShippingInfo') ShippingInfo
                                        FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
                                        WHERE [SOr_j].[SalesOrderID] = @NSale_Orde )
DECLARE @BillingIn AS NVARCHAR(MAX) =(SELECT 
                                           JSON_QUERY(Info,'$.BillingInfo') BillingInfo
                                       FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
                                       WHERE [SOr_j].[SalesOrderID] = @NSale_Orde )
DECLARE @SalesPersonIn AS NVARCHAR(MAX) =(SELECT 
                                            JSON_QUERY(Info,'$.SalesPerson') SalesPersonInfo
                                           FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
                                           WHERE [SOr_j].[SalesOrderID] = @NSale_Orde )

--- ### #### COMPROBACION DE RESULTADOS --- BEGIN

PRINT('----------------')
PRINT(@NSale_Orde)
PRINT('----------------')
PRINT(@ShippingIn)
PRINT('----------------')
PRINT(@BillingIn)
PRINT('----------------')
PRINT(@SalesPersonIn)
PRINT('----------------')

--- ### #### COMPROBACION DE RESULTADOS --- FINISH

--- VISTA ORIGINAL DEL JSON
SELECT      
   @NSale_Orde SalesOrderNumber
   -------------------- *** @SalesPersonInf ***
   ,JSON_VALUE(@SalesPersonIn, '$.Name') AS [Name]
   ,JSON_VALUE(@SalesPersonIn, '$.ID') AS [ID]
   --------------------  *** @BillingInf ***
   ,JSON_VALUE(@BillingIn, '$.Address') AS [Address]
   ,JSON_VALUE(@BillingIn, '$.City') AS [City]
   ,JSON_VALUE(@BillingIn, '$.PostalCode') AS [PostalCode]
   -------------------- *** @ShippingInf ***
   ,JSON_VALUE(@ShippingIn, '$.Province') AS [Province]
   ,JSON_VALUE(@ShippingIn, '$.Method') AS [Method]
   ,JSON_VALUE(@ShippingIn, '$.ShipBase') AS [ShipBase]
   ,JSON_VALUE(@ShippingIn, '$.ShipRate') AS [ShipRate]


--- IMPLEMENTACION DE FUNCION EN JSON_MODIFY 

SET @SalesPersonIn = JSON_MODIFY(@SalesPersonIn, '$.Name', 'Rafael')
SET @SalesPersonIn = JSON_MODIFY(@SalesPersonIn, '$.ID', '117')
SET @BillingIn = JSON_MODIFY(@BillingIn, '$.Address', '43030 Carapungo')
SET @BillingIn = JSON_MODIFY(@BillingIn, '$.City', 'QUITO')
SET @BillingIn = JSON_MODIFY(@BillingIn, '$.PostalCode', '30715')
SET @ShippingIn = JSON_MODIFY(@ShippingIn, '$.Province', 'QUITO')

--- VISTA MODIFICADA DEL JSON

SELECT      
   @NSale_Orde SalesOrderNumber
   -------------------- *** @SalesPersonInf ***
   ,JSON_VALUE(@SalesPersonIn, '$.Name') AS [Name]
   ,JSON_VALUE(@SalesPersonIn, '$.ID') AS [ID]
   --------------------  *** @BillingInf ***
   ,JSON_VALUE(@BillingIn, '$.Address') AS [Address]
   ,JSON_VALUE(@BillingIn, '$.City') AS [City]
   ,JSON_VALUE(@BillingIn, '$.PostalCode') AS [PostalCode]
   -------------------- *** @ShippingInf ***
   ,JSON_VALUE(@ShippingIn, '$.Province') AS [Province]
   ,JSON_VALUE(@ShippingIn, '$.Method') AS [Method]
   ,JSON_VALUE(@ShippingIn, '$.ShipBase') AS [ShipBase]
   ,JSON_VALUE(@ShippingIn, '$.ShipRate') AS [ShipRate];


--- ### ### #################################################################
--- ### ### EJERCICIO JSON CON STRING ESCAPE
--- ### ### RESULTADO
--- ### ### #################################################################

/*
la función STRING_ESCAPE te permite aplicar caracteres de escape a 
caracteres especiales en textos y devuelve texto con caracteres 
de escape. STRING_ESCAPE es una función determinista que se 
introdujo en SQL Server 2016. La función STRING_ESCAPE tiene 
dos argumentos: text y type. El argumento text es una expresión 
nvarchar que representa el objeto que se debe escapar. 
El argumento type son las reglas de escape que se aplicarán. 
*/
---(234)

DECLARE @name NVARCHAR(100) = 'John "Doe"'
DECLARE @surname NVARCHAR(100) = 'Smith \ O''Brian'
DECLARE @json NVARCHAR(MAX)

SET @json = FORMATMESSAGE (' { \"name\": \"%s\", \"surname\": \"%s\" }',  
STRING_ESCAPE (@name,'json'), 
STRING_ESCAPE (@surname,'json') );

SELECT @json;

