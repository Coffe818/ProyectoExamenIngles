package util;

public class IDManager {
    private static IDManager instance;
    private int id_usuario;
    private int id_examen;
    

    private IDManager() {}

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
}

// // Uso:
// IDManager idManager = IDManager.getInstance();
// idManager.setId(123);

// // Luego, desde otro lugar:
// int id = IDManager.getInstance().getId(); // 123
