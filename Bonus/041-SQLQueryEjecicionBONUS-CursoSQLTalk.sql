/*
En SQL Server, existen numerosas vistas del sistema con el prefijo "sys" que proporcionan información detallada sobre los metadatos y objetos de la base de datos. A continuación se presentan algunas de las vistas más comunes con su breve descripción:

1. `sys.objects`: Contiene información sobre todos los objetos de la base de datos, como tablas, vistas, funciones, procedimientos almacenados, desencadenadores, entre otros.

2. `sys.columns`: Proporciona detalles sobre las columnas de las tablas y vistas, como nombres de columnas, tipos de datos, restricciones, etc.

3. `sys.tables`: Muestra información sobre las tablas de la base de datos, incluyendo nombres de tablas, esquemas, fechas de creación, entre otros.

4. `sys.indexes`: Contiene información sobre los índices de las tablas, como nombres de índices, columnas indexadas, tipo de índice, entre otros.

5. `sys.schemas`: Proporciona detalles sobre los esquemas de la base de datos, incluyendo nombres de esquemas y propietarios.

6. `sys.sysusers`: Muestra información sobre los usuarios de la base de datos, como nombres de usuario, identificadores de seguridad, entre otros.

7. `sys.database_principals`: Contiene información sobre los principales de seguridad de la base de datos, como usuarios, roles, etc.

8. `sys.dm_exec_sessions`: Ofrece detalles sobre las sesiones activas en el servidor, como identificadores de sesión, estado, información de inicio de sesión, entre otros.

9. `sys.dm_os_wait_stats`: Muestra estadísticas de espera del sistema operativo, que son útiles para analizar el rendimiento y la concurrencia del servidor.

Estas son solo algunas de las vistas del sistema con el prefijo "sys". Existen muchas más vistas disponibles que ofrecen información detallada sobre los diferentes aspectos de la base de datos y el servidor en SQL Server. Te recomendaría consultar la documentación oficial de Microsoft SQL Server para obtener una lista completa de las vistas del sistema y obtener más detalles sobre su uso y funcionalidad.
*/

-- (265)
SELECT * FROM sys.indexes;
-- (266)
SELECT * FROM sys.database_principals;
-- (267)
SELECT * FROM sys.dm_exec_sessions;
-- (268)
SELECT * FROM sys.dm_os_wait_stats;

