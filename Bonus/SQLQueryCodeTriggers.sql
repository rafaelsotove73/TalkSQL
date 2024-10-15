USE AdventureWorks2012;  
GO  
SELECT definition   
FROM sys.sql_modules  
WHERE object_id = OBJECT_ID(N'Person.iuPerson');   
GO   

------------------------

USE AdventureWorks2012;   
GO  
SELECT OBJECT_DEFINITION (OBJECT_ID(N'Person.iuPerson')) AS ObjectDefinition;   
GO  

-----------------------

USE AdventureWorks2012;   
GO  
EXEC sp_helptext 'Person.iuPerson'  
GO