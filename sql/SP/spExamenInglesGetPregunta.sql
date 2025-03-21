DROP PROCEDURE IF EXISTS spExamenInglesGetPregunta;

CREATE PROCEDURE spExamenInglesGetPregunta(IN _idPregunta INT)
BEGIN
    SELECT p.id_pregunta, p.texto_pregunta, p.nivel_ingles, rp.id_respuesta_pregunta 
    FROM examen_ingles_pregunta p 
    JOIN examen_ingles_respuesta_pregunta rp ON p.id_pregunta = rp.id_pregunta 
    WHERE p.id_pregunta = _idPregunta and rp.es_correcta = 1;
END;

