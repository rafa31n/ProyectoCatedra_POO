package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Cargo {
    public String selectCargo(String id_departamento) {
        Connection conn;
        PreparedStatement pr;
        ResultSet rs;
        String departamento = null;
        try {
            conn = ConexionJava.getConnection();
            pr = conn.prepareStatement("select nombre_cargo from cargo where id_cargo=?");
            pr.setString(1, id_departamento);
            rs = pr.executeQuery();
            if (rs.next()) {
                departamento = rs.getString("nombre_cargo");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departamento;
    }
}
