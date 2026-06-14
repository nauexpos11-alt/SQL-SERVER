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