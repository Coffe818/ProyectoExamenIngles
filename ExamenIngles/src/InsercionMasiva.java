import java.util.HashMap;
import java.util.List;
import java.util.Map;

// import javax.swing.JOptionPane;

import ConnectionPkg.Conexion;
import Controller.Examen_Controller;
import Controller.Register_Controller;
import util.PreguntaModel;
import util.RespuestaModel;

public class InsercionMasiva {
    private static Register_Controller register = new Register_Controller();
    private static Examen_Controller examen = new Examen_Controller();
    public static void main(String[] args) {
        int maxCantidadExamenesPractica = 5; // maxiama cantida de examenes practica que se pueden presentar por usuario
        int maxCantidadExamenesFinal = 2; // maxiama cantida de examenes filaes que se pueden presentar por usuario
        Conexion con = new Conexion();
        con.resetAll();
        
        int i = 0;
        while (i<20) {
            
            String email = "correo" + i + "@gmail.com";
            String password = "password " + i;
            String name = "name " + i;

            register.insertUser(email, password, name);
            System.out.println("Usuario insertado: " + email + " , " + password + " , " + name);

            String a =register.authenticateUser(email, password);

            if (a == null) {
                System.out.println("Error al autenticar el usuario: " + email);
                break;
            } else {
                System.out.println("Usuario autenticado: " + a);
            }

            int cantidadExamenesPractica = (int) (Math.random() * maxCantidadExamenesPractica) + 1;
            // JOptionPane.showMessageDialog(null, "Cantidad de examenes de practica: " + cantidadExamenesPractica);
            for (int j = 0; j < cantidadExamenesPractica; j++) {
                simularExamen(1);
                // JOptionPane.showMessageDialog(null, "Examen de practica" + (j + 1) + " realizado del usuario: " + name);
            }

            int cantidadExamenesFinal = (int) (Math.random() * maxCantidadExamenesFinal) + 1;
            // JOptionPane.showMessageDialog(null, "Cantidad de examenes finales: " + cantidadExamenesFinal);

            for (int j = 0; j < cantidadExamenesFinal; j++) {
                simularExamen(2);
                // JOptionPane.showMessageDialog(null, "Examen de final" + (j + 1) + " realizado del usuario: " + name);
            }

            // JOptionPane.showMessageDialog(null, "se termino la insercion del usuario: " + name);

            i++;
        }

    }

    private static void simularExamen(int tipoExamen){

        String nombre = null;
                int preguntaActualIndex;
                Map<Integer, Integer> respuestasUsuario = new HashMap<>();

                //se genera el examen
                Map<String, Object> datosExamen = examen.obtenerPreguntasYRespuestas(tipoExamen);
                @SuppressWarnings("unchecked")
                List<PreguntaModel>listapreguntas = (List<PreguntaModel>) datosExamen.get("preguntas");
                
                @SuppressWarnings("unchecked")
                Map<Integer, List<RespuestaModel>> maparespuestas = (Map<Integer, List<RespuestaModel>>) datosExamen.get("respuestas");

                System.out.println("Preguntas obtenidas: " + listapreguntas.size());
                System.out.println(listapreguntas);
                System.out.println(maparespuestas);

                for(PreguntaModel pregunta : listapreguntas) {
                    System.out.println("\nPregunta: " + pregunta.texto);
                    List<RespuestaModel> respuestas = maparespuestas.get(pregunta.id);
                    System.out.println("Respuestas" + respuestas);

                    int respuestasRamdon = (int) (Math.random() * 4);
                    System.out.println("Respuesta seleccionada: " + respuestas.get(respuestasRamdon).texto);
                    respuestasUsuario.put(pregunta.id, respuestas.get(respuestasRamdon).id);
        
                }
                examen.guardarExamen(tipoExamen, respuestasUsuario, listapreguntas);

    }
}
