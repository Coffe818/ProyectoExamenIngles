package util;

public class RespuestaModel {
    
    private String texto;
    private int id;

    public RespuestaModel(String texto, int id) {
        this.texto = texto;
        this.id = id;
    }

    @Override
    public String toString() {
        return "- " + texto;
    }
    public String getTexto() {
        return texto;
    }
    public void setTexto(String texto) {
        this.texto = texto;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
}
