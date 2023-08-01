-- 3.1 Obten todos los almacenes
SELECT * FROM almacenes;

-- 3.2 Obten todas las cajas cuyo contenido sea mayor a 150
SELECT * FROM cajas
WHERE valor > 150;

-- 3.3 Obten los tipos de contenidos de las cajas
SELECT contenido FROM cajas
GROUP BY contenido;

-- 3.4 Obten el valor medio de todas las cajas
SELECT AVG(valor) AS 'Valor medio' FROM cajas;

-- 3.5 Obten el valor medio de las cajas de cada almacen
SELECT almacen, AVG(valor) AS 'Valor medio' FROM cajas 
GROUP BY almacen;

-- 3.6 Obten los codigos de los almacenes, el valor medio mayor a 150
SELECT numreferencia FROM cajas 
GROUP BY numreferencia
HAVING AVG(valor) > 150;

-- 3.7 Obten el numero de referencia de cada caja junto con el nombre de la ciudad
SELECT cajas.numreferencia, almacenes.lugar FROM cajas
JOIN almacenes
ON cajas.almacen= almacenes.codigo;

-- 3.8 Obten el numero de cajas de cada almacen
SELECT almacen, COUNT(contenido) FROM cajas
GROUP BY almacen;

-- 3.9 Obten el codigo de los almacenes saturados
SELECT codigo FROM almacenes
WHERE capacidad < (
	SELECT COUNT(*) FROM cajas WHERE almacen = codigo
); 

-- 3.10 Obten los numeros de referncia de las cajas que estan en Bilbao
SELECT cajas.numreferencia FROM cajas
JOIN almacenes
ON cajas.almacen = almacenes.codigo
WHERE lugar = 'Bilbao';

-- 3.11 Insertar un nuevo almacen 
INSERT INTO almacenes VALUES (6, 'Barcelona', 3);

-- 3.12 Insertar una nueva caja
INSERT INTO cajas VALUES ('H5RT', 'Papel', 200, 2);

-- 3.13 Rebajar el valor de las cajas 15% (0.85)
UPDATE cajas SET valor = valor*0.85;

-- 3.14 Rebajar 20% cuyo precio sea mayor al de la media
UPDATE cajas SET valor = valor*0.8
WHERE valor > (
	SELECT valor_medio FROM (
		SELECT AVG(valor) AS valor_medio FROM cajas) AS promedio
);

-- 3.15 Eliminar todas las cajas cuyo valor sea inferior a 100
DELETE FROM cajas WHERE valor < 100;

-- 3.16 Vacia el contenido de los almacenes saturados
DELETE FROM cajas WHERE almacen IN (
	SELECT codigo FROM (
		SELECT almacenes.codigo FROM almacenes
		WHERE almacenes.capacidad < (
		SELECT COUNT(*) FROM cajas WHERE cajas.almacen = almacenes.codigo)) AS sub
); 