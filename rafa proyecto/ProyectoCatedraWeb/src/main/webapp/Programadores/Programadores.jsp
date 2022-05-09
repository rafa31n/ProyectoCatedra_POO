<%@ page import="modelos.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="../menus/menu.jsp"></jsp:include>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost/telecomunicacion2"
                   user="root" password=""></sql:setDataSource>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <title>Programadores</title>
</head>
<body>
<div class="content-container">
    <%
        Session ses = new Session();
        int id = ses.getId_usuario();
        String nombre = ses.getNombre_usuario();
        String username = ses.getUsername();
        int cargo = ses.getId_cargo();
        int departamento = ses.getId_departamento();
    %>

    <sql:query var="rs" dataSource="${db}">
        select u.id_usuario, u.nombre_usuario, u.apellido_usuario, d.nombre_departamento, c.nombre_cargo from usuario u inner join departamento d on d.id_departamento = u.id_departamento inner join cargo c on c.id_cargo = u.id_cargo where u.id_departamento= <% out.println(departamento); %> AND u.id_cargo=1
    </sql:query>

    <sql:query var="rs2" dataSource="${db}">
        select * from departamento where id_departamento = <% out.println(departamento); %>
    </sql:query>
    <h1 class="text-center">Programadores</h1>
    <c:forEach items="${rs2.rows}" var="row2">
        <h3 class="text-center">Departamento: <c:out value="${row2.nombre_departamento}"></c:out></h3>
    </c:forEach><br>
    <div class="contenido">
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th>Id Usuario</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Departamento</th>
                <th>Cargo</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <c:forEach items="${rs.rows}" var="row">
                <tr>
                    <td><c:out value="${row.id_usuario}"></c:out></td>
                    <td><c:out value="${row.nombre_usuario}"></c:out></td>
                    <td><c:out value="${row.apellido_usuario}"></c:out></td>
                    <td><c:out value="${row.nombre_departamento}"></c:out></td>
                    <td><c:out value="${row.nombre_cargo}"></c:out></td>
                    <td>
                        <a href="Trabajo.jsp?id=${row.id_usuario}&nombre=${row.nombre_usuario}">
                            <button class="btn btn-primary">Ver trabajo</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>
<style>
    .contenido {
        width: 70%;
        margin: 0 auto;
    }
</style>
</body>
</html>
