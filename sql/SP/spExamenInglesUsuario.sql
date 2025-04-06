DROP PROCEDURE IF EXISTS spExamenInglesInsertUsuario;

CREATE PROCEDURE spExamenInglesInsertUsuario(IN _nombre VARCHAR(500), IN _email VARCHAR(500), IN _contrasena VARCHAR(500), OUT id_usuario INT)
BEGIN
    insert into examen_ingles_usuario (nombre, email, contrasena) values (_nombre, _email, _contrasena);
    SET id_usuario = LAST_INSERT_ID();
END;

DROP PROCEDURE IF EXISTS spExamenInglesGetUsuario;

CREATE PROCEDURE spExamenInglesGetUsuario(IN _id_usuario INT)
BEGIN
    select * from examen_ingles_usuario where id_usuario = _id_usuario;
END;

DROP PROCEDURE IF EXISTS spExamenInglesUpdateUsuarioNivelIngles;

CREATE PROCEDURE spExamenInglesUpdateUsuarioNivelIngles(IN _id_usuario INT, IN _nivel_ingles VARCHAR(500))
BEGIN
    update examen_ingles_usuario set nivel_ingles = _nivel_ingles where id_usuario = _id_usuario;
END;

DROP PROCEDURE IF EXISTS spValidarUsuario;

CREATE PROCEDURE spValidarUsuario(IN _email VARCHAR(500), IN _contrasena VARCHAR(500), OUT _nombre VARCHAR(500))
BEGIN
    SELECT nombre INTO _nombre from examen_ingles_usuario where email = _email and contrasena = _contrasena;
END;


DROP PROCEDURE IF EXISTS spExamenInglesValidarUsuario;

CREATE PROCEDURE `spExamenInglesValidarUsuario`(IN _email VARCHAR(500), IN _contrasena VARCHAR(500), OUT _nombre VARCHAR(500), OUT _id_usuario INT) 
BEGIN SELECT nombre, id_usuario INTO _nombre, _id_usuario  from examen_ingles_usuario where email = _email and contrasena = _contrasena;
END;
