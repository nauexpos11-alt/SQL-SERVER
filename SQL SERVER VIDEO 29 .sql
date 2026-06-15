-- Limpieza (el orden importa: primero la tabla hija)
DROP TABLE IF EXISTS Empleados4;
DROP TABLE IF EXISTS Clientes2;
DROP TABLE IF EXISTS Plantas;

CREATE TABLE Plantas (
    id_planta INT NOT NULL,
    nombre    NVARCHAR(50) NOT NULL,
    ciudad    NVARCHAR(50) NOT NULL,
    division  NVARCHAR(40),                       -- acepta NULL (trampa)
    CONSTRAINT PK_Plantas PRIMARY KEY (id_planta)
);

CREATE TABLE Empleados4 (
    id_empleado INT NOT NULL,
    nombre      NVARCHAR(50) NOT NULL,
    apellido    NVARCHAR(50) NOT NULL,
    edad        INT,                               -- acepta NULL
    puesto      VARCHAR(40),                       -- acepta NULL
    salario     DECIMAL(10,2),                     -- acepta NULL
    correo      VARCHAR(100),                      -- acepta NULL
    id_planta   INT,                               -- acepta NULL
    activo      CHAR(2) NOT NULL,                  -- 'SI' / 'NO'
    CONSTRAINT PK_Empleados4 PRIMARY KEY (id_empleado),
    CONSTRAINT FK_Emp_Planta FOREIGN KEY (id_planta) REFERENCES Plantas(id_planta)
);

CREATE TABLE Clientes2 (
    id_cliente INT NOT NULL,
    nombre     NVARCHAR(50) NOT NULL,
    apellido   NVARCHAR(50) NOT NULL,
    ciudad     NVARCHAR(50),                       -- acepta NULL
    correo     VARCHAR(100),                       -- acepta NULL
    CONSTRAINT PK_Clientes2 PRIMARY KEY (id_cliente)
);

-- ============ SCRIPT MAESTRO — PARTE 2: DATOS TRAMPA ============


INSERT INTO Plantas VALUES (1, 'Cosma Saltillo', 'Saltillo', 'Estampado');
INSERT INTO Plantas VALUES (2, 'Cosma SLP', 'San Luis Potosi', 'Ensamble');
INSERT INTO Plantas VALUES (3, 'Cosma Puebla', 'Puebla', 'Estampado');
INSERT INTO Plantas VALUES (4, 'Cosma Silao', 'Silao', NULL);          -- division NULL
INSERT INTO Plantas VALUES (5, 'Cosma Sonora', 'Hermosillo', 'Chasis');-- SIN empleados

INSERT INTO Empleados4 VALUES (1,'Nau','Coronado',21,'Desarrollador',25000.00,'nau@cosma.mx',1,'SI');
INSERT INTO Empleados4 VALUES (2,'Ana','Valdez',28,'Desarrollador',28000.00,'ana@cosma.mx',1,'SI');
INSERT INTO Empleados4 VALUES (3,'Tono','Ramos',35,'Gerente',45000.00,'tono@cosma.mx',2,'SI');
INSERT INTO Empleados4 VALUES (4,'Maria','Solis',42,'Gerente',50000.00,NULL,3,'SI');
INSERT INTO Empleados4 VALUES (5,'Luis','Perez',25,'Tecnico',15000.00,'luis@cosma.mx',2,'SI');
INSERT INTO Empleados4 VALUES (6,'Carmen','Diaz',31,'Tecnico',NULL,'carmen@cosma.mx',3,'SI');
INSERT INTO Empleados4 VALUES (7,'Pedro','Garcia',50,'Supervisor',35000.00,NULL,4,'NO');
INSERT INTO Empleados4 VALUES (8,'Lucia','Martinez',27,'Desarrollador',28000.00,'lucia@cosma.mx',1,'SI');
INSERT INTO Empleados4 VALUES (9,'Jorge','Lopez',38,'Supervisor',33000.00,'jorge@cosma.mx',4,'SI');
INSERT INTO Empleados4 VALUES (10,'Sofia','Hernandez',29,NULL,20000.00,'sofia@cosma.mx',NULL,'SI');
INSERT INTO Empleados4 VALUES (11,'Andres','Valdez',NULL,'Tecnico',18000.00,'andres@cosma.mx',2,'SI');
INSERT INTO Empleados4 VALUES (12,'Elena','Rios',26,'Calidad',NULL,NULL,3,'NO');

INSERT INTO Clientes2 VALUES (1,'Ana','Valdez','Saltillo','ana@cosma.mx');     -- duplicado p/UNION
INSERT INTO Clientes2 VALUES (2,'Jorge','Lopez','Monterrey','jorge@cosma.mx'); -- duplicado p/UNION
INSERT INTO Clientes2 VALUES (3,'Raul','Mendez','Saltillo',NULL);
INSERT INTO Clientes2 VALUES (4,'Diana','Flores',NULL,'diana@gm.com');
INSERT INTO Clientes2 VALUES (5,'Hugo','Castro','Puebla','hugo@gm.com');
INSERT INTO Clientes2 VALUES (6,'Raul','Mendez','Saltillo',NULL);              -- fila repetida (id 3)

select * from Empleados4;
--1.	Muestra nombre AS empleado y salario AS sueldo_mensual.
select nombre as Empleado, salario as Sueldo_Mensual from Empleados4;
-- 2.	Muestra apellido con el alias [Apellido del trabajador] (con espacios).
 select apellido as 'Apellido del trabajador' from Empleados4
 --3.	Muestra DISTINCT puesto AS puestos_existentes (videos 28 + 29).
 select distinct puesto as puestos_existentes from Empleados4;
 --4.	Muestra de Plantas: nombre AS planta y ciudad AS ubicacion.
 select * from plantas;
 select nombre as Planta, ciudad as ubicacion from plantas;
 -- 5.	Verifica con SELECT * FROM Empleados4 que la columna REAL sigue llamándose salario:
 -- el alias vive solo en el resultado (a diferencia del sp_rename del video 14).
 SELECT * FROM Empleados4
 -- Concatenación y sus trampas (videos 29, 18, 5)
-- 6.	Construye nombre_completo: nombre + ' ' + apellido.
select nombre + ' ' + apellido as 'nombre y apellido' from Empleados4;
-- 7.	Construye una ficha: nombre + ' - ' + puesto AS ficha. Trampa: ¿qué salió en la fila de Sofia (puesto NULL)?
-- Anota: NULL contamina toda la concatenación (video 18).
select nombre + ' - ' + puesto as ficha from empleados4;
--  8.	PROVOCA EL ERROR: Concatena texto con número directo: 
select nombre + ' gana ' + salario from empleados4; --. Anota el Msg de conversión (la vieja guerra de tipos, video 5).
-- Esto sertia algo mas correcto
select nombre as 'Se llama', salario as 'Y gana' from empleados4
-- 9.	Corrígelo con CAST(salario AS VARCHAR) y observa la fila de Carmen (salario NULL): ¿el CAST salvó alNULL? No — anótalo.
--10.	Construye para Clientes2: nombre + ' ' + apellido + ' (' + ciudad + ')' AS etiqueta. ¿Qué pasó con Diana (ciudadNULL)?
select * from Clientes2;
select nombre + ' ' + apellido + ' ('+ ciudad +')' AS etiqueta from Clientes2;
--11.	Crea la vista v_directorio (video 26): nombre_completo concatenado y correo, solo de quienes tienen correo (ISNOT NULL).
create view v_directorio
as
select nombre + ' ' + apellido as nombre_completo, correo from Empleados4 where correo is not null

select * from v_directorio

-- 12.	TOP 5 (video 17) del directorio con alias [Empleado] para el nombre completo.
select top 5 nombre_completo as Empleado from v_directorio
--13.	PROVOCA EL ERROR: Usa un alias con espacios SIN corchetes: AS Nombre del empleado. Anota el Msg de sintaxis.
SELECT nombre AS Nombre del empleado FROM Empleados4;

Mens. 102, Nivel 15, Estado 1, Línea 103
Incorrect syntax near 'del'.

Hora de finalización: 2026-06-14T16:27:50.2058846-06:00
--  14.	PROVOCA EL ERROR: Olvida las comillas del separador: nombre + - + apellido. Anota el Msg.
--15.Cierra: 2 líneas sobre dónde usarás alias en Magna (reportes con nombres de negocio: [Salario Mensual],[Planta]) sin tocar las tablas reales.}








