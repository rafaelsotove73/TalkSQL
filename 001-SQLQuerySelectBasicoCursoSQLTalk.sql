


--- ### ################################
--- ### QUERY -- SELECT BASICOS
--- ### ################################
---(01)
USE AdventureWorks2016_EXT

SELECT * FROM Person.Person;

SELECT * FROM Sales.SalesTerritory;

--- ### ###################################
--- ### QUERY -- SELECT BASICOS CON WHERE
--- ### ###################################
---(02)
SELECT * FROM Person.Person WHERE FirstName = 'Ken';

SELECT * FROM Sales.SalesTerritory WHERE Name = 'Northwest' ;

---(03)
SELECT * FROM Person.Person WHERE FirstName = 'Ken' AND LastName = 'Kwok';

SELECT [Title] ,[FirstName] ,[MiddleName] ,[LastName] FROM Person.Person WHERE FirstName = 'Ken';


--- ### ##########################################################################
--- ### QUERY -- SELECT BASICOS CON WHERE MAS ALIAS PARA EL NOMBRE DE LA TABLA
--- ### #########################################################################
---(04)

SELECT [Per].* FROM Person.Person [Per]  WHERE [Per].FirstName = 'Ken';

--- ### #################################################
--- ### MANEJO DE FUNCIONES DE CADENA
--- ### ################################################

-- ORIGINAL

SELECT [Title] ,[FirstName] ,[MiddleName] ,[LastName] FROM Person.Person WHERE FirstName = 'Ken';


-- ## EJERCICIO CON UPPER
---(05)
	SELECT ISNULL([Title], 'N/I') [Title]
      ,UPPER([FirstName]) [FirstName] 
	  ,[MiddleName] 
	  ,[LastName] 
	FROM Person.Person WHERE FirstName = 'Ken';


-- ## EJERCICIO CON CONCAT, MANEJO DE PARENTESIS DE AQUI EN ADELANTE
---(06)
SELECT ISNULL([Title], 'N/I') [Title]
      ,UPPER([FirstName]) [FirstName] 
	  ,[LastName] 
	  ,(CONCAT([FirstName], ' ' , [LastName]) ) [FullName]
	FROM Person.Person WHERE FirstName = 'Ken';


-- ## EJERCICIO CON SUM BRUTA STRING
---(07)
SELECT ISNULL([Title], 'N/I') [Title]
      ,UPPER([FirstName]) [FirstName] 
	  ,[LastName] 
	  ,([FirstName] + ' ' + [LastName] ) [FullName]
	FROM Person.Person WHERE FirstName = 'Ken';


-- ## EJERCICIO QUE CUENTA CARACTRES DE FULL.NAME
---(08)
SELECT ISNULL([Title], 'N/I') [Title]
      ,UPPER([FirstName]) [FirstName] 
	  ,[LastName] 
	  ,([FirstName] + ' ' + [LastName] ) [FullName]
	  ,LEN([FirstName] + ' ' + [LastName] ) [N.FullName]
	FROM Person.Person WHERE FirstName = 'Ken';

-- ## EJERCICIO  SUB-STRING  PARA ARMAR INICIALES DEL NOMBRE COMPLETO
---(09)
SELECT ISNULL([Title], 'N/I') [Title]
      ,UPPER([FirstName]) [FirstName] 
	  ,[LastName] 
	  ,([FirstName] + ' ' + [LastName] ) [FullName]
	  ,SUBSTRING(([FirstName]),1,1) + '.' + SUBSTRING(([LastName]),1,1) [In.Name]
	FROM Person.Person WHERE FirstName = 'Ken';


-- ## EJERCICIO LOWER PARA CAMBIO DE MAYUSCULA A MINUSCULA
---(10)
SELECT ISNULL([Title], 'N/I') [Title]
      ,LOWER(UPPER([FirstName])) [FirstName] 
	  ,[LastName] 
	  ,([FirstName] + ' ' + [LastName] ) [FullName]
	  ,SUBSTRING(([FirstName]),1,1) + '.' + SUBSTRING(([LastName]),1,1) [In.Name]
	FROM Person.Person WHERE FirstName = 'Ken';

-- ## EJERCICIO REPLACE PARA CAMBIO K por T EN EL FULL NAME
---(11)
SELECT ISNULL([Title], 'N/I') [Title]
      ,LOWER(UPPER([FirstName])) [FirstName] 
	  ,[LastName] 
	  ,REPLACE(([FirstName] + ' ' + [LastName]),'k','T') [FullName]
	  ,SUBSTRING(([FirstName]),1,1) + '.' + SUBSTRING(([LastName]),1,1) [In.Name]
	FROM Person.Person WHERE FirstName = 'Ken';

-- ## EJERCICIO TRIM, LTRIM, RTRIM PARA ELIMINAR ESPACIOS EN BLANCO EN UNA CADENA
-- ## MEJOR OPCION REPLACE
---(12)
	
SELECT ISNULL([Title], 'N/I') [Title]
      ,UPPER([FirstName]) [FirstName] 
	  ,[LastName] 
	  ,( ' '+ [FirstName] + ' ' + [LastName] + ' ') [S.FullName]
	  ,LEN( ' '+ [FirstName] + ' ' + [LastName] + ' ') [N.FullName1]
	  ,LEN(TRIM( ' ' + [FirstName] + ' ' + [LastName] + ' ')) [N.FullName2]  
	  ,TRIM( ' ' + [FirstName] + ' ' + [LastName] + ' ') [N.FullName2.1]
	  ,LEN(RTRIM( ' '+ [FirstName] + ' ' + [LastName] + ' ')) [N.FullName3]  
	  ,RTRIM( ' '+ [FirstName] + ' ' + [LastName] + ' ') [N.FullName3.1]
	  ,LEN(LTRIM( ' '+ [FirstName] + ' ' + [LastName] + ' ')) [N.FullName4]
	  ,LTRIM( ' '+ [FirstName] + ' ' + [LastName] + ' ') [N.FullName4.1]
	  ,LEN(REPLACE(( ' '+ [FirstName] + ' ' + [LastName] + ' '),' ','')) [N.FullName5]
	  ,REPLACE(( ' '+ [FirstName] + ' ' + [LastName] + ' '),' ','') [N.FullName5.1]
	FROM Person.Person WHERE FirstName = 'Ken';

 


-- ## EJERCICIO LEFT(), RIGHT
---(13)
SELECT ISNULL([Title], 'N/I') [Title]
      ,UPPER([FirstName]) [FirstName] 
	  ,[LastName] 
	  ,[FirstName] + ' ' + [LastName] [FullName]
	  ,LEFT(([FirstName] + ' ' + [LastName] ),3) [FullName.LEFT]
	  ,RIGHT(([FirstName] + ' ' + [LastName] ),3) [FullName.RIGHT]
	FROM Person.Person WHERE FirstName = 'Ken';

-- ## BUSCA EL NUMERO DE CARECTER EN UNA CADENA, 
-- ## DECLARACION DE VARIABLE, ASIGNACION DE CONTENIDO TIPO CARACTER
---(14)
DECLARE @document VARCHAR(64);  
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.';  
SELECT CHARINDEX('bicycle', @document) [Nr.Caracter];  
GO  

