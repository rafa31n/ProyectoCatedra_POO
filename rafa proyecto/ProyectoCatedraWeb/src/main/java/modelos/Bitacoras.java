package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Bitacoras {
    String SQL_INSERT_BITACORA="insert into bitacora(id_usuario,id_caso,titulo_bitacora,descripcion_bitacora,fecha_bitacora,progreso_bitacora) values(?,?,?,?,?,?) ";
    public void insertarBitacora(int id_usuario,String id_caso,String titulo_bitacora,String descripcion_bitacora,String fecha_bitacora,String progreso_bitacora) {
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement(SQL_INSERT_BITACORA);
            pr.setInt(1, id_usuario);
            pr.setString(2, id_caso);
            pr.setString(3, titulo_bitacora);
            pr.setString(4, descripcion_bitacora);
            pr.setString(5, fecha_bitacora);
            pr.setString(6, progreso_bitacora);
            pr.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConexionJava.close(rs);
            ConexionJava.close(pr);
            ConexionJava.close(conn);
        }
    }
    public  Integer ultimaBitacora(String id_caso) {
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        Integer contador=0;
        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement("select max(id_bitacora) as ultimo from bitacora where id_caso=?");
            pr.setString(1,id_caso);
            rs= pr.executeQuery();
            if ( rs.next()) {
                contador= rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();

        }finally {
            ConexionJava.close(rs);
            ConexionJava.close(pr);
            ConexionJava.close(conn);
        }
        return contador;
    }
    public void resetearUltimaBitacora(String id_caso) {
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement("update bitacora set progreso_bitacora=0 where id_bitacora=? and id_caso=?");

            pr.setInt(1, ultimaBitacora(id_caso));
            pr.setString(2, id_caso);
            pr.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConexionJava.close(rs);
            ConexionJava.close(pr);
            ConexionJava.close(conn);
        }
    }
}
