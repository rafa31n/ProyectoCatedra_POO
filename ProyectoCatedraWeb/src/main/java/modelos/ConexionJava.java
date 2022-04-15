package modelos;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionJava {
    private static Driver driver = null;
   static   String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
   static String JDBC_URL = "jdbc:mysql://botujl4t5mtacru2euoc-mysql.services.clever-cloud.com/botujl4t5mtacru2euoc";
    static String JDBC_USER = "udseiu6bqnvpk1ym";
   static String JDBC_PASS = "ywLmU6giAuWjIQZN8hB4";

    public static synchronized Connection getConnection()
            throws SQLException {
        Connection con = null;
        if (driver == null) {
            try {
                Class.forName(JDBC_DRIVER);
            } catch (Exception e) {
                System.out.println("Fallo en cargar el driver JDBC");
                e.printStackTrace();
            }
        }
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
    }
}
