package modelos;
import modelos.ConexionJava;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class RevisionCasos {

    static String SQL_INSERT_FINALIZADO = "INSERT INTO casos_finalizados(id_caso,fecha_produccion) VALUES(?,?)";
    static String SQL_INSERT_OBS = "INSERT INTO observacion(id_caso,descripcion_observacion) VALUES(?,?)";
    static String SQL_UPDATE_RECHAZADO = "UPDATE caso set id_estado=7 where id_caso=?";
    static String SQL_UPDATE_APROBADO= "UPDATE caso set id_estado=3 where id_caso=?";
    static String SQL_SELECT = "SELECT c.id_caso,c.titulo,c.id_estado,e.nombre_estado FROM caso c INNER JOIN estado e ON c.id_estado = e.id_estado WHERE c.id_estado = 6";
    static String id_caso;

    public static void ingresarFinalizado(String id_caso, String fecha_produccion){
        Connection conn;
        PreparedStatement pr;
        ResultSet rs;
        try {
            conn= ConexionJava.getConnection();
            pr=conn.prepareStatement(SQL_INSERT_FINALIZADO);
            pr.setString(1,id_caso);
            pr.setString(2,fecha_produccion);
            pr.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void updateFinalizado(String id_caso){
        Connection conn;
        PreparedStatement pr;
        ResultSet rs;
        try {
            conn= ConexionJava.getConnection();
            pr=conn.prepareStatement(SQL_UPDATE_APROBADO);
            pr.setString(1,id_caso);
            pr.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void ingresarOBS(String id_caso, String descripcion_observacion){
        Connection conn;
        PreparedStatement pr;
        ResultSet rs;
        try {
            conn= ConexionJava.getConnection();
            pr=conn.prepareStatement(SQL_INSERT_OBS);
            pr.setString(1,id_caso);
            pr.setString(2,descripcion_observacion);
            pr.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void updateRechazado(String id_caso){
        Connection conn;
        PreparedStatement pr;
        ResultSet rs;
        try {
            conn= ConexionJava.getConnection();
            pr=conn.prepareStatement(SQL_UPDATE_RECHAZADO);
            pr.setString(1,id_caso);
            pr.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void ingresarObs(String id_caso, String descripcion_observacion){
        Connection conn;
        PreparedStatement pr;
        ResultSet rs;
        try {
            conn= ConexionJava.getConnection();
            pr=conn.prepareStatement(SQL_INSERT_OBS);
            pr.setString(1,id_caso);
            pr.setString(2,descripcion_observacion);
            pr.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
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
