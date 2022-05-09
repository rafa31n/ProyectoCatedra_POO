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
    <title>Agregar un usuario</title>
</head>
<body>
<div class="content-container">
    <sql:query var="q1" dataSource="${db}">
        SELECT * FROM departamento
    </sql:query>
    <sql:query var="q2" dataSource="${db}">
        SELECT * FROM cargo
    </sql:query>
    <div class="contenido">
        <h1 class="text-center titulo">Agregar un usuario</h1><br>
        <form action="../Controllers/controllerUsuario.jsp" method="post">
            <input type="hidden" value="insertar" name="operacion" id="operacion">
            <div class="form-group">
                <label for="nombre" class="form-label">Nombre:</label><br>
                <input type="text" name="nombre" id="nombre" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="apellido" class="form-label">Apellido:</label><br>
                <input type="text" name="apellido" id="apellido" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="username" class="form-label">Username:</label><br>
                <input type="text" name="username" id="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password" class="form-label">Contraseña:</label><br>
                <input type="password" name="password" id="password" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="departamento" class="form-label">Departamento:</label><br>
                <select name="departamento" id="departamento" class="form-select">
                    <c:forEach items="${q1.rows}" var="dep">
                        <option value="<c:out value="${dep.id_departamento}"></c:out>"><c:out
                                value="${dep.nombre_departamento}"></c:out></option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="cargo" class="form-label">Cargo:</label><br>
                <select name="cargo" id="cargo" class="form-select">
                    <c:forEach items="${q2.rows}" var="cargo">
                        <option value="<c:out value="${cargo.id_cargo}"></c:out>"><c:out
                                value="${cargo.nombre_cargo}"></c:out></option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success">Agregar</button>
            </div>
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
