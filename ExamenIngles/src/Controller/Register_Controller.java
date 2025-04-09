package Controller;

import ConnectionPkg.Conexion;
import util.IDManager;

import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Register_Controller {

    /**
     * Authenticates a user using the provided email and password.
     *
     * @param email    the user's email
     * @param password the user's password
     * @return the user's name if authentication is successful; null otherwise.
     */

    public String authenticateUser(String email, String password) {
        Conexion con = new Conexion();
        try {
            String storedProcedureName = "spExamenInglesValidarUsuario";
            con.prepareCall(storedProcedureName, 4);
            con.addInParameter("_email", email);
            con.addInParameter("_contrasena", password);
            con.addOutParameter("_nombre", java.sql.Types.VARCHAR);
            con.addOutParameter("_id_usuario", java.sql.Types.INTEGER);
            
            con.execute();
            String nombre = con.getOutParameter("_nombre", String.class);
            Integer id = con.getOutParameter("_id_usuario", Integer.class);

            if(email.equals("") || password.equals("")) {
                JOptionPane.showMessageDialog(null, "Please fill all fields");
                return null;
            }

            if(nombre != null) {
                JOptionPane.showMessageDialog(null, nombre + " logueado correctamente");
                IDManager.getInstance().setIdUsuario(id);
                IDManager.getInstance().setNombre_usuario(nombre);
                return nombre;
            } else {
                JOptionPane.showMessageDialog(null, "Invalid credentials");
                return null;
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al autenticar usuario: " + e.getMessage());
            return null;
        } finally {
            con.closeConnection();
        }

    }

    public void insertUser(String email, String password, String name) {
        Conexion con = new Conexion();
        try {
            String storedProcedureName = "spExamenInglesInsertUsuario";
            con.prepareCall(storedProcedureName, 4);
            con.addInParameter("_email", email);
            con.addInParameter("_contrasena", password);
            con.addInParameter("_nombre", name);
            con.addOutParameter("id_usuario", java.sql.Types.INTEGER);
            
            con.execute();
            Integer id_usuario = con.getOutParameter("id_usuario", Integer.class); 
            JOptionPane.showMessageDialog(null, "Usuario" + id_usuario + " insertado correctamente");
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al insertar usuario: " + e.getMessage());
        } finally {
            con.closeConnection();
        }
    }

}
