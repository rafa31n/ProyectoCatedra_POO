package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Departamentos {
    public String selectDepartamento(String id_departamento) {
        Connection conn;
        PreparedStatement pr;
        ResultSet rs;
        String departamento = null;
        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement("select nombre_departamento from departamento where id_departamento=?");
            pr.setString(1, id_departamento);
            rs = pr.executeQuery();
            if (rs.next()) {
                departamento = rs.getString("nombre_departamento");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departamento;
    }
    public static String getNombreDepartamento(Integer id_departamento){
        String nombre = "";
        Connection conn;
        PreparedStatement pr;
        ResultSet rs;
        try {
            String query="select nombre_departamento from departamento where id_departamento=?";
            conn=ConexionJava.getConnection();
            pr=conn.prepareStatement(query);
            pr.setInt(1,id_departamento);
            rs= pr.executeQuery();
            if (rs.next()){
                nombre=rs.getString("nombre_departamento");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nombre;
    }
    public static void actualizarDepartamento(Integer id_departamento,String nombre){
        Connection conn;
        PreparedStatement pr;

        try {
            String query="update departamento set nombre_departamento=? where id_departamento=?";
            conn=ConexionJava.getConnection();
            pr=conn.prepareStatement(query);
            pr.setString(1,nombre);
            pr.setInt(2,id_departamento);
            pr.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void insertDepartamento(String nombre_departamento){
        Connection conn;
        PreparedStatement pr;
        try {
            String query="insert into departamento(nombre_departamento) values(?);";
            conn=ConexionJava.getConnection();
            pr=conn.prepareStatement(query);
            pr.setString(1,nombre_departamento);
            pr.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public static Integer getContadorDepartamentos(int id_departamento){
        Integer contador=0;
        Connection conn;
        PreparedStatement pr;
        ResultSet rs;
        try {
            String query="select count(id_departamento) as contador from usuario where id_departamento=?;";
            conn=ConexionJava.getConnection();
            pr=conn.prepareStatement(query);
            pr.setInt(1,id_departamento);
            rs= pr.executeQuery();
            if (rs.next()){
                contador=rs.getInt("contador");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contador;

    }


    public static void deleteDepartamento(Integer id_departamento){
        Connection conn;
        PreparedStatement pr;

        try {
            String query="delete from departamento where id_departamento=?";
            conn=ConexionJava.getConnection();
            pr=conn.prepareStatement(query);
            pr.setInt(1,id_departamento);
            pr.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

