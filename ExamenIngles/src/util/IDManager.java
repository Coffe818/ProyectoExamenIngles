package util;

import Controller.Examen_Controller;

public class IDManager {
    private static IDManager instance;
    private int id_usuario;
    private int id_examen;
    private String nombre_usuario;

    private IDManager() {
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public static IDManager getInstance() {
        if (instance == null) {
            instance = new IDManager();
        }
        return instance;
    }

    public void setIdUsuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getIdUsuario() {
        return id_usuario;
    }

    public int getId_examen() {
        return id_examen;
    }

    public void setId_examen(int id_examen) {
        this.id_examen = id_examen;
    }

    public String getNivel_usuario() {

        Examen_Controller controller = new Examen_Controller();
        return controller.getNivelIngles(getIdUsuario());

    }


}

// // Uso:
// IDManager idManager = IDManager.getInstance();
// idManager.setId(123);

// // Luego, desde otro lugar:
// int id = IDManager.getInstance().getId(); // 123
