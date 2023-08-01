-- 4.1 Mostrar el nombre de todas las peliculas
SELECT nombre FROM peliculas;

-- 4.2 Mostrar las calificaciones de edad
SELECT calificacionedad FROM peliculas
GROUP BY calificacionedad;

-- 4.3 Mostrar todas las peliculas sin clasificar
SELECT * FROM peliculas
WHERE calificacionedad IS NULL;

-- 4.4 Mostrar todas las salas que no proyecten ninguna pelicula
SELECT * FROM salas
WHERE pelicula IS NULL;

-- 4.5 Mostrar la info de todas las salas y si hay peli tambien sus datos
SELECT * FROM salas
LEFT JOIN peliculas 
ON salas.codigo = peliculas.codigo
WHERE pelicula IS NOT NULL;

-- 4.6 Mostrar la info de todas las peliculas y si se proyecta tambien de la sala
SELECT * FROM peliculas
LEFT JOIN salas 
ON salas.codigo = peliculas.codigo
WHERE pelicula IS NOT NULL;

-- 4.7 Mostrar los nombres de las pelis que no se proyecten en ninguna sala
SELECT peliculas.nombre FROM peliculas
LEFT JOIN salas 
ON salas.codigo = peliculas.codigo
WHERE pelicula IS NULL;

-- 4.8 Añadir una nueva peli
INSERT INTO peliculas VALUES (10, 'Uno, Dos, Tres', 'NC-7');

-- 4.9 Todas las pelis sin clasificar seran NC-13
UPDATE peliculas SET calificacionedad = 'NC-13'
WHERE calificacionedad IS NULL;

-- 4.10 Eliminar todas las salas con calificacion G
DELETE FROM salas WHERE codigo IN (
	SELECT codigo FROM peliculas
    WHERE calificacionedad = 'G'
);