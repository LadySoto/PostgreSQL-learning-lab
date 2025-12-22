# 📘 Día 3 – Roles y Atributos en PostgreSQL

## 🎯 Objetivo del día:

Comprender el modelo de seguridad de PostgreSQL a nivel de **Roles**, diferenciando claramente entre **Atributos de Rol** y **Permisos**, 
y entendiendo el alcance real de los roles dentro del cluster.

---

## 🧠 Conceptos estudiados:

Durante este día se trabajaron los siguientes conceptos:

* Qué es un **Rol** en PostgreSQL.
* Diferencia entre **Rol** y **Usuario** (rol con atributo LOGIN).
* Qué son los **Atributos de Rol** y su alcance.
* Diferencia entre:
   - Atributos del Rol
   - Membresía de Roles
   - Permisos sobre Objetos
* Nivel de aplicación de los Roles (**cluster-level**).
* Uso del cliente `psql` para explorar Roles y Atributos.

---

## 🧩 Roles y arquitectura de PostgreSQL:

En PostgreSQL:

* Los **roles son entidades globales al cluster**.
* Un mismo rol puede conectarse a múltiples bases de datos.
* Los atributos del rol definen capacidades administrativas, no acceso a datos.

---

## 🛠️ Actividades realizadas:

### 1️⃣ Creación de roles:

Se crearon roles con distintos atributos administrativos:

CREATE ROLE admin
WITH SUPERUSER
LOGIN
PASSWORD '******'
VALID UNTIL '2025-12-31 19:30:59';

CREATE ROLE usuario_escritura LOGIN PASSWORD '******';

### 2️⃣ Asignación de roles (membresía):

GRANT admin TO usuario_escritura;

Se analizó el efecto de la membresía y la diferencia entre:
* Tener un rol asignado
* Heredar o no sus privilegios

### 3️⃣ Exploración de atributos de roles:

SELECT rolname, rolsuper, rolcreatedb, rolcreaterole, rolinherit, rolcanlogin
FROM pg_roles;

Se identificó que:
* Los atributos pertenecen al rol directamente.
* Los atributos heredados no se muestran en \du.

### 4️⃣ Uso del cliente psql:

Se aprendió a interpretar los prompts:
* =# → listo para ejecutar comandos
* -# → instrucción incompleta

Y cómo cancelar una instrucción incompleta con:
* Ctrl + C

## 🔍 Atributos de rol estudiados:

Los atributos revisados incluyen:
* SUPERUSER
* CREATEDB
* CREATEROLE
* LOGIN
* INHERIT
* VALID UNTIL
* CONNECTION LIMIT

Estos atributos definen capacidades administrativas a nivel de cluster, no permisos sobre tablas.

## 📝 Aprendizajes clave:

* Los roles en PostgreSQL no pertenecen a una base de datos, sino al cluster.
* Asignar un rol a un usuario no implica herencia automática de privilegios.
* \du muestra atributos propios del rol, no privilegios heredados.
* La seguridad en PostgreSQL se basa en una clara separación entre:
   - Atributos del rol
   - Permisos sobre objetos

## 📌 Buenas prácticas reforzadas:

* No confundir atributos de rol con permisos (GRANT SELECT, etc.).
* Evitar el uso innecesario de SUPERUSER.
* Comprender completamente el alcance de un rol antes de asignarlo.
* Documentar cada cambio en roles y atributos.

## 🚀 Próximo paso

👉 Día 4 – Permisos sobre objetos, schemas e introducción a control de acceso real
(SELECT, INSERT, UPDATE, DELETE)

✨ Este día forma parte de un plan de estudio progresivo en PostgreSQL, enfocado en comprender primero la arquitectura y el modelo de seguridad antes de aplicar permisos sobre datos.
