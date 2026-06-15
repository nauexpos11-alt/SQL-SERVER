/*
Video 33: ORDER BY — ASC/DESC, varias columnas
Concepto rápido: ORDER BY ordena el RESULTADO final (no la tabla) según una o varias columnas: ASC (ascendente, de menor a mayor 
— es el default si no escribes nada) o DESC (descendente). Con varias columnas, la primera manda y las siguientes son "desempate": 
ORDER BY puesto, salario DESC agrupa visualmente por puesto y, dentro de cada puesto, ordena por salario de mayor a menor. 
Va al FINAL de la consulta, después de WHERE y GROUP BY.
*/

-- Muestra nombre, salario de todos los empleados ordenados por salario de mayor a menor (DESC).
select * from empleados4;

select nombre, salario from Empleados4 order by salario desc;

-- Muestra nombre, apellido, edad ordenados por edad ascendente. Como Andrés tiene edad NULL (video 18/19), 
-- observa en qué posición aparece — sin explicar, solo anótalo. en primera posicion 
select nombre, apellido, edad from Empleados4 order by edad asc;

-- Muestra los empleados con activo = 'SI' (video 9/12), ordenados por salario DESC.

select * from empleados4 where activo = 'SI' order by salario desc

-- Muestra TOP 3 (video 17) de los salarios más altos: combina TOP con ORDER BY DESC.
select top 3 salario from empleados4 order by salario desc
-- Muestra nombre, puesto, salario ordenados primero por puesto (ASC) 
-- y luego por salario (DESC) — el patrón "agrupar visualmente y desempatar" de la sintaxis.

select nombre, puesto, salario
from empleados4
order by puesto asc, salario asc;

-- Muestra los empleados de la planta 1 o 3 (video 15, IN (1,3)), ordenados por apellido ASC.
select * from Empleados4 where id_planta in(1,3) order by apellido asc

-- Muestra nombre, correo de los empleados con correo IS NOT NULL (video 18), ordenados alfabéticamente por nombre.
select nombre, correo from empleados4 where correo is not null order by nombre asc 

-- Muestra los puestos únicos (video 28, DISTINCT) ordenados alfabéticamente.
select distinct puesto from Empleados4 order by puesto asc

-- Construye el nombre completo (video 29: nombre + ' ' + apellido) con alias [Nombre Completo], ordenado por apellido DESC.

select nombre + ' ' + apellido as 'nombre completo' from empleados4 order by apellido desc

-- Muestra salario, salario * 1.10 AS Con_Aumento (video 30), ordenado por Con_Aumento DESC — confirma que puedes ordenar por una columna calculada usando su alias.
select salario * 1.10 as 'Con aumento' from empleados4 order by 'Con aumento' desc

-- Muestra los AMRs (tu tabla del Bloque 1) ordenados por bateria_pct ASC — los de menor batería primero, como una "cola de carga".

select * from bloque1 -- Muestra los AMRs (tu tabla del Bloque 1) ordenados por bateria_pct ASC — los de menor batería primero, como una "cola de carga". no tengo esa tabla

-- Muestra id_empleado, nombre, id_planta ordenados por id_planta ASC;
-- observa en qué posición caen los empleados con id_planta IS NULL (video 18 + 25).

select id_empleado, nombre, id_planta from Empleados4 order by id_planta desc

-- Combina Nomina.Bonos con dbo.Empleados4 (video 31, tu mismo JOIN de hace un momento) y ordena el resultado por monto DESC.
-- aun no se hacer el join 

-- Muestra nombre, salario SOLO de quienes ganan más de 20000 (video 12),
-- ordenados por salario ASC (los "justo arriba del corte" primero).
select nombre , salario from empleados4 where salario > 20000 order by salario asc 

-- Muestra nombre, apellido, salario, salario * 12 AS Salario_Anual (video 30), ordenado por Salario_Anual DESC, con TOP 5 (video 17) — el "top 5 mejor pagados al año" en una sola consulta.
select top 5 nombre, apellido, salario, salario * 12 AS Salario_Anual from empleados4 order by Salario_Anual desc

