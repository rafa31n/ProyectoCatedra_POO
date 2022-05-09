package modelos;

import java.sql.*;

public class OperacionesUsuario {

    static String SQL_INSERT_USER = "INSERT INTO usuario(nombre_usuario, apellido_usuario, username_usuario, contrasena_usuario, id_departamento, id_cargo) VALUES (?,?,?,?,?,?)";

    public static Connection getConnection() {
        Connection cn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // Se obtiene una conexión con la base de datos. Cambie los parámetros por sus datos
            cn = DriverManager.getConnection(
                    "jdbc:mysql://localhost/telecomunicacion2", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cn;
    }

    public static void insertarUsuario(String nombre, String apellido, String username, String password, int departamento, int cargo) {
        Connection cn;
        PreparedStatement ps;
        ResultSet rs;
        boolean result;
        try {
            cn = getConnection();
            ps = cn.prepareStatement(SQL_INSERT_USER);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setInt(5, departamento);
            ps.setInt(6, cargo);
            ps.executeQuery();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    public boolean insertarUsuarioa(String nombre, String apellido, String username, String password, int departamento, int cargo) {
        Connection cn;
        Statement st;
        ResultSet rs;
        boolean result = false;
        try {
            cn = getConnection();
            st = cn.createStatement();
            String tsql;
            tsql = "INSERT INTO usuario VALUES(null,'";
            tsql += nombre + "','" + apellido + "','" +
                    username + "', '" + password + "', '" + departamento + "', '" + cargo + "')";
            st.execute(tsql);
            cn.close();
            result = true;
        } catch (Exception e) {
            result = false;
            e.printStackTrace();
        }
        return result;
    }
}
