# 📘 Día 1 – Instalación y Entorno PostgreSQL

## 🎯 Objetivo del día:

Configurar el entorno de trabajo con PostgreSQL, comprender la arquitectura básica del motor y explorar los objetos iniciales de la base de datos.

## 🧠 Conceptos estudiados:

* Qué es una instancia de PostgreSQL
* Qué es un cluster y cómo organizar varias bases de datos
* Diferencias entre PostgreSQL y MySQL
* Diferencias entre licencias BSD (PostgreSQL) y GPL (MySQL)

## 🛠️ Configuración del entorno:

### 1️⃣ Instalación de PostgreSQL:

Se descargó e instaló PostgreSQL en el equipo, configurando el servicio y los accesos básicos con pgAdmin o psql según plataforma.
El objetivo fue tener la instancia del motor funcionando correctamente.

### 2️⃣ Verificación de la instalación:

Se ejecutaron comandos para comprobar el entorno:

SELECT version();

## 🧪 Creación de base de datos: 

Se creó la base de datos para la práctica:

CREATE DATABASE postgres_lab;

## 📊 Pruebas y resultados:

Durante el día se revisaron:
* La estructura jerárquica de PostgreSQL
* El cluster con su base de datos principal

##🧠 Aprendizajes clave:

### 🟡 Instancia vs Cluster vs Base de datos:
* La instancia es el proceso del motor PostgreSQL en ejecución.
* El cluster agrupa varias bases de datos y las configura en un solo directorio de datos.
* Las bases de datos viven dentro del cluster.

### 🧾 Diferencias PostgreSQL vs MySQL:

* Entre las diferencias relevantes se destacan:

<img width="969" height="376" alt="image" src="https://github.com/user-attachments/assets/0223f064-0cad-4f67-a1c2-502f22a18628" />

* ⚠️ Sobre licencias:
*PostgreSQL (BSD)* permite uso y modificación sin obligación de liberar código.
*MySQL (GPL)* obliga a liberar el código si distribuyes software que lo integra.

## 🛠️ Ejercicios y comprobaciones realizadas:

* Instalación completa del motor PostgreSQL
* Comprobación de versión y entorno
* Creación de base de datos
* xploración de objetos iniciales

## 📌 Buenas prácticas reforzadas:

* Separar la base de datos de esudio del resto
* Documentar comandos utilizados

## 🚀 Resultado:

Al finalizar este día:

Se configuró un entorno PostgreSQL funcional, se creó una base de datos y se comprendió la arquitectura inicial del motor PostgreSQL, diferenciando correctamente entre estructura y objetos.

## 📄 Evidencias: 

* Scripts de configuración y exploración
* Capturas de salida de consulta
* Notas técnicas escritas en Notion

## 🧭 Siguiente paso: 

👉 Día 2: Schemas, objetos y organización de datos

## ✨ Nota final: 

Este trabajo hace parte de un plan de estudio intensivo de PostgreSQL enfocado en roles profesionales, administración básica y buenas prácticas en entornos reales.
