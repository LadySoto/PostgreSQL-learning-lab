/* BLOQUE 1: MANTENIMIENTO DE ESTRUCTURA 
   Se modifican los tipos de datos para optimizar el almacenamiento y asegurar la precisión decimal.
*/

-- Cambia el tipo de dato de 'tipo' de TEXT a VARCHAR (longitud variable)
ALTER TABLE app.datos 
ALTER COLUMN tipo TYPE VARCHAR;

-- Cambia el tipo de dato de 'colonia' de TEXT a VARCHAR
ALTER TABLE app.datos 
ALTER COLUMN colonia TYPE VARCHAR;

-- Define precisión decimal: hasta 12 dígitos en total con 2 decimales para montos económicos
ALTER TABLE app.datos 
ALTER COLUMN valor TYPE NUMERIC(12,2);

-- Define precisión decimal: hasta 8 dígitos en total con 2 decimales para superficies
ALTER TABLE app.datos 
ALTER COLUMN area TYPE NUMERIC(8,2);


/* BLOQUE 2: LIMPIEZA Y TRATAMIENTO DE NULOS 
   Uso de COALESCE para asegurar que el reporte no muestre valores vacíos (NULL).
*/
SELECT 
    tipo, 
    -- Si 'colonia' es NULL, lo reemplaza por el texto descriptivo 'SIN COLONIA'
    COALESCE(colonia, 'SIN COLONIA') AS colonia, 
    -- Si 'valor' es NULL, le asigna 0 para evitar errores en cálculos matemáticos
    COALESCE(valor, 0) AS valor
FROM app.datos;


/* BLOQUE 3: LÓGICA CONDICIONAL 
   Clasificación de registros mediante etiquetas categóricas basadas en rangos de precio.
*/
SELECT 
    tipo, 
    colonia, 
    valor,
    CASE 
        WHEN valor >= 500000 THEN 'ALTO'
        WHEN valor BETWEEN 200000 AND 499999 THEN 'MEDIO'
        ELSE 'BAJO' -- Captura todos los valores menores a 200,000
    END AS rango_precio
FROM app.datos;


/* BLOQUE 4: ANÁLISIS COMPARATIVO (CTE + WINDOW FUNCTION) 
   Se resuelve la limitación del flujo de ejecución: el WHERE no puede filtrar 
   agregaciones calculadas en el mismo nivel.
*/


WITH base AS (
    SELECT 
        *, 
        -- Calcula el promedio de toda la tabla sin colapsar filas (OVER vacío)
        ROUND(AVG(valor) OVER (), 2) AS promedio_general
    FROM app.datos
)
-- Fase 2: Filtra las propiedades cuyo valor supera el estándar global calculado en la CTE
SELECT * FROM base 
WHERE valor > promedio_general;


/* BLOQUE 5: TOP N POR CATEGORÍA (SUBQUERY + ROW_NUMBER) 
   Obtiene los 3 registros más caros por cada colonia utilizando una partición.
*/


SELECT * FROM (
    SELECT 
        colonia, 
        tipo, 
        valor,
        -- Genera un ranking único (1, 2, 3...) reiniciando el conteo en cada colonia
        ROW_NUMBER() OVER (
            PARTITION BY colonia 
            ORDER BY valor DESC
        ) AS ranking
    FROM app.datos
) t -- La subconsulta actúa como una tabla temporal llamada 't'
-- Filtra únicamente los primeros 3 puestos de cada subgrupo
WHERE ranking <= 3;


/* BLOQUE 6: OPTIMIZACIÓN Y RENDIMIENTO 
   Creación de índices y diagnóstico de tiempos de respuesta del motor.
*/

-- Crea una estructura de búsqueda rápida (B-Tree por defecto) sobre la columna 'colonia'
CREATE INDEX idx_datos_colonia ON app.datos(colonia);

-- Muestra el Plan de Ejecución real (Costo y Tiempo) para verificar si se usa el Index Scan

EXPLAIN ANALYZE
SELECT * FROM app.datos 
WHERE colonia = 'Narvarte';