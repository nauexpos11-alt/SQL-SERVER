/*
====================================================
VIDEO 36: Operadores logicos — AND, OR, NOT, parentesis
====================================================
*/

-- 1. Muestra los empleados que son activos 'SI' Y tienen salario mayor a 25000.
SELECT * FROM Empleados4 WHERE ACTIVO = 'SI' AND SALARIO > 25000;

-- 2. Muestra los empleados que son de la planta 1 O de la planta 3.

SELECT * from empleados4 where id_planta = 1 or id_planta = 3


-- 3. Muestra los empleados que NO son del puesto 'Tecnico'.

select * from empleados4 where not puesto = 'Tecnico'

-- 4. Muestra los empleados activos 'SI' Y de la planta 2,
--    ordenados por salario de mayor a menor.
select * from Empleados4 where activo = 'si' and id_planta = 2 order by salario desc

-- 5. Muestra los empleados cuyo puesto es 'Gerente' O 'Supervisor',
--    con su salario ordenado descendente.
select * from empleados4 where puesto = 'gerente' or puesto = 'Supervisor' order by salario desc

-- 6. Muestra los empleados que NO tienen correo registrado.
select * from empleados4 where not correo is null

-- 7. Muestra los empleados de la planta 1 O 3, Y con salario mayor a 20000.
--    Usa parentesis para dejar claro el orden de evaluacion:
--    (planta 1 O planta 3) Y salario > 20000.
select * from Empleados4  where (id_planta = 1 or id_planta = 3) and salario > 20000

-- 8. Muestra los empleados que son activos 'SI' Y su salario
--    esta entre 15000 y 30000 (usa >= y <=, sin BETWEEN).

select * from Empleados4 where activo = 'SI' and salario >= 15000 and salario <= 30000 

-- 9. Muestra los empleados que NO son activos 'SI'
--    (es decir, los inactivos), con nombre y puesto.
select nombre, puesto, activo from Empleados4 where not activo = 'si'

-- 10. Cuenta cuantos empleados son activos 'SI' Y tienen salario mayor al promedio
--     de toda la empresa (combina COUNT con subconsulta de AVG del video 35).
select count(*) as 'empleados activos con salario mayor al promedio' 
from Empleados4 where activo = 'si' and salario > (select avg(salario) from empleados4);

-- 11. Muestra nombre, puesto y salario de los empleados que son
--     'Desarrollador' O 'Calidad', Y que ademas son activos 'SI'.
select nombre, puesto, salario from empleados4 where puesto = 'desarrollador' or puesto = 'Calidad' and activo = 'Si'

-- 12. Muestra los empleados donde el puesto NO es 'Tecnico'
--     Y el salario NO es nulo.
--     Observa si Sofia aparece (puesto NULL) — anota lo que ves.
select * from empleados4 where not puesto = 'Tecnico' and salario is not null

-- 13. Muestra los clientes de Clientes2 que tienen ciudad registrada
--     Y correo registrado al mismo tiempo.
select * from Clientes2;
select * from Clientes2 where not ciudad is null and correo is not null; 

-- 14. Sobre Plantas: muestra las plantas cuya division NO es NULL
--     Y cuyo id_planta es mayor a 2.
select * from plantas where division is not null and id_planta > 2

-- 15. Verificacion: muestra todos los empleados ordenados por id_empleado ASC
--     y confirma que siguen siendo 12 filas intactas del script maestro.

select * from empleados4 order by id_empleado ASC