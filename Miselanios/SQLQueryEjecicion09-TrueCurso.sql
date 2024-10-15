------------------------------------
--- ejercio nro 9 de recursos humanos 
--- aplicados a variable y campos xml
--- variacio 1.0
--------------------------------------

DECLARE @xmlVariable XML = '<Personas>
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

-- version 1.0

SELECT 
    xml.value('(Apellido)[1]', 'varchar(50)') AS Apellido,
    xml.value('(Nombre)[1]', 'varchar(50)') AS Nombre
FROM @xmlVariable.nodes('/Personas/Persona') AS x(xml)
ORDER BY 
    xml.value('(Apellido)[1]', 'varchar(50)'),
    xml.value('(Nombre)[1]', 'varchar(50)');

--- version 1.1

SELECT 
    xml.value('(Apellido)[1]', 'varchar(50)') [Apellido]
    ,xml.value('(Nombre)[1]', 'varchar(50)')  [Nombre]
FROM @xmlVariable.nodes('/Personas/Persona')  AS x(xml)
ORDER BY 
    xml.value('(Apellido)[1]', 'varchar(50)')
    ,xml.value('(Nombre)[1]', 'varchar(50)');