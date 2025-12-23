# 📅 Día 4 – Seguridad en PostgreSQL & SQL Avanzado (Subqueries y CTE)

##🎯 Objetivo del día:

Comprender y aplicar conceptos clave de seguridad en PostgreSQL mediante el uso de roles, permisos y schemas, y profundizar en SQL avanzado utilizando subqueries y CTE (Common Table Expressions) para escribir consultas más legibles y mantenibles.

## 📚 Temas estudiados:

### 1. 🔐 Seguridad en PostgreSQL:

* Concepto de roles en PostgreSQL
* Diferencia entre roles con y sin LOGIN
* Atributos de los roles (SUPERUSER, CREATEDB, CREATEROLE, INHERIT)
* Asignación de roles a otros roles
* Uso de GRANT y REVOKE
* Permiso USAGE sobre schemas
* Buenas prácticas de validación de permisos

### 2. 🧠 SQL Avanzado:

* Subqueries
* Subqueries no correlacionadas
* Subqueries correlacionadas
* Uso de subqueries en:
   - SELECT
   - WHERE
* CTE (Common Table Expressions)
* Sintaxis WITH
* Ventajas frente a subqueries
* Mejora en legibilidad y reutilización del código

## 🛠️ Actividades prácticas realizadas:

* Seguridad
* Creación de roles administrativos y funcionales
* Asignación de atributos a roles
* Comprensión del alcance de los roles a nivel cluster
* Validación conceptual del uso de roles heredados (INHERIT)
* SQL Avanzado
* Construcción de consultas con subqueries

## 🗂️ Estructura del directorio

<img width="319" height="259" alt="image" src="https://github.com/user-attachments/assets/37de0146-4817-4983-89fc-e56456b9e376" />

## 🧪 Validaciones y aprendizajes clave:

* Los roles y sus atributos se gestionan a nivel de cluster, no de base de datos.
* Para acceder a objetos dentro de un schema, el permiso USAGE es obligatorio.
* Las subqueries son útiles, pero los CTE facilitan el mantenimiento del código en entornos reales.
* Validar permisos desde la perspectiva del usuario final es una práctica esencial.

## 🧠 Reflexión técnica:

Este día permitió conectar seguridad y consultas avanzadas, entendiendo cómo se aplican ambos conceptos en escenarios reales de trabajo. El enfoque no fue solo ejecutar comandos, sino comprender el impacto de cada decisión en la administración y el acceso a la información.

📌 Este repositorio hace parte de un plan intensivo de 20 días para fortalecer habilidades en PostgreSQL con enfoque en roles profesionales como Data Analyst, DBA Junior o Support Engineer.
