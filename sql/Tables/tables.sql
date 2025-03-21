-- DROP TABLES en orden correcto
DROP TABLE IF EXISTS examen_ingles_respuesta_usuario;

DROP TABLE IF EXISTS examen_ingles_respuesta_pregunta;

DROP TABLE IF EXISTS examen_ingles_pregunta;

DROP TABLE IF EXISTS examen_ingles_examen;

DROP TABLE IF EXISTS examen_ingles_usuario;


-- CREACION DE TABLAS

CREATE TABLE IF NOT EXISTS examen_ingles_usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(500) NOT NULL,
    email VARCHAR(500) NOT NULL,
    contrasena VARCHAR(500) NOT NULL,
    nivel_ingles VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS examen_ingles_examen (
    id_examen INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha DATETIME NOT NULL,
    tipo_examen VARCHAR(500) NOT NULL,
    calificacion FLOAT NOT NULL,
    nivel_ingles VARCHAR(500) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES examen_ingles_usuario (id_usuario)
);

CREATE TABLE IF NOT EXISTS examen_ingles_pregunta (
    id_pregunta INT NOT NULL PRIMARY KEY,
    texto_pregunta VARCHAR(500) NOT NULL,
    nivel_ingles VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS examen_ingles_respuesta_pregunta (
    id_respuesta_pregunta INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
    id_pregunta INT NOT NULL,
    texto_respuesta VARCHAR(500) NOT NULL,
    es_correcta TINYINT(1) NOT NULL,
    FOREIGN KEY (id_pregunta) REFERENCES examen_ingles_pregunta (id_pregunta)
);


CREATE TABLE IF NOT EXISTS examen_ingles_respuesta_usuario (
    id_respuesta_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_examen INT NOT NULL,
    id_pregunta INT NOT NULL,
    id_respuesta_pregunta INT NOT NULL,
    FOREIGN KEY (id_examen) REFERENCES examen_ingles_examen (id_examen),
    FOREIGN KEY (id_pregunta) REFERENCES examen_ingles_pregunta (id_pregunta),
    FOREIGN KEY (id_respuesta_pregunta) REFERENCES examen_ingles_respuesta_pregunta (id_respuesta_pregunta)
);