/*
====================================================
VIDEO 35: SUM, AVG, COUNT
====================================================
*/

-- 1. Muestra COUNT(*) del total de empleados, con alias Total_Empleados.
select * from empleados4
SELECT Count(id_empleado) as Total_Empleados from empleados4

-- 2. Muestra SUM(salario) AS Nomina_Total: la suma de todos los salarios de Empleados4.

select sum(salario) as Nomina_Total from empleados4

-- 3. Muestra AVG(salario) AS Salario_Promedio. Compara este numero contra
--    tu MAX y tu MIN del video 34: ¿el promedio cae entre ambos?

select AVG(salario) AS Salario_Promedio from empleados4

-- 4. Muestra COUNT(correo) AS Con_Correo. Compara contra COUNT(*) del ejercicio 1:
--    ¿por que el numero es menor? (video 18: COUNT de una columna ignora los NULL,
--    a diferencia de COUNT(*) que cuenta filas).

select count(correo) as 'empleados conm correo' from Empleados4


-- 5. Para cada id_planta, muestra COUNT(*) AS Total y SUM(salario) AS Suma_Salarios
--    en la misma consulta (GROUP BY, video 43 adelantado solo como practica de SUM/COUNT
--    agrupados — mismo patron que ya usaste en el video 34 con MAX+COUNT).
select * from empleados4
select COUNT(id_planta) AS Total, SUM(salario) AS Suma_Salarios from Empleados4


-- 6. Muestra AVG(salario) SOLO de los empleados activos 'SI' (video 12).

select avg(salario) as salario_promedio_activos from empleados4 where activo = 'si'

-- 7. Construye con CAST (video 29):
--    'La nomina total es ' + CAST(SUM(salario) AS VARCHAR)
--    (una sola fila, sin GROUP BY -- recuerda la trampa del video 34 ejercicio 7).

select 'La nomina total es ' + CAST(SUM(salario) AS VARCHAR) as nomina_total_de_la_empresa from empleados4

-- 8. Muestra SUM(salario) - AVG(salario) AS Diferencia (video 30): resta la suma
--    menos el promedio en una sola consulta.

select SUM(salario) - AVG(salario) AS Diferencia from empleados4

-- 9. Muestra COUNT(*) de los empleados con id_planta IN (1,3) (video 15).

select count(*) as 'Empleados en planta 1 y 3' from empleados4 where id_planta in (1,3)

-- 10. Crea la vista v_resumen_nomina (video 26) que muestre
--     COUNT(*) AS Total_Empleados, SUM(salario) AS Nomina_Total,
--     AVG(salario) AS Promedio de Empleados4.
--     Luego consultala con SELECT * FROM v_resumen_nomina.

create view v_resumen_nomina
as 
select count(*) AS Total_Empleados, SUM(salario) AS Nomina_Total, AVG(salario) AS Promedio from Empleados4

select * from v_resumen_nomina

-- 11. Sobre Clientes2 (videos 1, 9): muestra COUNT(*) AS Total_Clientes
--     y COUNT(DISTINCT ciudad) AS Ciudades_Distintas (video 28) en la misma consulta.

select * from clientes2
select count(id_cliente) as Total_Clientes, COUNT(DISTINCT ciudad) AS Ciudades_Distintas from Clientes2

-- 12. Sobre Nomina.Bonos (video 31): muestra COUNT(*) AS Total_Bonos y
--     SUM(monto) AS Suma_Bonos. Si la tabla esta vacia, ¿que regresa SUM
--     comparado con COUNT? Anota el resultado tal como te salga.

select * from Nomina.Bonos
select count(*) as 'Total de bonos', sum(monto) as Suma_Bonos from Nomina.Bonos


-- 13. Muestra el promedio de edad (AVG(edad)) de Empleados4. Andres tiene
--     edad NULL (video 18): ¿AVG la ignora igual que MAX/MIN en el video 34,
--     o el resultado cambia si la incluyeras? Solo reporta el numero que te dio.

select AVG(edad) as 'promedio de edad en empleados4' from empleados4 -- 32


-- 14. Combina DISTINCT (video 28) con AVG: para cada puesto distinto,
--     muestra AVG(salario) AS Promedio_Puesto (mismo patron del ejercicio 14
--     del video 34, pero con AVG en vez de MAX).

select * from empleados4
select AVG(salario) AS Promedio_Puesto from empleados4

-- 15. Verificacion final (video 32): confirma con SELECT * FROM Empleados4
--     que los 12 salarios siguen siendo los del script maestro original.

SELECT * FROM Empleados4