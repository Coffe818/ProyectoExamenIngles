DROP PROCEDURE IF EXISTS spExamenInblesInsertExamen

CREATE PROCEDURE spExamenInblesInsertExamen(IN _id_usuario INT, IN _tipo_examen VARCHAR(500), IN _calificacion FLOAT, IN _nivel_ingles VARCHAR(500), OUT id_examen INT)
BEGIN
    insert into examen_ingles_examen(id_usuario, fecha, tipo_examen, calificacion, nivel_ingles) values (_id_usuario, now(), _tipo_examen,_calificacion, _nivel_ingles);
    SET id_examen = LAST_INSERT_ID();

    CALL spExamenInglesUpdateUsuarioNivelIngles(_id_usuario, _nivel_ingles);
END;

DROP PROCEDURE IF EXISTS spExamenInblesGetExamenByUsuario;

CREATE PROCEDURE spExamenInblesGetExamenByUsuario(IN _id_usuario INT, out _calificacion_tipo1 FLOAT, out _calificacion_tipo2 FLOAT, OUT _cantidad_examenes_tipo1 INT, OUT _cantidad_examenes_tipo2 INT)
BEGIN
    select * from examen_ingles_examen where id_usuario = _id_usuario;

    SELECT
        COALESCE(SUM(CASE WHEN tipo_examen = 1 THEN calificacion END), 0),
        COALESCE(SUM(CASE WHEN tipo_examen = 2 THEN calificacion END), 0),
        COALESCE(COUNT(CASE WHEN tipo_examen = 1 THEN 1 END),0),
        COALESCE(COUNT(CASE WHEN tipo_examen = 2 THEN 1 END),0)
    INTO
        _calificacion_tipo1,
        _calificacion_tipo2,
        _cantidad_examenes_tipo1,
        _cantidad_examenes_tipo2
    FROM examen_ingles_examen
    WHERE id_usuario = _id_usuario;

END;

DROP PROCEDURE IF EXISTS spExamenInglescantidadExamenesPorUsuario;

CREATE PROCEDURE spExamenInglescantidadExamenesPorUsuario(IN _id_usuario INT, OUT _prueba INT, OUT _final INT)
BEGIN
    select COUNT(CASE WHEN tipo_examen = 1 THEN 1 END) INTO _prueba from examen_ingles_examen where id_usuario = _id_usuario;
    select COUNT(CASE WHEN tipo_examen = 2 THEN 1 END) INTO _final from examen_ingles_examen where id_usuario = _id_usuario;
END;

call spExamenInglescantidadExamenesPorUsuario(15, @prueba, @final);
SELECT @prueba, @final;