DROP PROCEDURE IF EXISTS spExamenInglesInsertUsuario;

CREATE PROCEDURE spExamenInglesInsertUsuario(IN _nombre VARCHAR(500), IN _email VARCHAR(500), IN _contrasena VARCHAR(500), OUT id_usuario INT)
BEGIN
    insert into examen_ingles_usuario (nombre, email, contrasena) values (_nombre, _email, _contrasena);
    SET id_usuario = LAST_INSERT_ID();
END;

DROP PROCEDURE IF EXISTS spExamenInglesGetUsuario;

CREATE PROCEDURE spExamenInglesGetUsuario(IN _is_usuario INT)
BEGIN
    select * from examen_ingles_usuario where id_usuario = _is_usuario;
END;

DROP PROCEDURE IF EXISTS spExamenInglesUpdateUsuarioNivelIngles;

CREATE PROCEDURE spExamenInglesUpdateUsuarioNivelIngles(IN _id_usuario INT, IN _nivel_ingles VARCHAR(500))
BEGIN
    update examen_ingles_usuario set nivel_ingles = _nivel_ingles where id_usuario = _id_usuario;
END;