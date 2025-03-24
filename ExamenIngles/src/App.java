// import java.sql.ResultSet;
// import java.sql.SQLException;
// import java.sql.Types;

import javax.swing.SwingUtilities;

import vista.Login_Form;

public class App {
    public static void main(String[] args) {
        
        SwingUtilities.invokeLater(() -> {
            new Login_Form().setVisible(true);
        });

    }
}
