/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author josem
 */


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




class Configuracion {
    int cantidad;
    int rangoInicio;
    int rangoFin;

    public Configuracion(int cantidad, int rangoInicio, int rangoFin) {
        this.cantidad = cantidad;
        this.rangoInicio = rangoInicio;
        this.rangoFin = rangoFin;
    }
}

class Pregunta {
    int id;
    String texto;
    String nivel;
    int idRespuestaCorrecta;

    public Pregunta(int id, String texto, String nivel, int idRespuestaCorrecta) {
        this.id = id;
        this.texto = texto;
        this.nivel = nivel;
        this.idRespuestaCorrecta = idRespuestaCorrecta;
    }

    @Override
    public String toString() {
        return "Pregunta [" + id + "] (" + nivel + "): " + texto;
    }
}

class Respuesta {
    String texto;
    int id;

    public Respuesta(String texto, int id) {
        this.texto = texto;
        this.id = id;
    }

    @Override
    public String toString() {
        return "- " + texto;
    }
}

public class Examen_Controller {
    List<Configuracion> ExamenPrueba = Arrays.asList(
            new Configuracion(2, 1, 10),
            new Configuracion(3, 11, 25),
            new Configuracion(3, 26, 40),
            new Configuracion(4, 41, 60),
            new Configuracion(4, 61, 70),
            new Configuracion(4, 71, 75));

    List<Configuracion> Examenfinal = Arrays.asList(
            new Configuracion(4, 1, 10),
            new Configuracion(6, 11, 25),
            new Configuracion(6, 26, 40),
            new Configuracion(10, 41, 60),
            new Configuracion(9, 61, 70),
            new Configuracion(5, 71, 75));

    public Map<String, Object> obtenerPreguntasYRespuestas(int tipoExamen) {
        List<Configuracion> Examen = tipoExamen == 1 ? this.ExamenPrueba : this.Examenfinal;
        List<Pregunta> listaPreguntas = new ArrayList<>();
        Map<Integer, List<Respuesta>> mapaRespuestas = new HashMap<>();
        // List<Integer> listaIdsPreguntas = new ArrayList<>();
        Conexion conexion = new Conexion();

        try {
            for (Configuracion config : Examen) {
                List<Integer> posiblesPreguntas = new ArrayList<>();
                for (int i = config.rangoInicio; i <= config.rangoFin; i++) {
                    posiblesPreguntas.add(i);
                }
                Collections.shuffle(posiblesPreguntas);
                // System.out.println(posiblesPreguntas);

                for (int i = 0; i < config.cantidad; i++) {
                    int idPregunta = posiblesPreguntas.get(i);
                    // listaIdsPreguntas.add(idPregunta);
                    // Obtener pregunta
                    conexion.prepareCall("spExamenInglesGetPregunta", 1);
                    conexion.addInParameter("_idPregunta", idPregunta);
                    ResultSet rsPregunta = conexion.executeResultSet();

                    Pregunta pregunta = null;
                    if (rsPregunta != null && rsPregunta.next()) {
                        pregunta = new Pregunta(
                                rsPregunta.getInt("id_pregunta"),
                                rsPregunta.getString("texto_pregunta"),
                                rsPregunta.getString("nivel_ingles"),
                                rsPregunta.getInt("id_respuesta_pregunta"));
                        listaPreguntas.add(pregunta);
                    }

                    if (pregunta != null) {
                        conexion.prepareCall("spExamenInglesGetRespuesta", 1);
                        conexion.addInParameter("_idPregunta", idPregunta);
                        ResultSet rsRespuesta = conexion.executeResultSet();

                        List<Respuesta> respuestas = new ArrayList<>();
                        while (rsRespuesta != null && rsRespuesta.next()) {
                            respuestas.add(new Respuesta(
                                    rsRespuesta.getString("texto_respuesta"),
                                    rsRespuesta.getInt("id_respuesta_pregunta")));
                        }
                        mapaRespuestas.put(idPregunta, respuestas);
                    }
                }
            }

        } catch (Exception e) {
            System.err.println("Error al obtener preguntas y respuestas: " + e.getMessage());
        } finally {
            conexion.closeConnection();
        }
        // System.out.println("Lista de IDs de preguntas: " + listaIdsPreguntas +
        // listaIdsPreguntas.size());
        Map<String, Object> resultado = new HashMap<>();
        resultado.put("preguntas", listaPreguntas);
        resultado.put("respuestas", mapaRespuestas);
        return resultado;
    }

    // Prueba
    @SuppressWarnings("unchecked")
    public static void main(String[] args) {
        Examen_Controller controller = new Examen_Controller();
        // Obtener datos (simulamos tipo examen 2 y nombre)
        int tipoExamen = 1;
        String nombre = "José M."; // Puedes obtener esto de otro lado
        Map<String, Object> datosExamen = controller.obtenerPreguntasYRespuestas(tipoExamen);

        List<Pregunta> preguntas = (List<Pregunta>) datosExamen.get("preguntas");
        Map<Integer, List<Respuesta>> respuestas = (Map<Integer, List<Respuesta>>) datosExamen.get("respuestas");

        // --- Depuración: Imprimir lo que se obtuvo ---
        System.out.println("Preguntas obtenidas: " + preguntas.size());

      
        int i = 0;
        for (Pregunta p : preguntas) {
            i++;
            System.out.println(i + " - " + p );
            List<Respuesta> rList = respuestas.get(p.id);
            if (rList != null) {
                for (Respuesta r : rList) {
                    System.out.println("   - " + r );
                }
            } else {
                 System.out.println("   !!! No hay respuestas para esta pregunta en el mapa !!!");
            }
            System.out.println();
        };
        
        
        // --- Fin Depuración ---
        Examen_Form examen = new Examen_Form(preguntas, respuestas,nombre);
        examen.setVisible(true);

    }
}