select * from app.datos;

select tipo, habitaciones from app.datos 
where habitaciones >= 2;

select tipo, habitaciones from app.datos 
where habitaciones <= 1;

select count(*) from app.datos 
where habitaciones = 0;

select count(*) from app.datos;

select * from app.datos 
order by habitaciones asc;

select * from app.datos
order by habitaciones desc;

select distinct habitaciones
from app.datos
order by habitaciones;

select distinct habitaciones
from app.datos
where habitaciones > 0
order by habitaciones;

show search_path;

select * from datos;

set search_path to app;

show search_path;

select * from datos;

set search_path to public;

show search_path;

SELECT schema_name
FROM information_schema.schemata;

-- Usando information_schema.table puedo saber las tablas que tengo en un schema 

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'app';

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'information_schema';

-- Usando information_schema.columns puedo obtener el tipo de dato de cada columna de una tabla

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'app'
  AND table_name = 'datos';

-- Esta consulta devuelve todas las tablas que hay en el sistema 

SELECT relname
FROM pg_catalog.pg_class
WHERE relkind = 'r';

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'pg_catalog';

