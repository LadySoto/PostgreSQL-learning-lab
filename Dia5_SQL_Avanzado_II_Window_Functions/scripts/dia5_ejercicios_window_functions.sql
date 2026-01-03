--Se crear el Ranking de la propiedad más cara a las más barata
--Se aplica WHERE para descartar las filas con información NULL en la columna Valor
--Se usa ROW_NUMBER para definr el Ranking

SELECT tipo, colonia,valor, 
ROW_NUMBER() OVER(
	ORDER BY valor DESC) AS ranking
FROM app.datos
WHERE valor IS NOT NULL;


--En la consulta se busca ver la comparación entre la función RANK() y DENSE_RANK()
--RANK() salta, deja huecos dependiendo de la cantidad de duplicados
--DENSE_RANK() no salta, no se brinca ningún puesto, mantiene el conteo compacto

SELECT
  colonia,
  valor,
RANK()OVER (ORDER BY valor DESC)AS rank,
DENSE_RANK()OVER (ORDER BY valor DESC)AS dense_rank
FROM app.datos
WHERE valor IS NOT NULL;


--Ranking de las propiedades por Colina, cada grupo de Colina posee su propio puesto de Ranking

--Los datos son ordenados por los Valores de forma descendente, del más caro al más barato
--Se usa RANK() para saber la posición real (ej. "Esta casa es la número 24 de toda la Colina")
SELECT
  colonia,
  tipo,
  valor,
RANK()OVER (
PARTITION BY colonia
ORDER BY valor DESC
  )AS ranking_por_colonia_Rank
FROM app.datos;

--Se usa DENSE_RANK() para saber el nivel de importancia (ej. "Esta casa tiene el tercer precio más alto de la colonia")
SELECT
  colonia,
  tipo,
  valor,
DENSE_RANK()OVER (
PARTITION BY colonia
ORDER BY valor ASC
  )AS ranking_por_colonia_Dense_Rank
FROM app.datos;

--Se usa ROW_NUMBER() es el más "estricto", ya que no permite empates aunque el precio sea el mismo, asignando simplemente el número de fila (1, 2, 3...)
SELECT
  colonia,
  tipo,
  valor,
ROW_NUMBER()OVER (
PARTITION BY colonia
ORDER BY valor ASC
  )AS ranking_por_colonia_Row_Number
FROM app.datos;

--Los datos son ordenados por los Valores de forma ascendente, del más barato al más caro
SELECT
  colonia,
  tipo,
  valor,
RANK()OVER (
PARTITION BY colonia
ORDER BY valor ASC
  )AS ranking_por_colonia
FROM app.datos;


--Se usa la combinación de AVG()OVER() + PARTTION BY, para conocer el valor promedio de cada categoría por Tipo de Propiedad
--Con esta consulta es posible comparar los valores individuales con el valor promedio general de cada grupo de Tipo

--Valor Promedio por Tipo de propiedad
SELECT
  tipo,
  colonia,
  valor,
ROUND(
	AVG(valor)OVER(
		PARTITION BY tipo), 2
)AS promedio_por_tipo
FROM app.datos;

--Valor Promedio por la Colina donde está ubicada la propiedad
SELECT
  tipo,
  colonia,
  valor,
ROUND(
	AVG(valor)OVER(
		PARTITION BY colonia
	), 2
)AS promedio_por_tipo
FROM app.datos;

--Valor Promedio con base a todas las propiedades en general, sin hacer una distinción de ningún tipo
SELECT
  tipo,
  colonia,
  valor,
ROUND(
	AVG(valor)OVER(), 2
)AS promedio_por_tipo
FROM app.datos;


--Combinación de CTE + Window Function
--Fase 1 (CTE): 
--1. El motor ejecuta la consulta interna
--2. Calcula el promedio para cada fila
--3. "Materializa" lógicamente este resultado.
--Fase 2 (Consulta Principal): Ahora, para la consulta de afuera, **`promedio_general`** ya no es una función de ventana que se está calculando, sino una **columna física** dentro de la tabla temporal **`base`**.
--Fase 3: El Filtro, Al llegar al **`WHERE`** de la consulta principal, el valor ya está disponible y el motor puede filtrar sin problemas.

WITH base AS (
SELECT
*,
ROUND(
	AVG(valor)OVER (), 2
)AS promedio_general
FROM app.datos
)
SELECT*
FROM base
WHERE valor> promedio_general;