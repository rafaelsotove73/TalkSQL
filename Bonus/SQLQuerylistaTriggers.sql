SELECT trg.name AS trigger_name, OBJECT_NAME(trg.parent_id) AS table_name
FROM sys.triggers AS trg
ORDER BY table_name, trigger_name;

------------------------------
------------------------------
SELECT trg.name AS trigger_name, OBJECT_NAME(trg.parent_id) AS table_name,
       CASE trg.is_disabled WHEN 0 THEN 'Activo' ELSE 'Inactivo' END AS status
FROM sys.triggers AS trg
ORDER BY table_name, trigger_name;

