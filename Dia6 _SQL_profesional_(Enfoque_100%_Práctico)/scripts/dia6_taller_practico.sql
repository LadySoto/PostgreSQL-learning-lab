--1. Ranking de las propiedades menos costosas a las más caras por colonia
SELECT 
colonia,
tipo,
COALESCE (valor,0) AS valor,
ROW_NUMBER() OVER(
	PARTITION BY colonia
	ORDER BY valor ASC
)AS ranking
FROM app.datos;

--2. Propiedades por encima del promedio
WITH tabla_cte AS (
SELECT
tipo,
colonia,
habitaciones,
valor,
ROUND(
	AVG(valor)OVER(),2
) AS promedio_general
FROM app.datos
) 
SELECT *
FROM tabla_cte
WHERE valor > promedio_general; 

--3. Clasificación de rango por precio
SELECT tipo, colonia, COALESCE(valor,0) AS valor,
CASE
WHEN valor > 600000 THEN 'ALTO'
WHEN valor BETWEEN 600000 AND 100000 THEN 'MEDIO'
ELSE 'BAJO'
END AS clasificacion_rango
FROM app.datos
ORDER BY valor ASC;

--4. Total de propiedades por cada rango 

WITH base_cte AS(
	SELECT tipo, colonia, COALESCE(valor,0) AS valor,
	CASE
	WHEN valor > 600000 THEN 'ALTO'
	WHEN valor BETWEEN 100000 AND 600000 THEN 'MEDIO'
	ELSE 'BAJO'
	END AS clasificacion_rango
	FROM app.datos
)
SELECT clasificacion_rango,
COUNT(*) AS total
FROM base_cte
GROUP BY clasificacion_rango
ORDER BY total ASC; 

--5. Top 3 propiedades más caras por tipo

WITH table_cte AS(
	SELECT tipo, colonia, valor, 
	ROW_NUMBER()OVER(
		PARTITION BY tipo
		ORDER BY valor DESC
	) AS ranking
	FROM app.datos 
)
SELECT tipo, colonia, valor, ranking
FROM table_cte
WHERE ranking <= 3
ORDER BY tipo, ranking;