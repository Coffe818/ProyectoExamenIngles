package util;

public class RespuestaModel {
    
    public String texto;
    public int id;

    public RespuestaModel(String texto, int id) {
        this.texto = texto;
        this.id = id;
    }

    @Override
    public String toString() {
        return "- " + texto;
    }
}
