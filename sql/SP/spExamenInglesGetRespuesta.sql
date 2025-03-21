DROP PROCEDURE IF EXISTS spExamenInglesGetRespuesta;

CREATE PROCEDURE spExamenInglesGetRespuesta(IN _idPregunta INT)
BEGIN
    SELECT texto_respuesta, id_respuesta_pregunta from examen_ingles_respuesta_pregunta WHERE id_pregunta = _idPregunta;
END;




