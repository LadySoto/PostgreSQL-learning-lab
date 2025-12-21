📘 # Día 2 – Schemas, Objetos y Arquitectura en PostgreSQL

🎯 ## Objetivo del día

Comprender y aplicar la organización lógica de PostgreSQL mediante el uso de schemas, identificando la diferencia entre estructura y objetos, explorando los schemas del sistema y entendiendo el impacto del search_path en las consultas SQL.

🧠 ## Conceptos estudiados

* Arquitectura lógica de PostgreSQL
* Diferencia entre estructura y objetos
* Schema public y sus implicaciones
* Uso de múltiples schemas
* Riesgos de trabajar únicamente con public
* search_path: definición, uso y riesgos
* Exploración de metadata con:
   - pg_catalog
   - information_schema

🗂️ ## Estructura trabajada

Instancia
 └── Cluster
     └── Base de Datos
         └── Schemas
             └── Objetos (tablas, vistas, funciones, etc.)


🛠️ ##Actividades realizadas:

1️⃣ Creación de un schema propio

CREATE SCHEMA app;

2️⃣ Creación de tabla dentro del schema app

CREATE TABLE app.datos (
  tipo TEXT,
  colonia TEXT,
  habitaciones INTEGER,
  area NUMERIC,
  valor NUMERIC
);

3️⃣ Carga de datos desde archivo CSV

Se utilizó el comando \copy, ejecutado desde el cliente psql.

\copy app.datos
FROM 'ruta/alquiler.csv'
DELIMITER ';'
CSV HEADER;

🔍 ## Consultas realizadas:

-- Ver todos los datos

SELECT * FROM app.datos;

-- Filtrar por número de habitaciones

SELECT tipo, habitaciones
FROM app.datos
WHERE habitaciones >= 2;

-- Contar registros

SELECT COUNT(*) FROM app.datos;

-- Ordenar resultados

SELECT *
FROM app.datos
ORDER BY habitaciones ASC;

🧪 ## Exploración de schemas y metadata: 

-- Schemas existentes

SELECT schema_name
FROM information_schema.schemata;

-- Tablas del schema app

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'app';

-- Exploración de tablas del sistema

SELECT relname
FROM pg_catalog.pg_class
WHERE relkind = 'r';

⚠️ ## Aprendizajes clave:

* pg_catalog muestra información solo de la base de datos actual, no de todo el servidor.
* El uso incorrecto del search_path puede provocar consultas o modificaciones sobre objetos no deseados.
* Trabajar con schemas mejora:
   - Organización
   - Seguridad
   - Escalabilidad
* El schema public no es recomendable como único schema en entornos productivos.

📌## Buenas prácticas reforzadas:

* Siempre especificar el schema (schema.tabla)
* Separar objetos por contexto o aplicación
* Documentar scripts SQL
* Validar cargas de datos con consultas de control

📂## Dataset utilizado:

Dataset de alquileres (CSV)
Datos organizados y limpiados previamente en Google Colab
Columnas seleccionadas según necesidad analítica

📈## Resultado:

Al finalizar este día:
* Se comprende la arquitectura lógica de PostgreSQL
* Se aplican schemas correctamente
* Se consulta metadata del sistema
* Se evita el uso desordenado del schema public

🚀## Próximo paso

👉 Día 3: Roles, permisos y control de acceso en PostgreSQL

✨## Nota final

Este trabajo hace parte de un plan de estudio intensivo de PostgreSQL enfocado en roles profesionales, administración básica y buenas prácticas en entornos reales.
