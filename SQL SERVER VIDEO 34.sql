/*
====================================================
VIDEO 34: MAX y MIN — version combinada
====================================================
*/

-- 1. Muestra el salario maximo y el minimo de Empleados4, con alias Maximo y Minimo.

SELECT max(salario) as salario_maximo, min(salario) as salario_minimo from empleados4;

-- 2. Muestra nombre, salario del empleado con el salario MAXIMO,
--    usando WHERE salario = (SELECT MAX(salario) FROM Empleados4).
select nombre, salario from empleados4 where salario = (select max(salario) as salario_maximo from empleados4)

-- 3. Muestra nombre, apellido, edad del empleado con la edad MINIMA
--    (mismo patron del 2, pero con MIN(edad)). Andres tiene edad NULL (video 18):
--    confirma que MIN lo ignora.
select nombre, apellido, edad from Empleados4 where edad = (select min(edad) from empleados4)

-- 4. Para cada id_planta, muestra MAX(salario) y COUNT(*) en la misma consulta
--    (videos 35 + 43).
SELECT id_planta, MAX(salario) AS salario_maximo, COUNT(*) AS total_empleados
FROM Empleados4
GROUP BY id_planta;

-- 5. Muestra bateria_pct maximo y minimo de tus AMRs. Luego, con TOP 1 (video 17)
--    y ORDER BY (video 33), obten el AMR con menor bateria. Compara el numero
--    contra tu MIN(bateria_pct). -- no se de que tabla hables yo no tengo esa tabla 


-- 6. Muestra MAX(fecha_ingreso) y MIN(fecha_ingreso) (videos 19/55).
--    Sofia y Elena tienen fecha_ingreso NULL: confirma que no afectan el resultado.

select * from Empleados4 -- Muestra MAX(fecha_ingreso) y MIN(fecha_ingreso) (videos 19/55). no tengo tablas con fecha de ingrerso

-- 7. Construye con CAST (video 29):
--    'El salario maximo es ' + CAST(MAX(salario) AS VARCHAR)

select nombre + ' - ' + CAST(MAX(salario) AS VARCHAR) as 'El nombre y salario maximo es' from empleados4 
group by nombre

-- 8. Muestra MAX(salario) - MIN(salario) AS Rango_Salarial (video 30).

select MAX(salario) - MIN(salario) AS Rango_Salarial from Empleados4

-- 9. Muestra el salario maximo SOLO de los empleados con id_planta IN (1,3) (video 15).

select nombre, max(salario) as salario_maximo, id_planta from empleados4 where id_planta in (1,3)
group by nombre, id_planta

-- 10. Crea la vista v_extremos_salario (video 26) que muestre
--     MAX(salario) AS Maximo, MIN(salario) AS Minimo de Empleados4.
--     Luego consultala con SELECT * FROM v_extremos_salario.

create view v_extremos_salario
as 
select MAX(salario) AS Maximo, MIN(salario) AS Minimo_de_Empleados4 from empleados4;

select * from v_extremos_salario


-- 11. Sobre Plantas (video 1/4): muestra MAX(id_planta) y MIN(id_planta).
--     ¿Incluye a la planta 5 (Sonora) aunque no tenga empleados? Razonalo
--     con FK (video 25): Plantas y Empleados4 son tablas distintas.
select * from plantas 
select MAX(id_planta), MIN(id_planta) from plantas;

-- 12. Sobre Empleados4: muestra MAX(id_empleado) y, en columna aparte,
--     IDENT_CURRENT('Nomina.Bonos') (video 24). Compara ambos numeros.
select * from Nomina.Bonos
select MAX(id_empleado) as 'Numero maximo de empleados', IDENT_CURRENT('Nomina.Bonos') as 'Ultimo id que tiene'  from empleados4

-- 13. Crea el indice IX_salario (video 27) sobre Empleados4(salario),
--     y vuelve a correr el ejercicio 1 (MAX/MIN de salario).
--     El resultado debe ser identico; el indice no cambia el VALOR.
create nonclustered index IX_salario 
on Empleados4 (salario)

-- 14. Combina DISTINCT (video 28) con MAX: para cada puesto distinto,
--     muestra el salario maximo de ese puesto.

select distinct puesto, max(salario) as salario_distinto from empleados4 
group by puesto

-- 15. Verificacion final (video 32): confirma con SELECT * FROM Empleados4
--     que los 12 salarios siguen siendo los del script maestro original.

SELECT * FROM Empleados4