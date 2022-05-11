package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Denegado {
    public void insertDenegado(String id_caso,String argumento){
        Connection conn= null;
        PreparedStatement pr= null;
        ResultSet rs = null;
        try {

            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement("insert into argumento(id_caso, argumentos_descripcion) VALUES (?,?)");
            pr.setString(1, id_caso);
            pr.setString(2, argumento);
            pr.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            ConexionJava.close(pr);
            ConexionJava.close(conn);
        }
    }
}
