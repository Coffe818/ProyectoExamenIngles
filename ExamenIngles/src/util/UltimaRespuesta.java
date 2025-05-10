package util;

public class UltimaRespuesta {
    private int id_pregunta;
    private String texto;
    private boolean correcta;
    private boolean seleccionada_usuario;

    public UltimaRespuesta(int id_pregunta, String texto, boolean correcta, boolean seleccionada_usuario) {
        this.id_pregunta = id_pregunta;
        this.texto = texto;
        this.correcta = correcta;
        this.seleccionada_usuario = seleccionada_usuario;
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

    public boolean isCorrecta() {
        return correcta;
    }

    public void setCorrecta(boolean correcta) {
        this.correcta = correcta;
    }

    public boolean isSeleccionada_usuario() {
        return seleccionada_usuario;
    }

    public void setSeleccionada_usuario(boolean seleccionada_usuario) {
        this.seleccionada_usuario = seleccionada_usuario;
    }

    @Override
    public String toString() {
        return "UltimaRespuesta{" +
                "id_pregunta=" + id_pregunta +
                ", texto='" + texto + '\'' +
                ", correcta=" + correcta +
                ", seleccionada_usuario=" + seleccionada_usuario +
                '}';
    }

}
