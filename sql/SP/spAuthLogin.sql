USE simulacion;
SELECT nombre from examen_ingles_usuario where email = "nombre1@gmail.com" and contrasena = "contrasenia1";

CALL spValidarUsuario("nombre1@gmail.com" , "contrasenia1", @nombre);
SELECT @nombre;

SHOW CREATE PROCEDURE spValidarUsuario;
