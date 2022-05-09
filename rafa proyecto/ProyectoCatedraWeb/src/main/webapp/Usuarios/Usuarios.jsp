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
    <title>Usuarios</title>
</head>
<body>
<div class="content-container">

    <sql:query var="rs" dataSource="${db}">
        SELECT u.id_usuario, u.nombre_usuario, u.apellido_usuario, u.username_usuario, d.nombre_departamento, c.nombre_cargo from usuario u inner join departamento d on d.id_departamento = u.id_departamento inner join cargo c on c.id_cargo = u.id_cargo ORDER BY u.id_usuario
    </sql:query>
    <h1 class="text-center titulo">Usuarios</h1><br>
    <div class="contenido">
        <a href="agregar.jsp">
            <button class="btn btn-success">Agregar nuevo usuario</button>
        </a><br><br>
        <%
            String mensaje = request.getParameter("mensaje");
            if (mensaje != null) {
                out.println("<div class='alert alert-info' role='alert'>");
                out.println(mensaje);
                out.println("</div>");
            }
        %>
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th>Id Usuario</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Username</th>
                <th>Departamento</th>
                <th>Cargo</th>
                <th colspan="2">Acciones</th>
            </tr>
            </thead>
            <c:forEach items="${rs.rows}" var="row">
                <tr>
                    <td><c:out value="${row.id_usuario}"></c:out></td>
                    <td><c:out value="${row.nombre_usuario}"></c:out></td>
                    <td><c:out value="${row.apellido_usuario}"></c:out></td>
                    <td><c:out value="${row.username_usuario}"></c:out></td>
                    <td><c:out value="${row.nombre_departamento}"></c:out></td>
                    <td><c:out value="${row.nombre_cargo}"></c:out></td>
                    <td>
                        <button class="btn btn-danger" onclick="alerta('${row.id_usuario}')">Eliminar</button>
                    </td>
                    <td>
                        <a href="Modificar.jsp?id=${row.id_usuario}">
                            <button class="btn btn-primary">Modificar</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>
<script>
    function alerta(id) {
        var mensaje;
        var opcion = confirm("Esta seguro de eliminar este registro");
        if (opcion == true) {
            location.href = "../Controllers/controllerUsuario.jsp?operacion=eliminar&id=" + id;
        }
    }
</script>
<style>
    .contenido {
        width: 70%;
        margin: 0 auto;
    }

    th {
        text-align: center;
    }
</style>
</body>
</html>
