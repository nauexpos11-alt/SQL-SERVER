
-- Crear un esquema nuevo (espacio de nombres):
CREATE SCHEMA Nomina;
-- Crear una tabla DENTRO de ese esquema:
CREATE TABLE Nomina.Bonos (
    id_bono     INT IDENTITY(1,1) NOT NULL,
    id_empleado INT NOT NULL,
    monto       DECIMAL(10,2),
    CONSTRAINT PK_Bonos PRIMARY KEY (id_bono)
);

-- Consultarla: SIEMPRE con su esquema.tabla
SELECT * FROM Nomina.Bonos;

-- Recordatorio: todo lo de antes vive en dbo (el default)
SELECT * FROM dbo.Empleados4;   -- exactamente lo mismo que SELECT * FROM Empleados4

-- Inserta 3 bonos para los empleados 1, 2 y 9, con montos distintos YA LO HICE PERO LO BORE

SELECT * FROM Nomina.Bonos

--Crea un segundo esquema Auditoria, y dentro una tabla Cambios con: id INT IDENTITY(1,1) PRIMARY KEY, descripcion NVARCHAR(100), fecha DATETIME. Insértale 1 fila de prueba TAMBIEN YA LO HICE

-- 6. Ejecuta SELECT * FROM dbo.Empleados4; — debe regresar exactamente lo mismo que SELECT * FROM Empleados4;. Confírmalo comparando ambos resultados.

SELECT * FROM dbo.Empleados4
SELECT * FROM Empleados4

-- 7. Haz lo mismo con dbo.Plantas vs Plantas
SELECT * FROM dbo.Plantas
SELECT * FROM Plantas

-- 8. En Object Explorer (video 3), expande Tables de ExamenSQL: ¿cómo aparecen listadas tus tablas viejas (Empleados4, Plantas...) vs las nuevas (Nomina.Bonos,
-- solo cambian su esquema de lado izquierdo y estan ordenadas por abecedario

-- 9. JOIN entre esquemas (video 39, adelantado): une Nomina.Bonos con dbo.Empleados4 por id_empleado, mostrando nombre, apellido y monto del bono.

-- 10. Explica en 2 líneas: si dos tablas se llamaran igual (Reporte), una en dbo y otra en Nomina, ¿cómo evitarías la ambigüedad al consultarlas?

-- no te adelantes a cosas que no hemos visto, no quiero teoria quiero pura practica