-- 1.1 Obtener los nombres de los productos de la tienda
SELECT nombre FROM articulos;

-- 1.2 Obtener los nombres y los precios de los productos de la tienda
SELECT nombre, precio FROM articulos;

-- 1.3 Obtener los nombres de los productos cuyo precio sea menor o igual a 200
SELECT nombre FROM articulos
WHERE precio <= 200;

-- 1.4 Obtener todos los datos de los artículos cuyo precio este entre 60 y 120
SELECT * FROM articulos
WHERE precio BETWEEN 60 AND 120;

-- 1.5 Obtener el nombre y el precio en pesetas (1€=166.386)
SELECT nombre, (precio*166.386) AS precio FROM articulos;

-- 1.6 Seleccionar el precio medio de todos los productos
SELECT AVG(precio) AS 'Precio de media' FROM articulos;

-- 1.7 Obten el precio medio de los articulos cuyo codigo de fabrica sea 2
SELECT AVG(precio) AS 'Precio de media' FROM articulos
WHERE fabricante = 2;

-- 1.8 Obten el numero de articulos cuyo precio sea mayor o igual a 180
SELECT COUNT(precio) AS 'Numero articulos' FROM articulos
WHERE precio >= 180;

-- 1.9 Obten el nombre y precio de los articulos cuyo precio sea mayor o igual a 180 y ordenarlos desc. por precio y luego asc. por nombre
SELECT nombre, precio AS 'Numero articulos' FROM articulos
WHERE precio >= 180
ORDER BY precio DESC, nombre;

-- 1.10 Obten listado completo de articulos, incluyendo su fabricante
SELECT * FROM articulos
JOIN fabricantes
ON articulos.fabricante = fabricantes.CODIGO;

-- 1.11 Obten listado de articulos (nombre, precio y nombre fabricante)
SELECT articulos.nombre, articulos.precio, fabricantes.nombre FROM articulos
JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo;

-- 1.12 Obten precio medio de productos de cada fabricante, mostrar solo codigo fabricante
SELECT fabricante FROM articulos
GROUP BY fabricante
HAVING AVG(precio);

-- 1.13 Obten precio medio de productos de cada fabricante, mostrando el nombre del fabricante
SELECT fabricantes.nombre FROM articulos
JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo
GROUP BY fabricantes.nombre
HAVING AVG(articulos.precio);

-- 1.14 Obten los nombres fabricantes que ofrezcan productos cuyo precio medio mayor o igual 150
SELECT fabricantes.nombre FROM articulos
JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo
GROUP BY fabricantes.nombre
HAVING AVG(articulos.precio) >= 150;

-- 1.15 Obten el nombre y precio del artículo más barato
SELECT nombre,precio FROM articulos
WHERE precio = (
	SELECT MIN(precio) FROM articulos
);

-- 1.16  Obten lista nombre y precio de los mas caros de cada proveedor (incluye nombre proveedor)
SELECT articulos.nombre AS Articulo, fabricantes.nombre AS Proveedor, articulos.precio AS 'Precio mas Alto' FROM articulos 
JOIN fabricantes 
ON articulos.fabricante = fabricantes.codigo
WHERE (articulos.fabricante, articulos.precio) IN (
	SELECT fabricante, MAX(precio) FROM articulos
    GROUP BY fabricante
);

-- 1.17 Añadir un nuevo producto
INSERT INTO articulos VALUES (11, 'Altavoces', 70, 2);

-- 1.18 Cambiar nombre producto
UPDATE articulos SET nombre='Impresora Laser'
WHERE codigo=8;

-- 1.19 Aplicar un descuento 10% (0.9) a todos los productos
UPDATE articulos SET precio = precio*0.9;

-- 1.20 Aplicar 10€ descuento a todos los productos cuyo precio sea mayor o igual a 120
UPDATE articulos SET precio = precio-10
WHERE precio >= 120;