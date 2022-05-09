<%@ page import="modelos.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="Menu/menu.jsp"></jsp:include>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <title>Usuarios</title>
</head>
<body>
<%
    Session ses = new Session();
    int id = ses.getId_usuario();
    String nombre = ses.getNombre_usuario();
    String username = ses.getUsername();
    int cargo = ses.getId_cargo();
    int departamento = ses.getId_departamento();
%>
<sql:query var="rs" dataSource="${db}">
    SELECT u.id_usuario, d.nombre_departamento, c.nombre_cargo from usuario u inner join departamento d on d.id_departamento = u.id_departamento inner join cargo c on c.id_cargo = u.id_cargo WHERE u.id_usuario = <% out.println(id); %>
</sql:query>
<div class="content-container">
    <h1 class="text-center">¡Bienvenido(a)!</h1>
    <h1 class="text-center" style="color:#69a6d1;"><% out.println(nombre); %></h1>

    <c:forEach items="${rs.rows}" var="row">
        <h3 class="text-center">Departamento: <c:out value="${row.nombre_departamento}"></c:out></h3>
        <h3 class="text-center">Cargo: <c:out value="${row.nombre_cargo}"></c:out></h3>

    </c:forEach>
    <h3></h3>
</div>
</body>
</html>
