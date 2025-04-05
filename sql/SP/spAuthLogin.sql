USE simulacion;
SELECT nombre from examen_ingles_usuario where email = "nombre1@gmail.com" and contrasena = "contrasenia1";

CALL spValidarUsuario("nombre1@gmail.com" , "contrasenia1", @nombre);
SELECT @nombre;

SHOW CREATE PROCEDURE spValidarUsuario;

CREATE DEFINER=`root`@`localhost` PROCEDURE `spValidarUsuario`(IN _email VARCHAR(500), IN _contrasena VARCHAR(500), OUT _nombre VARCHAR(500)) BEGIN SELECT nombre INTO _nombre from examen_ingles_usuario where email = _email and contrasena = _contrasena; END
