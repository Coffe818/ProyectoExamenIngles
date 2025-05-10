package ConnectionPkg;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Conexion {

    private String host = "localhost";
    private String port = "3306";
    private String database = "simulacion";
    private String username = "root";
    private String password = "root";

    // LO DE ARRIBA ES PARA LA CONEXION A LA BASE DE DATOS, A ESA LA PUEDES CAMBIAR
    // A LA TUYA SI NO NO TE VA A FUNCIONAR

    private Connection cnx;
    private CallableStatement comando;
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://" + host + ":" + port + "/" + database
            + "?useSSL=false&useProcedureBodies=false";

    public Conexion() {
        try {
            Class.forName(driver);
            cnx = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error al hacer la conexion: " + e.getMessage());
        }
    }

    public void closeConnection() {
        try {
            if (comando != null)
                comando.close();
            if (cnx != null)
                cnx.close();
        } catch (SQLException e) {
            System.err.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }

    public void prepareCall(String sp, int numParams) throws SQLException {
        try {
            StringBuilder callString = new StringBuilder("CALL " + sp);
            if (numParams > 0) {
                callString.append("(");
                for (int i = 0; i < numParams; i++) {
                    callString.append("?");
                    if (i < numParams - 1) {
                        callString.append(",");
                    }
                }
                callString.append(")");
            }
            comando = cnx.prepareCall(callString.toString());
        } catch (SQLException e) {
            System.err.println("Error al preparar el procedimiento almacenado " + sp + ": " + e.getMessage());
            throw e;
        }
    }

    public void addInParameter(String parameterName, Object value) {
        try {
            comando.setObject(parameterName, value);
        } catch (Exception e) {
            System.out.println("Error al agregar el parametro " + parameterName + ": " + e.getMessage());
        }
    }

    public void addOutParameter(String parameterName, int sqlType) {
        try {
            comando.registerOutParameter(parameterName, sqlType);
        } catch (Exception e) {
            System.out.println("Error al agregar el parametro de salida " + parameterName + ": " + e.getMessage());
        }
    }

    public void execute() {
        try {
            comando.execute();
        } catch (SQLException e) {
            System.err.println("Error al ejecutar el procedimiento almacenado  : " + e.getMessage());
        }
    }

    public ResultSet executeResultSet() {
        try {
            return comando.executeQuery();
        } catch (SQLException e) {
            System.err
                    .println("Error al ejecutar el procedimiento almacenado y obtener el ResultSet: " + e.getMessage());

        }
        return null;

    }

    public List<List<Map<String, Object>>> executeMultipleResultSets() {
    List<List<Map<String, Object>>> resultSetList = new ArrayList<>();
    try {
        boolean hasResults = comando.execute();
        
        while (hasResults) {
            ResultSet rs = comando.getResultSet();
            List<Map<String, Object>> resultList = new ArrayList<>();

            if (rs != null) {
                ResultSetMetaData metaData = rs.getMetaData();
                int columnCount = metaData.getColumnCount();

                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    for (int i = 1; i <= columnCount; i++) {
                        row.put(metaData.getColumnName(i), rs.getObject(i));
                    }
                    resultList.add(row);
                }
            }
            resultSetList.add(resultList);
            hasResults = comando.getMoreResults();
        }
    } catch (SQLException e) {
        System.err.println("Error al ejecutar multiples ResultSets: " + e.getMessage());
    }
    return resultSetList;
}


    public <T> T getOutParameter(String parameterName, Class<T> type) {
        try {
            if (type == Integer.class) {
                return type.cast(comando.getInt(parameterName));
            } else if (type == String.class) {
                return type.cast(comando.getString(parameterName));
            } else if (type == Date.class) {
                return type.cast(comando.getDate(parameterName));
            } else if (type == Boolean.class) {
                return type.cast(comando.getBoolean(parameterName));
            } else if (type == Float.class) {
                return type.cast(comando.getFloat(parameterName));
            } else {
                System.err.println("Tipo de dato no soportado: " + type.getName());
                throw new IllegalArgumentException("Tipo de dato no soportado: " + type.getName());
            }
        } catch (SQLException e) {
            System.err.println("Error en el getOutParameter " + parameterName + ": " + e.getMessage());
            throw new IllegalArgumentException("Error en el getOutParameter " + parameterName + ": " + e.getMessage());

        }
    }

    public void resetAll() {
        String[] scripts = { "sql\\Tables\\tables.sql", "sql\\Data\\preguntas_respuestas.sql" };

        for (String script : scripts) {
            try (
                    BufferedReader br = new BufferedReader(new FileReader(script));
                    Statement stmt = cnx.createStatement()) {
                StringBuilder sb = new StringBuilder();
                String linea;

                while ((linea = br.readLine()) != null) {
                    sb.append(linea).append("\n");

                    if (linea.trim().endsWith(";")) {
                        String sql = sb.toString().trim();
                        stmt.execute(sql);
                        sb.setLength(0);
                    }
                }

                System.out.println("Script ejecutado correctamente: " + script);

            } catch (Exception e) {
                System.err.println("Error al ejecutar el script " + script + ": " + e.getMessage());
            }
        }

    }

}