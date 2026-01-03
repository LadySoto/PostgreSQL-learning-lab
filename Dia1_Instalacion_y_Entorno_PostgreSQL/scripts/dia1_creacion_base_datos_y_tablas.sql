-- Crear la base de datos
CREATE DATABASE TiendaMusicaDB;

-- Crear la tabla Artistas
CREATE TABLE Artistas (
    id_artista SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL
);

-- Crear la tabla Álbumes
CREATE TABLE Albumes (
    id_album SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_artista INT REFERENCES Artistas(id_artista),
    fecha_lanzamiento DATE NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- Crear la tabla Ventas
CREATE TABLE Ventas (
    id_venta SERIAL PRIMARY KEY,
    id_album INT REFERENCES Albumes(id_album),
    cantidad INT NOT NULL,
    fecha_venta DATE NOT NULL DEFAULT CURRENT_DATE,
    precio_total DECIMAL(10, 2) NOT NULL
);