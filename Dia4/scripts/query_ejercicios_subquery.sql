--Ejercicios de Subquery

--Subquery en WHERE
--Trae propiedades con valor mayor al promedio.
SELECT * FROM app.datos
WHERE valor > (
SELECT AVG(valor)
FROM app.datos
);

--Subquery en SELECT
--Genera una vista con las columnas Tipo, Valor y crea una con el Promedio General  
SELECT tipo, valor,
(SELECT AVG(VALOR) FROM app.datos) AS promedio_general
FROM app.datos;

--Subquery en From
--calcula el promedio de Valor para cada Tipo que existe en la tabla app.datos
SELECT tipo, AVG(valor)
FROM (
SELECT tipo, valor
FROM app.datos
)sub
GROUP BY tipo;