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
CREATE PROCEDURE spExamenInglescantidadExamenesPorUsuario(IN _id_usuario INT, OUT _prueba INT, OUT _final INT, OUT _ya_aprobo BOOLEAN)
BEGIN
    SELECT COUNT(CASE WHEN tipo_examen = 1 THEN 1 END) INTO _prueba 
    FROM examen_ingles_examen 
    WHERE id_usuario = _id_usuario;

    SELECT COUNT(CASE WHEN tipo_examen = 2 THEN 1 END) INTO _final 
    FROM examen_ingles_examen 
    WHERE id_usuario = _id_usuario;

    SELECT EXISTS(
        SELECT 1 
        FROM examen_ingles_examen 
        WHERE id_usuario = _id_usuario 
          AND tipo_examen = 2 
          AND nivel_ingles = 'Avanzado'
    ) INTO _ya_aprobo;
END;





DROP PROCEDURE IF EXISTS spUltimoExamenIngles;
CREATE PROCEDURE spUltimoExamenIngles(IN _id_usuario INT, IN _tipo_examen INT)
BEGIN
    DECLARE v_id_examen INT;

    SELECT MAX(E2.id_examen) INTO v_id_examen
    FROM examen_ingles_examen E2 
    WHERE E2.id_usuario = _id_usuario AND E2.tipo_examen = _tipo_examen;

    select P.id_pregunta, P.texto_pregunta
    from examen_ingles_respuesta_usuario RU 
    JOIN examen_ingles_pregunta P ON P.id_pregunta = RU.id_pregunta
    where  RU.id_examen = v_id_examen
    order by P.id_pregunta;

    select RP.id_pregunta ,RP.texto_respuesta,
    CASE WHEN RP.es_correcta = 1 THEN TRUE ELSE FALSE END AS correcta,
    RP.id_respuesta_pregunta = RU.id_respuesta_pregunta AS seleccion_usuario,
    CASE WHEN RU.id_respuesta_pregunta =561 THEN TRUE ELSE FALSE END AS no_respondio
    from examen_ingles_respuesta_usuario RU 
    JOIN examen_ingles_respuesta_pregunta RP ON RP.id_pregunta = RU.id_pregunta
    where  RU.id_examen = v_id_examen
    order by RP.id_pregunta, RP.id_respuesta_pregunta;

END 

CALL spUltimoExamenIngles(10,1);