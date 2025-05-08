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
import util.IDManager;
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
    List<Configuracion> ExamenPrueba = Arrays.asList( //1
            new Configuracion(2, 1, 10),
            new Configuracion(3, 11, 25),
            new Configuracion(3, 26, 40),
            new Configuracion(4, 41, 60),
            new Configuracion(4, 61, 70),
            new Configuracion(4, 71, 75));

    List<Configuracion> Examenfinal = Arrays.asList(//2
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

    public float guardarExamen(int tipoExamen, Map<Integer, Integer> respuestasUsuario,
            List<PreguntaModel> listapreguntas) {
        Conexion conexion = new Conexion();
        ResultadoExamen resultadoExamen = CalificarExamen(tipoExamen, respuestasUsuario, listapreguntas);
        try {
            conexion.prepareCall("spExamenInblesInsertExamen", 5);
            conexion.addInParameter("_id_usuario", IDManager.getInstance().getIdUsuario());
            conexion.addInParameter("_tipo_examen", tipoExamen);
            conexion.addInParameter("_calificacion", resultadoExamen.getCalificacion());
            conexion.addInParameter("_nivel_ingles", resultadoExamen.getNivel());
            conexion.addOutParameter("id_examen", java.sql.Types.INTEGER);
            conexion.execute();

            Integer id_examen = conexion.getOutParameter("id_examen", Integer.class);
            IDManager.getInstance().setId_examen(id_examen);
            System.out.println("ID del examen guardado: " + id_examen);
            for (Map.Entry<Integer, Integer> respuesta : respuestasUsuario.entrySet()) {
                conexion.prepareCall("spExamenInglesInsertRespuestaUsuario", 3);
                conexion.addInParameter("_id_examen", IDManager.getInstance().getId_examen());
                conexion.addInParameter("_id_pregunta", respuesta.getKey());
                conexion.addInParameter("_id_respuesta_pregunta", respuesta.getValue());
                conexion.execute();
            }
            System.out.println("con una calificacion de  " + resultadoExamen.getCalificacion()
                    + " y un nivel de " + resultadoExamen.getNivel());

        } catch (Exception e) {
            System.err.println("Error al guardar el examen: " + e.getMessage());
        } finally {
            conexion.closeConnection();
        }

        return resultadoExamen.getCalificacion();
    }

    public class ResultadoExamen {
        private float calificacion;
        private String nivel;

        public ResultadoExamen(float calificacion, String nivel) {
            this.calificacion = calificacion;
            this.nivel = nivel;
        }

        public float getCalificacion() {
            return calificacion;
        }

        public String getNivel() {
            return nivel;
        }
    }

    private ResultadoExamen CalificarExamen(int tipoExamen, Map<Integer, Integer> respuestasUsuario,
            List<PreguntaModel> listapreguntas) {
        if (respuestasUsuario == null || listapreguntas == null || respuestasUsuario.isEmpty()
                || listapreguntas.isEmpty()) {
            return new ResultadoExamen(0, "No se ha calificado el examen.");
        }

        int respuestasCorrectas = 0;
        int totalPreguntas = listapreguntas.size();

        for (PreguntaModel pregunta : listapreguntas) {
            Integer respuestaUsuario = respuestasUsuario.get(pregunta.id);
            if (respuestaUsuario != null && respuestaUsuario.equals(pregunta.idRespuestaCorrecta)) {
                respuestasCorrectas++;
            }
        }
        float calificacion = 0;
        if (tipoExamen == 1) {
            calificacion = (float) respuestasCorrectas * 5;
        } else if (tipoExamen == 2) {
            calificacion = (float) respuestasCorrectas * (5f / 2);
        }

        String nivel = determinarNivel(calificacion);
        
        return new ResultadoExamen(calificacion, nivel);
    }

    public Map<String, Object> datosDashBoard(int _id_usuario){
        Map<String, Object> resultados = new HashMap<>();
        Conexion conexion = new Conexion();
        try{
            conexion.prepareCall("spExamenInblesGetExamenByUsuario", 5);
            conexion.addInParameter("_id_usuario", _id_usuario);
            conexion.addOutParameter("_calificacion_tipo1", java.sql.Types.FLOAT);
            conexion.addOutParameter("_calificacion_tipo2", java.sql.Types.FLOAT);
            conexion.addOutParameter("_cantidad_examenes_tipo1", java.sql.Types.INTEGER);
            conexion.addOutParameter("_cantidad_examenes_tipo2", java.sql.Types.INTEGER);
            conexion.execute();




            /// falta que funcionen estos lo de arriba ya esta fubcionando
            Float calificacionTipo1 = conexion.getOutParameter("_calificacion_tipo1", Float.class);
            Float calificacionTipo2 = conexion.getOutParameter("_calificacion_tipo2", Float.class);
            Integer cantidadExamenesTipo1 = conexion.getOutParameter("_cantidad_examenes_tipo1", Integer.class);
            Integer cantidadExamenesTipo2 = conexion.getOutParameter("_cantidad_examenes_tipo2", Integer.class);
            


            Float promedioExamenTipo1 = (cantidadExamenesTipo1 != null && cantidadExamenesTipo1 > 0)
            ? calificacionTipo1 / cantidadExamenesTipo1
            : 0f;
    
            Float promedioExamenTipo2 = (cantidadExamenesTipo2 != null && cantidadExamenesTipo2 > 0)
            ? calificacionTipo2 / cantidadExamenesTipo2
            : 0f;
    
            
            resultados.put("promedioTipo1", promedioExamenTipo1);
            resultados.put("promedioTipo2", promedioExamenTipo2);
            resultados.put("cantidadExamenesTipo1", cantidadExamenesTipo1);
            resultados.put("cantidadExamenesTipo2", cantidadExamenesTipo2);
            
            
            return resultados;
            
        }catch (Exception e){
            System.err.println("Error al obtener datos del dashboard: " + e.getMessage());
            return null;
        }finally {
            conexion.closeConnection();
        }

    }

    private String determinarNivel(double calificacion) {
        if (calificacion >= 90) {
            return "Avanzado";
        } else if (calificacion >= 60) {
            return "Intermedio";
        } else {
            return "Básico";
        }
    }

    public Map<String, Object>  presentarExamen(int _id_usuario){
        Map<String, Object> resultado = new HashMap<>();
        Conexion conexion = new Conexion();
        try {
            conexion.prepareCall("spExamenInglescantidadExamenesPorUsuario", 3);
            conexion.addInParameter("_id_usuario", _id_usuario);
            conexion.addOutParameter("_prueba", java.sql.Types.INTEGER);
            conexion.addOutParameter("_final", java.sql.Types.INTEGER);
            conexion.execute();

            int cantidadPrueba = conexion.getOutParameter("_prueba", Integer.class);
            int cantidadFinal = conexion.getOutParameter("_final", Integer.class);

            resultado.put("puedePresentarPrueba", cantidadPrueba );
            resultado.put("puedePresentarFinal", cantidadFinal );

            return resultado;
        } catch (Exception e) {
            System.err.println("Error al presentar el examen: " + e.getMessage());
            return null;
        } finally {
            conexion.closeConnection();
        }
    }

    public int ObtenerRespuestaCorrecta (int idPregunta){
        int respuesta = 0;
        Conexion conexion = new Conexion();
        try {
            conexion.prepareCall("spExamenInglesGetRespuestaCorrecta", 1);
            conexion.addInParameter("_idPregunta", idPregunta);
            ResultSet rsRespuesta = conexion.executeResultSet();

            if (rsRespuesta != null && rsRespuesta.next()) {
                respuesta = rsRespuesta.getInt("id_respuesta_pregunta");
            }
        } catch (Exception e) {
            System.err.println("Error al obtener la respuesta: " + e.getMessage());
        } finally {
            conexion.closeConnection();
        }
        return respuesta;
    }

    public String getNivelIngles(int idUsuario) {
        String nivel = null;
        Conexion conexion = new Conexion();
        try {
            conexion.prepareCall("spNivelInglesUsuario", 2);
            conexion.addInParameter("id_usuario", idUsuario);
            conexion.addOutParameter("_nivel_ingles", java.sql.Types.VARCHAR);
            conexion.execute();

            nivel = conexion.getOutParameter("_nivel_ingles", String.class);

            
        } catch (Exception e) {
            System.err.println("Error al obtener el nivel de inglés: " + e.getMessage());
        } finally {
            conexion.closeConnection();
        }
        return nivel;
    }
}