----############################################
--- ### ejercio nro 9 de recursos humanos 
--- ### aplicados a variable y campos xml
--- ### variacio 1.0 manejo de XML basico
----############################################

--- ############################################
--- ### MANEJO DE XML , SE DECLARA VARIBLE XML 
--- ##  SE ASIGNA CONTENIDO XML Y SE SEPARA 
--- ## EN COLUMAS  -- BASICO --
--- ############################################

--- (56)

DECLARE @xmlPerson XML = '<Personas>
  <Persona>
    <Nombre>John</Nombre>
    <Apellido>Doe</Apellido>
  </Persona>
  <Persona>
    <Nombre>Jane</Nombre>
    <Apellido>Doe</Apellido>
  </Persona>
  <Persona>
    <Nombre>Bob</Nombre>
    <Apellido>Smith</Apellido>
  </Persona>
  <Persona>
    <Nombre>Alice</Nombre>
    <Apellido>Johnson</Apellido>
  </Persona>
</Personas>';

DECLARE @xmlPerson01 XML = '<Personas>
  <Persona>
    <Nombre>juan</Nombre>
    <Apellido>Perez</Apellido>
  </Persona>
  <Persona>
    <Nombre>Andrea</Nombre>
    <Apellido>Suarez</Apellido>
  </Persona>
  <Persona>
    <Nombre>Bob</Nombre>
    <Apellido>Peterson</Apellido>
  </Persona>
  <Persona>
    <Nombre>Andres</Nombre>
    <Apellido>Garcia</Apellido>
  </Persona>
</Personas>';

----------------
----------------

SELECT 
    xml.value('(Apellido)[1]', 'varchar(50)') AS Apellido,
    xml.value('(Nombre)[1]', 'varchar(50)') AS Nombre
FROM @xmlPerson.nodes('/Personas/Persona') AS x(xml)
ORDER BY 
    xml.value('(Apellido)[1]', 'varchar(50)'),
    xml.value('(Nombre)[1]', 'varchar(50)');

---------------
---------------

SELECT 
    xml.value('(Apellido)[1]', 'varchar(50)') AS Apellido,
    xml.value('(Nombre)[1]', 'varchar(50)') AS Nombre
FROM @xmlPerson01.nodes('/Personas/Persona') AS x(xml)
ORDER BY 
    xml.value('(Apellido)[1]', 'varchar(50)'),
    xml.value('(Nombre)[1]', 'varchar(50)');

--- ### ###################################
--- ### IR MAS ALLA 
--- ### ###################################
---(57)

DECLARE  @TABLEXML TABLE(
  ID INT IDENTITY(1,1),
  FILEXML XML,
  COD_DPTO INT,
  NOMBRE_DPTO VARCHAR(200)
)

---- INSER PRIMER REGISTRO

INSERT INTO @TABLEXML(FILEXML,COD_DPTO,NOMBRE_DPTO) 
 VALUES (@xmlPerson,10,'Sales')

INSERT INTO @TABLEXML(FILEXML,COD_DPTO,NOMBRE_DPTO) 
 VALUES (@xmlPerson01,20,'Purchase')


SELECT ID, COD_DPTO, NOMBRE_DPTO, FILEXML FROM @TABLEXML


--- (58)
(SELECT 
    [tb].COD_DPTO
    ,[tb].NOMBRE_DPTO
    ,xml.value('(Apellido)[1]', 'varchar(50)') AS Apellido
    ,xml.value('(Nombre)[1]', 'varchar(50)') AS Nombre
FROM @xmlPerson.nodes('/Personas/Persona') AS x(xml)
INNER JOIN @TABLEXML [tb] ON [tb].ID = 1)
UNION
(SELECT 
    [tb].COD_DPTO
    ,[tb].NOMBRE_DPTO
    ,xml.value('(Apellido)[1]', 'varchar(50)') AS Apellido
    ,xml.value('(Nombre)[1]', 'varchar(50)') AS Nombre
FROM @xmlPerson01.nodes('/Personas/Persona') AS x(xml)
INNER JOIN @TABLEXML [tb] ON [tb].ID = 2)



--- ### ###################################
--- ### VARIANTE 01
--- ### ###################################
--- (58)

SELECT 
    xml.value('(Apellido)[1]', 'varchar(50)') [Apellido]
    ,xml.value('(Nombre)[1]', 'varchar(50)')  [Nombre]
FROM @xmlPerson.nodes('/Personas/Persona')  AS x(xml)
ORDER BY 
    xml.value('(Apellido)[1]', 'varchar(50)')
    ,xml.value('(Nombre)[1]', 'varchar(50)');

----###############################################################
--- ## USO DE TOP() EJERCICIOS VARIOS
----###############################################################
--- (59)

SELECT TOP (1) [JobCandidateID]
      ,[BusinessEntityID]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[HumanResources].[JobCandidate];


SELECT TOP (2) [JobCandidateID]
      ,[BusinessEntityID]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[HumanResources].[JobCandidate];

SELECT TOP (5) [JobCandidateID]
      ,[BusinessEntityID]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[HumanResources].[JobCandidate];

SELECT TOP (1000) [JobCandidateID]
      ,[BusinessEntityID]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[HumanResources].[JobCandidate];
