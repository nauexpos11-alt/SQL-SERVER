/*
====================================================
VIDEO 39: INNER JOIN — ON t1.col = t2.col
====================================================
*/

-- 1. (bases de datos relacionales, FOREIGN KEY, INNER JOIN)
--    Une Empleados4 con Plantas por id_planta.
--    Muestra nombre, apellido del empleado y nombre de la planta.


-- 2. (INNER JOIN, ORDER BY)
--    Repite el ejercicio 1 pero ordena por nombre de planta ASC
--    y dentro de cada planta por apellido del empleado ASC.


-- 3. (INNER JOIN, IS NULL / IS NOT NULL)
--    Une Empleados4 con Plantas.
--    Muestra solo los empleados que SI tienen planta asignada.
--    Cuantos son? Sofia (id_planta NULL) aparece o no?
--    Explica por que INNER JOIN la excluye automaticamente.


-- 4. (INNER JOIN, operadores relacionales)
--    Une Empleados4 con Plantas.
--    Muestra nombre del empleado, puesto y nombre de la planta
--    SOLO de la planta cuyo nombre sea 'Cosma Saltillo'.


-- 5. (INNER JOIN, SUM/AVG/COUNT, GROUP BY)
--    Une Empleados4 con Plantas.
--    Para cada nombre de planta, muestra cuantos empleados tiene
--    y cual es su salario promedio.
--    Agrupa por nombre de planta.


-- 6. (INNER JOIN, MAX y MIN)
--    Une Empleados4 con Plantas.
--    Muestra nombre de planta, MAX(salario) y MIN(salario)
--    por cada planta, agrupado por nombre de planta.


-- 7. (INNER JOIN, operadores logicos, ORDER BY)
--    Une Empleados4 con Plantas.
--    Muestra nombre del empleado, puesto y ciudad de la planta
--    SOLO de los empleados activos 'SI' de las ciudades
--    'Saltillo' O 'San Luis Potosi'.


-- 8. (INNER JOIN, DISTINCT)
--    Une Empleados4 con Plantas.
--    Muestra las ciudades DISTINTAS donde hay empleados activos 'SI'.


-- 9. (INNER JOIN, concatenacion y alias)
--    Une Empleados4 con Plantas.
--    Muestra nombre completo del empleado (nombre + ' ' + apellido)
--    AS Empleado y nombre de la planta AS Planta,
--    solo de quienes ganan mas de 25000.


-- 10. (INNER JOIN, BETWEEN)
--     Une Empleados4 con Plantas.
--     Muestra nombre del empleado, salario y nombre de la planta
--     de los empleados con salario BETWEEN 20000 AND 40000.


-- 11. (INNER JOIN, LIKE)
--     Une Empleados4 con Plantas.
--     Muestra nombre del empleado y nombre de la planta
--     de los empleados cuyo apellido termine en 'ez'.


-- 12. (INNER JOIN, SUM/AVG/COUNT, TOP, ORDER BY)
--     Une Empleados4 con Plantas.
--     Muestra el TOP 3 de plantas con mas empleados,
--     con nombre de planta y su conteo,
--     ordenado de mayor a menor.


-- 13. (INNER JOIN, vistas)
--     Crea la vista v_empleados_planta que muestre
--     nombre, apellido, puesto, salario y nombre de la planta.
--     Luego consultala.


-- 14. (INNER JOIN, esquemas, Nomina.Bonos)
--     Une Nomina.Bonos con Empleados4 por id_empleado.
--     Muestra nombre, apellido y monto del bono.
--     Si Nomina.Bonos esta vacia, anota cuantas filas regresa
--     y explica por que INNER JOIN con tabla vacia da 0 filas.


-- 15. (INNER JOIN, IS NULL / IS NOT NULL, SUM/AVG/COUNT,
--     ORDER BY, operadores logicos)
--     Verificacion maestra: une Empleados4 con Plantas.
--     Muestra nombre del empleado, puesto, salario y nombre de la planta
--     de TODOS los empleados que tienen planta asignada,
--     ordenados por nombre de planta ASC y salario DESC.
--     Confirma cuantas filas regresan y por que Sofia no aparece.