DROP PROCEDURE IF EXISTS spExamenInglesInsertRespuestaUsuario;

CREATE PROCEDURE spExamenInglesInsertRespuestaUsuario(IN _id_examen INT, IN _id_pregunta INT, IN _id_respuesta_pregunta INT)
BEGIN
    insert into examen_ingles_respuesta_usuario(id_examen, id_pregunta, id_respuesta_pregunta) values (_id_examen, _id_pregunta, _id_respuesta_pregunta);
END;