/*
====================================================
VIDEO 37: BETWEEN / NOT BETWEEN
====================================================
*/

-- 1. (SELECT y WHERE, operadores relacionales)
--    Muestra nombre y salario de los empleados
--    cuyo salario esta BETWEEN 20000 AND 40000.

select nombre, salario from empleados4 where salario between 20000 and 40000

-- 2. (SELECT y WHERE, operadores logicos, ORDER BY)
--    Muestra nombre y salario de los empleados
--    cuyo salario NOT BETWEEN 20000 AND 40000,
--    ordenados por salario DESC.

select nombre,salario from empleados4 where salario not between 20000 AND 40000 order by salario desc

-- 3. (SELECT y WHERE, BETWEEN, tipos de datos)
--    Comprueba que BETWEEN es inclusivo en ambos extremos:
--    busca empleados con salario BETWEEN 28000 AND 28000.
--    Cuantas filas regresan y quienes son?
select * from empleados4 where salario between 28000 AND 28000 -- devuelve 2

-- 4. (operadores relacionales, operadores logicos, BETWEEN)
--    Muestra los empleados con salario BETWEEN 15000 AND 30000
--    Y que ademas sean activos 'SI'.
select * from Empleados4 where salario BETWEEN 15000 AND 30000 and activo = 'Si'

-- 5. (MAX y MIN, BETWEEN)
--    Muestra nombre y salario de los empleados cuyo salario este
--    BETWEEN el MIN(salario) AND el MAX(salario) de la planta 1.
--    Usa dos subconsultas, una para el minimo y otra para el maximo.
select nombre, salario from Empleados4 where salario between (select MIN(salario) from empleados4) and (select MAX(salario) from empleados4)

-- 6. (IS NULL / IS NOT NULL, BETWEEN)
--    Muestra nombre y salario de los empleados con salario
--    BETWEEN 15000 AND 50000.
--    Carmen y Elena tienen salario NULL: aparecen o no?
--    Anota lo que ves.
select nombre, salario from empleados4 where salario BETWEEN 15000 AND 50000 -- no aparecen 

-- 7. (INSERT INTO, UPDATE, BETWEEN, ORDER BY)
--    Muestra los id_empleado BETWEEN 5 AND 10,
--    con nombre, puesto y salario, ordenados por id_empleado ASC.
select nombre,id_empleado, puesto, salario from empleados4 where id_empleado BETWEEN 5 AND 10 order by id_empleado asc

-- 8. (SUM/AVG/COUNT, BETWEEN)
--    Cuenta cuantos empleados tienen salario
--    BETWEEN 20000 AND 35000.
select count(id_empleado) as 'empleados con salario entre 20000 y 35000' from empleados4 where salario BETWEEN 20000 AND 35000

-- 9. (DISTINCT, BETWEEN, ORDER BY)
--    Muestra los puestos DISTINTOS que tienen empleados
--    con salario BETWEEN 25000 AND 50000,
--    ordenados alfabeticamente.
select  distinct puesto from empleados4 where salario BETWEEN 25000 AND 50000 order by puesto asc

-- 10. (concatenacion y alias, columnas calculadas, BETWEEN)
--     Muestra nombre completo (nombre + ' ' + apellido)
--     y salario * 12 AS Salario_Anual de los empleados
--     cuyo salario anual este BETWEEN 240000 AND 600000.
select nombre + ' ' + apellido AS nombre_completo, salario * 12 as Salario_Anual
from empleados4 where (salario * 12) BETWEEN 240000 AND 600000

-- 11. (TOP, ORDER BY, BETWEEN)
--     Muestra el TOP 3 de empleados con salario
--     NOT BETWEEN 30000 AND 50000,
--     ordenados por salario DESC.
select top 3 * from empleados4 where salario NOT BETWEEN 30000 AND 50000 order by salario desc 

-- 12. (vistas, BETWEEN)
--     Crea la vista v_salario_medio que muestre nombre, puesto
--     y salario de los empleados con salario BETWEEN 20000 AND 35000.
--     Luego consultala.
create view v_salario_medio 
as
select nombre, puesto, salario from empleados4 where salario BETWEEN 20000 AND 35000

select * from v_salario_medio

-- 13. (SELECT y WHERE, IN, NOT BETWEEN, operadores logicos)
--     Muestra los empleados con id_planta IN (1,2,3)
--     Y cuyo salario NOT BETWEEN 40000 AND 60000.
select * from empleados4 where id_planta IN (1,2,3) and salario NOT BETWEEN 40000 AND 60000

-- 14. (Clientes2, IS NULL / IS NOT NULL, BETWEEN)
--     Sobre Clientes2: muestra los clientes con id_cliente
--     BETWEEN 2 AND 5 que ademas tengan ciudad registrada.
select * from clientes2 where id_cliente BETWEEN 2 AND 5 and ciudad is not null

-- 15. (crear tablas, insertar registros, SELECT y WHERE, IS NULL / IS NOT NULL,
--     operadores logicos, SUM/AVG/COUNT, ORDER BY, BETWEEN)
--     Verificacion maestra: muestra nombre, puesto, salario
--     y salario * 12 AS Salario_Anual de TODOS los empleados
--     con salario NOT NULL, ordenados por salario DESC.
--     Confirma que son exactamente 10 filas
--     (Carmen y Elena tienen salario NULL y no deben aparecer).

select nombre, puesto, salario, salario * 12 AS Salario_Anualfrom  from empleados4 where salario is not null order by salario desc -- son 10 filas 