package modelos;

import java.sql.*;

public class OperacionesLogin {
    static String SQL_EXIST_USER = "SELECT id_usuario FROM usuario WHERE username_usuario=? AND contrasena_usuario=?";
    static String SQL_SELECT = "SELECT * FROM usuario WHERE username_usuario=? AND contrasena_usuario=?";


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

    public boolean verificarSession(String username, String password) {
        Connection cn;
        PreparedStatement ps;
        ResultSet rs;
        boolean result;
        try {
            cn = getConnection();
            ps = cn.prepareStatement(SQL_EXIST_USER);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (!rs.next()) {
                result = false;
            } else {
                result = true;
            }
            return result;
        } catch (Exception e) {
            result = false;
            e.printStackTrace();
        }
        return result;
    }

    public static void setSession(String username, String password) {
        Connection cn;
        PreparedStatement ps;
        ResultSet rs;
        Session session = new Session();

        try {
            Integer id_usuario = 0, id_departamento = 0, id_cargo = 0;
            String nombre_usuario = "", contrasena_usuario = "", apellido_usuario = "", username_usuario = "";

            cn = getConnection();
            ps = cn.prepareStatement(SQL_SELECT);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                id_usuario = rs.getInt("id_usuario");
                nombre_usuario = rs.getString("nombre_usuario");
                apellido_usuario = rs.getString("apellido_usuario");
                contrasena_usuario = rs.getString("contrasena_usuario");
                id_departamento = rs.getInt("id_departamento");
                id_cargo = rs.getInt("id_cargo");
                username_usuario = rs.getString("username_usuario");
                //setters
            }

            session.setId_usuario(id_usuario);
            session.setNombre_usuario(nombre_usuario + " " + apellido_usuario);
            session.setContrasena_usuario(contrasena_usuario);
            session.setId_departamento(id_departamento);
            session.setId_cargo(id_cargo);
            session.setUsername(username_usuario);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
