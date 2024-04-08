-- Crear Base de Datos
-- CREATE DATABASE empresa;

-- USE empresa;

-- Crear Tablas
-- Tabla Departamentos

CREATE TABLE departamentos(
	dpto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_dpto VARCHAR(30)
);

-- Tabla Empleado

CREATE TABLE empleado(
	empleado_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    dpto_id INT,
    FOREIGN KEY (dpto_id) REFERENCES departamentos(dpto_id)
);

-- Tabla de Actividades
CREATE TABLE actividades(
	actividad_id INT AUTO_INCREMENT PRIMARY KEY,
    actividad VARCHAR(100),
    dpto_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (dpto_id) REFERENCES departamentos(dpto_id)
);

-- Insertar datos a la tabla departamentos
INSERT INTO departamentos (nombre_dpto) VALUES
	('Calibraciion'),
    ('Mantenimiento'),
    ('Contabilidad');

-- Insertar datos a la tabla empleado
INSERT INTO empleado (nombre, apellido, dpto_id) VALUES
	('Juan', 'Perez', 1),
	('Maria', 'Gonzalez', 3),
	('Carlos', 'Lopez', 1),
	('Laura', 'Martinez', 3),
	('Pedro', 'Rodriguez', 2),
	('Fernando', 'Ortiz', 2);

-- Insertar datos en la tabla actividades
INSERT INTO actividades (actividad, dpto_id, fecha_inicio, fecha_fin) VALUES
	('Mantenimiento Preventivo', 2, '2024-04-12', '2024-04-15'),
    ('Calibracion Basculas', 1, '2024-04-15', '2024-04-15'),
    ('Presupuesto Materiales', 3, '2024-04-13', '2024-04-16');

UPDATE departamentos SET nombre_dpto = 'Calibracion' WHERE dpto_id = 1;
select * from departamentos;
