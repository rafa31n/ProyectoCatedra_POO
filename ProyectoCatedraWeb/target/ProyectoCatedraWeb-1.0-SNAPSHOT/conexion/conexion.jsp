<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 24/3/2022
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   Connection conexion =null;
    //private Statement s =null;

    String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
     String JDBC_URL = "jdbc:mysql://botujl4t5mtacru2euoc-mysql.services.clever-cloud.com/botujl4t5mtacru2euoc";
     String JDBC_USER = "udseiu6bqnvpk1ym";
     String JDBC_PASS = "ywLmU6giAuWjIQZN8hB4";
     Driver driver = null;

// Se obtiene una conexión con la base de datos.
    try {
        Class.forName(JDBC_DRIVER);
        conexion =DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

        System.out.println("Driver JDBC CORRECTO"+ conexion.isValid(1));
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Fallo en cargar el driver JDBC");
    }
    String valor;




%>
