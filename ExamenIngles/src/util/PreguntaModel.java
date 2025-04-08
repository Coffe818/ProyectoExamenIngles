package util;

public class PreguntaModel {
    public int id;
    public String texto;
    public String nivel;
    public int idRespuestaCorrecta;

    public PreguntaModel(int id, String texto, String nivel, int idRespuestaCorrecta) {
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
