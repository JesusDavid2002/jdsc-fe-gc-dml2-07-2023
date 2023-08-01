-- 2.1 Obten los apellidos de empleados
SELECT apellidos FROM empleados;

-- 2.2 Obten los apellidos de empleados sin repeticiones
SELECT apellidos FROM empleados
GROUP BY apellidos;

-- 2.3 Obten todos los datos de los empleados Smith
SELECT * FROM empleados
WHERE apellidos = 'Smith';

-- 2.4 Obten todos los datos de los empleados Smith y Rogers
SELECT * FROM empleados
WHERE apellidos = 'Smith' OR apellidos = 'Rogers';

-- 2.5 Obten todos los datos de los empleados que trabajan en el departamento 14
SELECT * FROM empleados
WHERE departamento = 14;

-- 2.6 Obten todos los datos de los empleados que trabajan en el departamento 37 y 77
SELECT * FROM empleados
WHERE departamento = 37 OR departamento = 77;

-- 2.7 Obten todos los datos de los empleados cuyo apellido empiece por P
SELECT * FROM empleados
WHERE apellidos LIKE 'P%';

-- 2.8 Presupesto total de todos los depart
SELECT SUM(presupuesto) AS 'Presupuesto total' FROM departamentos;

-- 2.9 Obten el numero de empleados en cada departamento
SELECT departamento, COUNT(*) AS 'Numero empleados' FROM empleados
GROUP BY departamento;

-- 2.10 Obten listado completo de empleados, ademas de su departamento
SELECT * FROM empleados
JOIN departamentos
ON empleados.departamento = departamentos.codigo;

-- 2.11 Obten listado completo de empleados, ademas de su departamento
SELECT empleados.dni, empleados.nombre, empleados.apellidos, departamentos.nombre, departamentos.presupuesto FROM empleados
JOIN departamentos
ON empleados.departamento = departamentos.codigo;

-- 2.12 Obten nombres y apellidos de los departamento tengan presupuesto mayor a 60k
SELECT empleados.nombre, empleados.apellidos FROM empleados
JOIN departamentos
ON empleados.departamento = departamentos.codigo
WHERE departamentos.presupuesto > 60000;

-- 2.13 Obten los datos de los departamentos cuyo presupuesto sea mayor al presupuesto medio
SELECT * FROM departamentos
WHERE presupuesto > (
	SELECT AVG(presupuesto) FROM departamentos
);

-- 2.14 Obten los nombre de los departamentos con mas de 2 empleados
SELECT departamentos.nombre FROM departamentos
JOIN empleados
ON departamentos.codigo = empleados.departamento
GROUP BY departamentos.nombre
HAVING COUNT(empleados.departamento) > 2;

-- 2.15 Añadir nuevo departamento y vincularlo a un empleado
INSERT INTO departamentos VALUE (11, 'Calidad', 40000);
INSERT INTO empleados VALUE (89267109, 'Esther', 'Vázquez', 11);

-- 2.16 Aplicar un recorte presupuesto 10%(0.9) a todos los departamentos
UPDATE departamentos SET presupuesto = presupuesto*0.9;

-- 2.17 Reasgnar a los empleados departamento 77 al departamento 14
UPDATE empleados SET departamento = 14
WHERE departamento = 77;

-- 2.18 Despedir a todos los empleados que trabajan para el departamento 14
DELETE FROM empleados
WHERE departamento = 14;

-- 2.19 Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea mayor a 60k
DELETE FROM empleados
WHERE departamento IN (
	SELECT codigo FROM departamentos
    WHERE presupuesto > 60000
);

-- 2.20 Despedir a todos
DELETE FROM empleados;