/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author josem
 */

package Controller;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import ConnectionPkg.Conexion;
import Vista.Examen_Form;
import util.PreguntaModel;
import util.RespuestaModel;

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
        List<PreguntaModel> listaPreguntas = new ArrayList<>();
        Map<Integer, List<RespuestaModel>> mapaRespuestas = new HashMap<>();
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

                    PreguntaModel pregunta = null;
                    if (rsPregunta != null && rsPregunta.next()) {
                        pregunta = new PreguntaModel(
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

                        List<RespuestaModel> respuestas = new ArrayList<>();
                        while (rsRespuesta != null && rsRespuesta.next()) {
                            respuestas.add(new RespuestaModel(
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
        int tipoExamen = 1;
        String nombre = "José M.";
        Map<String, Object> datosExamen = controller.obtenerPreguntasYRespuestas(tipoExamen);

        List<PreguntaModel> preguntas = (List<PreguntaModel>) datosExamen.get("preguntas");
        Map<Integer, List<RespuestaModel>> respuestas = (Map<Integer, List<RespuestaModel>>) datosExamen
                .get("respuestas");

        System.out.println("Preguntas obtenidas: " + preguntas.size());

        int i = 0;
        for (PreguntaModel p : preguntas) {
            i++;
            System.out.println(i + " - " + p);
            List<RespuestaModel> rList = respuestas.get(p.id);
            if (rList != null) {
                for (RespuestaModel r : rList) {
                    System.out.println("   - " + r);
                }
            } else {
                System.out.println("   !!! No hay respuestas para esta pregunta en el mapa !!!");
            }
            System.out.println();
        }
        ;

        Examen_Form examen = new Examen_Form(preguntas, respuestas, nombre);
        examen.setVisible(true);

    }
}