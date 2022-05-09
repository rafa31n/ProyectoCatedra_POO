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
    <title>Modificar Usuario</title>
</head>
<body>
<div class="content-container">
    <sql:query var="rs" dataSource="${db}">
        SELECT u.id_usuario, u.nombre_usuario, u.apellido_usuario, u.username_usuario, u.contrasena_usuario, d.id_departamento, d.nombre_departamento, c.id_cargo, c.nombre_cargo from usuario u inner join departamento d on d.id_departamento = u.id_departamento inner join cargo c on c.id_cargo = u.id_cargo WHERE id_usuario = ${param.id}
    </sql:query>
    <div class="contenido">
        <h1 class="text-center titulo">Modificar un usuario</h1><br>
        <form action="../Controllers/controllerUsuario.jsp?operacion=modificar" method="post">
            <c:forEach items="${rs.rows}" var="row">
                <sql:query var="rs2" dataSource="${db}">
                    SELECT * FROM departamento WHERE nombre_departamento != "${row.nombre_departamento}"
                </sql:query>
                <sql:query var="rs3" dataSource="${db}">
                    SELECT * FROM cargo WHERE nombre_cargo != "${row.nombre_cargo}"
                </sql:query>
                <input type="hidden" value="<c:out value="${row.id_usuario}"></c:out>" name="id_usuario" id="id_usuario">
                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre:</label><br>
                    <input type="text" name="nombre" id="nombre" class="form-control"
                           value="<c:out value="${row.nombre_usuario}"></c:out>" required>
                </div>
                <div class="form-group">
                    <label for="apellido" class="form-label">Apellido:</label><br>
                    <input type="text" name="apellido" id="apellido" class="form-control"
                           value="<c:out value="${row.apellido_usuario}"></c:out>" required>
                </div>
                <div class="form-group">
                    <label for="username" class="form-label">Username:</label><br>
                    <input type="text" name="username" id="username" class="form-control"
                           value="<c:out value="${row.username_usuario}"></c:out>" required>
                </div>
                <div class="form-group">
                    <label for="password" class="form-label">Contraseña:</label><br>
                    <input type="password" name="password" id="password" class="form-control"
                           value="<c:out value="${row.contrasena_usuario}"></c:out>" required>
                </div>

                <div class="form-group">
                    <label for="departamento" class="form-label">Departamento:</label><br>
                    <select name="departamento" id="departamento" class="form-select">
                        <option value="<c:out value="${row.id_departamento}"></c:out>"><c:out
                                value="${row.nombre_departamento}"></c:out></option>
                        <c:forEach items="${rs2.rows}" var="row2">
                            <option value="<c:out value="${row2.id_departamento}"></c:out>"><c:out
                                    value="${row2.nombre_departamento}"></c:out></option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="cargo" class="form-label">Cargo:</label><br>
                    <select name="cargo" id="cargo" class="form-select">
                        <option value="<c:out value="${row.id_cargo}"></c:out>"><c:out
                                value="${row.nombre_cargo}"></c:out></option>
                        <c:forEach items="${rs3.rows}" var="row3">
                            <option value="<c:out value="${row3.id_cargo}"></c:out>"><c:out
                                    value="${row3.nombre_cargo}"></c:out></option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Modificar</button>
                </div>
            </c:forEach>
        </form>
        <a href="Usuarios.jsp">
            <button class="btn btn-dark">Regresar</button>
        </a>
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
