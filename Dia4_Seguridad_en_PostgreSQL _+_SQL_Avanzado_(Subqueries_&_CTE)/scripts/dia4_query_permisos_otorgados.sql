--Concultar los nombres de los roles que hay

SELECT 
rolname,
rolsuper,
rolcreatedb,
rolcreaterole,
rolcanlogin,
rolinherit
FROM pg_roles
ORDER BY rolname;

--Consultar roles que pueden hacer Login,o sea los Usuarios

SELECT 
rolname,
rolsuper,
rolcreatedb,
rolcreaterole,
rolcanlogin,
rolinherit
FROM pg_roles
WHERE rolcanlogin = true
ORDER BY rolname;

--Después de tener conocimiento de los Roles que hay, se concederá Permisos sobre Schemas y Tablas

--Permiso sobre Schema:

GRANT USAGE ON SCHEMA app TO lector;
GRANT USAGE ON SCHEMA app TO escritura;

--Permiso sobre Tablas:

--Conceder permiso de Seleccionar la tabla datos al rol lector
GRANT SELECT ON app.datos TO lector;

--Conceder permisos de Seleccionar, Insertar datos, Actualizar datos y Eliminar datos de la Tabla datos al rol escritura
GRANT SELECT, INSERT, UPDATE, DELETE 
ON app.datos 
TO escritura;
