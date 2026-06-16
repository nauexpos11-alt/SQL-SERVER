/*
====================================================
VIDEO 38: LIKE / NOT LIKE — comodines % y _
====================================================
*/

-- 1. (SELECT y WHERE, LIKE)
--    Muestra los empleados cuyo nombre empiece con 'A'.
SELECT * from empleados4 where nombre like 'A%'

-- 2. (SELECT y WHERE, NOT LIKE, ORDER BY)
--    Muestra los empleados cuyo apellido NO termine en 'ez',
--    ordenados alfabeticamente por apellido.
select * from empleados4 where apellido not like '%ez'

-- 3. (SELECT y WHERE, LIKE, tipos de datos)
--    Muestra los empleados cuyo correo contenga 'cosma'
--    en cualquier parte del texto.
select * from empleados4 where correo like '%cosma%'

-- 4. (SELECT y WHERE, LIKE, comodin de un caracter)
--    Muestra los empleados cuyo nombre tenga exactamente 4 caracteres
--    (usa cuatro guiones bajos: _ _ _ _).
select * from empleados4 where nombre like '____'

-- 5. (IS NULL / IS NOT NULL, LIKE)
--    Muestra los empleados cuyo correo empiece con 'l'
--    y ademas correo NO sea nulo.
--    Son los mismos? Explica si LIKE ya maneja los NULL solo.
select * from empleados4 where correo like 'l%' and correo is not null


-- 6. (operadores logicos, LIKE)
--    Muestra los empleados cuyo nombre empiece con 'A' O con 'L',
--    ordenados por nombre ASC.
select * from empleados4 where nombre like 'A%' or nombre like 'L%' order by nombre asc

-- 7. (LIKE, concatenacion y alias)
--    Muestra nombre completo (nombre + ' ' + apellido) AS Empleado
--    de los empleados cuyo apellido contenga la letra 'a'
--    en cualquier posicion.
select nombre + ' ' + apellido as Empleado from empleados4 where apellido like '%A%'

-- 8. (SUM/AVG/COUNT, LIKE)
--    Cuenta cuantos empleados tienen correo que termine en '.mx'.
select count(*) as 'Numero de correos que terminan en .mx' from empleados4 where correo like '%.mx'

-- 9. (DISTINCT, LIKE, ORDER BY)
--    Muestra los puestos DISTINTOS de los empleados
--    cuyo nombre contenga la letra 'o' en cualquier posicion,
--    ordenados alfabeticamente.
select distinct puesto from empleados4 where puesto like '%o%' order by puesto asc


-- 10. (Clientes2, LIKE, IS NULL / IS NOT NULL)
--     Sobre Clientes2: muestra los clientes cuyo correo
--     contenga '@' Y no sea nulo.
select * from clientes2 where correo like '%@%' and correo is not null 

-- 11. (BETWEEN, LIKE, operadores logicos)
--     Muestra los empleados cuyo nombre empiece con letra
--     BETWEEN 'A' AND 'M' alfabeticamente
--     Y cuyo salario sea mayor a 20000.
select * from empleados4 where nombre between 'A%' and 'M%' and salario > 20000;

-- 12. (vistas, LIKE)
--     Crea la vista v_correos_cosma que muestre nombre, apellido
--     y correo de los empleados cuyo correo contenga 'cosma'.
--     Luego consultala.
create view v_correos_cosma
as
select nombre, apellido, correo from Empleados4 where correo like '%cosma%';

select * from v_correos_cosma

-- 13. (NOT LIKE, IN, operadores logicos)
--     Muestra los empleados cuyo puesto NO contenga la letra 'o'
--     Y cuyo id_planta este IN (1,2,3).
select * from empleados4 where puesto not like '%o%' and id_planta IN (1,2,3);

-- 14. (TOP, ORDER BY, LIKE)
--     Muestra el TOP 3 de empleados cuyo apellido empiece con
--     cualquier letra seguida de 'a' (patron: _a%).
--     Ordena por apellido ASC.
select top 3 * from empleados4 where apellido like '_a%' order by apellido asc;

-- 15. (SELECT y WHERE, IS NULL / IS NOT NULL, operadores logicos,
--     SUM/AVG/COUNT, ORDER BY, LIKE)
--     Verificacion maestra: muestra nombre, apellido, puesto y salario
--     de TODOS los empleados cuyo apellido contenga 'ez' O 'ia',
--     ordenados por apellido ASC.
--     Cuantas filas regresan? 8

select nombre, apellido, puesto, salario from empleados4 where apellido like '%ez%' or apellido like '%ia%' order by apellido asc 