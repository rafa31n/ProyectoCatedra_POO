package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {
    static String SQL_EXIST_USER = "SELECT id_usuario FROM usuario WHERE username_usuario=? AND contrasena_usuario=?";
    static String SQL_SELECT = "SELECT * FROM usuario WHERE username_usuario=? AND contrasena_usuario=?";
    public static Boolean verificarUsuario(String nombre, String contraseña) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Boolean existe = null;
        try {
            conn = ConexionJava.getConnection();
            ps = conn.prepareStatement(SQL_EXIST_USER);
            ps.setString(1, nombre);
            ps.setString(2, contraseña);
            rs = ps.executeQuery();
            if (rs.next() == false) {
                existe = false;
            } else {
                existe = true;
            }
            return existe;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            ConexionJava.close(rs);
            ConexionJava.close(ps);
            ConexionJava.close(conn);
        }
        return existe;
    }
    public static void setSession(String nombre, String contraseña) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Session session = new Session();

        try {
            Integer id_usuario = 0, id_departamento = 0, id_cargo = 0;
            String nombre_usuario = "", contrasena_usuario = "",apellido_usuario="";

            conn = ConexionJava.getConnection();
            ps = conn.prepareStatement(SQL_SELECT);
            ps.setString(1, nombre);
            ps.setString(2, contraseña);
            rs = ps.executeQuery();

            if (rs.next()) {
                id_usuario = rs.getInt("id_usuario");
                nombre_usuario = rs.getString("nombre_usuario");
                apellido_usuario=rs.getString("apellido_usuario");
                contrasena_usuario = rs.getString("contrasena_usuario");
                id_departamento = rs.getInt("id_departamento");
                id_cargo = rs.getInt("id_cargo");
                //setters
            }

            session.setId_usuario(id_usuario);
            session.setNombre_usuario(nombre_usuario+" "+apellido_usuario);
            session.setContrasena_usuario(contrasena_usuario);
            session.setId_departamento(id_departamento);
            session.setId_cargo(id_cargo);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            ConexionJava.close(rs);
            ConexionJava.close(ps);
            ConexionJava.close(conn);
        }
    }
}
