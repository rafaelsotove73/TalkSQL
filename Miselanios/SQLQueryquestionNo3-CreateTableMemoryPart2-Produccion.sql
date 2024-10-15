
/* 
####################################
"COLLATE Latin1_General_100_BIN2" 
especifica la configuración regional (collation) que se utilizará para ordenar 
y comparar los datos en la columna. En este caso, "Latin1_General_100_BIN2" 
significa que se utilizará la configuración regional "Latin1_General_100" y la opción "BIN2" 
para la comparación binaria de los caracteres. Esto se utiliza para garantizar que los datos se comparen correctamente, 
especialmente cuando se usan caracteres no-ASCII o caracteres especiales.
"NOT NULL" indica que la columna no puede contener valores nulos.
####################################
*/

USE AdventureWorks2016_EXT;

-- Habilitar opción In-Memory OLTP en la base de datos
ALTER DATABASE AdventureWorks2016_EXT
SET MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = ON;
GO

drop table dbo.SalesOrderDetailInMem


-- Crear una tabla en memoria llamada SalesOrderDetailInMem
-- Crear la tabla
CREATE TABLE dbo.SalesOrderDetailInMem
(
    SalesOrderID INT NOT NULL,
    SalesOrderDetailID INT NOT NULL,
    CarrierTrackingNumber NVARCHAR(25) COLLATE Latin1_General_100_BIN2 NOT NULL,
    OrderQty INT NOT NULL,
    ProductID INT NOT NULL,
    UnitPrice MONEY NOT NULL,
    Discount MONEY NOT NULL,
    CONSTRAINT PK_SalesOrderDetailInMem PRIMARY KEY NONCLUSTERED (SalesOrderDetailID)
) WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_AND_DATA);

-- Crear un índice agrupado en la columna SalesOrderID
---CREATE CLUSTERED INDEX IX_SalesOrderDetailInMem_SalesOrderID ON SalesOrderDetailInMem (SalesOrderID);

-- Crear un índice no agrupado en la columna ProductID
--CREATE INDEX IX_SalesOrderDetailInMem_ProductID ON SalesOrderDetailInMem (ProductID);
