  ----------------------
  -- creacion de tabla
  -- en memoria
  ---------------------
  --###################
  --###################
  /*
  Este ejemplo crea una tabla en memoria llamada MyInMemoryTableCustom con tres columnas: 
  Id, Name y Description. La columna Id es una clave primaria no agrupada con hash y se especifica 
  una cantidad de cubetas de 100,000. La tabla utiliza la opci�n de durabilidad SCHEMA_AND_DATA, 
  lo que significa que los datos se almacenan en disco y persisten despu�s de un reinicio del servidor.

  =====>>
		 Id INT NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT = 100000) 
		 Detalles:
		 1.- "INT" especifica que el tipo de datos es un n�mero entero.
         2.- "NOT NULL" especifica que el valor no puede ser nulo.
         3.- "PRIMARY KEY" especifica que esta columna es la clave primaria de la tabla, 
				lo que significa que es �nica y se utiliza para identificar de manera �nica cada fila de datos.
		 4.- "NONCLUSTERED" especifica que esta clave primaria no est� organizada en un orden espec�fico.
		 5.- "HASH" especifica que la clave primaria se organiza utilizando una funci�n hash, 
				lo que significa que el valor de la clave se utiliza para calcular una ubicaci�n 
				f�sica en el almacenamiento de la tabla.	
		 6.- "WITH (BUCKET_COUNT = 100000)" especifica que la funci�n hash utiliza 100,000 buckets 
				o compartimentos para organizar los datos en la tabla. Esto se utiliza para mejorar el 
				rendimiento al distribuir uniformemente los datos en los compartimentos.S�, en SQL Server, 
				la sentencia `CLUSTERED` o `NONCLUSTERED` se refiere a la forma en que los datos est�n 
				organizados en la tabla y c�mo se accede a ellos.

########## IMPORTANTE ##############

		Una tabla solo puede tener un �ndice `CLUSTERED` que determina la forma en que se almacenan 
		las filas de datos en la tabla. 
		El �ndice `CLUSTERED` ordena f�sicamente las filas de la tabla seg�n la clave primaria, 
		lo que significa que las filas est�n 
		almacenadas en un orden espec�fico en el disco. Al hacer esto, 
		SQL Server puede buscar r�pidamente en la tabla usando la 
		clave primaria.

		Por otro lado, un �ndice `NONCLUSTERED` no almacena las filas de la tabla en orden f�sico. 
		En su lugar, un �ndice `NONCLUSTERED` tiene una estructura separada de la tabla y mantiene 
		una lista de valores de clave de �ndice y los punteros a las filas de datos correspondientes. 
		Esto permite una b�squeda r�pida basada en los valores de clave de �ndice.

		En resumen, el �ndice `CLUSTERED` es ideal para tablas grandes que se buscan frecuentemente 
		en funci�n de la clave primaria, mientras que los �ndices `NONCLUSTERED` son m�s eficientes 
		para buscar filas en la tabla en funci�n de otros criterios de b�squeda.

  */
  --###################
  --###################

--- ### ## ##########################################################################################
--- ### ## CREACION DE TABLA EJEMPLO PARA TABLA FISICA EN MEMORIA
--- ### ## ##########################################################################################
---(142)


  USE AdventureWorks2016_EXT;

  drop table dbo.MyInMemoryTableCustom

-- Habilitar opci�n In-Memory OLTP en la base de datos
	ALTER DATABASE AdventureWorks2016_EXT
	SET MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = ON;
	GO

	-- Crear una tabla en memoria llamada MyInMemoryTable
	CREATE TABLE dbo.MyInMemoryTableCustom
	(
		Id INT NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT = 100000),
		Name VARCHAR(50) NOT NULL,
		Description VARCHAR(500) NOT NULL
	) WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_AND_DATA);


	/* 
####################################
"COLLATE Latin1_General_100_BIN2" 
especifica la configuraci�n regional (collation) que se utilizar� para ordenar 
y comparar los datos en la columna. En este caso, "Latin1_General_100_BIN2" 
significa que se utilizar� la configuraci�n regional "Latin1_General_100" y la opci�n "BIN2" 
para la comparaci�n binaria de los caracteres. Esto se utiliza para garantizar que los datos se comparen correctamente, 
especialmente cuando se usan caracteres no-ASCII o caracteres especiales.
"NOT NULL" indica que la columna no puede contener valores nulos.
####################################
*/

--- ### ## ##########################################################################################
--- ### ## CREACION DE TABLA EJEMPLO PARA TABLA FISICA EN MEMORIA
--- ### ## ##########################################################################################
---(143)



USE AdventureWorks2016_EXT;

-- Habilitar opci�n In-Memory OLTP en la base de datos
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
    CarrierTrackingNumber NVARCHAR(25) COLLATE Latin1_General_100_BIN2,
    OrderQty INT,
    ProductID INT,
    UnitPrice MONEY,
    UnitPriceDiscount MONEY,
    CONSTRAINT PK_SalesOrderDetailInMem PRIMARY KEY NONCLUSTERED (SalesOrderDetailID)
) WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_AND_DATA);

------- ========================================
------- ADICIONAL PARA PROBAR
------- ========================================

/*
#######################################################################################
Para ver las actualizaciones o inserciones más recientes de un registro al repetir una 
consulta en SQL Server, puedes utilizar la opción SET TRANSACTION ISOLATION LEVEL en 
combinación con el bloqueo explícito WITH (NOLOCK) en la consulta.

La instrucción SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED establece un nivel 
de aislamiento de lectura no confirmada. Esto permite que la consulta lea los datos 
modificados o insertados recientemente por otras transacciones, incluso si aún no 
se han confirmado.

El bloqueo explícito WITH (NOLOCK) en la cláusula FROM de la consulta permite que la 
lectura se realice sin esperar a que se liberen los bloqueos exclusivos en las filas de la tabla. 
Esto puede aumentar el rendimiento de la consulta, pero debes tener en cuenta que existe el riesgo de que se lean datos no confirmados o inconsistentes.
Es importante tener en cuenta que utilizar el nivel de aislamiento READ UNCOMMITTED y 
el bloqueo NOLOCK puede introducir lecturas sucias o datos inconsistentes en tu consulta. 
Debes evaluar cuidadosamente los riesgos y las necesidades de tu aplicación antes de utilizar 
estas opciones.
########################################################################################
*/

-- Establecer el nivel de aislamiento de la transacción
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- Ejecutar la consulta con bloqueo explícito
SELECT *
FROM dbo.SalesOrderDetailInMem WITH (NOLOCK)
--WHERE tuCondicion;


