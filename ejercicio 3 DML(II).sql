-- 3.1 Obten todos los almacenes
SELECT * FROM almacenes;

-- 3.2 Obten todas las cajas cuyo contenido sea mayor a 150
SELECT * FROM cajas
WHERE valor > 150;

-- 3.3 Obten los tipos de contenidos de las cajas
SELECT contenido FROM cajas
GROUP BY contenido;

-- 3.4 Obten el valor medio de todas las cajas
SELECT AVG(valor) AS valor_medio FROM cajas;

-- 3.5 Obten el valor medio de las cajas de cada almacen
SELECT almacenes.lugar, AVG(cajas.valor) AS valor_medio_cajas
FROM almacenes
LEFT JOIN cajas ON almacenes.codigo = cajas.numreferencia
GROUP BY almacenes.lugar
