package modelos;

import beans.CasoBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class Casos {
    String SQL_COUNT_CASOS_ESPERANDO="select count(*)  from caso where id_estado=4 and id_departamento=?";
     String SQL_COUNT_CASOS_PROCESO="select count(*)  from caso where id_estado=1 and id_departamento=?";
     String SQL_COUNT_CASOS_DENEGADOS="select count(*)  from caso where id_estado=5 and id_departamento=?";
    String SQL_COUNT_CASOS_FINALIZADOS="select count(*)  from caso where id_estado=3 and id_departamento=?";
    String SQL_COUNT_CASOS_ASIGNADOS_PROGRAMADOR="select count(id_caso) as contador from programador_caso where id_usuario=?";
    String SQL_INNER_JOIN_STATE = "select nombre_estado from caso inner join estado e on caso.id_estado = e.id_estado where id_caso=?";

    private Integer casosEnproceso;
    public  Integer ContadorEnSolicitudes(int id_departamento) {
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        Integer contador=0;

        try {
            conn =ConexionJava.getConnection();
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
    public byte[] obtenerPdf(String id_caso){
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        byte[] bytes=null;
        try {
            conn = ConexionJava.getConnection();
            pr=conn.prepareStatement("select pdf_caso from caso where id_caso=?");
            pr.setString(1,id_caso);
            rs= pr.executeQuery();
            while (rs.next()){
                bytes=rs.getBytes("pdf_caso");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConexionJava.close(rs);
            ConexionJava.close(pr);
            ConexionJava.close(conn);
        }
        return bytes;
    }
    public void  crearSolicitud(CasoBeans beans){
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            LocalDate fechaActual=LocalDate.now();
            conn = ConexionJava.getConnection();
            pr=conn.prepareStatement("insert into caso(id_departamento, progreso, titulo, descripcion, pdf_caso, fecha_creacion) values (?,0,?,?,?,?)");
            pr.setString(1,beans.getId_department());
            pr.setString(2,beans.getTitulo());
            pr.setString(3,beans.getDescripcion());
            pr.setBlob(4,beans.getPdf_caso());
            pr.setString(5, String.valueOf(fechaActual));
            pr.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public  Integer contadorCasoProgramador(int id_programador) {
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        Integer contador=0;

        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement(SQL_COUNT_CASOS_ASIGNADOS_PROGRAMADOR);
            pr.setInt(1,id_programador);
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
    public  Integer contadorCasoProbrador(int id_probador) {
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        Integer contador=0;

        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement("select count(*) as conteo from probador_caso where id_usuario=?");
            pr.setInt(1,id_probador);
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
    public  Integer ContadorEnDenegados(int id_departamento) {
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
    public  Integer ContadorEnFinalizados(int id_departamento) {
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

    public  Integer ContadorEnProceso(int id_departamento) {
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
        setCasosEnproceso(contador);
        return contador;
    }
    public Integer progresoActual(String id_caso){
        Integer progreso=0;
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement("select progreso_bitacora as progreso  from bitacora where id_caso=? order by id_bitacora desc LIMIT 1;");
            pr.setString(1,id_caso);
            rs= pr.executeQuery();
            rs.next();
            progreso= rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();

        }finally {
            ConexionJava.close(rs);
            ConexionJava.close(pr);
            ConexionJava.close(conn);
        }
        return progreso;
    }
    public  String getEstadoName(String id_caso) {
        String stateName = "";
        Connection conn= null;
        PreparedStatement pr= null;
        ResultSet rs = null;
        try {

            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement(SQL_INNER_JOIN_STATE);
            pr.setString(1, id_caso);
            rs = pr.executeQuery();
            if (rs.next()) {
                stateName = rs.getString("nombre_estado");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            ConexionJava.close(rs);
            ConexionJava.close(pr);
            ConexionJava.close(conn);
        }
        return stateName;
    }

    public Integer getCasosEnproceso() {
        return casosEnproceso;
    }

    public void setCasosEnproceso(Integer casosEnproceso) {
        this.casosEnproceso = casosEnproceso;
    }
}
