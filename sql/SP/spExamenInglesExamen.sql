DROP PROCEDURE IF EXISTS spExamenInblesInsertExamen

CREATE PROCEDURE spExamenInblesInsertExamen(IN _id_usuario INT, IN _tipo_examen VARCHAR(500), IN _calificacion FLOAT, IN _nivel_ingles VARCHAR(500), OUT id_examen INT)
BEGIN
    insert into examen_ingles_examen(id_usuario, fecha, tipo_examen, calificacion, nivel_ingles) values (_id_usuario, now(), _tipo_examen,_calificacion, _nivel_ingles);
    SELECT LAST_INSERT_ID() as id_examen;

    CALL spExamenInglesUpdateUsuarioNivelIngles(_id_usuario, _nivel_ingles);
END;

DROP PROCEDURE IF EXISTS spExamenInblesGetExamenByUsuario;

CREATE PROCEDURE spExamenInblesGetExamen(IN _id_usuario INT)
BEGIN
    select * from examen_ingles_examen where id_usuario = _id_usuario;
END;
