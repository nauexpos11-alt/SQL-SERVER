
DROP TABLE IF EXISTS Empleados4;
DROP TABLE IF EXISTS Plantas;

CREATE TABLE Plantas(
    id_planta INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    ciudad VARCHAR(40),
    CONSTRAINT PK_plantas PRIMARY KEY (id_planta)
);

CREATE TABLE Empleados4(
    id_empleado INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2),
    edad INT,
    puesto VARCHAR(30),
    activo CHAR(2) DEFAULT 'SI',
    id_planta INT,
    CONSTRAINT PK_empleados4 PRIMARY KEY (id_empleado),
    CONSTRAINT FK_emp_planta FOREIGN KEY (id_planta) REFERENCES Plantas(id_planta),
    CONSTRAINT CK_activo4 CHECK (activo IN ('SI','NO')),
    CONSTRAINT CK_salario4 CHECK (salario >= 0)
);

INSERT INTO Plantas VALUES
(1,'Cosma Magna','Saltillo'),
(2,'BorgWarner','Monterrey'),
(3,'Nemak','Ramos Arizpe'),
(4,'Lear','Saltillo');

INSERT INTO Empleados4 VALUES
('Nau','Coronado',25000,21,'Desarrollador','SI',1),
('Ana','Valdez',28000,28,'Desarrollador','SI',1),
('Toño','Ramos',45000,35,'Gerente','SI',2),
('Maria','Solis',52000,42,'Gerente','SI',3),
('Luis','Perez',15000,25,'Asistente','NO',2),
('Carmen','Diaz',32000,31,'Supervisor','SI',4),
('Pedro','Garcia',18000,50,'Asistente','SI',1),
('Sofia','Rios',21000,29,'Desarrollador','NO',3),
('Jorge','Lopez',41000,38,'Gerente','SI',4),
('Lucia','Mart',22000,27,'Asistente','SI',1);

create view v_empleados_activos 
as 
select id_empleado,nombre, apellido, salario, puesto from empleados4 where activo = 'SI'

select * from v_empleados_activos

drop view v_saltillo

create view v_saltillo
as 
select * from plantas where ciudad = 'Saltilo'

select * from v_saltillo