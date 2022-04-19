package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Casos {
    static String SQL_COUNT_CASOS_ESPERANDO="select count(*)  from caso where id_estado=4 and id_departamento=?";
    static String SQL_COUNT_CASOS_PROCESO="select count(*)  from caso where id_estado=1 and id_departamento=?";
    static String SQL_COUNT_CASOS_DENEGADOS="select count(*)  from caso where id_estado=5 and id_departamento=?";
    static String SQL_COUNT_CASOS_FINALIZADOS="select count(*)  from caso where id_estado=3 and id_departamento=?";
    public static Integer ContadorEnSolicitudes(int id_departamento) {
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        Integer contador=0;

        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement(SQL_COUNT_CASOS_ESPERANDO);
            pr.setInt(1,id_departamento);
            rs= pr.executeQuery();
            rs.next();
            contador= rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();

        }finally {
            ConexionJava.close(rs);
            ConexionJava.close(pr);
            ConexionJava.close(conn);
        }

        return contador;
    }
    public static Integer ContadorEnDenegados(int id_departamento) {
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        Integer contador=0;
        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement(SQL_COUNT_CASOS_DENEGADOS);
            pr.setInt(1,id_departamento);
            rs= pr.executeQuery();
            rs.next();
            contador= rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();

        }finally {
            ConexionJava.close(rs);
            ConexionJava.close(pr);
            ConexionJava.close(conn);
        }

        return contador;
    }
    public static Integer ContadorEnFinalizados(int id_departamento) {
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        Integer contador=0;
        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement(SQL_COUNT_CASOS_FINALIZADOS);
            pr.setInt(1,id_departamento);
            rs= pr.executeQuery();
            rs.next();
            contador= rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();

        }finally {
            ConexionJava.close(rs);
            ConexionJava.close(pr);
            ConexionJava.close(conn);
        }

        return contador;
    }

    public static Integer ContadorEnProceso(int id_departamento) {
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        Integer contador=0;
        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement(SQL_COUNT_CASOS_PROCESO);
            pr.setInt(1,id_departamento);
            rs= pr.executeQuery();
            rs.next();
            contador= rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();

        }finally {
            ConexionJava.close(rs);
            ConexionJava.close(pr);
            ConexionJava.close(conn);
        }

        return contador;
    }
}
