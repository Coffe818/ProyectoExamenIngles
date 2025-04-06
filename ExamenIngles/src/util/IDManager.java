package util;

public class IDManager {
    private static IDManager instance;
    private int id;

    private IDManager() {}

    public static IDManager getInstance() {
        if (instance == null) {
            instance = new IDManager();
        }
        return instance;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
}

// // Uso:
// IDManager idManager = IDManager.getInstance();
// idManager.setId(123);

// // Luego, desde otro lugar:
// int id = IDManager.getInstance().getId(); // 123
