package assets.Enum;

public enum ImagenRuta {
    LOGO_UADEC("/src/assets/images/uadeclogo.png"),
    RESIZED("/src/assets/images/uadeclogo2.png");

    private static final String RUTA_PROYECTO = "D:/OneDrive/OneDrive - Universidad Autonoma de Coahuila/Workspace 818/Escuela/Simulacion/Proyecto/ProyectoExamenIngles/ExamenIngles";
    
    private final String subRuta;

    ImagenRuta(String subRuta) {
        this.subRuta = subRuta;
    }

    public String getRuta() {
        return RUTA_PROYECTO + subRuta;
    }
}


