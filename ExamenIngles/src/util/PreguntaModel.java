package util;

public class PreguntaModel {
    private int id;
    private String texto;
    private String nivel;
    private int idRespuestaCorrecta;

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
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTexto() {
        return texto;
    }
    public void setTexto(String texto) {
        this.texto = texto;
    }
    public String getNivel() {
        return nivel;
    }
    public void setNivel(String nivel) {
        this.nivel = nivel;
    }
    public int getIdRespuestaCorrecta() {
        return idRespuestaCorrecta;
    }
    public void setIdRespuestaCorrecta(int idRespuestaCorrecta) {
        this.idRespuestaCorrecta = idRespuestaCorrecta;
    }
}
