--- ########################################
  --- ### busqueda de tablas realcionadas
  --- #######################################



SELECT * FROM Sales.Customer WHERE CustomerID  = '29825';

SELECT * FROM Sales.Customer WHERE CustomerID  = '11005';

SELECT * FROM Person.BusinessEntityContact WHERE PersonID = '1045';


UPDATE Sales.Customer
SET PersonID = p.BusinessEntityID
FROM [Person].[Person] p
WHERE Sales.Customer.PersonID IS NULL
  AND EXISTS (
    SELECT 1
    FROM Sales.Customer c
    WHERE c.PersonID = p.BusinessEntityID
);