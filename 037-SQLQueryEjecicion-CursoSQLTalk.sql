



--- ### ### ###############################################################
--- ### ###  EJEMPLO PARA CONSEDER ACCESO A TABLA MEDINETE 
--- ### ###  FUNCION GRANT
--- ### ### ###############################################################
-- (237)
USE AdventureWorks2016_EXT
GRANT SELECT ON [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] TO josé1;

--- ### ### ###############################################################
--- ### ###  EJEMPLO PARA REVOCAR ACCESO A TABLA MEDINETE FUNCION REVOKE
--- ### ### ###############################################################
-- (238)
USE AdventureWorks2016_EXT
REVOKE SELECT ON [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] FROM josé1;

--- ### ### ###############################################################
--- ### ### Ejemplo de  SIMPLE COMMIT
--- ### ### Inserta un registro en la tabla clientes 
--- ### ### y lo guarda permanentemente
--- ### ### ###############################################################
-- (239)

USE AdventureWorks2016_EXT

DROP TABLE cliente_talksql

CREATE TABLE cliente_talksql (
    id INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
   PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- (240)

BEGIN TRANSACTION;
INSERT INTO cliente_talksql (nombre, ciudad) VALUES ('Pedro', 'Madrid');
COMMIT;

--- COMPROBACION

SELECT * FROM cliente_talksql;


--- ### ### ###############################################################
--- ### ### Ejemplo de ROLLBACK
--- ### ### Actualiza un registro en la tabla clientes 
--- ### ### y lo revierte al estado anterior
--- ### ### ###############################################################
-- (241)

-- 
BEGIN TRANSACTION;
UPDATE cliente_talksql SET nombre = 'ANDRES' WHERE id = 1;
ROLLBACK;

--- COMPROBACION

SELECT * FROM cliente_talksql;
    
--- ### ### ###############################################################
--- ### ### Ejemplo de PARA GRAVADO DE UN PUNTO EN ESPECIFICO
--- ### ### Crea tres puntos de retorno en una transacción y 
--- ### ### revierte al segundo punto
--- ### ### ###############################################################
-- (242)

-- 
BEGIN TRANSACTION;

SAVE TRANSACTION A;
-- Inserción 1
INSERT INTO cliente_talksql (nombre, ciudad) VALUES ('Ana', 'Barcelona');


SAVE TRANSACTION B;
-- Inserción 2
INSERT INTO cliente_talksql (nombre, ciudad) VALUES ('Luis', 'Valencia');


SAVE TRANSACTION C;
-- Inserción 3
INSERT INTO cliente_talksql (nombre, ciudad) VALUES ('Sara', 'Sevilla');

ROLLBACK TRANSACTION C;

COMMIT TRANSACTION;
