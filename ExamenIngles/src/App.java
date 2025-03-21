import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class App {
    public static void main(String[] args) throws Exception {
        Conexion con = new Conexion();

        String nombre = "Nombre1 ";
        String email = "ejemplo@email.com";
        String contrasena = "contrasena123";
        
        String storedProcedureName = "spExamenInglesInsertUsuario";
        con.prepareCall(storedProcedureName,4); 

        con.addInParameter("_email", email);
        con.addInParameter("_contrasena", contrasena);
        con.addOutParameter("id_usuario", Types.INTEGER);
        con.addInParameter("_nombre", nombre);

        con.execute();
        Integer idUsuario = con.getOutParameter("id_usuario", Integer.class);
        System.out.println("ID de usuario insertado: " + idUsuario);



        storedProcedureName = "spExamenInglesGetUsuario";
        con.prepareCall(storedProcedureName,1);
        
        con.addInParameter("_id_usuario", idUsuario);

        ResultSet rs = con.executeResultSet();
        ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        while (rs.next()) {
            for (int i = 1; i <= columnsNumber; i++) {
                if (i > 1) System.out.print(",  ");
                String columnValue = rs.getString(i);
                System.out.print(rsmd.getColumnName(i) + ": " + columnValue);
            }
            System.out.println("");
        }


    }
}
