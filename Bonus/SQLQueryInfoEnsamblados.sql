SELECT * FROM sys.assemblies WHERE name = 'AssemblyTool'
SELECT * FROM sys.assembly_files WHERE assembly_id = (SELECT assembly_id FROM sys.assemblies WHERE name = 'AssemblyTool')

SELECT af.*
FROM sys.assemblies a
JOIN sys.assembly_files af ON a.assembly_id = af.assembly_id
WHERE a.name = 'AssemblyTool'
