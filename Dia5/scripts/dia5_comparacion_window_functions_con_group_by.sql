/* =========================================================================
   LABORATORIO DE POSTGRESQL - DÍA 5: ANÁLISIS DE DATOS AVANZADO
   =========================================================================
*/

-- 1. CONSULTA BASE
-- ¿Qué hace?: Selecciona todos los registros y columnas de la tabla 'app.datos'.
-- Resultado: Una vista cruda de toda la información disponible sin filtros ni cálculos.
-- Relación: Es el punto de partida para entender la estructura de los datos antes de aplicar lógica.
-- Ventaja: Permite verificar que la carga de datos fue correcta.
-- Desventaja: Ineficiente en tablas grandes (millones de filas) ya que consume mucha memoria y tiempo.

SELECT * FROM app.datos;


-- 2. FUNCIÓN DE VENTANA CON CONTEO ACUMULADO
-- ¿Qué hace?: Realiza un conteo dinámico que se reinicia por cada 'tipo' y sigue el orden de 'colonia'.
-- Resultado: Cada fila muestra un número secuencial (1, 2, 3...) dentro de su categoría.
-- Relación: Introduce el concepto de "flujo" en las funciones de ventana usando ORDER BY.
-- Ventaja: Ideal para crear rankings o numeraciones internas sin perder el detalle de la fila.
-- Desventaja: Puede ser confusa si el objetivo es obtener un total final y no un progreso paso a paso.

SELECT tipo, colonia, habitaciones,
	COUNT(habitaciones) 
		OVER(
			PARTITION BY tipo
			ORDER BY colonia 
		) as conteo_acomulado_por_tipo
FROM app.datos;


-- 3. FUNCIÓN DE VENTANA CON PARTICIÓN DOBLE (SIN DETALLE EXTRA)
-- ¿Qué hace?: Cuenta cuántos registros existen de cada tipo en cada colonia específica.
-- Resultado: Repite el total del grupo en cada fila de ese grupo.
-- Relación: Es la base lógica para la Consulta 4, pero con menos columnas.
-- Ventaja: Permite ver el peso estadístico de un grupo sin colapsar la tabla.
-- Desventaja: Al no incluir 'habitaciones' u otros datos, la información puede parecer repetitiva innecesariamente.

SELECT tipo, colonia,
	COUNT(tipo)
		OVER(
			PARTITION BY colonia, tipo
		) as suma_de_tipo_por_colonia
FROM app.datos;


-- 4. FUNCIÓN DE VENTANA CON PARTICIÓN DOBLE (CON DETALLE DE HABITACIONES)
-- ¿Qué hace?: Igual que la anterior, pero incluye la columna 'habitaciones'.
-- Resultado: Permite ver una propiedad específica y, al mismo tiempo, cuántas de su mismo tipo hay en su colonia.
-- Relación: Es la versión "enriquecida" de la Consulta 3. Es el uso más común de Window Functions.
-- Ventaja: Evita hacer JOINs costosos contra la misma tabla para obtener totales de grupo.
-- Desventaja: Genera archivos de resultados más grandes por la redundancia de los totales.

SELECT tipo, colonia, habitaciones,
	COUNT(*)
		OVER(
			PARTITION BY colonia, tipo
		) as suma_de_tipo_por_colonia
FROM app.datos;


-- 5. AGRUPACIÓN ESTÁNDAR (RESUMEN)
-- ¿Qué hace?: Colapsa todas las filas y genera un resumen único por colonia y tipo.
-- Resultado: Una tabla corta donde cada fila es una combinación única con su conteo final.
-- Relación: Es la alternativa clásica a las Window Functions cuando no necesitas el detalle fila a fila.
-- Ventaja: Altamente eficiente y genera reportes limpios y directos.
-- Desventaja: Elimina los datos individuales (pierdes la información de 'habitaciones' o 'area' de cada casa).

SELECT tipo, colonia,
	COUNT(tipo)
FROM app.datos
GROUP BY tipo, colonia
ORDER BY colonia;


-- 6. AGRUPACIÓN CON FILTRO OR
-- ¿Qué hace?: Igual que la Consulta 5, pero descarta cualquier propiedad que no sea 'Casa' o 'Departamento'.
-- Resultado: Un resumen estadístico enfocado solo en las categorías de interés.
-- Relación: Es el precursor de la Consulta 7, usando lógica booleana básica.
-- Ventaja: Reduce la carga de procesamiento al trabajar solo con una parte de los datos.
-- Desventaja: La sintaxis 'columna = A OR columna = B' es propensa a errores y difícil de leer si crecen las categorías.

SELECT tipo, colonia,
	COUNT(tipo)
FROM app.datos
WHERE tipo = 'Departamento' or tipo = 'Casa'
GROUP BY tipo, colonia
ORDER BY colonia;


-- 7. AGRUPACIÓN OPTIMIZADA CON CLÁUSULA IN
-- ¿Qué hace?: Realiza exactamente lo mismo que la Consulta 6 pero con una sintaxis profesional.
-- Resultado: Reporte filtrado por tipos específicos de propiedad.
-- Relación: Es la versión mejorada y escalable de la Consulta 6.
-- Ventaja: Mucho más legible y fácil de mantener si decides agregar más tipos (ej. 'Oficina', 'Local').
-- Desventaja: Al igual que el GROUP BY, no permite ver los detalles de cada propiedad individual.

SELECT tipo, colonia,
COUNT(tipo)
FROM app.datos
WHERE tipo IN ('Departamento','Casa')
GROUP BY tipo, colonia
ORDER BY colonia;