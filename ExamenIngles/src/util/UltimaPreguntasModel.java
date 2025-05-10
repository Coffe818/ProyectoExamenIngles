package util;

import java.util.List;

public class UltimaPreguntasModel {
    private int id_pregunta;
    private String texto;
    private List<UltimaRespuesta> respuestas;

    public UltimaPreguntasModel(int id_pregunta, String texto, List<UltimaRespuesta> respuestas) {
        this.id_pregunta = id_pregunta;
        this.texto = texto;
        this.respuestas = respuestas;
    }

    public int getId_pregunta() {
        return id_pregunta;
    }

    public void setId_pregunta(int id_pregunta) {
        this.id_pregunta = id_pregunta;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public List<UltimaRespuesta> getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(List<UltimaRespuesta> respuestas) {
        this.respuestas = respuestas;
    }

    @Override
    public String toString() {
        return "UltimaPreguntasModel{" +
                "id_pregunta=" + id_pregunta +
                ", texto='" + texto + '\'' +
                ", respuestas=" + respuestas +
                '}';
    }

}
