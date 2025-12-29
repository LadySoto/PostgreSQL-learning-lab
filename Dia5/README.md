# 📅 Día 5 – SQL Avanzado II: Window Functions (Enfoque Profesional)

## 🎯 Objetivo del día:

Aprender y aplicar Window Functions en PostgreSQL para resolver problemas analíticos reales, entendiendo claramente la diferencia entre agregaciones tradicionales (GROUP BY) y funciones de ventana, manteniendo la granularidad de los datos.

## 📚 Temas estudiados:

### 1. 🔹 Conceptos base:

Antes de aplicar Window Functions, se reforzaron conceptos fundamentales sobre el funcionamiento interno de SQL:

* Jerarquía de escritura SQL
* Flujo lógico de ejecución de consultas
* Diferencia entre sintaxis y ejecución real del motor
* Momento exacto en el que se calculan las Window Functions (SELECT)

📌 Conclusión clave:
Las Window Functions se ejecutan después del WHERE, lo que impacta directamente cómo se filtran los datos.

### 2. 🔹 Primeras Window Functions (Hands-on):

* ROW_NUMBER(): Creación de un ranking de propiedades de la más costosa a la más económica, excluyendo valores nulos.
* RANK() vs DENSE_RANK(): Comparación práctica entre funciones de ranking y manejo de empates.

📌 Aprendizaje clave:
- RANK() deja huecos en la numeración
- DENSE_RANK() mantiene numeración continua

* PARTITION BY: Creación de rankings independientes por colonia sin perder registros individuales.

### 3. 🔹 Window Functions analíticas:

* AVG() OVER(): Cálculo de promedios por tipo de propiedad manteniendo el detalle de cada fila.

📌 Permite identificar propiedades por encima o debajo del promedio de su categoría.

* Comparación contra promedio general (CTE + Window Function): Uso de una CTE para poder filtrar resultados calculados con Window Functions.

📌 Patrón clave aprendido:
CTE + Window Function permite superar la limitación de usar funciones analíticas en el WHERE.


## 🧠 Notas técnicas destacadas:

* Diferencia entre sintaxis SQL y flujo lógico de ejecución
* Elección correcta de funciones de ranking según el análisis
* PARTITION BY conserva la granularidad de los datos
* Uso de Window Functions para detección de outliers
* Patrón CTE + Window Function como solución profesional de filtrado

## 📂 Evidencia:

* Scripts ejecutados y documentados
* Resultados analizados
* Notas técnicas registradas en Notion
* Código versionado en este repositorio


📌 Este repositorio hace parte de un plan intensivo de 20 días para fortalecer habilidades en PostgreSQL con enfoque en roles profesionales como Data Analyst, DBA Junior o Support Engineer.
