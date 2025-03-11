DROP DATABASE IF EXISTS dbtaller;
CREATE DATABASE dbtaller;
USE dbtaller;

CREATE TABLE lineainv(
    clavein CHAR(10) PRIMARY KEY, 
    nombre VARCHAR(250)
);

CREATE TABLE profesor(
    idprofesor INT AUTO_INCREMENT PRIMARY KEY, 
    nombreProf VARCHAR(200)
);

CREATE TABLE tipoproyecto(
    tipo CHAR(10) PRIMARY KEY, 
    nombre VARCHAR(150)
);

CREATE TABLE proyecto(
    clave CHAR(10) PRIMARY KEY, 
    nombre VARCHAR(250), 
    clavein CHAR(10), 
    tipo CHAR(10),
    CONSTRAINT corresponde FOREIGN KEY (clavein) REFERENCES lineainv(clavein),
    CONSTRAINT asignado FOREIGN KEY (tipo) REFERENCES tipoproyecto(tipo)
);

CREATE TABLE alumno(
    nocontrol CHAR(10) PRIMARY KEY, 
    nombre VARCHAR(150), 
    clave CHAR(10),
    CONSTRAINT elige FOREIGN KEY (clave) REFERENCES proyecto(clave)
);

CREATE TABLE profesorproy(
    idprofesor INT, 
    clave CHAR(10), 
    calificacion FLOAT, 
    rol VARCHAR(45),
    CONSTRAINT asesora FOREIGN KEY (idprofesor) REFERENCES profesor(idprofesor),
    CONSTRAINT asigna FOREIGN KEY (clave) REFERENCES proyecto(clave)
);

CREATE TABLE datos(
    clave CHAR(8), 
    proyecto VARCHAR(150), 
    linea CHAR(10), 
    tipo CHAR(5), 
    nocontrol CHAR(10), 
    nombre_alumno VARCHAR(150), 
    idprofesor INT, 
    revisor1 VARCHAR(150), 
    revisor2 VARCHAR(150),
    CONSTRAINT fk_proyecto FOREIGN KEY (proyecto) REFERENCES proyecto(clave),
    CONSTRAINT fk_alumno FOREIGN KEY (nocontrol) REFERENCES alumno(nocontrol),
    CONSTRAINT fk_profesor FOREIGN KEY (idprofesor) REFERENCES profesor(idprofesor),
    CONSTRAINT fk_linea FOREIGN KEY (linea) REFERENCES lineainv(clavein)
);

CREATE TABLE AreaConocimiento (
    id_area INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL
);

INSERT INTO AreaConocimiento (nombre) VALUES
('Redes de Computadoras'),
('Tesis en Ingeniería en Sistemas Computacionales'),
('Arquitectura de Computadoras'),
('Bases de Datos'),
('Ingeniería de Software');

CREATE TABLE Rubrica (
    id_rubrica INT PRIMARY KEY AUTO_INCREMENT,
    id_area INT,
    nombre VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_area) REFERENCES AreaConocimiento(id_area)
);

INSERT INTO Rubrica (id_area, nombre) VALUES
(1, 'Rúbrica de Evaluación de Proyectos de Redes de Computadoras'),
(2, 'Rúbrica de Evaluación de Proyectos de Tesis en Ingeniería en Sistemas Computacionales'),
(3, 'Rúbrica de Evaluación de Proyectos de Arquitectura de Computadoras'),
(4, 'Rúbrica de Evaluación de Proyectos de Bases de Datos'),
(5, 'Rúbrica de Evaluación de Proyectos de Ingeniería de Software');

CREATE TABLE CriterioRubrica (
    id_criterio INT PRIMARY KEY AUTO_INCREMENT,
    id_rubrica INT,
    descripcion TEXT NOT NULL,
    ponderacion DECIMAL(5,2),
    FOREIGN KEY (id_rubrica) REFERENCES Rubrica(id_rubrica)
);

-- Redes de Computadoras
INSERT INTO CriterioRubrica (id_rubrica, descripcion, ponderacion) VALUES
(1, 'Presentación de protocolos y observaciones resueltas', 0),
(1, 'Desarrollo del proyecto: Factibilidad técnica, elección de hardware y software', 20),
(1, 'Diagrama de flujo de datos, diagrama lógico, tabla de transición', 15),
(1, 'Simulación de funcionamiento del proyecto', 20),
(1, 'Evidencia física del uso de componentes electrónicos', 15),
(1, 'Conclusiones', 4),
(1, 'Cronograma de residencia profesional', 4),
(1, 'Referencias Bibliográficas', 5),
(1, 'Calidad y ortografía', 7),
(1, 'Anexos', 10);

-- Tesis en Ingeniería en Sistemas Computacionales
INSERT INTO CriterioRubrica (id_rubrica, descripcion, ponderacion) VALUES
(2, 'Protocolo corregido', 10),
(2, 'Desarrollo del proyecto: Fundamentación del modelo, diccionario de datos', 60),
(2, 'Fundamentación del gestor de base de datos', 10),
(2, 'Diseño de la base de datos en herramienta CASE', 20),
(2, 'Definición de los usuarios y privilegios', 10),
(2, 'Definición de procedimientos almacenados', 10),
(2, 'Conclusiones', 5),
(2, 'Cronograma de R.P.', 5),
(2, 'Referencias', 5),
(2, 'Calidad, redacción, ortografía', 15);

-- Arquitectura de Computadoras
INSERT INTO CriterioRubrica (id_rubrica, descripcion, ponderacion) VALUES
(3, 'Portada con los datos completos', 0),
(3, 'Protocolo con observaciones resueltas', 0),
(3, 'Desarrollo del proyecto: Elección de hardware y software', 20),
(3, 'Diagramas de flujo, lógicos, y contexto', 15),
(3, 'Simulación de funcionamiento y evidencia física', 20),
(3, 'Conclusiones', 4),
(3, 'Cronograma de residencia profesional', 4),
(3, 'Referencias Bibliográficas', 5),
(3, 'Calidad y ortografía', 7),
(3, 'Anexos completos', 10);

-- Bases de Datos
INSERT INTO CriterioRubrica (id_rubrica, descripcion, ponderacion) VALUES
(4, 'Protocolo corregido', 10),
(4, 'Desarrollo del proyecto: Fundamentación del modelo, diccionario de datos', 60),
(4, 'Fundamentación del gestor de base de datos', 10),
(4, 'Diseño de la base de datos en herramienta CASE', 20),
(4, 'Definición de usuarios y privilegios', 10),
(4, 'Definición de procedimientos almacenados', 10),
(4, 'Conclusiones', 5),
(4, 'Cronograma de R.P.', 5),
(4, 'Referencias', 5),
(4, 'Calidad, redacción, ortografía', 15);

-- Ingeniería de Software
INSERT INTO CriterioRubrica (id_rubrica, descripcion, ponderacion) VALUES
(5, 'Marco teórico conceptual y referencial', 9),
(5, 'Descripción de procesos con diagramas BPMN', 9),
(5, 'Especificación de requisitos funcionales y no funcionales', 28),
(5, 'Diseño preliminar del sistema (arquitectura, diseño detallado, estructuras)', 20),
(5, 'Modelo de proceso de software (nombre y justificación)', 4),
(5, 'Protocolo con observaciones resueltas', 10),
(5, 'Referencias Bibliográficas', 5),
(5, 'Conclusiones', 6),
(5, 'Cronograma para Residencia Profesional', 7);
